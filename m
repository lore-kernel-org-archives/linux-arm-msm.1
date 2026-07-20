Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C1E3B3BEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 20:41:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784580116; cv=pass; b=d+KVdpHsUciyRs+O4fbgzbtkRiRkQEZ03srtVSPSWhGhVevRhDKTBEU+NksNkvLCJpF2zBzU/kBCLrzW9ngKShiA/u/lHKExEtU/bgD4rRXuBm0IBm2QsxxVHJP538eU/wZr4TdciW0NRV4kqv5SKmjQupnoSVpsoBZpKe8g4pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784580116; c=relaxed/simple;
	bh=SMdWvAIY5b+UAm2sT+Y/61KdkkW+GdkfJ5SQPf7o0FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FwelNW180Q9nq9ik4WfdQl9raY9wSoObBpzZ6Ly2WKKXVnFJ7W1yLxFeQOYpokXA07DVHGfbK0i0U/Zkcnptxsxl6pdWU93akzJNeUn1SqzaKuKSjJFLRI4aL91+TF0elyLxjx2fcEGdQ4LEsm13livaJWvutxl2WGqD+hKs2lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lSEjNO63; arc=pass smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lSEjNO63"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-c9e607d81fcso4435105a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 13:41:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784580115; cv=none;
        d=google.com; s=arc-20260327;
        b=HZJgGPi1VHkdDj35Rq2tbffIg+B3QDQgtpZEXTeKmSFnwgooSic4tf6hCQvO77Qomp
         SiZaFdWbI87rmUu+NScBDAhtTmSD5GJ+9badZoxa/RGT7w4XyGO3Km8NH6F1MA4/Kpf5
         pv4mXeo2+qsR4zAQsyGwbQQch4pq3wPxOaI89KD7iLvD1Ak7ih/ZetqNRg+Bo1upBeMi
         dZDRv29rUSnHS6iefVhT17iy0/uC4dMFKKbtWCve5ACkEUN0UQ/xWuKKmHhNrtR9b8zG
         wEJxUjz/E6hfBnZGgQ10fion17trvoqOTZ6UMozzh2BsUBmfnYz7lM0m8dE/ONqREjgy
         As+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SMdWvAIY5b+UAm2sT+Y/61KdkkW+GdkfJ5SQPf7o0FU=;
        fh=KiA3OS32vl7nDVHB8yg2aacssDUjKvz0cXYSByZuiVg=;
        b=LUyHjDVxbhYHuDfkqfWVJT3EavySuTBq5fGMGN6uYQSoX7aWrJy0E5fXL+/qutfysE
         o3pYnhETU8yw6R78jyh0P4w/gPtafYWXnj+f2DlPAdRTTdR/5FwxJT15d0wCz3s/zt+L
         V4dOFqNkGFQzRI6k9lWtR6KYQlF3NbS+QMzz0IFvUN1dZ71HAhQzmhSVKb3ufdZjZXnb
         KTLn0mmfeloixaN+3xfu3BJ8Bp7mFpDUVINS4PYBI3C4Hj4gtA8OkRuhBLFB00Jqo50O
         80HIBQ3CIM8OctMbqzLsKT0PVSzl1G22tKVDrW1Y0Nh87UeWhJfhPrPG3C4mjQBwrV2V
         cvVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784580115; x=1785184915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SMdWvAIY5b+UAm2sT+Y/61KdkkW+GdkfJ5SQPf7o0FU=;
        b=lSEjNO63L2X6TjzOCiRbGfxL3K6KfDyc2EE7qRAYZuajv+fLAP7cq1Cd4+zKF/i3Wf
         Zso3qcaIPWJvY3SizeHCOF9JTvGbemghIq2J5Yb9/fW6nL1h57edZEWqYb/rLU4KFNE5
         bOdn0/AB0sd0+yiXjNhnhvF5fCfdqV7lxEL3zBuXNcrVGt/G4bSOeaIYzueQKCv8pxrx
         BYXClijem7mWKOpbOBi7rml5Ce+tgqKuS0AqCR96JSasYt9MBMWrq8kimkHqwPnAWvNn
         F5SRAl+ab8FOIk6vhxHhnfB3HkmCSge7Xyf3ihY/5E+ZbexbdtHcJBFjMJL9kA/Jq2Sk
         JKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784580115; x=1785184915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SMdWvAIY5b+UAm2sT+Y/61KdkkW+GdkfJ5SQPf7o0FU=;
        b=Ebp2Dv6DuNSl3Tnv/3YICYVTRJdo+LTgX7ZnCpdIlw59V9qtYnzcCbCOIPeFWDA8ir
         le5pVH4w2mTKMBojSWuKwIj5X+EUTrpNiUjTVSZuI5yGLtirjtblvuW647vY8n2YXOeZ
         WnD/H2cwTyuZbQTJVGtHjMoptuFnyZ1GHpKKtF6pho/VEIPt1nCfBYCajbfG/vPN7eM1
         QbY8HkeVm0kTWRIptX2s0AT224soGXhTpGWAjs314Tte+nBQMFCp5rISEEtOH+wBN1fS
         CYeGSW7dqhmr0UGYsjZcaeD37Y99SjUXgcWWDgTdq2zj7w0wKj7FlHJTMHpTVoTGXcNo
         sTEA==
