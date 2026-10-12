Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD522445AEA
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791792933; cv=pass; b=KZ8+8ZhCYVic0trS42mOQEQgWtjspzabgjUnJ4DC/2dG5gbSLAHU9BnBAR2iv23FHodvb0j4NNb+PkqSoWpTi3EXc5Dt2GKBLNHRfaYbqdr++c6h8lD3igBrSHwx03a2cPtzI3pMxFmAjq7jieJQ6rpMUT+lRo6S64Yz5IctpLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791792933; c=relaxed/simple;
	bh=MUFarNR2Fx2TCdhUD921tcirVOL9kOniGuETZ9wE1PQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cXap+vthNolu8wly1NtuxbYXg4N+qqAcSOVbA1yLBBLwl2XfuR/PWKrOIP8Jn9fs5p9nmgDEAp2qCAoJy5CQVeMyQEsm5WBjdl3aIdZJTqGNDtQKvjQ0yBnuHO7YHgnFUF0/R1gDXHxGnc4v8UXJlClQKs/h2UkQl/7HJDEZ2eU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cxKX8NZa; arc=pass smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cxKX8NZa"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-8ac525c1f05so11437097b3.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:15:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791792931; cv=none;
        d=google.com; s=arc-20260327;
        b=sHcarWBggIcMQauYXEiPr3R9EkJWwDPUiWi7kv3vJBppA8X26vWhe0KicOsm4qcc/E
         LgFqnBzXRFnPkgUoeDdA70WW/l6p/+xr8MDecEcefMB2fF7Sm9r+vhOpLD/Y90TfFNcy
         6UCQW3HNUbENJX0vPruUYkg18OiKw2f+urHbttaITEQL3heIvFFHuS7b3T7ICH3XOukT
         5qAl+Hdd5VwNA5Bs+G4y+xBPIURQlicxp7PrlmBGv4Ehvdfq7R2mwjmFQTvGJwBLFmgU
         0QSAC2WmLW/GVyA86fT0+hswzv68hljscErI+04bDUGbD4DTWQ6/gRfim3HJMR9NxUav
         LPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bXVhxdOwpdFW6/wCk6tmolLyGnY6hoIpXQSLDWS1A5A=;
        fh=VxBU0YF1lGFwqu8DfkdxUg6+xw/84PnmRhNuV2ydu7k=;
        b=Qxo7lLuGuw4d4iZ25ppb0v7enm6kQa+UYrSli0A8rHw9hmZ3iPSw/T/6FGbt7VN81P
         LD54cQ7xz+e10ZiKkhgTzSwojmtSi3R5Eq6MsHczdY9/oGyXQQihswkBMx7mfwrmVWJK
         H6vbM+VQ8zgxDlrob8nlMigI3aS8nCNVeaso86LV9dj/ExGlmbGx0wrFFMj10B+gI/a8
         quoS5hq4ujQoydVpcgtbKt+RDzjLs0p8Ggw3EgHFqTI48yRV7ndWVJJlsQWJQpB5Wu65
         1YxLmvX0oTcmMUXm3/0EgCMqj21GgjS1Dy0BPwbs5BR5ej3/xq175wJo6iG6rzPOeAiT
         VkFw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791792931; x=1792397731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bXVhxdOwpdFW6/wCk6tmolLyGnY6hoIpXQSLDWS1A5A=;
        b=cxKX8NZapzay2qVeuTMFwLZfQ/w+zKHy8VdioSIEXMp3SgOBrOOjJ9/HvHc3pJretk
         qd3ozyh1/xnLebbNiakQNPT+cCHixDuhIhA54q+4jzuUC4xs9IDUFfJ7RwPB5uos0dYa
         erJTq0WNzwAX/jNLKMY/5xorpQXLSowOhs2PFznnWn4lBee1U506fwjnMKvK9FxuhSBW
         j76ALT1uzMNhT5YYKFVL+5qwtgbqwEyM1Y/kNOh+KPVX1MfPIlz1DNie3vC2r+9/llVt
         iYdCWaBvymW4HqcAxAMWpA2Q0HfRmzSPxSCL8w7uQy9YDGMYH7Tb3vDBqrE6api08ICc
         ti8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791792931; x=1792397731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXVhxdOwpdFW6/wCk6tmolLyGnY6hoIpXQSLDWS1A5A=;
        b=rLnxHAO/mlZaDeTDOGIpWbHpoY1VIHkmyPoyHV0nIIlTlEWAFX1Q4mSdHUWRAklKMn
         W5mxkUv4MWHeaQAsPplRCp5W2dp1tfqc5NAAyWfNZc7B9QifueeNan0lmIGduMsqrcGk
         44onGP7cN/EimM7dLYnGCnOeRsCCWAF5UTfZUaQtzudJlVAy4iteGNMe/lwq8rEGclmW
         VjdaHDkB40FrcBp70pkMKrryVsc8RqyQac4b8MVEOU1Gc7fh2SNk3ZSoIvkLL6T7zryL
         +7nLf+MDxbzbGl8rMKkMaEesqWs6CkrjzVTyWnxgVT2pjeUTRVaxWY5XHhSwhGPVwe6e
         nlEg==
