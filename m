Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2533F5BFD
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:45:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145504; cv=none; b=g9TcT9X1STHHo4gw2FF4fzKOQAm6U57UmuFESJc+ChEf6180I5gWOz6DFMzr3Kg4yxn0/XKy0oqh9XwxPZr6OmgRo/nF63Q16Xa0o2D97Bk+rE1n7uF4zDHpFbIzChTEQfGtLqc6M7mWfk8ucCqC0FOuOyaUlBBqjV7iMqZCroc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145504; c=relaxed/simple;
	bh=/Cg4xVpRL6w4laCrsJcDF+LErdrINGO0pMAAEIAje/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5V20Zfet+4FCqbmRsfyrSRzQs87nIEUXl1F74fAICqDc/lmiYZhbjk/63Ex1MQljMGvgJFEUD57zjEfoWo8pAzzHnZbW8mBuKbQiecC2NYkD1kHjH3VJthJXLTNv7Z37VZVy48ZO+7zU/qPC6lulKYwK9OW5WOTi5D63CrTR2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JecYU42d; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JecYU42d"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84a2dcede83so3250022b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145501; x=1785750301; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jmD1Fe73fhUyc5pCFw5d+S4TFcECjO79+u/TYKhF3yA=;
        b=JecYU42dORwLqzlGuV9kBqgen9Nm7YHlQZm/4QLe6ecQ8qJGpNlDy+zWhNB6NirBo6
         /GOQXMCFm9/ed2mNXd1F1BGGikG6A4/joh8qq14oWx+ko9Bj1x8RDN5mrNyG0Dg+eHJp
         HcqAkJjSwlXHY9QlnOxdTejxN9zOj7aHnMtpBU+nDn3stnxGWiegfi3lJF0eadM0Oh7t
         o1khrSUOuROV8cXUQBU2JxaZHFnrygja+DABJb/NsEeNsjeZ/2JggVGs9GEi/R/Ep2W2
         d+1te6uVJNk2HjPoc7Xl4SDm1ZC4XIiTzOAcwzh2G1j9WuVReT/V40v0ok5C3RElg8vb
         r3Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145501; x=1785750301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jmD1Fe73fhUyc5pCFw5d+S4TFcECjO79+u/TYKhF3yA=;
        b=ERQ2K9jXHrFUYtl69MJbnfaSQVbTCmqERjoTnHXq6ManC0pAu+9WczcAOzKJpTIktZ
         bV3yUKWi3XOLjjdUT4wAk24Lx2gmCL1Imv7MLjNKIKLBnBk8kPrZMfwbvxwWceZ7072h
         sqj6ug6DJTIufFtwOxN6R53X1gQyYSjTPGgQePJne+/Hlxg81Y5h4wLrkrE9/B+u7LR5
         G0CyfFgpIMHUkVySBHQMjYWu1nBn+bdqtRtt2K1Rl+2w9IZ0XJl7R7Db4Z6RzTqKgA6y
         ia4R6e+5rLFFgNbkOxVIgz67D6OwfK6Yb6pKWBMpFVnj8+lEWuR7sxWQznqZAspQzIBk
         cnIQ==
X-Forwarded-Encrypted: i=1; AHgh+RqGSuk0nfy68uh+JunPeYMqX6MxYPo8Glijy/Zx/wAhNGT9wki1m0x2vPWGbuXPScIqXllKHxat4aGmdiOe@vger.kernel.org
X-Gm-Message-State: AOJu0YxBrCA5jeglps08tI0KAXfCyQYX3FHckN22EQYiX2d5aMZeC4lY
	sM4vOPBRxpAp95dGC96OYRmRrAujd90PuUhYDLoS85W6qhiF4F1JoTAa
X-Gm-Gg: AR+sD13FVLyVReSp9Mt/V1ansgT3mv/N9QjdRxBmvdTAIofrOmOqKmvOZb58rnsDu2J
	78pu2MCo8OKpsykw4tS36unZMJ2iqBaV/VUHRflFy9tv+RJ4LMHF1AAlCV7U2sklmQu/os6RmmK
	E5k2NnT7D637BG9LfhGeLOZ6801wXOZrwrQd9zjljfp4BgY1Muomy0x7PeRtdav4Ygp8Fex19KZ
	4aWzHraXqmmyIQwgaJTbXW1D4fuOXJlvVgW/+Hxt24lX+WbfgLNAmY928qjOlydGrs3POWCCMyG
	7SYPN18B2kaLzGlXITZLBETbbhcy31NDGAyG2CfW+MCBJ4KBvxCpor1POha92F8c3aI33wZ+f2h
	GL18x9e505gmZTw3UjO+hYe0/gFnyftW1DJ98R93BFAXXr+zOHHyO0u4euNQqIC+JjP5BWXIeg+
	2HzD/QVP+rlc8we4sCjLzQ08SamNo6nN871HK1KrhGrJwmtx5BDJSSdrVmoV2/HcIgash6AmuvI
	SSg0mHV2Z03m97VZ8FquMVYdadZAUqf
