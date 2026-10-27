Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793088592;
	b=MvsOfPUPvcbN6lGBMNP//ki3gqKu1cQk98XDSv5ToUKYfmNKSskhyEgDC0Bx6Ph6ksnt
	 kWIlW9RGNz34ol0EeW63Ngf4K3fEPABHR2WIUNKzb9/+yzWkJcBX+u/iaztUzIsC4X6gL
	 k/pmubAyWIvlkD/MFirtT7EVa6VMm11fRe83qF0yR6euyNWhwxJuw1iElVBGdXKUDhDyg
	 9OLUTu2nqcZ/MWydVSS+jsYxwfT2rqdbrlMDStOzvClrupnxGsE95Lssf5mwXv4Q/71zw
	 7E5K4MZN314Dwl3aBz8/IuwNz6d6GRLxzA6Tc4zkjIBadJdXgu/r35emsa/M5BB4NBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793088592;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=6pEeVNLOK1goU4AZirMd91GfBu+dH8WKElFw5XHafY0=;
	b=XB5DQrPcdDbPcTpvdkmdDJMKj3hGRgkwh2Oz/9tRNhFlj1ov6tn0IQCcvVGbRlCLYz4K
	 48JiGHHOA6bTmeYk0LWHWFRpBDQA/dUrgRnjbsSGgYe1EVYe9Pv4z/dFYj0MLYVS6izHb
	 55TCgjoNqeOnD17I5uHKc8sTR6i8r76/bxWwLuECfkROB1bVQihOq05eAPboaQCpV8dg4
	 9c7lN/1YmS5oXfAoOqh8ed6ZDYTHrCCIYQ497lzR+0p9dR1xZITeluDdOE5wwXG3QakVF
	 wflj215Y5oqW7ksxNqMewu3WJJXx3ZMvEXtu8Q1xi6fVNREFrjMjTUo4Hbyv6gt8/GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ct1QZQWc;
	arc=none smtp.remote-ip=209.85.214.170
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0683606A31D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:09:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0683606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Ct1QZQWc
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2e9f6a16aedso26102555ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793088591; x=1793693391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6pEeVNLOK1goU4AZirMd91GfBu+dH8WKElFw5XHafY0=;
        b=Ct1QZQWc9ppmj5Wrfc3ETf6E6ZnzQ1m6LtzKDFmh3IKW45ZvwCAmwSQwpv1C40uqer
         MZ9VVCI08vPHXEstpas+9kk698OcHVB45ZhslMAtgBL4ZNZEBCCuJr3XX/gVQhmAjO5f
         kDhiVbDPxbAmpVyNz8SBGQmNS00HAzP4MpMkotfxTCifk5aYiIfHsdhAIpc/Y5aKdd9M
         5HPEPcnxmnXhpjlRqUOaHgInHdYeHyNDBPWBsoNRfH35afQNV9CBlWKEP3ULKzUzX3V3
         O8+SFCJsR9B5ZQwpDxLdseA+3hXUhuriZEh94NduJqGVZEKjS1Uqa5G/xPpocRMbytsf
         ZLXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793088591; x=1793693391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6pEeVNLOK1goU4AZirMd91GfBu+dH8WKElFw5XHafY0=;
        b=Y5FkQweMGGrTdXkZvBc3tQDoWPdWpp9XSA+sQx6DkRf0dQ59OIN+uxSw0p7IqERj6H
         s9fTz+hc/2kzjLyfPWCVqf3Uo9v17MHH2nsDKZQrsqpQSGF6KAu5t6llK3bG0QnF+Dfb
         WPL+18Wy3ZgnuG6JCiSlb2AAnzk3n+mui0aid++0UU2UHzNmy8+gPQZehE+eOxyiGI5l
         fMoqrbKVL8njbJcoDwH8dzKl5ZVGehA+YFUsjDKMIe6t546qKK80rdzHTdCd/2w4/ZL1
         N3FgdwpwFy28U1a1Pion9ChYLWF/J708ckZOfGk5Zc8p9gFyLjmE0aEb73bn2oJ1f1kw
         d24Q==
