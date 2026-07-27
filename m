Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23E83F1ACF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145400; cv=none; b=eQQh3kDr5uxE4+uoNbOgAoNQIJof4PHEA5cCXcjw1wroqzitJhzuyS7rx3ocVTJNY+2EeaMQjQZjxz5WywsKwhtq1YDUTTsvIRCJyivEHNwaQj3deMQwcfSGQ8YAG4Hm11UvrHE4xIInO614QrWu+/3AV+HCgIY25iQHOucQXo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145400; c=relaxed/simple;
	bh=nZGVKfdU4GqxPhxmWCUGDD6Nc/KNfAjP7JAS+KPicHo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oSX8xVrSSu7IVD6bKJYaeyJHrSU3kRmAIpwU2bsIraLeIJw0Zyf6g4TV0/gtA3SLfeUNXd8F5b1Nzikbdv0LEcwq5Lcjq0ywYbHBCOtEJwRraJuyv43yKlGzovznUT33hFIMXIcIwEYYftQeDypLXW41t14BJQICMrSEvrgph0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NADrJpHI; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NADrJpHI"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84a4d8fd6ecso2442291b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145396; x=1785750196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2URIyRhsqdkSXLbHXTDfJ+qkOeAaYtVPXldxW4D65fM=;
        b=NADrJpHIeN9416h3yKSfKB2xM7BaBwjN7Hj648jiWV3qVmO+lFN1TnxxQB1Dv6ftjx
         7mwv7J0+GQRdhArU0mw82scm3mjosu23VRVMrMdENzFVjY2WtMV5klA2OK/5aDRLRUjU
         Q7ZCibgegnv8pzrZXnrnc3kqJIFJz2hXoNrQttFZOS5iLlK01YVtstb4KTPi99KXA32N
         UOBkryxSEtdD2WNC79f+60251eQhS+xqXXn9fHzrsOSSFb4xHfjNJu/G8nERBoCy2yRA
         DyJheUogqODvnSHKiDn9ySdS4q1cpeJ1aSpY36mOSS+8jz6YsXeBHr6KTOS8SpJb5tli
         iTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145396; x=1785750196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2URIyRhsqdkSXLbHXTDfJ+qkOeAaYtVPXldxW4D65fM=;
        b=pw+ULHOVnKcHZaKJTQrz1oA7J3XQuF66ERocPAo8WpuMllbE+tFZqRgSnRQd45lok/
         n1Jejnm1vXBFBSjIBvB54YpqngBf9vZ1vXs2miNRdk3nBMMiLxtehTZZul0gTi4qJtdh
         mOqy2vPuii68QXXEeD8DzuCeciAIHMxdqHQjgg+PvHYfxoFeprouYfZ1Lg9s9RPToax1
         czTq35vMavvC3zCtzzyDqXzmr+txhqWvyctbgkKVKsF7a+iJDCL8cFOYSUURefbND/2B
         bEO99CxWfFcIIY4NglhFlLs9rkdFRZcLtlT+W0MtyQ2u7xJivqDM/tLX+rn3V38zGQ+Y
         2T8Q==
X-Forwarded-Encrypted: i=1; AHgh+RoYHqdsXt5lCK2w6lZ8mLKMhJJ743iFY5r4jIo05Wm2rTXQa34I+GfyXd/GRwPTGCbKYEEkE3gL3UurqJNC@vger.kernel.org
X-Gm-Message-State: AOJu0YzRlbJtPcg1MNx0bXCCxz7a1M0hEUjTZn4m4Y4nWPZSrlqbWdWl
	SErBcvZgUE9jTUEpLaF0UPT3Hk6JMBb6f29UZkzZ9njsv4loQlI3AIJE
X-Gm-Gg: AR+sD12zOs7xLOdSB2W9QSnKV823bkVrTUUs00mnGLh7hdKMTFgdo3C1B12lATH7WTh
	dhqn1Dzyyf7ASbrZKWCfbDy2xVFKkbZ9hIb07Wf2umj+8ErRqRiNn/B/uE7DPdarlegMpU2Ltjv
	Xg//Zmge61Dnwn4tVUGAcYTegXBU7LGPJHw7n+D23TQ3Xg7PDuVLDlxlMVAClLszq5ZRSb4oeIJ
	IcG8sQV7e+J3HaT7sRXB+Y0sc3CFIoTpzOngsCidC6vvhJOZWok3DHitxt/dzrWzAQ3AisJO983
	649SyA0H+NnNdP7Fe8sZgGmdVqyBW8PkzPwFzwCCXYEmFznJgI7UC5CgqhkJOnvMyQsVWuamt+v
	EI50yJAL5mts3VYXQwm/2ynwwcETLhFP5wSYBiFr0i7uGCuxkqbes4A3hd5hA35+bpjkA8nal66
	vAVkpejEW7ywOvg8NMWjf/ReHUvTlyq8FCDrba4vijXgWGQKN2jnKuH7SN9gkCETVhlCG225N8P
	5yzDEX4TpnK8YKDmQPW8VvhU+v1nYnf
