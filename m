Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDCE3F5BD6
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:43:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145433; cv=none; b=JCldAsp5Q3UWdYNo6F1+f4BAxbCp1wFbIX8U1n/ewUxg8ZkypPvRZvSkViU05U4RlGTf7NOYVFttcG8k/j0u6MR2PLzLeGIeTcQWvtpli6ez/OrRCcYdmIIaCs11R3bUpxMzIr6jgFNBh7+d5VVG/2NgYSVkpg8KtjFa5l3nPAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145433; c=relaxed/simple;
	bh=ejYwKV1fvCU+OGYNk147FP+gAndpm1ujSerj4glbyk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JoT0+3YubEr3gisUFdvgEsHoYSZw2a9Zj3/6rSq7BTQxcDfdjnnynUBcNNLlzjXJsAP03rxHyQoQE1YdiOk8fyFLGQ/3AD7CtjCbXWD1b7llzICaG7SrpTFX+DPElvYa6fgOVheVYFz7g6t/PvZfLRjnKuIcTGVF1WMnHFQk+7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s3L6PcAs; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s3L6PcAs"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c999f162c9aso1716452a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145431; x=1785750231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMQIA5NlQdKTc/dqW/t5DllpXIgAMPtDSEZ406vK3Lc=;
        b=s3L6PcAs6woHaxNjnCV3S7nTTaP0LXA3C31qO7aQpSOvWo7fAeO1puYxPQ4uWF40FE
         PYpw+lY2TKj2g5/sPQAtAQYYiTeWlsBlAns8mqxi4zfDNjG+YrHR/bYw+ETI71FsAtBa
         dqo2BRTK6A4NnkQtpOy7nZiA4WyB8DYel6OBJaXIgIazfMzAyTado9cXwz9nOzfTlDoQ
         cO3oHfywSSO+hRpmR6btm+DB3ZCMhKke1lZdqgJy5+NjT+Z96DyT8S09U9Au6JzKeZbY
         Z5JtI/yL68ZBj00qRFMyEt548O8odYG3FsrYjs7OmTzK6l06bMI0nvnLbpdcxHFoonYh
         81Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145431; x=1785750231;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMQIA5NlQdKTc/dqW/t5DllpXIgAMPtDSEZ406vK3Lc=;
        b=bKIpk08JfnJEtOU+DCp4FbiHDjaPME0KPX4dkMFue2QnURPx5oa1svbLKosRMNNz0+
         LE95hJM19OqcvN+AnR1ZaSm4/nc9pnbc0DwKXQOSVUegMnDwvigcHvsPKy2DekxbAOlk
         F5cVvfNIQy+0LcvGQJMJa8KNuFvkOHHxmXo9igcD3MFh4L4MkbonbXskgA8SQLFed8Lk
         8xHGp9TuoaVUWjJ2dPeTgWpodLaQVZejsloG3LHWpC4g8LoCc9gUO6wU0Wdk9zgRtS2l
         kIqpk/YzM7QINLvVBq5JT/EI1eSCrVclaOme5wNBBwsKe3yg81iOFDl27FwLHBXcxE5e
         GWmg==
X-Forwarded-Encrypted: i=1; AHgh+RruIgJLASv/6P6OWqQ0N75d59MVldQh6AN4X0jY0gn0eX8qA47VPOrwGAe+Xn19J2V4gtkEBiI/7UyrBCnj@vger.kernel.org
X-Gm-Message-State: AOJu0YwM7YD/ZQ1ou1b9OivlGgD/aKPwFlqlMdgCikU9DNSjaQW+zd32
	KDnwou52yC5rZtKP1K0fPVJZFWl0zmhze6iAGWfvDkS9iZT3OcmE/4IB
X-Gm-Gg: AR+sD11iSfjLwtavMXXt1Omd2gg2OmEJANHl9XUeNIX9pOghnle1eJDvtY6669dDVs3
	7ZUTZVy0dRFVZGU1c95kUesS+DcADbQR1Ci/s9sFeZl/V4AiVb1+YD60+jK2rFNHjdH7hTc0+MJ
	XyoWy/RXqNkEYtTjTRhu0k7FlU0RQdx5xg7BuT/VZueg4RbNetKgpd8WhfmnNNdIHTC/aoOfDBg
	KzYb+dj8HJYrxLDFHw47FBDF7ySf00zz/grd/UX1IZpIB37T/EBTA5oE4H0wJzFfAR/tA9HNTgB
	Fe1mtMsRJ5f3+jYHS8uugspLUE3IyWWaIQ7VA2T947VNUOYoXOHGSyGPrnPY/xB9YADlsiaDBll
	dKX1ex6eOvIzG4Vz7wMDmXFDufGrY6DEfMtnMoS96HZ12ihRRqVC0/ROhDVbU+HHhatNSywYoCE
	lr9gI+FJlh+3p6xCi8UfaXBtn1QMNOyhTNQc5P0MyTVk+Hq2K7+wvh/IAYhjOYBFIcAw6hk75YD
	85tdONBfx1PKl17CzKgg7XsthzZ755K
X-Received: by 2002:a05:6a21:99a6:b0:3c6:3c5b:f32f with SMTP id adf61e73a8af0-3c67e0b93b9mr7312102637.51.1785145431478;
        Mon, 27 Jul 2026 02:43:51 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:50 -0700 (PDT)
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
Subject: [PATCH v2 13/26] ASoC: codecs: wcd937x: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:33 +0700
Message-ID: <20260727094046.23001-14-phucduc.bui@gmail.com>
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

