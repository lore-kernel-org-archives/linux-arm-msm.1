Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4433140756E
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 13:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785762735; cv=none; b=FhABuKIaXFg9V/xZdEQY3bcIEpM6NG1B0RSgPNzvd5Czp7+IpGwyHakuszpKdVKGTGirdlMuBLBNWY5/Vpwx/R0WXFzShsm1bZo2+4YmxLeyxwPcix5RHSvBJUfopzVviD3Jk0n/CnuwQZl8omJfxeBl3Gw4RU3YxkWzfxncnVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785762735; c=relaxed/simple;
	bh=PyrcMBjEqokckfH0shgijzNdomu1NbS53nS/jPFEemw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A0xuQazeVXw5BYh4br3Xh5QbPb9dYYjGigMaxQ2vYoNqZuDX+xCWeLs4hNNlFk4/WRuTsBFraas4+AC6NBVf/dr+rPjsZGUlLJ7P2a4FymPxv7GQQkWzdZn+zOURhQU9xwqFalSLVX6YFPmyVQ0UBWiDNw9cPtWlUhGbFNwUSDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qP3Q+ALK; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qP3Q+ALK"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49553515a8bso33312655e9.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 06:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785762726; x=1786367526; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=97ECrh6uROUaQf13d9FVHmMobqo4zoNzxlywg2vKSMk=;
        b=qP3Q+ALKnsIeCFhq16bngMUyBFhqkAPvYN3HXwm+nE+2VJ71GxPdZoIO5Yn5O63FBn
         Df/jIjdZUvWkw1ZtkbNExSiXbe5v8wHRYQaMA6HkxVdx1+ya7vEylsnql4k8iEesylB6
         D8qP8zunX/7nuKLKc5VMvpHlxdaq6e+gn2Od44Gt2luePcmmvhV4uCmn8YhE/MRv3+ad
         0SEwC9fmWcaglXGCOvA0Px9oeoVNXAu6SG017CS4GxU/fc1k0+w6gTTJu7SJweIr3rii
         QNK5ktYfQS8MZ5wEjrIhYUPDpwxc1X71XaFaIhY+dUpJSrv03F6VBasPxDsjZcPMskH0
         1C8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785762726; x=1786367526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=97ECrh6uROUaQf13d9FVHmMobqo4zoNzxlywg2vKSMk=;
        b=kklcAn5FLNS9muQ6dcqYZotPa8BJ2jrlvNkA3Ip7bXoxLAOQDEcbDAMJygLuYEju1B
         VX2SPngE2cwY1el9bvW1fLnpy7agahdtpfRxnJq4KcuVrXxQL541xiAIq2AJ25DTcSxd
         e5udFpcA8F1+MNdswpydKemVpkpaI/Gv4x4qd1SMI60gdMnzsGbhgsRy4SpRZR2RCMgJ
         6j4cyXKNeC/Ul3V4mOYn+0iuRxrPAUXUgmtPlZlbZ2OXvxnGLVfTSe4Pq6lRI6mtCtUz
         QGt1+njlkKcv09YjZagKtKE/tpAelUeX6DNCnFnszr2gEplw+70L8CwtT/uM0ExAi2bd
         FbIg==
X-Forwarded-Encrypted: i=1; AHgh+Ro5isb9U5VqIQ6NKGT8j0WLPfquD7fzRBWV4YvJwq8i9JVV/wh8Mw2ISOPEtpEo3sZ0yV6LsAR7QxMBD43M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/4rbR+GvAJLa4sqBGzHKxExu74cmXCsaR/bl041wpZ9fhJDFc
	jHQY8ZJrpOb1GozEwkRHKNQAoUx7R0OAl++CS7nqUtOF26eisepsBWNP
X-Gm-Gg: AR+sD10QlgSijHEX/d0wI2vGfNyv1l4ee03qLRxQ0tG5znaIhMEh5NMi1By4gO+ERsK
	0Ied6Od8pCWOViPv/HzBOvyb6XJorMLnYMRYRGXip54Sy8gIz+EvR/Uan7noenjjoIRn7KNfBVe
	/QSvQivELJlkU2UmvhsVnF8GBXkkUq3N1Ge/CZBVXhBoFNr8Vbk/VMXZEg097BTE76s5/E7cKLv
	8qGvp6RgXYBsuaz5abgfzaR/sWt9zDqpPiHz3hc08VTzMX9LodDWJtFkAT8psSCtl8y8YuOU303
	75WOqDYjB63MsdYqZwBB9tw7zCmXLw0sbseaGnI45Y0j9i9jCkllMDYwW9UT7bwyqZQG2BLdCjS
	Z35dV4IU+iniM4BfqmpHKFOZCrjLwVhHTJ123DSO3dfBbLYb/9yUIIG69mcXrtEjrrMxLl9IM6p
	QwHITbSliJKtr0/nM8x9B0JO5pGWNh1FKabWseIyLXae5pzFz4ONnb
