Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473793F6610
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145517; cv=none; b=KCWemFYKUORvE7KlrdgmNR80db+ubywOfU/EBew3PZhvf9yl1ez87VQJEjl1hFfVuzhmO9JltCIm7L2m0QbcI8egsIssHU452UMKc6Uf10e5xGjVgyNSHo/3Tw1W5c1XArvLHhwAldA6cZ4Un/gdQFh5mEdOHRG4T6QkfwJrMTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145517; c=relaxed/simple;
	bh=CKw5qVp0UAxXFHVmi6A1hBtILHRnA7jqfl0Ce+E9MyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mP3xaCNcB02+bmV5Wk6m4GFeqiTtbWYu/nEVitw2mGlqYLm06ZxWw7R/JH6W6Ep2DbE0oM1bTMgQgqBWbjhErTBZ0EGV3+a9s2eH7sZ/ARnu0774msHE44D90zXsvhiD47zXKLvRFqCoAXpYBB1e6x/5z5g2Ecp5OCDm5ieBAvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JPJOyfFj; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPJOyfFj"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso1378132a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145515; x=1785750315; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qAzyFPpSfIQT/mu4VH+Ez0r3XAwtLbE/Kf0RdvC9u3A=;
        b=JPJOyfFj9JdOp6+MuZk7rFWTnjOJdOWjh8jhj27YIAzZ4cEMS46sOz5tQICrODd3C4
         Oiq0XuDHCiroSqyM9kdkD1lyIS2690OGE9MWA9yg7wTqNdrIsjEdgW+USuKWfVlxlWRW
         RWK0SgadaxpOyi+ASGM2cPSGKp53h9pMv7X35jXR3QkCos1mZCknOgTtf4fjYMP1DBlq
         6+GEGVFZW2g4cGYS5+3j+k7Zv79M2vm+McqXkOGohmQeQ4mSGrOLqKlECtz2y/wmPtjm
         4f4XcmjzqKhZw5w86KJ/cU7PfN6wQyfzeKXhSvc+/IQSPj8IkDldAcEcj9yEAPjCGBP0
         9s8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145515; x=1785750315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qAzyFPpSfIQT/mu4VH+Ez0r3XAwtLbE/Kf0RdvC9u3A=;
        b=FS0017DiggLxst2QwhBliY5y/8CS4zep46Z0l2o09rYFOWgBaRrR4rIl5K9E17bwpu
         hHnI0O5Tg8ym+8iY+DeAmJgZv5GrWjI3G0L/vg+u0QNvtdINCsS1uN6Kh3wD5AwABZAH
         IpiPd+igrdtSGpaBDAz38+tpx16TUSMcIrk8UnnvnS+XG0WsbvsoJlsdPOjj2ps5QJcH
         2tB6dL2A+Pvc9w6L0J+BtoymVg/VC1njU8ktyjVErq2c3zG4TA4HeXGFYMgE34UC1qGN
         AAruzAjlKL5vBe7qQMxEO24Rnkg/qrFeuq49h53YDY8Y8kvmzTPVv3ym/+j2v9rEdho+
         Nr4A==
X-Forwarded-Encrypted: i=1; AHgh+Rrx1TehmuXp0Ow+5dF+CQdZVnOAN35V/pWjRojqjvLwWHo6cv9svwsS4xLPH8qBJkW9umUnT02XCuuihPUC@vger.kernel.org
X-Gm-Message-State: AOJu0YygnDj78ZP1qWvy+gS8ozAkqMpDn6C1+jOOU6ThO9ysZHPTj/M1
	M2b4M4cfzhWfVCJinLE/Q3z9jXl+Jpg04EMF621dwFsvVYibMdzZSWIb
X-Gm-Gg: AR+sD13KG8CQus1CxOHioAgBcwd0A+8lVQXXlaTrGYKaq9wwqxjB2C+fQsg9lyx5kOY
	DdLjulLBLaGSOsR6wuGYi1fFLSfbyQ1YYgdGLOBzobw58jwkI49700/MnyTIaQxPGPT4SQBXA31
	bWFHEBIyspKasvrtzyUrAAIED+b8FGYUPzggwjGN9NJijJUE3tpNI+Kc5AvbNsDxUPzE4CTvrU9
	/jYEynZJZRZORmbzEgwTzLZKdheb2cf6SLhtTwU89sihHIY7CkZQFyk201MP3eDG98Eyv63CTQZ
	dW4o8hvmBPTNoB0hzddLvATR8AeOpTJmAL/KttTqYLHoA+xmdGfow7vAl4Pa//OMRwJlnkWXboB
	X8V6jTPfeyKp0i6pqm+xvxz4QPinFCNleLvTi+idjAQ6dtpr26bkmqTOacI8wAAgusObSqpfmD8
	2YdHWT5BCt4UxaeHoQ5KL+vKGmPjhLhoPyVNC+3tb5d6sN/+9+4CwpRmPdYSlrQmXCLlzbY/8Ku
	leDPxGr+VaZrICrRupvCg==
