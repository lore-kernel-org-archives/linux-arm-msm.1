Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 103F83C7689
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629581; cv=none; b=a0XWm5JlJkYr+qgIIEjwD9TZw5c9KvHRq6DLbU1ocPqUho1yWEDlRtXfevpxrfkvVCymvpjyHJ9f2M8ncgDOiqZpv8UNtnsKJl3NU1OmDOfMkBn6fnc1+txdGV0JikfSWdV4r8wZGg80O4DA/j05auLpYSxVTTzBLXXluaGCROc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629581; c=relaxed/simple;
	bh=+29AR44PnhPvIOc32YCrP0t1pVEUsI3d6CZnHSt4JPo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d62sFWEO7HtHIz56k8D1TqOmyaxyQEn4rYGHmbTC80QFrC8GW3ktcBBIeO5vgrqoi19nUJx7wnjxOScZRUfGlFQY8KCuX5AUoAHgRXno9Kk5NVw50qdUhwAIfLG6fhRzFDMgqjg8cjojw0Z4STCimijP+hKuZnUyjNE9KiKMKkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VucZGTqm; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VucZGTqm"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso127569475ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629579; x=1785234379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=0cwBADZ+M6LWlMFTgIEAl7+KkE8RhKrW3GGwqzI7cnM=;
        b=VucZGTqmOZomcEPX0+80faOKrWU4sEcVMqqNyuT1hy4gQ4MuMKbayq0Ig65UiA7+Zn
         3idTNSnlPLwbvW+vnskExELIponZEAPM2M2spyQTAGmECtTgPuzQJMTN+Jyi/EPhqcHW
         sZRpFZMH/IPm3K7lfhLeROINWbSF7UEhq4VjGYPXR/zUC6kQ9Uq/SMZBm2PAIE4sq1AD
         VPe8NYk/MYjl0Hz+voNb85n2sjB+DFoxcck7JJph0zfSV+VX1rvBgFi6eQBSeAeTC8Ie
         ykwgENMDclqzI5OJIO28MYtUj4zEW76j/+XifdkOsYtB/c0sor8IyH5Tmh+rabE1xsrr
         Y+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629579; x=1785234379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0cwBADZ+M6LWlMFTgIEAl7+KkE8RhKrW3GGwqzI7cnM=;
        b=q5Qm7f0egXylXmbpMafIZAThhsv0lJF/L6TrqdGBcYDTzhcxkVCo9tOHeO9xXcaTum
         +7NIzfJJAqW0ko609wVf0tRfcPayurvSMUxmCjcPfqMchQoUO5Xf4W8QU1WeCx5+wb7X
         ywlqQAlUSCtNun95qYwWmW68EJ89z4zkBXJGOqS5nT8/UHpEFkRmn0+FCtHQt782PNw1
         gie3+sDTA7GHg+N12EyJ7/L8LtPybJFr40FVkBxtu3UW4Q9f0S8wUtZ56QDD8guBHJsN
         IfdgqUBAeka6pNBI6CCX/Vwp7SI7OoecL2GFoKEr+0+GbSjd/7XZDxxWRGE7ljrciZ23
         r5ig==
X-Forwarded-Encrypted: i=1; AHgh+RpJ02GOgIoUWWqdr1t3aJMQ+ye6wRs23Mbs8PvpK53YYekXRaM4pc9sXBf9IaO3P2pL+2ndX71rDNMzVzvu@vger.kernel.org
X-Gm-Message-State: AOJu0YxlJN6jq7Im0VJCbc6Kkp+znVkRdt/ohi+HJTqt+g4Bjm1NWb2J
	AaJQFMTIvyWDnQu/auFK89mAvLJGNvGnx0ZbNQnqRE5MT23Nt2xhDIz5
X-Gm-Gg: AR+sD11QLL8oP8CnGl9N6iOxvZlgxTCNXzWcGq8RxpOm6P+3vOdZMRvAvzZsNZmjjeF
	7X1nuJA0yBvY95niYWIKUOIPH5P+ouCRbsp4VJ31N0aaPs1RIFa7KN+nSxkz03Ldc3dmru2GMSw
	E1KN1con4PuCqdxSG8DFy7IyycDX9LLEqfFseypj1FS9sZGRvNy3jOM3HaNbHvXHN5hF4on4xNJ
	BipJL3NLjYcdsTE3m/BSINChxuR0d5yx5mBbw7lgq7bB+RWE22q1RnSwsx29KZNgTaWrNpgdBBX
	js92/v3uztqZ894YhdjhTJf+au9UuZAmo0aPjX3zeRwvZS4wJIwqa4nodot66t0sAGGETYZKXie
	6wyoAvejoha+xxs7UH4O8ysbEyv6amA5MJylmOSwP97TCEHGVvBdUfW7QfxVD0YpwjJ6huqQnrD
	D4yblpqchstDu+mLV7vE+Emp3xTqGmHiRCVV+G
X-Received: by 2002:a17:903:1210:b0:2c9:d298:6c06 with SMTP id d9443c01a7336-2cf34a0a6c0mr183821275ad.25.1784629579348;
        Tue, 21 Jul 2026 03:26:19 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:26:19 -0700 (PDT)
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
Subject: [PATCH v4 00/29] ASoC: codecs: Use guard() for mutex & spin locks - part 2
Date: Tue, 21 Jul 2026 17:25:31 +0700
Message-ID: <20260721102600.523199-1-phucduc.bui@gmail.com>
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

Compile-tested only.

Changes in v4:
 - Included 2 additional codec drivers for cleanup.
 - Simplify regcache error handling in resume for both rt712 and rt721.
 - Remove goto labels to streamline error paths and prepare for guard 
   cleanup.

Changes in v3:
 - Rebased onto the latest broonie/for-next.

Changes in v2: 
 - Add Reviewed-by tags from Charles and Herve.
 - Address Herve's review comments.

Link v3: 
https://lore.kernel.org/all/20260709045902.498848-1-phucduc.bui@gmail.com/
Link v2: 
https://lore.kernel.org/all/20260708141734.578926-1-phucduc.bui@gmail.com/
Link v1 : 
https://lore.kernel.org/all/20260630063449.503996-1-phucduc.bui@gmail.com/


Best regards,
Phuc

bui duc phuc (29):
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
  ASoC: codecs: rt712-sdca-sdw: Simplify regcache error handling in
    resume
  ASoC: codecs: rt712: Use guard() for mutex locks
  ASoC: codecs: rt721-sdca-sdw: Simplify regcache error handling in
    resume
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
 sound/soc/codecs/rt711-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt711-sdca.c         |   5 +-
 sound/soc/codecs/rt711-sdw.c          |  24 ++--
 sound/soc/codecs/rt711.c              |  50 ++++----
 sound/soc/codecs/rt712-sdca-sdw.c     |  50 ++++----
 sound/soc/codecs/rt712-sdca.c         |   5 +-
 sound/soc/codecs/rt721-sdca-sdw.c     |  49 ++++----
 sound/soc/codecs/rt721-sdca.c         |   5 +-
 sound/soc/codecs/rt722-sdca-sdw.c     |  29 ++---
 sound/soc/codecs/rt722-sdca.c         |   4 +-
 36 files changed, 587 insertions(+), 753 deletions(-)

-- 
2.43.0

