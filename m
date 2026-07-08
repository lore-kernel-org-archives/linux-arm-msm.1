Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879C2375F8A
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 16:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783526743; cv=pass; b=kNK0znhm+8FujAgX1gtnDS3PakWRI2+lsvBMe08C7Q7khVxguPKp6mfPVnrpRAwYTo5d2VUkfrQwHNb6Qq7jZxIGlVrUvCw1UJn2hxnRjaJ4taAaTJgpzC4XakSxAgx84kfl+fDEiEc+h2lP9UvPajnfQkrkWQ1ddMtALfm+gSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783526743; c=relaxed/simple;
	bh=waOMVw2yTWW8WtkFsaHmffSfJuGkRkMHmMfBNtV/t98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YlGY00L99J1kEc3Jo3LySsjruzhlKHkj4YWZvsc38mSOqBVu63FX/w/7BE4Su5Kw9/nwdJGa9QsHkQ4D3+rVzh9bETQG4TUTgZeQq2PWqseE8EnKunFE43hc5ysKtlq/Igg3vzID4h6BVT0glZ+ytefzDaE+K6OeZZrrjBaoqpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0V+MGgt; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0V+MGgt"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-664d78637f8so1226940d50.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 09:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783526740; cv=none;
        d=google.com; s=arc-20260327;
        b=Phz+RbBNHpFn99I0uFMB0B7gddahYjEGi5VqR7gu7mpXGNBjHcKWXjDRa7KVnNYwoM
         WAZddgeU7EvGKrqtn1f4vx4t6TMRm5PMsqI0QFdOq6VdP+nU36SLG2drPkPII/Ca0qmE
         ReENyth+oZqAgLo2orEyqth4v/kul0Gd7teT2LXrXPPZ7YZtA+2m/AQrisZSSOS1gElu
         Z3YOPfFLFrmgHcSSb5/Kpr4YKo5jEFRjRs7CFkqJu8QxtL2fKetJMBfDnZ8RllzLqW6P
         9cBRCoks1cOVbUVZIk9qHqfKPWSe0u+qSOz/M2HvbEJM7+mz8NtjwhROYvfUbBX1fNg7
         71hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FuShbMRKE0SZi3ijoimKFf4ervQLR1MwgbAPy6duExE=;
        fh=vcrbICZ7/0l+wtuEySMvuhqHxlnp0TgE1nEIt048kn4=;
        b=qxPp9L7xSBgyugN4dRA/IojOxPxWVGKUN3Wjvrg+ocvCvGl1qDwoFt7Rjpnc80gW+D
         HPMPmSApo/2POJksD2rwrjIPK+Uc7OKMC1KSZxSvH7aBJ+sbprfeS4ZJ7Hg8spKQxx+V
         fonCPQQ8N55lambB7LZ9jDUJS6k1iCS2A9oLY+s4T07NKGhfTQl1UZguucxuzHpCH6Ep
         kW0zTq/bQdrh9v2++Z4JJwkMvU8ikg7KFzDoutcGyEXXnGHU9aqwZIPvcClHX++uA62/
         zaMM9ez90zFW3a5AlVWNAkAy+eZxotHeVYPRd/3ZZl6rFeUgcmf+Q0YrzWKQbIT4q1Zu
         LSPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783526740; x=1784131540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FuShbMRKE0SZi3ijoimKFf4ervQLR1MwgbAPy6duExE=;
        b=N0V+MGgteouYwFDHm/PDZPIHiMNyjB2a7l6USpl0dDm55lKMdUS3isL4QP4UHzC7x0
         ejDilo22JtboF1qMjoHNNDXvSB2TtZ3eFq7fz1VLcLCEFVW7nXVGd9NSvBWoe3d4+yI+
         lzjAvxBPSGZc5klOYah9CkNCiAWkRtbZzZ4vQ8fhvks4Z1FPb5OmgNAVaBuF4U+ko8k4
         0XAJwLCWa4bRKyqce2ne84XroFJLntiDIWBF9Z0sYVgFixlYUAfDBFzbnY0ZUuVBJXVI
         brptftxgdVAAINd9lgIBlO3WgI1XcVyo2BNeorbYqvqvxdIpbrpu6UulQmD4DeX0nBZY
         sCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783526740; x=1784131540;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FuShbMRKE0SZi3ijoimKFf4ervQLR1MwgbAPy6duExE=;
        b=Sdu7hrOy3F2obDlIWHGDFS1qeYFKNuyvaB73z5+XXV94T/CWy9/Nc+lvicbk9LirT1
         E/hpOoblaJ7/Brm5vaXWKb64wQTeKH1bq0z5eSR177TPhZtR6DqL14G9yGH2/W3yJjJU
         y7xxZyCRZk/GMF55LG1Z452LWtTeT0HjrCQHb1G81xKsj3MgYktNQZAIO6Ap8oE0AaHK
         zfBOm4BilLsRLgswzNgHH28y/W8Cklgwc3QhgfVM04rSMu4UelEIddW++j7QH2ClZOxS
         7VRn9WrpOOmBWEvkO6YXPMDjQiD/50LSlIKyg+bQBQhzqGSWLR831zIUaEqn/uXT28Ad
         j4KA==
