Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609996;
	b=BO85n4mCkIUDwcXT5Z6JOLkzXODKkrk/BaS+y07LJ0iJe/AEOllFtwzCGgEq0FTa5dbh
	 ScB848TqacIvETy3rnqP0l/1x5LVkR/GUUX2OduzPky1pZLjwx88lXNTgPP+rVyNHkVNq
	 Zl1IWNWZcQCF9dRnYyeQvQ2B4WA3Wqr/TsGwG5mdzoYntM/484PIXpK0aSz2Wc7LPnNDO
	 HWXj114xLfHwuYrMlCL0d9L5kF5uxJ6HFsah73iJg8FTQkcLlsJInPnXdI57zLG2IfNfj
	 jn5rduGJiYeOBSZN3TXyuYeQALIb46K8tiXkd2MpNJA3GRhpMSVHTp4himTnae1S03A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609996;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
	b=bTz+hhkH7YMMmgsyVJqZELNklhotI2oLp79Fg1fgcnwg6KBNAI4FNYvQCoW/pRxxsqdU
	 EZjuleRx/H2o63ZINFIKxpDQznGxyx+nnjwbOovBsi2G1m9Fr6/KaUng85KgvcrERU8x3
	 2iRIBJmiFJOdZP3uJTO3CPrTEJvahwhrfpOnqnK8f7gRqsqwKbzN40Tu3iIuUEG0B/R20
	 71uAG0Sf27u+S3/Mr15SeuXMcBQlF6PLIR2q2t89i45oE5jablBNCgHX749QVZ5AwwSEl
	 bk+OjUC8uEdS2OZuOZw8AapiBOl6SeeGy0MexL6WpihpP9J6bP+9eEjoMH61xO+In2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="qgf/rxEJ";
	arc=none smtp.remote-ip=209.85.215.172
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AD2606A333
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:33:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AD2606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qgf/rxEJ
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-cd62c570b5dso3823726a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609996; x=1796214796; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
        b=qgf/rxEJbxbQk0k4cDRQ2CUScsPmBOb32E8eV7SSGbTmDRbgYCKL+rs+qu6txu3x7S
         cjI9087SNrGDsqNfxE7Tww5wmtC89VG8WHBtct8fjTrDhGiSrgUzWq92HybFy66Q7+Mh
         7sLaY0t19HW9EWdOuhDlzCjKhu7VJeJZlX19RhOvEmTfIxy0YdZ0cg4oZddsm0G0wbyl
         I8wjsPiXsqdS4IV5HSPD2d9HiAm/91i+D31wPtwHpvD+wyjmVk5TOzZTRcB2sCf1BHI+
         IvmHh7ZTosiAVRfVsx+BQrfehi6Ert+W6ekLsS8rYMVaFjKWiLOh0/4JqEmJZn84vZy0
         5WJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609996; x=1796214796;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u9UxTbIvHn2NymkmK6sTzYgQuFVw5L2GmRCY+f1oSYM=;
        b=Qwv++FmlgOMmTBAd1vvXF99TgNl69FhK/gwpK1PVg5HL+fFl18UQhw7F3SiU7rJ03/
         BXielXxi+SkEUmWiebR/BBlKwANHpj0EeozkjuGRgOghh5MOq4upI5xKTRCqXgBTKV0r
         eL4AAenxWBqmktGq7W20kFqdj0z6dSZyUSt5l8e0lmYQkR3ldkCyJTbkyY/MrL5TLy3s
         As0TPLBpKfzEVSRykedMNxxsEVQPnEVq8qOLkCt6Qgg3fBDSHOPuFyiSRcdd8AUyBR2M
         bwoDgHDldqGdzMtYZX8IAiIZid2O+7CVOExo2gcLoqJ5dei7dDiJMCpzV4PI4Q/QFKm7
         VrKQ==
X-Forwarded-Encrypted: i=1; AL+hErHT4l//Hpc4QGUECfwPvm2G8U1r+hZI1wrt85JTnMO4RtCUUyc9+1XdndOPG3VGqTgsmi0BQ58Qj23jq9kk@vger.kernel.org
X-Gm-Message-State: APuU4Z+49HD3dkbdQO6ShKqFg9Oa4GZVCbUwbzWBuojO8NMrOpU1VHsh
	48K3+rGcgS8gAGNbK8r65qaJZfGSNdGODIGonKvlgtgLYzg/0CZOsS4i
X-Gm-Gg: AZFdTZdwdS5tk40UZp91WZld4xiRLvXubZma7ZWzeDQMcqHD1wPNGy4uqv+G4yNN4wC
	+z3KcjII6tdDIrE+Xh/LR1CNTYoOMBIeo7YQZGzlSAmlSwswtSaXCmKBLVjpVITMY/Q/4Gzg3eh
	1atiIwl3rNSoFWWbLplc/6tsrhxT+GMPyyV5MqasDHeo0kGBtplawTjGdtJQteP9xWskKf7iuwj
	FYgOcaNCAqU9of+eZNfiKbN0qlbFva/eUlzqy0zytXpCJCZnnUlsOkDobtHMUe+ru3wVZUkddGF
	B4NnFVxbULRZm2GYQlG9eRdLR9S8zn8vPlwO0g3Dro0OZfQxRYgcb0M5b3WAL8T1y83H0MAqGxY
	xg7waWSWYFSud99FJyPxcwcZ+RIg2a71ZyJg0EPS28qX2hw8yI9grMrTz23cXnd8tm40fca58Rj
	fZveEpsU88yZfHxc3BU0LsXMoAKRp/yy9sVzmb+lUjp1dTidc8CJSMVvZOJ5O3Toi5MAhJ3as7c
	VDMRFvkfeAu0dNozSH9H8PB/hzVsdsg2a9HeFNVcpoAIhkmheZ9tl7jJOkKf5rGg10IoA0NDLTb
	gGjlSqddTUYsnBoSkD2M7ZMIv8PHuoVlubsWfSZyEq6ETH9u+Vdpyu/r1oS1dsRZZAxW
X-Received: by 2002:a17:90a:e7d0:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3b41cb3276cmr17251989a91.60.1795609995742;
        Wed, 25 Nov 2026 04:33:15 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:33:15 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras
Date: Wed, 25 Nov 2026 19:31:46 +0700
Message-ID: <20261125123146.379057-8-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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
index fccb9c4360ca..87db6b18d191 100644
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
@@ -154,6 +256,7 @@ &pmi8950_wled {
 };
 
 &rpm_requests {
+	vdd_l23-supply = <&pm8953_s3>;
 	regulators {
 		compatible = "qcom,rpm-pm8953-regulators";
 
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

