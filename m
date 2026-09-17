Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6606D5221E1
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 13:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789651258; cv=none; b=sOJbb6mamkxJz2+VfSENFMyfa1K/X0IbhiRIthHPirYZH/j/x63WzkBLRTWlFGJ8sOevpllDFsRRHRWHSYSirZZAftLY1cOpF2MqTbFQnLRtjpgoPdtfYo9ZX1DMfR/VWz+Tucd3jLkOQevTKHzI+sHSzezHAOY82Br1CD4lWo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789651258; c=relaxed/simple;
	bh=umKS2avGCEdkRQmhIBM8YFil2eP/51Z0Phzxs7xmWJI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iBLidAGcN7FsCuSUUmKdluq4n51eqtjxZWV0kiHGqD0U/CWP5TyIFYw5+WcOpUfA4Ms8k8Bh50dIQYkqUh3Ftm553NeG3lIFMgO7reF9DUAk736t85WR4nvkB1s/2wLt5dzqimqn9G2ctjyAcH1ISxuKivquL5b+72jSFy1J0fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LhbyERWq; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LhbyERWq"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c254f6c7a56so116680666b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 06:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789651246; x=1790256046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dQ3Kd/Lwo1SRIsB/zhB/eEd6rVq/wRMfzLXcBlo/5ks=;
        b=LhbyERWqas5lcgRxeiqzN6G/yD0XdTzG8n9m6ihnrAANUyijcI+6pG6eHgxtKpGCdq
         BVH1n+41jAbIF6F0ZG8+irYWPQ2oSuQ5DF6l68/NOH4AmZKF8Uc/4JScbhkK7dYT247v
         p8BFpys+VvhtXOhcaJsMd/6zK6SvTPYqnwdU6SXbGEa06ZGuVF+XvPn5GYTSSbOuYZIA
         Nxgwt8GCAIQCqtbvo1EFNdOw7Bwc+7BhwIGw76pgv9vCX4SAAVr5SDrmm6e/htMRvXKI
         ouOfXacwlhXy0qRQJ8mfHFQof6MY5BFJbPRI/SX/Mkr+3XS8nI8aLSrptMVcMQZvIWwj
         K7yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789651246; x=1790256046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dQ3Kd/Lwo1SRIsB/zhB/eEd6rVq/wRMfzLXcBlo/5ks=;
        b=JBJumEmigmmhqwtYuMYKVq+fkL/y/jWf6wBh3SMlWJa/KOvBujoG/qtSpWTPqZjq5E
         KSEzjEQOcWVRe/tNiw7YlOkt+jF6eZrbRnDCPyOU7qQWUh2J0O4LwhdlnlgXO0gf6zOG
         QkvT47gaUiIWqACAzqPCtglpYAC+PZcX4+cA52cReyU50d5AAsUPU6cCxi6Hq2TFAbId
         XWTH2yn/EjRREMaIU7TtncgkvHLpMd5z+c3rR78f0ytyojg8q/og5qw/xRf1StBWGFcz
         B0AZqv40HIUfizwU3E5gl/IwakuNH1MUYvXKWSK2s+YXKeFsRw3BMQl3rn3WaS5RQ8eY
         vbww==
X-Gm-Message-State: AFuF++lXabKGuOjtn40mbTVZ9pVpE7lG2eQvWwakXkkghx4sRkDdmo59
	fpVVSrcGh8fTyzh6rZDnNMmDiwTt1pTCuqUpJBWp2xXgJ17RpCIoIco7j6IBfsE7o/0N5MnqjsD
	/5neTW7A=
X-Gm-Gg: AYBFou0RyPdh3rXoAamsg+DYandyMRLX3Z0S+FqLY1AWkhWOzzm+pUNGZoT66X+AeYu
	TVfLC+Iddyvdh51xYAHP/EAx7nO/NjxO1ODIazM2Nt8Ro44mKXBYq2k5QO/qfR6TP2D2uvAoB4T
	api/EZW7rorsDKs4MLdIMZb+/bvQwQ4f2hb1i82ckK0cG/fujtiCqzdMbIEare3cbRXxO07TvSV
	wK5JTNvvvqiZFiFruoz6o62Bmgmtx9sStJ7MEVxr5glDajjk880z0t4Q44THAQujJ4SUSJ1oQM3
	Zal5eAgEOOE/0CiNj6Zf+kK0GC22+tMcM1af2O2MxWISe+LIzcGI+DVBYaEaK7bNRyTnxqnYE5A
	U1yo5dfYsZgUvqFbQlqfw8Yc4rX4uzw9i7HAyUlfazpD/Ucajmk9yWPGx/s49kTx0dGCUqhbiUk
	PTyar6y/qyPVRcWlXtaF8kqJ/TMjO0Qxqj3K3TqV7z4jN1qKgqB/qFOI3eMUji24U1MfSkNDdAa
	hZI/OdzWA==
