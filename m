Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D598377EC7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660068; cv=none; b=gJChot8hVdUy+JefJE+oFLtq0brE410MrhPWvka8y5SS8P4BgLOmPp2zlYkjLepHX4mXjAEJLzhz+S6XAKsXkUWzXzIdUGH2k5Uf2220kSYxkqLUPSEzL0Dq7W/BgqryMrAfUeDrMlsua1JYuuIDZ1r7aepGAK/KNcPJDws54fA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660068; c=relaxed/simple;
	bh=71e6v5A0pmTCpY/muFVgY0bKxBOo24zj6ulqSaCErLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RR09x9J7L7pqzlgE7X52cxfKQIko8PfQF2S/k53qnZVkUbM6AORypTmG+35Hg7ucM2/7tbt82RTQB2iVuAEm2m1f4PNaLjtYu6yvwx3P4VAdgMsLgF5L3FGRbwe6ciY6VeZi0yQWKz1bSWb9nnDQ838GcSpP3f6yKvex14L+3iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NY9PIudY; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NY9PIudY"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so482650b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660066; x=1784264866; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=NY9PIudYb9Mw5dcW5ExT2mirbbQi7M43wYStK2V49TrTSeBQdkOinL1ZURwb7MqVyZ
         CmrMtCDFr8e1+NaXudhX/zPH+C46MKXDi69NZGVdMQdJ7QI9qkSd6TLD6b2nikVa2pKb
         AWR7alm0VW50at3XAIJCc05gFuONvGKzjgHN9ovUcMSLMOKMOXm0tVaoTpuwdrdIEzeP
         Kv6HiOphMqKhEiTru/Jl1PK8e0yPXD4mVSSeezHQcPBhqSQFU+mRTaHGLOE0dPL1h9H+
         hMtSPAuD8KcsGxLBv23T1X0Lrjbrt1YpcBg6xfODYXQn1SnpOLxr+GiWut+zLVXJtSTr
         c2FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660066; x=1784264866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=WsIDMLQ9yD2jTHsi+jLeycE1AEfVXSfPgXGf81fW0Q/E4qlUVJBMHdvKxUfhCqKPWR
         BXzHc051QYdPc8zCiQn3joV+M4p+7e4ISrUS0t4yu+tZQGyCwEBOzt1uM4jHT27OJO5u
         mDmAv5MYRDBWMkTcuHRiB4iHh5ViH9x0Spc6EhRu+cLZU0C8TRiIrg9jq5BbbwtGAEox
         kjl4bvav3v+pWoDQS5oRmUFhMM8mxiJHs8d7BJt59m4O3zVRlRtoVIr2QSNg7ai/gRjg
         4CBkuwrII8U90i+CpO8ECGDeFA8FcqSvSgTzcMKsN6dJ8ASvWwWECOnogJyDZYCcMtFb
         iEsw==
X-Forwarded-Encrypted: i=1; AHgh+Ro3WwbqIfaDoENDkmj4bSNqzFQV18bpnXjMEDhhjHZZ/Kc9N3mOsYX0iAd1bQiJcen3UMOYiCa1s9eEMc9c@vger.kernel.org
X-Gm-Message-State: AOJu0YxUuE6pmjyqzEWPdqeoZCLyGKF9hGM7glDE0LlKejvWmwI3aIOF
	+NWFoFsLIctSWOl0w2y3LmLKltH9tcU59+Ekof4B/dQDjDxuvXlVaRJP
X-Gm-Gg: AfdE7cnhZC0bRgOYXcHp+rLJgZ0EVIUWFVnBj1PqMlJ/AdBqZtlv9Z6WSjADUZXP6Yg
	CofHGkWx3F2lA08M3MuB/S1dLILW6GX+IlG5Z1kePiE7PxL7yPB+yC4uOrjRLki/kfFnLf/7BI8
	zMfoRZ9eyFT/SKdyhebtu0w3VzbTZLttADZg5xQKqalZ8SbJ0IIgQHNiNU9XxZTiNaQ8dWq40/O
	mEmqe8At7OnDUE9BYvyM7o5qDlvE18JmO7GfMs18JevJLUqiHHZETMXm6afmt/gDzun3+vwleGy
	N3IHlQl1jjt11HTYizI614PTEZX4LJAfjngapUOKAQ2/tvcUQ5GPJUjTm+KiUnqW2qjpBA9sPFH
	XWhGKiGEWEIZi8pdE5gPdV2gokQUoTfRsw2dAxF5ahU9TDewswsLKi60DFjWxHi99yeJ1NWJJsc
	INM6QQ/ySGi/8sfBj6NxDrCUkJCDUc7ju8PribAV1B+RMo2ks=
X-Received: by 2002:a05:6a00:3923:b0:848:7b92:8e79 with SMTP id d2e1a72fcca58-8487b929051mr507140b3a.67.1783660066423;
        Thu, 09 Jul 2026 22:07:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:46 -0700 (PDT)
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
Subject: [PATCH v3 19/27] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:03 +0700
Message-ID: <20260710050511.14439-17-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5665.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/rt5665.c b/sound/soc/codecs/rt5665.c
index 48f57cd0920d..1d987472ba42 100644
--- a/sound/soc/codecs/rt5665.c
+++ b/sound/soc/codecs/rt5665.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -1208,7 +1209,7 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		usleep_range(10000, 15000);
 	}
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5665->component, RT5665_AJD1_CTRL) & 0x0010;
 	if (!val) {
@@ -1274,8 +1275,6 @@ static void rt5665_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5665->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5665->jd_check_work);
-
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static const char * const rt5665_clk_sync[] = {
@@ -4564,7 +4563,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 {
 	int value, count;
 
-	mutex_lock(&rt5665->calibrate_mutex);
+	guard(mutex)(&rt5665->calibrate_mutex);
 
 	regcache_cache_bypass(rt5665->regmap, true);
 
@@ -4601,7 +4600,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("HP Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4620,7 +4620,8 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 			pr_err("MONO Calibration Failure\n");
 			regmap_write(rt5665->regmap, RT5665_RESET, 0);
 			regcache_cache_bypass(rt5665->regmap, false);
-			goto out_unlock;
+			rt5665->calibration_done = true;
+			return;
 		}
 
 		count++;
@@ -4635,9 +4636,7 @@ static void rt5665_calibrate(struct rt5665_priv *rt5665)
 	regmap_write(rt5665->regmap, RT5665_BIAS_CUR_CTRL_8, 0xa602);
 	regmap_write(rt5665->regmap, RT5665_ASRC_8, 0x0120);
 
-out_unlock:
 	rt5665->calibration_done = true;
-	mutex_unlock(&rt5665->calibrate_mutex);
 }
 
 static void rt5665_calibrate_handler(struct work_struct *work)
-- 
2.43.0

