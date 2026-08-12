Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC743B2FE4
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 08:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786523728; cv=none; b=mK7o/hki0lAssa8cGfcF8CioviadwkEakruGy749WU84dnmTQV24nYkOKvE+rR1Cdz1/4i4Vk1RZpK72BJjAeWiozcw8k71nwgxRocpAswq87XxhVHfyzMMdJv0w08oh7W/nBXmVp1yY+Q0t43SyxRn47BYGYxFqOmHBB+2Ri+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786523728; c=relaxed/simple;
	bh=cqG43RastOfbvH6w96O4b4xl8uiCleEcq5Xpxvn+9MA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rmhBZQGPK9xB0e37Kns8g7Kkbo632h2cwTAaFscrbV1HiW2u9uprESkY5EQHcPj6tdY23q0MSjj6cmwChVnvIqLyUaX49GUgKQzZoKUUxxyaUyfgr0HX4TL6yuyLb1gD/iuiKqlLwgeuaT75PcFNaGo+P7iGPJpvBjih1mPdL9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com; spf=pass smtp.mailfrom=ferrisoft.com; dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b=Y1++UjdR; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ferrisoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ferrisoft-com.20251104.gappssmtp.com header.i=@ferrisoft-com.20251104.gappssmtp.com header.b="Y1++UjdR"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so1209471a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 01:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ferrisoft-com.20251104.gappssmtp.com; s=20251104; t=1786523725; x=1787128525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9o2WwbPBuxQI9iQJan0AFCDUf8L9NpbwwZeyQ4c2g8I=;
        b=Y1++UjdR74kYbbPejrUYC3tQ8Rkp585vszrzaPbBTrug4E4H/OARb984mOXcvn4I4U
         0zK7fxOoLxVJilZQatkLUOW1MhGg9F2VHasbaHQhYNzDHtw48mn9whGmQ1wbJgPVduMv
         xkqLssCZaYw9J7w9O0iOQj3k7J0So3xDSKIt16z4015zedUwZq68iI5jgWAwL6DtAhdJ
         7oEB3CKIcKyOKY3+diRkwGHATpdeiaB7OG9uIrGD3/AmkqMYJgkkIl9e6ccrdGisBStO
         ou+rUOVmrYmSV6NuMeOpzzw9/oO/eTUf4SUy+La3ffGhCI4hwBdhIU1d0FK4TaHySXMj
         Ia2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786523725; x=1787128525;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9o2WwbPBuxQI9iQJan0AFCDUf8L9NpbwwZeyQ4c2g8I=;
        b=M7Yx6PrK9DktmU837bilZB/Sc82L+G6jD3xi2cOlRcyC0nDZ7NKVkmbpl+N4nync+A
         XSw15bj+sNr/yr7SVy+X07itecSP9dtKbGb47C9mR/NLwBuEyD+YrZSod486lRsRYNCI
         vLMIME4WRbigo09162FEsixXL6K/B4xxbZM95y02iLX3tZYRPgkffd4ZosknDopKsWq8
         Lz1Ftv3ituOUezpKp/c2L1tyuAzMKI1COrm2gxj2o2DV04vROBOkz414CUzLfcrG03+p
         vbGg+fpp91s1TeVOabSfU1MxvcDxGjKGhbCw0N3es1vj+lkcHtAZ37U2QGG00YAJSvpQ
         2Pug==
X-Forwarded-Encrypted: i=1; AHgh+RoMKtkBPi0uhn6lWVqsIZlSPL46ANgp43F8dD2js0JfJgLW0cCioSRR7reURftANrvDGcUedRfgvTxbjuvd@vger.kernel.org
X-Gm-Message-State: AOJu0YzQKxewu2UNd+jRzGMhjFsjiX1Gjv+72SepcKEY7vhLqgq3SKBV
	dTH9ME360RiTD+b0ki5W7p6qrsY6C0J8mU1Hjo/8eZAsK12tMiCYNT0x2uvt6MxMhb9u
X-Gm-Gg: AR+sD10Gc/SWyVd9OP0e2RMjXGx21SQLbpWk2GM6EOGCdMysbusN9ycV0oPLVpTL+iN
	m+8uVkfOnQo81PEYGEwkQMdVls9/q+1Hyv4Pwn/50WsPMkrnBXhPBz39AT1Vj6BM7eaFrSUjatP
	QGAf/KmKPpootuh8/UMI6QkRGT6GU2mpkNj0ZahurAZh22RTBMkbb/No0GR2RDrBYJkGPzna9QD
	cDUCCvJkI2z7YeirKT2Kr+QUf+RIMm2k5GKSy5WMFzZbbL408ixJBwPCO/1UU2Op929dCHh2HN8
	avARTJtIzTj4FzCxRJ/C/ih1a3QDQuJYxbhAaVetF+D/Fj0icaMTNvsH9eEfB9f6hxnJOnyeLsg
	FRQuxK4gC1aqdsvBP5jw8PV/0m5CIkNXJocXi3YTToiEkGIRkVt161vdZTQ0zRu9+LgJFtlW++m
	0fU7B5oxgcGBXVLx+CqIo3QiwMEFlSS2X559V6FNotNmsQqXY0Hwt5Pok+Gd88UNZjMZZt29ZQ/
	ZuZBd5DQy9pEY3kCCldwA==
X-Received: by 2002:a05:6402:2425:b0:69f:4c65:86c2 with SMTP id 4fb4d7f45d1cf-6a375ea2e26mr1360779a12.2.1786523724542;
        Wed, 12 Aug 2026 01:35:24 -0700 (PDT)
