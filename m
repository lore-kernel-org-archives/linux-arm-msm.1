Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC183EF646
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545275; cv=none; b=tF83Oo7UDe4tshSc4tqHq7K4AYn5EY0KGJmfc7z3ftTmGeS4CkoNS+pmF/GeNyr69s88F5PqRyKOv5BVBSBxiS7QXVHnPg9a8et5lh9vNMVcUMsDFj9nIX4u1NqneQmr6GFpW8c9qXponoBLpI4f2LQmMteX323/WZITZgDYY1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545275; c=relaxed/simple;
	bh=F0Id2R6D4+6Q+hVuzbFirx8hTiaJFLEnYlVLbqt10Hk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PikKdmXRi6P09fKjvleQKG5ccpjAGL10VDYt/W66WNDx+HmGsvERj4aize+MyRt0v7NOqX/+SQ/1+TzZaD2OkVU85Uu4K/c3gdGNG4Ms4RDbMWGyjoiFpk/PPSfuKn6m3rrrFO7D1t1drJBqv+ORnEXcwv1Bp/vH8ZfSzXG7J1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oYp6F/dK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZF/6bFXN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oYp6F/dK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZF/6bFXN"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66KAvPi72421528
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 11:01:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dm78jN1c7v4bXT5XqpGozBlgkuCf4buZm6eYnX2yRpo=; b=oYp6F/dKMyw1NsTS
	OVyc5jruDmHjTqPawP2hRiY8FNGR/zosydBPSdQSFm0myZH1ykRC3fdJEgrnW5kh
	Oj2QO32yr5dJljXtVF2JEEIxdvdItfxnkU1db1VYPbzC/n4LoULf7lM0Ort7RnSZ
	0eMcYKrUsOFmwgmNjalHdGrPNIRiOnKdKVsJuMPEx8eIy+2CDxvxJqc6FpPGpaSd
	kCaE79JZ9LjtfxDT/laPg4RYhFvucpoQzXmkRESsZ6cbZl2MG08sWRW9k5S5K0+n
	9Dcsjnpubo0t0hUPc3IHQ6en5ISERRmBKHzgdIcEHrF+JkunU5aK9uz6BYxBO8Mk
	C1v96Q==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxgrbc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 11:01:13 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-738f59cca12so191354137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 04:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784545272; x=1785150072; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dm78jN1c7v4bXT5XqpGozBlgkuCf4buZm6eYnX2yRpo=;
        b=ZF/6bFXNf0dvFsHCydCVUh+PSyWleKjk1QoxggfSdTINAJkwyQ1TgB/u/fXSMd8NUK
         kPkcdTUF4Bkk0K7Bhf6J1p2eUPQImlsm5PWRIflv9i+bQbTZyBSTrXI6sjv3SAYECbPm
         xlH59Or3ctjbusbThkjRZWgpZh0k1peNEjuorqMm4umVevB2XSVw5sVFtPIuoDuBXDfw
         ATwYrnuNB9c0aM0GK2UI4twLr/AiHUESYkM8dS3g9AQ9JXiRGJ/6QHIPvz3OgmGOwgtt
         ju8Wl0aUmWL+Mlq2OF47AgLqYXc86olrgtR8eRhctI00oYry/zTOQsn1ylYRHYlT8prX
         Gu4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784545272; x=1785150072;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dm78jN1c7v4bXT5XqpGozBlgkuCf4buZm6eYnX2yRpo=;
        b=gBCFzJCWh+BZCizfSXSamEXdH/KmmsDUHOb907JV6io2HEEpHsiqYIMea79OFUJNEz
         n9lNSfGa4XyEOC/Q8wwuv4aeSkrGMAEPc5Cfn1fC/KFem7CzwerRFJknwI21G1E3zVII
         pewfdHN/cHQfGQTRIxpWJI5Rg6p+kyS2YKHwIyEB+rBRbaJ2r1IIP2meYU0nG44Scgmd
         ntnaxHPp3eX860jnSRrrdXqF5kafwlNXtGwDymJKS4hlZBmtn2ATHVkUnDFMPXyqeBKZ
         fHuYdcniKeAxlLx3cJX+0nH0sIbprhASGBK/BRAfLhWoz4Y9w8syvn5cHIvav/5fuj3z
         q7TQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnQXYP5Mn2Ckg15wvJFQgwqYYAHfCBXFVrtRWIXkUyYUBBxr7GDshiCw9mt4EnBZGVQd+HTXUwXSswrZsS@vger.kernel.org
X-Gm-Message-State: AOJu0Yy34mZKus187PwGQhUcNdZaUHJewZyYV/4MPGltqPEM3+QPq30+
	lj/78iX7GFd05fDxEOF5SPBmEHnvgGVWe5fh8M+9busTTI5+prvvIp8qxbOZ9DjIR5xbZ458b4b
	YI8pwvPiKaff1ivCG3u5XsmYb0IWh4T5bfLwKr99iklhJ+RGCqEKZO007Eo1c3+8ZEFsy
