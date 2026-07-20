Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506E542A80
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784583517; cv=pass; b=a3ckSjS4CmZEKb1+wyLXMF76dU47g4aGJc+TaZ2drgvHE84hfr/nateZbC7kIT3jCu0GC92uRMjWwq6dNP1jSkkEiavTEikMOgQ7HxqGvBK8vOKNVn8xtELzkNz08bkqxb3GbCPz5O7maFMciODEFeDuiT88oriWVq+q9uURqRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784583517; c=relaxed/simple;
	bh=G0Z4YNxUpwtELkyBiYzWJVTMYEO70JO0synktnauLes=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ylb5xIRCEov6WHtCNStkFckSWX5x6iDpPvbuF2iN1cTLXDVBoYwsPbbpTycN0RmoFwEzLWxTWRkA9EsC58aIjoWjgfPyDzN/J1TMzxJudm8q/jPh7ijw5UguVoxWq1I5DkgGoASdjC/MZSVAtoqPCKI9DleE0Ip7RpuajTFP7uI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hMlHIEx8; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hMlHIEx8"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf452def93so17926835ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 14:38:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784583516; cv=none;
        d=google.com; s=arc-20260327;
        b=DG2xpWZh9qjROmWXPCpzBu+q5WZwl3Enc+GzDXf/uMZP+7eKLfMbeQRGmRIjRYZDpD
         iPN5Nh7DTT54ehw1xO45lNbWZbEQokQQoSlxLSjyjsAO8sPYGbNkJp5TCcX/9pECTb1p
         /L7CBcR+ZthZwkB3hlrH0RYdJ+/GVSqleduVqwshS6gIWPgGmvc+moOTi2XuoXjL1m6W
         ITdBT7WkJghKJjbJSUfnyaN6AAwq3xV6ERabIu5X7BsHm2giRK7bFSp2kPdlqoNexEGJ
         zLbXXmQsVOjAzrfEMdJHuMqnlmSbK2p5/K7YltmgipA0Rpw7R+Pn2VGE1NJ1jFhnMrAz
         lesg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G0Z4YNxUpwtELkyBiYzWJVTMYEO70JO0synktnauLes=;
        fh=9+jEaivgKdW7tWkASA1YxxSR2rx1M1fofRiX9uSeKVI=;
        b=E1LC7X8ZHFCbuiELf63hgcHWiHyDjt9vgSzGZ/C8aiHPdEHfK/n15A7TCPYcRIacZO
         /3BZE8RDVNMtyNakYWBJicJbcdWqWP0aZ61zxplJVkWIDtW0CoDO7btOEQVMlojPm86W
         pTXFbeFJCTb9Nkv6LiAG/Cmzv2mKLojg+BnmPrMnMQC35w+ro6pXjSbYdae9EW5yVXxJ
         oL/blcCTqjGOY/76uK7qnJ4B1KHU0LsKgoieCX508hqfNizo6HjNXE8BG1KPcXe/Omhn
         8eu6f5SduiGXrY9ou+iS+tsM5qYHCNUOum3Ser0yKyqY2qy8ithy26YiTUv/yJWZ9oJr
         90Ig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784583516; x=1785188316; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G0Z4YNxUpwtELkyBiYzWJVTMYEO70JO0synktnauLes=;
        b=hMlHIEx80SrMgs5ZDAyPzfM9coglcVZfc0jiY4SCLKdF/x4CSuZOpM3OI9bf3mOs9/
         QUBhP0bbbd0CD+vJG1zarnQJElVLlnpgk5RepFoW6W+cGvWtMIYuQZwdHxzxlIPNfvCA
         Yp2yEtUsm+IXj059a7t/3LVa71PvupG6R4/FXLXsHDhJs7/Hox2+/0JnQz4dypIUlLI8
         ADCphPejORZxoPOoRXFZ84nQ6s0t9Xe3XZjDLl00FRPllA+g6Fep90928XZeOxFZPJ5n
         4fStSIff8mV1WxzHQNajxwfHT34lhugjYsgzuD8S8xn1WTLn4/gRonlRz5dtiHW1OicI
         29Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784583516; x=1785188316;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0Z4YNxUpwtELkyBiYzWJVTMYEO70JO0synktnauLes=;
        b=oMYs7ygrT9j8+UUTjb4vjpBrb++t4W+KnK7NdTELavhxdV1rwRN2DSYD9u8ycF3gWy
         EqlrqGx8pKhRoMzcWkF7D/1CWzDn7bvHgQrRLHWR9mgqPbgxzMHM0104FDgHDMTUFt1L
         re+pGMBFUocLBdiVB2sUqqC98Wj/7jmoH60gYglKBi7tKTPu9MkMzYg6HPuSa2NtOKjn
         Dd7OPVDXtA6Ul14zRIqLTAheiDkp0A+fa94KkpbEbAJ3mJk/P1egQEP7KW0Z2d/Xomxt
         PjjC0mBKOGHHslIXEpPQ1GM878CaZbN0NyAB9FUJ4A9iNJq68QYmff8639e4pWTQAWol
         PHag==
