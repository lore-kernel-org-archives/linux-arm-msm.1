Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793659109;
	b=irFTWfnknxhtm36ujbPy0Y1n7JtG6hvzO+osT0F0zlyqgqEa2nAkVLd6rm4AVKDPrZdT
	 2Zfxd3jCby+oRYsPPYK1PBOGulv+ogN0nCeiDR7kJwMHssHhXRnXPpxS2i/Zgz1Yril6U
	 6LP4NUgwMo89Ca5uJ0D1ZGvxdK0Ij7ai5gECQVy4kC45rJM0gqiVSTnPEfcNN+iZJ/dXi
	 u9CgQZc3pAIsH1M+l6UGMDI8vjy0lpkTskzytqi6uuZhjZWJqWlJQObq1pAXO8J3UFXC0
	 Kzl7Sx9HomQkxcqztqBypsxcD2QMeu+qzq0pfPlx/G0PyL7jo6frTz86aY5FTYHnU5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793659109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=n2if1RTPZbo5SFsEjRB4Jy0O0oymGB/SO+FAdZRGXuk=;
	b=GgLOxIzHu94tHkClIpFTEqTbYoH9+vEN2INROHx7W8G3+EE5SBiLqQj7ARBT4VAr+c/e
	 9x4ZEYl72RKVIq10sdjcdRnVw+jDJMY4oZXHQ9lF+wfdRTMXPEgDi1UOxrWtqFAAk3Pnh
	 ibUE7I4gJs+Aa6sdJvDcqeN3vQftLngIIbVYDt316n41wYq+4VfAQRg0753wCsKPoJD/7
	 RbfnYqRL99DkxMZfi7JZlijdA3LAVVxUlfiCf98mrj5wfO+4GZRuGC+1FTWr2yMbTItl7
	 UUM7an5AP3ByNir3M4X1R2uihGK4gw1kvv569YecHOQxN+vn6QEQZ/O7AITzltixcjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZF7XJvAA;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D7E606A327
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 22:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52D7E606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZF7XJvAA
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c43373ae89aso537320966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793659107; x=1794263907; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n2if1RTPZbo5SFsEjRB4Jy0O0oymGB/SO+FAdZRGXuk=;
        b=ZF7XJvAAN1By1v8q6/i4QqYYyehamd86T4othD66Ytzo8E2ThRZNnihSEqh47rDl6k
         vK1kdnIU5+MM8cTAnou2t4PMul8Bl/ubSweS/WCM25Et0xcpWJjiwE8URt80eq+E59jz
         nUsY46pO+97Mb0zz6nxMFSi6elvcfQ/T8Z+GQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793659107; x=1794263907;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n2if1RTPZbo5SFsEjRB4Jy0O0oymGB/SO+FAdZRGXuk=;
        b=ifBtBa7cjp3kKwk6abc/m6FlpBIoT7ruhfpYxFnT1V77QcN/sRXW6w9iN5ntpctY4f
         iAtyn67MEith2rrV69bcPPB0g/NkfsgNoJf2WOfeoaYZfGiJM3IZfVObMAAdK4/vcqTV
         lPabO0AXLEUzti7PBTzbw8VTK5hLPWiq5x9gRRZRER0KrkjM2lLtUSprewLdW7myTS1s
         L0sGHIH3NVbyRxMrLkXSMpG+CqxTlY0hst67RWoKcYuI8tCHxUfOpOzFaMSYARZ9BUwn
         E0lx+C7TUV1UdJFp+1I5z9OwlZMxL2/1cN+v+kaCeaeTi/FgR/A6pU2FeaqLOjz9l+l1
         CdiA==
X-Forwarded-Encrypted: i=1; AKwUvByTBZz9VMT070jL+Lrh/zrxvEq80B13pMM5A1RJ8sbRYshHctPt9qgu52iHHalLsJah/AIvl9JH0V3XQteX@vger.kernel.org
X-Gm-Message-State: APuU4Z+7uMgH814NwnC2L1axSB9KUmrZ2En2xKy0ze7AFexL6lTK9RIx
	Zw8sd9gVqXwxVB8RZTwFfqDJNMsG3tlgeu5ZTMe0gVOp2ByBwy5JeB93olHekzJw1lDMprFc7o9
	BazKRkw==
