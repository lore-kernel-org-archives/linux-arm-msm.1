Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787180;
	b=V9JE+Ku6kLHrsJXEmJs0PxPqnvo3tc9upqsbCDHoimtSctz68BgkWR79dCUzta/br1l7
	 WuYKRBlSZLrzD6CWh6cMxYQJgp7yrXnttjtCmbRxrlsFoJY+Thx1qfv/ylyl8f/d0ZJlu
	 LDtDVCyXL675YQ/KaI4xfDHjdU3QzVOMHwlR+xa+h29dbb3nz4S1DXIHHuU5a2Qfa+yNu
	 /3+2zXFE4P25O372T55nM0scxPkJmlKmP1gyAvXxwhOFEl2sBIxFcR9owNMJm230eIVHH
	 MuC+WUmtH8lrB8BvEfifUtxhCoQXXKJdzexV4DNcjPbpPU3NKP71UWnktBVmM183EcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
	b=vdWpN5fFZxpk6vvFPh4WJRF/8EtUnGNrYoXqw2ZWRXxzHwwR6vos1R43OyYc+ewTLprK
	 yLoZ+TyPyb7yBITX5T9Q3LbkfOBlA83Y4dElkA0MRvO8nqbEvhCAqi+uKF1FIOijhB5Dw
	 HqNY7Z4mPqfdY1RW495WH1hM2YDqnRd/Up+ZNvxP7PT8wbhE/J/vBdUTqsrU0ERzoVlEp
	 5K77nuST/wM9z24pPPp1GRK5apHFSYCca9uy+dPMStZtw4Y88Hq/SUr96AOPh0SmQ1Z3T
	 WzrK34nZa9a0ZVOZ64YRB1+EiwU7p45/hEcDqmNQNNTVFYuL/CHgrrSNOAgke4/oJ8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGAU9Liq;
	arc=none smtp.remote-ip=209.85.214.171
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664F3606A336
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 664F3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AGAU9Liq
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2f037bc348dso64306655ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787180; x=1796391980; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
        b=AGAU9LiqypIjJWbA2RTVEHqWz5tvzMFqIsD8s1V5CDz+EW7FfM3OriPXCqsaoNZLgQ
         nqGFaMjS4ne/xpB5yy/LZzPc1VcmsSa0irm6uqtGhsWDLTs8bXCwRpSK1Gv+NiCbX1yj
         bi3khFFKtSsb9eaQ7bGRDEvTyImK0razii0vhPgaANtQwHbgXf8J9+0yklkltlc32nf2
         Sq6z5R+lQF0DYvJi7G7iwrQKd4irmMu06/LWJtdZWchrqPOtPbHPDoygyDLNUyc+t6LP
         4bCmzj8Rg3nk5ZvfJi2xUVwYnxm13ocBw5dvFeK9vnGsPNppJGPRoRFwt76RQOhVgll1
         EaUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787180; x=1796391980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xR4yuXTQOAyEDilHAtowb56eXirOM8/fc1liK2FFiQk=;
        b=AGRix7Qcp+zE3IVaheV09eHrKMBlloMMT++q7DXFR2XqLWgrJQjBccIuuRLD/YitqC
         yKTQn8+mlQ3Q53HN5x/7hDQT+9i3JrpSQDY4EQAtg5Bgo6ojL7+ediyX9nXzVTOMkdKb
         eepTBTcA4mI0lOJleOWd5wBqbeIVNh2HerWKF7WCGyPdvMWo6Op6C3EGvu+y/HrVtUVU
         me5P+Jzbs5B9JB38VgZLx5IPzyMyt5DmHWuoblJAUGiPAzOYklr1ypO8ByhRjTYqo+Df
         DNMkDBdx14FHNmRxFbGiT4asXhcGs8P8A4F07guPfBtnO8s+58y7BPRF5aqiS+mgyihj
         k9oQ==
X-Forwarded-Encrypted: i=1; AL+hErE4JJg1ZTZYQPyTYGpsevnpiM8DierfFomJ/6X32bzMLvNILClR2tWMyBqr20EjwPC7uCEOj4hZ8BfzwWhE@vger.kernel.org
X-Gm-Message-State: APuU4Z8VHmhpTzTBwXbjuQIuaSEH/K/vRKw7o9pVuWOOj7jECdL/XYeG
	WXLqFMzY0u+6jkBVpyZ1+9iRi8/EBHkqA2s4W7amptShORG3iITdM0TY
