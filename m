Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E86414DFE
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550182; cv=pass; b=D4ZJA2OoSnae0r5pCZ22u9rGMuS0Q7NFZFHHbW+nyjB9+XdGGBpHLnz6GnsEiFqm73XOmskOHlPAuWgpvbCA1q7Mf4rmHNyDebjSJSkeh7AF3wf594cOuThh4xpLE5B0HrTlCjZK871uCeOQ2eZK500NqCQYeVHvdWnXwOUq9M8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550182; c=relaxed/simple;
	bh=0mitG+8FThZx81ptAQLduASuicVYCnxMrJeUe80oBYE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GdsZToNWV4V23Mwthr4TQG6nBTWCdGkwQdmP+4ECMiHM3E1JmW1PsL3ega4f/SwAvy41/lK4VZOSSH5G9UxUrGqB7zvjC0j11piw0CefN1xRzjMkJq8IqGy4JJeSrFo9msjtEG3wsY0IasNmFhn+oV2WhPhIXnY4Kj7w69vGslg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqywrI6J; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqywrI6J"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cf41bab353so32987535ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 05:23:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784550181; cv=none;
        d=google.com; s=arc-20260327;
        b=gY/vDtPcS5O4d6+trG78rzru900jzeuvygDRkrTJV3Vk8vF4gvTZaPGX3dAkw+YGBA
         GFM+M3TJbO9JOYw/NFBqxIjXDG8aZjNllyqD9kP8Q4tpUF0dBRtK67GbFSHMHqPxSZ6F
         Z4wCHq09j5vdLZ+F1XR/4z3yPReUWU3ry7rBx+8YZHNvYehkuK1ZEmDyAUNp7YKI64Lp
         W+W3LX6WltrERdXWwFdj4P/dW7o1U0LGH9VWYo53W5dGjJYgVf99qk4P6M18bzevDgVi
         regO950+UANqA31rhnQpweXp00bByihSCNGL/RXF9JjWrlb0HhFpMlK7lOKE3LB5S5N9
         JkHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=EElgMrmvO1hr91/z88S9QUFIgNeRTIFWBxAntyFjN/o=;
        fh=mfqXqOlXFufuCgMCephXZ7p+v0fVFxDnJlTPn91lYkE=;
        b=M7BNSr+L8md7J28TYz1ZVmSbBQhGzDEGSxG1G1eP8HMwF37jdBdoLHsz2wma69YfN1
         NvEBFpbkHXY/Ji/6oGNZ1LmZm0IttVhBovolQaf5wyW9oe/kfh/M3LJeEBqX51d2AYrD
         RxvDoGdWu+5LPukggKN7egXBBxOVkLlYF4I5royUWsKrXQ6sGSpgrJSBjaNHH+PhOuKq
         eVlj35+nzc/IaHLBoXt2DY5OnBjMW/SZk7RVH8jNqNy2ek+CJMdbPii1iiJNTsVPWySw
         bI9JKXZleqN5/7SuMvvX/V89xmzcofZivwDEhAV8c6haa7xbG4gxtzVCOzWLkN6YSLOx
         H/Pg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784550181; x=1785154981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EElgMrmvO1hr91/z88S9QUFIgNeRTIFWBxAntyFjN/o=;
        b=XqywrI6JjYaGJJm/X2wbxd1M3unL6rxNfSeGuIdupR4+SDf+KigujgoR6j2dPl3B5Z
         dx4/S1Vis53oOEOeAObBE9L+RsaRGPXUi10+kynrqwBujCg3Vl9aw4i33IePRU+5Wlln
         b09o8qohuIi7vp+yq6UBKKttyz1QTJfyixux5CZlgU0ERuEt2LL4Rmi55ztBZFdOQ63U
         skucKOcQem6w8rjzAuzG7aOPxB3KKFFLisqAi8j2YiEWrLfZ/1GveM32tp0pAdcgMgQ4
         Kjmj/6/Asy7uh7JSJ60mQp/Db8qfA58hl78t/eZQ3pHzmKA7CDwv4a9Sspuv4sYJI+tN
         gP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550181; x=1785154981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EElgMrmvO1hr91/z88S9QUFIgNeRTIFWBxAntyFjN/o=;
        b=ieXXo+lRnSn/mEf3AMr9Bmz2KUR9IpigQ8kALjiqNHi2oyz7vBajqULDC3cnQuUA1j
         qTjJjvEW2WpXlRFzFaI8QcWsev77tVntBE+MC8oCJPS6WhH6BHbX9SAzutE8VNdO/EVa
         XhJLz94XQTt2ou7HdpVlehWStjKCq7+qn+L/kvSEGL5h5PALe2Bgex7JeaeUpBa82chn
         e/MZqiV+TLSSxq7y1DKbfZKQ4NcZVLcBEv/bR7uSIuzsTPA4lhzqj3VqlcRX3ScboNo8
         7a+bpUBBPK38YLPv7gr+ZyjfNgczNpMinAKLkT+LenONPoJyEHrvVIlgpdfieQf65Zpi
         1suw==
