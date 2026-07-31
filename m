Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C3833F599
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 03:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785467389; cv=none; b=EbS4EthweY+TWu0uUEeAbrXfCADEoSjef9f93S1NHygvTaIwnX//UfAyuS8Bch4eUwjTUyBtPVctPXRN4eqaW+10SkfoZDvtD+HgN7aGlJ3iGTDc1LP+QG2wdKqv51dVTTfyLunDanpKWzUu3KGh5WsgTD7jaDkEUMRD5F2Crvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785467389; c=relaxed/simple;
	bh=vpN2A9O4qvdLlonbqA/XuQfb1LuR+j9NwgCpSS8HwG4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lp8NnrVz5bxCTQJhNQFKvjJ6H2ye4+VwDFPjjocUUXdWzKabUTRzSXXAgk4WUC7cMYfJPhFoIy1KHc+zXJgmeTW8IO5JsCDCitcrQ+IIkVVZ4y/FTMYddK2gN1JOuV7YENdeg6bUsOJcM+BtNZhKrxlM2rU/D+DJSi8nFiQIZM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hWjErBa0; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hWjErBa0"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cf52d15d88so4000265ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 20:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785467387; x=1786072187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VhQaA520jqTXeiP2LZVSUznr51jV47iUF83rucdWFWI=;
        b=hWjErBa0cN0hNYrMwQCy9hSOiJrf3aeplVAehNb3EJxyJrHF+imX7U3IdxgwOh0rbb
         XrqH4HLRxH6hQZweIRjAw6hTrtBHPVAQdAkDTR2ESc3yXU6b/FjQG/nuRPMp4wmi8NxU
         LqsUxNwDEmVDp/316JR6ha+5s46s616SQfQvMG1qSBViHZPvDh3/npbim7b2qyrZa3cs
         6JPpiVzCE4MAbas1v4o1xmijpnS5CLN8m4zAsdbQNZ8hvb8ASNVTUzwUR1WPWEubgR8c
         s/KYklSMtj8lRwlozC2TjfkJPeVS+8263bPseNvrUnJn7ajfg+RLNrioAIirZOQBeRJ1
         U2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785467387; x=1786072187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VhQaA520jqTXeiP2LZVSUznr51jV47iUF83rucdWFWI=;
        b=Lho+LgXNloR3Cb6dDDbXJDOnurl49oAvAoXQIvYGTnQBPEhR2x9a6ZgOPm/xtuIx6l
         R4W5b1K3MxLLQvLfTgMcpb9ugIgv9bQ4wYbm7OyVO6ESJXoPtdq2JAKCaPCIOmwFzM6t
         tGpHZbaAqZiyteKX667ZqZtG7y/FkPy2NaSGqIbUNcXvMKiQoWAGWK/YKvQ68wF8brBF
         dPvKnPB6rVh1Ijy0Svu7YILL3qVZeWiKIzb1nCCJgcvpd5+3jtQrRqKBmnD9XA2lmOAZ
         GiHBM0nvkkQjzpnHK5FgAjA0xg+psvkGNYxV2UHHJmo28GfC/1veSKFhZ3NiIscXSL+2
         DytQ==
X-Forwarded-Encrypted: i=1; AHgh+RrdTJRzG5UyRRcJ03a68nW0oWdMl7siXSnbx82bkvtU9hN3LjqlVC81NE/UYObcD52Q2ahzaP7QrF9yczMV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzlvl7lQ6efXCriBr2V17vj3togDNhdp7ZIdDAXQ1Vu1WpM12Pg
	+B4sAzcYhcSiaw6jZG2vvUM01NUn/AQqloe9i8YELQF97A57oP2fQjNy
X-Gm-Gg: AR+sD13cWgYdQu1OuNE+GzhU+jcazPWujuZ/fey+GM+41R042G1jOzNpluDKUCPvFMu
	B+kqRIujV5rj5Mt1pmP4kJbvR3Wp58Y2SuwQ3NdG1stpEWbS7tB7/0mADPQVhMmQjMeOSGHyBB+
	eVDoC2vxmstHBQQtm6E4DeeOsIyOL2YkQcNzvOy0saS+uucUN7TkbPsTGop7Px2jBxsZ4w2gSPp
	ZngfANq5U56yGVXyNv1S7P8SOkEUYK0l4FmM7Me3oyPB2eWCs9jcFlilvz77hZ6LX89zZtRrhL6
	YviYwgdCr4hcYo14xh1pUCVONKcCR4cTLMQiM+IdWXCqTMNNp9APBYGLhtIGn9VFK5AxQaoXMRy
	ZeaFRfs5fBKJiDQudd7UUm0N8yIm6xRttv7uP/R+8XwJWJKN6HpwQ1Er4JHAg2pU3yPwCBwLejm
	0i1rfn4hrmp+0/W6JuzrI/hAYkdJTG5vekvg7HkW4cyaoSvFWQXS910VBHCpcOK3vlpy+wnvoXi
	ZDAOVfNS7RKSHnOfRt6Obgt+AvYmBHVFjY/8mjeLzFgd63BdWSfDObQOiwe/5CPKAQ4IquZNjBg
	iKAH
X-Received: by 2002:a17:903:1a43:b0:2ce:e747:c5d4 with SMTP id d9443c01a7336-2d046edfb62mr4291015ad.46.1785467387450;
        Thu, 30 Jul 2026 20:09:47 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d047ae9f31sm737595ad.60.2026.07.30.20.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 20:09:47 -0700 (PDT)
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
Subject: [PATCH v3 00/26] ASoC: codecs: Use guard() for mutex & spin locks - part 3
Date: Fri, 31 Jul 2026 10:06:22 +0700
Message-ID: <20260731030648.8706-1-phucduc.bui@gmail.com>
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

Changes in v3:
 - Remove redundant comments per Cezary Rojewski's review.
 - Add Reviewed-by tag from Richard Fitzgerald.
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
 sound/soc/codecs/tas2781-i2c.c        |  33 +++---
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
 29 files changed, 369 insertions(+), 575 deletions(-)

-- 
2.43.0

