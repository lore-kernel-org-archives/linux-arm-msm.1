Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8490635E95A
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789136485; cv=none; b=Ef5DVrIaxyLso0lIiAnrs8U7IqTDwrG+ZHmDN5mXm62sjq0uBSq8xyjoovLiaAXXhHsbbDkpC23igM4KbQXuX3mEhPkYwaLypu5A7n2dncDUg9k5UWmn8iGhEtJG3dXp6GBqxWBF+Jn86GfONlpG/w9y6FHm2/ltJw3KDu5Lc18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789136485; c=relaxed/simple;
	bh=Y/hvlFXG9GLs1AM2S6LZjNChMvP7T7olaEoMqfTajbU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LNe8sqOur4A3zrNtVt4b9qJYW0XZHd8D66R81vYP9n1Lv8OnqNWWzVGXLEQh3xMfE71H22Mr+IlBr/yJFHfruwwRYwUMKyzzKajpL7BvgqjgxpYDSEK3QXyiGK6SYqE+fNyHO4TkCkIRBM0k20PmGX7SOksOSCuUnEQJ4C2gDZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oX+seEQW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZMZLE3L8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oX+seEQW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZMZLE3L8"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BCjQDu4041145
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R4glxcAwmtc
	nwT/5Sgeo+cgLNqx5F0q3TY8ltfG2568=; b=oX+seEQWQRxmDCM7Y/7Sf4HIMDY
	CmXsdPB1wfIq6RdCO2Zw6Gpy+CT+sG192BUKGrrUjX9oPYfs7ILQz1QKRlhT9jM0
	C9oXBM2gYjf3FxBvlhJEreAP0sEydyvQKkGxTgUbkOOK9Bvh3tMjbMbeUqEIiN9g
	vJx073zwL79zylFnCrddJEJaemsQjA0Hiu9qO0SRjlAPhEN3DQYH6DCLeTskPO95
	faLRjMsSpXBOFutzjxUw5F6FWXtxPyMgFoRyqoJAU/3q7HmR4HO554wThy6XNmd1
	mwT6xRj+TAUgKG59ETv9WBXqF9LxCkDYqMKzQDebJzW8kMYzrngyuJwXXSg==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gm1k2ca5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 14:21:22 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-837aaa9a3f6so13338427b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 07:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789136482; x=1789741282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4glxcAwmtcnwT/5Sgeo+cgLNqx5F0q3TY8ltfG2568=;
        b=ZMZLE3L8OcgFyGmYuDKRsiOG9sZSTzEM4Y+du7wGj1HRGOjD55dMSU/R5mbb69b4TV
         H4yDl2iMmnWjPrrrm9ekzDOtiY0xG6UnshzG0/zDAt3KMJP97vFvuiCQZ8lmXk4LEF5I
         K9xoXDXETQXX69fehXfvSQObQTII2qpNHiAgjSAeC3jeUc9Rr06Oew2UFj6JXnNBaIW1
         mzb0g50j7383+NOyRmfMTd7fEU/1GxcbLSPUni5ASI6ZGK9YshS5dIQMr2W6hzZ0FzQL
         u1MWkn+ItC2qMdEt4DQYhMh5E8SLCq3eLGwjRn0QePMJ8GXTYyCz8CjMIRgTT94kRRPa
         IOrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789136482; x=1789741282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R4glxcAwmtcnwT/5Sgeo+cgLNqx5F0q3TY8ltfG2568=;
        b=VjA/IR/dW+NOCA4LEhT3EEwbkbbJLya5DCS1tVaDJDCHeQLpL7iJ5A2oxNabYPNQZe
         Gvvh0OLRJPzAo8q0KoX754G9XBmiSV7TkPJXonVqoRDY95OKrjMjJm5CsMZZiovHe/zI
         FSvcpSPrhChySneGMPEtmSHeslRLmzXJijCDlDjw5B/47J98S2OEezqo3VPLP0gidLST
         c3Mnown34rTAnrOVgiAK3pi8OkaUT6+bcaYT9Ok0DgeOaies1bMmm+Yy9ma1XfV4U6AF
         HzLO8Ma/dp2p6ecBdWtUv3DBS8ORxVCu7Z/YC1pos2f5i1PZ6lF7eOGOvNzztYjtuuHj
         rrEQ==
