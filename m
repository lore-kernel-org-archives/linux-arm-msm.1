Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794953649;
	b=EH9vNt9sDBA77MjAv25/anrHNVmgCl6u1vleaB+6K13+o5iir0XwMnbAMxNVNUMWj4wh
	 T5DtukcA9UkV6s+Vdi5NtjOwbFobasM52VvIIqYYbp0NlR9AnRHjn9zwpV/jzGG6491Hx
	 CBb9v86tSa7faMNwMVCnCrDXoOzh55pdc+2wbm251XClKkDd+yiqakHzkf2e2yOvPlSN4
	 Wx/ZNpBNjCXh2UzKuW7Eo36QxtOW/uGa8625r+OW2ZULIfGfZvJrdiQ1w4cxde4ccnGVp
	 8xnKblF+7uUJSobH8ubVG/FpXdQYGUk8ai9rjnNGOIWhXK+jHy5AgdObBtA/L2Cg6XA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794953649;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
	b=B7/cUa7TnBVVMcNJr2exodRN2TV0UPCdwJ95zfH7WWvyaoeVOa+WKZYbxeRTAUhlR0T5
	 0qHIXI/LAqsSHpScJwSELIl+bnHtmaQuPz1l26jLTyBUi54CPRsq6ExIvhYa2BMGdyVY9
	 SvWaWJzB5+zXP8ZlztpKZWdxBPaPQ8YynI2V20H/lvDxjNhchHYznQh8S8jCVo4VUOe6V
	 pr8OXbAVlqEVcTXXueIty0VgKdodLcpJ+a2/9KL3bTzgtRz0FxZBef9eqCB0DJgYBP0js
	 Fq3UucSQt9y3RxMq15aPbgei6HotHBoDFk21o1SNY3853BxHriRtt02wS6ry30yr85g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OkK7Oync;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.180
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8AB606A32A
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 22:14:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E8AB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=OkK7Oync
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-572a102ae27so77107b6e.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 14:14:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794953648; cv=none;
        d=google.com; s=arc-20260327;
        b=Skf5lrjGZeodBYZW1uPiUus3fTxDHKeyhm4dth2Hknlp/qBVx7Npe4UeN+yotRL4gs
         V/QT/yg68dHocCFefg4Vgrhnb7h+Fu2lOXZKSRCO4rOzohGFbs49nrFuudgtlBPURI7m
         pNVPBLJLtH8WeBoNWPVqgC+zPnwitanGcHQgT7tDvl6DgWe/yPgoYMZHH6rBmFP9svqE
         Fg93/0BUwWDar/5qtFCwwHfuSoeMVtyVrGJMco5h9yDrQvXejAzdgXwGpkSf0I24j0nx
         OfUt+KPmFeqAq7ZufcDoMB8OSxk3bcQlUrMDupGI5A6lzO64JcV2XEQceNn17921OzMx
         B0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
        fh=G4JCqjkmTff+JH7cMmxXQou5+25lpspJufvtNpH5n18=;
        b=AX9qLRwqnGW6FNan+NHkCiDbEIY2jDHU4IlNAUFyPuCWtWxWOTl9NYMyusAvO2rcCh
         hvb2Xa0O9LaB5W2Gg6mN3+5SRVXbmUvDW0enTu6n8bph8puMUYU7dNCXUDAukZfHancy
         YbuzicZIt5kZ6Wi9nVHUB7lqDp7MYDVNL+Tq2Niy+/aZk3FWaUBhQrRn8D3plWNvHPnm
         Q+ncDluU6/1bT4pw2dh2VAfkQCOkmcsLNCroILaJNAI7OMZ2gEY315k2AmR2QSlA5v7M
         qMAZN9yX088nEVzR6Kbi4z0tmbPjqejCcz/FcpjSGogcuZ7EhdKxpfBqmwEYqHn2Y908
         USvg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794953648; x=1795558448; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
        b=OkK7Oync/0FMR4WGnKttZfm6jO4gY2WpTAuxMTPGGdgi9bYq6J7iIKBa8VpjHUZyO5
         usHhSBmnLWPAXbr7C6Vs10jTLGe6cLQb/ULbjlEAznvTd3S2iUX0UJGNeMWMRtYpl/h+
         +UKeSOLB1H37XnEWzPOp8L5VoUrnAYZz7NqroLlKzaTsWgueA4mg4DEkCra+oakCnwc0
         6hh6uNVuy6hTVxPJNh14dfbCGZxnBU4W8QoTST6MBNSaIvKmXb4ZjqGqzStDARn1ahUj
         6qzHVNjAWI8eUgCJkrSPt7USJefKcGjAegppKzl2HvuzY61fEW4j06rjTP+69RcQFWLF
         yZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794953648; x=1795558448;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kpd7hhfRhWWBKoEgTCNhAfk8GLYDUaewjNnHM0/FSkA=;
        b=xh6xBnQa87LOtEcnU/fv9MmJNVlQOpEYNgzL7zCCHsUiUm3bk8CMH0YyC9jG41dsNn
         5p8+ZaxYdEAjpkDzd9gpJ5R3ABU15LkT7W3Qo0V2IO4j1W5h+tqTm/1M/QLxumLPPioD
         iit8IrlwxQumHQQ6If9P4Ctkle3+Z7upm0FdJqBfxxkfra/Sxk+slRiPy+g+5DsvrR6s
         0MCtpOnF355lsqnKAsvV0ZNkU4XDMU9nir8fGSHRHb0EYWmBW4ecnCytNinMAi2HWcsT
         +XW8EsbR7pzZQv6YQfhlcayu4TD74QCsryhLd8fQnYKy/dXrUwmuksiJVMzqjH+1OPAC
         AlXA==