X-Forwarded-Encrypted: i=1; AHgh+RrN+cZbN9mncA2SQxnfQ3TFn9gHboVb6EXOk3SwhKc64+G3mwKKq42imFet0z49z4i/YAR19tLvkgObZN6r@vger.kernel.org
X-Gm-Message-State: AOJu0YzNypI2wFkYJOStetCDLPi091DCT0ivkiVJ8EhRi8IPr9mGaY0b
	7afsLnDBp+rAdga2ULk7ZxF59hZgpbH6TcNxWpeew1j5/ZMygCbtJwEzXzzxS3tcpFWb934+Aot
	jydMCagPGgBloJb/vLluSOT9u7aZ2PxawhjZg0CU=
X-Gm-Gg: AfdE7cksl9VUqafaj+qFOA7psRCe2R0RiXObZndRs55foEAGoIoCVHz8ZvRV6u6esUg
	XG8t0CvmVnhra8oR19SpfwmLZbof9tKko5NBSiyo7WTjEt2eV4+toIiFEQ6VPZ3gHrft0Kw7LCD
	5dA+YTjCdmOn1pshb7U8agT0rJK1Xa7GBTJ1m/MMwxEUQZ8c9x1QIxlHhwuY8cnbIo3bDyzil0h
	kmf5pslBqiBPQx6N2LafvA+cRuRxv0kzWo//X5TlYgEXrT+NP9D3bcFbdeZBnKkza2biyDPlyOs
	bv7XA1bu4qjTst2D
X-Received: by 2002:a05:6a20:6a0d:b0:3b3:216b:274c with SMTP id
 adf61e73a8af0-3c3ad80caf6mr17165033637.22.1784580114843; Mon, 20 Jul 2026
 13:41:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <MOR1FYP_9xkM8GfpziB5D4Q3H5XLHq6MowZkeFMhI_49wkvgOVxXHbtJYMHHnToR_DOz2HU3N102cMMRPNWfLA==@protonmail.internalid>
 <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
 <035192d8-9d6e-4e04-ad1b-56f52c11933d@kernel.org> <b6rUao5eYcEHwZ_P1JyyUjJUtwY-yJnWVfxHUa9sHdWOmlMoXSLxjMoscSmOu0V5VkwrO7q4TnNzRvoFP5RpLg==@protonmail.internalid>
 <CADRRrN23tWrKKnPDdsO_61QQd790z2W+2ejZ-s1iZkJh+=oHhw@mail.gmail.com> <f4041aba-ccbb-4126-a65b-a385e882949e@kernel.org>
