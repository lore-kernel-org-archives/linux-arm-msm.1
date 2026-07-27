Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B273F12EC
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145426; cv=none; b=dAb28VaI0qS6ecptkPk/CbK7YoGbr9lXJKB7GCOEvLavIFXuRIkmL4Nvk0Iz80UyHA4OIc/JAVEUtuUYsv3LdvuIBhWPVrxFjLeTqU6RlC+V0IK9pTxW8eXtIIbNpjFGYRrb4DqwiAeeHP9hEecxWygD0qdwqhvOgOgo8gnJ5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145426; c=relaxed/simple;
	bh=j5EzUp9GOmwEDgm+25/nvJ3ZrhLORshzsn3d8vYHp/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRtHPaqUDJ+ZdzJQ3PYhhbSpjinGtK3pBIQb2IuG2K+r++/f7kxfCUh2tLqzr12ij0OmmW4r4Bq7hlQHRGgStPL8/JKhWlNqhDe1af8/70g2W/xEzQe9l7wUyL65BH9Ki8uKc8ch0MzdRJQRc2rN+I/TswAzpBpr4FhlMgPiQhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gA1Ly4o2; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gA1Ly4o2"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-ca957432c7fso1774805a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145424; x=1785750224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdWonKZwUM9E97TXsH6QIsXcmSxW8h25KlrkA4nBf18=;
        b=gA1Ly4o2Tdk1PU6jUzzMyfKuZ1uI5rdVmz1JVMRwO0xEca/YbR25Lfkp39Fc2YG/8m
         mQj18hUcFM89HIta+CPUOrbVpupOGngyOIZrRFxkZzFXivrYaAXFENW7FSiXOEYruCt8
         N44vu3u7Ys83JZYir8w7v2hSYa6xgCr+vlKo4a3qVAN2FNZOU9sKx8oCCPc30w/XPcAw
         rnKTosiNuyWmThaZ7veJjNHbp7QwqlOsf91K3An0HxjQChHr9Hco2sAZDJTgIu8pFZMw
         6jKn+Avx8qq8Q1YFrWktZM0V3ulXO8qBviq529dk5dRjyXFx6LTEBRgDeMiHrqP4sdIh
         MEyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145424; x=1785750224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gdWonKZwUM9E97TXsH6QIsXcmSxW8h25KlrkA4nBf18=;
        b=jIMDuIRlX58SRqvj1xM/+fWJ7yb4FA/WFhjKvJY1IijJDL6Znv+Gc+QbyNGD2fsQJG
         3hFKkdbLy/7cUvH1iqz391FBYci3WtVNnPIkea1DRFIR3f5gxuPOTEKF9zTpGqaHE8WH
         xOAaN3od0tZFHbAjp7Dz/tBX3As0IUWRJWrbfIunIuwFsxio2c5nq98tF4eTmnYj57Y/
         0WwWotE1WeuMkYesNjVrRiGeMefoJiJWte3IhxY9AXPJuG+HVnBYENXN9aI6nc4A2DMP
         VpiztQmEjQU9ARpc9hgVWIR28G7BPncJNcaOaGV1o9WhSLz8YTQ9lHnIt8Ekf4Q1LfiH
         jFDQ==
X-Forwarded-Encrypted: i=1; AHgh+Roul8XyUqavd95KPjTBxIMQ8Dtl3/Xq2znfu+ZPKNZCAhqBtCjzWW5bosOr9iUxjU9abGg3D/XlrFZJDcql@vger.kernel.org
X-Gm-Message-State: AOJu0YzlUB72mk3wsqGeNyqAFXCmKjLrKehSllbLyxtSJ1cxdpHP7X/p
	cJ0lNT0E9VVSAbEpadz3nNHXyRRlTHf5Op2k3W/azyxlzpaPXkL8uqar
