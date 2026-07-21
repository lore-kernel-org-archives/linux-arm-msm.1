Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972D44963CA
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629741; cv=none; b=tdxvZdCTWaItTvDet/N+0FQKhFKPgHKhqNXsY3usdl88QMlvX+zm2Q+Feuj/2500oYJpL8jyWMKM2I/UJe83oCwbefwFsUhXqM/hKoIpfY4NqTk7YhqzOKbyegyYkfmoWmmC8BmteHzkMMbDOLJJx7TwahAJzEzgz1AKMLMW5P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629741; c=relaxed/simple;
	bh=j1KzWxhp75swdsTYPJvVoYjcP8hTRieKELlWe5iEq2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDvJ0MqQe8gH9QLL1LaIr/1g4oEAzE1x1iuEMcW/PI0LgY6Nt2BudJZoEzVSnlzILyZTRAO+IaGVUTvSFbYjgUvcCevmMN6p6j20r3NJaxqlecIvkTArQ/NhK8dC7mwCwJeCEqbh+SavPBFYcU42Kan1AhIUvsInzyn7vWph6OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nZCh6/J0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nZCh6/J0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cace91f112so114296515ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629739; x=1785234539; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=nZCh6/J09Q70+eb434fgInxIXahgqRBo2r97XRpqV08yyxhQgp2K+wCV+IgwgbX3U8
         9SHYP+JDgu+AyQM9TpRuUVeXk1Y2ncWUllaneVzE42dbft9BFRPqnSgjIyoaOB7IIb0s
         K8ItvUfWezfDWIQ/iEZeZSiqBtn5KQhUTN206qpWo01lEdbNWC3szZrMlk1oPA3I9VZA
         MeSUvEphxnbCvpAap4fSWRwdaLk6+3V+f8LjTrz32Ne0GoqrOhEw/7LXYkSqRQKkMLA7
         Mi0ZtmrbH+BJtcRseZpaekYtRwNHScvh6UmOVT0DhTA1rnA3tcrLnZYzjpZtIxk8NVY+
         Egpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629739; x=1785234539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=kghbqiiwYZllLyhonU826J+QGadbm+5b8qaS932Qq+LT71GLibqoXb34FaDcEgFpqn
         SLLE8QPcXDskT67z1dzQC98Wz3RSpuDwPnyqq3NAuyjGXIHfK+o9kudFs2DLCZ2zZP/I
         legJaxr7UeIP9VPao2+hXPAk/GMYpw1qZ02TWNnI8/5nTc86EpmvRl2n8idf5/phYiCI
         EMAL+3HamvBN+9H8ebujfRnFOjZEH5jEVDI4cKI1vMSU8YFC7CBlho7k8bL6M1naaP4J
         76LfDz5KXquAKVZRj0yG9OQsVsr9/Oi+hWo5excGyuWqeq4+k1hetszeRjMrMF0UV7t/
         xPcw==
X-Forwarded-Encrypted: i=1; AHgh+RqF+9VyU0s7+1AeTCTEqYkcslQnBbCY6au0o4EPYN5e/ODTgdPV6I+eL4txMxUS2tcDr1hBy7wpFPmKSSg1@vger.kernel.org
X-Gm-Message-State: AOJu0YwMgAJAtRp45kcTPEwNzuyUxF6kWWT4gzS8aBcFNCCgWxq6Wmb4
	ibX00lI8cyZKFvfB1u7/NjWiVZ4yPWyaOFwNxtbwqIA6vKQLbwI56Dma
X-Gm-Gg: AR+sD10MG6EW8z9SNJvPdJOBVKWn6k1sdX6v7dwGSmDqlIGOEoVjpenynk3LD+869q9
	lf4sYVBYtNiCEihgnoxzIq/Pq69uY3C623ypGlL+mdQNukiMlnXWcO5bF32dAD2eAOOH4F1Qjl9
	lhgpNVjy1jc2+E5XCiZZ5C/xLf/ymU0e+VEXyk+Cd+Gzp/+ectdtwOHJyl8kpJSO8gGPColdwCD
	IR8bG4xDzzkO9vpmToEjsd9ev2XLvVMrF6vJ3vE7Y4DFsDoCawFlWEvXPCbJNYzCSCmv1Hp6nYo
	13eyjf0kbX8wZtuCy27F7VEUnvS9LJ4uDLGCtVT/XD9rj5ttZ9/q9dDMicYqfstom/WH6GOpzJl
	vnVDa6DZFF0Oa8Qr3FK1YNmfV5DVhDtcqlE/HNJhSrlpSHcyW0lpTLPNEIlha60RCkE6TjLMZeY
	/LGb6y7jm+jHHs2Re5nuUKuq2BtKXelKu2o0nw
X-Received: by 2002:a17:902:e54b:b0:2c9:b48c:fdec with SMTP id d9443c01a7336-2cf348547d0mr202166025ad.12.1784629738893;
        Tue, 21 Jul 2026 03:28:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:58 -0700 (PDT)
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
Subject: [PATCH v4 20/29] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:51 +0700
Message-ID: <20260721102600.523199-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5668.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/rt5668.c b/sound/soc/codecs/rt5668.c
index fed6de40b8c8..4154bad27610 100644
--- a/sound/soc/codecs/rt5668.c
+++ b/sound/soc/codecs/rt5668.c
@@ -6,6 +6,7 @@
  * Author: Bard Liao <bardliao@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -986,7 +987,7 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		return;
 	}
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	val = snd_soc_component_read(rt5668->component, RT5668_AJD1_CTRL)
 		& RT5668_JDH_RS_MASK;
@@ -1053,8 +1054,6 @@ static void rt5668_jack_detect_handler(struct work_struct *work)
 		schedule_delayed_work(&rt5668->jd_check_work, 0);
 	else
 		cancel_delayed_work_sync(&rt5668->jd_check_work);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
 }
 
 static const struct snd_kcontrol_new rt5668_snd_controls[] = {
@@ -2356,7 +2355,7 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 {
 	int value, count;
 
-	mutex_lock(&rt5668->calibrate_mutex);
+	guard(mutex)(&rt5668->calibrate_mutex);
 
 	rt5668_reset(rt5668->regmap);
 	regmap_write(rt5668->regmap, RT5668_PWR_ANLG_1, 0xa2bf);
@@ -2400,9 +2399,6 @@ static void rt5668_calibrate(struct rt5668_priv *rt5668)
 	/* restore settings */
 	regmap_write(rt5668->regmap, RT5668_STO1_ADC_MIXER, 0xc0c4);
 	regmap_write(rt5668->regmap, RT5668_PWR_DIG_1, 0x0000);
-
-	mutex_unlock(&rt5668->calibrate_mutex);
-
 }
 
 static int rt5668_i2c_probe(struct i2c_client *i2c)
-- 
2.43.0

