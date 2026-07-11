Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78CD1C2FF
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 00:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783728521; cv=pass; b=o0WoZVkKr8M9vwS/6wQmlEJKOYE5pOIyrXMmWx1O3M3sR6kafvaolNzL3H/qo+yqaVaxm0b37qdt8wuH670CAXEPMNQ87WJyVyYlSdWAfuTuVkIrk9+gre+tY+ziigA0NQhlD1PJfv5PWR9yt1q9Y+9lDYOoQc+RztJFgp0GHi0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783728521; c=relaxed/simple;
	bh=kT3WGq7xQUJl/l7l2sBFuylj1Ru6lkFqwsVBVS8paKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RgxNDQGc7YHU7Mp4Vvo70PC0A/IE0KX4LoVYqK0XuBA5QTAlqUu6OQ+C9YOn8RX059EY7MJSjwRnK0Pm2omFWcH2ZRG0XGTwC1LHlDWpFzHPzxUFUQNfLMnRCs+mhldoMgdPLJ0L6r97RlzyYHW90KeGJY9m4ljRBVORLS2F1o0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKtq0O2o; arc=pass smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKtq0O2o"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-848643382fcso1475953b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 17:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783728520; cv=none;
        d=google.com; s=arc-20260327;
        b=DtH8HzOApLpnx/oohRgDcn8ba5EUZiXtsWMpFsON58lyaDO3VxD454gB5GapaTQ6OO
         SJWq/1UlMVCPC6XAtOM5dCf/gciNEKiiSlRt1aVHqpVyFqkL3OVl+QhbkB12bX3xZJPV
         plTqOo12iP+RdKjOsNl5pn7gFXWY/e9lfRWKU/g++u/yuHF9f19SawmFVIBsD1qRKoBB
         yLJIX5SP4XtiWy5xhIZ+V5M8xcgLW462KfKNMdqLEQ8tQH6KfoAD49Iy0fKk3X+KSSaM
         KIxWeRPFXkXs+Usdu6XpDmqAjbjoNnBgqtFVgRer4kv36drnE6zrEgb5F/W+RI6E20Hp
         RewQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        fh=qoJI1gLGrI7PrR+KuwYfP4IN2/1LPjsBcwjPCezFIO4=;
        b=qpGDt+d40/5jbxQRVLof1C7YvgM1iBkx8ru0rEBL13Tmtoh4c8/TnzCfVXxVVPMMqN
         AEbGgnV+jdzI0YxYGB+JxjTR9rOcs5uHteuyQ6QFHH4lTkBpMI56CaFdZS3xRkfm1cqL
         uEWywR+RlmkGHgk+FFY/C+q2ZZHuBDx1Ns0MvWWMIyG17t/NpnVz1mG2zQxDnoWVIRkD
         1dM9xUW7z03Ujop1WbdQFvD+O1mvpXZNaQWK1RRNXAc1Bh5YcEylUfvJPc1rLFxLwp1P
         KFT0Dgk3OcW6G6GEP+5uQWchIsiRWk7Z4/0Kfp9teWizENFKFFktF/5dmC9v5mDajDio
         Y6Iw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783728520; x=1784333320; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        b=hKtq0O2o2RARziqt7tciLijHjVjBy4k3GjO4NLSkJLqLOp8BM1X/T9zgpewnzNpXIf
         JZj9csawlnZvMDhlQdWKl32CKqY9BSkyFVPWrgr5Xw9fyaOcD3aT/b5LpITKbxn5AfMl
         r6xIchUgP36JET5Ha8/DRz7MWW85sRIM/5iLY9uwqeDBMB6vsr6a1OiARLx2k573muzn
         f0wqjpHhBkE9N/xnkjJIC3hzh/Z+9yPj12S3KCJoTsxX9iQPYz12cn0BeYw/rLJf7lqH
         Eyr6vvwo9Q5dYpQSfVkWJ3+ZGwjZOnjoRCLWKe3mNPLh0gYU8sC+n4lMtmUReEwB4l5D
         0Blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783728520; x=1784333320;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=H5WuB63RbKuGXGsDIh2uCohEIF6sWSpalpafrYB0BRA=;
        b=PNuD6Xcps2B2VRj61LazrvFhIX5X2hXRkJwsYb9euzG5WbztScO3UdAs2+GEntPKAi
         PjV+J/RiadUW2BmobIc5PZGJesF1MwDD3vbL9D3xqtUELUpjgMP0tpo0lWhrimZfNqV6
         o/74LuPKTVJsD42WPgOkKY97HU75CwtygmqW6mtz0181oe8arck5Juh8uGXNAme+HSr8
         /zoQ+PAIxD5E+kGb9tKEMWC2wdP3L1FCNVoh/gQnFqfyap32o8Tq9C+JCm1taG5WZEgg
         mvxYW3YC3Kw0PeAFmal9VKT5RFa0KR9WeAXobVHWytMt/pGf7bTsHw6SUWxkrvd9+wGB
         +Tbg==
