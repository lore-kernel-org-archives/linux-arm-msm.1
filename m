Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668973;
	b=ZuYPP0tCj5zPr6P5u/zI67WOV9THCtC7S2TgHfZTKEw+40DbKmGu6MY7jsVwPYv+tFaC
	 iFkYE/ITsaG/cEVasBkH65aMhQ/maK0/ynzgf4PblWscIiaeXyf8y6hQOtNpN6NSapJXR
	 9cXPL9oXGjUsSy3MCXBFrnDCG6VgmqwFQO1tQMdqvvyxGvqLQC1d5V2ahh97Ig5z5+55B
	 ukwMef9MieDiJmfY9kkt9NTYpyQyGKczItNpy+o7s0Rd4eIHZvyW8BTLB3zATvReKyvAt
	 Gw548zzbBL+AI4cep/oT92qe5FkaVfRKmyWO9vgbK3TVaK4TDAd3ugFDQVvOSrsg8BQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=GuEgk05FDwN2DJJek0xS80ltqqEedDpyTXQSRI6cVIk=;
	b=yFTFUYro+NDDhkppSGBwHRUuZTLxZqu2nlb3WpCFMfqUPNHK0bgnVx0rkpS3SqTJMBa0
	 eZvlJW2EHjPuwVXULJ8JskhDId8lNaFsVq0tBi88qwHJ8oF/ovOUTHN2MaVHys1dRnH4S
	 yFI1P1DNfQGOvpoKzyXqRJZYiFkfOLUbDTeHbYq67mtrwI5GDS3FMgIG/f3ODm0drTqTp
	 Wbqru0gUxpSpEOiYwBsOH9BqBQ9uLNECOEg3vlaFdJtXp8gz/vUWXNw3KkUZ9NmpMxZR6
	 OiT7dWVD/MsP5/A0hPVMcJ9/LLqq8i3N+XT916dF8xNoLk1m67qKG8CmRxPsSJ4pFvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D84roI0L;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65EF1606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65EF1606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=D84roI0L
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3ac9f49b984so509821a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668973; x=1793273773; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GuEgk05FDwN2DJJek0xS80ltqqEedDpyTXQSRI6cVIk=;
        b=D84roI0L/glpLHzixfYSzhSgiaOlSkGX+cwkzJEag6pJYB2c8YXfG8Hj4bbKJyXZJr
         qkRRxO95H4AiT64Evf2gxOfXTxfX+3Mz+TDIBFutgHxpmCPXnfLOpDWFuW/FWzhdFqP5
         6RYWlr3cP2c6l2DIkjhFQQQ8jlEhm0BFUukPOpJhLYUEdWJE+IxIXpLRg192Bgh5P1sA
         74v9gfWrgjZ8v//PPw3sx1EzXOfjQcgzJ8oMTeBk0AX5P4zgMO4HqjYLcqx5wFyh1Nj8
         6JmKRL/Hp8cnAOfDwL/YBJH2as+bIVZpNOtpmnXQUJVT/FBS1hI4v3G1iIdeWzGc5bEj
         dRig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668973; x=1793273773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GuEgk05FDwN2DJJek0xS80ltqqEedDpyTXQSRI6cVIk=;
        b=QpsmuV8WSS54eA8w+XDofS061hvnrVHTYMtA+LOOeeNvzXpy0JT0xWeaC4++aG6eVf
         j/bpyNclepFJoLMBQ3uQoQ1NkhThFYnT42LLhBk/47KEvdyYbsLmCA0aF4kbV+tWe/yn
         xf5WcYYhXyRyfeHgUi/oahnwFQOcbEeu/6vm3f8LQfV27eL08oMf40qnWkLznopowYtu
         gyppvoWNEwZPPzPfzYQ+atjGEstjWhJqDAGWeOzGZXKRu8zQMR3pMMFgE/yzDdlBTTub
         5fstp7TnYmzD27YLBvLsSjDhCYjVXk+WB1HlloHXk3SQYS2qopwmxKFuSECcMMoDe/+0
         Udrg==
