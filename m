Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27B7D347BBD
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467627; cv=none; b=TgdMWFkVlaHZSYJ3tBBRAw7aX15FoTc+B/Pgz/HL93YTDu7zufP320b6jJK/LMZW9djEsqRfmUZMnt8jg4runmhO4XsUyE04GjtBroW4HQolzRxEvIdTrp0gPYAcwSpgiqRY+rvxwckZoJsOhS2NFF5LkRPGIuYh1TaVrbkpoLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467627; c=relaxed/simple;
	bh=chor1/9GogowF9EJgZy2hFJZE1uubwSj8Yvkq6IYPwU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYTtPyAvJrFx1JiGqa7eqQErFVg6oj7+SYMMhrBYw3ZN2uHpbcs1wjFwkfU7hDwWI3XNtZ8ltCt3384HlAUwfQY2nXUpw3p4ME+IIt+3tkIUjFsDPwckA7Ja9eaz5qWXuRB3qosEu/xOqe4hZ+BhObdFK2zD6GoBiPagopze0NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A/TSDQMR; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A/TSDQMR"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf27856f9cso5007875ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467624; x=1786072424; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lljKBSDJsjI6QypuaswVsYuIZiZ2Rt7j69Hl6k2jRSY=;
        b=A/TSDQMREx++mLiEPRYYD12U/5YD2dk2hZQAel7mFjapINm+Cm9wOPkw/Ql5+3Ip9j
         ybG8T+oYlHbBdlEy9RxuODVlnjyQr1S9cdNctpreGXNAlnVWg/1+v8LJri1ZucZW/p98
         UaUlCAHEuHmo10vLqY89Hwk1FSbvzkgRnNqzx0yYhjYVKjssINSDHgO8rbD5/pt3I+h7
         3kSR6oYyg9UcX4aabnWyY+6WuNSha6/uJ+CLdh2wSAwMYYeYTfWs9nUdCwONa8t3vx2i
         iLQGE+JZnpZusi5mDlhlecKsYbbXWIQPmPJGk0yO7BZ9XWlVcngtwPIDnTmEg8Jt8Ncx
         bv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467624; x=1786072424;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lljKBSDJsjI6QypuaswVsYuIZiZ2Rt7j69Hl6k2jRSY=;
        b=jCJahYLKvw7tTwyg3YORFv3kKlaZADwY4mP1iJJ9v1n6bFuDRs4g0bLX6Vzqwz0D1J
         f7LiXJyeHvAi1L8SDwd30kPQufysPcbCG8Wl++JzHEzrxtN7/1sUkpu/+/4RphU0q2iI
         I1dPou8iVrWBV+Dl6iB1AybAUR7dSHg+QrCBcCWwPDkb6gb4VkXelBu+sbagDgkQ6zQd
         SJe1KxSjz5CSJgA1ES7eZL5vNEQlaPMgcYWY2G070eaMGJm+NqelJLC95sCtcHG1Kwqz
         ko+vvR/ijhbvpkZgskNxi1RAnCH1wzSCRPiqGdtrIc2F53FsBqz+oRabuBHvDRrxvrNN
         MUkQ==
X-Forwarded-Encrypted: i=1; AHgh+RpSaJqjLW2dddtUNO/4pA0jjfLjX8rQNaVyxzu4+gW+nEB1qTsTVcqyjuwQ5P6FmBWjYM2anBLPtpFSVe4q@vger.kernel.org
X-Gm-Message-State: AOJu0YygA/79kU3C1iklL7kiJd0MW/SFdwo+DX4DV4kmbsNDbxav9bR0
	HMZD4GpPSRIVZ2APZq+iSj2l971AtFb6rHwmMP4yoSg4FKDx0Mtgquxt
