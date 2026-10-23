Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740588;
	b=i+hhqyhILGK9ySGXud5iKm29Rrdvrmx/vZ3Ks4H3XSBQJ2LTPCILTI7y/uQfGsIx5vt6
	 CfBj0v17kcdVPphbpglkBliGbK1x4j5qgghGcEdy1PKqGBCbvT7MyjhVLRGiw5ltrda0p
	 UsAJUze0/eTNI/zX9IIBj8jvLv0yp/QPBW9jnbMc7G+s8cMHtsyGn9/gP2TC1WNud6A6b
	 TFJDoaRcUInyROXLPEULL06iExzF5x8Pk6w/6eP2XBUZFzT3nd+0MFkQPHK/szeOuhm7S
	 4aFS6ivPFYs0d86/NaxmA3CxsLpPFU03bFDkvoa0gVJOGmgFGtqwsYFkuZyCkkimu9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740588;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=gEzaWPPQ8wqOT/C3JqAeCqjEAvzlqHG/ukaTDDJL/x0=;
	b=tUCtUbr48FfRTLkH0ZHEEP0siOHy7DbOZL+sY0+22UBEB9Qsu9h5PQ4I8oQBTdU2PbfM
	 M+qnWNeskNzhmMCWog0a6z+4/D2qiTJg3ohLousVxIn/dDQDhQJbrXa5Ntl0iUOslBOXX
	 D9hVVIH06PLSX/4khE4xGfAw2oWOTfVuO0ZVytXo197brdc9vywCStzechX7Vr8AzgUzi
	 tlFp/2OrsqY+HR+ZokomY0l6yyMismCXMpUcWWTytfQjjXT7RWBhvOFFD+jYz6VinKTUn
	 9gHJUES2ZH0K/ra7tULmrtXnlKhvCKfs2MyU5jQVBDnSunkKw25Np6TkSsVD7B3RyFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iXHiqmx3;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924EB606A31B
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:29:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 924EB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=iXHiqmx3
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2e608cd460eso3142475ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740588; x=1793345388; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gEzaWPPQ8wqOT/C3JqAeCqjEAvzlqHG/ukaTDDJL/x0=;
        b=iXHiqmx339HIa0YvDb8JqpVIoR66Uteib2J+vS0hGernHOrUzigh6bq6Rq1pEH81sN
         JywJvuyXJRLQ5Jiz27hbO4UGOlh30HNdIcClXacR2KyGqCUxhzamus1jqNGYfnIFk4cb
         zs1qr8GR9N7iKRqtNDrZOqKYBA9f2PD8G9vZpgV+dPOSbR98UTuNa8+hdm+Th8QozDEJ
         jYucM6tv8brV0Q5O7o44rbPoJcY3VILCR/qFu39WPlOBPRiCyty8IBVWAMo/eIxtsYHM
         1KTFOTILXNkYToyX6/a/9Ek5pOt0rrL2J2ENNJhZzYW811dfZHeBJzrOkA9o2cZDmT9e
         0djQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740588; x=1793345388;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gEzaWPPQ8wqOT/C3JqAeCqjEAvzlqHG/ukaTDDJL/x0=;
        b=q6D26FXQodNCTyxIjwkZLsUJF2CXFU5Fnhe6jL+BVedPfBeRBlXGGiyyw5Vkr4su5U
         ieYN4uUcKUrmxnH5NabVqBOS4EqNlKIdSNa+smjawzCU4QrlXy2ECAHWaC3eeWze4185
         A0PFMPAgwWxbBa2MFgVuSuUDnam9GDu75zhumrLHQduQMqlAXSVb3UMoxkrWRJkq7Vjl
         mn7/7uCuOwpVtvT5x7/xN8K96IojK8YJ8w+kAQR0IcW2buz+zBlQ573WY94PfXGXyCBA
         qVkJSo/KaUrT5YfEN89kI23sMZfJtX+CK+X40wYCEQMUcW0CGX00fKnaYh+JZmH/rm7j
         FNIw==
X-Gm-Message-State: AFq9FYK05fVztENYp/+xMI3szCHmlBgxlWGfohDd4fsLvWuup8XCY0C2
	cxcLNhM4z/HrDowASHq9dzmOwn7TuFGIIVPYrIwSprL94Ni9H4OacR8rltIu+Q==
