Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D22D377020
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 05:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783659992; cv=none; b=nwHj/2gEVWUujJDcYQWwYdhSHcM6ZNUbYh53JLMbFZD1zymyE+b9A7F+iWAv1IjZj6YmXara12anFp+VhgUq5rYVgL1/0h+Oo1BSOe4iis6lYkzuNhFoGsM6REaJe3a2x5X7dqjWtKAtK7mNLLHxkhVw2xpac43PwkoMLWaT+1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783659992; c=relaxed/simple;
	bh=PpZ4kh5MjGhEnrnoDkU1ccKIH7udPBUPKAQWqZafq5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f7eqp/iuvlOepT1A2dE9mCv/3AKxUBONKCSt+nt2BLZBkFA/iB5Enxnem354XOyEaZlX94mw2Wi5iEoXYQyBsOsSiBX8WBlP5bDGMdo+81TcDkig7ZPwIupZEMgW0Iwurcg9mUeuvNiedYGrr26CmQymW1FqCDvqNSFgdfSMbyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Syd+2p9y; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Syd+2p9y"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8487088510aso518567b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 22:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783659991; x=1784264791; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=Syd+2p9y2w9st5EJNQ+SXa+UNEoB0vAY49+q0PggydBYEuA0j52cq7hyIfn7lJwmsc
         OxrhNhMPuCWp3PiGKs3s1rWVd7TSirOoLB3WvZCUhxuzU0A/2KN+0B7J1cB0fqY+rc9B
         xIZ+43IFGUWPBbtC9TFAilxP2qJcGp6OGP7P1HTrWFMJWlu2T7bOEXk+/9AxnEt4Afzi
         aguFutypQ+vpIiuSkhEoym4FN3cdWp6WEKE/2Ts7bXc4L0+cTlHamPR9Auo6BXSdMUoF
         kQh1LqTr4J/e6+luS7JtC9eidDMMb8dTYjGXpNtn071OX8C8+scNvszz5Hbee23m1yrp
         AfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783659991; x=1784264791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q0zTLvIrZQkcOcFOJ5UF+kPqAbo28ZpFPiBP3Cw88G8=;
        b=lSXtLIG5Q8Q1FWa3saM/OCQJv1WN6U3QCzyR26QFN/b2AnreNWNIPJAAgZZNGhBzRO
         OqFOPM4qZVNH22yRRxaA5XLYdnLJRu7954NXZrXkNSpWoTM4aLw6+zF/Si8ltLNA2g+B
         iy+SpfHdl/Q48ObNXNmNHM1OLPj8BgRztn4mtvjVuYZ9Jqhxhf0dlV96TrRCgVoY9B1p
         RajcdX2p81CD1ErKplkePosKri6xfh7rrWjipGUIBHTzdFLHOOp+KiB5SmQWhp5TSYRh
         RwKh3ITFG7wuB/Kl5ImKsByOUTk9Mdh1AmkC1NqB+fgrZPaQZnp2Jz4oCnqklu8YC3/F
         084Q==
X-Forwarded-Encrypted: i=1; AHgh+RrS95hM58/GU09cFHrIlFeUPQXaulqzw+KsIpP9y15I7LCpOcm3ejvkmE+C1GCtEXCxG8AlGdNHjmlv6u82@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvjq31ZrLgYh+6khBmcNdYNJ7VQtY0IvR5nuGUOC183x1jOMWe
	G1EY/a5D1P58WDq743nqGa+2R/nSeBv31fb+ni/anFPJidOy5ppwrq9Q
X-Gm-Gg: AfdE7cn4yD/aizazn3NMSATD5j0fVJ2OBoOTLFh6Ku4c3MJovT5SVxHayefwoJL0PkZ
	awJJ1mqFjhG9mm5L+bAFUOVCc11bbPh2/0UwTmtxgml4ElxTMXZ241plRH+yZcoki/93k5Fk5pV
	LtUVHV7ENgT7g8liqQttI3JdZ6h3sQOn7frKm940Ntvn3sqF4E7ywWntF7kf++Cv133w2R8suUv
	x+3US9swx44AQzmUZaCzR5A9ckgfUdC2h9wXaKGvvZWVNsxlcve95/Bob2MwEgH2HtFOUAji8pX
	37MKXKAWrt4TO3s/Oe32AhZSQf8PlJI25DbkkoEmllsmHIcvgt3URf9IDL3h/jyNyZY5LGbp6kJ
	wYCHqEY5em01oesq8hKe8NASFEU1sPjNxgqJcMshpws0LN5e7T91dQjNW+bB7dWNSwOxh4wSF2A
	1tc5ELD2aRtPVy02tyGtrIO8E80Zr6rcREX7Z3ZBSgW8QxIho=
X-Received: by 2002:a05:6a00:3923:b0:848:7b92:8e79 with SMTP id d2e1a72fcca58-8487b929051mr502475b3a.67.1783659990526;
        Thu, 09 Jul 2026 22:06:30 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84847275fa0sm3400499b3a.22.2026.07.09.22.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 22:06:30 -0700 (PDT)
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
Subject: [PATCH v3 10/27] ASoC: codecs: lpass-macro: Use guard() for mutex locks
Date: Fri, 10 Jul 2026 12:04:54 +0700
Message-ID: <20260710050511.14439-8-phucduc.bui@gmail.com>
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
 sound/soc/codecs/lpass-macro-common.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index 6e3b8d0897dd..7e59616ed7bc 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
 // Copyright (c) 2022, The Linux Foundation. All rights reserved.
 
+#include <linux/cleanup.h>
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/init.h>
@@ -71,21 +72,16 @@ EXPORT_SYMBOL_GPL(lpass_macro_pds_exit);
 
 void lpass_macro_set_codec_version(enum lpass_codec_version version)
 {
-	mutex_lock(&lpass_codec_mutex);
+	guard(mutex)(&lpass_codec_mutex);
 	lpass_codec_version = version;
-	mutex_unlock(&lpass_codec_mutex);
 }
 EXPORT_SYMBOL_GPL(lpass_macro_set_codec_version);
 
 enum lpass_codec_version lpass_macro_get_codec_version(void)
 {
-	enum lpass_codec_version ver;
+	guard(mutex)(&lpass_codec_mutex);
 
-	mutex_lock(&lpass_codec_mutex);
-	ver = lpass_codec_version;
-	mutex_unlock(&lpass_codec_mutex);
-
-	return ver;
+	return lpass_codec_version;
 }
 EXPORT_SYMBOL_GPL(lpass_macro_get_codec_version);
 
-- 
2.43.0

