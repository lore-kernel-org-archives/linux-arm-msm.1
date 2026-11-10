Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794342354;
	b=JTqigUb/StDgnb4SDr7GzE53L0Afh3pYxQ27B/Kjzc5y/YTgwvBtF0TSqFXu01hJSvP3
	 7KtlnmzVz2Q3vER3ruGe3InmSY9Cj1Y0t6trtj3MydkFrrM0fhQw4AfH16Dy6XSs8AlKx
	 4RNMY3HJm/YWHafx+g3kZ22P7knY6eXFkj5K7ZSEH0fRdc7GJm7eRhdY8rDSELSPpl3vj
	 Lv4lKlceid1X7YpptL3aYtg+/m1rrvOO7wgfKevD2xtsqtvi8s2A7DzfOklDG1P/bWLNN
	 ZMx8rgI6/EBztSwEX+YZXVnE68fqzbu8aRSK/jai+SHD9rXoJCUoICvHs2RigNBi5oQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794342354;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+iDZ35aSiZtYtABYuiyco0+UPI1wekyq8XToKXTRcps=;
	b=D9WUkd8hIFL7C/W83bis2ZrEY6jMXejFsxJ8S2mnQ6LpBkdkD9Qj/8JVJjqW86iumnfh
	 acwVs72+EqLmW7P7sYXoFuRLM+1RQCu29CxNMzPXH0keKyEGL0H7WXxgL+AU03vs2+WSn
	 USYJCLZT9rvs7zR1LQGNImhi9t9qRith+tJMHAqKS0bZo4q1VwnI1g+opQV0rXCVAbrZa
	 3f7Zn5ZlJ/xEKTBjvHJNt6yk0+xocQcKAZIvlPgxg9LqyCReNP2EwE1Us4trmlZFh/19/
	 wcjKXMv4AZKzuMpdPENlxRjTE+I2RwCUDU5TiGkwRawiNZart8sWm/5vnDmaV8mL46Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ak57fYpA;
	arc=none smtp.remote-ip=209.85.161.51
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C27360A3801
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 20:25:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C27360A3801
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ak57fYpA
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-702dedeb70dso1289191eaf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 12:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794342352; x=1794947152; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+iDZ35aSiZtYtABYuiyco0+UPI1wekyq8XToKXTRcps=;
        b=ak57fYpA+NzKZA+GJU56IRIlakmzz5YQuAsTq5In9PHJ72U7cFhOoXMT95aOC7WiB+
         8h/Z0tUAGcYc0ifz5PFLpqN74LnQ1W+XNPGnKg7HO4nX8Tgrr1SCbjjQJJIcwcn87hfg
         UQEFNplgI+/D8Pf7sMcXJCac2AxVm5vnYYUMWLJxPTYGtJedmDTiNXZQ3/Dg16F0KQoa
         9rSdYCL4CH9OIg68JiNFZG5Eu5AEAmUjESj2W4h6IuLilMUl95EzFazcv+Syod/ErTuT
         r3VVqbpDtE2ni9cvTCc5HFHM8uom7VeX3qxmkUvGgrQZz1rACkwdDklq83NF3u61ENM1
         570w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794342352; x=1794947152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+iDZ35aSiZtYtABYuiyco0+UPI1wekyq8XToKXTRcps=;
        b=Bil3+hoA5Wi/V4KJI3qYrwP7ZpVfHfPADH6qx8I4DdvQzV5+H49aCfYWHJjE3qvpIL
         iUAmSacHz7j3k6HMK20nd9Gpt06EdFlM5eLFo26hfYeX0/8Uw9vi29+8Tc8h1QhRrosk
         3GahU6ANgTskqHt0+i+qPr7KfdMcleQwLyxaMwgscWpjG2fSoEdfwO/2smtBYiUchaOO
         byp5RhUUEM3hSi09zXHucNNz94M6n37aoDcWPiysr6zEKNELg+YjlE0pbuTVWvI8F4o0
         8CQ+re5aSnx0rzr6Q0/Ia3yFT7d7vQFOmwoAkA83N4I4RkgbbeQS0M8MC2mTVGnQ4EM2
         G/Nw==
