Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F01E4424D5A
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 14:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704469; cv=none; b=lOJXXc6otRvCKY02vutKfyQOVW7iA1h9GtF9eXt583tKD2V8uEvIcG7eUUPwOn3yom2oQjpjNUYE766g5efdamy6hm1Xr7NknWp334FJB0rRAiG/tDEGELNOaNyzTjLfxH4GDV5IlUSIvWVImX0lfhZ+RDM8bn8g2ZWPPemiuPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704469; c=relaxed/simple;
	bh=rywAnVHedizvb/68yKvivbccv1PXlPLYrU5uJGws29w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tEZsw3vDwctBNdhJmdBIq4JVC5JLEBwHI3Y2EjtYdtwegUtBx+MJ2w28DZkiCT4tiYFeTP4F/MYNc2QOVGaJ9MAWEYOH9ttAIryCkPa2z39nJQcGR+WYY5mpVx7PrgMwnGTiGCF8+Cq6ViP1FxJhs/W/OBbnSfEtHUim0NGVNGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r+X8L2KU; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r+X8L2KU"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4859245e493so791750f8f.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 07:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788704459; x=1789309259; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqZHXzkiJUtDXrZ/LGy/8d5EzRb7vWFnXqfYpjPHiOY=;
        b=r+X8L2KUR8cep2NPEnFgbp0+gCZ40Apw5rjAB/E+DP0wJHrPl2thO9TObDsiF2Oy7E
         3swNkWYeT7Y7sluk/KxRwtgSPrJ9HvuAOSJjKfXG0COHv/A00qQ8pwtSRO3IvhZHdIuQ
         tp+qSGyjpamyfBH7Tzt6cMMedwMO4zPV208ylAkP25ysHoDZbyjkSS20Qmz1K1OvhuUD
         T9yB3op6L4eB0jghjiIS6ba17JNnxTnu+1Nb2vwCeO5aVwab1c9mIOdK4PpgwDJo26dY
         qK/r3i1WEJTIs7rqCaNUvaoBFafdguahXtOvXjmPi0OOysGZFmRUmNhlSvDM/fcr5syX
         wsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704459; x=1789309259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqZHXzkiJUtDXrZ/LGy/8d5EzRb7vWFnXqfYpjPHiOY=;
        b=LZZzuvo71N7MYT3+Fve66Ew537vgOrfOQwuzcC+I4Ll+Zk6N3vWQl3wxecBUAUFdW5
         /zf0P4IkWXyQSOHBIFGgcX81A+GGXAIV11Bw9plod5ZbtkER0R45dkpyMn+pWDDW/ecx
         2xvHKkQhffU9L+Xf6UOBBohVvK8gLbrfWh+9tvzI+vWZFwVnwx8UbHDfJsYQE9ese3YO
         AFQlmb9LAhh9+UZbyYuVDzlnpNZeFO3JXU0EiyxlHJDdbz6Zh2usW80+JjKNDUM8BhG3
         EqiDqHCD9mVmQodNFydPsYSfwQ+lHPF8or/QxWt+O7weMvNvlD8RmTwGbCnNC9oN7EcM
         jn6Q==
X-Gm-Message-State: AFuF++nSll8heEEFapfymG0LnWxfJ+pTAGrntLRquesFid0/30Ln3HTu
	46tVx6trCe9t8naios4N5j0cOu3RrydPV7s40G/9ciR1cG9krT3pTg87Xp4CEHNRdxdwKXgxWOM
	BOUggZyc=
X-Gm-Gg: AYBFou3SeY3lqvpVpdeJgxCfRCI8JLEpMXTr4aeElGIgMzLra8IaFHzUHybfmA/yX+z
	X2RxAtOYozYKJgvqY71PYqqm+6+kxICc5MbHiZqeCa2DwnRMeKdfX/ga+n6w4MuE5dYcGlbYx3b
	B70pLnLoaLqEQrHEGxVCHxXHhthUVWMPwQv1hZFtfeVPCnDp3q0x0PYzWFs98DOw4UkuXF4Uywm
	xD9FOWeB9IoHIXbKlJQS8y8E/cN2fYntft7Zyxnkkq++sdq61rI2tOOvh3vNijHajRVzaQGwCb9
	tDHyXKhqMDVZvNRaxsGyExFc9SwpUT0VAnGyhMGybCePzdhuWTa4Q3fIqnMjjCNHh73K7n2bd9k
	LEKq4yu9dCGPKyO31F+CvjKSgq3E7QV+PRma3UPJslDgBPSa2vN6lErJj68zVWT9z50+x+wkoCN
	/PcuJoCk1ES5GFTh9/wtIKHju9EfUIQwf2f0hAW2GYqlkvyKROujp0YuY4Sk0MXSQsG3NLDCQv
