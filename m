Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DC703783D4
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660052; cv=none; b=VC7fKpZzjec4ucn4BAhR2Q6JY1lby6MFgaC/n6/pvw0+5OSM7iN50AsylUC/aWkX9jEvFsnMbUP7lsnEVgZr4rDrEiRJV79c0DhdRIXaVf5CThJSjs9CgCoxzMkLzoKBbqTXXgJc4EHa4/IX+KZUDme4fZU+GViwLo0OfC/zHSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660052; c=relaxed/simple;
	bh=EIQsPIFGpWU19M+kDklYuiSZWizQeKdwr7QPFIQrZeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LvM8lJmREFTm29qwozrRzxr0G8niycgr8uaAq9i7Psq8rbeK1VKJOldCm34lSCvmfjqu+81N6dGjl5IVwqlxB1etz1s7tQCM3ipzisRUirnBe2EYrN5QHzlgWq2FrmgDZoFYAJrws4tPJD715Sqj0WZ3AhqC/Oxm9G2YJfTJRCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IHQ4mJnV; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IHQ4mJnV"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8454160043aso451298b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:07:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660050; x=1784264850; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=IHQ4mJnV76AIYg0eJVd+IMp5D5PjNzmn8HB2Fsg/6rnGQO3AmDabz/7OGoNVQm+dWu
         0nyLTugZ+ET7DNBVLH1N7ip59kS4DMSW/dZSfgxaGL9/5XRQw9/O0Oq6ZWfvk21Rji3C
         //SRnCC1CW/sEmAtFl5+DEeem1nQ597hxa7upXNoe26ZRlU06FMkirs8FKDIrvr92n5X
         tSCGprWCol8eMu+uHcOx13pDIVqbdiAR/IXwxTf/RFWlPMLu0c4Xx7nS3li2p6/JiEn7
         6CTn5B5Sb/qc1RwinDP2gDzO6JM/UIdloO7z8ofEagySpkD3TqcLiZeucIuGcW8smM54
         x9cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660050; x=1784264850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ro7dNqCD2kLl5dqOgIDoE4tVtLHIEVBSdhnRDBcC1Vc=;
        b=D8DeA3wbsKgLhCWzFfXCa4VteiaBn0fxxJ7U5ENkxDbablbBUFh+wQ5mHjmSjE9Cij
         6a4rX5B5Nck6Gpyhc9J3aFYbJFVzWmvFgihWqk1ReAn0XsyXEdAeP4kNTdbLbRj23zjO
         ZLJydQuIMlfbEYU/t8fuMFThlhhikD9RwQ+PPOFDeB7vqnPX5hhEmg6mbAlsOQHyRAfI
         pacYzJLs3/eZjzh2dGYXVO8mia3lKHgPGO/okjuSsKgkifrMrJhJV2PYY2QX1nx6Bci/
         6+nNflWxCiOl8QT6SWD2nTAdK0pxxxYjejQGHOp9EWyon0lri/+ZJMtmGZ8bndJYtHNn
         nl/g==
X-Forwarded-Encrypted: i=1; AHgh+Ro0/1I1FqbVALaPUoYOzCE4o5iyQUAJiZGBDBJVTagerLwtxfuym7qBvHRtgulxelczHGIZ5rVb3sRjEE2t@vger.kernel.org
X-Gm-Message-State: AOJu0YzhDa4wN2xlwvrC24me4T3HJD2cLJaVsnK+RfxY22t9RhGzBdco
	lA+O/PtcLU2ZITouWzmQTMzbt4MHi7qFgcT9Zyklha4dSS3BBiR5P7c4