X-Forwarded-Encrypted: i=1; AL+hErFf6j6PZO2nR0WqFo6q/wP97ysxFAXA1U90Y+kwk/o/PuSAp/OCRxnbEbz4K1BqkYAeA54Dx0Qd4Pyi5hCq@vger.kernel.org
X-Gm-Message-State: APuU4Z9ABQpJ18ynoTqDQ5cuk4fCmd80ilAG5c4O6nF/77ZM9ETQAAIs
	FGFPJYgL2Y4EWjxuj/0V6MTtnjUXWhWa5EYLkG81e6VOVng+cyIjJMOl
X-Gm-Gg: AYBFou2cQu3T2XiPmNwUd6gL9N3+lq4aTpZEtVtlkqmsTNlx9xub8u5dEY7lLIlrEeB
	/wLq4gcyhq+REidlhmkjFsgZ3DxHfMFwOVP5hAg/seP4RG2Nl79ceFNtVzd7EVmz03WjYe9O5ug
	2qVrIVLheaxpaxxkw9Hx7LG4ennzejj0ifK9wUwPTeRhGK37rK+smkeNlo2Ez00A+T/3YnOBFTR
	EcOyn4434sqLuHsigI5bWJYcTOej3ouTPmHrZAC94Nm+Vcdt/TGC1R2ycLFWu4uIqj+/yR5zHST
	+8H80fiaGIpvh9p5nHXomEzfJ3rEj8VuPPvS6cXBQozTFEXTgcfu1O3o0g5EAr0/ZEpgBXoYcaO
	Und8W3xVRHaQsgHO0iK790lmbWcgCAfVP+xkwv5WQF4VLRVBO4bx1v8C0HcJwrz0a1HoxDlOuqz
	NqJHQ6/j40bQSK021LbyxFKmfpdFQ1VC8yBcGWRndbxRajLBgH7he86YtQzk6m18402ntmdRlSp
	JDIxlyBu64fz7b6CqD8jncl9nHBiQ6kedcjyp+ySDt3dFcvXAjreC/Yk5wAFCUvvRbijiJQaMmk
	bF8V04l0rswZkUUmOOdY/IoQaYBYlMFqApaXdKB5dv4T5O7dzCLBUQ==
X-Received: by 2002:a05:6820:2214:b0:707:27c7:86d0 with SMTP id 006d021491bc7-719175d0444mr145066eaf.4.1794342351981;
        Tue, 10 Nov 2026 12:25:51 -0800 (PST)
Received: from jeffmr (63-152-14-173.cdrr.qwest.net. [63.152.14.173])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-718a8f645d4sm2353252eaf.5.2026.11.10.12.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 12:25:51 -0800 (PST)
From: Jeff Roach <jeff.roach0@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/2] arm64: dts: qcom: Add HP OmniBook X 16-cp1
Date: Tue, 10 Nov 2026 14:24:45 -0600
Message-ID: <20261110202445.14100-3-jeff.roach0@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261110202445.14100-1-jeff.roach0@gmail.com>
References: <20261110202445.14100-1-jeff.roach0@gmail.com>
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

Add a device tree for the HP OmniBook X 16-cp1 laptop, based on the
Qualcomm Mahua (Snapdragon X2 Elite, 12 cores) SoC.

Supported and tested:
- Keyboard, touchpad and touchscreen over I2C HID
- Lid switch
- NVMe SSD (PCIe 5)
- Qualcomm QCC2072 Wi-Fi (PCIe 4, M.2 key E slot)
- Two USB-C ports with orientation switching, USB PD and battery
  reporting through pmic-glink
- USB-A port (usb_2)
- Webcam on the internal USB 2.0 host
- eDP OLED panel with DP AUX backlight
- DisplayPort alt mode on both USB-C ports
- ADSP and CDSP remoteprocs
- Two speakers (WSA8845) and two digital microphones

The GPU is left disabled until Mahua's Adreno X2-85 is supported.