X-Gm-Gg: AR+sD12YV3EuTBzziEhm9i32JF44KZyjfKulUDk8qq3xdKIM8EFaM3gjErLgOwmgvwD
	AkJV2XR8T4BkHJ2JcYKDnt5NPWb/jiFKjpvuH0+43GIA2xJvTBznN4wOFNEKHT64RGaXH5iG0c8
	CWePb73eLX3R/KG2ybsk7yu8tUlRh6nrU9TrfDP5zIwu4Vfff6OrD7a1CU3Btv3hQ74ijDZdRw+
	vVqb4Danp9XV9qgSedct3VQ7jhkUHjwtP2BAmHvpYA0DjKeJZbku8o54i46YDrNT1dFcVtIy0+8
	N4PLkZvVA8pL5XTwK6cG0wiM+q4J3rK5NPBN63sIxFLM20IdDuiwWziKTNNej6SuAPUt0Shi+Oq
	F4HZPHEcqDxtW3LArecOyAOV74zy1e3IEyNtATJtqy+neU5tkgoXc9mTyilIFPA3iiuzheo1rE+
	RF4vhCuYqPb8zS0jEehFM2RKIOyqWvmMHB/d6DkPblA4x15hDPaXYUX4xH6IHn9ei2nr30KZjeM
	i9lj39klsWzT3rUbMEnRF7VGp7i+/4N+DEZHlPB7cnCK3CDbvZNDGjs2HF83O7SYeLF4l9Q1nTu
	W6fR
X-Received: by 2002:a17:902:ce82:b0:2ca:1bd2:d57b with SMTP id d9443c01a7336-2d046ae7abdmr5105505ad.0.1785467624546;
        Thu, 30 Jul 2026 20:13:44 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:13:43 -0700 (PDT)
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
Subject: [PATCH v3 26/26] ASoC: codecs: wsa88xx: Use guard() for mutex locks
Date: Fri, 31 Jul 2026 10:06:48 +0700
Message-ID: <20260731030648.8706-27-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wsa883x.c | 11 +++++------
 sound/soc/codecs/wsa884x.c | 10 ++++------
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index 24a5904d8e6c..442cf9f3eaac 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -4,6 +4,7 @@
  */
 
 #include <linux/bitops.h>
+#include <linux/cleanup.h>
 #include <linux/device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/hwmon.h>
@@ -1237,9 +1238,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = true;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = true;
 
 		switch (wsa883x->dev_mode) {
 		case RECEIVER:
@@ -1290,9 +1290,8 @@ static int wsa883x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA883X_GLOBAL_PA_EN_MASK, 0);
 		snd_soc_component_write_field(component, WSA883X_PDM_WD_CTL,
 					      WSA883X_PDM_EN_MASK, 0);
-		mutex_lock(&wsa883x->sp_lock);
-		wsa883x->pa_on = false;
-		mutex_unlock(&wsa883x->sp_lock);
+		scoped_guard(mutex, &wsa883x->sp_lock)
+			wsa883x->pa_on = false;
 		break;
 	}
 	return 0;
diff --git a/sound/soc/codecs/wsa884x.c b/sound/soc/codecs/wsa884x.c
index 567861dd42ad..a367c94bfb4d 100644
--- a/sound/soc/codecs/wsa884x.c
+++ b/sound/soc/codecs/wsa884x.c
@@ -1701,9 +1701,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 
 	switch (event) {
 	case SND_SOC_DAPM_POST_PMU:
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = true;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = true;
 
 		wsa884x_spkr_post_pmu(component, wsa884x);
 
@@ -1717,9 +1716,8 @@ static int wsa884x_spkr_event(struct snd_soc_dapm_widget *w,
 					      WSA884X_PDM_WD_CTL_PDM_WD_EN_MASK,
 					      0x0);
 
-		mutex_lock(&wsa884x->sp_lock);
-		wsa884x->pa_on = false;
-		mutex_unlock(&wsa884x->sp_lock);
+		scoped_guard(mutex, &wsa884x->sp_lock)
+			wsa884x->pa_on = false;
 		break;
 	}
 
-- 
2.43.0

