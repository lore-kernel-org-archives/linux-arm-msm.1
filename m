Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C32369D62
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659941; cv=none; b=Z4ycTImmahCP5B5RbM+7T9dV56JWJPTOILUCv76YOkUq2AOAlwPoU+1F7OP6ZZGgvVA31Qb+9TLRC2voiTzyQ3ygoEEcPY8nSdEQ2dLLbCr/TUtZ/JE48B1s8GF4kcoSR2aQQqDjDWEntcFhM8+UceFfWYbMn3X3PVw8ua0p6gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659941; c=relaxed/simple;
	bh=Nw9I/srswcYHcD3WiPHI5wa7OL9sfHmNK5DnVVQpY1s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lIZJJ3kN9CWT4KEIygzdkuU6dajZXyvhgAvN0Hslnv696GBicfhVkvYH562rPB2Iu58gQshN5oOI5JggDXq/f2rqc+C9b6PpdihalUoYDyUiZQsF4IQ9qb0rwtgwNXG4LICHV7MMpSV1NVygIUj8L9+VX1eZ8m/f7eLDJmjYOS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ddYFGF9I; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ddYFGF9I"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-848595b338cso540852b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659939; x=1784264739; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=ddYFGF9IMnDNRxEg4QzjbR+d24b0KzHR3C79ZFprD2MztRdgFd25cVbEJcBSVXL3r0
         VtyQQwyVZAerAN1hdm6av0vm44T9Pb3VUBMSRsw4o1BWUUcy69fnX0nnDC6kfFZ9Fp9B
         83sJLvv6uIePjVR92PHh9N7egVrOz/xd1sDlVJahbNsG1Fyl0CdsaGH6ooQcEQqos6hq
         I+wOh6zcre2OIFXhfRnvknxsxjTZb2kC5Bmt886oY7do/TtUd2k5fuVc/AHzNSOkT+yQ
         600S/rDISxphjlq5RCg21/OxrW/hYUqHbb1pJ4HQ0aGVtOEen/IUr4b6d3/ilNZXIYLW
         7Kvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659939; x=1784264739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=glNXCWo3feUPJNoiqEbeBkuoiMlb+JtOjIAbpp+cCDQ=;
        b=U+i0VSwlUT/wIUfyA/xNi783ZBLIC37ALolkDUFYbIGetkTCABd4FJHjQDQzbZpMYr
         NPGo25Fff8gM82g5h970+SiWI7wyRVIF+rItsjS0Zhn6Ap9o1/gjmrjHU0OK7+gGPYv4
         tqL0r17xm031eF6FtOEYMoPYDtelSmv/BY8n551UsZNr8HiJJCiP4IR1d3u2Kix2FR5d
         XdNfCZKdGKMZD7IHbWDSiFh7hqNVEGINqffnyNsK9kvrFlyWrX0im/q8P5yDCahTcBNk
         UJva1CaTXK1/qDEFv71cmyQtQK7A/Mcu/0ztXa5dCwZSsqAv3NfDrTzfErIJQ+oronsM
         n+IA==
X-Forwarded-Encrypted: i=1; AHgh+RpqMiW13KFo5hJI13z8yT9K01yeeoew9czZ82SSxWX5K0Wghu9z3tMxKfNRva+7coTTcStW4+0iZBYCo4e5@vger.kernel.org
X-Gm-Message-State: AOJu0YwwdpVK9yOwVcUqEKsHqPj0wGB9GmoSHFEEdcxtzo4EorcQPBNc
	h1VuUEq/R8ELLYMgJEdPQ2ZaMWCTxulgR9DRseC6ZBJ32Gfoux4NTHl5
X-Gm-Gg: AfdE7ckiQMBIA1VzGiw+Cjk6rWpjbIvp4+RKYmL7a3IfV176k9ZPZrt3g1vsH7JvzOL
	IDYvGjmgNIVbDyLBWbWNuH9lbHpg4RaYg2aK1S+QL6sseaXsOYslWAzk3ga3PKVJmSEJo+KuOW3
	w5clL4ti5fCUe/wGyD0J6u96sPefrGlgtWrN2xseS8w3Y+amRB4bS1vD3mTRf+Q1ByBhzfH+u/l
	h+74vnBWi9P+SYUFksUnSgjTw8m3Y0QwcZXGjC3jo5bBg6ZhzmzgI5W5DQnUZIBLq9S8asy81kh
	8MGOB/jxhrisOPoYIXUfO43MfAUaKozrR/6hfnTdoQ2+zVZC+VXtYD6qfbYMUUoK2YcvQPI1WcY
	hu+v18w1UE911tbWq7GXrzBz++4KO+fNhfcwE9GwwaImwsrX3nbg/omwpyi9HWDF+zB3rUAHdGX
	kHV6Z4Ykf2q9DaLEFHUxggla+zklgV7LsVUYWIZoCSatDrtpvfGC7oOF007Q==
