Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938E23403F1
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467432; cv=none; b=YUHMUehgax/p/MRTvyxUbAA0E/o2pXQb8DLtsBXCLARgd4U4vX2egAKzjV9NascyFmX+36O0Kh4eGKZTub4c6yHTWuRNc62uZWAuKUFBTJQvBOUdMWPU2O1lU+l08QUC1VnpHlvTnXYnkYCfLhkzo/sD6w8lfOfKpxYKvcxNCo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467432; c=relaxed/simple;
	bh=CR/lpIz867Ge5SfVg0BgnctkBifwpEVSwmWaNcKvrvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CdMbG+r0bQs+TWMnLKjwzLk7wCoRzmWjXFRU4e2VC6rlNogStAILDEBKtHYm4AsUTWC6kC6Mayr4FGbFRBmUwZsffoK+jG5yDa+T5XiuxHIu5sjOaImLpgWO8Q+VQxA53jNsF6aKa/X25JsjjzWOxfeTeq14TZqcXmOJtO3GcfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkMRRr+H; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkMRRr+H"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ce98cb8165so3752185ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467429; x=1786072229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tK2T+D6HuV5arLji/rG4gtI0GorQ1z1dx7hf11H1P5k=;
        b=JkMRRr+HkOHhtlHm2G6Y9zXsRrCuan8og8GGeAe3DcSkpyAGxlVoPcvCEU1yTG9ON6
         ex7UoUDAtuw9LNgf8qt19qNl3HKo8TG5RLtj2IpbwkDanSWaiTZrdHnExPRXb+9z3aoj
         BZTItvA6pgza134/IJIHYl5k6q8UOSpNXwGPzzIgTkkWBa1QYSV8kdsHA5Ku6944iFpy
         wzl6onn5QAfSBAJVzvOmUPBZ1wkOTtHE7g9w4I1BxXjfiFHJWljdcnBz63E+U2KrSynl
         w00vxeJ9A/3ocAn9iIpULw0E8KuuxNMDX/T08N8HpXyD4v5liqtyI7z1iceNnwrODQyK
         P89w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467429; x=1786072229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tK2T+D6HuV5arLji/rG4gtI0GorQ1z1dx7hf11H1P5k=;
        b=Y5noi5PtzSEgNNnOxaKejkDGYC4PlDuepHAKNFIdc8Xi9GQcb/efQXLwra+eFrj7yP
         RywuF49/Sxv4JDfUW5OfN2wuMk8WX1XuOKGMfE++MD5bZeSsT/O9gbxpWb7ftT5L7Es5
         z0IAa6w+MTNPZ12uMTK1ZWIadeNyFKIQGAjDSXJa1a0OdiXiFBFN0uQE964xMY8IQZac
         5LUUaV7Hx15cuzKDFIt8N6CybO64YqGBG3Apt+8uYnxSLk6Hgyl2msnz9DFUgqM3YRnS
         4zEUT/CeRjW9pBUM9hpzsN717a57M6qXQ0TGTtVAyAGPGmSynBe8OKsI+D3QUa9c99Ep
         g2hw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9i0M4Xjjg0bF/XVWmG2UIwl2leeDra0Usvl0yMXoFehjn47cEF+5b9JstRfNEc32xHYA2RAaTQgxEd7hv@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1sA1ArPKEr6Cnjc9qmTXRt43+zzodE+GDlnJalIXdSJsdW55O
	D7w5NKK2F37+CbyP1AuxrEcAODbVUo2pnrRp9B+CChV+ZJBsma1j40Dn
X-Gm-Gg: AR+sD13VXlQR2Mr1D+gvAjj8FRshq9b1tWkZ0Xf1WbXr8OMc3sExm37+uOFYTZlNmh0
	/OZ4uk8HmRAkByURW0sYDv70veWm7S6Rc5NGzXpACOAFxBnQ4Pc5cgTjgCgUyeUzilYWhPem2kq
	jIxxaDxnwAXPo5bMzIGxDsxcA8IN442BypvteVdNh8bXuv1eKS5l4jJmY8Ndtz5OK+lY00UkMMh
	UgBpvfHXOcswy3eXQjJ1mkgKvfFnFurgdv9iLqlrUQeqoim2zQrul5guFIRIeCmyO8+HhyHsIJh
	4OAViImexwjDNXbleZjtNIDS9T2nB6bNk08y84EEilzdPeSN2T1uXyKDvxzo48hdoMsDioX6M8r
	FSG7gzJDwybQAjaMIUTtAMefFmGt67agRO61hXiQ+P+ria+dS1Q6s/GdM7MhBl55VXJdhkacZZY
	PxQq+NKrptt6zUHpD1rvvMj9+XfA9IVfLN1KY6rZajyhMRjv8vlhQb1ohAzTMH1ETDeLQsV9sp1
	q+UH2E3d3ASCwEAtbPgk6hCdA3Yc6dLkvGDkoWAn0Bio11AL11pGRBlo44RtvHEg9aKWIhGDEA3
	HXLq
X-Received: by 2002:a17:903:4b03:b0:2cf:7ea3:7cf1 with SMTP id d9443c01a7336-2d047d1e554mr2198265ad.5.1785467428981;
        Thu, 30 Jul 2026 20:10:28 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:10:28 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>
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
	patches@opensource.cirrus.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v3 05/26] ASoC: codecs: tas2783: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:27 +0700
Message-ID: <20260731030648.8706-6-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260731030648.8706-1-phucduc.bui@gmail.com>
References: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

