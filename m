Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFD13B3C17
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782603; cv=none; b=LVFE3Mm7Yr1/zh5BJN7TlDpvqo0M+YV/l29INHLAZmtPzSrX+OkY25LjEZA8OZdk6RkpsmWMQbec6yGqudpaTxiqWATOh/NxdeE0iH/tHzRmESEfoo+n5eHFm7YPFveo1bZCaYCIVmd2R5Ci8RxBnNc0KpjLyoVwWnDu6K5tSBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782603; c=relaxed/simple;
	bh=mTFpbE7y3C+2o7mpAVBR3/EaCOyAljsg1tywzWeZ7gY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aRaAwB3d89AHy63nz2Z/P3qd/PyZH5/5Jq/1KTVKGA7Xldwu0knfE27u5YwtLv5+52sSLosrFAXlT8ggq1OfoDU0/xwdLZ2WBl8OCtO23ItBECTMMbw/q5yBZQV1Z3w1t4JVpvw+FQppTwxd7IeidP472eUKBXhkvQtf+OTH+Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a6mrd0YZ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a6mrd0YZ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso2568995ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:56:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782591; x=1785387391; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qqyvFlsAJpGp08mEcLtsqWSAzW5XWPBTBAzSWZnfs4=;
        b=a6mrd0YZkIHxLi4ckfh1lZoTYS87DUn2J33GMTQby2aqb09DpgtZVUWbOMQE4ekx8f
         t2SBlyOIXrY0JnEgQbBLzEG4q6+gXefqtNm6sCc91edJny2rUddhqwui6YdnQS2P1Mpa
         t+rirL31kj011rXaePXdmNSOrhZvbJ/CsQlHp+sJZqCKIH6HZSReLuYWxT87TwWOFrda
         OQPTQ6OEFKfusRwakNkCHeV5dBLvHl/WyW7z7jSD6eKYUwqXIBg5eRAvm49McdtijPIg
         35Oj58k7XiesnrRvQRm82hzOXmUfOE3JdNssTP1eyGvPer1NQpsVWh3Gg0rjg0moARx3
         aiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782591; x=1785387391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2qqyvFlsAJpGp08mEcLtsqWSAzW5XWPBTBAzSWZnfs4=;
        b=k0/syYyWkUVnv0G98bIdw1JCH6cUTJvBiRv9h2YJsXYLRwxsu6wAq2vqDpdN7ofh12
         2helJkn424UVYMTGG0epu8djUCroDGpP/XLbBjCbaeGZg2T4rD0XdbGg4UZumvzUwmGt
         5L6ZJ3wkuVR40r6BfQih9zNlSX7YzDX8v3Re2CyPEDaVv4EM8W1dheGHvxrYfgThIM7Y
         Fbzfuyyc1oGKWMyyAaA+PxpIOlcBNBS4DGG+xCLKwshg9RJZLYYVVeWNUVjB2OdWLScy
         DaPDScLk/H+z9Q8hkbMZ9oN9N9DnxLJgyWGZkQjOeA5OHwDVs3azk+s+Hmux2jQYsEbD
         GkGg==
X-Forwarded-Encrypted: i=1; AHgh+RqQ2wa4J7GsszeP+r/gT27bppBkTSM+3B0I0spa1eOS0AlQ6Gs7dykB8ooCyXKk3lKdTWuO7xbYozBGCQjh@vger.kernel.org
X-Gm-Message-State: AOJu0YxcGKGuX486kAd6csUkw5XpOH5aUsAFoi1J+0+pGmfyq9RYNyim
	v/EMlFPjiQRVPYreOMUmbFaULO4n248n2fOBgM4XRDBt2nbDoHD3Umps
X-Gm-Gg: AR+sD101uKXyR2IBz9BXGCSwXoODgea/7gYyyWz0kq6mq7nEQbEknYM3JaIx/KEM36e
	O/IuPFLSfJtW7uK1Hy1yV03NspdPRpB1QZQoB53endq+fhjX/Eiy32R+QkM6sUbPenrCnrGgqR3
	KYikyk6NR4foCW8boUWwcY+erbXXuOXlohRDdYeejerklTK9c9oyxMex/NExmOKDUfyV8ZlVT6k
	eVXuNxyhX+qgvPqq8lgIRNC5puODfD/pZ9LooN2eEImMGbAsOZrjRwM6x6FRPexDmcLIXNo0mzL
	Ev7hgbM6Y58SwWJ50TfhMBQwECMrwASjtbJZh0RdFKrkZrBJ5GNnASIjCoRcrLHan7WLvx6QTaR
	t+o0wPza7W/waSVmHcvhbhtun4E2Jp9cWOmrYSa1Sssy+GMgvqhygL+qJFFg5VmOFm5V72ROeeQ
	Eo8PVeOglw5foxVSEu31tCu7vrPNJ7x8iuVdHs
X-Received: by 2002:a17:902:e801:b0:2c9:8f4a:90b with SMTP id d9443c01a7336-2cfa6a54e47mr20230015ad.3.1784782591028;
        Wed, 22 Jul 2026 21:56:31 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:30 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 22/26] ASoC: codecs: wm8962: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:23 +0700
Message-ID: <20260723045327.28260-23-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8962.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 2db822fc1de7..8a9598161b35 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
@@ -1564,11 +1565,10 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	int old = wm8962->dsp2_ena;
-	int ret = 0;
 	int dsp2_running = snd_soc_component_read(component, WM8962_DSP2_POWER_MANAGEMENT) &
 		WM8962_DSP2_ENA;
 
-	mutex_lock(&wm8962->dsp2_ena_lock);
+	guard(mutex)(&wm8962->dsp2_ena_lock);
 
 	if (ucontrol->value.integer.value[0])
 		wm8962->dsp2_ena |= 1 << shift;
@@ -1576,9 +1576,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 		wm8962->dsp2_ena &= ~(1 << shift);
 
 	if (wm8962->dsp2_ena == old)
-		goto out;
-
-	ret = 1;
+		return 0;
 
 	if (dsp2_running) {
 		if (wm8962->dsp2_ena)
@@ -1587,10 +1585,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 			wm8962_dsp2_stop(component);
 	}
 
-out:
-	mutex_unlock(&wm8962->dsp2_ena_lock);
-
-	return ret;
+	return 1;
 }
 
 /* The VU bits for the headphones are in a different register to the mute
-- 
2.43.0

