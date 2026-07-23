Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0515385D68
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782438; cv=none; b=n6f+ug+UQHKZ4EFd6yrT7J6CVeQqlbsjYIK0P4ic8XYPfjP6uXpEskpFVtXOGAhIfzYuhYSZkbybH9qaTIipulg53MtfXuVzn/wZ15KkWxJywjRdNPRZ3usAZImrEieCRKY6NL0XDRFL3mrNFctu03EgtacnA5Iirof6EoFK/lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782438; c=relaxed/simple;
	bh=1m7GJ8YWaP7wefU+zhqO4O/9UTZF7BSXndpbKxTVTpU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lJEMggS+hD+9b0B40sMNLzL29JeyR+EFJQOYf1r3fLfCnv88rioQ1MTJE1pUhtJbQ1Wcc6B0URCBvBevKytO3tTVGOXtHpglIQ7cpxrFdpISF+KOjCbsJLNKAZkF7qLqnUGViA+JNHVshLkyzt/0D+oALYzk89mYQuAce3oyck4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mppCFj+f; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mppCFj+f"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7e86e7aeso2546785ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 21:53:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784782424; x=1785387224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HPmSshlx0VhFlDIeKTOyyoSslyu9w/lmyi2JYXnbRm0=;
        b=mppCFj+f5LZwWHlPXluwcDuWJfE8mLfCIQzIOqq6lh+UHHqHs7PE6CqLON1JGb4c57
         fxbXr/r+yNWjjJhlYbX1T2jInSK3Bj3gC2E4ztfGMdN0DDH9PqP3/afm5DyGR+vfXA0d
         hIvhl2lLO5GcdYJTrKmNBQS4ZDv1pHxgn84pq/D8oJgG4e/Uoej7e21fPQ2F8fVd4BD2
         cgvIDWXcfcayu4kLwnW5Rqu24P1IitsLTN2MaIDnT4K3776h9vGh8UkLnL4dsPT75CBF
         oBRMhcRG+wUZM/QRB6Zx0PHRko9Np8BTRJTEOWHiON9Pxtw6Pgjt/xEWkBlfDAaZHEnJ
         OKSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784782424; x=1785387224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HPmSshlx0VhFlDIeKTOyyoSslyu9w/lmyi2JYXnbRm0=;
        b=NDVQktQVpsl9Xz5CfOrLLIvzoRbUhqJuey4riNQroWCJkBQecFlkx8Txg4bJma93FA
         LMQcJhwiGE0WulYpgCZHmR2EjNqjDiVIqUcZXroLwIeKRQPJEsq1bGZEx1JD3Le7U/ZD
         Svmw30xPtyxuCSiHL/ziKaOa9/PGMGkdEjdqfkOm+NEVaF2Rh+t+H3tydj+KDNlTwdgW
         3fpqNzVE9BzOlFAy3xWlGeQdurvrP4ZBDX8n6clLy8hRUdbkkbJyWekp7I2oGF1f7hUv
         +JtZumlusvz+ycIb7JkeWO4wFIQSFXomvU34vfFaMktUagKS77tUDPt/GQoPSH8IlvTp
         zvZw==
X-Forwarded-Encrypted: i=1; AHgh+RokB6BSuEAG7wqaxGmir7eriBd+TPxPQHKVzN4PQe4t1AgAvYdC+lQcidCrtRvl6oUTdthoiZ6xIiHokYT+@vger.kernel.org
X-Gm-Message-State: AOJu0YxBp1daKf6siBXRqUmZ/W6EUKXxw1qqX97FHawwwm6sTsYQ5DH/
	O4W2oiqxI6+9nDezo3P/OFqdKw+ZrLQLSvbHbmJAl6oW/8JMbtX1ZloS
X-Gm-Gg: AR+sD11C68pwlnRp2DFx1hHWteHN92pYbWr/t1hy07ODcQHgk/bKATPuRYLRJYs7KcT
	HtBHZIXSFrE3EKcTh1XX+7bW/QlFvbxhoUAga73RHoekQVqCv7PGf5md3Hu/ybgV6M4MiE7gNwf
	ZJ3UOuho2Y6+1Otda5dsdXjqJmvyFDHi3kP9bGNutVWUhErCJ+bd3xgRmN8PwY6ydV0UPjVF9lu
	XDsumy57wYYSk2FaIu8tzhQg0vdTJos7KigdPMltP5W8JkrwdH4v9tQYBp3hgOQ8nxAmogwgA8Q
	xYP1rfi9zWrAis8eGlOswo/i42C6WZ1gfNOgB4xGsPccl2WRKxEQ5Lkg5LUgQ5XHcn1R15OYPqT
	P8px5KpEb0RMxeavRQ0p+j477eLuXo4N3SU/u1gF/S1Vup4KIrYZm0Ii4xjdOGrs41ckDOMuUTh
	9o2ASoFqtwxTY1/AJgZRA2i+vDG2+/Iv5f1pvArlEq7+akEj0=
X-Received: by 2002:a17:903:1246:b0:2ca:4cfd:a6df with SMTP id d9443c01a7336-2cfa6f821aamr20406655ad.43.1784782423932;
        Wed, 22 Jul 2026 21:53:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfa57542e0sm7258365ad.67.2026.07.22.21.53.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 21:53:43 -0700 (PDT)
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
Subject: [PATCH 00/26] ASoC: codecs: Use guard() for mutex & spin locks - part 3
Date: Thu, 23 Jul 2026 11:53:01 +0700
Message-ID: <20260723045327.28260-1-phucduc.bui@gmail.com>
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
 sound/soc/codecs/wm_adsp.c            |  77 ++++----------
 sound/soc/codecs/wsa883x.c            |  11 +-
 sound/soc/codecs/wsa884x.c            |  10 +-
 29 files changed, 368 insertions(+), 575 deletions(-)

-- 
2.43.0

