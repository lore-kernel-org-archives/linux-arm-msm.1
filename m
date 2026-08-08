Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BB937E5D8
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786188178; cv=none; b=J+BdmsI7limcGWnnuOQ+vSDgiqhmsV9utbR8vRrZFmGvXRLepnYyBRGhjLWBhsk283ggQCa+Uu8gi8p9AEB+bxttBhPYiSbOEB/BRl/l6AocDhRFnvlm7Wg5wSE7tcJfjxfZ1cUZqtf40DAIKY9E/Ndf1q+ArGNYMwgUW09+BL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786188178; c=relaxed/simple;
	bh=YmTG5vVK/FTTLwiYHkfLbcJlBmEgt7LnpaAC7mAvf8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oG5K9y6VuFF8BuWtZgX1Tzl4QabiKKypRpDzD7U8dK4Ty1zCA97k6/6NuCtK+BTb4H1W2EeGKzyEdSRluzBC61be1upsyLsOreJrg6/Hv4YaGFZfzt4CGOe1mnspCu2+/06PRkCQ7ijeQ/dvObALqJO924Jcq7PkQes0xWMYEpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ByaBF6Iv; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ByaBF6Iv"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caea3f742bso7104625ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 04:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786188177; x=1786792977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MEwID2P1yRmU8Feq+ODsi1JwIGprGXNdUwcJktuS+tc=;
        b=ByaBF6Iv7LYHgN28kQY44npWWC3vHDwDY+kSHIWm12IKGjmvgfFjw14t7xqflCi6FP
         cjWbUjwBMuySXxYhNhql9lS5TQ7ql3sM5CZuR9wjm8gn0jnOXTDrkeWFopmt+HJcmcKt
         b8CPYMnKP43GBVhK7aXXqc4sWk3dx0qlP86MXq2AfqG+7XN0ffP869YJwDA3oTrC9X6o
         839TPXdf7bJ0PLT004h3F5O6slPPye8Bj0VH8xS8rWideciyN8y5DVW7uve+TsopUO72
         lirD5HttjqYCj2o3mc+tCBOoWAXr3S/gxquo+c/dtLR5I0GOitaGnmrUU5IQVikjF9WA
         0TFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786188177; x=1786792977;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MEwID2P1yRmU8Feq+ODsi1JwIGprGXNdUwcJktuS+tc=;
        b=Y+v3hVQRy+FLOVjCK1s25h9ksXfe0wjaJlJi3oGZ9A31Nek23D+BInZXFJ/342sUyM
         NNL/jryha1O7CXrjL0ukTLTYG/C1r7hCvqKx0NcaNAq4wQM+KZexK4vv7snaBILZJr6l
         NY6VI1USZwK3mEnx1LCcJ0FuPK9IvhVjBsnRHIYAE7gQ+sI4xriDJttlOoBY3wUwK44I
         TmZL8oYIFwmQW8/azzXfSOM7wlLPqy+jbqPO5s4jVy3c9qfIJmhxWUNwYmCS8jmfh1H0
         W2ndixuoL6QcnpiIlWjA38iEdZwBAjqa47c8QR5tl8Wsxk3JnOCIq/lHnYVus58Gkg/V
         LIvA==
X-Forwarded-Encrypted: i=1; AHgh+RqcMUnclusSnXnR9yolQOeG0d+nBoHtULywz1N8rxz1GeBvHhDjflXm/rOK53W+OBhkmMLxn/lfSjKCTmfR@vger.kernel.org
X-Gm-Message-State: AOJu0YzS1c72im8tV28POKC/gQ2ahscQu+ptGEKGG0egG2exYfXexUKB
	yow27+SJ+k3IV4qLrNdZodj0YxzUVliC6pAxlzJrl7aSnSWrIuiv0yIS
X-Gm-Gg: AR+sD11ynBF4yY5a0zPigIVCdXmIkDYOOpOXxryA8KaGh/RxikElN0zDu72ACBvwtvZ
	APga1oZqWA2gg+Xi5+pUHnkAn1CVV9i8DOg0uUqNZqZQeGCe4pN5o/l3yrfbBWs4Eo6/7TmBxQf
	Op7n7BILOhj0tH+pbLoIJiRC5MhYH8zcE/l3iDdrPDz7UvJVE6MS2IxDgwqfZMEcaf87ZWjN18x
	2S2S5PF7qA4ArWIl6VRCytwgZcgxDQntwWcPOrW03Or/OIz9dFWuJK1cy3WdUyr353iveybkINx
	vw/3fN9NT9BjH6Jns1aYYeCEYNJf6CdZPV8qK3LGqGOz+NL9W0sTz1Fa9cSF3o348OZtkztrUep
	SxeLIdyHoB/T2LcjAG3akk40ly4cnp9k/eg0MRA2Xq8XQmtykPNkhfXky15DBEpWJuSTDhVYLGM
	wOZ0mgpDkTxYcQ3aAyxz4CDbPuo9Dxu1n+PWAGMGgI5lc=
X-Received: by 2002:a17:902:ef4e:b0:2cf:b68a:2050 with SMTP id d9443c01a7336-2d0ca775824mr364281175ad.15.1786188176638;
        Sat, 08 Aug 2026 04:22:56 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14dbeeda6sm18048745ad.42.2026.08.08.04.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 04:22:56 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Sinan Kaya <okaya@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH] dmaengine: qcom: hidma_mgmt: fix autosuspend cleanup on probe failure
Date: Sat,  8 Aug 2026 19:20:43 +0800
Message-ID: <20260808112043.2781244-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hidma_mgmt_probe() calls pm_runtime_use_autosuspend(), but its failure
path does not call the matching pm_runtime_dont_use_autosuspend()
before disabling runtime PM.

If the autosuspend delay is set to a negative value while autosuspend
is enabled, the runtime PM core increments usage_count to prevent
runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
during cleanup, this reference is not dropped and usage_count remains
unbalanced.

Add the missing pm_runtime_dont_use_autosuspend() call to the probe
failure path before disabling runtime PM.

This issue was found by manual code inspection.

Fixes: 7f8f209fd6e0 ("dmaengine: add Qualcomm Technologies HIDMA management driver")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/dma/qcom/hidma_mgmt.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/qcom/hidma_mgmt.c b/drivers/dma/qcom/hidma_mgmt.c
index 4805ce390ffa..470c88f36d25 100644
--- a/drivers/dma/qcom/hidma_mgmt.c
+++ b/drivers/dma/qcom/hidma_mgmt.c
@@ -168,7 +168,11 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	pm_runtime_set_autosuspend_delay(&pdev->dev, HIDMA_AUTOSUSPEND_TIMEOUT);
 	pm_runtime_use_autosuspend(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
+
+	rc = devm_pm_runtime_enable(&pdev->dev);
+	if (rc)
+		return rc;
+
 	pm_runtime_get_sync(&pdev->dev);
 
 	virtaddr = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
@@ -310,7 +314,6 @@ static int hidma_mgmt_probe(struct platform_device *pdev)
 	return 0;
 out:
 	pm_runtime_put_sync_suspend(&pdev->dev);
-	pm_runtime_disable(&pdev->dev);
 	return rc;
 }
 
-- 
2.43.0

