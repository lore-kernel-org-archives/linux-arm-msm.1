Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2BD63E49CC
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 19:36:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785958608; cv=none; b=LSWMLqru1tHtCfMF4F7e3ThkuA0X+JKZV01oz4H+RekRI9F3ILZGaJkJZ3Yel6p4PZ+8TY4ArS/jWwlr8q3T+aJ4i2uljA4Jnjy3boFZqvEKgD+8VvmR4tCrHb+WT9mbM7T2sxnBYi/KZ1Uf6oQh0pmrSZcesHOxjP4qqelBBRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785958608; c=relaxed/simple;
	bh=iF9CeaCV/MT5QTis9XK16zAZl3wKMHXZrO5Be4dodzw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kh381df+sTkIzu79S4cnypTeoT5dwUgfeAyQ0ShZ+Lki4qSd28CTHhM8f3ap0W1Gyy/E7P0k40uCjGUhkMatsYTGVdsZgqizzSoFWY0mvGSGB2PWbq9C65vpBjbz8PVc+MAw7Fdgb8PPlGDtdIbqMngPFAqBc5WQlivexF3KSzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGXHQpM4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGXHQpM4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47fd66a094eso565580f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 12:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785958605; x=1786563405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9h2GbKMrBFLa4j0QbS4fEp7fC2n/Rdosi/gfxLWH5ik=;
        b=OGXHQpM43B5G4GgLGAdmeDG7ApPRQmoM6xXy0urfv15RPmGiSaRBPYuE7SUlZBMsvi
         88GuU+lDHb3QWNKqV4VH10mMOrRnPhjO3hDHBawQuVVl6xfM6HbN3c3dxF87gKWj4m8D
         6El69V8Y+WFBWJMS7XM0Bii0qCXfjeZFVzwTn2291cIdCSFuG8gEITxr4FoARn9sEsgW
         5rvax1t9yrPnFQQ03Nucm6ntxX/BpEGuSYTNmnrv2GTrBZcvvEj5aFjgRDdmv0oKrNKq
         uKMP+hfk9ZTvLc+J0eLRt1ouUAqZHy1jmiDCVQDLGH1vgPlHulNWNpUpzT7ABPy600hA
         Q29A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785958605; x=1786563405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9h2GbKMrBFLa4j0QbS4fEp7fC2n/Rdosi/gfxLWH5ik=;
        b=IIfkGLfpL4EE7SnbSqv3dBKIulH5nLVKJANRcAVC/yagDJNiPsY2xOHeHeW/Y6eVdZ
         JJjhmWdERluj0c1koPmD/ZdpuQpl8Owvy4CmymZ2CbGaUWEmHaw1Zl3sdShAxDy/Wn/o
         Kh2gFTImaZ0LrORqxgp8n+SdziQs9jVhISxRmjlJ+e8CAiVwKUGlZEyE8uylP8GCwcsT
         fGPLUe7q92nVM9SgoxtxRUa+2pziUg/UiVQ7Cg76x5FKEIpN/Xk3VBJvkkZ6NzI0rxC0
         CZqhygCCT9bE6FD0UXjQxo91Zv3ls/zD5lJxGeSlxm9GDulAibNvXNQX6Kfw7s+gTkQs
         mZQA==
X-Forwarded-Encrypted: i=1; AHgh+RrWvsZiPVb1anmqKB7e+3enAG+L3qPWEt2a6hSnPs4V6nKP1bED585Bwe+ViM8FDYydPTH3IEP+GHLUsRKF@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh81p7yRdbacl1MijFeECZ7DCr0ibu1P2wNfxr198kJIqtmzIT
	p0JBjxLQL8SNa0sS5bfDZbFJetfg9ZJZOEA/pdQH0z6DxXcomUOG+lVP
X-Gm-Gg: AR+sD12RDM636tZW9YbpglLZvQgGo7QXBGbx+kR891i85PATgIStyUPdKbLu51JGnl7
	zuhQPh3HdAoPAAHP1lC/DRMb6aZ8BdhDjFFpTUMKBhbxdnilZXpCx6EXDNlz2Q7//ydo3oAJrge
	4U4FH/HKgKNU6RRxaIhahVzLHNqvzRV0O0OwAl5EVArS9qLrDXWI2wlhWpRvWNiCLjTDa9VK9Kd
	3UHGgRLeCbfEE3ZTmI9KAE8pacfRA+VFgnEe1fwV1lHU7xTJkH3zE4f6aLHRNoZch36goQGeHqr
	RFbaf+DTvLB5cDynChW+T/splKz56T5JfDde8oGk2jrisy7WUjLDGKQQ3I6RIJ1iDLkYsaVrS8H
	9Jj3sRwrbZ75ae8i9CC2kCwvEuyLbRxx1fx5lVqKK/8hYiErF9RjB7Iu25zzQVnu/70+/SyyxAG
	iLju9ebJ4q15buvU3sN9gTJQ18bwXy21jmghnJwPCD/iGC6SjW4Xz3Iic07tAp7DmZQSNl/mLdO
	VoG1tydBw==
