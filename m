Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE0A422522
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 16:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983108; cv=none; b=uiVJKc2w3+1m5rrBePzzHfFC/lIrG5lCp7chh7mK/n62VFbMh1tVobNLQn3uXkKkI0J35w2jp+kTgY3asMaO4HJp396jg6WyhpJdzaSIBwvu6Y9n20PodX8NOrfPmxaHl4IqAzCdPm20PchRhFaF9cP7QtvjbPe6rXq4xVexA+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983108; c=relaxed/simple;
	bh=ZCnRDs54/RzAn3CW/87vEuwpMWxe0AAr9tAqd8iWrtA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsSqPE1bag0GQiwSX0IZv1O40nkKloh1JlyHiatywK59A2S5AqaT8x75DY7cFPFx5TnSBZffNso2oEgy0HgJAVQ57rOrDmo9qSUdp3kXRHb1ZiMSZTyQMhuefShn9nZIupGzJR+Bv4agYqfhAqgxoGwut94eRrHG3HXUxsduZZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SYMJ9+5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kST4Hi7d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SYMJ9+5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kST4Hi7d"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFYsCU2263764
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 16:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hCEW9PijxcxcfDGLUs2wXu9FVF2tflvW7F00ZTIwITo=; b=SYMJ9+5/prvFR9FU
	Nc+9hX0jILZbtwJJq8R2OPfvgvxrmVy9buPD0VzoMy67kazD5AyccBWfcxu3g2Y6
	ag1hpPVQJx8hUd0/Z+6S6EmA+W9x8OLLcUUSrQVr6zEA294y8ZIE7QGKRiwsV/mp
	eml3FFsZa5OKBjCl5InoRlZqPZNtnhl1EhPQqrLoSul52jiExCljRLrdaYHUeYN8
	vkcj+8QBNUMpbmrX5nsWo/1wiUaV7jTJM1rjEXxwbinxv4dY6cF7bo0cCEgGBuoi
	eNmz9X3E/ACF8qy4zz6MKfCP3twfMgV3/K0WGadU2bAecXoTU0uN024liqYdxk5W
	RaTUhw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7hte2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 16:11:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21be5bb4so9850841cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786983101; x=1787587901; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hCEW9PijxcxcfDGLUs2wXu9FVF2tflvW7F00ZTIwITo=;
        b=kST4Hi7devsxlU83ausblihnjrfHyYS7Ir324ULTqGCfvkWhDu6BCmPsFPOo4+e3y/
         kL2keGOIy+dlhmnpmxS0CSJLEU7wodzncZQgyh5bWwRSqfHgbFISL0prQgEkoRFwX0lo
         4uLTYBF2nq3UguIP7RpBtcPIFVFGMA9uz1cyuC0gdbZq7u1/tFJmEQ+Znup8knQZgsn7
         F7EpN/ahIGVd2vee+/6P7qBM4UgNRCQh7U5tygf7lWE1kGoySD1n/g4bW24rV8CZ1Cpi
         G0aZ9G0L61edNMBhXxZN2MFftuQxIele5vaV7V2KjWA4teDrdl3wfasXE9UFyrRxW/v3
         YuGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983101; x=1787587901;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hCEW9PijxcxcfDGLUs2wXu9FVF2tflvW7F00ZTIwITo=;
        b=p63aAzy4Suclr9cfWuLT07rO/4J1kR5jj65P1a3V687z3WO5Iwd4xL7VsXpgwXQ9wR
         jvrp6tftcg3m87jYw5+wklikcw3qbWDTIlB1uFrZvpuSoMcr/eaKNK9sVkAZLnXNZ4XX
         XSxR+fW/I4P4T1bohizijSnxxRObofqHRdT4COJ0Po0FMZrBWAACdnD0OxrqvhVm3mbZ
         +krPGXNpu755Xlwl/ORGMjdttMPse2OGmjRDsvleObXtO7kNcjKSG/Ac94KzDAgL3Wp1
         MRuDl94/O+CbyW+ix/EpPHZbU/ERNn2+YJ7PqWjAP0zT5/C6QZFZr/Q3bWfhSACgTxnI
         cmLA==
X-Forwarded-Encrypted: i=1; AHgh+Rpv0ZsxTIXyxkXJwUj6hhkwm8Hpta4xCPV+BF7rJPeLXhYk+czV58iS7tpKFV2xoe/n42ITKIzk1atDtJnh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx67A1ODnrZOk6R3QF+YiJjGKlL+quKo3bhSnvAaT+XtXsHL68W
	jxKD8ZHrDQe9IBzYBvmiUJqMEYSWaQYIxGidRBvNXI72D4x4jNGDsbEC7S84swe+X7obx8bcyiz
	koS1hiqqQGSwPZNI+Dyn94nx4nOrjq9JKCCybd+g6lvafAV4tlMP4d3bl92pcecsssPMJ
