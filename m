Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792947425;
	b=30NQGsoodX7/1nADrAHMwYh+rGc9wEiUI4HA7vIkySAfailiZzY6Caw3m8r5Q+WiWMyD
	 e8KrEWsuPvro7SX1cxUu0ANE0bbLZbu8VwqxvsmpKuJEnCghq0+fC1ZZXXg6y/kA/KNtc
	 NdSsykuAWCDzcKUjHQF2J5Qeb/oP4muIrfh3DSCyESdYLGhQjKeSGvCFq218wjPDEnLIn
	 Dwh5EKcLymftrHwnKuhQtFj1s4x3pzDB+R6AEIug2xpgADOh2O1Uyql21LMRBo0rUkcFT
	 R8duYxhw8grWDCTk3AeKaF+mpdfMicDJnQBg7ktsFLN8Nj97tfvQlxsVAd1WbPLAY0A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792947425;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=IyRu6JMjat1Pu0azstQ7ekUKDPeGwTyG9FIod2bYWMI=;
	b=NDNvTUBxcOnkaBUpb2iFo739wOp7vC5VoLTzfQl3S8mVzzV8PGDn0giF3U5uIzgjCNnf
	 6OWWxTUVkagry1EZ8urNG5L4QVF9l8xrJJ8YsixSJbewOt1GAFISGsd1oYzz6K57ivfMc
	 CXB4MEBIIJuGGt7pEnVaQjR+moCZJbm5bK3I5D7Ojb1b3NPBeqPw2+EG6HBpe/SEkgztB
	 1DcRnIPcL1Yo6OF10fpYKa6LgeUSdNP8E+/QzrlJZ5CikAbo/UJfL9LI1Pnd3GzSa5l42
	 ZB471giHd4bnRN3SmWJ6HDeV3RHQa6A/dAlWbS7I/a2QzSuL1+AGtncObff5hYvsNWw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="jlt3d6/z";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.48
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5762606A31B
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 16:57:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5762606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jlt3d6/z
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6ae14eecc64so3013990a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 09:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792947423; cv=none;
        d=google.com; s=arc-20260327;
        b=PJoXD6C380j3LicUlFPa20ieqd2PWvFZq+mq3AXfwrnWfJvNHAkepIpAoKavQfDmU1
         9qJNW6fbKqTYkHGhQLi99f87JdjddOc8KTRLi7ZmFN6mgBKpISjriljm589b+LZeD5Ox
         eDD8rK6hqRiSdTdYwpscLSkICqHSq5q/Je4T8U6ZPTVjmlSrvq2XwgipEzKrBuIS6R9I
         elyp1+TaY3KAN5lq9kbu/bgyCIP2hnXCVkoOZvBW4L5xsLf4ooSqRnHjfy2gLIUySzzb
         h4iZzpwAsHzSsTTuz4de6NNc7ne8y1n0PjSC6M9X/E94/Pc2b0unhPkWMRXcHD7jcSzQ
         JTVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IyRu6JMjat1Pu0azstQ7ekUKDPeGwTyG9FIod2bYWMI=;
        fh=1pCul/XFYTXAFjeg2x3JaYpHIUoi6RMvVwgSFjGEZz0=;
        b=Yj1qL3YDhf9RBRKcVbT5Z3hIDXKLI1mL8svpNUBJHw5MOabSDwTAG2HWJDic7kSt89
         cUOWJ+TZqOQnHZBz2kEVYctgDtBtFjTZD8hacfNffOgpbxiA5VT4ZkDH3g2oVyiDn149
         Jm1CKyDTTtGGkM+lehdqUf+TA3UWVfG34QbEV0L8ZvJHSAxMEMCDFIjvhoVLO/f6nqVg
         2Sqv2p7A1Y7OLGm3nVtL99G8CjyuKfzjc7mTIXfT4PeW/eaBluC2JJsZMDEmRwLeNCzD
         uIMzrPr9Grd0RmOrKmkpP5Jaalbss4L2uam45Yy54/Pm1m44EF28lahc4x3pIwX1noUE
         creA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792947423; x=1793552223; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IyRu6JMjat1Pu0azstQ7ekUKDPeGwTyG9FIod2bYWMI=;
        b=jlt3d6/zk0oARLw4/TXZZzL6Ptvm60/7yQG0QxcJlDcLqUxJ4ELLncjtgp+VMnhLJ5
         VOmMkEoeUs4BabEDqRNm83PGPq/v/WpQNISu6yQxiKUA0NvCGpmSlECOPG8Jd32SDwZt
         n3C/LvP2U355dmmdnPnqvyR4DS4zxQ6ptuzndDEmY52C0pS036Su1UB7x5FjTQU9kmLd
         wYfpd2lFT3Uei7N01Sk/8Oki5n55+oaEKBoVZAN3efXNvUxgBmiPAtjkrkkD4v8tHg0r
         eT/szXNcbu7uhmQW6sMpez9h+sWZhSgIUWfVw35KdfD7h1endl7C97TFWHy8uWHO+2tP
         vZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792947423; x=1793552223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IyRu6JMjat1Pu0azstQ7ekUKDPeGwTyG9FIod2bYWMI=;
        b=1OLscIGupF6uPY54lq1QxsuWOBvjZfI8GYU+/89+E9yrE/+GoO0frnyH8J+d5MMmNw
         dobP+OKjqUh5iLacA96iQTePj+tqzf8yiqBEsmnSpkL0uBD/zXnvTRkf8c1svzBnZPwd
         VF0PMsRDcjbdHWKJ3aEFTGTvM8q3ve9KJDzYFB/UwPFHYkoQ8/XG1n0q2aU8sc706HHC
         aY0NT/+qIHKKj8imWXN/PEPEMzIqe+pRuSLS2J+w6yhkJsRPcyKEP+ddlFfQ8Ktnsh38
         /hFvSVph5txALYByrDeNN9larmrWaJXP8gQGqWh1rJJoIdN96X850o70A5XnyI6cFmpL
         7IWw==
