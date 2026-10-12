Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9547F442FCD
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789800; cv=none; b=GGEmd4lRZLtEU9IeGFv0X6PHO5r0OKSHzgJ7783xee9a1NWFCdPLeEvlYc7NDbEoiYsOlkXFkmZOILk/VnCiJWozxG/PpeSkrnYxEF0EwmdvLS3+NZF/eagXgOhDOobuN25UTUiiE2Gt7srEEyIx3rAuVHLRApgl8mc3Nj8kTyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789800; c=relaxed/simple;
	bh=aJIj5JExM5sY09SSZPiyVUZFc+MFFT+kqdEpBRBeVyQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ndqg1YFZpzdukXintr9S1hQ54Bp0Xu6mHjVGBylxs3lIXxvD8bEk+j+mV0E5qjE6IuZXCuPYKFgCjGtpaoPkiy2zI3q7WbhMRG65veo4c9MkU8ry9amPw9ziaxB6IyXfae/TwSV3wdtWazrsDw58/NWUkAJ258SZLBnfRVNK/dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biHhBgjW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q36hOt6c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biHhBgjW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q36hOt6c"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55hXf474938
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jfhCoj1XTvjxsCXlZq/cebP5nYcSLluRQvcl1GWh4Yc=; b=biHhBgjWFpOwIf00
	bLol6NdJBgnfjipymVKonuVEfpuqH8F0RvA5fbh8X/dlDcaMoFWAQH4E1Xrmw1L7
	+faiQhtWzRwg3Xj33utakerORe9g4o8NJ32hq/12O61ueyncXCir9QlgSdm5NM0U
	O6CB1iZTyPKH1gtYF2HZTlLee501H0cWQOUgYJFzSzK2ldOZIIOHD8WOAXJ0cpAB
	ZD17l7XeN6MsHRJzijWE3cvNZZViINHxxE4P/sC+wH0fM8bdqRAGNCmPJwpDNonM
	vaiWzmB04RsxwaQ8iukYuGfH0Ap6eyJXpXZhcL2ZXe+ZbywtTt7Fq4bCl76SwISR
	/Kjmlg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7en9w5nr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-34ef0362d95so1889517eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:23:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789798; x=1792394598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jfhCoj1XTvjxsCXlZq/cebP5nYcSLluRQvcl1GWh4Yc=;
        b=Q36hOt6cV/Q30nxdfKsej3Gek69HvNdqyir8zv2NyCj7f4A8aKs5DLaMLgcDbhp3o+
         loySzkmEt2ROOdEnKA44gHN3Qqe4GLxSTg7nxydpZREGQ5paysmR7fuXxR0SKwvHshQZ
         T5wXZDjGC4UNwhmfm0iAOosgCUaRbzg6yiBQQFpJveXFTrcGhnxk2r7F2OiijSOwsMiw
         NsStOylndNZv5FsPx5YbaXV+FKSwFMCH5QjpDLMSZVG9LwwZFSu5U0V7AoJxHzXyQwfE
         zSp8FFiFsYLnIEwm3K3tgOVQCgzzKO5Lip/JSRX3WhZO4nGlR4IrQ6Utu3hW1LsbUGbL
         dKaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789798; x=1792394598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jfhCoj1XTvjxsCXlZq/cebP5nYcSLluRQvcl1GWh4Yc=;
        b=mXO0dM3k4p98MctidfGqSIZrJTyujVp1mac5F98SlAM32FCKw0F+MRBQdJY7uq5LhE
         I2RUN3iOK6FxbyPW5/y3y874gqwRrVCnq9z3EmibGxqpxWW/X+y0YVLe0J1CeYOt1zkE
         IO6sFKqPqbZo7KXO9IK3SI4Fznqt+y592bZo3SUOnUPLSwmkfsNG9Bu4Lp57KbU2hZEy
         zT3Nwfd61Mc0zC6KvYrjzaoY565zD4S4bpGGG4wiCBYk18aoRaWqmD19cDG5pgRvgWme
         S4rEIZdMtZcn2ttW/yLAlJ7RRUUBOTvYHxAedaxDxDKwymPgaDBU1J7DLFyQd0ua02o6
         zElw==
