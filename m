Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 220453815E1
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886230; cv=none; b=i04aPbc4JzMNnymy9iAGoEUQWTFL6/Tv3bA51OHGG2p3LoRfAxebGFgLT9Q7NBbethhvqp4/Au66kr1gqFAV7T+KLzMqdxsVsPflTRfJjlDpLuuchSSOR/D2jUf4LwouLivxRZZGBW6cksHMhmSxDMNCiqTslD0nYnEO4GR5YlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886230; c=relaxed/simple;
	bh=+PMY/81rPpy21yXKZXoy0/UH4FJLtbQW777OaKV8tHU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JykYjt9y6WxNjdam4yQQzINW8tfM/Es1f+60XvaXmSuR3vrxi5NQN2YgOQxZf6bVU2s9gOuSUEyQBkd+EKimtj6UVrW+sUAStz0aPadfejD0v2EnkX4i8NciFS6MvCJNwAHv+ctqX9eWzNQTlYDr+87MUbCbNk1hlib/cF9fvFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f2tYKyr8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=biLqTe2i; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f2tYKyr8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="biLqTe2i"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8Ld4P3908224
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=; b=f2tYKyr8upCq+Mcc
	2UPh3aLmC+nVXmBww/2aIzDlz5igVDv7ahV1ouVe2dOJfzr0iDMTih/N/apdPHOw
	T/Klz6WE8c9gOERHjh1Dx0qqdquyyR4AhHvhsY/q+hOvKW9P4kgcepMbKI6uo6x/
	YpnXLiwOoaZmg/MGuVNNJUhJQ/Fv9DM/ZJzshTvEP5IMyF32V+kyWgLS8V853jJ2
	Eup1HI/4yBaH5DbmSTDRvFHlBEWc2ioRLc9qiFHmMoHuwXS0oNyN5zHDn6SpReOB
	AeLxDS4WC2aLnxGhGHLqo3qHoMh1xzOrYTLxpQ9yfd5u886XQ7q7dTtPHLfXPtS5
	m/e64Q==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h95xqtybh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:10:27 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-915e9e1a5f1so7611416d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886227; x=1792491027; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=;
        b=biLqTe2ikpLEyLd6DJr32gw3hSB3wIzMVIwEN5CAro4XqQ6HURnH0DYsJ9u7jVp0tZ
         QJUz6aaYk4g1vjio2qBm7zwMSgjYyMP1yUQ+MXF3aNiOd1o2cZXhqYY97VXt8arnYPlV
         egmwgHXV7KHpR8effcXWHClEZjBhGdVUmr8IjdKqkA3HPzvnOwntIh9J+FJFYVwW15IA
         QKpUX/JzBc8rh0QwdpZzLl+LysH9kMPBKqgO1enYC5hLapU+0/iGE5v3oKERkGZsg0a1
         /VU5OtdMYXdrNGa44QdvSJbeCFxBU/OXOV1Z5TLqzJylds28UdC5os9xJu6yO0+Vr4sn
         DlRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886227; x=1792491027;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JaWEQZWW26qUB0UpQWigzCRt6cE6lA4BoKS/zHeTD8o=;
        b=B3TM+9FlnLJfofQtrLpmxIZvrp7/PhmKPHIDDSSaMHQ0adH90TRovXD8xweXSBEflM
         sZNGN3/kww73a+6WTWXH4f61Hfc8zK6xhFrPD4iTfAP3fIa8kzba80SN0cPA84LuP23x
         TpCzXfYPqkteaoleqm6kqkdUzd2yNNBBe4rmOwaG+6rD3v3E68fjI8gfFw0S6SNbMF5g
         27TqEvipcSkFpr1J3dOCVdQ4p4s7YmUkVlNF0GayL4T3srkC5UOJtM3pmEC0fZWi21Cv
         MmbuSwpeqdHt4L/fLaZeLTQLaHN4nK0az1rkZhpn6SvfK5BewCo7jYnhBTKMNHVobzFA
         2lxw==
X-Forwarded-Encrypted: i=1; AKwUvByImQj1AnvUsEeGchM/lICr4Rb+Xfy4bpLwkytslefR52mygHRKpgrlngCgpdHM1ySqacz7YUZvgeNXJvCf@vger.kernel.org
X-Gm-Message-State: AFq9FYK3ppukNLbQuzGAzVZpnNmQcz4oPL/+zadJFTscGkyI+rf/mPSH
	8pER8soR3G3Xt4n3CucrbRifgoLLgTdqIlT/P/035bd0kUtIJnpeLaLe5baTr9NRhtwGENaoJP5
	IEsFWyT5rBzdTrr0XPryuJiYsGDyfgWlETxAwYSgoCzbQL/AhR5jCV2NH+UD9vWinmPOJ
