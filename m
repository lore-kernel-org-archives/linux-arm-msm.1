Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1038323416
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145381; cv=none; b=tw3jQCEiUqiZuRcPD+83OCYknnptBTEPabBZWInyNmd/88+juZcTy5TmYSZghsZcYyRaN/wLUuGmnoXLlH8FO+MR3LxLGlKXe9i6ydF+L9SjYz0uvpO3mAQcvxpa54Sz2sWd8Gbz21gdX6jL3buN1iHEdCvtA9R0NlQ/OapI9D4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145381; c=relaxed/simple;
	bh=CR/lpIz867Ge5SfVg0BgnctkBifwpEVSwmWaNcKvrvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LByirg61OebmlB89VdOR/agw2aHtT7qg++wfEuE1FhRGHhzpLvV8BXQMI+nvn5h1OLYGwXGaJ0Z5Ibihw9fMwhLBP4o4HuabS0qOrZyuJuMtFfoFyNg6EOiCXbtMlr3sHZoSPWWDtwGGsJ1jUjoKadJY3l7phihVG+VdPVt+NUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bSda0Q3q; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bSda0Q3q"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c9e30214d8fso1902515a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145373; x=1785750173; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK2T+D6HuV5arLji/rG4gtI0GorQ1z1dx7hf11H1P5k=;
        b=bSda0Q3qT4RWQcMU1f2socxFPzSoCmRVoHMaQ8Icr2YvA0VWEe+BCd8XMvCJOMY+Xi
         WUfnwQ7qcqvzPGaZxaqDxUwvjjhRmYfDn1Yynvi1PZ8LcF/OMKM3dkNXdioGGcxtjtCU
         xh8oHs8vvSPy35xlc8gsqAXT3rQKDFaK5BYaB838zK3hwJXW7qC32SmMFLkSF64MUw4o
         sdZSjfK5IsTmS/IVoVaEffg29duvi7LdtZO66za+3f4E2yEjZs9Di9kS5ECxa279CCYq
         YNhoQmqyMAqpgLZmgJTiPaNZBg/9o4bz77i51qhjy02mv9aVwV7J7kUXP7dsqLqZ7poR
         xMgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145373; x=1785750173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tK2T+D6HuV5arLji/rG4gtI0GorQ1z1dx7hf11H1P5k=;
        b=FJ07C4HVMsSsb0dQek6hQiPaJZpkQ5fI6532g+gnwyUFRiWarE3PRaZI1woQoe2Nd/
         7gOkEm3IGhZmvPr4aWUQtCBScLtaK+oBOM31Kbly6uWL1V+HZj7YlC/pHIsCQ9pTuImT
         b2VYoBeFGHfOtvcaWQV3TcG0lkWVpRxKreWqhnnAnKB3MNBPBcxO4VchOduyvxwXA389
         jvhggNgCeIwPMQgngb/Syb5hDzWipLr9yGAt1VfhSVWhhUsP69SkW/itwGUZXr473f84
         IaAjVX10az0hlLviWZK4q0qvDj9SRO99vhi67Up3Coyfo6bfjS2muEhweQADb+rrparx
         ikMw==
X-Forwarded-Encrypted: i=1; AHgh+Rq+RrpTHISKXe3DxgX+qhJHuKm9qvBWBoRMOicZ7yj5r2536zbqX9yytS2aGmh+lvotV/2Lsf1mRvNg4sH3@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8PIlM6j7TqUPVuro1YIWOiUNFyQYPMWGIWFAazU2ewg5kvcv+
	UX9YPeQIPqJ4dR/QPaChAMOotzqyvkCpe0tRofVV08B1+TXWOZsOimPe
X-Gm-Gg: AR+sD12nXMZVwvei59+yO/rf94PhlnISu1Rksvlr2oEIDv0S5QwWtjVf/0Hr6vRvB/K
	L1jZLU4+3/YgHW0HdmOZB3j5ujM96pVrG+t/j11NQ0NLMFJELpTQ2yq0pATzkZZ2ClrVc2lDLdd
	eiXFL+B7vZh1jym0ZjXGrBTXyTEzG7zrmONFe0pYn09xhwCqPkKnkg45OWucZ9Q7YtSwnjrPBUN
	nMl0Yh7VXQdzkz9NaSBAdWQOMT9+KVeM+CAVAcsXUM58RNdWestVu2DNDcN3uABOgDBCabUrOUK
	LPyb/iGeBw1uXdwzGONTsQ0l60zYnRSEUvlujzY4Mesf+Y603W/uk8zXqF2vNRmIoh5mryrbViA
	eo7SbXXrUX4NUZ7+i2U02SkpSEDsELUxMMGN69f8d9ho/flXJmNPyPkMfzzXKquh51LQ+fFEf8P
	1ug4sStJmShKddr4+UrXnqoiWESswoHNHAHyEuMSlWbbQlDLRvoQPqazEWgrmXSHExNomCkEi9z
	8KbZaYqzHPAF8COTZkkPQ==