X-Forwarded-Encrypted: i=1; AHgh+Rp+oEKhcWuhsVu3x/Q7FP+qYQ3+m/ElS19dSqtLQ3S0ryXoSCkXASkb7AXvRrYELTIFDWIY3I4WqTBE7aeJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yys3DwddMn35nsgAq3Sy/67HmpJB5mYYcIJkf9UwZpBui6bWbBj
	vswaIJnQP6nuJkGT/fuYn3ZlawhrVatugYS2wNaY5YjOTku6HJ8tamfLP6GfrkPgnkXS/5RjutF
	l/VGIeT3ZbRuONo8/lQhSLXBdPpdLhyY=
X-Gm-Gg: AR+sD108B5tiM8OF0t80HvesNc4sBfnTIBvsS13Vqa2BhtRwFc4lHMkOr6cLNar3NZr
	9eMeM6XpdzYhSvhBgEKJlV63PVtIixgf8CflaXKCLxZJjk5l2JaWFbe/0qpRFjGNx1eQiSUubVe
	vdQU38xQ7gXHcCrzSSDdBs8pDOezJSYcNNtO4c5h82tJOaZoNrJ2DIZveZ0H38o/s4gAs+nY2vB
	LuJBRrOlS5ZiWYeOINiX21Z7wlfA4rPpghhiX7f+Ts2sxys0aJnPgsgzihYtePKlkuAyP4SOJI5
	SwT61y/ZaIuFvkJQMCQFVFt1A7U=
X-Received: by 2002:a17:903:3810:b0:2c9:fc0d:165b with SMTP id
 d9443c01a7336-2cf1f544ef8mr207354535ad.23.1784583515606; Mon, 20 Jul 2026
 14:38:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <MOR1FYP_9xkM8GfpziB5D4Q3H5XLHq6MowZkeFMhI_49wkvgOVxXHbtJYMHHnToR_DOz2HU3N102cMMRPNWfLA==@protonmail.internalid>
 <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
 <035192d8-9d6e-4e04-ad1b-56f52c11933d@kernel.org> <b6rUao5eYcEHwZ_P1JyyUjJUtwY-yJnWVfxHUa9sHdWOmlMoXSLxjMoscSmOu0V5VkwrO7q4TnNzRvoFP5RpLg==@protonmail.internalid>
 <CADRRrN23tWrKKnPDdsO_61QQd790z2W+2ejZ-s1iZkJh+=oHhw@mail.gmail.com>
 <f4041aba-ccbb-4126-a65b-a385e882949e@kernel.org> <36vhfeWCV4PqtDGfEur9lR9MVGp1d_CMjIb_Wr9zTFbeNM9QPzCJsn1TzyTYnZfbku-iwBZo-eDdLasYJ5hE5Q==@protonmail.internalid>
 <CADRRrN35SjSPqYH+kUowf3RCcKgnGqVQAKTd73vqMLgdz1q5AQ@mail.gmail.com> <1bc74fac-859b-46fd-91ef-16c40c8f9a7f@kernel.org>