X-Forwarded-Encrypted: i=1; AHgh+RoHQO+lPE5kJdekeNvn7Jvjdqla+cXEbcEOG6RixsylKpPuj2oLPN3j6ctp6Y+6ZBObUCl1iVrvuUUS9lsH@vger.kernel.org
X-Gm-Message-State: AOJu0YyLR+lPT1t5KYWYcsNw4FGgaDfvZHnQ06gA0NBCtImEZcF/V3E3
	UxFYBpBW5iLuD7HXK/iBRrOXD+L50iXzfnC0BWh+QAL0kuVZKWgMCflnZzkaSrqNxl0eEVWth/c
	ptYKB4EjMrNgv41wqg5NobtK5HQfMKNs=
X-Gm-Gg: AfdE7cnsBl27iUZTR9UEXgnnP7GlkxzkJMINp0dxLsf/UH4R7M/mjDNf2RzEnWVEb2p
	BnFXTCP3YBoJxrqBtMll66ary6N8U1MI23fsDgh+N/hBGiyhXBqwjPOYZVfo/0aIp2fSn4RJ1zp
	yt4ZohBDVLZOOvmBoi8U+8A03coygujYvuZ9HEN8CW0P2OIKEgMhKjr/LThFzd9shEe1oAB3qYG
	CKy14Bp6Hs4DMXj9ItvJtXi95mG8se6IRAuK3LgNbJ7G9plvAc7hNXlHx5SnOoR5i3wHANpAm7f
	Ire+wVzXjATKut9uGTALQwaNWftYt4QbmnXIb3lasLxyDM9S/Q2wb0lRFX9yApZtm/UWphbc
X-Received: by 2002:a05:6a00:cc1:b0:847:9e62:24b with SMTP id
 d2e1a72fcca58-8488961c11emr1089390b3a.9.1783728519714; Fri, 10 Jul 2026
 17:08:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709045902.498848-1-phucduc.bui@gmail.com>
 <20260710050511.14439-1-phucduc.bui@gmail.com> <20260710050511.14439-23-phucduc.bui@gmail.com>
 <95f5d6ec-ecc5-4090-ac04-27cdcdc21b8a@sirena.org.uk> <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
In-Reply-To: <CAABR9nHUc3KvC4t=hJ9osyw93aXa+kEL07G1posnYJdLvjHEkA@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Sat, 11 Jul 2026 07:08:28 +0700
X-Gm-Features: AVVi8Cfyiwxnu7eGIzA6KyPzlQ6PObhKgfr4WFgILFEbEKhBTf8y3pJA57dwTdg
Message-ID: <CAABR9nEQWYzvxDduP=+9qYEJNzXVbu587Aq9eGR7Tyo-K-u1GQ@mail.gmail.com>
Subject: Re: [PATCH v3 25/27] ASoC: codecs: rt712: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Takashi Iwai <tiwai@suse.com>, Nick Li <nick.li@foursemi.com>, 
	Herve Codina <herve.codina@bootlin.com>, 
	Support Opensource <support.opensource@diasemi.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Srinivas Kandagatla <srini@kernel.org>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Sen Wang <sen@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Linus Walleij <linusw@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, u.kleine-koenig@baylibre.com, 
	Zhang Yi <zhangyi@everest-semi.com>, Marco Crivellari <marco.crivellari@suse.com>, 
	Kees Cook <kees@kernel.org>, HyeongJun An <sammiee5311@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Qianfeng Rong <rongqianfeng@vivo.com>, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, patches@opensource.cirrus.com, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

One more note on this:

> It seems this goto block was added recently, and I missed it after rebasing.
> Sorry for the inconvenience.
> However, looking at the goto path, it seems we might need to unwind the
> states more completely. What do you think about rewriting it like this?
>
> ------------------
> regcache_cache_only(rt712->regmap, false);
>     ret = regcache_sync(rt712->regmap);
>     if (ret) {
>         regcache_cache_only(rt712->regmap, true);
>         regcache_mark_dirty(rt712->regmap);
>         return ret;
>     }
>
>     regcache_cache_only(rt712->mbq_regmap, false);
>     ret = regcache_sync(rt712->mbq_regmap);
>     if (ret) {
>         regcache_cache_only(rt712->regmap, true);
>         regcache_cache_only(rt712->mbq_regmap, true);
>         regcache_mark_dirty(rt712->mbq_regmap);
>         return ret;
>     }
>
>     return 0;
> --------------------
>

Since regmap was already synced successfully, marking it dirty again
would be redundant and could cause the next regcache_sync() to
needlessly rewrite cached registers that are already known to be in sync.

Also, in my understanding, any register write that happens afterwards
while cache_only=true should automatically set cache_dirty=true again
(see _regmap_write(), _regmap_raw_write_impl(),
regmap_noinc_readwrite(), and _regmap_multi_reg_write() in regmap.c),
so there may be no need to defensively mark it dirty here in case of
a later write. Reads aren't a concern here, since a read never
changes any state - it's only writes that can make the cache diverge
from the hardware while cache_only is set.
 Please correct me if I'm missing something here.
Best regards,
Phuc