X-Received: by 2002:a05:6a21:2d8a:b0:3c3:a3f4:5485 with SMTP id adf61e73a8af0-3c67d9b1dc7mr7512589637.6.1785145373092;
        Mon, 27 Jul 2026 02:42:53 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:42:52 -0700 (PDT)
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
Subject: [PATCH v2 05/26] ASoC: codecs: tas2783: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:25 +0700
Message-ID: <20260727094046.23001-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260727094046.23001-1-phucduc.bui@gmail.com>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/tas2783-sdw.c | 60 ++++++++++++++++------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/sound/soc/codecs/tas2783-sdw.c b/sound/soc/codecs/tas2783-sdw.c
index db58c50e8a83..8ebed797acb5 100644
--- a/sound/soc/codecs/tas2783-sdw.c
+++ b/sound/soc/codecs/tas2783-sdw.c
@@ -12,6 +12,7 @@
 // Author: Baojun Xu <baojun.xu@ti.com>
 // Author: Kevin Lu <kevin-lu@ti.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/crc32.h>
 #include <linux/efi.h>
@@ -693,12 +694,12 @@ static s32 tas2783_update_calibdata(struct tas2783_prv *tas_dev)
 		return 0;
 	}
 
-	mutex_lock(&tas_dev->calib_lock);
-	ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
-					 tas_dev->cali_data.read_sz);
-	if (!ret)
-		tas2783_set_calib_params_to_device(tas_dev, tmp_val);
-	mutex_unlock(&tas_dev->calib_lock);
+	scoped_guard(mutex, &tas_dev->calib_lock) {
+		ret = tas2783_validate_calibdata(tas_dev, tas_dev->cali_data.data,
+						 tas_dev->cali_data.read_sz);
+		if (!ret)
+			tas2783_set_calib_params_to_device(tas_dev, tmp_val);
+	}
 
 	return ret;
 }
@@ -927,22 +928,23 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 		dev_err(tas_dev->dev,
 			"clear latch failed, err=%d", ret);
 
-	mutex_lock(&tas_dev->pde_lock);
-	/*
-	 * Sometimes, there is error returned during power on.
-	 * So added retry logic to ensure power on so that
-	 * port prepare succeeds
-	 */
-	do {
-		ret = regmap_write(tas_dev->regmap,
-				   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
-						TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
-						TAS2783_SDCA_POW_STATE_ON);
-		if (!ret)
-			break;
-		usleep_range(2000, 2200);
-	} while (retry--);
-	mutex_unlock(&tas_dev->pde_lock);
+	scoped_guard(mutex, &tas_dev->pde_lock) {
+		/*
+		 * Sometimes, there is error returned during power on.
+		 * So added retry logic to ensure power on so that
+		 * port prepare succeeds
+		 */
+		do {
+			ret = regmap_write(tas_dev->regmap,
+					   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+							TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+							TAS2783_SDCA_POW_STATE_ON);
+			if (!ret)
+				break;
+			usleep_range(2000, 2200);
+		} while (retry--);
+	}
+
 	if (ret)
 		return ret;
 
@@ -966,7 +968,6 @@ static s32 tas_sdw_hw_params(struct snd_pcm_substream *substream,
 static s32 tas_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	s32 ret;
 	struct snd_soc_component *component = dai->component;
 	struct tas2783_prv *tas_dev =
 		snd_soc_component_get_drvdata(component);
@@ -975,14 +976,11 @@ static s32 tas_sdw_pcm_hw_free(struct snd_pcm_substream *substream,
 
 	sdw_stream_remove_slave(tas_dev->sdw_peripheral, sdw_stream);
 
-	mutex_lock(&tas_dev->pde_lock);
-	ret = regmap_write(tas_dev->regmap,
-			   SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
-					TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
-			   TAS2783_SDCA_POW_STATE_OFF);
-	mutex_unlock(&tas_dev->pde_lock);
-
-	return ret;
+	guard(mutex)(&tas_dev->pde_lock);
+	return regmap_write(tas_dev->regmap,
+			    SDW_SDCA_CTL(1, TAS2783_SDCA_ENT_PDE23,
+					 TAS2783_SDCA_CTL_REQ_POW_STATE, 0),
+			    TAS2783_SDCA_POW_STATE_OFF);
 }
 
 static const struct snd_soc_dai_ops tas_dai_ops = {
-- 
2.43.0

