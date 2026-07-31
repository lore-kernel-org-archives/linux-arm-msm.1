Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E2F232E696
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467398; cv=none; b=qmV93dk5GkzhwZN5rqVY2XSuT7MhFohAqjSXmgJK47CPw+y3dSFCXEiWEZOfjMBSMYMPNcAhfFIpehSYoX7uA63hLxWUKcQqQcdaJ9j9uIBaH6oSxk0XYwZAH6M6nMAyl+qH38254XFXLkIDFz83vRtVWyVAtH2yySShSQNdD+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467398; c=relaxed/simple;
	bh=Fa/+gfQ3SzEgi11qWxA09O6FM4GPY4YkSzC3+KOzEZU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=InGFwjvm8PyqvaEfSmT2K07Cl92y65SwwhMQlBiDEJhh1jgHqUQOb7Q/RrVuJr4RmcQfJ+6jiLC3Lx1qIFDIynzsKZg0eNCZMwvfxx/dUoD3eUgNOFWtUPep8Ebl/VnkS4bPH2LJeuY0uXEQ7dp3WGEM5flmdtDTYfG6gG3/Un4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mKImLUzR; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mKImLUzR"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2cacf197759so6664935ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467396; x=1786072196; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWHLEKCAQ5mV1sF9yyFHSMFUTDOduAtPgNwQ5RGsXm4=;
        b=mKImLUzRxA0uk5pfsvrn65IkfNC4eMvwIEAHmsI4R/oe/Ua0cxKnveDg842iyAaNlF
         OEsFPZTg03LBFnpOjOl2CYH5Wq8yqyZ61dmNAsVLh7Z9rwUEm9zMIDi7izq+JGX3G2tb
         VheIeTmp4mXJ0SWMxvKNGxTr+4zEdbn5FaZdw+qSUa/zaxqJStujebnNOwHwz4hzMq5q
         mY2th90vf32SWHkDLKnY4s/NEYQPISTYw4zo/Ca804UL2ADVgIY0at4sMHZsQAYgVjU2
         cjJINxI7ejPTr9eoC4iyS3GqAiI7Gw+PRfuTB/kygn5HwYVTGjuO27fLz/EyaxGnV0C+
         Yckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467396; x=1786072196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWHLEKCAQ5mV1sF9yyFHSMFUTDOduAtPgNwQ5RGsXm4=;
        b=Y/cBUd7HhyYwHyOp2hksBL8BHiVnHSA5UK6e5d3clXeEtlf3Yuh8he5sSRTDsWIfus
         eHIN7B8nNY05P5qjhPlQa9+Suobo1Wg1jLVkM/NQxbnpZs+136I3jQPN/cs7jj3qpHsh
         qMnG3lqLogRq1EyagtoD77wuOtzMIwKE7xVQ1TEkuaN2ZMhAmnv8toUbENde4Bogi2Gq
         M9s7JGMcxK+SZ7R4oJM+lEdqipx5CpMmaYIq4tDIPU77k1wjX2BsK5RyR4/Q2P/xj61L
         lwdpIuxEQoUdguvu1NiSmss6W4RKW4ZIpAHenRHB1RgkDWPZBPoU6QV82uXzQTtNdQWK
         ZWrQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJ9F5lxiiD1TwwmjccESlH0J6p6oTYDNmtJTZBSKX5SdM3L79Vuf5D0IWE1N4gQqLHXXYcyq3fvRRe8VHj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxjnypo0SyWmMjBKu+BesLeDHWGM0xWQLj3r7tMjd7ZvyZGSfmh
	yreByHQIC8/jdRDN1YRPjrOuNe0Yp5/IR8AsbHhWXn7Cy8FnYzWEdQz1
X-Gm-Gg: AR+sD12GPxnEEZ1PXFVMjk9712mMSdIcB+UN8YCmZHxoD/GZLZm+cWBWYnGUJfR8eip
	JCBkikURcKG6G9Xa4/orPiU4C1HOq4an6q/lmzVby2rt4gUlUbUvIrUX7UC18lTjjyGfVk0Vcjj
	uW0dVK1EXWzQ41i00mLsPVaJjxgdGlwnnUFbHx7J2gtpi3x3EGp0jSYaIrajxKZjn08bi589baG
	UmI3JZFhYn8YrdVONYukuXb2f1wRY5HpEa9+DYrBaJW/YEUDGptC/dz6lnyNK9QfSi6h2kCCiOT
	KHM4paEYXEGjP9bNpa1gyb/YMzd6BHFNDnRREhoMm5CZ5PRck3eGE6n9oBsAKsYNtN2mxPxemJ9
	Uhtq1z7AKLxmmM/aOL95jzoWRoQPP++2iNEPd2PGYcoMC/2GAC/1F1xBls1afWrJPhXf7ZMYMBl
	iFLOvaeRiIPGzIv3zZ0FXjGI1nvtsLX67/6Lj9uaShwWDmHaSkEO/awib2m1PQjgcdt0C18p/e+
	4ezgQu0eVTApWKQGrlUP9QTUEDPVbdJR5SKxEhOVZI0M/3Pg3CV1q5Py3e2LPgZ7Cvded5fM/m6
	XufaNWKV+eyHU6qg
X-Received: by 2002:a17:902:c94a:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2d046b34b50mr4660025ad.0.1785467396392;
        Thu, 30 Jul 2026 20:09:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:09:56 -0700 (PDT)
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
Subject: [PATCH v3 01/26] ASoC: codecs: sigmadsp: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:23 +0700
Message-ID: <20260731030648.8706-2-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sigmadsp.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
index 2e08fde3989c..b7dbeb237447 100644
--- a/sound/soc/codecs/sigmadsp.c
+++ b/sound/soc/codecs/sigmadsp.c
@@ -5,6 +5,7 @@
  * Copyright 2009-2014 Analog Devices Inc.
  */
 
+#include <linux/cleanup.h>
 #include <linux/crc32.h>
 #include <linux/firmware.h>
 #include <linux/kernel.h>
@@ -135,7 +136,7 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 	uint8_t *data;
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	data = ucontrol->value.bytes.data;
 
@@ -148,8 +149,6 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
 			ctrl->cached = true;
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -160,7 +159,7 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 	struct sigmadsp *sigmadsp = snd_kcontrol_chip(kcontrol);
 	int ret = 0;
 
-	mutex_lock(&sigmadsp->lock);
+	guard(mutex)(&sigmadsp->lock);
 
 	if (!ctrl->cached) {
 		ret = sigmadsp_read(sigmadsp, ctrl->addr, ctrl->cache,
@@ -174,8 +173,6 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
 			ctrl->num_bytes);
 	}
 
-	mutex_unlock(&sigmadsp->lock);
-
 	return ret;
 }
 
@@ -677,10 +674,10 @@ static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
 		return;
 	changed = snd_ctl_activate_id(card, &ctrl->kcontrol->id, active);
 	if (active && changed > 0) {
-		mutex_lock(&sigmadsp->lock);
-		if (ctrl->cached)
-			sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
-		mutex_unlock(&sigmadsp->lock);
+		scoped_guard(mutex, &sigmadsp->lock) {
+			if (ctrl->cached)
+				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
+		}
 	}
 }
 
-- 
2.43.0

