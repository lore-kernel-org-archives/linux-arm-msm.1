Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD314071F3
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 07:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788765908; cv=none; b=Pl0V3kpMuiTMcXzX5gw5l50r9Cc1ghD9drjgYY7HnUP5SELKpWH/f/ro0yv83sdV+SY+MBoXjwh/m4trBbUfCUihA4Mrzf2GrE66hQYz5296e6mggz61C2kH+/YT18JpWiPZUF2j5Y2fpSR6Yvl13yds3YYqvz25R1gOHD8U+iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788765908; c=relaxed/simple;
	bh=aJIj5JExM5sY09SSZPiyVUZFc+MFFT+kqdEpBRBeVyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SOT8nDG9VLSYqa8EwxE+lg49RB33SxtvODNEW6W/ArJsUohD22XLqFQZAeMNtgo04qQcX8VIP/lRbLVVbnA7on/98gkIrHsmxNUFezt58+47wvdCSiQuz1EwcbJ6yHBbGPAsyZr3gd/MOWOIZ8zuRviFUoPoRJZN6dAI56joqLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HhkZLkXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LmSWZL0e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HhkZLkXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LmSWZL0e"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68777JuR4161116
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 07:25:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfhCoj1XTvjxsCXlZq/cebP5nYcSLluRQvcl1GWh4Yc=; b=HhkZLkXzIN0Utxmq
	ud0iWTT0dIaYyB9hrfzpofIO2oYHIsU1mfVLVr8Xq/jGtYGb6z4Fcu8uL/ehiIhE
	/nydE7yaR6FxkbHP6eUTWoIkrXCr26IcQWe8JXvxcbFwe9QzzwLS9jIHlLZzK5H9
	+ySkRg/T1zfTC5TYJx0F25VOeUb4dCVgQrv5YJM/4SfeNDaumB8t2NnHEr8aP/6A
	CKxT+P6Nanjy8KwW+2zt3L3bz4LIXNm5REc/Kzt0NAEF10wIwFAFacAYiVyVJ/W/
	JzKt8Ix7aTeT+bkA04dfD7d++FHx+ARgS51lXxq1dMG6Ds5O0GNEgwertngw93BD
	oTzxhw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjhe27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 07:25:03 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso3594746a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788765900; x=1789370700; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfhCoj1XTvjxsCXlZq/cebP5nYcSLluRQvcl1GWh4Yc=;
        b=LmSWZL0ezqvGoCukWteOJljKEqTcls7f3W0EHepedZR7kUnHhlUvtV3YQ474jppCNT
         FFiXxL3qyTFD3HdWy/wNEueXnMuMm5P4qUJH/kdBB12aI9qzpx+l7A1uwBeTtNutd114
         8qcoLT1wr+qXcaUsS30piiutdgSQVwnYzFwsoLmRqFnmK1cItF8Ucgk2uHnzhboEJm45
         BMcVowHPPl9Nkrf2JzGVq0YM3RHHVYfwgPaZnRtBjLCVxzzWQb5N9qOJtNUL3AB+NdSA
         Hx4XbMBil+flQ1I/osshbmRUY2ZtYm6DQFQTwl1aDGtPonlaMuCP2Rgw4ZL6+V95xqpr
         634A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788765900; x=1789370700;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfhCoj1XTvjxsCXlZq/cebP5nYcSLluRQvcl1GWh4Yc=;
        b=P98bCuCJbnl83Is7bJXMLztdvEn5QCETcNaDXC8PmrpFRW29rHYwNaWOPzaflbjWYa
         xwBQV8xazPzGdTjPGo6nRqnsoRwQxP8ERuP07pcBNf0fM/EwPRIz//PejjLOZtLjd9S6
         3R9hnxzviaOQow2RWB48l5TLiZHLIDNPPTgND811POAM/++JLM4z+INNxqMO7kRnzF8Y
         cFl4n/YaPQvde/0UjSBVvDCsASY7Voo7b1f4rBJ1+nohTj9hkoX6XsyLauGe2DtyBOks
         PbjEp3xKREzYKjMKjF1yNSgDpNKcz/26a1Pe5a8PAZu40CIlPIlx9PfuOq5vIGG+kO8O
         6arg==
X-Gm-Message-State: AFuF++kKoOa8+WSBoXYhRE+OFmeOAVV4gn3Gt4YnNPBX2a7EGw+rA2j3
	dDlW2nfKyA2gWyrsvKeIfbg8lBYBxsXDFCsKdhdzfhnCXTsnkaF2IoRTaFnEG3/z80HM/e+o3Sn
	ahVh3/qQF4rVV1UPtlLECCX2Z3MgAS5dc2NnzPsMvpwAMdCrUtBPSJpsdVMjIQkG/c+M2
X-Gm-Gg: AYBFou0VuFZkhBwmTLPk8cTzoTc1l5rHEmSurSAEQ0KYaTV3yEinZiBwq4UnS5rn1H+
	wsiMSDbzBZxM8WQbQ3jbO7hi0bFuDVYwYW71zgdN1ymJw8iekkvfnwl6g0ploDA3JFjn0SUIy4W
	iFRPaMD4QKXAWlOUEYeRN60xoQkzTQsVl+Q3vwwUUwyh8ddxFv/jcs5+V2ReZmm0pS7jvl9zTSl
	kYdc6S2F9yBZOO8F2MvOiLtyCpXFYpLYHr06vFgawqLkmG1oU/Qc6X4t+OJTcs5+wwC3TsTKdgO
	soXq70BNLJGU5z341KDtqR4mACIY3wdQgAi0t8yVUPP9P7zz3cb8G05blVBT3G19pcbvjDgaEKX
	ByWDqae1nsjVTxYrrF3vrSSJWKFB9WhXHELnENlAhz+mYZBUzINcIfMiYKnoDG5KqiP4IN4FdYP
	Z37q1k3jO/45KYhngf0m9wpvsSv+FWvQ==
