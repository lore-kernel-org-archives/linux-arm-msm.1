Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC04466B5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629606; cv=none; b=RdT4X1/vqFIvXtPxKR0I6ZUMv/v5BNhHtzRf52SDmMUWMJ9jEWDvxFvBgojdkTMSEEwE6kD9A2wnL8TxTv8x92xyWkvTcyj/axuF+reNCjTlA5ngZCR70/HN1VjVcKS0OVHzIgmUQYMnQpNGsTvnAx8KETzm2ZhFc3mn6S7k4Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629606; c=relaxed/simple;
	bh=XWI4jCnd/t/sfMXYAr8klk5lyo9qyWRg1g/x4qLIB2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Oe2rJV5TjW3Qqny//F9ZerkksD4aKUFe1i8OExtBa1VE1LAslFksWszn+YWAwhpeydxQ/+0FhgdLeVhzA1BG93v9IcgS5yyU15i2cw0HVcRN6La6+hMskpMtQnKk+L3nnHr9nKgHOEtjX3+NCgPZ4FwrKhcd43FjiA0HuFXUxBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C1j15Mcg; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C1j15Mcg"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2caea3f742bso132662675ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629604; x=1785234404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8FKz6zL2lYGruFgrXSmVh8CpNcaMm/DKeCPXfcKM2u4=;
        b=C1j15McgXW3FM4T8oVsPvX3cCoeD09BmlWuHbAGZO59g4kja0RScLObvBO3y6K8erB
         2C1HE0mPz2zmpPt0WUefDOEx97fxnEUjd7uLooK6Vx5Qqs8kCvciCstYPTD8H/en4iBK
         37noNO3By/AwnLKWEI4oFijFQNfAJN5iEBxBNXtHtE2mtJ+PLVP6mS7zIbupkZzCXH9Z
         EZvPUQLQrW2wJkjSDfWMxHUN4aBvzadhvcvkvjjS1GY56oil/1/NOCCJyWkq6MrvP7yf
         2BCmYYr2FisYl8ryhyWsqxx65cb7JY99wP2Hva+MOwx/HYwsJf7H3VhmOgOUtNJlkD+A
         ZlrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629604; x=1785234404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8FKz6zL2lYGruFgrXSmVh8CpNcaMm/DKeCPXfcKM2u4=;
        b=cNuNCD4WDa17FtDs6GiIMdHD325siVVYNDw+MK4anySIGxy4Q3DOj6jBqZhHYFdxTa
         gNzfnuiYPZMSo2nq49GL0UmF3odb3hzSBqgsIcFbFzmRXxD61+uvpDPM/ILfvdfTm6Zy
         M+t0UeJ/HMFTvbsNY4xr+F+eK/8R8vvbK/D9/7etG0GXINEMDxfSr2WDUJWUkz6X9Z/D
         6c6Pn+nrX8FfjnVhKxkQOuZYHgmWx8u0JcG0Mt7U5HkSBDceVZQw8jTqIxB4YZsb70Dr
         g5DFA7DGB1+C28IwLTZEck5eHJnHWg8tqHcmijXaWkNKwa2w6QIhUwdYrKeW5FZy8D3B
         1cqg==
X-Forwarded-Encrypted: i=1; AHgh+RqjVHfqKn4OecqJM8JskE/yNFq7lX1FkFLgCDerA8x+Jho7BjRBabt52dp3xboG8IEnGkPn4ZgYmO5OFtrV@vger.kernel.org
X-Gm-Message-State: AOJu0YxG+3hgyRtW8ntLDDsd5uJzphQ3EzAPCPa6fgJYyiGV//jxPeMt
	OimVGc/8CYW7yaL+4DeEfLZxkFirRGDfEMo4YN5BHBdW3hf34zB6Qoxe
