Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9B13793B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790612097; cv=none; b=lP6Yds/BRaECB7eOQAt7niFmIf8Rtl4iSnwrz+c0+qEqszGe79VCVPVOsgQRAgI2enaKkv8178stcvWePG+wZXG8KE52a+QaxQiQwDR0TojzHC3SK4NX1vwtR1BmZqpphfWIkANYPjrVHtovgFMVTHJTzR49DRwHbbeQ2Oh/n+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790612097; c=relaxed/simple;
	bh=HGCq3zgoP0saYvNcEo4pPaH65XFLhzGyGOi+d0Mq0XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HS/5t0KdzgYYpHT8bwwCxNQO4ZcA0irNLnFa+cK1faD6CIq1inL2lnWaJAo9f+S5D4wxVVYrDzdN25TkuyYbxIPCwRKvA8m/Ub7aueNdC2xNNH5KNWZi8GA5YTI/UQ+lmW8znEqCqyVkS4MWOjeLAJrY6eRZIJMYFK77S+MJFRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SkwNRIVl; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SkwNRIVl"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29d50b7cf9so475275966b.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790612088; x=1791216888; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5i0eNwNQJ7C+ZbxkaslWCixtSKQcLs6enIs7bxdCR/o=;
        b=SkwNRIVl29Kr8s5L//UPzL91ubnM5iKJSxJeqj1yPchi3OJk7hYQRBktWyg5XxG4zP
         0v7XPJNvbfZbuz7vIIKDM0545gOHfpYZq/NG8WzRq2qZmmlDLGYuTyDqy6Jg6RHoFS6j
         Q4wGRH+7u1W2WOexxVy9Pd/h2POVOYY6fjBcM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790612088; x=1791216888;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5i0eNwNQJ7C+ZbxkaslWCixtSKQcLs6enIs7bxdCR/o=;
        b=OSJmhDFRIef33O7BcFZPFFZRy3J1BFjOw4oWTAAwVEIHXqlR4rDpm+xfqg0XInRAOn
         SzkXpyBgeCHnCkumeHThPigNdEF9uesnJRWTYIPaDHu/7LCSHVqW1mpsnw8U9/6yBB+d
         8Y2/gzkcbj74NDDqD60zzWSbCkZf0oTZqwR455sTh18Om6RuMeMTpnnhWNQ43BtCgQHQ
         Mh8HSWea7sYLF4TsFhyPgPOchZa9mPS/xBauRauqbPweA5xpuzD5ElZSxeAJ/PkIYFYI
         W8h/A1XDcNIDjyJTSPyh34vCPoYBUcKn8g+j9p7sjklJxDW1ECOtFqv2+DIpsMSsOKo/
         ovmA==
X-Forwarded-Encrypted: i=1; AKwUvBxBde0QqNhq69huqqbI9eskklGEn/KKiCXfDWldyGiHdXwHi61pR8BmQPyqA+QdGSW5HL/T8xWa5brS6d0O@vger.kernel.org
X-Gm-Message-State: AFuF++mFtPT4kiJ+ol5d4dT82TaBasbctuUh0ZUjP/MsW4ST0D8ZXMCu
	D1J43QYCtLzouGp/G/rkTDIK6g2JEwyWcLRShqqvtpk8QPdlczBabY0SvE/ueIGHZifhX3DD7xb
	BN2o=
X-Gm-Gg: AYBFou2l3lYwF2N/fHKWycFdH5b7woRPjsfOPNXZnnjYLWRZ+gxS4TjxmtDD94U5agb
	9+j2V/bgqdGZDOz9y1z53klCrcwzq7Kj9fpPgFFM3b6xhrJJkw2ZGc67QijX1bmDBsOv2ZR68rD
	fXAs6yDMOABOADM57Zee/45SwlhDG3xCZ89OetOnQNiU4uPX9yDsQocSczNmEaIZsK9ePsULaNR
	BTDaMw61AAqQXkGIbbuLbDxuBRnr625mYE9+7fmPPGFhHvn3pt9wTkrWp46/Bsa/Vu0ehm13Sr2
	Skcd5I/8AarVCJUzUg8IXDB+vlRUW2gwJSpUXlAZvtlsTCWje7fvkyFyFwZvx0KwT2RrbT8ZHSq
	0uByAou92ShZ+xP3HXfJiU1FBpFllIVdZBLQffIRocozxHQ8w2T5hVC2t+kyykbuJ6aZxEc2Psl
	77xQ5wHk/QvSzJ3PYiYDLZzoCa8T0kMVJjw4gZR17bAiAAmdI+PuCBE7lL2FN073otqKTQ/Qsvi
	kyIWNar3rpdxq8ruWsfueYLSt/HCJLqh06kvxs=
