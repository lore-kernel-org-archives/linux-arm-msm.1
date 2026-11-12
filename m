Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794490396;
	b=uTmk6o9sj30PHGS0/3s2YYoO9/5T1qqU6hoYqTbEWrtyRiKQZjIlh34/yJydxKMclL9v
	 wrsxuO/8/bjQSUyDazJPMp70H1Pg5WYbBp7V0jlYP7XNMHO3H5BlxCW2Y/bvwlT/t0kvj
	 zLGlLka2WN3OHsoFpxjqO16Lpxh0p/mKe4kiDWVbBLwQ1OL6xIYyb0LOzC3p/leYQPM9v
	 ZCTem2snJw7n3/gBv2iye66bz/1z3TXly0+jEU5dVRW0UeVVT8dtYr9jQtXNf9oBwr9iW
	 FfT/G5PNBF57CcuoO+JV0a8AwUt/BXH8U5Y8Ol0/6GjTNuXkxF81SL8VawNoiKarKYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794490396;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=uDOw7djSHttwLQtVBHUbQpMumb51EMJ+8QhRFDSN60w=;
	b=kqq5qIVWKeCXjGKlXYLXKJwRRypWssRIHlgIM5YBEybo3pslqg/yLYA5TihnrlPcLqoq
	 2wCWHA385A7JoIOGz03AtjIXp+vmliABhnH32mb5psOI1e4otlJYMSqEgHILDN1aJAy52
	 7nzEn1p6+zM/ApfFfW5aOFlfNUfqO6Y6BiADZsx8sl6AZsGCyQvOdNBZHRLkcYKnlf8SV
	 Zxkd7aSAOSHNRb/jrhzpRPVM/Vb6/6EfkwKh/4O2rZQ8vGm76PobqeYWskhJmhQR7MQzY
	 eQNjh2PAGSSW8Cp7KCIrpC70jiMJJKtjNQiXNRToJEOdKdOKa5Cd7MmND3UMCUlCCsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdjlStoz;
	arc=none smtp.remote-ip=209.85.208.176
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D74606A88D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 13:33:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4D74606A88D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YdjlStoz
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-3ada7d53082so10242781fa.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 05:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794490394; x=1795095194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uDOw7djSHttwLQtVBHUbQpMumb51EMJ+8QhRFDSN60w=;
        b=YdjlStoz3t8Nu734482NDpKJwumteKZQJqBhrZDqw6KJFP+YOFDb9vHVtVDvM3bBsZ
         UjIBd1OpPIXlaEzAFZ30llWPZsE/9HA82WjKoU6rzRkluKAoADfgUDoKsqILN8FDyJr4
         sIuX0j75jyhUOTrRs4qgUJuu5wEhqBFgisDGa1orMzaISvS+SwcsJ5R33T+iX/pH65bg
         GCc2ew3/6mn0aDKND+Gvz00LdfM9xUbSmgIVTkbdhxs0f4M0t4hixGwWGVeB9kqZ6NG9
         n+9h2c8nql6SVBqP+2uHhSimLlXrio7pL8DdpeGP+seZZixgRUaINg7n8cIN83Bmtg+5
         KSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794490394; x=1795095194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uDOw7djSHttwLQtVBHUbQpMumb51EMJ+8QhRFDSN60w=;
        b=d8OlhdAzw0r2XmzeshDYLbf05oyyNfqZrI53p42Ygc+RqOEWcACrh1IioVPs/A/Jmu
         olPEuMfSsvZeLHAWOuAQIX9T3QEOmCPxy3KXDZhpjuQR75SUFA+1WnNc90eC4O1YY+E4
         pDXJcywihoaJx1bonyccBV5/IdCX6b74cYEFoq+XYLUtHTP0FJR6hmAb7hNZW4ljQBqV
         1usiHp6OORKHmIHff76KsP+ciKDZkZhM63/U0BYwiPr1iICd0d4mxDSPU6z2FUOayP/v
         aoNg2kKMe5dwHQSYlC9Y3Q8MjTVEg6t51AoMnDMv75+t9DGT85s51vuPb/ybyD7UWc7D
         VWZg==
X-Gm-Message-State: APuU4Z9hql1u9r+pjSfZlIWySCzv+3TtCD/BtCNeGIcI3begMNpujrNj
	maEoD19xbQfu7Skus2VLEGT/GwDb5WtpQGe7kKqVRpshQi7NeWdyiBL7V+Wt+jx9
