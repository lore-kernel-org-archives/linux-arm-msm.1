Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B3AC48595F
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 04:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791866119; cv=pass; b=avk3N9lx73mp5SIAg5jJ/Nb5yD3Vz4CgLq7wHPLL8sqwAwYAB/frH84uHQAyM12ENWLa2qGkiKmHu/zDxdnGz0ZCrKaVTx2GA54qOBe2kXaoyAujlIu6hOv3oxNhcjvB0POqcEEH2bO0HvcU0pTdynFCQ40npBxRypPGgncY8AA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791866119; c=relaxed/simple;
	bh=P2PtUOAip6+K2abEYo1JBTvXHd0ZUqv20i/TTdLIC3g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UmDrHGJYggyaO7ljuVPYJwYtFjKbQ0/fm1QBxBlMs5zPg1WngQz7i3vXUdFM1a71EZuGL3GSOE8CvmKUfFp+hrXYjuhiED680tr0HVAKu7EAH4hopNpK1bsR81iBZ9W7jO5RgBA/l8V2VETXKKjPf320afc1Z5XDM28n7asi570=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gQXYJiCm; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gQXYJiCm"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b1ec41d8e9so285828a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 21:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791866115; cv=none;
        d=google.com; s=arc-20260327;
        b=jw1M94A/dT+6HKLfWWWTLMm/GfTR295/OdX8Kva/a+8YxT830i8+nrVfM8GA0rbWP+
         eH75xQPHo0dTmRBlulwOsm4j6N8S+MqKh1dg3m0dNiPWOH7sLf8tejsaljHsL+P0zhnR
         lZvzNAwFosznqicXd+gzPgtksNI9HMGO+E6jYfNhGlXd8AyX4Skudz2DD+N1dAtkaRit
         c6nTX0x/iebv9wPhSXsC0lUK31Mq7vTl9G3HjFcmHDsx+TO3im1IPXEAfXWF2veqUtQl
         CXrCtb+ZqYZh9WF/iDedAlnSQ4jAnlz7520HNp92IJNUUvKKz+0DkZ0G2RDtqKZrOqf4
         Ltxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AQdu3Cn6BCMgBdzZkTGzVwhW9c7f9RIM4c7739SyCYs=;
        fh=qDUCYx4hCZvY9ir3TTzy1s8nDP4n5IWZNvQv6Vp7KOE=;
        b=Irgfg6f6TYXjZWMZ0hjcMGC56HLOpvAJqbDhWrphkfwhke86XZAu0Xyht01VA3+M2l
         qBy6LRshDyOZxq2ubxGaT4ZdGBRcd89ayCgkdAcIdd2i3AvBJsOYjqjBId8sJazVaoGb
         mZBhWXBI+fIOM/7+XCa//X/XCOtG9rrO8YdfXKmXvSozGGJ1QB3qzxtPqoqCIbv6QE62
         x4jW9cKbzuXcA8NFv2oAUUjvUV9kxWVPiZakN7EKo75H6KWuY5nKaGMrN/DwrydhKwQ9
         p/MYdgnrUEQAcdqmJk30HKu0y21nd5LSUO71eAok1E1bShx12y9K552rdrxQ2pQJxNDC
         sfQg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791866115; x=1792470915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AQdu3Cn6BCMgBdzZkTGzVwhW9c7f9RIM4c7739SyCYs=;
        b=gQXYJiCmZxBu9/daTYqOU6CGH4btZp/26LEZeqzg/KhfjShOvNPUEDR5SFoVr25CVH
         T/XcB2n0JWC03tppgbBq112yL6mPOnq7PLelJBY1WO1BvEDAWc6hGIcL0/VxMc0mB4Xx
         m3Zqlq78b2ExV7dpgPJcwxV1QsgXJY/bXvPk/nGKeWmTQi7DF4hPSPq62JLvhVVyRp3j
         ll0de/8yipTa0lt0wM/VrxhYRr60MvJ3NV9MT4PuNibrRtXk5J8j09mbUQeMKFTZtd73
         q5Vz4ZpRMPdFYXf0cQ+2Y8U/dVVdr20v3+Zwn7jro5AE5rsAo5GDbuojhnr26pFE2tok
         veuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791866115; x=1792470915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AQdu3Cn6BCMgBdzZkTGzVwhW9c7f9RIM4c7739SyCYs=;
        b=wsjDoChZgmMls190RHtBHAc7NBUj/KFPybh/NIEtQr3c9YwYg93vGI4wrhsxVbkeSb
         s63qJcTJFVbSUr4ucZonJXVnNwkmtjecn0Pk22vhapiYx8aIiBEfvhlQzyJyG4qUeNdt
         N2Y3GENMFZk+VWg3b3JHdu4E/3is1A3E42C7QG9m5rWzV44vtBvXNvyfE6AK69K+Gl6o
         a/4O5jVDb1r97B3kcNatpAxzAzGahAeOWuW9wHLspv0SdF5qvYR/cTtmwKG29556WC3I
         FVgpfBVpGXim7fTLynD2qlMg5LZX2Awi/7/pVhRyIruZN30vwZ/0C0zZ79uQmEIxltJj
         KehA==