X-Forwarded-Encrypted: i=1; AKwUvBz4iezyH8n4NaPs12/3DPot/1iP/+VxRn30osZGF/K7hD3DO/09pno8NtbxIRaUrUQiCQ2HJKK6huCJD4FX@vger.kernel.org
X-Gm-Message-State: AFuF++nW+S+VFEdRXaNHXFJfwGD1QTIvmob94QkVOZ1bU4S5bqsMk2LE
	Mw1AQSAjcp3mte2RsThdoqusUisNQgeO4lzqtIhPhYTGUkcJBxEPsPr8nskHQRHW5ObZhX8OeWV
	mmoc39FXX9uirBvUCJ6B3gv0dsd9Xey2i5978va3lp80QI7MDg/DE3g4uEyG0nsaraqA0
X-Gm-Gg: AYBFou2LyvcEdMmYq2sev9tDV5vONGS7GQ9fSsq1OusEHl1cJQbq8TfpsyhZipZEpFy
	8hhkw7RaNkvYgbY1w1pKrrjeWOB8e6jz8RNe+vNR9PYoK582NWO/IPVYwU/a2AWxZm1GjnSzwTX
	vqMvmxBc0T2KetzsKdt4AaUjEKkzktTOV6MtNsRIJtt4Rv0eEy2pS8gOQs4hGOM8woUfc1r1krl
	lCAjpeW7MWrwD30y5qKGET5jBsF/tfGdfa0reANX81xpPeGiA/c7XL+wycE2E3SQdKRBC5fGwcC
	2MZ6klK5k5jUmcbnQYjR7xbSbi2GUOQ4+tgY967IHPr5YeEfgrKczv2h8ThhD5rUPU+l6JUPSIA
	xRz7LsKCZCinHkiUEQkbfPfFQF85M/p4rrlm8mz1cnyTh6UB6WCn9m+tnLz54
X-Received: by 2002:a05:690c:4b83:b0:81e:b78d:688b with SMTP id 00721157ae682-88201e57c63mr24323887b3.12.1789136481391;
        Fri, 11 Sep 2026 07:21:21 -0700 (PDT)
X-Received: by 2002:a05:690c:4b83:b0:81e:b78d:688b with SMTP id 00721157ae682-88201e57c63mr24323737b3.12.1789136480825;
        Fri, 11 Sep 2026 07:21:20 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-884895001fasm10483237b3.45.2026.09.11.07.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:21:19 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 4/5] arm64: dts: qcom: nord-rrd: Enable USB ports
Date: Fri, 11 Sep 2026 22:20:39 +0800
Message-ID: <20260911142040.100263-5-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
References: <20260911142040.100263-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=cM11IVeN c=1 sm=1 tr=0 ts=6aa40e62 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=kAg6WJeHQ7d9V-TtBpYA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-GUID: IYcUo_Yv8zEB5kqtk4uzEnrmez4MW8to
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfXxbXqKIJLAQPU
 xXdF5+pmRGzGMigGg0zpVUIvzffPrAXqLC6iIgtVbkUC4okoxmRWJUlo9KBpCEeFQkAEb6AP67B
 LdHe1cDenat9QnZYnPX89pu5ozISZqo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIwMSBTYWx0ZWRfX51X0BIFgE5pK
 MwJFOXyzRUYpdKHG5o4+AzOUqttUMLJaFc6VYkkFvnZCBmXP20SIrA/SHXJRN7vHbNPb9rX5U/C
 eWXaZt4VRbkckMerZBTe3R+CCjX2JUYQTsyK/rBtpSKjorSUbq2265NuvuPiJBIwFGFk0AjAKCT
 DEIdTnFF/z/MW9SXiWAXeGiTGjrO9EAbAd38MP2onMgnjC8OPEITAmaHeUKLX73VciD4KpSpThn
 gIvP/pv1DkKdHk03LUA7uJGhsMxrq38wKedWe74Ksw+o6fxOdbSDf6zflBwVqguAuTtrtdoS3R5
 /NMXbfCyYJ8bUHU8ikOXWlujn/y1o8MF2FAag6g4yRU/PhEn5ndW4/xHIfGyVYXUrIWfxovODjy
 dM0fi4dnNOMv31yek2iBZ4yLDXX59KFaNPqMxpc4S1tV/IuUb5fy0n1GAX2kyFM403/r6WNQeT+
 opu5zkJ9B+w7sz0rDJg==
