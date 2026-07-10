Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB8126A1C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660035; cv=none; b=MuywAj+ofU/X9XiY3Ue+RwEeEXkKbUrLTpxQGj1zvV3s1i4OHrWilM7mnt1DAH+tLOFuMq7D4/qeVM2jCrLsMSoHFP+j1CE2EnXbQeovdTvttSYTSo6npU+356tvML8/0QLmJAMRl45js70+3sG6h3uxo3+8uZ1+0UKjJNA8ZWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660035; c=relaxed/simple;
	bh=FowDvka7morxmU61JfAbx98ngYcmtDC/p0DW+ZHI0sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcFPqIdJzMU2u1PU5nn65NSSGBcfSNpsztngyYOTK3GFrLkLDfUsarM+qjz0cfR/Z8PK/C7iMKzp6saCSesxMcXKgcZGGDIzvcEeHFzgETko+P9NapmaS++kegPeGN2C3MXZKxfs/mLAksy0OV5gOlakJdMCqd2s3XoV/8N1nn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmP9vrbI; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmP9vrbI"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8423f236418so308173b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660033; x=1784264833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=KmP9vrbIKAyOU/nx53BDWcnJY6GiZLmxPoWr/sSvPj4hid+xrul/vN/UgMOnQC+pI6
         dSkmwVETu2klWvrXr3wMB8e2OTuaeyP51nepqS/SvDLtrrlu74k7f68T8simG3fpDlJz
         OyeANrUTCdAGx5spViNq1BK2ou0yzfOqRPCG94J1axWGO0zFcJtLTXloRgh76Ky+FGlB
         b3KYvw1toQBfZvdtrke8l9OkKMzKDPjexS11mOtihpNq4tpP0TcH9MOj2bz9h7UR0ggK
         09cl/BjJFHAsyCBG/+CA0OrjdvGRxPV/hoiD+6CM/32fgNd0SlCreqQbsf6Jvdjn0QRq
         7ZMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660033; x=1784264833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=HvLhG5SN10CWqYKHMKE70H780OiZzFjxNUfhkvEh79m7yK8ViMU4Y8JNwFItZt0BsB
         mnGirzykC8lRqJ1cW1H9FHapjyLKjKoCAcf+JzupID2owLknKc9IGb9rPjb9STIRxkDm
         zT0YiFYUnxD3lBqRfAo9iyWa3oJB/NefYkwqrSbh0Yu5ljT25WR8GhXaqLa1ChJ8mcmY
         9R+nuOwuPyJh+BrtstbFIUgTWf0LIg85okYMmtanJNHAo1T9sRRId0UWsl60ONK+EfhO
         OVG6ZXBITtubIYDHUiWzUIoChtlwO0VgBeZcrV+WbHf6idaBiV0bEVYGjLptEAiKG5mW
         WwWg==
X-Forwarded-Encrypted: i=1; AHgh+RpExmMF7O/Nhhf7jVSX4WvsvUNgqlBC0uR4nIRwJj1bQpuegPFdn/IYp8azBZLGlcMJVN0W6XiX/ELsussw@vger.kernel.org
X-Gm-Message-State: AOJu0Yx//i4d6ZjUGZuOkip7iSxbKAmPFFsVQtHr7regHsAY5c66/Khg
	Ora857Qh6ILE1MvR+TV5dWY61yBw2E1/9fEcgttkXAwmYkiMoaXaiBe3
X-Gm-Gg: AfdE7cnrwisvjOQcAdAoEWk2n1HJz+LWhqFYvqjEC4MDq1yHQeKLNdcf6fKFEOyNthC
	VOLKPdM36+ZTgbq6EBOc6BIRPk9YKUzLEkhQfVVw4Sl8nEgUuFDl5V6suFvuwNdKpuf+ws91hzm
	0cOLZdACNtRGuBp5puV9R3qluU3M6ek81qO8pEt36cFcj4Ib9FJoh+vBg+chkS/F/N4FjyE4MDA
	MEC2GV2V0zqsRUE3efULzIbn2+amGsgy9rTs1AicGlVjrfubvc5x8AVNEXvIkvYqjkUCWaC8I3Y
	xStmtLo8NPYzMvFcbqGquWMND3yJ/U2lccyhdS4OwdqdJ0OTX6k7rYkbHppJQ6zkiI3HLOZ4+Sg
	X4npqOdD8QMVkYhSzYAmWOHupdZ05JgZ8Aobbn/sQ74GlOXhzUsFdU+I+Hmwe0jlHcyOLGeBZAQ
	BQQODwiOY+9BMHIsY86W7yrFarYOe9BlSdRa+xhxNeedJifAM=