X-Received: by 2002:a05:6a21:329e:b0:3c4:1708:9cd8 with SMTP id adf61e73a8af0-3c67e0b9e33mr7385542637.76.1785145501502;
        Mon, 27 Jul 2026 02:45:01 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:45:01 -0700 (PDT)
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
Subject: [PATCH v2 23/26] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:43 +0700
Message-ID: <20260727094046.23001-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Reviewed-by tag from Richard Fitzgerald.

 sound/soc/codecs/wm8994.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index 1d64c7c42ed1..8bf58a6a8af7 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -766,7 +767,7 @@ static void active_reference(struct snd_soc_component *component)
 {
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount++;
 
@@ -775,8 +776,6 @@ static void active_reference(struct snd_soc_component *component)
 
 	/* If we're using jack detection go into audio mode */
 	wm1811_jackdet_set_mode(component, WM1811_JACKDET_MODE_AUDIO);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void active_dereference(struct snd_soc_component *component)
@@ -784,7 +783,7 @@ static void active_dereference(struct snd_soc_component *component)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 	u16 mode;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->active_refcount--;
 
@@ -800,8 +799,6 @@ static void active_dereference(struct snd_soc_component *component)
 
 		wm1811_jackdet_set_mode(component, mode);
 	}
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static int clk_sys_event(struct snd_soc_dapm_widget *w,
@@ -3704,7 +3701,7 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 						  open_circuit_work.work);
 	struct device *dev = wm8994->wm8994->dev;
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm1811_micd_stop(wm8994->hubs.component);
 
@@ -3718,8 +3715,6 @@ static void wm8958_open_circuit_work(struct work_struct *work)
 	snd_soc_jack_report(wm8994->micdet[0].jack, 0,
 			    wm8994->btn_mask |
 			    SND_JACK_HEADSET);
-
-	mutex_unlock(&wm8994->accdet_lock);
 }
 
 static void wm8958_mic_id(void *data, u16 status)
@@ -3777,7 +3772,7 @@ static void wm1811_mic_work(struct work_struct *work)
 	struct snd_soc_component *component = wm8994->hubs.component;
 	struct snd_soc_dapm_context *dapm = snd_soc_component_to_dapm(component);
 
-	pm_runtime_get_sync(component->dev);
+	guard(pm_runtime_active)(component->dev);
 
 	/* If required for an external cap force MICBIAS on */
 	if (control->pdata.jd_ext_cap) {
@@ -3785,7 +3780,7 @@ static void wm1811_mic_work(struct work_struct *work)
 		snd_soc_dapm_sync(dapm);
 	}
 
-	mutex_lock(&wm8994->accdet_lock);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	dev_dbg(component->dev, "Starting mic detection\n");
 
@@ -3803,10 +3798,6 @@ static void wm1811_mic_work(struct work_struct *work)
 		snd_soc_component_update_bits(component, WM8958_MIC_DETECT_1,
 				    WM8958_MICD_ENA, WM8958_MICD_ENA);
 	}
-
-	mutex_unlock(&wm8994->accdet_lock);
-
-	pm_runtime_put(component->dev);
 }
 
 static irqreturn_t wm1811_jackdet_irq(int irq, void *data)
@@ -4026,15 +4017,10 @@ static void wm8958_mic_work(struct work_struct *work)
 						  mic_complete_work.work);
 	struct snd_soc_component *component = wm8994->hubs.component;
 
-	pm_runtime_get_sync(component->dev);
-
-	mutex_lock(&wm8994->accdet_lock);
+	guard(pm_runtime_active)(component->dev);
+	guard(mutex)(&wm8994->accdet_lock);
 
 	wm8994->mic_id_cb(wm8994->mic_id_cb_data, wm8994->mic_status);
-
-	mutex_unlock(&wm8994->accdet_lock);
-
-	pm_runtime_put(component->dev);
 }
 
 static irqreturn_t wm8958_mic_irq(int irq, void *data)
-- 
2.43.0

