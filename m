Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D933B2D10
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782596; cv=none; b=pO1iCvgjb+uYCwJs99LEjvLc7Atnvk3bLoZVEd3AYPh/nrCLsrR8qk9wrt7zEerLL5EuznqNcVUsrBwIN8uRAMoIumoUjkkx+Q0h66hH5wyr3dcA4tv+6vRTwiwdtOLUmMxHDbsF1V4ZpDjQXS2us2m/D7EAXu49u6kYzBlXqyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782596; c=relaxed/simple;
	bh=yBK2UCUmSQSFOpEtB+8KHiI8/hJRWMYuBBrJOg0oZWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Mr/kyk8vknzXwdhtHd6NDqhrEKqaSOZtJIisSR4vXPXsgkRyq5BcAksqVpnoYECi9c8rzm3Tqyw7YyszWx42BQ2dedpulA8iWEu5AkdPxZm9p2nhKH2vKdu7UNKrrUQP3FY+lzYoJAzVB/DKa8kUYToHVc82NwFtYzc8m2Of3ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e+/hlKr6; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e+/hlKr6"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caed617615so2570915ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782578; x=1785387378; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Md3Lv7WH7OCFvrmgVPZDMLRQIfXY7uimwN9Zh0AdLk=;
        b=e+/hlKr6p0jKsUE4cDAUvfkDqboecn2EUu9SvT15nKcThgEfqRVlVlAAWeO/maQXyJ
         t9H3R/SLbQRwsSt5mQzN6pw/oiOE/bDmLxq2ND4YH0FFdmRaTcIL8xL6cJsYC0nVyHXZ
         frcMOQ/vs10pIZfb9bFkIZ56bOd5KmoGWy+5xQ0fYeqbOxP6WuGZpIsfYjtGkkkhw2bT
         yzZc45mMNC5ZRgV25RfyPrCDmXSY859GlQe/yl80vkL7h0pWyXgejvTBqF9kK0oLxi4O
         pjW32MrTQh767z1AH1QIeioBwWVKlM0zB0f5Qc8/dKqX1Ss021mCQXwPBH06uvK5L+uf
         TvDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782578; x=1785387378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7Md3Lv7WH7OCFvrmgVPZDMLRQIfXY7uimwN9Zh0AdLk=;
        b=Ri9BvZ0Ks/AR+78iSpwRTqH1uRCP2GkyOvQtmPvyr9rVF+urG4cX0EzntSmzzTrTK/
         b8T0dXby0oRD4sQ9TkQ746uBayFZ4BPvoxXgtrNG0p54Y2O2HUrlGzuSQYCmcFR0agbe
         SeBMr+pUp5+y/SsRRbzL44W3YiJOajjeTXU3e62rY4KFE+/GdO6z2+HUK2rAzzZwL27j
         X3pz2h4gMfDm2rF72jxkG+lQZ1qYWUQTlQgw6q4xlF4ukSS6Dwd1q5vWcbvFnN4AsW5m
         sb3cW80/0I0ApUelycaPudZxbD+2dOWOJIzLd8Wyj9qPhdDRYAjWtBYqPWVIXCrZer7F
         AY8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqDsUAvZLxxDezjCYH7E4+9xUvwozTkZpe60YGsZm5Sy6rdNFX1D2M6xgfS1pMxnEU0mj9cdmOQIwbmEBJM@vger.kernel.org
X-Gm-Message-State: AOJu0YylxU4Bf3rK1nCiQG6O/yDiBtePmvra3O8REB0toKXJEbD6KhsQ
	sWbGyGTgBFzZCC55obS5rOpu5jpdolJt+rCFB7ICAs/9kG85nuH86ikA
X-Gm-Gg: AR+sD10pGOOYmJ9WlHqHUFFhVf+D4F4bNqTcnI3iPt4e5WERcB9nU6NkAcV8wrkfnpi
	iLKXhzJWZFUENtrHUB9XtQmwpZQYNdBgrN1w1LNBFCTER7CPZX0Jgx72Y3HOQCZqwyJ9tyj2GOA
	En/kVo+xFiEVr42awLCu+J89IQakYtgZF4AZUg4/Vm1XmKy7C4MVI0cm9zIYLpcpzUREcgz27Ao
	EAwuczDhSZ4pdnKgrr7zDHftlhFtUgZMx8lEpStfAXqJPGXJ7hDy5lQ2MLtOBL6zC+Q6sfIB2hp
	3x45Kbs497FtQt7sX9Cja9mAsyggO7VYuxYtPOydyT2cKN7y161W/S9di8/N+c4tHu/cJ08x3xB
	/HKGzYTZ/c4wk0UlAHNcuir4bk/5O/xnJHK0skHMa9jdH+xtJaiS8PJwCDAciGn6lXha5L8OuBl
	iPdbUL7Byk5OBjO7PlRISIR69eZ5tZU6YCDtmc
X-Received: by 2002:a17:902:dac7:b0:2c7:ebfb:618f with SMTP id d9443c01a7336-2cfa6b73a76mr20511265ad.14.1784782577702;
        Wed, 22 Jul 2026 21:56:17 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:17 -0700 (PDT)
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
Subject: [PATCH 20/26] ASoC: codecs: wm8903: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:21 +0700
Message-ID: <20260723045327.28260-21-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8903.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 320d7737699d..156e1e24a388 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/gpio/driver.h>
@@ -458,22 +459,20 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8903_priv *wm8903 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
-	int ret = 0;
 
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8903->lock);
+	guard(mutex)(&wm8903->lock);
 	if (wm8903->deemph != deemph) {
 		wm8903->deemph = deemph;
 
 		wm8903_set_deemph(component);
 
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&wm8903->lock);
 
-	return ret;
+	return 0;
 }
 
 /* ALSA can only do steps of .01dB */
-- 
2.43.0

