Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D947F4CA291
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520548; cv=none; b=ZEHjAoEy07itfGdSs6vE7Hj8ZxnnQgsd1wJOH6L6qNHiaswTCDfKXEJZKidjYQmIldLCzJKz9f3L3umbNKikZrh0iGEN35Ggf8CYq6QHrbqpZH20ZjUI0V33huVDUYycaS0Ellfzh9LZ4hSIu8R65PnbaXlLjszCWxpPN9ouv6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520548; c=relaxed/simple;
	bh=R5dedIMDTwE2cId9qK/qWI3uZybefPwOuh0iBG5LWW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ubSJYZBsVxEQ0KHArtv+p2zN/p/N9a/uzSRMFR1T2JcQVjy9/VX1SScxm4ZeiDt+MPB0WHdHo24+FvCgJyFAtwgs08lE4DzBHLpGS20OniSwqldcT1dsmqIuJcE/ANPR7qjzhhGNxh0mVUygLBapabP8+GlXGnLDbVap7m7XY9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lRUtvR70; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRUtvR70"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cc97653887so8514305ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:22:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520546; x=1784125346; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=;
        b=lRUtvR70Q/Hynh8gv9EOMrOUYCeB0G+yJtJG+M9lf4uiia/E0838PNNtPfR5P7NYat
         akt2so2xSa6YUYm+N6hvE5am43vw5cBrvaR+A3RpB1u8YgxL75ooxjC+snzK5hX++nZU
         OWzgyqEm3ehCqsKWKZpv9KHUQe6rsjWQa1hHoQv+3V1lB7eTiqPblpXHoortwR18Jlx8
         xHdyq/TxrpN10LZ31mg33w3lE+um7OaBJUIBkCGgAmXK88rWFPiQUw4+8tWGfpjc0qgU
         KhiygV2R1ahYjlpxdU+o/04xPPDX7zpylX4/QjdPlPAbd6Y10oifrfxPTRzGDvbBoktU
         e9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520546; x=1784125346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jvHEcHt0Pv/b75XSblH4phF6+1Nj638qki4oB9IDwxk=;
        b=A5AAn66bS1AAD2JPc3yBXsnbpwW3/vPL9axQTz1Xbgav/q1eVFjdIUw/DXiyMNzpox
         WQUyiIz7/geIh6Lypz5KkJb3iWtGhnzUDen8VHZDopp1JPnqX+2ZOx3vveyjaBVUqDfG
         6e/jZ5Oz2VBsleLiyTWywkLPMC4BCKZNCIQsuNvJO311LAniWYxbEhHQooK0T2P6y/XL
         T5lTQPYK5rT9TSkYU/suSvvsdgytzqdy2Rh66yNqDF5ZnD0Pl6TcwBA+E0cEVKJUkfnw
         /fSo2wW6gKP+APK6Z4hEmHyHGRAdoAYL1+eeSRVCxFR9y1vWjmJ+EcfjsYkgZfaCeSkv
         BFCw==
X-Forwarded-Encrypted: i=1; AHgh+RpAOp5hG5/oYcdD/Kajcy6CKM9C4QLlSGj13qGPz+pHWfalR7n7Bnsq9sic31qKi1iwCrGcuXH4dp7iR6In@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8kam8brYeg7+E9Dkx2qfRP0oleKAdUVCajzDHFbx2TV4CHzls
	a3nIQWbVPMyOLPXh95nvwm4J5+7VK39oruO5ckSGRtf3JNJeD+OxU1cq
X-Gm-Gg: AfdE7cmF5qJA104WwfkNK1tu574j4zsOK43YMlPkv3HFfi5MckGD5zvvFzqFDQsoJgu
	O4Dot6iSR2YrFjEtthlhff6dUhHblDSsElmVBY+xzf1O33E21wx5E5yNs6PY1RKybvXy1Qi9hdy
	9q9v7pFRSok7w0UaXpsCQwCLibfU6db1oTBZ766+Hg5R/KjBdEkqK8psAhiM4NP1Rj/NthDtIn5
	d9NE52vHh0Sc5C3D8HiiLdrlTOhHbWPjOka5vpvUwQyTKjmwFWQhlS9OXYOAg3FBH+p5OFsqZIS
	XlzVGH3Yhco0AfEIuUK0Zi/ucSlNcngZH9RtlWDni/gEy/F6NoZlbs122PbAGWVeoNUa5FwOi37
	URAC3jqF7mGPsut/+tn/j86wMd5LakZyjZDfnAvhf3K/pUsCk+RLD4lzqvgoKqmctkYcTwmc2hw
	0c/PxyrtDF23LE0ApcQuXfUIQ483t8VJwEBhYNEhe4fciIu3CZC898Z+ewUg==
X-Received: by 2002:a17:902:cec2:b0:2ca:d874:c6de with SMTP id d9443c01a7336-2ccea37bd1dmr28221235ad.26.1783520546188;
        Wed, 08 Jul 2026 07:22:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:22:25 -0700 (PDT)
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
Subject: [PATCH v2 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:32 +0700
Message-ID: <20260708141734.578926-26-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt712-sdca-sdw.c | 30 ++++++++++++++++--------------
 sound/soc/codecs/rt712-sdca.c     |  8 +++-----
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index 2787524c796e..e784e8b7d167 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/mod_devicetable.h>
@@ -428,13 +429,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt712_sdca->disable_irq_lock);
-	rt712_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt712_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt712_sdca->disable_irq_lock) {
+		rt712_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -456,14 +457,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt712->disable_irq_lock);
-		if (rt712->disable_irq == true) {
-
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt712->disable_irq = false;
+		scoped_guard(mutex, &rt712->disable_irq_lock) {
+			if (rt712->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt712->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt712->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT712_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 4796fce084ff..5ab1d3961409 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -79,7 +80,7 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	int chk_cnt = 100;
 	int ret = 0;
 
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 	dev = regmap_get_device(regmap);
 
 	/* Set HP-JD source from JD1 */
@@ -126,7 +127,6 @@ static int rt712_sdca_calibration(struct rt712_sdca_priv *rt712)
 	/* Release HP-JD, EN_CBJ_TIE_GL/R open, en_osw gating auto done bit */
 	rt712_sdca_index_write(rt712, RT712_VENDOR_REG, RT712_DIGITAL_MISC_CTRL4, 0x0010);
 
-	mutex_unlock(&rt712->calibrate_mutex);
 	dev_dbg(dev, "%s calibration complete, ret=%d\n", __func__, ret);
 	return ret;
 }
@@ -403,7 +403,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +450,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

