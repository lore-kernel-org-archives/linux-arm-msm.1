Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D97C53783DE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660127; cv=none; b=hHXgHcs5KcA+bqMgUxkWRogXnt1dFWhVbxYWY6M6BYnD5M94QMl+cG1shRWUz1nl0iIHMEWZIb/0PCfA6+OY9WPuzyDqtS8l8ylmgzwl2EBEUaGPk8vzJU9pA3CAx+TosRThqbPOvsFq/DqeSUdsLU2K0DkVIWho65onyorjcbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660127; c=relaxed/simple;
	bh=MweVdIXyxpSdaAyXydGV9k7M9ZgI8Ju7aFXZhHZMKi0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a3rn4aQxKGWp5dLYab2vZiDQijOkswdzlELwewoeriBqQ265+2oF7C5cXexgj3dMFrKZkGd+0b7cSgniGm58AQ0hv/T1EMihBGSpGySUbfqQuDwY5xhaxvYDYwGRYvqc3BkxtETUSFgBz45vCDyyEHqnRtMvgmI73khRyIiphgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuOxYF/7; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuOxYF/7"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so92494b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660125; x=1784264925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K4c06G1YhkVvW99Bq1imq6AORHZjUoeyckmKw8GFUMY=;
        b=MuOxYF/7sqOP3EYBykWZmuThKlq9Nsex/t+FsW7FZU2K6CGGP1FiWjE1Y4Q6mhwb7X
         VpPPWEMuQ7BJwZcVLF1LGoFdVC3ImWMCJWirQ8ZgyVWJVOcidoV6q0ERfxJNZktZWJI/
         OmEdP4hDTPPryYgswuwOBX+mJiYOaMzIZgc0zbLPJepxpJ+qxP/fkYWlVni55fEn5iLb
         SIRpQ3K77vRJ/LJvFBjS9RNBRphvfCL68nPNZ3hbLBwrsIL1GILgfQ7tzkNo+DGmT8QB
         r25k3zSp2EJDE8OS3K27nkzKuBmfRGptSY2Do68IK9HiLZQtusr+4aS6Ntg3iFkbVQ1C
         FyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660125; x=1784264925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K4c06G1YhkVvW99Bq1imq6AORHZjUoeyckmKw8GFUMY=;
        b=MDx8mAdUOFAI2PAcpQsiCT2VShOgq1W02YBeobAKRWHpmrdOi7WQgzjNiWe5Wh0009
         Sp9eIoQQ1y/9qEst/xGHCthoJKWFLfy1DqEyagnOhlbEiAPnkY0p5e/gAfmo3QpEVPtN
         u1LoQzcGsVDxwfLx1cm9A8AvjxguE1P0Qqfg5DNdmIMZ8PlWJrfrtm0mggqDz5JN9yei
         Q+HMsv+S4iYiV/i8cZGfaQukUgW7G27OTJwubrZwHQfsa0a9QE4bRDiLz0eEqiBw2HaL
         AlncCQo8bphyvYnia30rBn2VnqqrPERX665CvOPFIr6k0CD/EzSXPsTAXQyyOUsDxfYI
         gvEg==
X-Forwarded-Encrypted: i=1; AHgh+RrfrkxDmRqcsIRsKq0g8cRgOW5uhFI1x+HzuNKPQ2H/uk47CMVQTyQq1m8rM4WKYccwNB7dEwAxepCWmEf/@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1N6kpqVm4QeYpBLO4nF3UCDyJW2PkXQPU1boFqBjG2bq0102m
	MSwG1+p3MlTXUzRgU1EeOYagL+vHJX/uCMghoTBdIpTdfc+lb//sFO8D
