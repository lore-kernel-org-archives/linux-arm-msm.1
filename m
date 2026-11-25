Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795636225;
	b=Zsg5pUaZepcjN4JaUkz2kMuHhYPsbR6A5ufBzl+P7shSjPwBHTowZPGAlqy3Kzx13pvg
	 2Lwoqv+Dm6U8aIxStjuf06Ew3jzJbqr64zQFKuztQPpM3pVMG8b/yoHKSsASOBUvdYY2g
	 n8yf0zoNmgn4pzZoAJkcVGi16GB+MRhWlGkchlPKMhqPGh7dm94FSURJyzVOx8dQuNj0x
	 pn1CWMaIzYh0KPL4O2OPARs0T2X/ulCD61OJYVzgHBFU0Lh/CdnzgQveXZ09ZsjrU3EvA
	 Ltg3xje+JHsMx5iAPqMkAuiPQZPJ9WZJsQf/WgaYlrOPEw0GbH9ltG5WGGhQE0qivhw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795636225;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VhO90SLyIbQBaRSyTllaC2yRuF0DVldYIy7jSq8Rzfk=;
	b=boAH01qOPgQymKbDkMXhBojlOJQuJb3SBWDWFiF2T7AnZQNTe7B3DuWgbSiKoJhAnm6Q
	 YtI9isw27t3Z0A6OYsY+OGZXFGBeRw7iqsQ12foTLmZ2s7QKJKqcTnV4TJEn8nZeALJfT
	 DHp1wkF3kUux4NuVPQUlludapVaej6MvzGAPaVpLe4Yl4dlFuGdBkB6ShzlhVoqPL6Iw6
	 zFA7hqGQQNkZGnmh2LSh7PdzdDMmrjwlW5OuUPhza0uklwP7LxIzA39B5zlGRe7z85HPM
	 abJ7YgsTAQ8/H4P96WDF4oC5pJwXm6/y4Cmt0ZWHR+qc9eu8h4/H6aYx632ocNepoTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LnyjzxLQ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A688606A31E;
	Wed, 25 Nov 2026 19:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LnyjzxLQ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795636225;
	b=QmW0EGlcd6BLGkQlzdDSthmSNieRtQje6pceHVFiZpkdedRDspU8KCgUI3u46SExgFKW
	 NzxqMLUQMNStsn8BP2Kv2QVQlToSRm6/aXgmEElWXNN7Y3WeVfAUT9gnz4WVgx6q77xtP
	 cLBV7lMp7p5YTum0T7A9w2Rg7M9jlOel21WYOLs6h0JALEoWpeU2sKS1tUBzrSQRrRSoE
	 ji5cwExbIaCNp/VIw1snM1v+SieWiAHDgQcrni5Myqufdhkg7bmz0qsmDpL3opGIo8MPC
	 ilUzuU7gyL/G7jouiX3X1X6vJeIWS6R4FEbbRPA4rbB1TZjIDnKOmp0Y6VYJZMS3csg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795636225;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VhO90SLyIbQBaRSyTllaC2yRuF0DVldYIy7jSq8Rzfk=;
	b=yvNClgTak6trbYMMkPuaghDZa13gtdbq3bSJWFf0JdeM5hSGutm14ySwN664KcW54hWY
	 TBBEyGgwCt0MoacPr15riSsTe3XMMklOg0DA6ejXXF7fYFsFtKHfbqw2Cf4Mo1zloxymg
	 p8u5JqvGLtnPNxayxAm9ZIMoZHXtf+kPj/uh/k0tWO2jydbnSvq+snFg1uCCiqD9o6kGQ
	 6QacTGeoBG8hRQ30QmhVqGBw5ied0GQImb67gqpYnVSaxrp5l82D2ZuIOTB1IsU4ol5/t
	 SED/+7KCXKEFUk4Ldj9w0WG8wwK4HXZrQaOrzuOesDaVAIUOHJynC1QcaKLwzITxufQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 736951F000E1;
	Wed, 25 Nov 2026 19:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795636225;
	bh=VhO90SLyIbQBaRSyTllaC2yRuF0DVldYIy7jSq8Rzfk=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=LnyjzxLQfFv+fu1uPB9AgI4isvEqNMIcjQjRKIo191/0srCbqSvGi2tS6aIqwCPQi
	 YNKLAUNBhW3PqXugRNGfLRLbgfRn7mLHpO5Cyh7PV8GrTaueJK+V8WwGDRZn1zLSMi
	 2635Q5qp/6P7bWu5qI9SCwJtYP2PdMrN7N6XNjoWstLKttBCbo8kK47knm8GPaibKk
	 8edp5599PkMfj7oY245L7NVoAjCB0ASO11EUVh4j4/tBWJVxnSjXR64SMbe4xyYLoc
	 QErG4kU+uGwzoLceo+rQfBjiRmsQlb9A8xeA+aGy3TGqddPn5wCOwGDErJKVsXK09F
	 gc3wAJGKs2ANw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id F3E134D00D;
	Wed, 25 Nov 2026 19:50:09 +0000 (UTC)
