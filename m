Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458198;
	b=2WdH/4/SP0V/JYD+c1egEm61sXSZ3xMZfo6ZWX+bHT+v5gTMO5b1w7JaJGOJPMr22ze8
	 d4Kb8647FGThBuodw3WYzDrcRmXkHhLA+jzgyLuLXBqE+cvjC8VTfuAQyst7iC0+KaWc1
	 uEHH6oDYuELZYN4t4F3XU03X+82FAvYUu21SWQNVZJaUtSzsLVgFYmFx8Jn75/QbAOpoG
	 avGJBnkYoAfcSoGkgKcfF9Af+pm0gHh1Ppr+/VKDUFob2gMhhIFfwMkgoa9sbdV97/u5d
	 dQH9dr7gIcFUpEQF9XqKTyZUwx35z4jGslDy6xcjMAs259eGmAiNk3H8JoffQuhb/9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458198;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=;
	b=DyU6Zj0KqaqACyu5r9ibYpnh+5V9O38BIHivdLN0Wdp/qzeCj6O9y7bADFb5BO4X04SP
	 QY7XiVUyrBBUvLXSPsH9lQpE1UgiidfVfMYSwHgwrZ6dYLTEeGPLcVkA78NSE4sv4YQGC
	 hn91K02mIBmWurMGP8iMaokxqj5MbAqq/VlQ5UuX75Y2P0zzyPrhXafPMfEX5BFjRzU21
	 SHYypVAzXzY8R/PxR//z5kUaoAT+UpKiEocEdEXTdZKDR1biMhc3IM3E1tTS/SIks3iy5
	 HfvNnYX2rVGKuZltoJbPzhrNmdrIDiqfohgrTozFWZ9rXUSEp2tBSw4XZuZkYy3IA6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1p18bIZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kom2oB1S;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63129606B680
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63129606B680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e1p18bIZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Kom2oB1S
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zk0a2136002
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=; b=e1p18bIZXnvfBQgK
	KvqaXZNmW3YA/3qFkBJ8cC6ZaJ+OROf165TNNZ2riXUu4Q7EjyeTJNSgWXG5a15U
	NWgVK8pkLZWFKCA4rHj3cE6kHmdoicdv+Sg9e3xV2GSp5rPGbLzHhzPemm5ve3Ew
	f4merjafJ4XjVq+3u2O1iiBfpYfQDFvoaaguRTJnQpSX0QhA/BFy6AsAkEXksJQ4
	/IZrRoO8vlwUpuNTpeRzgr7LIUbR/7eGFmvK43EzqAebTQmlC3uwkC9vYc3aePb2
	Is9lS+YbUOKMmA11ECjTXqZ+F0g43F8TyyOE7FK2MgvqDOFXlk0SSbrb0tk8kyYI
	AWOUaw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvpjjv080-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:36:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1327414eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:36:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458196; x=1795062996; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=;
        b=Kom2oB1S5IhX+7ZhED93QW70qu6thuWu/Dakum6gnIIBmKctKrVmX2qylU9mHZD3ZY
         wOlGVmnip6IGfRoF2/0SgFvYBqSOTYtifCKcUt6DXBNTbJPS+O4enqR7+apcd9B4JeeO
         E3NUhZz39Df407aR4H4wD9cHjoHVxwC+8TegAEQAvM57VfQ8KClHvIvg38GdYcWRDKSj
         5G3nrGsTx2Wb97MZ7/ZSV2ZzfCELpULVwKkjEt6ixVy/7LNvxAq1d+Cf96m2kSbM2urY
         Ph2SFm7bgLI1P3QPVLvlyH2FRtA+uWnO1SouW3uJGB7mw2bmnBbTfDhwfSFSFnwpEG2O
         +FFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458196; x=1795062996;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H0eWptuviHTuVUkbdwUfGOyXMlnjmZQuyeI/I1/RaXo=;
        b=WTvmLBzVfVHaO5gUtIONW87coU2K+dOQ8vKxa1aUWztQ22ZuzoWK02ZD0Ych5FlZfL
         0re39qtjJgDHJUX7lojrIo//O7bpRKFCV7FTKvkWALBu8/8jdDiLw9uf9VJ43pzQUaOi
         ySuGgcXvaAGAJcQQ82sbhlJD3sUeu0pOsEfquIh/z1VYNV0PsK3tGLpDlC0D3rzZU5SD
         gyJvIJC0U9wLw4RwRvHpF1aEFHasXsyt17DJxXu/R+/6dSf/+EowX4t5gOBHNi9KlViG
         Z4LDCahDg3k7NXKNbvms9RViPQ/0MJ2bIqjgLtQLv5Vm6lu6qStBXyA8vrZB+7yKalCO
         hshQ==
X-Gm-Message-State: APuU4Z80xogrP9Z5JtCE97/ZCbNZG2ce2gcYwUfaYqUeqwmPVV+Rznz9
	syC3v+R4V6mM3HIkQ1BPkJdVjJJzMLRteC/6t+dRJ7jfGJDYecfEYvrFM8nI+6YGvnbLm043oB1
	Qfo2gghv83zVEmHUALFpYwRz+/hQ0vaWTDfEd5XKNWZEsMSTGW9d9bA7l40iS9YdR1i/q