X-Received: by 2002:a17:907:9343:b0:c29:5340:182e with SMTP id a640c23a62f3a-c29e51dc0cfmr470286866b.2.1789651246133;
        Thu, 17 Sep 2026 06:20:46 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.29.130])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de5e4ca9sm279681166b.42.2026.09.17.06.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:20:45 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Thu, 17 Sep 2026 14:20:33 +0100
Subject: [PATCH v7 08/12] arm64: dts: qcom: x1e80100-t14s: Add on ov02c10
 RGB sensor on CSIPHY4
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-x1e-camss-csi2-phy-dtsi-v7-8-1a63eb35838b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2795;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=umKS2avGCEdkRQmhIBM8YFil2eP/51Z0Phzxs7xmWJI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqq+khFTnzyfPglSDKRhe9jhJ248KVhsVPA721w
 maThl/mHh6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCaqvpIQAKCRAicTuzoY3I
 Oja3EAC3xwXRn2CnbM0LqkhMDSHIb6egUVT3Z4/USTJOaxCioeLFZxFJqP34dWW3SSlYeOf0LDN
 HaSLy26QHiLolkGa0nFeC2c0SUDx+Pk4xQhGJnhzYniD9HdyeEvjsE4Ll40TFMoxFzAqTdk6FmS
 YZDUokzUSnJOHwa7hhJbxnVvTc4M5KNEV1sMWFbMp/Mz4/gls9Yj8FYOQPXSVXq3PJRwzxgwXGf
 RQ9lBZnHLmS6LCSFWqktfqArHWugOPWCPBXjFqrvseaVJXAFDFhIqREIc8p1tlEz+ogm6Pnk1cM
 9mNI7NhZZcA/JeDQ9Q1AaEeDHLcq+vjF+dDQOqck1zZ/I26wfSM14S1xlr/KrizHcWcRoL1dnLL
 /9++ITHKabEZyHJStti/G/T2KUST+/aPu4NA69Mr/2NAYjF0utew8A80jYxMo6q/pyvHEr1e7VS
 9obWXQ32gzhlD3o3qa1pciSE8aL483gP4x7dU40kU6XOhwLqYaB4+jRHBwSgsDrPumS55/MdX6O
 l5zz0ZkxxLUDk8R+/WjdPVKycvaaQlh45OtFW9niUMiS26fUXQtNYyHmbZQZYzhBUpjN+GTCEcc
 fabOGYY+E0p1NlbamnWav9vaC/cnwYdOmGXuIjwv5wTAPbWfGq+iF+35ZOAPgoEg7Drr2/WiaMR
 cAnqElNPFkXTxCA==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Switch on the ov02c10 RGB sensor on CSIPHY4.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 83 ++++++++++++++++++++++
 1 file changed, 83 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
index d2eaabf917f11..f8b0f9fc0a6f0 100644
--- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
@@ -9,6 +9,8 @@
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/media/video-interfaces.h>
+#include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -866,6 +868,71 @@ vreg_l7m_2p8: ldo7 {
 
 };
 
+&camss {
+	status = "okay";
+};
+
+&camss_csiphy4_in_port {
+	camss_csiphy4_inep: endpoint {
+		data-lanes = <1 2>;
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
+		compatible = "ovti,ov02c10";
+		reg = <0x36>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <MEDIA_ORIENTATION_FRONT>;
+
+		avdd-supply = <&vreg_l7m_2p8>;
+		dvdd-supply = <&vreg_l2m_1p2>;
+		dovdd-supply = <&vreg_l4m_1p8>;
+
+		port {
+			ov02c10_ep: endpoint {
+				data-lanes = <1 2>;
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
+		data-lanes = <1 2>;
+		remote-endpoint = <&ov02c10_ep>;
+	};
+};
+
+&csiphy4_out_port {
+	csiphy4_out_ep: endpoint {
+		remote-endpoint = <&camss_csiphy4_inep>;
+	};
+};
+
 &gpu {
 	status = "okay";
 };
@@ -1447,6 +1514,22 @@ &tlmm {
 			       <72 2>, /* Secure EC I2C connection (?) */
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

