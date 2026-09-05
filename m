Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C53B29DB6E
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 01:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571840; cv=none; b=DZeEbpEjan98JyxsUFhfWobvNijoxp01JEGxjUpCGyobzqaYmfdnNjgyk/bS4Cl/VYq6UtYzsiVqy3rB9P9wAdNsbWiJNxsy+6B67xvBd80wp14ix+MwE+TCK+lATVBUcAj6yLM2hIRnzIvrkcMdbw7dOUnFf7bAgL+7qwKis5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571840; c=relaxed/simple;
	bh=TjkylalUGxIke/ZZSHmCZIbPIqjC2JgfNl/TIVr8fK0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T93lgIU7AasedWPXe8PevgvIpWEApL+3CvEAXIGb/iN1AF6MdRGlzEfYPiRrn2S8J+59MfN3qB7EVmoVsYztVWZcaLG0VtolC3ghwfC0kpj9y8S1R4uZJ+JU+B/JyqyVFadwR+rz16ulQuvALJMJBVzmP7LAnfL8eMrmTz2/BLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b8udeMRg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xqy2A4Zb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b8udeMRg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xqy2A4Zb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850vEHR1495897
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 01:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2J37TzvUgwEt8yylHIE2VjL/n6xa0aYTfCIrY9aUEgc=; b=b8udeMRgOUx0GQwC
	YBReZ50G1bTEEnaVnRgyoXtgwegDF2JXewyAjMgoawbVSaNZaSAj8gG7IsmQ0ezT
	eC9OFcaak9HGKamx1ficNbm6Cl/w9IZDsbazzFrptPCxephcKPe5kfRneuTZIHwL
	4LmPnut7ukYsh9qaC3anNGh7sMJzbbSWQxdH3fmN0s5ns7q5BpAPyjUlpw6kuF2d
	U4kaBnV12yQEUlapz7bmYpxpx1hwSh7tUuMV+v5aA+1J8MW3ijVnIrODcLwfgczo
	/v8qvlUqNEttgq0AroGiSdfJM0NshX8bFjfq9tTi/Jw9Nj1hwGnePhqNpfIlo47c
	rcZJxg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0122wt3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 01:30:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-399271df9d8so319017a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 18:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788571835; x=1789176635; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2J37TzvUgwEt8yylHIE2VjL/n6xa0aYTfCIrY9aUEgc=;
        b=Xqy2A4ZbBU0ltGUaQsxvhwcaVzS69kBzAriV3wSV754sQNUF0jyBtjXe59ZOdg74Tf
         yBguiQs5xzR1/CcQFB0TRRsTlT7JDrB1RkBl0vyAG3g6+On+3Lmf9aSBrwa+TIEM3Mxq
         qwpwdV8/cr2LoW4qhk28AsOk0F4W30VEFY7n4owpT6IdipSheLNJWFKzyBYNzxx32LPO
         +tqdqsuTugafBvuG9mXLSgmES2xC3JqyjAx03325072E6k2tY385iQrPJdHwgGx46cpm
         gIpFqrDt1ZELXjCQN72/W6y/MF+WdlH4U3QA1LvZNkCgt+jjmXeBqvCezxg2EovNZU3N
         Ntvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788571835; x=1789176635;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2J37TzvUgwEt8yylHIE2VjL/n6xa0aYTfCIrY9aUEgc=;
        b=YSZxOkEmCToaWFs79a/ZCx5efqbtfgcRdwz4lF9hbogKWQOhaBUf6BqiME/9mVEoB2
         iZsM3faG8AcbKbbyW23FhECgNEl6R2b0KgN+ihaGLMz2uMZqysDBKegSV/pIqNgZy/ts
         Ldc5nqS2DfBMt8G5U7CRRHUv9ZR/Wgj/F5WjSpo+hp1SAj8UYnaN0hZzOY/SdRe/Mif9
         6Mb82ycR1SPR5e8jV4FAyLChMCf/RBe2iMB9huV6/fCvVLl+eC3OB7aTjMISQzy2zLn6
         5R8LqBSrmFgQqox1J2TraICHYoKG7Tu3va2yvDipajeV7GfFnkJTeqvnGuhnNWEnTXsW
         ee9A==
X-Gm-Message-State: AFuF++kCYueC16slc7Asbr10mkkswy4MN/mhQckBsu9KFGJfeOCVGuzM
	FTg1E5TL6Gnsqhi0AxSVI4h0e/bVBvJ9tu1ryjQqoYmImJAqBKDP/RouyMkrgnEpGM1hveFx1wO
	eqtLbfsSlHngTec+3BUXJ/30H0dGzQp/ueiRzOiT77psyS0GgK8G0nYXjrkfvxogZNBEt
X-Gm-Gg: AYBFou1HxCSdaYgDjPDUOirDrOKypo8xu71tUe7wExHreWWxjzwm7H+xJfdyhN7goIv
	5E7BTaBQuY1PXJpsDizbiZSTbuyD4dGuQbQN0PMTBJ7sphB8I6trLr9/iPTS+UB+/OMrbrIjNMa
	61Bt3/qRbdWwuUaIgs5dGdOc40YDWf/lN9Uw6EYd8vB8aBfPCNV0pa9QMu3iXfxpcNhTpbOY7z7
	53r0BpZcQ6ZoekoSoIsUlmujteNV8C0ehrniuVXIHbKHBYdnvdGM1/DgPtXNiyRG5daX0CZ8+GI
	znI+SIk67on4gBaH1gdl04H7WiwEaF2inrhZw6FPTiw7c00fdlpK8r6tyQCnqkuQLLUWjNvhkbW
	iZZnK8WsuLi9bwRCCWOnEyv4q0xX4aE1IUTiExlzf0Rlgvh7M0p97JAX8ci47+o/z37Ush6Aoml
	ldv0s21vrdAeaCwKewRrxk
