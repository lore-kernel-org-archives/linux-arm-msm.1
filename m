Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303390;
	b=yVG6ECA7MFnziAeBXweXqe3ddXoaa6eCkKg2tojzNTktRSv5saacg4/rnoay/h0EWKAm
	 WTfg1v4Fh3x0qqHxz53aHxJCgKuzgG4gym9BoRREcw/OTYsYPqKkmUIk9yDfWFRlw4Aac
	 76pAIIRuHmiICjlMtdA/+Zz0I6VtAHyK4Z82SnfWDK7qq1Fvzm2YKkvq+kDLCoyjnmAzE
	 jQ/AxWVmTnp/+NE7j5FxOt1mwmFjVGu5dWIQQMR8eGDfP2QUttOiGqxS+JaWWEGKOT8Dq
	 tPpqok9NglrM1l+Pb/jDw+7AvBk2cuw/az5VFr5ujtiHutggGrn69IGZ/fNq+Y3jrpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eovy0BMi0junUVcwtyGGPLU45jC9y/t8YDWM7YGB4LU=;
	b=u47Qh3mtqUIMuzki5dvK/SPlF8Y/LWW1jpdqtjtplFHv3CkI99jsocuWRaxP1Cubn9gq
	 SZzJErtYmyOm30hXKVB8RURwdrLluS/gSYz1tUMd6403/WjpDDi2iKPXRn0lze3nl2UhR
	 1oBIbUmOrdPLmRyEwkZ1LInMqPcB8Zo4icqx5aJJqwvfOrE3UMjfoH7/vv5QC3hE9DbHQ
	 TAQ0rlnbBZHf10FrYbipKm5PSUX75McAmTsHAC7nVRiK1wjm2HdCm1epmli+vmrQWELNX
	 nwkMZW25hZsg7WWThIJXXrLV3aChA2yXyK2EVgRXfc4usiYYm2iOcCZiPT54JPonlxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=doosE3TY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X8J0i9ck;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC94606DA0C
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:36:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFC94606DA0C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=doosE3TY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=X8J0i9ck
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lDIi2240785
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:36:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=eovy0BMi0junUVcwtyGGPLU4
	5jC9y/t8YDWM7YGB4LU=; b=doosE3TYxAyIQpsjTzL4mo+qHKyPi0Jd6wYbWSJK
	Bp1Aob0pINYE6OPdB27ZaXG/QMfyVmOSsEpl5Y7au3ockepFUxAZ2uYU1KdU0S4F
	OBshFpKa7VelJ/JCp0aAuSxDdp/O5klgI1qzOBmPnV/rLPu86o4QI8pT1Ld6aY7B
	atICjMUZAUOfKCUPf9hQnySzKJWbAvsE4BowU15SkST8EsSFlhR14NDgBlO/2TaT
	2o7dzZZ2EHImcB7TzMn0k5yRhGL5/+BaMrNAbqLx36bqVvWEuDMenASo6LP8Xums
	QmdRc4+R47fuNuahIS3yxTeX5XJCC/xxRdqTPBFAUt7RbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huucp1c5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:36:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f13c143c8so343124085a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:36:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794303388; x=1794908188; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eovy0BMi0junUVcwtyGGPLU45jC9y/t8YDWM7YGB4LU=;
        b=X8J0i9ckrqGqkMPjT1FJYbjXpBPvIbmZ9XTDCi8VS1Hu42B3zVQS5AC9GDn2/5OE+K
         rBtg64rXT34KWiJGbQ/mbYRfpFQHkrRgRJ51XBRiDM7W4T7YW2bKZmzw1IKj0M7uS3LK
         YRcCcZF3OeVpTb+CZWK3aLh4vqhJkbwfgHUWBLcJfBSK3L0CkeFvxJNZJJWWZAUKq+xE
         UtlPt/xa/Bz5bAssHMSur5QIOloqtPKO/qpb8qzUrUM5vfUSVYaqPgSSrkDp+zLp/u+i
         z6WBlnUVDJlVq1Bn+OB4YGFenQxgd/0CaU81N/5tIY6XlOqJUEpNC0R3bJg5gSUHgVWu
         EOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794303388; x=1794908188;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eovy0BMi0junUVcwtyGGPLU45jC9y/t8YDWM7YGB4LU=;
        b=klosP6RvOeZBUNBdvSZhroAalljOVCvonQEipv/bQY33IwER+7HphYVxh1j0JSpayA
         g5UEdP/tLz2AGkSOnzECs5/P4b9Gr9cyduu8O4Vdsv0VP5Xg1Vd2GaTmDyHJxEcX5dWO
         PxF65K5rkJhcnVxddIaroAqJihqrIXIfI9bkTUuW2njS7PEHhunF6Ok0vW6FM2Ckj3Ex
         +h3QwVTphIRxlMuO4v8cYEt0KFZj4iGD2CbxrqeUPKaUqQWU84NuttHaCuCkYegkvuBW
         epqiSVl8T6s5sCz/Ws5nKEeCNAjCHdKgcuKM1C7dTDoY1ylx1k5sEH35C+PMup/xt0BN
         txQA==
