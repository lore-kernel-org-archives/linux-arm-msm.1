Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492003EFFA7
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145483; cv=none; b=RqIVVTSKnMmJiAfQ2cyjIx4a4sFAKi0Ma8hHUYxJxErCYfB67kC4YR3N0m3uGQ5t4rQdfk8rX+rq1HRzQPAXmYVxmMfnGT9goiyFTmmmoZaUI+43oaXHzQZWqKhVrAiZn+ecADMcmMj7uJmhBwOpzKsZa4JhJOL8ESTQiASNo+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145483; c=relaxed/simple;
	bh=kBjl3twTLUXyDhrPcPReIAo4HeI4YCm+d+7qHLocuIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VuAlnMqPmttrFMQqg7cghYC9jAmfxKxaRstBaPzcUVVS+WzbnSs5frt2SAlbR+0GRhSPpEnoHQhXFXeTRyJdpozZlgj2vepmVozyRhfwb2iS0vrcBOPoamRJBTZyeCFhPrBil3EIF/83q7vWOB8gHQLVGurMjScPl0AhbE04wBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J/cSIYdh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J/cSIYdh"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-848595b338cso2700860b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145481; x=1785750281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IMr2hxZGzWnwyT0bYXMqG3aOyUmVvx9v8mVLfZZ6CkY=;
        b=J/cSIYdhiM6c1n3nGTstIpNsfriX4IXLiK3Ow4+yRsgNB2yiH2FRZcAug/Qj0Yws0l
         wLWMWMWJoSy2Vqyv14tfDiPrC+omRyNg4cnh8J+6dEPSJh1nBPu+o/UgrD342ebpjm3N
         TQfzvDQs2Iz+SCmVbA9TYma/XYlOeumR9gUJbapldcmLZSfmAPg3KTJf83GtobruSMp7
         G/pmZfV1tjYC26+qesNilyvT+LXMZjxaQw98dENKoLMfr46Rfe8qC5G+vizLaFXYVyPO
         oimE7ieghsZHAjK2WupzGrWZRwsrZ7SVRm4BNcSgqurfoHTz2+K09dwYYzO2HQiAZQaK
         MzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145481; x=1785750281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IMr2hxZGzWnwyT0bYXMqG3aOyUmVvx9v8mVLfZZ6CkY=;
        b=F3OweRjJSQLtbaayUftfQUBYAZ9KcSrVf7bCjpvWaovpzzDcTfjT8iJnI9YFU0S9mo
         qLM7dpxZWldwhEXVPcmaN/r15rlXbIs6cfkFaXKAHR5XT4w0LXEM1Ij+ABwYF01+flSr
         iJ7ph0aKJZAeI6UMef2Z6isjz4FY/8gG/zkAAb8xOjyUwTJq5H/zvzRl3mDJRqRIbSCV
         /jsuI6ub0lxRAe7YG2Ap1i+8JZ/i5+Uj/Z0/uJyuVDWkUrVMvf8OpdeAOC7uu6eVwZcG
         mBBKLyt0hhGttwwtuFF8FxOmo81mi0SCqPRr5nWLbBFRDK1KMG5YbgfsxwHrQj5bsbMJ
         Iy3A==
X-Forwarded-Encrypted: i=1; AHgh+RpKNNodGIgIiCxOkR/bt0eS3smVDrGdQHIVNLEIjqMRz9/Gx7na8pUAHhq9Gl00yOfBoaloKCkEi9AuLYxA@vger.kernel.org
X-Gm-Message-State: AOJu0YzgNLvvtmicAakBGmWGvlXkbZvdgMSU36myYZcM9ub08/qktWKg
	aDZI0Fh9JWsUclwHXivR0+3hxWdoGyzVyS0zd+V5AizS0Uhdoo+JlNMa
X-Gm-Gg: AR+sD10eEo1bfdKfWEDgjoj3u+CoWCF4A0b6Dao5TNQrwWVG6JK93XabF5/xR4ss9aA
	s+TS4WMG+GAmSzVStPhMJV9E1sI2bc6CwVQcKgucLHS3lbaACxxRCt4q+e+Kdy083QbEVF5hBUm
	4TNde9fGcHbR2C0vXK5iZ2iaKQvbd+2DUMndECORCmu/4ue3+IfX8W20HLvcEjy/nNvltW4P9yO
	gNJhTZAg5IqprsFdGCTtGAL87HEBHjMkI9irzEN+v5T+v6XbAjYSpXF8GI/mNagt8pD2SMj+j2i
	QuxO094ZsoNewQQemVREYfISit4IJu7CPrtUbmqzu5WO068m6bTf0F7jUbXim1SLI/w8bhY7CeP
	W7PE8UjbkvcTuBu1l7s3V2BRCLcc8wodj91apnszc/NZXQgaWUB2bw/srz/IuiuiZtIGTdCt+OT
	F3DPxLh56lQ1m0KCBKhllXd5WDrN8PgLeDm3T2LDCaEdPfP7RKdP7v6tI4FSEDFf+Ge75UysrD/
	jd9fUn9O42Xl1Cr5WH+Yw==
X-Received: by 2002:a05:6a00:1ca2:b0:847:8be6:2177 with SMTP id d2e1a72fcca58-84e594a3b91mr5890074b3a.34.1785145480633;
        Mon, 27 Jul 2026 02:44:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:44:40 -0700 (PDT)
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
Subject: [PATCH v2 20/26] ASoC: codecs: wm8903: Use guard() for mutex locks
Date: Mon, 27 Jul 2026 16:40:40 +0700
Message-ID: <20260727094046.23001-21-phucduc.bui@gmail.com>
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