X-Received: by 2002:a05:6000:25c4:b0:47f:8ac0:282 with SMTP id ffacd0b85a97d-47fec530687mr15302387f8f.17.1785958604669;
        Wed, 05 Aug 2026 12:36:44 -0700 (PDT)
Received: from VivoBook-ASUS-X712UA-M712UA.lan ([2a00:f44:cc3:6030:335:e595:4fbb:65b3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23ede6sm12682789f8f.30.2026.08.05.12.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:36:44 -0700 (PDT)
From: Stanislaw Pal <kuncy7@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Mieczyslaw Nalewaj <namiltd@yahoo.com>,
	Jie Luo <jie.luo@oss.qualcomm.com>,
	Brian Masney <bmasney@redhat.com>,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3] clk: qcom: ipq-cmn-pll: keep the CMN block bus clocks enabled
Date: Wed,  5 Aug 2026 21:36:38 +0200
Message-ID: <20260805193638.15327-1-kuncy7@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260804115359.16633-1-kuncy7@gmail.com>
References: <20260804115359.16633-1-kuncy7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe function takes a runtime PM reference to enable the GCC AHB &
SYS clocks of the CMN PLL block, registers the clocks, and then drops
the reference, letting pm_clk gate both clocks a few milliseconds after
probe has returned. The clock ops access the CMN PLL registers without
a runtime PM reference of their own, and on IPQ5018 gating the CMN
block bus clocks makes the SoC hang on a subsequent bus access: boards
died silently within milliseconds of the CMN PLL probe, up to a 100%
reproducible boot loop, depending on binary layout (micro-timing).

Take a devres-managed runtime PM reference in probe, so the bus clocks
stay enabled for as long as the driver is bound and the reference is
released again on unbind.

Fixes: f81715a4c87c ("clk: qcom: Add CMN PLL clock controller driver for IPQ SoC")
Cc: stable@vger.kernel.org
Signed-off-by: Stanislaw Pal <kuncy7@gmail.com>
---
Changes in v3:
- Fix a reference leak on the devm_pm_runtime_get_noresume() failure
  path: v2 placed the call after pm_runtime_resume_and_get(), so an
  error return skipped the pm_runtime_put() further down and left that
  reference unbalanced. Spotted by Mieczyslaw Nalewaj.
  Rather than unwinding explicitly, the devres get is now taken before
  pm_runtime_resume_and_get(). Both helpers undo their own get on
  failure (devm_add_action_or_reset() runs the action,
  pm_runtime_get_active() calls pm_runtime_put_noidle()), so no error
  path needs cleanup at all. Happy to switch to the explicit
  pm_runtime_put() form if that reads better.

Changes in v2:
- Use devm_pm_runtime_get_noresume() instead of simply skipping the
  pm_runtime_put() on the probe success path. The v1 arrangement left
  the usage count elevated with nothing to balance it on unbind; the
  devres action releases it.
- The diff is purely additive; the existing error handling in probe is
  left untouched.

Note for stable: devm_pm_runtime_get_noresume() was added in v6.16 by
commit 73db799bf5ef ("PM: runtime: Add new devm functions"), while this
driver dates back to v6.14. On 6.14.y/6.15.y (both EOL) the equivalent
is to move the pm_runtime_put() out of probe and add one to
ipq_cmn_pll_clk_remove() instead.

v1: https://lore.kernel.org/linux-clk/20260730191353.557494-1-kuncy7@gmail.com/
v2: https://lore.kernel.org/linux-clk/20260804115359.16633-1-kuncy7@gmail.com/

 drivers/clk/qcom/ipq-cmn-pll.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -433,6 +433,17 @@ static int ipq_cmn_pll_clk_probe(struct
 	if (ret)
 		return dev_err_probe(dev, ret, "Failed to add SYS clock\n");
 
+	/*
+	 * The clock ops access the CMN PLL registers without taking a
+	 * runtime PM reference of their own, and on IPQ5018 gating the CMN
+	 * block AHB & SYS clocks after probe hangs the SoC on a subsequent
+	 * bus access. Hold a reference for as long as the driver is bound
+	 * so that the bus clocks stay enabled.
+	 */
+	ret = devm_pm_runtime_get_noresume(dev);
+	if (ret)
+		return ret;
+
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret)
 		return ret;