X-Gm-Message-State: AFq9FYL8opcQBtiYoBSnIb7QIwJsFtf0Vy5H83P+xHTSFBpLYWJeE1vK
	lYJ0oVxDtsr96mJRT8PGuT3aGT2t2kY98x1egv+a3H64aht3C/ZZTgWAYBcHQYPZ4mWa/gGVuVB
	Js/SYGuHgvHoHBEUDONSH29xSXar+6iaw42dH3omsaDmycOOwv5yivynYW+NyjNWIA37b
X-Gm-Gg: AYBFou2l03FI5hDB1xHqLBvLYt4h/Hy2Ta6iSsb2HlkBPB9B71T4JbZJFuj3wGfC4Tv
	cY6vN8gvUvL1wSq2COxLATIQz/l1tQj9XDGv4eNpiZ5SZugAa80dX6ED5bHfgYo3wkisZJ3BX7J
	IgWKBB1qQ+7zusgyjdNsIX+Yg1WArdwJmJlXLzR5UXcsR4N+Bpr+1fmMNmzAtaVpI7zeEezkwpv
	UEIzc1gBjeYqCNIy8YIqqNRocDES1LZYQOnmUrDOTN6p+NHn8IQLwiFcGWZ3SFOyEmqmhT8Eq/M
	oiJRJlrxszxGKnMCKTc4mLpWzpmwKZ00hu+KUpb3rXEvuNzVjnG7gLiKQBT2SnBQUrwPLuI+zfb
	SUyBTiF5TThF9SHi+99DcWoidu+SgwHBz64n+gTfNTRpwBiJjE/N9kxInq8VOMTGfLTVUGNhDUB
	Bpgl2vroyPXxHmSVVDVQqkAyb4cdj1
X-Received: by 2002:a05:7023:908:b0:143:8860:afa1 with SMTP id a92af1059eb24-16a63386a1emr14305856c88.46.1791789797659;
        Mon, 12 Oct 2026 00:23:17 -0700 (PDT)
X-Received: by 2002:a05:7023:908:b0:143:8860:afa1 with SMTP id a92af1059eb24-16a63386a1emr14305822c88.46.1791789796973;
        Mon, 12 Oct 2026 00:23:16 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:16 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:02 +0530
Subject: [PATCH v7 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-2-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=Woe+otfv c=1 sm=1 tr=0 ts=6acc8ae6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=H1h1Rys4rTy22MHYZdwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: kX5K3GpF1qJy2t5llZYAHyxJiuwrQz8V
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX1YrVFkKogaCt
 +B3+nItyu3S6XQVgqIgoUpC4BsxH3zlPTK34E1JwS/AsRb+ILK0WKw5ovP/XXZZrBvsw9yLhOGC
 WjRgqcetd93YP5ylYjCDD5ZxZ6Btm6145G9upy6BfrBRtIYF/ZxOVXhi2pAEg8X6N8f+2n26IDM
 XqYIRKAr2ZRH2ES12wumKzjRLVFBycqZp/2MpWPq4oKPyCOec4HtRtr5YIoDUWMhkk+sbr3YzAW
 uxMCxSpfB6DSgcb2Lg/6CoBI54UVLmRvZKE4BtvS2y1iMiFaWAo7DXGAN9/aZ0D1woFIr6dOdpA
 3GGxSOen/OjMi1mHv3Uyz50U99jWun5WD7UmSB+KXo+NcRf1W70MIS0yK6fiZm/sv3YgiiA4Ykv
 aKhNRjum7NSdsBk2hFZdzul+Z5SNnjAjuCGWfhxpE2YWvO1Ait4w8RY4bw0jR6BksL6AOuWhmk5
 N3qh1HrE+fu2o//GQVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX7VG9IyAb8YVt
 2Q93IHd9GQO2VqmIz51UXLFnp6sa98i9ZBXs3jSOgvuXGx6VyNhXBpuXYmjhjdq4xOpq4HrEJnZ
 KrSgeX8/qKuJrvvwaqea//lQ5CcRfk0=
X-Proofpoint-ORIG-GUID: kX5K3GpF1qJy2t5llZYAHyxJiuwrQz8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

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

