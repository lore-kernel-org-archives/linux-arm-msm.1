Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F2B3480967
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629709; cv=none; b=ldV/j8PChwzMCeoT7wNim6I/j8kzVh5pBBE+7LXqTujODadleS2NgEteuJFWHZ/xafPzrzKPqrdOYjsj3uET8AjdnAbqkJnH1RTY9V5/avZsLU2R8uP/S3ytPWWGUIlGYWCN+0w2xWD75LqDq6hAZBNC1zhmR5eFyoW+xdi07Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629709; c=relaxed/simple;
	bh=RgeSX+3zLUlisqOHX9ATQa6nqb4KePBdPHCKtWx23aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AcBh5bSXkG/KHs2oHjBqy6kEHaKwKFisaousdipajcuBB/fLSKrLRuPmraaoeBKJs8TaoQoMgko1ts3lqlF5o5d8B7h5jMxZxY7LS1r/rV8M6zaLsUZ/wOCo72PLchg2CK0HL9Pka/TuaYa6DbPWNmBOsTsbYPa4JaewokAYnuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qkyqZT36; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qkyqZT36"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ccdb73f0e1so71842115ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629707; x=1785234507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=;
        b=qkyqZT36a1GGn7vvJemOTlFr37ZS0X3PfGmoyksHts5lwrTT5JK2WVcs2JO2B/HJaW
         OZymesEscFNrA9ybDh3AINyk8H7y3yF/qhFD9Ktw2zHhG6RpIegeCUtgu45OX2HamIl7
         XAi3UxSqPA4ZegVtr+HGgX4DuvhwzW9SUY7LpuereGqedw24lRrOkuXPiJGawzKryIao
         Xpx0XgSFP30/X/gz65qulCDdzDAne17gttWNSDCfj8FXmHQ+TgWQm4yAA1ty4p63a8xv
         4v8Vh31K8RIGBAL4fe5jR9w+vuVXaGKhjlqBkAqSbGBeSSOdCyqRZA71BJXGp4N6pH7I
         argg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629707; x=1785234507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=;
        b=FOIA2RBbJU4YgyJjKCgvsbr/20PlN1hIGoKkh2302js/sMA1N8e9w3h2mjO0kktrtN
         8qXZAmBEB6wczaP0pkyXclGsfNq+28WwUXSD4QFQ+POxIDqi5DTc03LG1oZvgDHLwBRm
         HkK92sLsRfMrM0PyRXkvFa/uQpRnXiUlti46hCJPH5zyiqgP5c4Dv5gagOfnjYntaabH
         0ZaE88EcQrcSJib+DGEWOhcOD7HD4cCgUHFnLQqS2Uwi9SigaJC84Cs7KCQRqUNmBaQg
         61dmJihWL9csPJCyjZBX9oOQOnQ9BE28ovgZg/3dQDcoY86zUAUZ6WeCBTOaexUU/Sjb
         iKsg==
X-Forwarded-Encrypted: i=1; AHgh+RoeNYDNOfCyK56wb+2shpqjPk4n/GyFqmwnz4159Xa/c8ryKCMxiEr2zvSJAmsSg1OvyWpJ8GAQYFs8//O0@vger.kernel.org
X-Gm-Message-State: AOJu0YxNx/qkrQdj158qun9NibKTSG0jurPd03R3tpASfWqgIp7yQ0V9
	zsQ3WnlF7vrTDMN/NY69QMI1GXcivzwIm0a+aMLlkaxN6znfmYnOpqYp
X-Gm-Gg: AR+sD10ONFXwbsv/3pTgiWtZdyLL+CX2aB0aGL4ymziOsFMZOMdS4nSPNYA0oUTvtlT
	/wFx/1x/sI94zOVo5MySCrOQgZmfHT/VYjaufSj5anEYjE9ooSl3TzccSmEoP0AsWMHehLEeD+s
	5QZjswOtTAfQytHUfQbyhqJ/ehco9ApkxBZfsMrKvM5k0UhEJGIR6tGlLIl5zarQm9ZxL/kub1x
	OST8ui08HpTeJqiSMoCelaKj4pz5p8roU0jFAm+ORS2uRaIOqK1/JF42/YF8Rc/522panGAer8u
	l93pT2ykfZBIPXWqcDkIu5ewWAuddUtToNtzyzI0konMV9j5PsLcjPb/aAnaaiStHsBGrKl9Ys7
	/KzpzIzu2e+cViBUr0AW1JBtZo76dRotTZA1Nf606pWUszkfOIADvLLyehZChR2LCqxjnSe0wmB
	h/g9aqnwE/MyaKmOgIpB3aDyKRiu10z6G5xKWE
X-Received: by 2002:a17:903:1b0c:b0:2c9:e5e6:8621 with SMTP id d9443c01a7336-2cf3496bdf7mr187813395ad.25.1784629707513;
        Tue, 21 Jul 2026 03:28:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:27 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v4 16/29] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:47 +0700
Message-ID: <20260721102600.523199-17-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
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

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/peb2466.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..5a1ed02abb84 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
@@ -1704,13 +1705,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1717,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0

