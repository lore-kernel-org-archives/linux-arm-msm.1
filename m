Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669A313777E
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145337; cv=none; b=XKH89evB8BZq+Hvsw+nunnKmKV+h0QTtNsxAxwRx6jMj+zh6YNUXxjdyOJ5EptF9fNLnFjd8DCOKZFv+rc7PIg7Xuy9mbyauXgmBy9TATc7w66kFYltPLd6Lyh8JNLYWCKjJwvblJy3C1adUg2uv9YL3yhkEMT5k7PO4jAf9fAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145337; c=relaxed/simple;
	bh=zFW9Mx0ZXn7hF454QrxJfQtGJ47S/hYdOGWLyBiXIRg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DGf/BH2y0+1mPbg09Eei1tIsLlWUuxVnEEAn166GfDnPalMarbQ+5aShIAK+REJTyBpYKLLvqauCqigSO7n0dFKAfaSc5WFaJwJQLfYHgofjbTE6U2qFUrBn5XO4v/x0YGAIyal5+8XNh5yx/6iZkeYMEN0BS/lrZF+/u0fP06E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Af8b7o3D; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Af8b7o3D"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so2561518b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145336; x=1785750136; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sk8Pesmwy74AH7VxeJg8H8U9dR5/4hjKm/qPKsN7J90=;
        b=Af8b7o3DHvg7p8WODUFtjMjLKcnHl81tUXmHecbMvfILAn926Sah9IiJh1vtG75wDi
         iL7JT+morWA/bmtTKLvYO0RV97Ke/U648y3YgrdWBL2FKpch3bFZBQxCWNppHahGAfny
         lvbJvk0qB/AW3r5r9LL4WSfER4QLJFA+y3E3xxr9FjT7C79G44n2wCTec4v0BrWbiBlr
         K/ErfGAmN3uz+3qXMDXO6bVe72RFXn55rUXXFJyWahp5XjIvh9J9YNChViGFaS8SKmPf
         n8dG5BQ1pZmnXpSn3RNkAjM/tKq0w7SBavsqRwaru9kB8wybvkjWHBTgxUMXHy/FIMXF
         DMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145336; x=1785750136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sk8Pesmwy74AH7VxeJg8H8U9dR5/4hjKm/qPKsN7J90=;
        b=sMFP6C1I9Rqfg/8PTND6U0mRQcQdh95uqfMCGB/D7nT5R0kto0lpZcrUqJ68a2i91A
         /KIreu7Jkrt+7ceJxrypP+iQ4FSx7DFEEt8ew5VGNdF6LF6mnFpjXJDD0REcrcjrqPQI
         BE04O3atcHSr/Rp/osw9WdJvHXpjfwQGn/qoT7vrofYkV4LQeHZWzdRkEpS7pfCAtZnT
         dEJ+iBO5shKrHfQYrRu6H21b8QCZrAQSVfdmtaJF9cm8XFKL9M1ToZx12ZiVDpW9rFVT
         5CiVoQ4mevCFWq/kUzOc4w/b7GeF4IKZ4KUW+d1/xcAtpUsL1p62QpLhxloMdfhILywo
         6voQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro6/FelKxg0keD5jHKPPOMSz01Z7CQQF2UTP/fJSaZdafHrjU/iYmhEkZrEAkO8/tUmet0XgctrER4NY2c1@vger.kernel.org
X-Gm-Message-State: AOJu0YygdLUKQGLvUVGMpVy7wBKMUX/URmUGioSOKknmyz/ZanjJtSEw
	QUKdFBATmFXd0KAT40PPabmHCr0bXi4FzVhBqNkfJU2XGPUEFWiGTfZP
X-Gm-Gg: AR+sD139pw6GLvtnssffY7aXpEr409nthZa01SsNiCdaP6iw5v1JYexC5Q/QOx4Iygq
	J8MTta+QsiGqAwqnz38DiuamPzF5ekTm0shgRd5FF/aK+QHuFUus2DfDv6aJS1Za3qnEatVyoLy
	q9YJ0qqGnKQOf8IrcfZxY3WA6Xqd8It6c52fDp8KD2G1kCd33dxVHufzDOICWmrNc5SVlxnKwUZ
	cKy5n3hZzbq9bJT31K/mk7W5PufIsVBF7d/p5GrNczauzm6d4b0uUP1iQzhFZtyo/gXU0iM3wbu
	IIXJYe5OqXkf6pKtGsFY2OQz5AQcXERuuJgkGN0fMFGYvpTbq8yPhOljDW5IPFBkzcgOwJ1v0ws
	Px5JnYEXbPxTQXX1R6478jJLO1+kjzSTQwXcof8iqot/HksmrQNg4MeoAnNcjnDwgsa464nY8Zj
	FPawPzk6rZeBNzwzUJnXVgwsEy56i5rWdmVN1Q3+mDGJA3mJVCl+7CkMesYTOCQwyw/ngCK7Ecu
	YmbxHaXMJKR+O9bCZlZKg==
X-Received: by 2002:a05:6a00:18a0:b0:848:57f3:8f8f with SMTP id d2e1a72fcca58-84e5958685cmr6221195b3a.51.1785145335786;
        Mon, 27 Jul 2026 02:42:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:42:15 -0700 (PDT)
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
Subject: [PATCH v2 03/26] ASoC: codecs: sta32x: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:23 +0700
Message-ID: <20260727094046.23001-4-phucduc.bui@gmail.com>
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

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/sta32x.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 652c6e3a9e63..d6de739212f9 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -17,6 +17,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
@@ -269,9 +270,9 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
 	unsigned int cfud, val;
-	int i, ret = 0;
+	int i;
 
-	mutex_lock(&sta32x->coeff_lock);
+	guard(mutex)(&sta32x->coeff_lock);
 
 	/* preserve reserved bits in STA32X_CFUD */
 	regmap_read(sta32x->regmap, STA32X_CFUD, &cfud);
@@ -283,24 +284,20 @@ static int sta32x_coefficient_get(struct snd_kcontrol *kcontrol,
 	regmap_write(sta32x->regmap, STA32X_CFUD, cfud);
 
 	regmap_write(sta32x->regmap, STA32X_CFADDR2, index);
-	if (numcoef == 1) {
+	if (numcoef == 1)
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x04);
-	} else if (numcoef == 5) {
+	else if (numcoef == 5)
 		regmap_write(sta32x->regmap, STA32X_CFUD, cfud | 0x08);
-	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
-	}
+	else
+		return -EINVAL;
+
 
 	for (i = 0; i < 3 * numcoef; i++) {
 		regmap_read(sta32x->regmap, STA32X_B1CF1 + i, &val);
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta32x->coeff_lock);
-
-	return ret;
+	return 0;
 }
 
 static int sta32x_coefficient_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0

