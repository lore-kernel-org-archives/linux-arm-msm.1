Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160045;
	b=WJUyYGyrOp8gw5qTG9q7oCRRi2tqJZ19u6Pz5/8mZTNJLxE5csTkUlpXSdK3d0wNuzl2
	 oGYFFqbn5LDFb/RTRq1Gj2C4afMA1Ax2fCsggMB3y1bENhzHQyyqxPgA05hJ5utzrQ3sF
	 Xz5tc/9coV7vdICJ4D4ZVF+nnQyJ7oIe08gr2iT4ITLV4klhSD1PRN9p3V53q2j/b2NJY
	 WEcYwQLknH5gOEAZdpCwmbA+XFmyYtb3L0brP7eAv0+rAknqQn9kcM18MDRXhPWNdiChq
	 6gVhnnpExJ6dZVBnkVY42GA9LnwAh72do+263rLnz1bdi8fK607vKGzzh1H9uBMo9Og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160045;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=oxj5/8ZVuVe+zapf44BocB1MooTS6kcqmBXhurZCUnQ=;
	b=iF/Vxtrl73Af/8qiWIjsuff1O/IWhI1p4gi3kbQ2BmT2JA1nkOBUPhphvLx6GZM/eAcM
	 kIgNWdrVHALTzpZ8mEp4x5c1O+e589ehiAWwGqSWhDly3Hsiu8v6FMwCbvupSJrQ2Qvhr
	 8lGcP8fQ8qjsWuS05cSBMu/1cfOvinju9eZAMfYdYdyRcJVUDWeF4G10par3HUNPvJTR4
	 rt8Hr/zach5E2J+O7zy/mDfJIH3SFkPSGMkMW05xW4Dk6KhvSjrM/4xGItUEsYcUXzbWd
	 yeFhYjKf3ICMOKehtV40jpcSPTlSVc1FyascmXoeh1woAYCD4e4sy5l6edFlZ2se58w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PfmPFv3H;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23DE860A2634
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23DE860A2634
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PfmPFv3H
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb61185057so3958395e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160042; x=1795764842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oxj5/8ZVuVe+zapf44BocB1MooTS6kcqmBXhurZCUnQ=;
        b=PfmPFv3HXdp7VsUmrNKbNdwm0iMqPSHD0xZ12hwpviWS+y9vaa9B0wosNYgoP/oK4L
         HuQf54XhM0TmBrRz9IBzYiV7Whz7P3ePEcvj5tlbu4AO+I6CBen/CN4R0ffibFS5VMvB
         g/7ds2VvxbuaaTyfb7gVMMzMZtKuAJ/qDOGawnnIgEsdy9Q8LZGYljzwYdAixFpzLum5
         nV5e75oo/XZDHZ2uvhngQ30l4Svge8dEdcDAqctxIsOlWESBkQ5m6TIDhV/H6phwcDPQ
         c23E2/qJTWarOvbhdXrFgTjM2E1Jx4Vd9c2lzo0Z+c7d8VL9nsu/yqvGUsYf3IX9EKzg
         tpgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160042; x=1795764842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oxj5/8ZVuVe+zapf44BocB1MooTS6kcqmBXhurZCUnQ=;
        b=XqT1zVdrL4nXHL0lrJtWKok/Jxc/lLjgDEzWzlO11J8CmQ4+mjj7eq/7qlifItOwFg
         GpVOiIXhdrH4XIvlem7eMFsZNAWCbGcF+m7qz/Hs0ipfDElpJoqg2H91dqNSFEEmiwny
         bIpyRlPoKVHO0mbMPV0TUyRlWQsohxJSS4kylbzoMTCRppkOZUPy8UAYQF64134FpMYE
         M7wdaBoqTWV936p8xoxyYS2V/QA9Fn4fgxVudwgsUMPAs2F+lAL7GgBeFF5KaVZx4Afy
         PpDbSrHUK97y0epGzGvPVE2cs5Ddj72ODYMNiZGfcVGg6k5KLUcejcgI4xm4ZfCopy44
         ObVQ==
X-Gm-Message-State: APuU4Z9e6KK3VtQuMfj/Kiuz36yc8Q7v1YFFbZp7cmCIxg9O+vhkN+F0
	y9caDqqt38J0JB0XUil/qJym8FXRUmu+DXSah5gq5wKYdyfYQF59ndNszBX4/25prDs=
