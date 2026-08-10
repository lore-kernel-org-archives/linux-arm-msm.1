Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 271343B7B97
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 10:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786359083; cv=none; b=T4SLWTJVK6oHfqEoSmVWQLEKa3va//tmshIHwmhGNpSWaCpaBoqwTqIcu1ezVcRPXkryGAsWKCYehBmw9kZRdtXpcTH8c/5d+iTb39OvxjN+n7+OmC/Gq5QBRyuz5qDiwVtH4gCBHOD2pSHUIK+Z637qCNxoo0n/Vc40PH5Rfro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786359083; c=relaxed/simple;
	bh=YQ61MLDivYrChA93Z1oiQfr3MErrYOCY+tdqp0c0Lf0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PnftqUauplv718D3z/mGYj4BJM0bLU0Hpn941gztxqmMJ8ciTmU7WgmxRvcoAklY9+8AKfQqBy3+y2ISjGhX65ngEkko5/8MQACmMWI2KRVQ2Fc2CaYLvRnmuvuAdJL1CXkZBK6xI5qpk49FZTxho4S0grBgAKdtSatJ0DpXJn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iBZIlvlP; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iBZIlvlP"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso1675863a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 03:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786359081; x=1786963881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PuJ6x2zkITh7GZS5epmVnODSBm6oxe8knuYTtm1XBZ0=;
        b=iBZIlvlPVF5xpM/AK9Z8A3szgwbnhlmhTjFiUBDwLHQTy9mlT259INmD5/+G1YKzRC
         ooN+c4InJRrs+p1tSg4e6qreZRkUIY29u6uvYiezcUKiW8p6HunFBDH/GSjyuPgeROqw
         eChVnJJ9BernrEUCzjzAW15MjppfpmEmCq+J6YjEzWuXPBVBie9L+io2nRxLvPfitV1N
         z5KPGL3BNhuFkHxD1efxaF/G2I71g/mQH3e5oLbiTvVFhA0gtv+oYFRsH6lPHAisCtKB
         PXyl43wA0U98Ey+xZvsvAJn/tibUq6w4F8aKYOxAL1nM5SBG8bCwNqggYZ3y14kk3d8J
         S5qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786359081; x=1786963881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PuJ6x2zkITh7GZS5epmVnODSBm6oxe8knuYTtm1XBZ0=;
        b=mwed8JKNkm3jXYyPz998in757zfL1iP18ApaKzJeoS80n4tFTCyqhCcYJlbRrP4VG4
         liVEnOD/ed4NurPhq3mP0HihAyEwtnqKoaOugasXPET192tjpZUK0wwSaLNJ5GnWh9SC
         v89p+Rns8GqHGnNmdJEsAqNPNdZiMngfXwKxrBxnUMjviNZuMNJ+fj3Aejo0WtY6LTr1
         yklNDMw53xWEa5n8CfF4bQCky0fHdQ+1wSveiaGL0mjGWu61LLKNyhmQiNZch5ER+c6k
         UcBKa5P6X97KRc9cXE0gaa0J/xnbhj7RNWrqvr1Fevs4XjSFuCd4AVDt7nvkIXZyyjZc
         LHmg==
X-Gm-Message-State: AOJu0YwhNYZNTyGhzt8NUcHWvS2+SQlYSeFlchSlxrX6uGpRWXb6PYp6
	YL40jducSS+BBedl3vGbc0fTCTeVTFaR+7inc3y9rNo1b+eRh6322pzU
X-Gm-Gg: AR+sD11RjM4pF2hIvT0lIM906FvU7nwKTcFT3KrNjVvNInrhTVOw/g1nyrTDSAZctBl
	ZP+r1/pmsmxRzJEaUa8G3bDUIXFbe3Xri5Pw9mUG0z3FhUfF/XbBCEczwPJx0H3HJajOu+Yshsq
	HEqjapIqJKSc/d1UltxnnMmvWyg4FVASpbV1+gaAnB+rxFWIARsm9F1LGNfWLpJZNS6f8SFMo0c
	bZrJMPFZF7FY69JvIr4EBBEEBFqyVC4hE5yraAjVFIyBUKDicWkbuwkrtjf+z9BjbF1xmo8XTui
	kbxvBL50sEk/OaHWggZofOkT4NQbBKhsqfGWi7vx8Ua1HgLCuhg6AuoJTtzL2TWIG19HdjPJYQS
	A+CR6XMjmtMUma86is8fE5U+oh/72sbTt+6vR6R+qAVmDRKsjky5YhOGN14zKz5xIJX5ZrH9W77
	2l6MNGxq9ZvYO8gEXSDYr6KaDZS8oN2Es9SwP5x5ObCfCL1BXdmPBN9H2q1a6dhIMmAcHJWWl79
	1vumVVbLS55QaqS5hcqq6WmYJKMXPbdxYSMFh3ztXmUlYaR1Mdn3kRFFH68vHWEsSwW7lfTkhrW
	MXVH
X-Received: by 2002:a17:90b:2245:b0:38d:dfd1:7c1 with SMTP id 98e67ed59e1d1-3903c542a40mr34920645a91.2.1786359081519;
        Mon, 10 Aug 2026 03:51:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fd95c40sm12240771a91.8.2026.08.10.03.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 03:51:21 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3] watchdog: qcom: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 17:51:01 +0700
Message-ID: <20260810105101.55945-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Instead of only checking for -EPROBE_DEFER, propagate all error codes
returned by platform_get_irq_optional() other than -ENXIO, so that
failures are properly reported to the caller.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v1 : 
https://lore.kernel.org/all/20260807081652.38692-1-phucduc.bui@gmail.com/
Changes in v2 : 
 - Update pretimeout handling based on Guenter's review.

Link v2 : 
https://lore.kernel.org/all/20260810102144.51663-1-phucduc.bui@gmail.com/
Changes in v3:
 - Update the handling of wdt->wdd.info based on Sashiko's review.


 drivers/watchdog/qcom-wdt.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/watchdog/qcom-wdt.c b/drivers/watchdog/qcom-wdt.c
index 49bd04841f0c..74ac3c507c01 100644
--- a/drivers/watchdog/qcom-wdt.c
+++ b/drivers/watchdog/qcom-wdt.c
@@ -287,21 +287,22 @@ static int qcom_wdt_probe(struct platform_device *pdev)
 		return -EINVAL;
 	}
 
+	wdt->wdd.info = &qcom_wdt_info;
+
 	/* check if there is pretimeout support */
-	irq = platform_get_irq_optional(pdev, 0);
-	if (data->pretimeout && irq > 0) {
-		ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
-				       "wdt_bark", &wdt->wdd);
-		if (ret)
-			return ret;
+	if (data->pretimeout) {
+		irq = platform_get_irq_optional(pdev, 0);
+		if (irq < 0 && irq != -ENXIO)
+			return irq;
+		if (irq > 0) {
+			ret = devm_request_irq(dev, irq, qcom_wdt_isr, 0,
+					       "wdt_bark", &wdt->wdd);
+			if (ret)
+				return ret;
 
-		wdt->wdd.info = &qcom_wdt_pt_info;
-		wdt->wdd.pretimeout = 1;
-	} else {
-		if (irq == -EPROBE_DEFER)
-			return -EPROBE_DEFER;
-
-		wdt->wdd.info = &qcom_wdt_info;
+			wdt->wdd.info = &qcom_wdt_pt_info;
+			wdt->wdd.pretimeout = 1;
+		}
 	}
 
 	wdt->wdd.ops = &qcom_wdt_ops;
-- 
2.43.0

