Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8373E4AD7D7
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 14:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791383847; cv=none; b=ulk2y/k5H6o70jaULSJrAQBT9JtTIIvQZX3edMEGqXLO+atv8JvW86naTDXVW2WZ7a+eq3sqcurVfr0/65PmeMt9tYxYxppYBClvrrYj5Gq/P1tDLjt8YBpkS+tjwFRJc09AJlc6AydPBBYFgmliEwbisiD5mERrVql5pqbKa6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791383847; c=relaxed/simple;
	bh=whC7gmL15K1cWGuFXFgyqJ4Ch9Jx/fU22cEMTN48nyI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g4Jw5R6KxK5r4MTe3JWKAB1lNya5+sH8Rnoipm/TyXot2EAJw7s/sn9/P5NcTi9/13acfdVO4iUNKyoYLGIx4kTPWCI6gR+ZMuNtjIKth2IJUmPnTgv4kMDy10RBhtGKHaEwkELU4tzBfRjwCLNA0XfMlSefAfF5t9F7VbW6CGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DSVoDILe; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DSVoDILe"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3a0a911e8d6so2115777a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 07:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791383842; x=1791988642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0LAcWUItTSrXRQ4sGStgckVn+Q0TtyeUBlb321VM6ps=;
        b=DSVoDILeE3RN1NH/0jLu48e4mF2Onq1/9Cn0O8c0ZEZbm1+azgVkKj4R7FXKMJSjZ7
         UcLSFy8tXddEe9C43St9Hd2Js4ZaEaUBVDepD1oRLdGbNVgdQB/WDB2ua+j+pQ7XDUHn
         F91U89uxKy03K/Ac+ks8TeNQ+2Ee8ZmKZHhmmIGBiN7zW3teEku1ihN2DZpHmZ1ZS+MA
         d0vCguoZIR9WTfZ0wrCnN1M49y0bCKo94u34E0vuvZoo/I5wYBwxpj++Pj48WfjiXhQf
         HJmllEBlJ1cUla2MKK6CQbk+0wxZhha1fc6g3dCerBWT2R8HbiAFIv1kiyTgasFA+FgZ
         jcwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791383842; x=1791988642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0LAcWUItTSrXRQ4sGStgckVn+Q0TtyeUBlb321VM6ps=;
        b=U0lU+w+ZZqHPA1WtcoIgaph1CpKpPRviWjUGpv/fV+7Lu2/r05RC4s8OZKhYlhammC
         VynUin6icQq30T1h1b2HqU13UWpVWAJhzNjE9FxVkjZB9RUFXtB2FAXd3WlMVleNlj0d
         e2YDhnUKukDz1Fd185Oj2gvrP18Rflz8zjOJCNVafgLJDJu4VArfDIIvXf6bHMIenWly
         DuqOpkBfAKV+uqn/la84LEH9RUn+zZGoZ2fAvCDvonpYPKJG0HKpNKPhFsRoBV3SbuQv
         /c1QDE7/ylFolrMa6fBTxBcUfw2+G/HSrlYlKcgx36pofQShiUB1CQVkVYG0o6NYPxHE
         2JKw==
X-Forwarded-Encrypted: i=1; AKwUvBwi2JvWt0TNhelQiHdJgOIfvvGTDHDXotqiO1UVT0ZrPePzmmVsk4aEDJaK/5zz00U7d6dT1fQYP4xtFKm9@vger.kernel.org
X-Gm-Message-State: AFq9FYK7QM9+jjyaP2DO/XFkoIwExJ+3S6tkObPVXlJgKj9mNO+KEnt3
	V/Ere3al5lY+n7FyBG6bHxBpBdOyD2wxGRdoReY9+PJZKWS42btQsb8O
X-Gm-Gg: AYBFou0kMgw3SuD6eHQS1DYVXcl+nRumu19rsBQJPkiJ7mVqwbghQmADW1ap37KypT9
	nWP5M6XeYVwm5pOR25vkJcnF8cW2TfI6/hqm+LS1tA/81fKbCLQSxU729GYmhtHyv6EuJSIGPxA
	9mYSvJ1+HrtC4x64i7bmQHq9TdujLJFNt2FyGStWlRNfOkrx969iZbOk0U38R9dycVtoXYpugOm
	PJHcQcrc36/uiKUBV54/gVGErYdoRfyfXE7sGFNFJsf3U4+jT6s3gDYU9sLoj0ORs2sO22h4rtb
	wbABt90Vl5K0mAtQeOWAKCkCAat2DYFb9CjeNzGTDJgPuH1fEkv0BOOA8JPF2HZBWyKziZSC0uc
	DX9Qb9oW3hxmpjVsQ4E0QCVFzkcuBxlB33OGwznOByiW2G4BPrC69ot4mkCj1pXMpUwgM8DsOjH
	Cl8VVPIXXigcIoHBlJjqBaRYC6EVjrDmLubJpK24dfFCYUCoH7EUleTes3UCq6uxkHUMxcjYWYT
	Lv4Vb9f6xUODtM=
X-Received: by 2002:a17:90b:4cd0:b0:3a4:7938:844d with SMTP id 98e67ed59e1d1-3a8a1ceb3b5mr2118343a91.64.1791383841385;
        Wed, 07 Oct 2026 07:37:21 -0700 (PDT)
Received: from DESKTOP-NM9EKIA ([125.134.240.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a4b1abbfsm1712246a91.4.2026.10.07.07.37.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 07:37:20 -0700 (PDT)
From: Joonhoe Kim <26rote@gmail.com>
To: andersson@kernel.org,
	sboyd@kernel.org
Cc: mturquette@baylibre.com,
	taniya.das@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	abelvesa@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	nitin.rawat@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-kaanapali: Enable FORCE_MEM_CORE_ON for UFS AXI PHY clock
Date: Wed,  7 Oct 2026 23:37:16 +0900
Message-ID: <20261007143716.2161-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

As on SM8650, SM8750 and Eliza, the UFS AXI PHY clock needs
FORCE_MEM_CORE_ON for the UFS controller in MCQ mode. Without it the MCQ
configuration is lost over system suspend, and with MCQ enabled every
resume from s2idle ends in an SMMU fault and a host reset.

The UFS PHY ICE core clock already has the bit set; set it for the UFS
PHY AXI clock as well.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Assisted-by: LLM
Signed-off-by: Joonhoe Kim <26rote@gmail.com>
---
Tested on a Lenovo Legion Tab Y700 Gen 5 with MCQ enabled in its DT:
the MCQ registers keep their values over s2idle, 7 of 7 resumes
without a UFS error. Kaanapali was noted as the missing one in the
Eliza thread [1].

[1] https://lore.kernel.org/all/a0b6030f-be42-4f5d-a59c-db78912ff0de@oss.qualcomm.com/

 drivers/clk/qcom/gcc-kaanapali.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index c9473fb79ccc..6834f43b72ca 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3484,6 +3484,7 @@ static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regm
 
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_axi_clk, true);
 }
 
 static const struct qcom_cc_driver_data gcc_kaanapali_driver_data = {
-- 
2.43.0

