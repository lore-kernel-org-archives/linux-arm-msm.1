Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59C42C0268
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 05:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785734946; cv=none; b=cESKEfVrRzEHu6Lxsla9KOlqFBpxnVGCyLWnlwfjpXeVxL0wDyP2SgSxB44nZmxUITRu25ld5AW6qeSRi0jTG4n4C6A9qyqZ7NDWf6cL3hcpA34evOAzsLtcVii5noSciZcCB9c6mXrsuQUGy3KMU+s5nurlA84/4VPkxOvDQRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785734946; c=relaxed/simple;
	bh=X9Y0e4u/UT6nrErat1cN5yiXzX2yZlRBfIzftosOrRk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UU8WJpiNfflx/lPNPw6UGEGq21Yw4+wI8cnlDHDPEUD3vvnkbv14Fq0URNH1pUWZ6Nhgm326qVwlm8YF/uJ2tza+ReR5PF1AMXWmCLdX/GuJcuvFGHlFEtP50eG7pIXIxsf4cn4zEzm+ZbJAOJ8uatCo2Q6ASVXe/LzBUAjk++M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=elMw2G7L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PsLJqlvZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="elMw2G7L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PsLJqlvZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LXafM2213077
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 05:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HxWror5dk2LdACMJB3tBxD8tiNkkasZcIcWSCrhlEAc=; b=elMw2G7LMhwh+zVm
	UL0Ir2uPmvxwzpHXyhtA0+hZqw5+ObEPYKbB/kPHDBmzIYd/VDp6dqbsheEk0ryP
	mEl5ku6ShHMpz/5AwHI7w9y1UfajNyI7iLPM8JbW90pbbLZuYpN2BDfaYJ/HP2+t
	xl4c7tsY0zenUuI08sC+8SOURJFm41CfJzJW6I00ZNIaWIFZyD8rS1DgQqhFy73o
	CFsWxP6LNmha4+kazjmqwpdEzTkZrfnFJCb7tlIPeOt9KrB8maxjnJmbLdg14eK+
	lz0HpvyGmZMzjk3dZkDtFmjfuVONuzzNFCrwByb2QC+sicwLLX64G+Rl+C71gszz
	Bfs9Xg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmx8yup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 05:29:04 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f57e31b6eso2904376a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 22:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785734944; x=1786339744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HxWror5dk2LdACMJB3tBxD8tiNkkasZcIcWSCrhlEAc=;
        b=PsLJqlvZz7zzvk+y/WHXtcSEJkXEmDoe4okSnbokm5WUq3jtd3f80EsuZvK2NW4rNA
         /vEIXPEtklu+HBD1XouJarqyKgD75G77TtHlWwTJS+sXlAraFjmGphqpWBl8QfA94xkl
         vszPerMAmf+Mzh5dg0q7j5HJVx6q6Q2juZV76YqXTSaJqMZIjTxBjPX4HD7Ek4OVJrMn
         AhBxrLdN/GOnWfSANN3mIr6y4ULh87GhOK/vThFFVCKUx1amnE8a6y4L2EPtENUaMi6l
         a8Vaigfug+tKgC0e9v0+L3TWzUnXtwh1y8AMIKGFhUn0oj3pmLpkP5ZZU5IP47oFm2rE
         I31Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785734944; x=1786339744;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HxWror5dk2LdACMJB3tBxD8tiNkkasZcIcWSCrhlEAc=;
        b=ejm9k2Oa5HiV6K+ogJfxKlC6TvcRNx0m7c49rs8uFrY7lrkoMWvlmDoielPZQ4SVlI
         KBfBlBfVFpxWhjqP99qgSMXxaE+7MWL5rxJMV/HXBvIEho5wOcjRsKCdhiC/lGohc/9g
         SvWUYNipAOz4/77sNTMYZu7rsAclOdFRYt7npdQDrqGVnQxQr3N6RduHzrhaE4Evh8TY
         BeDpUQPeI+SDU08yl/LHfu8oIwpUcerZ/UNE92ksCllZidSPcTXOvmzp/WhtiDuva750
         Z/cmYyI8vjgwm79NadpCpx21FwNiIyyb2nccTO6ziJT+bAhimoP8dACRuUZ3g3nvx9Jg
         je8g==
X-Gm-Message-State: AOJu0YwQ9/908kFOCu7d+0d3kyJGvjUAF0SvIhx4IoFOo/Qq+eLrxMpF
	31vwfv6bR41DwTYVt4+Hgcl0SyarxCKlMjHLj7cs4c31bZ7D7mi2STgV+zv1fD/VsmRiggFsIzN
	UHWEDXRfPHoOH2LIP2BO8UNfyTUN+CveX8EgOsKmuRDoBjpNFPABswrvnHAof9wMKQZma