X-Gm-Gg: AYBFou2RDnQfnaps9CFpVgFdoXtBDHRx7MW6Tbvha4lD8jxZLw9jONwdLPoxfDfkEOT
	w6LqhsIGJ7ejAYOW4aGQ6ynZfU8xvtFOODk/ZMxrbMwRSvsBEZlUBdKZM/P+dESPzUnWYZl0w+p
	UbD/Afk7/Q2sHwgbmLKoGHXpq5SbyvovL/9UW/DkNy7u3FSbeW9mS1M74rCbtvqE9MSIrn808Kv
	RO2hQP724n5OolwAU9j4+Nsq8YOyfG+WbONPAGM0UQmOjfdTug0zUkfJY77B6LHO8/KErCc+Xl1
	oEpwQSrbtcnrQN1HdqMX3Skedq9bkc3Y7kAEFV4fniloAS3tbEfxICrxGbWKpiNHtPIMS39ZCeG
	RpU3UXg6p7Ncb6On7NOvIoyMSQ8QVyfkOrehgHPuywZL7dleFL2bOYuvE2EASVuHenyhqOxH/JG
	NEj5eYJLAPBZiSaUlzsDJV2z0zF+njea80KHOIo6UicvkJM/OYhzgxvUJYUMF8g5ire3xc9KkM6
	QaKcwEGxe+zEvlfaW5HF9K/sj1yPP1mywxSyHeBhfNZ3vAWzA5T9UNn49LBD0a+ubkS192AiQ==
X-Received: by 2002:a17:903:1aab:b0:2e8:773a:e902 with SMTP id d9443c01a7336-2ea7d07a520mr14356605ad.58.1792740587853;
        Fri, 23 Oct 2026 00:29:47 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:47 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH 5/6] arm64: dts: qcom: sm8250-hdk: Add support of QCA6390
Date: Fri, 23 Oct 2026 15:28:31 +0800
Message-ID: <20261023072832.2642647-5-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261023072832.2642647-1-dc_redstone@outlook.com>
References: <20261023072832.2642647-1-dc_redstone@outlook.com>
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

The sm8250-hdk has a QCA6390 WiFi/BT module which hasn't
been added in the dts file.

Enable the UART port of BT, add the bluetooth node.
Add the QCA6390 PMU node.
Add the wifi node of pcieport0.
Add the missing regulator node of PM8009 which is used by QCA6390.
Add the pinctrl of QCA6390 enable pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 118 ++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index bd9b90fbc..57c282bdb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -94,6 +94,67 @@ hdmi_con: endpoint {
 			};
 		};
 	};
+
+	qca6390-pmu {
+		compatible = "qcom,qca6390-pmu";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&qca6390_pins>;
+
+		vddaon-supply = <&vreg_s6a_0p95>;
+		vddpmu-supply = <&vreg_s2f_0p95>;
+		vddrfa0p95-supply = <&vreg_s2f_0p95>;
+		vddrfa1p3-supply = <&vreg_s8c_1p3>;
+		vddrfa1p9-supply = <&vreg_s5a_1p9>;
+		vddpcie1p3-supply = <&vreg_s8c_1p3>;
+		vddpcie1p9-supply = <&vreg_s5a_1p9>;
+		vddio-supply = <&vreg_s4a_1p8>;
+
+		wlan-enable-gpios = <&tlmm 20 GPIO_ACTIVE_HIGH>;
+		bt-enable-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
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
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
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
 };
 
 &apps_rsc {
@@ -352,6 +413,13 @@ regulators-2 {
 		vdd-l5-l6-supply = <&vreg_bob>;
 		vdd-l7-supply = <&vreg_s4a_1p8>;
 
+		vreg_s2f_0p95: smps2 {
+			regulator-name = "vreg_s2f_0p95";
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <952000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
 		vreg_l1f_cam_dvdd1_1p1: ldo1 {
 			regulator-name = "vreg_l1f_cam_dvdd1_1p1";
 			regulator-min-microvolt = <1104000>;
@@ -477,6 +545,39 @@ rst-pins {
 			output-high;
 		};
 	};
+
+	qca6390_pins: qca6390-default-state {
+		wlan-enable-pins {
+			pins = "gpio20";
+			function = "gpio";
+			drive-strength = <16>;
+			output-low;
+			bias-pull-up;
+		};
+
+		bt-enable-pins {
+			pins = "gpio21";
+			function = "gpio";
+			drive-strength = <16>;
+			output-low;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart6 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,qca6390-bt";
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+	};
 };
 
 &uart12 {
@@ -740,6 +841,23 @@ &pcie0_phy {
 	status = "okay";
 };
 
+&pcieport0 {
+	wifi@0 {
+		compatible = "pci17cb,1101";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
+};
+
 &pcie2 {
 	status = "okay";
 	vddpe-3v3-supply = <&vreg_3p3>;
-- 
2.47.3

