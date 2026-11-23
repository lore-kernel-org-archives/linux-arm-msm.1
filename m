Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432136;
	b=IaesWSC2N2SjNCMfjfsLMbi+0ydKhIx5dmTstUtYkNoZ4idCkD3GHYsBMs1CLQPZOsLK
	 5RJOc5tlSWKZqd4Eo1/Iy9OmTaRYNb3VGuyMt52S5PrD/79/xipate3j2XMlc8xJxkJlR
	 wyELGzOFRblmqF52ykAQmFIBRi01ejusEJYn4vPFhpzAhBbEa2igmaogPZDDhihNV7ErB
	 F2Ih8mK1d79624p9DONwYKV2ooZEXh2s/v0qM4XLBmAV0cjWwTrq4K8sxwhKa9JlmE1st
	 9Mh36R9NNpynPj3lVXfbUSN07i4EuyYr5Z1QE/TYF8EmghpYIGwwig0KyCjtxqTCUdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432136;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
	b=M+ThTWtJEvGEV0lvIh8FKcxrIPAEI6RsZ59pc8iAwUGX+3MUEhy9j2TBzZD6bt+mPk2j
	 2lVwUynjZkosl+C5tXziI7GVfKUJr2bqXamnsP+hkHlORLbD+6zaB2nuwPnbk7bxq5jfa
	 HZ7i7ayiNvZIsuHG048hceVYYnDgSo8W20OBHXeR247qge676pY9PVKvB/W7CH9YOEsf1
	 +meph4IyhX3ZCTPeg1gff5JLFl4VB/ICHHuIA70hRGA2JKht9WYeSteVj+QMw5UfRdgml
	 HgdZ/OhFjCQ8lOK7b3ugL3jOhffvC1JYBDUUxHqopmThrPaQsuBDz08Ac08T2EDX/sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="GV3Ox3m/";
	arc=none smtp.remote-ip=74.125.82.51
Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90AA8606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:08:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90AA8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GV3Ox3m/
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-170135e43c7so4340094c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 03:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432136; x=1796036936; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
        b=GV3Ox3m/nwlScDSi01EojkTUY3OAbqwZCcsZyEc3A2ODjDkx63iQHWMPBypXLaUTdt
         vYXuXfgTZWM4Wt45ElJVAx4k6HmH+ATHBmBKr04VQE0xixKP2pFKqCpHKvNTCjBNSEyI
         cd6fpPdiLLgaHK2kNST1nJi0tKTbw37CW9QXC8soarFdkCGcU3UicgTNAW0QCFHTFzHD
         p7XT7/rZOK09ZHvbQsm0WIlxgtwIyQ+Wzlcmo/ErjYanKDDJB5TujuSnj0gOfUhEvUsu
         L+236Z2ijkpTolk5xRoNNPEXp4ru1FCx1VqOnmwz/zaD688iFhL7Xqt/HWC4bNA+T0Mf
         zKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432136; x=1796036936;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPfVHiYNEgedGdsEEXACtNCGn8S+xuE6Ru5ISfJrNXA=;
        b=lY5C2+aCXBU4+cMO76xQGfamr+LdsrZ3JcwlTRZho1+DUVOuonCJw0d8Zer2zTbmxq
         iiN73SxA+URhIqtVCh8CnVtJ4yzQWwWY3ol0fcv7BI9Qs/swbU4sdl2QNBD7KNoG7rUe
         lu9afltjNk0lvAKyvvVGT6VQpTRHyHBMyoRS9YjY5HYM9QmULKWk+ozJyd1VgtpzGQKO
         C2QBXWaKjSAlQWXF8Dk4oeTYe5Y3MIppBYm8fOaHf1XBdlNohGa2OYJyEAjFr33cR9Ra
         MgMBXijGTZ5vI8MDbTCm+rHarGiYAgy5PKo9zPLi9i7RJiblYudFDAQXtbSpcdwSvrwu
         9eqQ==
X-Forwarded-Encrypted: i=1; AL+hErEoYLa61KoR6xMocyGNLRj7EvPWKjiCJVMnp68jvMsgde9l7r84Cxs8zdUtVr9RO893S6pcKOlQTBfidOE/@vger.kernel.org
X-Gm-Message-State: APuU4Z+N9VgaAUYvf2UsVy3WB5aqacae8vUYociWOqDMW2gCHPRLg0wv
	PZZTGhAX6WIt3YaQBO9p7ybnEPy1o+ggxdPSVP34Ntj4wNDeJSCf4SQx
