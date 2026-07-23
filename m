Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729773A6EE5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782543; cv=none; b=Q88hC8WvjVp5AqVI0VNgi/nYHP43ArZXysEgF714HZgrkhT57VgcZiAMaD7d6JnDcQkHLKvfbr/EjxgCfdJksi2/pWc3Ml3ofGQzml1BZOwEpWy4UaqwKLg9/BrpHfrsSIERO+tnbCXyeimLewbX/Po4FxJxwPQS+4VybKYdW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782543; c=relaxed/simple;
	bh=ejYwKV1fvCU+OGYNk147FP+gAndpm1ujSerj4glbyk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qPKkM4pwdMCFHFtfrv4u63lQvIXeTMwLqQyrzpKI1beEwEGrIyGYPtJ/H2Ps7Gdz8vubJMmOJIonYJEF0gyu4d429pWoYmp0YugycT+4xQmLNfMi0inUvNSQ1WaCJObPIUV2+pni/EIxAZO/p97YkOvAAeIWqcIhn+Eq6Gwdgbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U8uPSaVX; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U8uPSaVX"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ce98cb8165so606555ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782529; x=1785387329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMQIA5NlQdKTc/dqW/t5DllpXIgAMPtDSEZ406vK3Lc=;
        b=U8uPSaVXcpY+s075gkaVd/QBPfhTo9snXWIzVHSlcPaTDnK+LmLwKhBMtPujtWl4Ke
         rtGYkR8GHy1zt6TCsdy31+gZx2pRh3sp1hIuUQXu40NJ/nl71PTYGiZitJ0uIuxzkLTx
         gUtQMzAshFVVGfaf5r50zWio0yUk96CnKFIvcg12DaJJwgYkFPU/KUv3lnPaS4tA0z/3
         QSES42D6dzW0GdQP2bKoEEkWyZ3u04IFrGCOEwBvZDFNredhl68hHhiPNaxkKC+TOMNZ
         9lIKRTfYFUdRSpuYo/ezRVSCGK9zS3mCykIvCGd6YPqrYYqgH8RVOceiiYypDTaOXaQ8
         jNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782529; x=1785387329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMQIA5NlQdKTc/dqW/t5DllpXIgAMPtDSEZ406vK3Lc=;
        b=aJx7q+RK9bKS1yACDNlDM9dOVGW208vx6zSVisZ2TsvP2jhZlhQ1rfVJJ6JjgKqIg0
         10aw8RrheR1ktalelAFQMl5Atifq/WYflKZE0vsYlj2+F8kDnsejoJgC/r/ComA7P/RF
         egjrhtThCamjhNYIv4ksqij5QA2CRATvbfBUCW410zfDGG1MXwNUaC2NpqT1edvmWc+2
         p7pwZPzwqYY8FxFKQv0Pncovy3zpC2OrWOpbqFINNW8TY+tlJ9dCsE+tAR2yajBZZn07
         7SVvNJ0MVhp20CJtG+bRJwfPprjfVTB/GokUJ3v3sk45m9wFo+kBa1AV+qwZoYfFmOyZ
         qsdw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+iFkaqmhGHGyFvgA0EkO3bwdeZ8OJFfR+zmu9b2AyMeC3eTqN4/0kQBPXmyRQclHZk5vF6zkgIYM60KbT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+GQ/Y8UyR1dqPM1juduGHOGdbLE31sRQYmRFWx0urrT6lGo6d
	8ilM7/0fVsaLf/XZNRbJr4+WPmQRxxVOvd0D1eEDqvdppHOCyY7DgoRc
X-Gm-Gg: AR+sD10Wc7IzkoW3f25B93E64KreF5sR9R5g9rwjH7sNKGkpWMbDY8FBt6TXl0xFhnL
	Blbz/cGFSkCVDUlABxHwN/4zTRzCN6JOaLtQQ77CmTxItpd3jxS7i28of6ThbQllDrT9ldCyUiG
	8fDYbD5O5E2dPuXN3MH5MBhxbRt/3TME6S/E3Z18wdLG10UoPL7wN5vm9FfzI8FoIMudXCkxGxh
	j5Ij8Qqqwqaqg0Wq/f7E9BcBszTsYVx63yBbMaJuU3kTdslJZ8k3g9Gq0rnoKITm5+7wLhcAzOw
	hP6+qjsIx4QYecmcuyM1b3WbB+nOsM7Gp9W1rAJfpmRuu7Y3PnL2ZCp03voWETzggfumK/mnzlm
	vVB456v0hOHMAV+GwuO60ae41NLKAOaYMeC6f40/Cn7de66QDxtCN+HHEc/3BBumfLW27X/lAsO
	eMrtkxR7KNlQ5d/l24DLF9J6/7iCiClApsxNrnxsTirgThE3U=
X-Received: by 2002:a17:902:dac6:b0:2ca:eff:ff58 with SMTP id d9443c01a7336-2cfa95025a6mr11869245ad.15.1784782529288;
        Wed, 22 Jul 2026 21:55:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:55:28 -0700 (PDT)
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
Subject: [PATCH 13/26] ASoC: codecs: wcd937x: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:14 +0700
Message-ID: <20260723045327.28260-14-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd937x.c | 25 ++++++++++---------------
 1 file changed, 10 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index e0169e783ee9..0dd05604f5b8 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
 
 #include <linux/component.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
@@ -1056,7 +1057,7 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		return -EINVAL;
 	}
 
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
 		wcd937x->pullup_ref[micb_index]++;
@@ -1136,7 +1137,6 @@ static int wcd937x_micbias_control(struct snd_soc_component *component,
 		}
 		break;
 	}
-	mutex_unlock(&wcd937x->micb_lock);
 
 	return 0;
 }
@@ -1460,7 +1460,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd937x_priv *wcd937x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1475,7 +1475,7 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd937x->micb_lock);
+	guard(mutex)(&wcd937x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -1490,15 +1490,11 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD937X_MICB_VOUT_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD937X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -1519,9 +1515,8 @@ static int wcd937x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd937x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd937x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

