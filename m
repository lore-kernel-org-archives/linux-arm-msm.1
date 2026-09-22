Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3806551A14F
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790073792; cv=none; b=HKQgdyCK5YpQW6g32GxTofXN4o7dXNxG1a6KuCyQeZ3GRx3u+DZgPmYGbfft8gMsICieB4fqIqb1S/IIYI1Ga5l1jNDNd+bYy6riKlpRX1o2IrnFG/mcb3eKR+f7JtqgZExIdxJR/9H6cT8jOhVXc8LnCAZRpr+Kq+/goHYi8M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790073792; c=relaxed/simple;
	bh=iguCScBr7c+PEbcCLD4EZyGD7fEzM3bqpPRXLUqwuds=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GRf6oqvPqhKhLRLWg3udyuihMyTyImEWZJLRGy3b7XhJDfFZAv1zW57s57VJNd7ibdykhd/QgUUnfpDsO9RQWCbzc9Tx4nx6z34NP03huZ9GRHBUpfKHWt9SBMy7+7Yz1Br7+Pl2o8KfOyxpb5WDLDFcb8YYDelPTTO/KIg5bLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fUuR/lCn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kIC/hexV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fUuR/lCn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kIC/hexV"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68M8d8T03703832
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kDc8/TbuwSX2LX2FxhsLOZCwj+p7CiHx7cpW8387+bY=; b=fUuR/lCnx+66nAS8
	HpKQ/AtwzaFd3/LZXYC9kQhG8QJ9ChcMipO6RIdNtghPduivsV7tQb6e04C8SJke
	tP/D907fxvCa239LCdQqOXFkh5G94TdGhULAxqOt1LOvN5QTVfE/+5NcXFnvOzk2
	ZjOL0XSti2CogHfVKnIM/fwT2iftImZ9Flzy+FKcYR88zBNenJu9kmCDfZCn5XMR
	k5EDl0AvOjD7HCdDV3+rt7IoKpnbpP/kJ2JljgKJxGhFdCEErQuSg/eTVmD7BS/E
	iFzpwOrMNtOXUWPP/nZb3ZF1SVvTOpv+FSZW0diAic9HCpTcAB30OZ0qrsfTvLgp
	VrzhhA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gupbqggb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 10:43:10 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2d63bad3d09so55790875ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 03:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790073789; x=1790678589; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kDc8/TbuwSX2LX2FxhsLOZCwj+p7CiHx7cpW8387+bY=;
        b=kIC/hexVs1hRYnJZl9HSEv9PVeTeKGoKZoh2Po0GAly9NLtEGHqN9gh+6LefC6uqeD
         AlrE4ok0wlFGgJforSSMHbjlxA+M6ojmssPOYcL+/1L4kxnZodKiQSYEM9iOvEVrNH49
         /OFecP/xY89nBc88hj7Gw3Ra1Rs/n5YP5QavlpZUMjE4FK6bbTGc2yDImnairOYpyBtX
         SD0t+uB7Gkca4r4NoVCrV5LFPjM+VWlJZC106StWIXLJ44RbbOPWX15PB+FIKZdSmiQn
         TBm5p2rHG/lvF49VG1MeH2xhPWPCNDROgbU506ZRMn+HkOjP9+vfG8T39lb9KIT0YqLj
         Uogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790073789; x=1790678589;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kDc8/TbuwSX2LX2FxhsLOZCwj+p7CiHx7cpW8387+bY=;
        b=vjARp+8Fd/fLzIXXW7QsxTqhHSahiv+WH8lWuKlRtzf+xkShqbclctJ6X9Z2/pxsjE
         msNk4SbBVKAtxTRtUTIgpXDEDmPaSmC+rzAiKqHWS+5laFM2Bz4dsRNsQORNXnMbMsg0
         rG0ZL146dy1Xg3OriMbZMDhdXNfz1bPPEa4iqYSeqm6jOZV6/yqr0hHkxU04p2xx0b1j
         B3klkgbzVZbW1muiL1zW173NrpCgZwdkeTjHogeJ7w4vzFod69+LGX/SJS7y6zfvhdEw
         TAe1iiaSH8Tuf/vw/0W9Frz6tec2KC41NeN6HasbOKpHm5/SkUnBUw7NjwDCWsh604tw
         u24A==
X-Forwarded-Encrypted: i=1; AKwUvBx/ULR93YoBcXYfSNk5T9uyarH1KniEB+q3zZX4w609fvSM2sPAdwTuIif/yp7pUuKmVNLc9ZM3zqyyq9Pu@vger.kernel.org
X-Gm-Message-State: AFuF++nnbiiNCUJwo/itIOG1gITmJ6IJr6mf/1Pjz6OSMVUYlsgFa0yd
	+FbtIHxMxriUGFRHnM8iLy32r8cMyOI1XBXqiPNKqcM0S734Jq+vRhO3CaE+iG1kXSkKloG7SJR
	XtoxfUhTmpAXPdB/IGbwELPTnhm9WbGVz22rkupmOAQz2kz3FRlw50s9T+U7twlX7JEWg
