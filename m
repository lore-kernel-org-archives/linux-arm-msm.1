Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 474863EFD27
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 09:41:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145277; cv=none; b=flvNfLUPK7tbZjr5gTxPLeWu9R3NH7ZfywkioEamSKALaJRGe/DnqhxXMEY5oHEUWtT4v1cp+NPikkpvtXfprFnpEJ0chRJjF81zGUL/JjXObrgifnppDQbf+8tmpdPyz+akGJFw0uJMW9CpoSoorhdQODPYOG3u11VdSOYLfMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145277; c=relaxed/simple;
	bh=P82t4hqH9bxCjztX8C/u6zRR4k6YPsmf6rKxZvU5M/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uea5L9f94k1VyzWnQY5aNFVaPJbt368KocI0UaWDpnNy6nQrohJYu4TU4YlIk96WpftK9Kbj5L4P2gforIer4lgyh6OhuHrctCBz6R4w0kLpfTohNarCBmhTrhVFhPO574Xwi3FN3XLUrnalaEKPbII9HUpG90V5W6TQMgX6H0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YYitDvK3; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YYitDvK3"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-ca7bea5e5b3so1789800a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 02:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785145275; x=1785750075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=usBMdmKc7yvdA1I7rGndYQ8td9V+pDiaypFkdoj2mWY=;
        b=YYitDvK35HbJzvJz3IHsxcCwEsR8h+3XtvFilExc8D4ir91wyyPPosPSmC8gaGeMnx
         actlywdvmH4XtVa2x/OVpfPiTXosRgtdECj9YUtpyUSrVIWOPD1tKr/bqErRfZuHxZtT
         BUitIVEJNjsmOmuwSeJ9TIqIf4SDvJ7Lr4saNxo9NbUgSJXhKOFbDb0wzRaflcxVVLhq
         JGkdyj4uUE6YoUcGhDg+wbJ2c5OVWplVTQq+VQj3f5RX7WD9b+VM19EvcZW3OeczxqMw
         utEFrfBtHWts1lzOmvty9c0a9rBGw6dXTaWgeiP8L5Gn9OWUoKj4H+kz9qaOHHPkKqEw
         TusA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785145275; x=1785750075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usBMdmKc7yvdA1I7rGndYQ8td9V+pDiaypFkdoj2mWY=;
        b=X9k3wyv7lyBX3Z+ue6GZHxUf8bVyNSXv2GAj6WwCwGLzYbOYTxNIq+XxkQnufPoQzc
         3wjOCaZ+YgcToFs5kUUGetQv2Bpo6Z3KWr7IIV8EZGCtURbgYo2JBuht4NPrPa0j2oHh
         skCei5qlmapOUg3s1fBLPIsvqTvC2BuD0/BRxWlcYbazPXHZDeD1SNI4DRgV0w2la2RP
         Uq5laMyiI5dvyMVxXyigkobLV0Bur/BVu7Op8nf7lxRaRLk9KhxNn4uTnav6y2VOmQG3
         gGaKunO6LTuUY5HVtgUTPWPquO8LZuVtvdJ1MR1T+CFdM/aRwECTfMQdSgClH3ZsZcbb
         /hEQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp4U9A3wNawSKCbzs35FDoqHoRR47uikJ4jlZ+tXpkKQwhKyLhMmoSBB1Fkbn5dUxl46uGulW88qkvjOJY2@vger.kernel.org
X-Gm-Message-State: AOJu0YzrqmwuBZevS/HAGOmiqoefjvwcyY8qfaliBOarHtudwu8uhQZa
	g2hUAe8BBasOR3O2L2JdIfNMLnN+HYm052/5+HMIFXCSfSMKW7jdj3qb
X-Gm-Gg: AR+sD115LT7bOMUmBU42AmtY5z65yVeBJjHEUktxN9ifrHl+VZ+nOxpCmg3jR3BvV0y
	If+XVaiBGfgrS1TWbMi1UEpAgQ/M31kkkTjlq7fx7/fnFPOHJB2P0isVS0kmYFsjedi4UtCMAAC
	+GABz1x6h0dlPKMoGx8STWoP+9a1ma0yq2+nQSEqCRTqiIM8OnfF9CGZAOQFcXNEsmSYwyAHW18
	oLUmHfs1GmQ9yV1BFw6Xh8qloexeMTmnsUqeiTInpEuf61Jx67Ci+8lVD1MWOAvHs89PvjSfOKx
	QHR4RGNDacpwI4NP/cG9CRdOuaUKF50LaqvaHvTHM0DJnPWkqENDjNYf/4wv1iAQ4yJ4jMs0lSX
	DkXO4wndI+gi7YEd8QJ6lFMEWZ4watjSriuHNI18UI/CU2e/z7Lj6pwhqATwyYSmxZ9dWltXLEt
	0PeEJEK0mWW4KvKbjR7rPjAyhlcdfUfcur1IgldG+w3WWN5NVsGhPUgJYam8sXiu5ryfyKmBeew
	C7siwtbFFGJg7k1Wf3j5Q==
