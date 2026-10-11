Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2420431A51
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791712493; cv=none; b=VoEB63s0aU+JxS09+wa0lf5KP0Ua9fTfIPfVlMJWcxPcwY7lnFqopr9pn6nK7KwMnJC1P8HxnMXGFjrVQcoRsMtAfqpVlp4qvY9qhFFFUB7fsx8N87YG19RfmKqGexPAh0NBc3/UsEzYDHjuuLfpaGP1dn9y8wYpBwmPElC+3uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791712493; c=relaxed/simple;
	bh=rUZkYVu9nfBtt5eziloTRREh7eL2CH5SHqK0mhZpGZg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6iyyKSV/ATlR65J3TTEJjRwndJS19PI0tMw5wXFyik2M2EkCw0BUlYiXzNNJmfVWgRsrY9mufzUD3Jc0hXUESiiS6n+OPivW5nrJgOlwl85kcCjO0f+Y1T6+e82mS2e6WehXjNPDIERqdbkYu7D/YZ86QBhix6JSqs6wMkqd1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UnoYveF3; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UnoYveF3"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a02667ccebso6398745e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 02:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791712490; x=1792317290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D9emTae69zed2eqZREomm1B+mGzE0lz9n7jF9sBtgAg=;
        b=UnoYveF3dS2DobYpiuf+mSEPrUmJ14ElEVyiZ9+xONxHnEyD9b1KMy6uss4Ov85MPg
         RYV3ETYXLUujALoH97jpa4yx559YIEc5ApmJAaUXIiR7/Lw9InZUpgpvZnkzTRgkcX/B
         S7Z5agFqSM8KlmOYxV2Lg3LUPdDDzZ7mriQDbuQn7o0L1SxfLK7wHtpyulpj/3oDuYE8
         091eL/QoWd+oF/JILEt12NMRz2M59l7PIWZyIQSEVpsjTdXpJgRWWLRahSivshWgP+Wr
         6PucIRTaSs7d7a2mTpJaE9p1StHUanXP+iBW34BupbaKSjbMAZOTPhOzOnWvvsTSl+XD
         2m5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791712490; x=1792317290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D9emTae69zed2eqZREomm1B+mGzE0lz9n7jF9sBtgAg=;
        b=A0tcrOTC49hdAD3d/Q9f+Ml6fYQTHz7HHuaMc3EWHVoJKR+RqVTWYhl+DZ/iH4qUqu
         gyIDpaWKVzsineRUhL/OejrRNdAqiCG/b9LqFMN2Mzpk6oIbMUpbMOLOmqWO/XCsy2kP
         GHxJw8zrOLSTWKyQHqKu0oFLR7cTeMRSvBxx49wRpUynybF+bBfZCjt9E+i4MHNslSTN
         b4MOiq9Ylm1imQZfcbja9hzbbsP4bCZkiI817XqPmI8NfDQ4aKWm5TV5T4y/BXNtXjmv
         frHoHaj/hVz/xgXdbNTPiVZh0xTvq7n91y+dVEQmi3wz4BEBCw0kfNJRbxEltAP1a1QS
         Itsw==
X-Forwarded-Encrypted: i=1; AKwUvBy9OXM5R+fZ5TY+V0m4nEZsQPq2dVXVTxiTPXZOuu6Vp6W0IF4mCk3J3ePgn2VNVM1mJE1lzCYGda4MiCIP@vger.kernel.org
X-Gm-Message-State: AFq9FYKhqZkaugBnFY6Jli4fsqcewE4al1KuUhzY5VbGLcVcKbKl6SkG
	uTyrQsYCe3uiY+Ckz5q4FJTULY5V6IznqzvTm8JLqMLaALnVjxkhi7LM
X-Gm-Gg: AYBFou1zw9kBQ25nOEb3BxvlXfFGRT/LLHcXmRWkPZnPn7kiwZ+oKETY4fGCWVgSVux
	ACrQV62t64H53MEY5wc2xdt7Ks0XGLuJ+SconFZsK1KSE1ize7sWSzQqgMcpfPP3X22/vFlx+S3
	tXscwFvAkMu7Mb47OK3tmGjmFTA9BzjwmQdBF56dEKeeUXVETnK2LEJq5zMi+WzYpZwlJ/ewuz9
	hsaLUsDAIJZ5IXKLT5a0aeUA3FydzVwWkYOwt0bGMefl740BmL/+btPKA51kxqxVczT87Qoj5MK
	Gm7YJehIQe60tN2JPYk4XiGm0hbBGhJL9zW6M+F94Xl50fT1WZ9h7aRI4KhmwJSM66oYwDvlH0K
	Qym32VbBnRXz1ZsDmEt7ja3aHjBddNLa4sSywVcW1zEu12zRPGJ+jTJV6wB9r2X+1Ebic2OcwUY
	jdo1Av8MaAmCm1eqS23ZWxqwuOjmPXeLSqDgkY5Fbh17a6Rjgdpg8CMrCoKMYWk6Wi8A5O3mdNL
	U+8YfdWbTQ4F94=
