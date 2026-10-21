Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572019;
	b=ArS1/L6oM+jDXKPf9i1PNDqJE/zcHEohP+5Yomx55fIxryf73GQJiCOQSaVaoPvaqrDF
	 eqb3Uq83etM/ulIUqJGCpYNUSSZKKN9+F+rPOMEzZrRmkwhV1A8ZhGkvAGo52pOHITCV5
	 jkpvsNVJBLIC6VWTsX6ht1zZa1UXFSNU/ANyaXNIep3ZjbO6maXE0OX7VEPAODqlXbSCm
	 AADr7ZqVouLX6C3lRktiIWgTy3dnhxxLRu21s5IygB1hHyiJPViqVUf3s/BQYjlzwLHvS
	 6SBu6HcSBoBWyrorMoojNZQApRKfLlZLlJu4Q6vAKhq9EDbeuKhF+IC9f+egpKimvVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/bsu92Px2Xzs3mzwAmuQ4TO9HLtINGRv6UJpIugcPNo=;
	b=RPqgC8etP3hgIN3EwNE2LeO8+r5WxMUT1HLPu7xZvEfg6YF/MOZRe1rhSVHN/dbbhwHj
	 Wt0tnlUjT0Dponk4WWZWVghbN4e8htGZ9JoEmYfbxpYT8k+LNkipVfWAjd/BgAFHJDLEF
	 YVPSH0J14v8YYyrlTIjAjHn8kXhjeBbhZ72Mmo0X7CvKgqfnXobZ92LDFg1RJmvGeX4tC
	 vh4FHrxLyU5XgA5u5Fhic1TMuquDCVPNbG6BUJOQn7NJTayBAx+JYeMiYo5znvOobvsw3
	 TSaaqL2sxzwo5nDh+QKQKbh9bDvp7cteYRbw8j2bjGO5lwAmpllDyuRd8l53/X+9V+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RT3DAxHs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="BX7/cPsp";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E05C60A5BC9
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E05C60A5BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RT3DAxHs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BX7/cPsp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L63gYl290748
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/bsu92Px2Xzs3mzwAmuQ4TO9
	HLtINGRv6UJpIugcPNo=; b=RT3DAxHsBuN15IMm0uOKOO6VloQUq5kLeZzhVcfV
	N6PTAxKu0uwP2EnKT/eb8iP19wxCD/ie69QtegI3Cu5wmKqxP2p2m6gx9fMERCwX
	I+QZFCsaN+U9bfJG7j046x2ro3ZDTE+hlz1rgVK0qA8MrvkqTDFDezV+QyR0IHoE
	p6VdGdRWWFbtHDTbCUHmeFIZlDQeRuuXtV+TIzv4vItdYGGLBZjvq/yvj7Bd9o6G
	KxKXUSI9Sg4HLCeosyKAHy7yIPTd1A2k7MpArJX2zUPFF4Nz/NtoPZHH/v9o/0Ex
	rsK3GAonS5zSQU7FWXqp+cboZHetaxuxQqHGES3Xzq1BwA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedajjy8g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:12 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3425098ae4bso2473816eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572011; x=1793176811; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/bsu92Px2Xzs3mzwAmuQ4TO9HLtINGRv6UJpIugcPNo=;
        b=BX7/cPsp6cjMuIqkRn5wHuROkTbTjD/z0i2jUH+Jt8aqEvBcK62tXb8UGaj3c5DjoI
         ewjnAeWprpvUMWeFpjuYDcLryDkyCyf2CgoPbwVg+hMxLWkEhd4ZEf6wkG17RifHFmhJ
         KClfiv4b9qVtD7lz++hxeziYFmJYOM72PXVnAHbDKRv1mLeRGM6K04tjkYNjo9yzEZrk
         2B1lX0uyEdpMwbCLFVyNuiasMn50Ri1qGSlhRwsiCRO0L7RighnWmSlOkMeLbeU1csz2
         7SKw07sCRPVIPz4vc3ctotoPxR7SvvukQRdO90KSKR9sIJgJecS8G5k3DbZtzfKLrpK6
         jM0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572011; x=1793176811;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/bsu92Px2Xzs3mzwAmuQ4TO9HLtINGRv6UJpIugcPNo=;
        b=P77Osk6cjz9CzZfK+HybWMGSZuWMJReOFe6pkyB2eoRcMfwBJsDUqSwtY80gjaNKaR
         MDJQRTwzUXbgWf8Zqe5UEGbNlhpN9F/Ur2heerhum2+1xeXpz6/20LA/hVcHFeMmx2gq
         B+Y7sziPrti4qMPDP4/JSy7MtP4wkNAxw2jtVpVFPOUBUmfKAfpuA4bKUp/a7igwrPtO
         54gMrAduSPnIfCCJvOXmzhRrfVt7smgdguOnZcvgTFB3YTv6ACzD38Hu4I1Xw9Ocws+p
         XIDn6C8D/wyQp+vgqdMXXp8LHPwyqlNjMhEftsA0hX7bWmt+cgTBIEVzk//ozmJSJTe0
         O4GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwKZCqXZi6jrPvobPpdFBZZ+duUBPP48ru8gh2Q7F1B+Nnq7G5e0vwJJi0i/Evkd+zZetVPPYTPl3sPhOZH@vger.kernel.org
