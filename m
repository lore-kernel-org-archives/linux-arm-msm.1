Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E54A30F803
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 02:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785724555; cv=pass; b=Ro746I+3qoeV9GuPfFDgMCyk5IIQ/XkPn1zDjfSeYM+P+Qe2NWydh6I2QALJWcxSN5qtEnEz/FIv55/5bFpRfD1SZqLY9GHQlMcjpkRt5a/xrE+UvPxY9dafiNIto8cVBISCzwNz/Y7ft+iajvmK+QHO/jjIQiH32tT9gIsmfl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785724555; c=relaxed/simple;
	bh=FT/SQG/c6khD5vBSeA1TiFee31N1OJzxfIx2oyjBE9g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tb6paEvEdMCyLRcExWl2ncv6dm/U9tnphOXxUDYcfQZ4f/FdufqoDiDu84I0t/1vcIQV6GiApdwbsKwufkVFIDzpxqs7SQyytPRaQbWaJajh8jk+WkIbbadsu4tyasCaRLOZAoHs+bdSR9zDV3pZy/UazXKerSjfc5OihCINihk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UaBI2fkI; arc=pass smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UaBI2fkI"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-383cb94f742so2784408a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 19:35:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785724554; cv=none;
        d=google.com; s=arc-20260327;
        b=eibfKpMpo0JvLeyHazUOGUIGoOAG4iXkSycHSVFokkdF+jqQtKw4BMvW1aafoGovCb
         D1pQaBLW0smx9w0dCXM8TwAn1jyk0tyQdrr5pHbs5/24b3Ohnx6gv3tRBP1YC96Bzi/D
         EQOWKM6dG09HvS5iA6zxbaOtJGQPhA7mYyAZr6nY/GxpzNS3Q03F1i/P6x7+bbBWslKV
         8pdC7qHw24aq5zLDcSGUjgaDtgsE8JuywiitYHrIajOs0WIMIfc++8g20f+7Ck4KKVbW
         Luxo5dYXoQHmIuaktk8ZCRSkC5DodjeplVQIOmY56+M/SOZsoPyV5OZaZVlXT9JotlvP
         xdiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FT/SQG/c6khD5vBSeA1TiFee31N1OJzxfIx2oyjBE9g=;
        fh=+8vXR/u5ot6spGeWUU5546Kz3gFHUNW8FAi+mOq8/FQ=;
        b=q0VK5+Mg6DSNY0n/Z2E+1dcRlzvElzt2GGXOoxMhY0obAUCWs5LnJTUca+5K5t58/G
         axFvfeJbGEE3Vs2/VY7XFth9TjCk3Id7ehwlyt9/tqRPOgHgz/vSIqgbP6cO+fUSmW88
         CvqHsljSauCRe+MYiU5loSZLQ1I9YFxPu4czjsOgH9uThfLxjX9inIMh4fFFwfx4gfqf
         xTQBauw5nEG0pM3Nvbn4jNCZe2ti6EZK82RWRwx3HbbIFLIThbgR/lozU5ud7n+3eLZA
         nKPPT10Cz/QmP+RGV7u7juz9kHEXf5RfbHzsiSwIUCHuYMNQWj5jaJbXuRcXBme7T3Eu
         vecw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785724554; x=1786329354; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FT/SQG/c6khD5vBSeA1TiFee31N1OJzxfIx2oyjBE9g=;
        b=UaBI2fkI9PAnYrb8ELGuxGx+xE4Wx5TKEttRR0LMdpVyp+Ff1RmKzqGvHkGdRQkeme
         58uXE36F56Smz0xqwKcPMUqsL1jRSU6GczaqL8ByqV8NEkeEL9IShK6E3hXaCqcJGrA/
         //idk5Wwm/TEbO5xf11l9h9lo2RCtL1gPvamyhCyAxa5orvfKbnMNn6DiIJfLYjQorqZ
         p65ia6T+m7evz2HGJZ37pRLyO68fXtrkHcuF8t9ypUyShKMQggF5kyORH2tCNWZnx7xb
         oqBCeNytkNKCJSVUhrzWRoisFsbn54sSMmMbpld5qwcL0Eb+STxcfHhBkt3HdvA7FoqS
         KrCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785724554; x=1786329354;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FT/SQG/c6khD5vBSeA1TiFee31N1OJzxfIx2oyjBE9g=;
        b=grifpkeIV1np/ZGuyjsCYPa8X8vaPC3mI/ixvKBTiP1C0Llpy7Z+3t4Ktkbg5UjZMC
         649Q45FqPCwFKjVfne9gfbE9+w+3S7X2orAxiJqRK4aBdTiG5IYOxi1zLojxs9do2H8E
         gRO+EuGoWUz9kaC3XvHdNNZFS3/xnZ3GMN48IutIeTF2DXTA/65BqnWmR0lAPCbwzuYW
         wYFkZQGY3CFoWsuCKuMHS5NXItkFvXET1HAnZA1nhtW7b2fh3G3K2Utfrz7w+NhXaeq5
         Kz0Bc0JBDem2oH8ftC7cnKEl7rB4HOX7SEdRfDTBu2NAbOeyCnEschwn2Ypnq7RKPk+T
         V5Bw==
