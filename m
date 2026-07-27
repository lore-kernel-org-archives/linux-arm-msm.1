Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360853EEAF8
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145468; cv=none; b=l34kA797Do7pSmsvjA8adVbmL/k+z/flJ5infDC1jyAgt2mn7eGGHvuopwS/c1N4Zb2uEpfCIy0Ppv5/wFURcDpd25k6rwVLL1cfS/NNAAEHMLuue67fifF9jYht3r1dsFozzQvmVYxMH7z3uMvL0GnEzZK9DRta2snJW8/kuv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145468; c=relaxed/simple;
	bh=Ao/9uwAwCZ3n+ZuP9RpaHxQh/lAFXXxcAD7XbeFdYrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FJDIem/PLCUJTrP7XQBFAqNVA8SUnaUZ+UHNCjYjRy7v2eE+Xe3fZ7KrJD0vliCPr9RMt+lfcf/o0PRh4grS0cHwRsXjVie7FET6Q8uEUutAEr5zmgWwA3XpuqmcLehincOXzTKCd+MlzwNtwh9NC7pB9jOctQdJJe3SHt7ycHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJ3wxvLr; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJ3wxvLr"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8423f236418so1739122b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145466; x=1785750266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdOBdNsCZllnvmxLCxNmDnA7eIbVv8iYbzhQVFd/QPw=;
        b=eJ3wxvLr9Nr3g1zhrOPyt6jciNBFs/AxsakAWxNRb4yoLbjIQnQSU1LkCM3q0Qq3UJ
         b7zvfGQrp2N3kMzseMr1WO73RbQ79gaAp4SPG6242A8CS2GCZmccV/c6+Z4Ge2/2jGAX
         /BK7ewiYu+x355xQpFCWkYm5A/0E2jcyRWmOdnFgN2alNLRlZ1aNmjNfPQrBaU/7FUAl
         ZYA4For2QY6GD/lQJK4FSMgFV10LmSQvecP2OskHCYjmR3Bh5ZgoRDWqd3IU3KjiXl5q
         khz2RwyLGmqjR1LQd+4l2yjaQAW0iT8JvKFX3HgrrJzUk+QRCmDXtNheIX/BofR4YQVn
         2xMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145466; x=1785750266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdOBdNsCZllnvmxLCxNmDnA7eIbVv8iYbzhQVFd/QPw=;
        b=l542RjD3pwGmuXxz/I9H6NBnP2xidE5vtCzh5G3BfTAioVjMb/J0bZAmplg8wHXN/O
         AxNMTku+0ZhUX9p/U6WWN/TL3ZNKl/wMrmCyHvCqygqkwqTgmM3IyLbvFQdqwug0f4At
         nyW+wL/O+mgv03d0OLgUI1uNAq7/4WESxyQHtBDMNlZY6GNWXNU6msoshvEdAZTzDlFQ
         XfB6tKDOTv7paytwATBh/g/AY27uKIaapxSpYFN9Hs6osg+piBRiRltUeuITDDRxCD4F
         Jp19w+tmvG0ctgbpgpCQlbT9SJ3FKvEjbXGkx72FpUCKfduWxv2+BSY8LMfeXDqigCgS
         5m6A==
X-Forwarded-Encrypted: i=1; AHgh+Rrenhmk2ePYbn/RTrG68hMWiXiMCgMferJZXmScI5OtHH/662xY1dmRVpNSTk9EsUvV2M38kVaefTTH69d1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+cPo9zXkbklVDNY53M0XYQLF3A4mjTeRVqOB6vmPAc60GPoDp
	o6DyQ2hzTXK2sDOVFdExflosK1CE4Iaxxrl9Pf1L0iaNlfyT6uKohJjn
X-Gm-Gg: AR+sD12vBqxiVQ0RX1tyCA8qoL89xOPxNB2zcIbYzDqXTDrWRXk5kUktGDnK5EBO0mi
	0m65Qjo1aoyyIZn9+QHdVOwpsiova1w0WPxJX+Ro6cYVjhAii0XrpqLuXJf25OWr9sQcH57pdB6
	FRjy1kVPVRR2TDXWiGSjyJ/Y8Hs+rVYVnmLfZJ00mFnI/z7Hfw/JY38HMC882u+STEnca4lT9S4
	M+k/SO01yKXA0wXxRMHCo9iAgAKQMINcF/J0YSfale3mYjm+QfNBy+Xoraj6byeThJcDjMJOLjt
	LXs0u2S0net9IerZJQHxuQKOWosuw82r9HM63/+MVAPCzKpmSDS3Vjw6+OH3cpYIhgzKLHp17If
	EkR0dLT4kwxCYcMxmq4UllQOAB+5BPCu0RAOlJDe3tonCeMpeH84yX+qSp3jVgaX7HrHV54NRrI
	WQa/cuxRwyxrIslosm4EmXNgEy4u1SDgnDNka1oJfjohF8GRMNl+APQgS2PvS8CPZvoxXejXNKk
	KJCc+d2nH5H1F875RZA9g==
X-Received: by 2002:a05:6a00:b95:b0:848:30c3:45dd with SMTP id d2e1a72fcca58-84e5942da15mr6361773b3a.11.1785145466612;
        Mon, 27 Jul 2026 02:44:26 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:44:26 -0700 (PDT)
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
Subject: [PATCH v2 18/26] ASoC: codecs: wm5102: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:38 +0700
Message-ID: <20260727094046.23001-19-phucduc.bui@gmail.com>
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

 sound/soc/codecs/wm5102.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index b4d4137c05b4..74b775b95bfd 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -667,10 +668,9 @@ static int wm5102_out_comp_coeff_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	put_unaligned_be16(arizona->dac_comp_coeff,
 			   ucontrol->value.bytes.data);
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -681,16 +681,14 @@ static int wm5102_out_comp_coeff_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	uint16_t dac_comp_coeff = get_unaligned_be16(ucontrol->value.bytes.data);
-	int ret = 0;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_coeff != dac_comp_coeff) {
 		arizona->dac_comp_coeff = dac_comp_coeff;
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
-	return ret;
+	return 0;
 }
 
 static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
@@ -699,9 +697,8 @@ static int wm5102_out_comp_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	ucontrol->value.integer.value[0] = arizona->dac_comp_enabled;
-	mutex_unlock(&arizona->dac_comp_lock);
 
 	return 0;
 }
@@ -712,19 +709,17 @@ static int wm5102_out_comp_switch_put(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct arizona *arizona = dev_get_drvdata(component->dev->parent);
 	struct soc_mixer_control *mc = (struct soc_mixer_control *)kcontrol->private_value;
-	int ret = 0;
 
 	if (ucontrol->value.integer.value[0] > mc->max)
 		return -EINVAL;
 
-	mutex_lock(&arizona->dac_comp_lock);
+	guard(mutex)(&arizona->dac_comp_lock);
 	if (arizona->dac_comp_enabled != ucontrol->value.integer.value[0]) {
 		arizona->dac_comp_enabled = ucontrol->value.integer.value[0];
-		ret = 1;
+		return 1;
 	}
-	mutex_unlock(&arizona->dac_comp_lock);
 
-	return ret;
+	return 0;
 }
 
 static const char * const wm5102_osr_text[] = {
-- 
2.43.0