X-Gm-Gg: AR+sD138ogszcDmGPIy/DMc5g1DMZRBQGUYLxlr/4ehWuok0sgVoLbDcN+9bOtJfHwQ
	1D8m8IASCTvJ6Jy982cBOlDSSQ9dcS0sIIp09pJHkqsrV81OvPXFEvILdvnunateXcPEKBfSLOQ
	9Iw9APRzFrPFMXBbfY6n4T5Tvr32ErI6NCJyN9HDMQ99+KFp+F0IOhs8Bbv08+QVY1jYruGHLMp
	2g/YEHtjWdKejx4axgTTNMfbBWm1c6u0DOjCd/qojPaUY9zSF3lYl8EH24lW4WnIjj4x8e09EzS
	f5KkRZRhFflpJORedNHEaoHOq0chmlTjftbjuNmOuYdsn161zE0gUt/DhlCYss/0VrTFdrZhRni
	9zLuvvLSuaOU5NefHTF+LBmHWgQgT3lktMLGtl0DEz4qyBXuLyBjjAnflCPJuNrmGqCacGysYcH
	Df6DLPdS1idorpqAtOjVhPaCbVbJN3Mjw01ga1t3oGSvfsVCx+A1/LdBG1EboGe/BlW8FpylclS
	zNmSjN/qe8fOEy8y3ulRg==
X-Received: by 2002:a05:6a21:7a8c:b0:3bf:a0e5:99a5 with SMTP id adf61e73a8af0-3c67e072571mr7606700637.47.1785145424179;
        Mon, 27 Jul 2026 02:43:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:43 -0700 (PDT)
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
Subject: [PATCH v2 12/26] ASoC: codecs: wcd934x: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:32 +0700
Message-ID: <20260727094046.23001-13-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd934x.c | 42 ++++++++++++++------------------------
 1 file changed, 15 insertions(+), 27 deletions(-)

diff --git a/sound/soc/codecs/wcd934x.c b/sound/soc/codecs/wcd934x.c
index bc41a1466c70..11108c37648f 100644
--- a/sound/soc/codecs/wcd934x.c
+++ b/sound/soc/codecs/wcd934x.c
@@ -1265,13 +1265,10 @@ static int wcd934x_set_sido_input_src(struct wcd934x_codec *wcd, int sido_src)
 
 static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-
-	if (++wcd->sysclk_users != 1) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (++wcd->sysclk_users != 1)
+			return 0;
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_ANA_BIAS,
 			   WCD934X_ANA_BIAS_EN_MASK,
@@ -1328,12 +1325,10 @@ static int wcd934x_enable_ana_bias_and_sysclk(struct wcd934x_codec *wcd)
 
 static int wcd934x_disable_ana_bias_and_syclk(struct wcd934x_codec *wcd)
 {
-	mutex_lock(&wcd->sysclk_mutex);
-	if (--wcd->sysclk_users != 0) {
-		mutex_unlock(&wcd->sysclk_mutex);
-		return 0;
+	scoped_guard(mutex, &wcd->sysclk_mutex) {
+		if (--wcd->sysclk_users != 0)
+			return 0;
 	}
-	mutex_unlock(&wcd->sysclk_mutex);
 
 	regmap_update_bits(wcd->regmap, WCD934X_CLK_SYS_MCLK_PRG,
 			   WCD934X_EXT_CLK_BUF_EN_MASK |
@@ -2384,7 +2379,7 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 			__func__, micb_num);
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 
 	switch (req) {
 	case MICB_PULLUP_ENABLE:
@@ -2446,8 +2441,6 @@ static int wcd934x_micbias_control(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&wcd934x->micb_lock);
-
 	return 0;
 }
 
@@ -2488,7 +2481,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd934x_codec *wcd934x = snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -2506,7 +2499,7 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd934x->micb_lock);
+	guard(mutex)(&wcd934x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2521,15 +2514,11 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD934X_MICB_VAL_MASK);
 
 	req_vout_ctl = wcd_get_micb_vout_ctl_val(component->dev, req_volt);
-	if (req_vout_ctl < 0) {
-		ret = -EINVAL;
-		goto exit;
-	}
+	if (req_vout_ctl < 0)
+		return -EINVAL;
 
-	if (cur_vout_ctl == req_vout_ctl) {
-		ret = 0;
-		goto exit;
-	}
+	if (cur_vout_ctl == req_vout_ctl)
+		return 0;
 
 	if (micb_en == WCD934X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2550,9 +2539,8 @@ static int wcd934x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd934x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd934x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

