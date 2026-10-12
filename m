Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E4D347BD9
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791810928; cv=none; b=RIip1xcNRGnCff2lGgVMD8m1cfhjTEgPJ2i1wm+14zgSfvBSBLld6makYU9EY9G+gqkWTyNup5O093YitnbWJa2iEX+yZZbe6qS9vqYUAvh/YQGC+D18BRpCeioZ77t/u9UV0keM8vW4sJ81IbkJRQwO0xazEQidNa6QAGcO9cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791810928; c=relaxed/simple;
	bh=su74ccP+uXxdAjl3dhGSD9/wQo+gkwv7Rh3GXHEmMXg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LM18oeNisGzxaW40qRUc71tcH1MviLabR3RKFSoIZj8EE5Zlb4Z0nB/qLEtZuPPz5erhD5J+qmvFueHloUsGTZ84wodM+q8AL2AySJs+kmV3C8eoghB/sP3S9XfDF2XCj9Ujc4zCa8EcBlBPSsV5nAJTaZoRJGggGF8Qfceu9a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hmYB1NDb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eTnN4Ble; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hmYB1NDb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eTnN4Ble"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC09if3292338
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=QRAYqG0i66uB7ffqoKD10fYJ6TRuxmjLOOA
	z85hufJo=; b=hmYB1NDbTgBs7lfeyxvzeQE1WC+2AeMurFQ/O4CZZ9acByW3aa6
	9ieuQyIySJqsokDaZoTte/oYcoHRjIjnDknWjWP4jZRpq6S07dpygJ8NxHdz7TrL
	awwGi37lEh/GGK8BqP7iGMI1T9Kys305jpz9QL66ZxeokT00rzBwYqf5MVx6YjpM
	imZz/YX8TR9yTyzufzVd5lYF/Ck//6jHcd74g3j+2DUkAwv+m+fFecVJ1YmqzfWv
	t036rg/lSM26lvquoCcWsgcLFfBPYhR0rWcu2hcxdcU5IJtB8QRqqY862QcS88Tb
	CeE+kJ/jP8/WrZYxX/Et21Xmu5ekC3YIN6w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3hf7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 13:15:25 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3515266f6eeso3589332eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791810925; x=1792415725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QRAYqG0i66uB7ffqoKD10fYJ6TRuxmjLOOAz85hufJo=;
        b=eTnN4BlekqTgShemX7C7g3ws32I4/TQX6WZZiaZEm5MzFyaBGXQPef6GE69RBmQAYV
         NDT+S8Y02ec6lkj/Yex1861DHO+WznyIj64rpAYsZeOp0k7dLOnBmQsLZKTL02EAndCJ
         DnU+gkKjtLB1wsohrwsbV2a9zWpVilfCtzmjvNHdeeGnTvwbvvBk3U7Il974iDRkzqq3
         7We6iRR6/TUhKJgsU6c2Gwbmy2rShN2s9B85HY/uHSrkkzo22jKcwOisw1FzrJ938c/F
         vZRDDM+H61piPBX1MXGINYYgQEjSzDAsou5Cdg+HCaWVYKj2ii+SHPp6bTzXMLCP/cCL
         DyZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791810925; x=1792415725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QRAYqG0i66uB7ffqoKD10fYJ6TRuxmjLOOAz85hufJo=;
        b=RnbEu/WzgFdWze1zfTqvow0XWxhFaaCe0V4QAWjbbsRiFywPXfRA5CfB4RB38ilqll
         rnTRrXDrIFJKj+8SYqzi/ZpEOhrxYQ77qMAJQDcZbG6us/E2w3MqzS76UWCwHkcMYuJJ
         5mxb8WlIryTMWnr75L3Gg2ABIufwN0pwfQkvT45HHaAYr8mQmSDJu/G83ACynXr00bEW
         e8Hx3+p7CIyfIUX6brohDzFLhNLViHrrj1ArFA3b4mHxfR8zEJUqtcPwkwza3w5i2DSQ
         kfP4KwQ/bl6NDMsIZZ1zCMflrtieQIRCe7rqoD4Lg1SgdnAMTy2wff70kmpkWCAqRTG8
         6XIw==
