Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6B1449B12
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 09:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788772449; cv=none; b=XIjnpkMsvebkBgA0s5up6Pl1+lB6hw8hx+3OKsQbzm38I/Eyjs/e0LS+bh7I4dhzFHVn/ivz1oPjQ2uHrlhQHeKV+X2MHe+WxnJtkkqcS3RVVlOO7+NsQxVz6yuCxKooomkmdAXnBf2D/zcD5av5Ajluj2O7Tp5LGHifGbbGERo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788772449; c=relaxed/simple;
	bh=7yBNhNMECRErPKAvAk1dDwZ3RKE97WiF8lbynRTizJM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBRbtiDfMsY6ofvLgm9YeX+cN1iCTFV5oQmZyh2u10uaNh24bleOFf+LOf6KCOq/KLv6UJQNRUV773eQdd4ILUYwL4Pry2SBIEEiLgMLPdC8L1ZXgFS48UYXg4ZZABMkTgm6VVrl2hDKUUQFd5dHaXvoVJSKyYKYxiUlgQzGIB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DcZi56L0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SgrHhre3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DcZi56L0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SgrHhre3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777LaH3363503
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 09:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OJZbMM/2rzCvlHpOBd25lj4C4N7dM/j0qbR2FV0xFFA=; b=DcZi56L0L/3cyJeS
	dCoLsvsT5uBHlPun6cktmEzdrkFeBPYBR1P7iolA/WfVNUCufTemIr8PksypgB1Z
	QuUCVluqhpGrIEF0CNiVuisFFcJacSOP26yF3NNHNstjMF1WRUq08WhJ8dqJJTPg
	TALrWSQnc8XPwJEY0vYBbbIdMluyzTeSKOedOMT5KheS2YkM4asshJtXP2+hj8I6
	QXdhWgymR8xHE6lZaWvCLcMnZui7ndb35yWf9ZLXZzKI6dkiajeOIf/oOF2ZnItt
	BUggUZK8mckoVcbFaa55hIGhDasAAF50LVgMEjZ/c9Edi+PTjLsWE2glT2HrcXvO
	ixHcsw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj183a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 09:14:07 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-9103db79014so10852086d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 02:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788772446; x=1789377246; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OJZbMM/2rzCvlHpOBd25lj4C4N7dM/j0qbR2FV0xFFA=;
        b=SgrHhre3857/7+v35X102sxc6onIH3v9p8sjz6ZV1NDmC5hnA+nA1VYOzErigO1YuL
         p26Kvv2EnS6c5Ek9m5UkvMB7crC071ITeuKy6KXQdtIwzJB2AWGKebpmFEsjrwYFweYJ
         pyT4lVGYLjuHBE6QbFilP2AAITMWQawKJ8GVAQ8Hp3+0gpFhnOSUxlIG2cYgi/9Ln48K
         awp2Vvu9FjyYpr9/LHs+/hK3DnxO1UEopv0/a5ARE1ptqefkTBVTc7v6bJ3Yhx5F64o7
         RuHNlw4n1komDhJcCRPXdn8cLGp31d5CF5Z9m/1IVQC+IpvoPHT/2f3sXv460tkARz7S
         mOsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788772446; x=1789377246;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OJZbMM/2rzCvlHpOBd25lj4C4N7dM/j0qbR2FV0xFFA=;
        b=YjUI0p24uyy8ISwMxs6QZv4hJ4Sd85V0muKHTI40MPmOEs8JxVAvUcMXtfjA9iJzcW
         cn0dGcdizT82DwDYX1XTRbmoAFMBAVV9b4GZtmobni4v6ycLwrKnt/uJObB0X/3b/6vv
         iTkLdxIRSOY2A+pcsZPKmWCEp8TRIu2re6JxXiw/kenzxU8iKoRWhPQ1lO5HxhFYpk/+
         mVOKy8XeNcgiuEegr0gAdfzlXkoVQnrijsEcuH9W6R7nafCv599KeSsv4blhtMiy2qZf
         iapqLMME+OiR4J4tslhjZPwFSJgxZaaewzC2YyP2BzEyg2uGDUOMy0VPIynSdYIOZC3J
         ZGSw==
