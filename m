Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A102D0614
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 02:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785204511; cv=pass; b=cbYwRr56ELFbGGJ3e7SN1ETMsRj47l64mbaWKM/uizWJdenPqANVU1f9hHa7iWzhovPlPjtgVm2H8H2MGc6Xq7bTe7yX/gqv2iW2jOBZYFVSedyrteWfuKwx6k/RF572aFHnfqE++ZC5kgyUCNvcnFOdKgKgp1QQocCc8PlPcSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785204511; c=relaxed/simple;
	bh=0ROOx3ZhQVOWosh0120PMx1HVLKMFBViN8Z24nvhcPw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rJVUSCYdoEvZSPsYXBoM8k0M1gdGFk0vB/M+/bPFKgsI2AXEWNPEwO9WYfC5I84BIWovW4Fy4vgH5a5YvNcxDEJlZyh1qpZBdijpk3I9IGwvbMOtu6XNkWBQalUjGUwfVk8dfi/RTwCWbItOT2buGTyh5DofYEyT0izOG2AwvVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jL719fxt; arc=pass smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jL719fxt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2655487a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 19:08:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785204509; cv=none;
        d=google.com; s=arc-20260327;
        b=sotj+SScoXklQCgWlEYdrl4gDD9uwug143nkTwx3dmMCxBlrZ3yJ65vjvnfQvG5E2y
         pNviDsmI7MraZKK+xBd/FzQbi6IrD2OGZWUrQOOPHiTAeELSLcV/ZWFVwlpjtHwbGn1k
         3ZsKmJAQ7XiusNFLU4F/6xEGYzDg63ZwYyNFX/nl4OHsT2ydBvxQ67noE6DxoCsIP30z
         s8mY6GXb9LA8qwl0vUIhUSJhu+wiXTM5lArPBQjlOvUNYlGCKFQXb3MMseZ7fGKOcwFX
         TaVIsD17leHeKgAvvo9enUnOQGasI2RLQYJEOpx+LT2VLNlzHVmt4RZWCqGFd5B8F3fY
         zMFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=BkjrunjHZ8ixzrIuOK/V37NBJHAzAsV7EODnnJ0k+Bs=;
        fh=qTLA4MtNXwbpvOpB/o3LtakwgQhonEJp7aLpefc4Ct4=;
        b=EE1i3O0vv6M7aCYsfGxDHGz/sS04M6Fsv5muAP7/3brudwC4Fnh/+pxr+i/PQ4X8ic
         WvS+UPq0PgjQxoLhQwy3quX+pEqMbGRaze8rf2tA6O608ZTQqwPMbmarE0PWA9O+7k8Z
         DfrPThomxh4Gfu3c+pIhlHJKIZiAK2VivMXuqnRBoiVY7wCYXeOVxJXCvYRj0b3WIo3F
         6PLdYqw7L3HQH+FMazlJXz9ki4keRYJRMnImf1pApxCm0YTq8yWT61DnnVAxdOKiuCSX
         vf45Z/zMQ0KfKePuVTTBDAUsIQsxUDaYrmPOsd+U2xjTNUzyegODV/ew53ZiVsLGiJ70
         BtWQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785204509; x=1785809309; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkjrunjHZ8ixzrIuOK/V37NBJHAzAsV7EODnnJ0k+Bs=;
        b=jL719fxtP0OCtCFjrAksuU9Sl5q0o156jVjU18zm0apqZr79A8MC3Yvx4KQRdZgYqF
         K5AzlE0CgtZfD4oJskzL+QEfS0P4SjPNsBSbam2eGp3bIcWZCKVIuDuLWC4sG1Y6zDTT
         J29Z3Wdirv8cbd8SLRxzRXXxoCQ6iRO1lP7fppVyxFDnT2GA4uvRqbsJBABOlCbWYi6A
         YOjfTwb9U2qiXdEvcSo0uXWLyeH9TJ/hm5DycqK4knobo/VooY1Zi5eG68Ai6SckRzsF
         rPppS0I5GwUw495WPoOcCwVg+WykhWmJaoHMDHCfc5Ur/+25ViF1tI4IA8nuCv+FfokD
         +/Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785204509; x=1785809309;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BkjrunjHZ8ixzrIuOK/V37NBJHAzAsV7EODnnJ0k+Bs=;
        b=TBkOCq5zWSxHD4jtPEPUF2za5NQIWMsvWYxBCOFbo3T9gbsSmjig8WvuXIFqoqTKvb
         8kYVPeQ0Pi9wpn9WdWeKuPntgm0whBxReUd2v7XDAzjxIgAt0wYSINew4W66PktebuyX
         raIL3ezi3nLnd33jlr1R2iq4WFxuHxctCmZwHA2OR4b9eRDBCutWpTrEt0Ie53mjIj4w
         l8j/1wJqeuiNxOxRfEOe/0GLIxaLDdwJ3kG7MC1ccBEuv0f9jdaIPwzDP8YpuNAt57L2
         Yh45vpUV3W8mH46fnd37AnURrx1tMh9TM4QW0hNbukDvyn1jSJYXfSL0BV1GDaKsZRtL
         4oZA==