X-Gm-Message-State: AFq9FYICHpkQlE4h3MXHWG/gut1B9GGF6VLB+r7unDSnJrpiQQ2rNjKl
	wB3dZU6YnyhBmQnsIfPTvJ/XU8ppRoFNRB1isiE3Ayy6GjvCC9CYhTdRQhc6eYTjdByH+mwyR2z
	3fq1USNfQFyaJJj8OdP5EWzER84Fr9Yg+80mJ
X-Gm-Gg: AYBFou30BlPBwJckpASB0UHWguZmKm1eE4l2lnc8MUI6ecReM96aawoun3oQdJEMOFU
	34luI2bFaUyJ28fmHppUlMmC4TV9YOniqHWO6PNl8jUPksHCMmkfuz1Ylt+SvvmdA0lS0dmr/BT
	cFzuFMgLMS4DbAIdfJxbojGJeuFQHsJ2bNHbyQw7EoVo4W5Zv3TjS4kkeuJdL4S+XpYizfAVi5a
	X64XRyATgcjSr67HjoUr2V6m54rrPGqwoG0jDbVPnzD0iER7AkRwAOCWEn5hQ71RILVjNAtrjm5
	IVh84/RqRlrhX1x/l7YJccm3dCRAU2FlKvDYw7wChNGQCvE8qZOBf/JnqV6Ta45GHPoRzyEFc1p
	jWrcQgplHb+z7MsQx895Zlig0ywOoR9o+6M0K4qhDK9UbkmsyET4hmzNXhWWqAyI7e/4djw==
X-Received: by 2002:a05:6402:4144:b0:6af:a64f:bd44 with SMTP id
 4fb4d7f45d1cf-6b443116103mr5407242a12.45.1792947422788; Sun, 25 Oct 2026
 09:57:02 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <179184923104.248043.14168731037113716140@mail.ustc.edu.cn>
 <CAH2e8h6_pACX_j8YBDhhSZzbfs45waF-Y6KJo82_2c6BT0suEg@mail.gmail.com> <179276337975.97444.18043862696501391672@mail.ustc.edu.cn>
In-Reply-To: <179276337975.97444.18043862696501391672@mail.ustc.edu.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Mon, 26 Oct 2026 00:56:37 +0800
X-Gm-Features: AclHuK9xwUCZ0kvBEwimUn0QZtdVftZr-duC_-VmN0v4C76GGny8RdueHiy-YR4
Message-ID: <CAH2e8h4wFH5Q_biepZzQuerydvmwbUOsEMRRzs4y-c-0WbjYrw@mail.gmail.com>
Subject: Re: [REPORT] SM8750 bonded dual-DSI + NT36536: first DCS command-DMA
 timeout on cold boot
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 23, 2026 at 9:49=E2=80=AFPM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> Hi Pengyu,
>
> Thanks again for the DPU answer - it reordered how we are spending effort=
 here.
