Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C4B434E50
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520442; cv=none; b=gBIWttbO6VB75aGMz336ITFZVaLvo+123nCAZtBJApR1/5k1EWTbX+G1GZRN577ezM6yDdvhJ2fci0x4SBJK3O6VzB9nPnOPihfAZ+nH+0CVdWOPdy6olNth22MynzdK7e2KEv4BL+hLLEbbUijnDWqGhJV3IsptSGDVZcxXmG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520442; c=relaxed/simple;
	bh=WwNjHw0SRNfo9aeoqwnXMQdjAxCjVTDeacaiflJQe6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TOLQwO408cs8cGZiYtlTphnPZF+l03aDc7QWRefx0ekrd3WLGu9+AfPaUoLCmzYzbY7cjNQLPyaHxYCSMvmnK/C4xoc3NBiHNLhgpQw0g2G+6+6XsjlbMo4yiYv9zx/NFVKl/FEBZ8nnuKR2smAw/HFaJ4yFC3cp+RlUVp0Xf3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jJqreATo; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jJqreATo"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caced6038eso9634005ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520441; x=1784125241; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=jJqreATohoju0jHtxcNnAID3E4ucH6U1HOdifldRz2BA1qsaHQUBwVvqqQLWmXT7ZS
         Dbfy0wEY7nAzTwxQJbh8hZBn1BupkniSR1D5GDr/ZbVnXg9tjKGzKGPpsMRT4764duUk
         7EcKd/ODEGQHemZ/JVqIHABRAeedwB6lyWJR4OgbX2HxQo8P3Q+1qTnJ04PWQxOCSo72
         Di/8pjZWZrNwso2/27BQysSvWSMpqOJt5kWQ/V8fT1BlJjTx/Kr5CAOI0c03O7beAegC
         JJRi313D13C2YfAaAZsF6+sckWz79TYZ17xOf4Ow1AYHOr6a56s7eL/YQd+8x08QhpxQ
         gGmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520441; x=1784125241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=R4hjt7Q4O2aFtg0yNWylI59pxlW18OLSrevjE6JOidPdYHmhvMvH6lmWhYRx4qkkg8
         qGFcopxZ7o+v0boMI6mQv52ujdKHO9OozouY2dG5pgy59pY4br9AlkJy6bh3Cf1DE2cJ
         NyAYRzJam1njRQs1oAzS7got5RCE3rcaZA0LeyCNnrD+N1mC1epPymRh+N6nxpW7hQAj
         gxzVuNB0IChk3WFrlNfwPZCRed8HheTXiguS1QzPV1FmaO9GvoMfm+cl9C11YAqpZRLu
         uCQpIR3K+ik0+H8sAWFyXpIrgCKUZFr2+7zuNuohTPPU0jxkZxAh1JDWjz6PdS4TrAVQ
         EsOA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+wlQMduTzGDmIoyy6ftFmFfbrpQlnB9MQ36LGGnYAtuDPtEc3NpXjUbeD5KyYvz833nEK8y4Q5ENqw38o@vger.kernel.org
X-Gm-Message-State: AOJu0YzZmlO/M0JRaJvb1Sfiph2qzwAOP8YfLPo5qc/GmyUc12kap+xD
	Kjf6+t5pbaH5a2+Z6QitxaWwYkIBArWgdqwWNYLaX96JdfZ/+MzUEftT
X-Gm-Gg: AfdE7ckyXGTYN+D/44eINHmQlju5gbmFSVHooiJIajCvW+h0U7Yi2JhZQpUO8MIaYrX
	Q9t9EOQ44AeuqrLYF2UUn/sRBVyCnYidEaqERcy52NCmFSLuyxKvkIbhMVKpETYlkC/9WwssZYj
	K5VwvWwg3BNtR7TtGpxUbYQILbjhM0Q40vjTZRghDVU16zhlX2nZt9vnBbJ1/8Pxr7njvl76dNA
	c41wYgWmNsfjFs8iuPTVjiazp/bmOONkVGMAgrafNbI52tAP47lW7n6qUeNBZ8dGThqrquXf1BF
	+zisnGCT5m1c7aHdO87y0iCUbnljMm1rQjE1wPRrnxQ4L3G2VZPtZQZOYvCSg8yRczI2qyRGKDh
	HyQxq44WzC6YLqWNdqXX1DDHh32dKqhAID57meBPx+QCW2+dArlFm/hPOasZQt1YfYlH0p3MdWz
	oqHkQqy1FbPMW0Igp06dUpv7oYDb2C0DodtHIveXoBic1kJBM=
X-Received: by 2002:a17:902:ce04:b0:2c9:fc4c:8142 with SMTP id d9443c01a7336-2cce9f79c01mr26690085ad.2.1783520440899;
        Wed, 08 Jul 2026 07:20:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:20:40 -0700 (PDT)
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
Subject: [PATCH v2 12/27] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:19 +0700
Message-ID: <20260708141734.578926-13-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/max98095.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index ced9bd4d94da..c47bfa2378b8 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Maxim Integrated Products
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1532,15 +1533,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1686,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0

