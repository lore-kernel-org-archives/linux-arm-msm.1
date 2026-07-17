Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6893A7F52
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:29:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276955; cv=none; b=Gah6T0hYP4duO9FlRO9qwJJmP2zL2ke2dNLx2+e+D2b21AtAyfWZN9D10b23zO6bsupivzvH+4gjSL9yBrv/AXLvkO9LsHyXPuwlmHKm3rWmo6ztUecpFpQUiIkA3t0GE1xFzg059Qp8V+wgXfWLsQfY2cnA3Ar9Lli+FaUmwxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276955; c=relaxed/simple;
	bh=XHQkvrFG5T2S8ijnYl+4ZUpmxZfu64VwzB4quL/2CMA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KWsSYjJJ/Gu3LPcCILlpu3RbhZ02yVBKa9biG0RWTBWiWDiANBmCkgOyou8qcRlKDsB3Ce4HMbU2SiG6oKUEx3+VjqgJlw/f7PHcqJXVPAh3HxH4V3irWx6p660ixKNTcE2GAQZXTg4/6MGoWJR9mXYXvOmbrKNhQJUkRvv0xNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRWegktm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cu4cDk5A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRWegktm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cu4cDk5A"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6ckAv1093258
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Fmu+bQb1TJwfio0K9UMpARdzxn+Iqqs6XTDcD/Ppy9E=; b=IRWegktmjujjXCt5
	nVNAa1vk9AbfwuJIr1FWg17gB0wzVvBqhKZpffnPOJGKvN6rO83QR0ADBB8wLEVg
	BZsOPXzTudPPKvuU1yuiLbDiNZ3GDyo73VTZdlXRV1/ITwt02cz7/UkzKt7kg3yP
	TL7xoLnajfOl/kbeyyfauC47p8mMwRcJZ/D2nISw00r2BN2Y1AuDQ3dYxl4q2lBW
	WgqQXAKdpobRFeRWIVrAmeFWJY4fOFWu+dnQs8JCMvZIUJtMKWMujBmwLuXOfW7j
	v7mlDPcKo5a/iYYPU27HUnoJ7BF5wIc1165IJ+C6Z90xOCUGSHXdLZM+EJ4SPIG/
	uIgA0Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffe0urqqk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 08:29:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e6415f279so119877685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 01:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784276952; x=1784881752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fmu+bQb1TJwfio0K9UMpARdzxn+Iqqs6XTDcD/Ppy9E=;
        b=cu4cDk5AiYEQiQHTb2IwKL5k41v/gipMIm0zcOVI8+xYJxTch5upiPLvHIsPF70Br1
         USRtAC17btUtisq0bulH+b2XKsaX+9+bv0Sa3kgmxNL15GDLPbPkrmSzmXYv/Avfju4e
         rk84wkdT8x5Y/PfZNeiYNUzxHMmn+l13uD03pb7QFCB38b0cfuR9JvyYDIrLwZAW8N+H
         iv70BKlXWaIHgR+pVNzoN5CWqeiHkycCAhFn92J8wRShOZ5Zethf6lYpDaZAl3IfaeB9
         REFttCI3DiZISvaqZalmZpY6W4E0S/PM8NJbO1p1JfJEIkFHqi7psffYU712UGYmI+vb
         lUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784276952; x=1784881752;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fmu+bQb1TJwfio0K9UMpARdzxn+Iqqs6XTDcD/Ppy9E=;
        b=Tv+n9OpGw7ZbCReiy9QFfC3Q9vGZZFaaNMKdbUbtdAXLiOlOtNIEYtaPfiV0C1Pb7K
         8WWrreRozjyRH5h8JM1Z0F5ytqrcAo/pg4bbIGKaB7gl7BMR7icjU3XltLadbDIyi7g6
         Bz2UOsiDBp3kCzRbOER62R+J4jBD8p9d/uAdX+4F/xIPTx6eC0R0Xz8sn4eDH32vOTJS
         /5Uf8PkFda5m59nXLnNtIRucedwarD2HBwf7/mIW4RS7F7GZe4KcCPzpPMHh/5xJvfns
         wpFa8UuDX7cv6JyU3nba6EQP+3NvAo8OZfrwqAWErI7scjRsV0nM2+KZURFKCbwqePbY
         E92g==
X-Gm-Message-State: AOJu0YyGqnS2IEgjnv8M0eEDq0r8BT+/FfVmywK1eXbZvxb1CwY1soff
	O9JrX7uQs5CJE+4sE3032qxa4ZB+HcTBUyriKcmC/djEvN1QHnnYLclb4Oyvt/ZO2HD5SgLe7WO
	TPWLAkyXUYcw1ElZ5JexNxCHN03EakhiO9SYZQ2+cw8ANbql6qERaFNsCx0Ve/PV6MFEB
X-Gm-Gg: AfdE7cmEl5NAZOiXslONoX7ugFQq3KRjGcDVEDMbtK+7ioUbT2+slD2aTWIhqVP3BSs
	52PCUGcBOoTqNdbZ1MH+zz78Q28A+3Da/h3Rtul/Rl7lXdkJnDvbLi3hH4/bYlO1rPmXmNcIj2c
	2q2x1OyXDBSNwMiDeT4aG8on36tfI1jRCXBjjsdE2Bl5Y2LVubIdPqR6NRZWhGInnUrepv31ZbH
	zGgSm8Lfe9Bu/Z7daNjKg3A/z9KIrJ6fZ1OVpJLtAxWLsNhnwWoCydkf6IhR3xMCMjXkJjEYZ2w
	8ymHOF2DCn6uLJPd3jYXgc/WZ09ZS+q+4UoKCSEAvnbTJvIZn2MlFMZ0nhk7jRyVB3zSWitZr0j
	cwa9KckkS8YVHT3ajKVxtEaJp