X-Forwarded-Encrypted: i=1; AL+hErHSq21LkFouRo/A50NZx7o0JlWUr1jH3MVfXST+3xNfvx8ehrzPWcQKY70GZkAdHP/CqA4/hFBIRx14/NU0@vger.kernel.org
X-Gm-Message-State: APuU4Z+IgzOGS6D9k7CZh2EoWpVl95AD0hbttuol8jqVrdxd5alH7Bpj
	oFBmjq4r3FpO/CH0TRz2sZpThkvEyXd1a1dtBFyBnVc9XMhCJmm3g+M36vUa2C70hpGF7M4sJ8A
	yEfn23+zrMiu6KJ3x+8Cps/Pi3HQ1aysN8rp1K2uT
X-Gm-Gg: AYBFou15K/7qA2zlKEPx1m72cm5YJK0cPCfDwfdZ4dhHEH2MadWsWz3wT0HrVzKi5gt
	295fUBqpmz2r1OpsgjHKsZfqqmmYeToFKQHDA9rwfSOVZVOnWK/dRYX6nWMftHCsrVAr5GAV+Er
	dSITEDE5K1RGpEfxT97e6+ig9NMEWKVGo8RbQ9hWUAXmgp0ZTLlqQ12+GZ04MA+tSKC6NsmsJ/4
	3x0MLnOI3bE2Fy0tJqEcGsdOJqF7bktx7OPQ7eYwkPnuUGKXemlem9miNXfg4QQY4bAScrZad+z
	+x3LRwhg0D0Y7bVIPgUh8tAjTq6DjdMqGHecuJD2+sjWEScGD2NyK6W/Q0mwFkkHEgoQkZqJFxy
	BBVB/MedFGYI29si9D70fF5Bf9a3Zu54jxUEBWkbACCbsNMuy+FQFeukBpPiIgmcGzFY=
X-Received: by 2002:a05:6808:30a9:b0:4b9:a88b:888b with SMTP id
 5614622812f47-5774162054dmr1516905b6e.33.1794953647357; Tue, 17 Nov 2026
 14:14:07 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261112031629.396819-1-mrungta@google.com> <20261112031629.396819-2-mrungta@google.com>
 <sashiko-outbox-210280@kernel.org>
