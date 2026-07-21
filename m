Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4977C48AE38
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629789; cv=none; b=Bl5/SIIYd5O7Kof7EfFnICYz/UhfQOAeHR6aCc1xjHNqbW6OZSMF2AiDEWBi/Id9TT0o+ml4RbBDUTTq/oFeEOGsmBXovpvZtXK0grAxJO6Nau899L/aHXheuTUT6i22qLBhtY61HDMfYQtNqLPfFV3crvNvaShBqFi3/7l0ATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629789; c=relaxed/simple;
	bh=8F9X1MduGNHr+4W/gnNomvdCKgWHsQzUoZZo1MszsZM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FwHiYP+3QTOFcM5hg/JtHdO1hLdA+zMqBDKc2qtZaVB5mDPFgNdT6yKGCZFerjTByaRzKltOkePcqFkey7kx9lIFu0wHNGpjSdLJTnNVpLOcUQuMJPLn/pBxGY7ziaWJWQMAEdfk77Plzz/dbNJfMJwXnlXDf6eYsjkRRXnoUhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=co/rxicp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="co/rxicp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc97653887so121259855ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629787; x=1785234587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lO6f51j8XQ2LkBzH9pjltC7krTy+qWIB9damC+nLnm8=;
        b=co/rxicpSp8GWcpqH8wg39FEytFxMeF37wIVY5qmVbKwXNb0i/BtY5mYv2y61KcjuF
         EEVDVuEi8DIzlgEE3rbSEU8PxGDmF1elGlg+BBvOMEPP+fPJipy7Jsu4jzEGlUcYNgJW
         v0LRzRhhBB/GHdCM6xh0J/vOPwKs+lesId7bEmt5nuRO4+3Y7xS+HVp60w7V5jJeSVzJ
         F2iKTVFZbU67ASY8KKJLqt8PXNY7YbUC74mTt8s2Fvh7ZDRUFF/XJIIaeWJcFZMGab/T
         jfqSqyDlHQdW44e0UXk00rgNlrYQIhCwwkKx7hg4uu3ymBCQ6UfJFc4kACgvUiE0+miL
         xwzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629787; x=1785234587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lO6f51j8XQ2LkBzH9pjltC7krTy+qWIB9damC+nLnm8=;
        b=FZ6c6XNeYeakkov0ECiyNogdRWdD061xTdIX/UI7tD/e/1bAfiH7GxLde0qohTHpQN
         kRLXcenHpuuY3Sfa26sR1kTgiYEv08Wxor9eIVbzaMUrw4eK8jd26ggBf1QGvikeKQm6
         Ms72lNF5GTOubKZjLvbNq1msvqQwnSznClKQl8/iERjYfDSXgODO9WUB60j6PzaArGIV
         fO4sIJTraj09UWTf7xLQJrPRjCRacK71tJt3/J/TLLE974JGTa8f62CzMbsNcLyzhoem
         eepIitkE6pXDBLIb5Vq0/e7pduf02USQc+IpsaobK3aX85Qcyccdc1w0+Ukj1Zdijj0v
         5hLg==
X-Forwarded-Encrypted: i=1; AHgh+RqxO9XFjneP4yDd7pL3A0Y8bEwboWqZ1f291s0bbPq1mWOc8DKDLzi9G8AsDP7H3HSw01bNXlNAsQz0GGoz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy07UtxMRdN/plPB/Kb+0r0tK3A05r5ED64hYwI07ynd0C1hls
	6vYtLARVPv0+2V6ZKdF2dts1KnNx7y7ZQtTLxUXcEXvP8KBaXWqB2ePK
X-Gm-Gg: AR+sD13Rz6XMgufopOKguHnZ1btx0JnCJAVToJhsJDA5UFHpeGILZZyZLKAIvj+q83y
	CEUCfUQL6Ths+jomk29pDgyp6cC/OSccW5mUE5hJ7ayGXAu0N9dPMrD4rRUPbBCmJW/ixzmwL1i
	On7A4nCGVXKfihnCHULf4hqtXqh2KPPihHqDrg+UbDLhKaq3WkhP5JdV6vS6TrngjAbssbkGYWD
	ajHhGkVAs+ti/oEPAnTxJ8ooof47qfyb6Y2nLp9uqlT0Li7Yy0EYIWiVkd5PYcqcWZ46xQA4isM
	U0ee30KPnidE6Ge5zoIYU1R+vDuaP+w6npcvw0VVGxrH4QuOobnsaPt+V0na3X3WeDLPNlJQPt3
	mslp3HQaE0DVr5l4vhKIOPwcruN7PdqB7pEM96+kzNRuRTb+U4neM68Bhyv+eNOp8i4ZTmAq7IB
	JDAgdSNTJShrg0uoV36mhFsI7D1AmVVY68/HzV
X-Received: by 2002:a17:903:3d0e:b0:2cf:6dba:b294 with SMTP id d9443c01a7336-2cf6dbab68emr73742545ad.22.1784629787546;
        Tue, 21 Jul 2026 03:29:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:47 -0700 (PDT)
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
Subject: [PATCH v4 26/29] ASoC: codecs: rt712: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:57 +0700
Message-ID: <20260721102600.523199-27-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt712-sdca-sdw.c | 30 ++++++++++++++++--------------
 sound/soc/codecs/rt712-sdca.c     |  5 ++---
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index e23501ed87a7..c50e74e20a88 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/module.h>
@@ -427,13 +428,13 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
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
@@ -455,14 +456,15 @@ static int rt712_sdca_dev_resume(struct device *dev)
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
index d6353af07380..2218f9918ae3 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <sound/core.h>
 #include <linux/delay.h>
 #include <linux/init.h>
@@ -403,7 +404,7 @@ static void rt712_sdca_btn_check_handler(struct work_struct *work)
 
 static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 {
-	mutex_lock(&rt712->calibrate_mutex);
+	guard(mutex)(&rt712->calibrate_mutex);
 
 	if (rt712->hs_jack) {
 		/* Enable HID1 event & set button RTC mode */
@@ -450,8 +451,6 @@ static void rt712_sdca_jack_init(struct rt712_sdca_priv *rt712)
 
 		dev_dbg(&rt712->slave->dev, "in %s disable\n", __func__);
 	}
-
-	mutex_unlock(&rt712->calibrate_mutex);
 }
 
 static int rt712_sdca_set_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

