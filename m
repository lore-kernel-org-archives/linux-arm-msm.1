Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8355481A9F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629728; cv=none; b=dg3SJFf7cW1lJaY98AABeIaC1yvw6hNqcfcYHUMz7mYKTBG/JsKaq3A2+RHMvWVIe6DzHmSOMwOLYFkKe3zIVmrrGjLV4ykKf9g9gjn/veNQxW47GuY/9QEtqbhYUNrevl/t25gGAgTFJ5Rt1n4UCqaamDBMn6qLEiyEwi918Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629728; c=relaxed/simple;
	bh=LG6+5wUBHMmnxLPYxHxZ2dp4E3CgvU0mn0ziljce2AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sf+/vOfWg2PBTR5Sm84XFQ9bVHRy02mq6g1uiz/WD/3xu6jNQ385pipaBrK9sH6EwQF6Ti9hBl6lRODK+H8PtGMVflkttd9DN8ftRhdhwV5cyNMaQl3/Sr6NjP91C1ek7xNDpzxZcg76JOXPKsWM9P2rXDwO+XASE3rdd7kDgsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DMQfsKXP; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DMQfsKXP"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf27856f9cso56705565ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629723; x=1785234523; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lC5JKraJutUXVC1Tg679SCSVEJKwIHZajpWUsgP58mY=;
        b=DMQfsKXPJXC40tVly2aa8kKmSZGCyaYOc15PbX+FVFi6P5k9cf9Pf64JkI11J8RbTW
         0RRT3SIA7rQp4dKojcQA4AUTSkiT86yM9u6bR94H0ffaWILxoB0eYKFPuVdWxaeYRC1J
         1KKSXOHOXELBwslKifrCIA68uwboWkAhEvfALkpgwDbHzdfwlJb3kFGogf+uGpDwE4Ky
         eUuOvO1OIzSFutnupPojdKGAq5l383d27VTKmYh8q02BhEr6PcIeyhGZComgZB5GBcq+
         0Ew6LiB3V/nqyRi/VY4U8Nea2LBl6TQC6VZ23H2kzNBJldsdAHjrH7JZSCDMuM71b8Qw
         busw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629723; x=1785234523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lC5JKraJutUXVC1Tg679SCSVEJKwIHZajpWUsgP58mY=;
        b=Td7GbQmOa07zFOcqJAE6d/7SURo8S0WsvJ6+Y1DSMoop/+McZ0gh3zPyQZptbkcFAf
         fq4harFbCIPwU/o8vuFdu/+337DLIY/o3IwYPHxfRriOGNpjXB3Yb6OqCjylJGm2Pm+S
         rtGzJeYrUBRjticzdikj24rtV2PpzP2cHaGI63LMGjt0YkN278PoHjUycYq4WbmSomzF
         4j3qeZBITXE6GBuguPMjevbdrIXZlVbM8yTFrVaAnLWSV4SklOeuVhXisN6AsYBdfb4g
         9NoGK42/URNcoI58ONrH/KerdcOsvGtHXyFQAkdvjXyjVsa0PpQp8/J4+9BBT0oWSYmf
         fUtQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKBUkujNbKuDD6kqImmo2VciCJG9Byg0Lrb8olWiJ8kfndfNQBvgHTlyh+YaFRPsZ88/l5xxNnCUDfJfI0@vger.kernel.org
X-Gm-Message-State: AOJu0YxIWFHm2SkG42TDSdTo0fZbexdr0kXL7r8xweOK32gnMKFHeXik
	IjScn5q1Ast6PGjpfJLiRw5k9GslQOuK55jb8ElBWLNWNe8CbIKBHU0x
