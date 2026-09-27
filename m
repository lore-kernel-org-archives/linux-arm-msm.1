Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391B3B3C03
	for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 15:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790524318; cv=none; b=bbTMvzO3aM+okk7oZMbBPOMA/MGF5zIPrngt3qBhH7NEERnXEhl5ZSpxIdWLmqMdh1rvKm2oH21ATypwqrGVSBQRBMYa5dtVTvPAwVv7bJzAXEGzlbz5y+xGq6h8Fj65gERB1JkyybIL4Q6SgH+MZxqAWrMBJTkdvu/KFEKMrpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790524318; c=relaxed/simple;
	bh=WO3e2dAPCPDJj1H3hgMeqWQVcfphj8Iotq8V+3nAnAo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/N45MgbTC2SZnfTFtmXtbW6jpfRoDwVfLOcmPbZk4sXFvMt/k+7NSCZtS/LAt6CjRB2hRHU0TOFnF5CdjmWKjVmhUAVnq2yxQz8anf1MaztRXZXnqyKNRfOa9+9HNmAU1zJFdwACHWK1SWOCreJW6lIdoyynMyb0bCF2RSF68k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pZc639Nq; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pZc639Nq"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2a8b9acbc6so315130766b.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 08:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790524310; x=1791129110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GKLDYDc3mePfDnzMg61PcdHyuIyXuIN6+B/oZsoaduw=;
        b=pZc639Nq52ZJPeF3aLBEl3F35m2KgmpE69jI7bV2dmRGD1z+HGO/0UpWREVRZTpnVg
         EQdOA4Hzse/piKpwhRoaS9BJWLU9Cu71NkVGXUhxv24hCqbMNFxIbPOo52Bp3vBYF2UG
         Tl/9Y+7o1kCCnTJLtNZX7qOyx23OBY5mEtuLtDsWdgyU0zr9jEXKNAl4ZnMz+KKoARkv
         Tsg4ATer+q5mhH2RAWYPl2GK9QfMG59O6PMSpjdMKtURFGk5z7WJk4XZA+0Kr7mqWZ8S
         XSxpzc61Dna3erDu8iLMMnLbx6MM7fVO84hfP5t4i0fWP0xT9YqYuQ2RYL0FY+Go6Q/S
         WZ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790524310; x=1791129110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GKLDYDc3mePfDnzMg61PcdHyuIyXuIN6+B/oZsoaduw=;
        b=T3OOPLlmxOKrtfWcYa9+MKgX3Xy0UelV95Hp2SzLxkd7Lc2fN7kh/9h506FXNKYFRQ
         Bd3fxVW3DTuhNQTaMHF+bi1xUv8mZDc8B6XS0gLd669tKnkWcmGhRhhHnRsedq2+NLuO
         c8LoCH7D5W3nTis7c45j2VIaRh+PueQrPDq5Tt9Q+GrPn1wNS4BSmlcdZFSNZ9ee8J+Z
         5JjxddYp8y3iPViyYrglscz0eviynSfpUe6fWXqVjFiK8CYdDrDDSuEZmerkCxCjBKX3
         8z7cfLsOp01qugu+Wv/tP6NdG2Ct53gYjbnu5KLSXMzMcGiRLVmW58X8pePPdhVqZQhe
         X1gA==
X-Forwarded-Encrypted: i=1; AKwUvByyBEweSKZCU4cFny9VTAJKxOWdQK9q1B4kKCxIzZiW/AT4xfaR+HGmNhC3D59WegB1ZHN4B0KF/gd7qku4@vger.kernel.org
X-Gm-Message-State: AFuF++n4AH+lAT57KttkCMrW2REaDdiBslqWgjn0tvHxJJODFk7DEBJ2
	FLQd9NhsLQPHesXa0oS+vr+5yFjbdNIE9FraxlovhI4SO7TftMpKLgVH