X-Gm-Message-State: AFq9FYLFXeUj/aX7VvRXo+3GQqO+2F59dSez7tAfD5D59KEbTDlBEQfy
	Xo0ov6AT8XNgRfTJJtqu1sNqK29IxPoCeMewAmeTmT1wckgQ5SNfEFoe
X-Gm-Gg: AYBFou3/RGQrGOz24ztw527PBXrnsWEcSlBsR+k5/vNXrI7VGZxM/nHdOru+y+RCAm1
	t7aheIvsKmJliBMfJgVQ/azSCgQUlBBM6vNnVOq3iNga1nATBpj1aUVDm2MiVYaH61OBiZTgXSp
	m4vXI9uq4zjwOMbmb80ontwruhHWH4RMX46URlEcT55CTLVQOweze+KqNeYDWngeaDDt6Z3HGr7
	n0pZl6qKirAmy2sQnYeQCZUDP3/KpI44O96ulQ9V/MFtsIom2T/xLOqZEWdCCwm9eQm0CHfYKmZ
	ReDCaXqRuH6ZsCLFm7uDvBKNlBVs9Q1nyVTKsu9y/ITtdoPn78KFzwUP0vaIZLMJUmcfZ3bzUNy
	qPlSuISq0Xqht4ovhQmCskWu0/eYliIS4iSDsJ+29JljZeBLuQfPzZdJ//If8Oo2IuEKIDB2NK1
	udYmb6QsN1ZJMYQhEPPGUxCfTb75dZQplpI8er57HSty4/HEA2g2/3+TCy7DZpZx/zMQbfI8cwu
	/WH8saY8Ivn23BHoKaVgHwouO0dEtdAug9CpGLWeZqAAXeC4tOpMFnKjSZ52GVDKnENiOkwRQ==
X-Received: by 2002:a17:90b:2752:b0:3a4:b509:88bd with SMTP id 98e67ed59e1d1-3ada6c545d3mr1333278a91.2.1792668972657;
        Thu, 22 Oct 2026 04:36:12 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm3997668a91.8.2026.10.22.04.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:36:12 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	redstonee <1516235445@qq.com>,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 2/6] arm64: dts: qcom: sm8250-hdk: Add LT9611UXC HDMI bridge
Date: Thu, 22 Oct 2026 19:35:57 +0800
Message-ID: <20261022113601.2320940-2-dc_redstone@outlook.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261022113601.2320940-1-dc_redstone@outlook.com>
References: <20261022113601.2320940-1-dc_redstone@outlook.com>
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

From: redstonee <1516235445@qq.com>

The sm8250-hdk has a video bridge chip LT9611UXC convertng MIPI DSI to HDMI.

Enable the i2c port of the chip, the display controller and DSI port.
Add the pinctrl of LT9611UXC's rst&irq pins.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 123 ++++++++++++++++++++++++
 1 file changed, 123 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 5975878ea..d92e569d8 100644
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
 
@@ -404,6 +431,20 @@ sd_ufs_cd_pins: sd-ufs-cd-pins {
 		function = "gpio";
 		bias-pull-up;
 	};
+
+	lt9611_pins: lt9611-pins {
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
@@ -486,3 +527,85 @@ &sdhc_2 {
 	pinctrl-0 = <&sdc2_default_state>, <&sd_ufs_cd_pins>;
 	pinctrl-1 = <&sdc2_sleep_state>, <&sd_ufs_cd_pins>;
 };
+
+&adsp {
+	status = "okay";
+	firmware-name = "qcom/sm8250/adsp.mbn";
+};
+
+&cdsp {
+	status = "okay";
+	firmware-name = "qcom/sm8250/cdsp.mbn";
+};
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
+&mdss_dp {
+	status = "okay";
+};
+
+&mdss_dp_out {
+	data-lanes = <0 1>;
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

