Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017DE38F92A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782467; cv=none; b=JwygjBOy7lDtHXtRHTIF9McSQHhNDzQBXuZuxxXGefmGvmDl31YqllWdH/Xnc8luzHvFrarrM2G8nfkeSMx1K6QOvYnA5yifkcRMjULxxsjGdmgR13Vqj2yh2E3ywUXI0gi6VSj+bSwv0WsN4n5/3Yq/SlSrUyMHYA6L6wJhIS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782467; c=relaxed/simple;
	bh=y5XdJ6OkHgxu+beAwr5WwIRuGIeclzsWyl1XJ6BLy9Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2/XOUeUsd6nLF6jJjOPBrLPewWDVwJsKJKsIGNFfjzbHLa+BiqYnNViJ3vbeNl7U6QMvpSl8Q2cdXcBuStEjkYkFM5MJDiaBWY7MfRonP6l/gH2VMAgzyDri6vfvm4J7OCsuW0gqC80+BYMshy3WGUG6qTPlnhJbay5ABnV5C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MUzre2Tm; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MUzre2Tm"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cf50c6f235so3478995ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782456; x=1785387256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2nJcxVapbgHVBOEWq/X49W5vkvWx4XNnEmWY18iJdtM=;
        b=MUzre2TmGO8l8YjfKzrPH/PeRuCS7kvnk6Jf3XwiNziFk3XcykL6Z6nAljju6kr0vW
         wO4ovAiqyUTu7qsbqnEHWnb/M1MrxezI6zAzxYx4jJfYpn4+lowZ4nGqj3iYhZWiIv/w
         fAlGXKzzPBBftyASL0A8VIu4da/uHLL8GK1VxTx8yenw+lAijrSyEngvh/TiQOt0eFHB
         ODCudE/bJkf6JqXxevQWv6m6d2sLtKtSe7unCWAmpEZU79Cmye3E4pIvuxqlMRfSwjN6
         8SDqcwklyeNXUdRavIW/j7PlQ5bKSU+JsrsGcoFul4RAXI4z4CGU7gvnkXPCjvSmQnph
         nyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782456; x=1785387256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2nJcxVapbgHVBOEWq/X49W5vkvWx4XNnEmWY18iJdtM=;
        b=CxF1ulqoaF4zYEMGCTl2Ff97oHtyz4K4pJLB0Nm16Q++A7aMW0r3nhieTYyEo8Xqse
         3qv04JdGAZz9a9ZEUtH6+qPIgQnTX5/xzkLZLORqTIBtxJB8f4BL53GqSngRZ8+d6AG9
         KQpqD7v9ejGWTbbFAiXwnXd8lKObrEFMG1DRPVipB1i0kfpweuTD19uRUYtKqbWhKTjH
         AAnXbMWD2harbQHYLmiG1Y90JeLSPx+9+mH1uRjrYuw4lJF5ZzzDd484BNZdqbbblUiy
         F1l9yZNeYY92B301xzgi/l7iwq+xdNqT6Os4CatwzKA6U9V1SvvaYNA955bEBUm6DpWB
         USsw==
X-Forwarded-Encrypted: i=1; AHgh+Rp6VT7xHKcWvMko6Boa9sIEBQPMcmHtCwRnItVxLkUVDBMhEVskZpa9tmsN9C86oDj0fJG1yEZRV+Lq/qEP@vger.kernel.org
X-Gm-Message-State: AOJu0YxHUarBKQowbzOtvhIM9sCx5N9URLgHOSx8dth36k7wE4kdGK9r
	E8OTj8fqY8bY0a7GCILhfh61Iw7d63JSEzWNiEmPdPPD5iSBsHwmusp1
X-Gm-Gg: AR+sD12gZNMbkFv89NoGHLX0+JCJmX9T7doD7WbbmjzWth6OOSaLw35U47GlzBC+ySZ
	tZ2lz2hj4F3++uuH1Tb4G05a5ztjwj6sNdPke6jEXhPAxasysMFXkunKIMh5Y1kf4Yw8/FvpJul
	kNoMiiK0VfHNKLfJUx3Cs4pF/SDsg0BEjJ1O+AhTV8EnmVMjtf80ABeXDeeoMpVg7wENh7tLQLM
	dKeEKkFeZ5wdIdDFJWTN9JI0VMGrHv3u3O5qpcpTWqd57BB18EzrNQx1eAtj6ZWjyISVtJ62f4h
	iztTLNfB98h3YILv6L4gr3FrdZhXwIV9z5MjSngCEFavJ9ZaG4VuVYtifcxionlycWcwSrUTRRe
	Wi0t1FULmGzTT9rrDExs3iilDkomzh9TLA+ara54suy0VIL+NS2ia7wOumCtxMS6NYjpRA74cPH
	0lA2LD0q1OUNBL3gYhDNGPYc2Pb2tGZnfT0NbZ