X-Gm-Gg: AZFdTZfxnMA3jkawFgrMhiuRNFaOZ6cl8FHQoCDN5uBLMWWHVOczydloaKH/YtBLdnf
	MF18woBuy+7ZBUjDVwY180otj4EGAGA0b75S0ifnibnv2ufSoTmZYeDiT2vN9Ik3yRRer1H8DLm
	7mHOO6MArPFGU7noI7MYPwz3c5hpHiVFMhm3o6NS7rwwWE0svKHCASSwkxzX/orZP2aATJ5qrgf
	aHIO150jNDtZDYK4ySGVWs21zmo9CvF6zmm5f/v69x8IjaBG+eBeqyUSk88+k+6eOLgjAuHtIFu
	V3vbEsDfff8a59Sf7qVakK2JNp4zQpJ6e+eo5Vk08UZTKA8b16y8XcCw87S7kk7bMoSZXasjPGo
	4solz+ku/YRKoBNE9Q7k0r6dBUlrW3Frx4LPBfwhvG8N2Qa8lSZO+alALJbUodshbACCBq0CqVI
	r9PQw7nBYYTzRmEvkYGNveqzfy2eqHYhtdj4+pVoXdFLYbIfWDzHYOiDVEkn4tpnvVAlMnfU9YN
	MozNvxdgOiCBfK19BdLUbNjhHCN1NxkpDHAbA5rT0QaoSXS/9yIbGMkaMPVo3EOFrp1iXVYvkf/
	MAAK7LJM5rb2eBeelGYaWmuaWINGLks8Gq8b0kmsEDMYWAY=
X-Received: by 2002:a17:902:cccc:b0:2f0:d976:651d with SMTP id d9443c01a7336-2f0d9767d6amr88871745ad.14.1795787179570;
        Fri, 27 Nov 2026 05:46:19 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:46:19 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Fri, 27 Nov 2026 20:45:07 +0700
Message-ID: <20261127134507.125513-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10

rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 ++++++++++++++++++
 1 file changed, 124 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
index fccb9c4360ca..d8db3567fd36 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
@@ -74,6 +74,108 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+	vreg_cam_avdd: regulator-cam-avdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_cam_avdd";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		gpio = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&cam_vreg_avdd_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&camss {
+	vdda-supply = <&pm8953_s3>;
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			csiphy0_ep: endpoint {
+				clock-lanes = <7>;
+				data-lanes = <0 1 2 3>;
+				remote-endpoint = <&rear_cam_ep>;
+			};
+		};
+
+		port@2 {
+			reg = <2>;
+
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
+	status = "okay";
+};
+
+&cci_i2c0 {
+	camera@10 {
+		compatible = "ovti,ov12a10";
+		reg = <0x10>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam_sensor_rear_default &camss_mclk0_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+		powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&vreg_cam_avdd>;
+		dvdd-supply = <&pm8953_l2>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <270>;
+		orientation = <1>;
+
+		port {
+			rear_cam_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <216000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
+&cci_i2c1 {
+	camera@2d {
+		compatible = "samsung,s5k5e8";
+		reg = <0x2d>;
+
+		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam_sensor_front_default &camss_mclk1_default>;
+		pinctrl-names = "default";
+
+		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+
+		avdd-supply = <&pm8953_l22>;
+		dvdd-supply = <&pm8953_l23>;
+		dovdd-supply = <&pm8953_l6>;
+
+		rotation = <90>;
+		orientation = <0>;
+
+		port {
+			front_cam_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <418000000>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
 };
 
 &hsusb_phy {
@@ -169,6 +271,7 @@ regulators {
 		vdd_l4_l5_l6_l7_l16_l19-supply = <&pm8953_s4>;
 		vdd_l8_l11_l12_l13_l14_l15-supply = <&vph_pwr>;
 		vdd_l9_l10_l17_l18_l22-supply = <&vph_pwr>;
+		vdd_l23-supply = <&pm8953_s3>;
 
 		pm8953_s1: s1 {
 			regulator-min-microvolt = <870000>;
@@ -302,6 +405,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
 		bias-pull-up;
 	};
 
+	cam_sensor_front_default: cam-sensor-front-default-state {
+		pins = "gpio129";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_sensor_rear_default: cam-sensor-rear-default-state {
+		pins = "gpio33", "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	cam_vreg_avdd_default: cam-vreg-avdd-default-state {
+		pins = "gpio62";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	ts_int_default: ts-int-default-state {
 		pins = "gpio65";
 		function = "gpio";
-- 
2.47.3

