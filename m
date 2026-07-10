Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C6F377020
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660027; cv=none; b=QC4aUObjdn8Rs2/fay7jLik3CKB/x0CDCz+7eADgGY393yDp5eRL2XU7lKF927NLWU4KJ5qro/59VdUs03PvnwmRICXok/gftcmlkhIrk2gYJq6M7kYjI1TazUer4uPwVi6fBFvmg+l9CkBHxSIxw1jxSek0cmlXsG9Dh0UJi/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660027; c=relaxed/simple;
	bh=LPFWMIGlGHRB1wDJeutRakClbfN/3nxaoe4ODgrWOVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zm9/itwcoxD83l3CI7zvYPuEGxa/8y646Q+rmRmzRUkqT0tTFgmlgPmWBm+N0O4v3y5CgWAw6f8tdf42UnI8OGeMqbIZUF4us9xhQTUPLzuNQO87o3fKz0K+PeXxMipFb15uDsvj6RvakORC4wp3mpNDFLJXmsA7qnA+wiuOPvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VJ84AkZR; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VJ84AkZR"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84847482584so377999b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660025; x=1784264825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cKqRcXDTZ2AUkUtA/CqdSn+DCaTTyr1WUIIDbJXdQ3w=;
        b=VJ84AkZRZusuL4ZsXyekpgIyG4dONAAtZe3q6TG+iwcFwjddwA8ESQk3Wf3k9GUsQz
         VizjTOAVEgE2Nl9ulRRD8XXKexAKTiwsq65qqFsomI2OvKn4MfaRL97cAG0nvhptyJqF
         FFbyLDlIvKfhZSZ+0NSmh44SCwrU1WL+HvjF8HKQGRPaNxv5gpoY4hRnFVMUXYYKUHQW
         bcnBznyxghbmU/clEQcul23yogjN3NiGpnZagsv4wDZZJTTmK8Nm91i2uvnaISF0FgZ4
         dVsNMz+iBzJBAYH8PrKMnYvUxpJ5x5dijgpZ9ZZg1pokJ2fzKECrWAfnuXFM3jau9V53
         rc5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660025; x=1784264825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cKqRcXDTZ2AUkUtA/CqdSn+DCaTTyr1WUIIDbJXdQ3w=;
        b=EZsIH04CMW1g78TJUHeeUEmzuz4Ph8ngdFj/kXd4g/uLci8Azf5U+dLHGKGZ0iX1jx
         kxA2WQyPwz/YnrVkaegg8Oe67mbCHdW2SG0JTGMp5GfGfsMUfrTcVFPJVbcW2/2jr/oo
         3QHNNK5WYmkz4wJxpGuem96gLT2+go8wzrhf8t8RfxQAzqrC/HRCCDE9rpeisTogcDYR
         o3nS1b36R6hlTpe8yyEP/W2dtqa0ikVrVlyXTpvdrfYHrGp6Pc09YV5+HO4D0L0qV92y
         htwBK+s57Bti3bCEJhqQ8yK2xQ7H9IMypt5PPIHaxXLRMgd8Yw/yTN0SRpXpDEvPLKmn
         Vi6A==
X-Forwarded-Encrypted: i=1; AHgh+RpvLUXndUKAfthkQAHvPMOitMtVLA+DJ6W3XbgIKnMS8AFlynQo/VrBBZJU6PnYJ+VFo5y1ie+fD/J1fKh9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy43kbuD/cX7GZqlHwS/InZbze+5R20Ru2eP35+j4AqHFb2RwnJ
	cgz1R7kvG8wG1GR98R2f8PMQR6wRkHa1E0kivyMmtU81jU4o5QXVd37J
X-Gm-Gg: AfdE7cmHNzd+z1PfXWAXsNuLqLjntHhx6iNQ1yi+nmMIGjRydcrJvmx1cFdVRBaAn4R
	Awkg9pu8EtKFalLwcna+hVN0Dbq5KRQ5vWnUK3cd7BZ+e7L/E5ZbMozFQQHbEVyHptLk+cR2Lkd
	PFGnJF/2hwwGKTLAefyLPh/p18gF5StofjQAjMxhmyUnktR4/CJ9eACrbGhG4wbJ36Q0TiaJ8n1
	PRqDMHOFiw0dpgm6kRiHD76fEA22BjEbmVZ/WIzEpk3DHedfzZv9geCQ1RsG2kxqkaEiLL1WdI5
	KzK8gmi3CiqOB/VN8V7WaRuJckJVHxNWPb2Q5GIL7IDmfXmKBFrIrkt04Gq5p+JYNbJjKuv+Ruf
	XgnwJmJcL5N2T4p5CTiAauD53Qj3y1NJCp+abunPVw4xGRwS9zqtq4c1ashJt5s2OaHpCm+0LP5
	WgddBDeTuFm9dqlG/QI8y3dxnfV8j3Nq702u3fEJ1tiO7YzSo=
X-Received: by 2002:a05:6a00:b45:b0:847:b45b:fef3 with SMTP id d2e1a72fcca58-84870b7040cmr1847885b3a.27.1783660024823;
        Thu, 09 Jul 2026 22:07:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:04 -0700 (PDT)
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
Subject: [PATCH v3 14/27] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:58 +0700
Message-ID: <20260710050511.14439-12-phucduc.bui@gmail.com>
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
 sound/soc/codecs/pcm512x.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fe3b5011fa16..88e235de1107 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -6,7 +6,7 @@
  *		Copyright 2014 Linaro Ltd
  */
 
-
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/clk.h>
@@ -399,10 +399,9 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 	ucontrol->value.integer.value[0] = !(pcm512x->mute & 0x4);
 	ucontrol->value.integer.value[1] = !(pcm512x->mute & 0x2);
-	mutex_unlock(&pcm512x->mutex);
 
 	return 0;
 }
@@ -414,7 +413,7 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if ((pcm512x->mute & 0x4) == (ucontrol->value.integer.value[0] << 2)) {
 		pcm512x->mute ^= 0x4;
@@ -430,13 +429,10 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
 			return ret;
 		}
 	}
 
-	mutex_unlock(&pcm512x->mutex);
-
 	return changed;
 }
 
@@ -1465,7 +1461,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 	unsigned int mute_det;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
 		pcm512x->mute |= 0x1;
@@ -1475,7 +1471,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1488,7 +1484,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1499,9 +1495,6 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 					 200, 10000);
 	}
 
-unlock:
-	mutex_unlock(&pcm512x->mutex);
-
 	return ret;
 }
 
-- 
2.43.0