X-Gm-Gg: AR+sD12FjWb9Tstumj69yoRBVRBxOUdSSP7PQPVQsyoDTtB/6iX1DK8JVInSDKUIIad
	2w9Ebhz338+OcduOkC4OFGyjK8Y8qdYaBCj7noeAqdbY3LbE76fzV0QVNj+PRIsnHJMaekCMi3r
	nUuFVHNm3cVSwNK2mQQ2Lv92XQs0+yV73VWhojGo9D80RlM1AOd/2pWYsKQV2MfqId1+PjE31Vw
	EDMoKHe/+o1E9zJ+LnZqXg6Jc5XxZsmNqvRgvegIyFNnN/PSyhGp5JgAEGRXF9dyKvIvVKUjG9m
	DsDtJis4oEcT37pGrpkrUWTjWuBNGnhw60brpL5HpWaN518Z1yPK7tbzT/2slYhWsbhqbL8pStE
	Qwf1ksGxNtuIO2DPKBQMpMFa474eQqFc5lfWyJ2jz1cBVMC2Hldaj9xFNu8KeB7CMZB+54pSz5X
	0Bys4G5s4i2ivRLuE7bcpJX0zfoyeJunG6AdII
X-Received: by 2002:a17:903:1b0e:b0:2ca:73aa:b48f with SMTP id d9443c01a7336-2cf34a48f7fmr193973625ad.35.1784629604317;
        Tue, 21 Jul 2026 03:26:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:44 -0700 (PDT)
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
Subject: [PATCH v4 03/29] ASoC: codecs: es8316: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:34 +0700
Message-ID: <20260721102600.523199-4-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es8316.c | 31 +++++++++++++------------------
 1 file changed, 13 insertions(+), 18 deletions(-)

diff --git a/sound/soc/codecs/es8316.c b/sound/soc/codecs/es8316.c
index 3abe77423f29..87f331868dc7 100644
--- a/sound/soc/codecs/es8316.c
+++ b/sound/soc/codecs/es8316.c
@@ -9,6 +9,7 @@
 
 #include <linux/module.h>
 #include <linux/acpi.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -620,15 +621,15 @@ static irqreturn_t es8316_irq(int irq, void *data)
 	struct snd_soc_component *comp = es8316->component;
 	unsigned int flags;
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	regmap_read(es8316->regmap, ES8316_GPIO_FLAG, &flags);
 	if (flags == 0x00)
-		goto out; /* Powered-down / reset */
+		return IRQ_HANDLED; /* Powered-down / reset */
 
 	/* Catch spurious IRQ before set_jack is called */
 	if (!es8316->jack)
-		goto out;
+		return IRQ_HANDLED;
 
 	if (es8316->jd_inverted)
 		flags ^= ES8316_GPIO_FLAG_HP_NOT_INSERTED;
@@ -681,8 +682,6 @@ static irqreturn_t es8316_irq(int irq, void *data)
 		}
 	}
 
-out:
-	mutex_unlock(&es8316->lock);
 	return IRQ_HANDLED;
 }
 
@@ -699,18 +698,16 @@ static void es8316_enable_jack_detect(struct snd_soc_component *component,
 	es8316->jd_inverted = device_property_read_bool(component->dev,
 							"everest,jack-detect-inverted");
 
-	mutex_lock(&es8316->lock);
+	scoped_guard(mutex, &es8316->lock) {
+		es8316->jack = jack;
 
-	es8316->jack = jack;
-
-	if (es8316->jack->status & SND_JACK_MICROPHONE)
-		es8316_enable_micbias_for_mic_gnd_short_detect(component);
-
-	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
-				      ES8316_GPIO_ENABLE_INTERRUPT,
-				      ES8316_GPIO_ENABLE_INTERRUPT);
+		if (es8316->jack->status & SND_JACK_MICROPHONE)
+			es8316_enable_micbias_for_mic_gnd_short_detect(component);
 
-	mutex_unlock(&es8316->lock);
+		snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
+					      ES8316_GPIO_ENABLE_INTERRUPT,
+					      ES8316_GPIO_ENABLE_INTERRUPT);
+	}
 
 	/* Enable irq and sync initial jack state */
 	enable_irq(es8316->irq);
@@ -726,7 +723,7 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 
 	disable_irq(es8316->irq);
 
-	mutex_lock(&es8316->lock);
+	guard(mutex)(&es8316->lock);
 
 	snd_soc_component_update_bits(component, ES8316_GPIO_DEBOUNCE,
 				      ES8316_GPIO_ENABLE_INTERRUPT, 0);
@@ -737,8 +734,6 @@ static void es8316_disable_jack_detect(struct snd_soc_component *component)
 	}
 
 	es8316->jack = NULL;
-
-	mutex_unlock(&es8316->lock);
 }
 
 static int es8316_set_jack(struct snd_soc_component *component,
-- 
2.43.0