X-Received: by 2002:a05:600c:46c6:b0:496:c977:3b6d with SMTP id 5b1f17b1804b1-4980c6747f0mr172273935e9.12.1785762725410;
        Mon, 03 Aug 2026 06:12:05 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49807b6745csm232708385e9.7.2026.08.03.06.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:12:05 -0700 (PDT)
Date: Mon, 3 Aug 2026 14:13:14 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: phucduc.bui@gmail.com
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, Srinivas Kandagatla <srini@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, u.kleine-koenig@baylibre.com, 
	Thorsten Blum <thorsten.blum@linux.dev>, Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 01/26] ASoC: codecs: sigmadsp: Use guard() for mutex
 locks
Message-ID: <anCT0aZVJKqAdsuC@nsa>
References: <20260727094046.23001-1-phucduc.bui@gmail.com>
 <20260727094046.23001-2-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727094046.23001-2-phucduc.bui@gmail.com>

On Mon, Jul 27, 2026 at 04:40:21PM +0700, phucduc.bui@gmail.com wrote:
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Clean up the code using guard() for mutex locks.
> Merely code refactoring, and no behavior change.
> 
> Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
> ---

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

>  sound/soc/codecs/sigmadsp.c | 17 +++++++----------
>  1 file changed, 7 insertions(+), 10 deletions(-)
> 
> diff --git a/sound/soc/codecs/sigmadsp.c b/sound/soc/codecs/sigmadsp.c
> index 2e08fde3989c..b7dbeb237447 100644
> --- a/sound/soc/codecs/sigmadsp.c
> +++ b/sound/soc/codecs/sigmadsp.c
> @@ -5,6 +5,7 @@
>   * Copyright 2009-2014 Analog Devices Inc.
>   */
>  
> +#include <linux/cleanup.h>
>  #include <linux/crc32.h>
>  #include <linux/firmware.h>
>  #include <linux/kernel.h>
> @@ -135,7 +136,7 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
>  	uint8_t *data;
>  	int ret = 0;
>  
> -	mutex_lock(&sigmadsp->lock);
> +	guard(mutex)(&sigmadsp->lock);
>  
>  	data = ucontrol->value.bytes.data;
>  
> @@ -148,8 +149,6 @@ static int sigmadsp_ctrl_put(struct snd_kcontrol *kcontrol,
>  			ctrl->cached = true;
>  	}
>  
> -	mutex_unlock(&sigmadsp->lock);
> -
>  	return ret;
>  }
>  
> @@ -160,7 +159,7 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
>  	struct sigmadsp *sigmadsp = snd_kcontrol_chip(kcontrol);
>  	int ret = 0;
>  
> -	mutex_lock(&sigmadsp->lock);
> +	guard(mutex)(&sigmadsp->lock);
>  
>  	if (!ctrl->cached) {
>  		ret = sigmadsp_read(sigmadsp, ctrl->addr, ctrl->cache,
> @@ -174,8 +173,6 @@ static int sigmadsp_ctrl_get(struct snd_kcontrol *kcontrol,
>  			ctrl->num_bytes);
>  	}
>  
> -	mutex_unlock(&sigmadsp->lock);
> -
>  	return ret;
>  }
>  
> @@ -677,10 +674,10 @@ static void sigmadsp_activate_ctrl(struct sigmadsp *sigmadsp,
>  		return;
>  	changed = snd_ctl_activate_id(card, &ctrl->kcontrol->id, active);
>  	if (active && changed > 0) {
> -		mutex_lock(&sigmadsp->lock);
> -		if (ctrl->cached)
> -			sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
> -		mutex_unlock(&sigmadsp->lock);
> +		scoped_guard(mutex, &sigmadsp->lock) {
> +			if (ctrl->cached)
> +				sigmadsp_ctrl_write(sigmadsp, ctrl, ctrl->cache);
> +		}
>  	}
>  }
>  
> -- 
> 2.43.0
> 
