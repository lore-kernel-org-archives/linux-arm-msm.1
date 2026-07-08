Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8482C47F2FA
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520385; cv=none; b=UQ2JH/fgBxc9c+VMRIfwdTbPrbzTFM/f3ujrBDa1gVuMWOTIGU4S6yv2eFF4ZipQsLsEPPaxamadeNR2/w87Y4GrL7mEayAPz02PzXpQ1ffwltB5pxOS034m/zG+lmTJeobQqTjJbsXYQ8t0oW4W6611eR3RS5+gsEWcEjMURxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520385; c=relaxed/simple;
	bh=fTei+vUEtZNmVemds32xGB8uary3SUfKARXY0HPVp94=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YryfHnM8CIA+ky049UQf0ma0fYZebIpHDogvx9Q9wgPev4HNvcI3/J0SUxynyKBrz5RWLap4hgMF3NinNvZcKvR/WGDGowPgXttGNOqedDbOZmrsPGio6C93Ll4KB3RoatLPBI/UKuyjZUMR6DDDX++bHxQ5qT7wrAlv02nfWrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h85d1HS6; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h85d1HS6"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2c6b67d5fa1so8329405ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520383; x=1784125183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=h85d1HS6eTiscLz0RgtX14dpzfPknjf2KPyty81MarPRrMJIf3gGGdHF8z6HPA7t/N
         cLAQbVxz0tTZIK4034YanajWNFj3hGU+pFfyq33Ldp6keOq6cj/tPFh2HyAyLxjhdi15
         5wBzmCHwaTlKCiB4IOQheDdb6aGLlAMp3GLE0pMvWUqTZaTXxq7OKrs7B5HjfNXsZwzR
         DTaJnUfgzLmOuvo9IWsifiUt/u/R+w68Qw8dxS5rBGTGO1eT2qWrZNbwo8B/47wbNtKS
         +H90sq1owdd2uT2mwmdjIm5Bhcp0uXF7pXt3kmI2lMjsl8cSaQ5hDAlStLHjL6ZSEa9Q
         GhSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520383; x=1784125183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SaBgmvHyCdtOOzTM9Q4PIyXVQ3lhLlNUjuQP2hIqGR0=;
        b=WLwsxdl7mRtdsmHhOSTv39QiK4SjcyuFALqVdIQ/oFQyu84GQ6nxNPRKVeVpeT6Hyt
         fPLL6RC9KigPsf+o+s39nyNo9jNwCZNg8KSz2Ahx1Imrk6W7aUC+tFdtIamtQpWXbAg2
         uvAHYzzJuRUupPqzqYbbS4VL+JQ9NxsBHmoF4snuf2qa/YDUqYtS5rYPSMMjwczEpy7p
         p/Me9PNc7U51KlnQzhtCFKIMrepgr0mFVc4fwMIUbss5eCUGQEUNxip85CsW6k2nlz5w
         VhM6zHBELcSObj7vuekiOYx/RN8t60ldeG0ASS2XMWw6kFUTqrJ6HL2+PoWuYzuQItKN
         djLA==
X-Forwarded-Encrypted: i=1; AHgh+RpO2DfKPmHhpjbQ/Wdi5P8OiElywd/tWPDg1cOtGnRTYzcyBAOvJDNEPC/Ugjys6yleKJ8b40J9vx4CnSsJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxnBzu1qWJuX+XumjVUIyYLndlWKwZv70JSawMiCKbkwrpUZiL8
	gbRkh6uilGFqm96p2gQMFFAc8QfnTY8Pcl5u3hxhETQkyL05X8d8p3NT
X-Gm-Gg: AfdE7ckaZIHlXqkoF9M9l34SUKJ37xxvkPuujgeYWdGnvtUFWRwrhNfa0fUVwTV8+xo
	3zt1LAaT4+SZioRm2BL3i5Q30MvW95A405Z1xnnP5Vkmy2WWJzlVUlnh/Pq2gzsa31TQz55d5Bl
	+E4GEU8ZWf2PID9c0hrlcWEMCc8Ct9AGK0Kc89Z7gUMsbGi8UdEOZWGp5eQc0VqalF/QDw5jYXg
	4Iyf1bw8L1IV1DUhEtjN5zfW36qhezpexaHMMNjD1/QP9Uq8HA78A2B4s4bzhLjKvD2GR3ZM2XU
	n2MpUWkKyaC6DnA9t9KYnMn/lcj9x1u2wqUb7XiNChQfqziPuvbSBiJFcWPH5r74fHdl+ROf3fT
	97apv9ncbMnCtLJtmb8Z6dT6367SyXOkosKjgkAGKKK82vlICKWydYXw/d+DespyI/eAvWaV7Eh
	/Y+M0DpueHVaSFnxLRljSUFp5ucs7FISHXSRlUzgBX5emwwfIlqO7WyNMFpQ==
X-Received: by 2002:a17:90b:57ee:b0:380:a5a9:7586 with SMTP id 98e67ed59e1d1-3893f693819mr3074655a91.6.1783520382800;
        Wed, 08 Jul 2026 07:19:42 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.19.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:19:42 -0700 (PDT)
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
Subject: [PATCH v2 05/27] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Wed,  8 Jul 2026 21:17:12 +0700
Message-ID: <20260708141734.578926-6-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 8db81d574624..8ef9e70a9316 100644
--- a/sound/soc/codecs/es9356.c
+++ b/sound/soc/codecs/es9356.c
@@ -7,6 +7,7 @@
 //
 
 #include <linux/device.h>
+#include <linux/cleanup.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/soundwire/sdw.h>
@@ -501,16 +502,19 @@ static int es9356_power_state(struct snd_soc_dai *dai, unsigned char ps, unsigne
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
@@ -1092,9 +1096,8 @@ static int es9356_sdca_dev_system_suspend(struct device *dev)
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

