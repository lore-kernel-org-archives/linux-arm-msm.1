Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35B144CAEC
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520500; cv=none; b=TI5JpYRrsd6aX3wyJ8Uns4pepWud6qlym3FS/JmpFdbIRA4KWuXC6NRieTdYVJ0H7+Hkp/kAVJUEBRoH1uyYeo8r12mCkyJqJVbVEAlIW3nDG5QzSWRUJBhDS8DMZYZapCeNwnRvQJOQMGH/sFdnrNyrAtzfVK6rVzR5dWs1rBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520500; c=relaxed/simple;
	bh=71e6v5A0pmTCpY/muFVgY0bKxBOo24zj6ulqSaCErLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F+S759bVMvz/fWGNbDwF2V92/rQP2Cjq8eerXx9i31mKx9Qk3oA8iAs24c2eTHUCvGGS9iPc86aAd3iPp6S6wD+c6UoNdnIi6Qax8g/vDW6sJdg0c6l4GRssfKEyd34D6MWY8J7dJ4ToZhI7IF2dzogVN9xWvcP6bsVGINpgi3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SHsvHxu8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SHsvHxu8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cad8076b01so8949685ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520498; x=1784125298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=SHsvHxu8703aB2yGEf6WaOaN+sy9+s06bbZK2fePm09Kso+44hRvlpqnRlVBE4+MUT
         PuHFHVhQiu7w/1f/8loH/1kCeETWYHHPo6my4uh1BL0wg0qEbQ93Z3K9BhygQ6jBZCPr
         17jNMF6Md8qSDjHoiz3Ddq0iC4+l0KLE6G9N+FZcSx9j6WG1Pnd7Be2wH48yGI6sFUPB
         DMEwQJ2iLGIYkwp/efldhxLgdV/cDK9dBGYx901DnNz8bkqAJ/YqmHrekU9nZZ7wQ5fM
         X4FA1VsJ4Zu/Uqq/xFKrMynFzR2ZhI/YPt+ybscmCggn87ZZjmezrBq/+OX52VCCIIM8
         BlYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520498; x=1784125298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jE/vGes9bWof+nCBjw7kvawhZty+DCUG3JNg48uQoDI=;
        b=C73tWXgIW1dXomCmc2WTf8felly4rIgGV092K3tM7kcq60/sf3gkAS4XPfrfKd8mGL
         i74Wn2mHE2AgKctXVx8kFbdgJaqUXKKwWkGROm0KUexuxcSgCM1M9tQRvYxEtUMWSteI
         X3+sbiqOR3hmqPaRyhriHKf5NKW/cJtePI7hRRe9kgE64UpTeNL4f7BkOENEGFr9ppNf
         Wi7vZmDzdoS9e0P7tKe7If6vPXlhwm9J5DZvf2sJLU7k/50C921HIc1NGvEMs16Diao8
         0W99RHis4HaIAABdaQHYgBt92cWtOZIfn6el0w/WWVDGCKvC5vf5j8W2mHHx5b7bdd8+
         2+Iw==
X-Forwarded-Encrypted: i=1; AHgh+Rpc+YwgLntjOtMK+702+Veji7XOKiGlNAm6Ew7RibgxzaNrwgb+bSR8UIUTqx3njiFmSdyl8jOF029a4s4d@vger.kernel.org
X-Gm-Message-State: AOJu0YxfKlrDucKPAS3V7YjcBIc0dkO9T0bcaYW/bazmhRJ3VxVjfwaM
	shnLwywIqdbcZ3XgIuYL0gaFSJRxWkZD3i07E9Z07+ULfYpL3kGJiuWx
X-Gm-Gg: AfdE7cnHv8dnVYmqjlI6KS05YkwR+hJCERSB8GYQz0XzapAi+/nvqPzNs68lKKLO4KH
	IPkM/pgN6E6KvLvDKiXf33o9NjlUGltIPkbAI31Zq4z/oOorSTtKr9EGLtgT/uaWOCWzx3nooj5
	93nlJtSXLJaM89TaxUIBspuIoNTwBB9TDuz2LJ/9Ts7Mk+Atz19D3s/3zCmRP6SDDcMzurQjXMw
	bttdP9bSgVaAjurodlaV7O+59xf/50Tg2oVjLY2wsmF9yTLSBLZyO9HIbKcut6v31UaQ1PdpJ/q
	FHdaBvb20SfRQL1Bs+768IJoiTWxBWXXQwg1pmh7Pjx/XDmMDyJfd6yyL2TXLCNKiJjIkuS9tP3
	LYZKzrc43/0J0TAEej0rjqskXTPzWMvDo1vtfgsnAwftapOIM/fYs4upTmZSmW9ixS3MFqIAiJl
	rTzpyxKCLl4cHMGmAkno+fmFdbiWhSn9GFFTdPkEb/dKgEq1Q=
X-Received: by 2002:a17:902:ebd2:b0:2c6:a772:7e43 with SMTP id d9443c01a7336-2ccea39354fmr32045325ad.18.1783520498057;
        Wed, 08 Jul 2026 07:21:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:37 -0700 (PDT)
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
Subject: [PATCH v2 19/27] ASoC: codecs: rt5665: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:26 +0700
Message-ID: <20260708141734.578926-20-phucduc.bui@gmail.com>
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

