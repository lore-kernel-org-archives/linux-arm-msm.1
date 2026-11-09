Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184502;
	b=MTRhRvUkY7otv7G8AJQRnKw6YjSNDgFMGHrP5Azohak/TwdRKaEmhUFrsEMA/PfD4VmM
	 9COfbbMxZpwbRpeCwhICmBxS/1YSToQWKw8CYan0SjFDkjQDrp/1HUYU7S4qJBVMdPxYz
	 GYDDoOyLO+G6GeJ/HC3nvpEp36EB6WoIxRyS1PPCM4ygEAwk27alf9Dn9WaZCTrT8xCv+
	 HIMYfAMi2a7/CsNKWzUSAvX6NwvoLnRhyhHBn9boUNPYyH1kAACCuOJbCuHab2eJ7LJ0C
	 haygauHC1j5kQOpm4yGYR+HWYq8TDqoCXqAAkp2Vltmeu6LSofDC3Ab+sXWsfRDoJdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=D2sogilGhixAwSVKv2/1vVAMIjVLbZglsGwhA4tnyNM=;
	b=JT0E2ayOfVZdGPzD7nMcSyPf9AqlYlNelF8ZqWavFViq7bPYzX7HE0imwe/tmhCDDyUW
	 FHF+sqXapESHFOWWeiYvA68E8BmOm25nmPH0/NFOmrkMkQdgWcajC9/0cFbvoSDnlMz5X
	 F7iArhMLJBnz2ikepytQXo+rOMvQj9qUoul/yP2+JYkThRirr58ZEJJijw4RV8QGu88EJ
	 j/fNWqTszqz61o//ArevXLqzEobh5rnFwFjPspSuLGdeVTPQeA0LUZWPPVzzuo2VIBRAx
	 RGpFaXF+RB14GvT6zucV8rY2wmW+0Xz9obtRVTYg2B8SFvP0sflqByv0UVSVg4YqiFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="R1U/C/tA";
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B370A6082BFD
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:35:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B370A6082BFD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1U/C/tA
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4afe2d546f9so5220105e9.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:35:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184500; x=1794789300; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D2sogilGhixAwSVKv2/1vVAMIjVLbZglsGwhA4tnyNM=;
        b=R1U/C/tAkz4tppeGzCF0InWU0EbB+SPNwOYInvAbX5NiFpL/rkfI8iTinnWVJ6Na3p
         femmzgyKHjCfEds8/mujKodEYblhYJKRk7mCH4uDJ+OS5TxB8zD3rJFP5Qus1N2t0fEq
         nZvU3sdgt2Y6uZlPnRSyktf3lQ/FugWoeM+u8ODiyMZTmyUHG99LiMm6LgsrtPzTI22C
         jl1BfsB3yG0eMgaJ+VN9Mgna6pIWE5puxrYUt2+iyCGF85PWbc/RAqkIrUmH0ov9hTVs
         jf0uePbTom0WtghbQLO+uFuqFzkwdCaRhcuaWVli/icEBOiUczfVysKI8Pu2M1pZN/LI
         UKkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184500; x=1794789300;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D2sogilGhixAwSVKv2/1vVAMIjVLbZglsGwhA4tnyNM=;
        b=aSgo3qWiEIPKuySLooriWnxkmAa6ATJS8kIdGutCHpBbs7eVKrUBRHzG57mkH3sn/c
         vkbJMWdeI/HVyqlPIzVKaPOChYe1zeUExFUqTXtg4HE/boiuF446W/uWVhgzQXX1wNwX
         i8BNv5oMG/aSLUIHAMGlb5yBk6JH1KJLbBEof9Cu9jqCiJmfvLzsbq74RNKArYEMkueA
         9oo/pJx1LmAOxl7nV5A1YGf03nDul769J/MOKMUKNXmCYIVlARCuGRTtZAySESHFpXqV
         TjghRZnSfweSOg5lxa6rqTAVoG4TPlaVB4+8/YgtYDTljmWwxc8onh4+ZsfPt9l1COPq
         Y8lw==
