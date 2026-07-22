Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770BB2C2363
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757332; cv=none; b=NPbACXIb4HyhLk4HlU0AtIGp8CS9JXD5rUbouRBB6obo+hOqlH9+U0HQ1bphKIkCJ8o06uUtPmH9wlJfA0OOEZmJr/JKaBENn2MSs4wzHmifp17282qbcp0qtVwHJOT/1V6/4r788zxBplpewTRuTxce/hFoyJZA8yUdVHGAgJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757332; c=relaxed/simple;
	bh=sNiG5f2/kBA7WM7h5nhOHP7wRVS5x85sYbp7U9N3K/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qfdzuDFWAjEwD3EJ2QIJ7aEkd2xlUaTVnRymgH9ICY8DTO3ycTB7w/BZ6Qx+4rYFd/qt+kkOKCWn9FgJv9B8Th/OzP8evfDUPPHOLJ2Lt5AcSgxHeW0/NFVnmWgmcwTFKt6xc2jYfBcdssX3dLfvd5vb3U/G4YwSK4fJ+CFLjYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GSs1zGSd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GSs1zGSd"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4954dff6536so13695e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 14:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784757329; x=1785362129; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CgcSfmx8QyNKOcVQ38dAm0Xv0CbPNNiIYif2A76z1vQ=;
        b=GSs1zGSdw5y+TLbUI4EwP44vSpi0sCOz0j1PqhAlq4b7PtCsJfialQFG4j6r5C0yGa
         KuXOOzxRogDEjmLtB3t51P6uCwXnPtDuYSYM+bxYeGcbOOUUNEk7w/W0shrtfAzhrAdR
         5kaXUoZ9WnRj5PX4PNTsCcwmirhZ5TVbxWFwFqxS2hqPg6LBZ5uHf0Y0tkCqkXilVnPW
         IXfxSwGqEJp56iBCHUG6zaD+QC6qAt1CLyHqSjSqCsIkg8sxRRN+vJJUTedcGpz+5zZp
         Loee/fvibuf6izOYHGeNDHbL/L2D07m1Su767pWCJxGANl1NrUS1Of/P3hDDyVTdT5BS
         J4Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784757329; x=1785362129;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CgcSfmx8QyNKOcVQ38dAm0Xv0CbPNNiIYif2A76z1vQ=;
        b=BY/rfGDc2RnC2DSHwNIcW8LZHBGyz/0T+dH1IjNfBre4bEMP/REFcxaJi88/cM6nMv
         4kUl4S7ztDG2/ohXlN3Q77St8NWS3I5ct4D+UP3UKm6RVliCBIxE6H0FoVtk4GT5riG/
         /T3eYstZQVwS3fiyQGkyv0tXASNqufWSwdR3EYQtTB0FXqE7s8+1aGOOj7E63G9EHqtX
         yve7WwnKED7QjHA0CTIEkxNP/IN5TDqZyLBehLUykqMmZl9OI5/jexZ6UV+AfoxhU0FS
         tQ5J5Pb5c6YPNykkwp2sfNjzPh4YWB7PoHPxGlmkvNGT9ElaRF8ccyy66F9OXGEVyu9Y
         FUsA==
X-Forwarded-Encrypted: i=1; AHgh+RpLPkcMIRfd9waKYfMEq0k9K4Giu5274KqzHNYRmHWg2sLkWfs73a2ECUUDbq40EJzKpwm7Xd3ucYcCDosX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn0jjFUov8yn6iG4qt6hUEmz3SA5E0wwy7TTfcY2jmEjHUYzeG
	yr9OsYH+QUQj6SNKY9OlNh00USija6OCtdNNjIEbpONsy/psQ0OJj7nO8Pht2LM09Zo=
X-Gm-Gg: AR+sD11Wg7E9zREUB4ATYhKjqYghMy/am7CmvoY2PY6McChsAYx6rOY+SaUtoa00qkB
	nXKUCn2Uh2YBdOvFALPhgFWmHTtilzqUwARJIY2w3Se/3Ixw5rKV6STfyVe1vH7X0SodxAfpoci
	5adbJKjMP67b79YSeCB8/ISFPfl0JREhd86kn/BtHZDAjKPAs0XdZU5pJC8IrB70Jrh/Lm4WieM
	F9zSnd6Q0xVIbf7BnXikfYzxq+Wkwt5uuq3RqR2zifh5UBZlnwgBJpF7A9j0NyxcN8PkkIlSF/g
	tQB51/Z8qSaXCNTIu+SRN7mo3q34Y08Ekio87vDd/rRgP/lKhWBRistivAkQgxTy5OkenGILyHx
	gPsuGHuWMAKk2ECXG2jpLtMf8XyyX02D+/CYEhHrXgFzoKCo7rouxwIh9kQFFtGeKLNkpPh1eqr
	80ApCc4oW09M7yPA==
X-Received: by 2002:a05:600c:19d2:b0:495:4815:2c54 with SMTP id 5b1f17b1804b1-49573d22bd0mr4042055e9.34.1784757328712;
        Wed, 22 Jul 2026 14:55:28 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.14.136])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f864305f5sm9015260f8f.17.2026.07.22.14.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jul 2026 14:55:27 -0700 (PDT)
Message-ID: <a6da0734-a753-4ea9-adf1-4a520b3edd0d@linaro.org>
Date: Wed, 22 Jul 2026 22:55:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: qcs6490-rubikpi3: Add IMX219
 camera overlays
