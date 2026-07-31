Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD5B347BBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467540; cv=none; b=Rwa947jh4kjOloI9h4yNBwlsxlbN9i4xJ2/AHnBjm8kjky5YDzDUfBmANgYoFd5On8kP4N7KOFTH0v6Uj0NVDLsXAq30OUyfSYgVg2gCND0tuOTZv9wKpn64M25K+Sh8ueNVERQs7CJlfxBRoG0tQcKOeDxbB7fu/11lUoaRFgQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467540; c=relaxed/simple;
	bh=2ZQcxyuElWSG2ZM+lBRNbAim+UgXbAvs1+qEvw0iTPg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ipg4LhJZGC3pvm47C1kj5j+SePV5NDfDmli/St4tNU3tRkYKNQGd0sJm4NjaT1Rwi9FS3SpiRjRgPE2ngr85+oB3hrg5kEgS/bf0+AtNUNgQIvfO8+wsnUB4ph+JzS4usaYy1BYROP1FEoQu4ShL+8i2apTNB/YN1ywnxRIiP6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M2uLYN1p; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M2uLYN1p"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cacb8416a1so5011245ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:12:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467538; x=1786072338; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pRp7w3aucssFRgkLpXLJWYD4cpAPyrp4T/SLglC5YPg=;
        b=M2uLYN1pdRjLcD+vYyS8eCCjuJAP0hKC1YSMpSM9dqZf0qAydJ7gyg0rc9XHuQ68JR
         Ql5rGlYC+PFYS7DTmpUopB+2YeIlh5Xs0Y8onBEa45xWSSexTelVfQUZ6OAsxXwDakEJ
         hVi39ae7JDyq8CyxiuM53cJIe/ss4MC80+Xo3IoEh6+HWkBfAbLFrqknq39wkhhD4LhU
         z4dxDvAGP0IaNkWS3/3NXnGQiRzuKDAEQabGo0oUIUIi4Nx4wCAe1c9dSakigxND1kSN
         SCZ+hk1F3hNxb9ORtZADC+m8DMMO4Y+M6lxfnMLmiLar+BQ8Hv8bq/Z2b/Zwpdp43j2V
         sIVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467538; x=1786072338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pRp7w3aucssFRgkLpXLJWYD4cpAPyrp4T/SLglC5YPg=;
        b=QSlOj4M5BhVH7hGpCCizz0ROw4DdrntkI77oqimFeKOoMq8tTtaquHt09Z1SpkjKBK
         jhrAGJLAanMasM94ouM/JhpPb63/CZ8WXQ/gjLlXOas+xn6ckjoh8cetcGc2qqa1cKOj
         HQSOq8iwrjj0lX38kG7BiHxT/4nzd6LL4Z/rlumDvxu1uLNrt440TPfd//9518drUlr2
         yWP8M72fvMfWoe/qJTcPsyQU5dlwOPlLX2l806fzbDcZDciuG049V4yC+VAeAO0R288T
         sMMO+wa2VaTAcI8orEU1SVSKq3pkscPzk/Y78EkECGW4NcHlJ+0JFM5UXQHyCMAwHEAc
         gg4A==
X-Forwarded-Encrypted: i=1; AHgh+RoTnXm3q35anu/bXVz44oJTgX8FKI/WuqJpmE24X+50QjCXwSJPS8I/3aoiwE949G/4NRlsfcK3arXYSmuf@vger.kernel.org
X-Gm-Message-State: AOJu0YwPQJE4KPJ38tAMMT4u5RprJaRnYHeDxbVB/gYlD1lGaS0oYQlv
	gnsX+YmSGkpxWgTn0z5pmpgnOTiZpt2Yqj2CSq2Vs0Z72g/z6CIYEVi7
X-Gm-Gg: AR+sD10LXj62oAwM6OFSzo2YV9y44/crdHM0FnC96NB/myDJEwVsyaH6DM/ZKtEyQh9
	5lrEGG2RtujImwdPZEJdunV9o4WuEFUJAdYbtqWPhmPtsvwFO7HXc0WBy28o+Ktz8BSp4WI9dlK
	9S/kOePky90SVKMowPmd/Ap7Ajq5Yfb/pQeXZ3ndLc9N8NRydApZjww/OVR0j4R7Yd5i+k4/k/5
	uppczK69Nc4qn1+c7j6EpISNqpXdxAq9OlonxlBU0ZPi2O8wu5Dk5DFVYu0V4R9nvZBh8cBFo2I
	EZDX/EuQ8fq938GTmTa6YeF0sAEnjSie49rnnhtgIr8GXZI4MDdV3BJCZ/WcgTpgFIPEL4MFW/k
	G/+23tmQW9hRrNxtwlJZelxo4Nkyguta+Eh6MRfUKJp1GjrRo6/NVNnTPGrMbVcpoqy1R/k47Kh
	aGcbJR6oaE1GBmoxljDGS5bPKba61BmrusQKUGbxN79iKNt+Z9/rv+57bvxA6YuqNNiD11Sk9kB
	MlNiSi8zeaKf9LGtE8DWLny3+qmqXyTcngx2aC9bGY1eEjIm+cCkhjxeNNOYTv4Mwji/4Jo3fwg
	NKjZ
X-Received: by 2002:a17:902:d2c8:b0:2cc:dacc:fe27 with SMTP id d9443c01a7336-2d046e70aecmr4504055ad.30.1785467537989;
        Thu, 30 Jul 2026 20:12:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:12:17 -0700 (PDT)
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
Subject: [PATCH v3 17/26] ASoC: codecs: wm2000: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:39 +0700
Message-ID: <20260731030648.8706-18-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm2000.c | 28 +++++++---------------------
 1 file changed, 7 insertions(+), 21 deletions(-)

diff --git a/sound/soc/codecs/wm2000.c b/sound/soc/codecs/wm2000.c
index 9b68ee69324b..897b0acac5f3 100644
--- a/sound/soc/codecs/wm2000.c
+++ b/sound/soc/codecs/wm2000.c
@@ -23,6 +23,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/firmware.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
@@ -612,20 +613,15 @@ static int wm2000_anc_mode_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int anc_active = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (anc_active > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->anc_active = anc_active;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static int wm2000_speaker_get(struct snd_kcontrol *kcontrol,
@@ -645,20 +641,15 @@ static int wm2000_speaker_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
 	unsigned int val = ucontrol->value.integer.value[0];
-	int ret;
 
 	if (val > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	wm2000->spk_ena = val;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_kcontrol_new wm2000_controls[] = {
@@ -676,9 +667,8 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 {
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct wm2000_priv *wm2000 = dev_get_drvdata(component->dev);
-	int ret;
 
-	mutex_lock(&wm2000->lock);
+	guard(mutex)(&wm2000->lock);
 
 	if (SND_SOC_DAPM_EVENT_ON(event))
 		wm2000->anc_eng_ena = 1;
@@ -686,11 +676,7 @@ static int wm2000_anc_power_event(struct snd_soc_dapm_widget *w,
 	if (SND_SOC_DAPM_EVENT_OFF(event))
 		wm2000->anc_eng_ena = 0;
 
-	ret = wm2000_anc_set_mode(wm2000);
-
-	mutex_unlock(&wm2000->lock);
-
-	return ret;
+	return wm2000_anc_set_mode(wm2000);
 }
 
 static const struct snd_soc_dapm_widget wm2000_dapm_widgets[] = {
-- 
2.43.0

