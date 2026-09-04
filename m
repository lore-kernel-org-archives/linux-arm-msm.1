Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E93548F83B
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 10:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788519413; cv=none; b=dAj4KvV6j9PRti5vGKlF+bCXm22RZp/VTmCZHdKUw+UJFTil87XUQWOUp8nnzoFEcxpUtGA3tP1WVhzf6Klk0qfL4h/lLkFc2WsP0uadtlmxCZoe1y4g9tkN7JHTcrmnLKDEjG6ScnWZdCSndCJh1A+XbGg4ewJRXIqILmWJRqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788519413; c=relaxed/simple;
	bh=rywAnVHedizvb/68yKvivbccv1PXlPLYrU5uJGws29w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=leKwUjJqmGLPMDCNJ8eloSQmaPiT0udajH9uivMrlLevoyUl3LEbkcIfiHKZLw4e3gugb5hqzETALzNv8sqxA64ZfXVzBsjCb7uRvQRnN4lB1ae2W5kCem4B2TODs9cfy8O+1JnF82z9FtNOb7AMc/FEBEQQ1tPP3H9bZ4P2e0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Q38ZqPSo; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q38ZqPSo"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49b8eeb3ff2so7962715e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 03:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788519409; x=1789124209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gqZHXzkiJUtDXrZ/LGy/8d5EzRb7vWFnXqfYpjPHiOY=;
        b=Q38ZqPSoByjFY825dHZNUjLrZhYZCQuKTB+TVrQefg8VxWLlu3gvcwJH6qLcOUmuL1
         0b2A5+KvF4q3jq/bRHwev/GNdbFkFT/hG/dU2NUCMWi3+TlpvmidoMP+5FN4uRagcAJk
         lcsMHj2puK0Jsnvtj95H82FmkW7f9LLM+UxBDvEUCGO31uulmhjFYwTYu/1fTnUPjpA4
         aB/TZbcGQcQlTQYDfoIGr1chG4u7aesWqa9VUnYtwNIzidI2nrVteNWYrMHAcxXoTYfI
         x8Xk1EaXooShMSHO2159ZxiCsw7bq1wbg0nZf2x8GM/1xXZBSS9Sq4hnzl9WOTUU0Mbq
         zI6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788519409; x=1789124209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gqZHXzkiJUtDXrZ/LGy/8d5EzRb7vWFnXqfYpjPHiOY=;
        b=UzV2nYhFh9HaQv8o/gp3miowv+J/ZnEhDc9ZrfUjhwgdcsFp50riljKMAut1mVvSVP
         fD4JpVcwFINyzv45sJb0m33KZB0lUZJkasAHjBJxIKDuBV56tdE1ueVviZqVLFjzzNtN
         wxeSnTmQLRenWE7W/7AmwXGS/7zQJLHs+sU54N8jHakyCib0Mvp/fvWaCDuBVKGHifDH
         tI6UvgjuXJAkcsdawxUUaX228XZ3Cc/gwtWKOyAgvYj/gDJpSJJDwPfmPcXS2xSIxLUi
         DI3ndhd0A1FtXqPB1DoxzxSmQ3QW4rY6jwe2FnkjGL0+QjXfeez7wywblNEGO/+raYQB
         2O9w==
X-Gm-Message-State: AFuF++lFvRfLUUfGBF3uOeJd6tfUlLpkdnNFOQh/0U5GO3tRpla2XmVR
	cdwelU2Bhi/6D7atUOf/9GQpyZxm2jNA3WvuV6pLhDqhBWnQmCoiLjJ+Xd4yCL57wt4=
X-Gm-Gg: AYBFou0vpZkXGyiFf4EBlyHgoHgnURUhGpLeLrdQOLBlELuFGb7ANnUJjozjdkrdSto
	Z29XFkmhLUdbYWd54XhxLqt37tlBYynQBv8bvZrq08FNagbtgELXZzlzCDv9kufukjqvU1UUDsx
	YXN7DuDb9E35k4UYyzrXXVw5XDeHJ1VIdaAJzDU9UAWvVj5lEHDDOD2WT7EzFE0/d5XYvdNoOOq
	lVcgveUwlL2RPEYYBnCFmubWgsOBsceTDVB7VZxHHioNm3ph8YsQEhgfGwgLkMHN2ypq6Z3cy3X
	W9Dbc8wKAVfxmgAYt2yR5HxcXw1opP6cDIQYVny/DiBE6EpqV5t7SgiGVvyJnwHwVQbdeMrLRGv
	845jqonb+HFFwrDCMU6cuNwX8B0l/WsOq7UY3uncdi0D//6JqiHZgVWBUv5TPQsdRama2X/cepM
	DWnXT+RaQFOMqn1bDvkwWmjE/fzpQlm7Z8k3DpvqZWuH/g13URyX+d9lylfR1CRTuIfMOXom07
X-Received: by 2002:a05:600c:1551:b0:49c:fa21:e73e with SMTP id 5b1f17b1804b1-49cfa21e935mr32814925e9.20.1788519408950;
        Fri, 04 Sep 2026 03:56:48 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.237.179])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce46696e8sm132110525e9.0.2026.09.04.03.56.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 03:56:48 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 04 Sep 2026 11:56:36 +0100
Subject: [PATCH v5 04/13] arm64: dts: qcom: x1e80100: Add CCI definitions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-x1e-camss-csi2-phy-dtsi-v5-4-dc81d85b599d@linaro.org>
References: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
In-Reply-To: <20260904-x1e-camss-csi2-phy-dtsi-v5-0-dc81d85b599d@linaro.org>
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
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqmqPmucqSpOfnTbiNW8JbFpKsLlRayQwwTu4cp
 Wade1GdDZ2JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCapqj5gAKCRAicTuzoY3I
 Op+uD/9ti/e9IJ+VO+z8+NR814sOzWDRjQkOL3oPGWDqztky7rfH2+IKGZd2KpptonffN2POL3y
 B3Knt71B1Et2+Fl1jNkwllUhq+11KNeT2XOUus8QwQ1BICFMbGIvTkQvjvIqhOj5D+37XOQW6Ti
 HvJwBm04r+aPtp8RutIKdKrnuGr8UG6Juozjp6nYxpyNibpHdF3M28IAsU2OKu8PNfLN1prOD08
 1Xo4qWT9M1l8gUryKBpoG//awAjoyD4UJMBV+K5zOce8ce4cOo6hVd0IDSzkhhh09m0H4FHXeSp
 MPuXT2UqjuDdWc0DMvIZUwyxVudT/qsA/5Wh7Mh3W9RE2Yi5NcUGcnfZFTwJOaCVs88+2dZMN1R
 DG5VI8HWuW/OWNLZMaGpUWpSQERvY/y5mx75abbph8N1iPmSHfIBNoOynWdJuKY5DsES/D0w5+h
 SuAACukZyv7/gruVFVLxTxLxtuc7HGktSH/l41/T1dpwyAp5EkbkwHwgCb9rVwyYVITREL1IsjJ
 Rxjxp/qfdbt/ieCjqUDhoXfNflpo68x6lYXuFgUZrkOKQL5l6CrmIr5qBt9w4y3wUNaUmdCqOO8
 enaZDfJsbG+7VWe2Kchmj0vUCCv/mxOIT0zFRjuiWMVoxT6BA8VNe3/qgrf5bKh5qrtDupAuNnO
 b32OsYyEmU4MG0g==
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

