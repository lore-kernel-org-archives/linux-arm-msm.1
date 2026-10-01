Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D811531610
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 14:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790866343; cv=none; b=FDyeDC73vG4iQQT/h52TUFlqBYp1Dg+dntNTAv6o5+HyYk2qSxdu92KyagzJ5VB6Rt3XXFIScZnPFOYku1jKS/Sqz1KuV2V8go1uV+Qd8tQMmGniwdfGHHviK2+BXZRZVXprOrXM9dYFAwjMJTA2o9NMukOV6VqQHqE4lgYsPFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790866343; c=relaxed/simple;
	bh=ESgsFLbZFCngXPnPQ9A3da33dc+1DUeB4zAsWCYNKNw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ugjVH+DWI1LEerTcuVryMtQ/XJY4VDr9yTaqY3kPbYHG8oxiD//TrgMXam6vu99UUYLO1zDuzJb/J+/EGM7dq8g1/CX16gLF3/KFaeE3VHrYAkw6ePEIvcNY+YqgNoz4aF6k5s0hO0nRPjTSR39kjcfLwz/wo/P3JGHJQSQXoSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zatw/jEl; arc=none smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zatw/jEl"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5bb7ae3bdfaso38725e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 07:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790866337; x=1791471137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=TibT46ElKEehSA4Hf9Ywkj/kE0y7Gum3tdai3aG95FE=;
        b=zatw/jElET02YulDtQXJj3VBiwjZ3voEQOVusD7Ga+gwiQRZeF502OeUsGof836RRn
         F7VxVGp5gVy16S18MVK90M+8CMDNa4h3zkzuoi2p7PsTFbCgape9c9TqWWIqT5CpDJ98
         wsmxe698Fu6vHviAsFtvvIj+pF5ZGyvJQNbBBzpCZ50JJGAnjsDm1nuP/zoluf5A9Iwr
         nIdpV6KjaN7J4rqV1fRCeUN8R9ksHqM45KR5aszdAEqmfwPl0j1JlsrUD3JpSpHjAQ2+
         WhNrToP8AoCFf8KY4PEzrDSe4XggD1DYBa2opyS3dhnEiwOpLSexNLZwKqH7wMmGtUhO
         eHuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790866337; x=1791471137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TibT46ElKEehSA4Hf9Ywkj/kE0y7Gum3tdai3aG95FE=;
        b=odoH2TPuqvPKyQB/o1tDbkD2/0h/tELz0acqh59pIJA+272UyuMFNIuEuw+WZVzjwk
         sNUhOCuq3unGUtwmpRK+4s5gGW4z/ckaHXuR94rQEM9eSYAzUKVtcadnMR7UNNWODIQ2
         Koa5u2Z2IU+KIJ5FyGz99dUvb+KHGE97XI3PKqZCVZQUUjU2F/Rety+pipttvL5TlMto
         e3cVSuyp+WOSJbw66E/jqQG7gr/YNhChkDKgqueqmXWloc/T31zgvnKALWi6Nhb1TOB6
         9CSgD4yCHTqrHvPiEnq0uhp1uCt8kbJvrPA+IrlZ8sqcyqkbpgwKk+t+dLFIhNOkyYxS
         +bPg==
X-Forwarded-Encrypted: i=1; AKwUvBx/JUhLDr5N/TAMMOgRZnN3oQRq1NUoA0vwcat2/dyPS+5Vj0dPlm0p6aow0XbSLUDAtxmR7rGiPuQ4ncJF@vger.kernel.org
X-Gm-Message-State: AFq9FYJo0TJ8T2CPKOqfkSooZYEstOZ4Mwcc5QfcwbXpZFr0TCB4yvsj
	hMUKIzcJ0xzlv0oKwpDTkvV6ilTAz/PCqkWCFTDE7otrNjWaGxXEAd6hrxEUNyyc3zQ=
