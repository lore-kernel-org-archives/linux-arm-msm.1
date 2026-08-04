Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7124D313550
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Aug 2026 04:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817283; cv=none; b=cXzsfdl6Pyrd/X7SOxb8D2nhdA5ua5pJuV40lY9735TJaHfD5EpvQtpL3KV4EiF+AtKC3Eb8qVSx+3pTQM8rKANoL06dSt5PNi4QnNtLodVbQ90avlVCLKsARUMiyJ5rjIcvROk+RkVrnSPvqSVnyfUq3x41tgabERTnbV1uEao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817283; c=relaxed/simple;
	bh=N1U4YH2rA30TenjPpOvIQ7i8FHYyt9DTIYZxboCCGto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qXgCDzgWKUTFVWJzYhUgtv+XuJiv3EAqlKWTIwo4Pkgxt5ScRm/hP3ugVcq5Upl/jvHXBq4i0zacGlF+Nq3IbpMe9D5s1aTV/s0J6xSFrV92vo10I6OOFLjyxBiDU54Zkh1+FTRZALlKfjuu92GpH+TzjJy/Bvr318p2xdKPZJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uTEcDkei; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uTEcDkei"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so3900262a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 21:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785817282; x=1786422082; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=uTEcDkei2vb/G+qdIOtZbaB9NJHR76SZdFJ0azOpGcEjg3b9dUma5R5oaM5+67xWsk
         2vByRxiu8ggMmw45H0y2V0m5H0INr0D7wdNaf1xGqp4oAr7PmuOnVC5QCKd/ZNFY8TDq
         NIQFql2LV9v0AImQQG7ayFcywyuGjrDld8S9G9ZIwL9fS1eYSCnkjlOT8rLgLlhixUpI
         OO6Yh3JqcC544zi7BR4AZ8M2uol3HRU4AeOyimbNbN7cHoqEZV7oHNKlZEfbUzSbQadS
         CKfmIlRa5cB/PPsVYR3DS9IqOY3jvW+oeImJOSwldRfT7RfIuo+nGF/0qt6gR0D9LDEr
         asVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785817282; x=1786422082;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNaVEJ1HZqqSb/BWjpBmAcESh4gvUlmp0T6zod8QVBo=;
        b=qHbHud02KZKz2MMBfnKzLO4CM4u1k6WMWts1RKzGmlsJekkI5vfGvd8iHPsLr2vJSK
         IRFW+IUNb2zbB/g76EzloNmSqMGRnvtYdidrEkm8R/TT19Gics3sP4ZLpJnv+zMDEtm/
         j/V6u6kP8TEJCOxy+cKFbt61KnnqLFZq/RpYBZfr7s8FNK2nSTkLB0J66bh8IKjB43y5
         8yafh0hNJGZMQ3/DnD6rlMx9TyYa1KdXYHRksQWgvILdMHqBSdyyH2Y41Uw7O4fmi9CG
         EqmFgcGEbWnvrf7/GDbFBIqcUc4s4NtGmpqwEPYmnNoR1/TY6ck1Y1iQOHEzm8CEd5M/
         4snw==
X-Forwarded-Encrypted: i=1; AHgh+RpA2WnHJuYXDcJ4AHbX0XPiUDzOBuSxtP3RYnzTDMhMtHIGNoVtfK1ZKGSMRnaSkThuzYGRDHJDgu06plNX@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp5zn2BegWxGu7f0AokHw4x3mPqGN+9xhw3zEBf1Wv5mq0Dtrq
	41xBPMftADknwTZQmgcaRGcnx42GTsWE+hzFx0WKR8Nfg0ye4m4Sg9TUd2fJ2WQHPbU=
X-Gm-Gg: AR+sD12/sSmvyHouTgko3ekBEpZt56k9JNacRq1jdyVmG6Aw3fHiA1P0wp6Q0F1H/W/
	iG8wmOVS1t/0FjENL0BgbG37ZOlrMuK4co6sBCMxyUol+LkLibxB2EtBgha+WV8SPpGuKUJFiYY
	seIXdVv4BGNnYvpZd2Glbuz1vwVYgdmC9I3lUlARJ+ovB2v9dS9RdthWVKEJMMnO+Ozz1m89cIi
	WdFBMj/1y0/jHcIvrgBPHQc7TKm9rPww7E3Y1nfssxnNwe1z2Ya1zgCtnVQsjM4aEn8jYhb6+95
	y4cFZOJr+EHMVHUYJsDGYFxBHnuDkqUbOVL9nIyuBFmQ8BxM5ka8HoUWIIuVr1vIDjIVuRWui17
	N9v0U6YU2i1ZKo20slfQRgZT2gxFr+q2fa1SMMGkxPSDJHuXg+muMVlvEVvDqyMLYksmrvZjscq
	wvVnRRBTSJqrR908ky6lfx05++0QQ5O0RAKJuR3t+51m4kW3KG3cZpvoUl+JqG
X-Received: by 2002:a17:90b:4a09:b0:38d:ecfe:41aa with SMTP id 98e67ed59e1d1-38fbc60c7femr11264577a91.43.1785817281575;
        Mon, 03 Aug 2026 21:21:21 -0700 (PDT)
Received: from localhost ([122.172.82.94])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd4e47dsm64394331eec.3.2026.08.03.21.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 21:21:20 -0700 (PDT)
Date: Tue, 4 Aug 2026 09:51:17 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Maulik Shah <maulik.shah@oss.qualcomm.com>
Cc: Linus Walleij <linusw@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Manivannan Sadhasivam <mani@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	openbmc@lists.ozlabs.org, linux-arm-msm@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH] pinctrl: Use IRQ trigger mask helpers
Message-ID: <mre6ggyfjxo5dgvtrp3nsrbxngenw4r2eb6nygi4ybs5zsefyq@kcu6u33q3ien>
References: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802-b4b4-irq-trigger-mask-pinctrl-v1-1-1c398ab53d28@oss.qualcomm.com>

On 02-08-26, 19:35, Maulik Shah wrote:
> diff --git a/drivers/pinctrl/spear/pinctrl-plgpio.c b/drivers/pinctrl/spear/pinctrl-plgpio.c
> index 1ec22010a3f9..5fcbea32089d 100644
> --- a/drivers/pinctrl/spear/pinctrl-plgpio.c
> +++ b/drivers/pinctrl/spear/pinctrl-plgpio.c
> @@ -339,7 +339,7 @@ static int plgpio_irq_set_type(struct irq_data *d, unsigned trigger)
>  	if (plgpio->regs.eit == -1)
>  		supported_type = IRQ_TYPE_LEVEL_HIGH;
>  	else
> -		supported_type = IRQ_TYPE_EDGE_RISING | IRQ_TYPE_EDGE_FALLING;
> +		supported_type = IRQ_TYPE_EDGE_BOTH;
>  
>  	if (!(trigger & supported_type))
>  		return -EINVAL;

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