X-Forwarded-Encrypted: i=1; AHgh+RqWfHYj35EqU4h2B0NEkMpCogw7dNJ3MXQlvr3I1EHS5FUUw1iemZ/AziyumuuNEqsj3iN1Hh8VWDFP7gUJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxHU4OGgy6tUTSaTvYlu6nzKR4ZwFBwYrlBdBpUk23f7QIMUSYf
	+2IcJxl2hJTkjG+knDd7Hzb2Q+aTQyKqGQbKFlnyFLg8lUhqauGWtQilP4et9N2wKC/+ypi8f2l
	h9SjL2tXbEvznxe/G0v41N5GsYxgdzpg=
X-Gm-Gg: AR+sD13EflCAQiDvGe4Bk6/iuNBbLFn8SSRDSDindcZFdXy5Ij65AZYpWU8W7kv3au4
	GjBQoQWoDASwrpzxedho4EnYKSzw1jb4KJlYrBoG5T3UHFpbRCHch9S5SonMraLzaQaMwMyptI8
	Wuc4R0qF+eWpYGofoX4qzKr9QKVK95AQB0jxg/IOI4LsVqvNdeV4Uxd+dTqCvFa2wKZiaU/+qid
	9AwoH0QLXKqGMZD+YDtHWxaIqYtcXekGTJ/B1JduKXICXRS8wNeIsKCETqw
X-Received: by 2002:a17:902:fdae:b0:2ca:ecf6:910e with SMTP id
 d9443c01a7336-2cf3466a93fmr155729425ad.0.1784550180710; Mon, 20 Jul 2026
 05:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kirill Ermolitskiy <00vopoj00@gmail.com>
Date: Mon, 20 Jul 2026 16:22:48 +0400
X-Gm-Features: AUfX_mwaO4JEgK4MvbPx7H0QEU-64ZjDqzMHa6VLQXSHts_xmQIs7yaGScXS29M
Message-ID: <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
Subject: =?UTF-8?Q?venus=3A_encoder_job_execution_hard=2Dresets_SoC_on_SM73?=
	=?UTF-8?Q?25_=28sc7280=2Dcompatible=29_=E2=80=94_extensive_analysis=2C_need_wrapper=2F?=
	=?UTF-8?Q?GDSC_insight?=
To: linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com, 
	bod@kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On a mainline port of the Xiaomi 11 Lite 5G NE (sm7325-xiaomi-lisa,
SM7325 "kodiak", sc7280-compatible venus, kernel 7.1.2, postmarketOS),
the Venus decoder works fine (H264/VP9/HEVC/MPEG2 via v4l2 m2m), but
executing any encoder job instantly hard-resets the SoC below the
kernel. I've spent considerable effort narrowing this down and I
believe I've hit the limit of what can be done without wrapper/GDSC
documentation.

Reproducer (100%):

  ffmpeg -f lavfi -i testsrc2=3Dsize=3D176x144:rate=3D10 -vf format=3Dnv12 =