X-Forwarded-Encrypted: i=1; AKwUvBxhisVgWXNICCFs47VogLmLmOyUvix3BEXbOAvx0rUhcadtmnKwCVWMUZ4PAW1GYbNFnBiJM4FtqR2mFDT0@vger.kernel.org
X-Gm-Message-State: AFq9FYJYwdKQR1FTDXhOLWDOH9lE3YT1cqpvYCgrMK2iKHMYJAE/rBO/
	64JXxx9oOvgSoCdIttJLgTTFGVHBT63S06mBh97mghPkYE852/ZBlSEz6LcgA9w6LF+1ouuufe4
	n3o8YIlaWjH19nHD8jHjFUSB4FYd6tUg=
X-Gm-Gg: AYBFou3ewAyHxSDRcktd+giIm5DwenzeNB6lyNWukpHEodS9NpaJbyOMd64tpHe+Ksc
	BsnxvzhiAHUcJIIdVWpCBDcOy4GWdNQW3bhW4bY5dxPW5eHU8ndSuxsGjGUdMVyfseEMkHN35rU
	UKypebb69zYVzXU5nWoJNCUHQkDg8MUNpQxG3y0MTcMJIYNq5dDoxsRAig5BjELQas/B9GqXv6F
	OKjfZjhed79wQEBj2Wl5gX5gOk5fbpOnO7d1MRn3968kKwPeLcTUjNNdf/RAYuoceD4UJDTrf4i
	BL0X1H1PeSdH4oDigX8xzTMGG+AMsYFW7IrFsr7pqPruyX176LW3Q8/wXrzAuA==
X-Received: by 2002:a05:690c:e1c1:20b0:8b0:a6be:60db with SMTP id
 00721157ae682-8b0a6be8770mr4474387b3.65.1791792930760; Mon, 12 Oct 2026
 01:15:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261006085425.40450-1-kaipeng94@gmail.com> <20261008103414.6170-1-liujianfeng1994@gmail.com>
In-Reply-To: <20261008103414.6170-1-liujianfeng1994@gmail.com>
From: Kaipeng Zeng <kaipeng94@gmail.com>
Date: Mon, 12 Oct 2026 16:15:19 +0800
X-Gm-Features: AclHuK9NX6Ud26EiLKELSwOXP_kj4inp8xiI9rSGYGFem1Rk7KZjITqsEVDSoAA
Message-ID: <CAHk8ZdsVK-n6u+KO5W0=7c_4_eQ2Aj0aqTg_tqU_x_58t0L6dQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/2] Add device tree for Acer Swift Go Pro AI (SFA14-11)
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jianfeng,
Thanks for your review!