X-Gm-Message-State: AFq9FYJDNiUc7DSzYf5dfm8/yNQzbqnQLVdi0xQlVbqg9CKGoCatjRmg
	qBgvDnDp+B07cpoLCRgPDFnWTsL2LtFa/t8ax18ABc7+WT1PMsBSald91k3nynPBm/pMIk68tsq
	/B+nwZIi8HrXg1mUa3Xiq5Oa4mMFwspen+2JMBS4R8WrOBMpERjyPKQ1FJKP9+KAoqccT
X-Gm-Gg: AYBFou3wwbczxYLXCkaKxTE2pbiaTt6Wf7NdsNZvI36oj3j/eBtBTqO9w7WKanCnOBL
	TI2rt2znrfVe5dga/JcVzsUEpJzio/p+pK5R7ra0kg1Z+P2hp4QjCD0/vbpXRPRsqtcZNGcSWBQ
	ZgAfaEroC+v0rGwhn2JipASfehIotVdxzFCjsB4MvNxAM0maUaLvp9LNwiq4YM8JY3p0rlil03e
	tS2dhuCySWdvz3y1d4Gju0t7AJ1qBvjH9Xs/0Weaip/jkTlA8gen11X2u6gNuS1oMDOKzsn0ReQ
	Rc9DdQiWNl7VjYwIkYeBIo8zUFjDHD9wxC3EP5Kt98SXKcgMSQ8oLLYwLpxuQ2da9mBlLa5USYn
	kbzJcux5UkP2zhtY1jH6hrbZzajA0ttiaL56y1C4EwX0/w5L+MYdUdmZGIdmYlBSTUBJ7jiMZME
	wGgc2dgITt8UOHkrAUhfg3IG6HVZB2
X-Received: by 2002:a05:7022:ec07:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-18dc065e242mr6244535c88.20.1792572011220;
        Wed, 21 Oct 2026 01:40:11 -0700 (PDT)
X-Received: by 2002:a05:7022:ec07:b0:14a:6a66:f6e3 with SMTP id a92af1059eb24-18dc065e242mr6244485c88.20.1792572010671;
        Wed, 21 Oct 2026 01:40:10 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198e2d6sm4749009eec.22.2026.10.21.01.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:40:09 -0700 (PDT)
Date: Wed, 21 Oct 2026 14:10:02 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Ilia Lin <ilia.lin@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: cpufreq: qcom-nvmem: Allow generic OPP
 tables