X-Received: by 2002:a05:6a00:348a:b0:848:2f74:1d5d with SMTP id d2e1a72fcca58-848438a7e5fmr9480496b3a.67.1783660033363;
        Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:13 -0700 (PDT)
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
Subject: [PATCH v3 15/27] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:59 +0700
Message-ID: <20260710050511.14439-13-phucduc.bui@gmail.com>
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
 sound/soc/codecs/pcm6240.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/pcm6240.c b/sound/soc/codecs/pcm6240.c
index 4ac4448ac3c8..a2b66eae6ac4 100644
--- a/sound/soc/codecs/pcm6240.c
+++ b/sound/soc/codecs/pcm6240.c
@@ -12,6 +12,7 @@
 // Author: Shenghao Ding <shenghao-ding@ti.com>
 //
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/firmware.h>
 #include <linux/gpio/consumer.h>
@@ -605,7 +606,7 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int reg = mc->reg;
 	unsigned int val;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 
 	if (pcm_dev->chip_id == PCM1690) {
 		ret = pcmdev_dev_read(pcm_dev, dev_no, PCM1690_REG_MODE_CTRL,
@@ -613,18 +614,18 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 		if (ret) {
 			dev_err(pcm_dev->dev, "%s: read mode err=%d\n",
 				__func__, ret);
-			goto out;
+			return ret;
 		}
 		val &= PCM1690_REG_MODE_CTRL_DAMS_MSK;
 		/* Set to wide-range mode, before using vol ctrl. */
 		if (!val && vol_ctrl_type == PCMDEV_PCM1690_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -25500;
-			goto out;
+			return ret;
 		}
 		/* Set to fine mode, before using fine vol ctrl. */
 		if (val && vol_ctrl_type == PCMDEV_PCM1690_FINE_VOL_CTRL) {
 			ucontrol->value.integer.value[0] = -12750;
-			goto out;
+			return ret;
 		}
 	}
 
@@ -632,15 +633,14 @@ static int pcmdev_get_volsw(struct snd_kcontrol *kcontrol,
 	if (ret) {
 		dev_err(pcm_dev->dev, "%s: read err=%d\n",
 			__func__, ret);
-		goto out;
+		return ret;
 	}
 
 	val = (val >> shift) & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
 	ucontrol->value.integer.value[0] = val;
-out:
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return ret;
 }
 
@@ -678,7 +678,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int val, val_mask;
 	unsigned int reg = mc->reg;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	val = ucontrol->value.integer.value[0] & mask;
 	val = (val > max) ? max : val;
 	val = mc->invert ? max - val : val;
@@ -702,7 +702,7 @@ static int pcmdev_put_volsw(struct snd_kcontrol *kcontrol,
 			__func__, rc);
 	else
 		rc = 1;
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return rc;
 }
 
@@ -1645,9 +1645,8 @@ static void pcmdevice_comp_remove(struct snd_soc_component *codec)
 
 	if (!pcm_dev)
 		return;
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_config_info_remove(pcm_dev);
-	mutex_unlock(&pcm_dev->codec_lock);
 }
 
 static const struct snd_soc_dapm_widget pcmdevice_dapm_widgets[] = {
@@ -1890,9 +1889,9 @@ static int pcmdevice_mute(struct snd_soc_dai *dai, int mute, int stream)
 	else
 		block_type = PCMDEVICE_BIN_BLK_PRE_POWER_UP;
 
-	mutex_lock(&pcm_dev->codec_lock);
+	guard(mutex)(&pcm_dev->codec_lock);
 	pcmdevice_select_cfg_blk(pcm_dev, pcm_dev->cur_conf, block_type);
-	mutex_unlock(&pcm_dev->codec_lock);
+
 	return 0;
 }
 
-- 
2.43.0

