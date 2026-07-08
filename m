Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98EC4442118
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 14:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783520343; cv=none; b=D8v7CMUuYCGUo81+JDmzkfxxiMD82P7YrdrZzC/h6Psx4aVGs0MfOiYntwfY1Zn9xvaQ7E9pwEOazRjyUo5MLARQYOFOHnRpojDViHF68Jg09CdT70Ua4nMHctJb/H/tiDUjz1A2Sou4bTZgFxDOJjzti3mQpolVUjssZ93X/nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783520343; c=relaxed/simple;
	bh=n/840YNjFPZzdIursQsxvaZYSidZxuxtQuDzzwRo5L0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OsBNkEIkNsi/kqKpEUvO4V/ck1SaSjmES9nspBb3V75G1aeo1agI0+JspvBs1D2vE6xRlsgadZ2+KC/q0bNyEmzk8y73Fzjp7CmRP2rQIqqQDTxlrXSAiwyQ3yygmk7lPiyjV0Of4q5Lk+ex7Kjv/mDDUwhudS9h/vt7l3A86TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jlfPmCy1; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jlfPmCy1"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2caea3f742bso12751045ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 07:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783520340; x=1784125140; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=V4RGIQqrYA1Sqn81LNW+Ovu1/RvEI1nZ8BUW4X6wylc=;
        b=jlfPmCy1dImcoiSeuy8rBBtskVgARS5bFxGAz3BKsBKByNldCbN4kHRLXsHPsy1NHo
         czGBFQhxEA2eTnf0EE8UBUrYT921FavwnyFJl9Y+pJ78/lYSyHq8Wem4TxG41p5yloYN
         tCcc8QdqZyNCOv9OJnqk4Hyd5XsXlyoAbSMptrwluOEYTGaBaC7fcDLumlGskZUMIs8C
         ZOhWgyAR3MOTRezkbh1oEQsJa12WvFGo3t7tph5X8u8mHCwW7Ed58iZgGuWEcS5uJYda
         ZVQHuuJvIDlv/X45yPH7xarPyYAJi5nkZfyXBgUSun5hGowMgcSoiXzikeMOMCMbA2Kz
         pOMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783520340; x=1784125140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V4RGIQqrYA1Sqn81LNW+Ovu1/RvEI1nZ8BUW4X6wylc=;
        b=O+M3JwvO7UfdyYNggUATGX/UP1LWzJu/I3p0vMXhVifhjGXdobCN84kUfweNh26HZ7
         jT7K89Y7GT8kPdG8C5Jb5NARvI3BkxfbDfKdt595Vd6TedvoHuwvEqCeqBPA76Nqqk5d
         ZRct8St5f5uE/vdzC9Su80spj5363ae5/wQ4AgMjcpECQWvSftKN4BRcKNqdwElhu/oc
         cTW8mQIFXKcVaL8XTA//6F1Jy7yMw6StRdxZ0lBG6AWMrKLeDHftlvfLPuE0k3vhsGIw
         4Qb4TOtvjw2D5IBO6b+r18AbMovCXdRT4+jiQ3hY0fgCScStv+qy7vP4KTMWoBOC29TL
         pJfQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+3WUYIpz2EyjO4v5j6b9X9tGQ2WVBApM9tc5Q9+7EAI49k1qJFMbqxKnR6bCbo8BK2lRTPXLbDkg/+Edg@vger.kernel.org
X-Gm-Message-State: AOJu0YzTNhHhPTPqds5g0IxrLE8B4zEqy8PG8GgFQ57gBS5aVPV0b0fm
	SVxM8TkDPjJ1J9dwBPoA+KrqDHvZQDVWz29w7pNrv+p+QHg6JgeO+QdI
X-Gm-Gg: AfdE7cllL1HK3hsIXGGmmtmj9QAf4fRBC5No5abBolt/U+V7KKxPS71X41N+nEtJN16
	WCtRy3G/TxcCO2bDlN+e9fDfaU2AVX3IATDlsGhA7r+GkAvOxEiP8IMJyBGuMmxdU64s2SYcyZs
	yOnbIAdB69Gld0GEFYzwHjYNjBT4KBLtzYhS88gIkpAxvhRbIEYDNCD+Xr6kY6PAuz8hO8Vc1VG
	7q76AKhKjJ0JqQBAOtfRekhelMiZltX+9ulCpeVKu2YoZVWVRm3Ma3vNRL9UPxIqQhdvnQ1NHQP
	UJmt2H44I1UiceCjx9m7FrktkPfKWxt1GIWkIsuSdJuGYI34pI9/Q3os6IfIvjLf1qzan/xO4nV
	McgXNTyjUSVgqwB/TxnhdJudzR6t2Dq0oRNbAxMoKnAeusUUjZSPXvj5blymjlCDbWCV0YPudzn
	w6VbpI+jWpeM9DgC7igiUzjBjgnbS4mUVi7QJma7oIkJooh/k=
X-Received: by 2002:a17:903:17c6:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2ccea480bdfmr31916225ad.32.1783520339948;
        Wed, 08 Jul 2026 07:18:59 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d3bcc0sm28841575ad.67.2026.07.08.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 07:18:59 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: Support Opensource <support.opensource@diasemi.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Srinivas Kandagatla <srini@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Linus Walleij <linusw@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	u.kleine-koenig@baylibre.com,
	Zhang Yi <zhangyi@everest-semi.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Kees Cook <kees@kernel.org>,
	HyeongJun An <sammiee5311@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH v2 00/27] ASoC: codecs: Use guard() for mutex & spin locks - part 2
