Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956879;
	b=oOSuPatgMaKjZHvUuzithkc/vJ1M8GW29IdFyv7HSgAjoCRyShbjLr+xpEHO2I1Dxffk
	 EuBc+Vq5RCIn4kEvcBRPIhsZI0HRoF77Ye1EBKOqSPpPF/FlVJneeD3a6rKJ2JEq9NFZ6
	 BvsTw9WkIJcQFtMjePrI9YN9oao4njBitcs3K4Jklz2Wl4SMz/Teb+sZmf+fPdGtyQ3nz
	 mr2sx+kd29HcRQLE29eCMOIvFZ9IsM+U8xwzJHH7b+2JLl1drSpRqLpdGub/E90Shbf2c
	 NEjB5mnyIBFLwuEvs4FE5xQEyshh5HhYajIC/AKC+GeJ89hlcDlScPV/bbeD+br4sbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956879;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HNUw5+OSh8HvBn9lrlY7AxflSA67dtDxm+JpiDlH8Q0=;
	b=Kp6g2vLYzeTST4a+2gsEBCpnKKGzH9MFdMtRYXlKyFt1mpTOY5Fv5mQvg/lUa9/4m0k0
	 9k+2M+9+5GKczI/bdQJZVIpLYGH5x7o4Ddkj+hXzYPyufmRUR4gj2W4lG0O8orm1MgNjN
	 Ls5h/MNBz26aUjKo/vDM1ICjTzCiHhf3q3V6Nwk80nE9yP/MNMDrLZ91JB/rUf2EyosY/
	 paHrnzbk0I7PwCUtKpHKdyUPEF/Ynq6ksL5Kf/7W0jnuv79Lnlevk8h9qYAjs8FCmKaSR
	 Ajp49BAizec1oHX3QEQbWcOWwWGVCCQPXGbZgJlbqIJzc9y/Eg+19v4UlAGy8wfeouw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TcSkQNAp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AbXhqm7a;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB7F606D825
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4AB7F606D825
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TcSkQNAp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AbXhqm7a
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R95f2333817
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HNUw5+OSh8HvBn9lrlY7AxflSA67dtDxm+JpiDlH8Q0=; b=TcSkQNApwJR+WG/l
	9CuNxW28z2A0FkwNUk+FYUmbQ+IUm2a5iuSQ28zSQ5apVB9q1PR8dM7Ubd4/l444
	xQy49T+U4+283OtVY/JBn/bNaVLFCHrzX2FS6e+gArTsHCUnNbqw8Ijuh+WW3Zmc
	0TqKxcJD8KbGpXmx+pgOflhSloYHCrEjAobV/k4zh/2GVE9jcJ/WTJ34q7eDSR77
	TnxcrMPt6wlQWG1Evx5mnhsOFGfWdXX5VyU3boBnhOpR2Q+uKtlMUOgv2t+xwkU0
	EbeHqW0eFfvClaO4k/pM3qIOBo/JaZ65YM+VrmS5Zz7IHpDXxYZKi4NCVihQnSnT
	uteiBw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9a5jw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so966875eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956878; x=1794561678; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HNUw5+OSh8HvBn9lrlY7AxflSA67dtDxm+JpiDlH8Q0=;
        b=AbXhqm7auSxBkK/uir1TkQF7CjLgKeVLtHUNZ+sRP3+AX4P3WozWc7Cm3hWU95afob
         1Hck/F6wMORRcqasa53Wf18v+FgFjRNm8FbaBQB9YkwIxiDszIxECcbuheN9zL38Dfbe
         vExYJLN+xV/aBEBuAPdvFNIfb3+FeZQSU2Xp8QE7q8Hhn0couvtrnwAFl9EX/p5pqPie
         D/ulObuGsVUg0hLAYQRQS8mNFUx5UIXI4ARKZCslC0+Ycc9YMREDRm3BV/ctblQDa9G+
         Z92GCpfcUFWGgG6ZwYawf0M0Z8KHt3Q/ujrmVymSrDD5SKsk8VWH/dzVGqX3jDogcqy5
         cWpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956878; x=1794561678;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HNUw5+OSh8HvBn9lrlY7AxflSA67dtDxm+JpiDlH8Q0=;
        b=YGmirGxDDi2RdA0unb4G8dsCcXjx+wZBILNQ7tbohMGKupfuvdXWoaBkrHcr3Buk5n
         7ATmqAR/+XUTzXS2CbX8wJ0pOzrgR+hf1arJaPTxyeZzhL90plG+QatgT+gGd07Rsa9z
         /7Tpd7xuMUuWTQISchkjFngQsRoElqeaxTE3DI7UDUEEaRzHF2GP4o7jBjf3pjbtQ7B5
         VAwlx4gNk3qfvvrjtfDaJS8LNeLg6Z+3rMlLcUjq8FxI/gitA06AVcVR192Bh5Db04gI
         Ch+mDWQevyHsYww6O0g56WZmHjgun7VbPFg+FbhAuPc4Rsw9SSRb6VHbX1BwEkspIYiD
         Sq9Q==
