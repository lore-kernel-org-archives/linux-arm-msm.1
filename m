Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73A174A2048
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651249; cv=none; b=KXNVAsNg9ftaN+he18A5MxxpunS0srqz6sy4/zJ3gEhJRQsWYlmtVzfbWTrTLbWSWH6BMgix2VO8fMFV8SmFoNxcT+Gd/dP8+spyvPd3KuN81R/WcL6uYwGw40tA+QzEAUdcKwvRlB513KMdpaZLHo350RdWUHLqc3TrGxeCCqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651249; c=relaxed/simple;
	bh=YgtfdbfvI2vm4fPS/2wJh4nA9PTv9/WiG64BLoG52ks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PVRV8oTFFzd35D8KKg9K5eyyQkCFoiXjidKWL1N9Syerr9ob66QW2CG0oJsuAscRMU1hcO7lHpABAebfHVJvxgXDp+MAUwtNUX666F1eZCB3s5wG2eoaWu8qpJ768bRcMaU7+VMbhdVG0W/EmWe5+Olyb4oKq0/VTFfm9qqkHMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/WqY6OP; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/WqY6OP"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f560398so138195966b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 06:20:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651244; x=1790256044; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7X6WiA80d/4eIvf7W7LLXIYdtHYrja0ac8aRvgmZ77k=;
        b=K/WqY6OPXtCjlJkaJrQLII6Oe3BeSpwFA4l4VulP1+TsnbUSwi4oxDUdYFEGNiH+9K
         LyCKPtNSJRXcdErHqr7ycNraPi0v4nuPw7S+Mx6XIN4w6aTnre53GF38rMF6mByGUBDS
         fnVSW4BOUHVEXayrK7V4O8Y+ikXqx5h4GH6ZvnMrvLoHcwU6ps3LtV0Kxxd6wIGreDB9
         jMwuA63osoq2p/M2vW6eF8Q3O3o6M+xyq0ugg9+JdIRMtYaKAhZ4rX3ipKdqi+m3chiq
         v5qEY691aJ0kPO6XVG3aJkKcuiuLNhSIfGWrKamBFk2HQiLNevdol7vojrj6wD3gJYiu
         0z+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651244; x=1790256044;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7X6WiA80d/4eIvf7W7LLXIYdtHYrja0ac8aRvgmZ77k=;
        b=T5sSeOO0IFhtjRjCUvZZI7IPeZ5g/ZfELkydaaoaIS7yYeBWDvjkdMpBZlYTUPyQEM
         8NBjCCg2+N3rM8pg13Usipw52FOW29ktHVvgksQR8FV4XAHY1Krbz4r1Iy9p27IvhVz+
         RlZqMXZk33PWR9eBI9D5+ufd290AwaqHmLy7OV+707c195AYep4qqf7hpQHrnWLp1myF
         3cWN/jYhtgecSlozKQiVsmvkW8SMaLvpEByo5ikgK+TBsZDuvjFi1lMLfEuxGLQo6Y5p
         raH/4Ei29M3+j2Xv+mcJzEboiNpt8o8Xm5LwyrQ+xeGDSOf43PuSbx2d2RbURI2eHHa8
         UygA==
X-Gm-Message-State: AFuF++mGlTDmn7LWsJ96PpaQKVJNnZbFamS5JbvYSVMKzYF+FdrdXXQN
	GJReDC5kTfLAdOFc+OVNQ/4Tu9/P9UeSSS3meJQRcuWYPSyXK6vtO+24gy5cB+RhnAyt66DtPBb
	wqs0lmhs=
X-Gm-Gg: AYBFou0JCzyLaa7Gs/iYWSoOEP/KkH0AvbLcTrqkGD3uNV9TUCidZ5d0B+B34gLU+QB
	Naxn7QOfzFrX3JK/F/YweGOi7Occ8Ufk9/vow484yKcOvD5tLFkeQ7LsGkO5wSOLcDcoXlcAl77
	/dffV/K25rXFE8VRJbUfBQqEbYnZhqE47uM8UGC16mGJx80qgRaCEmEgUbFoaRH6uOW0yR1p8fA
	u84eOOoKtOKa1NklWhxboleYdWnW0YYVIFjztuB6JwxkaxFVfOWGglMJ+by/B4qauSQTU/6MwxS
	AnrYcAfp3Ox+KbQUTMxCugaN4F2wpnlAL29Vew8XIa6TonufVIsRTwLOok6DOMRrs+sorwmxZeW
	/Rj/RgUBMdsz02WnwoAkB3sw1VEcPWChUxuuQpW0YDntTJ2802Oeg1WGavBg+B6xc2aIAjs7q+L
	4fRpPFMCWjnXr9KweNJxZodh7WKLlDyqBOrHfkLNnVMWX1DpbXdJs3DEoRyrCXn5FKSdw=