X-Gm-Gg: AR+sD11ZmZqDdOT6PgIl8IT6FhBP+c3q7r+6eQa/LT7n4PFOPa40EYBzzL+C2/+OCWq
	sKPGPJNPoVFVCHWKjGQml/dAaWZw09b0OOoo/exg6lPZkfk44lSM+bUv2oyNHxZfJ4v1MdpTDM2
	Qg7+YwniYd5FAdax/SfYNSdWIinEksSx1z0wR8EB1GLtJjVzFZCT3cvyaQkviNE2yokVIuksilu
	rji5FaJ/+JfCSAiInx5KNLHd+MJx6ZTln8/mtElVbHVyC1q5gxihL0f1bGPtthO9jl1UcTMdc3d
	MrOcRZGZp0Um7xY7KmYoQy59dI4PNKyka/kVbthMURfevPLrrmdRzn9dO4CwyJXhDKZZsRjRHSp
	dNQbHK9a+H3zSQK7St6+23PKHtBotnJvvCVYbcukHmUXSE54Nk0ie+xLy72sjgvDm6OX/3Sw3Ki
	sJnMfHJKE612M60oYFPd1elhMXpBtHeLKnBRsJ
X-Received: by 2002:a17:902:c941:b0:2cb:14b3:4cfe with SMTP id d9443c01a7336-2cf34a0774cmr215182775ad.45.1784629723081;
        Tue, 21 Jul 2026 03:28:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:42 -0700 (PDT)
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
Subject: [PATCH v4 18/29] ASoC: codecs: rt5645: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:49 +0700
Message-ID: <20260721102600.523199-19-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5645.c | 160 +++++++++++++++++++-------------------
 1 file changed, 79 insertions(+), 81 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index 93a4148ccccd..0d546fb34e52 100644
--- a/sound/soc/codecs/rt5645.c
+++ b/sound/soc/codecs/rt5645.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -3323,93 +3324,90 @@ static void rt5645_jack_detect_work(struct work_struct *work)
 	if (!rt5645->component)
 		return;
 
