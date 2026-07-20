Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A803542B332
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 16:28:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784564914; cv=pass; b=pqNVitC3c74C3PfvE4rWXGUApPeL20Z5pucnkxilDNmrJNZZFnnPxw6u2wKDL4a6xglYjm1qeYLnJl1hoyWICyxVvZrpIcenchuNnz9eixPt2glwOiVWqfmbq8KlZczuyKRpvOAQW+j/wwLNgK/t6+taoHkR+jovXF4xgEFHXss=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784564914; c=relaxed/simple;
	bh=KdTwOWWy9TSsoa/1hWBTuG6P7wetaLAwWLd+KQjy6Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hYBG3orjlv6iQAhoXe7VdcQJ/IXPAkF6VuC4zo0MB+mJ0Do/n8BCWzKphV8DGuRdPJuyr6DRbtMzW8oG+qqyUKsxfNOuUGCBI5VWXdKgjcCm8lUyhC4lHLV6QijZvCwqNz+p8sy0QrGpfpomBzBMKTUaz/1B7GHTxFfzhyLW+dQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jmQaytt0; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jmQaytt0"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so13755695ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784564909; cv=none;
        d=google.com; s=arc-20260327;
        b=VAmlcdyE6CBwZQ7ICCo84T2q9Y8mOxxNa8n8yTyJ9ZHYHHCb0HqDOvCseL+ot+4Tte
         yXDo24MhfhbQn2+L6SN2ixnG4KzLX/LbO0XApFSoD7jFg/EWBw1vmbgQB8qK7x9CbjQt
         rzI17nEGFTq9xJrs2GjQ4m3jb4In5i9AOtvn/RZ34taRQEXlcXLnVKQYB6YWyJS9gp1g
         GT2E0wqwBATZfOcRIaVilaZ9MWK2X7hloocy0TLd/E/81lcDXcQt/0COchUoR+YAsRQh
         rQJxOP+Kbe7NvJKWPB9K+1pwUmRl5ahASIQFB/dkzUvv5PfB5kB5ytoG3mzqB1q48vex
         3Wtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JRhukSrGJrbAPEsG0Rri4544jNHjlg2ee8Dj2K7DCeI=;
        fh=D1zkh+N/tcX6Fhkf77Wwe8oteimvcID+wwEb8OyMofo=;
        b=cv0v42EusxcCPB+HdyJFwXSwH2tWFz/+L6q+pjI4sOWem0ng8py/cO3NDoOxSBTqIu
         LnO+DB9X4caTIVbY+CKoe/MzhbgOJZJmUqUfe2AzZ5vlJ2GXUCs+p1uhaHaWgMvxPpvF
         ECOkp10dGlSYu6vVuwgLiXegoryBDGvcIYIIAuINSFl2Ru4ffT123wZ3f9ZjVUBo7c7B
         xYMhCHvIbpshqKkIU1wOv4AWvF1EvvFcA8xa0xMW0CC4nR3wHRzHij5qaYyggImVleWw
         MfncnBaMWs+AHljpCbBOjxdOlMxZMKMLC6ol1nplgg8+C2p6bih3W86S8jamLuLHuHRw
         7Mhw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784564909; x=1785169709; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JRhukSrGJrbAPEsG0Rri4544jNHjlg2ee8Dj2K7DCeI=;
        b=jmQaytt0C++d/otajCjrQa8iQ1ZKg3bLf3ucQZl1hsohT6XETURQ5YsBjRM3fEMWd3
         ioHHoUdk6Ln0XcoURaLstwVK1eeyfkaAd/F5MGqzboopshSpQrfR00OQ6TFUkG6xdn1h
         OG8vLkgGWlYMrENr3yoDlRxVqzsMTPgrtO5lUNKaYwx8cvIVmLJa1qV06Ou5ZJ9/nh0Z
         hd3LkVSSRUQdScm9Le1qmZu7Ar/tm8c/ox5sFGXqpyGTY3QSrQ57fAWumINA9yTHnv3c
         OxqlgxnGzC4Av1LmMS8F/r+ZfprX3S/c5ORUMh5yDVitkr4vckVFbXzTOoMOVSnDwcbA
         Vc5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784564909; x=1785169709;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JRhukSrGJrbAPEsG0Rri4544jNHjlg2ee8Dj2K7DCeI=;
        b=Ux4JAWLXihl3Asgdto13330HydWK+9HkuRMOjDV+dNVnleO567N0rUNcFORKcCb2X3
         NAR6uwhG4S8HiOqKdlLpWrsfuob4xnbQN99zoc7nbYbiljipFx8yxSQsP/RNNfVySNGO
         UmntVkRD9qT3qPCz9Ldx7ZnrDe2XVqifDzzBWyheSPjclwDzp5m4i9F+TBbbfpcEaION
         /GEhe4rMTwcg61KgpO5l0J2OGKjjABtsbF2JDJj8hihB1d1+7Ay/TWdskt/IC1MIJ+bi
         4w0DTPXf+q7GYnL8NziLkN2LbQrW/YfLOVBcB3PBM1nR4CMlinGoyTjNdV4DrAhGLuqn
         fddw==