This device tree was written with the help of an AI coding assistant
(Claude), starting from glymur-hp-elitebook-x-g2q.dts and the laptop's
ACPI tables. The regulator voltages were checked against the power
votes in the ACPI tables, where they are listed. I reviewed it and
tested every feature listed above on the laptop.

Signed-off-by: Jeff Roach <jeff.roach0@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/mahua-hp-omnibook-x16.dts   | 657 ++++++++++++++++++
 2 files changed, 658 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 8329c06b60..e84836e5c5 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -74,6 +74,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= mahua-hp-omnibook-x16.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-qcb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
diff --git a/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts b/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts
new file mode 100644
index 0000000000..1d30dff7d2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/mahua-hp-omnibook-x16.dts
@@ -0,0 +1,657 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ * Copyright (c) 2026 Jeff Roach <jeff.roach0@gmail.com>
+ */
+/dts-v1/;
+
+#include "mahua.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
+
+/ {
+	model = "HP OmniBook X 16-cp1";
+	compatible = "hp,omnibook-x16-cp1", "qcom,mahua";
+	chassis-type = "laptop";
+
+	aliases {
+		i2c0 = &i2c0;
+		i2c4 = &i2c4;
+		i2c8 = &i2c8;
+		serial0 = &uart21;
+		serial1 = &uart14;
+	};
+
+	clocks {
+		xo_board: xo-board {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&lid_default>;
+		pinctrl-names = "default";
+
+		switch-lid {
+			label = "lid";
+			gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+			wakeup-event-action = <EV_ACT_DEASSERTED>;
+		};
+	};
+
+	pmic-glink {
+		compatible = "qcom,glymur-pmic-glink",
+			     "qcom,pmic-glink";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		/* Left rear USB-C port */
+		connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in: endpoint {
+						remote-endpoint = <&usb_0_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_out>;
+					};
+				};
+			};
+		};
+
+		/* Left front USB-C port */
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			power-role = "dual";
+			data-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					pmic_glink_hs_in1: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					pmic_glink_ss_in1: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+
+	sound {
+		compatible = "qcom,glymur-sndcard";
+		model = "HP-OmniBook-X16";
+
+		audio-routing = "SpkrLeft IN", "WSA WSA_SPK1 OUT",
+				"SpkrRight IN", "WSA WSA_SPK2 OUT",
+				"VA DMIC0", "vdd-micb",
+				"VA DMIC1", "vdd-micb";
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai VA_CODEC_DMA_TX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		wsa-dai-link {
+			link-name = "WSA Playback";
+
+			codec {
+				sound-dai = <&left_spkr>, <&right_spkr>,
+					    <&swr0 0>, <&lpass_wsamacro 0>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
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
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 94 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&wcn_sw_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+
+	/* Qualcomm QCC2072 Wi-Fi/Bluetooth module in an M.2 key E slot */
+	wlan-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+		vpcie1v8-supply = <&vreg_l15b0>;
+
+		w-disable1-gpios = <&tlmm 117 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 116 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&wcn_wlan_bt_en>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcie4_port0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart14_ep>;
+				};
+			};
+		};
+	};
+};
+
+&gmu {
+	status = "disabled";
+};
+
+&gpu {
+	status = "disabled";
+};
+
+&i2c0 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	keyboard@3a {
+		compatible = "hid-over-i2c";
+		reg = <0x3a>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&kybd_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c4 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchpad@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&tpad_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+
+		hid-descr-addr = <0x1>;
+		interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
+
+		post-power-on-delay-ms = <200>;
+
+		pinctrl-0 = <&ts0_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+
+	qcom,dmic-sample-rate = <4800000>;
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp1 {
+	status = "okay";
+};
+
+&mdss_dp1_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+};
+
+&mdss_dp3 {
+	/delete-property/ #sound-dai-cells;
+
+	status = "okay";
+
+	aux-bus {
+		panel {
+			compatible = "samsung,atna33xc20";
+			enable-gpios = <&tlmm 18 GPIO_ACTIVE_HIGH>;
+			power-supply = <&vreg_edp_3p3>;
+
+			pinctrl-0 = <&edp_bl_en>;
+			pinctrl-names = "default";
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
+	status = "okay";
+};
+
+&pcie4 {
+	pinctrl-0 = <&pcie4_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie4_phy {
+	status = "okay";
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie4_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
+&pcie5 {
+	pinctrl-0 = <&pcie5_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie5_phy {
+	status = "okay";
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+};
+
+&pmk8850_rtc {
+	qcom,no-alarm;
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/glymur/hp/omnibook-x16/qcadsp8480.mbn",
+			"qcom/glymur/hp/omnibook-x16/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/glymur/hp/omnibook-x16/qccdsp8480.mbn",
+			"qcom/glymur/hp/omnibook-x16/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&swr0 {
+	status = "okay";
+
+	/* WSA8845, left speaker */
+	left_spkr: speaker@0,0 {
+		compatible = "sdw20217020400";
+		reg = <0 0>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrLeft";
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		qcom,port-mapping = <1 2 3 7 12 14>;
+	};
+
+	/* WSA8845, right speaker */
+	right_spkr: speaker@0,1 {
+		compatible = "sdw20217020400";
+		reg = <0 1>;
+		reset-gpios = <&lpass_tlmm 12 GPIO_ACTIVE_LOW>;
+		#sound-dai-cells = <0>;
+		sound-name-prefix = "SpkrRight";
+		vdd-1p8-supply = <&vreg_l15b0>;
+		vdd-io-supply = <&vreg_l18b0>;
+		qcom,port-mapping = <4 5 6 7 13 15>;
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <4 4>, /* EC TZ Secure I3C */
+			       <10 2>, /* OOB UART */
+			       <44 4>, /* Security SPI (TPM) */
+			       <65 1>; /* EC reset */
+
+	tpad_default: tpad-default-state {
+		pins = "gpio3";
+		function = "gpio";
+		bias-disable;
+	};
+
+	edp_bl_en: edp-bl-en-state {
+		pins = "gpio18";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	ts0_default: ts0-default-state {
+		pins = "gpio51";
+		function = "gpio";
+		bias-disable;
+	};
+
+	kybd_default: kybd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		bias-disable;
+	};
+
+	edp_reg_en: edp-reg-en-state {
+		pins = "gpio70";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	lid_default: lid-default-state {
+		pins = "gpio92";
+		function = "gpio";
+		bias-disable;
+	};
+
+	wcn_sw_en: wcn-sw-en-state {
+		pins = "gpio94";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
+		pins = "gpio116", "gpio117";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie4_default: pcie4-default-state {
+		clkreq-n-pins {
+			pins = "gpio147";
+			function = "pcie4_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio148";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
+	pcie5_default: pcie5-default-state {
+		clkreq-n-pins {
+			pins = "gpio153";
+			function = "pcie5_clk_req_n";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio152";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio154";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart14 {
+	status = "okay";
+
+	port {
+		uart14_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&usb_0 {
+	status = "okay";
+};
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
+&usb_0_hsphy {
+	phys = <&smb2370_j_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_0_qmpphy {
+	status = "okay";
+};
+
+&usb_0_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pmic_glink_hs_in1>;
+};
+
+&usb_1_hsphy {
+	phys = <&smb2370_k_e2_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+};
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pmic_glink_ss_in1>;
+};
+
+/* USB-A port on the right side */
+&usb_2 {
+	dr_mode = "host";
+
+	/delete-property/ usb-role-switch;
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	status = "okay";
+};
+
+&usb_2_qmpphy {
+	refgen-supply = <&vreg_l1c1>;
+
+	/delete-property/ mode-switch;
+	/delete-property/ orientation-switch;
+
+	status = "okay";
+
+	ports {
+		port@0 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			/delete-node/ endpoint;
+
+			usb_2_qmpphy_out_usb: endpoint@1 {
+				reg = <1>;
+
+				data-lanes = <1 0>;
+			};
+		};
+	};
+};
+
+/* Internal USB 2.0 host for the webcam */
+&usb_hs {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	status = "okay";
+};
-- 
2.55.0