X-Gm-Message-State: AFq9FYIzoeP/JOU7Khv93NmIroEY9rBlw0ZXABTmbVcNortkQ6wB+REr
	Fn6afl4yh0Jkg1TyWiQR+v36rSYYfxEQ5jmDNAx+CSSP81TZ9fBxpmuDOH9gcf9ItQwQlsav3BP
	3jX1tjOkxlnT62mktJp1Z8id7yEhQw8dn9cEUTq4=
X-Gm-Gg: AYBFou3tF6YNXgJlDaZ6h9YGjy+nK+orcTQjbDe61q5Uzi+iieqowjGPalgB6gUR9RL
	fo2qOt0MSjEF5uGJlAykTBwsFoyHBba0QJon+U6L+X/iJmp9hyhRHGL8nIeLKGupDLu1BFA83Mb
	/Rch3zTnRCP5kyyHb3vQ2GYdnJW2l6eLAcRPmQfA0eZDq72DSBIUcv47xe5H04eSOdaRMsGsjS9
	jNtsirn/KAZ+AmaaJmHcieOhkTqMjrE6OQm76gYKA5s8CxtoDxc/vtHmzbDBuaXQjINPN8sjRzF
	mRKeHKd7Zc32DJqTbyDxriiJuFzwyNZrjcGppsWhsksFxNmppttTUrQM+SrJdGo3aKV3xd+IMta
	wuxp+Gk65bhIl
X-Received: by 2002:a05:6402:11ca:b0:6aa:f85a:9e06 with SMTP id
 4fb4d7f45d1cf-6b17c25d5b8mr9436534a12.22.1791866114990; Mon, 12 Oct 2026
 21:35:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <179184923104.248043.14168731037113716140@mail.ustc.edu.cn>
In-Reply-To: <179184923104.248043.14168731037113716140@mail.ustc.edu.cn>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Tue, 13 Oct 2026 12:34:58 +0800
X-Gm-Features: AclHuK9M-oODPL_1kUCPzBH3DIoST7Vl7UTNmToAHGmTMf_5hcJgrvJZBXIrUxM
Message-ID: <CAH2e8h6_pACX_j8YBDhhSZzbfs45waF-Y6KJo82_2c6BT0suEg@mail.gmail.com>
Subject: Re: [REPORT] SM8750 bonded dual-DSI + NT36536: first DCS command-DMA
 timeout on cold boot (DMA engine stays latched; DSI-side reset does not clear it)
To: Qianhui Xu <xiaqinghuan@mail.ustc.edu.cn>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, dmitry.baryshkov@oss.qualcomm.com, 
	neil.armstrong@linaro.org, abelvesa@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 7:53=E2=80=AFAM Qianhui Xu <xiaqinghuan@mail.ustc.e=
du.cn> wrote:
>
> Hi,
>
> We are bringing up a Lenovo Legion Y700 (2025) tablet, TB322FC / Qualcomm
> SM8750P, with a Novatek NT36536 panel (1904x3040, DSC, video mode) driven=
 by
