Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE8E37473A
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629812; cv=none; b=BnNpMwaABYesx+Pw+sxvuFVyatAY7WUDFpUTRAHe1bWATK6gmicjwdGA6eN22Sus/ZiPFQCUjl6yM8UQtpyS3Pc8R1X3O5gmkljyWeLneQtdOeIbweo71AXeTbx6k7+gSTF3m6fv6ppb/EUqVCMyaXmKA5bYqaMaW3PSoexr9dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629812; c=relaxed/simple;
	bh=8ttlR+tB/Ek6pHfAOa7qh57d/TkjEVyyP5L7gkm3RIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MaWaGDY4HN4thjdngIVO8EZUDF9T48zx8NitovJE/sM+owwpeFuvU/dxxXXFHyGf8GmmnI39olZsEiWr4QNbHnDSJA6FPaao3C9gr9XzHJtQVsRJgLYrivc+y+2Uz5Uy6sXNrWVziacvNGCap80r1+3rq9cAPFbbZpOKSCqIisM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E6G9KBOv; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E6G9KBOv"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cab973140bso136563875ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629811; x=1785234611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vJaZSLBuhqMtQ0nYByw0vZcUCn5hN3L2y+d0nH5sVcM=;
        b=E6G9KBOvTL+Y/SBzAy6mWqlBjo/OqIJV0ZFQIFzoW1UwkKSkbZO8v8Wrn7EPD6HfDO
         UTBX48KirQu/W7YqOt/C0FSya+xnEwLMtqLrVn8sgh4PUoC/tavjjuVBaaiUv22QSqx/
         ny6ubp2kf64zXIg/1yZmy67W5Q9LljKwHkArlrcFNeOx5RlNesxTnmIqzh6WwDbEyy1d
         8FhCA9HzG9lSR6rDl3AK0vZc50YRt8hAF0RGw0WMymY0mRS11cHgeN+qaNqFHAlQXXXn
         oTtBjVVuyFQWdlUypZXfY3pL6GIj9T53YbR3VHwtFvO6BimLGixokauW4kOEfO+dxYav
         qunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629811; x=1785234611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vJaZSLBuhqMtQ0nYByw0vZcUCn5hN3L2y+d0nH5sVcM=;
        b=XatM78PCsTLtZIKdyu+mYxs8cMZYAa++Ox2afbLlIwkXbdXONbbYtVf1qB5d5yyA/t
         kI6lV1uZCDEpzQA8wSXWJDrqqXaftgicE60MlygDo9nKRymCzUjOijSI/tyDrTtFV9iQ
         uVH1xkuYfI9XUEtebAJVOiHf/LpSTf7pGSQH78cfoGl/77Hax9rLLlWCYRTReCUv2HcL
         2p3GBe00hmVQtqIP9uqrY3OifaBBfeQqggpJHk689rG1geq5vNqZkQNkOvFcqFcWlXp1
         ITbWNZRDj6XY3fipoj0oRZF5TbAG67sOLxnHjqOXCHcYdXmtGPtLpGPfs1yjQFViE6j8
         pckw==
X-Forwarded-Encrypted: i=1; AHgh+RrozP9grK7CNvkD9BI57dbg+m/oB52S2n4PdC6G0WY3gp6+r3yyhjiH0ahV9Zqo6aBFXjyeQmGM9rISpvED@vger.kernel.org
X-Gm-Message-State: AOJu0YyfhDcrs7PoiR9Wc3c61PeIXAPQUBRjwFZswm+eOvPZpOl4hyp2
	oOXChc5WiDAN0/hcL7peLxbdnpeOVYAOK7Faj0fikn2ohTM4+0KtVJrZ
X-Gm-Gg: AR+sD13GxSEGOnRlZXWo1zG+jsqD4wmCxe8Yz44F2HvVRLZDW4E85585A4iIGbONz99
	Kbna2ZXCuVtNCzpIKk07G+Zruilo+G699PLXZaZwRQCUbRu8v6Rvysq2HAjosdlYnY1sbZVxgSv
	vweuHjxCSC6cx0JTuyjLNVM6Y0wLyuGZ7JAc0LkXcx353NRirpZ8My0OeoRELlWagSashFxoEq8
	SFVNJvWWA4qkLkwnFh2JB9TdbpVvweBhH+ylOlzkSb4ZFKU9uw8kdWGNeuZHXKdxnAbJbU0K10l
	5UDjsDBIcqmcqchkvcZK5Rvhzs28Ua47AJxKh0GI52VmdBBOH/0SpsSzW+HsW4MqyUGDYWOfjXT
	rHBGrQrWcMFJcyKIdDctKId9xr69muS0Jf9DEfPTg8gBFgNrr3bqOWqD14/bNptc7ISQgGaXKrs
	tijzntcigb32GX/NwSkY6kO0j8Bq74ROUxBHyu
X-Received: by 2002:a17:902:d2d2:b0:2ca:d7a0:1312 with SMTP id d9443c01a7336-2cf34961d82mr214608165ad.25.1784629810737;
        Tue, 21 Jul 2026 03:30:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:30:10 -0700 (PDT)
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
Subject: [PATCH v4 29/29] ASoC: codecs: rt722: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:26:00 +0700
Message-ID: <20260721102600.523199-30-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt722-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt722-sdca.c     |  4 ++--
 2 files changed, 18 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index d2db33b4f684..05e8e23f1f43 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -513,13 +514,13 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt722_sdca->disable_irq_lock);
-	rt722_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt722_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt722_sdca->disable_irq_lock) {
+		rt722_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -541,13 +542,15 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt722->disable_irq_lock);
-		if (rt722->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt722->disable_irq = false;
+		scoped_guard(mutex, &rt722->disable_irq_lock) {
+			if (rt722->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt722->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt722->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT722_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index 1b6729f363fc..decf9407ab6d 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <linux/delay.h>
 #include <linux/dmi.h>
@@ -294,7 +295,7 @@ static void rt722_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 {
-	mutex_lock(&rt722->calibrate_mutex);
+	guard(mutex)(&rt722->calibrate_mutex);
 	if (rt722->hs_jack) {
 		/* set SCP_SDCA_IntMask1[0]=1 */
 		sdw_write_no_pm(rt722->slave, SDW_SCP_SDCA_INTMASK1,
@@ -317,7 +318,6 @@ static void rt722_sdca_jack_init(struct rt722_sdca_priv *rt722)
 		rt722_sdca_index_update_bits(rt722, RT722_VENDOR_HDA_CTL,
 			RT722_GE_RELATED_CTL2, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt722->calibrate_mutex);
 }
 
 static int rt722_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

