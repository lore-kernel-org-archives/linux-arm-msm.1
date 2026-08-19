Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F838476CFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152439; cv=none; b=fFtgiV/6o7Dbi8whRO3Ja/YckO8b4DkLz8dbikrOQ4q3HmgNTxNZfuqDtDe+qajMTGpqA8IOofCJau3GBvkJRcxBbaMz5VvSK1qqpaEVPU3t+97u7P5x2WuFNqCbDEpLcC/TtUKV/CLpFqPDC0fhCDQLlBSTQBkcILQKbZ0Gf+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152439; c=relaxed/simple;
	bh=sPLTwLqYDJxydWPkH4vVCs+TCo1KHFPfAUrU9q2hOjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DBkk8INWUui7H5kPexOSJ7flLLVisxZGJ/1rqS6AnOP0C2PYVT9uKXmtFps6LAnKBbx6Oj0B1v3wR7R/a6QHedeIn/y/6fi+Bt2BxJ8XiA6tJ8bDgFeHLg0Psx5fHTzP49GnfJ9+l9M6EheDhBywR6oRqS4Ds4b6oh5DwMvVdPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gQEDaKvq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G3x2yNeb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gQEDaKvq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G3x2yNeb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF19lj3869620
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:13:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9EwSNOxmS4ilVUk9eIeWz4BZhma8X9RwJEJsPr4ziAQ=; b=gQEDaKvqTZUrNEPp
	eG0HjxzerTNjtZ1Vwie4SId4sgH2gTbdLxIpSDGSIF7YHMIDi1ocfXGIjINsXHod
	oH/NhKMvhkkIQgEmH1VtVe7lAT/7QrA84BsAhPOPwpXZ0RAr/uzfLRvPtvY7wOXw
	cpzUzTA+qLHWWSFgKN6BavaH3lbXsFChH7PA+WMnP+z1EihV9gAABNQPTRby5B3u
	kgjsUuaZi/STb3fj8mIf7u4VDETykRgMtofW4rVILxYWRxFZX2StbYMpdBGU3scj
	rCk23kWFcupseOaBtcv9QfmqDNZwlwcUV6LyI/jRbiuIwVd4H7CdgLrxepJ/jiaB
	bPrjXA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5ervg26g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:13:57 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9349ba88188so23638185a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152436; x=1787757236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9EwSNOxmS4ilVUk9eIeWz4BZhma8X9RwJEJsPr4ziAQ=;
        b=G3x2yNebsofcJDmbR8fDeUwPCdizjDQdGLy8KDBbTxw+o3t5ZXop5sZr+byhYkezvF
         GcJBy0+i1+orNSvcpwNP7i6BOHIC3Gpyb8gi4SXnGv2bLEAg3gQ8gXsKVfGKcK9jiCSg
         vm4404xwoQuo2VVg5pdBJxdnNiayk2NBwMVXADn9TbYVwHiOAaAv0kpw2SgCnqdGDMBP
         0J+3Sn3k493PAVo2chTluW8z3ARK3M5dixgt6H4xrTTHirYYeb+NAcDMMq3R4xpPnPKc
         ZB9ZL0BQ2fmXKKlUda3QdFE1kcbY1dRMJI0zdiwEH7QszaHPpq2XbjDosUS0unKiljJ6
         nkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152436; x=1787757236;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EwSNOxmS4ilVUk9eIeWz4BZhma8X9RwJEJsPr4ziAQ=;
        b=OuOBeL1rOR9hUbaN6hV1DQFbtuFxmGNXp8huQZgH8k4ZuI8rhyFvqolws/UR7LrdBb
         8nOXF8/e4NSm7H3/ED9dX4mHVQrHnzDYD2TMnalbRijX9NjBGYKdVBDWuefws26nqHDO
         KnygLeIDRC0LBeNXjJPjRxKqDp8yfs7wRMD75T4wGAr5olcWrXbZFeP0LurbvEUQ/B8h
         A0T5fgoOQL2jjCU1TyAlNtH1N/1uoC91KuJ1THbPnG+bSfm9lTannPMHwJpGb+WA/iu/
         vGwow8lE9/exc3dtPOEMeSVAD5WEyH7jHfyEMma8L3v5XnJKYj7z9RH46jBwKQe5kh3a
         Yg7g==
X-Gm-Message-State: AOJu0YzLDagz15PZQKdFEySJPku/Sr81xnVSiwXxocab1+3GGLxKCGSl
	O9M2zGT6tCRT90LDAUC8wbPVDp4wF8lQdbnzBwS7ejB10Pngp0vqC+Oj59S27NHsXY8w9o9lmMO
	NS4WmCX65zjvQ1A1uxNSkl+gk+ZY6oRCcFx3xmqYFXsHuZDMA48BuVzz0iJailBpWvqhV