X-Received: by 2002:a05:600c:4e12:b0:4a1:7f8e:6e5d with SMTP id 5b1f17b1804b1-4a18e4a393amr126977605e9.6.1791712490081;
        Sun, 11 Oct 2026 02:54:50 -0700 (PDT)
Received: from localhost.localdomain ([151.27.249.42])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2343asm377837785e9.9.2026.10.11.02.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 02:54:49 -0700 (PDT)
From: Oleksii Onchul <oleksiionchul@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Oleksii Onchul <oleksiionchul@gmail.com>
Subject: [PATCH 2/2] arm64: dts: qcom: Add initial Nothing Phone (4a) Pro support
Date: Sun, 11 Oct 2026 11:52:21 +0200
Message-ID: <20261011095221.24767-3-oleksiionchul@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261011095221.24767-1-oleksiionchul@gmail.com>
References: <20261011095221.24767-1-oleksiionchul@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add initial device tree support for the Nothing Phone (4a) Pro
(FroggerPro), based on the Qualcomm Eliza platform.

Describe the UART, GPIO keys and reserved memory, including ramoops.

Assisted-by: LLM
Signed-off-by: Oleksii Onchul <oleksiionchul@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/eliza-nothing-froggerpro.dts     | 157 ++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/eliza-nothing-froggerpro.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e0..be315a412 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -16,6 +16,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= apq8096sg-db820c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= apq8096-ifc6640.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= eliza-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= eliza-nothing-froggerpro.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a14-ux3407na.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-asus-zenbook-a16-ux3607oa.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
diff --git a/arch/arm64/boot/dts/qcom/eliza-nothing-froggerpro.dts b/arch/arm64/boot/dts/qcom/eliza-nothing-froggerpro.dts
new file mode 100644
index 000000000..8be410f62
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/eliza-nothing-froggerpro.dts
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Oleksii Onchul <oleksiionchul@gmail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+
+#include "eliza.dtsi"
+#include "pm7550-eliza.dtsi"
+#include "pmk8550-eliza.dtsi"
+
+/ {
+	model = "Nothing Phone (4a) Pro";
+	compatible = "nothing,froggerpro", "qcom,eliza";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart13;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <76800000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32764>;
+			#clock-cells = <0>;
+		};
+
+		bi_tcxo_div2: bi-tcxo-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+
+		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
+			compatible = "fixed-factor-clock";
+			#clock-cells = <0>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
+			clock-mult = <1>;
+			clock-div = <2>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&assist_default>, <&volume_up_default>;
+		pinctrl-names = "default";
+
+		key-assist {
+			label = "Assistant";
+			gpios = <&tlmm 34 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_ASSISTANT>;
+		};
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm7550_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+
+	reserved-memory {
+		chipinfo@81cf4000 {
+			reg = <0x0 0x81cf4000 0x0 0x1000>;
+			no-map;
+		};
+
+		ramoops@81f00000 {
+			compatible = "ramoops";
+			reg = <0x0 0x81f00000 0x0 0x300000>;
+			record-size = <0x40000>;
+			console-size = <0x200000>;
+			ecc-size = <16>;
+			no-map;
+		};
+
+		/* Keep the bootloader framebuffer out of Linux memory. */
+		framebuffer@fc800000 {
+			reg = <0x0 0xfc800000 0x0 (1260 * 2800 * 4)>;
+			no-map;
+		};
+	};
+};
+
+&adspslpi_mem {
+	/* Stock firmware reserves 74 MiB for ADSP/SLPI. */
+	reg = <0x0 0x99e00000 0x0 0x4a00000>;
+};
+
+&pm7550_gpios {
+	volume_up_default: volume-up-default-state {
+		pins = "gpio6";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		power-source = <1>;
+		bias-pull-up;
+	};
+};
+
+&pmk8550_gpios {
+	pinctrl-0 = <&pmk8550_sleep_clk_default>;
+	pinctrl-names = "default";
+
+	pmk8550_sleep_clk_default: sleep-clk-default-state {
+		pins = "gpio3";
+		function = PMIC_GPIO_FUNC_FUNC1;
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <0>;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <20 4>,   /* NFC SPI */
+			       <111 2>,  /* WCN UART1 */
+			       <118 1>;  /* NFC Secure I/O */
+
+	assist_default: assist-default-state {
+		pins = "gpio34";
+		function = "gpio";
+		bias-pull-up;
+	};
+};
+
+&uart13 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};
-- 
2.56.0