X-Gm-Gg: AYBFou29ZOumx6LMoowLl9yJxLLdnWwGOf4fX5WcG5TQlM7fWvsiHSsfPeGuTw+GyXB
	mI9NmW6Its0z++qrgDDzw3iazm+C6CkTKReFbli0xd1EWs2r00A5mi/JFJdwvmeo973pA4JAI98
	gFszlCSJc/erJoY7vM5sz7KK3kOu5ccW/6xXWU+Iuy0ph2S0n2nI0eZVeBtK8ho7rgzVLpZwQ1C
	y1LDYjXAcpx6SCKTUM/q3sb5yhpqGsS3FdZI3aAERMf52CB0wZc2FX9eNMw3J/aEmJfc+L9AwUO
	cbjoNACJT+pga9VudZ9b/S5Wuw6xhXkwy1RQLCKTg4Y39qy2o1VLlkta81XiyCOF/QujvTKnXUP
	MmTBSouAMlRy40RO+luGnuIAyH7fFuFZkotXo8YU8vOTxmaUV3BMtCrVYiZqwWiQb4aoGrctQrs
	fKAErlQ5wzDgWsft3KUBAWqK1CGDFVaPPUns8ozm5NO9HyfAch76JUSzLPiQad90QTpKiO/nN3Y
	qu33dqaRHI704UPmbLGhRjQY6oSB/rOk/Tisdl1Bw+GARB7QBuRq2I2C6no5LanEuS46VdECJPn
	ePNuhFWqIxEYzqbrqfFAPYnWXUyviG+nMSJ0/oTTTYPiEycdLfJmPkRyFEd28z0BJBW90ORFfyi
	E
X-Received: by 2002:a05:600c:820e:b0:4b4:262b:88a2 with SMTP id 5b1f17b1804b1-4bb887c9f5cmr52010915e9.1.1795160042276;
        Thu, 19 Nov 2026 23:34:02 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:01 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 02/10] arm64: dts: qcom: add LG V60 ThinQ 5G (timelm) support
Date: Fri, 20 Nov 2026 08:33:50 +0100
Message-Id: <20261120073358.10267-3-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

Add initial device tree and MAINTAINERS entry for the LG V60 ThinQ 5G
(timelm), an SM8250-based smartphone released in 2020.

The initial description enables:
- Memory reservations for bootloader and firmware log regions
- Simple framebuffer continuous splash reservation
- Volume Down and Assistant keys via PM8150 GPIOs
- Volume Up key via PM8150 RESIN
- RPMh power supplies across PM8150, PM8150L, and PM8009
- Storage via UFS 3.0 and SD card via SDHC2 with pinctrl states
- Graphics via Adreno 650 GPU with GMU and ZAP shader firmware
- High-Speed USB and SuperSpeed QMP PHY
- Console output on GENI UART12

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 MAINTAINERS                                   |   6 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 592 ++++++++++++++++++
 3 files changed, 599 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9f..80c1bfb66f8cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,12 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG V60 THINQ 5G (TIMELM) SUPPORT
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	arch/arm64/boot/dts/qcom/sm8250-lg-timelm*
+
 LG2160 MEDIA DRIVER
 M:	Michael Krufky <mkrufky@linuxtv.org>
 L:	linux-media@vger.kernel.org
diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea9..84ed4bf513960 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -409,6 +409,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-bahamut.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-sony-xperia-kumano-griffin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-lg-timelm.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-r8q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-samsung-x1q.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
new file mode 100644
index 0000000000000..20aaf70355158
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -0,0 +1,592 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Abdur Rofik <rofikcoga@gmail.com>
+ * Device Tree for LG V60 ThinQ 5G (timelm / LM-V600)
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sm8250.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+
+/ {
+	model = "LG V60 ThinQ 5G";
+	compatible = "lg,timelm", "qcom,sm8250";
+	chassis-type = "handset";
+
+	aliases {
+		serial0 = &uart12;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer@9c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x9c000000 0x0 (1080 * 2460 * 4)>;
+			width = <1080>;
+			height = <2460>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&volume_down_state>, <&assist_state>;
+
+		key-vol-down {
+			label = "Volume Down";
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+
+		key-assistant {
+			label = "Assistant";
+			gpios = <&pm8150_gpios 1 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_ASSISTANT>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+
+	reserved-memory {
+		res_xbl_uefi_log_region: memory@80880000 {
+			reg = <0x0 0x80880000 0x0 0x14000>;
+			no-map;
+		};
+
+		memory@9c000000 {
+			reg = <0x0 0x9c000000 0x0 0x1200000>;
+			no-map;
+		};
+
+		dfps_data_mem: memory@9e300000 {
+			reg = <0x0 0x9e300000 0x0 0x100000>;
+			no-map;
+		};
+
+		ramoops: ramoops@b0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xb0000000 0x0 0x280000>;
+			record-size = <0x40000>;
+			console-size = <0x40000>;
+			ftrace-size = <0x40000>;
+			pmsg-size = <0x100000>;
+			no-map;
+		};
+	};
+
+	vreg_s6c_0p88: smpc6-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s6c_0p88";
+		regulator-min-microvolt = <880000>;
+		regulator-max-microvolt = <880000>;
+		regulator-always-on;
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8150-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-l1-l8-l11-supply = <&vreg_s6c_0p88>;
+		vdd-l2-l10-supply = <&vreg_bob>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p95>;
+		vdd-l6-l9-supply = <&vreg_s8c_1p35>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_1p9>;
+		vdd-l13-l16-l17-supply = <&vreg_bob>;
+
+		vreg_s4a_1p8: smps4 {
+			regulator-name = "vreg_s4a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a_1p9: smps5 {
+			regulator-name = "vreg_s5a_1p9";
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6a_0p95: smps6 {
+			regulator-name = "vreg_s6a_0p95";
+			regulator-min-microvolt = <950000>;
+			regulator-max-microvolt = <1128000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1a_0p88: ldo1 {
+			regulator-name = "vreg_l1a_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2a_3p1: ldo2 {
+			regulator-name = "vreg_l2a_3p1";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_0p8: ldo3 {
+			regulator-name = "vreg_l3a_0p8";
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5a_0p88: ldo5 {
+			regulator-name = "vreg_l5a_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-name = "vreg_l6a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p7: ldo7 {
+			regulator-name = "vreg_l7a_1p7";
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9a_1p2: ldo9 {
+			regulator-name = "vreg_l9a_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a_1p8: ldo10 {
+			regulator-name = "vreg_l10a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l12a_1p8: ldo12 {
+			regulator-name = "vreg_l12a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_ts: ldo13 {
+			regulator-name = "vreg_l13a_ts";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-name = "vreg_l14a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+			regulator-name = "vreg_l15a_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a_2p7: ldo16 {
+			regulator-name = "vreg_l16a_2p7";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_3p0: ldo17 {
+			regulator-name = "vreg_l17a_3p0";
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-allow-set-load;
+			regulator-allowed-modes = <RPMH_REGULATOR_MODE_LPM
+						   RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_0p9: ldo18 {
+			regulator-name = "vreg_l18a_0p9";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-l1-l8-supply = <&vreg_s4a_1p8>;
+		vdd-l2-l3-supply = <&vreg_s8c_1p35>;
+		vdd-l4-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-l11-supply = <&vreg_bob>;
+		vdd-l9-l10-supply = <&vreg_bob>;
+		vdd-bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-name = "vreg_bob";
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <4000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
+		vreg_s8c_1p35: smps8 {
+			regulator-name = "vreg_s8c_1p35";
+			regulator-min-microvolt = <1350000>;
+			regulator-max-microvolt = <1400000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-name = "vreg_l1c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2c_1p2: ldo2 {
+			regulator-name = "vreg_l2c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3c_1p2: ldo3 {
+			regulator-name = "vreg_l3c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l4c_1p7: ldo4 {
+			regulator-name = "vreg_l4c_1p7";
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5c_1p8: ldo5 {
+			regulator-name = "vreg_l5c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6c_2p9: ldo6 {
+			regulator-name = "vreg_l6c_2p9";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_2p85: ldo7 {
+			regulator-name = "vreg_l7c_2p85";
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-name = "vreg_l8c_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p9: ldo9 {
+			regulator-name = "vreg_l9c_2p9";
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-name = "vreg_l10c_3p3";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p0: ldo11 {
+			regulator-name = "vreg_l11c_3p0";
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8009-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vreg_bob>;
+		vdd-l2-supply = <&vreg_s8c_1p35>;
+		vdd-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_s4a_1p8>;
+
+		vreg_s1f_1p2: smps1 {
+			regulator-name = "vreg_s1f_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s2f_0p5: smps2 {
+			regulator-name = "vreg_s2f_0p5";
+			regulator-min-microvolt = <512000>;
+			regulator-max-microvolt = <1100000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l2f_1p3: ldo2 {
+			regulator-name = "vreg_l2f_1p3";
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5f_2p8: ldo5 {
+			regulator-name = "vreg_l5f_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6f_2p8: ldo6 {
+			regulator-name = "vreg_l6f_2p8";
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7f_1p8: ldo7 {
+			regulator-name = "vreg_l7f_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&cdsp {
+	firmware-name = "qcom/sm8250/LG/timelm/cdsp.mbn";
+	status = "okay";
+};
+
+&gmu {
+	status = "okay";
+};
+
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpi_dma2 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
+};
+
+&pm8150_gpios {
+	assist_state: assist-state {
+		pins = "gpio1";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+
+	volume_down_state: volume-down-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEUP>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&qupv3_id_2 {
+	status = "okay";
+};
+
+&sdhc_2 {
+	status = "okay";
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_default_state>, <&sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep_state>, <&sdc2_card_det_n>;
+
+	cd-gpios = <&tlmm 77 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vreg_l9c_2p9>;
+	vqmmc-supply = <&vreg_l6c_2p9>;
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+};
+
+&tlmm {
+	gpio-reserved-ranges = <40 4>, <52 4>;
+
+	sdc2_default_state: sdc2-default-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio77";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&uart12 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	vcc-supply = <&vreg_l17a_3p0>;
+	vcc-max-microamp = <800000>;
+	vccq-supply = <&vreg_l6a_1p2>;
+	vccq-max-microamp = <800000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <800000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l5a_0p88>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l5a_0p88>;
+	vdda18-supply = <&vreg_l12a_1p8>;
+	vdda33-supply = <&vreg_l2a_3p1>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l18a_0p9>;
+	vdda-pll-supply = <&vreg_l9a_1p2>;
+};
-- 
2.39.5