X-Gm-Gg: AR+sD11ZPOAi5+09vXhVtg/xcaQqYokzby/KEZMc2pwViHfjqWzRrQS5u7tnnLBrM17
	cmExmP2zexztM0wMRwIk2T7hAbMgin4J6gdiSn6g7FWeKYj1zpgKVTQJWxz0d0vyZ8D4h6OovkV
	FmRhnqmCd1MNwsIkfYKn6lmGcFSirLcKjKPU8AnGIwcbQwUdPNQSsiBeqhrsALPNVbGFKO76Ix8
	KYnRup5HgadPagftnWz0D+PDK14nz1k7OlfSEuCkpBHrZLJaB/3FNT9vC7TVFzZ56s8ufR6CEJc
	GnBSz6wxVfjX0L4yoaMwmBos9gnR0GFZvbvO2z5V59cPKM8/3PB3F4rrB6oDr7ekmNIYyKYsD5M
	FcOGATYTMjixOAn0HoUN79JeM
X-Received: by 2002:a05:620a:d95:b0:92e:5272:4e3e with SMTP id af79cd13be357-9371e14b32emr424570585a.0.1787152435902;
        Wed, 19 Aug 2026 08:13:55 -0700 (PDT)
X-Received: by 2002:a05:620a:d95:b0:92e:5272:4e3e with SMTP id af79cd13be357-9371e14b32emr424564985a.0.1787152435444;
        Wed, 19 Aug 2026 08:13:55 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff16c546sm1000897a12.21.2026.08.19.08.13.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:13:54 -0700 (PDT)
Message-ID: <6d525419-2298-478f-b602-49405b658d76@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:13:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: add basic devicetree for Ayaneo
 Pocket DS gaming console
To: azkali.limited@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Teguh Sobirin <teguh@sobir.in>
References: <20260723-pocketds-v5-0-74508388c716@gmail.com>
 <20260723-pocketds-v5-3-74508388c716@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260723-pocketds-v5-3-74508388c716@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: t_t1JuzQZ-rxeKAZzwhA0DwCajgYrwz9
X-Authority-Analysis: v=2.4 cv=VZ3H+lp9 c=1 sm=1 tr=0 ts=6a85c835 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=at5hwtf0mp6GI8x7C1wA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX0b9RW4SEjf5i
 bjZ+5YYHGI5W+uYig0Yj5KlDAG8IJ4Xl/FtthZp+pTHbl1D8tevD3O/j8gS8FIjuQ2LNQOpvK+S
 NCG+D7kxiU0iCoArFeVYopiypTtGyPQjKlZeNUAoNHkKrW0TpGPY6tAEpI4aij9QK0k1p5Ljtf6
 j1RIZI/HmcrLV2LxKeGphYEDlWWKV17r2jjJFdhVVE6zDIoxqQrr3RHueunMP935kYhml3jjwQ2
 hUs+gfeMqFYlU2IVFS6SKHYiOzZyEJgEIia8j0XSkUWJixBKmtxNLKuvZVORYOQUfNk6LrckWZd
 A8EzwnB9i4FQFb5wgbAJPSC4yPzKITO50fiOqUGk6QBQgcCC2KxNr9429HO3IcV8W9IZIjzp834
 isLy3CK8Reh6xSS9D3ORhV83YbQ97BdZ1qULm2pp/rfCW/ZBLYBh9Zqtrxc8666/bYtLOlEun7L
 91VDM0N81Sk7gg3nrZw==
X-Proofpoint-ORIG-GUID: t_t1JuzQZ-rxeKAZzwhA0DwCajgYrwz9
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXxmd++z6z2Qpz
 CY1hogMIEC62J5H9keFHhCo4JFmL6p4GYvCysbV1zICMDsGEDZq+flRjT03/kQUinoYWiCwTEig
 vrV4XVkGQwKYiNYEn5BEuuj1ZgJnzfs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608190118

On 7/23/26 3:24 PM, Alexandre Hamamdjian via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add initial Device Tree for the Ayaneo Pocket DS gaming console based
> on the Qualcomm QCS8550 platform.

[...]

> +	sound {
> +		compatible = "qcom,sm8550-sndcard", "qcom,sm8450-sndcard";
> +		model = "SM8550-APS";
> +
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT";
> +
> +		wsa-dai-link {
> +			link-name = "WSA Playback";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +			};
> +
> +			codec {

nit: 'co'dec < 'cp'u 

Konrad
