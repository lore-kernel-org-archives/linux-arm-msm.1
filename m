Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FF4377ECE
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783660043; cv=none; b=HT5+0RtWL0jW9T1UQIq6QF9V2/jG+1uI1Rq9x5ehdmWHQ3SySaA0V0VuVGdxixwlPFjhrtoYq381h4tmh9D06hQ9M13Fm9Y9DYt2c334h43sKgVAScLX/RbQOSKrrau4DBc6OBOcv+zJ8vwPKpxTKj9yYDVMJEtkMPcP8N7yCE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783660043; c=relaxed/simple;
	bh=RgeSX+3zLUlisqOHX9ATQa6nqb4KePBdPHCKtWx23aE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F0lV2duuIjwH9fEvcmJDGF07qIVc37fL+Pv4l2ZYTKo2hpZc0c9ixRLcPqOJcWh02UnyteJKc+Fv/XdOCmxxAjSvgFmrIQl5yaCarWz1FO3eGiuOuo7ew4cjRQ9xYbDwDaixinmVdZrCuDiIJL2pmVZu6PhfXOW5FeMdBqbGtw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MfVLoWH7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MfVLoWH7"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so295412a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783660042; x=1784264842; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=;
        b=MfVLoWH7w0PWOcfMT04OVSGnPQX3gKdkcMNSxoDLjKjbEJq3cqmtXXu0F8frANdOJp
         +cRMePwcxNHHah+2+QnJacVq81+B4U8XMok5itHg5Jc7jneZP4l9I4DuMdoWf42GL5Oh
         ZpRTUSl2EcPNO3bkweVjzaqW/U8a+txqn979KCJ+vCGu8I5KO9E7VUNyZu91QNjy0p7y
         pWhhMXXXEU06Fg6nrhaRZhDPGcAT0fDqCuULHLMoPdlD6g4kiSoU+q2dHqMh931ICLCD
         cuMtF8E1xIELEHiDTh9e+6jo6V+QKL/T4McDxrSSHnVuCNZBv5/xysQX4MrUXXhEpfj5
         Dquw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783660042; x=1784264842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VRsV65B0hpFMO6AbdR2NMUI5aAxqPFZ9WjA2VKMVPRY=;
        b=N1ALBkCdUUEurXLl/qe0g2c/c6wQjsIPC7aWI/J4wloDRrYAz+e6ChvmimZqn5cl1y
         Cv0eCYzNtSClza5ltTaOVb9MtB1HuvQ05XA5V+qd/nHjhJh8CQoXRV0QL0rOQXcvebEK
         08gZGzxMw4orJ9AcSwAoznFYl0k/X+NNAKVXMGj2UNN95Ag/AzT0TaXUy5JFosCL1skx
         yR/Kj0wNRkK0/voq5ayufLN0ItPgwKTiZY5WVHLUrBL/a3ZTHKAmTOe4aWVKjVYd9/O3
         2+eCJg4ynQ5C1hvFT85Gem4A4+MNtugr58Km/sU5SY6M2DTWEtADvZwaPAffvVVLgRWP
         kYSA==
X-Forwarded-Encrypted: i=1; AHgh+Rpqhahpecmy/TAGzbR4MnAcJUJ9qtGu4YiMSr9lB12IhRXxau0cipgTgDO60d8OUtGsAs+o0c0DYxSiL/go@vger.kernel.org
X-Gm-Message-State: AOJu0YxzCbfaf8VQO9eo1dfnoM+WGuU/hUTHIdkqO32Fz6/y+OMnkfW8
	KUVhzZhyGm7WUmyeIELu0UIum5Ys66082l8nwdoCuBl3OLeVFv9cVnDk
X-Gm-Gg: AfdE7cmsULTIsvP75lhY7FnPj364VgeAeElkUa9FTBRYrJb08QZW0zIQij7l2NQw1hS
	ZfZkzYADnptpGsze+0lspwsVayXCiuRWgGjpKkb6/pZewunGTM9p1GFwzjKLBWe4cIwe4CbFaWu
	j/n4KdP5gZbC92P+XGJ+MqlKXTHicPijeKXcUPc9TKSFwJ6SywckbjePppLDPUeKHXxkbvkLAuX
	w3w7JgX86lRrjccYMJmon4NM9J8eDdpIsE1vSIXHT5F4eWeL95ehHMfna/vC7iJRetPSriinIxn
	SGGZUImXAdUuyG9s/NZCmlr6SqOlyxXfaNX3iWV+Rs6qyI3ifYVKq4n/ezOGiF+W4az7niM7EDz
	9jaLD4lKPrZd3pmwPx7U0LTjVukYIg/2BlY+sJclT/EcmlJb//Is05+spULvxDbobGoqM4tuNlR
	bth3y7yV67ryWRasZyt0vr8j16L+qIMemQ9J6YBy/0q++0EfI=
X-Received: by 2002:a05:6a00:3e22:b0:848:5821:9489 with SMTP id d2e1a72fcca58-84858219d60mr6179778b3a.68.1783660041650;
        Thu, 09 Jul 2026 22:07:21 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:07:21 -0700 (PDT)
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
Subject: [PATCH v3 16/27] ASoC: codecs: peb2466: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:05:00 +0700
Message-ID: <20260710050511.14439-14-phucduc.bui@gmail.com>
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

Reviewed-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/peb2466.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/peb2466.c b/sound/soc/codecs/peb2466.c
index 2d71d204d8fa..5a1ed02abb84 100644
--- a/sound/soc/codecs/peb2466.c
+++ b/sound/soc/codecs/peb2466.c
@@ -6,6 +6,7 @@
 //
 // Author: Herve Codina <herve.codina@bootlin.com>
 
+#include <linux/cleanup.h>
 #include <linux/unaligned.h>
 #include <linux/clk.h>
 #include <linux/firmware.h>
@@ -1704,13 +1705,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 	 * So, a specific cache value is used.
 	 */
 
-	mutex_lock(&peb2466->gpio.lock);
+	guard(mutex)(&peb2466->gpio.lock);
 
 	cache = peb2466_chip_gpio_get_cache(peb2466, xr_reg);
-	if (!cache) {
-		ret = -EINVAL;
-		goto end;
-	}
+	if (!cache)
+		return -EINVAL;
 
 	tmp = *cache;
 	tmp &= ~mask;
@@ -1718,14 +1717,11 @@ static int peb2466_chip_gpio_update_bits(struct peb2466 *peb2466, unsigned int x
 
 	ret = regmap_write(peb2466->regmap, xr_reg, tmp);
 	if (ret)
-		goto end;
+		return ret;
 
 	*cache = tmp;
-	ret = 0;
 
-end:
-	mutex_unlock(&peb2466->gpio.lock);
-	return ret;
+	return 0;
 }
 
 static int peb2466_chip_gpio_set(struct gpio_chip *c, unsigned int offset,
-- 
2.43.0

