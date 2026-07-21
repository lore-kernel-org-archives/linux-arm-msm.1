Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADCC5480DE9
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629671; cv=none; b=B6fWCs27zteKYOxhv+eJU2mfEXUFkzPwahXyZi6DqUf9hIygvSVQKpI6rI0m999M0xNlzxDiHGOoTSBdqab8i+OCuDBGC21gzR9lLvPriLgrdABngncCseikBhiCu0n/zR8QfcbnUSIxB9ZOLM/52P8Z+4ddsb3XYfjRF4EG0ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629671; c=relaxed/simple;
	bh=JiDQaJ0zD6/ZCscbVOKmAWdNLeoxv2bO5m1HZEhDQpo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JpliJAoIfpOog4tV9COFDREX1Yi/b3Ll9ugZ8pzjQVsqJ7JMuAS2vnTQdBa3pZnvyUCYjZxpniRL83kC7U3T71ednjD4h7s0sPtXfFkmmLX2rUwhlSu6xJfJK+pzvL91aqENt0FKcORc2vUGmfRG80bPipEzmiyNttVhBk2aLQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aKjYi7+9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aKjYi7+9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cab973140bso136537525ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629668; x=1785234468; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=aKjYi7+91K9UWAn8ffaUBdxp7Aht+6ZlhHQ9ciIm515eH3yeOisqGlK89gB+uVueym
         +47fNUGRbiMuE44YjtjAft1pkw7BMLW+3GstuktmeH+/zuOcmCJ9+WPx3G/KkuCR32mG
         vFKzDsfVxeorFbZ5IyzOdls2utzwqWfArZfK59Uj/IWwUjKHlNRvCoLcTFYaGokZgEE5
         1yeNMvoj6fcARc5UepHcMImMzWscSL8i8IzjLmy3CL2jXQyCx5F6k10AsliNnHgFjw5L
         qRIZn9wCuqavTXwwRbfhijMCOAc4NRPFKmBC1+fLhF5Q16rwfPAW/9L+0FdLTntsTGOz
         BHgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629668; x=1785234468;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Cb8oag5ar6FqpWOnXZjHVza9DSOxnESBFSEvSLigZvU=;
        b=dgJVVu/XnYEjt48zf2Fc/mtBB6P0AiVGq4GKEl9I2a3sD/KaJF1TJHnVgACJPV61yg
         PKIyn3DA3Tnq3EuWAUP0e9LP3p4gacul6LzdvzEUyhC8NQdIrIH/WSyDx3hVmTsZcwQX
         0nKNT4F/OEGQc+pEYFpQ26QGLGMg2ojBlVrhdgpYjTk0Ud57WMwfSxnA7qNqbA/QeF22
         5wI02+49Y1bvkwzOyFEc9USec05t9VnPDX2e5byt2e6qAn9VQTY6D/eV0M8vaWZrUqVh
         V9qwgL8FZj7vlZ5kag97hS9UvIc0Z0ZwNxVk5j8t6TZ7H6oXENBp2nybbbGJJjgXH45c
         0D7g==
X-Forwarded-Encrypted: i=1; AHgh+RoeAtEJg76TXboJUvaEwfpOwA4q5fSbTw583qwWNHJi40UMOP7m+vMfdh+zspPsgBNF9u7q9B5l9r6RNvIg@vger.kernel.org
X-Gm-Message-State: AOJu0YziHgCTH3vFMFJy9ZjqdQvusXRR3VTJ0Qtt49z2CWWCdqhuEiV1
	SHKfzAE/+3kN7zGOv1hcpelXgWE80cm6YXWf/sPm5yUVcQpNI1LV/tEK
X-Gm-Gg: AR+sD11Tapy8B2nwgXBTRRxQbd3oXhgpz5h9348+twUVxdoUYkivHQRauGkr9t+tBZ+
	nfRibSGh66aVz8VjVc+RKr62iFdArNbrtHxkJOu6g5fFFlEA/vYuJRhcni0gsufVjQOisOajAUh
	ikcQfbTLhHTH8RkFxa/2jewYjjC+R4pS6bLCWUvfv7pbMr8w4UJP9OHl66dmo/n82B2KrPKDBmQ
	svEz2ZqAsZPWvj4aoExRlffeJWCjfngzXwCruyTipY0p8nCJA2cJi+HMfW7f1bq26FvAhXkW5a3
	T2HDiytwptENIESsUSlESHjhiJCLLMb0XM3vxVqzTQDZakNdP2KxsnUtXTTSHIAM3SQbhMJLp8p
	reNFXAIH6Kfzt0H9SybT0J+tkjK3A3DwvgieARELege+FVditcCQhrRKUBgOU6mG9p/0fb1Iq+W
	DBq54Vm26cax7zjXQMEcsVh3wy+4+agimB5W0T
