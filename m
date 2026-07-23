Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59BF239CD08
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782508; cv=none; b=EhwzhyyRPFRCEpsHVHZZdIh7/mhbJFhgwfb8oCDY77QNXife1S1e+4VAf9/qBYEnyjHkckfbWszEPOR30GHSwGIlH5+6hwqtI/Yz08C/ADUMJ7NOFNNtHxSIWYdqlyGR+TRtueDurunuP84n19K2s/iVY49iX9GvA9QoCEreAPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782508; c=relaxed/simple;
	bh=NTv0dA4h7p0NtOycmpwSiKJMd8uSAN1UAwPHu17+jvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mXlgPynsQWOVT0Hpl90mgsVsfVv039nkWqgYeenHJEx1kRghmtojUpoCKVPEJXVUGaQbSWkgewlW9odX2J7VOYuCwLqk5t6qNJinmt/tVQxVUNKZB9BqFPMLVjQnyfkTK2n8Gt6hWHjCIwBjPItLjTLyq2Ry74ytly12lD8ziws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFcLHaZd; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFcLHaZd"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf52d15d88so2495195ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782497; x=1785387297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9raJfp3OtJus9yMmtP+CvXPkqSwzVFDSD0PnOwRCW0=;
        b=kFcLHaZdR0ne2qKvy+TrDj0vmXVLoGXnP3l8oQIKcUGqpbF0RN1S4GnA9ktfrWPUER
         P47Qc14VuN/oKey306LnkMMcJko3uJEi4WPnNhb2D52B7Dd3NaGReduWSVcttSD+jE9G
         /oE2L2k3yJO1vtgWZfLMHaJP59N2+Fp3vQ7MFaEr55ARDEo8zDBh/pQIw5hfAEm04jqw
         Nn9Nb9qGFZU5eOv//Vek46aSVRmiN9e/i6M2XTlp8RdHCcFCAN0s345PhZvEVJwt1ere
         AT3/4KQvkE9RRdGd91Z4N4wmN3h3YOF928tpZcuq8fD/oYfOyL2iR1TZsrM0l6QY+iNb
         Z+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782497; x=1785387297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9raJfp3OtJus9yMmtP+CvXPkqSwzVFDSD0PnOwRCW0=;
        b=T0676Q+P3R8YOceiWHtRzj+9mMFnTztBR7GZZkimWkIhPfS1xuI2DyWnOimzUw1Vwu
         +DsZUasUtVBkR/BqmZufYrhDVC9ltpwnHvBY8obgzjR2iOILgQsLhel/sWHKo6/xBpRG
         84VXoOsSJB3689DA3EUzi5zS4VBVOP0/iDY6+KffxwdZBd2VFS5Viw2HoAiiplOMGZpS
         xnlnQjlgGeVMULCWI7+IX+zU8NGPIV51v1QF5pZ8zpxEnAfyZaNvJZUoHEefhguaJyTs
         6f3lDRV1EsCYSHKMAOjt6ySVE6wLLGO65G3VOlhFrtN3fxd0xCVWiXFCo4VecZkFLMP8
         0+4w==
X-Forwarded-Encrypted: i=1; AHgh+Rq35+Q8BItCEQMYkjUpblu53xS6kXTakDHoQ6jaKUHWZmca6CCKs9T71O7qcMRjI/m0YvtNTEPzrvsFRX/0@vger.kernel.org
X-Gm-Message-State: AOJu0YxEotuddGQ5hnVicF4A8bBX9FS17rUWQV9g3+yMBz3mh06wrBHr
	Ecm73XXwhNsUPchMDCU/LCpF9eC7FLYwWymmZCzUXwNJEwhy7acsepej
X-Gm-Gg: AR+sD139YkzIk1/QgwZ64h8Okcgf0Zl2gScc0ZhjG1R3JmEjTK2LTHKZ3eDaTmkQ9CS
	j47sNkbvneXpDOvTpC1cd/1umUfseQmaFh0OyZsyc5GXgr3/MFE5e+MKxB0rlE+ind9v8MarsYc
	2lpwe9ezYS9vy7ZhEPxh7D2bPWZx6ds6KRH2sC0yNs60JHla7DbdvS03Y3SY/3URK7jA76ywumI
	hLa1HcSMTZEYMmBVHB9FJ4hMQgesg7Cm/oDDDY9yr8ybz05wemxqkILp2G5mlwqYm5bcn+HXSio
	lomPBcDKnB4ObpuIhQwKKpfusQhDpE73TrovX05USs01X75Bg7Xr+xAQwNL9l/DA3NZZECR5EjM
	SArGoGw0yum01vzTnC4466kGqdRT3T+aDvN8QiiHPtZGKDgsQMYBSVT1CXVSpAsBusthSb1vE97
	T4Hn92WHq8lkVrDqlPZCypmUKA22Hir5xle2jw
X-Received: by 2002:a17:902:fda4:b0:2c9:aae1:a61c with SMTP id d9443c01a7336-2cfa6b999e6mr19255985ad.20.1784782496893;
        Wed, 22 Jul 2026 21:54:56 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:54:56 -0700 (PDT)
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
Subject: [PATCH 10/26] ASoC: codecs: twl6040: Use guard() for mutex locks
Date: Thu, 23 Jul 2026 11:53:11 +0700
Message-ID: <20260723045327.28260-11-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260723045327.28260-1-phucduc.bui@gmail.com>
References: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/twl6040.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/sound/soc/codecs/twl6040.c b/sound/soc/codecs/twl6040.c
index e10c51092a35..650836f9615f 100644
--- a/sound/soc/codecs/twl6040.c
+++ b/sound/soc/codecs/twl6040.c
@@ -8,6 +8,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/platform_device.h>
@@ -273,7 +274,7 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 	struct twl6040_data *priv = snd_soc_component_get_drvdata(component);
 	int status;
 
-	mutex_lock(&priv->mutex);
+	guard(mutex)(&priv->mutex);
 
 	/* Sync status */
 	status = twl6040_read(component, TWL6040_REG_STATUS);
@@ -281,8 +282,6 @@ static void twl6040_hs_jack_report(struct snd_soc_component *component,
 		snd_soc_jack_report(jack, report, report);
 	else
 		snd_soc_jack_report(jack, 0, report);
-
-	mutex_unlock(&priv->mutex);
 }
 
 void twl6040_hs_jack_detect(struct snd_soc_component *component,
-- 
2.43.0

