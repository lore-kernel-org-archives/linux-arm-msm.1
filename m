Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F87A3B7770
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782622; cv=none; b=l8iRnHghEacF8N1Fdw25pO/Y0ALeUdrn/EtaLESOBBDo1Jv6Aas/JZrD8R0tsujqXKs2U29Gdn8fYSL23F2F0ReVouWbloF4nCrz0SkJHvSijn1SG6BMeO1ys9l+3yKtC7fRVBr2yB5VWzoePZwZ+Ffilwry18wadib7eCJ0wuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782622; c=relaxed/simple;
	bh=Drn8APp5Uw6rYTgsK/ubGCbMdZovD7uDbrhOiuvrAPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cJ3yzaPNp5+RPTJcPH1L4YShf8AekNhng07G7KSElhIiPB2PANfnMBrHkDO0ZQh0SD7w6Wa4V7kzp6lqMbVWJJumr3DGBVedqNSAYSu/+JsYwutA+M5TCWred+CSEMibJ9kjyBxOmcewJ3m7bvPakeGOmGZFPZmzIG1ZkSW0eOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYB6f3xe; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYB6f3xe"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso2571225ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782605; x=1785387405; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OeWw6h5jytB2MGM9QIlVlvrzPpa8kERJj1qhZ9lmXsU=;
        b=OYB6f3xeyetL56gcT6B9geaavkO1stAqR4SNgAiSUk4ai7kv1DnDEfRTl0i6Sngoc4
         o85DtGRMj85KOwd/rIczizzXY9InE6CWm84OnCklxyDmATfJi04uNytG1XZznef3Glnt
         DmEvTk9tlrrJQyTBvoAHTaKagMNRkHAaVmnN/BdlJWccJZuFG4i1kZ+Otfgmv4Ur1FyD
         SVzAho1mFgs+ruxA2mkyi6Bidhvpr0Jk3pgrHEyNnKO2ilksWstUnSNF0DD9vc1i/FXb
         IA13GCtdudlMCvfb2S+c6T/utdKT+J3pXotcCNKmt/TB/AIS3jXZIFi+pC1k+7bybkng
         7Jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782605; x=1785387405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OeWw6h5jytB2MGM9QIlVlvrzPpa8kERJj1qhZ9lmXsU=;
        b=qRwg+eCCS74tptMpeRFp3PQBFDiLBu6QIABhMkiDU6woCdbA7wRW5PCBvBnv3aahel
         TE4YtPbPA4LnojRnsg0T/SoI/5WVmr4FI1kED7BQKjfML0vkkuOqZX8QCgA3iFLRz+W3
         11ovDmWiGOOlDvVyJI+pepClcL0DkMCCIXy5jIcsrT0GlDsn7WXtnW2s3MEZKurceMnv
         wGhFBBABCvhaGBqXGbYtpMfkKCAkjjK1pdc70/dFG1Kmkt/cSxDTkby9VmRtOse70V9h
         9m/+MRC7eIFpzXHtiX4UT2kl9my1CwJb3V4hXCWlATa7XhO8m6b858fnut6JYQmTj+iR
         vcWw==
X-Forwarded-Encrypted: i=1; AHgh+RpATeNZTcFk5TbLP/bxnKG81Pczpeiy7SmOQ76tTk+5ZBJvEN8EFKVq4PjnBlGvO7VohudiOG0HG1ay4N5O@vger.kernel.org
X-Gm-Message-State: AOJu0YzniDre0cFBNK2jMq7yh5CmH5S+YtQznHUriHD89AgQoEBv3n+W
	QYqhgEaOrSjoDfeB9Ma6VlNimPfFKvoRC++frbz/e9xOuUDTksZ5DjBy
X-Gm-Gg: AR+sD10YAJcgBRU/kKv9gF2FGICFWfDcx0ViTeI4zCimoViSC5orQB7zSROr9ZTZuYU
	Sg1tTR6N8TiA/8cBRIwtHDJY7tmrG2wkgJxptnf2s/xQMpvEJ7r6MunXTy7umhilpDphyZJfFDI
	k3NHbdXenEkn6tGwGSB5E+rE98gYetJsuKKMv3+WVVGjX6BRIbTx+JUItVNB0EOzB6GzgH3pXUr
	QP+uzVvwNU/y9LBcmkdSSk1JCoxS8DV44ofTVVFLUTvGxZ/hGkOTyTyKm1QieRnBEgbziqrGyVy
	e4CVI4hFRkr4HkPmpohVPdkUlF1sMHxp6b+Xjb09qCNk8/Se+YUd1WvyZjSOrRcoRXgX3Jfsxgp
	Tgd0/Z8B1YJoaHNSSXdKlc21k/f13aeqO3pKdjy67z8gBY6AZqv7wsrk13/Q2z4i3M958mNSbig
	xKKdeYw0Xn7w+fhnlk9gTrsZx3qyrRgkdiQkSQ
X-Received: by 2002:a17:902:d491:b0:2c2:62ee:5a0d with SMTP id d9443c01a7336-2cfa6b77547mr21829445ad.14.1784782604968;
        Wed, 22 Jul 2026 21:56:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:56:44 -0700 (PDT)
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
Subject: [PATCH 24/26] ASoC: codecs: wm971x: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:25 +0700
Message-ID: <20260723045327.28260-25-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm9712.c | 5 ++---
 sound/soc/codecs/wm9713.c | 5 ++---
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm9712.c b/sound/soc/codecs/wm9712.c
index 83cd42fa0c28..3105b2e0556f 100644
--- a/sound/soc/codecs/wm9712.c
+++ b/sound/soc/codecs/wm9712.c
@@ -6,6 +6,7 @@
  * Author: Liam Girdwood <lrg@slimlogic.co.uk>
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/mfd/wm97xx.h>
@@ -229,7 +230,7 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = 1 << shift;
 
-	mutex_lock(&wm9712->lock);
+	guard(mutex)(&wm9712->lock);
 	old = wm9712->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9712->hp_mixer[mixer] |= mask;
@@ -251,8 +252,6 @@ static int wm9712_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9712->lock);
-
 	return change;
 }
 
diff --git a/sound/soc/codecs/wm9713.c b/sound/soc/codecs/wm9713.c
index b3bbecf074ee..3ba7ca3c1770 100644
--- a/sound/soc/codecs/wm9713.c
+++ b/sound/soc/codecs/wm9713.c
@@ -11,6 +11,7 @@
  *   o Support for DAPM
  */
 
+#include <linux/cleanup.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/mfd/wm97xx.h>
@@ -238,7 +239,7 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 	shift = mc->shift & 0xff;
 	mask = (1 << shift);
 
-	mutex_lock(&wm9713->lock);
+	guard(mutex)(&wm9713->lock);
 	old = wm9713->hp_mixer[mixer];
 	if (ucontrol->value.integer.value[0])
 		wm9713->hp_mixer[mixer] |= mask;
@@ -260,8 +261,6 @@ static int wm9713_hp_mixer_put(struct snd_kcontrol *kcontrol,
 			&update);
 	}
 
-	mutex_unlock(&wm9713->lock);
-
 	return change;
 }
 
-- 
2.43.0