In-Reply-To: <1bc74fac-859b-46fd-91ef-16c40c8f9a7f@kernel.org>
From: Kirill Ermolitskiy <00vopoj00@gmail.com>
Date: Tue, 21 Jul 2026 01:38:23 +0400
X-Gm-Features: AUfX_mx_wRNH2ibGcAD7sJGHKBLY4pIoaz1csY7UjvUp6vhaxej-2T2NoHA6dUA
Message-ID: <CADRRrN36-iWMdOBxDHKjV_SCs2U7jH6YwJO4ycTe5_w-2QTTyw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard=2Dresets_SoC_on_?=
	=?UTF-8?Q?SM7325_=28sc7280=2Dcompatible=29_=E2=80=94_extensive_analysis=2C_need_wrap?=
	=?UTF-8?Q?per=2FGDSC_insight?=
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Primary testing was on venus (CONFIG_VIDEO_QCOM_VENUS, confirmed via the
device's driver symlink). I did test iris once earlier =E2=80=94 identical
silent reset at first encode frame =E2=80=94 but that predates the IOVA
reservations and the video_cc_xo_clk port, so I'm rebuilding with
CONFIG_VIDEO_QCOM_IRIS right now to re-verify iris with all current
fixes in place. Will report back shortly.

---
Del'aRun

=D0=B2=D1=82, 21 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 01:31, Bry=
an O'Donoghue <bod@kernel.org>:
>
> On 20/07/2026 21:41, Kirill Ermolitskiy wrote:
> > Adapted Daniel's patch to kodiak: added the reserved-memory node with
> > iommu-addresses covering [0, 0x25800000) for &venus plus a second
> > memory-region entry. Since downstream yupik's non-secure pool is exactl=
y
> > 0x25800000-0xe0000000 and venus runs with a 32-bit DMA mask (top-down
> > allocations land above 0xe0000000), I additionally reserved
> > [0xe0000000, 4GiB). Both reservations confirmed via the iommu group's
> > reserved_regions:
> >
> > 0x0000000000000000 0x00000000257fffff reserved
> > 0x00000000e0000000 0x00000000ffffffff reserved
> >
> > Encoder still hard-resets identically at the first FTB. So on kodiak it
> > doesn't look like an IOVA-window/SID issue =E2=80=94 or at least not on=
ly that.
> >
> > One more finding from diffing against downstream: mainline's
> > sm7280_reg_preset zeroes the whole of 0xb0088 (AON region), while
> > downstream applies it with mask 0x11, preserving the remaining bits. On
> > this device the register holds 0x3 at core boot, so mainline does
> > clobber a live bit. Preserving it (read-modify-write with downstream's
> > mask) doesn't change the encoder outcome, but it's probably worth fixin=
g
> > regardless =E2=80=94 same for video_cc_xo_clk, which downstream marks
> > CLK_IS_CRITICAL and mainline videocc-sc7280 doesn't register at all
> > (ported it, confirmed running at 19.2 MHz; no behavioral change either)=
.
> >
> > That exhausts what I can usefully test blind: DT constants (fw region,
> > SMMU SID, CP ranges, clocks, GDSC offsets =E2=80=94 all match downstrea=
m), power
> > sequencing (hwmode / forced SW / GDSC always-on / legacy MMCC handshake=
 /
> > GDSC wait values), XO clock, max CX votes via required-opps, IOVA
> > windows, two firmware stacks (old and coherent OS2.0.8.0 TZ+vpu pair),
> > and both venus and iris =E2=80=94 every variant that actually executes =
the
> > encode engine resets the SoC at the first frame, silently, below the
> > kernel (PSHOLD warm reset). Full two-sided HFI traces of healthy decode
> > and dying encode sessions available; happy to test patches on hardware.
>
> Eh it's not clear to me if you are running the venus or iris driver.
> Both are supported - can you flip the switch in your defconfig ?
>
> Perhaps you are testing both already - if not please try the other driver=
.
>
> ---
> bod
