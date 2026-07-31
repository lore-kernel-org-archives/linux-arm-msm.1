Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D211349CD8
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467567; cv=none; b=orxbSCxorVAqDuXF8H6jN0j/oGuwWeXJDZCU41lsdik6VuR4rFPBS1uZy6VQFdccfkkBT9t3rfq3PnnIezEfG5QN6pyLYp7gIzsNbn8UVY05CZiywsFgxsDdM3Dn79/NMEf+lIKIpR971AH+9CLBsetb2rMO8xRk17B5urr2AUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467567; c=relaxed/simple;
	bh=kHWNCYdS4K4RRPRvqdCj6TkLIUnIWTevDf0/Di4lMRU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=F9NcklFyYWbqZXPkBiVgpHSMDbcWGTQigggNdOSGMP6o4QefAKV8RUdL9tgmDaUzpEqxWtjKJwMoJyMfW5g23GFnkOjudFNwY+/89wuasy1PzoTdH6qOyLBgCyzzXFLQdcOr2I5pJQZf+9ZWQRzuk6/DrseYHWkSemY5dQV/T8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DzFNSZCh; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DzFNSZCh"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2cc61541f8cso16522215ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467565; x=1786072365; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9vdPVii+bD66knLG1U0cHceoDlrXgrDY33ayST1M3U=;
        b=DzFNSZChbddzDmfSsRsKxn4HKQs5pX/RqNn7B5KDkENdbskLEgFkF85JgmXzh5Xqli
         RDGn0BoXiSsAewdxVG/Bca8qkO25ZUSV1ncvE5xms1dIfPyETsm5ROb2BXNROcuQeDtP
         4joPCBBu5qmNqHiJxT7NOqeUMPa9+J27aHquvHfIok+/ZamlGoS70UcHedTBWgawTgj/
         742ZXsCnRLNuFY9Iq6+3wM2B7yfpby2cCMeFYuhUEZ4KGiCp6DogqSKTnQWJujP+ESjI
         wppMN1iF8O+iSyrf2LuB8zIxbCrNji03ZVal4dolnPVTAjH/hxV6XLev448pu4FGC8dM
         cRDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467565; x=1786072365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9vdPVii+bD66knLG1U0cHceoDlrXgrDY33ayST1M3U=;
        b=eU9uyR0RmyjDuTFR9NO9cq7GPOe/cwsl9w6eJozBo0Tc22pxFVLYYKFcWRJCEb4qaJ
         F5aeg8CjRNi6PjuqWgL3rX9p8l70BaNfYHzhiMFY4EZijxmHbfnoRGt3r4CaBDrbxkAi
         t0T/jgdhI5zcol8aaRBSZRXA8NFNEhHfLLpkEl0rywYhiQ7oXNTasp/U1MXYPfS5lFFB
         lhczOIsEKK3Zqr6qQlG55WbAHryusxpmAb8RqT7M4hKMMKsDq/udarAc6lto0Wfwa4dA
         pSE5Oen/FypDT2UyhxfmaYWu8Ro5uvYZfn3nH/kfgSRNCz1RAk7Rb3xiVJOZ7+sPD7WD
         eAGQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq7G88MuqlFhtdMkGiVCe+ckMtS71hFIX9237JA3dMfyr4JXRsQXa/nwEEou8jaEL9kpofbRvN7UL3s4dBK@vger.kernel.org
X-Gm-Message-State: AOJu0YzlOx82MT7zrLxkdlYXQtygXdu8B7UnOrcHFYrFGAoehyCb5ZDf
	whihdcM01Z/bXCdUib2/yHC0RlHbHQ6hRs3wBdD6K0lnFl29k76fV3Vw
X-Gm-Gg: AR+sD101leXxh7pjFWvgVqX9agwEdoo09sB4GKw429ZQs1Rv46KL0MEmUmqWHsr2aID
	bsjt2vYWS03CVF2mWmVB0Rp96ExXfF8jcA+o/Qj39dhO84bfAOlZjdmYWTs37PVQs17ZtzjzPa8
	6vaiJI0NQ0Id0WR4qu0AVyNFtv3M8CBwDIixjRd2EVO9STDULxrK8sEjFpNM0JymZ4njk8zLrTK
	Kvu+MAuopvTO2GKnZENrmoZ3sdzoLCm1zAjAg2JyW84cRMInsQ+cYKh7Q7gRr2UuWFd6Q60LOoI
	LVS7Y570vm0eYZFFeNSR7MbWUrjw/Xcze8jr3pb0udCIc36bgZCtng+QSFofk8HKqML0aTE4dTi
	G8MhBkMvqFhj7NXbA1YIBYfFP6c6HG1VmboIFOiVGWk1siWx/E4Ra8lcOrqGetDm0uJfHO7hRif
	KaQqwtX/U7K82IJ70xXsfL8+6OYaelAcEeKBLeF5p1ZTpLnRmLK7OYruSt5YRt7ZEEqhy1gP9z/
	wmTqe4DiIUnNbFf2SAFsz9mUI+zjdugFVGrADIhrmaSzKoeff/gAjGYtSIr4mDO2nXyn0Yonadm
	o3wXwBgjSghmhdo=
X-Received: by 2002:a17:903:2c06:b0:2cf:b23a:3e68 with SMTP id d9443c01a7336-2d047e9cee5mr1927185ad.25.1785467565326;
        Thu, 30 Jul 2026 20:12:45 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:12:44 -0700 (PDT)
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
Subject: [PATCH v3 20/26] ASoC: codecs: wm8903: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:42 +0700
Message-ID: <20260731030648.8706-21-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/wm8903.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wm8903.c b/sound/soc/codecs/wm8903.c
index 320d7737699d..156e1e24a388 100644
--- a/sound/soc/codecs/wm8903.c
+++ b/sound/soc/codecs/wm8903.c
@@ -14,6 +14,7 @@
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
+#include <linux/cleanup.h>
 #include <linux/completion.h>
 #include <linux/delay.h>
 #include <linux/gpio/driver.h>
@@ -458,22 +459,20 @@ static int wm8903_put_deemph(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct wm8903_priv *wm8903 = snd_soc_component_get_drvdata(component);
 	unsigned int deemph = ucontrol->value.integer.value[0];
-	int ret = 0;
 
 	if (deemph > 1)
 		return -EINVAL;
 
-	mutex_lock(&wm8903->lock);
+	guard(mutex)(&wm8903->lock);
 	if (wm8903->deemph != deemph) {
 		wm8903->deemph = deemph;
 
 		wm8903_set_deemph(component);
 
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&wm8903->lock);
 
-	return ret;
+	return 0;
 }
 
 /* ALSA can only do steps of .01dB */
-- 
2.43.0

