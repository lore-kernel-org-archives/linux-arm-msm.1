Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B2D477E4B
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:21:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520508; cv=none; b=Kahm4DlsyuxJjQl+P2ckfUwMczA/7ILHtXs1vCYVWPKftDcYX6uWoFlYCpIf4ITh5AgA3wMT/b55GcYVH8uEPmytRA+0VqtVu9LgeaiWPZvKNiKbtSUss0V/5/sDgRvRijjLnr9US3hzhwFA57arZRdapcMw7Bl97Rv19i3+14w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520508; c=relaxed/simple;
	bh=j1KzWxhp75swdsTYPJvVoYjcP8hTRieKELlWe5iEq2U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nyzYmbVNgbefsuZm6x/4odlzydZHkqWUpERy0A45KCadyBPdiPb/oY009vbWJLOwjdgYDy8B7qL2VmblvSUtXw2iOr75yT/AatyK+c9o6dVCwykSOrYltWwfzmqVQbNDyTvcENcd6PG84WCJ38avtY8id8H5m0SljzNMLduafcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1mSDDXa; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1mSDDXa"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc97653887so8503635ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520506; x=1784125306; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=D1mSDDXaVpGNI0QKy+WApg67OlRFaGx23ASrI6Jpm6+OYkVNgZextzPljAP7EGA19a
         8c8+u+k82WA2LSUR2AWXLiNZil31AL8Zkqg26WqenK+3sqKo/gmRGtBAkI3IAv2pem0r
         qHQPAHp9qzJ3u0ymvpizyKwmSOfzx0ZI9sZa3ufSjyTDk+xpGSZFXIfuPWgItcDUeSkg
         cHNiNDVlPSTpNm1yT+x4ydrOliGryZD9uYzqmjAWztPtDfSMBfQkjpaw1Y9xiszhi5PN
         rCPIFh2rGRM0x4tShR8p9NuTqVBmCFf9oDYyFV/vhEmuGTYgpBC7tHsLWD8yzLfhpfWL
         2yKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520506; x=1784125306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26LuwxXuYnG2tABKOgMVR7HJmLwQlsRPpHyBPQzuKoY=;
        b=io2aFm57+bcmP4dGrb1X8EUVcopSMb7p5mjAjVg93+PIcBXG8wiqHxgvpD8uePYsKx
         5qY2OKO4oUbfsnpDneCgDYKTRI5/ovzkGAQ289qhC8lLAqJryTT4wDY+V1aaE7bfT+yu
         1wL7hrNyuCk1avsikOHpP4lVSq34JH7R8SpaEd7b4zRBGCgDe8vdJIyzBusgfNbmRQMj
         DtfWcxx/nb6DJnXskjldbfAjFMYV51DLeGqg5S9HX6pg6rSAY//dOvfbMAcaZEIcPYIL
         4CssKTvZC4kR2R6f7R8Fw9zWYROacNxkocSYPvpiSCy+HvYNmhU6E0WGUAZ7LSJPNs8e
         pEiQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqw6ao85omPmswJtNlFYdoiVrtPoC2jlJJxgvKZsfMLHMzYhpSCfO+NhsfzHTivxQwRT7IbKiWZ4B0DKiic@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2skMKkdY8nWZA/QJ+NdI4kKD6ESx6oqOHbbs4/xKAeHV4wWCg
	sw+6jw9IwS63sKO3H7iGgaxE28BaRmO033Oa2W8Nar735sqCAaXv1SDs
X-Gm-Gg: AfdE7clX9+uoxScGvvVohSY1qRDxVsdUMayBYTIPzO0WtdXrCJUOFbyEZenESdse+t6
	Pbm1PhoDWp34d0xNC3Q4h0qWd8i0ZLhP5lmR/RHuN4vk/3H3agDiwKfypG6kFEm5VS8GUVVd5Vu
	1Fi3WwAbXGqCoH57+m+bCg2GCP3v1Z2dnnIdP8P7b+QDTZxz0D1grQwnQZL9Km8kDOeX4b4++ol
	EPh+dq7H32U+m3fUf5LqCn7Tf/l/Wc8sFFEgLtPHPYlzH0p3rX1kOtUfWYoNqNVPVZJgG876Pkd
	sAQrSg/8mdn4/CRD2GZw1ywloEsEc2u/AL/OI4p6jxx0LA7diXgaS4lLb0rTo1nNMXpLgMggPRM
	uLcRTQYiXl4hSPoQ26zoEi6Ik+dSxVRWP21jWLS3NF/DWQZQpULXqaT03aKF8Uz/stR2pgQlaPn
	OjEZTDi3Fq7DSlmblZZNCFiz+0xx0krP1nF1xnTq/a5dVZydQ=
X-Received: by 2002:a17:903:2447:b0:2c9:97a8:afe7 with SMTP id d9443c01a7336-2ccea3cb09amr29387565ad.42.1783520506198;
        Wed, 08 Jul 2026 07:21:46 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.21.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:21:45 -0700 (PDT)
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
Subject: [PATCH v2 20/27] ASoC: codecs: rt5668: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:27 +0700
Message-ID: <20260708141734.578926-21-phucduc.bui@gmail.com>
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