To: Hongyang Zhao <hongyang.zhao@thundersoft.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: Roger Shimizu <rosh@debian.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
References: <20260723-rubikpi-next-20260615-v2-0-47c5add80114@thundersoft.com>
 <oj6Uto0EvMI0bfZBF5H5aR0yqM-icUN-2cpVSpKffQlJVo5RXBvA4fUy4iva2Pf7LVfq7t8OSRSbXS71dKW-iA==@protonmail.internalid>
 <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260723-rubikpi-next-20260615-v2-2-47c5add80114@thundersoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 22/07/2026 17:12, Hongyang Zhao wrote:
> RUBIK Pi 3 ships without camera sensors, and its two connectors support
> multiple modules. Keep module-specific nodes out of the base board DTS
> and add per-connector overlays for Raspberry Pi Camera Module V2 IMX219
> sensors.
> 
> CAM1 uses CCI1 and CSIPHY1, while CAM2 uses CCI0 and CSIPHY4. Each
> overlay describes the 24 MHz sensor input clock and the three sensor
> rails derived from the switched 3.3 V connector supply.
> 
> Describe each connector CAMERA_GPIO signal as a privacy indicator LED
> and associate it with the corresponding sensor. This lets the V4L2 core
> control the LED while the sensor is streaming.
> 
> Signed-off-by: Hongyang Zhao <hongyang.zhao@thundersoft.com>
> ---
>   arch/arm64/boot/dts/qcom/Makefile                  |  15 +++
>   .../qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso  | 117 +++++++++++++++++++++
>   .../qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso  | 117 +++++++++++++++++++++
>   3 files changed, 249 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index e05414290d8e..89c1d12ed299 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -185,6 +185,21 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
> +
> +qcs6490-thundercomm-rubikpi3-cam1-imx219-dtbs := \
> +	qcs6490-thundercomm-rubikpi3.dtb \
> +	qcs6490-thundercomm-rubikpi3-cam1-imx219.dtbo
> +qcs6490-thundercomm-rubikpi3-cam2-imx219-dtbs := \
> +	qcs6490-thundercomm-rubikpi3.dtb \
> +	qcs6490-thundercomm-rubikpi3-cam2-imx219.dtbo
> +qcs6490-thundercomm-rubikpi3-dual-imx219-dtbs := \
> +	qcs6490-thundercomm-rubikpi3.dtb \
> +	qcs6490-thundercomm-rubikpi3-cam1-imx219.dtbo \
> +	qcs6490-thundercomm-rubikpi3-cam2-imx219.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3-cam1-imx219.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3-cam2-imx219.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3-dual-imx219.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-vicharak-axon-mini.dtb
>   dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso
> new file mode 100644
> index 000000000000..620b4b3463b4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam1-imx219.dtso
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Thundercomm All rights reserved.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +&{/} {
> +	cam1_imx219_clk: clock-camera1-24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	leds-camera1 {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-0 = <&cam1_privacy_led_state>;
> +		pinctrl-names = "default";
> +
> +		cam1_privacy_led: led-camera1 {
> +			function = LED_FUNCTION_INDICATOR;
> +			function-enumerator = <1>;
> +			gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	/* The module enables its three sensor rails together through PWR_EN. */
> +	vreg_cam1_pwr: regulator-camera1-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera1_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 57 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam1_pwr_en>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vreg_vcc3v3_output>;
> +	};
> +};
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&cam1_imx219_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status = "okay";
> +};
> +
> +&cci1_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@10 {
> +		compatible = "sony,imx219";
> +		reg = <0x10>;
> +
> +		clocks = <&cam1_imx219_clk>;
> +
> +		VANA-supply = <&vreg_cam1_pwr>;
> +		VDIG-supply = <&vreg_cam1_pwr>;
> +		VDDL-supply = <&vreg_cam1_pwr>;
> +
> +		leds = <&cam1_privacy_led>;
> +		led-names = "privacy";
> +
> +		port {
> +			cam1_imx219_ep: endpoint {
> +				data-lanes = <1 2>;
> +				link-frequencies = /bits/ 64 <456000000>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&tlmm {
> +	cam1_privacy_led_state: cam1-privacy-led-state {
> +		pins = "gpio18";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	cam1_pwr_en: cam1-pwr-en-state {
> +		pins = "gpio57";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso
> new file mode 100644
> index 000000000000..80479fffcdcb
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3-cam2-imx219.dtso
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2026, Thundercomm All rights reserved.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +&{/} {
> +	cam2_imx219_clk: clock-camera2-24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	leds-camera2 {
> +		compatible = "gpio-leds";
> +
> +		pinctrl-0 = <&cam2_privacy_led_state>;
> +		pinctrl-names = "default";
> +
> +		cam2_privacy_led: led-camera2 {
> +			function = LED_FUNCTION_INDICATOR;
> +			function-enumerator = <2>;
> +			gpios = <&tlmm 19 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	/* The module enables its three sensor rails together through PWR_EN. */
> +	vreg_cam2_pwr: regulator-camera2-pwr {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg_camera2_pwr";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpio = <&tlmm 58 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-0 = <&cam2_pwr_en>;
> +		pinctrl-names = "default";
> +
> +		vin-supply = <&vreg_vcc3v3_output>;
> +	};
> +};
> +
> +&camss {
> +	vdda-phy-supply = <&vreg_l10c_0p88>;
> +	vdda-pll-supply = <&vreg_l6b_1p2>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@4 {
> +			reg = <4>;
> +
> +			csiphy4_ep: endpoint {
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&cam2_imx219_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci0 {
> +	status = "okay";
> +};
> +
> +&cci0_i2c0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@10 {
> +		compatible = "sony,imx219";
> +		reg = <0x10>;
> +
> +		clocks = <&cam2_imx219_clk>;
> +
> +		VANA-supply = <&vreg_cam2_pwr>;
> +		VDIG-supply = <&vreg_cam2_pwr>;
> +		VDDL-supply = <&vreg_cam2_pwr>;

Fully weird higher case names but consistent with the imx219 apparently.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