On Thu, Oct 8, 2026 at 6:34=E2=80=AFPM Jianfeng Liu <liujianfeng1994@gmail.=
com> wrote:
>
> Hi Kaipeng,
>
> A few things I noticed in your v4:
>
> The vdda-phy/vdda-pll supplies appear to be swapped on all four QMP PHYs
> (usb_1_ss0_qmpphy, usb_1_ss2_qmpphy, usb_mp_qmpphy0/1). The QMP PHY expec=
ts
> vdda-phy at ~0.88 V and vdda-pll at 1.2 V. The same issue was fixed
> recently on the Purwa boards in commit 7c1d0ef2969e1 ("arm64: dts: qcom:
> purwa: Fix swapped USB QMP PHY vdda-phy/vdda-pll supplies"), which
> includes the reference mapping used by the other X1E boards.
>
> The &tcsr QREF supplies are missing. The qcom,x1e80100-tcsr binding now
> requires the vdda-qref*/vdda-refgen* supplies, so DTBS_CHECK reports 18
> warnings without them. All other Hamoa boards have been updated with this
> block.
>

These are some updates in x1-crd.dtsi.
Since my first submission was earlier, and my work is based on
x1-crd.dtsi, I didn't
rebase to newest Linux-next this version, because I am not sure if
it's necessary.
Thank you for pointing out the differences.
I would rebase to the newest Linux-next in the future version.

>
> The three PTN3222 eUSB2 repeaters on i2c5 (addresses 0x47/0x4b/0x4f) are
> not described. They are present on this board and feed usb_2 (webcam) and
> the usb_mp ports.
>

I actually missed describing these repeaters.
When I started porting x1-crd.dtsi to SFA14-11, I encountered hangs or
a black screen
during boot when some no-exist I2C device nodes were enabled, I remove them=
 as
possible.
In my testing, USB devices work well, without issue in this case.
Maybe they are initialized by UEFI, and kept during Linux kernel boot?
So, I missed describing these i2c devices.

After you point out, I found these i2c devices can be detected by i2cdetect=
.
I would describe in the next version.

BTW, could you let me know, how can you know which usb devices use
which repeater?
It would be very appreciated!

> The displayport-2 DAI link is missing, so audio over the HDMI bridge
> doesn't work. My version also sets sound-name-prefix on mdss_dp0/mdss_dp2=
,
> which is needed for the DP audio links.
>

Currently, the audio of my dts can only work partially.
I suspect there is something wrong in my ALSA configuration, and
adding sound-name-prefix
can improve nothing in my case.
I still need time to try to solve this problem (also dmic23 / "VA
DMIC2/3" routing problem
you point out).
I notice you list that your audio totally works, if your
alsa-ucm-config is your customized or
just using X1E80100-CRD.conf?

> Two nodes look like they may have been carried over from x1-crd.dtsi
> without being verified on this laptop =E2=80=94 could you double-check th=
em?
>
>   - key-vol-up: as far as I can tell this laptop has no physical volume
>     key (volume is an Fn combo on the keyboard).
>

I think this should be removed. I would remove it in the next version.

>
> On the naming: upstream asked me to change my compatible to
> "acer,swift-sfa14-11" (my v1 used "acer,sfa14-11", following the DMI
> product name). Acer's support site calls the machine "Swift SFA14-11", an=
d
> I couldn't find "Swift Go Pro AI" as an official product line anywhere.
> Since our series use different compatible strings, file names and models,
> we'll need to align on one either way =E2=80=94 I'm happy to go with what=
ever
> the maintainers prefer.

Acer had a page about "Acer Swift Go Pro AI" but it was deleted,
fortunately here is
a snapshot:
https://web.archive.org/web/20260314171131/https://www.acer.com.cn/product_=
list.html?parentid=3D323
It's sold in China using the name "Acer =E9=9D=9E=E5=87=A1 Go Pro AI".
There is some discussion in the thread of my previous version:
https://lore.kernel.org/linux-devicetree/20260729064538.19564-3-kaipeng94@g=
mail.com/
I have no idea if your "swift SFA14-11" is the same as my "Acer swift
Go Pro AI".

> One question: you enable usb_1_ss1 with its QMP PHY in USB3-only mode
> (DP input port deleted). Could you share what it is wired to on this
> machine? The only USB-C port is on usb_1_ss0 and the HDMI bridge is fed
> from usb_1_ss2_qmpphy, so I wasn't sure what ss1 connects to.
>

It may be an unused USB root hub device, can be found via lsusb or sysfs.
I didn't verify if there is any device wired to it before.
I verified after you point out this, and I couldn't find any device is
wired to it.
All USB devices I tested still worked when I disabled it.
If so, I think it could be removed.
But, I can't confirm if this USB device would be used by SoC internal.

> By the way, your EL2-mode testing is a valuable data point =E2=80=94 I ha=
ven't
> tested that configuration. On my side the following is verified working
> on hardware: eDP display with PWM backlight, I2C keyboard and touchpad,
> USB-A ports, USB-C with DP alt mode (video + audio), HDMI video + audio,
> speakers and headphone jack, WiFi and Bluetooth (UART), webcam, NVMe,
> GPU and battery charging.
>

Seems that your Makefile have the el2 as well, but you didn't test it
under EL2-mode?
Please check my changelog, it includes my testing status and
parameters of kernel.
I am not sure if you would run into the same problem, hope it can help you.

> Happy to integrate any findings from your testing into my series, or to
> review and help with yours if you prefer to carry it forward =E2=80=94 wh=
ichever
> way the maintainers would like to handle it.
>

You have pointed out a lot details, which is very helpful for my work.
Thanks very much!
I will fix the above issue and continue to send the next version.
Your review would be very appreciated!
