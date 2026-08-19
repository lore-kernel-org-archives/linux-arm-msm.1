Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF4447DFA8
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787152398; cv=none; b=hf6CBfn2MQrm4ABI4BkE7gnvuyWRdlE8GpCMrmEhjl+NSp6suegwIgAFFD+3YWZdPTe5UUIeCRu6wqN86wSIIBqg4XvVTEI9CNJcAxmkj3TkBJpIbWg6beOGSECL2jsWB1GOpHnZOKZIGsxd5In0K6HwLNV2OdMNTCpxFC/bLbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787152398; c=relaxed/simple;
	bh=MspQfYjkNKU2aisWJVBn+usjt36DwQAF4r0yuw9VnlE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qDGRBBNSku5wIaz6bxrDNw0g9/fZ+u+S4Va+XESHdmL2zi929+xXnxkFm7T82N4znT3EiIfnL71N8qOjVypBtHKrDtdDqmshlj9T3LcGqqqJRaKYLrOaSkF9kBzhrPWnhUzhONbhIqf9B5e5ccrtObG8UFXS+b+wHPoMByVrq6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frn5ZiPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKq+klnp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frn5ZiPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKq+klnp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JF1koK444678
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	X7UA7Pbmz7/S+O0bQY8mO7qxLDV27cSL+jSNTx1QVSc=; b=frn5ZiPsJyk74kSD
	oClY9Xn045UamMRBzkCkZSBWtvgcUj1kpgbWBCW5wJnpKNRULESfKHmGqQ6Ybqz4
	9sln/AJz2eR1PEBox5BK9Hir82OEL6Y4Pzau+K62kxIx/0p3QJ2fnDsGVxiASMjG
	jxULmK7UohMFDu93htYYJ2SN6EKFGwpdiRz2NpY/lJODZA6J0iYDUpWUl0Kyujh3
	5Kt0Sjwuf3nyO40fsJ099e3GXx+3uzGZJsdNu8pUShNBXgkkpkbyT4oRyqwzadof
	kGMewEuVNHUnK78L+b6BZXMDyaB91SVMRrcLR3gsqkE3b9uC0HxrVuRKBJVZ6wVf
	Nq5bqw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5es601rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 15:13:14 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7570225606dso24816137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 08:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787152394; x=1787757194; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X7UA7Pbmz7/S+O0bQY8mO7qxLDV27cSL+jSNTx1QVSc=;
        b=ZKq+klnpziXs+LODvNiMM5+CJ/aBQTjUWBsRpH2pRPalxQsnJJ3zfXVViqPqSPxK37
         CwHbMYUHrNoA4vmdIc+wTuGvD9UbTS90ky61YfHjpOqbQF7gw2lylZzPEF5rBiVFuf8u
         A1BVviklu6o/9o8v5JOKX0xIMPeENzp585BKTwwtIwpeq3kRSXCAfepdGII+krMJvi4B
         NEwRRdXMsF5gi4BEEVoBZWhtjQh1KWPjE3/ksh/rPo4yEshMLOqZLsAv3CtX8miToEz9
         EyE06IPkXjfu7jLmO9ViKWE+63cj/jytI3yk39dP0AyZU7VSKQzT+UVRtAam2srGX6th
         8VoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787152394; x=1787757194;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X7UA7Pbmz7/S+O0bQY8mO7qxLDV27cSL+jSNTx1QVSc=;
        b=akQs+xkbpIQfPl/bhnJNHQooPVffyyZtl+xn8pLM0Rk3EeWUBV/ajTPjb6EuYRo+PL
         wQ9YsM7ELc6tpeEfnZuflHC3KVMtAdAQwiJWpUDD/XbONTRF8F8FKmCnL/t+TzolETVp
         4xW2fLo1PLayNQPYmdnIkJSNA9gWzr2K9yY3YN7SBRueg2+ZUBfqANrsBCQ/4M5VpK+I
         F4VX/WWl7Yi0kqTGBWmKMMJM8E+GAj6n1RiD0kzeaO/VKFuzB666w60C7mCBlzH7RgsK
         s/X42NiSCVPjjev8QlkpghetyPNWdhDzpia0NW6s9PexPYYIaDBeSTqfXHN+g++PEbz/
         +HJA==
X-Gm-Message-State: AOJu0YyDoutLbJ+Lzvr0E4lByEiXNoyIY4yX7yHVdnOS4n5hu/bpGYoG
	CmCxZ1JdDrR9J8vPViAkDMSFS3jTzSiGQY5i1n16rrooWyrftFwpEJ7Ea/VRdlvW2NqNF0jTEuS
	Xmn5OzUMaArOv+d5Mo9UqGFkY56THRaA0qlueUQvuNtx9ai1V93GRiX5Y3vZom4lrQo9+
