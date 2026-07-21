Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6997D480947
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629693; cv=none; b=mmGhZJcVeHNTWNap6C3iaX9mBc0OtKDM8cCttqgxd2lvONuJA66wA2GoQLq2lX3XGV9tOBsoUFZnmsNUP5o/IRqriP9fv6AO8iOyieaFpZKmV1rSIy/qjMC0H7p1WbTApN9fzoPA8Qdn78bwigmmeILxAIDV/yhtaoo3pAVgBsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629693; c=relaxed/simple;
	bh=UCB77sVggJ4ivJJbdq1owmFYfz0+QciJpaUHkpwq9Tg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8HY7hbyORUaxvifYap9S0xEh+4JlGfm8f6U+J76Nu+W4CCoVoyZgeCJfQWLcH44YZbAQL2VqCeettEanUFwYvuwFgpwyUPzrj5b1V4vezm1F1g9Sd8hgZUubLcJkkq7eKwJSpCIfCEE1HSpY/g3tRzMocaYgzvLVd2BSajm02A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fn/ewOmO; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fn/ewOmO"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so24131085ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629692; x=1785234492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIe5hlvQfgQeGemklPcQXzjZsFGmFJ7H9Gsm+LXx4M4=;
        b=fn/ewOmOatiT5SUCGO7NOTc8eU6lUVXAyhHA0DYtvNtX9VpjR2khnHKgUt5ADxIyQh
         +43C7QQdz3If6GtQ0rMo8SNvROEIXHxCU6K8GtI/0Ooq2pfghsDHXMUeuZBEtxlC80Lj
         2QXAgtpOLhI2b4Q7Qto5+2F0Q4tt14qoy1XtgaHvjnITBTdWdMTlZs1lzwCjKJY+YG1p
         WVnE5DSoFXKEsM7LrqDhgppLai29uZlduHyZQetTlPSP90s4UZR5v08kw11LcT0JDeth
         mzhCMQsIYqcOfpEcAoYOmF0FJr45VEt61+KZF58a1/O8qcu5s7nwBtfCTch8hurLeI+r
         gSeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629692; x=1785234492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIe5hlvQfgQeGemklPcQXzjZsFGmFJ7H9Gsm+LXx4M4=;
        b=Bmg8ESCATSx+BVtF6OMOux40fAdBP6ZfYn7f1ybvaxkhqBQUWN9XFYmDdjqZCvysZ6
         mnJRKqR1ca/J3WsTcJQUwHyyKBOkl8hnUuyPyIMqSg0qujYIwhn6Ixe59btPOSLmwMhq
         zxvOpqLGVZoBqmGqWa0dybP7YsUsJQOSIckZnpLean+HFYtZQx8FLyzvwLL2v3dkFng0
         eGjBw6xMvfC9ZkLh7H7vEnh9qSZ9ine+yVfZiz6f7U3CPFqTI3M8znlQBzjRlprpnIFi
         RCHUX0N87rojh496CRRkE8nPoXO65kRxqTTENOmvtfM5kzzCWdretbGECvv7LqSQXV7c
         9dbw==
X-Forwarded-Encrypted: i=1; AHgh+RrebTETyLfJPyM6seLiFnO9qaZMi9JQ+rZOUr/LRXmpNy4+t1eg5TfIlcxdQC0ZNDuRrz0GqbyWrT07uwVo@vger.kernel.org
X-Gm-Message-State: AOJu0YzA+TJRD4nCMNRvS+dgsxUYPomSsiP9IMquhryXHFSkXIZDuAHp
	hcnLm5Yi2ne5S0MznC2GT9MrOpuMW5jgJieDf3jHzZAzeprnGUy8jDik
X-Gm-Gg: AR+sD13XfiOt52ChSgWDk2qhi8LEv4T59Ey6xU7+fGsGBe6laahMbh2e+hO7p5dmEWH
	CLgr1TpNpxOPYY28Pq84OA+kCYXVGKT9XWIr5tlKeE2ZgighBrqjmu7tIJFBh8qqXbuzbIHsrgE
	OqPxDIlEoCt0sAJSbhEFDOdBVbk36PdxJthDT1HlSz3a8i9OsEHpfMoxMyJ4PlkYtCsLwBybmmp
	rdN5u5XKmJbYGXaYfl4b1PLOtrE64N+SoY4BCyY2oJ5B3+paV6lehpaQPnE4mFuHg3gfAdnTD+5
	IXP2kJtCaikfSjgSslxXLwomxyG9ozULSLYko591LF4WPlvcLnaVfjhf6GMbza6vIMuw1LcEnji
	8z5s081KlF6itD28A/36PqM5UaovKTGxlMjjd2lnQhQnNEZc7AzzV1+mjpte8WNtZO+lOT4Voh8
	ui7mLXoGZxcnCQDBWIsehybuf9gL2sz8NSdVlj
X-Received: by 2002:a17:902:e848:b0:2ce:fa3a:45f7 with SMTP id d9443c01a7336-2cf3485b0d8mr200674385ad.16.1784629691883;
        Tue, 21 Jul 2026 03:28:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:11 -0700 (PDT)
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
Subject: [PATCH v4 14/29] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:45 +0700
Message-ID: <20260721102600.523199-15-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/pcm512x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index 10868df3c75d..bf143e3fec54 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -6,7 +6,7 @@
  *		Copyright 2014 Linaro Ltd
  */
 
-
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
@@ -399,10 +399,9 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 	ucontrol->value.integer.value[0] = !(pcm512x->mute & 0x4);
 	ucontrol->value.integer.value[1] = !(pcm512x->mute & 0x2);
-	mutex_unlock(&pcm512x->mutex);
 
 	return 0;
 }
@@ -414,7 +413,7 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if ((pcm512x->mute & 0x4) == (ucontrol->value.integer.value[0] << 2)) {
 		pcm512x->mute ^= 0x4;
@@ -430,13 +429,10 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
 			return ret;
 		}
 	}
 
-	mutex_unlock(&pcm512x->mutex);
-
 	return changed;
 }
 
@@ -1465,7 +1461,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 	unsigned int mute_det;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
 		pcm512x->mute |= 0x1;
@@ -1475,7 +1471,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1488,7 +1484,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1499,9 +1495,6 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 					 200, 10000);
 	}
 
-unlock:
-	mutex_unlock(&pcm512x->mutex);
-
 	return ret;
 }
 
-- 
2.43.0

