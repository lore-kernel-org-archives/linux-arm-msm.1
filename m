Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792581920;
	b=I7RD8whVSNCNA4YF51ydA1naJr2KTI0xi34XWvomZ6pLso1j0lxPT5rn1WoKTR2YOI3K
	 S1XP+4loL1cy/xJYfauInzMBPZmU2XxjWU+bJs9joxSVQ9k6Qtteg8fc2184ylnSz3IFl
	 DyTAPuhl940U+7fmkIYP8kioGuumsDCCHJpmD73+h/ALDy5mIxJTdvWbmH08Fmq0H9TwL
	 Re+FOh8c4XLF54JY9Bs+/fo7z/VoQ0u48ekwjJWKQzNLg2Ey7AfiqT+Fg9ZGgEy37Lmq+
	 c1kqT3A2SjuMmzp33XzTliel8rm/7Yere6h4DqAXN6sSgXDG3BondQkCy6tL6uXVT7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792581920;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XsKx229A2cLUh6PDcfG9nagyZ9GT3vCswf9ByNtPLGE=;
	b=ab2lUFwrY3u9PQmynfZye6Ao6ELbBkoS8bYuKQuuCnzAEcFnPRWp9JimcQ7LwYvhyTUm
	 n/ietLrJF081OdL35CbBpuRdGksNTESNvnH+LHLv2PJs/IERefjo4isOAOvMZ7S+OfR2o
	 ExPU8bR4aBaGe7O03v6JnYU+SYhXFxM89MfmTJgdn8/xT1vImytBnaiqcSjoEjb7pgf7T
	 4qn4oJeJ0QXWwF4NPMN0q7hX0s9fZ9inrYh6aT31Uo6J09jzDuPl52aOBN3he20vROymB
	 9ZOglHKpQQnpGQ1NGR2v9i2o4gJaOzWcWa0CogaIcEUB7ClfOPAWfDXvQ5yvQLYAepw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fyeI7m3X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3q7fQLf;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8956560A2608
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:25:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8956560A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fyeI7m3X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e3q7fQLf
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LAJT7q1422112
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:25:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XsKx229A2cLUh6PDcfG9nagy
	Z9GT3vCswf9ByNtPLGE=; b=fyeI7m3XgCeXBBvm9Lc3tglUxyJyVwiC7LoydVcw
	BS/sYlty0A5J/hpXS9Zhq+t3ANy9qZsX1/oo/59O1+hl600qqeZqEjHvk9G3T473
	oIfN9pqorFLiqhUJlPdNaoyDxWkl4qFsVi+6QfG0rdV9nExf3fzwy9M2I2wn47lZ
	eghG5SlbcTirlgglFlRPk2JKratyZdI5rGSFyKva8cpJ8SLwpZXEPzAy5epq4v08
	YMrOJRK0Cgak84GxM1NLWCeO9EkRrjLSIqby7ssUzqzAppklyXKSokwLiW6ORLF+
	7MD+Ktq78D6VmY9UxgYiPd2+E+8iZsPzDFWQ0euMDbw57w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhug6wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 11:25:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so209703985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792581919; x=1793186719; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XsKx229A2cLUh6PDcfG9nagyZ9GT3vCswf9ByNtPLGE=;
        b=e3q7fQLfbGrZKLlUo0fu0DZ/Wkr9w/pJPTndeSC9r/d7gPtLWfVuqvYB+YnxxIekyi
         jqJ2xGu/92YNcPuJYGq5FBNBGCYBifHSYWElPEy6pDaMNda1H4v8Im7MgDUfys/FbR9y
         qzhdAhn8CPqsfFLNDk24VV1DlIGJpHCbALJFIjV3ITJgjhCYMxD+Iw14y4SKM7IYXiKL
         RIDzLXoeaOTd6yv5kZ5zNbsgCpME/YFLT9LP+zlT96kDLjBPg4hgU9n5PiafLG9dnWoR
         /C6D0Ta9FL8qgo161Kl8zWMHATUteFm6CT0XCMHsyy4HRcTXjpZRPiKM5zwx4BCz9q1j
         PxiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792581919; x=1793186719;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XsKx229A2cLUh6PDcfG9nagyZ9GT3vCswf9ByNtPLGE=;
        b=Z//C6zS5hJDn7kqnXHJe3vmvWnqf9hbri/kdVCSVu1+MKTuifBZlzXZlrOk+da4XwQ
         7aQDOV59B/nEJlUjBfsNez1le6Rc7ppaeGQjHjf7q/ZC/FGe/KBDmbEHeSzqwjEQKu/K
         bq06LuGOqH5vOo5cmXmFcT4Zm8nCFpYISJTGFy/8QG4JUhdIiThdK2jPTECLdViuJCWK
         8KN+9ERWrCVGzp1TnnvNUpYLqXjDkwrkY8JnkH4PTHf5dBF8MiPW+ERByE0nldQv+63b
         K8OI4tLYNCq7ESp3sdHK8sfBRuFSmJQJbqcxtX+myQJfOI9Yci5WhVMDPsleAFXmkhmu
         KUWw==
