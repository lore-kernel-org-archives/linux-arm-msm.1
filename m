Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792740576;
	b=WuqhWTjI25x8KxVOCcxUpkCO+jEorgwEIUTqH99Jps9WHEjX/0OdVYkzKrlC8VBmQjPR
	 5FBKCVIGQdmNCGucD7Gry4c6U6a8/9ZdQT6TqjBWw8svmIaXmfEdY7GxkAKrYBn+MOssc
	 zC6d/SV1pvSLIIp6tVwEtIb17AUom2Xdb16mP5VKiYPxqXJRBuSPQavArGpHpNNpcA+OI
	 9ciozGEHoijuqRvaGWu1Y+vxzO56DhU59ms592xvvxy5KXePXxmJqWOAouwFw1MbwmI/1
	 xXmDzvZpI7T7BvD0mg3CTgnj/gW9fva/kT0+QGBeeCYbF2BnbejrD4MErjkuwmrqXaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792740576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=VAVaTyG6FUxtbGFiAmHlRicfPEk2g2jbtLra8HC2bXc=;
	b=w4lwVJooYfWPQUXVukqlQZ7D8NAAyGJdQhvBf6XtVgAkOv8HlYU+o3PvZAi/XVSwOiiK
	 qcOF4omEhQjnRBKP12V1NiIqHg9EUTLkjHd3jXWte5Be2p+tubPdiy0JpMiYJGXxMuHyb
	 uCYrf2kEFzQVUTZu8lxfbt+l7t+CZR3ZQ9SXhqODheL8LZ+3K++RTmQjXao0zLq1MeVAH
	 bvk7v6cF7zKfGJE/jRnhb+DvcaIWSfSCCm7Jh5DGEG9KvbFRAcdfQA/RAKnEkcJsCOBEI
	 g/yfPDrI6EQa9Ur5cYYWqVDNlWEBEMXiXDN59mOCqaeLd756br86b7lL6h51h4pEHGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bdq3CeN8;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED48606A321
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 07:29:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5ED48606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bdq3CeN8
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e9ae391a05so3360105ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 00:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792740575; x=1793345375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VAVaTyG6FUxtbGFiAmHlRicfPEk2g2jbtLra8HC2bXc=;
        b=Bdq3CeN8nmxGTGNEujtXFVH2TPke7F6tCQtSP4fJkoqIK8dFkUJCCMGJ5+D20vCYcR
         5tbSrCkFkZN0RdkjNKwqaXfr0SS+yIc8dcUMXGxq7nK0i1Q7bfasZ4Li72GSkFQjxNRF
         NbAZdhkYm8pLhcUQjYtE7scCD4/58Etd1nmBUlHJUqVmit233CxXwCQM0Cit3ucwoPo+
         4DYqurVz3R765oB8Gt4dFMxn+6EduxxyTQYl/wfGNIP9bXOdh4V3Q1z/ntGh8u3nsZ/w
         1SWOuJtl4sytcxG6RKZw2u2msoDL3Hi4DkcK1FJE+67SNMB8SemFHobpSqshltuguV/p
         1DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792740575; x=1793345375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VAVaTyG6FUxtbGFiAmHlRicfPEk2g2jbtLra8HC2bXc=;
        b=OLzPMJeJTTxtK4woF8EXZwF4QF3HD/jRJYMfMiuxjHLxp7vE/4yb+tgqh+pU0OELJd
         pfIWLecc4EQ04eCQ7aztfRaXe48oSw36SFHUucdXj2SKHJKg8wW5BWcg6yJaSqX2xJPz
         PEehXFZljyDA9CYIRqXpgJ32ng1hpylAHiFIIMJdXOoPdA5C1JBA9FNfY60Q3QGhJ0gF
         u2lcPAiqDrHumkwB9b/ObVIWsn05g4q9SqBdFzMo6n8wA0qP1Qri5+iPTIM2c/Uf9eJ7
         noSOph+1VEnIRSA11nkSsYLhrLuvWChpmCWBJY8ii2+L2eXwCWVVfPQqT6soXwca1hng
         LfZg==
X-Gm-Message-State: AFq9FYJHft1yzWfohPC2bDs9ImTPCUqRKQXI1PdD8O19W4mhk9+Rf01G
	nveX09LdaufRNNrtLlBUT+JfDL0Kcw8sLiTbQk/YnHqIu9TwrXFwT/q6
X-Gm-Gg: AYBFou2XbTIaefo2fFKlNpXN3CUxk6CMmoI4bheW6LthS/gT13mEkcyR/hkUI1PGy3r
	ZPKKuqENk5ETQHhN/TY/9AkbhzdqA9c5qv762psF2wtrhJxbe42TCVOyODdEgSS1S2W3NuoBZ39
	q5DpaOh6vTelNdN5I8WsXP9D1k+OqoSJ8iyzUidBkuqGVr/iabr5a+OsHuD1bWtBatjMGqql/vN
	i30ejND4wCI6JpF5wLKlgXT8pmSUCsNPttRPSGgUMR3qoKwl9PrzMovJZQiTNRHaXukT7zBaR2r
	2rquBezcLTV+WJFNyx0hRDIr2+DSAaejJ8gdXuST023f+Yk4voCXanyhU26nU5JrIv5B4uZBDK6
	v4xyCRoQNRzrukh9NydwYCyeeneXIVggyewHeHB4Btm/7JIC5CnlkEEu3hPK1bvuka9BmDPnvg1
	/KMJFrZk4kqcbQWykvylxg9/YE530SaalRRhEBRZneEMTcugk4HNWYvMFHYKOlvkgRq8zrkDS6i
	lqvTSFNpWgxriBsFkdthRF2TX7OPOy5S0rwcBlQxEzk/9vOKEtG6mcvLthJbZROhk7mqUuJJA==
X-Received: by 2002:a17:902:f38c:b0:2e8:4ef1:6fd3 with SMTP id d9443c01a7336-2ea627e3b09mr20695605ad.13.1792740574627;
        Fri, 23 Oct 2026 00:29:34 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea7af6a466sm6858715ad.9.2026.10.23.00.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 00:29:34 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	ShiTou Hong <dc_redstone@outlook.com>,
	KancyJoe <kancy2333@outlook.com>
Subject: [PATCH 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
Date: Fri, 23 Oct 2026 15:28:28 +0800
Message-ID: <20261023072832.2642647-2-dc_redstone@outlook.com>
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

The sm8250-hdk has a video bridge chip LT9611UXC
converting MIPI DSI to HDMI, which hasn't been added
in the dts, so we have no HDMI signal.

Add the 1V2 supply node for the chip and the HDMI connector node.
Enable the i2c port of the chip, the display controller and DSI port.
Add the pinctrl of LT9611UXC's RST and IRQ pins.

Co-developed-by: KancyJoe <kancy2333@outlook.com>
Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 105 ++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index a049d78f5..0bc946682 100644
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
@@ -396,6 +419,10 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&qupv3_id_0 {
+	status = "okay";
+};
+
 &tlmm {
 	gpio-reserved-ranges = <28 4>, <40 4>;
 
@@ -424,6 +451,20 @@ clk-pins {
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
+			output-high;
+		};
+	};
 };
 
 &uart12 {
@@ -506,3 +547,67 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_default>, <&sd_ufs_cd_pins>;
 	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
 };
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+		#sound-dai-cells = <1>;
+
+		interrupts-extended = <&tlmm 1 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 2 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&vreg_bob>;
+
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
+&gpi_dma0 {
+	status = "okay";
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
-- 
2.47.3

