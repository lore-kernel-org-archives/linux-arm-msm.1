Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE5848034A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629631; cv=none; b=HgsWultkaqbL7NcXzfCa3OsG3SUAhAu0OkAFAkLEJHCuTPoaS2pqMaIvR3uvxQeEeDAHV+a10zJ2YVIGzPPIt04UfTSmE65trVPFeZrKZriAbfhWf/2NxaB9+onTC4uA8DLZYPH9UnPXpXhTN/efJD1Btld+H+ROD6+wYuJoqIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629631; c=relaxed/simple;
	bh=OOr9f8nEuRuifnXBOKpjEKREXStsjY+xFhxihGnYiNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jk0xvOBnMB/+xrnKzOJZJnGxF9BUQVBVXgjV9o1YxR8VJk1OOSZTH7c9I9AFUHP6iV+MuAP83sWoj2VnEXxVQMNqemh4pgTie8FcMhwOQAaZ3v+VTnVoisP6q8hx/xADUWcDlLkPC12JCMeKfKIF+NCZ7Da6quzp3JLn2KIQPV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C04gOX6B; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C04gOX6B"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc891373e0so139035105ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629628; x=1785234428; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gjBdDL8q0TXPbaumSZVEGnGR8oe3cQ900YMwBCNq4N4=;
        b=C04gOX6BWqYc8G9DaV7NaNWn4VQiJChKmp8ZdiH36NYE2Gl8KkhuclRZTTeVyvfDx4
         fd2rTy7Cis2J9+qCuvPM4pAoOBr/hVmzAUdSl1pWgortTiM/oEKfB/V14DaSxbMF6Sm7
         gBRDnIxt4E8uCBMiVfyH+IfstgsjfKoZDC/zr3DYi5NEMxZsfcYWWTfMS2v6CRQNqbRl
         Qhipiseeo0u/wgvzKZVl7kyQNr65WU5qkYreHFb06m77dxbDcw7ahUyQoqg2y1ZtXedm
         DJxdIOgkz3T/V1Z2ubiqzfloyPquvv0n7efgoeOWGlP6pkeoR1cgPbWo291xT2znzHwu
         nvOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629628; x=1785234428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gjBdDL8q0TXPbaumSZVEGnGR8oe3cQ900YMwBCNq4N4=;
        b=jML5KRNRTKkWrfa6/fjO6rlWufupIZJrL6dnpccN9gk5AwOHyzCXHtqgrbgeTqEHHS
         T4rkuROG1CpA3gJlKZEvU7SQjJE2WwQI8nkDAb0KZvlEwjahNqTI9Z8XMHTkCRzYGFAx
         jeQyi9BLMkoJtH5UtrcfrNXxh+mpPaTorfF/7iZCAzqW6TXVbquwlYcTyo158H8Al++d
         W7Wj4HPhguorNk2qzig/AuSZHYWIFQkV3NMbOfPnYYqvP6x20jcJ4BKiRJeIdABbQGbU
         uMnqPO/+9xa7crn1dlJ41/Cr99/MgVkTW0QdxKz3NNuh9UfTm/Qj/v2pAU/L/S7azHx8
         y4vA==
X-Forwarded-Encrypted: i=1; AHgh+RraSZIHBh0abX8QSgK4RXgJYMUUBCGm/vkhwBkUjwEj8WaMm/+vTbR14fnBdAFGaf4YiAFiFhPRlCqq6tt5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8NGuk7obImzLVnLBYaKc5LcQ2RhMnB+NbSTraskmI+Jxwyq8a
	lBp4bJ0ur2geWjKzW9VP3d1kmA8Wlx2v2qf/rkod9gc9uDFbme3KapwD
X-Gm-Gg: AR+sD12x/V3rMn5aCLbNj/q98zE82W7KOohrMNlzrGB1ZoOjiqVO7rVmKJewNK0uZCn
	DuqXvRNY7R0XoT+K3aa2FHXZEDOIQCcsTWsSHSefOgN4ssu3GY7REWocxsSH4oBcTSbb2ugrdVs
	XlKdLGyxEbtC4z0dMQ603vog775chSjHHprxF7dgPRnPXommaDh6UCCiJ3PE7JX7GiM02SnUKDJ
	0l0dYgVIKiAOKM5+isFJAMeaKgzXdnqgoblAaSs7VLlI61aV7oHDBOc0nK5qJ9TgZdVng4EEapt
	UiG2U0RfC0O05QbYoXtFCUMWhKAS5gAs36S8LTwhSFo4hBgb8Sr7BQwo33uHrTTfGG0wM+pqtQB
	o/vNs6QXRhMwtbzm6+SH6n58n0du5TOJTBYIHzGjTHuWvlFHwt0Z6zJLvq1e8wp2eawxK2JZfk3
	+47yg9zqqJqRzVTseBFO7rZpt+8IxE5MMYLG+E
