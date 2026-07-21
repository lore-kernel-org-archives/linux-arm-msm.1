Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A673D093F
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629589; cv=none; b=Y14E3gaYk6M7z3T8YGtcvcWbcrnkIYEHm0uY9F0KiAa6qFVVpy0juXG1OHpM5j0L8Asx10+9dDQSnBO5w9nvKf2tPHJF9NR6mEzSjTxItcGNAzpTK6Lj8Lf49zuqGBQRlqmRO5ujbxnJH0EhHL0TSDlr2vvY5QTwB1k0cVhEoK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629589; c=relaxed/simple;
	bh=WOalQFBHar3NvkPew2YrsEq8h801FlbaMFuTGotQNTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tyxv/lG2g7EW2ZlTgOwsZrt5ZeWqHcu776Y8f/JmU6qXa0WH95M5VbpNiof9Gi9CUcrnJLryJPF1ZGsDdbo7spCM8H2DV/GpKVJk/G3D28D7LUhwe0VzOtFo6sWuior6pzdXFziEjdQjzGl57oWbpbQ7yIABEGVaA5cUcCBBZEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GfdBQlkz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GfdBQlkz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cc73e322dbso130524505ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629587; x=1785234387; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=GfdBQlkz4k7ZCnVEiwGMoFrpOhIXxCxvteueCP3fU9H9pAvHNFhz6gLZSJShcOqeon
         P1bZe7MvYm0c9C+iJ6S0HNkTRxIqXOyhTZP34APSe2MkX06M/Nk7Gatng8FHYH3MFlf/
         dNDBSACA2vH/eEo2k3OwrlzJzVDdUEMGfkP43zZvgsRu6HSbdQd21OhcxvUsRMGu1+If
         hYk1nJX1XtEh/t3dflx4KKp8m9qIqNsY+eHmciieGAPVvUBVjMCe424JkBpZeVahTJfy
         ZZrLBwfFToP6/J8P9fe0x0EIA53LTv5sX43mThMAHsMhijKTLgX1VVy8/Uf3eieKxkbx
         s23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629587; x=1785234387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=DNPdw/tFB+fWPHfZTxl7OlJ1sXxwlftJel5Gfn5zaeQmPwUj7nQPjXlri5Sr/Fw0+V
         y3dMq20UHYa8iaw86ahQBGp2U2gIQaNX1FkFiq31A0bIrGiTiVCu3zq/SYPdEbANqwbg
         IZt/D/2wp0pM9nkl/+kinJOKIzozwp9lzZVCjrzjQ8EV6f2U88TA5er+M5w3NxMPrEqm
         R29nrRgje0oFeazt0EJYSo5S6Aam2jG9GQgEzwkqjyvfZGpeRrggQKsUn4XFmGJhVpPs
         6d2YMa2EPXdmU4XTIHA35jAv+z9HNMXZ0Ktt95iR6Tb8RiIk58zAvvYsrFENTGojXuPV
         L6iQ==
X-Forwarded-Encrypted: i=1; AHgh+RpWnDZzZ9uiMhAnFBGRKc9xEpWPdWh+VO1JuxSxsTgSU8B3zrHP7XE1wG8tB3Veeib67su5cm7vWushEHYy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2MjqjrBoND99RMGHdwLzxJ5VjqkxRE4gwzyOvVggqL5n5xuO/
	9gEuFmq7NMJZhKHyWEIp6sCX1GjkKmHAkB3e1YMkmvGe2szYBelQQPfe
X-Gm-Gg: AR+sD13OLXnTvc028fhxLO4rWpMRI9DlNW3E3xaqqXzZTTesQ0O40vpv+Hhw+et+8wS
	jCkSFKn2Q+8azPKhNL6KCpe7R8m0T83y3lLk0bDteeW5vJ2Wu95G6MV2I9tTrJ3GkJk+iEjMH8S
	sxqLH87sjqX9hqGg3laR6PvIZYwu08FNA7ovHoI6QEzkYdgFpemEGRUWjlM59GErhS7lrqoHF0Z
	5L6Dl5Zb1C/JkM+NTLCSETBT6kHc5NvIMVsdttoiD0lLpRPxw+YN7PlVy5IJ2JyiKo9KSyaucX2
	AZnVo4nfqsc/Ijuv9NNiYrmNkl8j9yCEoFt4FRCvTkHVjGooPLMmNdfgTUQSSwhi/d6Br+nU0vB
	AtRLPU1W1xqP6MOoN2U/TQ68U3ncnoTPorMU90+W0NLnGUnEc7c9+WobHzF9o3AP6KgCn5ZgSsI
	ppl+xzaHheF+49qyE72+K0WgQuuZhkPd54Tsy4my4lzCmZELc=
X-Received: by 2002:a17:903:1110:b0:2cc:89ce:2ef8 with SMTP id d9443c01a7336-2cf34a2ad90mr188368875ad.40.1784629587347;
        Tue, 21 Jul 2026 03:26:27 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:27 -0700 (PDT)
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
Subject: [PATCH v4 01/29] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:32 +0700
Message-ID: <20260721102600.523199-2-phucduc.bui@gmail.com>
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
 sound/soc/codecs/da7213.c | 37 ++++++++++++-------------------------
 1 file changed, 12 insertions(+), 25 deletions(-)

diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 4bf91ab2553a..923b997efbc4 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -11,6 +11,7 @@
 #include <linux/acpi.h>
 #include <linux/of.h>
 #include <linux/property.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
@@ -216,13 +217,10 @@ static int da7213_volsw_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
@@ -230,13 +228,10 @@ static int da7213_volsw_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_volsw(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_volsw(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
@@ -244,13 +239,10 @@ static int da7213_enum_locked_get(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_get_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_get_enum_double(kcontrol, ucontrol);
 }
 
 static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
@@ -258,13 +250,10 @@ static int da7213_enum_locked_put(struct snd_kcontrol *kcontrol,
 {
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct da7213_priv *da7213 = snd_soc_component_get_drvdata(component);
-	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = snd_soc_put_enum_double(kcontrol, ucontrol);
-	mutex_unlock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 
-	return ret;
+	return snd_soc_put_enum_double(kcontrol, ucontrol);
 }
 
 /* ALC */
@@ -465,9 +454,8 @@ static int da7213_tonegen_freq_get(struct snd_kcontrol *kcontrol,
 	__le16 val;
 	int ret;
 
-	mutex_lock(&da7213->ctrl_lock);
-	ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
-	mutex_unlock(&da7213->ctrl_lock);
+	scoped_guard(mutex, &da7213->ctrl_lock)
+		ret = regmap_raw_read(da7213->regmap, reg, &val, sizeof(val));
 
 	if (ret)
 		return ret;
@@ -499,12 +487,11 @@ static int da7213_tonegen_freq_put(struct snd_kcontrol *kcontrol,
 	 */
 	val_new = cpu_to_le16(ucontrol->value.integer.value[0]);
 
-	mutex_lock(&da7213->ctrl_lock);
+	guard(mutex)(&da7213->ctrl_lock);
 	ret = regmap_raw_read(da7213->regmap, reg, &val_old, sizeof(val_old));
 	if (ret == 0 && (val_old != val_new))
 		ret = regmap_raw_write(da7213->regmap, reg,
 				&val_new, sizeof(val_new));
-	mutex_unlock(&da7213->ctrl_lock);
 
 	if (ret < 0)
 		return ret;
-- 
2.43.0

