Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D393921D5
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785448034; cv=none; b=W7PJPmPMTx72TK0Vw5LhuR3nbI+l5aFqmfiqgn8AJmY/yJy9IrkXGfF3i0Tg8GuhHNYux/wb5qQ+mFl8Dvz+udXnLOwrRaqbASmzpna0cDcdQnYT+fLzzES7xL5Jh2d2XENOC0Q6DBJNj+3+wecMrKx0sXdOP1gJieVTPxq3IU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785448034; c=relaxed/simple;
	bh=3zePUSKPuVEhoLen7Dlseb8ZqqhKGqql9NuBj13jea0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B8IzE5WNTF8EF7B6rio8u4zpHyo4th3lsXGimQpfolO9v5uckLdtypwxu72ROXiHYe0wSnms36Pm0Sh1vCMCaHGSUOP3WyZdELNavrL1wRHiK6SlabwodQkgwpMEswDtwEFiX1CSN4FwONf711Ab1IbcHDBwS+wc74TjIelpEcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=T6fyRCtX; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="T6fyRCtX"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5c2c46a428eso218403e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785448032; x=1786052832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BEcZSaSov64w+SqDtqbhCImxhflXKNQ/vSfdSGSImp0=;
        b=T6fyRCtX0BxQOQEGS9QkEgl3GVP53KWdfpNTTAGKnLi81+jmjQMjriL2lPW9MREwFv
         aPh3fSoHDvxF2rIFBO+prpR0zRT3mmx+QU7VcmUtrXXeomAm2j32syjPRwm7WF6eC/Bc
         kMFBTk+hMBalXOzhms7FBSSZPXV9/FD3rMDmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785448032; x=1786052832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEcZSaSov64w+SqDtqbhCImxhflXKNQ/vSfdSGSImp0=;
        b=nCvQK+i9kUMs8R+e6R1PZ4y2OMEhpbR3wEwYyW/tkNkvOgtkRz/ODeA26Vr7z+9vcx
         3hl2YEV6DKSRtSZlqEX8AToKtBIkqXuh6Fl0dzyKw5fnpRQIPP0Ho8suyO0kHHx6LYuC
         55xCIaasv+Mc+2H7G60v93bmV8aUyuw4rQ8eWd7wwy4lAFLSgf0gd5BPGS9HEciDyV6Z
         DPoHKtV2G/AYD8zdZg65h6YVG8PuyPav6Lxju6b1xlUGJhUs1z1+ExovYs0GgAYhWTq3
         +eQJIG+N+18+wy6n06nBiOkhKrVATBXaYc8cQ+s3lxTq7kZh5QCwJYE713dsca4x+NgJ
         huPA==
X-Forwarded-Encrypted: i=1; AHgh+RpbzCpoxbBA7nl7Tqp+lTAhWtvjOb4Ajb9lke+lJKd7T2N2GdcCivo7dWkH0PP/ghLGcL+p9fR+DLis8pF3@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz3fTMif2w3W9mh+b+LLLesz7djvWNSkcK9evb0b1LD8/0TwPK
	bp7o+cUTaW3jyQiC/rKJFJ2129pYOXipo+nQRrIWFHslT9wodnYIGpqGctNbBAi7X3Gu9HqHzfG
	7Rn4=
X-Gm-Gg: AR+sD11/Fm8uR9joZ3S4cOnDxJUwiHaJG3ufnlWetMo/Y3UW8GlggqD+CuFStB+NJLZ
	s1HpSzCnGXTTSAS6pojfaHk49DsVplKnxrA2c9NrH1JscnwCaIEtWA7Oz4hAtw5q1Aptl7b7Rho
	6yWBM6OjWqPhIhMmLbXwSWtB3PEn8+XRH7N597lZwWsRnYYdRakRg7BfSU2vMMDJr87RGLlf8hG
	gtwTpZZUN+Cn2prF9fhvLoTrizh1eqmjI7FtOOvRHym3xWkXVofAmWJysRRnboKUFVVur6qkDw1
	GHXeCBQRwYFY+P/wifleZp3yDl6XTF5XelbmfCX3m0fP7pMXzbdLbzqpinhw0rFjE7XXyxrUG7+
	Qpk+hpAbkhgr+MG5x4uhntfYT+rgXIQ3Mzr/kJ/u3NQq6JObtXaPM3O+PupvdHl2ykVnqLp581S
	qOWar/Ftd5L4xVfnIwfxLDSdYUivoqV95X8KYyzVtKw1BPsnv70X6UYkcwh08ZwKwppTQewrxjX
	Uh6P2tro7mPWABSmyAarVRoqHw=