X-Forwarded-Encrypted: i=1; AKwUvBwiXT23B0oAo/kG1HfmhDRelmTBfNsCYMFSN3Y08f33imgcAa80hf0VMoejNeimV7wkyWO18YK2bL4HCqf0@vger.kernel.org
X-Gm-Message-State: AFq9FYKbTDHhfrxUeJ3+lA452p4JBWKKyBTrqyCjIx7dEfCjSprP0VMU
	0Mi4nlFBN3PDsLh6wxqGjHc7mTzeVXSinY2zv7wtoaB0gkqYXUXGnfNtSxjii4NJm1lgVdCH6mF
	sF/6J7BGe0uhwqGc/lxxHOtf/AmehEvrtrKpnBtq5FcPoWLxWBwk8IPuVJUwNKXeZILZE
X-Gm-Gg: AYBFou0vgOYNirupTPWAmo6/YtGTQhXOn6URA/IMXgfsNOEkr/hfCpi3d5vdFGp6Nw0
	QahkTVT/O1gjCCfySFoUQZH2vXGgzRQM9LW7Y+KfiIooqx0y9AzPX1W3Kz756IG7VlSqcK/Mfim
	6odSPv0kPVj0LMS2DU/VYrVZuCPbxP+NQMZDcQvBu9oUAJSGwDXkNaDCbp44nCZCVN2w/my6ahE
	lK9ngAsmd7ZZMqAVy8dHYZ1TvejQSoBpCT+BEU6qNrnbFrU8XM29Prk4Z6ag6bsTbD8ouc4URJW
	l3TJAv9aNPz05Db98b4fgtT4u44mFrn9HCUHJKRIEkL7E8PgHe9kUkQUoi+FXrRgxyO60TnPQp+
	0mkjqz2qTnqk6bXsA+QRTNN0QMBSsh1Tf9H7uaSjx2nghNz5x5SU09/qH/AlUR01iCAzrNbdSWZ
	sFohExiBndw6Wa
X-Received: by 2002:a05:620a:649b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93f57f580cemr334949085a.41.1792581918719;
        Wed, 21 Oct 2026 04:25:18 -0700 (PDT)
X-Received: by 2002:a05:620a:649b:b0:937:27fb:96f8 with SMTP id af79cd13be357-93f57f580cemr334946285a.41.1792581918255;
        Wed, 21 Oct 2026 04:25:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac437d6d7esm5338761fa.30.2026.10.21.04.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 04:25:16 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:25:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] arm64: dts: qcom: msm8998: wire up interconnect paths
