Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EFE63783D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660060; cv=none; b=uVSJnqTo7RSt9tM2S9HxJwSKo8nLct7LSRzaRzubVcqgnHVfQO8X9sd9hjFmddBeVzWntcFLMNc11UcX2Hr5NuCtbHELuH4GjrnWtHlVoc4aq4h3QgIoWUkWQWRF9K//NPK5XWw757TJcytc9VtG3AAMhkNsu8QNMw3izvDRlf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660060; c=relaxed/simple;
	bh=vGrtY8X/CBlchJHrZ0QsZ166oJ5xk86uURcTkF4hGPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kwuTTQWBGhLGu4HBIixk51KttHwHGB6H3S1hi6hLkdjqX+i45LVyVk6kWrL33W/SJ6Zi6V6CAKm2NXtJi9WMadUmKyONAC25qtwdACJor+HItyA66aGL6lKhI7ioN0KoyBJcri6VXDXjjwkWE2xb3cFOgEb8d6N8QIyaAq/xez0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r9+V43eU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r9+V43eU"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8478fe07f0fso514566b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660058; x=1784264858; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=78eN83RWVPj3usGOOjpXeDQAtr7LkbhNmieBoJ7adsI=;
        b=r9+V43eUA3MdL5HR2cKhm6ED/ckNnF8im0+16Lue67M1eVoahKJe3NACPaUHhVkN5T
         2IcChxkVPVK0PUrwkBjBEAz/ooNCJEBotwotKJgUl14M0P7BhzgrFs0Zoo7REK3GSjq/
         3ngNMJydQix5CYCq+5FYLwKaAPDPJol8tMkwtpXSrinTjwf6xEgvrwQuUKglO4c3L6km
         P6fikyNrDPAjg7uR9LDuxeID7f8BVjzkvLHZo6mmcM4ktKQ3vm0CGA6eRlcoaHOp0S85
         YNuA1NTsZKoCfMQuhLjFQHBcYDfmoFwEeXtQ8Dnp49SW8dPcOT/7rIvXplVxpxKV+ZXF
         yDtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660058; x=1784264858;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=78eN83RWVPj3usGOOjpXeDQAtr7LkbhNmieBoJ7adsI=;
        b=ESkKYkC7srCwB9qKVQpzMWH1qb+Qxyfv34ipTrlq0q0wIgLKRxmT9f7X6f7bzJHNyH
         /AJPJrk9a4J2Bn85E5EtZVLvDGJHnE9tu0GR6YRhYCYPhBz5qurbhbjHZgPCeJOLT953
         LLzLmkDdMUbXWmvsA5U5fRrIAzlE29Hl5/Q31o9LZAPSzzOnYFLOIISBOAP9hpBscYGs
         LU7ewXXt+SRubiVEfyqGy/XBPW6m3zvH6wYH9pLN1tGmkgLYBdsmXm+4xWFM8aqdX3gp
         cwtCJCDifOnXO2BSAoauWfxLj2QJ+nv+vUs2Q0Gw4cPlNo0kjuaMRyw3GRrYEsdjK1ig
         knHg==
X-Forwarded-Encrypted: i=1; AHgh+RqlH5vjD1jpHBmx94/Z+uk7EWZrPRAaftGlDYzLl4XbQxxiQvtLD5C7naCg9ZVIOTu84fAbxTpHSSbPuzUn@vger.kernel.org
X-Gm-Message-State: AOJu0YyHineoINGGRDUYEiDNKO7xlUx2CWtZ22X3QYmUBCaCPTwW5Vru
	7s9/0WDxKkJC37+YRnk1Pm6m3pTvCbsrqTmHt50pAxY1jlaohFPpT5TI
X-Gm-Gg: AfdE7ck1mT95oHqEpTTtqC5k2cB3p8rmRQFex2w/LUgtPK2AFsQvnLhy0pXdAcXKw27
	c19GTNqdzlrpFh3V9YrLXplSjhcCu20f1H+IuBzDg0EKd10Jku+DGk1XTo9qpHWgwdkuNY4eiM6
	f+uBZ6IiYzszeWkEVHiY2U2P5Gwk6k75/WeEcetuX3eDTyqc5a/xMZ3UK2fBPKvkb0b3OhwDImO
	rBhwmfXQWGxDi8m1V0vMRkf+tE7na6UMcPbAxDvNNZaX4LxOJqg4kXRAmaoVZTYp6WTzn0Xbs/t
	vokXadtDXcCIPz1keaRYGHgvWLtx5MkGvg2hJ3z8xAghQSW0Mb7cXJMj/D37MKf1KNzVBMjrzOE
	UHsEEtIzHRpvDezsFDiPSSfNKxBUaTW30QkvD/IxQLkbo+DGzOYb36OcxwjScxYGahZE5bt5zM9
	N4JdpUpr+3vmbdSAprH8nxwyCJy6kuYUzcZmiO/fLTyAiQxA0=
X-Received: by 2002:a05:6a00:1826:b0:848:2f84:731 with SMTP id d2e1a72fcca58-8484303c9e6mr9631782b3a.68.1783660058288;
        Thu, 09 Jul 2026 22:07:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:37 -0700 (PDT)
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
Subject: [PATCH v3 18/27] ASoC: codecs: rt5645: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:02 +0700
Message-ID: <20260710050511.14439-16-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5645.c | 160 +++++++++++++++++++-------------------
 1 file changed, 79 insertions(+), 81 deletions(-)

diff --git a/sound/soc/codecs/rt5645.c b/sound/soc/codecs/rt5645.c
index e9819653b30d..7cdca9774545 100644
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