X-Received: by 2002:a05:6a21:1b85:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3c67d9b3f8emr7282496637.11.1785145515418;
        Mon, 27 Jul 2026 02:45:15 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:45:15 -0700 (PDT)
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
Subject: [PATCH v2 25/26] ASoC: codecs: wm_adsp: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:45 +0700
Message-ID: <20260727094046.23001-26-phucduc.bui@gmail.com>
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

Changes in v2:
 - Add the missing `guard(mutex)` that was inadvertently omitted.

 sound/soc/codecs/wm_adsp.c | 77 ++++++++++++--------------------------
 1 file changed, 23 insertions(+), 54 deletions(-)

diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index baa75e7ff53b..90c24c4b318e 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -348,7 +348,6 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
 	struct wm_adsp *dsp = snd_soc_component_get_drvdata(component);
-	int ret = 1;
 
 	if (ucontrol->value.enumerated.item[0] == dsp[e->shift_l].fw)
 		return 0;
@@ -356,16 +355,14 @@ int wm_adsp_fw_put(struct snd_kcontrol *kcontrol,
 	if (ucontrol->value.enumerated.item[0] >= WM_ADSP_NUM_FW)
 		return -EINVAL;
 
-	mutex_lock(&dsp[e->shift_l].cs_dsp.pwr_lock);
+	guard(mutex)(&dsp[e->shift_l].cs_dsp.pwr_lock);
 
 	if (dsp[e->shift_l].cs_dsp.booted || !list_empty(&dsp[e->shift_l].compr_list))
-		ret = -EBUSY;
+		return -EBUSY;
 	else
 		dsp[e->shift_l].fw = ucontrol->value.enumerated.item[0];
 
-	mutex_unlock(&dsp[e->shift_l].cs_dsp.pwr_lock);
-
-	return ret;
+	return 1;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_fw_put);
 
