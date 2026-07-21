Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325D5495501
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629736; cv=none; b=aJTO5V8UZwoEmxeeYjh/lGbz/G5A7rIelP4C7qdpGBowCimEa03RvbQvyj16vsPbizMJnx3ntiehQnIz4TyBDsWV8G18+hsvTo9D5NlQKbsc/uRJI7zAmOKMQz1rKrVt/SiV4ukx9tjRhSdt/FtRq72sqJ4quqrifcSInq0jj5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629736; c=relaxed/simple;
	bh=71e6v5A0pmTCpY/muFVgY0bKxBOo24zj6ulqSaCErLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHb871J+lmbxpMqCaOQnYRhMNfYjhmgfOCsKxfSfl4q3bWbRbQTzxsNgt0YlxMoANWITWd3Ub6poYCrVj2QNcujyhpdU5ol9/ObbtCtCN1GlcCBPXreqbjSOw1+LJr5o8cJWDoiAPLGjFfnXt5SJnnv6is0YzY1mpmAOGevHZS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qvKMWgnN; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qvKMWgnN"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so119967545ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:28:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629731; x=1785234531; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=qvKMWgnNn1YFVGOCpX6r+V+fS78YWOo5eycufmTkDAAM+876VlCQgeWn6QbzjGhIjr
         NJbAyYDdxe4YgEI2AvQ4RlLtHiVup994C5Y+7nnT3dmQ+FL+rv3EEQtzBuYzW/er8T0R
         wWdvC7FzHi9a4ZjAtOd5bq1dNFqqcIZiTUWbuSahOu4IPlHpLVbs0laEOVGcrCshQt6Z
         vFOYtgjs0ORZsDUFz8ieumhr25IwalTP/UQnB4LIHYWc0Siwf2c8o72zxYPvCwAE84en
         ACHNbmFyfah+Ndhd+ou5S6jdulVdrrr9Od6KPxNTLEti1utlwNxvVssITevTIQnYDW9R
         WWqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629731; x=1785234531;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=euVN/cWAy7wcXNDaT620oZA1ehvRTftThfQsmOkT3nsLatfBLPsgI4GU0rfbpK30YZ
         jfi+MrTFzA+4qJybaU2zk1ldcVzufQrc/rvEgbX9N4cL+Dbkfl95UB8bjDyBs5piZoTZ
         Vah6SQa0QhUMPbnTOALae3B7Qs888GRjJGf/5NWPiFWUp5kjK/CMxERZg7XMSgv1kzjP
         2h71eRQaQLJInoQfY8VLT8nov/CNsmS1jJa/Xo8N0kKV3aF0oTSNHZW4Mq5tGpKk1EKC
         5pyPIpymORzpV7XL7f3ypvcf6RsDz8d0cpScC38RHuFoAf+5jvw4f3ZF0o1Zrf3BJkbM
         U95w==
X-Forwarded-Encrypted: i=1; AHgh+Rqney/CFgRmDoPZQzo3CkikB2D058S8tvBBPuJk0cquadUWJsTMJ9UAoKtjL1B91oT/X3EpUAKfHamMXTDo@vger.kernel.org
X-Gm-Message-State: AOJu0YyAsu/UjyGMAq4AqOQyn0lNJVPVthI6OVacy6ojWLpGA34jT2Oh
	pu5WygrOG8uujGFkdo5AngLy2/qAlquGesKYl+Va5eIQumT9JA244ZLw
X-Gm-Gg: AR+sD12+yb2THB3/WtyVojvYtFWeecN2CKqlZfrIZ2IOjrPtR92lytPV8Y6XiqW/nmw
	zWZUljYbk5eJb82IcttXj8ISucX/r1ZyAwzbb3HWxioMMS/dS5cXIHISwHAt13yHUTHyPPaF5zg
	hCHB3t40MfIR8vuOfnls8I0U03vBgKdNbyEOb/sH1Xhc+OWGfIfpLtT9wXwK6qE0HYqsYAvvlQ2
	tTR3W8eMFWXNOn1BJJqlJvuH+YoyQNYjN3dNT3LonPzHUkrUr19ZvDtap20QvwP8hfFFJlhMdIN
	tM0nSmz812UnJBWm9VkaU+zpJgKxZwXy3FqaABRNFPky2eymlx7eGeqHUZhGsu0NP/qqGdqDn4y
	IJljl1J+CeRv3D8hKmBUe1qsGB4eapP5ZviWsUO4RouSBQrtOvWOWjoN3o93mG8U0NJTyfPzBSt
	eK6514xQMhGitxpOoFryiNEANeK0CduqEpb3Vn
X-Received: by 2002:a17:902:ce07:b0:2cf:7d0d:ddde with SMTP id d9443c01a7336-2cf7d1d27camr38565945ad.0.1784629730842;
        Tue, 21 Jul 2026 03:28:50 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:50 -0700 (PDT)
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
Subject: [PATCH v4 19/29] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:50 +0700
Message-ID: <20260721102600.523199-20-phucduc.bui@gmail.com>
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

