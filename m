Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359123EFD3D
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145490; cv=none; b=eVUxb62ncbyJUowAuElhOV/j1YFJ/LGhz+L8JbF0DGg136ZBminkOH+0Fi/yS37ldyQV38rTB0zRcdr5tks5ReEnD486pe5cPLu/bxAO1GGuTByW2LF0PBUFuyA+2zs8sMvleI7tDQlq2dI5T2w8/KzzfjKJoj+4cYbxvym4Dr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145490; c=relaxed/simple;
	bh=WcVBAw4m6vXWVa7cO11dtBY4yC5CTd2sgQ8rQ0bARXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JREov0+IuX5uC0HpC21xrJzjvm1rVMsnv2iqPEMsDrahvSR2lJYJDCl/RU52Vb81enU9Dr//vwZAJAxmH+zfGn92tuNI74rTSE6mjspVUWARiUMzn7NBD+SWoNINEjjPpEp7wPZTml1qceWG3gZhRXn4Ze8S6itvF6rQTMPeqI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j326Tm2B; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j326Tm2B"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8487088510aso2017259b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145487; x=1785750287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oA5l4kl2gn74TJucxqbDEc7TDHU8gaD1ySuP5ZTMCmU=;
        b=j326Tm2BsB56CivuhxcU5UtM4uzGe/tnWg2YDQ94OhED3rlrJUOS0ILvaf8JygKmCh
         /UT0sOqgWTQ4wphicKQweK/yAw2u9I4zwsBABoBpNay8rc6Az/G1o1gkqtkdEELU27Ot
         cK1vUOUp7qcv9VX7enbrR3Ae1f3Pa/5+Mp0JyFynsomqantSkeEgBWDX+aVjrkBae2uY
         UM+gKORomtwoTGRNFFMaHj8ETdQR7945PVGdInwfD/MviyHVPB8jOYQz29wmdFz2KaVw
         325sEw+mfCpJw1/DWe3aNJEc1cqpXyKG1VqBtGas9PNkrC8SJX5xHav1LTNmC2T1p1aI
         qldw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145487; x=1785750287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oA5l4kl2gn74TJucxqbDEc7TDHU8gaD1ySuP5ZTMCmU=;
        b=aVDrW3Ey4NBbj8HlbI97YWJ/CMzYWQRx5L1enwVd9qHeMO061RaCvMo3haD8BLvomN
         58JFCkcdpF/9E/0e1ikgVAyknvxCRjensyUrAEXKh6mxfezlTrlfBoQCMuExDxwz1gPc
         bdehVW9glYReeRu/hOYwg+JEbewg5h4NMp7zjhwC6vzCSCaxxiRBP8qwFGcIQEH/nsIS
         PlnT7TE3wsmNXWpJAJw5UmC6I985uAKXs6Pr1hlZn+i1nZJ5dh8mAfnguwrQ6lAT2d26
         RcWI+U91cWF2Fv6t4g87gx89pt4kQGNxN2kNPtCf4F3pomKoX1YTWSEH71Zd9Dpe5m7W
         0ZTg==
X-Forwarded-Encrypted: i=1; AHgh+RqVUTwMTl2c3z9Z/2kn6Iw4I3XzjG0P5bes33e5dCsbtSpoSWPxT1BuoUZxrkOKb4y8HRae9Xf3F2pFSoF+@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4tQwU0OX2QawAEEYNEsULDfJrocey90MXk33z8BMDpJjPa31b
	ZbGvOJavWLeKgf5ebJczRGF0TL+zUOjiX1n+yyg+qy8yZwQDmuCPzyOB
X-Gm-Gg: AR+sD11cBGcVn4xZDogPCg1ApilDvE6VwuvOgeibV9ZwxFPcMkwyhtoKSUzfqmfje4r
	4LpQ0gqJiaTFCONZZS0go9TSaa6F1P5f2AHeVENhZqDpLhZVqOQOAHIIAH3aHpshkSbUGIWa1SO
	7sp2us4Io6AxYSJPRGcPNRzixZ0N7+SVP8zI9ANSQzGPgfY9srwuFWNaXCuGi0yy0R5FxGpp1aG
	2+PH5EuCFGjsLDvqBa3oM/9n1OqLOBpJcJ7W9sCkbvJghMQw2qUcGdFs+5TNSZbCn8EoER/AevK
	wZK/508C+fRKyRVa69vR+lV51FS46Yd3CGjRqZjVUnh3urkZpx9eT8Rt/q+T5dwCMAF7EAs5Lx6
	Hn5AVVTZv1ee+av0UEdWS+WEp2MCaDYHkI7nqAPKz6sGyFHN5soZkbDermLyTTAtYg+Nwr+Hqjh
	FIVdUpCnh4khtsJaG1GXKdlvyBqGmFa75B/W3OUtgBEmjfgq57wKMO8cEj8olvHChKcL/zi1ygV
	PoT/Wd13XYO+Am/idgoYQ==
X-Received: by 2002:a05:6a00:4708:b0:848:5f4f:289a with SMTP id d2e1a72fcca58-84e69e0581amr2822060b3a.49.1785145487624;
        Mon, 27 Jul 2026 02:44:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:44:47 -0700 (PDT)
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
Subject: [PATCH v2 21/26] ASoC: codecs: wm8958: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:41 +0700
Message-ID: <20260727094046.23001-22-phucduc.bui@gmail.com>
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

Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Changes in v2:
 - Add Reviewed-by tag from Richard Fitzgerald.

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