X-Gm-Message-State: AFuF++kF3gxCFpWO6BhW9RSw97XOqRAPl0AO2WSWHhNdP62YPdC6F5SK
	/076Z13dFkO0gqKeaI1GY7xZjijhAY20wCGccZwUZZZiZ0hZDMAj2Ro8avCOJSrd3RT6BoDdVrU
	8Co6gkyr6CD3JhYXTanN4cmkKvVktDElx25EWIgZFKE2/l7FzOmT3/IWFM26Cvhs61/m4vghv9K
	RT
X-Gm-Gg: AYBFou0LgjCH8AuMgi4q0gVce9S3azO+Wg1wb1ISY8wpPPFYXyvTt8l+FfFbnixCJAA
	/nd/+ukiuR39Txvi9B8iXRw8jdWowN0dc817c0SKZ4hGukKeQqcOqrVakDj5b0AJQVyPTEZvVUb
	kdzzWlmx4h/lNwXc9sciEvYLgAP0SoyxrrhL/7TXiUSlvyoMGxp8aCUlZ+RYsErdxDtJ0RlLzen
	A07S9Zdkx9wl8Y1ilaBxK8wW3ufu0A6OBpXLBti1ORVnygZ6KkC0KTvBCDRF5OFf/SWqs1GFLBT
	1gQPwzyctIcg6c6k/oL5aTC2gwzaTJ4FkUaV/EuWC090UlmxdD93ONjNZXhcbj7fIM4YrLD3ri4
	FHRUfh3HXIRrvtWm0CxFWJQ==
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr717459185a.6.1788772446347;
        Mon, 07 Sep 2026 02:14:06 -0700 (PDT)
X-Received: by 2002:a05:620a:7103:b0:939:9ef4:79eb with SMTP id af79cd13be357-9399ef47a04mr717455285a.6.1788772445808;
        Mon, 07 Sep 2026 02:14:05 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d5b284bsm438969066b.51.2026.09.07.02.14.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2026 02:14:05 -0700 (PDT)
Message-ID: <2c524de2-22bc-4bb3-9c20-ffe197819acd@oss.qualcomm.com>
Date: Mon, 7 Sep 2026 11:14:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Lenovo IdeaPad Slim 5x 14Q8X9
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260906-x1-ideapad-slim5x-v1-0-7ccffbe6bc4a@oldschoolsolutions.biz>
 <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260906-x1-ideapad-slim5x-v1-3-7ccffbe6bc4a@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDEwMCBTYWx0ZWRfX0EpeA1SEQR2g
 melEtvPmQbeTsUMPrfTRErufK5P3s517dRyMW0GjYJRh+gYNVpkgbE7NZJ7VaGy1UyLOI0SeAaF
 +E88avYwWx+YHzefyn0SlMycFrlQQwoyTU+QkXxGDD0GSIaMrvfLTqQnOdmwGGQuM0FHYCQwQcr
 NvL4AX9NxeD9McyHKvp2KU5S7EOuLQnD2xOi7XrDUyW8zGyXBSNCCPfmZ40bTRW7hVpXM6YxoUV
 P1z8z2yiA81IntsQmadnVSUlYZCRgbo8m5vO/RaI2TrKNUqhIpO8vV9xNA99wj9m+vk0JfxqXpW
 Iyb9hvCn4wqlelbPL4BjwvPXAFB4EDyNvWA7bCpTATMenl9sPojss1IOaomg+0P4+/T/tbIAEXJ
 2t4VPCnuYEpulB0wyZWbbzJ2BciEy2hEiA5cM+bND1Gby9AXFO6uOPIyvfLhSE9xQ5Th8teOpto
 x1GjQues4adCNwCzxuA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDEwMCBTYWx0ZWRfX1JmVAJ11erRp
 PrNSwWpsAJjgyKC5C16J1ZIat0TWKMqJVQf9WrkioPJ+U6WMl80xxk9sTvAct5LO74fgmzXzu25
 1kRSqTegfxcHEP7WnKLX44r6uZqTkXA=