X-Gm-Gg: AYBFou0glkG/vo4TipEt7yYqrVIixtuNtwvygA+PfDOqY24m306kGr0Ehzd1/B1OQ/W
	CVLXUWCsx4vwkeIBKkIBFEQl0ohKm7ERzCBdFpf4K2xpnW27odvIj1MBa6PX6pk8kwqd37acjHo
	h6FjRXIUGV3RhYM1DT6zxde67coKG8EtSJC+m9xMA5mEPuH2/UvzYu1PD+5m3bb47dTWRVKpXLa
	cCXhD+6z8ZkYfXqNElcsbr/0af+0uBjzMa1D8HXGMW65k7FXWRYAlUYQHVFrFU/dBPeo2LTwxdp
	OQj6zfzCEeQz3Nhtb35s4DQHPtYfQgf43YbSy3ykyDJai9ROa6OsYYTlvq9v3t6UKOHaifcbzwJ
	ivfEc9rvo5V25038J3blBhaKHjQmBcNWnOVqzdPvvG+ngFKa0IPjNl2idId+xNJP5E0wnczK3xD
	Ako/893VP64PU0jg2VzTiaZOQ94yqlBrX6osYgrquf5hfS7gxptK8ppCU+fovUDl4rGKtSzmgoz
	piJk1dIdQ9h6n81Q/vPsWXXsPz0TgS40ol2asU=
X-Received: by 2002:a05:6512:3182:b0:5b8:f5e2:cd78 with SMTP id 2adb3069b0e04-5ba405fdda9mr2402132e87.5.1790866337079;
        Thu, 01 Oct 2026 07:52:17 -0700 (PDT)
Received: from thyme (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7bf18a67sm8957e87.79.2026.10.01.07.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 07:52:16 -0700 (PDT)
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm8650-valve-deckard: Add initial support of camera sensors
Date: Thu,  1 Oct 2026 17:52:06 +0300
Message-ID: <20261001145206.2442665-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial support of camera sensors on Valve "Steam Frame" device.

The change enables CAMSS and adds description of
- a pair of OmniVision OV6211 monochrome eyetracking camera sensors,
- a pair of OmniVision OG01A1B monochrome front camera sensors.

There is another pair of OmniVision OG0VE10 camera sensors found on
the device, its description requires a combo mode feature support in
the SM8650 CAMSS CSIPHY driver.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 .../boot/dts/qcom/sm8650-valve-deckard.dts    | 203 ++++++++++++++++++
 1 file changed, 203 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index d25a09e162dd..3b2503c3c541 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -95,6 +95,66 @@ vph_pwr: regulator-vph-pwr {
 		regulator-boot-on;
 	};
 
+	vreg_cam_eyetracking_1p8: regulator-cam-eyetracking {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_eyetracking_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 74 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l5m_1p8>;
+	};
+
+	vreg_cam_front_left_1p2: regulator-cam-front-left-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_left_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l2n_1p2>;
+	};
+
+	vreg_cam_front_left_1p8: regulator-cam-front-left-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_left_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 36 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l5n_1p8>;
+	};
+
+	vreg_cam_front_right_1p2: regulator-cam-front-right-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_right_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		gpio = <&tlmm 37 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l2m_1p2>;
+	};
+
+	vreg_cam_front_right_1p8: regulator-cam-front-right-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_front_right_1p8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		gpio = <&tlmm 36 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l5m_1p8>;
+	};
+
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -675,6 +735,149 @@ vreg_l6n_2p8: ldo6 {
 	};
 };
 
