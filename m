Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFC2481665
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629701; cv=none; b=dUxnE6bpudIngkrNzN6RpDfH5GOWQfRMMuYJD1aQo1pQOpASCAsBy2wDrJpKvymThqkWIPg70dV3J+vGn+7ID7Xe+QpOqkBVmmbnHz4gf64yPT59mdca9YAjkl+Wlg39kdUxaKLNq+sX4gT95njX4vVY/uGr5d9Ysq2vh5lhsys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629701; c=relaxed/simple;
	bh=FowDvka7morxmU61JfAbx98ngYcmtDC/p0DW+ZHI0sA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ka8TR3xdjGOhHFNy6mCE1xnlzj/BGqk07fXVvNzVeffcYB1+luqomvjDw4HklUmIH43DkFzwWFKODpDv9ar5rC+L0V95rlHFpuapvvVQxvX/11GNGQyt8REURFzSqMQ+gfz6g19C3C5UUD0mKrONk95NhUVGQoJKc54IAfpTEzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZTe6a8E; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZTe6a8E"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cc891373e0so139047715ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629700; x=1785234500; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=NZTe6a8EZ5fGHgm4sY0+gngCBdeL6wfvuIbxFpRm38/J9ORrQ8qJOk83dRrEKja0/4
         Yb6Pwvx3c9yUjiuyZMo1/YUHh8u3PJrEo/pR4purMNlV/q1y3+ukyZV711Q4OLFPZ6pS
         slhRNCmwLR6bDMAixJ4DfLzu8SgBpGPrYsV6MtC5HkugUl9M79UehTa0/TvI9Gn5cLCC
         KqY+B6li7R9Q6SV8OvXtHAiZseqsZG0iHZGh4xTIwKQBJwFuSuhnJXFMBIWXp4TW2H8w
         CFxT0G6L83Fn4WHd80W75vdrvQwohq8A40LBT3ELkTvIj3iFEHSlGEVQ3SKTUBtGqHyR
         OaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629700; x=1785234500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HsskFA4Wkjx/t3Sa3T1ax8m+7J1jxFkrWrIh8Ok9CUA=;
        b=OV2Vd9Vw4BJfaP5gBcDkEWjBe3QkbrcxxCNDiS+xpBi81MkIXhDUzfAO1uv7ElzTBM
         KosiDSVLm2PaqXr2qAEHeM7u+N9TWw7gJETzQcdkFWokXWfd6bsM+S/DB9BSO1/xKHIM
         e3tpj8F3xUOTHQOQggC9pT+pMEb6To1OSzpeAUhJHVTJXDzcKoDWnx3vZBw/DSqVMnhJ
         IzxDdM/8VBxeEkGjcodOS6Uzfv3ev6sKFFaAW6aQK4Ki2/IjWc/OOX60zVQunzzE1QJj
         8jl7vDoGQ6K2tnocNnubuT8OanHDInMv1ntldNTkRuCFOVp65/VE4Lqi9+I2aVeQK9jS
         eTTA==
X-Forwarded-Encrypted: i=1; AHgh+RpcgZH3cG9OKL58IJBSCPWlTDrVQGo/Hjx24Vel2w2A6DRn41+lHVO0aYRWvRVbQvy5bL9CKk5cIQbjHtkn@vger.kernel.org
X-Gm-Message-State: AOJu0YxqXqAk2i1ZptLpkBzxyNsDvq34jR7044bRQyGJbn5SHiXN4YAc
	IVEH+lp6hYZWcMl31qkmUd1fyB1EfR2d8kYNyDrvT2uh5J+ocUxEG3Ma
X-Gm-Gg: AR+sD106q59aEMxauPeJD558dISVN32rVNUO8iWJccuHszNKPCZ7jenIeCv28P4F2xw
	ZNnwXq0YLKv2ERfeKw2cTq0biCK5BQD/EyVSBNi5wKCgph6we1WcF6t8xKhewPGMJfxD4PAlXof
	b8VfQCRahHRQn9s3mw/QNLeLjKLI812guC28mplDkPTEje1OYDfS7VOR0XxD/eaI7feHlKGc95m
	r8ikEZ7dbBZXEK5jWuTswIICHLSmFdSkl21g5dPH148TYv7qaX6TdjEHbjyy56yLtkPkKg5YoAd
	o5/w93hs2Jdtq2RFo2D4SfUSq7mQMERQNZ/9FVFIVPwjfLunT0GhqSf3w3sp1zsS3fbastthdaf
	ZSGD2x+CoQ5LcA325kX9tZYlV+fIuSPqTFCDD8pZVcg2vvBEoFs5UFyz5DC97RttthKRU++T9iZ
	1qZWFPWD/9qB9teblhpeLZi785PbMFQg4m8yIp
X-Received: by 2002:a17:902:e5cb:b0:2cc:9763:e607 with SMTP id d9443c01a7336-2cf349bc5c8mr181903165ad.27.1784629699763;
        Tue, 21 Jul 2026 03:28:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.28.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:28:19 -0700 (PDT)
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
Subject: [PATCH v4 15/29] ASoC: codecs: pcm6240: Use guard() for mutex locks
Date: Tue, 21 Jul 2026 17:25:46 +0700
Message-ID: <20260721102600.523199-16-phucduc.bui@gmail.com>
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