X-Received: by 2002:a17:902:ea03:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2cf34832689mr196284065ad.5.1784629667940;
        Tue, 21 Jul 2026 03:27:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:47 -0700 (PDT)
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
Subject: [PATCH v4 11/29] ASoC: codecs: madera: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:42 +0700
Message-ID: <20260721102600.523199-12-phucduc.bui@gmail.com>
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

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2: 
 - Add Reviewed-by tags from Charles
 - Remove the temporary `ret` variable and return directly in 
   madera_adsp_rate_put().

 sound/soc/codecs/madera.c | 39 +++++++++++++--------------------------
 1 file changed, 13 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/madera.c b/sound/soc/codecs/madera.c
index 98d72db599d8..55ea6950ca90 100644
--- a/sound/soc/codecs/madera.c
+++ b/sound/soc/codecs/madera.c
@@ -6,6 +6,7 @@
 //                         Cirrus Logic International Semiconductor Ltd.
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/gcd.h>
 #include <linux/module.h>
@@ -513,7 +514,7 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 	 * We can't rely on the DAPM mutex for locking because we need a lock
 	 * that can safely be called in hw_params
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
@@ -532,8 +533,6 @@ int madera_domain_clk_ev(struct snd_soc_dapm_widget *w,
 
 	madera_debug_dump_domain_groups(priv);
 
-	mutex_unlock(&priv->rate_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(madera_domain_clk_ev);
@@ -875,9 +874,8 @@ static int madera_adsp_rate_get(struct snd_kcontrol *kcontrol,
 	const int adsp_num = e->shift_l;
 	int item;
 
-	mutex_lock(&priv->rate_lock);
-	cached_rate = priv->adsp_rate_cache[adsp_num];
-	mutex_unlock(&priv->rate_lock);
+	scoped_guard(mutex, &priv->rate_lock)
+		cached_rate = priv->adsp_rate_cache[adsp_num];
 
 	item = snd_soc_enum_val_to_item(e, cached_rate);
 	ucontrol->value.enumerated.item[0] = item;
@@ -893,7 +891,6 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	const int adsp_num = e->shift_l;
 	const unsigned int item = ucontrol->value.enumerated.item[0];
-	int ret = 0;
 
 	if (item >= e->items)
 		return -EINVAL;
@@ -903,22 +900,20 @@ static int madera_adsp_rate_put(struct snd_kcontrol *kcontrol,
 	 * maintain consistent behaviour that rate domains cannot be changed
 	 * while in use since this is a hardware requirement
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, priv->adsp[adsp_num].cs_dsp.base)) {
 		dev_warn(priv->madera->dev,
 			 "Cannot change '%s' while in use by active audio paths\n",
 			 kcontrol->id.name);
-		ret = -EBUSY;
+		return -EBUSY;
 	} else if (priv->adsp_rate_cache[adsp_num] != e->values[item]) {
 		/* Volatile register so defer until the codec is powered up */
 		priv->adsp_rate_cache[adsp_num] = e->values[item];
-		ret = 1;
+		return 1;
 	}
 
-	mutex_unlock(&priv->rate_lock);
-
-	return ret;
+	return 0;
 }
 
 static const struct soc_enum madera_adsp_rate_enum[] = {
@@ -1061,15 +1056,13 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 	 * Prevent the domain powering up while we're checking whether it's
 	 * safe to change rate domain
 	 */
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	val = snd_soc_component_read(component, e->reg);
 	val >>= e->shift_l;
 	val &= e->mask;
-	if (snd_soc_enum_item_to_val(e, item) == val) {
-		ret = 0;
-		goto out;
-	}
+	if (snd_soc_enum_item_to_val(e, item) == val)
+		return 0;
 
 	if (!madera_can_change_grp_rate(priv, e->reg)) {
 		dev_warn(priv->madera->dev,
@@ -1082,8 +1075,6 @@ int madera_rate_put(struct snd_kcontrol *kcontrol,
 		ret = snd_soc_put_enum_double(kcontrol, ucontrol);
 		madera_spin_sysclk(priv);
 	}
-out:
-	mutex_unlock(&priv->rate_lock);
 
 	return ret;
 }
@@ -3041,12 +3032,11 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 	if ((cur & MADERA_AIF1_RATE_MASK) == (tar & MADERA_AIF1_RATE_MASK))
 		return 0;
 
-	mutex_lock(&priv->rate_lock);
+	guard(mutex)(&priv->rate_lock);
 
 	if (!madera_can_change_grp_rate(priv, base + MADERA_AIF_RATE_CTRL)) {
 		madera_aif_warn(dai, "Cannot change rate while active\n");
-		ret = -EBUSY;
-		goto out;
+		return -EBUSY;
 	}
 
 	/* Guard the rate change with SYSCLK cycles */
@@ -3055,9 +3045,6 @@ static int madera_hw_params_rate(struct snd_pcm_substream *substream,
 				      MADERA_AIF1_RATE_MASK, tar);
 	madera_spin_sysclk(priv);
 
-out:
-	mutex_unlock(&priv->rate_lock);
-
 	return ret;
 }
 
-- 
2.43.0

