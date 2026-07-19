Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53373B995D
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 18:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784484329; cv=none; b=k+3rJizrlWFKRuuwY03vDLqfgmF7lRUbW8hKtzbZrKQ6Thpgtt0QY7p96J4gAQgbINAboctYScf4LCa0TToqyJTnd2ZEakmX1hoy4ou4GdHSQqd6nZ+wmN7koahcMJeVr5uKbvXpPfUgDO7/eA8pBuqNsoGrCz8tt5/uMZw2qvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784484329; c=relaxed/simple;
	bh=FbUP9RpKy+hVGEod6dgcTzGsDknjPWOFMBt0/ou/Jws=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qIaPdQGeSN14pov5caDiffjajqY2Z33HC9jz8zQTBVpkxlEm2Z77XWNYblaFr0Vd0i4rh317ZJxNOQOfy+SskiaorWtNGSxxl5oMNEaiknTx3LDpPApfookLO6ATgMVgmducBEAd89JhUm8tJ/bFX+6btqD/lxgeNw7gb0kCRhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mic01XrC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OYboZ7OA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mic01XrC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OYboZ7OA"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66JHIMfM4184884
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 18:05:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3MGRVhZIklzafUvcG6q46/Q1X/7pmNzIBXubFWz5+y8=; b=mic01XrCajcdJIXc
	3G3xNNU6qGmfwg/P0wasUqO34fNJGWEPStMoWPcrT+tpHfaPrq1F6Kv2Se7Jc0Lm
	mtcBy3qNBqmUN2RkerU5lKq05dA4iW473+y4mFYGH1uOpiz27pek/n/KmfEgJjSU
	nSVdYQEoz7u6Q7ugj49WtSC/PDNMj5vVAKtHw/Zshi6WHRXZgoSQkgROw0Ns0j+O
	gyz7+aDrrUMQcmF8cBfk20nb/KTjYwNZs75cHwTeSSGm5Aj3TmqOZDzWfbvZAC2X
	SL0zr8bSGnEvVp7sNn7c9WtMLlyX23EBagWh6r4pGDyCoCVdSjcABRt+fUK6/UUk
	Jb96sw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fgd04t6ej-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 18:05:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc7ea29141so43275955ad.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Jul 2026 11:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784484321; x=1785089121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MGRVhZIklzafUvcG6q46/Q1X/7pmNzIBXubFWz5+y8=;
        b=OYboZ7OAkehmLIc53bAiCQ5i/KCKyaatkur4j0czPcIFucMQqnrpja4b0JkXKyu8NO
         upYKTY3yKd9Q4HXc3ImJRCVRLDr6mM9Rrp/GPSujDx4njhyQLbbOB2/Zz7rQ5/ss4Pzj
         2uB6tg1mqQTujdwCFvchB+skMaAw4JlGQXmaYgCndboivPYCTPg3ZTep8mHc5O2Q4IwR
         5wi8pjnOEd09BSilr2Cg9ogSGD5OX+4KiohZGH0Jh5YDXm7W7FUbMYS2bFhyB36D0oi9
         pBC7uv2ie1ATp23rwDHpvrb4Po4mqTS7Y4tCUMiKkC9BDeg3ZxCqM3XkgYvx9pbucJ3b
         lhww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784484321; x=1785089121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3MGRVhZIklzafUvcG6q46/Q1X/7pmNzIBXubFWz5+y8=;
        b=b+qetUsvsT5Zh/ZLzj7mecUeG8E3i1vf0IQsXbg69iJLfzeuxZWA1AhUiK45hzKDR1
         yvPTGvb1SMIzBA6SBrnHsTpDh/Hj4bN2p27I/q1YxQZH9oJZbS4UZ2yYoWO9IF4Lrbf9
         rhhyit5X1SPruULV6RN3pye0/EQdE7eTImPeBChgaNbKCUFGBh1HhRHxrp+88p4JUITo
         rNhE9O7+W/8Eq6t4KeqTOJT953Ewk3Jpx/5DKuSP20t0HYVW2DH4NlJwpvYtpgRsWc9Y
         7P3WBZPLO/IkeapsH/CO0zNLSOPTWI5lBT6JWZIXa/zPPj6YAtc1dQsSLQWDdv8jdvl7
         /vJA==
