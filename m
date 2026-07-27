Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A6493F1AA1
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145390; cv=none; b=bjcV1VIdJMNqNVOmQctcUUZCtnMmpjMI4TdeeCeZFLVXpXrL5UyLA3uhYPlg8O3kgtg9/LILd1miWyzJWkr1ZvoFx7IDO7I4rjRLXNdrstaP+9P7z3P6IeOBH16g937Tbw+M5UA2ES3lySfglnpjB4BYanKouFckaxsxcC0ssBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145390; c=relaxed/simple;
	bh=jJta1wP6Gxka/gvOOEwLo5cIEFpwWGZWGRX7SMxpNTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6is7GeWNNjnm6mcDApJjsyUbqKkzcauCemJoFr00q1lBuCmn81OuXDW2x6S428COJwfshwvo2+Hyqbn232RNaMw4R7e5xKOZYd+diWPH8qeF53qoFtKT5BZVWESmn8WVlGoIQrkjUIU3rFyDz7iGx7DmCYvtN7IQHpB3YWGOYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p6zZWO4W; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p6zZWO4W"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so1661721a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145381; x=1785750181; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJN91k1ihxweTvZ2euRdyyI5ivn2nMtlaxC9t7yRgHQ=;
        b=p6zZWO4WFNSf4I29PAY/+16CueKGg7gFvNimi9yC37eoF9kXjRm3LZpGCqgfyw8MJt
         iA2RqAh64rEduuLqD+f//zO5KOhm7mxkYlLTaZDyYm5xDNfTYbZ04bT7863hLK5c44ZN
         Ws25fO+xjZOPQb1PItnKMGN680SKyRjJhJQpOYb6J1j1bHbQgpVjQi7sXzw9CkMg5ysd
         OkgdyduulDT0vZJIZhBK1O2YI9rGmPuUnkfQLPTqEU7yLSp+S0hUHH7fMjafVlE4c4dH
         IksYOPNenSB5I83E4gAbGg+/A9zTjDFDd/JgmWiLkjHpeKzHkzAlYis1CMgqPbCZnxqm
         PWnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145381; x=1785750181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJN91k1ihxweTvZ2euRdyyI5ivn2nMtlaxC9t7yRgHQ=;
        b=XeO2uCD4M44AgkpGFrzMdOpoX0VrjmxvtzrI2HpOCF6NpdkQJi+kyCvLOfTp+bFB9I
         1LPvYNupjfxaRFwKxjy9Dcmzw6r5du6Ju82MMvb9xwLFxjimQMNMq1bZs8gy3xFFO+dE
         yqPQbdH8G2fDUdnMjY2LWc1+HC/3SHtfZi+ysNRZo4jwkinpks4JQMk8NRzBy+4gFN8d
         Ok+nTkmzRA7K8L2vCMUQ1wF37eRhXAigg4emeHr0v6/1MG9PUfYWSQmJq+FBBujIkvqe
         lWU92JQ8pQk2CMA9kSGdAGmVK3BAYS+6aeAl3qUauiO9KNhtaNkgl6sfW+OmOWHlZlO8
         KctQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjxRiiaR+HZHtSlninWkvvemrn8xgdVMQb2RgofRphx8ZLztQAffvTMqHzssbQOh5DdyIU45ux+RREBXAO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8sDDIozIawgQajArAQP6uTY2eyoaS8KyvY4um/OY6Kvba7PGR
	ApNbZeZWu2v80iN378KNadQhlCtVpGdRRqEOUeBmUAUJz85QSmkW4rXW
X-Gm-Gg: AR+sD13I0EsPPcChcoFHO9izL15Blry5WDcSUGfbtQFDad4qga+m0ULs+ORSDlfPl3P
	I7eOjV3pv7hLCJ8O2Rb9RBpUwDHLaeozjdUHOeQ5hOYQZxV2kHoA1NMIpJXY0BqidJV0GIAxs3j
	QOTel07WMCm3OuEjB5ZjR4AGvNBt4eE4f78cFN9T3tCbOSqcxukgk8H2jJXr87TUFAuhDCkSg7m
	QuQ/cwLscPPYa7jLHhJi+qFq7Wq7CA36X+s/LUs/cXYoOppCGLLAX0tvRrrBhDJmgUqPz2cfnaL
	8k6YSl9lUOsnCj652cmn4sA2KCBPr5zzWPWxxd6E9s5GtcnU/T9Bx4r4Ws+2DPt3j35bcRbdnlp
	t/hzggUlt03/SX27qh8ZEnFyBqckJ5BmIbcIexS6uTtWge9Po3mWnDz0foklG03NA2DjCcPEzCG
	+chqcK8Yd+OS5JuCEfQdMOD+EJBxX8TBdJ67y1cfSDsODcQi/u7M/Oynp6igG3iD0H7ci5Oi+hc
	baSAodWbY8zGRpBquSByA==