X-Forwarded-Encrypted: i=1; AHgh+Ronr+iJikNPTIFA7gAiAV1AK7qAi4WUV4+nQnDWVgOGUinTYfkTHmmKET/2xdGaUp2idug11ygKe5HeYBTn@vger.kernel.org
X-Gm-Message-State: AOJu0YwKeMJxOV/8n2iczmuPSNTGFL2uittY+MO549lCrS7YeGzHxgdN
	84w3D7Sy9GyeGuwFm0hIBxe4WmfZooms9LVhqiu2ZMFCL+5DN7HxSvMWIPBivCKP71JfgbXdjf0
	CVXlKbQfG+8ro2Fgy8+D5HLfzooVtvo0=
X-Gm-Gg: AfdE7cmKvEXh8hh4/ZU7JJg5SJl7Q8a/nMSBk/enO/bY4bpX54kaYjBHoHqw3eWu7AB
	/QBp2rEQP5E3JF9sbPVEYlPBg9z4FkNXsIcate8Z41L6KZZVUjisw4r36/bnG6VDt8g7Gkf2dnH
	gx4llBjoEkQsOEqAPVmllPruHrQEG6gWF7yZkE8APbhOsTIQjJzfdoDIop6dxaBr6fUoltnpm/T
	bKNzFeND35Oo/wXZ73BOdbeB9hrDumuS8VkHVY5z+fgCYRl8iDlk9jfvBNX
X-Received: by 2002:a05:6300:95:b0:3b3:223f:d3fc with SMTP id
 adf61e73a8af0-3c3ad8ecce8mr16579936637.45.1784564908832; Mon, 20 Jul 2026
 09:28:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <MOR1FYP_9xkM8GfpziB5D4Q3H5XLHq6MowZkeFMhI_49wkvgOVxXHbtJYMHHnToR_DOz2HU3N102cMMRPNWfLA==@protonmail.internalid>
 <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com> <035192d8-9d6e-4e04-ad1b-56f52c11933d@kernel.org>
In-Reply-To: <035192d8-9d6e-4e04-ad1b-56f52c11933d@kernel.org>
From: Kirill Ermolitskiy <00vopoj00@gmail.com>
Date: Mon, 20 Jul 2026 20:28:15 +0400
X-Gm-Features: AUfX_mzIAtM0Xb1QczcNe3td1PXmkmV57LQh8hAMlU-m_CPJ8qsir35lv1bPXf4
Message-ID: <CADRRrN23tWrKKnPDdsO_61QQd790z2W+2ejZ-s1iZkJh+=oHhw@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard=2Dresets_SoC_on_?=
	=?UTF-8?Q?SM7325_=28sc7280=2Dcompatible=29_=E2=80=94_extensive_analysis=2C_need_wrap?=
	=?UTF-8?Q?per=2FGDSC_insight?=
To: "Bryan O'Donoghue" <bod@kernel.org>
Cc: linux-media@vger.kernel.org, vikash.garodia@oss.qualcomm.com, 
	dikshita.agarwal@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Tested forcing all venus_opp_table entries to rpmhpd_opp_turbo_l1
(verified via /sys/firmware/devicetree) =E2=80=94 encoder still hard-resets
identically at first frame. So if it's an operating-point failure,
it's not the CX vote via required-opps; possibly a different rail
(MX/MMCX?) or something the OPP framework doesn't reach on kodiak.

---
Del'aRun


=D0=BF=D0=BD, 20 =D0=B8=D1=8E=D0=BB. 2026=E2=80=AF=D0=B3. =D0=B2 16:55, Bry=
an O'Donoghue <bod@kernel.org>:
>
> On 20/07/2026 13:22, Kirill Ermolitskiy wrote:
> > Hi,
> >
> > On a mainline port of the Xiaomi 11 Lite 5G NE (sm7325-xiaomi-lisa,
> > SM7325 "kodiak", sc7280-compatible venus, kernel 7.1.2, postmarketOS),
> > the Venus decoder works fine (H264/VP9/HEVC/MPEG2 via v4l2 m2m), but
> > executing any encoder job instantly hard-resets the SoC below the
> > kernel. I've spent considerable effort narrowing this down and I
> > believe I've hit the limit of what can be done without wrapper/GDSC
> > documentation.
> >
> > Reproducer (100%):
> >
> >    ffmpeg -f lavfi -i testsrc2=3Dsize=3D176x144:rate=3D10 -vf format=3D=
nv12 \
> >      -c:v h264_v4l2m2m -b:v 100k -t 5 /tmp/e.mp4
> >
> > With venus dyndbg + custom HFI tracing on UART, the full session
> > negotiates cleanly: SYS_INIT, SESSION_INIT (acked), all
> > SET_PROPERTY/SET_BUFFERS (accepted), LOAD_RESOURCES (acked), START
> > (acked), 4x ETB. The SoC dies the instant the first FTB is issued and
> > the engine starts executing =E2=80=94 no SYS_ERROR, no EBD/FBD, no SMMU=
 fault,
