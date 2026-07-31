Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DD5340A76
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467438; cv=none; b=tkmdL/FRiC8sNjlFC78uJFfBtI0bplaCjq6Q8BrcbHgUe/g9fbd8vZXvYBp2Whum1WVdsJKwmN++nJxLd7QeIyq17HcK5wGYXMXeEd0S+obTKa2lrgD1ri+GBxBikwVjhQ5+JeS0rbS3OpelQAnfUc4CtxdXpBBrFP2T5atT9jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467438; c=relaxed/simple;
	bh=jJta1wP6Gxka/gvOOEwLo5cIEFpwWGZWGRX7SMxpNTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YRH6uIEcXu4qsAGHYGv7v0yW1Xb/tZj6VyxDXu0DjExYcDiHX658tNMZXxtv/nlSXCAsyRs1PlPNLN6kcmBnwiukCZIHmEm/hACxP1QsJZi7iJq0gZL7bicqqIHCNc4gU9hZi9YihIs2uI8o8OkqMv0r4RfpLONFh762NjkqQEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ct4IBZNu; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ct4IBZNu"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cfff5f88dbso5035475ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467437; x=1786072237; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJN91k1ihxweTvZ2euRdyyI5ivn2nMtlaxC9t7yRgHQ=;
        b=ct4IBZNueNkKk5K1g5s150TxSvoR5qT3WoT/PK6u1maF36nu4sM3vydJaGPdDhMfu4
         Q+1Q7dafZFDY3iNxllQ5e+dIvKH+wDIgRb84G6mxdac78qvJj0WxEdgqkE9QAT5PCLku
         eknBZx25xR9Dm0VFdHhymfOotDFGVTEf5KHvMxsTWJ6suCYnQZqn26aZ8RVbouVGhCNf
         C+Kr2iVilI3pWDW/ASzTmh8tsO1Ku+4kwgYG3B89P8evDzEfwu7ma6PdeFwGg8Hfdtc/
         g8RvMnaCUYFtRFJEVqq2b7TmBZBKAg1lpHplmi3Fa2E03r+She2gJhbqrPuFdcZiyXU4
         XoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467437; x=1786072237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GJN91k1ihxweTvZ2euRdyyI5ivn2nMtlaxC9t7yRgHQ=;
        b=slrKztrBKyycQOx+v7MhqX3PoPILbAyE1BnIhjzaUqkEBv2fqnz5/Bn4tSKMz4kag9
         93bf3kX0vbbXVKYW9X+ckMYLwWNBWUWwaP/t+Uxv+VWkeV1Ka849s0inxZsIcJBiI5i7
         8hvniDWWhWKoee16EE4UXRvzDuN4CgdUQ4g1thMU8os+Q4Yl6A5EnqOlLZBfmOMz25lA
         ZPkLfjp79V6/G4xDPn3kibaPKRLNfKYN86yMlVbeZIBaBNTL85Sm3DqOeIcxFPQ1fNJu
         qQqJ8YzL/Jft25qbfrY6wzIAlrpDw+hMJWUidS5A578ts2zh8YZuQcxOj1ESRmI+KLd2
         trkA==
X-Forwarded-Encrypted: i=1; AHgh+RpC2RPcCRy204sxlhG3/0p73w2xYaVlcbPO0rCXx67BnjKE34NG3zlff0b7W2uder9teIzZYtqvEsSIatyN@vger.kernel.org
X-Gm-Message-State: AOJu0YwxzAtAfovw2WrPKhcs9o5Lyn4aoqa5gjSuYHbsXg4fhm+ckT0Q
	18SQbo3hU+W+Md+9Dad+dYiCYtAuKv9Ah8RQbzDY14gDvTBud/Vj0OOF
X-Gm-Gg: AR+sD12xPtsgHLBbX8BhGiKYcoAnrNBrxqO7RKpEgPTgasxbkOmXDkbMDyVLtzsXq4U
	c964kjo+yOPD6PRNbiw0Yws2QoPMoNrf5A0Rd5dLHJXnfRKkgypa1IwlE9aCW3eRqOCEMr16dOA
	/+jdaHf5TPbLsioce88WiVPuK7Wtl9afeEDBHpWgsAf5TZfaLrMleOWFPG0tRg4tMLaTI9BONuB
	HubmEyLYNhBJX9WEf9bOfZ/wrmQ9TWpIoGhWobM9A5+/G/9r79tSOQfLAZ89Gi5ni17Kc7c/6Ti
	sLNGMsvryIybqExBpeNNFMA993cf48m4Qdim3fZBcpGaMGZS7rFSMNIvlaL6k+qyg2fWYMZq4qb
	hT/7SinqGeJS/QeY25yIgKXzCibhw77F2B4e/It7jfEjC8O0NNN1qmR6zsk+NN/q7B0WmN3eeqr
	T2LkFi+4cBkVCLBxE1bfPyqFiYE8OpI8pQnp/YsSPuRrw/E2QmWDVvWQ6zQCU/USI7uLjR/m+RV
	UpD5Dza5/4Lcr/PvR8pSP3zBTT1fopL9Fck4HkKYSwEbVS5e6YtKjYiKcGX4eaPV1UioFgeexy9
	cxsL0rTk9Qf24uk=
X-Received: by 2002:a17:903:2b07:b0:2c9:cf41:adf9 with SMTP id d9443c01a7336-2d046ecdafemr5179845ad.47.1785467436860;
        Thu, 30 Jul 2026 20:10:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.10.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:10:36 -0700 (PDT)
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
Subject: [PATCH v3 06/26] ASoC: codecs: tas5805m: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:28 +0700
Message-ID: <20260731030648.8706-7-phucduc.bui@gmail.com>
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

