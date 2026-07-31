Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AC7343D8A
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467447; cv=none; b=q4c1L8sfsgbb6uVFbMRYGLFbVLxp8vLsNhbFroyW4ivQL3BHwCZBagYjQuI5viqklAFNY/ZB8sm+95jTiu7ZbVlKsI0L64+LV/g4dkka/nSlYOBdvPKODw0o8SW3y8WWj31yc7oD0nS1a3CJ6E4zbKUZ86/ytI96j4xLTxQoxBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467447; c=relaxed/simple;
	bh=4P3qOSBkZIQJD0dP/avNyHuYesAgPsaLhYxvXxAmErk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QwmJPrMuhYeSSw68pin/deD0hBadM8SoZseNfef2sn18EUShMA5GAUAmPFcjDiwyeiNY9vva1YSRO+8kqlRaIYwY81gxtI2fdqQhgC9WiSGo9So1dibqOSaPYpBTCmEJMB6kNoc9mfpt1MAG0tmaBqIcYe0lAkDdgRDw8i5W148=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UEUeqjqe; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UEUeqjqe"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so6777265ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467445; x=1786072245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMaTaVppxtdBT/aFQQkrTJ9dhpXa6DmRNwQ/jLrNZ78=;
        b=UEUeqjqeXQUePY1R48GiQWWFHa1cm3YdDrSuozkPPZzj/viQ/DYhN40IZ5LFEEVQ+U
         MbncjIWrcJFWdG6c7UiKvE3bwNlJx7vWKvkAzrJe2zYE03Hc4xvPc3HHv1S+TFOIHXvK
         Op31P1qNFc0NQSFkVRIVPI35WY39VKFxemfDx4hF1Z6fkn1hT+xITrA94wHUdKSwh3Ov
         haQbCIdWalHFtnjAx+pwfIV4N5lF/aLcImFhamU0DHv/KAg4mhnPBXh5PSNS8O6dTTqE
         wJcgR3rkRxX+nyDi+mHefC0mzmZ/kWm2qfIRp2FmkvvkuhaUL29jI7l486jZhRyhnFMd
         4PTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467445; x=1786072245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMaTaVppxtdBT/aFQQkrTJ9dhpXa6DmRNwQ/jLrNZ78=;
        b=K13UKl9ThuIfDpOV9zTGfinwA5IDdMyB/r2EZuFcvGDNcZQFZFbPAIue6VYKgD3WFG
         mEI6BEoZOUTdBSknYnaFuu5/RydL8s1sZfBS+AkF5PLzms0EIRm/pRSNzK28T+a48iYN
         6nWT3l8aSU9O4IG80aZsiw98wmQBuDtBzw+W5nLBi11qQg37OJvVc1sGtn6arIeLvHoY
         nJvzlT952SfZaOM1yO/AruiAx7MoYVcKofQ8t3OCBqgMiBOr9+dsTrr6mgGW3zkK6Fxf
         jBfgF/InceVpD64g1e3ac9usy6pXsWi8ocEqBAlJZTODPEUQTsgpf7vdtFhsHYBQZ11a
         Cciw==
X-Forwarded-Encrypted: i=1; AHgh+RobJ+O3rA874+bQOvyjBxpBsCzX/4WdpnxFyOgtnCNGTaZCzQDmEPbFtfSAB878DTVkanTO4JQpjBmOQf7y@vger.kernel.org
X-Gm-Message-State: AOJu0Yz54vWgzrS5INkWHIdVNiOjiKuBoPVEuXs+xrXF47N5ICYyOpBd
	y7vyWap/edkMYAKLBoQASQwqQAYvzqgpbjIobLShAKnBY66lVw2XKso3
X-Gm-Gg: AR+sD10JLitJqpdNJxnNCl2TATWuu4B/Mj3dXgP7zB/zfTdF7AvtCL6K9Ycf1Z0aYb/
	X553NznXJJ3tApSB4Y9xfmQQE3WHmCwl6YeHSJycv0qxGvo9WXyNXutAEBHTnC8eaiQ84QQ7Zwy
	Wt5+cRRQr35pZZVb/zBVc6bzRG+kazwlhifyPZ7eZ87m+g1PRFMrUGZOu6BHt6XoQFnXKy+pSWP
	lp7Y3ir0sesvzh73YD6A/prWACG4hHP/JxHe2HHC78334uy/Slj/p9XMsnXTPvEsvK7YC7AbyfU
	t9U9+gNKeH66OZXv52nfw4M+y5V3xf80LlS74B6ESjL5lH3OAGOKUEiODnRqPpnwSjHu1/z5m93
	kP3nYRqRYKSyNs7QJBLgHIcCAgOXsyCFTjsfEnEhqFrvdXux9CPJpiInKorUiaPUegA+bdrZHRJ
	voiaLENYLqhu+RsI6liE6LHAzvUxSYlBVB+bwBNmXh9e140j0I1U9f4GBxEBazupjsytlOqyHjx
	lTv3aDdaA0YBJBH2l+BAwiLIZ59IGxxKepqYjezqwNVbnr6PIUzGx1LiLz/aJWZzDqjlaotXTyH
	hEeB