X-Forwarded-Encrypted: i=1; AL+hErFSKxVSWLvKheFyZevcocjzMo2DTlnTSZNPme/0GbnwSNonp013qjyVF+g9fwFjqlKRDgnWa8CNa6msMyIg@vger.kernel.org
X-Gm-Message-State: APuU4Z9vOB8OEoRRwZ4XkcqEaRv5hXDFKOJ5ChLvab9nPGn5pWsGGvQp
	7rF/5jnHf9m5wJRSRdolbOX5Vd1ZOq/GjKXhy5WVfiAH722kZiAVHsQZ8JzolVA8XEK4/MR0Xsi
	xPfcpjoLNy853Dr13Nnp4WtE1emKBzSyBBM3i/bJTf1n3ZPaoiwtR/1DofNbaBlkVFSJD
X-Gm-Gg: AYBFou2LlEBV/y5wxH3p7YnZCn+Bf0t7zONpo+bYdio/Tpilo7jaB7lnv+VpT0z8PSy
	uGQ3bj6Nb9w3Eg9pUW5rbczVZamKtWWze0RXH642ilAEQAMH4eitjqnBKjF9TeazQMe3hxH4wmh
	jDs3DeNzXbrMj2uAOhbH53gg3tRA37VtEVk20TU8JHyEMVyZmzT6iU79MTcb7DDpJ7TOFkXK6Mh
	TOJRFebd1J/+3JVJKyvbAGH/1b5IHd3NhCyAum85ygMv838qn0xSmVB/5IyLoBHN+5K2QWs4t2K
	jybmseaU7iEmvC0ppA403yM4R6peEntrYGJwCdXP0u4/zdsEpT/R5FQo6pd53EHPN0jwe/QgzMV
	FkfKjrETQEDnN3g3OI396nOTGAep/3Vfw0YwJ8cPNSm52TrDh7psu1T790TKlIGly
X-Received: by 2002:a05:620a:4623:b0:93f:1936:b206 with SMTP id af79cd13be357-9479f4296a6mr325187385a.83.1794303387784;
        Tue, 10 Nov 2026 01:36:27 -0800 (PST)
X-Received: by 2002:a05:620a:4623:b0:93f:1936:b206 with SMTP id af79cd13be357-9479f4296a6mr325183985a.83.1794303387252;
        Tue, 10 Nov 2026 01:36:27 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49835d2c027sm4021245f8f.24.2026.11.10.01.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:36:26 -0800 (PST)
Date: Tue, 10 Nov 2026 11:36:24 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: qcom: clk-alpha-pll: Add Lucid 5LPE PLL type
Message-ID: <tvjdoqymeccvy7feynvozftobofvj3mficycrbgp63cicuabwk@q5va5dpwzvvm>
References: <20261107173621.3538964-1-vz@kernel.org>
 <20261107173621.3538964-3-vz@kernel.org>
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
In-Reply-To: <20261107173621.3538964-3-vz@kernel.org>
X-Proofpoint-ORIG-GUID: CBARJmkM_MXCHwThh6waWpru-1W-2WkJ
X-Authority-Analysis: v=2.4 cv=U4oHnuru c=1 sm=1 tr=0 ts=6af2e59c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=aMfW9y36GBVf8kygzwUA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfX3Xagix6a9yOI
 ZXOnH0ryzVTwJxjH7Rm9YBNPtS1PtXoZdV8E1OW5pItLJSDQIha0EQjJiIoOPZRlji7lBQzIin8
 DMfq60j46gOcwXseGs0mIGe5EKMR6OoCbYj/4Iy2EqIZ1JH77GUgn/vgCUYLpaNc89qmCdyg60m
 ngM8g7K/X+ZLPlr3hzpmL5SxE9lK2fxIrUFFsn0eatlVJWX8PvJXQKwyr2440yRS+n3V33tyhE5
 Sn7PAT/mHcloRGmXl/YcDhshOKagrS7Zoz2Wqtuj84MxO8SkZVXIXZ5oLwgKlw1urW6maOEfe6x
 OV0H9Z7ePaTB0Z2PVsEtljbwEwpfzgNl4R9jIWMJD3kPSHcLnMcAUtX83bEhjs3MW0D7xzQS2nC
 sQj2G+w1+XGh8TlvxQe9RPRLN1037d7cx+UbvSHr/kl2z50JkUHeEfS83GObSgLpMgkQrJ+TD3Q
 r7S3BvbNEUQdlYY7MYw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOCBTYWx0ZWRfXxp255WmXWHKO
 j2SF0hr71pDRAnW76GF5YJPfaRY2e+Zlb6miyV5x84/8QCU1MtMQ/tasKhrqpRU7AFbh4VEbFNX
 CllwJ2shnNvKCqBCnW0Ix8CgJ/mKaeA=
X-Proofpoint-GUID: CBARJmkM_MXCHwThh6waWpru-1W-2WkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100038

On 26-11-07 19:36:19, Vladimir Zapolskiy wrote:
> Lucid 5LPE PLLs have the same register layout as Trion and Lucid PLLs,
> but the bitfields are not identical, for instance PLL_UPDATE_BYPASS bit
> is not present, and the PLL configuration should be done by calling its
> own separate clk_lucid_5lpe_pll_configure() function.
> 
> Add a separate Lucid 5LPE PLL type to select the proper PLL configuration
> function in qcom_clk_alpha_pll_configure().
> 
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