X-Gm-Gg: AYBFou3fIEzm+VaYcQXKE8vWpQ7Z5XuS114q14vPj3fja0TqCmUqvvsrxHfeuqy85ho
	M2wjFcvwa+d+vTrnmMM10QERkgDa3gBkmMtbM9v7jGgOI35vMQKW6ELWfZA9Kxyuz8Akd9q0oCM
	jzMd+HGnzL40y7vZijBj1P9VOI3YXPtSaHEA85gv9qbz6zUrnzIw6KSuvfsSS4tynSwHKcjJMMn
	eMjP8aTuuABR6RJ3pQ5vywlTMO1KFDtYw5T7vjItjG3Lsc4ktvh54UTZGouF882fQt+a3J+i4JZ
	qznN9rCAxLe48zHvVoZGKNZ54cxqB6Pg/NNjcwN/F/sR5PNtlNfmog1STCJu8gkSstrNP7rzibD
	a/xC4Q44CcdO2jNUYxvVJ6Xc8o4IPWgQ=
X-Received: by 2002:a17:90b:2e8f:b0:39e:6c6a:4b6b with SMTP id 98e67ed59e1d1-3a07324b45fmr783782a91.53.1790073788866;
        Tue, 22 Sep 2026 03:43:08 -0700 (PDT)
X-Received: by 2002:a17:90b:2e8f:b0:39e:6c6a:4b6b with SMTP id 98e67ed59e1d1-3a07324b45fmr783752a91.53.1790073788382;
        Tue, 22 Sep 2026 03:43:08 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f29d8762sm4404015c88.5.2026.09.22.03.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 03:43:08 -0700 (PDT)
From: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Date: Tue, 22 Sep 2026 16:12:52 +0530
Subject: [PATCH v3 2/2] arm64: dts: qcom: purwa-iot-evk: Add eDP display
 overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260922-edp_overlay_for-next-v3-2-2758d46ee174@oss.qualcomm.com>
References: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
In-Reply-To: <20260922-edp_overlay_for-next-v3-0-2758d46ee174@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, vishnu.saini@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790073776; l=7732;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=iguCScBr7c+PEbcCLD4EZyGD7fEzM3bqpPRXLUqwuds=;
 b=IIIccaIswBwkQ2N3BQfJDM3EDzOK6wun5TyUAnVAKdoRnEr4Ia2fkfITfDa7vh5jfod6EPdCa
 L/rzxxatuq8AhoqubfZr6sXrUlQYH18fAj4m8/9KEvLMWJxyo7qN28w
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfX540kufT9ZtzO
 GlfM78tZVvHF5s47JHBYOsijBP/ordjgxvtgryMrQQICxmTdNH5r2Ja4xDpX7UkKy2GfVamyxbW
 3ESyNwT+SKgZJnOvoxF14QZLmrAgm51RwifurNRz+UK6U9KzY9+3lulzczjR/UHb8MSvuBdTSLZ
 HUDAOECvZMWQrKM0rL6XNZNar5Khm7nwih2acfNSoM/DJZ4KQ5kGxG8g/nyC5kke5ghGgxpxL4Q
 h70zB0ACN1WgRTbxkneZFCqL8i8SnEMnjABfEz0vnrvlMTQzyK0MDBLiWFuvk0STReNJpVyFkGx
 gA61nRlZ/EX9EOFHaVcK7gH6M3DlHT9UaSi+b9AIp9CLizeaEzAJqDS88DEMtHsJQFrV40aKWhh
 jzAWO0SU11H3ots67ntALsP0NrOqeQkMP6cCV3fShGEaiyKMNFT8fETNhnezjcUA6EicqT9HMLC
 chpSX3cqX1v6EulbvEw==
X-Authority-Analysis: v=2.4 cv=FdaiV5+6 c=1 sm=1 tr=0 ts=6ab25bbe cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=fX3ZoPcK7U9-Bz4LDg8A:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: 5L_VC-qnlH9WJTyPw_v87H-0wAUIfKeO
X-Proofpoint-GUID: 5L_VC-qnlH9WJTyPw_v87H-0wAUIfKeO
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDE1NCBTYWx0ZWRfXxkpvS1JUiVyn
 MQAx6zRFyO3l4eLiIV5UPxgm7cGDF5Vc15fNt46oPInSeSF5r3LYxzKGvkf2t/f0veaWg7FrH7P
 35CeWUN3Om+n1ypRyanjseFCiIPOCq8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_07,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220154

Purwa IoT EVK variants are available with and without an eDP panel.
When the panel is not connected, DP3 is unused, but the base
DTS still describes the eDP panel and display path.

This causes the eDP-panel driver to probe an unavailable panel, resulting
in AUX probe timeouts and missing display modes. Userspace then attempts
display commits through the eDP connector, causing repeated DPU vblank,
frame-done, and IRQ timeout errors.

Move the DP3 and eDP panel specific nodes into an overlay so the base
DTB describes the configuration without the panel, while the overlay
enables eDP panel for boards with the panel connected.

