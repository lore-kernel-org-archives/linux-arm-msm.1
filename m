Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8EFB4D8DB3
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:29:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629800; cv=none; b=LzxS+zFzE7hEalxp8ijUmZKjqKOMO1RQMh4KueQl1FeVwub+vh4DGzmB0fXIAh+aKSq0Tp0ZnAt3hEBzXsFxcfyO6JGeLRJiRYT8risn0ePBF5o9MFPClx+hE8FU4gqSA9Dav9yX/4pbuTnxVhjuqwvCMKejabuy0hwtH9Okl+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629800; c=relaxed/simple;
	bh=qbBdxV0HbQfAJ4j0QSXdXWta72IP+0GjR3MdtixOid8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H7ELuecJVQNSiomI8Xz08Iz4m1BHVLNhGUhGPwd9NFirV906jVBMwSg3POYJmIAjAu8zt01z2NfF95PLqJlPp4/vJBGkxG3suyDLq5JW/rZId/mqVCJXoqwRmlL/YRbxR/2J2pmpXP0kRYeRHmT16/CD44BbN5W7PUNcauFcCgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I/k1uNWV; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I/k1uNWV"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ced3386430so74025265ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629795; x=1785234595; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/AG1aLLSk1A+OF1XRTr/NNeiulfMJPmRiCY4S1R09y4=;
        b=I/k1uNWVH5bx1Odd8iRFccgm4A6WbnVMOknhzGRa63q7qcK2cQkLArByiJQ6FC2XBY
         G3aRGP4Eo3U8/v97X1xIy6+3VsI81Sqj+jlBPjWMRc38xFtI/FZGOh3KRnieDsZ6Fs2i
         BpOdps/Y9WYDVq24fDWvdeJA5ZMySCNuAWOx8MaW2MkDvKRUo7B+JNwtIOZONuSN84gc
         HWevKD9PSyv8ye/688L+zEAcmOhGcu1g9CBwaT4yhCQ09dkpbjeLx/cDE83LeB9/reOG
         SW6P/eHst+i1EDolBfcShoxKGSk9aX3caohHac9Z77XwlgzIDtwIqCCvuJ1gUZpBw8fE
         FXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629795; x=1785234595;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/AG1aLLSk1A+OF1XRTr/NNeiulfMJPmRiCY4S1R09y4=;
        b=EXh/XvyX80Qpkg81j4SHzb9OrerZ/lcQFXJS6kWyi9UBE6o4wd4lph2bXe0954Ej2z
         JoCRyNaIGHzNH/R2xPgxZySc3MTQx59BOCcdTH+8udGjJdcIi5M/NGMWLIMzr7iASzIW
         yAGao27ad49CRx7H4DvJc56NPhSeMoQ7yRmHHXUQ+CuAtWiWRpHOIKcN7o51L36qqbt2
         emRBCL7SC/XUPOFp6sIPk2el7GNh8PYQyttM3LZ/A1U5VBebpJaNUxn9nDKCL4NQ2B8l
         9XAXy0EOAwuRGHE+iEL3sniKET4ib/nRyDE35WNmOUGEE+cEfZ53h4S3Nh1JUS/PGFEB
         O1qw==
X-Forwarded-Encrypted: i=1; AHgh+RoHX0r7uJUO8DBCuzb6GFi+4eAyC5Yo75lJCLtZkKD5DFbNBGK+AGBW4/kdrrNZP0rfEsOpPMzbMWrHzzbJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRTAFIl2HOX5Dfqg/s4xaGNyjLAPbzauBLa6q4hxOf5QJd7VA
	Q0NDM9cYBnGe3lCvY0Vl2Iuew7TzO5ToQiIgxqEar2MH/+GgPY5FnktA
X-Gm-Gg: AR+sD12QHfkYsNLyt/Oua4w9nYgPG6tzt3Wts3x6thR+hWy7i+mWQJTdN8VUpFYag5x
	7j0txKQU83xKeJOp4cgNzFtQAi/IpdkR7NczaehAO8xcsraH18q6SmlHM1Kk7Yra17nL/GSxs4M
	AG1zC26/HKuS92Pcx/6yErJQiAMCWxYlZ/ROeUHuA2jGBUJaQynLRFSFDcq1w+GEK3ue/zoPGmK
	HkKt6sW0LlQzvay1tRfpzqiQn6fkh7dpZbI9dN+OfQ2sezAPHP/98D3zVzhgy7tevFqYeLxLBpt
	r6lG+1t42UgOap+FvwjhV+sKf5VTaQfhLtDOSz8PXfX5ZlKtUbxW6dO2XVWONh/tbz8z/+Bw6zq
	QyU/wpiGNfuvPkd3auEzD3NvOaVC9yNSyOlLqD5iAfWNSTyCU3P75GhfmE5HBoMVXLml68hLmdl
	osLvYNTAbWD3h6NE//20RSRTtrbMLpzxCIIwN9
X-Received: by 2002:a17:903:2f8c:b0:2c0:b6c7:2271 with SMTP id d9443c01a7336-2cf348047e3mr198541925ad.4.1784629795303;
        Tue, 21 Jul 2026 03:29:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:55 -0700 (PDT)
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
Subject: [PATCH v4 27/29] ASoC: codecs: rt721-sdca-sdw: Simplify regcache error handling in resume
Date: Tue, 21 Jul 2026 17:25:58 +0700
Message-ID: <20260721102600.523199-28-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721102600.523199-1-phucduc.bui@gmail.com>
References: <20260721102600.523199-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Calling regcache_mark_dirty() on error is redundant as regcache_sync()
retains dirty state on failure, and any write in cache_only mode marks
the cache dirty anyway.
Restore cache_only directly on error for active regmaps and drop the
redundant regcache_mark_dirty() calls. This also removes goto labels
to prepare for guard cleanup.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 6e27e761afb6..6411df4eede7 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -511,22 +511,20 @@ static int rt721_sdca_dev_resume(struct device *dev)
 
 	regcache_cache_only(rt721->regmap, false);
 	ret = regcache_sync(rt721->regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt721->regmap, true);
+		return ret;
+	}
 
 	regcache_cache_only(rt721->mbq_regmap, false);
 	ret = regcache_sync(rt721->mbq_regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt721->mbq_regmap, true);
+		regcache_cache_only(rt721->regmap, true);
+		return ret;
+	}
 
 	return 0;
-
-err_sync:
-	regcache_cache_only(rt721->regmap, true);
-	regcache_cache_only(rt721->mbq_regmap, true);
-	regcache_mark_dirty(rt721->regmap);
-	regcache_mark_dirty(rt721->mbq_regmap);
-	return ret;
 }
 
 static const struct dev_pm_ops rt721_sdca_pm = {
-- 
2.43.0