X-Received: by 2002:a05:6938:a085:20b0:c2a:fd39:f23b with SMTP id a640c23a62f3a-c2afd39f9c8mr431457366b.24.1790612088502;
        Mon, 28 Sep 2026 09:14:48 -0700 (PDT)
Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com. [74.125.225.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2dc70bb213sm261678266b.43.2026.09.28.09.14.45
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 09:14:47 -0700 (PDT)
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-4a006bb267eso5212035e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 09:14:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByLpjwqH6ArKPGBbBGK9sJKtaNd9YIIRyPB7D4pn7/kUnsiXXptFfJgsNnPenFbrbMAkib2A03vinBuEkTs@vger.kernel.org
X-Received: by 2002:a05:600c:c090:b0:49f:fd33:ac4e with SMTP id
 5b1f17b1804b1-49ffd33af46mr85097415e9.9.1790612084535; Mon, 28 Sep 2026
 09:14:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-1-f3999362a9ea@google.com>
 <87fqzp8jex.ffs@fw13> <87wlt13zj1.wl-maz@kernel.org> <87v78l6oha.ffs@fw13> <CAD=FV=Wdqn7UiuRy1VY-qH+JYChLTEQgmj2q6Q=FBjCZ+5eo1A@mail.gmail.com>
In-Reply-To: <CAD=FV=Wdqn7UiuRy1VY-qH+JYChLTEQgmj2q6Q=FBjCZ+5eo1A@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Sep 2026 09:14:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WE-Wn60zTn=nsq4qLis_zjncrS37fND6ehtpuvxYp+DA@mail.gmail.com>
X-Gm-Features: AclHuK9ETuB5rRqTFzisUXaxD45TKAx4fN5yt-CUafFgLF-sfb5ypJ_KbGWMJDU
Message-ID: <CAD=FV=WE-Wn60zTn=nsq4qLis_zjncrS37fND6ehtpuvxYp+DA@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] genirq: Synchronize in-flight handlers during NMI teardown
To: Thomas Gleixner <tglx@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Mayank Rungta <mrungta@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 4, 2026 at 8:26=E2=80=AFAM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Fri, Sep 4, 2026 at 8:11=E2=80=AFAM Thomas Gleixner <tglx@kernel.org> =
wrote:
> >
> > The driver change is here:
> >
> >    [1] https://lore.kernel.org/all/20260902-qcom-wdt-nmi-series-v3-5-f3=
999362a9ea@google.com/
> >
> > >  @@ -311,10 +321,25 @@ static int qcom_wdt_probe(struct platform_devi=
ce *pdev)
> > >                if (irq < 0 && irq !=3D -ENXIO)
> > >                        return irq;
> > >                if (irq > 0) {
> > >  -                    ret =3D devm_request_irq(dev, irq, qcom_wdt_isr=
, 0,
> > >  -                                           "wdt_bark", &wdt->wdd);
> > >  -                    if (ret)
> > >  -                            return ret;
> > >  +                    wdt->irq =3D irq;
> > >  +                    irq_flags =3D IRQF_PERCPU | IRQF_NOBALANCING |
> > >  +                                IRQF_NO_AUTOEN | IRQF_NO_THREAD;
> > >  +
> > >  +                    ret =3D request_nmi(irq, qcom_wdt_isr, irq_flag=
s,
> > >  +                                      "wdt_bark", &wdt->wdd);
> >
> > Of course this is a regular global interrupt otherwise it couldn't be
> > requested normally. So this sets IRQF_PERCPU (it has to otherwise
> > request_nmi() would fail), but that looks like a hack to me.
>
> At least on GIC, promoting a regular global interrupt to NMI (or
> pseudo-NMI) level is possible, and Mayank's use case here seems
> legitimate. Any suggestions you have for making this look less like a
> hack are appreciated! :-)

Throwing an extra plea out here to see if we can make forward
progress. IMO being able to make watchdog driver "bark" interrupts run
at NMI (or pseudo-NMI) level is an important thing to do for
debuggability of the kernel. It sounds as if there are no general
objections to the idea. I guess the next step is to make this look
less hacky. Is that something we could send patches for? Any hints for
what you'd like this to look like would be greatly appreciated.

I'll also be in Prague next week for both Plumbers and ELCE, so I'd be
happy to discuss this in person if that helps.

-Doug