+&camss {
+	vdd-csiphy01-0p9-supply = <&vreg_l2i_0p88>;
+	vdd-csiphy01-1p2-supply = <&vreg_l3i_1p2>;
+	vdd-csiphy24-0p9-supply = <&vreg_l2i_0p88>;
+	vdd-csiphy24-1p2-supply = <&vreg_l3i_1p2>;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			csiphy0_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&cam_front_left>;
+			};
+		};
+
+		port@1 {
+			csiphy1_ep: endpoint {
+				data-lanes = <0 1>;
+				remote-endpoint = <&cam_front_right>;
+			};
+		};
+
+		port@2 {
+			csiphy2_ep: endpoint {
+				data-lanes = <0>;
+				remote-endpoint = <&cam_eyetracking_left>;
+			};
+		};
+
+		port@4 {
+			csiphy4_ep: endpoint {
+				data-lanes = <0>;
+				remote-endpoint = <&cam_eyetracking_right>;
+			};
+		};
+	};
+};
+
+&cci0 {
+	status = "okay";
+};
+
+&cci0_i2c1 {
+	sensor@60 {
+		compatible = "ovti,ov6211";
+		reg = <0x60>;
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam4_default>, <&cam4_sleep>;
+		pinctrl-names = "default", "sleep";
+		reset-gpios = <&tlmm 195 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_l6n_2p8>;
+		dovdd-supply = <&vreg_cam_eyetracking_1p8>;
+		dvdd-supply = <&vreg_l1n_1p1>;
+
+		port {
+			cam_eyetracking_left: endpoint {
+				link-frequencies = /bits/ 64 <480000000>;
+				remote-endpoint = <&csiphy2_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c0 {
+	sensor@60 {
+		compatible = "ovti,ov6211";
+		reg = <0x60>;
+		clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
+		assigned-clock-rates = <24000000>;
+		pinctrl-0 = <&cam2_default>, <&cam2_sleep>;
+		pinctrl-names = "default", "sleep";
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+		avdd-supply = <&vreg_l6m_2p8>;
+		dovdd-supply = <&vreg_cam_eyetracking_1p8>;
+		dvdd-supply = <&vreg_l1m_1p1>;
+
+		port {
+			cam_eyetracking_right: endpoint {
+				link-frequencies = /bits/ 64 <480000000>;
+				remote-endpoint = <&csiphy4_ep>;
+			};
+		};
+	};
+};
+
+&cci2 {
+	status = "okay";
+};
+
+&cci2_i2c0 {
+	sensor@36 {
+		compatible = "ovti,og01a1b";
+		reg = <0x36>;
+		clocks = <&camcc CAM_CC_MCLK0_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK0_CLK>;
+		assigned-clock-rates = <19200000>;
+		reset-gpios = <&pm8550vs_e_gpios 4 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam0_default>, <&cam0_sleep>;
+		pinctrl-names = "default", "sleep";
+		avdd-supply = <&vreg_l3m_2p8>;
+		dovdd-supply = <&vreg_cam_front_right_1p8>;
+		dvdd-supply = <&vreg_cam_front_right_1p2>;
+
+		port {
+			cam_front_right: endpoint {
+				data-lanes = <0 1>;
+				link-frequencies = /bits/ 64 <500000000>;
+				remote-endpoint = <&csiphy1_ep>;
+			};
+		};
+	};
+
+	sensor@60 {
+		compatible = "ovti,og01a1b";
+		reg = <0x60>;
+		clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK1_CLK>;
+		assigned-clock-rates = <19200000>;
+		reset-gpios = <&pm8550vs_e_gpios 6 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam1_default>, <&cam1_sleep>;
+		pinctrl-names = "default", "sleep";
+		avdd-supply = <&vreg_l3n_2p8>;
+		dovdd-supply = <&vreg_cam_front_left_1p8>;
+		dvdd-supply = <&vreg_cam_front_left_1p2>;
+
+		port {
+			cam_front_left: endpoint {
+				data-lanes = <0 1>;
+				link-frequencies = /bits/ 64 <500000000>;
+				remote-endpoint = <&csiphy0_ep>;
+			};
+		};
+	};
+};
+
 &dispcc {
 	status = "disabled";
 };
-- 
2.53.0