X-Received: by 2002:a05:6000:26d3:b0:481:5b58:c589 with SMTP id ffacd0b85a97d-485870935eamr18686838f8f.10.1788704459439;
        Sun, 06 Sep 2026 07:20:59 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.250.151])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485883953cfsm18065125f8f.13.2026.09.06.07.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:20:59 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sun, 06 Sep 2026 15:20:49 +0100
Subject: [PATCH v6 04/13] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-x1e-camss-csi2-phy-dtsi-v6-4-067f2ecc4630@linaro.org>
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
 linux-media@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5073;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=rywAnVHedizvb/68yKvivbccv1PXlPLYrU5uJGws29w=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqnXbA4iRCVx3K8gDBkwS6Ne/eFdfBfLxqH4vhW
 k/zpnQ8iwOJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCap12wAAKCRAicTuzoY3I
 Os3kEACZLslEIu1bOC04iSoM4e1PFiyepDKcqYlt5yMd0XUA1Zyio5L/J6crSHNXLO2L6mEdHXS
 UpJYNPRVm42Yv0FIBAE07o57eavKya5aU6Cde3XFuWCPNCOh+v5S38WPmN9k14T0c/qaw6owggy
 m2ijEwopSvG6DsRMCSlPoFtqLrXLQW3Rx6kPomXIWowd9rYX8kQIRudMKnS1CZO6ZBBkspgDRbB
 aUmRvg3dQev5lIYzxgGkh7WrGja2ooGcoS68uP1LG+o8ebb+ZbHyw1Qg8fokw1jLkPgln9X+bQt
 1R3DCrVBXe3HvbTUJGUNa958yI5tolxtJ+ZS8cAOCu2tqSLnqrod9UK5/eF5omFvI/Q0jo54nxS
 WyQdguX3VlZkfpwMole96kRNlTskW5HByvr3P1Xx1pcpUupenWa8pOgFNCobkH43MkaMblW3OPk
 adsA/da1SW2I/Ug94QS965nMPajfbw/efuCjsFnuW4/0E8oAxbYgntr9JRSk74YN+OlubLsvpbL
 DGoCXTAlCTxNGXDj/KHbzRJheanpXfHWzBJTsJVpEYITB03Gv3nCGwHzQCSdTobbjw1r/tmn9dz
 i01OPmCM8T1onPuoDZVj4avRvEfsNhV2Dr6G1lTjIK6ixugqO+f9Jvm6MpPnzTwVwITq6vcdUib
 mc+jRb81R2X5zcg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add in two CCI buses.

One bus has two CCI bus master pinouts:
cci_i2c_sda0 = gpio101
cci_i2c_scl0 = gpio102

cci_i2c_sda1 = gpio103
cci_i2c_scl1 = gpio104

The second bus has two CCI bus master pinouts:
cci_i2c_sda2 = gpio105
cci_i2c_scl2 = gpio106

aon_cci_i2c_sda3 = gpio235
aon_cci_i2c_scl3 = gpio236

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 arch/arm64/boot/dts/qcom/hamoa.dtsi | 150 ++++++++++++++++++++++++++++++++++++
 1 file changed, 150 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
index 9a8d6f020a391..9a854da9550c3 100644
--- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
@@ -5551,6 +5551,84 @@ videocc: clock-controller@aaf0000 {
 			#power-domain-cells = <1>;
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac15000 0 0x1000>;
+
+			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_default>;
+			pinctrl-1 = <&cci0_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,x1e80100-cci", "qcom,msm8996-cci";
+			reg = <0 0x0ac16000 0 0x1000>;
+
+			interrupts = <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
+				 <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "camnoc_axi",
+				      "cpas_ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_default>;
+			pinctrl-1 = <&cci1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <1000000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camcc: clock-controller@ade0000 {
 			compatible = "qcom,x1e80100-camcc";
 			reg = <0 0x0ade0000 0 0x20000>;
@@ -6148,6 +6226,78 @@ tlmm: pinctrl@f100000 {
 			gpio-ranges = <&tlmm 0 0 239>;
 			wakeup-parent = <&pdc>;
 
+			cci0_default: cci0-default-state {
+				cci0_i2c0_default: cci0-i2c0-default-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci0_i2c1_default: cci0-i2c1-default-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci0_sleep: cci0-sleep-state {
+				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
+					/* cci_i2c_sda0, cci_i2c_scl0 */
+					pins = "gpio101", "gpio102";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
+					/* cci_i2c_sda1, cci_i2c_scl1 */
+					pins = "gpio103", "gpio104";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_default: cci1-default-state {
+				cci1_i2c0_default: cci1-i2c0-default-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				cci1_i2c1_default: cci1-i2c1-default-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			cci1_sleep: cci1-sleep-state {
+				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
+					/* cci_i2c_sda2, cci_i2c_scl2 */
+					pins = "gpio105", "gpio106";
+					function = "cci_i2c";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
+					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
+					pins = "gpio235", "gpio236";
+					function = "aon_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			edp0_hpd_default: edp0-hpd-default-state {
 				pins = "gpio119";
 				function = "edp0_hot";

-- 
2.55.0

