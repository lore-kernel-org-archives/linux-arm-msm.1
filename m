Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792668983;
	b=b1CG+vhUJ76pY1K7KPjDZ2GCUafpzUSzMx7qag64kqybV/Dk8zNIk16VQmwgMvAXOcuD
	 bTmaiPKQyXQkBEQhsGMrBmvu7yPg7Q3ipcuB4O9WAxIM7fTwUxbcAkUqNAn9oeS2VXjRH
	 /k/eKgzCxzOth3o8+/5+D/pDwFQZseB05Zin8RHefAZKnePXKB8SRLMYxba7UtSOLrgHA
	 oI3SgzUQndpQJ06R80PhOVUXp8VKCABV6QJDMtPMdnLq+BThFjhvruVryI9qOIYwC3NWR
	 l5trD1DpIvdV7quw9LM9sbys2P82p+OHEV0z4mLXLJSioQAz/QKukZxn+S9ksFpuXeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792668983;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:
	 X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=c2XKTBS6gdDBkInRErDlMVpSWZwm1gM7P58uZh0+N6I=;
	b=uyBR2JCpiw5yHYWd9mY8nfaG1h1MjvM5nHFY0PXa3DOAhjhWDbR2Gdrc+7l6IMaRPo4W
	 DDq9qQ8gGr9CrzYswx+YnplgkpoEBZT6QZRSM2vR4J5w1gg7FSRF6Pcp5231ijted46Ye
	 kUYYr0ep6sOXugUGg6He0FPd1Tn9du52RQHB0XuZm/028hX1/6li444AytQJ2/o4NuAXW
	 Z3ddTFgPeW4S4FYrYaAe2bdWBarLz8ytroM0F+0u78xHtqi+c01VnocfxLYbTEkp1IS/J
	 rKS+KL2uWuffw9q5sWa5tp4ZcROk835m7hjf+7dG/yrI3D/mBBwy0GzWr38R73bogNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bv6W26RE;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4EE1606A319
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 11:36:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E4EE1606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bv6W26RE
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ac451e128cso1151538a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 04:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792668982; x=1793273782; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c2XKTBS6gdDBkInRErDlMVpSWZwm1gM7P58uZh0+N6I=;
        b=Bv6W26REB3bZSaNSDwd68P0vz/B2Nw5MsndopysmCOdTiCbgZ+YXM5DaApk2YwbH6s
         PjvVe5mzkRHZp9CEKR3/Iu6H4i1wSyZnDULKQtwy/A6wz/sa9MZyg2Ek+qx7jDGD1SCN
         KNev9W1JkD9n2yiH6xiIjwTdtPzSn+qqBPPp7ZF29guEVfqJehFj4kr8QbNBxVrAWV3D
         k8ufJw0SpIdkx5KzuQjDWVACFGops7UBDgQ3r3Uff8shW2aGxDj4H5xH0mwb9z0i9AFY
         GuTKB1T524JwGGmXpXXb+3ivH+RWqc2a4Xx/ubueffeu80nTC8WJ9TNwxx9BQmic1hBT
         HwQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792668982; x=1793273782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c2XKTBS6gdDBkInRErDlMVpSWZwm1gM7P58uZh0+N6I=;
        b=vYvxtFv3Cnl+NI3sTiiZd1aT/0ek4XutWpQeKajb51sMZZaZt6qEXcDP1n9NediTGT
         MbGdrg4VLVp0zigV31/fTMxlpxFILhLdTTld/mGeFc/6gi5Z9TNnzsUKKWG1J+NZ9pMF
         +vMmKSvfEfky89pYVDKFRVNWxOP+BpMdrpwsmA4tlcG0peAcZaL01PQ/Z68dNNDg9X34
         KnjDAAGFd6JTgQnEsTsO2FYZDPrlhzdKI4vPtL8WXibge/g3A8YdJ3oBNFQQ3YnTqC/u
         Gbe2S2BLg/kzCbu1JEYNe75ztnavDHLg9mynJSZ2ak0V0ovCpeTFliJF0iYJuDh4VZKk
         kkNQ==