X-Gm-Gg: AYBFou10/sj744uQ1SAmR8kD2a7+GMJrUIiegW+ioXfg6oryygKyuZVHnxX1M3ydvMQ
	IUk0afGhtEH3n0lIID6b0ej9FtDLEaihizVOU7/19TWCNH8S6HedgS8xmqFuVwkrH9oeUV1O28p
	QFJHRCTIdSDE/Kju5GsGhjc4bf7iN8E6HGimn0iPOREnCH+kgR9bhHVfnjM61xU0yL/OrDZbhjB
	UQvU9SO3XH+tsV/CRJGSXzp3cjhLphGahuTsQiJCtHrdYtLeTVmopCmglyzHPUrrJTkTMDDWg6r
	NNdtuAGPVhv5qoXKNPRaGH+hDNwCeEkp1I/bwbvFSxD64MZT3/TxFKYp5rpKvUm52oZuIDXs+2J
	wzeHau9e/o4wdSaW2Tp4sMTFF9BsqlQ6iOSW2ChZlasJcN4wH/ElZJEon6go+q7h6c/kZgXZB/m
	Oqcw0D8Qh7BQFja+SWFzQniljJ7LCrUZ6nVnj1HI1QqAZS5av8OdF2Yw4UXLwvgajqKqWJOH3JK
	6Monrn7DW2iw+mh1Ubyz3UNZKG2c9Xw8jUjUDEXy1YhJocyINPxbKzVohv6twmuXTAfXsRG8cWo
	03g166bcZHsl0GHxCQSeCOZ3KVGTiZYb1Wb5ZbMXshWWrTnOlVn5pU1BYXpTSKN1rQiF
X-Received: by 2002:a17:907:80d:b0:c41:26b8:c49c with SMTP id a640c23a62f3a-c4ca7aefa45mr906267966b.10.1793659106631;
        Mon, 02 Nov 2026 14:38:26 -0800 (PST)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cebf37c9bsm29605666b.48.2026.11.02.14.38.24
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 14:38:26 -0800 (PST)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e0d885929so2872053f8f.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 14:38:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwBzEAMHlQ0OMK4rC1Uc89Zt0/IEOQVbcfkFomXkUmpI9ApbeMTbw2dnKl20XGf09MB2b+iCUwY67zE9mnK@vger.kernel.org
X-Received: by 2002:a05:6000:46c3:b0:48e:f47:273c with SMTP id
 ffacd0b85a97d-48e6e2bcd97mr17576125f8f.8.1793659103258; Mon, 02 Nov 2026
 14:38:23 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261026-sp11-bl-upstream-1-v2-1-efc84396adf1@gmail.com>
 <CAD=FV=U2sZaobJMHCimqB5Kw0fZ_-7=9tHAxT-KrSP8uQiY-vw@mail.gmail.com> <49e9a6d2-8665-4e78-ac17-da5a55abf065@linaro.org>
In-Reply-To: <49e9a6d2-8665-4e78-ac17-da5a55abf065@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 2 Nov 2026 14:38:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WiOkG2_4w8iarx40FOhmJOY_pRQOW+6jOW29nea6y-wg@mail.gmail.com>
X-Gm-Features: AclHuK9QTI8PVDWnzL2eO8ikSkqp3uUAySr3iNnFFlAceBchakK_x41BCxCieLM
Message-ID: <CAD=FV=WiOkG2_4w8iarx40FOhmJOY_pRQOW+6jOW29nea6y-wg@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: disable the backlight at probe
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: jimmie.lin@gmail.com, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>, 
	linux-arm-msm@vger.kernel.org, aarch64-laptops@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 2, 2026 at 5:15=E2=80=AFAM Neil Armstrong <neil.armstrong@linar=
o.org> wrote:
>
> On 10/30/26 02:40, Doug Anderson wrote:
> > Hi,
> >
> > On Mon, Oct 26, 2026 at 6:14=E2=80=AFPM Haipeng Lin via B4 Relay
> > <devnull+jimmie.lin.gmail.com@kernel.org> wrote:
> >>
> >> From: Haipeng Lin <jimmie.lin@gmail.com>
> >>
> >> pwm-backlight can preserve the enabled state left by firmware to
> >> support a seamless display handoff. However, panel-edp does not suppor=
t
> >> such a handoff. When probing a generic eDP panel, it powers the panel
> >> on to read its EDID. If display pipeline binding takes longer than the
> >> runtime-PM autosuspend delay, the panel is then powered off while the
> >> backlight remains enabled.
>
> So we don't support handoff _now_ but we may certainly support it someday=
.

Yup, that's fair.


