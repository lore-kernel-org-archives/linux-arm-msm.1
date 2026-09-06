Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 364F33E3DA7
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 14:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704484; cv=none; b=qjRkICSYG5h0S6Qf7ryrNcoiWYGKTfZ2ZVODXKal4M4U8n/c4hT2HFchjLlDAZ1/4MFJs72rDfWyO1n8PsaX8L09I4qanvKBgZK9WzxDOuTajttHeSlRh56UMre1AA4OuCV6W4eddodEHQZ2ltkQFSE27NK10OE1lxQF3TCDvqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704484; c=relaxed/simple;
	bh=1VRTsFTC60/G1pwCAiarEZqnPYpc9Gu4FPipcpcq8v4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hSpWCNoMOPndd9RKtqec5XeW2st4tkcQQo4hykMBYn9D7joiL4xj6arlxWtAFi5doquUIruNmcVz4MoMpUA/jqCMDEYZThbPRtEzmGfGyX2FEVRGj65M8Yzia6/wJro2AXugppoD9KI2f2PfKn5ZWViv2Aw/8+WeQYZv2hmD084=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=x3/CLJac; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="x3/CLJac"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-48436251906so2952015f8f.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 07:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704470; x=1789309270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9Jtqyzfy2nqRK3ZFnq8BXudptOX0yjTYtKuuyiqQoCU=;
        b=x3/CLJacPauYW6dnnY8iQgLhgUA6vSE5LPBbhMnz/SasnCGUl/Q0Pa12nwG+s6IAKn
         1IQA1nciSlfWK/5/E94V415sEQYhQ+NgbFU/d9l+LW9hgNAHie7Ux/VDaWHLrdCYFK2/
         m86bsCKhTK7MLFajkfECWs41Yth87rhyXhwJ23z+QSNa4Z4NV0SmE6e0e8F/V+sIBALz
         ApaK2lVKqivwWrOWF3Agw6Mohcw45L+B1oNrY3oHgiLgOUBEX5AMOYQLW5GRYwSx1KMh
         UzWupipxeAR/vwuwNMZumqBSwZUFYzOjmJJsjNsI2jHPsXnPOeN8Q6RwPJ0Uo0wpndEe
         /u0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704470; x=1789309270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9Jtqyzfy2nqRK3ZFnq8BXudptOX0yjTYtKuuyiqQoCU=;
        b=ghT2xXlDrUw7vzlXLy00HOwRHZy9ZsdxCW0TmLbwYRlbdgUgWz43Ba93VG6zNX/Rq2
         JPB7SVy8VWtlBsCcMpUj5N2uRqrdASwQfAQ027GkHkCrHeMyF7sWZi0q7pRyBZqUTnaK
         BvPZQELNazj2REIpR9nGzruX4QAJRcCK44ttUity6/fbQUxephpB0/hEGwGSQlb9Y/H+
         hdI2usQNdO7mf9OGEgdFpYE+qzJYC2kYaZdss2+h7d509uZHKbJ8YZThpetA6VplkPd/
         c7jC6k1rOWjtIBiYCwJwhZFmXHrr79sOwoiT9RISs30K8c7p0izxthro7BOm20YjfmzV
         MGTQ==
X-Gm-Message-State: AFuF++nvF6tF9NXSjkOCPPTfpDEmevmJsgy1hnlWyNPiA+khIksLSiUZ
	CqU9QILsXcGmCSK+xIrb/RIedxgi5Mt/9ZsPCENRPfyL7H+wDRtjpvFQjOIwP3z8GcU=
X-Gm-Gg: AYBFou2LIWGBb4Dm/VPvSWP6jIGXL1Q/D+dVpMoFa7t4DDIrGAlWj/Ald+YR6fExwcC
	YWeOpvv39IkFpoAao3llSE5NQu5Ms6gEDu6h1q28+891NaAEIXT5mUhR/KSGCZ2TdIszSKkveah
	zZ/OCU7Nq2L4Rck8Oc1jKb213tLqHVhSr6bAKTwIwPBuU4aWpNt9NzD2hDq+YzPETyDYN/jC9nY
	gzJWO6z5zuj/r91MwlbVlsCRZBenS8bY5Z40vZsVtOoTsiCLOudJEVMa0VPwXBwS/s2DO4pG0Ss
	0bOYBkA+2/pzlOBj+JlJ6vE23eg+lQedfFvxGCL2u0GvB/do71k7rYFE7W4n4WT7JYZYr01ruIS
	U78CJP9b/7xj8YC9jQdeYE7cB3fGp8mBJJOZRJlQjjK1m5/5mLd9EyIEqsEvkIPLF4EaSH7XWzG
	pvmpb+8v18YWhnIzU7VpzcsPEr9TbarmwyuLqr3ynGpqh+FGCgrGy22vCQpYVnUF0aovR0cjVM