X-Received: by 2002:a17:907:3f9f:b0:c29:659e:2fd6 with SMTP id a640c23a62f3a-c29e520bf4amr509931466b.10.1789651243797;
        Thu, 17 Sep 2026 06:20:43 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:43 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:31 +0100
Subject: [PATCH v7 06/12] arm64: dts: qcom: x1e80100-crd: Add ov08x40 RGB
 sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-6-1a63eb35838b@linaro.org>
References: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
In-Reply-To: <20260917-x1e-camss-csi2-phy-dtsi-v7-0-1a63eb35838b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-media@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2750;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=YgtfdbfvI2vm4fPS/2wJh4nA9PTv9/WiG64BLoG52ks=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+kgfq0NDGHVXbwKnOpx4m7kB67C2vlo7hEXf
 CyWG4NFq4+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIAAKCRAicTuzoY3I
 Op3TD/0fWt+PnMX3kLvWKEDBkf9LjNXCN8oR3TbTb2VWC5ekRtMks45O+uWdu97njxmVSavWutX
 LUFqADXKEUPkQ+dFLzWmbSNZhle1lctNUC/T9m4MlqMaqWB4PsCAwJvdweqfoESStubfUuIk4uR
 sXVXbrSDu5ht2SR1HXt6UJ0mMg+Pq5uhyg4/iM1F3hhqVQTHWG5dovpaMxM74UA/vhzzVVaZ/Nr
 vsWNt1IUA/Mmdz9gyZtBNBHhOe2AtPkfhz+urboulZ2VtP7V8jim6yLsvaPtSXHBcjFVsRY+MrR
 D8Yi4TefrxQQ1M+jmcGsvVJaqNmFW66DfOcD73FvvbihX2Jz0gxR65+K6SxH2vS0wO1tjHJ/HYs
 kkDrqQD95f1t6Oehlxg+Gge113akryotO0CAxgXbq1m5qag1MG0xPXBTThRtYSGjEo8VdAeNGE+
 MhUhRJa+tHMS6ppeScCPxmsbxI1KwOvZAj9tsTaGLLAuPOTZtt1AfppJNWpXW2ml+8KB8rx+CfP
 GYAKFom5gJqflALr4BTh1xeDLj1uqR/qqHUKnI4cOMRfYZldlsNMSimBJ9fZdqKWOINEYm4DggM
 bbKHoZsHn5axwh6U5JltBErleKyHNfqjBor0K5zwotkUpzTDojAQJ0tybROWZ7SHLjzMUOMq6P1
 ygVpFQSaHpIweGA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
connected to CSIPHY4 in four lane mode.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-crd.dtsi | 82 ++++++++++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
index 47cfda908c515..a98f5c5b623bc 100644
--- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
@@ -6,6 +6,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -933,6 +935,70 @@ &gpu {
 	status = "okay";
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy4_in_port {
+	camss_csiphy4_inep: endpoint {
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&csiphy4_out_ep>;
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@36 {
+		compatible = "ovti,ov08x40";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&cam_rgb_default>;
+		pinctrl-names = "default";
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_l3m_1p8>;
+
+		port {
+			ov08x40_out_ep: endpoint {
+				data-lanes = <1 2 3 4>;
+				link-frequencies = /bits/ 64 <400000000>;
+				remote-endpoint = <&csiphy4_in_ep>;
+			};
+		};
+	};
+};
+
+&csiphy4 {
+	vdda-0p9-supply = <&vreg_l2c_0p8>;
+	vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+	status = "okay";
+};
+
+&csiphy4_in_port {
+	csiphy4_in_ep: endpoint {
+		bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+		data-lanes = <1 2 3 4>;
+		remote-endpoint = <&ov08x40_out_ep>;
+	};
+};
+
+&csiphy4_out_port {
+	csiphy4_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy4_inep>;
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 
@@ -1563,6 +1629,22 @@ &tlmm {
 			       <44 4>, /* SPI (TPM) */
 			       <238 1>; /* UFS Reset */
 
+	cam_rgb_default: cam-rgb-default-state {
+		mclk-pins {
+			pins = "gpio100";
+			function = "cam_aon";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		reset-n-pins {
+			pins = "gpio237";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	ec_int_n_default: ec-int-n-state {
 		pins = "gpio66";
 		function = "gpio";

-- 
2.55.0