X-Forwarded-Encrypted: i=1; AHgh+RreNyt7S1Z8LuAHuYQS8KRwnYSAZbioSL/vFybM+Bj/TJvZeqoqitxgaagmgLLflh9rykIh/Z3MvwWtllMD@vger.kernel.org
X-Gm-Message-State: AOJu0YxfoxuYhDstxdQoTRJMuJC+xoqGZntUl9vI2XTZk2SQFvTvSaxm
	fuehkjP5w+j3fOJj5pSMTbpWjfoToF2xRYUYWtS9Eb4gbdy/k5/b8iYIH/pr0ZpIdFQsMD4UZQY
	Rz6Q9+v8eWnttQCMJhdcwJCuwbI6DQoA=
X-Gm-Gg: AR+sD13e8Pd4P5CoPXdgB5pWMRLC9oI9v8KBXLKuRAOhzNE+/hRmhLRDSa+lDXAyird
	WbzQmIbtMFlInbp+Xsf6WUxZ+SdKQd4ED3Fdh2yuZ4e7mPqzbywxOB3iklK91zD/97juSeujeJg
	8eTy5dRpSjRxeq5m/PpbN8v0OFpLOxeb3u1mawGYd3C50ETo+kbN+jpCyitu3Ap2XhN1shXnkII
	L/KEMmAY3Mgm2Vn26Zz9F4Kk/2t7sYs3/9XC9io727f234hAvNEuY2ciO1RcHYzIhpZ8ga8B3FF
	mU9/SOTqYtSgYG1S4HRSYKFmLEDz+HdJOTaoGPI2aDsTQP/hPmFQMr+kYvm4bd9nFmPmpkBWiQx
	pkQreHSMk
X-Received: by 2002:a17:90b:58f0:b0:38e:6a44:671b with SMTP id
 98e67ed59e1d1-38f6a29f784mr449251a91.0.1785204509345; Mon, 27 Jul 2026
 19:08:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727094046.23001-1-phucduc.bui@gmail.com> <20260727094046.23001-5-phucduc.bui@gmail.com>
 <512ae60e-abbe-4d5d-8106-8b4020c7a2e1@intel.com>
In-Reply-To: <512ae60e-abbe-4d5d-8106-8b4020c7a2e1@intel.com>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Tue, 28 Jul 2026 09:08:18 +0700
X-Gm-Features: AUfX_mwJjsnQw5Xc907EXiK4wMek7-JJgF8qkGzgSccbb5oZeaZ0h7aYKk6Mqj0
Message-ID: <CAABR9nEE2AxRAQGiSMdpkEibTkKr6RpzBw4VzkOgchtxZxpK2A@mail.gmail.com>
Subject: Re: [PATCH v2 04/26] ASoC: codecs: tas2781: Use guard() for mutex locks
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>, 
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>, 
	Srinivas Kandagatla <srini@kernel.org>, Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Charles Keepax <ckeepax@opensource.cirrus.com>, Linus Walleij <linusw@kernel.org>, 
	u.kleine-koenig@baylibre.com, Thorsten Blum <thorsten.blum@linux.dev>, 
	Kees Cook <kees@kernel.org>, Chen Ni <nichen@iscas.ac.cn>, 
	Bartosz Golaszewski <brgl@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>, Pengpeng Hou <pengpeng@iscas.ac.cn>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, patches@opensource.cirrus.com, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, Shenghao Ding <shenghao-ding@ti.com>, 
	Kevin Lu <kevin-lu@ti.com>
Content-Type: text/plain; charset="UTF-8"

Hi Cezary,

Thank you for your review.

> >
> >       /* Codec Lock Hold */
> > -     mutex_lock(&tas_priv->codec_lock);
> > +     guard(mutex)(&tas_priv->codec_lock);
> >       if (event == SND_SOC_DAPM_PRE_PMD)
> >               state = 1;
> >       tasdevice_tuning_switch(tas_priv, state);
> > -     /* Codec Lock Release*/
>
> If you dropped one comment, you might as well drop the "Hold" one too.
> TBH, these were redundant to begin with.
>

I'll address this in the next revision.

Best regards,
Phuc