Date: Wed,  8 Jul 2026 21:17:07 +0700
Message-ID: <20260708141734.578926-1-phucduc.bui@gmail.com>
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

This series converts mutex and spinlock handling in ASoC codec drivers
to use the guard() and scoped_guard() helpers.

This is part 2 of a larger 78-patch conversion series. Part 1 (24
patches) has already been posted, while this series contains the next
27 patches to keep the review manageable.

https://lore.kernel.org/all/20260617103235.449609-1-phucduc.bui@gmail.com/

The changes are purely refactoring and have no functional impact.
Compile-tested only.

Changes in v2: 
 - Add Reviewed-by tags from Charles and Herve.
 - Address Herve's review comments.

Link v1 : 
https://lore.kernel.org/all/20260630063449.503996-1-phucduc.bui@gmail.com/

Best regards,
Phuc

bui duc phuc (27):
  ASoC: codecs: da7213: Use guard() for mutex locks
  ASoC: codecs: da7219: Use guard() for mutex locks
  ASoC: codecs: es8316: Use guard() for mutex locks
  ASoC: codecs: es8326: Use guard() for mutex locks
  ASoC: codecs: es9356: Use guard() for mutex locks
  ASoC: codecs: fs210x: Use guard() for mutex locks
  ASoC: codecs: hdac_hdmi: Use guard() for mutex locks
  ASoC: codecs: hdmi-codec: Use guard() for mutex locks
  ASoC: codecs: idt821034: Use guard() for mutex locks
  ASoC: codecs: lpass-macro: Use guard() for mutex locks
  ASoC: codecs: madera: Use guard() for mutex locks
  ASoC: codecs: max98095: Use guard() for mutex locks
  ASoC: codecs: mt6359-accdet: Use guard() for mutex locks
  ASoC: codecs: pcm512x: Use guard() for mutex locks
  ASoC: codecs: pcm6240: Use guard() for mutex locks
  ASoC: codecs: peb2466: Use guard() for mutex locks
  ASoC: codecs: rt5514-spi: Use guard() for mutex locks
  ASoC: codecs: rt5645: Use guard() for mutex locks
  ASoC: codecs: rt5665: Use guard() for mutex locks
  ASoC: codecs: rt5668: Use guard() for mutex locks
  ASoC: codecs: rt5677: Use guard() for mutex locks
  ASoC: codecs: rt5682: Use guard() for mutex locks
  ASoC: codecs: rt700: Use guard() for mutex locks
  ASoC: codecs: rt711: Use guard() for mutex locks
  ASoC: codecs: rt712: Use guard() for mutex locks
  ASoC: codecs: rt721: Use guard() for mutex locks
  ASoC: codecs: rt722: Use guard() for mutex locks

 sound/soc/codecs/da7213.c             |  37 ++----
 sound/soc/codecs/da7219.c             |  62 +++-------
 sound/soc/codecs/es8316.c             |  31 +++--
 sound/soc/codecs/es8326.c             |  30 +++--
 sound/soc/codecs/es9356.c             |  29 ++---
 sound/soc/codecs/fs210x.c             |  89 +++++---------
 sound/soc/codecs/hdac_hdmi.c          | 117 +++++++++----------
 sound/soc/codecs/hdmi-codec.c         |  15 +--
 sound/soc/codecs/idt821034.c          | 144 +++++++++--------------
 sound/soc/codecs/lpass-macro-common.c |  12 +-
 sound/soc/codecs/madera.c             |  39 +++----
 sound/soc/codecs/max98095.c           |  35 +++---
 sound/soc/codecs/mt6359-accdet.c      |  13 +--
 sound/soc/codecs/pcm512x.c            |  19 +--
 sound/soc/codecs/pcm6240.c            |  25 ++--
 sound/soc/codecs/peb2466.c            |  16 +--
 sound/soc/codecs/rt5514-spi.c         |  21 ++--
 sound/soc/codecs/rt5645.c             | 160 +++++++++++++-------------
 sound/soc/codecs/rt5665.c             |  15 ++-
 sound/soc/codecs/rt5668.c             |  10 +-
 sound/soc/codecs/rt5677-spi.c         |  36 +++---
 sound/soc/codecs/rt5677.c             |  75 ++++++------
 sound/soc/codecs/rt5682-sdw.c         |  24 ++--
 sound/soc/codecs/rt5682.c             |   5 +-
 sound/soc/codecs/rt5682s.c            |  17 +--
 sound/soc/codecs/rt700-sdw.c          |  14 +--
 sound/soc/codecs/rt711-sdca-sdw.c     |  30 ++---
 sound/soc/codecs/rt711-sdca.c         |   8 +-
 sound/soc/codecs/rt711-sdw.c          |  24 ++--
 sound/soc/codecs/rt711.c              |  46 ++++----
 sound/soc/codecs/rt712-sdca-sdw.c     |  30 ++---
 sound/soc/codecs/rt712-sdca.c         |   8 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt721-sdca.c         |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt722-sdca.c         |   4 +-
 36 files changed, 569 insertions(+), 734 deletions(-)

-- 
2.43.0

