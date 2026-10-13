Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B58B47D44B
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 04:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866320; cv=pass; b=X1FuRlhesflm4aRgMFD06RktWO1G5OiqAGa4QivHzP32WRsiEW76tYnQTxckI4NqJFd4oSDgI4sCH0Yic0UgMWp0YUnUnVN+nFjpprPQe0CivoTGJ0L26jp8ci0qqqI5V31lEE5WYjGbPJgrmcdZxA5RiD1qH2YcEfhT9/+aJ6k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866320; c=relaxed/simple;
	bh=kwMGDx6YW7jEV6JGO4/HACSayrMp0IM828fpuRHk5/M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S78F3dX9RQ+Uiy+OHyO7PAbyOaSFsRbkZyeBl/1p0f54buZOwGowtxfzng3D5yGFpGi+Em1laFA6ISfQvJpQGJdPJj1rn5i/KeQUCDNZaeUMvaiD31RA7qF7IdlliUpoDnm2kGkk4KY99LeQRWIc+lgyga/3tWSoG2mizBHca/o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCDrlHRy; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCDrlHRy"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6af8620a7d2so3038384a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 21:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791866317; cv=none;
        d=google.com; s=arc-20260327;
        b=BCxqaQ7x2VMjBz9s87K5oNTWW63zquJYYVTyaxznp9CcBFjFYXJWjG/8fHM1vs4ol8
         XFjkpczOglAtwqkjkLpj/GF9qA8iPSAJFuety/43k+qv6CGWYB5vA1372hK3Wg5n4nO9
         Lz+5QsLw/BT4FNvMeOp2pSw4EChtOJAhmGHIwWv2GglNsyIaszeMqf3etxNaoLArOrBv
         U5/2e3QjyGPrqSr1Y1QEJ/hbU7nymW4F0cL17mlta4a6MHA7J1Em9QnkGzJrp3NiGJTl
         TgAJB4EsIIwpXvOIgvxxv6rEQF91EY+eWEOsP1KjpV+/b2nNhx7QDyHC2zUpj2ggG+qe
         ggrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pxgu3fx9TRD8oVfDId+xboYyQW4bMqWkiNr1MMvb6gs=;
        fh=qDUCYx4hCZvY9ir3TTzy1s8nDP4n5IWZNvQv6Vp7KOE=;
        b=aj8wZQ2J0qsYYEUl9mZL2PmgJBIdTXvsPOio1wGdtWfYG5NMtGfN2G2sP3FIMpks/l
         Gv+KiGjmQGr+dCDNTgQC9NPykYGg7P3sQB+u0l5rqP86p3SkzJjCiYJXKFpiPLO7DjVU
         CLRrG7c33wXCMIrcbw5j/D3hZXqPuHhmoFlsj0aE68t/YStQGJfNfjL1FfUiUadE5PFw
         q2IAwAA95Q7wS+1qW/1vqL+g1KTymPAX4Y+NwoTRZRH3RGrzJ5OTq2cQj8K4jUNynHt8
         lW9aY/rapPc7BgQnq/xyJWDvh/+V76sE+R5/9bnwRqcALiH/3uQTGeEuLmn+UNluH8V2
         s65w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866317; x=1792471117; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pxgu3fx9TRD8oVfDId+xboYyQW4bMqWkiNr1MMvb6gs=;
        b=fCDrlHRy4lRATSaqObciAKFw0TJIGERr+ueGTzy/mCqBcxVK9KnVISeAYwgsaaXPeX
         zu4Yws6v9gsRUEwx0gxDbfiijNCCne6D2FjQeOLPoZkFD4brk5MKM9KMxdiVkoE1qAui
         qhBA83+SqxCFl6sINuqJVEDa+2atABpdktwBDPyE+alHvzSWKbpLl8tDnW1okrYqqdVc
         5VZKYFHgIFFD+uotu/d5y1J6xs4x7R23G6hz+BItXBHbvapW/jasQGIfqK2FTThZaNlb
         1isUhT1SqhlutVIyXGCI4/VO4MjJ+beyKnDQq/erC6nxBTzkt4tlkqdnzmLcEa+F88gd
         noiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866317; x=1792471117;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pxgu3fx9TRD8oVfDId+xboYyQW4bMqWkiNr1MMvb6gs=;
        b=NmEZ3s4vyiBSBUOlrY1zPOvHtethYvqBvVhqyfjcbsX5qV9mbfGswdSawzZqnC3+xW
         k5MSmYuiwkTQcKFS8HtJ+u3wTp5RhpRbSBIddA7Hp3YKcqud1qJ6JqSxZyF33utxIS5n
         DTul3I9DqXlaFlZnKCs03KdrSnAd/zFZEOWNAARjkJYV3GKxLA/4xKpmmfAB5RRZ6//7
         tHLJcog5iUE9MlmEYpszLYBlcF3tz2ilZFttpl/0IUP6jrjEQM9gv8Ei1umwMM/oe8rf
         crn+8TTvdyk5QSeKs1r89s/lFYuTTyloBZd1DbaqAdvCScki/EElulh88oHOlvjCRcr+
         RHqw==