X-Received: by 2002:a05:6122:4892:b0:5c2:d11b:dfbc with SMTP id 71dfb90a1353d-5c36602407emr1741869e0c.7.1785448032020;
        Thu, 30 Jul 2026 14:47:12 -0700 (PDT)
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com. [209.85.222.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c366725662sm2397363e0c.13.2026.07.30.14.47.10
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 14:47:10 -0700 (PDT)
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-9725084c547so132049241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 14:47:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpZ1ABq1a05hLKFX0LRxHwL+7EXBiLYP0lLh+DZJiBs9Yx80EUpcXPoqJRtnZyPVtKl/NPFJa7YEwjw7ETN@vger.kernel.org
X-Received: by 2002:a05:6102:3047:b0:740:127:c81b with SMTP id
 ada2fe7eead31-7574dca124dmr1665460137.7.1785448029188; Thu, 30 Jul 2026
 14:47:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260730-qcom-wdt-nmi-series-v1-0-3aa86d162914@google.com> <20260730-qcom-wdt-nmi-series-v1-1-3aa86d162914@google.com>
In-Reply-To: <20260730-qcom-wdt-nmi-series-v1-1-3aa86d162914@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 30 Jul 2026 14:46:58 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V_7RLjcAtKk5MHiABj1rA2CTkPw2UY2gJnVzH=3Gbp5Q@mail.gmail.com>
X-Gm-Features: AUfX_mytlaDARoR1dw85A5VeD-oPperL8oh_dbbeAf-fbsBmoOf0-Vxqm2C-FZs
Message-ID: <CAD=FV=V_7RLjcAtKk5MHiABj1rA2CTkPw2UY2gJnVzH=3Gbp5Q@mail.gmail.com>
Subject: Re: [PATCH 1/3] watchdog: pretimeout: Protect governor access with
 RCU for NMI safety
To: mrungta@google.com
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thomas Gleixner <tglx@kernel.org>, linux-watchdog@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	"Kirill A. Shutemov" <kas@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jul 30, 2026 at 2:33=E2=80=AFPM Mayank Rungta via B4 Relay
<devnull+mrungta.google.com@kernel.org> wrote:
>
> From: Mayank Rungta <mrungta@google.com>
>
> Currently, watchdog_notify_pretimeout() acquires pretimeout_lock using
> spin_lock_irqsave() to safely dereference wdd->gov before invoking the
> pretimeout callback.
>
> On architectures supporting pseudo-NMIs (ARM64 GICv3), watchdog drivers
> may register their pretimeout warning interrupt (bark) as an NMI.
> Because spin_lock_irqsave() disables regular interrupts but leaves NMIs
> unmasked, if a pretimeout NMI fires while pretimeout_lock is already
> held by normal process context, attempting to re-acquire pretimeout_lock
> triggers an unrecoverable deadlock.
>
> To make pretimeout notifications completely safe to execute from NMI,
> convert read access to wdd->gov inside watchdog_notify_pretimeout() from
> a spinlock to lockless RCU. Use rcu_assign_pointer() when modifying
> wdd->gov and invoke synchronize_rcu() during governor unregister and
> pretimeout unregister routines.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
>  drivers/watchdog/watchdog_pretimeout.c | 47 +++++++++++++++++++---------=
------
>  include/linux/watchdog.h               |  2 +-
>  2 files changed, 27 insertions(+), 22 deletions(-)

I pre-reviewed this for Mayank. I'm not an RCU expert, but this looks
right based on my understanding. My AI was also happy with it. ;-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
