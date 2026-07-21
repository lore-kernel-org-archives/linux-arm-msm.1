Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8AD480DF1
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629686; cv=none; b=cMBuYgymCisRdWwVxNxhN3OtD7kXrJbrK0p5pZeHqt5ZGm9h63u4WHLQ8W362OKfcsC7RAeL0aW1VWBsh9ynotYfXInAQlaPZ7xYonovn+GXC733LaHuCr4gSnGyPIjyV+BZb+wHToSHt3RxLkJ2n/LVRX9oxNR0ShgUEdnjoCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629686; c=relaxed/simple;
	bh=nILbPuYN5HDdgGpTz+3+vLTQdHEtspoh90a2ct25aWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mup6lJhKuQEQdPlrYRfP2jKcGRDPUh8RsXFuQge+fQJU1Jh++UPzSWiYnGg6nIy6orxItL5YwiBcxKh5U1MucJrIgdY6N3aLNNQU/pKx4mhaTqZkxWvZGM1y68VmIPb37GqHcNF5Paa5i5qggsTashjevrV7Hd/aICAOWFzUshE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kGAa3yEq; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kGAa3yEq"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cce6a0c9c3so100042745ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:28:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629684; x=1785234484; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=kGAa3yEq3AJSW6MhopbgjGSlNVvDhBP/TFOwgehmsbJBtSc25gAW24mGQifc6jhpQj
         o/HhIlus3GQhC9F4DCa8dguRPDuNe8hFMwvT48hv9Lg16MNwnDPElyTe5D7IYGIe904p
         iYyUo7Ob7sGV4N+3PcMAkkX1eyhqw7uDo5KDhfkf9lc/2UKnvbtuEbBBfpY8oGMZ84CX
         qzmiHA1nIxEMlLMIbwWVXBVzSM3qbpYBu/CRRKzOTYai1Y9N05EUmIvYb92N3AS044Ap
         i5B15IdLAwiZKkigp9+/CQpW1kaTTZDKB1tFDHekY56MArqwxrkNdP5RGYbEtOGhAJxT
         RX7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629684; x=1785234484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E+Xd5j1FUZKxifc/BkYvhS7CfaonB+06ASWIZ0hNhk0=;
        b=h7GTCLPVTxKBiFUpv4PNTwFigNRfJUemdHzIHnBqtYuETIULI9CQkuw5tC3MhLQ40j
         /3Oe6Ogf3/e/ZRvxauNavrvGtsGXx8l9c3lj3Qaev0gHtNAHJOmIjAkCUje4dZMhmMWK
         XZloNx4Gp70kWbzZUoh0q8WOZjHWtWK3oW+Nq8oYK60SHlQ3xKUeZqxUZD7nBPexwP/e
         NdzZaOz5g0UyFf9Og0yrjarYX1l+vM5ucx5lDRVHu6K1Dpx5GGZUPeRZtjfyMX2e/QIL
         jHfPH4Ya7J44o2168ILRa3o8B0ioslsh0vGKuktIP3OqPDBGnJZGpqSFyvZTHnusVzty
         L37w==
X-Forwarded-Encrypted: i=1; AHgh+RqDR4LV/OZ6CyVpdUShMhMkym00fgERV2OPUMQXjS0deyHymUV8gZGbsgfsPrVRl6LHucTlyGTTlgovL3Ua@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8PmWbiG6E2kzIjhdKpRt9RWDLfqN+bXT+3krvvpfNG4z4ZmeQ
	G3LpBF23GKWBm0oMxBPqxPb94rOqMMVaPWqn6FCw9DkaUIC/SqB3Z6bL
X-Gm-Gg: AfdE7cnIxCRvM9bIUZDRFFOPqwgcgboqLCFRRVzpAUr779mp1TUF2iuxZ1+WX7bzMfr
	RpdGHpmy5GNgDHjM9wxVEtT1ayrmWbVcaDdaMjnjJzXQMg1woy8KeWCBczD8WSjaYyVQEs179UE
	ow5zaHO9mI7bbpfWyNdx9z+UOB5lL0lO3uMq14VnseBuNDUXR4uLdB0lIbDI8+Uhy8ufzxqQ+P+
	ALtMh0j2WEvdMeGTSzvI7vqusyKD453BupTuHnrmE3sAD7RSwBxcrHhH0D3JoIHe3nJRizLroNY
	R2oKEUrqEgsPLGbPVU3WHgpsj8bL9Jb372nGy6LhNbR5+sAcilXa41KkiVFLvgK9D12rzfRw5CG
	VbTqn8CbPqQf0z+1v/bwSWZMWjZqo2YG02plBfZzGqz1CszdQMqF7edObxE/liN16BIxxHrKHI7
	oLu++4ZJgfolr81YjGbFMTiulUKE2F97btUYlT
X-Received: by 2002:a17:903:3bcf:b0:2ca:ed41:d33d with SMTP id d9443c01a7336-2cf34a80342mr208350785ad.45.1784629683862;
        Tue, 21 Jul 2026 03:28:03 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.27.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:03 -0700 (PDT)
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
Subject: [PATCH v4 13/29] ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:44 +0700
Message-ID: <20260721102600.523199-14-phucduc.bui@gmail.com>
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

