Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4912C3F7891
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145440; cv=none; b=iuGBhTClmNYszsC0TChnA+ichy1PLOMsk5zlIqevGMG34pqw+7iq08e0aSWLxk4tM1/g7cY2ldTbIqE1stc5QHhwUigi4YEnn1+Lzi+EyUPQeHd3Oyw2h3lb56C3qanPpFAaJ71F3rdA/O8y5XPKm8gOsgFOUcvKyPGpsOTSUhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145440; c=relaxed/simple;
	bh=XnhnsPyA5QSjzg0tuQcdHLbqpbZbFqUdXNayJneipxM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CY4u8EqOHQW569f6Bovc2i/BYTW78XK99ee/nDaLFpkOKY5PAvMdBwZVKHMLchOni3fQMy7ZxmdYY1enI+xyXQuVnygBrYCHhU30TnCmtQ/IRnwCTlNRDUWKNYPA4D1pfv3tii+n46Jh50LYdhNOijKzAb9qZyYP9R50WVqrDzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FWqzn/RX; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FWqzn/RX"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c998fd549a8so1744874a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145438; x=1785750238; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RK1Qg1zMLuqf3deYuh7H14WODBPPcltBb1uxyeY+ius=;
        b=FWqzn/RXAMMjas9QHSwifesFUKhwy2BoFM+dY9RAZsgoWlRaVHcTgidp4LhtsR/qV4
         DeMxaY3MnO4eHzJ2oshtkyQwkcv6zrilCAdbvRN+oRvF1Op3fIFa349Tk7DBrHZoF4av
         HoSUxqWmHRiavtptp2cVfi5eMfUVdhNNHgAQ9B+Bd9LLamPW3v1pxCH52NbrfsqH8PnN
         B7EEKdZyAMdoNShowM+eJ9oHXWFrVRdoEzvdJW+zb//wMAH+jHKfWXPD5ZvLseaIfI1T
         86uzYOcp4EzAgVQxNfObiJBnD9OK8cNSO7ri+hhwynJE5P8QjE2JEX+YNyi2Qjpw+WL2
         ByuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145438; x=1785750238;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RK1Qg1zMLuqf3deYuh7H14WODBPPcltBb1uxyeY+ius=;
        b=OfJWXbhxSYx7PLdpIks4xCUap0LrwzdAMnpONy7VmFd3bVUKX91xr55MRmjTGB4D3b
         tRWpAdcVkgDnITnnXTeIqik0FiXb9hx/mYNBYsw1OhXWfGCTmeSE2Y03mAoNw7JqKUz7
         /+KmPoE5GMV/QP+5M2pEtSIlCBN7qool/D6Jl1x+oy+tFJKbPnmw+nOKfucLJXuXf3AO
         Mcs6v+XO/NX6lRR9T52XC4ZT6EmD/9R6qV+0Fj0xV810Jzc8HS62Epd7BuYofUNSOoEj
         kUVPJ+khU8tffCNL2BXPMZuKa3AqT3SqAaNCz8KWeCHje0x3He2ar9NfcmA2K8MmG2uO
         NeIA==
X-Forwarded-Encrypted: i=1; AHgh+RooOIEZqpuCAPkeH15tyGf6oD9+Ji9mVeNVLitNLvp24cf6pfx4KvABWilRXSzHNsgMgdwqxvP+JrqJEYOC@vger.kernel.org
X-Gm-Message-State: AOJu0YwTdihu8W1iWyrPjNOB/Ogg3Gn6p6pNZB1nnUBGzbGbDMV6mjwk
	oClNn+0puldAm7tXDi103HOih+2SqK/cHKfqNesu+6D3JkyChVjxNsOS
X-Gm-Gg: AR+sD127yXEYegkgRviC1jYuMAykIQRh8NAtUGBuIDaou9wByRwwE2bxPI+MOG+DD2q
	sPjQK90M4TQd6uH+p2Qus5YuvoKPWKBLGrtIpd/RZI22jqtEMuzaWJ/gfmhsP+mNZB5RpGjA/uo
	aL9Dz6CDNtMjoLQJslQhtHNKa4Liy7dePFZVu8Ny1FnFoZXEmjAugp/EBOma0UUGHj80ouGP9gE
	qFeDGNPYPzNng30x6ByufaouMtSERUozQthUnzywhH2CItIWWoK6Vg8nxqgjvi5jKnc+IooFhuB
	eZiJnyhnVuoVT+6PH0aAcCKKU0Hn+ex6U168lUE/7SHrzOmdEKYkoMRC6TciMEB2d/W5kOLxcCE
	5SPJL7GbHGWPOJsE2AaOtet4r4tkMbfP49jwQHpjyhzVxFTUdTGD7n+tzahNcW2mA9RNCTtVY27
	cL0T2XsCiDMXOj4UsddxpzjeLp8aeVuoWyv+rQgi6bWNqBTsNaLZIAYgumBMHmaP62tEh4MscsE
	XQC8gUUmAYtTFsS2XnswA==
X-Received: by 2002:a05:6a20:2589:b0:3c3:b57b:6455 with SMTP id adf61e73a8af0-3c67e0b1e4fmr7444326637.49.1785145438591;
        Mon, 27 Jul 2026 02:43:58 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:58 -0700 (PDT)
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
Subject: [PATCH v2 14/26] ASoC: codecs: wcd938x: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:34 +0700
Message-ID: <20260727094046.23001-15-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wcd938x.c | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index c69e18667a85..9a9ea37ecab3 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
@@ -1976,7 +1977,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 					    int req_volt, int micb_num)
 {
 	struct wcd938x_priv *wcd938x =  snd_soc_component_get_drvdata(component);
-	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en, ret = 0;
+	int cur_vout_ctl, req_vout_ctl, micb_reg, micb_en;
 
 	switch (micb_num) {
 	case MIC_BIAS_1:
@@ -1994,7 +1995,7 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 	default:
 		return -EINVAL;
 	}
-	mutex_lock(&wcd938x->micb_lock);
+	guard(mutex)(&wcd938x->micb_lock);
 	/*
 	 * If requested micbias voltage is same as current micbias
 	 * voltage, then just return. Otherwise, adjust voltage as
@@ -2009,15 +2010,11 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 						    WCD938X_MICB_VOUT_MASK);
 
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
 
 	if (micb_en == WCD938X_MICB_ENABLE)
 		snd_soc_component_write_field(component, micb_reg,
@@ -2038,9 +2035,8 @@ static int wcd938x_mbhc_micb_adjust_voltage(struct snd_soc_component *component,
 		 */
 		usleep_range(2000, 2100);
 	}
-exit:
-	mutex_unlock(&wcd938x->micb_lock);
-	return ret;
+
+	return 0;
 }
 
 static int wcd938x_mbhc_micb_ctrl_threshold_mic(struct snd_soc_component *component,
-- 
2.43.0