X-Gm-Message-State: AFq9FYKZnDDP3Gp8X+ZUQiYJfs2LTRADifk/wN/UZwuXqbYBMM5hb2qH
	MbxW7HX393JduP4HIX1M+u3fYL39NLpeRVxoFPWnbWI8ITMxSzZPo013
X-Gm-Gg: AYBFou2sL/yRcaHxcJ1I5twtKzayo4pQ0QOdhqAJfBUpdLKJvj/d+4rydHIvpHl6Mzt
	XDzE2fsdEmiWyh7vJwhvtAz+cSbWx2XXNvxaWWjkJkscrzOarxVm0phWgXwrScFknZZNZ9/5dwU
	qpZwBrgx39ipaROj/i389qO03t7wOcpijuYQb6WaZhmpXmtULkz5Ky6MFJFo+w8+CQQU1iq1fF2
	z/AsSo5hPmpYPA9vxuKiKc89pdaZuNxqn4ct+ShmpzqwtXla3pCyt5ziD4CjkgqHQTfeVPJZHQ8
	TSeT/SL5SCFr/zNFucPI0CShSdZ55grGc9AN34MKP/iwMv6O4jVZBBbTxf0Fk5baP45cWLNEKwY
	J1otjdARmsZI5nH1YXoGj4Bc7zfGtD24o8dKjuPrjWAb9efNtNbJ/TY17NYGcrzC3pHL9Y6rD/d
	H4Q/JRxO+UnxtSOWepCYvQJkPL/8+WnWh1XYQgbAWIk9aiOO2I8jfduZZVPIa64+OPZKxug/2CA
	asUkpkX7mBbTomvFOoB6Ci4ld13o8zKSwxADGlSXf+eoEsvnRg7+nJ1y2cEfVvuQx+YQhd3xg==
X-Received: by 2002:a17:90a:e7c8:b0:3ab:d45c:59e2 with SMTP id 98e67ed59e1d1-3ad86f1b28fmr3795056a91.55.1792668982160;
        Thu, 22 Oct 2026 04:36:22 -0700 (PDT)
Received: from localhost.localdomain ([218.194.41.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ada490e5edsm3997668a91.8.2026.10.22.04.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 04:36:21 -0700 (PDT)
From: ShiTou Hong <redstone.dcity@gmail.com>
X-Google-Original-From: ShiTou Hong <dc_redstone@outlook.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	redstonee <1516235445@qq.com>,
	ShiTou Hong <dc_redstone@outlook.com>
Subject: [PATCH 5/6] arm64: dts: qcom: sm8250-hdk: Add the QCA6390 NIC
Date: Thu, 22 Oct 2026 19:36:00 +0800
Message-ID: <20261022113601.2320940-5-dc_redstone@outlook.com>
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

The sm8250-hdk has a QCA6390 WiFi/BT module.

This commit enables the UART port of BT; adds the QCA6390 PMU node,
the wifi node of pcieport0, the missing regulator of PM8009
which is used by QCA6390, the pinctrl of QCA6390 enable pins.

Signed-off-by: ShiTou Hong <dc_redstone@outlook.com>
---
 arch/arm64/boot/dts/qcom/sm8250-hdk.dts | 125 ++++++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
index 77273b6c2..eb899c92f 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-hdk.dts
@@ -32,6 +32,13 @@ vph_pwr: vph-pwr-regulator {
 		regulator-max-microvolt = <3700000>;
 	};
 
+	vreg_3p3: vreg-3p3-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
 	vreg_s4a_1p8: pm8150-s4 {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg_s4a_1p8";
@@ -87,6 +94,67 @@ hdmi_con: endpoint {
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
@@ -345,6 +413,13 @@ regulators-2 {
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
@@ -450,6 +525,39 @@ rst-pins {
 			output-high;
 		};
 	};
+
+	qca6390_pins: qca6390-pins {
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
@@ -723,6 +831,23 @@ &pcie0_phy {
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

