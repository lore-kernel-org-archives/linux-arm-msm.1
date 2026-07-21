Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198533C9891
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629598; cv=none; b=Ze0/d6QXQx58O/+SeOzQ5DIKWWd0Aes9mgjaZhCsQ571kLikM/UWVUwU9f0R5FmmnIwcAseY9PYUJAJV2HSe5arDv2Kio68iCdCd+3ENEOZHhtyU6BHdnBFwBmKZgesrpH6YJodvYJ1DyOGq5fR2ws5wwoGGAnZHxw4mTkn1kFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629598; c=relaxed/simple;
	bh=W+FH/hihk45TjXu/Dl+KwPA0SNPvmFDimRQIFSI/5qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ePu9CBRgqBMWnxFz6qpunPnlOOKpJ5QFtvIfAQxrZmKLM2zqCBQEHQgnY43ZdhCxXwjSO33XNlf1IxjtybQpI9PpBhxz9O1CDjCVYIjmnTVPs2+q9PZhqE+TLYYq6UFiu79tuSNiXfzxA/DZqtlSiceTX6HD23TR2rKiY8Vou8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wtx4GLiG; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wtx4GLiG"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caf228a910so87734955ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629596; x=1785234396; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=;
        b=Wtx4GLiGyLlf1IvabLRHNoyVCMbGE5n/7lUGtlOT9qrPE1y70fTPAMXVv557hoMjvB
         XXY67/Goi28Vy6Lq8YT7GfmtAVQHudMh6Vf/oGdp0QSfuRVPd7BN+k77Qu7KEwnUW7Ul
         IfjD/lj7WVAI2CV+lbAHowPKigMdyXsn3PvGlv+eLrtRBWQcgGv/iDkaKYKmi1wEjfyU
         5U13c+O8Y08psD67Lsb5TuD4VdUHSOOdhLKYV8S2leocy9urKPAcvSJNHHD4X/1B5P6I
         qPKTYjSwPin/bF5oiAMZw5vsKdVRTTOrSUX7t0jPofY0L5PbtNL3fqkOeqMhNI/T+twx
         tIJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629596; x=1785234396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E63rONCybeKNZ9BBxLw4/pUgmeGU/hnyC6bCIs5It3Y=;
        b=WXv5rO7tUzppz6JhTYSgx2IgAyenJuB6u5BYFXy8l1WPm6rOJBWCwZpklu1gWgwcqR
         8ZJxu0z6h6YPH78PRnBC0BFEqtBg2V6WHz1qAer1MbyIFbaTio2EWJZDonPkYOzIY39Z
         ymNOjzUzDnpQLzGiiqbBw5OWnVtL0SkBhMQyETmgb9QNrXfLi2oQI1t4wmLrBPFq7/Nm
         AaSO/Pd+28IROEuSpv+N856ArH7aqfiFonl+dDdS1BmjTkUI34/XmzjV6C7OEP4DwCw4
         8qpTvrSXj/ujKTOi4dBLMYZePgAum6fatRJwh1YzBfsV2tn6WEvF5x9k98z601hclocR
         nptw==
X-Forwarded-Encrypted: i=1; AHgh+RrvcH5dS9K3gZKIecMLwDWbcksTmH/AWHVOzKLvYO3dKw+MlGjUitB1hbLrGbgNcXeOSKQx2uQkWmLGoHav@vger.kernel.org
X-Gm-Message-State: AOJu0Yyp7t6piKia/O4+7n51Sod/NIrKybxX9foDHKQwRIDBXqiKX4z9
	skJHfYp3nhBlF4s6VKm4rG2oaSpxPZWNSITK2iwkNNr/gCbJrz3iBgdp
X-Gm-Gg: AR+sD11Em7j5KLHJXUaYCvwMflp9tqoHy0piWrHHLUnWNj3crUtcdkbme6RNAtB1yeB
	tXTALSyTYz5QMSf0XWoHnNpB2itW5R+g/Gocc001BX2WTixPQ15MYuGJM1JlgR38jsoPqJlR0A2
	8NLzSFJ0nFwqNL5E9kbvI4D0PV2Xf7/YvFFub0SnYJ4JUC2zCtbreZWDoHYccHPdMSrOjsz73+/
	0+e/HxBD4q0xz1iZZkUJ+V0RbKp1Uc1Jjc20BPKXYLlaXDfaXjS4L6qRId7o/upQgtmAoONpDoM
	rMrE6NziJjYeDgRwyl0vCdU+RjV5kyXJKQiIz/oVLo7m1+Ee37vHVWwh8x4YzhkeZz77A7w8TSD
	jPPh9QY5hsQfvtmuvvPiayBHx7ERlMm098vzLLQAkWWL6ZCo0eHV0XwQUW6r5b97ZA1lH4ZbLkk
	oFwqDXdz2Y/Xpsm6edIqLhlIpxsIyLWPpdsIUy
