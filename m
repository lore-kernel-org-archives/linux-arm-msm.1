Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CEBA3A785A
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782550; cv=none; b=AuSaRpURjVfQd6OjK7C3/9Owik9sGCAxQzezSPtnKSHu8yONhY/PyRmj5p2odBfWm+2sHmT39t++oTdN2qmQW7Cdj10O4A5UF+7vPxKEroHrEQZ2wKQyQwe+U1Obdg6EGu1XqpdzKEnwkw1YxO2jUKPxWIgjYpyOMF8EXxnG5OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782550; c=relaxed/simple;
	bh=XnhnsPyA5QSjzg0tuQcdHLbqpbZbFqUdXNayJneipxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnm5M5ulmmLWr4PVw5T1GJGUDQvFYClTvhX7b3n+dAt+B3GnlTl/fV/+ojUT4qK4BZMYuSfrc0b1scplawrDIuPvcw9tpulBjnqcT55kIL8lXWtSDgVOpL4OkytXfyLSzF6epfK8Ys+SkG3DIZzN0mdUO5MbZqrPNSVtD/+SMME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=js8NIlJw; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="js8NIlJw"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2ceae1ed204so2220275ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782537; x=1785387337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RK1Qg1zMLuqf3deYuh7H14WODBPPcltBb1uxyeY+ius=;
        b=js8NIlJwSHr23fZWHoS5PHqp3zqIq88ETdsKVjE7r3ecsCgmNkeExepHyKVvUZ++Bb
         +8o/Ho0CgOxQ2mm8slUY3zlaHKWOnMaZPosARZcX3uoEK6FfQWDT2YeeVEjzj/zSMNKV
         oIfRwJHNO7gZs/UCdxIKdVeU7L2rM4to+Z3VodyCSYhco3tz01M6CDEouxvjt90TC/yY
         gQMiBAMqbG5DxAb73j3pwPV3214hlw48GgNsgD0rDHNdPAeZi6FGDEDJl94+PkXMkhXT
         YE8WbHtsIVRYTrvV/bXUN92nBxQ1DqojWbKqKBXn+4Ml1np+i6Mj9tlFZMgaski5/zoX
         ZAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782537; x=1785387337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RK1Qg1zMLuqf3deYuh7H14WODBPPcltBb1uxyeY+ius=;
        b=UYLBFyS7xDAdHWHVVaEDyvd3GqT2LBTK6uJU8xBZAyHk2ejVzYkadFI1XACjGzaDIK
         ErbBbAg4A7JN4xlBl9UbMoUOFn4cg0t6AtaPZtww5T/tRvQV8A8q22HkGIZ2hTDn3tgW
         EDssgibMAV5j5/QehDACzRF/cQzeMqmXascW7F4o2mGX6lOJkFRkQqX+X5JEgylugjDQ
         uIaDtWAejYGxtFV5T9LejznzLYhXxEJRfuT3qnf9RM9nnXjyMLCnojNneXfGO0ypbBQU
         V5ATOVfnWUPFCwTXdPsS9+GPLDPvuGPFplB9FfT0sNQSmp/Sg/p6sbeE7c5HnBwDjJlF
         kGcw==
X-Forwarded-Encrypted: i=1; AHgh+RpIIv+Jj6YunYE7IW46VKk0OdqXME3KbO35nBpEwofw/mco3vzZOVvEV+9fABZOhEuM+KP0I8qScZEyxvRP@vger.kernel.org
X-Gm-Message-State: AOJu0YycSDOyqavoncAgE2Cq+i++KFd+SFO5+NnuHQNzDZBhGuQS0oUa
	v0Ys/PVSWRtPzZXIl5U+zhok5QHWTGBQN3z/vPL1BXXIq84c4LtArqlj
X-Gm-Gg: AR+sD12udYsFYBBaCmK0iwoOsedcAfpggxoB5N0ANEbzfJ3sSqY/qic4nYWeMDzpgna
	ZCe8WGKC/Ktx6GA8XbLEVfnyru8RU5neoO+4KXaxqqFAVF3ath4GQRLQ2d5J1EtCq2JiLxBnDRO
	7ozLD4Dk0HD+chh3CY4pt097dbBq2G300I0ysYDLjDLYG5vtWPGXnFVYCTMsSnSryfg1lPuj4sa
	InNIQuLft5zfFgTsoqyqJ1d6Al95KUYX1l7vOIEhiCvoi1jqZrCnOaMzTOOmFpv54xLNFeyrwZ+
	ZZij7MjZTMrvZqm+LrF+szaIIiPNIdqdOqTUeq3I3srJU2/JuAzZOT77vhd/G4f7yAbMUwFBpXb
	OqkJOxM2lCwXiJy3VtEWHpuDga8C0uaWUjyUIFzBuGHNvSwNm9khChiwAHjgxmAbaVcry4i9xrM
	BY/6mHf/HR2MV4FxtFZYO2rw6hjvP4pwa7Wr/Z
X-Received: by 2002:a17:902:c412:b0:2cf:6f7f:55d8 with SMTP id d9443c01a7336-2cfa6c79503mr22078505ad.37.1784782536916;
        Wed, 22 Jul 2026 21:55:36 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:55:36 -0700 (PDT)
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
Subject: [PATCH 14/26] ASoC: codecs: wcd938x: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:15 +0700
Message-ID: <20260723045327.28260-15-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd938x.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c69e18667a85..9a9ea37ecab3 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
@@ -1976,7 +1977,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd938x_priv *wcd938x =  snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1994,7 +1995,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd938x->micb_lock);
+	guard(mutex)(&wcd938x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2009,15 +2010,11 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD938X_MICB_VOUT_MASK);
 
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
 
 	if (micb_en == WCD938X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2038,9 +2035,8 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd938x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