X-Gm-Message-State: APuU4Z8cvK2lHPPiFRVC6ESBV9cX5L9Hf+xTlg+lhimNY8e4LyCDHsTP
	USOXynnZR+scim+KzSVOPXM5q3nfnVocqtCLF1Gfnd0aH//3e+QkmfZ3
X-Gm-Gg: AYBFou36Z8GMyYWcy9uYYTOWQPdSOVhaFL4CDvhYNc/0iKiKl8tnlcOVct3HImQe7C5
	ImKc+IGI2sVALVhSmMud4JeBTQJTL3ANpgVJfT2fReLApDDlzUb9CJrE4e2hChkyjcja7uhy98B
	q7oeZ84CutIevUU3R0dVGyyn2JeDtNJUQmLw6dJd0iEIIfQRswmY3EkNtd9QJfxPMXoLD48L/7E
	Pk667BDnTmYZRb/Gtz3/dJslCXEtrzznosD0rqxUeXgmYhPX4HIXj1OGub9Pvec6quKRgAOwmxS
	tv0iKcKEU2YgL3xmyWLgjgQw9tGqEAOQy/gflkPYc+ybhVlTWouZhUzeWZVeXsxT4y4H0rAtqvc
	po7Je2ePUZdnYRyQUmyP7qYqJfE+Jyrs9/ySXfy4N0ydPoRH2ZLtF8uDZmdCl+RIeqlVB6y5I1a
	+vX8FIYxOeWyIuK7IfdL3bUI1bCaX0cO8qxbrq6eDbX4r2Y3mUPLn9kWDCGZiNJWngSWBIRF3mB
	yqKEqsKEm/lS1gm2uqTJobm1U94SDkvDUXUag1diEkmQuyxp4oFLE/z4GmjfM+fEd3jZE+DRlTQ
	YF2rgrNLos8YZJWxumo0BwK/Ey02v51ShrnrWI9nW33kE/1IOWAdNI8Fi2fPYQ==
X-Received: by 2002:a05:6000:3c5:b0:48f:bc59:ab9c with SMTP id ffacd0b85a97d-4958a016012mr4828443f8f.12.1794184500086;
        Sun, 08 Nov 2026 16:35:00 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49592f39c8asm6541675f8f.7.2026.11.08.16.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:34:59 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:33:29 +0000
Subject: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
In-Reply-To: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Lee Jones <lee@kernel.org>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Wesley Cheng <wesley.cheng@oss.qualcomm.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 "David S. Miller" <davem@davemloft.net>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
 Thara Gopinath <thara.gopinath@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Georgi Djakov <djakov@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, mfd@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-usb@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org, 
 linux-pm@vger.kernel.org, Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184395; l=6303;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=y/EGwYn3OegTfhhAjBy+BLZpt3BRFT7nLk8y0rwM1aY=;
 b=EE2CuyxFeLuYILxYnmzMMdJ4b5InIwlCkrb2hmAyL/+yARRcMgXdQkt+X5f7DHL9c+XlBgutf
 q9ou3vk8AH9CoMawi2MR2HIclr81ueelPElGnbbQLMdTKbKv+sDtkGS
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Add the device tree for the Samsung Galaxy XR headset, which is based on
the Qualcomm Halliday SoC (SXR2250P).

Supported so far: the PMICs and their regulators, the power and volume
down keys, USB in high-speed peripheral mode and UFS storage.

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/halliday-samsung-xrvst2.dts      | 218 +++++++++++++++++++++
 2 files changed, 219 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..1a2638503f64 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -22,6 +22,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= glymur-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-hp-elitebook-x-g2q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= glymur-qcb.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= halliday-samsung-xrvst2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-advantech-som-db5830.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts b/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts
new file mode 100644
index 000000000000..6fcc1aaafd59
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/halliday-samsung-xrvst2.dts
@@ -0,0 +1,218 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, Stanislav Aleksandrov <lightofmysoul@gmail.com>
+ */
+
+/dts-v1/;
+
+#define PMK8550VE_SID 5
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+
+#include "halliday.dtsi"
+#include "pm7550.dtsi"
+#include "pm8550ve.dtsi"
+#include "pm8550vs.dtsi"
+#include "pmk8550.dtsi"
+
+/delete-node/ &adsp_mem;
+/delete-node/ &cdsp_mem;
+/delete-node/ &video_mem;
+
+/ {
+	model = "Samsung Galaxy XR";
+	compatible = "samsung,xrvst2", "qcom,halliday";
+	chassis-type = "headset";
+
+	reserved-memory {
+		video_mem: video-region@87c00000 {
+			reg = <0x0 0x87c00000 0x0 0x700000>;
+			no-map;
+		};
+
+		adsp_mem: adsp-region@88300000 {
+			reg = <0x0 0x88300000 0x0 0x3400000>;
+			no-map;
+		};
+
+		cdsp_mem: cdsp-region@8b700000 {
+			reg = <0x0 0x8b700000 0x0 0xf00000>;
+			no-map;
+		};
+
+		sec_xbl_ramdump_mem: sec-xbl-ramdump-region@a7d00000 {
+			reg = <0x0 0xa7d00000 0x0 0x300000>;
+			no-map;
+		};
+
+		uh_heap_mem: uh-heap-region@b0200000 {
+			reg = <0x0 0xb0200000 0x0 0x40000>;
+			no-map;
+		};
+
+		uh_guest_mem: uh-guest-region@b1000000 {
+			reg = <0x0 0xb1000000 0x0 0x1e00000>;
+			no-map;
+		};
+
+		splash_mem: splash-region@bfc00000 {
+			reg = <0x0 0xbfc00000 0x0 0x7e90000>;
+			no-map;
+		};
+
+		sec_debug_pool_mem: sec-debug-pool-region@800100000 {
+			reg = <0x8 0x00100000 0x0 0xff000>;
+			no-map;
+		};
+
+		sec_debug_log_mem: sec-debug-log-region@8001ff000 {
+			reg = <0x8 0x001ff000 0x0 0x901000>;
+			no-map;
+		};
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm7550-rpmh-regulators";
+		qcom,pmic-id = "b";
+
+		vreg_l1b_0p912: ldo1 {
+			regulator-name = "vreg_l1b_0p912";
+			regulator-min-microvolt = <912000>;
+			regulator-max-microvolt = <912000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3b_1p2: ldo3 {
+			regulator-name = "vreg_l3b_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10b_1p8: ldo10 {
+			regulator-name = "vreg_l10b_1p8";
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13b_2p504: ldo13 {
+			regulator-name = "vreg_l13b_2p504";
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2504000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15b_3p072: ldo15 {
+			regulator-name = "vreg_l15b_3p072";
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vreg_l2c_1p2: ldo2 {
+			regulator-name = "vreg_l2c_1p2";
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-2 {
+		compatible = "qcom,pm8550vs-rpmh-regulators";
+		qcom,pmic-id = "d";
+
+		vreg_l1d_0p88: ldo1 {
+			regulator-name = "vreg_l1d_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	regulators-3 {
+		compatible = "qcom,pm8550ve-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vreg_l2f_0p88: ldo2 {
+			regulator-name = "vreg_l2f_0p88";
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+};
+
+&gcc {
+	vdda-refgen-0p9-supply = <&vreg_l2f_0p88>;
+	vdda-refgen-1p2-supply = <&vreg_l2c_1p2>;
+};
+
+&pm8550vs_c {
+	status = "okay";
+};
+
+&pm8550vs_d {
+	status = "okay";
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
+&sleep_clk {
+	clock-frequency = <32764>;
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 224 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l13b_2p504>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l3b_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l2f_0p88>;
+	vdda-pll-supply = <&vreg_l2c_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+	maximum-speed = "high-speed";
+	qcom,select-utmi-as-pipe-clk;
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdda-pll-supply = <&vreg_l1d_0p88>;
+	vdda18-supply = <&vreg_l10b_1p8>;
+	vdda33-supply = <&vreg_l15b_3p072>;
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <76800000>;
+};

-- 
2.55.0