> Two things, both about this same board (TB322FC / Y700 Gen4).
>
> 1) DT coordination for sm8750-lenovo-elden.dts
>
> Your v2 adds arch/arm64/boot/dts/qcom/sm8750-lenovo-elden.dts (1170 lines=
).
> Our tree carries the same path and filename, 3178 lines, with your copyri=
ght
> header kept, because we imported your v2 as the base and have been extend=
ing it
> locally for a year of bring-up. We would rather not send a competing file=
.
>
> What we would like to do: after your series lands (or on top of its next
> revision), send the delta as separate follow-ups, split so each piece goe=
s to
> the right maintainer, roughly:
>
>   - display: mdss resets (CORE/CORE_INT2/RSCC), DSI PHY PWRDN_B sequencin=
g,
>     panel supplies (vddio/vsp/vsn) and touch
>   - remoteproc: ADSP/CDSP fastrpc qcom,non-secure-domain (this one remove=
s
>     ~300 lines of boot spam and makes sensors work again)
>   - misc: audio codec / amplifier / haptics / backlight
>
> If you would rather keep the file minimal and have us send each block as =
its own
> series later, that is fine too - just tell us which shape you prefer, and
> whether you want to be Cc'd or would rather review them in the list.
>

You can squash them and send the whole thing your way, since I have no
plans to update it for next months.

> 2) Do you have downstream sources for TB322FC?
>

No public repo, my local tree with all features hasn't updated for
about half a year(i.e. the 6.19.6 tree, that is what you can see in
the picture). Many things need to be organized and updated, I need
time to recall my context. Recently, I have had no time to handle it.
But I think my tree is unnecessary now, nowadays LLMs seem to be
capable of bringing up qom devices.

> Concretely we need two things that only downstream can answer:
>
>   - the battery/QBG side. A maintainer asked us whether the OEM remaps th=
e QBG
>     properties and whether the downstream kernel reports power_now at all=
. The
>     stock build here is user/release-keys, so no adb root and
>     /sys/class/power_supply is denied to the shell domain - we can read
>     dumpsys battery but not the kernel attributes.
>   - display init ordering on cold boot (who programs DSI/PLL first, and w=
hether
>     the bootloader leaves the panel running).
>
> Your v2 cites GUF296/linux for TB321FU for mic/speaker/vibrator. If that =
tree
> covers TB322FC's battery/display paths too, a pointer would save us a lot=
.
>

No, once GUF296 brought up gen3, so I reference this to indicate we
can reuse the peripheral drivers, like haptics, smartpa, etc. However,
I still haven't started dealing with it due to things irl.

> 3) Data in case it helps your display work
>

Actually, you can ignore what I said to Konrad at that time, I figured
out the SMMU issue later(UEFI is still writing to the splash region
after SMMU is broughtup), it works well with splash, or a proper and
whole backlight initialization without splash. So the display worked
10 out of 10 for me at that time.

> Since your reply we ran a controlled A/B (23 real power-off cold boots, s=
ame
> config/DTB/ramdisk/cmdline, only the kernel hunks differ):
>
>   without an MDSS-block reset at bring-up:  5 of 9 boots failed (command =
DMA
>                                             timeout, panel never lit)
>   with it:                                  15 of 15 boots OK, p =3D 0.00=
3
>   split by hunk: block reset 5/5 OK; DSI PHY-only 3/4 still failed
>
> Two corrections we had to make to our own report afterwards, both negativ=
e:
>
>   - the -110 command-DMA timeout is not the invariant. An image that remo=
ves the
>     bonded command path entirely shows zero timeouts, reports "panel prep=
ared",
>     DPU renders, and the panel is still dark.
>   - neither the latch nor modeset re-entry is the lever: bounded retry re=
tries
>     and still fails; restarting the compositor re-runs prepare and still =
fails.
>     The only quantity that tracked the physical state was the DSI interru=
pt
>     count (41 when lit, 0 when dark).
>
> We also moved the resets out of the clock driver after Taniya's review: t=
he
> three BCRs now live in msm_mdss_reset() as a shared bulk reset with a dea=
ssert
> prime, and dispcc-sm8750.c is untouched in our current daily.
>
> Question on your "hack the DSI clk source select for the 10-bit CPHY plan=
e":
> which select do you mean? On our side DSI_7nm_PHY_CMN_CLK_CFG1 already us=
es
> SEL=3D0 / pll_bit for this 30bpp 3-lane C-PHY case, matching downstream, =
and the
> resulting pclk checks out arithmetically (756839941/2 * 16/35 =3D 1729919=
86 Hz,
> which is what disp_cc_mdss_pclk0_clk_src reports). If your hack is somewh=
ere
> else - an INTF/dispcc mux rather than the PHY CMN block - a register name=
 or a
> patch pointer would be enough for us to test it here.
>

0 is the right value. dsiclk_sel was not 0 at that time, as I
mentioned in commit[1], so I hacked it as 0 at that time.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3D0f5c8f03d990f9be9908a08a701c324e113554d2

---
Sorry, I don't answer technical details, since I have almost lost my contex=
t.

Best wishes,
Pengyu

> We can run any patch you want on the hardware and report cold-boot statis=
tics;
> the unit is dedicated to this.
>
> Thanks,
> Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
>