X-Gm-Gg: AR+sD10Qt/8W/u/UFglThXmSn5V/RxXntdvhgZw5BvzoFl8AnwF23/Wj0mORhVXZJba
	RbWcb8tyTGcKbCCb/YstHauZiSRRaXLiKAAUYycAFTg/nJrGZIyG+c7CRINVJkHtpnTEeciApiD
	GxsoLfDS97ZkouQNqPD6i7o9ccRDS7MpuhUP6+2YIhSeo/B7bZXH9WUli65Stp8IeYR1te6KXCR
	mN/ooSIf4hrF05UW5oaIfZTvXjreMo6OkVNbUSQdUj/98fSwX/syfbJDoQL3zuZwgQ7xjiRnfpQ
	sWdbIhLgc1dAgAbAqw6JNEZZrlDbkb1rqHkg5GuzDmNynOseaqh/PjscaD6bx8WtZXLIZG4uJ/P
	0zNNf5nz8yVQPTVYpZ11wqwOdomY0
X-Received: by 2002:a17:90b:4c0e:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-38fbc48e76cmr7675165a91.14.1785734944397;
        Sun, 02 Aug 2026 22:29:04 -0700 (PDT)
X-Received: by 2002:a17:90b:4c0e:b0:385:393e:7124 with SMTP id 98e67ed59e1d1-38fbc48e76cmr7675141a91.14.1785734943929;
        Sun, 02 Aug 2026 22:29:03 -0700 (PDT)
Received: from [10.218.15.172] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm32428360eec.20.2026.08.02.22.28.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 22:29:03 -0700 (PDT)
Message-ID: <70c41e03-ce16-4e5c-8054-0f41c1f5a14d@oss.qualcomm.com>
Date: Mon, 3 Aug 2026 10:58:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: interrupt-controller: mpm: Document
 power-domains property
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Shawn Guo <shawn.guo@linaro.org>, Marc Zyngier <maz@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260713-b4-shikra_lpm_addition-v1-0-3d858df2cbbf@oss.qualcomm.com>
 <20260713-b4-shikra_lpm_addition-v1-1-3d858df2cbbf@oss.qualcomm.com>
 <2bec0856-4d51-447e-97bc-13917c11a985@oss.qualcomm.com>
Content-Language: en-US
From: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
In-Reply-To: <2bec0856-4d51-447e-97bc-13917c11a985@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fxtsd3C-5w3D4FhUXQDFuUF2QCTmtugp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDA0NSBTYWx0ZWRfXz0rs9sYG+wCa
 A5ewtvj0iL1ionaeyS3BT/uPDVAID0bLBMcRykYw8k9aVnKc1IHWYcn2DtjAZpijfWnbh6AT41F
 DhHeWp3IA+k23aQQccGIq1rOCqqWc9m9Gi2x6+tNPfwyv/g6FYoYCNVmjlEWFwE4vrgXC1vwOaW
 d7wPgx3jOc8dsG4VGQ9TwanjZfcyJrFazanabKAbzK2E+yDLcQpjgnEkNs/9X5nf4HWjtcr+hdv
 jMyLJJByYko2n/6598u0TXic1LUO8/ZQq4TQUzdjd8/Y947mIwTQMKhK9TpBfQuEgGAm/phbDrX
 tReEHxDhiva/nVhkuwC4WqB1u8gUqYEeKqGi26gZkNOv9B7ljSeftgloj9jeeUem7oPuBP8v6Uc
 U9cyxt9jRLsUkkRcpWP2GbbeaVNV/IxadElVhTkt4a8fQMDd3GJUg30qUUGMMtLvj36e1hrPugh
 zeiP0DFHumAWJclUoIA==
X-Proofpoint-ORIG-GUID: fxtsd3C-5w3D4FhUXQDFuUF2QCTmtugp
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDA0NSBTYWx0ZWRfX3COA0kgRO0l3
 w+JgedeZO/Q3OFJ+6LY6kHOL1ZKt4xFq+ZSBpnkTuXE03SIr6Uz0rO8DLhzt1Iq1etZWBJpkv2k
 RA7Sq9Xxl/UIssFd5clevWTY4IGehYw=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a702720 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=aJKyoP8-HFX-j1aC8PIA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030045

On 13-Jul-26 4:56 PM, Konrad Dybcio wrote:
> On 7/13/26 12:25 PM, Sneh Mankad wrote:
>> Remove #power-domain-cells property and add power-domains property for
>> MPM device.
> 
> "why"?

The reason has been specified in cover letter and driver change, but you are
right to point this out. I will add a brief explanation on the "why" part in this
patch in v2.

Thanks,
Sneh