X-Gm-Gg: AR+sD11CycS6GSfTWtoX02Nje54qM+vAN/F615f8COua2ElSy8CSBGK3lHi+otJ6/zG
	Fyl9i+zRFk1CU8KntFFJzXelzQyctfi2WapRXsByWkdWR7BUtItLcZMB45rlkEZj2X+rn+TMHyb
	rA4OX3bC/ct/gVxuIjGiO7nxio6QFRN/T1nrhU6MoH+Nt49jFhZa6VVQWJ7NfI2SYgb1j2N3H14
	+FfF16+LI2n8v+qazlDCl/uQzDXywhOrN3eEkHV1pmkBlNJO44UqOOQN8CHvvQiLmWPczqiO6pu
	MF7NuGeycCb8nxViQz+Zcc2J5VzXcLEWIej+FV6OgwAnlcH2ZsgjD7CBzVdne1CvpCFchXT44t4
	RfEirkze5n1fXMsKAzwuekA7O
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr180860221cf.1.1786983101415;
        Mon, 17 Aug 2026 09:11:41 -0700 (PDT)
X-Received: by 2002:a05:622a:118f:b0:528:1ea6:eaee with SMTP id d75a77b69052e-52d852b4f2bmr180859571cf.1.1786983100874;
        Mon, 17 Aug 2026 09:11:40 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2185b74059sm46995666b.38.2026.08.17.09.11.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 09:11:40 -0700 (PDT)
Message-ID: <bcb5ff23-cbcf-48ec-85c8-613a7d2dc515@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 18:11:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: Add Retroid Pocket 6
To: webgeek1234@gmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260808-rp-qcs8550-v1-0-a5a365ba3dc5@gmail.com>
 <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260808-rp-qcs8550-v1-3-a5a365ba3dc5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEyNCBTYWx0ZWRfX0L8xKx96ZaV0
 oeyl+fsBCrh8Ima24F0jcX9TRTidQPqwLbc2Dqtr/fbKNR6A+7QHdKy2Qr8mIdx84ablNqMTxPl
 zwnPhE8NaIS5jh1fJFLQKiMQKAQgadc=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a8332be cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=A2ZNOjL2m-qR9UimgZsA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: KUlnW1fnorpDKg1m3QhhntlrdyRDrXQ6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEyNCBTYWx0ZWRfX8lIj7n1Dz+66
 M9Exe0X8tKU0yTtu0MtVEwlW2zeMFi3eM89lHj7Op7kushWwDNaYMz/qnDDVdlIu5lKrho97qml
 knKz4b6cNBrzI4K4erWZ/Gq3S/l/COR8x6/PMBM15bpiA71C8LznttBKYvmTqZFe4GrlCyvWPdu
 5u9ugzQoesM2O7fNydU9f0KLcYlX4zOBI9KRIp8UK/5gi64L83l/NCcgyEIWAEoXIUgHSTSUydP
 JYmNAO9v57h7dTErWlVd1hdo1Z/0UGgX19VduPzR0PrIPbEQIzLsJH0vtsco65IGKg184v04sD0
 09WUmIWh+JtjROdBcPfGOQcAoF83xg5ZiCydnRooNa85qr+tzQuqk53SSZzWT8bAWAR9iJxvowo
 6XI6Q9dZdGLeXh8AAfodN00OLumNqGaX578nX8B/glVgtrlwkMMcFH4nCqBBD4KwODkwz477WK4
 h0eH+f1dyyeQL+V/fGw==
X-Proofpoint-ORIG-GUID: KUlnW1fnorpDKg1m3QhhntlrdyRDrXQ6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170124

On 8/8/26 7:37 PM, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
> 
> The Retroid Pocket 6 is a high-performance Android-based handheld gaming
> console powered by the Qualcomm Snapdragon 8 Gen 2 processor featuring a
> 5.5-inch AMOLED touchscreen.

[...]

> +&{/} {
> +	model = "Retroid Pocket 6";
> +	compatible = "retroidpocket,rp6", "qcom,qcs8550", "qcom,sm8550";
> +
> +	backlight: backlight {
> +		compatible = "pwm-backlight";
> +		pwms = <&pmk8550_pwm 0 860000>;
> +		brightness-levels = <1023 0>;
> +		num-interpolated-steps = <1023>;
> +		default-brightness-level = <600>;
> +		power-supply = <&vph_pwr>;
> +		enable-gpios = <&pmk8550_gpios 5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwm_backlight_default>;

property-n
property-names

in this order please


> +&i2c_hub_3 {
> +	clock-frequency = <100000>;
> +
> +	status = "okay";
> +
> +	touchscreen@38 {
> +		compatible = "focaltech,ft5426";
> +		reg = <0x38>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <15 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 14 GPIO_ACTIVE_LOW>;
> +
> +		vcc-supply = <&ts_avdd_3v0>;
> +		iovcc-supply = <&ts_vddio_1v8>;
> +
> +		pinctrl-0 = <&ts_p_rst_default &ts_p_int_default>;

<&foo>, <&bar> preferably (dtc treats it all the same unforunately..)

otherwise largely lgtm

Konrad