X-Gm-Gg: AYBFou2uZHr1X0rzY1UK2Kyccd11oNCcYZmWLy+ZY52/ncuG4VFMfbO2gHlH5i/58c5
	OPWWEftbs5Ifn4fVLkgWq1sQ5rUNIJC5M5E01Yua31O2f7RlB0US48+JOv6h+39ch+JEQ0gfqSW
	iCI0b0MPGOMjutM9eKeQmCAqoOY4d18X2QjJ+pYCOFS7K0+6TdS+uksJ9S9TF5Rkj6Mi654euUU
	O4qMEnccAzJYY+HixZZQTmBCfrfsV3LP3dzzU2QNBSd5HDiOMK/XiAQSpmrsX9nNA3TIppotNg1
	lmNorkX6Lkjy8AYknYh3CxPSDyhlY7Na82FYFMvVBZ3WXvwcUe+A0GCBDghJ+zm0I+gy2AYDRiP
	ydqzSbsEhT0MYUK4nSAFDRw==
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2138498985a.6.1791886227095;
        Tue, 13 Oct 2026 03:10:27 -0700 (PDT)
X-Received: by 2002:a05:620a:19a2:b0:93e:54d2:2283 with SMTP id af79cd13be357-93ebd2955edmr2138494285a.6.1791886226526;
        Tue, 13 Oct 2026 03:10:26 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3350fcf309sm353463166b.39.2026.10.13.03.10.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:10:25 -0700 (PDT)
Message-ID: <fb634f17-de56-4f43-b139-3d040a35f019@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:10:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add Samsung Galaxy Book2 Go
To: Luca Weiss <luca.weiss@fairphone.com>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Jasper Korten <jja2000@gmail.com>,
        Federico Amedeo Izzo <federico@izzo.pro>,
        Luca Weiss <luca@lucaweiss.eu>
References: <20261012-book2go-v1-0-7188e7ea7a15@fairphone.com>
 <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261012-book2go-v1-3-7188e7ea7a15@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX/DO0Z0bkquRU
 HrmQNM8Fl0zuGIVoqQhA8C49d7PE5PX5NBL8j/Os7km9BOoPM9QLlqHEU5Zl2pzo46BkHeOR7/i
 nJZF2j6LB5KFtDGyETDQzktSM76O2LvZ11HGgC3N6Jn+aNxKoSSggBhEn1GDK8h/zFrENP3aLcr
 JFxb5B09y/skF8Xw6txyfo73qNi3rZz3J7R2gKP/sE/L//PqjdZ36N2Wn+y5mSbCiIsY9QPeE8F
 l7mLpY2Wl+a0+lRYuBrOyCaEKBDQ/t5MH5G/NAlDFtZ02guJoKROjE+y3SyJ6sj1Pg/AUjKvlEq
 fS8+gw+SQWI4A2VB39J2s7TJdXrArw2CYm7lFgE/t/Eobyu1zouFNFvnLqJiXXWkqC3+A05EJtj
 3AqUie486YpKs20jiDWTEjbfdaqJqfNKavQoTWo4/zO2J+CqMhakttPDbfEZGPBlpBilFkqyv6W
 LauOk68SR1UeIxaeaSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfXw9xRKH8Bbqxn
 1TvjWIv7K6Rq8IbeS0XKOPWZOqFvso8tdyb5U4tSiNTX8FtkT9CaaBPz68H+04f0TDen6uEsPzP
 L0YoRd5hz/8R2aJQtMeoa/7HWaRQxR0=
X-Proofpoint-ORIG-GUID: XINHTZrCFVqzBCra4YiqJ87fL2WmzIcP
X-Authority-Analysis: v=2.4 cv=EP+TQFZC c=1 sm=1 tr=0 ts=6ace0393 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8 a=RY9Homj74iP04qnvyqkA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=y4cfut4LVr_MrANMpYTh:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: XINHTZrCFVqzBCra4YiqJ87fL2WmzIcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

On 10/12/26 8:11 PM, Luca Weiss wrote:
> From: Jasper Korten <jja2000@gmail.com>

[...]

> Signed-off-by: Jasper Korten <jja2000@gmail.com>
> Co-developed-by: Federico Amedeo Izzo <federico@izzo.pro>
> Signed-off-by: Federico Amedeo Izzo <federico@izzo.pro>
> Co-developed-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>

Good to see the Lucas are in agreement ;)

[...]

> +&pm8350c_gpios {
> +	pmic_lcd_bl_en: pmic-lcd-bl-en-state {
> +		pins = "gpio7";
> +		function = "normal";
> +		bias-disable;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +		output-low;
> +		power-source = <0>;
> +	};
> +
> +	pmic_lcd_bl_pwm: pmic-lcd-bl-pwm-state {
> +		pins = "gpio8";
> +		function = "func1";
> +		bias-disable;
> +		qcom,drive-strength = <PMIC_GPIO_STRENGTH_LOW>;
> +		output-low;
> +		power-source = <0>;
> +	};

Drop the output-low, the consumers already take care of the state

[...]

> +&uart7 {
> +	/delete-property/interrupts;

Let's add a space after the '/'

> +	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
> +			      <&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
> +
> +	pinctrl-1 = <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>, <&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;

And let's wrap this line

[...]

> +&usb_1 {
> +	dr_mode = "host";

Does OTG not "just work"?

I'm assuming there's no pmic-glink on this device?

Konrad
