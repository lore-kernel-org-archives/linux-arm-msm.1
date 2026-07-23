Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D987339CCEF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782563; cv=none; b=qVvcDkdIoNNqe0PhXVCYj+ZnD7sWUZpswunvvKPNbIP+jpYkwNJ4BJpSND4wNupYZO2BdiFw6uJBUVrasZG5MlHhzCdvUAAK3sl/+5/vhSmkWGrk7qZUTgJuRndFTtF6UxtZsvEtSWxnKDjukL79dppZNuzkZek35a4BQtwi7cI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782563; c=relaxed/simple;
	bh=qfYAbMupB0dauUp98L0JPr8A4YLqYtXX8lr09zfUid4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N3fZH2fJCbVh6LYJk5bD2aHedxPX/5ZY6dGOoZw6fKEYMLibEgOrZd66DU+2X6WiXweRHSI7T0UoM9+VgnnsKoXjVU/nI74LDUlkK0tYu7PMJ/9Bt2myLoMHSG+x48R3Ew0H2s6XN9prGiVvlMG9WO28LW3x+BHx0dEmXZ1CGxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GSZdExym; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GSZdExym"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso2465305ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782544; x=1785387344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lOLFIqbE35iIA1xT77FTcDNQ9ZNie7IeZCAAkiIj56o=;
        b=GSZdExymy+6FhHdzvSjiXVp5pCk8wi/y4ja2+lLcDnzEvoX5+SYJdoDXnpgEfOzV5Z
         5U2AESlLzSZ0EhOEic/1fjGEziv1ix8ZsLf0jY9BfdmvuAVYimzIJaIvAFL4/DUXHIJN
         TeN5At0DeSUjNHut4uvPF8ielCNK+Tt0zeUpyfo9CsGiV3pXwOAEDnlo/G01REPrj2JB
         C3qyAu9+MrFuYudarVKdCX8EWgZ6e3ZKTUwwWTupRNeoN8LddKsFysfBX+TQeexydWnA
         qHyQ3nv5VxFb/xZPEKAGdSl+D4YyRmKb2zMmlRa65j8FBnLdK9DwRg8zBFp78gPisb2I
         T0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782544; x=1785387344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lOLFIqbE35iIA1xT77FTcDNQ9ZNie7IeZCAAkiIj56o=;
        b=BcnfdJcc92y59nNQjeZRobTCjTblCZsLqzzx3v+gaQ2Sjmzio58a0C4kSDKZlHUINL
         396b9J0L1FZiV/a/LdhmpFYzbj29CSPNQbr4zd+gsZP9AYcS5MuOfM6evTG76oKUktWD
         b8Vjj3wgom8fHGfoco4ZGWlYdzK6M1lv8egTwSflAlTUpjzcG3AoApib1YrY7l7JJSZM
         z3z2kC2pu6Bq2jjmK/PZLHXVVhUhtg8HPzGXMo1Tv0wp04Yf72YrjtTZzIhO69AOfz8C
         MWnv/tF4uxSKNMsrG+//RvaHQv8OizcMBSRPVfEBfSpRuzWEAN5k2DUXiCR3JqnpiLVg
         fdNg==
X-Forwarded-Encrypted: i=1; AHgh+Rr29mQK0BjdI6Ip5Dq5/PFeTL3o1i5luY2ULfPQiKwUYhwOThh6eREGJApRNmUvVaB8LnpjwRzWcp6hCSMt@vger.kernel.org
X-Gm-Message-State: AOJu0YzxY5BVgCfk2iFm+vM5253DBSpOHOa0ZWx7bdrA8l/b5ZoE0jAT
	+QYWEDMVidNHmXAtuIojXEH8TEeONx9P78ym2nPplgL0xnSMf0pLbsjA
X-Gm-Gg: AR+sD119SQKHlbkmRwiU8TWteNtEk70/jmvuTXQtdksMd78J0y575J+prl2HKrgpG9l
	I1ViP7zpBOONtNHjuuioeJcAAsiSH37XDBWm0j8i1JJAqpFnxLG8JRqIBwE8tFZAJT9JjNsbbeL
	FXaMsgIY8z0GkmYDmFZAmn33aRPxLRKKIg9/dgZQYXknqycz7G8ABlQeYFIGqOeUSVCU7ZS+E4/
	QZUqNhnWNKRZpKet+bCkNVL4XgUv+un18WmrxGIPVrAVYVtPrPaR/Cp/sIeLfTgMAKZKKDTSF8b
	lSrMHlFi9Cvdt7s/Jgb9vQAxS+1x/FQxKeYMnB1bk7i17xHZ19/X2H2BFc/KS28hpXjUt9iJFcE
	vXa6Uhoq7gBaYBZJRWN5j+DxMH6yB9rUTykPXwN8oYNu6JnoZ51tPsgEgSPCpd6YluvkDk+s6+0
	42pUnF/IGQnAxZafoKTWIxEydLnQJKru9oVUnCvtrHx6yRXOk=
X-Received: by 2002:a17:903:3508:b0:2c9:9a19:10c with SMTP id d9443c01a7336-2cfa71adac1mr19834705ad.40.1784782544311;
        Wed, 22 Jul 2026 21:55:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:55:44 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>
Cc: Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	u.kleine-koenig@baylibre.com,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Kees Cook <kees@kernel.org>,
	Chen Ni <nichen@iscas.ac.cn>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 15/26] ASoC: codecs: wcd939x: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:16 +0700
Message-ID: <20260723045327.28260-16-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd939x.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 010d12466722..26fe0b6313cd 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
@@ -1923,7 +1924,6 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	unsigned int micb_reg, cur_vout_ctl, micb_en;
 	int req_vout_ctl;
-	int ret = 0;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1941,7 +1941,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd939x->micb_lock);
+	guard(mutex)(&wcd939x->micb_lock);
 
 	/*
 	 * If requested micbias voltage is same as current micbias
@@ -1957,15 +1957,11 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD939X_MICB_VOUT_CTL);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = req_vout_ctl;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return req_vout_ctl;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	dev_dbg(component->dev, "%s: micb_num: %d, cur_mv: %d, req_mv: %d, micb_en: %d\n",
 		__func__, micb_num, WCD_VOUT_CTL_TO_MICB(cur_vout_ctl),
@@ -1990,9 +1986,7 @@ static int wcd939x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		usleep_range(2000, 2100);
 	}
 
-exit:
-	mutex_unlock(&wcd939x->micb_lock);
-	return ret;
+	return 0;
 }
 
 static int wcd939x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

