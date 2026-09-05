Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C2D62D7DFE
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Sep 2026 01:30:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788571844; cv=none; b=TJ9MxGm+4XN9UvZhBx/CWc/BYuP16d7ZQYVu9Gg1swmJ1oYrFRmv7DySF0EOmGUe9vNrXGF7XJpB8CAN6GAvpWqKKp1kRSQqqZWNwJQvK+Z3VYyTXisH36mNyhLCiq5IVgdS2t9ah8hBt7Nkv+AOpHcyK0TWb/7ur/EZow6KSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788571844; c=relaxed/simple;
	bh=lp5GSr6dro/MHpnWBR/CKVwMj1uEeL7tJ18Z/HaXDW0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dm9Tb7ZHOdaTWUPZKZbgApKQBUYt6E/w1COLkmYXQze3yM4UAKwEvUFwFCSGkpgAb8JI4vXZKk6NAcqG+5Py1qfJg+dcMky2UXTV9xV5ZR2tPp+9i0/4BMJGpxjIF93PkgNwckD72DkPKDBeHUdETWaINozSMNmwLtXpfgLJ/e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H1ZZTPcM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=arBgqUfP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H1ZZTPcM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="arBgqUfP"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6850vQBT878107
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Sep 2026 01:30:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b732Qrl/cyt7vxGomUN8jM9ZetTs7fQWQIIlc8LO3qU=; b=H1ZZTPcM48Vv0rPp
	FcauIBrMBMWfpDprsa/jK7mNpskLk+MBbl4aDHvhxJI6WYVSAIVummKbrddi0Miu
	eIR3cVEeKUw4VRMYqplSaXzBaV57OkwjmL2DWkMtB+NTCPsULHSgBjBdMEUCd2Yd
	f5rOkT9ElJUWzTNNqCyjLaGBNetRhaad1e3GgkXMnfy9HMdeN3gLolfwvgWVfLFe
	NL263kaUxnnBikAq9b5y2hmLTnnOgzWtLIa7t+s/OGeEXkcskwlkI9T39ifLKpPj
	pdxxFCs28a+SpMXoCkb91llLdkw+FGSZk4IREheEWHRc5yYPab170EVehQE9q/gg
	RztwtQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg01233dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Sep 2026 01:30:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3989c51d5daso350553a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 18:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788571839; x=1789176639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b732Qrl/cyt7vxGomUN8jM9ZetTs7fQWQIIlc8LO3qU=;
        b=arBgqUfP99ZofWApPEgZJpnB6G3D1uJrUvQca42CduWuTyHdDnAwI+2iXlqg3OpNDw
         xBQi+SPcvw4k6fVKwHvLsnZjz4dF00K7P6LuDY3sqn3Ux39BqcYumJf9+ysIEtxaY+8j
         x9qP7m2/N9Su3M7eBEfCknuT5qh8FO/pUnhRXtWsQ7JUKC0KzUbYm3RdVaICd7OUGqnL
         Ic7WG+WeckL01F32d14KoJfS3UtD2k9eSykVwQ0NmzqHOzR8LVxf9XG4Qg3WLbhXTL1V
         3sKfC0FqWpzB6u9mWfjNBDZuvGdwYkSAD4enKE4bbK5ZwAnQO/i3AVFNVZ96xHjs+zrL
         lZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788571839; x=1789176639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b732Qrl/cyt7vxGomUN8jM9ZetTs7fQWQIIlc8LO3qU=;
        b=SJl/tLB+ErHqo7ZrqPy6DRva7VoE99QxIHF3S2R+ZaMynan6bhnizJU1V82mi8BPhF
         iNphEP6F86jJhAfWAjejvYyc0x1r08wRueEJa/JncQBk87nGqxBhrSPc/rgQbWHp+0F3
         JppNE5vY2Cw+DIUkq8yWf2U9dgJLPaQOJa+w80EM+higR0AqfWQEi4Yyqpfic7dTwHX+
         uwZFrglGLtiH1Y8JeeBcqi/NaUqBzOLC7AV1NKvvodWGdVfix/t16DZsw0/h2k++rA3b
         Hc6hHWy5/qEhdlqin8UWxo1T4/Gz6+RrBVNTstoCIXTyZ0MEk+iu0hKwind/3n1XmX/i
         YdEg==
X-Gm-Message-State: AFuF++mJbcJJQpE/SqRSRF4uT0fYMDmS7D4Iy3enqs/ZvHejmCi4aP26
	0GHHku/b+qR0S3HvWN8G8b+X0BT1FGrv3RStKzFdyUcdDiK+AOq5UqO03CaQRZfK1VPDwvxZjlq
	VQ0JIfXg6pL9kIBW+yLxVSJZIzaF7G6hWRLnlhF2qPi3PRcIsUeL5s/a7ETyg+8DaYnw6