X-Gm-Gg: AfdE7clyw/l+EqojJbYqZdl/2H6FOy+o4WmioHkU4apDYwnIUJJ4r4Cfj+azS7Zel+U
	AR1oz+vXxFrWWv9hfULkg2iIAE0tDk2rIqM1/fFjvxOiRXcHizEAn6fn/qQ2UPHK4YPfIE5PMb1
	W+XmUNmwDlkAncE9jCtbsI4KX/IIPdnxyKk20pimLJIIML3nhASe4hymLhfoZWnroueby3xKdX1
	7T7HSRDAhetD5IHyIR2iIDn8ud0FH9ly8xsd2jtYkPsnaSVHclkpKoAQM4rOC/HKuOUlioYF096
	HQVqYVPyhqKPjfeiCHyLOztOoEeU+HnKmGFT0g4Emc7CdQ+nROw+oCvNQMAJncwJJmd9Gpakn1R
	/ehQW0Ir/Lq+d6EJgE+0yd84vzNxausWlqzIFQcLZfXQjrlk+CKTd2PEeZRGxL1RPxsfj06l6wQ
	TpEsyK99ZjZtpWsfaKId+IJJxtfKDzWqq57OnJtmnnFyHGOAM=
X-Received: by 2002:a05:6a00:198f:b0:848:6f63:8d37 with SMTP id d2e1a72fcca58-8486f639411mr2153035b3a.61.1783660049877;
        Thu, 09 Jul 2026 22:07:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:29 -0700 (PDT)
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
Subject: [PATCH v3 17/27] ASoC: codecs: rt5514-spi: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:01 +0700
Message-ID: <20260710050511.14439-15-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt5514-spi.c | 21 ++++++++-------------
 1 file changed, 8 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt5514-spi.c b/sound/soc/codecs/rt5514-spi.c
index 199507d12841..91290bfe8daa 100644
--- a/sound/soc/codecs/rt5514-spi.c
+++ b/sound/soc/codecs/rt5514-spi.c
@@ -6,6 +6,7 @@
  * Author: Oder Chiou <oder_chiou@realtek.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/input.h>
 #include <linux/spi/spi.h>
@@ -79,17 +80,17 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	unsigned int cur_wp, remain_data;
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	if (!rt5514_dsp->substream) {
 		dev_err(rt5514_dsp->dev, "No pcm substream\n");
-		goto done;
+		return;
 	}
 
 	runtime = rt5514_dsp->substream->runtime;
 	period_bytes = snd_pcm_lib_period_bytes(rt5514_dsp->substream);
 	if (!period_bytes) {
 		schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-		goto done;
+		return;
 	}
 
 	if (rt5514_dsp->buf_size % period_bytes)
@@ -111,7 +112,7 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 
 		if (remain_data < period_bytes) {
 			schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-			goto done;
+			return;
 		}
 	}
 
@@ -146,9 +147,6 @@ static void rt5514_spi_copy_work(struct work_struct *work)
 	snd_pcm_period_elapsed(rt5514_dsp->substream);
 
 	schedule_delayed_work(&rt5514_dsp->copy_work, 5);
-
-done:
-	mutex_unlock(&rt5514_dsp->dma_lock);
 }
 
 static void rt5514_schedule_copy(struct rt5514_dsp *rt5514_dsp)
@@ -216,7 +214,7 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 		snd_soc_component_get_drvdata(component);
 	u8 buf[8];
 
-	mutex_lock(&rt5514_dsp->dma_lock);
+	guard(mutex)(&rt5514_dsp->dma_lock);
 	rt5514_dsp->substream = substream;
 	rt5514_dsp->dma_offset = 0;
 
@@ -225,8 +223,6 @@ static int rt5514_spi_hw_params(struct snd_soc_component *component,
 	if (buf[0] & RT5514_IRQ_STATUS_BIT)
 		rt5514_schedule_copy(rt5514_dsp);
 
-	mutex_unlock(&rt5514_dsp->dma_lock);
-
 	return 0;
 }
 
@@ -236,9 +232,8 @@ static int rt5514_spi_hw_free(struct snd_soc_component *component,
 	struct rt5514_dsp *rt5514_dsp =
 		snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&rt5514_dsp->dma_lock);
-	rt5514_dsp->substream = NULL;
-	mutex_unlock(&rt5514_dsp->dma_lock);
+	scoped_guard(mutex, &rt5514_dsp->dma_lock)
+		rt5514_dsp->substream = NULL;
 
 	cancel_delayed_work_sync(&rt5514_dsp->copy_work);
 
-- 
2.43.0

