Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D26B3A544D
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782608; cv=none; b=j+zInX82Lp2fE6Nrbb6maDePj0vg0ZkKhpzTMDXH1p30guwAJcS/87RO2dLRP4/Wp4JaJU5jci5oTW1LjpCWcCuw1Mn+2FS/oaNmckHtVK+nQiF2BiAzuzNRvIjU/WR55zlcNFmgl+54p8bRu9SNh0A26r6XHuomjhlES5+UMBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782608; c=relaxed/simple;
	bh=KqAC5CfghReh2XEUZdCyPHf/60ZDneJJTZawuY4RN3w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EZBNuyT0RFHGvBl1jUI3ZWJ+Y8Dy933GwyXUS0FGnrQ1jc7HlXJdjeyx/VygECf7I/cNNywSXUbwef7SH33NaCKbD5QSq5hBXPiLY0qAY5Q+24Yi5d4YKc3UZHPtYQm+fz49SB8l9a+CYidpll3rNUXBojb7DwZc7dqVbYbKVUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NbS4WJkI; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NbS4WJkI"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso2823685ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782598; x=1785387398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zejrRaxeptAqKq1X1ixMpC63mc2lZ8YAiu3QcPsJINs=;
        b=NbS4WJkIdKvz0N+EbcEVlb+x1jE+nAsVZWStm283msySmAfEEG+RRhA24rp777Gpa8
         R0G80h/rCHzA/bHItQP8q7JN3dG3s4tZ5DXQp5PDpf7bQjjbTSH4P+na4igt87mzaMVA
         Wu+GixMiiQzP5rB0QcZG7IgqxJ2cRJgFfhZZX+C4DnHmsR/InxdPGEIoiPiZR+M+GWPp
         Z2MnRFCYzJNuekokcMHXZ79HrJyWZeMFvUZLmeUw9TUFz6u3Hjp7RmqyCygpVEjc40Wh
         BZV5g+tpbAn0tVU3DEQioq75XHb8AuceguWb2EMI+p/S6Fwj2lsIqlffgPKXzXJx3rR8
         U2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782598; x=1785387398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zejrRaxeptAqKq1X1ixMpC63mc2lZ8YAiu3QcPsJINs=;
        b=WbJBvCKx/RumNU48obJam8UcIssiksYAOQ6Fy0su3JRTctk1Ub9xvIqiv42wCxnMTL
         zhd1tf9lQyAnmnYAQbMnK/SfTmQeaZacQY8fvxklRFqRRN/FlhdKgHm6Ubr5p+UQGajF
         XW0s6GXF7CWZ6rsc9G+p3Md4hxOhCvD0DyM64NV0vTDWXHZPh3YCGPLagQVPvP2hlnIF
         3SK+Kon9SsLuMGawOd6SkvxU1TqluLJtSxwGGYVfiULC8ZfVwR57xZq7N2CuwFbc2Tc2
         +g57Xm+2H8BEx7Aa+QqMLRcstLsy+yGnKVvHDlR7TTXwaedbMiqH+RJUYTOVxfS3iKMQ
         jTHA==
X-Forwarded-Encrypted: i=1; AHgh+RqJLtzmEDhlCEs6YC+jZWvEGZ8ygaW8oeFS6+eJQozXzfOYVvw7UhyoyQj79kltiIBihL5duBQVeIya4UDk@vger.kernel.org
X-Gm-Message-State: AOJu0YxNFI97hLYR/T/O6Z3SjGvFs0/eZvHF5Z3lXCriOw64VD+j5H+L
	wGTNvIEwnlMelA9P+ETeo6Zolzqouqwr02WjeBI6frON++bIUF+6FGB9
X-Gm-Gg: AR+sD12laZRgMEnSKkQNzEQ6slY/6GbxRAKuGtw13hTguX2IZMGW3yA9jjwzF70+ZXi
	LXUHQmD9Nm4o0X7jESbblBRqX42dPQtbFRu3imoU4rSCLAOoRfU4uqTXE1l6Fatc+ZCnDsZdwI/
	WNdZTs2IP42BD/yPryaPevMEod4vUkKMI5ahQxVqoJpoV/vdiQ5Lg9/Hqb9xEOAAMxlXbL6M3rf
	nnVIralu/7mFZIlDFWXXiI5Ircw84z53UDodkw99ETwwN+i9Matm31JxlA3C9vY3iOCbQ39nfRc
	wLzz8Igb0t4DE84zmLO6gVuZdUz6Cb52F2JZeho5WNWsKyfFhI2lR7sXpJGayM+odx3Vhd3q2xx
	y5C+QRy7Iu6a4acG2fT3bJIzAk9fHtstxOTJVhpcFuXEG0ykHsavRMrI3BRb0NZcjQ3Cz5d6tSr
	Btno6x3+OcGend71Miwxw2j56SegM4DvpPq0t7
X-Received: by 2002:a17:903:ac4:b0:2ca:2753:f3cc with SMTP id d9443c01a7336-2cfa7506cdemr20165945ad.33.1784782598017;
        Wed, 22 Jul 2026 21:56:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:37 -0700 (PDT)
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
Subject: [PATCH 23/26] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:24 +0700
Message-ID: <20260723045327.28260-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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