X-Received: by 2002:a05:6000:4302:b0:485:96ac:5a96 with SMTP id ffacd0b85a97d-48596ac5acbmr10210170f8f.16.1788704469823;
        Sun, 06 Sep 2026 07:21:09 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:21:09 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:58 +0100
Subject: [PATCH v6 13/13] arm64: dts: qcom: x1e80100-dell-inspiron14-7441:
 Switch on CAMSS RGB sensor
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-13-067f2ecc4630@linaro.org>
References: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
In-Reply-To: <20260906-x1e-camss-csi2-phy-dtsi-v6-0-067f2ecc4630@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2454;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=1VRTsFTC60/G1pwCAiarEZqnPYpc9Gu4FPipcpcq8v4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbE/ag/k7Plj+bNQrX/aZahvQSGYmI8kklHl
 NJnogpbC2CJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12xAAKCRAicTuzoY3I
 OrhJEAC9Zza/Aa00r5tDYO/v5c+fo21iPnR/SFt1M+b3HqeHiP1Owvg7UH8gis8bzXwnJ22GRk4
 Oxddw0cnEx4OeHSGUEq8HTXIPQSW/hBZLD9qhR4ZrkS3MZMUA6VNoPo1H6COBLAD5G13Mvm+clY
 hvCh0HPtbdL3RpKZQW7br0LM7+864HzCgX5aGtfJZgmhFlEBE64LmBDkMQWqigBlIvepIEsqGZl
 UbD2ldCrF3a8/2W9f1J4XvyNd5YyGkhSMqwEKAv5zzZFOMBm/KIMjYxMrGhztkvr7M1SW6Zk6d6
 7uI9kXbtuTZcK4QIxSfczEdYfdnNfO35d2ISiCiZ+PpmlYL6f4/h7zNVJKNY+8U4WEYbTV6GZPu
 71gEQR5ACxtf3FdhgnqP7UDf7X6Q3DhNQYynTvzxpqcw7+8Nqsk2T0DVfSTXFkmzs3aRvhLzom/
 TzXAvGMfanHYNiEceb3Yp5/USeyKi9807rB1qMe1k8ICxJ6lHhIComylsr0KAI3lDvHXnBhacJz
 4rNWnoI6RXxgU46KgpbPBa7/BMM4zDwoT8/BsFme7WrP5J1jLwNOJ4oegEEzEuU+/BApTmeNalQ
 DHYH1/Ax7sTBg4Rrwmyks+T+JSb0p5QIy5W4Mj8W+GvRivSd4aciWiQLs0ZeMneSTSQy3sZoiDK
 7EJIJ2BLelXjNPQ==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependencies
now.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 82 +++++++++++++++++++++++++++++
 1 file changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index db291730130c7..ef20a999cb6f2 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
+#include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "hamoa-pmics.dtsi"
@@ -792,6 +793,87 @@ vreg_l3j_0p8: ldo3 {
 	};
 };
 
+&camss {
+	status = "okay";
+
+	ports {
+		/*
+		 * port0 => csiphy0
+		 * port1 => csiphy1
+		 * port2 => csiphy2
+		 * port3 => csiphy4
+		 */
+		port@3 {
+			camss_csiphy4_inep: endpoint {
+				data-lanes = <1 2>;
+				remote-endpoint = <&csiphy4_out_ep>;
+			};
+		};
+	};
+};
+
+&cci1 {
+	status = "okay";
+};
+
+&cci1_i2c1 {
+	camera@10 {
+		compatible = "ovti,ov02e10";
+		reg = <0x10>;
+
+		reset-gpios = <&tlmm 237 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&cam_rgb_default>;
+
+		clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clocks = <&camcc CAM_CC_MCLK4_CLK>;
+		assigned-clock-rates = <19200000>;
+
+		orientation = <0>; /* front facing */
+
+		avdd-supply = <&vreg_l7b_2p8>;
+		dvdd-supply = <&vreg_l7b_2p8>;
+		dovdd-supply = <&vreg_cam_1p8>;
+
+		port {
+			ov02e10_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64 <360000000>;
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
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			csiphy4_in_ep: endpoint {
+				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+				clock-lanes = <0>;
+				data-lanes = <1 2>;
+				remote-endpoint = <&ov02e10_ep>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			csiphy4_out_ep: endpoint {
+				remote-endpoint = <&camss_csiphy4_inep>;
+			};
+		};
+	};
+};
+
 &i2c0 {
 	clock-frequency = <400000>;
 

-- 
2.55.0