@@ -450,15 +447,13 @@ static int wm_coeff_put_acked(struct snd_kcontrol *kctl,
 	if (val == 0)
 		return 0;	/* 0 means no event */
 
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
+	guard(mutex)(&cs_ctl->dsp->pwr_lock);
 
 	if (cs_ctl->enabled)
 		ret = cs_dsp_coeff_write_acked_control(cs_ctl, val);
 	else
 		ret = -EPERM;
 
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
-
 	if (ret < 0)
 		return ret;
 
@@ -486,15 +481,13 @@ static int wm_coeff_tlv_get(struct snd_kcontrol *kctl,
 	struct cs_dsp_coeff_ctl *cs_ctl = ctl->cs_ctl;
 	int ret = 0;
 
-	mutex_lock(&cs_ctl->dsp->pwr_lock);
+	guard(mutex)(&cs_ctl->dsp->pwr_lock);
 
 	ret = cs_dsp_coeff_read_ctrl(cs_ctl, 0, cs_ctl->cache, size);
 
 	if (!ret && copy_to_user(bytes, cs_ctl->cache, size))
 		ret = -EFAULT;
 
-	mutex_unlock(&cs_ctl->dsp->pwr_lock);
-
 	return ret;
 }
 
@@ -694,10 +687,9 @@ int wm_adsp_write_ctl(struct wm_adsp *dsp, const char *name, int type,
 	struct cs_dsp_coeff_ctl *cs_ctl;
 	int ret;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 	cs_ctl = cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg);
 	ret = cs_dsp_coeff_write_ctrl(cs_ctl, 0, buf, len);
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
 
 	if (ret < 0)
 		return ret;
@@ -709,14 +701,10 @@ EXPORT_SYMBOL_GPL(wm_adsp_write_ctl);
 int wm_adsp_read_ctl(struct wm_adsp *dsp, const char *name, int type,
 		     unsigned int alg, void *buf, size_t len)
 {
-	int ret;
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
-	ret = cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
+	return cs_dsp_coeff_read_ctrl(cs_dsp_get_ctl(&dsp->cs_dsp, name, type, alg),
 				     0, buf, len);
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
-	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_read_ctl);
 
@@ -1270,38 +1258,32 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 {
 	struct wm_adsp_compr *compr, *tmp;
 	struct snd_soc_pcm_runtime *rtd = stream->private_data;
-	int ret = 0;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	if (wm_adsp_fw[dsp->fw].num_caps == 0) {
 		adsp_err(dsp, "%s: Firmware does not support compressed API\n",
 			 snd_soc_rtd_to_codec(rtd, 0)->name);
-		ret = -ENXIO;
-		goto out;
+		return -ENXIO;
 	}
 
 	if (wm_adsp_fw[dsp->fw].compr_direction != stream->direction) {
 		adsp_err(dsp, "%s: Firmware does not support stream direction\n",
 			 snd_soc_rtd_to_codec(rtd, 0)->name);
-		ret = -EINVAL;
-		goto out;
+		return -EINVAL;
 	}
 
 	list_for_each_entry(tmp, &dsp->compr_list, list) {
 		if (!strcmp(tmp->name, snd_soc_rtd_to_codec(rtd, 0)->name)) {
 			adsp_err(dsp, "%s: Only a single stream supported per dai\n",
 				 snd_soc_rtd_to_codec(rtd, 0)->name);
-			ret = -EBUSY;
-			goto out;
+			return -EBUSY;
 		}
 	}
 
 	compr = kzalloc_obj(*compr);
-	if (!compr) {
-		ret = -ENOMEM;
-		goto out;
-	}
+	if (!compr)
+		return -ENOMEM;
 
 	compr->dsp = dsp;
 	compr->stream = stream;
@@ -1311,10 +1293,7 @@ int wm_adsp_compr_open(struct wm_adsp *dsp, struct snd_compr_stream *stream)
 
 	stream->runtime->private_data = compr;
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_open);
 
@@ -1324,7 +1303,7 @@ int wm_adsp_compr_free(struct snd_soc_component *component,
 	struct wm_adsp_compr *compr = stream->runtime->private_data;
 	struct wm_adsp *dsp = compr->dsp;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	wm_adsp_compr_detach(compr);
 	list_del(&compr->list);
@@ -1332,8 +1311,6 @@ int wm_adsp_compr_free(struct snd_soc_component *component,
 	kfree(compr->raw_buf);
 	kfree(compr);
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_free);
@@ -1741,7 +1718,7 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 
 	compr_dbg(compr, "Trigger: %d\n", cmd);
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	switch (cmd) {
 	case SNDRV_PCM_TRIGGER_START:
@@ -1777,8 +1754,6 @@ int wm_adsp_compr_trigger(struct snd_soc_component *component,
 		break;
 	}
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_trigger);
@@ -1907,21 +1882,20 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 
 	compr_dbg(compr, "Pointer request\n");
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	buf = compr->buf;
 
 	if (dsp->fatal_error || !buf || buf->error) {
 		snd_compr_stop_error(stream, SNDRV_PCM_STATE_XRUN);
-		ret = -EIO;
-		goto out;
+		return -EIO;
 	}
 
 	if (buf->avail < wm_adsp_compr_frag_words(compr)) {
 		ret = wm_adsp_buffer_update_avail(buf);
 		if (ret < 0) {
 			compr_err(compr, "Error reading avail: %d\n", ret);
-			goto out;
+			return ret;
 		}
 
 		/*
@@ -1934,14 +1908,14 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 				if (buf->error)
 					snd_compr_stop_error(stream,
 							SNDRV_PCM_STATE_XRUN);
-				goto out;
+				return ret;
 			}
 
 			ret = wm_adsp_buffer_reenable_irq(buf);
 			if (ret < 0) {
 				compr_err(compr, "Failed to re-enable buffer IRQ: %d\n",
 					  ret);
-				goto out;
+				return ret;
 			}
 		}
 	}
@@ -1950,9 +1924,6 @@ int wm_adsp_compr_pointer(struct snd_soc_component *component,
 	tstamp->copied_total += buf->avail * CS_DSP_DATA_WORD_SIZE;
 	tstamp->sampling_rate = compr->sample_rate;
 
-out:
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_pointer);
@@ -2063,15 +2034,13 @@ int wm_adsp_compr_copy(struct snd_soc_component *component,
 	struct wm_adsp *dsp = compr->dsp;
 	int ret;
 
-	mutex_lock(&dsp->cs_dsp.pwr_lock);
+	guard(mutex)(&dsp->cs_dsp.pwr_lock);
 
 	if (stream->direction == SND_COMPRESS_CAPTURE)
 		ret = wm_adsp_compr_read(compr, buf, count);
 	else
 		ret = -ENOTSUPP;
 
-	mutex_unlock(&dsp->cs_dsp.pwr_lock);
-
 	return ret;
 }
 EXPORT_SYMBOL_GPL(wm_adsp_compr_copy);
-- 
2.43.0