In-Reply-To: <f4041aba-ccbb-4126-a65b-a385e882949e@kernel.org>
From: Kirill Ermolitskiy <00vopoj00@gmail.com>
Date: Tue, 21 Jul 2026 00:41:42 +0400
X-Gm-Features: AUfX_mx5lPKa61U6-HcY7rnXtgvzwEkZB9uaSW90Z70tl_sMkgcHRVCzlniMyV8
Message-ID: <CADRRrN35SjSPqYH+kUowf3RCcKgnGqVQAKTd73vqMLgdz1q5AQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard=2Dresets_SoC_on_?=
	=?UTF-8?Q?SM7325_=28sc7280=2Dcompatible=29_=E2=80=94_extensive_analysis=2C_need_wrap?=
	=?UTF-8?Q?per=2FGDSC_insight?=
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Adapted Daniel's patch to kodiak: added the reserved-memory node with
iommu-addresses covering [0, 0x25800000) for &venus plus a second
memory-region entry. Since downstream yupik's non-secure pool is exactly
0x25800000-0xe0000000 and venus runs with a 32-bit DMA mask (top-down
allocations land above 0xe0000000), I additionally reserved
[0xe0000000, 4GiB). Both reservations confirmed via the iommu group's
reserved_regions:

0x0000000000000000 0x00000000257fffff reserved
0x00000000e0000000 0x00000000ffffffff reserved

Encoder still hard-resets identically at the first FTB. So on kodiak it
doesn't look like an IOVA-window/SID issue =E2=80=94 or at least not only t=
hat.

One more finding from diffing against downstream: mainline's
sm7280_reg_preset zeroes the whole of 0xb0088 (AON region), while
downstream applies it with mask 0x11, preserving the remaining bits. On
this device the register holds 0x3 at core boot, so mainline does
clobber a live bit. Preserving it (read-modify-write with downstream's
mask) doesn't change the encoder outcome, but it's probably worth fixing
regardless =E2=80=94 same for video_cc_xo_clk, which downstream marks
CLK_IS_CRITICAL and mainline videocc-sc7280 doesn't register at all
(ported it, confirmed running at 19.2 MHz; no behavioral change either).

That exhausts what I can usefully test blind: DT constants (fw region,
SMMU SID, CP ranges, clocks, GDSC offsets =E2=80=94 all match downstream), =
power
sequencing (hwmode / forced SW / GDSC always-on / legacy MMCC handshake /
GDSC wait values), XO clock, max CX votes via required-opps, IOVA
windows, two firmware stacks (old and coherent OS2.0.8.0 TZ+vpu pair),
and both venus and iris =E2=80=94 every variant that actually executes the
encode engine resets the SoC at the first frame, silently, below the
kernel (PSHOLD warm reset). Full two-sided HFI traces of healthy decode
and dying encode sessions available; happy to test patches on hardware.

=D0=BF=D0=BD, 20 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 23:36, Bry=
an O'Donoghue <bod@kernel.org>:
>
> On 20/07/2026 17:28, Kirill Ermolitskiy wrote:
> > Tested forcing all venus_opp_table entries to rpmhpd_opp_turbo_l1
> > (verified via /sys/firmware/devicetree) =E2=80=94 encoder still hard-re=
sets
> > identically at first frame. So if it's an operating-point failure,
> > it's not the CX vote via required-opps; possibly a different rail
> > (MX/MMCX?) or something the OPP framework doesn't reach on kodiak.
> >
> > ---
> > Del'aRun
>
> In which case let's try constraining the pixel and non-pixel IOVAs.
>
> Give this a go
>
> https://patch.msgid.link/20260601041336.9497-2-daniel@quora.org
>
> * Adapted to the appropriate dtsi obvs.
>
> ---
> bod