X-Gm-Message-State: AOJu0YwKZDPWDFmpqfKjZFwUH3elxx7iCrigwH3lcOZm6605qEnCSKxB
	goZkFixFlvS1Ucgy7lgErJhIiP5LADOXadFNuZwxJmgo5QRdm3WAwj9J6cORmchuu0z+7opbyxw
	RVgZFgL2+YE2tfWN9Sl84354EgFU5x+D2DQhLixJWljdfeSIc03Q1vqAPKif9igcPgwBv
X-Gm-Gg: AfdE7cnx7nbkPrVA11NCghDGOKILPzZaRno6BYqZUlHiZ7Cx1czfp1+wl5jhUdGvWN+
	+CVusocBFanCdQHAVwntxyi1EIBUeCeKkLGrBHfMxtjihV9cWTPv91+dYsvTDw0gfufs3FbXouy
	TWUu3rfidXqidceqcImMh1dKihzES+7DmW8SmtjSiCE1YRs/XDz+FNOY6N+B5KyixkfMRM57oWi
	QD9rpVJIk6OEmXTvPaFHyPOgOhpr2WDGVBS2FbpkSfO5x2forR1PDZtW8by7p7Q2nJ+8+eetlPE
	TE7vHPViAVsqRxeeip9NQjglkYZWap+FwEt5udT42RqtJljQBGK7mUZE48ys1ehHK8z76U7J/F8
	wjk1bIQbA1/2lEN8ijUQvRa27JPYgmnNNriV9XKTHR1DobnHaKsnDq8WgXJUysw/MpUK8KnJFYk
	eJFtkL+tiR+7npXlkb4M5P
X-Received: by 2002:a17:90b:6cd:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-38e4b4e94eemr8661324a91.4.1784484321448;
        Sun, 19 Jul 2026 11:05:21 -0700 (PDT)
X-Received: by 2002:a17:90b:6cd:b0:383:5a16:bd67 with SMTP id 98e67ed59e1d1-38e4b4e94eemr8661300a91.4.1784484321015;
        Sun, 19 Jul 2026 11:05:21 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b1f3sm28037681eec.26.2026.07.19.11.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 11:05:20 -0700 (PDT)
From: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
Date: Sun, 19 Jul 2026 23:35:07 +0530
Subject: [PATCH 2/3] arm64: dts: qcom: monaco-evk: Add LVDS display overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-lvds-support-v1-2-1f1aca3213ba@oss.qualcomm.com>
References: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
In-Reply-To: <20260719-lvds-support-v1-0-1f1aca3213ba@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784484309; l=4674;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=FbUP9RpKy+hVGEod6dgcTzGsDknjPWOFMBt0/ou/Jws=;
 b=QEueO4S/Zp2M9nuXxS4n8Vj4x2563rdWNZTwK4KEgDrFtTBjvwPYBixcObLdpo/T4qegEs3Ya
 fK2Z7nYkm/VASUDCm/bjIQijFUMqAstVf0ReJyjbq0fT/ebiPcylnk2
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Authority-Analysis: v=2.4 cv=POs/P/qC c=1 sm=1 tr=0 ts=6a5d11e2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=SBM1Cy03NT4Jck5E_iAA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE5MDIwMSBTYWx0ZWRfX85pw3/rDLVhy
 r1O1DknccBs3HzL4yhBKgYQNm8KAn0zaiVDIpULJtp0SN9w08LHSqgIMDPBo5hK+nvVFnBc+cK8
 DX2v7yF3dMWUYGlPpctRE/5o5f8SFCTnXGIUWjeE81AWaa++WYmKBAZMhb+COzmXvSB9swZ2O99
 qgI9bwQca4T5b2Tu6xxFP/fh2KwrOWFdmaO/DdAjQLdvRIKyN1ijlJGkZBPLQojRc7+e6GXTLX/
 NrcfMd1kxKQ9xNOs7Ui8Owtjok2b+++SXYB3p2BzWNmHJb3cp4PPNkoy/PCniqdlFsTl8YMSHsF
 uJ5KzXlYte5hWDlmXfG3mtHfJl0+oBdvAzttGHLI7PPZIbn3Ky/8UN4k9nxDkBFgse3+boFfYWb
 C74Zit9jPWrx8uZmc/NmKd8oL+x84Hk7DK30g7bLSBG/twVml/9W1nAVqP3/6LhLxbVk/I1xJz1
 7limhinyKZiakqiUKpA==