Message-ID: <iijtxya7fr2xvo6kaaiydda5eqb6eicqpwkwrldc6fmd22ub5u@dbty5tsl6jyy>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
 <20261019-msm8998-icc-v1-8-c2da3934b6c8@oss.qualcomm.com>
 <aee928e2-909a-456a-8ab4-66d8b5aaeaf5@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aee928e2-909a-456a-8ab4-66d8b5aaeaf5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8a11f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=Q16rnCddB8cEJ5J-xv0A:9
 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfXyKVaColHOlOn
 eI/3arfPB8wLBtpBbk0nAdJTi7UHm9CNyjE4ixotSRBRF7Jg+wt2ukPzi1HIJLwfD/GMaYv22yu
 L7768W5GrAbefBR9B4VP1J8k9aN22T4=
X-Proofpoint-GUID: p8ZRcZzQSsltozrF813WaG4VvBUny32E
X-Proofpoint-ORIG-GUID: p8ZRcZzQSsltozrF813WaG4VvBUny32E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0NSBTYWx0ZWRfXwpu+iq9yz8wH
 mG3A7thsILtSOMngFySh+FaGdS4QmwnbZKdDNP3OYB0mYbxf4lmt1YDXqKLQJFoSSelDaYL2sfQ
 GmMlNbjjU9x5nCgALXCZqIQZSQrY4yPEpD9zz442OQynYMRy0DJghqVddWdDsz/GO4d7h6xtRc4
 fv/YSoBgb+VCk/z/6R8ikQ50bJL5P54FPii3B8skYPICDlcsJyAENqSkMUGk0sBLqnkHM6oQK83
 zbjIFydpHyT8ESK6+xtiA56HlkyDAhTfn5yFtoLZ3DJ+lV47GU+eL1KDFLaYbjm9DgzLqwUnlgQ
 7B1thHWeLWZ3XmSIoeMBOHxVsOAPwxoHjRwHq9SB0Dfg6fw+O+P8hwhx5TgMBQ140/oJV/esuwM
 lY2zauQZhrzY5AN1abA8+rVRN+0qDhC4a+2cqYSejsDu7tzrRk+T1rSH6+nCpOp/pdYPUr3w036
 RTStjKdcg8dnZVSuZfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210045

On Tue, Oct 20, 2026 at 09:16:15AM +0200, Konrad Dybcio wrote:
> On 10/19/26 4:12 PM, Dmitry Baryshkov wrote:
> > With the NoC providers described but no consumer referencing them, the
> > NoC bus clocks stay at their boot rates: nothing votes for DDR or
> > config bandwidth, so masters such as MDSS or UFS run on whatever the
> > bootloader left behind.
> > 
> > Add the interconnect paths for the GPU, MDSS, Venus, UFS, USB and SDHC2.
> > PCIe is deliberately left out: MSM8998 has no route from the CPU to the
> > PCIe config slave, and requesting one only makes the PCIe driver fail
> > to probe.
> 
> On upstream, sm8450 is the first one to have one wired up in DT
> (intriguing), sdm845 is the first one to have one in the icc driver
> 
> Downstream, 8450 and earlier do not have a path defined on the PCIe
> node but clearly that relies on lucky ordering
> 
> I threw the LLM at msm8998-bus.dtsi and it said:
> 
> The only edges into slv_pcie_0 come from three masters:
> - mas_bimc_snoc_1 (line 669), reachable only from slv_bimc_snoc_1,
>   which is fed by mas_oxili and mas_mnoc_bimc. Neither is reachable from
>   the apps master.
> - mas_a1noc_snoc (line 679), reachable only from slv_a1noc_snoc, which
>   is fed by PCIe, USB3, UFS, and BLSP2 masters.
> - mas_a2noc_snoc (line 692), reachable only from slv_a2noc_snoc, which
>   is fed by mas_cnoc_a2noc, IPA, SDCC2/4, TSIF, BLSP1, and
>   mas_cr_virt_a2noc. The last two come from slv_cnoc_a2noc (fed only by
>   mas_qdss_dap) and slv_cr_virt_a2noc (fed only by mas_crypto_c0). Neither
>   of those is reachable from the apps master.
> 
> But I wonder if it's some sort of an oversight. Can we try to
> regenerate the paths internally?

I've only seen a tool to generate RPMh drivers. But it looks like your
intuition was correct and there is a missing path.

-- 
With best wishes
Dmitry