X-Received: by 2002:a17:902:d491:b0:2cc:77f3:a934 with SMTP id d9443c01a7336-2d046f20b76mr4877715ad.46.1785467444852;
        Thu, 30 Jul 2026 20:10:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:10:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
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
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 07/26] ASoC: codecs: tlv320dac33: Use guard() for mutex & spin locks
Date: Fri, 31 Jul 2026 10:06:29 +0700
Message-ID: <20260731030648.8706-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex & spin locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/tlv320dac33.c | 87 ++++++++++++++--------------------
 1 file changed, 36 insertions(+), 51 deletions(-)

diff --git a/sound/soc/codecs/tlv320dac33.c b/sound/soc/codecs/tlv320dac33.c
index 223c49dfc450..9bd2ddd8dacd 100644
--- a/sound/soc/codecs/tlv320dac33.c
+++ b/sound/soc/codecs/tlv320dac33.c
@@ -7,6 +7,7 @@
  * Copyright:   (C) 2009 Nokia Corporation
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -236,13 +237,10 @@ static int dac33_write_locked(struct snd_soc_component *component, unsigned int
 			      unsigned int value)
 {
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&dac33->mutex);
-	ret = dac33_write(component, reg, value);
-	mutex_unlock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 
-	return ret;
+	return dac33_write(component, reg, value);
 }
 
 #define DAC33_I2C_ADDR_AUTOINC	0x80
@@ -365,13 +363,13 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 
 	/* Safety check */
 	if (unlikely(power == dac33->chip_power)) {
 		dev_dbg(component->dev, "Trying to set the same power state: %s\n",
 			power ? "ON" : "OFF");
-		goto exit;
+		return ret;
 	}
 
 	if (power) {
@@ -380,7 +378,7 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to enable supplies: %d\n", ret);
-			goto exit;
+			return ret;
 		}
 
 		if (dac33->reset_gpiod) {
@@ -388,7 +386,7 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 			if (ret < 0) {
 				dev_err(&dac33->i2c->dev,
 					"Failed to set reset GPIO: %d\n", ret);
-				goto exit;
+				return ret;
 			}
 		}
 
@@ -400,7 +398,7 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 			if (ret < 0) {
 				dev_err(&dac33->i2c->dev,
 					"Failed to set reset GPIO: %d\n", ret);
-				goto exit;
+				return ret;
 			}
 		}
 
@@ -409,14 +407,12 @@ static int dac33_hard_power(struct snd_soc_component *component, int power)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to disable supplies: %d\n", ret);
-			goto exit;
+			return ret;
 		}
 
 		dac33->chip_power = 0;
 	}
 
-exit:
-	mutex_unlock(&dac33->mutex);
 	return ret;
 }
 
@@ -659,7 +655,6 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 {
 	struct snd_soc_component *component = dac33->component;
 	unsigned int delay;
-	unsigned long flags;
 
 	switch (dac33->fifo_mode) {
 	case DAC33_FIFO_MODE1:
@@ -667,10 +662,10 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 			DAC33_THRREG(dac33->nsample));
 
 		/* Take the timestamps */
-		spin_lock_irqsave(&dac33->lock, flags);
-		dac33->t_stamp2 = ktime_to_us(ktime_get());
-		dac33->t_stamp1 = dac33->t_stamp2;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			dac33->t_stamp2 = ktime_to_us(ktime_get());
+			dac33->t_stamp1 = dac33->t_stamp2;
+		}
 
 		dac33_write16(component, DAC33_PREFILL_MSB,
 				DAC33_THRREG(dac33->alarm_threshold));
@@ -682,11 +677,11 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 		break;
 	case DAC33_FIFO_MODE7:
 		/* Take the timestamp */
-		spin_lock_irqsave(&dac33->lock, flags);
-		dac33->t_stamp1 = ktime_to_us(ktime_get());
-		/* Move back the timestamp with drain time */
-		dac33->t_stamp1 -= dac33->mode7_us_to_lthr;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			dac33->t_stamp1 = ktime_to_us(ktime_get());
+			/* Move back the timestamp with drain time */
+			dac33->t_stamp1 -= dac33->mode7_us_to_lthr;
+		}
 
 		dac33_write16(component, DAC33_PREFILL_MSB,
 				DAC33_THRREG(DAC33_MODE7_MARGIN));