X-Received: by 2002:a05:6a00:2d9d:b0:848:67ca:bfd with SMTP id d2e1a72fcca58-84867ca1b16mr4077056b3a.16.1783659939223;
        Thu, 09 Jul 2026 22:05:39 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:05:38 -0700 (PDT)
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
Subject: [PATCH v3 04/27] ASoC: codecs: es8326: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:48 +0700
Message-ID: <20260710050511.14439-2-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es8326.c | 30 +++++++++++++-----------------
 1 file changed, 13 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/es8326.c b/sound/soc/codecs/es8326.c
index a79b2da35099..c5460589a88b 100644
--- a/sound/soc/codecs/es8326.c
+++ b/sound/soc/codecs/es8326.c
@@ -6,6 +6,7 @@
 // Authors: David Yang <yangxiaohua@everest-semi.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/i2c.h>
 #include <linux/interrupt.h>
@@ -790,7 +791,7 @@ static void es8326_jack_button_handler(struct work_struct *work)
 	if (!(es8326->jack->status & SND_JACK_HEADSET)) /* Jack unplugged */
 		return;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	switch (iface) {
 	case 0x93:
@@ -845,7 +846,6 @@ static void es8326_jack_button_handler(struct work_struct *work)
 		}
 		es8326_disable_micbias(es8326->component);
 	}
-	mutex_unlock(&es8326->lock);
 }
 
 static void es8326_jack_detect_handler(struct work_struct *work)
@@ -855,7 +855,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 	struct snd_soc_component *comp = es8326->component;
 	unsigned int iface;
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	iface = snd_soc_component_read(comp, ES8326_HPDET_STA);
 	dev_dbg(comp->dev, "gpio flag %#04x", iface);
 
@@ -873,7 +873,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 		regmap_update_bits(es8326->regmap, ES8326_HPDET_TYPE,
 					ES8326_HP_DET_JACK_POL, (es8326->jd_inverted ?
 					~es8326->jack_pol : es8326->jack_pol));
-		goto exit;
+		return;
 	}
 
 	if ((iface & ES8326_HPINSERT_FLAG) == 0) {
@@ -930,7 +930,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			queue_delayed_work(system_dfl_wq, &es8326->jack_detect_work,
 					msecs_to_jiffies(400));
 			es8326->hp = 1;
-			goto exit;
+			return;
 		}
 		if (es8326->jack->status & SND_JACK_HEADSET) {
 			/* detect button */
@@ -939,7 +939,7 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 					(ES8326_INT_SRC_PIN9 | ES8326_INT_SRC_BUTTON));
 			es8326_enable_micbias(es8326->component);
 			queue_delayed_work(system_dfl_wq, &es8326->button_press_work, 10);
-			goto exit;
+			return;
 		}
 		if ((iface & ES8326_HPBUTTON_FLAG) == 0x01) {
 			dev_dbg(comp->dev, "Headphone detected\n");
@@ -958,8 +958,6 @@ static void es8326_jack_detect_handler(struct work_struct *work)
 			usleep_range(10000, 15000);
 		}
 	}
-exit:
-	mutex_unlock(&es8326->lock);
 }
 
 static irqreturn_t es8326_irq(int irq, void *dev_id)
@@ -1200,13 +1198,12 @@ static void es8326_enable_jack_detect(struct snd_soc_component *component,
 {
 	struct es8326_priv *es8326 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&es8326->lock);
-	if (es8326->jd_inverted)
-		snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
-					      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
-	es8326->jack = jack;
-
-	mutex_unlock(&es8326->lock);
+	scoped_guard(mutex, &es8326->lock) {
+		if (es8326->jd_inverted)
+			snd_soc_component_update_bits(component, ES8326_HPDET_TYPE,
+						      ES8326_HP_DET_JACK_POL, ~es8326->jack_pol);
+		es8326->jack = jack;
+	}
 	es8326_irq(es8326->irq, es8326);
 }
 
@@ -1219,13 +1216,12 @@ static void es8326_disable_jack_detect(struct snd_soc_component *component)
 		return; /* Already disabled (or never enabled) */
 	cancel_delayed_work_sync(&es8326->jack_detect_work);
 
-	mutex_lock(&es8326->lock);
+	guard(mutex)(&es8326->lock);
 	if (es8326->jack->status & SND_JACK_MICROPHONE) {
 		es8326_disable_micbias(component);
 		snd_soc_jack_report(es8326->jack, 0, SND_JACK_HEADSET);
 	}
 	es8326->jack = NULL;
-	mutex_unlock(&es8326->lock);
 }
 
 static int es8326_set_jack(struct snd_soc_component *component,
-- 
2.43.0