X-Received: by 2002:a05:6a21:a346:b0:3b4:6026:6c5d with SMTP id adf61e73a8af0-3c67d9b40b6mr7806340637.5.1785145381283;
        Mon, 27 Jul 2026 02:43:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:01 -0700 (PDT)
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
Subject: [PATCH v2 06/26] ASoC: codecs: tas5805m: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:26 +0700
Message-ID: <20260727094046.23001-7-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas5805m.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/tas5805m.c b/sound/soc/codecs/tas5805m.c
index bcc8cab8d667..f76e04b403b5 100644
--- a/sound/soc/codecs/tas5805m.c
+++ b/sound/soc/codecs/tas5805m.c
@@ -12,6 +12,7 @@
 //
 // It has been simplified a little and reworked for the 5.x ALSA SoC API.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -230,10 +231,9 @@ static int tas5805m_vol_get(struct snd_kcontrol *kcontrol,
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	ucontrol->value.integer.value[0] = tas5805m->vol[0];
 	ucontrol->value.integer.value[1] = tas5805m->vol[1];
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
@@ -249,13 +249,12 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
-	int ret = 0;
 
 	if (!(volume_is_valid(ucontrol->value.integer.value[0]) &&
 	      volume_is_valid(ucontrol->value.integer.value[1])))
 		return -EINVAL;
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	if (tas5805m->vol[0] != ucontrol->value.integer.value[0] ||
 	    tas5805m->vol[1] != ucontrol->value.integer.value[1]) {
 		tas5805m->vol[0] = ucontrol->value.integer.value[0];
@@ -265,11 +264,10 @@ static int tas5805m_vol_put(struct snd_kcontrol *kcontrol,
 			tas5805m->is_powered);
 		if (tas5805m->is_powered)
 			tas5805m_refresh(tas5805m);
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&tas5805m->lock);
 
-	return ret;
+	return 0;
 }
 
 static const struct snd_kcontrol_new tas5805m_snd_controls[] = {
@@ -332,7 +330,7 @@ static void do_work(struct work_struct *work)
 
 	dev_dbg(&tas5805m->i2c->dev, "DSP startup\n");
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	/* We mustn't issue any I2C transactions until the I2S
 	 * clock is stable. Furthermore, we must allow a 5ms
 	 * delay after the first set of register writes to
@@ -345,7 +343,6 @@ static void do_work(struct work_struct *work)
 
 	tas5805m->is_powered = true;
 	tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 }
 
 static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
@@ -362,7 +359,7 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 		dev_dbg(component->dev, "DSP shutdown\n");
 		cancel_work_sync(&tas5805m->work);
 
-		mutex_lock(&tas5805m->lock);
+		guard(mutex)(&tas5805m->lock);
 		if (tas5805m->is_powered) {
 			tas5805m->is_powered = false;
 
@@ -379,7 +376,6 @@ static int tas5805m_dac_event(struct snd_soc_dapm_widget *w,
 
 			regmap_write(rm, REG_DEVICE_CTRL_2, DCTRL2_MODE_HIZ);
 		}
-		mutex_unlock(&tas5805m->lock);
 	}
 
 	return 0;
@@ -414,14 +410,13 @@ static int tas5805m_mute(struct snd_soc_dai *dai, int mute, int direction)
 	struct tas5805m_priv *tas5805m =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&tas5805m->lock);
+	guard(mutex)(&tas5805m->lock);
 	dev_dbg(component->dev, "set mute=%d (is_powered=%d)\n",
 		mute, tas5805m->is_powered);
 
 	tas5805m->is_muted = mute;
 	if (tas5805m->is_powered)
 		tas5805m_refresh(tas5805m);
-	mutex_unlock(&tas5805m->lock);
 
 	return 0;
 }
-- 
2.43.0