X-Received: by 2002:aa7:888a:0:b0:845:dde9:ab62 with SMTP id d2e1a72fcca58-84e5945d9acmr6134618b3a.19.1785145395610;
        Mon, 27 Jul 2026 02:43:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:15 -0700 (PDT)
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
Subject: [PATCH v2 08/26] ASoC: codecs: tscs42xx: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:28 +0700
Message-ID: <20260727094046.23001-9-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tscs42xx.c | 61 ++++++++++++-------------------------
 1 file changed, 19 insertions(+), 42 deletions(-)

diff --git a/sound/soc/codecs/tscs42xx.c b/sound/soc/codecs/tscs42xx.c
index dba581857920..02082ef790b4 100644
--- a/sound/soc/codecs/tscs42xx.c
+++ b/sound/soc/codecs/tscs42xx.c
@@ -12,6 +12,7 @@
 #include <linux/module.h>
 #include <linux/delay.h>
 #include <linux/mutex.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <sound/tlv.h>
 #include <sound/pcm_params.h>
@@ -210,25 +211,21 @@ static int power_up_audio_plls(struct snd_soc_component *component)
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C, mask, val);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL on (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
 	if (!plls_locked(component)) {
 		dev_err(component->dev, "Failed to lock plls\n");
 		ret = -ENOMSG;
-		goto exit;
+		return ret;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	return ret;
+	return 0;
 }
 
 static int power_down_audio_plls(struct snd_soc_component *component)
@@ -236,28 +233,24 @@ static int power_down_audio_plls(struct snd_soc_component *component)
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL1,
 			RV_PLLCTL1C_PDB_PLL1_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 	ret = snd_soc_component_update_bits(component, R_PLLCTL1C,
 			RM_PLLCTL1C_PDB_PLL2,
 			RV_PLLCTL1C_PDB_PLL2_DISABLE);
 	if (ret < 0) {
 		dev_err(component->dev, "Failed to turn PLL off (%d)\n", ret);
-		goto exit;
+		return ret;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	return ret;
+	return 0;
 }
 
 static int coeff_ram_get(struct snd_kcontrol *kcontrol,
@@ -269,13 +262,11 @@ static int coeff_ram_get(struct snd_kcontrol *kcontrol,
 		(struct coeff_ram_ctl *)kcontrol->private_value;
 	struct soc_bytes_ext *params = &ctl->bytes_ext;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	memcpy(ucontrol->value.bytes.data,
 		&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE], params->max);
 
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
 	return 0;
 }
 
@@ -290,14 +281,14 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 	unsigned int coeff_cnt = params->max / COEFF_SIZE;
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	tscs42xx->coeff_ram_synced = false;
 
 	memcpy(&tscs42xx->coeff_ram[ctl->addr * COEFF_SIZE],
 		ucontrol->value.bytes.data, params->max);
 
-	mutex_lock(&tscs42xx->pll_lock);
+	guard(mutex)(&tscs42xx->pll_lock);
 
 	if (plls_locked(component)) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram,
@@ -305,18 +296,12 @@ static int coeff_ram_put(struct snd_kcontrol *kcontrol,
 		if (ret < 0) {
 			dev_err(component->dev,
 				"Failed to flush coeff ram cache (%d)\n", ret);
-			goto exit;
+			return ret;
 		}
 		tscs42xx->coeff_ram_synced = true;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->pll_lock);
-
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
-	return ret;
+	return 0;
 }
 
 /* Input L Capture Route */
@@ -385,21 +370,17 @@ static int dac_event(struct snd_soc_dapm_widget *w,
 	struct tscs42xx *tscs42xx = snd_soc_component_get_drvdata(component);
 	int ret;
 
-	mutex_lock(&tscs42xx->coeff_ram_lock);
+	guard(mutex)(&tscs42xx->coeff_ram_lock);
 
 	if (!tscs42xx->coeff_ram_synced) {
 		ret = write_coeff_ram(component, tscs42xx->coeff_ram, 0x00,
 			COEFF_RAM_COEFF_COUNT);
 		if (ret < 0)
-			goto exit;
+			return ret;
 		tscs42xx->coeff_ram_synced = true;
 	}
 
-	ret = 0;
-exit:
-	mutex_unlock(&tscs42xx->coeff_ram_lock);
-
-	return ret;
+	return 0;
 }
 
 static const struct snd_soc_dapm_widget tscs42xx_dapm_widgets[] = {
@@ -926,12 +907,10 @@ static int setup_sample_rate(struct snd_soc_component *component,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->samplerate = rate;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
@@ -1253,12 +1232,10 @@ static int tscs42xx_set_dai_bclk_ratio(struct snd_soc_dai *codec_dai,
 		return ret;
 	}
 
-	mutex_lock(&tscs42xx->audio_params_lock);
+	guard(mutex)(&tscs42xx->audio_params_lock);
 
 	tscs42xx->bclk_ratio = ratio;
 
-	mutex_unlock(&tscs42xx->audio_params_lock);
-
 	return 0;
 }
 
-- 
2.43.0

