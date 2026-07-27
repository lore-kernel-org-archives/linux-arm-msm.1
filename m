Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073763515E2
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145326; cv=none; b=HSH1ujNdmjD4j4L8X1dIxT+RKAjYHsQ5ab+K8REFYZqTPKBQ7eqV8xzpYkdYiLCjPx3xbtznF5TmaoGfAp9Nhz72U98BRsQ4G8NFshMQUpUq/jX5K26NH5khgAGZPuV8vsTaiyHF48a1OTTKbc7G7XagCR4CGCwVm3BzoHPEpRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145326; c=relaxed/simple;
	bh=GEVBslxyQTjWkaD769j6sBltZvw/8KgoyK2Jx23lHrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mUTR9OWcgobVlJB1v4pA2+YOYJtESMRB7KvTuVhiwb0jjfM6++cBvmnAQN1uXz8/rcQWfaDpUxYRgaqW6KmB5dr3aYzAq71G5XiB9vVcY1ORRBsEJDsf9OuqLAPjp6DU1s+VGxNc7vsV4kqt4NWjk67zeotHHDRcYNt7GgukHyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8aG863L; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8aG863L"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1218111a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145324; x=1785750124; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LJuHQA4AENaPcuIoY4pYQA3muOxiEnEKnbdN4NwUjpY=;
        b=m8aG863LQXZSG1enA87VzBUgIZeBXkkBNicGBRRR4hk03R1ds7h6BetlvkwVfuRUIE
         LWztvQLMACTcr1soO11BeeSsANXJamRvkbKEP+2Td2dDtt42cNV1yfPEkHhPId6ClgH9
         UqcIbZDgKpr2TDPcr5lfNhG0BnOEPrvLrf2GBcq9JVHLJ1ma1nrWoIQqrcM2U7RJti3G
         nMv4zVr7UvXV1rTkDsM7mOHEq5YUPHOtZSi0qzHtTIfCEmemlq7Qj+PhDi1v9HvveunT
         cTNHM3IzHzwzEtoYRwLZTLmN5US3KScnAQv6+rhlmMBmSORq8O+pcKMKi6UdbJShCopi
         +CKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145324; x=1785750124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LJuHQA4AENaPcuIoY4pYQA3muOxiEnEKnbdN4NwUjpY=;
        b=hJaiIx8CNDVukHG7SvzLMV/UE58XqS1qnnqWvQ0qrIK2IWeDvmuReWOCaW7olTKMs/
         3B262CeYf9SvLOVUyZmE2ypNxBszUskyCmPlxKrzHx04/1SwCf6vStsbeMlFYC73QhbA
         6Z6ce4RmRVjXAxDQU5UUsVr9ABw+P0NL4vJBDrm651PeWstOtGl9kciajYmUvLcGy4xK
         B+MYv0tdjIRIaPRiKv8Ut7LKcJx52euXHppkCbvqk7GEnLf16Ew/za+ZRYePPmGunG8/
         HRSePzX5UOGHC+krUXJxv0F2kdKLdf4uiXRSdpa8aqF3LK1QTfKK/evPk4K71JtOM04Q
         296w==
X-Forwarded-Encrypted: i=1; AHgh+Rq9WvB3d0kQJ+4mx6GtroJgvA6GDTI0SsdRzPFcexFTev3r6aa1CAvo8wnR9nTg3c7Mrnkyf5Juf8OePTtV@vger.kernel.org
X-Gm-Message-State: AOJu0YwEunaRaBsWyOlfK6BAC4PrecIYqOmYSdL1yLSlcYcWNqZVFrhf
	mlo2KQ3aK8Wmkn+rlDSYaS2AWomIhFofoq4vBwZRxLdZ0+H6NHB1xz5S
X-Gm-Gg: AR+sD138Bcoo62V3JP7PuIaTHwIw2HtbRkLds16EMuCR6WbJSVBpt7LwO5oAxjbKm74
	4x9QTh2j+vETgIxhjS0N76d5r6aqxBq7QMoZ5ejzrk28moA30/vOAetRk9BW7BD/emaHIJH9NFr
	QHiQE6UnX0h8kI5WkNfgAWGC3O6kP9YKrrxIh9CNvCtcu9yNbt9/+RacqHi3YHaoeGKa8RiZ4Ud
	vEOd4wCz0w8LO8V98xIC2vYYXLs0D/JSMkDRtEfvpMH7/Kw/0I5bgwWV+vorv9JSNMbrYnVzemm
	WTDS7jO4VCHfrurgiTA+TEqD1Qlt6w4xAUGGgADqI86m7ILFgZM4HGd7NFaR8No4Jmv06tyrW86
	deLayqIxq15x7tJ8ZlytoKH439brganYWD5GCP/0+x3N32Klk4jL0BsgWVTKvCQOfWytk8NgvUg
	l6iDcEE6mzG5+e5am0iuvQzazHxCTByeu2/KT4pL9Cw3CQdfixeQiB3h//fHg5DXB5gbJnzv2Ss
	/zddctuQqJkZ3OpRbeYHDlZ8291Og/H
X-Received: by 2002:a05:6a20:7491:b0:3c3:a20f:f720 with SMTP id adf61e73a8af0-3c67df2ab08mr6797503637.36.1785145324251;
        Mon, 27 Jul 2026 02:42:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:42:03 -0700 (PDT)
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
Subject: [PATCH v2 02/26] ASoC: codecs: sta350: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:22 +0700
Message-ID: <20260727094046.23001-3-phucduc.bui@gmail.com>
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
 sound/soc/codecs/sta350.c | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index 99c7f7ac807b..2ba35076732b 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -16,6 +16,7 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ":%s:%d: " fmt, __func__, __LINE__
 
+#include <linux/cleanup.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -306,9 +307,9 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	int numcoef = kcontrol->private_value >> 16;
 	int index = kcontrol->private_value & 0xffff;
 	unsigned int cfud, val;
-	int i, ret = 0;
+	int i;
 
-	mutex_lock(&sta350->coeff_lock);
+	guard(mutex)(&sta350->coeff_lock);
 
 	/* preserve reserved bits in STA350_CFUD */
 	regmap_read(sta350->regmap, STA350_CFUD, &cfud);
@@ -320,24 +321,19 @@ static int sta350_coefficient_get(struct snd_kcontrol *kcontrol,
 	regmap_write(sta350->regmap, STA350_CFUD, cfud);
 
 	regmap_write(sta350->regmap, STA350_CFADDR2, index);
-	if (numcoef == 1) {
+	if (numcoef == 1)
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x04);
-	} else if (numcoef == 5) {
+	else if (numcoef == 5)
 		regmap_write(sta350->regmap, STA350_CFUD, cfud | 0x08);
-	} else {
-		ret = -EINVAL;
-		goto exit_unlock;
-	}
+	else
+		return -EINVAL;
 
 	for (i = 0; i < 3 * numcoef; i++) {
 		regmap_read(sta350->regmap, STA350_B1CF1 + i, &val);
 		ucontrol->value.bytes.data[i] = val;
 	}
 
-exit_unlock:
-	mutex_unlock(&sta350->coeff_lock);
-
-	return ret;
+	return 0;
 }
 
 static int sta350_coefficient_put(struct snd_kcontrol *kcontrol,
-- 
2.43.0

