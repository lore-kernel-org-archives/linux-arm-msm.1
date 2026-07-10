Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602E2377EC2
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660009; cv=none; b=kDgXctZQlEYfAyrnJ0MAE32X5Tz8G1wrO05P04nuTOLYOQC8VoenM6JGvChUcgDt73u8eI4aAAgQPxeDSetLSF+IUsyXkxlir5TBv9lvBYZLYHiLXnLW0MJgNUVgU76VYxvwJnzCY18bwW7wkKzER221StXvRzCfBF30gkIzdkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660009; c=relaxed/simple;
	bh=WwNjHw0SRNfo9aeoqwnXMQdjAxCjVTDeacaiflJQe6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MTUir9+tVb24o+exgZUVfLHZe7tI9KuBVD7WZReWcw1gO3gtAhePsoZxO7MmB0Am8az0iqfTF2jb9E6GXK7Ga1cucckoL2rtG/eaa77LyeTPSK+VL1H7TvXYnDnTgw4prHczggjbhzot+SyL/ZZVV1bVdONorsd1pG06bSZa1rI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHBdQATc; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHBdQATc"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8484a0b998fso706215b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660008; x=1784264808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=FHBdQATcGs2jEaaWff+gNlup3QyqtLq19ldb3Oe/1iIjo+dtQgTpkurYSeQh+358bm
         jci2Jumh4D5G0tyiX0GB0fF26vzfQ9xHbzvfEn3qBwYe/Agbxk7Z6I5XaerxK8ynhE5R
         9Qfb35oSuGqfIXUHz/NZbP5o6UxtZ2ZW3CSVdap5uN6/fJswtAWw3WDU+9ml4JjkPqL3
         0DTVe1VVdCuXBIuw2C1pvyeJMtxTjPIIAoXEDnMLGdA/GMbv14nRJcZNKL3/FNy/R+Gv
         TydmnQCPcNTc8afMlbyFagWnzFNEh7NWPdR6Wh1jqtijsYHdr1dJ9WFULmvV8Lcsy2xu
         Jv/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660008; x=1784264808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AtVsXFH15IrgzMd0VFvy62roDSh+hKjqh257VzvTJMo=;
        b=rJGilqbDedfJM+jMRe6lqxQqocPOHOPr6r6paTJ/LG6Wmoy1WCt5xCCuhHu3/xekTh
         ul4H6O4/WH3VqmUeQ4Aq0MLkmBiEnakA0nOKNa9Zvdu46kNnMAkRdn40hljfcuLJL/+D
         yNTJfFoaFyxqCLzSte9MAaYpA9qCEJv7992XffNc9FZzN6mAI+3Eq5yPfRpnLgygkJyx
         QUTzM+DuOUkP9rkRDFR0GRgTYT7N+1+lJ9lQsd7m2V/fCnBN/X2mqPF5i09Yl1tgC86w
         z6NMtPapoWPGbCUzSFF7Iy/o1lPKyTC5GX5QCPexNeLNiCUZoZDbEocwLuuucFHHx/n/
         kSSA==
X-Forwarded-Encrypted: i=1; AHgh+RqQo+rTfGtSBCBcpAHpv6Y0Si4ObE1d4oHMK+M83+S8SfI7kz4PonOjWT0yBsuS6HU1oEkZVeS98kGp5pjP@vger.kernel.org
X-Gm-Message-State: AOJu0Yys5MYOs0Ofk8FQ5uhzmogqWbR8nmjZ9gyvPk3t4n8T+PmojklB
	33mI6hyKiSfwy9+olFPzYMpj+Gdb07qndvHS3j5IAK+YPd1HpOkb7PXg
X-Gm-Gg: AfdE7cn7VyMTINaxFz0JoGOWPI0cd1/WEjydVhNRALJXcZ5Z6r4Au7WmnYaa0Ei498i
	C8NE1rGVAfOZwJvvGQrCR5O1ir4K63jtGgU25I2+hDFO0qJm78/jXytRzX7NPOvGssD3rGSYBil
	TQFc0hMmqjnR8UC/WAnTMOZtIAAWDHi/mc1M//GZWZA4DMfWbCUi9n/ygFPMJnxp9bc9emloh3Q
	wxqnaLSmjoInYO5feDjNeghrFmWTaJh6LItYoPtbSYmEfK4Nay+m9tQMg68nprRTufja9ch18co
	VNpQwt27Apdhi76lzxESn5KSvM4pM3LJfuFb3DzAalo1dz78im52dVGVRtd1+iQmxdDT3AFS8Pb
	Eq1Lx+dw9SLtq7aDDtJGFVvSlYc7wvN9QlLnroDKD8nD1fEnQoDWyI/NPqbJ02a39kjxml2HmKh
	CZsYRnWZgOO4aemPMTP9x0cANp6fPr9ggtrhZzk2XHDnmLbcQ=
X-Received: by 2002:a05:6a00:a15:b0:848:2f77:e2df with SMTP id d2e1a72fcca58-8484392f4a8mr10653484b3a.72.1783660007641;
        Thu, 09 Jul 2026 22:06:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:47 -0700 (PDT)
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
Subject: [PATCH v3 12/27] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:56 +0700
Message-ID: <20260710050511.14439-10-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260710050511.14439-1-phucduc.bui@gmail.com>
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com>
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