Message-ID: <ath6Yrtq4HSGU5R6@hu-varada-blr.qualcomm.com>
References: <20261015-opp-v1-1-f18fb6f9bae1@oss.qualcomm.com>
 <20261017-calm-tangerine-marmot-2e8bfc@quoll>
 <athPyI5nvYG4vmfl@hu-varada-blr.qualcomm.com>
 <ecc66886-1989-4e61-86e7-fba6555c870a@kernel.org>
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
In-Reply-To: <ecc66886-1989-4e61-86e7-fba6555c870a@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXzWR7IP9f2n6E
 1C0oM8JkNyKdrMluqI+SX1Rk9YkSuK8+fZgaOK6k5Ix9Z/aaa+rtcp749NfSiyfbQFkRjfsAn1h
 XxhlY9OMbkDqJxwnn139rdORNrtL6aANwmYVNVfG12L1yNoRnRZ0xVACnRQxChkjdvMTogTrS7/
 iWSXsE7rBGjAAflHaneCZG7uscj2grRP/IRuB5uEoOG2C1w+n8K+kgPzR+6G6Wo1YZTJZnD6afy
 V4u2zAtmgFR2Ue/zPTVTnDG//0KikoSsLPtWFtLGqQVw3cjmLzgubki6CzMS5Isq1nkoiCoEECx
 Eaq3espE0AqyhVoZlV3UbW4R2mmkn1SsWhqJryXoi9wk7hxoSlcNeYtcvg0/2iTfLik9te02Hwg
 Nl4vQ4Wg7TPgyXpTAFK+ieUiTctzAQWuxpNbaM7roVUUe1O+ouUTdV1J3MuI0b67IVRVo1ngY/n
 WrSK/K0XCFYwF6qgxGw==
X-Proofpoint-GUID: MWkHww2JRJFZTWI2iJoLLIBniPIaqI_u
X-Proofpoint-ORIG-GUID: MWkHww2JRJFZTWI2iJoLLIBniPIaqI_u
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX9IG3WGfehwTo
 hTCv6XGlgI4w5e7J805QH2p6hgUlP+jeCgXKri+7jz4APpHy6WIgvv7IAWbWu82cAdDkwalSSAw
 80kKPKJpkPiBIZR13D/XjWbDYR78174=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6ad87a6c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=g1hkF5I6mjiIX44rm_4A:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On Wed, Oct 21, 2026 at 08:17:36AM +0200, Krzysztof Kozlowski wrote:
> On 21/10/2026 07:38, Varadarajan Narayanan wrote:
> > On Sat, Oct 17, 2026 at 06:45:53PM +0200, Krzysztof Kozlowski wrote:
> >> On Thu, Oct 15, 2026 at 04:25:28PM +0530, Varadarajan Narayanan wrote:
> >>> The OPP table node-name pattern also matches peripheral OPP tables on
> >>> supported SoCs. However, it only handles Qualcomm CPU and level OPP
> >>> compatibles, causing unevaluatedProperties errors for generic
> >>> operating-points-v2 tables.
> >>
> >> But the select should not select them. How can I reproduce the issue?
> >
> > Sorry for the delay, it was a long weekend here.
> >
> > With the attached patch, I get the following error.
> >
> Does not apply,

Sorry. Have rebased to next-20261020 and attached, please see.

> but exactly that sort of opp-table is already all over the tree. Just
> check yourself.

From what I see, SoCs that don't use operating-points-v2-kryo-cpu for the
CPU's opp table don't face an issue. Since ipq5210's CPU opp table's
compatible is operating-points-v2-kryo-cpu, it is facing this unevaluated
properties error.

The qcom-cpufreq-nvmem.yaml change is approved in [1]. And the change to
ipq5210.dtsi is to address the feedback in [2].

Thanks
Varada

1 - https://lore.kernel.org/linux-arm-msm/20260703-lively-intelligent-raptor-5edfbf@quoll/
2 - https://lore.kernel.org/linux-arm-msm/06e6868a-c106-40b1-85fb-5ebbc01eff16@oss.qualcomm.com/