X-Gm-Gg: AR+sD13hx1RSf6QNNPodf4xgXFuxX7OXu0nO0Et9ki0VN23+8P+K1tAd9aLd6M6NldQ
	jbgczkVO1BMudIaAFc1k6Fba43NF65P+xcM9wU/Z4maL0dffiM3Ol7dSemxk0v7gAZTDoBJlqd0
	gyaBrg7QB4map0+h+BYVAmFjROoAa1+uOnnm3NH6ucYGQMpk3GKdrPyAL39ZdCBk0lGxCgY+lNp
	zmPNzAORxhH0JueXOjAwC7HG1Nnip2blFYKkC8aRQ/nQ7Fzv1HqLYwH9SKxm0c8nhMsao4+EZ7w
	SKPTXtaCMyDRl0Hs1pTIbti1ycOfsYgo+KcBnssVFdKjuLyN5WpH25vNvFWiqz2Uv4E2QmSWHqz
	+JPw/9AK5smDoqe6jj6rI3gHg
X-Received: by 2002:a05:6102:14a8:b0:778:9d46:6dbf with SMTP id ada2fe7eead31-7789d46e53cmr372430137.1.1787152394268;
        Wed, 19 Aug 2026 08:13:14 -0700 (PDT)
X-Received: by 2002:a05:6102:14a8:b0:778:9d46:6dbf with SMTP id ada2fe7eead31-7789d46e53cmr372419137.1.1787152393762;
        Wed, 19 Aug 2026 08:13:13 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3ff1563c5sm1111546a12.14.2026.08.19.08.13.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Aug 2026 08:13:12 -0700 (PDT)
Message-ID: <3e65e037-219d-40c9-b205-3ade0974e46c@oss.qualcomm.com>
Date: Wed, 19 Aug 2026 17:13:11 +0200
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
X-Authority-Analysis: v=2.4 cv=E5/9Y6dl c=1 sm=1 tr=0 ts=6a85c80a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RSv7_VIIX-cU5JMv_t8A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: 3mfFkKOlB3x2gGVX0VrSIB1hA8llogUK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfX+ctfAc7mGKf0
 E3QcONYHuTbajhnT1t71nuqgWyw80T391xo2Kc36TWBfasGDE/Jh6cgOSEg2PsrOP7/fI2Z+qT+
 ZwR+VtCdXag55iD/5txip/37Gjd1GDsHavJDI26RtBjZUwt0MfG2z6YRJEFP7pUwLtFKFBbYM+/
 iAXhOfua45cPAJiHZHAnXD7QN74ETL9xH+LdmcDSlPVPyOdY5jo/M0WnHSGmU/olDbbMF8rCPvt
 /PcKaPRQH7qnnbp67grlY7OSQHhRdcKCEbSlSXbO6AOWlzsEqkVugeerB5/Pn81ZZLda0qmjCJP
 Ioep0ZcnvnHI91IFBHh2pBGtfz4PjsflNWq6oN11k+0EqTWe7YiUc27J7wFQ6Z2LqWgTTbb3C+J
 LLLuPdXPSlTFScw4jwugsJSNfqh+ntfL+uutfTUkVlam3y0f6SJ/rPe1Q3DjpH/dmKIt+YKweXb
 jiMTwEWUts/+nLxq7+g==
X-Proofpoint-ORIG-GUID: 3mfFkKOlB3x2gGVX0VrSIB1hA8llogUK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExOCBTYWx0ZWRfXxZ2/cEC1y87/
 YzfJhPXwdN9F1x5n6SSabsY4TzgKrUV+Y5rL8wY8ZeLm7PHgF92yBLsaywxIYvI4gX0KYyXL3yI
 NblqZ3ol8kIzhZC9YnSirlmyxoaUojU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_04,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190118

On 7/23/26 3:24 PM, Alexandre Hamamdjian via B4 Relay wrote:
> From: Teguh Sobirin <teguh@sobir.in>
> 
> Add initial Device Tree for the Ayaneo Pocket DS gaming console based
> on the Qualcomm QCS8550 platform.

[...]

> +/ {
> +	model = "AYANEO Pocket DS";
> +	compatible = "ayaneo,pocket-ds", "qcom,qcs8550", "qcom,sm8550";
> +
> +	aliases {
> +		serial0 = &uart7;
> +		serial1 = &uart14;
> +		hsuart0 = &uart11;

serial2?

[...]

> +	fan_pwr_active: fan-pwr-active-state {
> +		pins = "gpio31";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

This is already done by the driver via the GPIO APIs

[...]

> +	gamepad_pwr_en: gamepad-pwr-en-active-state {
> +		pins = "gpio52";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-high;

ditto

otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