X-Proofpoint-ORIG-GUID: IYcUo_Yv8zEB5kqtk4uzEnrmez4MW8to
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_04,2026-09-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110201

Describe the RRD USB topology. Enable i2c9 and add the two NXP PTN3222
eUSB2 repeaters for USB_0 and USB_1, supplied from vreg_l3l_1p8 and a new
fixed 3.3 V pre-regulator, and reset through pmau0102_i GPIOs 9 and 10.

Add the onsemi FUSB15201 Type-C controller at 0x50 with its interrupt and
pinctrl state on pmau0102_i gpio8. Unlike RIDE, only port A of
the controller is wired on this board, to USB_0, so a single
usb-c-connector is described and port B is left out. USB_0 is configured
for OTG with usb-role-switch and its HS and SS endpoints are linked to
the dwc3 HS endpoint and the QMP combo PHY SS output.

USB_1 is a fixed host port feeding an on-board Genesys Logic GL3590 USB
3.1 hub. Add the HS and SS hub pair as children of USB_1, linked with
peer-hub, with the HS half reset via TLMM GPIO 170 and the SS half
additionally supplied by a fixed 1.2 V rail.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/nord-rrd.dts | 169 ++++++++++++++++++++++++++
 1 file changed, 169 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/nord-rrd.dts b/arch/arm64/boot/dts/qcom/nord-rrd.dts
index c547963371b4..c2f870ac4234 100644
--- a/arch/arm64/boot/dts/qcom/nord-rrd.dts
+++ b/arch/arm64/boot/dts/qcom/nord-rrd.dts
@@ -6,6 +6,7 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "nord-embedded.dtsi"
@@ -53,6 +54,22 @@ bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
 			clock-div = <2>;
 		};
 	};
+
+	vreg_per_3p3: regulator-per-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_per_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	vreg_hub_1p2: regulator-hub-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_hub_1p2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -377,6 +394,86 @@ rtc@32 {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	usb0_repeater: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 9 GPIO_ACTIVE_LOW>;
+	};
+
+	usb1_repeater: redriver@4f {
+		compatible = "nxp,ptn3222";
+		reg = <0x4f>;
+		#phy-cells = <0>;
+		vdd1v8-supply = <&vreg_l3l_1p8>;
+		vdd3v3-supply = <&vreg_per_3p3>;
+		reset-gpios = <&pmau0102_i_gpios 10 GPIO_ACTIVE_LOW>;
+	};
+
+	typec@50 {
+		compatible = "onnn,fusb15201";
+		reg = <0x50>;
+		interrupts-extended = <&pmau0102_i_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&usb_pd_int_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/*
+		 * Only port A of the controller is wired up on this board, to
+		 * USB_0. Port B is left unconnected.
+		 */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C0";
+			power-role = "dual";
+			data-role = "dual";
+			try-power-role = "sink";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					usb_0_con_hs: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					usb_0_con_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_usb_ss_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pmau0102_i_gpios {
+	usb_pd_int_default: usb-pd-int-state {
+		pins = "gpio8";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/nord/qupv3fw.elf";
 
@@ -459,3 +556,75 @@ &ufs_mem_phy {
 
 	status = "okay";
 };
+
+&usb_0 {
+	dr_mode = "otg";
+	usb-role-switch;
+
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&usb_0_con_hs>;
+};
+
+&usb_0_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb0_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy_usb_ss_out {
+	remote-endpoint = <&usb_0_con_ss>;
+};
+
+&usb_1 {
+	dr_mode = "host";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	hub_hs: hub@1 {
+		compatible = "usb5e3,610";
+		reg = <1>;
+		reset-gpios = <&tlmm 170 GPIO_ACTIVE_LOW>;
+		vdd-supply = <&vreg_per_3p3>;
+		peer-hub = <&hub_ss>;
+	};
+
+	hub_ss: hub@2 {
+		compatible = "usb5e3,625";
+		reg = <2>;
+		vdd-supply = <&vreg_per_3p3>;
+		vdd12-supply = <&vreg_hub_1p2>;
+		peer-hub = <&hub_hs>;
+	};
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1h_0p9>;
+	vdda12-supply = <&vreg_l2h_1p2>;
+
+	phys = <&usb1_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vreg_l2k_0p9>;
+	vdda-pll-supply = <&vreg_l2h_1p2>;
+
+	status = "okay";
+};
-- 
2.43.0