DT overlays cannot remove properties from a node defined in the base
DTB, so keeping the /delete-property/ of #sound-dai-cells in base DTS
where it takes effect.

Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile               |   3 +
 arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso | 124 ++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 107 --------------------
 3 files changed, 127 insertions(+), 107 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 78518156bc28..00837e145732 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -174,6 +174,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= nord-rrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
+purwa-iot-evk-edp-dtbs	:= purwa-iot-evk.dtb purwa-iot-evk-edp.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-edp.dtb
+
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
new file mode 100644
index 000000000000..0929fc0358eb
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk-edp.dtso
@@ -0,0 +1,124 @@
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
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 5000000>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
+	vreg_edp_3p3: regulator-edp-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_EDP_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VBL9";
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+};
+
+&mdss_dp3 {
+	pinctrl-0 = <&edp0_hpd_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "edp-panel";
+
+			backlight = <&backlight>;
+			power-supply = <&vreg_edp_3p3>;
+
+			port {
+				edp_panel_in: endpoint {
+					remote-endpoint = <&mdss_dp3_out>;
+				};
+			};
+		};
+	};
+};
+
+&mdss_dp3_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+
+	remote-endpoint = <&edp_panel_in>;
+};
+
+&mdss_dp3_phy {
+	vdda-phy-supply = <&vreg_l3j_0p8>;
+	vdda-pll-supply = <&vreg_l2j_1p2>;
+
+	status = "okay";
+};
+
+&pmc8380_3_gpios {
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio4";
+		function = "normal";
+		power-source = <1>;
+		input-disable;
+		output-enable;
+	};
+
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio10";
+		function = "normal";
+	};
+};
+
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
+
+&tlmm {
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index 6fc6fe7c0899..92aaec4ddd3e 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -19,16 +19,6 @@ aliases {
 		serial1 = &uart14;
 	};
 
-	backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pmk8550_pwm 0 5000000>;
-		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
-		power-supply = <&vreg_edp_bl>;
-
-		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
-		pinctrl-names = "default";
-	};
-
 	wcd938x: audio-codec {
 		compatible = "qcom,wcd9385-codec";
 
@@ -205,38 +195,6 @@ pmic_glink_ss2_con_sbu_in: endpoint {
 		};
 	};
 
-	vreg_edp_3p3: regulator-edp-3p3 {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VREG_EDP_3P3";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-
-		gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
-	vreg_edp_bl: regulator-edp-bl {
-		compatible = "regulator-fixed";
-
-		regulator-name = "VBL9";
-		regulator-min-microvolt = <3600000>;
-		regulator-max-microvolt = <3600000>;
-
-		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
-
-		pinctrl-0 = <&edp_bl_reg_en>;
-		pinctrl-names = "default";
-
-		regulator-boot-on;
-	};
-
 	vreg_nvme: regulator-nvme {
 		compatible = "regulator-fixed";
 
@@ -917,40 +875,6 @@ &mdss_dp2_out {
 
 &mdss_dp3 {
 	/delete-property/ #sound-dai-cells;
-
-	pinctrl-0 = <&edp0_hpd_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-
-	aux-bus {
-		panel {
-			compatible = "edp-panel";
-
-			backlight = <&backlight>;
-			power-supply = <&vreg_edp_3p3>;
-
-			port {
-				edp_panel_in: endpoint {
-					remote-endpoint = <&mdss_dp3_out>;
-				};
-			};
-		};
-	};
-};
-
-&mdss_dp3_out {
-	data-lanes = <0 1 2 3>;
-	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
-
-	remote-endpoint = <&edp_panel_in>;
-};
-
-&mdss_dp3_phy {
-	vdda-phy-supply = <&vreg_l3j_0p8>;
-	vdda-pll-supply = <&vreg_l2j_1p2>;
-
-	status = "okay";
 };
 
 &pcie3_port0 {
@@ -1070,19 +994,6 @@ led@2 {
 };
 
 &pmc8380_3_gpios {
-	edp_bl_en: edp-bl-en-state {
-		pins = "gpio4";
-		function = "normal";
-		power-source = <1>;
-		input-disable;
-		output-enable;
-	};
-
-	edp_bl_reg_en: edp-bl-reg-en-state {
-		pins = "gpio10";
-		function = "normal";
-	};
-
 	pm_sde7_aux_3p3_en: pcie-aux-3p3-default-state {
 		pins = "gpio8";
 		function = "normal";
@@ -1111,17 +1022,6 @@ usb0_pwr_1p15_reg_en: usb0-pwr-1p15-reg-en-state {
 	};
 };
 
-&pmk8550_gpios {
-	edp_bl_pwm: edp-bl-pwm-state {
-		pins = "gpio5";
-		function = "func3";
-	};
-};
-
-&pmk8550_pwm {
-	status = "okay";
-};
-
 &sdhc_2 {
 	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
 
@@ -1268,13 +1168,6 @@ right_tweeter: speaker@0,1 {
 };
 
 &tlmm {
-	edp_reg_en: edp-reg-en-state {
-		pins = "gpio70";
-		function = "gpio";
-		drive-strength = <16>;
-		bias-disable;
-	};
-
 	eusb3_reset_n: eusb3-reset-n-state {
 		pins = "gpio6";
 		function = "gpio";

-- 
2.55.0

