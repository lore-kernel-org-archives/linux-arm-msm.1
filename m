Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2245480951
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629679; cv=none; b=mo272qXcLgbOsL/Z+x0MyAdaQdeH+HgbuHoZgkffH0YPncaQDFuZZpJB1qa5WJipHnaDgt8P/K9nMqn7in8bRDfn6fS3bfkh7revwZ9d3H83Rpv1KLXs+Mv0zTjU6HiVyjr5Phk0aZt5+fPivzU4j34Fra6mzgLhnABkqd/+m8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629679; c=relaxed/simple;
	bh=j7IRCq6xm1VYCtZq2k62j8PjKHVyBOvTOYRKr/IN3Nw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B64TPgyYJt2hQgtEVLPElaRLgOcItCdTKygfhDzM8FxtoAWF1pg8NkJ5VXEFyXLK0lfwS1vzxm2f/wOR2UACeD6PACXNp1hrktbvSBUmy/BOxyMhXwYkZbptkukf8QOywiSw0ZlxKCEb5zsQaOHppEr4yjpytDZKPFT0h+R3pt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Inslfchp; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Inslfchp"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cea3004256so127549115ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:27:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629676; x=1785234476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCCco9cVx1cOuMyiOEUiJ1UTQlQHfjoxsoHM/LTW3Ro=;
        b=InslfchpZf5UpXvxDYIljexmMg0s0FZz916/HyswVgMpXgD6E/29XIEuKu4Nn/qOGx
         tZ1PN9L7gGmBVijUn//N0JEM9CxZbA8P1c7yTC3poo+OI9VFxJPrlsyERwqIhVkT7x55
         4B6Z/WBzev71lo1STx5CGisVun22QP9SAn+h6cva5NjpWScsjYNt4u6mRhrw0Fa6ZXWv
         ENN+cQc6mefmFaswBF02YjmJKDzkhbGCVDPTlbOvnqDeEJqrNDxSssabsUjug1kcohbL
         F0XzKNjnWxGLexcNOwfoQDeo3FErb0VR66kyRQ/o/vhhCVvboaRnp+ne8vUpROuDOHrn
         vQpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629676; x=1785234476;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gCCco9cVx1cOuMyiOEUiJ1UTQlQHfjoxsoHM/LTW3Ro=;
        b=qi9HG/jrP7Po9KJpSSi1nKsuwQAuC36XY1Imutp055hOyfu+PvyiHgzvUHsFb/76vD
         5DnxV8m2hnYGofWWBsKCwNmTnAfZHTROVXWh7guBt16kVKVhF92bxfVkyktkvSiUv+fw
         CiZ6TQQNXAY8h3UvMCUC7HNHCOZBd6SIm7xSINnjgYYS4kPyMbgBl/Y3mXvlq7Ey5Fsb
         dE+W8wTISZULf9/H+nziDYcwKy4LwIY32t5c7mNhboh8Zf02Ir6Q7otAHY+NNiPHyYT6
         GRN2JjnhoRiOm0xvUtRGvaJt0aFRjPPW4kfKZmJd3AERWmA9KUA9y5L+ixxWyFgDljhi
         KnOw==
X-Forwarded-Encrypted: i=1; AHgh+RqTKaCClX11N6pfYkbaw1cQgRgZ1v5KffmpXybtmyK6cJ65xwW97XWldJsvN/ur+kIDaOzBCeWwXlZG5Vma@vger.kernel.org
X-Gm-Message-State: AOJu0YxwDZ/CzbI/PQtpezax2bWrAAPnHUVSfCnIzsoB2Zxc07mHVgq8
	Oqbdvb01Yr9ddiPVPElh3pPWeEW544cf8aKpJoI1rdHRRccbQxEPHXkK
X-Gm-Gg: AR+sD13It0lK9sxbYywfdAVukdSB/CJ5AmnyM+74QV8y7zPi8thUN/0oTkgnT67eqMO
	V5QcWOXYi2sme6bQoGkaTO2XuQo94cATgDFJxC/XJXIA2KuRv3jZPb22RRyd3kKqbSgwOSn9USV
	mbb8O8l/mQaV7xdVi7i9l0bknoACQ4K2gRYrF7mzKnUB+q0PAUVqvVL/rf+xsKh4nQYBg1zEcfn
	PNe68tyKGaTY/Diiq+5XnhscDWZB2ZxyI/1l0qlwd3uJiUYsrAlexnvzdwRxzrnOmYCY9wGEqHm
	ZgJMdeLOkMbDU3gc+w6FjfKWNmnxHhyzkn893V+011Kwa4jXYt42P2JNhwyHsL1I3oa+lrrKm/T
	j4cnRf/v8tS1P3TSLNEiDpp+OKxPz5CHP+TTqAS2Le33U5bg0SR6FlBlIGEZPB7/qs9nlY8YQbN
	+Jsc7b+6jq55h1GwEeYj36CAkgBfS8yNrMHB2i
X-Received: by 2002:a17:902:dac6:b0:2cc:307c:51f2 with SMTP id d9443c01a7336-2cf34948943mr194104795ad.22.1784629676095;
        Tue, 21 Jul 2026 03:27:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:55 -0700 (PDT)
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
Subject: [PATCH v4 12/29] ASoC: codecs: max98095: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:43 +0700
Message-ID: <20260721102600.523199-13-phucduc.bui@gmail.com>
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
 sound/soc/codecs/max98095.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/sound/soc/codecs/max98095.c b/sound/soc/codecs/max98095.c
index 130b6694a634..d93436046849 100644
--- a/sound/soc/codecs/max98095.c
+++ b/sound/soc/codecs/max98095.c
@@ -5,6 +5,7 @@
  * Copyright 2011 Maxim Integrated Products
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -1532,15 +1533,17 @@ static int max98095_put_eq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_eq_band(component, channel, 0, coef_set->band1);
-	m98095_eq_band(component, channel, 1, coef_set->band2);
-	m98095_eq_band(component, channel, 2, coef_set->band3);
-	m98095_eq_band(component, channel, 3, coef_set->band4);
-	m98095_eq_band(component, channel, 4, coef_set->band5);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_eq_band(component, channel, 0, coef_set->band1);
+		m98095_eq_band(component, channel, 1, coef_set->band2);
+		m98095_eq_band(component, channel, 2, coef_set->band3);
+		m98095_eq_band(component, channel, 3, coef_set->band4);
+		m98095_eq_band(component, channel, 4, coef_set->band5);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
@@ -1683,12 +1686,14 @@ static int max98095_put_bq_enum(struct snd_kcontrol *kcontrol,
 	regsave = snd_soc_component_read(component, M98095_088_CFG_LEVEL);
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, 0);
 
-	mutex_lock(&max98095->lock);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, M98095_SEG);
-	m98095_biquad_band(component, channel, 0, coef_set->band1);
-	m98095_biquad_band(component, channel, 1, coef_set->band2);
-	snd_soc_component_update_bits(component, M98095_00F_HOST_CFG, M98095_SEG, 0);
-	mutex_unlock(&max98095->lock);
+	scoped_guard(mutex, &max98095->lock) {
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, M98095_SEG);
+		m98095_biquad_band(component, channel, 0, coef_set->band1);
+		m98095_biquad_band(component, channel, 1, coef_set->band2);
+		snd_soc_component_update_bits(component, M98095_00F_HOST_CFG,
+					      M98095_SEG, 0);
+	}
 
 	/* Restore the original on/off state */
 	snd_soc_component_update_bits(component, M98095_088_CFG_LEVEL, regmask, regsave);
-- 
2.43.0

