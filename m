Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6CC466B4C
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 07:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786088782; cv=none; b=ooXxE278PGg5k008hH7ehSQ9B/2GvRxBRqUzczW0Yp3RAc36NLgR4UnGFQ5tl8uFSTAVDCdQwFI+l8fe+h5Zf6Gi5ZuYFDwkIQXDl/HBtepGoudiCNr4w0ShwODDfZKj0wgvQAcQxstGrZc9VO8s5Ct6qCHMnLwA6kdiAtBEcvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786088782; c=relaxed/simple;
	bh=IzuyGpzwH+5W9XFy1kPfgzd/QVcGUIiyKRGNz+cEUck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U0eg90M5VcFKwB7pY2e1hBEQj8lTaNLFNWkWATT22uyTxCZxBX3nn9jNnSRDx4Xs3zPvbFVOAkduMv2+NxB4jHjh3WzDp1ifbQNoQhtV5RICNVvqemEuMfw233ED7/Pc8qJAWZURiqjEWP6wP2MAHRy6kLgy8kO6oYDYPD90Soc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=d7om+9o8; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="d7om+9o8"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a15d54ac95so4483275a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 00:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1786088778; x=1786693578; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XzVAhOy/xN1Xk3FHaKTbiIDUKHy3pS/Z2yp40xvvQRc=;
        b=d7om+9o8VMAUqvBZIl+EKRrYsJRtKOpd+tKnYmdXkVU9Dus4bJnkwKIiZvzz7WkG1o
         lEBzdkiJ6KS3J7WVKcBbeys5ec0Fcea3O45UgS8XUoKVg3LOY4nqs6FNr6TnLT20s3fe
         3RcOAkF9UHX9JVAQsqaMr5SeaCSpfS83A6afEBGMJTI7iYeACFOPSPyGPQJCyeFnsfgD
         1fiur5/V8Ds9iKqFDQhh1hWkdCa77OYHnSLiLCOySQ/+cNDZtZ1KJ2EweFmrOb0k8YJJ
         M7h0UOPmjDliuaPNZ9P3piAh8g+49tPyMzG0WziZ+8Zld37EAXlTyOD18N4NUnoqhAja
         YLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786088778; x=1786693578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XzVAhOy/xN1Xk3FHaKTbiIDUKHy3pS/Z2yp40xvvQRc=;
        b=Z11s4D2V6TShg+A2OGSehofsDHHtoipFJc8HthPReg59bBFqul9huKU7jlLpO0tMzj
         eW+sUtV/Fu8K3o3vPCnEVwMAw8ibvAmLVq3rDMwMZVFInUFC1Fn0QKNmRHrj34YmeesO
         4DT4z07e2+cS3tkQVD4W+/vjRzd7h9MG8Qyn/2y++EzqqvPkFZnlGGMEzYBOf0qfdGhA
         wpT/NyffGY0UkizjZGkTmEwZC0xzTBqtiTwFRqwzIGj3VJQvSZtbgD4stnOdZlT+dpoA
         DiyAvYXowzcoxHY9EbV8+XQ+foH42dZPJb+3vjQg5OFJ27nzCt49v2VoBhfTAI7p+8hj
         O0fg==
X-Forwarded-Encrypted: i=1; AHgh+Rreaphvmm7M8jFWtedcoyPgrhH0oe4Ll0/jo3K+xYR8HXzvrNTcLhqRK9ZK3csv7R8Jd+Ric4yxWVUnNKNp@vger.kernel.org
X-Gm-Message-State: AOJu0YxjSowFxptsoWfgTzLhCg1dQJtf6PwCe/q7vUkmVcr/22dp2ODn
	hS1rZAeLL0lAVf5DoWw+WmoZ7U/pvWJmAftppUT/TBCFJM5OaZTPiwPc1o5+QyP1hU0=