X-Gm-Gg: AfdE7cnz4ZP+PsmZo01K82iMpmh24BZKojet2BvYK+HKpDKlR6EN1IEbplJDE2kx+4Y
	S63FTYwP5lILLaKRTBC+N8BthA1TkrPYeTkCBvloPr5cPleCoc7QT9WrMZBx6wxKKfGcsu4HoM8
	rxsw+lTuptbiHtJym66NT8zfLJRiD/OaqF/3xyv4BimLwhsr5C/hHF54vneMYYJSSHFRWZ8JT81
	Hgn82QVz1p50jTbp6suyrNHV+5ZhvnZBa0otApLJcbhGzAhWDU+6At8n1mZm7ampFskX0E0F7mO
	2/WqsDUMaQk3FFzTi1agN2jbj9AxpnxLtyEbU9enlU3dY1uw3KPr0vGeKQ54vyGQgMIb4fp+IUq
	RUZXEfJ8zKYn5WUbEEF2Sm8f6VSURvpAs+OZ5wxrKLJ3CtmkkUC2miuo+5sNHNIPrPmN1Cx6bM6
	Ya6zq7+IIiHq/EgmDxzPrOtLzKRVH8tgWdYTh4bqvwh53QZxM=
X-Received: by 2002:a05:6a00:a02:b0:848:2f73:8fff with SMTP id d2e1a72fcca58-848436944cfmr10668853b3a.72.1783660125218;
        Thu, 09 Jul 2026 22:08:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:08:44 -0700 (PDT)
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
Subject: [PATCH v3 26/27] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:10 +0700
Message-ID: <20260710050511.14439-24-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 041b381e582b..d54f3f2d5bdd 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -466,13 +467,13 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	 * deferred work completes and before the parent disables
 	 * interrupts on the link
 	 */
-	mutex_lock(&rt721_sdca->disable_irq_lock);
-	rt721_sdca->disable_irq = true;
-	ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
-				SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
-	ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
-				SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
-	mutex_unlock(&rt721_sdca->disable_irq_lock);
+	scoped_guard(mutex, &rt721_sdca->disable_irq_lock) {
+		rt721_sdca->disable_irq = true;
+		ret1 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+					SDW_SCP_SDCA_INTMASK_SDCA_0, 0);
+		ret2 = sdw_update_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+					SDW_SCP_SDCA_INTMASK_SDCA_8, 0);
+	}
 
 	if (ret1 < 0 || ret2 < 0) {
 		/* log but don't prevent suspend from happening */
@@ -494,13 +495,15 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		return 0;
 
 	if (!slave->unattach_request) {
-		mutex_lock(&rt721->disable_irq_lock);
-		if (rt721->disable_irq == true) {
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1, SDW_SCP_SDCA_INTMASK_SDCA_0);
-			sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2, SDW_SCP_SDCA_INTMASK_SDCA_8);
-			rt721->disable_irq = false;
+		scoped_guard(mutex, &rt721->disable_irq_lock) {
+			if (rt721->disable_irq) {
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK1,
+						SDW_SCP_SDCA_INTMASK_SDCA_0);
+				sdw_write_no_pm(slave, SDW_SCP_SDCA_INTMASK2,
+						SDW_SCP_SDCA_INTMASK_SDCA_8);
+				rt721->disable_irq = false;
+			}
 		}
-		mutex_unlock(&rt721->disable_irq_lock);
 	}
 
 	ret = sdw_slave_wait_for_init(slave, RT721_PROBE_TIMEOUT);
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index 35960c225224..159c35d19dba 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -5,7 +5,7 @@
 // Copyright(c) 2024 Realtek Semiconductor Corp.
 //
 //
-
+#include <linux/cleanup.h>
 #include <linux/bitops.h>
 #include <sound/core.h>
 #include <linux/delay.h>
@@ -289,7 +289,7 @@ static void rt721_sdca_jack_preset(struct rt721_sdca_priv *rt721)
 
 static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 {
-	mutex_lock(&rt721->calibrate_mutex);
+	guard(mutex)(&rt721->calibrate_mutex);
 	if (rt721->hs_jack) {
 		sdw_write_no_pm(rt721->slave, SDW_SCP_SDCA_INTMASK1,
 			SDW_SCP_SDCA_INTMASK_SDCA_0);
@@ -309,7 +309,6 @@ static void rt721_sdca_jack_init(struct rt721_sdca_priv *rt721)
 		rt_sdca_index_update_bits(rt721->mbq_regmap, RT721_HDA_SDCA_FLOAT,
 			RT721_GE_REL_CTRL1, 0x4000, 0x4000);
 	}
-	mutex_unlock(&rt721->calibrate_mutex);
 }
 
 static int rt721_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

