Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794834340;
	b=1L8h+L0lfilMJboz3O9wkwMi1Jjy8Hxl7D6/z+e+FlmPN99qDchV6gsLEQGSMfNPWaKe
	 H+AIvjKYhH1q4ZiphocW19VXNa2ft7Tc5XJgYfhe1CNisSQzGmMErJHTAyO46HbdGQIGv
	 qvd8/kqYku8dbabrjcDltQCX4ML7Ux/C6QNydR6+1ezcD350IyxseJ0edkruwgj5uI9p+
	 atfiVqejefJIfgBWqDYg/uUQEOO8RoxIlwHITbIfYNwT7/nD4Zz/5Ev7HOw2QOSiIVLBb
	 Dqg3RdB+vMxy97dBswHvpqq9PBnltpzq5OooZAjakEFxa/6FWK5UkVMeIBnU90kLeVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794834340;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
	b=2QkqM5OIBqlH5tXpXEG+6c0SIQKqpHcN/x7k7KAAOJwVo5lSL61ouXxFUc6gE5ARCGcs
	 m/CAZxSit/L1byZ3b7vpg4Do1zthsYXH2oHUTt9iDBT8RUfu4/O352resdirZv4LXP59P
	 9A0/VBBlIi7RM1Q9EQBHGUVrqVHXc3mOx9Vf1RRy0Z5B5awRF+gI9vPT6xQDFphzD8346
	 ovqSrY8fbHSLkteNxdzPXSpYK3tkKaYkjNRVSpBwn9RYCgvWCtRoZ1topvu77/r8AVTL1
	 4DqZNVgCe8iChhDaADNhOeLUo0xeMfNnnQdVnWCK7mtxYCE1U7S3nv84sd1kjmuIuXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nH+QS9CB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hr/rND0l";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27EE9606A334
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:05:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27EE9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nH+QS9CB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hr/rND0l
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC0nnD1101748
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:05:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ibqxhW40RmB
	jwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=; b=nH+QS9CBHsdrsJJ+gi0Qnp2KHf4
	Owqqe+SFBP6d8+A//QIKXyztLl3u7a0qP5xkx28cRssNhwy3DiiXpbjxVi+ul5Fi
	NEGMFF2E+ACMQj3EkxbjjGZU9/G3mJosAYIIY5upnzl5ObCq/DQARGe1wRgAZuNu
	mL3i5AbXdaGuxj5eiVeEAFgxDkfVA89WqTku/Jeb4qHAI3QuE8dPtrFEmm2h43aK
	t4qqnGZIalkmq/CRLfarqAQXGIhoigXsLbzXag9SU6DQR6kHMQ3ey8qQ/c3tCIh5
	2/tTRJlB4NOaUc9AKbo1y+360/qLJU2a4EVSNzS5JxK3Ol5ziIXCWPoj3Dg==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0003gj7f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:05:37 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4b597558c4cso3857761b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 05:05:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794834337; x=1795439137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=hr/rND0l5IIDJkqQnNdykgZ1n2Vf6BtpVxLnOjaaqr0CQvX/Lub7B54MrRQ8eKbZkZ
         1lyfGeyPjpqM/6J3XgEw96eZOgdkrGmGHVZKChhoxYOdi3PYyJEae4ROqULvGLs1/sPp
         MIVKY+c/uHNN4bF5MgzOjCLYbJWMWgSJc0s0C0UX1jT6AGN4imzZ6pnqld4eI59U+hVT
         TF7k0aGB5QogmOPzK1Yt/CGu1dQOIc3y4H05prA8Y73WYykctLhxZ+m7MH++fa3PDh9g
         SGz3W42VkAe1+FjrAkxWQnMr2Nc9S6vXEeAVULjIj85RhFjk1Uf5YHxoGvDdNIizeyQw
         dIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794834337; x=1795439137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=mtVoQ/GuGRr2+Oc8garb27aQFClOvCQ+sEbwaDCbyjKQZHbE6vaVnOT5aygr9MlijH
         lyeXifQyi1ev1h7/+PM4NrSxICX1+AB889VwIcedzHOK00zG6Qn9OH9mtJFNBReOnYG4
         Cvtl1oWIrnP2E6msfBCJogm+FJm16HUSktcGuO1OtnjoAS1OCjtsHEfUpluJl4xc+Lm7
         WMGIvqwvwJUfQ/9xCye+ZCfvuWtBZxNn9i+3OYE3Vc0Yxn897vsxBkMbcn/JxHpBcNno
         DITb9nZZ1W5R+Vs3Y6DrboAkA/XkUpFeSLJ691h12My2eZEQSFol0Ee1PBFf2/jZnXOC
         HE7g==
