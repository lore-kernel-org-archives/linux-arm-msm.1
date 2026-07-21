Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D0E4D2EE1
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 10:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784629780; cv=none; b=HgAQDa38uTYehhe9qlvejaRooUdU9P9cGTNNuJp4iS+A3BxKxDUK+k83qYwQs1nkims8ievfYvWnaTzrEQl4KhSdZ6AsHbPfCwt38OAuEMpUV80xaoKDJrzDKZjGOMO7t9Jr6YJ/VLMhVEVG1rWyrI5ZkNpJp7v8f4XJqCF8r6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784629780; c=relaxed/simple;
	bh=JkKJDmoLbog9GfIGwCgHrsQ72mgnJ2mrZPApTjRRwPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ar3PCK8LIvKKeWBQAxHH2LYhVzycyaKvMzAoRwQB0jHyvtE/7ylfWj+jp/5Ko/mu3DrTvGsl05FbUoGnggKCwWawzXrdIpqoPtoWvSaXB8KOTdt1rrgbwXgNvwF2JjEVBENZIzWHL8iigU3/RLbJHNRn7ykNaa1+t9hVyvsz6Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KE7iRgsC; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KE7iRgsC"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2ccf2360620so70686215ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 03:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784629778; x=1785234578; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jcQ5JWQsS2P0sxTuodtPBzE3B+AxVvQ7Jj0tVbKvuKE=;
        b=KE7iRgsCPdQv2M4Iv7+IjZGuJh1eGNc6UGsxrXQlmgGd0ub2uNSBq6zxMaG8VckMWE
         gaZejHcXWMIa/Oik333EoOBSIh79iSW6eXJRm6kbh86g9Pfk8ET7cqz0qTZwqrRboDMG
         8+zv3ZYMZrqwrUwXWAQwvbg1VcNZg1BvJd7ZwKkJ/YIcard3GoDLg51ISGe7sVQKObQD
         hcqJcEaASX4jnJGE8elOZc0w8BkCAAQXKQ5XrD7E8SgT6XpUm4JNsNNKQnCnma8nGCsJ
         HJVDLqXT7ITseXqByPQ5W48gBGgfxpsskaFIg7PJ1HwIM5MvggRGM8PLS2CScKrbCfDk
         UQFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784629778; x=1785234578;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jcQ5JWQsS2P0sxTuodtPBzE3B+AxVvQ7Jj0tVbKvuKE=;
        b=YE887rEyK+ob+dB4QQV6RWQAFv9WmBI2BDBYNnhsEGweCDUGfeWWrQkJ5dDsQlCcfp
         YGN0t/FiW1tZxnF3NnlDe7oLp9UesprkFQHD1ZoHxYSqURe3OiX6zyORYGO1DWfx4frs
         /5TBAkcjyMflEstUjQ8JE9FOlMYLle+CDtI2mG2tWbpcIQc7mZRz+ZxbKTrrIF24i0x8
         u2xdfRupVPqSi33RYSqQMIqC0xD4YosYL4qnoPFBl0SYc7Wzn0G3iBcO5HcBIYoQhHcm
         rFCr7v4hnIomw7FRJLaHT8N4gpL5SmuBTlzVLQtLHLCwd8XVHrnQae6V2kTr3EmHD5cJ
         7kZA==
X-Forwarded-Encrypted: i=1; AHgh+Rp9MfohUz3Y2kuk9PdW02S+SO8H7QmcHW7mTAk9vEeREeHsrN6irHSL4Obpqc97GGmEo+8ceWPzkjaC8WJu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg0myFdWMko9Q5hm90M9kPdHzgtvQP/y85YlG4Z75Ga6mmrlpM
	bvD0S6QULUIZAVur2E6C5B7Dk63m/UP2gI5yTwx6NZpryXumHNXgKQl2
X-Gm-Gg: AR+sD13iqUujHm9Tvsc2kLRUQoCoNLvQBKgMYsblTDFMzioFvaIAdxyinkusQpdBETo
	WjgmOcqsw/mkJqEY2wRcQxS/7hoTHOwUkpP42K0GAh8w3q+VzrAmgUTQtZYv+birm5qLGc9XYp2
	4/vkQfWWCk3/jaHpGDVf//P/6bns8nvGNFWq/8ZcLjIav2igvwZ59o4IuCPdDiYkklEKs6vthk6
	1zAeujGpKFBmpf9/ZpchqC/dSx/fr6Z9lssEPdJQZjuHKgkIwiMf7UOMQ/xgI8NHOopqvphr/sn
	wk4V1qWauUdOghyIv/OzMLIL+fJwnfElBpepoNC87aTgBWafDic5QE+4ChyYC+i00NB9mCSrKBA
	UB4u9rJXMqVsBBaWFj25Dqa73IItepiHV/uzul96DjkiWZZdE2u7qP/jl4LIeUNF9ZiPxrBpAD0
	zUkacDXz8Ngrr7ntl2NTKDEqDmrcNgguUy40Zz
X-Received: by 2002:a17:903:2acc:b0:2cf:7ffb:82aa with SMTP id d9443c01a7336-2cf7ffb8d74mr33781705ad.45.1784629778363;
        Tue, 21 Jul 2026 03:29:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448dac2sm73581365ad.3.2026.07.21.03.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:29:37 -0700 (PDT)
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
Subject: [PATCH v4 25/29] ASoC: codecs: rt712-sdca-sdw: Simplify regcache error handling in resume
Date: Tue, 21 Jul 2026 17:25:56 +0700
Message-ID: <20260721102600.523199-26-phucduc.bui@gmail.com>
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
 sound/soc/codecs/rt712-sdca-sdw.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index ebdf7b308331..e23501ed87a7 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -473,22 +473,20 @@ static int rt712_sdca_dev_resume(struct device *dev)
 
 	regcache_cache_only(rt712->regmap, false);
 	ret = regcache_sync(rt712->regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt712->regmap, true);
+		return ret;
+	}
 
 	regcache_cache_only(rt712->mbq_regmap, false);
 	ret = regcache_sync(rt712->mbq_regmap);
-	if (ret)
-		goto err_sync;
+	if (ret) {
+		regcache_cache_only(rt712->mbq_regmap, true);
+		regcache_cache_only(rt712->regmap, true);
+		return ret;
+	}
 
 	return 0;
-
-err_sync:
-	regcache_cache_only(rt712->regmap, true);
-	regcache_cache_only(rt712->mbq_regmap, true);
-	regcache_mark_dirty(rt712->regmap);
-	regcache_mark_dirty(rt712->mbq_regmap);
-	return ret;
 }
 
 static const struct dev_pm_ops rt712_sdca_pm = {
-- 
2.43.0