> bonded dual DSI (ae94000.dsi master, ae96000.dsi peer).  Our tree is
> GEEKiDOS/linux, a 7.2-based tree that carries the bonded command path
> (dsi_mgr_bonded_cmd_xfer() plus the "bonded command DMA failed" / "peer c=
ommand
> DMA timeout" messages).  We could not find that path in the vanilla 7.2 s=
ources
> we compared against, so question 1 is partly whether it is upstream-suppo=
rted
> at all.
>

In a word, the panel driver is supported, the DPU may not be.

I think most drivers for dual dsi dual dsc panels in the upstream are
alright, but they may still not work due to the DPU. Once I upstreamed
partial patches, but it is not enough, we need more, like we need to
hack the dsi clk source select for the 10-bit CPHY plane, etc.
Integrating such kind of patch to upstream is time-consuming and
troublesome for me. Even if it works in Ver, nobody would ensure that
it still works in Ver + 0.1, as there would be many features and
regressions for the DPU when promotion.

I cannot help with this for now, sorry about that, I have not focused
on this for a while due to things irl,  You can find some threads in
LKML about 10bpc 10bpp support on DPU discussions that I was involved
in, it may give you some insight. You can also find some records about
bringup, for instance, please check the image in this thread if you
are confused about if it is __really__ supported(i.e.
https://postimg.cc/xJr11DK5, and another snapshot for GPU bringup
https://postimg.cc/0zz30h8P).

Best wishes,
Pengyu

> SYMPTOM
>
> On a *cold* boot (power off -> bootloader -> fastboot boot <image>) the v=
ery
> first DCS command of the panel init intermittently times out and the pane=
l is
> never enabled.  Warm reboots do not reproduce this signature (a warm rebo=
ot
> reproducibly ends up in mode (b) below); all three modes are cold-boot on=
ly.
> Signature, identical in all failing samples:
>
>   [    9.032148] msm_dsi ae94000.dsi: command DMA timeout: status=3D0x220=
0200
>   [    9.037910] msm_dsi ae96000.dsi: peer command DMA timeout: status=3D=
0x2200200
>   [    9.037912] msm_dsi ae94000.dsi: bonded command DMA failed: master=
=3D-110 peer=3D-110
>   [    9.037914] panel-novatek-nt36536 ae94000.dsi.0: sending dcs data ff=
 20 failed: -110
>   [    9.096078] panel-novatek-nt36536 ae94000.dsi.0: Failed to initializ=
e panel: -5
>   [    9.102187] [drm:dpu_encoder_phys_vid_prepare_for_kickoff:576] [dpu =
error]enc35 intf1 ctl 1 reset failure: -22
>   [   10.176852] msm_dpu ae01000.display-controller: [drm] vblank wait ti=
med out on crtc 0
>
> On a good boot the same step prints "panel prepared: scheduling firmware
> upload".  "DSI PLL(0) lock failed" x4 and device-link warnings also appea=
r on
> good boots (we treat them as benign noise).
>
> THREE FAILURE MODES, ALL COLD-BOOT ONLY
>
> (a) panel-init timeout with the system up: card0 exists, DSI-1 connected,=
 SSH
>     reachable, only backlight - the signature above.  Most common.
> (b) no card0 at all (DSI host probe fails earlier).
> (c) *new* 2026-10-13: bootloader ACKs the image, but there is no SSH and =
no
>     fastboot at all for 30+ minutes, backlight only.  In this mode the ma=
chine
>     never reaches userspace, so even an on-device watchdog cannot recover=
 it.
>
> REGISTER-LEVEL EVIDENCE (bad boot, instrumented)
>
> We patched the DSI path to dump state around the failure and to attempt
> recovery.  Bad boot, all timestamps in one boot:
>
>   first DCS times out (status=3D0x2200200)
>   before-reset : CTRL=3D0x175  STATUS0=3D0x20003  CLK_STATUS=3D0x3743  CM=
D_DMA_CTRL=3D0xd4000000  INTR_CTRL=3D0x2200200
>   after our reset (see below): CTRL=3D0x0 CLK_CTRL=3D0x0 CLK_STATUS=3D0x1=
403
>   after link re-power-on    : CTRL=3D0x171  STATUS0=3D0x20003  CLK_STATUS=
=3D0x1743  CMD_DMA_CTRL=3D0x14000000
>   retry of the first DCS    : failed: -110 (identical registers, three at=
tempts in a row)
>
> What we did in that window: cleared the driver-side failure latch, powere=
d the
> link down and up again (clock rate set, clock enable, PHY reset/re-lock, =
ctrl
> enable), and additionally forced the terminal state of the stock
> ctrl_reset() sequence (engines off, CLK_CTRL =3D 0x00) on both controller=
s before
> re-enabling.  The last step *did* take effect - CLK_STATUS dropped from 0=
x3743
> to 0x1403, i.e. the DYN_PCLK / DYN_CMD_PCLK / CMD_PCLK bits were cleared =
while
> CLK_CTRL was 0 - but as soon as the link is powered on again CLK_STATUS r=
eturns
> to 0x1743 and STATUS0 stays 0x20003 (ENGINE|DMA busy).
>
> So: the failure is not a state we can clear from inside the DSI controlle=
r.  It
> looks like the dynamic pixel-clock request is re-asserted during link pow=
er-on
> and the command engine stays busy; PLL_UNLOCKED is not set (the PLL is lo=
cked),
> the DSI interrupt counters do not advance while the engine is busy, and t=
he
> registers before the first command are byte-identical to those of a good =
boot.
>
> WHAT WE RULED OUT (controlled, same images)
>
> * Kernel build identity: 2-digit vs 3-digit KBUILD_BUILD_VERSION, same so=
urce
>   rebuilt, empty-commit / one-line-pr_info arms, 20+ cold boots.  We firs=
t
>   measured "0 bad / 20+" for 3-digit builds; that window simply contained=
 no
>   failure, and the same class of images later failed 4/7.  Pairing #60 ag=
ainst
>   a 3-digit arm inside one window showed no measurable identity effect.
> * Failures cluster in time: adjacent cold boots fail, and a clean window =
can
>   give 10 good boots in a row.  Rate drifts with session/environment, not=
 with
>   the image.
> * Upstream 2028280686f4 ("round the byte clock rate after reparenting to =
the
>   PHY PLL"): ported to this tree with upstream semantics (rounding inside
>   dsi_link_clk_set_rate_6g(), byte-intf rate from byte_intf_clk_div_2).  =
First
>   cold boot still fails with the identical signature.
> * Driver-side recovery: clearing the failure latch and resetting DSI ctrl=
+PHY
>   (both links) + retrying, as described above.
> * Forcing the stock ctrl_reset() terminal state (CLK_CTRL =3D 0x00) befor=
e
>   re-enabling - the DYN bits come back on power-on (see above).
> * Using the standard broadcast command path instead of the tree's custom =
bonded
>   sequence: same hang, different error path.
> * Enabling-time dynamic force-on (vendor-style CLK_CTRL force-on around D=
SI_EN,
>   both transient and held for the whole panel-init window): still fails, =
and the
>   DYN bits are latched in the forcing case too.
> * ramdisk/initramfs variants, DTB variants, strict 30 s power-off POR: no=
 effect.
> * Runtime recovery by rebinding panel / msm_dsi: this tears DRM down (car=
d0
>   disappears, fb switches to dummy, GPU hangcheck) instead of recovering.
>
> QUESTIONS
>
> 1. Is there a documented ordering requirement for the bonded command path
>    (DSI0 master / DSI1 peer) for the *first* DCS after PHY enable / PLL l=
ock?
>    Our engine latches with STATUS0 =3D 0x2200200 and TRIG_DMA never self-=
clears.
> 2. Given that a DSI-side reset cannot clear it, is the dynamic pixel-cloc=
k
>    request supposed to be dropped by the client (dispcc / INTF) side, and=
 is
>    there a known issue with that handshake on SM8750?  Should the DSI dri=
ver
>    wait for the DYN domain to settle before the first command?
> 3. Should this timeout be recoverable in the driver (reset host/PHY and
>    re-issue) instead of failing panel init permanently?  Is there an upst=
ream
>    precedent we should follow?
> 4. Any known SM8750 / DSC video-mode erratum for the first DCS after a co=
ld
>    boot?  We looked at the PLL re-lock series (6cd33b6f4155 and 202828068=
6f4);
>    the symptom does not match.
> 5. Would you like the full dmesg, DSI/PHY register dumps, CLK_STATUS, RPM=
h
>    votes, and our repro scripts, from both a good and a bad boot?  We hav=
e both
>    and can attach them.
>
> Thanks,
> Xu Qianhui <xiaqinghuan@mail.ustc.edu.cn>
>
> The bring-up tree is GEEKiDOS/linux plus local patches; we are happy to p=
ublish
> the repro scripts (cold-boot runner, three-state probe) and the failing-b=
oot
> captures if that helps.  Happy to test any patch you suggest on the devic=
e.
>