X-Proofpoint-ORIG-GUID: _Nne2mZ4ujItnwmSb7iyOgxpi0BsOzUl
X-Proofpoint-GUID: _Nne2mZ4ujItnwmSb7iyOgxpi0BsOzUl
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e805f cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=gxl3bz0cAAAA:8 a=x-UWeAqAqefo9e84DDEA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070100

On 9/6/26 2:22 PM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Add a common DTSI plus LCD and OLED board files for the Lenovo
> IdeaPad Slim 5 14Q8X9 (machine type 83HL) on X1P42100. In some
> regions this SKU is sold as "IdeaPad Slim 5x"; the "x" is the
> Qualcomm suffix in Lenovo's current IdeaPad naming (i = Intel,
> a = AMD, x = Qualcomm).

[...]

> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi_con: endpoint {
> +				remote-endpoint = <&hdmi_bridge_tmds_out>;
> +			};
> +		};
> +	};
> +
> +	gpio-keys {

nit: 'g' < 'h'

[...]

> +	sound {
> +		compatible = "qcom,x1e80100-sndcard";
> +		model = "X1E80100-LENOVO-Ideapad-5";
> +		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
> +				"SpkrRight IN", "WSA WSA_SPK2 OUT",
> +				"IN1_HPHL", "HPHL_OUT",
> +				"IN2_HPHR", "HPHR_OUT",
> +				"AMIC2", "MIC BIAS2",
> +				"VA DMIC0", "MIC BIAS1",
> +				"VA DMIC1", "MIC BIAS1",
> +				"VA DMIC0", "VA MIC BIAS1",
> +				"VA DMIC1", "VA MIC BIAS1",

https://lore.kernel.org/linux-arm-msm/20241203-x1e80100-va-mic-bias-v1-2-0dfd4d9b492c@linaro.org/

[...]

> +		vreg_l4b_1p8: ldo4 {
> +			regulator-name = "vreg_l4b_1p8";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +
> +			regulator-state-mem {
> +				regulator-on-in-suspend;
> +			};

Why is this necessary?

[...]

> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	/* 3d PS883x */

Any reason not to wire it up now?

[...]

> +&iris {
> +	firmware-name = "qcom/x1p42100/LENOVO/83HL/qcvss8380.mbn";
> +	status = "okay";

nit: \n before status, please

[...]

> +&spi10 {
> +	status = "disabled";
> +
> +	/* Unknown device */
> +};

Either enable it, or remove it, I think

> +
> +&swr0 {
> +	status = "okay";
> +
> +	pinctrl-0 = <&wsa_swr_active>, <&spkr_01_sd_n_active>;
> +	pinctrl-names = "default";

'status' should go last

[...]

> +&tlmm {
> +	gpio-reserved-ranges = <34 2>, /* Unused */
> +		<44 4>,
> +		<72 2>; /* Secure EC I2C connection (?) */

Please align the '<'s

> +
> +	eusb3_reset_n: eusb3-reset-n-state {
> +		pins = "gpio6";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;

You don't need the output- properties on the TLMM pins

[...]

> +&usb_1_ss2 {
> +	dr_mode = "host";
> +	maximum-speed = "high-speed";
> +	phys = <&usb_1_ss2_hsphy>;
> +	phy-names = "usb2-phy";
> +	qcom,select-utmi-as-pipe-clk;
> +	status = "okay";
> +	/delete-property/ port@1;

nit: status last, please

Konrad
