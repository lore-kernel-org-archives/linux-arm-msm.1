Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7F824A23
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467586; cv=none; b=usBJWytUW+0bRwUGD/TNAR1N+OyIa3yeWvAjEtP/zNoD4YzjdN4zBzoeMjejPlvlajtbZnwXq5oOV9oB6FXRz8wehfeZqVbXOuY4qs5VokynjYEnoCDUqCpONag1uGSJPFcIOwU6HACx/ec7W7cooKKRbMNBsZXr+RMBbcBEg/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467586; c=relaxed/simple;
	bh=PXhmUCCYjJMaODYQGzGhwVsJ5oviMRkUF+OhLfYe4jg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3IY/5RUrS4BBC2IkfIL13X4ZsNJhrldAGFkGjL/qrcmer4dE/ODIR6C3gD8NU/PiPeoATpp/hMn+uTP1XXuBqBkbdeYFUt9KfD9KqQQfE5FCL8H8sjRiy5G9+OyUWrnvOGRv7ymxB3Pg9cLF3Xeu5+4+d9Hs2QUpi9TFDDELTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqfX8AST; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqfX8AST"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2d049069377so81115ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467584; x=1786072384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tuKoDTJV7/eo9mQkxdlTMYT+n6rjtan9u9S68v0m15Q=;
        b=AqfX8ASTZ4sU819EeRYjeFjwbARzRcVTYvBx0QSVNu4l8OzPhtbejzLw+m9c2LVgRP
         0NvJi4YPDKJRte4iictJYEhShGzdtgRpqA4OHsdRyju7PD2ZtA7GEb0tzC7biyKSnpFc
         5+TcG1boBsf7wi9vviMvIHQsrvOlGpUzBgJ5knFPvDjSPBKsu/AYYxC2mkeCecHA9fep
         J3iKONrVGnfPjWNYKH8ZIw21nvKWJvTuNIEWHd6yeKGhpJLNr156feysczncnMfW8y99
         ay45vV1T0QjLhos/F+MekpH9xZzH21vn9thZRT+2p2PVeoww7F/ev9epADqw+tVm842h
         ltiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467584; x=1786072384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tuKoDTJV7/eo9mQkxdlTMYT+n6rjtan9u9S68v0m15Q=;
        b=NtV5MCUp+SOCtre3uvyyYkAk40cngpwWizp+Uyov0EVGWycFlcWOMW1pOcyexftWf1
         6alAEMvE2tUNZtue+S8P0IzCSb+3R1ThoHZf73YAYRyscS/q9efRUErfhWIU1lPbH4nN
         TG0p++9OaQ3MOJ4bgT+8zGpCdX1awTK49EVmGLuRO69VwatExXjM5HxDWmpFOOBo3hQ1
         /9WahvxgJBgGGGuXllztGBZuKTvJgPyQFWm8A65LdhVA24XKTeUHlC7krqEbIxBy4eq6
         ffvobVDYPKBq44IDf6NC6q6BenpoytHhXJJbn7FYkRus9hAOi6rrydMk4R2WyLAWLX1d
         twYg==
X-Forwarded-Encrypted: i=1; AHgh+RoLF/vn+56vp2sUUSuOy5U4B69oZJPF8Atg4jYSdLyxRPNDxFBKC60JiqaCLaV2YlXpOm2A3uR1Dky8rFF9@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0fJ+F01/jg8zz1LKpsSRDZvtEsXeb2b9Xy6jrs+0hP7Ebo5vH
	qRegVrBwzUX3pBWpdnYa8ZtKyUWfU7M3SRB88eUd+yb38aQ87wPGWpZd
X-Gm-Gg: AR+sD11THsGLoRZs0PgxJM+sSgdkBd0rhdart7dOe9mtNUwCWiqXqvNPY/cHMnARd/o
	T7gVqgWS7SHwV2P/aW/i2rp8m4h2vRxLXJF/vZI/DU3FyyINf8EVY4/rZ+mhNBxjO67HroYu6h8
	FG2vxZF2G+56R/3O8EP5zTmw8yA6kZkIupdtBqInvtfqmT/nTKm2Purwj/Y0vo6M4jory01auea
	5sH0hXdM7/3Gd/R+sAoC/wPiTRurFRqFI1F6CgC3ujlnjYEJpXeNHgE9SPtZxzWFTTKXxmYmTC2
	tD47XF5o8Ba8P3S8MjwbjRjATs7AJ22sk4ktEpKFU13zghkBxEx5DvdbxRPN+CLgnoz9NT4TPgn
	1xNKPQB5776ofO7SqMU2GMvTqjnOLlWA4FT6bteMR+Nxs3c/h9ERbUKlTJ/d2Qf8GaJHrdumzAp
	VQr+xQgChXzFk48cTUJixErwYKrir2mBC1/BH5UbKW+UgUTpH860096+2SVsF8+lx/Hr4PjRagh
	vaDK8PG0QSXspEuSJCw7h8BGt736/9lb1SMj1RuQxCyGmxOo+zZo+Rrzi0kDey4wfTojeoU2Ztu
	mSEd
X-Received: by 2002:a17:903:2f84:b0:2c9:bd64:8c8b with SMTP id d9443c01a7336-2d046e889e2mr5033125ad.31.1785467584310;
        Thu, 30 Jul 2026 20:13:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:13:03 -0700 (PDT)
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
Subject: [PATCH v3 22/26] ASoC: codecs: wm8962: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:44 +0700
Message-ID: <20260731030648.8706-23-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8962.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/wm8962.c b/sound/soc/codecs/wm8962.c
index 2db822fc1de7..8a9598161b35 100644
--- a/sound/soc/codecs/wm8962.c
+++ b/sound/soc/codecs/wm8962.c
@@ -10,6 +10,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
@@ -1564,11 +1565,10 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8962_priv *wm8962 = snd_soc_component_get_drvdata(component);
 	int old = wm8962->dsp2_ena;
-	int ret = 0;
 	int dsp2_running = snd_soc_component_read(component, WM8962_DSP2_POWER_MANAGEMENT) &
 		WM8962_DSP2_ENA;
 
-	mutex_lock(&wm8962->dsp2_ena_lock);
+	guard(mutex)(&wm8962->dsp2_ena_lock);
 
 	if (ucontrol->value.integer.value[0])
 		wm8962->dsp2_ena |= 1 << shift;
@@ -1576,9 +1576,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 		wm8962->dsp2_ena &= ~(1 << shift);
 
 	if (wm8962->dsp2_ena == old)
-		goto out;
-
-	ret = 1;
+		return 0;
 
 	if (dsp2_running) {
 		if (wm8962->dsp2_ena)
@@ -1587,10 +1585,7 @@ static int wm8962_dsp2_ena_put(struct snd_kcontrol *kcontrol,
 			wm8962_dsp2_stop(component);
 	}
 
-out:
-	mutex_unlock(&wm8962->dsp2_ena_lock);
-
-	return ret;
+	return 1;
 }
 
 /* The VU bits for the headphones are in a different register to the mute
-- 
2.43.0