X-Received: by 2002:a05:6a21:a49:b0:3bf:9c93:ac44 with SMTP id adf61e73a8af0-3c67dc48cd8mr6935875637.19.1785145274582;
        Mon, 27 Jul 2026 02:41:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66b5ffesm2959018a12.19.2026.07.27.02.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:41:14 -0700 (PDT)
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
Subject: [PATCH v2 00/26] ASoC: codecs: Use guard() for mutex & spin locks - part 3
Date: Mon, 27 Jul 2026 16:40:20 +0700
Message-ID: <20260727094046.23001-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Hi all,

This series is the final part of the cleanup to convert ASoC codec
drivers to use the guard() and scoped_guard() helpers for mutex and
spinlock handling.

Compile-tested only.

Changes in v2:
 - Add Reviewed-by tag from Richard Fitzgerald.
 - Add the missing `guard(mutex)` that was inadvertently omitted.

Best regards,
Phuc

bui duc phuc (26):
  ASoC: codecs: sigmadsp: Use guard() for mutex locks
  ASoC: codecs: sta350: Use guard() for mutex locks
  ASoC: codecs: sta32x: Use guard() for mutex locks
  ASoC: codecs: tas2781: Use guard() for mutex locks
  ASoC: codecs: tas2783: Use guard() for mutex locks
  ASoC: codecs: tas5805m: Use guard() for mutex locks
  ASoC: codecs: tlv320dac33: Use guard() for mutex & spin locks
  ASoC: codecs: tscs42xx: Use guard() for mutex locks
  ASoC: codecs: tscs454: Use guard() for mutex locks
  ASoC: codecs: twl6040: Use guard() for mutex locks
  ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
  ASoC: codecs: wcd934x: Use guard() for mutex locks
  ASoC: codecs: wcd937x: Use guard() for mutex locks
  ASoC: codecs: wcd938x: Use guard() for mutex locks
  ASoC: codecs: wcd939x: Use guard() for mutex locks
  ASoC: codecs: wm0010: Use guard() for mutex & spin locks
  ASoC: codecs: wm2000: Use guard() for mutex locks
  ASoC: codecs: wm5102: Use guard() for mutex locks
  ASoC: codecs: wm8731: Use guard() for mutex locks
  ASoC: codecs: wm8903: Use guard() for mutex locks
  ASoC: codecs: wm8958: Use guard() for mutex locks
  ASoC: codecs: wm8962: Use guard() for mutex locks
  ASoC: codecs: wm8994: Use guard() for mutex locks
  ASoC: codecs: wm971x: Use guard() for mutex locks
  ASoC: codecs: wm_adsp: Use guard() for mutex locks
  ASoC: codecs: wsa88xx: Use guard() for mutex locks

 sound/soc/codecs/sigmadsp.c           |  17 ++--
 sound/soc/codecs/sta32x.c             |  21 ++--
 sound/soc/codecs/sta350.c             |  20 ++--
 sound/soc/codecs/tas2781-comlib-i2c.c |   5 +-
 sound/soc/codecs/tas2781-i2c.c        |  32 +++---
 sound/soc/codecs/tas2783-sdw.c        |  60 ++++++-----
 sound/soc/codecs/tas5805m.c           |  21 ++--
 sound/soc/codecs/tlv320dac33.c        |  87 +++++++---------
 sound/soc/codecs/tscs42xx.c           |  61 ++++-------
 sound/soc/codecs/tscs454.c            | 107 ++++++++------------
 sound/soc/codecs/twl6040.c            |   5 +-
 sound/soc/codecs/wcd-mbhc-v2.c        | 140 ++++++++++++--------------
 sound/soc/codecs/wcd934x.c            |  42 +++-----
 sound/soc/codecs/wcd937x.c            |  25 ++---
 sound/soc/codecs/wcd938x.c            |  22 ++--
 sound/soc/codecs/wcd939x.c            |  20 ++--
 sound/soc/codecs/wm0010.c             |  28 ++----
 sound/soc/codecs/wm2000.c             |  28 ++----
 sound/soc/codecs/wm5102.c             |  23 ++---
 sound/soc/codecs/wm8731.c             |   9 +-
 sound/soc/codecs/wm8903.c             |   9 +-
 sound/soc/codecs/wm8958-dsp2.c        |  10 +-
 sound/soc/codecs/wm8962.c             |  13 +--
 sound/soc/codecs/wm8994.c             |  30 ++----
 sound/soc/codecs/wm9712.c             |   5 +-
 sound/soc/codecs/wm9713.c             |   5 +-
 sound/soc/codecs/wm_adsp.c            |  77 +++++---------
 sound/soc/codecs/wsa883x.c            |  11 +-
 sound/soc/codecs/wsa884x.c            |  10 +-
 29 files changed, 369 insertions(+), 574 deletions(-)

-- 
2.43.0