> >> On the Surface Pro 11 LCD (LGD0779), leaving BL_EN high across this
> >> power cycle appears to leave the backlight controller in an incorrect
> >> state: brightness is pinned near maximum with a greatly reduced
> >> dimming range. Subsequent brightness changes update the PWM duty, but
> >> do not restore it to normal. Cycling the backlight off and on at
> >> unchanged brightness restores the full range.
> >>
> >> The first drm_panel_enable() does not recover from this because
> >> pwm-backlight still considers itself enabled and leaves BL_EN high.
> >>
> >> Disable the backlight at probe, after acquiring it and before enabling
> >> runtime PM. This clears the firmware's enabled state so the DRM panel
> >> core turns the backlight on after panel power and video are ready at
> >> the first modeset.
> >>
> >> This also turns off the firmware display at probe on systems where it
> >> previously remained lit until the first modeset.
> >>
> >> Verified on the Surface Pro 11 LCD by delaying display pipeline bind
> >> past the autosuspend timeout. BL_EN now drops at probe, before panel
> >> runtime autosuspend, and brightness control works at the first modeset=
.
> >>
> >> Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s pr=
obed by EDID")
> >> Link: https://github.com/dwhinham/archiso-aarch64-sp11/issues/41
> >> Suggested-by: Douglas Anderson <dianders@chromium.org>
> >> Assisted-by: LLM
> >> Signed-off-by: Haipeng Lin <jimmie.lin@gmail.com>
> >> ---
> >> Can reproduce on an installed system on Surface Pro 11 LCD (X1P-64-100=
,
> >> LGD0779 LCD) by booting with modprobe.blacklist=3Dphy_qcom_qmp_combo t=
hen
> >> loading that module manually after ~20s. This delays DPU component bin=
d
> >> past the panel's runtime autosuspend timeout.
> >>
> >> A/B tested against the same v7.2 tree:
> >>
> >> - Unpatched: panel VDD off 3.5s..20.5s while BL_EN stays high.
> >> After the first modeset brightness is pinned near max brightness with
> >> a "collapsed" dimming range. sysfs brightness writes still reprogram
> >> the PMIC LPG. One bl_power off/on cycle at unchanged brightness
> >> restores the full range.
> >>
> >> - Patched v2: patch provides the same full brightness range on boot
> >> (stalled or not) as the v1 patch. BL_EN drops at panel-edp probe,
> >> ~1s before VDD cut, rises ~0.5s after panel power at the first modeset=
.
> >>
> >> Tracing and functional testing on the SP11 shows unchanged sequencing
> >> for fast boots (without artificial delay), DPMS off/on, and system
> >> suspend/resume.
> >>
> >> Panels with shared/always-on supplies and no panel enable GPIO
> >> may continue displaying the firmware framebuffer during the
> >> runtime suspend before first modeset. With this change panel-edp
> >> disables the backlight obtained through the backlight phandle at probe=
.
> >> The DRM panel core enables the backlight again at the first modeset.
> >> I have not tested this configuration.
> >>
> >> Testing on other panel-edp systems particularly with pwm-backlight,
> >> would be appreciated.
> >> ---
> >> Changes in v2:
> >> - Disables the backlight once at probe instead of
> >>    in panel_edp_suspend() following Doug Anderson's suggestion.
> >> - Only disable the backlight obtained through the backlight phandle.
> >>    The driver's AUX backlight setup is untouched.
> >> - Link to v1: https://lore.kernel.org/r/20261024-sp11-bl-upstream-1-v1=
-1-d39bfaf9afbc@gmail.com
> >> ---
> >>   drivers/gpu/drm/panel/panel-edp.c | 11 +++++++++++
> >>   1 file changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel=
/panel-edp.c
> >> index 94bc54c3833a..d019f4165674 100644
> >> --- a/drivers/gpu/drm/panel/panel-edp.c
> >> +++ b/drivers/gpu/drm/panel/panel-edp.c
> >> @@ -21,6 +21,7 @@
> >>    * DEALINGS IN THE SOFTWARE.
> >>    */
> >>
> >> +#include <linux/backlight.h>
> >>   #include <linux/debugfs.h>
> >>   #include <linux/delay.h>
> >>   #include <linux/gpio/consumer.h>
> >> @@ -918,6 +919,16 @@ static int panel_edp_probe(struct device *dev, co=
nst struct panel_desc *desc,
> >>          if (err)
> >>                  return err;
> >>
> >> +       /*
> >> +        * Backlight drivers may preserve the state left by firmware,
> >> +        * but panel-edp does not support seamless handoff.
> >> +        * Runtime PM may power off the panel before the first modeset=
,
> >> +        * leaving the backlight on.
> >> +        * Disable it here so the DRM panel core enables it in the cor=
rect
> >> +        * order at the first modeset.
> >> +        */
> >> +       backlight_disable(panel->base.backlight);
> >
> > While still feeling a little ugly, I can't think of anything better to
> > do in this case. Thus I'd say:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > I'd prefer to get a second opinion from someone else in the DRM
> > community to make sure I'm not missing something, though. Neil,
> > Maxime, or Linus W maybe?
>
> I lack some knowledge, but when the display pipeline is probed
> who's in charge of disabling the backlight when suspending ?

I'm afraid I don't understand this question.


> Why don't we handle the backlight state in the PM ops ?

That was what Haipeng proposed in v1. ...but it felt wrong to me. The
core panel code is supposed to manage the backlight and it handles
this in most cases. The only problem needing a fix was at bootup.

-Doug