Received: from zenbook (45-11-61-69.ip4.greenlan.pl. [45.11.61.69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a376891e77sm434527a12.5.2026.08.12.01.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 01:35:24 -0700 (PDT)
From: Greg Ociepka <greg@ferrisoft.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: glymur: Add missing USB clock, power and bandwidth votes
Date: Wed, 12 Aug 2026 10:35:22 +0200
Message-ID: <20260812083522.774711-1-greg@ferrisoft.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The four USB3 controller nodes on Glymur (usb_0, usb_1, usb_2, usb_mp)
are missing three property groups that Glymur's own usb_hs node at
a200000 already carries, and that Hamoa (x1e80100) carries on all five
of its USB controllers:

  - assigned-clocks / assigned-clock-rates
  - required-opps
  - interconnects / interconnect-names

Without required-opps the controllers place no performance state vote
on their power domain. Measured on an Asus Zenbook A16 (UX3607OA) with
a SuperSpeed device enumerated, CX aggregates to SVS while the
controllers run their master clock at 200 MHz:

  $ grep -E "^cx " /sys/kernel/debug/pm_genpd/pm_genpd_summary
  cx    on    128

  $ grep "usb30.*master_clk " /sys/kernel/debug/clk/clk_summary
  gcc_usb30_sec_master_clk   ...  200000000
  gcc_usb30_prim_master_clk  ...  200000000
  gcc_usb30_mp_master_clk    ...  200000000

128 is RPMH_REGULATOR_LEVEL_SVS; rpmhpd_opp_nom is 256. With this
patch applied the same measurement reads 256 while a controller is
active.

Without interconnects, dwc3_qcom_interconnect_init() silently does
nothing: of_icc_get() returns NULL rather than an error pointer for a
device without the property, so probe succeeds and icc_set_bw() on a
NULL path is a no-op. No USB-DDR bandwidth is ever requested.

Without assigned-clock-rates nothing programs the master clock RCG,
which keeps whatever the bootloader left behind. On this machine that
happens to be the correct 200 MHz, but ftbl_gcc_usb30_mp_master_clk_src
also allows 66.67 and 133.33 MHz, neither of which sustains SuperSpeed.

Add all three groups to the four nodes, mirroring usb_hs. The
interconnect paths follow the provider layout in
drivers/interconnect/qcom/glymur.c: usb_0/usb_1 sit on aggre4_noc,
usb_mp on aggre3_noc and usb_2 on aggre2_noc.

Fixes: 4eee57dd4df9 ("arm64: dts: qcom: glymur: Add USB related nodes")
Assisted-by: Claude:fable-5
Signed-off-by: Greg Ociepka <greg@ferrisoft.com>
---
Note for reviewers: Hamoa additionally marks all five USB controllers
dma-coherent, while Glymur marks no peripheral DMA master as coherent
(only the SMMUs, PCIe controllers and remoteprocs). That difference is
deliberately not touched here since getting it wrong is a silent
data-corruption class of bug, but it looks like part of the same
omission. Is USB DMA coherent on Glymur?

--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -4572,6 +4572,10 @@
 				      "noc_aggr_north",
 				      "noc_aggr_south";
 
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
 			interrupts-extended = <&intc GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 90 IRQ_TYPE_EDGE_BOTH>,
@@ -4584,9 +4588,18 @@
 					  "ss_phy_irq";
 
 			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 
 			iommus = <&apps_smmu 0x1420 0x0>;
+
+			interconnects = <&aggre4_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			phys = <&usb_0_hsphy>,
 			       <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
 			phy-names = "usb2-phy",
@@ -4647,6 +4660,10 @@
 				      "noc_aggr_north",
 				      "noc_aggr_south";
 
+			assigned-clocks = <&gcc GCC_USB30_SEC_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
 			interrupts-extended = <&intc GIC_SPI 875 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 88 IRQ_TYPE_EDGE_BOTH>,
@@ -4660,9 +4677,17 @@
 
 			resets = <&gcc GCC_USB30_SEC_BCR>;
 			power-domains = <&gcc GCC_USB30_SEC_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
 
 			iommus = <&apps_smmu 0x1460 0x0>;
 
+			interconnects = <&aggre4_noc MASTER_USB3_1 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			phys = <&usb_1_hsphy>,
 			       <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
 			phy-names = "usb2-phy",
@@ -4723,6 +4748,10 @@
 				      "noc_aggr_north",
 				      "noc_aggr_south";
 
+			assigned-clocks = <&gcc GCC_USB30_TERT_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_TERT_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
 			interrupts-extended = <&intc GIC_SPI 871 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 89 IRQ_TYPE_EDGE_BOTH>,
@@ -4736,9 +4765,17 @@
 
 			resets = <&gcc GCC_USB30_TERT_BCR>;
 			power-domains = <&gcc GCC_USB30_TERT_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
 
 			iommus = <&apps_smmu 0x420 0x0>;
 
+			interconnects = <&aggre2_noc MASTER_USB3_2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_2 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			phys = <&usb_2_hsphy>,
 			       <&usb_2_qmpphy QMP_USB43DP_USB3_PHY>;
 			phy-names = "usb2-phy",
@@ -4869,6 +4906,10 @@
 				      "noc_aggr_north",
 				      "noc_aggr_south";
 
+			assigned-clocks = <&gcc GCC_USB30_MP_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_MP_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
 			interrupts-extended = <&intc GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
@@ -4894,9 +4935,17 @@
 
 			resets = <&gcc GCC_USB30_MP_BCR>;
 			power-domains = <&gcc GCC_USB30_MP_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
 
 			iommus = <&apps_smmu 0xda0 0x0>;
 
+			interconnects = <&aggre3_noc MASTER_USB3_MP QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_USB3_MP QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "usb-ddr",
+					     "apps-usb";
+
 			phys = <&usb_mp_hsphy0>,
 			       <&usb_mp_qmpphy0>,
 			       <&usb_mp_hsphy1>,
