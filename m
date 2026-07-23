Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2209142DFF5
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799872; cv=none; b=SuRST48SLVBwg8+EWnIrsGzfrnyMaRgiaruadqdAOPO19Bg68tehjzTsos3Xxk2VJZuwZhyJk3X/xsfSRL+su1IX96L+V7C/9fnuBXW2qtmXFaWQue9aLJrHsIqJP6c3Hin48SbuwSljZtbKCogDGsdB60I82vZFqTJewKH27nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799872; c=relaxed/simple;
	bh=tz7OO3wCjOe1LJryPg0gYDnlsWt7deLgozE8i5WrNBI=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oSQ4YLaVL8bka/04CHcanZ0fcN4NSDjHIT7emT2WoOhwgRwEnqto0a1xf3uvLGqLDhEEjUN8Q6mi0AfzqJ3UHb58o89r2jgTDapITXzIbQB1rrvdYHO/vHut133tvaZy8m+KmeN59qKH/YB1+XGxSlzH1T1hbD3uNapyLYMN1Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GItxfXWo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GItxfXWo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6A851F000E9
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784799870;
	bh=upJm9Q93FoQ32YOmgLd56LAW++MWJuCBKbNFi1vKSIY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=GItxfXWo5rEXsub48UO0OKzJiyodbOJwc+hdYS5jlyE0dDnTKRuj8ccMnO5PC3smB
	 NfexnF71kEAHyO7Y8udlaPA5iuPiKuVo9Bh2hPtpxMtBJ4D58EpH770fXiHCWaduy1
	 zYtj8LFc0RndEbdr3fxjuanZnDM55oniccMColI2mXDzkisragfBGd1SOSJnhaBet7
	 bI5Ikq96sJ0dIPVYv4j9jxvngtvRkHPK7jz+hBuNLyE/adUnbcU82MP78zmxopUgbq
	 YlZQ3cDTV3GZPkDduqJA6afnro9U1OZfbkv2LLjZU+WEfBmhDN8UrMH9cUrGq0HS+w
	 rLeQ80gj1vNBw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5b2a22c52c1so507067e87.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:44:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp657wyf8WbpUzVZPCIwUaz90NgSoN1J6OC4Kb7S6YAb6yk2VMrkwUYxGpZSZSnVWjnaCi3YY0wIaqK+Ed/@vger.kernel.org
X-Gm-Message-State: AOJu0Yy75ghdCFCtmkNF07FS5b09tcQnruJtmBPgUVPZLC4fsjPkr/We
	dKlAqdIduV9mSgoQlBxgyT3taw4iFz1eGXPkJmCz7iwxBqtxZlOJorW4fSVQOl0ivm2AFuePbcc
	YsF+m2NAqxCyA2JhsDnzigz5xEspfMG827Co9DP1BkQ==
X-Received: by 2002:a05:6512:340a:b0:5b0:23c3:4f55 with SMTP id
 2adb3069b0e04-5b2b2f72e6dmr483668e87.53.1784799869499; Thu, 23 Jul 2026
 02:44:29 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 02:44:27 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 23 Jul 2026 02:44:27 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260722162040.GC2794619@google.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712-qce-broken-v2-1-b2dfff47f7f5@gmail.com>
 <alnlaCXmoLRAlr96@gondor.apana.org.au> <20260721082501.6128-1-bartosz.golaszewski@oss.qualcomm.com>
 <c826b73d-6307-4237-a065-b7a8487350ce@gmail.com> <CAMRc=Me55rUmjjR+ZzdWd2ss9JJMZzJch0zKd4GqONBjCzFMYQ@mail.gmail.com>
 <20260722162040.GC2794619@google.com>
Date: Thu, 23 Jul 2026 02:44:27 -0700
X-Gmail-Original-Message-ID: <CAMRc=McTUmyCNvW6qECR4rnVQNLAWLnOr8+fdcZEyDfKESifHw@mail.gmail.com>
X-Gm-Features: AUfX_mxedXof9O40mfMVKV-BEEyZQWgJJjJYjRe7y_syomCjENHofNVGIye_ej4
Message-ID: <CAMRc=McTUmyCNvW6qECR4rnVQNLAWLnOr8+fdcZEyDfKESifHw@mail.gmail.com>
Subject: Re: [PATCH v2] drivers/crypto: Mark QCE as BROKEN
To: Eric Biggers <ebiggers@kernel.org>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, stable@vger.kernel.org, 
	Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 22 Jul 2026 18:20:40 +0200, Eric Biggers <ebiggers@kernel.org> said:
> On Wed, Jul 22, 2026 at 01:33:51AM -0700, Bartosz Golaszewski wrote:
>> > Also, what can the current driver do that cannot be done better using
>> > software crypto?  I understand that you have future plans to add more
>> > features to the driver, but those are not relevant to this discussion.
>> >
>>
>> We can offload crypto operations to the QCE saving CPU cycles but more
>> importantly, the QCE provides HW based isolation which some vendors care
>> about.
>
> Do you have any concrete proof of anyone using this with a specific
> Linux kernel feature and actually getting a benefit from it?
>

I'm not required to produce a proof of Qualcomm's clients using it. That's
never been a requirement to keep a driver in mainline. I'm saying that Qualcomm
wants to keep it and I've stepped up to fix and maintain it, which is what I'm
doing.

But yes, I know about companies that do use this driver as is for whatever
reasons. I'm not sure I can mention them so I won't.

> Just for some additional context, I've been on the Android team for many
> years and have worked with lots of companies shipping Android devices
> with Qualcomm SoCs.  I also upstreamed the support for the
> Qualcomm Inline Crypto Engine (ICE)
> (https://lore.kernel.org/all/20200710072013.177481-6-ebiggers@kernel.org/
> https://lore.kernel.org/linux-mmc/20210126001456.382989-9-ebiggers@kernel.org/),
> which is what people actually use and isn't the same as QCE.
>

Yes, I know about your work. Thank you for doing all of that.

Best Regards,
Bartosz