X-Gm-Gg: AYBFou27vkid2neKSVRLWux067t/Tb5J8IZ2jpPDlKm0N1FIwQIUQVkODNj1I4X0Um1
	IjbflQ73FnpULo1njsAIR2aMXw4+kvkmL260h9nZRxmRuHWnzhJufHT6k5lbcNHzn7KCC+1oOAQ
	LkF0e/Olntuduy3+8RKZEE+s93PvfOCSY0urRzI5zRb7JeHfs1mWJHsCOL3gCFJdSUamXJOpHpc
	1PhD6wssLpYXSpjGpbMBecu96q9ewBCj4+Q2OB7FehBJ0Y+tozYXZQD2U9aks2q5udS6XF1/tfx
	zXWIH2owtH4OCslRDAXYNYulcmgat3VCpTv4W3gr7BjIODad/BdzuFNCzTCZaIGSQfTZKgeQNtE
	P8i0P4ViUwJ0+uukMDD3GpxgwJvTygVmX3iSuYDEFxpvj4uSbe6WZDGYsGs0gnCZ1PWU48C5joe
	IztTmki2M2tL1E/Pb5uJMr0jMTu8o2JysFWqHXOY40rhwQ2JeFx1/6gQWDtxWULPY2lnBgl4Q2o
	L7locn5Jy88iKl+0vq/obqOlB3I8KxWGTqYdmLUYsN2nk0Zi2d8WFFJHWfH9N+Iu7aFaaQ1o2rX
	/LbJX8OLjE39Mrj9yfvPb+f5kJqkinyhq/QrK6x6
X-Received: by 2002:a05:651c:a38a:20b0:3ad:372b:1fc8 with SMTP id 38308e7fff4ca-3ae1bf44ee4mr3703341fa.9.1794490394147;
        Thu, 12 Nov 2026 05:33:14 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae0926c65fsm19217631fa.28.2026.11.12.05.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 05:33:13 -0800 (PST)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Thu, 12 Nov 2026 15:32:59 +0200
Subject: [PATCH 2/2] arm64: dts: qcom: sm7125-samsung: add grip sensor
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-sm7125-samsung-grip-sensor-v1-2-d45dd9c845e7@gmail.com>
References: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
In-Reply-To: <20261112-sm7125-samsung-grip-sensor-v1-0-d45dd9c845e7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52 and A72 use a Semtech SX9360 SAR sensor to detect if
the phone has been gripped. Add this sensor to the device tree
configuration.

No I2C bus is being muxed on GPIOs 51 and 52 on SM7125, so we bit-bang
instead.

Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
index 5685755a44f6..52fe06303294 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -60,6 +60,39 @@ event-hall-sensor {
 		};
 	};
 
+	i2c-grip {
+		compatible = "i2c-gpio";
+		sda-gpios = <&tlmm 51 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		scl-gpios = <&tlmm 52 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+
+		i2c-gpio,delay-us = <2>;
+
+		pinctrl-0 = <&grip_sensor_i2c_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		grip-sensor@28 {
+			compatible = "semtech,sx9360";
+			reg = <0x28>;
+
+			interrupts-extended = <&pm6150l_gpios 5 IRQ_TYPE_EDGE_FALLING>;
+
+			vdd-supply = <&vreg_l5a_2p7>;
+			svdd-supply = <&vreg_l8c_1p8>;
+
+			pinctrl-0 = <&grip_sensor_int_default>;
+			pinctrl-names = "default";
+
+			semtech,resolution = <1024>;
+			semtech,proxraw-strength = <2>;
+			semtech,avg-pos-strength = <512>;
+
+			#io-channel-cells = <1>;
+		};
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -379,6 +412,14 @@ &dispcc {
 };
 
 &pm6150l_gpios {
+	grip_sensor_int_default: grip-sensor-int-default-state {
+		pins = "gpio5";
+		function = "normal";
+		power-source = <0>;
+		input-enable;
+		bias-disable;
+	};
+
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -434,6 +475,12 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <59 4>; /* Fingerprint sensor SPI */
 
+	grip_sensor_i2c_default: grip-sensor-i2c-default-state {
+		pins = "gpio51", "gpio52";
+		function = "gpio";
+		bias-disable;
+	};
+
 	sdc2_on: sdc2-on-state {
 		clk-pins {
 			pins = "sdc2_clk";

-- 
2.56.1

