Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9241D345CCA
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467548; cv=none; b=kHEMWB3/8+eIIUqlSlDOh376PaU8LMT85CShzgdR8IsN5HJgm1YsGrccODFyeaZsR+/Ue/H0rt4I/00JPZWDkNDIc8WqEgD8quJRPsrcM6c6WenfaV0phU93AwGDySJVpjOgOC8HkpnRq1BEkA9Dy2JoyreRD9sUS7rfy1xQOHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467548; c=relaxed/simple;
	bh=1WLxZLRtR1h7NZKNx+UVKFODR4z5d7cXPzTHPXjxLYY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gmlhTGuHNl0nF2HVWetv+lQ4zxDdP8RBcISOqjSv2rlLt8PnId8O/ARS8xqiuPLmIK98xahTCAVnHjilVvKSe7po90fp1PEzos4vdg3umYj5AW1qzfNoSDSK5h61UV/yrGS+Ze0TFMBe3uZnT91iTUP6bjTiBc5WwlnLX6Qc1R4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jwH95Qdp; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jwH95Qdp"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf50c6f235so5543355ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467547; x=1786072347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GI4equXGkZTn1Z91VwxEti3KlfrZRYK99xTcwr8rPXU=;
        b=jwH95QdpzH1vgsOV3iA1ZYcVnkZhKsbZ8WIPDuce4Chde/9/kPPtk3ncn4Bwan3Zfc
         niB8xKAJleSgZ7ykGgPdqv62rnVuNgE4+4lRUlmNSGPlBqMgtqQTjkzDt1Qp8HPXPAiG
         nN/kpmrUCzIeWcqaWvsmSwyAKFHypTCtBylA8k+B96JAvQvyZ00AzbrYA0fJTG0odPDH
         C612pvCIMIPzneM5Vy6U7Ut7Kr9CihLxcTV4WNjFUKgphkBd6jLb48qhDWP1igd7psmj
         hirS3Z3oDTp7o7gA6P+kzPXHNuXM0Bd+l8xfT6t8i3uZbnXnmQZgZFncxZjkMmz+Pwfs
         SFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467547; x=1786072347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GI4equXGkZTn1Z91VwxEti3KlfrZRYK99xTcwr8rPXU=;
        b=gBJii7xSdHe6tMHd+FbdHtIPgXR/FtTbmH7rO83+5i/LgKqPDkqNpt4Pq0C5eoYien
         nR8/ef2r4EQL92G0HPros20Ct5yfaPe0XzwQiFbmMvD9BbYEgkI8Mcbz/2q34GTlI1ru
         6zfvHZyuGyC+sHVb1WGwDy3ytxpydCwKvNXVszYs9Z+5w95wbwix/go6tPYaojMVOUun
         hA/0PtyZjK0MtAUciwnbjYz3ZedgWcnx1JC9vv/AGsMvFkAH1z4jDydNhhuAREBFX58N
         BN+xBkrK4PmSZByKIlnbWNkT32/23bGG2/FzqxgMhEW6/K4aZv08xT71OTpDcE1KxNr2
         gXpA==
X-Forwarded-Encrypted: i=1; AHgh+RpSU6j4cAIczoSWyYk2EdywKj9nAZFzsUv7+qVemvye8nS6YuVxAstPSmgNY2jOInWrESPvGSiHF28sbK9p@vger.kernel.org
X-Gm-Message-State: AOJu0YwsUOtUkrt6IgLcvo/QxEpnJ+lj4aXGMtMd2yphrAdL9Kyj9vQZ
	savig9QuqbxyWznB5k7y3Gar9eC2jCsq3luDZltSWL+l+syH30PkFQsE
X-Gm-Gg: AR+sD11yYXiOCd1DuMuVLUmor4+ugUA/j7tJwgiO3S0OYPHYefDGnM+7c50BaenSDHj
	ngIug/0prAoG5ac0u6ilTkGmMUivBYtXmDLrRlXa8ziq4lCTrQZXRX3fCpskW5TF33ocZk/gZtI
	BzQyRVA3xOnwpKxWzDljNg/vp7Xy0k+RcMi0uIdYCpFnF2BgEIoGy9LfHQKchm1hJEMK6PX8jqh
	RCss9TQh5AWb1AzONE611Aj2q05g/HMSPpVxvACRMgvCUM5okPs1Da3nVkjBJIzimM96IuNVKqO
	ROCbgfEI5a+J0CpuQHMW9bAIrOUWbT1qubijIJUEfn+8Fvau66y+uvTxdeYIX8OotrndpXeRrtn
	tEqf985wHm1vWZYDbvzdaGnVaHVzDJ8xRbD6/raWy8g/ZKlUpb4cC+1gc02lxz7NAFIknXHvP7n
	W+Lfk5XZREj/WVdisF6SrsTe+HyMp49Z5Q8Iyey5RODn4+l3itql0WMCGBoZrSTqAsSLxEnENoM
	zU2l0vCoYCPnEjsMt9BmRDD3nPYc2wwKtSnZJthTTFzRLu4FSAE676hu7gZgBmaNV2GDN44yZpe
	hXzn+9/vAFXhX1Y=
X-Received: by 2002:a17:903:1b10:b0:2ce:b096:e50b with SMTP id d9443c01a7336-2d046ee5b05mr4391695ad.47.1785467546977;
        Thu, 30 Jul 2026 20:12:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:12:25 -0700 (PDT)
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
Subject: [PATCH v3 18/26] ASoC: codecs: wm5102: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:40 +0700
Message-ID: <20260731030648.8706-19-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm5102.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index b4d4137c05b4..74b775b95bfd 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -667,10 +668,9 @@ static int wm5102_out_comp_coeff_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	put_unaligned_be16(arizona->dac_comp_coeff,
 			   ucontrol->value.bytes.data);
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -681,16 +681,14 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
-	int ret = 0;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_coeff != dac_comp_coeff) {
 		arizona->dac_comp_coeff = dac_comp_coeff;
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
-	return ret;
+	return 0;
 }
 
 static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
@@ -699,9 +697,8 @@ static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	ucontrol->value.integer.value[0] = arizona->dac_comp_enabled;
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -712,19 +709,17 @@ static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	int ret = 0;
 
 	if (ucontrol->value.integer.value[0] > mc->max)
 		return -EINVAL;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_enabled != ucontrol->value.integer.value[0]) {
 		arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
-	return ret;
+	return 0;
 }
 
 static const char * const wm5102_osr_text[] = {
-- 
2.43.0