X-Received: by 2002:a17:90b:2786:b0:395:4df3:8800 with SMTP id 98e67ed59e1d1-39b3d3eb82fmr2723958a91.0.1788571834986;
        Fri, 04 Sep 2026 18:30:34 -0700 (PDT)
X-Received: by 2002:a17:90b:2786:b0:395:4df3:8800 with SMTP id 98e67ed59e1d1-39b3d3eb82fmr2723923a91.0.1788571834502;
        Fri, 04 Sep 2026 18:30:34 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm10170457eec.12.2026.09.04.18.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:30:33 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 07:00:16 +0530
Subject: [PATCH v3 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-lvds-support-v3-2-b40a1b03f63c@oss.qualcomm.com>
References: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
In-Reply-To: <20260905-lvds-support-v3-0-b40a1b03f63c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788571821; l=4303;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=TjkylalUGxIke/ZZSHmCZIbPIqjC2JgfNl/TIVr8fK0=;
 b=2q6At6IM1kq4xBAh7nKHa3+MwBoESkuzCZdfTxa4njG0pclU4EHNXnMVlvVCQSaPciTr9pKgW
 xAd3MtW38SZDy0qB45Y4oF/shKXfAE3lmV+RtxFL2BlKET1trATUmjf
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfX3jhNtCN+cuTC
 wL63DeoSPlBES/g5NEFHagNHZo55hAu+NS4JfwA/JvRMQCU5IIRlFXRUTyUIJLicbBVRZD1eEmo
 /FjFJXIKC8BwaIiusKeBMb9L561UmF8=
X-Proofpoint-GUID: xgUbCdkT5cbxHkN2nA9U29Vo2ttl5gZT
X-Authority-Analysis: v=2.4 cv=LreiDHdc c=1 sm=1 tr=0 ts=6a9b70bc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Jm0fHEQTX3kIzYgV1EAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: xgUbCdkT5cbxHkN2nA9U29Vo2ttl5gZT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfX50Qezvv3aweN
 D9UymJGulLFuE11iKv0R4GTcHOFD9fN9TttNc5PB20ZfnbYpVOlB4DzfMnOkJinPlWhYqyM+0XW
 nzukSo4DAqO4N/wdsJypIxPyGtVxxOEFrxP6asPHyNUILS2uxPx+6KVSgEGgoL2DPtC0VGzLg4+
 RHVz6myCJlaxCoyuSu8lYCIzAzcjB5wNdJcWwBWBg4BVu6uG8E3/AwVJTdQRE0pT6ccyg0Xi6xn
 qHvEceyWORjtaNAIE/q54zy2Mn6rt65b7OY2D48Z+fufsj1z/dPDc1uxAkFGEAe60H3XUKdm9lz
 SdmGQbM0BWy10r0Yv5rAX3bPybjFYO3ZA3Y7MnZntA5L7O0VflP3EymmvdordIpYHiD86KNbnE6
 m91SpeUkg6wGCeoKgSKqUX7RqApBsvzeuQtamFZ3lYn5Os9HihqQDTLAawXPulmxRb7rhx+MGy9
 24IifE3hQz+25UOiKYw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609050011

The Monaco-EVK mezzanine supports LVDS display output using the
Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
VESA-24 mapping.

Add a DTBO overlay, monaco-evk-lvds-boe,dv215fhm-r01.dtso, that wires
up the LT9211C bridge on I2C8 (address 0x2d) with reset on GPIO66,
a panel-lvds node for the boe,dv215fhm-r01 panel (matched against the
panel-simple-lvds-dual-ports binding, which supplies the panel's size
and timing internally), and an LCD display bias regulator supplied
through the GPIO expander. DSI power is provided by vreg_l5a.

The overlay is built as a composite DTB combining the base
monaco-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 114 +++++++++++++++++++++
 2 files changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6c119fd77774..8cf82e7067e2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -80,6 +80,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+
+monaco-evk-lvds-boe,dv215fhm-r01-dtbs := monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo monaco-evk-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..b796df28037b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,114 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Monaco EVK LVDS";
+
+	panel_lvds: panel-lvds {
+		compatible = "boe,dv215fhm-r01";
+		power-supply = <&lcd_disp_bias>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
+
+				panel_in_lvds_even: endpoint {
+					remote-endpoint = <&lt9211c_out_even>;
+				};
+			};
+		};
+	};
+
+	lcd_disp_bias: regulator-lcd-disp-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_disp_bias";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		gpio = <&expander3 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&i2c8 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&qup_i2c8_data_clk>;
+
+	status = "okay";
+
+	lt9211c_codec: lvds-bridge@2d {
+		compatible = "lontium,lt9211c";
+		reg = <0x2d>;
+		reset-gpios = <&tlmm 66 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_l5a>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9211c_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+
+				lt9211c_out_even: endpoint {
+					remote-endpoint = <&panel_in_lvds_even>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&lt9211c_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+

-- 
2.34.1

