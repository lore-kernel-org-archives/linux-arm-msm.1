Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF414E1415
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 15:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788534019; cv=none; b=d1Zd1oeIpZHzrMYG87ZSfpisVDHg9jzmRgOrUjMMvrDpbuZ2eT194vlVKrAy4iJos38nF8mZvAOtKnVILyKm0yjx8oCp6HK5q6aL0R1XKteNkx0puUruRuRSoYtl1cWfQbT4gh9mpssoBbbf1ADEahn3y2DKZbWgFN5wGanxX60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788534019; c=relaxed/simple;
	bh=m6woJE35uAQXcaorYQsjjoNm1tJ3wemg4GwQSTR1U+M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=drvYKWneWBGGvSSFU7XgfAmo8hKLJYe5Px1LWEHKhauMyxVHvbMEiiK3Y5WIlkg8WATTpTujiCwdQmYmIwbH6ih4vxif268Z0gpXEnsYRKHscp92G4etZn1KmWKyLudiTo9yyAddpS2QTzZQXgiZIKw0yB3s7sXOCTZUnv2hqSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DRXxe+Jb; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DRXxe+Jb"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6a68aaf4840so2545839a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788534015; x=1789138815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m6woJE35uAQXcaorYQsjjoNm1tJ3wemg4GwQSTR1U+M=;
        b=DRXxe+Jbx4K6FR3XteCZwq8Jr/l1GYHEnY1A9KvqN/KbMSdUw6ngT+NjoVZB/wVb27
         NTET7R8NE+jr61+ZbeCcDfzOx1KvRH96NTvNxskTDRrsGOaehktxsSgSv9rE/wp+ewbg
         Ef/GP+4rbEsQ5twOa72GYsqqqgmao8tCm1SO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788534015; x=1789138815;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m6woJE35uAQXcaorYQsjjoNm1tJ3wemg4GwQSTR1U+M=;
        b=DmkQ5w5dmVsDUGD188nn/CdnV1uEBg7rA8u4gy7uyAR+Cg8DmPFKyuqHRM/sx1l2tX
         /w5CfzCey8wYI5G4lctfxHR0gRPqjJ1SXMNGy0vHKgwHhyoWR8zzM3RHYvOsQSCRYWzk
         TDEpdFmkoQ9E0Z8fHp3wqqcYjslONZ41mKhGdKNX+QFPiMEhQXJX5K/T4PgnUqii+id/
         JllVuNtTzDvBvFZeqeWrrz5v0avJok+Lkf9yhiI6eFb35FIun/SKrCbmkuklqoppNF+V
         4x3G5WEGgQLkGlChrQxTvyneflzDDvtIH47XaJlTtwVachFk+FO4T+wkU7eHAhgE2rP3
         NeIg==
X-Forwarded-Encrypted: i=1; AKwUvBxIbpwPYiGZ5e4DL+0buYGK7vNJCv8TlhJEaBEeEAxP21v8orrGaOCyh1OW8T0YFs7DT72iPKoj0Gw/J9OI@vger.kernel.org
X-Gm-Message-State: AFuF++k5cVBN4CfDXn0pUB1unzF59S5ggnBnLrVeMEhSc3E1ZPRMgBio
	Uuzc92CLsnBhqwd52UmU/lNrAGR3/Lt3WIU6Kw9DYPKJ/vKRib1AClsGaQLCqUVQkGJ7hkwo1BJ
	Q5dY=
X-Gm-Gg: AYBFou2NkbLL2qIhR2CzjnvEvnMxs38XoOVvhtntvjSDpS2xfJ7i/f/7HHUmg3+6APe
	FI0IPZCIrd2tFb1gB07vH5Msdf9jBv+W/P746oScL8t1VY2vK9LoSeh3OYpTAxc3SXnvyRrkGuk
	yBLY0TfHHj6+//03ul3bLFeo7u9vLeSA0pLN/vV12P68iaq0z4s7WkYGYjo9VlXDJKUBwv5Mkmd
	VxdYts9ZHw4WyySeqCcVRFwmnsnr3E+zIeexf3vCHyk9l4BEUZk0AbGD5MUbGWvRuWMbMdbffLB
	pAAO9MYD/jB7ceMmEazzjpBfPWHnyBcKwzCP0GeRq8lVv9e16UwSJEP+f/WFDqwoASsBj5ap22i
	/sfxP5x01lemFRXoiDhqHyZQEVUB7jR5m9XfJErw8v6TKEIIpqbZztr/6+kPoAqm+fM95O1h/Bj
	TL+5ouEXGaOHvmduBwuZMrRliU8t2T/5KWUZ34K8wq8i/VvPCavW9rl/gcMhvO0kBCT+ZjCe4+x
	0pxpw4TrD3lyM3MO9mAagAWO/w=