-	mutex_lock(&rt5645->jd_mutex);
-
-	switch (rt5645->pdata.jd_mode) {
-	case 0: /* Not using rt5645 JD */
-		if (rt5645->gpiod_hp_det) {
-			gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
-			if (rt5645->pdata.inv_hp_pol)
-				gpio_state ^= 1;
-			dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
-				gpio_state);
-			report = rt5645_jack_detect(rt5645->component, gpio_state);
+	scoped_guard(mutex, &rt5645->jd_mutex) {
+		switch (rt5645->pdata.jd_mode) {
+		case 0: /* Not using rt5645 JD */
+			if (rt5645->gpiod_hp_det) {
+				gpio_state = gpiod_get_value(rt5645->gpiod_hp_det);
+				if (rt5645->pdata.inv_hp_pol)
+					gpio_state ^= 1;
+				dev_dbg(rt5645->component->dev, "gpio_state = %d\n",
+					gpio_state);
+				report = rt5645_jack_detect(rt5645->component, gpio_state);
+			}
+			snd_soc_jack_report(rt5645->hp_jack,
+					    report, SND_JACK_HEADPHONE);
+			snd_soc_jack_report(rt5645->mic_jack,
+					    report, SND_JACK_MICROPHONE);
+			return;
+		case 4:
+			val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
+			break;
+		default: /* read rt5645 jd1_1 status */
+			val = snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
+			break;
 		}
-		snd_soc_jack_report(rt5645->hp_jack,
-				    report, SND_JACK_HEADPHONE);
-		snd_soc_jack_report(rt5645->mic_jack,
-				    report, SND_JACK_MICROPHONE);
-		mutex_unlock(&rt5645->jd_mutex);
-		return;
-	case 4:
-		val = snd_soc_component_read(rt5645->component, RT5645_A_JD_CTRL1) & 0x0020;
-		break;
-	default: /* read rt5645 jd1_1 status */
-		val = snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x1000;
-		break;
-
-	}
 
-	if (!val && (rt5645->jack_type == 0)) { /* jack in */
-		report = rt5645_jack_detect(rt5645->component, 1);
-	} else if (!val && rt5645->jack_type == SND_JACK_HEADSET) {
-		/* for push button and jack out */
-		btn_type = 0;
-		if (snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x4) {
-			/* button pressed */
-			report = SND_JACK_HEADSET;
-			btn_type = rt5645_button_detect(rt5645->component);
-			/* rt5650 can report three kinds of button behavior,
-			   one click, double click and hold. However,
-			   currently we will report button pressed/released
-			   event. So all the three button behaviors are
-			   treated as button pressed. */
-			switch (btn_type) {
-			case 0x8000:
-			case 0x4000:
-			case 0x2000:
-				report |= SND_JACK_BTN_0;
-				break;
-			case 0x1000:
-			case 0x0800:
-			case 0x0400:
-				report |= SND_JACK_BTN_1;
-				break;
-			case 0x0200:
-			case 0x0100:
-			case 0x0080:
-				report |= SND_JACK_BTN_2;
-				break;
-			case 0x0040:
-			case 0x0020:
-			case 0x0010:
-				report |= SND_JACK_BTN_3;
-				break;
-			case 0x0000: /* unpressed */
-				break;
-			default:
-				dev_err(rt5645->component->dev,
-					"Unexpected button code 0x%04x\n",
-					btn_type);
-				break;
+		if (!val && rt5645->jack_type == 0) { /* jack in */
+			report = rt5645_jack_detect(rt5645->component, 1);
+		} else if (!val && rt5645->jack_type == SND_JACK_HEADSET) {
+			/* for push button and jack out */
+			btn_type = 0;
+			if (snd_soc_component_read(rt5645->component, RT5645_INT_IRQ_ST) & 0x4) {
+				/* button pressed */
+				report = SND_JACK_HEADSET;
+				btn_type = rt5645_button_detect(rt5645->component);
+				/*
+				 * rt5650 can report three kinds of button behavior,
+				 * one click, double click and hold. However,
+				 * currently we will report button pressed/released
+				 * event. So all the three button behaviors are
+				 * treated as button pressed.
+				 */
+				switch (btn_type) {
+				case 0x8000:
+				case 0x4000:
+				case 0x2000:
+					report |= SND_JACK_BTN_0;
+					break;
+				case 0x1000:
+				case 0x0800:
+				case 0x0400:
+					report |= SND_JACK_BTN_1;
+					break;
+				case 0x0200:
+				case 0x0100:
+				case 0x0080:
+					report |= SND_JACK_BTN_2;
+					break;
+				case 0x0040:
+				case 0x0020:
+				case 0x0010:
+					report |= SND_JACK_BTN_3;
+					break;
+				case 0x0000: /* unpressed */
+					break;
+				default:
+					dev_err(rt5645->component->dev,
+						"Unexpected button code 0x%04x\n",
+						btn_type);
+					break;
+				}
 			}
+			if (btn_type == 0)/* button release */
+				report =  rt5645->jack_type;
+			else
+				mod_timer(&rt5645->btn_check_timer,
+					  msecs_to_jiffies(100));
+		} else {
+			/* jack out */
+			report = 0;
+			snd_soc_component_update_bits(rt5645->component,
+						      RT5645_INT_IRQ_ST, 0x1, 0x0);
+			rt5645_jack_detect(rt5645->component, 0);
 		}
-		if (btn_type == 0)/* button release */
-			report =  rt5645->jack_type;
-		else {
-			mod_timer(&rt5645->btn_check_timer,
-				msecs_to_jiffies(100));
-		}
-	} else {
-		/* jack out */
-		report = 0;
-		snd_soc_component_update_bits(rt5645->component,
-				    RT5645_INT_IRQ_ST, 0x1, 0x0);
-		rt5645_jack_detect(rt5645->component, 0);
 	}
 
-	mutex_unlock(&rt5645->jd_mutex);
-
 	snd_soc_jack_report(rt5645->hp_jack, report, SND_JACK_HEADPHONE);
 	snd_soc_jack_report(rt5645->mic_jack, report, SND_JACK_MICROPHONE);
 	if (rt5645->en_button_func)
-- 
2.43.0