X-Forwarded-Encrypted: i=1; AHgh+Rquwh4WqcZmHWkQHcjw4SokFHivY+vSn6dk6k3cP4hfBnRoRyatHrfvV4pO4nkXApr/NrAdWwv/KjH9pIO1@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5DV6N/11pzNv1+y40+QsKPUvy6/ov+W90Q5sfL48oJwQ4DbpT
	buyqNtKWF7hqKOYQ6anXsqk6z1tysGwfx0/GtnsuRmN53MoYvh2kp+chktP9menXoTXmIABHdHb
	4defw3WquCiRS94kNEptD/Ew8CeNmMoo=
X-Gm-Gg: AR+sD11nM5cSyXudKu3E6SuMrraDmhEd3EC85zR1hvV7uOdv/zg5zLvlIuYNskTw9TS
	zXIaWqZ39LYn0VfXrfx5lGMcMLUOuFTqFiBEYBq1Gt1dAQ6YhlajTzBDpraCYH/KVMuxa/nSg8m
	kzJqQ2LArhF9Twh9vEqiL3r2m/OVshJb8wQ+Vd4hOkubFxWMBhC/81KPRRJeBCqCf8Rih1bKHTo
	y+YeOLDLuz8dqiewrY2DOsc/QAl1OBuciwrHHdpJKE7/qJUY2hVoh/PDcemy3FRnqAhtY6Fh9aX
	LpP/AtNyNPbE6EBu7Hsl/9XU8NpwitvTD03Tx9I7qVGsXQ5sE8hMEQ9o1IEaLR4mYIqpk7Gdz2x
	8en18PABBixxypPBrreNnPFZPVmFYdpYAKFE5HOijmNgmaJNQc6csiMnT
X-Received: by 2002:a17:90b:1b46:b0:387:e0bb:5803 with SMTP id
 98e67ed59e1d1-38fbc5c330amr6603426a91.42.1785724553803; Sun, 02 Aug 2026
 19:35:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731030648.8706-1-phucduc.bui@gmail.com> <20260731030648.8706-12-phucduc.bui@gmail.com>
 <ee9bddef-0918-4036-9c8e-8b0d4af7f5bd@sirena.org.uk> <CAABR9nGQvyeLsG-u3o6dH_R68SUvZMAX1Avsg50ySEd-5KGXAQ@mail.gmail.com>
In-Reply-To: <CAABR9nGQvyeLsG-u3o6dH_R68SUvZMAX1Avsg50ySEd-5KGXAQ@mail.gmail.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Mon, 3 Aug 2026 09:35:40 +0700
X-Gm-Features: AUfX_mxCr5f69Dc8Q7kZP98PKX9HAmDgy9j742jJo8FPn74L5u4MMLL4_h-_T20
Message-ID: <CAABR9nED-25XHUNDbucLHJy-=RNcxa+VsiSC6NcXSXJFFOvngw@mail.gmail.com>
Subject: Re: [PATCH v3 11/26] ASoC: codecs: wcd-mbhc: Use guard() for mutex locks
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	u.kleine-koenig@baylibre.com, Thorsten Blum <thorsten.blum@linux.dev>, 
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Mark,

After looking into this more carefully, I've decided to drop this patch.

My original intention was to keep the mutex_unlock()/mutex_lock() pair
in wcd_cancel_hs_detect_plug().
However, this function is also called from other places, and I'm not
confident that keeping
the manual mutex operations there would work correctly if those
callers use guard() or scoped_guard().

Best regards,
Phuc