X-Received: by 2002:a17:902:e74a:b0:2cf:1536:3d41 with SMTP id d9443c01a7336-2cfa74e3c3dmr19166495ad.28.1784782455846;
        Wed, 22 Jul 2026 21:54:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.54.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:54:15 -0700 (PDT)
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
Subject: [PATCH 04/26] ASoC: codecs: tas2781: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:05 +0700
Message-ID: <20260723045327.28260-5-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas2781-comlib-i2c.c |  5 ++---
 sound/soc/codecs/tas2781-i2c.c        | 32 +++++++++++----------------
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/tas2781-comlib-i2c.c b/sound/soc/codecs/tas2781-comlib-i2c.c
index e24d56a14cfd..79b5f5b04c74 100644
--- a/sound/soc/codecs/tas2781-comlib-i2c.c
+++ b/sound/soc/codecs/tas2781-comlib-i2c.c
@@ -6,6 +6,7 @@
 //
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 
+#include <linux/cleanup.h>
 #include <linux/crc8.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -342,7 +343,7 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 	/* Codec Lock Hold to ensure that codec_probe and firmware parsing and
 	 * loading do not simultaneously execute.
 	 */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 
 	if (tas_priv->name_prefix)
 		scnprintf(tas_priv->rca_binaryname, 64, "%s-%sRCA%d.bin",
@@ -360,8 +361,6 @@ int tascodec_init(struct tasdevice_priv *tas_priv, void *codec,
 		dev_err(tas_priv->dev, "request_firmware_nowait err:0x%08x\n",
 			ret);
 
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 	return ret;
 }
 EXPORT_SYMBOL_GPL(tascodec_init);
diff --git a/sound/soc/codecs/tas2781-i2c.c b/sound/soc/codecs/tas2781-i2c.c
index 9e6f0ad5f05d..16dd0989e5e2 100644
--- a/sound/soc/codecs/tas2781-i2c.c
+++ b/sound/soc/codecs/tas2781-i2c.c
@@ -13,6 +13,7 @@
 // Author: Kevin Lu <kevin-lu@ti.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/crc8.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -843,12 +844,12 @@ static int tasdevice_digital_gain_get(
 	unsigned char data[4];
 	int ret;
 
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
-		goto out;
+		return ret;
 	}
 
 	target = get_unaligned_be32(&data[0]);
@@ -868,8 +869,7 @@ static int tasdevice_digital_gain_get(
 	/* find out the member same as or closer to the current volume */
 	ucontrol->value.integer.value[0] =
 		abs(target - ar_l) <= abs(target - ar_r) ? l : r;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
+
 	return 0;
 }
 
@@ -882,29 +882,26 @@ static int tasdevice_digital_gain_put(
 	struct snd_soc_component *codec = snd_kcontrol_chip(kcontrol);
 	struct tasdevice_priv *tas_dev = snd_soc_component_get_drvdata(codec);
 	int vol = ucontrol->value.integer.value[0];
-	int status = 0, max = mc->max, rc = 1;
+	int status = 0, max = mc->max;
 	int i, ret;
 	unsigned int reg = mc->reg;
 	unsigned int volrd, volwr;
 	unsigned char data[4];
 
 	vol = clamp(vol, 0, max);
-	mutex_lock(&tas_dev->codec_lock);
+	guard(mutex)(&tas_dev->codec_lock);
 	/* Read the primary device */
 	ret = tasdevice_dev_bulk_read(tas_dev, 0, reg, data, 4);
 	if (ret) {
 		dev_err(tas_dev->dev, "%s, get AMP vol error\n", __func__);
-		rc = -1;
-		goto out;
+		return -1;
 	}
 
 	volrd = get_unaligned_be32(&data[0]);
 	volwr = get_unaligned_be32(tas_dev->dvc_tlv_table[vol]);
 
-	if (volrd == volwr) {
-		rc = 0;
-		goto out;
-	}
+	if (volrd == volwr)
+		return 0;
 
 	for (i = 0; i < tas_dev->ndev; i++) {
 		ret = tasdevice_dev_bulk_write(tas_dev, i, reg,
@@ -918,10 +915,9 @@ static int tasdevice_digital_gain_put(
 	}
 
 	if (status)
-		rc = -1;
-out:
-	mutex_unlock(&tas_dev->codec_lock);
-	return rc;
+		return -1;
+
+	return 1;
 }
 
 static const struct snd_kcontrol_new tasdevice_cali_controls[] = {
@@ -1766,12 +1762,10 @@ static int tasdevice_dapm_event(struct snd_soc_dapm_widget *w,
 	int state = 0;
 
 	/* Codec Lock Hold */
-	mutex_lock(&tas_priv->codec_lock);
+	guard(mutex)(&tas_priv->codec_lock);
 	if (event == SND_SOC_DAPM_PRE_PMD)
 		state = 1;
 	tasdevice_tuning_switch(tas_priv, state);
-	/* Codec Lock Release*/
-	mutex_unlock(&tas_priv->codec_lock);
 
 	return 0;
 }
-- 
2.43.0