\
    -c:v h264_v4l2m2m -b:v 100k -t 5 /tmp/e.mp4

With venus dyndbg + custom HFI tracing on UART, the full session
negotiates cleanly: SYS_INIT, SESSION_INIT (acked), all
SET_PROPERTY/SET_BUFFERS (accepted), LOAD_RESOURCES (acked), START
(acked), 4x ETB. The SoC dies the instant the first FTB is issued and
the engine starts executing =E2=80=94 no SYS_ERROR, no EBD/FBD, no SMMU fau=
lt,
nothing from the kernel. XBL log after reboot shows "PM: Reset by
PSHOLD / Warm Reset", i.e. a TZ/secure-level reset. HEVC dies
identically (engine-level, not codec-specific).

What I've verified/excluded (all cross-checked against the downstream
yupik tree):
- memory-region (0x8b200000/0x500000), SMMU SID (0x2180/0x20), CP
ranges (cp 0x0+0x25800000, nonpixel 0x1000000+0x24800000), clock set,
GDSC offsets (0x3004/0x2004): all match downstream.
- Firmware: vendor vpu20_1v.mbn, Xiaomi-signed (Xiaomi Root CA /
Attestation CA in the cert chain), reproduced with two firmware stacks
(old and HyperOS OS2.0.8.0 coherent TZ+vpu pair). Venus hw version
6.40.a.
- Reproduced identically with the iris driver (sc7280 platform data) =E2=80=
=94
two independent implementations, same silent reset.
- Encoder scratch buffer sizes x4: no change. Runtime PM pinned: no change.

The interesting part is the power matrix around vcodec_control_v4():

1. Stock (dev_pm_genpd_set_hwmode, HW_CTRL_TRIGGER on mvs0_gdsc):
set_hwmode returns 0, engine powers up on first frame -> instant
PSHOLD reset.
2. Forced legacy path: WRAPPER_VCODEC0_MMCC_POWER_STATUS BIT(1) never
asserts (readl_poll_timeout -110, register reads 0x0). No crash =E2=80=94 b=
ut
ignoring the timeout shows the engine never leaves clamps: session
runs to FTB, zero EBD/FBD, fw eventually non-idle ("wait for cpu and
video core idle fail").
3. GDSC forced SW-mode via genpd, or ALWAYS_ON: same as (2) =E2=80=94 rail =
up,
engine clamped, no execution, no crash.
4. video_cc_xo_clk (0x7018 branch + 0x7000 RCG): missing entirely from
mainline videocc-sc7280.c, downstream marks it CLK_IS_CRITICAL. Ported
it (confirmed on at 19.2 MHz in clk_summary): no behavioral change in
any mode.
5. Dropping en_rest_wait_val/en_few_wait_val/clk_dis_wait_val from
mvs0_gdsc (keeping XBL defaults): still resets, but behavior became
nondeterministic across runs (one run showed a msg-queue response
after FTB before dying) =E2=80=94 smells like power-ramp timing.

So: the encoder engine only actually executes when the MVS0 GDSC is
under HW control, and that execution/power-up hard-resets the SoC;
every software-controlled arrangement leaves the engine clamped (MMCC
handshake never completes). Downstream (msm-vidc + gdsc-regulator with
qcom,support-hw-trigger) uses hw-trigger on the same silicon and
encodes fine under Android, so the hardware is capable =E2=80=94 something =
in
the mainline hw-trigger power-up sequencing differs fatally on kodiak.

Questions for people with wrapper/GDSC documentation:
- What does the hw-triggered MVS0 power-up require on kodiak/sc7280
beyond what mainline gdsc.c + venus do today (AON config? NoC LPI
handshake? different GDSCR sequencing)?
- Is the sm7280_reg_preset ({0xb0088, 0}) sufficient for this part, or
does downstream program additional AON/wrapper registers before
encode?

I can test patches quickly (UART attached, one-command reproducer,
full HFI traces of both healthy decode and dying encode sessions
available on request).

Thanks,
Del'aRun