X-Gm-Gg: AR+sD12wuy/n0YjW1iSV83XxelzYYyppoZA0mz6fjLE3zl1L1Dkb0+FQgxKKPyL5GXd
	Rk7vNBD/BFjkR6eluj4bL77Tym/yLQ23g5r7+OmzGKEhlLslxWnKPcvnnngFv9brSkImmnaBGUN
	mooheu8zwdTD7/jZjziz9eRDH8nBVLrh4KAcqRS06nFrmBtspOYC3uLVh5OKakg/HD52cGoWs+6
	O6MrwjKewUq4iTzG4I3sLmqQhgoDFF9jvHCEuUR1FdpwUiP4RJXu6rVRxZJw1XOkVsDcIQuSMoR
	4GbKtt3rz/65q6G0sb9PmiRiIq8axONAbXaY3MGFYNTgBQUfe/7SUcmP26wZhUkryG0Eul0Yli3
	H1LPKjQ/lEjU9fJ/p5ciAi3In9+ckqJew3cGOKjwUP483btbGDrz8opqNGPIbP683GV1K0D82DT
	geUSU9HNvVv8v9jmgSTmaEBi6JKKI8chH3ozVj+aqm/MA3JN2hDhcQWlNzofc3qJfPhoqKJIjaR
	DBZM424nOP/WaUDaPSDfVpePOxIMpiOuuqC5pL8RiE=
X-Received: by 2002:a17:907:930c:b0:c1f:1520:4de5 with SMTP id a640c23a62f3a-c2039afb044mr997030666b.1.1786088778628;
        Fri, 07 Aug 2026 00:46:18 -0700 (PDT)
Received: from [172.16.240.102] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2080c90494sm19432266b.36.2026.08.07.00.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 00:46:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 07 Aug 2026 09:46:06 +0200
Subject: [PATCH RFT 3/3] clk: qcom: gcc-kaanapali: Fix always-enabling
 PCIE_RSCC clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-various-pcie-clk-fix-v1-3-5caf78a599d7@fairphone.com>
References: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
In-Reply-To: <20260807-various-pcie-clk-fix-v1-0-5caf78a599d7@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>, 
 Mike Tipton <mike.tipton@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786088775; l=1581;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=IzuyGpzwH+5W9XFy1kPfgzd/QVcGUIiyKRGNz+cEUck=;
 b=ibZFcqfvuGnha1lbV0ra4kA7Omqr82sT0bdZrYoXGclvGIcsj7X/ekS9Ykm5vVp6UAF5vbRSq
 nHdnSPRXZ0iC/7swoRIH1xUKLKPeZRD1lzVpjBd0/twKVSqQbr4I0ta
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The critical_cbrcrs array will get qcom_branch_set_clk_en() called on
each entry which will set BIT(0) to enable the clock. This is however
wrong for these two PCIE_RSCC clocks which need BIT(20) and BIT(21) set
respectively to enable them.

Fixes: d1919c375f21 ("clk: qcom: Add support for Global clock controller on Kaanapali")
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/gcc-kaanapali.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-kaanapali.c b/drivers/clk/qcom/gcc-kaanapali.c
index 842c1a70c691..5bcbcd178657 100644
--- a/drivers/clk/qcom/gcc-kaanapali.c
+++ b/drivers/clk/qcom/gcc-kaanapali.c
@@ -3464,8 +3464,6 @@ static const u32 gcc_kaanapali_critical_cbcrs[] = {
 	0x9f004, /* GCC_EVA_AHB_CLK */
 	0x9f024, /* GCC_EVA_XO_CLK */
 	0x71004, /* GCC_GPU_CFG_AHB_CLK */
-	0x52010, /* GCC_PCIE_RSCC_CFG_AHB_CLK */
-	0x52010, /* GCC_PCIE_RSCC_XO_CLK */
 	0x32004, /* GCC_VIDEO_AHB_CLK */
 	0x32040, /* GCC_VIDEO_XO_CLK */
 };
@@ -3480,6 +3478,10 @@ static const struct regmap_config gcc_kaanapali_regmap_config = {
 
 static void clk_kaanapali_regs_configure(struct device *dev, struct regmap *regmap)
 {
+	/* Keep clocks always enabled */
+	regmap_update_bits(regmap, 0x52010, BIT(20), BIT(20)); /* GCC_PCIE_RSCC_CFG_AHB_CLK */
+	regmap_update_bits(regmap, 0x52010, BIT(21), BIT(21)); /* GCC_PCIE_RSCC_XO_CLK */
+
 	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
 	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
 }

-- 
2.55.0

