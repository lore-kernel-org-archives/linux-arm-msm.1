Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929B039DBD7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782576; cv=none; b=XzqcHEX+mFOoZeUC9lDXwXijDIWpPwrj1yumigJXssFRvVAvrYAxUjp3hRyqYNiajcoNf6VVySKWx8RXAJAHImxGkG/iSZOfFCGSIvSx/+3XjMSZcJCETn5BSSx6d8aNavV96xufEoCevv5KnGQ6WzfK5EACuANo1Rtu6L4jxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782576; c=relaxed/simple;
	bh=vhQNcZw7Vwuw+2mEaZrrAwX4ICzGoAV2kKF+a5LkSM0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InRTQhpBA0b0wsa8pujFnomgP4mCYcE9ctQwa87DOu63siTbkp3/dZCPCyYkrh47LmQUEbwZ2CJxpXdby8m5DndXvuxlStI3Mu3D7wcBVvFvplXV+qRLRkChZBlJ3+maBJmlGSCFONtAnNVd/ZgefbThpcux5EkxVJhnba0QVVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rrKRhYrq; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rrKRhYrq"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cc891373e0so2817785ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782565; x=1785387365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ok4tGf8ERF2To39hRUrBqxTeX6IvjzaUkkiuJi5gDOQ=;
        b=rrKRhYrq4Y92gQuENolZWWlDgGdIE/xWt5iSHO2IeK3CteRdWKSKOMZwqgjmYlJ2KP
         rndhdFuwhUt4kKKOes9qaZ/mikuG6+gegjqx60cwEHPniNokWI2TUeJUSDjlGWohHhvb
         UJu1ioXurTZxtLfdzxPkyniomFSwNj1KmnnQ8W+Z3iE8jbeCwtBnCn2urWnV5IuqZY8C
         k+vgT2fqjDkIHGo7GTVtNY5KFRxD0eErLmTS81jvLYnV+hIqX9prujEJknxwHFYw/oFU
         wgNxgfI+XpoY4BdbDxPXJITqrS9Gw/c258Pq7wuHyCuNFTjyqWhuAA1MYTzCSsaLeTEI
         VNhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782565; x=1785387365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ok4tGf8ERF2To39hRUrBqxTeX6IvjzaUkkiuJi5gDOQ=;
        b=Ll0cOYofSi17YESDi66gsx2MhCysJdSZgfj1z+MrmBuLlLFNAiqPx3W+LqTfs5E0cH
         BOgRt4g5gbsD+dD2IpEfZy/wjgZNbTnRayhp5CetJdfzshePpk/vcvHyvKEuzIBzfTZc
         KC+UYvikjviyhZl+MzDpgsXGbIGPdIzTpgz4jnQ/kecTNdii0ook20e1Hz40cq8ou+gY
         QcwH1nf14rhhwLX1r6LuQoHHMC4KZdUqR6WBkJeZh4vZ1uvSveJTOq4hG5VaPsmz5zhX
         T2BiBLE+3oiNczjlUouWpz0LzivnF8SXUCpAh8JLAewxfLM5z11pEjK2HsotMQUSzVcu
         A0DQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpiv5Oi0aTApIoWwoZ0/MDOqUbaAIxT6IjdR5vU81qREBpkafGVLrV2cKf8cHSS/rEYZ0XaibxT2hb7EFfM@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFAoJcF4ZKIwF82pl32TbPX8yArrRFzqJqThqrfD2eWODQljF
	2DspjnDFFgZ4Vr7Qz+c7OUsLvYa5mdhL5BBuKmbghXvutEIvQA8a/9fP
X-Gm-Gg: AR+sD13hhGnGeGcCm8dXVjnOKQ3g6uZbD+6Gix0cDCfrhYGwEKkQ14LBvZnm9qixuig
	XbLPNqXZ9OimeWB6c1z634xjzd+esLfMLH0bPr3n21fW6EPT7yLbEo3bebHm0ajHcE88fbEf0hr
	NmFsnzEgp0LvHd0kYSMB9NY+9jstSzUHOao5GHagoRCOD/EQxLySWBKn77uf3WhvjIoSt/yGVVs
	FAQ0M10M0pzuJ87ybfQrOX/fl4+KWT1molRD6+rCnvibMsnukHhFBGRqEDmfJoNwSJ0486tO4d2
	Dhd+JgIDxLu0DJG41SKHggy5JmL9BnPwnuGFjbKdL5QTqVtLU4dthljm4gwxH82gAguNcJXtZtu
	u3IqXxFqtMV1bd6byq8aNymDzUAvDlY/yFFhdqxvQlEH/f1abNZAEkY4MG2Xpenwx3uhAyMopZs
	7GDOhMrFal4oMuqobOaMFStEHk38ZQ7WyAxBeh
X-Received: by 2002:a17:902:ecd0:b0:2c6:9f6a:9f6f with SMTP id d9443c01a7336-2cfa6c66734mr19973065ad.28.1784782564905;
        Wed, 22 Jul 2026 21:56:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:04 -0700 (PDT)
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
Subject: [PATCH 18/26] ASoC: codecs: wm5102: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:19 +0700
Message-ID: <20260723045327.28260-19-phucduc.bui@gmail.com>
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

