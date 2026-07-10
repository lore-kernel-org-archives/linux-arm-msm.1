Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85335378D63
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660076; cv=none; b=gli1bLSltl8TW4o31mCpHUAT6FdG4y4oX+ubAWhuLzATvy49MCiCgw7ygXlxiqm8IuQNWYICswBLo9LBnJ1oUqeJ5TrxhzOs6zhvU3Kmlf0aaCfoQ/f8u1yzSQeYUPg5jw96Sy++Br/Lbq5BCksYH1zhUHrscyKpo4Mz531zEcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660076; c=relaxed/simple;
	bh=j1KzWxhp75swdsTYPJvVoYjcP8hTRieKELlWe5iEq2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfdaUvdRyEkMPMVGuneOaEOR656ejX6uIIFHUjPB/viAvKYnpK8IMpc/ilx9i5MZZDz/CGniZJLVjfEhNc4cWytbHkZNCKsphr9+QChhNKRsgMEnN7v5RrJcRGt7NUIpVy2iaWqUp9hT+frwMhZjgkD1VUwiQXYLtKZ1cQABnL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5sEkSBk; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5sEkSBk"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c96bfabc8d4so300170a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660075; x=1784264875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=C5sEkSBkcLelKqHy4TJOpblUo59/6F30ozLNQGYYo0kFQQCfgkjBWm+oEXJoD6eFhe
         +i7PyEkiAr1/jM1w080pssJpuFSZkIjPX9Do3DtzIiP1TZ4PYbTzCyNyARX5oEIBGfhP
         PRYWZX5Gb/5cx/Wfbfgdsyk9/+8fd7FSV3zEPyqCzIPasghGKo6aX1yvqjMcr2/sobBt
         FJ6KnPBOpkUXGO/ih8pT9/92F8hc5OUJ6QUZEL89LdJ4szZfW4oNwY/1Pj7zAdZ6NzYs
         3yKf+C98Xd30Q/Dyn+VuRSfbZydKygSF4QSVumjxqbWrQtTKoGfbOIQYL36LUs4+Jy3l
         tXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660075; x=1784264875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=P4CQJtoJhxVhkAZgVrUlnYvV73nXFGN7x0F+oMzZmEzXrKo9TUIcbknZg1Pyfv9Mll
         5d5HetyN0SB74/tvQsyv3U6+0pRAO1nLU8nF63H+8iIiCSK3/97p968rue2igzC1cZp/
         F6h6XO8P7DvaO6OC1sRWVFZ57U4QfJELWcxEXKMEPL5feUZudiwQQQHsiUOdtF2DnFpf
         qW2F39RDZjUoD84C/dDnc7wZdSbi+0efjQllXKd/avmFa6hUc4GFO2gujnxOq++QU7S9
         GW9QdrpxNJ0j457yHFANxzK4Ymdzq+CfU/BCjUeuoDsRdcsvZszkBivsfIsyw7jIcDCO
         mlBg==
X-Forwarded-Encrypted: i=1; AHgh+RpTWIR7qUtA8aim3JjocWE1v/DxgEtgMowMruyC7lbUXK77WFgiqMX/mGeQ4uCz2t8OuZ1lexMnLXklDO28@vger.kernel.org
X-Gm-Message-State: AOJu0YxuE3VN14J6XYfA7ietL1pB/xODHqgGUvSJ+u+uo7PVf3+iHMZH
	Lysh29Aflq9LV89ATcTkN58DVE8qH6wXVeIpwoHxZWmECPSz1Rtf0JA8
X-Gm-Gg: AfdE7clq7fkernXFNTxqNe82SO6KuLgJ7W93HR/l3Zx52xi+QSjKligwgXmaBUsYVGD
	84GC4m8hz8aR4hCY1N/YK9p39j5kKvzdVX1gW1G29kr8YzZChq1iI/LJWgfeksWaOAwUqKyPguP
	HA6yTTRbhLxMKPx8Pkw6NYQX/bzHN5YtSPnBA5tn9utXc0/iJX99t175SSpt5QnU6P77DdbZ1oS
	rI3fr9kw/Er7H+G7g6b3S3PmUJnLZ0NrvGoIi+itWtEB2DbJMS7W0U5uvQfMcvclBkWXwLRIQ/T
	Pqnlcpm2By9vgD1UKibO7vO/Tl5rqeGELdT4j+ZLMhM3D/a65wEgybPhnO2ko/uWVaomqUo0m2D
	pVWEVuuYoT90HNycXspEGMlIBawQe7i60du5ENO96OtsBsug/pwXpy+EniMlOVDahqd7WOWhAlZ
	fNRKj3pNISC6+iZ8BL9Kitu491hkCuzkfKeo1+15I4XY4n9l98iA91L3JYOA==
X-Received: by 2002:a05:6a00:2e24:b0:847:84a1:9782 with SMTP id d2e1a72fcca58-84842ede4edmr9311865b3a.26.1783660074723;
        Thu, 09 Jul 2026 22:07:54 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:54 -0700 (PDT)
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
Subject: [PATCH v3 20/27] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:04 +0700
Message-ID: <20260710050511.14439-18-phucduc.bui@gmail.com>
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