X-Received: by 2002:a05:6a21:487:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3da39b71849mr33271090637.6.1788765899466;
        Mon, 07 Sep 2026 00:24:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:487:b0:3c3:9df0:2d66 with SMTP id adf61e73a8af0-3da39b71849mr33270909637.6.1788765898404;
        Mon, 07 Sep 2026 00:24:58 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bdf26c5sm26161861eec.27.2026.09.07.00.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 00:24:57 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:54:38 +0530
Subject: [PATCH v5 2/3] arm64: dts: qcom: ipq5210: Introduce RDP504 common
 DT file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-08-dts-v5-2-584e5ab50b40@oss.qualcomm.com>
References: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
In-Reply-To: <20260907-08-dts-v5-0-584e5ab50b40@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX1BYjmWsF8D29
 A0I0NnQ7z+VkGaW9XQl0eSHl85OuFpjs4bwJaBn8PspJqdz+Lt0ey14EAuMYI1PkbdzOkN+4gvV
 YvTo4Mz86uvM07poQR4ll10hsfyGZVg=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e66d0 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=H1h1Rys4rTy22MHYZdwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: fgkpWbJWNnymGbK3jEow36oofiDgZhvk
X-Proofpoint-ORIG-GUID: fgkpWbJWNnymGbK3jEow36oofiDgZhvk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA3OCBTYWx0ZWRfX4b/uSmISR7t9
 /2PW5Z+uLypng2GhtGMxvhvuf6BPgcyuHq2Q1129v5MrGw4jdUCRVyV4vaBF4gIWHdvA0q5K6nM
 nGqGaYA43DKCmCwM6lPi5yTm915APAkklbdo8Ojgc1WUsYseJpFWVrUMTgui7gWSWIN/jYCD/w/
 u2ziVBqXNEdGR2Q2e4q4uf0CAQxssTNkJXnbqNhjXfIHMvEsSNJCG8RiERduQjnpRAA3Ngoe+lq
 jaGUSA55pCUfPWlLQ/uBYu4Ly91Uih3kk5pW6Id+K2AO05zYe2AhAD6lcfVyQaWI3ItRouEPQ9T
 IA+PYKcc7FudSaMG6YFlrXo8D/mQCL6avcpn8BLL22EyjCrHztMm8Fbq1zXq5dFIrplECjyo3XR
 1Ys7eiQetB64cwRl8UOsPV0W65VGCLWNpt6aihk8MOu5xqPEV6gK9oJZ+bF7eDRfMlBtj0SODXB
 s6udUxGVPYS86dDPiMA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070078

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 209 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
 2 files changed, 211 insertions(+), 64 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
new file mode 100644
index 000000000000..30c8560822b5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -0,0 +1,209 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include "ipq5210.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	vreg_misc_3p3: regulator-usb-3p3 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "usb_hs_vdda_3p3";
+	};
+
+	vreg_misc_1p8: regulator-usb-1p8 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdda_1p8_usb";
+	};
+
+	vreg_misc_0p925: regulator-usb-0p925 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <925000>;
+		regulator-max-microvolt = <925000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "vdd_core_usb";
+	};
+};
+
+&pcie0 {
+	pinctrl-0 = <&pcie0_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	status = "okay";
+};
+
+&pcie0_port0 {
+	reset-gpios = <&tlmm 32 GPIO_ACTIVE_LOW>;
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
+};
+
+&qusb_phy_0 {
+	vdd-supply = <&vreg_misc_0p925>;
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_misc_3p3>;
+
+	status = "okay";
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&ssphy_0 {
+	vdda-pll-supply = <&vreg_misc_1p8>;
+	vdda-phy-supply = <&vreg_misc_0p925>;
+
+	status = "okay";
+};
+
+&tlmm {
+	pcie1_default_state: pcie1-default-state {
+		pins = "gpio29";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	pcie0_default_state: pcie0-default-state {
+		pins = "gpio32";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	qpic_snand_default_state: qpic-snand-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs_n";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		clock-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio38", "gpio39";
+		function = "qup_se1";
+		drive-strength = <6>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&usb3 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 941f866ecfe9..e5f2f9217f3b 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,75 +5,13 @@
 
 /dts-v1/;
 
-#include "ipq5210.dtsi"
+#include "ipq5210-rdp504-common.dtsi"
 
 / {
-	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504";
+	model = "Qualcomm Technologies, Inc. IPQ5210 RDP504 (eMMC)";
 	compatible = "qcom,ipq5210-rdp504", "qcom,ipq5210";
-
-	aliases {
-		serial0 = &uart1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
 };
 
 &sdhc {
-	max-frequency = <192000000>;
-	bus-width = <4>;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	pinctrl-0 = <&sdhc_default_state>;
-	pinctrl-names = "default";
-
 	status = "okay";
 };
-
-&sleep_clk {
-	clock-frequency = <32000>;
-};
-
-&tlmm {
-	qup_uart1_default_state: qup-uart1-default-state {
-		pins = "gpio38", "gpio39";
-		function = "qup_se1";
-		drive-strength = <6>;
-		bias-pull-down;
-	};
-
-	sdhc_default_state: sdhc-default-state {
-		clk-pins {
-			pins = "gpio5";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio4";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-};
-
-&uart1 {
-	pinctrl-0 = <&qup_uart1_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&xo_board {
-	clock-frequency = <24000000>;
-};

-- 
2.34.1