X-Received: by 2002:a17:902:c950:b0:2cf:7e56:22c4 with SMTP id d9443c01a7336-2cf7e56274emr38581895ad.30.1784629628416;
        Tue, 21 Jul 2026 03:27:08 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:08 -0700 (PDT)
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
Subject: [PATCH v4 06/29] ASoC: codecs: fs210x: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:37 +0700
Message-ID: <20260721102600.523199-7-phucduc.bui@gmail.com>
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
 sound/soc/codecs/fs210x.c | 89 ++++++++++++++-------------------------
 1 file changed, 31 insertions(+), 58 deletions(-)

diff --git a/sound/soc/codecs/fs210x.c b/sound/soc/codecs/fs210x.c
index d794ff918b6f..510cbeea5b62 100644
--- a/sound/soc/codecs/fs210x.c
+++ b/sound/soc/codecs/fs210x.c
@@ -4,6 +4,7 @@
 //
 // Copyright (C) 2016-2025 Shanghai FourSemi Semiconductor Co.,Ltd.
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -771,9 +772,8 @@ static int fs210x_dai_hw_params(struct snd_pcm_substream *substream,
 	if (fs210x->devid == FS2105S_DEVICE_ID && fs210x->srate == 16000)
 		return -EOPNOTSUPP;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_set_hw_params(fs210x);
-	mutex_unlock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock)
+		ret = fs210x_set_hw_params(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set hw params: %d\n", ret);
 
@@ -790,15 +790,11 @@ static int fs210x_dai_mute(struct snd_soc_dai *dai, int mute, int stream)
 
 	fs210x = snd_soc_component_get_drvdata(dai->component);
 
-	mutex_lock(&fs210x->lock);
-
-	if (!fs210x->is_inited || fs210x->is_suspended) {
-		mutex_unlock(&fs210x->lock);
-		return 0;
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended)
+			return 0;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	if (mute) {
 		cancel_delayed_work_sync(&fs210x->fault_check_work);
 		cancel_delayed_work_sync(&fs210x->start_work);
@@ -817,15 +813,11 @@ static int fs210x_dai_trigger(struct snd_pcm_substream *substream,
 
 	fs210x = snd_soc_component_get_drvdata(dai->component);
 
-	mutex_lock(&fs210x->lock);
-
-	if (!fs210x->is_inited || fs210x->is_suspended || fs210x->is_playing) {
-		mutex_unlock(&fs210x->lock);
-		return 0;
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended || fs210x->is_playing)
+			return 0;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
 	case SNDRV_PCM_TRIGGER_RESUME:
@@ -853,13 +845,11 @@ static void fs210x_start_work(struct work_struct *work)
 
 	fs210x = container_of(work, struct fs210x_priv, start_work.work);
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	ret = fs210x_dev_play(fs210x);
 	if (ret)
 		dev_err(fs210x->dev, "Failed to start playing: %d\n", ret);
-
-	mutex_unlock(&fs210x->lock);
 }
 
 static void fs210x_fault_check_work(struct work_struct *work)
@@ -870,15 +860,13 @@ static void fs210x_fault_check_work(struct work_struct *work)
 
 	fs210x = container_of(work, struct fs210x_priv, fault_check_work.work);
 
-	mutex_lock(&fs210x->lock);
+	scoped_guard(mutex, &fs210x->lock) {
+		if (!fs210x->is_inited || fs210x->is_suspended || !fs210x->is_playing)
+			return;
 
-	if (!fs210x->is_inited || fs210x->is_suspended || !fs210x->is_playing) {
-		mutex_unlock(&fs210x->lock);
-		return;
+		ret = fs210x_reg_read(fs210x, FS210X_05H_ANASTAT, &status);
 	}
 
-	ret = fs210x_reg_read(fs210x, FS210X_05H_ANASTAT, &status);
-	mutex_unlock(&fs210x->lock);
 	if (ret)
 		return;
 
@@ -991,7 +979,7 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	if (fs210x->scene_id < 1)
 		return -EINVAL;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 	/*
 	 * FS210x has scene(s) as below:
 	 * init scene: id = 0
@@ -1000,7 +988,6 @@ static int fs210x_effect_scene_get(struct snd_kcontrol *kcontrol,
 	 */
 	index = fs210x->scene_id - 1;
 	ucontrol->value.integer.value[0] = index;
-	mutex_unlock(&fs210x->lock);
 
 	return 0;
 }
@@ -1019,7 +1006,7 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 		return -EINVAL;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	/*
 	 * FS210x has scene(s) as below:
@@ -1029,17 +1016,14 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	 */
 	scene_id = ucontrol->value.integer.value[0] + 1;
 	scene_count = fs210x->amp_lib.scene_count - 1; /* Skip init scene */
-	if (scene_id < 1 || scene_id > scene_count) {
-		mutex_unlock(&fs210x->lock);
+	if (scene_id < 1 || scene_id > scene_count)
 		return -ERANGE;
-	}
 
 	if (scene_id != fs210x->scene_id)
 		is_changed = true;
 
 	if (fs210x->is_suspended) {
 		fs210x->scene_id = scene_id;
-		mutex_unlock(&fs210x->lock);
 		return is_changed;
 	}
 
@@ -1047,8 +1031,6 @@ static int fs210x_effect_scene_put(struct snd_kcontrol *kcontrol,
 	if (ret)
 		dev_err(fs210x->dev, "Failed to set scene: %d\n", ret);
 
-	mutex_unlock(&fs210x->lock);
-
 	if (!ret && is_changed)
 		return 1;
 
@@ -1062,12 +1044,10 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 	struct fs210x_priv *fs210x = snd_soc_component_get_drvdata(cmpnt);
 	int ret = 0;
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
-	if (fs210x->is_suspended) {
-		mutex_unlock(&fs210x->lock);
+	if (fs210x->is_suspended)
 		return 0;
-	}
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -1088,8 +1068,6 @@ static int fs210x_playback_event(struct snd_soc_dapm_widget *w,
 		break;
 	}
 
-	mutex_unlock(&fs210x->lock);
-
 	return ret;
 }
 
@@ -1220,11 +1198,9 @@ static int fs210x_probe(struct snd_soc_component *cmpnt)
 	if (ret)
 		return ret;
 
-	mutex_lock(&fs210x->lock);
-	ret = fs210x_init_chip(fs210x);
-	mutex_unlock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
-	return ret;
+	return fs210x_init_chip(fs210x);
 }
 
 static void fs210x_remove(struct snd_soc_component *cmpnt)
@@ -1251,15 +1227,15 @@ static int fs210x_suspend(struct snd_soc_component *cmpnt)
 
 	regcache_cache_only(fs210x->regmap, true);
 
-	mutex_lock(&fs210x->lock);
-	fs210x->cur_scene = NULL;
-	fs210x->is_inited = false;
-	fs210x->is_playing = false;
-	fs210x->is_suspended = true;
+	scoped_guard(mutex, &fs210x->lock) {
+		fs210x->cur_scene = NULL;
+		fs210x->is_inited = false;
+		fs210x->is_playing = false;
+		fs210x->is_suspended = true;
 
-	gpiod_set_value_cansleep(fs210x->gpio_sdz, 1); /* Active */
-	fsleep(30000); /* >= 30ms */
-	mutex_unlock(&fs210x->lock);
+		gpiod_set_value_cansleep(fs210x->gpio_sdz, 1); /* Active */
+		fsleep(30000); /* >= 30ms */
+	}
 
 	cancel_delayed_work_sync(&fs210x->start_work);
 	cancel_delayed_work_sync(&fs210x->fault_check_work);
@@ -1288,14 +1264,11 @@ static int fs210x_resume(struct snd_soc_component *cmpnt)
 		return ret;
 	}
 
-	mutex_lock(&fs210x->lock);
+	guard(mutex)(&fs210x->lock);
 
 	fs210x->is_suspended = false;
-	ret = fs210x_init_chip(fs210x);
 
-	mutex_unlock(&fs210x->lock);
-
-	return ret;
+	return fs210x_init_chip(fs210x);
 }
 #else
 #define fs210x_suspend NULL
-- 
2.43.0