From: Victor Mora via B4 Relay <devnull+vjmoralesmora.protonmail.com@kernel.org>
Date: Wed, 25 Nov 2026 20:50:03 +0100
Subject: [PATCH] phy: qcom: edp: Fix v8 PLL and SSC configuration for RBR,
 HBR and HBR2
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
Message-Id: <20261125-glymur-edp-pll-v1-1-068a4d95a12f@protonmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQyNT3fScytzSIt3UlALdgpwc3WRzkyTLZLPUFINEUyWgpoKi1LTMCrC
 B0bG1tQCM71O1YAAAAA==
X-Change-ID: 20261125-glymur-edp-pll-c74b9c6ed0a5
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Nabige Aala <nabige.aala@oss.qualcomm.com>, 
 Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>, 
 Victor Mora <vjmoralesmora@protonmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795636209; l=6678;
 i=vjmoralesmora@protonmail.com; s=20261125; h=from:subject:message-id;
 bh=qVbeo/jP78rlkyjkxHPovLbmwjPdXqdr2Ue/1EwP/2o=;
 b=+ywXwrPPjb5pfkkpk1XDX9PZr6m2OwvqvR9SZ2xGaU8iOYC9NLdiQ1069m1bnukja57np3O6F
 7oXHRwpncKaBCRktkO56BnmJKYlkyX94swPyZjU/Y6zlGloBUeaZViu
X-Developer-Key: i=vjmoralesmora@protonmail.com; a=ed25519;
 pk=xX1yECoFrpZB2EbulsFDxl+S7K3ggttCl3mCaW5rSV8=
X-Endpoint-Received: by B4 Relay for vjmoralesmora@protonmail.com/20261125
 with auth_id=1642
X-Original-From: Victor Mora <vjmoralesmora@protonmail.com>
Reply-To: vjmoralesmora@protonmail.com
Content-Transfer-Encoding: 7bit

From: Victor Mora <vjmoralesmora@protonmail.com>

On Glymur, the eDP PHY PLL does not lock at RBR, HBR and HBR2, leaving
the panel black. qcom_edp_com_configure_pll_v8() uses values for those
rates that do not match the v8 DP PLL programming sequence, VCO_TUNE1/2
are fixed to the HBR3 values, and the same SSC step size is used for
every rate.

Use the per-rate values from the v8 DP PHY tables posted for the QMP
combo PHY [1], which use the same QSERDES COM register layout, and
program VCO_TUNE1/2 and BIN_VCOCAL_HSCLK_SEL_1 per rate.

Tested on a Lenovo IdeaPad Slim 5 13Q8Y11 (Snapdragon X2 Plus,
X2P-42-100) with a CSW MND307QS3-1 1920x1200 eDP panel, using a local
devicetree based on kalambo-crd.dts. Without this patch the panel
stays black. With it, and with the PHY status read from 0x114 instead
of 0x0e0 (needed separately on this machine, see the Nord series [2]),
link training succeeds at HBR (2.7 Gbps), 2 lanes. RBR, HBR2 and HBR3
were not tested on hardware (the panel supports up to HBR).

Link: https://lore.kernel.org/r/20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com # [1]
Link: https://lore.kernel.org/r/20261116-nord-drv-dt-v3-9-e3d3bf0e2c49@oss.qualcomm.com # [2]
Fixes: add66a6673bc ("phy: qcom: edp: Add Glymur platform support")
Assisted-by: LLM
Signed-off-by: Victor Mora <vjmoralesmora@protonmail.com>
---
Hi,

On Glymur, the eDP PHY PLL doesn't lock at RBR/HBR/HBR2, so the panel
on my laptop stays black. This patch uses the per-rate values from the
v8 DP combo PHY table update [1].

Ritesh, Abel: could you confirm the eDP PHY should use the same values
as the combo DP PHY?

On this laptop the panel also needs the PHY status register at 0x114
instead of 0x0e0. Since the Nord series [2] adds the per-SoC
phy_status_reg field, I'll suggest setting it there for Glymur rather
than sending a conflicting patch.

I couldn't find an existing fix on the list; apologies if this is
already being handled internally.

[1] https://lore.kernel.org/r/20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com
[2] https://lore.kernel.org/r/20261116-nord-drv-dt-v3-9-e3d3bf0e2c49@oss.qualcomm.com

Thanks!
---
 drivers/phy/qualcomm/phy-qcom-edp.c                | 68 ++++++++++++++++------
 .../phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h  |  1 +
 2 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index a3c893f72908..d7813cd8d5df 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -914,15 +914,20 @@ static int qcom_edp_com_configure_ssc_v8(const struct qcom_edp *edp)
 	u32 step1;
 	u32 step2;
 
