Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6EB47D938
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520354; cv=none; b=nTfnQr4FYsOeRw/xreZi0T0JRwST5mkzd364efttHfW/GblXyiysqySqSvBuhfULqT5G8fJ8L7+BvnLuLkRkZXrV5hlDBBCw4f6AfIen5ZCCuKHnsMVVCj+McOC4Jq9iFmqD5ZKNmH4/OW/Z5CSMMqMhnGrVPvR9z/vHKd9IFaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520354; c=relaxed/simple;
	bh=WOalQFBHar3NvkPew2YrsEq8h801FlbaMFuTGotQNTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nJQ+oe1MXM3cGkFmhVMrhOQ6W8QseT8W99EQIe/v8rzYpxKF3Pgar/d0UVUkMyTsuUzrwDbeIdn3HJFnvPCeFUEgDyy+E+M+lLqWQfVLY7qBhnPLl3CD4kpZSm8J5AE+8bh0XHAq1YPSTUh5r9iQcJLTs3qmt+Fp/eok36fcznk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PFLtRF49; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PFLtRF49"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caed617615so7517975ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520351; x=1784125151; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=PFLtRF49z6RnaKPh+ycuFCxr4iTTNU0r8lVzjN5ZsxxaTx+0kQ/6H9le3kdJAV03YH
         AUDAHvBSNUISYHC5Zcju/SFJhElyZCv2I/Te9EI2QTMWfKxqApRFl7HlkNo+XvqHXuQy
         qwNyL2T/uwT+s027qzIS55n9AkmjI5OB60r2+C87GFVj8RUIXWJ6IWV4Vg1EX/6qFX8c
         gipPUyVVY9lqmmoOnepwCxVWck/kz+zCcIpMa8ZgTEEEFD9O9wx2vk16K09JiN58QcAg
         9A4uBye1Skwpk2jzVYzPp/oZDGrwk8W6WxpynxYg2TFCwbUWhPs/Xf1PeiFwItg9YA7H
         jy3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520351; x=1784125151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i+E/hLMGoCFm2Bo6D9s4vrTO1A3cUntDy1XLWjBr550=;
        b=da/zckOSIpePIoYQxFridla9gpVa9r6MbeTFGPNnSXtAmZM4lRgKHS+HMuMZs/lNLo
         AO5pESSw0Px7/KFIXZAYSu9ZyQq6WxLNjf1C5Mhl7Xobs2ZZQ/s5dGbsdYrCP+I1pcZv
         oLPIoo7vHwxhspiykW8WRd+83QIXKPPxA/oactkySek+BZ0Z3KJrZa2JvZKH05OEBsuQ
         UWKpR3FKqziduVoq+a0an5qbnrMNVwAsB2qb3jmw3xAu5DWqTu9Gfo798r7NOAKwJJzt
         NLJXLW88jjH8mkwcqWPrN0j9ufbZljXwb7sxN23L4+9vpL+THaSJ2dXdlGPiS86TugFq
         o4yA==
X-Forwarded-Encrypted: i=1; AHgh+RrjXFen/dVW/WC7yjJPiacYmML5wdL/pZgss08Agl+IvvJtBl50h+o0bkxtCl1OBdnheCSSPsxoZI0fqhpe@vger.kernel.org
X-Gm-Message-State: AOJu0YwBFy9xzf9MfjBgd31MVyjo8RceCtxS5Mqma8vG+VXxA6VuOHHX
	013iBw5BLKVlN2cnEBqQ+Kej4xdWtQyzE9nH0lFKlTgfMviL/hWPqkZ2
X-Gm-Gg: AfdE7ck0WfU/VQdvPf+47vOMIUsoUSZUgBsXRHJbSBrJhKURonXmh0PO5rX49hNbN4Z
	byhqftPpC9Pm44+1Cct+hUeZRogbbDS5WERBIeNDhTg8bt9CLyJZ2RwsjAA/KkpVV8+SB7lPK5J
	oj3wYKxIpJeOWO34lEZGrUrMmA0qLoj4/AImrVJTwRuYizpsmw5JiM8QmheT0t0iKTzUVfARjSL
	TwrcvHu9aDwLqEenG4UtIuCQG2qPIVpHFNQ6hB3BLe1k4A/mLJs48DTRoNQxWJH9JZWInfmUReg
	NOGP7QUS2X00AGGCa6O7C6cDfk2mbeBWCArInvO7UlIKj8Y+W6P9sMvfw6d2P+NEOAWHy0b4YN4
	qjR9h/7v+QJYH7yZiEZN4J07/OsxU/MS3LK9Vv/KMbtbo93oQori5myKmMVki6AW78gJLBNRx4a
	h6izM9L5/58bN+MYiMfuvnKTcLFOYK/rJ8HyIrDlSk9sgdoKY=
X-Received: by 2002:a17:902:f64d:b0:2ca:b8d:e65e with SMTP id d9443c01a7336-2ccea48bc51mr27117655ad.37.1783520351057;
        Wed, 08 Jul 2026 07:19:11 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:10 -0700 (PDT)
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
Subject: [PATCH v2 01/27] ASoC: codecs: da7213: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:08 +0700
Message-ID: <20260708141734.578926-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260708141734.578926-1-phucduc.bui@gmail.com>
References: <20260708141734.578926-1-phucduc.bui@gmail.com>
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