X-Forwarded-Encrypted: i=1; AKwUvBz751zywrKLG4dW7W5QVbpoFsYN+AGmDcFZKuCRGIrckW5kPjRycAMFMzmmsNbU+RaJ/i/uO2gkCCRmjFJW@vger.kernel.org
X-Gm-Message-State: AFq9FYLCuYrUKSGX4Od8Ep3s6n2X/4m/oT2M3HAcpXJl4dU3luBwsy/8
	BISS/GvhkJS0xmgKr8O8l8ULOch6EdSFIEk+3COGuVyDuUuYxl7pj0oJFHrKItRo8RqX3ZmGj4C
	J75gHIHVo2xRrz+5ilOVsEP3Vax6tL/BHXP7zWsNBz0U39NLRmWVynzsZXOU8dNZDtGCo
X-Gm-Gg: AYBFou0Lw0cxJXu2z3TaEt0XeDg3HsJjhHOmY4V3Htrk0l3NFRzCLzsA4ByVc7Tjvm4
	Yqs3Vv65etNlAgIsxG0i2VOxvjhbqVeVvGsZLFQ67KA4HpkoS4UxaTpksdaPDBRTv0+X5mn+7jR
	bBLQ1iWlNGUOhKJRWXKdT9ZYlTt2QOwr1BlY7U1b/0m9jNkm3azEQiq7Va9Dp0oMf9A4b5EipA6
	hzEZdj0Q/kSE1qH3veR6H0v147DNk0sV0HoIvV2XlOvr6ELr+nfNDo/ECQC/kVZwM3uayu6q614
	kddNaNNr6fXWYygjcjTOAZVAgmdeKamC8j1fUO2CjpUOrGZUR9pZcx0i6HcZCHMh7gaXSbaEptT
	qTwzBLSQODIcf3ab/0XrnQJS9mZfd
X-Received: by 2002:a05:693c:88c2:20b0:359:818a:df2d with SMTP id 5a478bee46e88-359818ae28amr6364727eec.31.1791810924932;
        Mon, 12 Oct 2026 06:15:24 -0700 (PDT)
X-Received: by 2002:a05:693c:88c2:20b0:359:818a:df2d with SMTP id 5a478bee46e88-359818ae28amr6364686eec.31.1791810924195;
        Mon, 12 Oct 2026 06:15:24 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537cb1e05esm34718753eec.25.2026.10.12.06.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 06:15:23 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: talos-lyra-evk: Add CYPD6129 Type-C support
Date: Mon, 12 Oct 2026 18:41:13 +0530
Message-ID: <20261012131518.858396-1-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1MiBTYWx0ZWRfX03s3aW2HEu2X
 s54Bx2YkjYh5AVXqFa//zFMDeD5M+Zuj2A0l82yy/RD3Ua6tua9LuHJbjDl0t6cg5rzIe9eWu1p
 5zZi9R3Y6U5cHzZKNF+uEGanXaveVj+OIOF/0rZ8gzCgU2VqSBApk1Ai4wHmy4PUFmNH1aKL3+O
 YY6ZjKDeiiZewy39abm2HhmwhRClN49RqtVgSm57prq+ghAOlF+DP+w+v5eznWvwNySfqUfWEbi
 WFtwSuob3gDmNQ7i+bAvqyo+T92IndOgG+mcmNPkmCYRKPFwD7YTJHab0c5MA6AAumyX9FVbg/y
 RCa5CU88As8K7Bl7kfcuurEyhWrfQjLRTzN8KeBYlTE7O3o2z1r1KOTUvYu8YR5liPY6KzGrDAR
 b9DSA13fGp951qjRuOG3nhtgetYq5Gb8U4CVcFuV6fxNjvDG778932tMzV9tHcOgF7uGsyvEUDc
 bGJ/o6ZDbajwk70r2nw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1MiBTYWx0ZWRfX7k0BG8Ngyp4C
 rqq0h2088nljc9x3+6kiK0DUNfqI2nNnrKmnTS1sE4FttXwtsZk8vDubzGXwcEzjJK4xWYVUvDn
 qQOPxYomENvEPq3yzvcKldnOS6ESb7E=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6accdd6d cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=t8wMJAQEvqTMzIF6IPMA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: XkTe-0gV_raIamLTwoj7m6RdXM94fSw9