X-Gm-Gg: AfdE7ckya6MXXQpu3fMkmREdnu2c8iEOT5fK6d9TDa1Kxx4N0FruD+TpNQ31u3426BO
	srhcbM/PCgYaw1rJ8wu2qwiU+WYs4ZFywQtfJRTxUJj5RzKPvnJeEqqPP0xkdwSC8llBp69Dvss
	r6ESHVDqloyssEbTtAAbkCb7AjB5OF89xNmuUwPLtAqe3euWANmuNjxmxSFZs5uMqGvhuKRHZS/
	V//YPtIGHL4ReSnFBd1WlwPLQxG4m9JzY21G3+KX9wSO+oFCL01IaN26VtesRVe04QZrOSo1pwx
	bY+kPv0noG1y50iERutbx5jut3QeJExAcd7M2ZWcdZFPYsLLxiBKzusD9mKMESoFBYBxxx/LFLz
	9dW5OoFOI50+eEBuQPOKWZ/uP
X-Received: by 2002:a05:6102:3ec9:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-74ab474f916mr11107137.3.1784545270325;
        Mon, 20 Jul 2026 04:01:10 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec9:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-74ab474f916mr11083137.3.1784545269637;
        Mon, 20 Jul 2026 04:01:09 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009add9bsm448168966b.1.2026.07.20.04.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 04:01:08 -0700 (PDT)
Message-ID: <a560a3f6-0bc7-4245-a5c2-b5d0f011e087@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 13:01:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/2] arm64: dts: qcom: sdm845-google: Add dual front
 IMX355 cameras
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260720-pixel3-camera-v6-0-afe419bef476@ixit.cz>
 <20260720-pixel3-camera-v6-1-afe419bef476@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260720-pixel3-camera-v6-1-afe419bef476@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5dfff9 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=osP1sAzF5YgUTzrecnkA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEyMiBTYWx0ZWRfXw3Iy6xSQSE5Z
 IjBF/8JNsAcSHPYBDSYyV0BxoBxVnqi0vHF3wVz9ZqrKrFMsykkN4LNXWgIPt3VrwQh6k1WN2zg
 4/f2jL4s8phEwyNv8hucOdmfU8rnzFE=
X-Proofpoint-GUID: iN5R-nCnw__0V-vaIG3QfmroUw9w-Djn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEyMiBTYWx0ZWRfX5hXGq+n5dPKE
 3yIAQ4IIgUMU6Wl2WVfZL/zj1fN70ReYpSpg40Xz/RId8I7E1eviwHgtBkfTQI6D2tGsB+PjSt/
 zq8dF35r/ZyosJ8KWr19kVdLMTh9auGgz5f80ixYWiXpCwN8nynFcX/SEFOro70pJyliN7FPGdy
 30O9U0dTuZmD8CyYKCtnANVSQcq6ZzrOmboznC2kbOm9hji+MTZ1fmyzlwVAcE7Nie0Z7XOHzws
 4kIqiF6rbytV9OT9K7Uw1bGaB87IICoADM88lu4p3/DTB5ts4GoGqT+Y1vTkqrrsy/dIPWkSgQD
 fueASf9FBqbgVGjGSi+M4nLvFZ109RGM7+o6lBHW08O7bsVhdDEP6iNvT/Fv4p78i4fjjUDLtH2
 zckxdkc5L6qJdpwOeGnvT/jBp+2UKNgfMEyonPmomScQdeaCLo7HI81d6mnA7hvhKl8LLA2zwXG
 UZvjP1nZqcNuoze3Wuw==
X-Proofpoint-ORIG-GUID: iN5R-nCnw__0V-vaIG3QfmroUw9w-Djn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_02,2026-07-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200122

On 7/20/26 12:53 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> The Pixel 3 features two front-facing Sony IMX355 sensors with
> different focal lengths (standard and wide-angle).

[...]

> @@ -127,16 +128,48 @@ vreg_s4a_1p8: regulator-vreg-s4a-1p8 {
>  		regulator-min-microvolt = <1800000>;
>  		regulator-max-microvolt = <1800000>;
>  		regulator-always-on;
>  		regulator-boot-on;
>  
>  		vin-supply = <&vph_pwr>;
>  	};
>  
> +	camera_front_avdd: regulator-front-cam-avdd {

This is better, but the regulator nodes still need to be sorted
alphabetically

[...]

> -	/* front camera, imx355 @1a */
> +	front_cam: camera@10 {
> +		compatible = "sony,imx355";
> +		reg = <0x10>;
> +
> +		clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clocks = <&clock_camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		reset-gpios = <&tlmm 21 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&camera_front_avdd>;
> +		dvdd-supply = <&vreg_s3a_1p35>;
> +		dovdd-supply = <&vreg_lvs1_1p8>;
> +
> +		pinctrl-0 = <&cam_front_reset_default>;
> +		pinctrl-names = "default";
> +
> +		rotation = <270>;
> +		orientation = <0>;

https://lore.kernel.org/all/20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com/

Please use that for both cameras

Konrad