X-Forwarded-Encrypted: i=1; AL+hErHsJNldHueYs762MrwaLV2cV3pu4vknwwybW0hPKf/Neu5Fzf5g/xEk6ObTQzA2xEp1gJOOVNFdjVv7j4v2@vger.kernel.org
X-Gm-Message-State: APuU4Z8+VFe7ZleMNVD2O6UwHPC60a/GcQoQcmSLY6gZlJCBhd9b+tmP
	evT0xmGfGXZ89hlvqNmOxQ1XnD4dqkjzEkmqBAQ/JL1llF3pbQt5X73M39tpuIrD1GVgkIcAOEU
	vI2MBwn3Nry0m/M1f80sbmKUFm0gFjTY7VqKVoa76SjBLpzRkz1yOYofMamrAoN8G2Uln
X-Gm-Gg: AYBFou1Em7tcjIR0JCCSNB4uov/Qmo+7zotgn+Km0nW+tNilCd6gemqN25fDANM1B4n
	LpP73hoCi3GaJqe0YeTek4XmO/1zd0fFQVw1rX06oqJCNzwAYcse5JndkFTBAAJxigLkv8UKjJZ
	jzxVVOeACWs2LpZGWGvFtTcsJyXyoxgGelSJp4V1tdVzDMejZnFa3sCDTAotjLPgIGiERSLRoG/
	2kYvRhat1bZf4aQ6dy03U9Eo1xpAJb0paaamOeLWnrwqgd9uCatjR3emICb2B11uBqNPpkdr2Ve
	j6zHnIN9mNeVqWhKLowfK/dzA28ga69VoixoZbdDA7lHtONJa3hhXW6ngkzvE1DScnfHW4s6Oer
	IGnCtQd7FU8t0tlw6hxrAWeiT0hBQR02Sk5nFtJDTDUkgrVJLRTtQnSByl5btIkuzjz2PuH9jeL
	Jp
X-Received: by 2002:a05:6808:4f0f:b0:4f8:716d:793e with SMTP id 5614622812f47-56e64dfe401mr9919952b6e.46.1794834337075;
        Mon, 16 Nov 2026 05:05:37 -0800 (PST)
X-Received: by 2002:a05:6808:4f0f:b0:4f8:716d:793e with SMTP id 5614622812f47-56e64dfe401mr9919909b6e.46.1794834336612;
        Mon, 16 Nov 2026 05:05:36 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-56e6fc3eaf6sm9895641b6e.5.2026.11.16.05.05.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:05:36 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 18:35:20 +0530
