Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C646448C3FA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629805; cv=none; b=HiY+QiwAA+a2LTo34vTYIqt0eVzeTJL9cWeHHQIKBRmcZyC5RT7jPk6tlQxMFoVFcXr4dig5C/ZXqBzkhLvGTyjXgUo501duwUSv+PXoBpM1XK4B7vJ9eZVNIKJTc5eQe1Yce0lrpc8Irdgir/z86/RXg9OvuLjXLIQAf8swsaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629805; c=relaxed/simple;
	bh=TMD0N8Am6vbpc3Swp4IUTbb4/FQ8+JiMlOh4AFwGKEo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n9n7txQ/MRWOd4xyrvNh9WCu/agqQcmXhRq903U5emaGdP2tT9tHruHsCXCYhi45/yEMbwTie7mxDxtzh8C66vEvU4oCPIw9d4r3v0AkqO9pYok+0dYoUqJYYTOqtWOQScjjyYW4DrJnl+zSPMb64k239JPDRuWd0rXryuvi9hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ikaTaiuM; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ikaTaiuM"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso83780095ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:30:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629803; x=1785234603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/vYpEqcmiHAaAvGgWCPkFkmErwNTi4SKKROlAjX2OAA=;
        b=ikaTaiuMU5CT/xm81pw6tVl6UEhfErU5F88PatYNMGMZOer8brqTDNJeF6jxAf/Puw
         v4e8FwfIYQltGAWVF4Ex5ZOLUzIGb5Q9Np5IwttOPDSZ5g4rO2GgP2Z7UewGWGDomnBB
         +E4KMqWa08iPBu5Jp9I6O998lCKYwRHwvkTvRyVvTjdlpZpOs98QSewkzuSRoL37PPQF
         vVzUMpjWV8Ffckr9nq+jD6Mb3OhhxRrD0znrGmOczb8pA7WEajJ2XvKey3m5fqihhfC2
         ZpDqV9Z34sH/gnePFTFLDuIbZF4YqzLw5m7vkNX2JPo3n85OLgSf4um1e5OX5AWP62GP
         bBqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629803; x=1785234603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/vYpEqcmiHAaAvGgWCPkFkmErwNTi4SKKROlAjX2OAA=;
        b=A4UMYguff1Y9Wn3sV3zG1nAZQzkEqKX6Ha5vY27Rj6jwdYIrF48S2oqdvoYFQA/ENK
         RQI4orszToyiH+fHotbKNfDAZzZNHXUHuBLYYQuCD76X3FmOxa0h9NuOycXKjLamH8Ur
         632vDyGaK25pdsJP4V2VTThEkHi4ZU87xpWoy71w7U0DdhVg9sVBhnLX0X9hi227q2Na
         MJgIWm1z3O6z3sxqB8LmCpHgI7McZuE5qczuvU5S6fZjcvYhkA3BUL29GnBLAnD2Wim7
         3vKECLftBiWmHXJDyo3jLhmXOyiR0HcR8tNRRksUbiZlx1eqXlqJUzQJBwrHYV5Stdgx
         J9rw==
X-Forwarded-Encrypted: i=1; AHgh+RrtlNyNDyPpMZhiJczk/KX3LPIrnL3oo8HS6rkq9bxp3X6BinDZkKkcerqGvLVtdQI1by8FrwU+ENNYE9U0@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt9gXMhjCPa50FcQ1NJXLZusiUBgwa4iWIzRPa7jamxsjLqMOc
	mFPDV0rDa5wv/CIe1nqie9BrTxOSDE9b1jcfsT66CW5qOpWixs3xLmLf
X-Gm-Gg: AR+sD11aFFFqPkz3DLn5cJT4mgbA6kkIEY5xkhmPdOifaSE3rzm0qggY0Hc0uqfwjrN
	7C0ZnRhcREzHEawWOw/TXrZxXaD5ZVU33L56nRz/pjcI/z4Jug8OWZE4qzpdmIi1I8G/+Vl49cc
	Ok2o1qVnEEQxaVr4qM5fJQxC0XoPT3ECW6ZwuB76dUwn1BkNXLVBO5p2GXedt2Du7EiJhQ+xa4S
	HOnbpRU+JuVJSRlv2lgSYFHnI8jLi9ln8a84bgf7SK6DdBH85moEjlZljFIBMFDm7GB0ynL5ldS
	AfEU4Wta14h16GbAv7JDaTjMmEHcwGEwrpFOMhoi2KNZyw6r6zjYUulK5OT90LoCkbOoeqMNs+l
	R0TLwavOuKiDyI9hfGvtsoQys1zLcGJIfoln9zgDwBnn+qNoLd470QnZgvX0qMdaxqkAhV+wnze
	M6k31ywt1Tn2jVUB2opgQ26Jgkl1kJKfhIm7s/
X-Received: by 2002:a17:902:f681:b0:2ca:3e3f:4956 with SMTP id d9443c01a7336-2cf34a35445mr191643455ad.44.1784629803048;
        Tue, 21 Jul 2026 03:30:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:30:02 -0700 (PDT)
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
Subject: [PATCH v4 28/29] ASoC: codecs: rt721: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:59 +0700
Message-ID: <20260721102600.523199-29-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 16 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 6411df4eede7..eae7d662efae 100644
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