X-Gm-Gg: AYBFou1fWBNbmPsyPGGBmPSUrepK43cg82HBMu+Q4c6GGMr3Cn1sY8fHqy4pj73WOyF
	yGfeQKj/3fLoRcxE27d8ERsSUtVb0NIwpvyblkiWp86QfkJTeveTdKaTH+0dtz/Ucv7qI+BOOUU
	9eD1wq4p+JiWhvn6O0EUa0Axh6o83I45vXSqyu6ZtYvlXTJcCEwKeghoL8SnbxSK9l5VAVNgj8r
	J+ZAuFw7DK2pPrSS3vH1YY0QTF/zqN20RybuLluXibwOjvUz3PNcaYldpICqFG1XC29PO+gT4I4
	hqfYbb5Jdp2Nl2+RRIDUdi4QEgWmMLpksK9N2XPwzUNgttYM3lpgy8+YXFN6HuWivaIZbagrCY7
	2McwAMz+7vDITXk1Y4CTc3jwmE1QBorP+ZlrRXCF/4WxhlKYQBD0Wvf9uFkkEAZlHm6g17H3c0h
	RHpb4iX+Uj4Ax4q5fMpOINSVn6LRcwt0dB1E4Gzwrw09M2YC+/AA87jMH3cbIYYMPC06ukN3JW4
	ZkQ670=
X-Received: by 2002:a05:7301:678c:b0:36d:394d:e696 with SMTP id 5a478bee46e88-37685e6c8b8mr6973029eec.29.1794458196130;
        Wed, 11 Nov 2026 20:36:36 -0800 (PST)
X-Received: by 2002:a05:7301:678c:b0:36d:394d:e696 with SMTP id 5a478bee46e88-37685e6c8b8mr6972983eec.29.1794458195368;
        Wed, 11 Nov 2026 20:36:35 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:36:34 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:21 +0530
Subject: [PATCH v9 02/11] arm64: dts: qcom: ipq5210: Introduce RDP504
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
Message-Id: <20261112-08-dts-v9-2-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX2YXotLZGIKsw
 ptftyBWhWF6jesr+j2hRknEr1tAValbj4zjK/zZ0oOMXHcqBde6MQmP11ZZUFM/VHQfNQbjdOws
 8FF19u+PW9sZe1+yLIFa6HV4XP3fjSX3rK5o/4iCvmddcMbK5kHMwW6xRCqPaGLm/y/WlGD7EgY
 vQxOw26jqXflOvgh61l0wwSn+qpX27Xrm2wRGR17SKLvvWhu4fw3zUNL123ejjSz5ihX7BiNhYz
 FkRoNwEgjzv04pR/PtqC2e463bEBMpiGFyoDvPZkD7JM7mBvzjCrBhUyXzPaVROmLRcFvRS8F3O
 kwvTmJqI590GyOSygRwTUOkc0YYVGaVNx/xecGXk8UAYm9LvlKhgLVEXLPBwdlJNMTQW4ww2KyR
 +irE6b/8nXeQEhYckLu3C0wkohoqMiZIt+wr0bHFVQKZqOmc5HRkdwyJr/ylZbEXvKkzWBWNGfg
 iXCVqtukYbK0GNi+5Jw==
X-Proofpoint-ORIG-GUID: RcIhidox-OfPpv3geQqm-pnuFny1vcnn
X-Authority-Analysis: v=2.4 cv=FeuiV5+6 c=1 sm=1 tr=0 ts=6af54255 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=sBhH8NEu279NYU_71NoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: RcIhidox-OfPpv3geQqm-pnuFny1vcnn
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfXw9O7z1fOSlur
 1umEpueALmCP6Ixkn0X1TF7s/CzKvY+qHR90LP2WiGEIFRLKOtQjxG3V05I8obkF2Pls8aKHbhq
 rR5FtpdVlGyIil4R5ZWFE/QQDMMnWGU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

RDP504 has USB, PCIe and SPI NAND devices populated. EMMC and NAND
share the GPIOs. The board has to be reworked to change from EMMC
to NAND variant. Rename ipq5210-rdp504.dts as ipq5210-rdp504-common.dtsi
and include it in variant specific DTS file.

Describe the fixed USB regulators, PCIe reset GPIOs, QPIC SPI NAND flash
and required pinctrl states. Enable QPIC BAM, USB and PCIe for the board.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 225 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts        |  79 +-------
 2 files changed, 227 insertions(+), 77 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
new file mode 100644
index 000000000000..6fb8666ffbfd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -0,0 +1,225 @@
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
+/*
+ * The bootstrap pins for the board select the XO clock frequency that
+ * supports 48 MHz, 96 MHz or 192 MHz. This setting automatically
+ * enables the right dividers, to ensure the reference clock output
+ * from WiFi to the CMN PLL is 48 MHz.
+ */
+&ref_48mhz_clk {
+	clock-div = <1>;
+	clock-mult = <1>;
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
+/*
+ * The frequency of xo_board is fixed to 24 MHz, which is routed
+ * from WiFi output clock 48 MHz divided by 2.
+ */
+&xo_board {
+	clock-div = <2>;
+	clock-mult = <1>;
+};
+
+&xo_clk {
+	clock-frequency = <48000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
index 519307c6b61e..43cdb981a4ba 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504.dts
@@ -5,30 +5,11 @@
 
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
-};
-
-/*
- * The bootstrap pins for the board select the XO clock frequency that
- * supports 48 MHz, 96 MHz or 192 MHz. This setting automatically
- * enables the right dividers, to ensure the reference clock output
- * from WiFi to the CMN PLL is 48 MHz.
- */
-&ref_48mhz_clk {
-	clock-div = <1>;
-	clock-mult = <1>;
 };
 
 &sdhc {
@@ -41,59 +22,3 @@ &sdhc {
 
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
-/*
- * The frequency of xo_board is fixed to 24 MHz, which is routed
- * from WiFi output clock 48 MHz divided by 2.
- */
-&xo_board {
-	clock-div = <2>;
-	clock-mult = <1>;
-};
-
-&xo_clk {
-	clock-frequency = <48000000>;
-};

-- 
2.34.1