Message-ID: <20261116130520.1763088-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
References: <20261116130520.1763088-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oxJdZtH2117mfblBXS72RgI0rbaRFJzH
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfXzpI8txiM51P1
 lif7EjdZy1gDb+ZyRU3MY3+Ll1t1AREeUXxNw2CWVAAYJ90clwvm+X49je8kzXJwtjl5yvEkYE7
 gP+Cpg3ZpdtiJcmsoCssweol0PxrvxE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA1MSBTYWx0ZWRfXyi+mXUBL8Nxv
 mJQc0ZG8ndPrpr3g1iU1R1PJQDYF9b3EZ1QAbP1UapPILyJf/3FTGpp4cB92JLMvR2wKF9LcVOk
 me/8Tq1Gu8r7O+pK2z9Fd2pEnfQFvHA/s70g6vgcGIhhGCk3iXQ8V9iu9vXHdMzENToqXtNiFH9
 1qv+U1uuxV65TVwCApFuSzpa5ZT4FjmaVw7lGx01SR47TM8iymI2I7MJVpf1YnXo/8/ZSGavxb9
 KZjDhz2RY/0ZljRGdPA9PGteRkcipR/sVl0HQoElavoQJueM1B5/HgsHBMroeYSsJQWpAt7bmhk
 ykuyDFeJLB91irHT8e+Sd0qh9831Xkq46Xv4faMlq2w66fjpRNb9B+qFT4zPnKwpmQAuICQSZ52
 sU878Sc07ed3XVJoMuNfeEPG4CDGyHJB1icrJ9N6tgKYIE6foKFJyeA3rY+3Ct7LzqCcK3TgZa4
 BrQWdJ1v+JfTCiy+LgQ==
X-Authority-Analysis: v=2.4 cv=Z4N5j3RA c=1 sm=1 tr=0 ts=6afaffa1 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=1-dFLm9VQVe0kl0r4fgA:9 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-ORIG-GUID: oxJdZtH2117mfblBXS72RgI0rbaRFJzH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611160051

From: Akash Kumar <akakum@qti.qualcomm.com>

Add the CYPD6129 UCSI PD controller (typec@40) on i2c5 with its two
USB-C connectors, and route their HS/SS endpoints to usb_1/usb_2's
dwc3 controllers and the USB QMP PHY. The PD controller, its GPIO86
interrupt line, and the PM8150 GPIO10 VBUS-enable control are on the
SoC/SoM card, so they are added to talos-lyra-evk-som.dtsi.

connector@1 additionally routes its SBU lines through a GPIO-controlled
SBU mux (onnn,fsusb43l10x) selected by expander0, since connector@1's
physical Type-C port carries SuperSpeed and SBU while connector@0's
port is USB-HS-only by hardware design. The SBU mux and its GPIO
expanders live on the carrier board, so they are added to
talos-lyra-evk.dts along with the TLMM GPIO64 VBUS boost enable fixed
regulator that supplies the USB daughter-card connector's VBUS.

Switch usb_1/usb_2 to dr_mode = "otg" with usb-role-switch so role
switching is driven by the PD controller, and add the supporting
USB1_VBUS regulator and pinctrl entries needed by this routing.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 2 files changed, 152 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index 7d9a08471906..ed3a369dac02 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -31,6 +31,16 @@ xo_board_clk: xo-board-clk {
 			#clock-cells = <0>;
 		};
 	};
+
+	regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB1_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb1_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -179,6 +189,87 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs615/a612_zap.mbn";
 };
 
+&i2c5 {
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 86 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ccg_typec_con1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ccg_typec_con1_sbu: endpoint {
+						remote-endpoint = <&sbu_mux_in>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm8150_gpios {
+	usb1_en: usb1-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -229,6 +320,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio86";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -250,6 +350,14 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
@@ -258,6 +366,15 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+/* HS only */
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_0_hs>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
@@ -279,3 +396,7 @@ &usb_qmpphy_2 {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ccg_typec_con1_ss>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..020ce7db4241 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -22,6 +23,30 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	regulator-vbus-boost-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_vbus_boost_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vbus_boost_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sbu-mux {
+		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
+		select-gpios = <&expander0 12 GPIO_ACTIVE_LOW>;
+		orientation-switch;
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&ccg_typec_con1_sbu>;
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -100,16 +125,11 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 		function = "dp_hot";
 		bias-disable;
 	};
-};
 
-&usb_1 {
-	dr_mode = "peripheral";
-
-	status = "okay";
-};
-
-&usb_2 {
-	dr_mode = "host";
-
-	status = "okay";
+	vbus_boost_en: vbus-boost-en-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
-- 
2.43.0