X-Gm-Message-State: AFq9FYIOUbzORN+2iHMijRtpnCYjA5EbQ1QTBa9Bz1LZMJfBoagX15bz
	OFuMXZvlh/LRV1eIR44s3vufH//dyCHbW7QlqrVBlJgOevPXzHaeF5lUE0DBkDGa4M94l2FrZHU
	RqIXkoYPaUH3V23Jpd6ABIMp1UzPW8vE=
X-Gm-Gg: AYBFou3x2mP67ZAhGmsWvRuROgDaj2T0VozWB88mLQQn/C4gdRlAQ4yLW5HPPpi8y2t
	qz9MIgVQlXsbRz+L3IptF+soZu6TfvUzmUrMSImW2tqYAO2mz342EnZLpwRjbz03KY/CuTwpTUZ
	l/9CoWgXcEbvMZTiUykPzk3kd2liDEThFNO5qeetRfUt4Y+zjDx7f3MMeHyVTyNXpxU51G4+90V
	pLvNRbdZTIT1dBU7znmzp6r2Pm4m3X+i/hrnYS+ORep1ZyPlCPq8DYA0ICYqfnWgQFz2YgTNGx4
	brELWIViYAykxxXrtOkTklLPq3sqN/s6v75dY6PAX/gsGIO+hAaWfB5pteEbjQXRM6zKeF+GrbN
	yxWVpDdHfOVoL
X-Received: by 2002:a05:6402:1f82:b0:6a9:bb40:6de7 with SMTP id
 4fb4d7f45d1cf-6b17c2a2d54mr9683306a12.23.1791866317127; Mon, 12 Oct 2026
 21:38:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179184923104.248043.14168731037113716140@mail.ustc.edu.cn> <CAH2e8h6_pACX_j8YBDhhSZzbfs45waF-Y6KJo82_2c6BT0suEg@mail.gmail.com>
In-Reply-To: <CAH2e8h6_pACX_j8YBDhhSZzbfs45waF-Y6KJo82_2c6BT0suEg@mail.gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 13 Oct 2026 12:38:20 +0800
X-Gm-Features: AclHuK8ikXCMqYZWUZ4AdnSHfDjzbRjbXCHV1nm3CLE0ArHVljTTZwrpDStF-5M
Message-ID: <CAH2e8h7H5-DzTj1zwejYQyNNtupurgzYq4t6gKPZoZw=7EQvrA@mail.gmail.com>
Subject: Re: [REPORT] SM8750 bonded dual-DSI + NT36536: first DCS command-DMA
 timeout on cold boot (DMA engine stays latched; DSI-side reset does not clear it)
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com, 
	neil.armstrong@linaro.org, abelvesa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 12:34=E2=80=AFPM Pengyu Luo <mitltlatltl@gmail.com>=
 wrote:
>
> On Tue, Oct 13, 2026 at 7:53=E2=80=AFAM Qianhui Xu <xiaqinghuan@mail.ustc=
.edu.cn> wrote:
> >
> > Hi,
> >
> > We are bringing up a Lenovo Legion Y700 (2025) tablet, TB322FC / Qualco=
mm
> > SM8750P, with a Novatek NT36536 panel (1904x3040, DSC, video mode) driv=
en by
> > bonded dual DSI (ae94000.dsi master, ae96000.dsi peer).  Our tree is
> > GEEKiDOS/linux, a 7.2-based tree that carries the bonded command path
> > (dsi_mgr_bonded_cmd_xfer() plus the "bonded command DMA failed" / "peer=
 command
> > DMA timeout" messages).  We could not find that path in the vanilla 7.2=
 sources
> > we compared against, so question 1 is partly whether it is upstream-sup=
ported
> > at all.
> >
>
> In a word, the panel driver is supported, the DPU may not be.
>
> I think most drivers for dual dsi dual dsc panels in the upstream are
> alright, but they may still not work due to the DPU. Once I upstreamed
> partial patches, but it is not enough, we need more, like we need to
> hack the dsi clk source select for the 10-bit CPHY plane, etc.
> Integrating such kind of patch to upstream is time-consuming and
> troublesome for me. Even if it works in Ver, nobody would ensure that
> it still works in Ver + 0.1, as there would be many features and
> regressions for the DPU when promotion.
>
> I cannot help with this for now, sorry about that, I have not focused
> on this for a while due to things irl,  You can find some threads in
> LKML about 10bpc 10bpp support on DPU discussions that I was involved
> in, it may give you some insight. You can also find some records about
> bringup, for instance, please check the image in this thread if you

OOPS, the thread is

https://lore.kernel.org/all/CAH2e8h4Vp9fJYAUUbOmoHSKB25wakPBvmpwa62BTRqgRQb=
MWuw@mail.gmail.com

Best wishes,
Pengyu

> are confused about if it is __really__ supported(i.e.
> https://postimg.cc/xJr11DK5, and another snapshot for GPU bringup
> https://postimg.cc/0zz30h8P).
>
> Best wishes,
> Pengyu