X-Received: by 2002:a05:6402:c1d8:b0:6a6:b2b9:7665 with SMTP id 4fb4d7f45d1cf-6a6b2b97700mr2807921a12.18.1788534014801;
        Fri, 04 Sep 2026 08:00:14 -0700 (PDT)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3b2esm1341348a12.11.2026.09.04.08.00.11
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Sep 2026 08:00:12 -0700 (PDT)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48431648f33so1545022f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 08:00:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBl/VXLnndkttzDipUYIcZjlhRFYE9hUIt7/ShBf5/+sN5kFjzH8v1l3WNYhP2asD00fuiJYoz/xlzligo@vger.kernel.org
X-Received: by 2002:a05:6000:4543:b0:485:8ee0:dfd0 with SMTP id
 ffacd0b85a97d-4858ee0e180mr574723f8f.6.1788534009667; Fri, 04 Sep 2026
 08:00:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902-qcom-wdt-nmi-series-v3-0-f3999362a9ea@google.com>
 <20260902-qcom-wdt-nmi-series-v3-1-f3999362a9ea@google.com>
 <87fqzp8jex.ffs@fw13> <87wlt13zj1.wl-maz@kernel.org> <CAD=FV=ULeHqEZE-a9vV9F6vVMLVBPDTeXTgnmU_Bqui8sc1ZZA@mail.gmail.com>
 <87se3p3vzs.wl-maz@kernel.org>
In-Reply-To: <87se3p3vzs.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Sep 2026 07:59:57 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WSpwYJ5=xTA7qWh+iwp-PdSXn0Ucboejq8yF5buyH4-Q@mail.gmail.com>
X-Gm-Features: AcwNN1UNb-ET4q9cT4xesT3CWAaiu4cvwQTslKfaw_0TzhZI43afTLmag298Cu0
Message-ID: <CAD=FV=WSpwYJ5=xTA7qWh+iwp-PdSXn0Ucboejq8yF5buyH4-Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] genirq: Synchronize in-flight handlers during NMI teardown
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Mayank Rungta <mrungta@google.com>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Radu Rendec <radu@rendec.net>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Sep 4, 2026 at 7:54=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> Hey Doug,
>
> On Fri, 04 Sep 2026 15:34:12 +0100,
> Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Fri, Sep 4, 2026 at 6:38=E2=80=AFAM Marc Zyngier <maz@kernel.org> wr=
ote:
> > >
> > > On Fri, 04 Sep 2026 10:17:42 +0100,
> > > Thomas Gleixner <tglx@kernel.org> wrote:
> > > >
> > > > NMIs are strictly per CPU interrupts. So how is this supposed to wo=
rk
> > > > correctly when looking at irqchip_state(ACTIVE) ?
> > > >
> > > > Marc?
> > >
> > > I have no idea what this is trying to achieve.
> > >
> > > This can only work for a global interrupt, not for a CPU-private
> > > interrupt, since in general you can't observe the state of the
> > > interrupt on another CPU.
> > >
> > > My guess is that the OP is trying to trigger an NMI using a global
> > > interrupt, which we never intended to be supported. That's not to say
> > > that it cannot be supported, but this patch seems to be breaking the
> > > core use case...
> >
> > The overall goal is to take the watchdog bark interrupt (which is a
> > GIC Shared Peripheral Interrupt) and promote it to NMI. An example of
> > that interrupt in the device tree for one Qualcomm board:
> >
> > interrupts =3D <GIC_SPI 0 IRQ_TYPE_EDGE_RISING>;
> >
> > The patches in this series seem to accomplish that. With the current
> > arm64 pseudo-NMI implemnttion, requesting as NMI just bumps up the
> > priority of an interrupt to "NMI" level and that works fine on SPIs as
> > well. On arm64/GIC interrupts are routed to a single CPU anyway, so
> > requesting it with `IRQF_PERCPU | IRQF_NOBALANCING` didn't seem
> > absurd.
>
> Not absurd, but the implementation as suggested has the potential to
> break per-CPU NMIs if you check for the active state on the wrong CPU.

Ah, got it. So if someone decides to call the synchronous version of
disable_nmi() for an actual per-CPU NMI then it would go boom. That
makes sense.


> Also, checking for that state doesn't mean the kernel is free of
> reference on this interrupt, as you look at the HW state, not the
> kernel's.

OK, fair enough.


> > The biggest problem we had was properly cleaning up the NMI at module
> > "unload" time. To make that work, we needed a way to synchronize the
> > NMIs to ensure they were quiescent before the module was unloaded.
> > That's what this patch is attempting, and is mostly attempting to
> > respond to Sashiko feedback on earlier patches.
> >
> > I don't think Mayank is tied to any particular implementation and the
> > overall goal here is to allow the watchdog bark interrupt to run at an
> > elevated level so it can produce good backtraces even if all the CPUs
> > in the system are locked up and the buddy lockup detector doesn't
> > fire. Is this something you think should be doable? If so, what's the
> > best way for Mayank to go about doing it?
>
> The only thing I can think of right now is some equivalent to
> IRQD_IRQ_INPROGRESS done in a lockless manner. It doesn't have to be
> atomic if you can guarantee that it is checked on the target CPU only,
> after having disabled the interrupt.
>
> But this is rather ugly, and I'm pretty sure Thomas will haete this
> just as much.

Thanks for your insights! Hmmm, maybe it makes sense for Thomas to
weigh in before attempting this. ...or perhaps he has some other great
idea that would make this work.

-Doug
