Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7046C377EB0
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659949; cv=none; b=C1f6/7NwANlqgfsAYkDZhAzKfREjG+wvVAZuyd2kUASB3/A5Gb0JRqCEo1QzUlNQ6a+OGzm6zxCMRhKZ1MhAflauZuTPgTVHCe+hEMuD/2amuNMnWzspSRnGsx6zJvzxB1+ZGxZtQ/0q/jzHYTt05+fJN2qduj82kz/jxbFx6ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659949; c=relaxed/simple;
	bh=DMKsDEA/ZIxF5GEpayxzlIfB5MXIyLkafokDAY1NpI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NLmJYT+jEyBfaACPqcXO0u9RcrFhcqf7QC0FjBT1Fhn3mz4OG2wngASEit4iEe0J2ivpb/y1oI/DFBIKubLjXKKNoMWVvRNUtgrOoFLeATDx9+tPLBjrtv9UN0qCAEdCLDvxmRpVIcUG+2DNzq+FQk1mArgAIdUS03UoI5TgQII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WDFS6FUd; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WDFS6FUd"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-8485bd28dd0so481337b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659948; x=1784264748; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NfvB0lMuldB+u0jwzr6lQv/Vg3HM48QxhaQsc6Uk5yE=;
        b=WDFS6FUdoUER1EoCRJI+W7b3dIgsaOIfsrtzfNENWtvr5hX6lw9ouqi99lgVRu2TG7
         byQAorTApoQLXnMSKUmbVt5H+p779JeYuneTkUGp3ZM0fjtEokwlRhYxrhhIlwCqQ9qp
         dziuKI61g1GYG3DLkW5ISvZs8f/QJHdwiu5rbm0SgrdifLzfrTzvUfO7JGxwuR1bmP6a
         iuYFQfQyy1PEeTeBXNmiNho2mljMGU4Ao6Vc9Zuj+grmG/eIyGZCmMiayseOBmDUURu3
         skbcVyB2DKHnMD2bp6VLgd1ZVtwPcmUho0hOPIfU0RsPRbMc8uMhXluRLpZvfp7IpiQa
         5EWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659948; x=1784264748;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NfvB0lMuldB+u0jwzr6lQv/Vg3HM48QxhaQsc6Uk5yE=;
        b=S/OPbGAZik5dVIAnj1BmpU/IJo8OzC1++aOr2zZZ9tcfQtIm86hPHhP/F7GKBcE0XX
         /p5ga1AA/7JAYHxHsrjA3N3NxR/+fGPHVrsQfkEwUQI2gp0IeDQvcBiGSPIPHZqjp2Uv
         q/qYDq4XApNmM9tMnK0pKfmOOrxyeFXglhk4FpyamYZvvpHssx5qOqFE90PQg2Hdq0KY
         q00aJNiLnFS9t82Hpo54oSnfQ3qNRcqCapEtUp/LcJ4znM6Xct4DmgGNnC3iiY5aO1+9
         FiFwE0aVBJTz7m4TYb+DktcT5NfcwvjtqL4NU7fmCXa6/IQ+kL4EoYfNSUE8UnXwYC8U
         5NXg==
X-Forwarded-Encrypted: i=1; AHgh+RoUVA01koQvMq/6liJA12rnS4l0soT0wzjFjptLim/pE8Tlb/fFFOQtpqsUE5IXJoH4J36OEdSL7GXzX2DV@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+sK/FGALuWFMXQOoUCmUNdN86ef+Bdg/VRDEbJgfSWyGUnaPK
	RgUxeqQC+iLe+oFFAUuwnaDK/uYLoCSRqd8STNJNacGU+hTBeqKparcm
X-Gm-Gg: AfdE7cn23Uj7ARR+26KI/+qHIMIxq2lM+N4YXNtOuBlaWuJmA7URR0dymS/plMSy0i+
	f0IV3wsYzeVEOb26GhkStpWgTwMNWaYIokEAp0V+hDWlIzVzCW+JouX2jFLg1hiym2/jItNSadj
	OS4Se/IFX1EyLpl9j+qX1eLIw9MazCukWltit/CkOOmSTW976GnsGICjSEi4JONW7UfQ/8fOQ+K
	McK1iuL8/GvqNSqYg1hf3ESu6+jU48CmIjvv6wlKFo/4P6Zwm1inGL2mgXBOb58fzjMlZsuCOor
	f8RAIdf/shy6UDmF0Exh+F7Z1YWHIduIqVCNBViil9YYk6zR4bZnfnOj7qSHbDnYyt4eDNEZqIP
	IrombcMnnkf0Py4pSyh62nmigvMoHAs1Sk97FMJTIbNyt4NafBfZsGUnOamUPcevmHSoBbJ82oQ
	AMPpVqbrtnAFcPrF14sTq6pKF8qAg/Qxx2ShzLgARF3AoDwY8=
X-Received: by 2002:a05:6a00:2384:b0:848:7071:9856 with SMTP id d2e1a72fcca58-84870719ad7mr2037063b3a.61.1783659947725;
        Thu, 09 Jul 2026 22:05:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:05:47 -0700 (PDT)
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
Subject: [PATCH v3 05/27] ASoC: codecs: es9356: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:49 +0700
Message-ID: <20260710050511.14439-3-phucduc.bui@gmail.com>
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
 sound/soc/codecs/es9356.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/es9356.c b/sound/soc/codecs/es9356.c
index 1122455aab77..8c61c4bd49ed 100644
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