X-Proofpoint-GUID: XkTe-0gV_raIamLTwoj7m6RdXM94fSw9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120052

Add support for the Cypress CYPD6129 dual Type-C PD controller on the
Talos Lyra EVK.

Enable the controller on I2C5 at address 0x40, configure its GPIO86
interrupt and wakeup support, and describe both USB Type-C connectors.
Connect the connectors to USB1 and USB2 through USB role-switch
remote-endpoint links.

Configure both USB controllers in OTG mode with usb-role-switch support
so that the CYPD6129 controller can manage their USB data roles.

USB1 is routed to the daughter-card board-to-board connector. Add a
fixed USB1 VBUS regulator controlled by PM8150 GPIO10 to provide and
control VBUS for the USB port on the daughter card. Configure the
corresponding PM8150 GPIO pinctrl state and keep the regulator enabled
for the board configuration.

Add the TLMM GPIO64 VBUS boost enable as a GPIO hog. This enables the
5 V boost converter required to generate the VBUS supply for the USB
daughter-card connector. The boost converter output is set to 5 V by
the feedback network consisting of R2403 and R2401:

    VOUT = 0.6 * (1 + R2403 / R2401)
         = 0.6 * (1 + 75K / 10K)
         = 5 V

The changes also add the I2C5 alias, CYPD6129 pinctrl configuration,
wakeup-source properties, USB endpoint connections, and the required
VBUS power-control GPIO descriptions.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 119 +++++++++++++++++++-
 1 file changed, 117 insertions(+), 2 deletions(-)
---
base-commit: b7e62b4d28bc0d2f16f03904616da78e4478aa88
change-id: 20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59
base commit link: https://lore.kernel.org/all/20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com/

Link to Driver and DT-Binding change: https://lore.kernel.org/all/20261012091658.635441-1-akash.kumar@oss.qualcomm.com/
---

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index cfb563658fe0..2cd5a2562f3e 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -11,6 +11,10 @@ / {
 	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
+	aliases {
+		i2c5 = &i2c5;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -25,6 +29,16 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB1_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb1_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
 };
 
 &i2c5 {
@@ -59,6 +73,68 @@ expander3: gpio@3c {
 		#gpio-cells = <2>;
 		gpio-controller;
 	};
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <86 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "okay";
+
+		/*
+		 * connector@0 is the USB0 Type-C port with SuperSpeed support,
+		 * routed to usb_1. connector@1 is the USB1 Type-C port with
+		 * USB 2.0 HS-only support, routed to usb_2.
+		 */
+		ccg_typec_con0: connector@0 {
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
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		ccg_typec_con1: connector@1 {
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
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
 };
 
 &mdss {
@@ -74,6 +150,15 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&pm8150_gpios {
+	usb1_en: usb1-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -94,10 +179,33 @@ tpm@0 {
 	};
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio86";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	vbus_boost_5v: vbus-boost-5v-hog {
+		gpio-hog;
+		gpios = <64 GPIO_ACTIVE_HIGH>;
+		output-high;
+		line-name = "vbus-boost-5v";
+	};
+};
+
 &usb_1 {
-	dr_mode = "peripheral";
+	dr_mode = "otg";
+	usb-role-switch;
 
 	status = "okay";
+
+	port {
+		usb_1_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port_0_hs>;
+		};
+	};
 };
 
 &usb_1_hsphy {
@@ -109,9 +217,16 @@ &usb_1_hsphy {
 };
 
 &usb_2 {
-	dr_mode = "host";
+	dr_mode = "otg";
+	usb-role-switch;
 
 	status = "okay";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port_1_hs>;
+		};
+	};
 };
 
 &usb_2_hsphy {
-- 
2.43.0

