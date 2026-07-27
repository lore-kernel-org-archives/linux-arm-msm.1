Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6113EEAD3
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145411; cv=none; b=DdeURRS7qNtZAtRlBYR0YEE6H5VS6UssIHuxx7vJdAg4pFkJ/zzoJ08JLVI9dpHetYLkOlWt4om1vbV5J0JYuh8GtLYSoX1Mnc+l8jAat7nqAC4/X9FFh0ehlK5jsb5onJ1zZVCeOi9KPz16e0d5LOMilAyca8myZHkSAsgJEkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145411; c=relaxed/simple;
	bh=NTv0dA4h7p0NtOycmpwSiKJMd8uSAN1UAwPHu17+jvE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lVd4TZ0ddEkO82MEVAF+37h4HR/lqPWfpD5wK2/Cs4bibfO1k+a9uO9SOMxNmbGqfpvnVQ5vvpeVSfmg5UiRIFK36xi+XpRULybVnk7Hp2mhE9epkLa6MAaiZj5Yx4D1tEUJV7xgz2VncptOqdHl+E2AZyuoUEx6SdjXkVCMr4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OTmDkEyR; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OTmDkEyR"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9d1fff21edso1482576a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145410; x=1785750210; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K9raJfp3OtJus9yMmtP+CvXPkqSwzVFDSD0PnOwRCW0=;
        b=OTmDkEyRoGi2aeOSc8I0ZkytrEZvpTfWkEarISD8UNkCDbhZGdzZIQXe3e51jujuVJ
         4G95ZbNHZSvF0/+pkbUWfQLBWwkmNSRFjzEu4Nk23g/JlO1akerO0rkPTs3bIwrCTm/k
         QqEtVfN0tintnRA+dKLVPp0OjoofAyoHcCaRJ7fFEm9AhM2OkTt6YcQIv1t9d+SpfPy2
         WBST1FLlSCTiZLIByc1ui2ySI6MM7HbnGQef0imcmpxVqVrOqhzfGq9puCNu4H7I849x
         ALPZSl7vrUM5QOzJ/v29VPhm3bUjTYNc/YlfkuQcdlfiDaApeFYb8krxoCg/18G/lwfh
         IlGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145410; x=1785750210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K9raJfp3OtJus9yMmtP+CvXPkqSwzVFDSD0PnOwRCW0=;
        b=RVBUftHNmNwILQkHE6zkZAV9k5NllU+hpf+O5feoJ9+bIYXGkggfopC14t7n09A0rq
         mbEMO5Nvg98oFc4GFiQ7EmI2el1FoF80WVA2Y6ws5NxJm+m2fbfimikxktj9Jf2o8DL8
         nstocUgdLm/9Ap+HT6LjoXgpWVTuW4PCQ16bJWgqKs7yUDnlpKu6bx3guhIstG11aV5K
         DtygXyauFceBpz44rQpNZBNSEu1I/IKBKc6U5aA+jIVHqk6pVH4iQ39+bWCR288uwWwd
         y1yhWh72DFWw4NVkn4EEN8bJ4iXbaeVH2plI/KZ2HRqNq5PMPobWbmDJGInScdKH7Ddb
         mAPw==
X-Forwarded-Encrypted: i=1; AHgh+RrDhjDbK3/fSOIXSp80icd3SzTAfS/lkxMogGu3AXYoKEFocHnDtSvQwxstuk3q5r6hHShCtZmTAYh3jq55@vger.kernel.org
X-Gm-Message-State: AOJu0YyxX9MbH3rHEU/dm1ezm1ZZih/G7RJHvE4GoXkjNR4Bs5g577LA
	4P2GCMe4KmQwaZia2f1oRuHmDGzjj7LE0pxBCm7ecgfZtJ/kcBYm8cmi
X-Gm-Gg: AR+sD10HdWIBSmvlMUrfSoCcIJsv4bBAGSNoPIvGtlL9ihjn0XclRlNoMEiwV2uQBJr
	MugV8rEK4vvxgCiqFi2cFGTJM/EPxRYsOjTr26RbWfBa3+/abelGmrBp1DQGBbgqGFl8GluqLAd
	glOC1vueJ9PhrW/RSczvrICSni+h1LGNkTgx+QYO6jQUWVfsPzrqAvXlHrR1G49v++UFgNDTHje
	cy0vIG3eRtcQ5xwbyQVU+UsrZWufWdZdvJur3HbSrSEaZkSXErn8Y8OyQyNB9uvcE+cnzulVEsf
	kGVobiA16gK8F/soDpY6m1V8SocYbYXDAMRZwIUoqs95Yxx+yb92vt04s9C/wGhUwJ0jrx1S8IQ
	8mVCq/mN8V2j3by6FE8pLjSR/xmJv9DnvLKpWYTpkVNUYuyNX2pyxV7AXnRWM9isBA4AiFkTSYJ
	HyNr4FVwdMEfvOzbfe0tJxgLOo5dj910wG2G3NV/fVvD+bpVvEy+SLHITVAugtE3+DtnESAPLWp
	8BIxNKVcx9HKrDVWxBkLrs4ZMkhp4UT
X-Received: by 2002:a05:6a20:938e:b0:3c1:a0c:ab85 with SMTP id adf61e73a8af0-3c67e29aa93mr8699410637.76.1785145409773;
        Mon, 27 Jul 2026 02:43:29 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:43:29 -0700 (PDT)
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
Subject: [PATCH v2 10/26] ASoC: codecs: twl6040: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:30 +0700
Message-ID: <20260727094046.23001-11-phucduc.bui@gmail.com>
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