In-Reply-To: <sashiko-outbox-210280@kernel.org>
From: Mayank Rungta <mrungta@google.com>
Date: Tue, 17 Nov 2026 14:13:55 -0800
X-Gm-Features: AclHuK-gfyGRgfHP6b95c4djqnr6JWB02JWcunq_dlapBgDtO9GdRA_nY1E9eCw
Message-ID: <CABz7rdC2Q1qtUdhiXDpEydbhCnSaNSuS5jzcUK+cZFdNZmULgw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] genirq: Synchronize in-flight handlers during NMI teardown
To: sashiko-reviews@lists.linux.dev, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-watchdog@vger.kernel.org, Marc Zyngier <maz@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, "Kirill A . Shutemov" <kas@kernel.org>, 
	Douglas Anderson <dianders@chromium.org>, Mayank Rungta <mrungta@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sashiko has found one potential issue:

> [Severity: Medium]
> Can __synchronize_nmi() return while handle_fasteoi_nmi() is still runnin=
g
> on another CPU because it checks desc->nmi_active before querying
> IRQCHIP_STATE_ACTIVE?
>
> Unlike regular IRQ flow handlers, which acquire desc->lock before setting
> IRQD_IRQ_INPROGRESS and calling chip->irq_eoi(), handle_fasteoi_nmi() run=
s
> without desc->lock.  On the NMI CPU, hardware acknowledge sets
> IRQCHIP_STATE_ACTIVE first, then handle_fasteoi_nmi() increments
> desc->nmi_active, then chip->irq_eoi() clears IRQCHIP_STATE_ACTIVE, and
> finally desc->nmi_active is decremented:
>
> CPU0 (NMI)                        CPU1
> <NMI acknowledged in hw>
>   (IRQCHIP_STATE_ACTIVE =3D true)
>                                   __synchronize_nmi()
>                                     inprogress =3D
>                                       atomic_read_acquire(&desc->nmi_acti=
ve);
>                                       -> 0
>   handle_fasteoi_nmi()
>     atomic_inc(&desc->nmi_active)
>     action->handler(...)
>     chip->irq_eoi()
>       (IRQCHIP_STATE_ACTIVE =3D false)
>                                     __irq_get_irqchip_state(...,
>                                       IRQCHIP_STATE_ACTIVE, &inprogress);
>                                       -> false
>                                   /* __synchronize_nmi() returns */
>                                   __cleanup_nmi()
>                                     irq_nmi_teardown()
>     atomic_dec(&desc->nmi_active)  <-- NMI handler still in flight
>
> Querying IRQCHIP_STATE_ACTIVE before reading desc->nmi_active (or
> re-checking desc->nmi_active after observing IRQCHIP_STATE_ACTIVE is
> false) would prevent missing the handover between hardware-active and
> software-active states.
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112031629.39=
6819-1-mrungta@google.com?part=3D1

The observation is valid in theory, though practically benign for
disable_nmi() and free_nmi():

In that window, IRQD_IRQ_DISABLED is already set by __irq_disable() or
irq_shutdown() before __synchronize_nmi() is called. If
__synchronize_nmi() reads desc->nmi_active =3D=3D 0 after
smp_mb__after_spinlock(), then the NMI CPU's
atomic_inc(&desc->nmi_active) occurred after IRQD_IRQ_DISABLED was
set, so handle_fasteoi_nmi() is guaranteed to observe
irqd_irq_disabled() =3D=3D true and skip action->handler().

By the time __synchronize_nmi() reads IRQCHIP_STATE_ACTIVE as false,
chip->irq_eoi() has also completed, leaving only
atomic_dec(&desc->nmi_active) in handle_fasteoi_nmi(). The IRQ mapping
is not torn down in disable_nmi() or free_nmi(), and even if it were
torn down immediately after free_nmi(), free_desc() frees struct
irq_desc via call_rcu(&desc->rcu, delayed_free_desc), which cannot
complete until the NMI CPU exits NMI context (nmi_enter() /
ct_nmi_enter()), so no use-after-free can occur.

Human review feedback on v4 as-is would still be very much
appreciated. I plan to hold off on spinning a v5 just for this and
will swap the check order in __synchronize_nmi() alongside any
maintainer feedback.