X-Gm-Message-State: APuU4Z/6XmOvk1SV4y35vjSLYPLOmhuzdEdjxuwxrHGJ5Vk9WituhniQ
	wXnb7QAcoSjX5RADQcLdTRlIEoILclnRMWBWML6JVBzhCLWzzjYNZtn5hCLtJYwCQDEIJr2KFYA
	dlJ5OAjgXb5n9KROCzCjMUap2bofw1jKvCYCTnB/skOY+nPHCAh9AcOn1Fq2JySJUIH+J
X-Gm-Gg: AYBFou3BKWnUT2HgTYNjWT5vv8ja40s92hJ0XJXrdD80Mz9YkaZZCkXbgVMOYioCcaF
	xRc3MN+Adv9mMC2D/se5vzFZ7AJqnAT1fo2yRzAVeTAHlKP2CTfPSgfmh8WBITIYUQCBLnUsUH2
	cuiP7PshJqHA9hDenwsAE0VSgwPP9ATHrLw7bq/caq1nUHD6EMH4B8BP8MXYVfVk/8DQjsXjfbQ
	h20IqOOzj0eVUpR4u+AAYPtC1yji5UZPoa5uO8XBcjJMnPiex3SmXempzswgtUdGSywXs1HySqA
	ZuALwWBw9mO6xVvnrUGD8ODLY7RSQzSfnENAkseiY94r2oEqIYojIIdeA9kll8RZ5MJ7M9WrLTw
	glDO7XX4bA9cEHoyetslQXEzt9VOqNom/NW9Cfziy3LgaLWPMOFFsbSiFlUEBqOd60sYrThJjXM
	/fqgSzHDdiVIMyqJmpaY43KABIB+JWpl1bdzDCF91tbE2NCNGnKu5QAiFBTdVEol5i8NL8hAPch
	VBplw==
X-Received: by 2002:a05:7300:f3c9:b0:365:d42a:f415 with SMTP id 5a478bee46e88-36f7494d0bbmr2469695eec.12.1793956877704;
        Fri, 06 Nov 2026 01:21:17 -0800 (PST)
X-Received: by 2002:a05:7300:f3c9:b0:365:d42a:f415 with SMTP id 5a478bee46e88-36f7494d0bbmr2469649eec.12.1793956876861;
        Fri, 06 Nov 2026 01:21:16 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:16 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:51 +0530
Subject: [PATCH v8 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
 common DT file
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261106-08-dts-v8-2-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: olb0-_NfIy5Gk7WQG7GjVGasOz64aTh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX3nJc3hXPRRKn
 jq/MYrh+mJVGdbVE/WIOfZAWwDAKQc2vKVoaj+GKIM1K0uQceTCt6ZhfkpXi47mTsGkVukJvHzP
 bnAe2LSkhrPhcrJZpQzKo3MfJ3Py2SCVe1UGL/8GZPnUCFpFKrKe6FDjHnDD4RBhpPLClo+ouQp
 x0KF1Ogrpkb1wuXTZlGCMgEu96SEQ15bSNSrrgF9ukxeDyCkz+mn9pA5cRZpr3b2jEyf/aH5F7H
 5uVEqL+1cl3oqDqAPvHwaqhx2xeXZmn7SXwyhQHYkYrRQipZ7PSYS+IAcAndXD581podQte1NI6
 ecFRdfApNUFzFKY4WBQYhu/IuIPZhcu6vz9TCKBfCNIcCeJSaHy+4qK7hHDaml0ySickMyxGfvr
 b6MtuZiBvMiLBC6mxJdwwo1my3RZK4lgzcQX+SBwfLLbjCMdlzGkceM565kghpEfpAptjKFoKaj
 33CsdsPEJ9mVJEOPGpA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXzzih+y+ooFGp
 8pkf9McNSaPANSs0MCJdGRsLDdwNrb2ILhT3vWJoNVsoK3ei2kvsIlJk/ZTO33vEgeOGm1A4EIA
 dOvC/edvcIVzc+UtjfjbLysIJ3AbOH0=
X-Authority-Analysis: v=2.4 cv=WMzqzXsR c=1 sm=1 tr=0 ts=6aed9c0e cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=H1h1Rys4rTy22MHYZdwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: olb0-_NfIy5Gk7WQG7GjVGasOz64aTh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 205 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  66 +------
 2 files changed, 207 insertions(+), 64 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
new file mode 100644
index 000000000000..36702bac331c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -0,0 +1,205 @@
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