X-Gm-Gg: AZFdTZcwK3yLsVkuNBkwY4t2uVd2UmjdxizgJVRsJad6Vi1GNLR4Z+dX2qfav/C/ykS
	2dNgf3NAOA3fWro3ImpLklg/uz+SzPmwSGWPKs+EdktDcCvFiRTydpAEbI9x8YYqBeksfWY2SkE
	I2mzLODfk+PRAyd36UH4oRCucvSFS9Z8vvlhqnW4yqOAMzp6WeO5xoHfxMMwA9MurBSowpRMksB
	TON4d0NJCxm3rIYdO1kMVeDfaLgO/xupf3o+o5nLPo10CfOseF2XVtddyhNDS6sjThqWWLEqFmg
	awn41MWckbbc2E+fsY5/5M70pU3VSfyYXPLOtFBSpI2vHaBZ86rZMZH8tYTSKJqcgfeoPLDh394
	t2Tn9PS8DfQI4dWhYR1eivCCvprCmFkF//uu0cOv0bDUD3fEeyg8M0VS5qvG0hmWG2sn+9mFwBo
	zzLwWNVDaAoR0Bh2icupT7QtvxHXa76e4kHcSbUy943QxkBZqGKAg7eJNrqsg5wBmAWmp4tugUh
	8PrOPfXSABjVBLsUyKaTPcXH6ZBSiKvM4ZRtCcoKXXsbQTPtg7rCBZRCCJYTBUcpeSXioHnkMXi
	qR94nZeu57SPhFb7ilV0K5EmSHvKSx6/VS4vLfmXcljM1Q==
X-Received: by 2002:a05:701b:2704:b0:1b5:4f6d:8277 with SMTP id a92af1059eb24-1b5568e78b1mr11025822c88.26.1795432135606;
        Mon, 23 Nov 2026 03:08:55 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:55 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 6/6] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Mon, 23 Nov 2026 18:08:05 +0700
Message-ID: <20261123110805.119610-7-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10
rear camera and Samsung S5K5E8 front camera on Xiaomi Mi A1 (tissot).

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index 8ba7982fcd81..40a14301ee3f 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -271,6 +271,20 @@ headphones_amp_default: headphones-switch-default-state {
 		bias-disable;
 		output-low;
 	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39", "gpio62";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
+
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		bias-disable;
+		drive-strength = <2>;
+	};
 };
 
 &uart_0 {
@@ -288,3 +302,103 @@ &wcd_codec {
 	qcom,mbhc-vthreshold-high = <91 259 488 488 488>;
 	qcom,mbhc-vthreshold-low = <91 259 488 488 488>;
 };
+
+&camss {
+	status = "okay";
+	vdda-supply = <&pm8953_s3>;
+
+	ports {
+		port@0 {
+			reg = <0>;
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+			csiphy2_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1>;
+				remote-endpoint = <&front_cam_ep>;
+			};
+		};
+	};
+};
+
+&cci {
+	pinctrl-names = "default";
+	pinctrl-0 = <&cci0_default>,
+		    <&cci1_default>,
+		    <&camss_mclk0_default>,
+		    <&camss_mclk1_default>,
+		    <&camss_mclk2_default>;
+
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera-sensor@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		pinctrl-0 = <&cam_sensor_rear_default>;
+		pinctrl-names = "default";
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+		vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <270>;
+		orientation = <1>;
+		status = "okay";
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&csiphy0_ep>;
+				link-frequencies = /bits/ 64 <216000000>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera-sensor@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		pinctrl-0 = <&cam_sensor_front_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+		rotation = <90>;
+		orientation = <0>;
+
+		status = "okay";
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&csiphy2_ep>;
+				link-frequencies = /bits/ 64 <418000000>;
+			};
+		};
+	};
+};
+
+&pm8953_l23 {
+	regulator-min-microvolt = <1200000>;
+};
+
+&pm8953_l2 {
+	regulator-min-microvolt = <1200000>;
+	regulator-max-microvolt = <1225000>;
+};
-- 
2.47.3