X-Received: by 2002:a17:902:f693:b0:2cf:7f6b:8c8a with SMTP id d9443c01a7336-2cf7f6b8e8emr33258775ad.30.1784629596463;
        Tue, 21 Jul 2026 03:26:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:36 -0700 (PDT)
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
Subject: [PATCH v4 02/29] ASoC: codecs: da7219: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:33 +0700
Message-ID: <20260721102600.523199-3-phucduc.bui@gmail.com>
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
 sound/soc/codecs/da7219.c | 62 ++++++++++++---------------------------
 1 file changed, 19 insertions(+), 43 deletions(-)

diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index f0874d891e12..f6d371e93549 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
@@ -256,13 +257,10 @@ static int da7219_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -270,13 +268,10 @@ static int da7219_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -284,13 +279,10 @@ static int da7219_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -298,13 +290,10 @@ static int da7219_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -422,9 +411,8 @@ static int da7219_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7219->ctrl_lock);
-	ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7219->ctrl_lock);
+	scoped_guard(mutex, &da7219->ctrl_lock)
+		ret = regmap_raw_read(da7219->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -456,12 +444,11 @@ static int da7219_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7219->ctrl_lock);
+	guard(mutex)(&da7219->ctrl_lock);
 	ret = regmap_raw_read(da7219->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7219->regmap, reg,
-				&val_new, sizeof(val_new));
-	mutex_unlock(&da7219->ctrl_lock);
+				       &val_new, sizeof(val_new));
 
 	if (ret < 0)
 		return ret;
@@ -1167,15 +1154,12 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
 	int ret = 0;
 
-	mutex_lock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	if ((da7219->clk_src == clk_id) && (da7219->mclk_rate == freq)) {
-		mutex_unlock(&da7219->pll_lock);
+	if (da7219->clk_src == clk_id && da7219->mclk_rate == freq)
 		return 0;
-	}
 
-	if ((freq < 2000000) || (freq > 54000000)) {
-		mutex_unlock(&da7219->pll_lock);
+	if (freq < 2000000 || freq > 54000000) {
 		dev_err(codec_dai->dev, "Unsupported MCLK value %d\n",
 			freq);
 		return -EINVAL;
@@ -1193,7 +1177,6 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		break;
 	default:
 		dev_err(codec_dai->dev, "Unknown clock source %d\n", clk_id);
-		mutex_unlock(&da7219->pll_lock);
 		return -EINVAL;
 	}
 
@@ -1203,17 +1186,13 @@ static int da7219_set_dai_sysclk(struct snd_soc_dai *codec_dai,
 		freq = clk_round_rate(da7219->mclk, freq);
 		ret = clk_set_rate(da7219->mclk, freq);
 		if (ret) {
-			dev_err(codec_dai->dev, "Failed to set clock rate %d\n",
-				freq);
-			mutex_unlock(&da7219->pll_lock);
+			dev_err(codec_dai->dev, "Failed to set clock rate %d\n", freq);
 			return ret;
 		}
 	}
 
 	da7219->mclk_rate = freq;
 
-	mutex_unlock(&da7219->pll_lock);
-
 	return 0;
 }
 
@@ -1296,13 +1275,10 @@ static int da7219_set_dai_pll(struct snd_soc_dai *codec_dai, int pll_id,
 {
 	struct snd_soc_component *component = codec_dai->component;
 	struct da7219_priv *da7219 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7219->pll_lock);
-	ret = da7219_set_pll(component, source, fout);
-	mutex_unlock(&da7219->pll_lock);
+	guard(mutex)(&da7219->pll_lock);
 
-	return ret;
+	return da7219_set_pll(component, source, fout);
 }
 
 static int da7219_set_dai_fmt(struct snd_soc_dai *codec_dai, unsigned int fmt)
-- 
2.43.0