X-Gm-Message-State: AFq9FYKkeveVfhG/pmet9NQWp4DTzqfkhI27KTWAipxm37t/JmmoNiQu
	bpjsTk0kMWcY9EZW4ocjUpZiTxU70dTVzp0Ip/BJbxuUdppgGWOwQogh
X-Gm-Gg: AYBFou12Wj228guijqarsoEkV8iJnlLsIVsJiDVZbDqFtCUaWnKdtHkL5Hnif44Cx7v
	13jkFJhc7cm0Op76Z1JRWQE/2oVDCS33KlYxu1N7VUo8yXXfBt9l8IDOc8n1358JkiRe3Jdz4QP
	5hko3ypBBqvF+Nu60gNZr+iB2tFBY2A2Ou5RlvHSRTrCMLS5h1ca9AWM5YN7m2o5qF49YmDdHe1
	UEWM39RPAC34jdXsA0dW2DBYPXa0ao8i0m0Elr5nFnxFn9Xv5hSCsMVqPQhlYj+vIF3D0K+jTqN
	sVmxBs/u/9t/YEwEvB0SdmvO/AfMhbGbjub8x6nHmk2xlpADkSbCk1uTJZg/inAP7zfaM5+Mn9m
	BS3LSHUIWwwZ0f7N6rC9jxri3myino38pY4JdtW1SlD6Lbq5LnQfxp7FlUMZciIV62eoAV5KRme
	VRU3e2vpxZZkYKMAjWgViD1kDbESLxVaQ8YvcjF16vn5xmFKqNQaBUN8s2GmfrxY4cmdlHRSQjm
	a/rrjGPolPJsPCCU9eCeSfcA1XY/7kVrl4bsUNMsz8Bg4+wqhLqAsFY3Ep4Q33SUP7Rt27KYw==
X-Received: by 2002:a17:90a:b896:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3adead4dce8mr4906429a91.46.1793088591065;
        Tue, 27 Oct 2026 01:09:51 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae406361e2sm2592284a91.8.2026.10.27.01.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 01:09:50 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH v2 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
Date: Tue, 27 Oct 2026 16:07:54 +0800
Message-ID: <20261027080758.3990418-3-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261027080758.3990418-1-dc_redstone@outlook.com>
References: <20261027080758.3990418-1-dc_redstone@outlook.com>
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

The sm8250-hdk has a video bridge chip LT9611UXC
converting MIPI DSI to HDMI, which hasn't been added
in the dts, so we have no HDMI signal.

Add the 1V2 supply node for the chip and the HDMI connector node.
Enable the i2c port of the chip, the display controller and DSI port.
Add the pinctrl of LT9611UXC's RST and IRQ pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 104 ++++++++++++++++++++++++
 1 file changed, 104 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index ad60be5d5..c031f91a0 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -44,6 +44,18 @@ vreg_s4a_1p8: pm8150-s4 {
 		vin-supply = <&vph_pwr>;
 	};
 
+	lt9611_1v2: lt9611-vdd12-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_1V2";
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
 	vreg_s6c_0p88: smpc6-regulator {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s6c_0p88";
@@ -63,6 +75,17 @@ key-vol-up {
 			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
 		};
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -377,6 +400,70 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/a650_zap.mbn";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&vreg_bob>;
+
+		#sound-dai-cells = <1>;
+		interrupts-extended = <&tlmm 1 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_pins>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
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
+	status = "okay";
+	vdda-supply = <&vreg_l9a_1p2>;
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+	vdds-supply = <&vreg_l5a_0p88>;
+};
+
 &pon {
 	mode-bootloader = <0x2>;
 	mode-recovery = <0x1>;
@@ -392,6 +479,10 @@ &pon_resin {
 	linux,code = <KEY_VOLUMEDOWN>;
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &qupv3_id_1 {
 	status = "okay";
 };
@@ -437,6 +528,19 @@ clk-pins {
 			drive-strength = <16>;
 		};
 	};
+
+	lt9611_pins: lt9611-default-state {
+		irq-pins {
+			pins = "gpio1";
+			function = "gpio";
+			bias-disable;
+		};
+
+		rst-pins {
+			pins = "gpio2";
+			function = "gpio";
+		};
+	};
 };
 
 &uart12 {
-- 
2.47.3