+	/* Per-rate SSC step sizes from the v8 DP PLL programming sequence */
 	switch (dp_opts->link_rate) {
 	case 1620:
-	case 2700:
-	case 8100:
-		step1 = 0x5b;
+		step1 = 0x83;
 		step2 = 0x02;
 		break;
 
+	case 2700:
 	case 5400:
+		step1 = 0x18;
+		step2 = 0x02;
+		break;
+
+	case 8100:
 		step1 = 0x5b;
 		step2 = 0x02;
 		break;
@@ -953,31 +958,53 @@ static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
 	u32 code1_mode0;
 	u32 code2_mode0;
 	u32 hsclk_sel;
+	u32 vco_tune1_mode0;
+	u32 vco_tune2_mode0;
 
+	/*
+	 * Per-rate PLL values from the v8 DP PLL programming sequence, as
+	 * used for the v8 DP PHY in the QMP combo PHY driver.
+	 */
 	switch (dp_opts->link_rate) {
 	case 1620:
 		hsclk_sel = 0x5;
-		dec_start_mode0 = 0x34;
-		div_frac_start2_mode0 = 0xc0;
-		div_frac_start3_mode0 = 0x0b;
-		lock_cmp1_mode0 = 0x37;
-		lock_cmp2_mode0 = 0x04;
-		code1_mode0 = 0x71;
-		code2_mode0 = 0x0c;
+		dec_start_mode0 = 0x54;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x06;
+		lock_cmp1_mode0 = 0x1c;
+		lock_cmp2_mode0 = 0x02;
+		code1_mode0 = 0x8d;
+		code2_mode0 = 0x27;
+		vco_tune1_mode0 = 0xfe;
+		vco_tune2_mode0 = 0x00;
 		break;
 
 	case 2700:
-		hsclk_sel = 0x3;
-		dec_start_mode0 = 0x34;
-		div_frac_start2_mode0 = 0xc0;
-		div_frac_start3_mode0 = 0x0b;
-		lock_cmp1_mode0 = 0x07;
+		hsclk_sel = 0x4;
+		dec_start_mode0 = 0x46;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x05;
+		lock_cmp1_mode0 = 0x08;
 		lock_cmp2_mode0 = 0x07;
-		code1_mode0 = 0x71;
-		code2_mode0 = 0x0c;
+		code1_mode0 = 0xf6;
+		code2_mode0 = 0x20;
+		vco_tune1_mode0 = 0xae;
+		vco_tune2_mode0 = 0x02;
 		break;
 
 	case 5400:
+		hsclk_sel = 0x3;
+		dec_start_mode0 = 0x46;
+		div_frac_start2_mode0 = 0x00;
+		div_frac_start3_mode0 = 0x05;
+		lock_cmp1_mode0 = 0x10;
+		lock_cmp2_mode0 = 0x0e;
+		code1_mode0 = 0xf6;
+		code2_mode0 = 0x20;
+		vco_tune1_mode0 = 0xae;
+		vco_tune2_mode0 = 0x02;
+		break;
+
 	case 8100:
 		hsclk_sel = 0x2;
 		dec_start_mode0 = 0x4f;
@@ -987,6 +1014,8 @@ static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
 		lock_cmp2_mode0 = 0x15;
 		code1_mode0 = 0x14;
 		code2_mode0 = 0x25;
+		vco_tune1_mode0 = 0xa0;
+		vco_tune2_mode0 = 0x01;
 		break;
 
 	default:
@@ -1022,11 +1051,12 @@ static int qcom_edp_com_configure_pll_v8(const struct qcom_edp *edp)
 	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_CTRL);
 	writel(0x1f, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
 	writel(0x00, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);
-	writel(0xa0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE1_MODE0);
-	writel(0x01, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE2_MODE0);
+	writel(vco_tune1_mode0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE1_MODE0);
+	writel(vco_tune2_mode0, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE2_MODE0);
 
 	writel(code1_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0);
 	writel(code2_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0);
+	writel(hsclk_sel, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_HSCLK_SEL_1);
 
 	return 0;
 }
diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
index 93edabb830af..870835656f8f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-qserdes-dp-com-v8.h
@@ -45,6 +45,7 @@
 #define DP_QSERDES_V8_COM_CORE_CLK_EN			0x170
 #define DP_QSERDES_V8_COM_CMN_CONFIG_1			0x174
 #define DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL		0x180
+#define DP_QSERDES_V8_COM_BIN_VCOCAL_HSCLK_SEL_1	0x1a0
 #define DP_QSERDES_V8_COM_CLK_FWD_CONFIG_1		0x2f4
 #define DP_QSERDES_V8_COM_CMN_STATUS			0x314
 #define DP_QSERDES_V8_COM_C_READY_STATUS		0x33c

---
base-commit: 495f98f8dc61da7c5d9ad11ac7d07ee2cd2154cc
change-id: 20261125-glymur-edp-pll-c74b9c6ed0a5

Best regards,
-- 
Victor Mora <vjmoralesmora@protonmail.com>