> > nothing from the kernel. XBL log after reboot shows "PM: Reset by
> > PSHOLD / Warm Reset", i.e. a TZ/secure-level reset. HEVC dies
> > identically (engine-level, not codec-specific).
> >
> > What I've verified/excluded (all cross-checked against the downstream
> > yupik tree):
> > - memory-region (0x8b200000/0x500000), SMMU SID (0x2180/0x20), CP
> > ranges (cp 0x0+0x25800000, nonpixel 0x1000000+0x24800000), clock set,
> > GDSC offsets (0x3004/0x2004): all match downstream.
> > - Firmware: vendor vpu20_1v.mbn, Xiaomi-signed (Xiaomi Root CA /
> > Attestation CA in the cert chain), reproduced with two firmware stacks
> > (old and HyperOS OS2.0.8.0 coherent TZ+vpu pair). Venus hw version
> > 6.40.a.
> > - Reproduced identically with the iris driver (sc7280 platform data) =
=E2=80=94
> > two independent implementations, same silent reset.
> > - Encoder scratch buffer sizes x4: no change. Runtime PM pinned: no cha=
nge.
> >
> > The interesting part is the power matrix around vcodec_control_v4():
> >
> > 1. Stock (dev_pm_genpd_set_hwmode, HW_CTRL_TRIGGER on mvs0_gdsc):
> > set_hwmode returns 0, engine powers up on first frame -> instant
> > PSHOLD reset.
> > 2. Forced legacy path: WRAPPER_VCODEC0_MMCC_POWER_STATUS BIT(1) never
> > asserts (readl_poll_timeout -110, register reads 0x0). No crash =E2=80=
=94 but
> > ignoring the timeout shows the engine never leaves clamps: session
> > runs to FTB, zero EBD/FBD, fw eventually non-idle ("wait for cpu and
> > video core idle fail").
> > 3. GDSC forced SW-mode via genpd, or ALWAYS_ON: same as (2) =E2=80=94 r=
ail up,
> > engine clamped, no execution, no crash.
> > 4. video_cc_xo_clk (0x7018 branch + 0x7000 RCG): missing entirely from
> > mainline videocc-sc7280.c, downstream marks it CLK_IS_CRITICAL. Ported
> > it (confirmed on at 19.2 MHz in clk_summary): no behavioral change in
> > any mode.
> > 5. Dropping en_rest_wait_val/en_few_wait_val/clk_dis_wait_val from
> > mvs0_gdsc (keeping XBL defaults): still resets, but behavior became
> > nondeterministic across runs (one run showed a msg-queue response
> > after FTB before dying) =E2=80=94 smells like power-ramp timing.
> >
> > So: the encoder engine only actually executes when the MVS0 GDSC is
> > under HW control, and that execution/power-up hard-resets the SoC;
> > every software-controlled arrangement leaves the engine clamped (MMCC
> > handshake never completes). Downstream (msm-vidc + gdsc-regulator with
> > qcom,support-hw-trigger) uses hw-trigger on the same silicon and
> > encodes fine under Android, so the hardware is capable =E2=80=94 someth=
ing in
> > the mainline hw-trigger power-up sequencing differs fatally on kodiak.
> >
> > Questions for people with wrapper/GDSC documentation:
> > - What does the hw-triggered MVS0 power-up require on kodiak/sc7280
> > beyond what mainline gdsc.c + venus do today (AON config? NoC LPI
> > handshake? different GDSCR sequencing)?
> > - Is the sm7280_reg_preset ({0xb0088, 0}) sufficient for this part, or
> > does downstream program additional AON/wrapper registers before
> > encode?
> >
> > I can test patches quickly (UART attached, one-command reproducer,
> > full HFI traces of both healthy decode and dying encode sessions
> > available on request).
> >
> > Thanks,
> > Del'aRun
>
> Quite likely to be operating point failure i.e. not ramping voltage to
> match clock.
>
> Anyway we're doing a new kernel release so I'll try to replicate on 8250
> which is ~ the same silicon.
>
> ---
> bod