X-Received: by 2002:a05:620a:a01c:b0:92e:5ba4:b841 with SMTP id af79cd13be357-930b435ce40mr103652785a.6.1784276951762;
        Fri, 17 Jul 2026 01:29:11 -0700 (PDT)
X-Received: by 2002:a05:620a:a01c:b0:92e:5ba4:b841 with SMTP id af79cd13be357-930b435ce40mr103651285a.6.1784276951338;
        Fri, 17 Jul 2026 01:29:11 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1724f50becsm39447666b.52.2026.07.17.01.29.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 01:29:10 -0700 (PDT)
Message-ID: <8dba00d9-65c5-4891-95c1-67f55664aa79@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 10:29:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: eliza-cqs-evk: Enable sound card
 support with WSA8845 and DMIC
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260713121816.2728888-1-ravi.hothi@oss.qualcomm.com>
 <20260713121816.2728888-3-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260713121816.2728888-3-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=deWwG3Xe c=1 sm=1 tr=0 ts=6a59e7d8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=7EP1xt7OIBNcW748FNIA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfXzFFs/CEYKRqJ
 FiCCeBmlC8xFMK9e21xdZu2sFp5vNCtTViI4i85x/Ly7ZWy5YnDZZ2j2kCrAgL/IuiHU6eZHHFv
 +w8sJ/VO2zvNeTU8IDluLuBXjIGcH/vrqAkeT58t9PLdGNe8CprQUMAqe/PohOvpvVgdOA+v8yu
 6L7pDjOGr+9ueh9KN4hyxlbptJFcQ300vdDEt8HkPS8AagxDcugG5SgvgsM5bKTm4kBPURZjdKS
 hwF27VRpl6Q4UkQSqf6P+wxWHm21A3HkILSuYFVEP13SLC/aVOXhWXHkj5mQY2R2r3hm8FgHLxT
 L+SwJ4BzZnxRzzTlkxVNELp+L+IJyDJGjAN6miCZYZxsi+zvBMmyZkcDNMAnHdVLSr9TrW9ug+n
 IDAc4pzCIz4idnBwhxecj36FHll9AFHfHEkI+ENb+N4tPoLrJBhylUTUcTJSMGjMCUQzhFHUXs7
 aJ48eVFHIUi5QIPF0/w==
X-Proofpoint-ORIG-GUID: eB1a1T7HU72gQsTkVfWLpDoXrtXJ8q67
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA4NCBTYWx0ZWRfX4Bfc7S2PjbBQ
 PI7lxv83d//1RthX7VwJ5F/8xCeQE2duJN1Ygm59O3qxuSEZyQJjoRm2ayTqpbubC4Fw1tO/i/s
 4d9GYCvRT3/8EK/8r27DtdKqvj2XibI=
X-Proofpoint-GUID: eB1a1T7HU72gQsTkVfWLpDoXrtXJ8q67
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170084

On 7/13/26 2:18 PM, Ravi Hothi wrote:
> Enable the sound card on the Eliza CQS EVK platform, including the
> WSA8845 external speaker path and DMIC microphone capture via VA macro.
> 
> Enable the required LPASS WSA macro, VA macro and SoundWire controller
> along with the necessary pinctrl configurations for DMIC and WSA
> SoundWire interfaces.
> 
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

[...]

> +	sound {
> +		compatible = "qcom,eliza-sndcard", "qcom,sm8450-sndcard";
> +		model = "eliza-cqs-evk";

Is there a reason only the CQS EVK gets audio support?
i.e. is this setup not common across all the EVKs?
> +
> +		audio-routing = "SpkrLeft IN", "WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA_SPK2 OUT",
> +				"VA DMIC0", "vdd-micb",
> +				"VA DMIC1", "vdd-micb",
> +				"VA DMIC2", "vdd-micb",
> +				"VA DMIC3", "vdd-micb",
> +				"VA DMIC4", "vdd-micb",
> +				"VA DMIC5", "vdd-micb",
> +				"VA DMIC6", "vdd-micb",
> +				"VA DMIC7", "vdd-micb";

Are there actually 8 DMICs?

> +
> +		va-dai-link {
> +			link-name = "VA Capture";
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
> +			};
> +
> +			codec {

'co'dec < 'cp'u

[...]

> +	dmic_eldo: regulator-dmic-eldo {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dmic-eldo";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		gpio = <&pm7550_gpios 8 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		vin-supply = <&vreg_bob>;
> +		regulator-boot-on;

Is it really boot-on?

> +	};
> +};
> +
> +&tlmm {

Label references should be sorted alphabetically

> +	spkr_1_sd_n_active: spkr-1-sd-n-active-state {
> +		pins = "gpio59";
> +		function = "gpio";
> +		drive-strength = <16>;
> +		bias-disable;
> +		output-low;

TLMM pins should not assert output state in the pinconf, the driver will
take care of that through the GPIOD APIs

On a note, these normally go through LPASS_TLMM, but I'm going to guess
these pins are not muxable to ADSP?

Konrad