@@ -704,14 +699,12 @@ static inline void dac33_prefill_handler(struct tlv320dac33_priv *dac33)
 static inline void dac33_playback_handler(struct tlv320dac33_priv *dac33)
 {
 	struct snd_soc_component *component = dac33->component;
-	unsigned long flags;
 
 	switch (dac33->fifo_mode) {
 	case DAC33_FIFO_MODE1:
 		/* Take the timestamp */
-		spin_lock_irqsave(&dac33->lock, flags);
-		dac33->t_stamp2 = ktime_to_us(ktime_get());
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock)
+			dac33->t_stamp2 = ktime_to_us(ktime_get());
 
 		dac33_write16(component, DAC33_NSAMPLE_MSB,
 				DAC33_THRREG(dac33->nsample));
@@ -735,7 +728,7 @@ static void dac33_work(struct work_struct *work)
 	dac33 = container_of(work, struct tlv320dac33_priv, work);
 	component = dac33->component;
 
-	mutex_lock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 	switch (dac33->state) {
 	case DAC33_PREFILL:
 		dac33->state = DAC33_PLAYBACK;
@@ -757,18 +750,15 @@ static void dac33_work(struct work_struct *work)
 		dac33_write(component, DAC33_FIFO_CTRL_A, reg);
 		break;
 	}
-	mutex_unlock(&dac33->mutex);
 }
 
 static irqreturn_t dac33_interrupt_handler(int irq, void *dev)
 {
 	struct snd_soc_component *component = dev;
 	struct tlv320dac33_priv *dac33 = snd_soc_component_get_drvdata(component);
-	unsigned long flags;
 
-	spin_lock_irqsave(&dac33->lock, flags);
-	dac33->t_stamp1 = ktime_to_us(ktime_get());
-	spin_unlock_irqrestore(&dac33->lock, flags);
+	scoped_guard(spinlock_irqsave, &dac33->lock)
+		dac33->t_stamp1 = ktime_to_us(ktime_get());
 
 	/* Do not schedule the workqueue in Mode7 */
 	if (dac33->fifo_mode != DAC33_FIFO_MODE7)
@@ -902,14 +892,13 @@ static int dac33_prepare_chip(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
-	mutex_lock(&dac33->mutex);
+	guard(mutex)(&dac33->mutex);
 
 	if (!dac33->chip_power) {
 		/*
 		 * Chip is not powered yet.
 		 * Do the init in the dac33_set_bias_level later.
 		 */
-		mutex_unlock(&dac33->mutex);
 		return 0;
 	}
 
@@ -1053,8 +1042,6 @@ static int dac33_prepare_chip(struct snd_pcm_substream *substream,
 		break;
 	}
 
-	mutex_unlock(&dac33->mutex);
-
 	return 0;
 }
 
@@ -1156,21 +1143,20 @@ static snd_pcm_sframes_t dac33_dai_delay(
 	unsigned int time_delta, uthr;
 	int samples_out, samples_in, samples;
 	snd_pcm_sframes_t delay = 0;
-	unsigned long flags;
 
 	switch (dac33->fifo_mode) {
 	case DAC33_FIFO_BYPASS:
 		break;
 	case DAC33_FIFO_MODE1:
-		spin_lock_irqsave(&dac33->lock, flags);
-		t0 = dac33->t_stamp1;
-		t1 = dac33->t_stamp2;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			t0 = dac33->t_stamp1;
+			t1 = dac33->t_stamp2;
+		}
 		t_now = ktime_to_us(ktime_get());
 
 		/* We have not started to fill the FIFO yet, delay is 0 */
 		if (!t1)
-			goto out;
+			return 0;
 
 		if (t0 > t1) {
 			/*
@@ -1230,23 +1216,22 @@ static snd_pcm_sframes_t dac33_dai_delay(
 		}
 		break;
 	case DAC33_FIFO_MODE7:
-		spin_lock_irqsave(&dac33->lock, flags);
-		t0 = dac33->t_stamp1;
-		uthr = dac33->uthr;
-		spin_unlock_irqrestore(&dac33->lock, flags);
+		scoped_guard(spinlock_irqsave, &dac33->lock) {
+			t0 = dac33->t_stamp1;
+			uthr = dac33->uthr;
+		}
 		t_now = ktime_to_us(ktime_get());
 
 		/* We have not started to fill the FIFO yet, delay is 0 */
 		if (!t0)
-			goto out;
+			return 0;
 
 		if (t_now <= t0) {
 			/*
 			 * Either the timestamps are messed or equal. Report
 			 * maximum delay
 			 */
-			delay = uthr;
-			goto out;
+			return uthr;
 		}
 
 		time_delta = t_now - t0;
@@ -1287,7 +1272,7 @@ static snd_pcm_sframes_t dac33_dai_delay(
 							dac33->fifo_mode);
 		break;
 	}
-out:
+
 	return delay;
 }
 
-- 
2.43.0