X-Gm-Gg: AYBFou0XzkrdgRgXYh2xR5cSrJ5XFQ7RiwiI8LO7zPp+kzR/Yd3wMPAcEMJiCtWWmoF
	2uTtCzzk8D2JRrzyIVV9T2kG25E7W/oVecfwQ7wflzLacLzj5Hz4iYCJee420HAptrbMtYjJ5XJ
	X8s3OkAVw0SdqjZCTNPDMZwj+d+B8NidZzzgyGEy1IyWVW7kRuscsGroIT/BXNytI9v2orLHtDm
	aP2h66zpPrCDV2J/lHWfsptLxWnVh7w8HxrBK9U442DCZkTrex2eXYhCRRQYouLo1u+J1L03FbZ
	JDP6C/Jy1JQhxvIPajQQu7Zl2kp1+m053cHFIumigKYVsTJHkra4Lzc0nboI2RQezXI0SCYWBtr
	NPxWfWIeP2NR0k5yWeaE1YpjuXiZ/nkKAwFoBWkfJiG7HkvUq5RYWRWDBMHe5CCpTM6LXidZmBN
	/K5Q3yxq4uaFWRJvHjOyYGoCy9Qqj+cmS5x4FkA7VsyioRDyhqmwbCytS7TqGVrzM0tRb3ZL9pf
	8SYteGv12dgKEDKcyrS35N/T01y9mQzOOdCpHIb65BhTQmfYjvSH4NQ
X-Received: by 2002:a17:907:3d08:b0:c25:2a78:15ed with SMTP id a640c23a62f3a-c2ac22db502mr895963766b.6.1790524309994;
        Sun, 27 Sep 2026 08:51:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:aa1:165c:44c1:e5d5:dfb4:8450:1cdb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dbd3a0424sm158684066b.70.2026.09.27.08.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 08:51:49 -0700 (PDT)
From: Yongzhao Chen <yongzhao.derek@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	George Moussalem <george.moussalem@outlook.com>,
	Ziyang Huang <hzyitc@outlook.com>,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH net] net: phy: qcom: at803x: Fix IPQ5018 short-cable DAC values
Date: Sun, 27 Sep 2026 17:51:36 +0200
Message-ID: <20260927155136.2489-1-yongzhao.derek@gmail.com>
X-Mailer: git-send-email 2.45.2.windows.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When "qcom,dac-preset-short-cable" is set, ipq5018_config_init()
programs the MDAC (MMD1 0x8100) and EDAC (debug 0x4380) fields. Both
fields occupy bits 15:8 (IPQ5018_PHY_DAC_MASK), but the value 0x10 is
passed unshifted as the set argument of phy_modify_mmd() and
at803x_debug_reg_mask(). Neither helper shifts or masks that argument,
so both fields are cleared to 0x00 instead of being set to 0x10, and
bit 4 of the low byte, which is outside the field, is set.

Use FIELD_PREP() to place the value in the field. This matches the
vendor SDK, which clears bits 15:8 and ORs in the value shifted left
by 8.

On a Redmi AX5400 board, where the IPQ5018 internal PHY connects to a
QCA8337 switch PHY without a cable, MDAC and EDAC read 0x6868 and
0x7800 before the write. With this change they read back 0x1068 and
0x1000, with the low byte preserved. Without it, the same writes would
leave 0x0078 and 0x0010.

No in-tree DTS sets this property yet, but it is documented in
qca,ar803x.yaml and used by several IPQ5018 boards in OpenWrt.

Fixes: d46502279a11 ("net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal PHY support")
Signed-off-by: Yongzhao Chen <yongzhao.derek@gmail.com>
Assisted-by: LLM
---
Testing: the register read-back above is from six boots of the Redmi
AX5400 running OpenWrt's Linux 6.18.52 kernel with this change
backported. On net, this was build-tested for arm64 (defconfig, W=1)
without new warnings; the generated code of ipq5018_config_init()
differs only in the two immediates (0x10 -> 0x1000).

 drivers/net/phy/qcom/at803x.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 6872dbf7785..cacbadf1f48 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -1051,11 +1051,15 @@ static int ipq5018_config_init(struct phy_device *phydev)
 	if (priv->set_short_cable_dac) {
 		/* setting MDAC (Multi-level Digital-to-Analog Converter) in MMD1 */
 		phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MDAC,
-			       IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_MMD1_MDAC_VAL);
+			       IPQ5018_PHY_DAC_MASK,
+			       FIELD_PREP(IPQ5018_PHY_DAC_MASK,
+					  IPQ5018_PHY_MMD1_MDAC_VAL));
 
 		/* setting EDAC (Error-detection and Correction) in debug register */
 		at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_EDAC,
-				      IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_DEBUG_EDAC_VAL);
+				      IPQ5018_PHY_DAC_MASK,
+				      FIELD_PREP(IPQ5018_PHY_DAC_MASK,
+						 IPQ5018_PHY_DEBUG_EDAC_VAL));
 	}
 
 	return 0;
-- 
2.43.0