X-Forwarded-Encrypted: i=1; AHgh+Rol3Stvzud9MG6Tk8Ogwx0V54zn/DWtztx5+Ct2Gteyj1s4EQ/6PgUd/387Zc+9KmGLgSgozlbAk/1X4uzL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo5hv80MZtkI8LBKnTNlbZdEMnuD38ZxzyocQcvJ/aVbviPIZg
	8sVVj8dwTamURBSjZO18Cioit2JwxxjAnx/FHfqU5Ti/5lonnG77nenLW3prYSREEc91FS6d1vY
	hihdVrufYAmdv83rf7748/4zALeEkZZQ=
X-Gm-Gg: AfdE7cnnJz2WdT9XN+8M0l/woYX3dQAKqrhotF1fRhpkgZecdtRskaGNQMWCQ06pg+s
	XRcAupKTrFCLX+mEIsv3DLMStGgG5kqjbJynCmEP2pqfGUjefRXZo326B3jI3JuWgSMBSrkc36s
	lT/jLpgfzD7lQywJK9yuz5YF9ztjE4XOhSXxvvX1DTpAkHFf2AERpIQWNJ3MNlcYQ5F4lP5c2Ok
	SNcknPVJynxHU4QqkGIIUEYoKkpaov/S5jYAfC1ldtpPwSATeSohEhz7uTSOvgDHKs+EWi5W1PA
	Wfnh5x2m
X-Received: by 2002:a53:b117:0:b0:666:27de:9cb with SMTP id
 956f58d0204a3-6679f2042f6mr1904126d50.75.1783526740339; Wed, 08 Jul 2026
 09:05:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429-d3cold-v5-5-89e9735b9df6@oss.qualcomm.com>
 <20260629211614.6942-1-threeway@gmail.com> <hzv6l3g7q55ofr6hu7y7indrn2uzc5kdvlbu3q7om44iw35nbb@5rc5uuhqbnid>
In-Reply-To: <hzv6l3g7q55ofr6hu7y7indrn2uzc5kdvlbu3q7om44iw35nbb@5rc5uuhqbnid>
From: Steev Klimaszewski <threeway@gmail.com>
Date: Wed, 8 Jul 2026 11:05:27 -0500
X-Gm-Features: AVVi8CfNmJVMSvN9XdJeS7IaTnkgNSzIRTTUJaHWTxnojYvf0u8gwqelENm5DeQ
Message-ID: <CAOvMTZhpx57GGakfiS+1tz0t8XVPaydkaCONUxoPFdeXpv+xQA@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] PCI: qcom: Add D3cold support
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: krishna.chundru@oss.qualcomm.com, bhelgaas@google.com, 
	bjorn.andersson@oss.qualcomm.com, jingoohan1@gmail.com, jonathanh@nvidia.com, 
	kwilczynski@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, lpieralisi@kernel.org, robh@kernel.org, 
	will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mani,

On Wed, Jul 8, 2026 at 2:53=E2=80=AFAM Manivannan Sadhasivam <mani@kernel.o=
rg> wrote:
>
> On Mon, Jun 29, 2026 at 04:16:14PM -0500, Steev Klimaszewski wrote:
> > Hi Krishna, and Mani,
> >
> > Turns out, this patchset causes issues but only on some machines.  On a=
 WDK2023
> > (Volterra), this breaks suspend, and on *my* X13s, it also seems to whe=
n using
> > the command `sudo rtcwake -m freeze -s 300` when resuming it crashes th=
e
> > machine.  Interestingly, it does not crash on another user's X13s.
> >
> > Included is the info from Volterra's lspci -vvv and further down will b=
e my
> > lspci -vvv - my X13s has a WD_BLACK 2TB SN770M in it which is not what =
it came
> > with from Lenovo.
> >
>
> I tested suspend/resume on my x13s and it did not crash. So the differenc=
e seems
> to be with the SSDs. I did compare my lspci output and yours, but couldn'=
t spot
> anything obvious.
>
> Since NVMe devices do not support wakeup, the pcie-qcom driver should be
> transitioning the devices into D3Cold. But I'm not sure why the crash hap=
pens
> only with these SSDs.
>
> Since both devices have ASPM enabled, can you quickly try booting with
> 'pcie_aspm=3Doff' in cmdline and suspend?
>
> - Mani

With pcie_aspm=3Doff it still crashes on my X13s when resuming from suspend
