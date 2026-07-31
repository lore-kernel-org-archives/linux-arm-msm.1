Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D7E345EDB
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467595; cv=none; b=K8DmtB9jC5XWhzGkMK4W3YTAfTeISpCCb6RnVZ/7X8Og0mpm5mmO2W+Ms1qRlKnua05H7pNOyAdnCG6I7Lq3qOx2+lnTaAd02OqAEwn+T04dNEaYIHl9Ja7VLBhnstWGQw3k96Ck9Y4mA454MS8VfJfgVb9ug4h8mugMxe8cU3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467595; c=relaxed/simple;
	bh=Ds1oSBp7qIaR/cxOtW8lrLLJ5mM1JWB+K+07h+UG/zI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=m7saunQFKIZkqk4jdVdmKKfqcoCiB2QkW72ynbiIwZ5mljsO+tj06ump6JXsr1gb+11TN09mIHQY3C2yOlLOKcSiI4WPrqBLkvTgT+GR5kjyaLL/ajCh/7gQxH1+1a7gxpEJz+kNEb/mE+Jldvj5sFi/pmW8y2S++zzx6Z5xm30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PXBLurNN; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PXBLurNN"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cfff5f88dbso5051845ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467594; x=1786072394; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/lM2ofDG/902k+KDKV+BqCZHBuk3CZZsCrVHXaT0OY0=;
        b=PXBLurNNPAaIiWy1b8cQSMQGMa2BGmbDCa09C2gTrJnAOUy5u19zCGw0vuLDd3Fp0X
         KKvJweK6uZ8P259g1IHLUd2j94SIsGMIx90JrMo2K07lzQh9kcLL8wYYQSLT9HprH3Gm
         i2SbVOjgH31w62/+4ZWn8Ybe8wOATePvObn/GNrqn0wqExWsAPXBNogDQ5gl8b/e6u45
         slRAojYfzM8QDi6huJSVNITRHb39/D26CQPgYL16fMkwRFiksrDVvciuRyJzzeNQElxb
         s2+jXZGvgXvEsZFbBXh7Cz6fGbYhrXUO4vgPNa8C661NQg+NdJMqqRHeAl+Bx96JBqMS
         mrZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467594; x=1786072394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/lM2ofDG/902k+KDKV+BqCZHBuk3CZZsCrVHXaT0OY0=;
        b=XOVFTztq6j0DxC51eWxCPPYJWGdzJpovJ9S5HA6sWBbvQ7mxna0cliyechxO0dXyzQ
         rfyK8x/BW1QBxhXcPFyFfaDr4tkHGriBJc3RsnLj0yMOjAWGlpR2tCDlBxOzVflXpHcD
         gpcMJjwbZNOfcsKM7YwitS+GNcLXPvqJ8bNA51YdcvD42tmQOb7BEnnSLQl1DYlfgfNA
         69l2lrJ+19HyOSsdATZFhUzcOQJvf6pR39oW/lHqRv2QsDy9jVI27MOvQwMxYJxkiLwn
         mlj/L8jzN/VLoF1Lmeuptx5Jij5FNgEM99l8VxrDjquL4ZIXigASgzCn/jTJI0cXj9Pv
         jnNg==
X-Forwarded-Encrypted: i=1; AHgh+Rp3qMtZlZkEveohj2cSUdieF8vihPkEWJ2KkUV/7h9ckfPmduxNxRvRByxwmWfLpI+7xqx7sR3UfzTMANA4@vger.kernel.org
X-Gm-Message-State: AOJu0YwUdS9iwy5yTq9dnsbOoLiBqfAoMUcbZxQdpALNcjp8AfILbAO8
	d1+dGcrSHyXvny9JG8x95+R5sJosWOhsmIQQf3aBQvoxXxrn6kFrwChB
X-Gm-Gg: AR+sD12cM+5B9M8mDjjg8ai2gpaEznewPYF2efdbyVtOm24nNv9J7hvhsXo9CqNxr6b
	Fzb8bi5MD9c4lKJ5cDqiNznTrv49tPT/4fIKFHL2TRJjWSzcKq51ghnC6F16NiJFwdAvg3R9Vn7
	OIIIn09btE/EdYV6pyvRUQ3m9C5f1bg70k1uKUT+GzoDdyR3oPNlt0AhNasDOCLs7VYHA6Bpe7a
	JK+XVjTSeMsvDHJaV9o94fi3nwlZsxmwv4U1be4L9T6foqAZK3N3gBt6URFiX2LBAv9wOB8C9+1
	4v+uX1ltQGEVXORa2fV0a4obUIOGR5nq25dAnIJJAILwfZriSeSxd38nT0ZFyniC+Grj4uK7lom
	CLtsMpyimKvNTVbcckmBfx0wWKhqNapfNNRRP6/3i3EOU69vjBNWEOsFWE2Yihrt+EGbP/fi9x9
	xSVoASAEJVRViZ1a04Rgbt7Sx/qGNeOgcb21sBBcitxJ0QgElnbAcM2wJJUIH4sQKkwuB0Wc/CH
	J1a1biuHoUQRa9rR2NoXM8vAKSsAbA2gnIcHeM97g1TUwsSDp0UwLgaNLMoezcYlp+eW4Rztknp
	i7q6
X-Received: by 2002:a17:903:3c4e:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2d046ec35b5mr4341835ad.45.1785467593679;
        Thu, 30 Jul 2026 20:13:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:13:12 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
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
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 23/26] ASoC: codecs: wm8994: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:45 +0700
Message-ID: <20260731030648.8706-24-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