X-Proofpoint-ORIG-GUID: l2YUoVAP_AgwAsYDSIX8kI7L5mAnQnrR
X-Proofpoint-GUID: l2YUoVAP_AgwAsYDSIX8kI7L5mAnQnrR
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE5MDIwMSBTYWx0ZWRfX4YI98PDMOlao
 KXUqJGSEgvjn4RmyCw+WJQP58EiTHEvZ6fyQAgjP/s0QBUtVHVNBmAKtcs0P6MIZhYEf9rgg3es
 Usu1MjOYFl9FGUgApV7dd6RX6m5ggXo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-19_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607190201

The Monaco EVK IFP mezzanine supports LVDS display output using the
Lontium LT9211C DSI-to-LVDS bridge. The bridge is connected to the
DSI0 output and drives a dual-channel 1920x1080 LVDS panel in
VESA-24 mapping.

Add a DTBO overlay, monaco-evk-lvds-boe,dv215fhm-r01.dtso, that wires up
the LT9211C bridge on I2C8 (address 0x2d) with reset on GPIO66, a
panel-lvds node describing the 476x268mm 1080p panel timing, and an LCD
display bias regulator supplied through the GPIO expander. DSI power is
provided by vreg_l5a with PHY supply from vreg_l4a.

The overlay is built as a composite DTB combining the base
monaco-evk.dtb, the IFP mezzanine overlay, and this LVDS overlay.

Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   4 +
 .../dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso | 131 +++++++++++++++++++++
 2 files changed, 135 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 2c4e7a891717..85ee28d8f109 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -73,6 +73,10 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
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
index 000000000000..d62f6baeca85
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-lvds-boe,dv215fhm-r01.dtso
@@ -0,0 +1,131 @@
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
+	model = "Qualcomm Technologies, Inc. Monaco-EVK Mezzanine Lvds";
+
+	panel_lvds: panel-lvds {
+		compatible = "boe,dv215fhm-r01", "panel-lvds";
+		data-mapping = "vesa-24";
+		width-mm = <476>;
+		height-mm = <268>;
+		power-supply = <&lcd_disp_bias>;
+
+		status = "okay";
+
+		panel-timing {
+			clock-frequency = <148500000>;
+			hactive = <1920>;
+			vactive = <1080>;
+			hfront-porch = <88>;
+			hback-porch = <148>;
+			hsync-len = <44>;
+			vfront-porch = <4>;
+			vback-porch = <36>;
+			vsync-len = <5>;
+			de-active = <1>;
+		};
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				dual-lvds-odd-pixels;
+				panel_in_lvds_odd: endpoint {
+					remote-endpoint = <&lt9211c_out_odd>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				dual-lvds-even-pixels;
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
+		status = "okay";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				lt9211c_in: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+				lt9211c_out_odd: endpoint {
+					remote-endpoint = <&panel_in_lvds_odd>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				lt9211c_out_even: endpoint {
+					remote-endpoint = <&panel_in_lvds_even>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
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
+	status = "okay";
+};
+

-- 
2.34.1

