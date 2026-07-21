Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C100480356
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629623; cv=none; b=JcpLLFfAgvg0ZB7JSMTWmAHnXW2uRMSEIYg5TlPbf1EzkmrI8ANr6UUBXRfkG+bb7LnCHuLiNWyqTE8l7KfW5w8Qua0Xvz34SQeGg4Hm0fD40yFBREmjZ+L2CFGvxVV14LapF7sesKfsyQhVmtdsIXKrsiQkAp4XRR/ArnFdUHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629623; c=relaxed/simple;
	bh=Zdr8hLxY9++tkgvmrSBQ/nmGUnRqi1UBxCC3v/LYELg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qiKCuIzwxAa2A9ndO0c9WYXl4utoafc66I009wqt/I09vRfROG1VD3mvBNs/iGhnyAFtxHTpUqYWXCBWB49hF88Wt37QpnTmb3mJA0qvKSGzOdl0caYG50GeS/D3OX/3vc08mi7/WzfLxNqfmd59Kl8Sn436sSIsLiQHjt+bxNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N7R5xvVu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7R5xvVu"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce98cb8165so49944125ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629620; x=1785234420; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzI+xvr6p88cYg+8jImYn6yoqZyRq117x6xc2+j9GZs=;
        b=N7R5xvVunErfhJR0ADvhnNPNEWcXlY2EoRLsk76MmixsliZWyGmI0zCU+FvWEW61Ty
         MRdB/MegMoYKT7g2qRtZNF5uAK72fy7XzAQlsndEUwmA24WtUnMOZ469MJqD0QSAJWF1
         OfRBqFWCoBwVeg6S1SYDJ8baz19YIDbCXRcGElEhZJFefe2e1WpjU/5BpV/WPcADF9PQ
         NRxzvLyInEs7kyCfpsSXqSkBPzcVG+pkmjiLRA/MIanKQO/+8ypWzvD4NZxM+CkmknN+
         /1MobZwbKiGg2NFdKvAXuESylphOOtbry+uXMzF5CtALWmSKbEP0KxcyXa33P3QnJzET
         RAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629620; x=1785234420;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hzI+xvr6p88cYg+8jImYn6yoqZyRq117x6xc2+j9GZs=;
        b=MPmjXHHw0/65/XbBNlcDVjd98MVHvhUxBGg1woOw6J05HzS7UGqqK1/uKb9kUnTh/D
         /URoQecD2bAs735FjRzpQeBaXm9iB8feFgiTNxmgBxhLEXnXC+/6N7+7MSuPydjPGMZ9
         fmL3WNDKN2i2nfsK5edv7xb7od51mXVfNfAotBP1brqnAu0vWki4IE/H16IBzprDL/3X
         vFJlSJruZyT9c0d6jX1MLbMAZcndMVgb0mwf4TF6ak1+Oq29/DoFIVYP051FIhqnxka9
         z4paiaCVX5N2g8hmW/+Qs2EMxasLE2OzJeqxwK+w5lfCodOufVFj0/xVyyp7D8vsk714
         ukwg==
X-Forwarded-Encrypted: i=1; AHgh+RrlNy+6EiyCL9k9YqylcCpzFr6iXygDOOpkZthib98HuLSKUkW8b6aJd6UQap6FIbcv0U0cKLkvKBAQJEBR@vger.kernel.org
X-Gm-Message-State: AOJu0YyO21aaB6z1HWHuPONxZ8sfpJLE894tcE2LpvhaFkui/pC8UoUU
	gTrLfg3vfocFVdIv958WCQbmVoOtDQzfjX5G0mLR2My78dPocev8w09d
X-Gm-Gg: AR+sD11u8u4IY3KWF0Yvew2uBY0lVWxUnqbum52vzIE/NXrVuHQUkq/ubKNA01Rj9Gr
	eBDh+ebrFze0SAPut6Cgkacuh1c0sR2zEioV9O1rWqUpT2b3uk6tb9aKGJh1e0oWPOTGloDAEBR
	shzhN8I1Uq5VFDt0CseLohXCfhDyn9cIro6ubCUGC2eyOqbjPhxEjPDtzIKfB/ZH+7UU5GxYUnL
	TD03fdLOXWnVaqaLp3/KAlhweJoq9pW7ReuUAP31c9o+TkMHO4HMCHsYwiGLEF4jfF/d6KbG/oS
	un+TfW+mYKf8dBZj8J+cq1H+hs4nqZydfF5B2QQZigaATLxkE9widZ+0hXSTWbBwdu4VIlrBFic
	e3Vbz5ji6jo4JZdKWolY/NYJouoACWmxMjbyiW6RPi/hg7b+GuV1gVCqeYGyyH1CXITiZenrdEl
	idjQwFSz+G/lRQGzO23CVlDIR98/GPC0nRUROe
X-Received: by 2002:a17:902:fc43:b0:2cf:41ba:96c2 with SMTP id d9443c01a7336-2cf41bab3cdmr143685015ad.12.1784629620455;
        Tue, 21 Jul 2026 03:27:00 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:27:00 -0700 (PDT)
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
Subject: [PATCH v4 05/29] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:36 +0700
Message-ID: <20260721102600.523199-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index f574b3d6cb3c..a9863900bf70 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -6,6 +6,7 @@
 //
 //
 
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -500,16 +501,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
 	}
 
 	/* power state changes are not independent across functions */
-	mutex_lock(&es9356->pde_lock);
-	ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps0:ps3);
-	if (ret) {
-		regmap_write(es9356->regmap,
-			SDW_SDCA_CTL(func, pde_entity, ES9356_SDCA_CTL_REQ_POWER_STATE, 0), ps?ps3:ps0);
-		es9356_pde_transition_delay(es9356, func, pde_entity, ps?ps3:ps0);
-	} else
-		dev_dbg(component->dev, "%s PDE is already %d\n", __func__, ps?ps0:ps3);
-
-	mutex_unlock(&es9356->pde_lock);
+	scoped_guard(mutex, &es9356->pde_lock) {
+		ret = es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps0 : ps3);
+		if (ret) {
+			regmap_write(es9356->regmap,
+				     SDW_SDCA_CTL(func, pde_entity,
+						  ES9356_SDCA_CTL_REQ_POWER_STATE, 0),
+				     ps ? ps3 : ps0);
+			es9356_pde_transition_delay(es9356, func, pde_entity, ps ? ps3 : ps0);
+		} else {
+			dev_dbg(component->dev, "%s PDE is already %d\n", __func__,
+				ps ? ps0 : ps3);
+		}
+	}
 
 	if (rate)
 		regmap_write(es9356->regmap,
@@ -1091,9 +1095,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
 {
 	struct es9356_sdw_priv *es9356 = dev_get_drvdata(dev);
 
-	mutex_lock(&es9356->disable_irq_lock);
-	es9356->disable_irq = true;
-	mutex_unlock(&es9356->disable_irq_lock);
+	scoped_guard(mutex, &es9356->disable_irq_lock)
+		es9356->disable_irq = true;
 
 	return es9356_sdca_dev_suspend(dev);
 }
-- 
2.43.0

