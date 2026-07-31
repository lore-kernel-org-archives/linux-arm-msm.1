Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1C4349CF0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467577; cv=none; b=io+rjShgs0Ddf15npToph8l06tn7QfYv5n6o5anhmZuExch5+PIxmFSre7m5tSfgtCRUwHDNRh+CurLv3m35oN3dRTBj3B7qNqcJzucJQWoImVPBCXOOlyIynzpbqzOUqQG45uAeYUVcqfa6sZNozZ9baAQYERptnzJPHsv54Ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467577; c=relaxed/simple;
	bh=wXTCecCG3P1SgVWHCEU9tj8tNEts7yiCpzhIsjE4ebY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CCMbCuNNm0+q+DHkSiPGBBC7vJ+7hESthe10//gVDilzUU7SxQC/9PYPTxozOaYIc2RbMZwjB1ztSx7HFyEcDe+0qbWI4o+9S9an03FZjzEHV5xukj5dVfp7eEx1aKqI8SUqGS7Jy0arIdbBfbU9nIEY2XJHkAYxhImnvxvrfIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dWyJHDfk; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dWyJHDfk"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ced3386430so4633115ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467575; x=1786072375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MqZF/A9FX3lKVGMpZI4nxsIDlraiqAClU6NyZ93gkxQ=;
        b=dWyJHDfkJ/AQiHm1vys7aqC1lVqd/abOpjInkTCDSsrUIHY5oO8mKTMl7PEBRL+yvd
         WKNYFT4Xe3EdC5BaP/wW8d7CuDB5SgI2Ywx4HwW/tNvkrqStMGFpGQ5HzPt169Lv/l1R
         j1p4COnrC+xvwGOwXMmPtAodHFvsZSKMEuBAbc0BdPg9uh6OtcCx221O5xyQa4tg/Ur8
         PDVuMlC8YfC8HHm3mPPsPW7wWfA4mFcN2selcZw9LU3JVM9dDlEBvgFUxDctsxdZDNZs
         a6a/U5hxNIPfdd9jaF/qduYgGrFuDb8hMqExb8YTCMWucMDujfqMvxi1gpdjsaYPBrni
         RqOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467575; x=1786072375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MqZF/A9FX3lKVGMpZI4nxsIDlraiqAClU6NyZ93gkxQ=;
        b=WdNekCQ9jOsw7tHUw+YVb3eWEulrzCRKN8mGe/bsd6tXWahODMGdlCXTNXXjU8wU1n
         cRlBMgnO4S0l9wqH0eshBJRJC7EOLRbOp3wJUCRmtY4zm/9o69E/AAK8oRI3QrgrSFKh
         mO21Mta7ulpfO9w4pCjzMliZu+GACvDPLpGFddmL9CqAbAcReg+276YLXI3VjUlWq4RW
         bESD/sv5yOGJwPtlDt/hiJehgEvZMGdFcsTaFwl0NFGcZdjwicGgK+UYtvZcY2jvkWeO
         foE2o65QUE+01jnjAlDbKYTGlxWUUpffrBdyre22Wd90y4U+CB/aDb64X0Mhx0rD013Y
         R3HQ==
X-Forwarded-Encrypted: i=1; AHgh+RrPsOF/JmssPdPCXOcFZg1V2Owcu6p6rBBViNn/Lx2H7QIZ7Ewt1DpaXeforq6AiWIy6oorl0Xy3tNerQRo@vger.kernel.org
X-Gm-Message-State: AOJu0YygQZJUR19WA8aZQPn5i+eEIsA9G8qGGqg1WwlyoSppew8cErv6
	89gyy11QlmarN5ZM7jIUapyWhoRNgkUttOZeRxDfHtRGUeOW4ZIrY1IG
X-Gm-Gg: AR+sD10RKeUbV7BJ7EVahrJt45f7wH4ypJ6mxRe7EEikKVwB7GWcQ09iMiW+0dLJAPp
	dXM2wV1ItuJjYhKILfJv3J7/I8+KXKxsm+RIIXqRF2bn1HYiLd2NHtVPn/GmjDepGLVH6Ua3Fnk
	8pG6AZcgRUXK+Zr+8ARYv4MzOY68x4kjph7/LsCqqL+26zrchctsHEbdyg1MQUvUIVaXnt8DLSt
	b+5RptVcSeAarJMi7YY5HdpKJdzEvuzOF3xt0jj9UEs3RP51cwUOUBMGLka6gB7yPokr8W5KjZb
	WJ9HXyNSPW1aniZ9R5WW55FkD4VPubkMIqgjtyqI2/Fjz0AIJdfGaH72h6ppD8iJiwxzLLZKLwz
	HopUJzjbV48aCx3IFYirsusinDYetqWJRfKeSkEvizdnCd3revK5QvuxIfRPcKfavTqQUVfiaZ+
	CnSxFyhIF9ftlHOO9KKicx2Tmqzd6nQV8dRlY9hxRmbBlATUGKhyh0Yron/q2IKgKHzznCITAaU
	14enmm1J9pYmlq+nF01prxFx2UTvRyfNY4SBoG48AyQ0lJgpyZc8Lg9wa1wswBkDnU/aTFFH7aq
	84dG
X-Received: by 2002:a17:903:1b6e:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2d046efb568mr4883115ad.39.1785467575060;
        Thu, 30 Jul 2026 20:12:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:12:53 -0700 (PDT)
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
Subject: [PATCH v3 21/26] ASoC: codecs: wm8958: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:43 +0700
Message-ID: <20260731030648.8706-22-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm8958-dsp2.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/sound/soc/codecs/wm8958-dsp2.c b/sound/soc/codecs/wm8958-dsp2.c
index 8ff0882732e7..f75a6dc9d2bb 100644
--- a/sound/soc/codecs/wm8958-dsp2.c
+++ b/sound/soc/codecs/wm8958-dsp2.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -864,9 +865,8 @@ static void wm8958_enh_eq_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "ENH_EQ", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->enh_eq = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -876,9 +876,8 @@ static void wm8958_mbc_vss_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC+VSS", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc_vss = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
@@ -888,9 +887,8 @@ static void wm8958_mbc_loaded(const struct firmware *fw, void *context)
 	struct wm8994_priv *wm8994 = snd_soc_component_get_drvdata(component);
 
 	if (fw && (wm8958_dsp2_fw(component, "MBC", fw, true) == 0)) {
-		mutex_lock(&wm8994->fw_lock);
+		guard(mutex)(&wm8994->fw_lock);
 		wm8994->mbc = fw;
-		mutex_unlock(&wm8994->fw_lock);
 	}
 }
 
-- 
2.43.0

