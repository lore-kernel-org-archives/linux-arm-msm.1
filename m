Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30A4A3DFC8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786367043; cv=none; b=lo+FSpr2ibks7sa2t6ZvDTCRf2CXisb+yE7Gvj+M6m3xPGyl+P9el3tIC2XqQoVelDlejhS9OQyHvvTL0YfsGvgt7rnM54074UCB3FazJZnjk31yfUuABnmOmX1AVU5Fo+gvG+S+pmCpOmQmT4V3PrWwNJ0q/QcZaMhKCaTNWi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786367043; c=relaxed/simple;
	bh=Nzq/yye7pyvg88MTDQ04V4b//gWMCeurj0oN5A701YE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IJkto1Moaj5a/izRfO7IvwjRD/PVV5XXcZiyV/9HTr7BvUBBrrAxiUJVSN3dNZuGisvprpSjINBjOjjA+OoHUdVTY8BMtHwhvTax55oUwthUsK7wy94kYqmyDTSqWs8xFssxD067WB85e7+fqz2hu9mZhyqQD0RuwbLS9dz02B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BgjrrAB6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NPrGxzM7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BgjrrAB6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NPrGxzM7"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACjwc41961300
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWYltpvNlA2pP4Dlt3eIzAsxW0+SlKFFLeE3diylI80=; b=BgjrrAB6Tm+oaz4y
	Twhl+iF78PX+tPlXgLZiwrejqjcvALrNekLa3OMgGA7fZKP0VMzFKd81geq1SuqN
	kkHb5O5r8vVOJt7llvbWUsB0JxzAJDsUCO1LZi3VYvRVuYaMNnIVOLUXIA2Gz8fS
	mxSaG+qInWTZ31Dir7gT9aBQHzZkiD1RgJATwDthVnbG6FXnaehds9F8a2SYH3QK
	GikxEn3a3veemnL4u3FhDu1omtc0Ks+5PtHiYni8y9ZVjpHnWxEmBJ3BaNeSci1l
	Grm2vPohlZ+tg/aM4VEG4T1rugn9cYRB1XvMrCLYiMGa3I3nUDZXhgQFIarDOWl8
	BgAPVA==
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com [209.85.160.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy18xtnd0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 13:03:57 +0000 (GMT)
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-455d6f14efeso588380fac.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786367036; x=1786971836; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWYltpvNlA2pP4Dlt3eIzAsxW0+SlKFFLeE3diylI80=;
        b=NPrGxzM7JXUQXjvUaHi95lZd+lCH8fciCdUMeJRMe+W3z98btgmzDHIwnwpw83mFSY
         Ch1DJ/B89UrqbqxWdqfr9ezC1joEMTvywrE+ukuH9hDDcjKt+xm5/wslSRnt6QVNvWdx
         fTSYn5+3To+7W4Krvz2l1wcsJiK1hvnlTWEPjNk5eBNqRHJS1OnTlcPmHolZ4tISqqgh
         WVYLnW5I/YHEiyKmOm6uf7H4uWvp+0tG6lgFcqCnx/vtaFliTnffJUmpYGq3T3EAMc2R
         TJshvFZU/Jhk9AckvO+vHaQ1OdNzAr4R82Ylh18LRXbxpxppwhtQvcdqWn1bFWIGCFgZ
         tF8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786367036; x=1786971836;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWYltpvNlA2pP4Dlt3eIzAsxW0+SlKFFLeE3diylI80=;
        b=aV4F3eihM2YT34phMZiOeIabWZddi4Ax9YG0j1LQHIY7npa5d5v5RRtSrZGBbXDIf+
         cTqPjDekxh7UjZwAeOf1SljGeE9NWrjm6JNWQ87vm+uQ//ztYk8R6VgD4/70bB9O4TJn
         5rx7MRYc0/FWfY0rX8yqi8LkxjWHyjkEuk89J9aB+HKDFC6QBwL9MS9dWt6vQ5MMUgfs
         X4xKgdTa032y/ZfspISqF/C/SpSLBXasr5nu2lbWy0+R6ubzbmVuWfjis088sej7b6Mq
         Ge4FKecezOSWakx7pW0Z/gl7ZvsV1G/NG9aXah3RrbP8gwlazfOtIwZx+qlZ9kxntrWA
         P6gg==
X-Forwarded-Encrypted: i=1; AHgh+RrY1gZFJX8xnICB+CmvkHQtt8IV2ifuO6RBSzxO2zIGH0mF1mMncUhUi2mAbUnGM9moJWpd2R0o3t+fcTVh@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3KqAceo9xMYIrfpvzbkLgp+OPM494W/zp3Fa7laxeOvyGZBc/
	S+xw+fcJVGMdItRpIw8zAFFbOFNyNlyqafwn+8aH54AO2H/22Jj6SXrNYdocQyxU9XCjNI9KijE
	y09yQHsbhRbuRqL04RonlnT6pFY8jWfwafZI+sBFZEZ4wbJZ2TWZRYknQ9E+j4dCh28Wb
X-Gm-Gg: AR+sD12QvH8A3480eEA+kAFk0fuDtGbnaqApMfVZujtqvvOU7OWBsEMPBc70YVrKVjW
	mOM19aJWIut+9h+W0RRUIIfT8orJuneXJongdyJ4pEb4BgWYa2DZgrZz+qH0T4Ii7D5Tet17Mnf
	M0bDeVFYP47tX716wgTYjkmahbyC+INO0+ofDNDIYt+UymLImbjhggfEKs8ZAyvDWiNeIS7xWkQ
	ggwzTlVK2TZXQqwnt49T5zdJzgxixAKeQ4IgaMxbXaGDJFAsB3L0kBXXprmUvQ+Z5zShACwDOME
	Z1wN4n3zFJjEy87jN6V5YZK9gd3wEZvmh8vDlvLBRBv7P1cf0vQgf+4L2nmYxUH9HLx75UtNQBF
	88nrSjf5dh/z/rzLsvu3lROcc8x4FIYiWqkRmBoBdCjwgA/IVzha4q2CTU7uXdGEs
X-Received: by 2002:a05:6870:659f:b0:457:81d2:cd1e with SMTP id 586e51a60fabf-45a0ef09647mr10176484fac.4.1786367035877;
        Mon, 10 Aug 2026 06:03:55 -0700 (PDT)
X-Received: by 2002:a05:6870:659f:b0:457:81d2:cd1e with SMTP id 586e51a60fabf-45a0ef09647mr10176419fac.4.1786367035161;
        Mon, 10 Aug 2026 06:03:55 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-459f1a9e431sm8218971fac.6.2026.08.10.06.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 06:03:54 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Mon, 10 Aug 2026 06:03:30 -0700
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add Glymur QCB
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-glymur-qcb-v2-4-9e6ea7987b9e@oss.qualcomm.com>
References: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
In-Reply-To: <20260810-glymur-qcb-v2-0-9e6ea7987b9e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786367028; l=19445;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=Nzq/yye7pyvg88MTDQ04V4b//gWMCeurj0oN5A701YE=;
 b=kxk5Qyr+IilkRFhb1pEnzwfvjNeGHTsFRNOeIwEO2WpZFYZabdcqKKhqatCBXFjuzOCu03xY+
 qmn7x+n5zBmC6f5KxItSM3Emfo0atpY+Mg5nD3554Tye5T7A72TGrdQ
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX67k6eAkqUc7v
 64as0k0x24gKZVdZeuGofDyZEeBswubmn8FSzCrXzlmjEtqciZr9R3tawR7tbFfgAUcFyP+vU9B
 4LbVt8YE8L5Mcd6+cNKobd8qeUxW9aE=
X-Proofpoint-ORIG-GUID: gDT6qTd5i8J16KIrx5J7FGgJi9lD4IU5
X-Proofpoint-GUID: gDT6qTd5i8J16KIrx5J7FGgJi9lD4IU5
X-Authority-Analysis: v=2.4 cv=bfZbluPB c=1 sm=1 tr=0 ts=6a79cc3d cx=c_pps
 a=nSjmGuzVYOmhOUYzIAhsAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=9o9uVLDla7lDNhLl0WcA:9 a=QEXdDO2ut3YA:10
 a=1zu1i0D7hVQfj8NKfPKu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDExMiBTYWx0ZWRfX6LW3wORTQt8z
 EglWIzJrhSuQLKJOnH1X8QdwCXeWnFsykRIC0CtZwWX5aYqREiupvTqksiGyZgoSfuOtvIqGsKs
 jnQ0Vma0a215F+r0+VOYdy86LL2azxZpv9VK61HrYOG9/zJhxA0oqqq4qOI4MujQ92z0Xqok2Zd
 P71UnOcOyxq8A8K4ZAzS01NzSvKbzMAqIQTihcESPm+MgYvbgMxjOqA62ihzg1rsF1JrI3SJgFi
 1qg5EH6Ic2oqErQjCnR+nyXbMknzIOqaoWdFKYq43B/xO3cG4PPy4UOYYEpuvE0TpCRD4ZMclQU
 lE+EmUv36z/p1NHz9p2IQUlrl++2CLAMR144FR9yG23ipLHl2Q82JdveucygIqWYjRCO7GUv7mi
 PtgveaTYM25kNTULxoW1wqLfqUGLWtDV4TuXINQIOIUew1Vud3tUcy/brYknMcbRMpnyau3A3qS
 Gdjjhj69e9NrW0XgF2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100112

The Glymur QCB (Qualcomm Compute Board) is a Glymur-based board in an
open form factor, aimed at compute bring-up and power/signal measurement
rather than the closed enclosure of the CRD.

Add its device tree. The board boots to a shell over the uart21 console
with its root filesystem on NVMe. Enabled so far:

- Board and sleep clocks
- Volume up/down keys
- PMIC RPMH regulators (banks 0 - 4) and the NVMe, WWAN and WCN rails
- PCIe4/5/6 controllers and PHYs, with their PERST/WAKE/CLKREQ lines
- WCN7850 WiFi on PCIe4 and Bluetooth on UART14
- Embedded controller on I2C9
- ADSP,CDSP and SoCCP remote processors
- TCSR refgen and QREF reference supplies

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile       |   1 +
 arch/arm64/boot/dts/qcom/glymur-qcb.dts | 699 ++++++++++++++++++++++++++++++++
 2 files changed, 700 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..5131fe514a0b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= glymur-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
 hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
new file mode 100644
index 000000000000..17d8ff3aed23
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -0,0 +1,699 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "glymur.dtsi"
+
+#include "pmcx0102.dtsi"        /* SPMI0: SID-2/3 SPMI1: SID-2/3 */
+#include "pmh0101.dtsi"         /* SPMI0: SID-1                  */
+#include "pmh0110-glymur.dtsi"  /* SPMI0: SID-5/7 SPMI1: SID-5   */
+#include "pmh0104-glymur.dtsi"  /* SPMI0: SID-8/9 SPMI1: SID-11  */
+#include "pmk8850.dtsi"         /* SPMI0: SID-0                  */
+#include "smb2370.dtsi"         /* SPMI2: SID-9/10/11            */
+
+/ {
+	model = "Qualcomm Technologies, Inc. Glymur QCB";
+	compatible = "qcom,glymur-qcb", "qcom,glymur";
+
+	aliases {
+		serial0 = &uart21;
+		serial1 = &uart14;
+		i2c0 = &i2c0;
+		i2c1 = &i2c4;
+		i2c2 = &i2c5;
+		i2c3 = &i2c9;
+		spi0 = &spi18;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&key_vol_up_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&pmh0101_gpios 6 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	vreg_nvme: regulator-nvme {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_NVME_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&pmh0101_gpios 14 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&nvme_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_wcn_0p95: regulator-wcn-0p95 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_0P95";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+
+		vin-supply = <&vreg_wcn_3p3>;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_wwan: regulator-wwan {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WWAN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 246 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wwan_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		vdd-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_l15b_e0_1p8>;
+		vddaon-supply = <&vreg_l15b_e0_1p8>;
+		vdddig-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p2-supply = <&vreg_l15b_e0_1p8>;
+		vddrfa1p8-supply = <&vreg_l15b_e0_1p8>;
+
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pmh0101-rpmh-regulators";
+		qcom,pmic-id = "B_E0";
+
+		vreg_bob1_e0: bob1 {
+			regulator-name = "vreg_bob1_e0";
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <4224000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_bob2_e0: bob2 {
+			regulator-name = "vreg_bob2_e0";
+			regulator-min-microvolt = <2540000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_l1b_e0_1p8: ldo1 {
+			regulator-name = "vreg_l1b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2b_e0_2p9: ldo2 {
+			regulator-name = "vreg_l2b_e0_2p9";
+			regulator-min-microvolt = <2904000>;
+			regulator-max-microvolt = <2904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7b_e0_2p79: ldo7 {
+			regulator-name = "vreg_l7b_e0_2p79";
+			regulator-min-microvolt = <2790000>;
+			regulator-max-microvolt = <2792000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8b_e0_1p50: ldo8 {
+			regulator-name = "vreg_l8b_e0_1p50";
+			regulator-min-microvolt = <1504000>;
+			regulator-max-microvolt = <1504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9b_e0_2p7: ldo9 {
+			regulator-name = "vreg_l9b_e0_2p7";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_e0_1p8: ldo10 {
+			regulator-name = "vreg_l10b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11b_e0_1p2: ldo11 {
+			regulator-name = "vreg_l11b_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12b_e0_1p14: ldo12 {
+			regulator-name = "vreg_l12b_e0_1p14";
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1144000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_e0_1p8: ldo15 {
+			regulator-name = "vreg_l15b_e0_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17b_e0_2p4: ldo17 {
+			regulator-name = "vreg_l17b_e0_2p4";
+			regulator-min-microvolt = <2400000>;
+			regulator-max-microvolt = <2700000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18b_e0_1p2: ldo18 {
+			regulator-name = "vreg_l18b_e0_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pmcx0102-rpmh-regulators";
+		qcom,pmic-id = "C_E1";
+
+		vreg_l1c_e1_0p82: ldo1 {
+			regulator-name = "vreg_l1c_e1_0p82";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_e1_1p14: ldo2 {
+			regulator-name = "vreg_l2c_e1_1p14";
+			regulator-min-microvolt = <1144000>;
+			regulator-max-microvolt = <1144000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_e1_0p89: ldo3 {
+			regulator-name = "vreg_l3c_e1_0p89";
+			regulator-min-microvolt = <890000>;
+			regulator-max-microvolt = <980000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_e1_0p72: ldo4 {
+			regulator-name = "vreg_l4c_e1_0p72";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <720000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E0";
+
+		vreg_s7f_e0_1p32: smps7 {
+			regulator-name = "vreg_s7f_e0_1p32";
+			regulator-min-microvolt = <1320000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s8f_e0_0p95: smps8 {
+			regulator-name = "vreg_s8f_e0_0p95";
+			regulator-min-microvolt = <952000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s9f_e0_1p9: smps9 {
+			regulator-name = "vreg_s9f_e0_1p9";
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_e0_0p82: ldo2 {
+			regulator-name = "vreg_l2f_e0_0p82";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3f_e0_0p72: ldo3 {
+			regulator-name = "vreg_l3f_e0_0p72";
+			regulator-min-microvolt = <720000>;
+			regulator-max-microvolt = <720000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_e0_1p08: ldo4 {
+			regulator-name = "vreg_l4f_e0_1p08";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "F_E1";
+
+		vreg_s7f_e1_0p3: smps7 {
+			regulator-name = "vreg_s7f_e1_0p3";
+			regulator-min-microvolt = <300000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1f_e1_0p82: ldo1 {
+			regulator-name = "vreg_l1f_e1_0p82";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_e1_0p83: ldo2 {
+			regulator-name = "vreg_l2f_e1_0p83";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4f_e1_1p08: ldo4 {
+			regulator-name = "vreg_l4f_e1_1p08";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-4 {
+		compatible = "qcom,pmh0110-rpmh-regulators";
+		qcom,pmic-id = "H_E0";
+
+		vreg_l1h_e0_0p89: ldo1 {
+			regulator-name = "vreg_l1h_e0_0p89";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2h_e0_0p72: ldo2 {
+			regulator-name = "vreg_l2h_e0_0p72";
+			regulator-min-microvolt = <832000>;
+			regulator-max-microvolt = <832000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3h_e0_0p32: ldo3 {
+			regulator-name = "vreg_l3h_e0_0p32";
+			regulator-min-microvolt = <320000>;
+			regulator-max-microvolt = <2000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4h_e0_1p2: ldo4 {
+			regulator-name = "vreg_l4h_e0_1p2";
+			regulator-min-microvolt = <1080000>;
+			regulator-max-microvolt = <1320000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@76 {
+		compatible = "qcom,glymur-qcb-ec", "qcom,hamoa-crd-ec";
+		reg = <0x76>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&pcie4 {
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
+&pcie5 {
+	vddpe-3v3-supply = <&vreg_nvme>;
+
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
+	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+
+	status = "okay";
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
+&pcie6 {
+	vddpe-3v3-supply = <&vreg_wwan>;
+
+	pinctrl-0 = <&pcie6_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie6_phy {
+	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
+	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&pcie6_port0 {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+};
+
+&pmh0101_gpios {
+	key_vol_up_default: key-vol-up-default-state {
+		pins = "gpio6";
+		function = "normal";
+		output-disable;
+		bias-pull-up;
+	};
+
+	nvme_reg_en: nvme-reg-en-state {
+		pins = "gpio14";
+		function = "normal";
+		bias-disable;
+	};
+};
+
+&pmk8850_rtc {
+	qcom,no-alarm;
+	qcom,uefi-rtc-info;
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/adsp.mbn",
+			"qcom/glymur/adsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/cdsp.mbn",
+			"qcom/glymur/cdsp_dtb.mbn";
+
+	status = "okay";
+};
+
+&remoteproc_soccp {
+	firmware-name = "qcom/glymur/soccp.mbn",
+			"qcom/glymur/soccp_dtb.mbn";
+};
+
+&tcsr {
+	vdda-qrefrpt0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrpt3-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrpt4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx0-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx1-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx2-0p9-supply = <&vreg_l2f_e1_0p83>;
+	vdda-qrefrx4-0p9-supply = <&vreg_l2h_e0_0p72>;
+	vdda-qrefrx5-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-0p9-supply = <&vreg_l3f_e0_0p72>;
+	vdda-qreftx0-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-qreftx1-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen3-0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen3-1p2-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen4-0p9-supply = <&vreg_l1f_e1_0p82>;
+	vdda-refgen4-1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
+			       <10 2>, /* OOB UART */
+			       <44 4>; /* Security SPI (TPM) */
+
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie5_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie6_default: pcie6-default-state {
+		clkreq-n-pins {
+			pins = "gpio150";
+			function = "pcie6_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio149";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio151";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wwan_reg_en: wwan-reg-en-state {
+		pins = "gpio246";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn7850-bt";
+		max-speed = <3200000>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+	};
+};

-- 
2.34.1