X-Gm-Gg: AYBFou28dfnpRHbnc6n2IyKBkKeVNj+ATIT2n/IFTu00zVMNaY34PlLEMAcXh7+yIsm
	WWW3WBQ06IAI2JXjkq3//PRg2zTK+Gn1FIJCR02dmB7B7dpnb694l+9zIvjsZNaF9ttlfBdtH3c
	17F7gSVaBhkgGP1GrNprpnxJpLcghbZmbPKWy6IsNYYuvuHANkbuhJS5vtK56CmoPee93Afnq58
	Tzx1hMetQzuq59I+BopbiWlsDm041kO2Rzxd4wlDwyGjEVFnvWqvENcseF33grVWz361I2oyOWo
	XoptPu7ah0TZTgtwVtnBrVLsLOKpDZLGQYZGBbO54OHCWn0mRh65cxY6lLB8CIA7oSO17C9iXpY
	EUs89rTRR0H3JvD06V2laKRqBJkZxrY60g9PS4vFXNYeNOSltobeZUzOUhn5l47fs3SHjfTUyVu
	Yih7ZYqVFt8XiDlIA2cIep
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39b3d8377camr2854604a91.6.1788571839121;
        Fri, 04 Sep 2026 18:30:39 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id 98e67ed59e1d1-39b3d8377camr2854565a91.6.1788571838653;
        Fri, 04 Sep 2026 18:30:38 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa33e96sm10170457eec.12.2026.09.04.18.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 18:30:38 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 07:00:17 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: qcs6490-rb3gen2: Add LVDS display
 overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-lvds-support-v3-3-b40a1b03f63c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788571821; l=4364;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=lp5GSr6dro/MHpnWBR/CKVwMj1uEeL7tJ18Z/HaXDW0=;
 b=LQB/IRje+CR1Ov0URj40aSCPy3t7eP3fgqM2OR83fm3VezT9Oq7JuV4Dz13/wtL01PnYiTd0D
 MTPVGJxOCo8B2k7Kvq7gBX9uUP66nLwduk3CI/7s0JX7wvBfLVyzEtE
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=dfSwG3Xe c=1 sm=1 tr=0 ts=6a9b70c0 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=So681qseQLv-PdXLquQA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfXz0+cr5cqq5An
 X696cYTTgaUhgCCWMoFeGwnvj6AX/TOR+whMo/t+wrzM/M0ca7OdaQ/DlI0WbfZsAIHSy7f2R5R
 /Wg3O5gDzkAPOPUXHMYSyMRjOCqwqLzId+YPAWk0j8zq02BcZhAC4KhyvgZLlVpttKYVZ62UGZw
 qUk9WplNJ4pPjiZh/V/0UYpaiOi0VfSf7bQi/mmlf+yB6Ebho4m8I48xJyOXnLT6MowBDJhjZ23
 1eZgfcDoeozeuwcJ657qqTgsaMTIiX3igW530DzMDxIpox96WGDvFVIOcFRfmD8c/A1BtimUF2A
 LJbK3vwqLEnR26F9ObYCRXGVH0ZxUsd/f+Knbc4mxaaqB2oD1alAldeNXA5J91rJfcX2/3eWDWU
 H88rHQe0xM4y7alc5zBRxHgqWy21/pZ19b22UJE5VvwgWMcQonNeASkGe29FnoNrnQJ9bRW7kbP
 qzPTQC1Og0VCSHUH4Iw==
X-Proofpoint-GUID: FyrqAfAAw_xo6TS4GDuczhhC5J2pAYnU
X-Proofpoint-ORIG-GUID: FyrqAfAAw_xo6TS4GDuczhhC5J2pAYnU
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA1MDAxMSBTYWx0ZWRfX43Kka+kvV1Mr
 2GG1LQDPU6xrSm81c0klQ+cNDcvLsGFf1tEQGe6MYzo4EO5XfbT1nLv6fLGLa5Pqx+1t9Tq/PXd
 8N0daFQkGx7QnHkaMBFvahKBjiZvaac=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609050011

The QCS6490 RB3 Gen2 industrial mezzanine supports LVDS display output
using the Lontium LT9211C DSI-to-LVDS bridge as an alternative to the
default HDMI output via the LT9611UXC bridge.

Add a DTBO overlay,
qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso, that
disables HDMI (hdmi-connector and lt9611_codec) and wires up the LT9211C
bridge on I2C1 (address 0x29) with reset on GPIO117. The overlay adds a
dual-channel panel-lvds node for the boe,dv215fhm-r01 panel, matched
against the panel-simple-lvds-dual-ports binding which supplies the
panel's size and timing internally.

The overlay is built as a composite DTB combining the base
qcs6490-rb3gen2.dtb, the industrial mezzanine overlay, and this LVDS
overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   6 ++
 ...industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso | 106 +++++++++++++++++++++
 2 files changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8cf82e7067e2..d3c09bb4d1a9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -196,6 +196,12 @@ qcs6490-rb3gen2-vision-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-vis
 qcs6490-rb3gen2-industrial-mezzanine-dtbs := qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine.dtb
+
+qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01-dtbs := \
+	qcs6490-rb3gen2.dtb qcs6490-rb3gen2-industrial-mezzanine.dtbo \
+	qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtb
+
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2-vision-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-minipc-g1iot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-thundercomm-rubikpi3.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
new file mode 100644
index 000000000000..5501ea09f43b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,106 @@
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
+	model = "Qualcomm Technologies, Inc. Industrial RB3gen2 LVDS";
+
+	hdmi-connector {
+		status = "disabled";
+	};
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
+		vin-supply = <&vreg_l18b_1p8>;
+        };
+};
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	lvds_bridge: lvds-bridge@29 {
+		compatible = "lontium,lt9211c";
+		reg = <0x29>;
+		reset-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&vreg_l18b_1p8>;
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
+&lt9611_codec {
+	status = "disabled";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9211c_in>;
+};
+

-- 
2.34.1

