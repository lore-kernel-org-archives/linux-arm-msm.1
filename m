Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095A73783A2
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660019; cv=none; b=p+27jd75VxsZ2T3L3hnSZDbXLnN5uqiss+RSAvqI+SQeFw+AGADxGfdpJCO94tJmllHVACDdXCxGcn+SW6DSvTKbv2D6yFM3oxZS47NzB4ptBDVCxJZb2U+eDRshIWHjJGYR8de6M1/3kPdItoLAI28pNz8LMrnQNL6itaEtxH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660019; c=relaxed/simple;
	bh=nILbPuYN5HDdgGpTz+3+vLTQdHEtspoh90a2ct25aWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FxRyX9MnUbCygtVRozAJi0kuUlK1jzT6gLdTGVCB56tSnV5NLycGVwmZhFGNr9VkFvAmUMWZqiLqWgJA8LzdF/ghe5PPW9JNaqzYp24JjmK5Aajwe2uGne491wf2hzTjABpbaWXug4oHCTyUWbXFJFQebK2ZX6uLf9H3mW0nBNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qzZl7c1B; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qzZl7c1B"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8485ef63b68so464891b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660016; x=1784264816; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=qzZl7c1BBH95+b6sa8wYEeki7AIdI5/Rl2idOtiEuLGbm/Hf8C0hon1zDpSMp6BU0q
         Vb7WQjs6MpL4+qJ4hPD5YZuseOvy035FQCpske79RNmIowKiEk1ntpSDLk4EnEuzP8L5
         ReIE5A8urelhm6NLuN8fpdqoTpNWuEI5ffkCqOoRDtMW7/2nIwD4h+9p8SoJ/kU00MQl
         mFn2J25xb41UzhHf14++dFOG6Mcy/WRhcf5AvtoGEEYjOdjqBlp4nvkZQMB6FN3q3IYU
         33DBDbD3P4FsfNMCgoHrnxsfjqlqJ194MwdhuV9ObQ5OM3X5Z4P1iAsoUdJWZl90Uyp3
         KgDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660016; x=1784264816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=ELQWMNfux7W7NTV5Vrjo6LrCbNPFXjZwD/i7zda/hGLVd/JajAsFCv0WC3k82pIoZ6
         R8QQPIYk6H+cZFwFccfgjICs9L+blVuuO3i86axTohwxFFhfAhNYvNRZsly7WAaYYZlt
         EVOhB+B2OrNKA0muYK9/kpPWozS7IQ/96GLGVfEUbzZdLc/D5NbeCaqpOo/ZrtKmj+mA
         f8Wsskdim2rUnmg+qBLDR0DFvAVrKOfVJQhJ+3Kb0Vxq52lUXIBWkIYjWpvaBryNMsrg
         k7HlPki5+Hc5T3k9+wsGPbLMqUTResHTpqHASLiRLvdrlIBbiD/xSOMu8/AjYkPxQPQb
         dlKQ==
X-Forwarded-Encrypted: i=1; AHgh+RqcFUUPoZHaw38ujj+XoVosSpd6ekEcDjnNodCJw4+JNoB0eToPvxLYdmf3HqXB/L7VQdGlqqQzM6kkZ91M@vger.kernel.org
X-Gm-Message-State: AOJu0YxKSN2JR+QtczZEN01attsI8lWma4lVf8RBH1uyRKnfO7ZQ53S2
	TdA2X2bbZ5/Jn20CubZfm8tEWyDsCsCwgMYUNsrboq30tb1Txz/ILp3F
X-Gm-Gg: AfdE7ckJRVmr2reR7JTuuNKtmR14jXo4sBCGz7TDYy3FaDPcTvb/iJdKzS/EKHexPCF
	xfl0SQSPoYdwO0FH3dL6N9phpXta/FuliFHpFJZOWWtbQhTgFkjBypuXan4GWQCKXnoBp3tGtFz
	f56/1RodryBEM3kiNpQOQCyuGtu085G/NctAIdtrmecN48Z2Kf9fNPamgK7/eLgX5aPNflr0mti
	6rMCGggb9JKBJKrjH89ahptKXC7AHKYDynd4ARaLEySfCZ4fR1UbCL+tWu6TdqRQTUCj2/Ua4Ks
	rJIPz/EfDKc9eXpp2jGwqJd6FWPXRa4/urLNdvvzgNErx7ZXYIVtCxcSHCbgjC2MTblLWKE5svx
	gEdmne7IAgRUmEwGT02CN8NvfliwmQmCSU54jiqekKP9h0gHGNUaVjByRto18aHDKdLbtTF1S3P
	tIyP2TJHLsvXc1s+wJ56+ax26BLUa1hWbNuQojYk9TfAc69dc=
X-Received: by 2002:a05:6a00:9487:b0:848:4b27:36a3 with SMTP id d2e1a72fcca58-8484b274223mr7138346b3a.72.1783660016109;
        Thu, 09 Jul 2026 22:06:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:55 -0700 (PDT)
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
Subject: [PATCH v3 13/27] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:57 +0700
Message-ID: <20260710050511.14439-11-phucduc.bui@gmail.com>
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
 sound/soc/codecs/mt6359-accdet.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index ed34cc15b80e..e1190c644021 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -6,6 +6,7 @@
 // Author: Argus Lin <argus.lin@mediatek.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/of.h>
 #include <linux/input.h>
 #include <linux/kthread.h>
@@ -398,14 +399,13 @@ static void mt6359_accdet_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, accdet_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	priv->pre_accdet_status = priv->accdet_status;
 	check_jack_btn_type(priv);
 
 	if (priv->jack_plugged &&
 	    priv->pre_accdet_status != priv->accdet_status)
 		mt6359_accdet_jack_report(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static void mt6359_accdet_jd_work(struct work_struct *work)
@@ -416,7 +416,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 	struct mt6359_accdet *priv =
 		container_of(work, struct mt6359_accdet, jd_work);
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	if (priv->jd_sts == M_PLUG_IN) {
 		priv->jack_plugged = true;
 
@@ -450,7 +450,6 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 
 	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
 		recover_eint_setting(priv);
-	mutex_unlock(&priv->res_lock);
 }
 
 static irqreturn_t mt6359_accdet_irq(int irq, void *data)
@@ -459,7 +458,7 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 	unsigned int irq_val = 0, val = 0, value = 0;
 	int ret;
 
-	mutex_lock(&priv->res_lock);
+	guard(mutex)(&priv->res_lock);
 	regmap_read(priv->regmap, ACCDET_IRQ_ADDR, &irq_val);
 
 	if (irq_val & ACCDET_IRQ_MASK_SFT) {
@@ -474,7 +473,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 					       1000);
 		if (ret) {
 			dev_err(priv->dev, "%s(), ret %d\n", __func__, ret);
-			mutex_unlock(&priv->res_lock);
 			return IRQ_NONE;
 		}
 		regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -498,7 +496,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -521,7 +518,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 			if (ret) {
 				dev_err(priv->dev, "%s(), ret %d\n", __func__,
 					ret);
-				mutex_unlock(&priv->res_lock);
 				return IRQ_NONE;
 			}
 			regmap_update_bits(priv->regmap, ACCDET_IRQ_ADDR,
@@ -540,7 +536,6 @@ static irqreturn_t mt6359_accdet_irq(int irq, void *data)
 
 		queue_work(priv->jd_workqueue, &priv->jd_work);
 	}
-	mutex_unlock(&priv->res_lock);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0

