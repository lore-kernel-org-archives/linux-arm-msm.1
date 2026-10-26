Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793031054;
	b=M05S1Il7OeWu7Aq6U8xN5mbznMw0x2wSNFp4tEl9mxnRdahbR11mpsIQiqlRVjE469dP
	 UIH0Wo632eMGI60rwHBW/6DAC01Gt3lBPMWUF5eKlUdN8rt7soh28a8nNyAiSwLBpwqQb
	 qTjF0biEKFh0C5LM3d2SmICqa4JCzWm7qZz321eyQ/4Cx1RAyFjIBsoCzJdGyvkxwlo8x
	 6xDguqAicudAEFqYEF8T5NQOB1JZy9viF2s5BleY06+/en6QbxACfOToZ403U7oldMzts
	 z5ZGN7CugFRrg2a+QQUi/iV8PpKrbpokMYDfEHEChc4j47hAnpQ7W5rJIHOsfRu7KEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793031054;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=LRYiObfFeB4WPOp5iFNMLIAZZFa6drRLpmas4AXgTgk=;
	b=ng5hH30ZX64z/EYKLC3rWGxpMg2RfBNdnvGMV1ao35tJ9VopTQoaThxztDTEgPrVCkdq
	 v5WP92pdU/w9MTTFCalf5jFniSOFM3eW2ZBvEj23OUipJA33tetY/5Oa5IRM0aprf3Bz4
	 oTrL+Ll3Nar7R5MZli89QoXn0TWIwynFdRPH2uQCOaAioOn4V6zq/BoWaBCjaMP/CkAES
	 FLcv4YUbsnFkzu27ohCcnJlIEajWHKRGXdrE+S8Ez0qTnvDOXo0rC1BSSpXqaR7OpJPHS
	 sfZqz2AvUD/X7hErayQZZErhylT6ADL9zHjnHs8XhFPnwi0uiddn+6d2LMudbEH0bGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Of5qfHIu;
	arc=none smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E13606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 16:10:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 87E13606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Of5qfHIu
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5bfc3292d90so502479e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793031052; x=1793635852; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRYiObfFeB4WPOp5iFNMLIAZZFa6drRLpmas4AXgTgk=;
        b=Of5qfHIuy51tBz3qzukcNEIHaL2XsXpAKnrLySg4DNfWqxlVMamDIkdskfaksxGF8G
         lpMv16BJdKg2sXQiUHwvvQ3C82Howxng6pWoPHL4hpKuWtjWkyhs1cS7ce+MGq92OM4Y
         JHAQCMMETKiQqDYDuTM3II9mnGJqHHQ+Hug6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793031052; x=1793635852;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRYiObfFeB4WPOp5iFNMLIAZZFa6drRLpmas4AXgTgk=;
        b=hsrZWjapmCyWPoJ/+ORS360MG/e0cNwCPdHmPkwpgasoWKyMMVEnL/FNXmhKRzlhOO
         DLLZOnkF96DVDe03zu7C6CvhK6pIwGsTjUhk8fWydMskD/8jrDRcy4z7wl4/STMD6dt0
         wstuPmGKJCjkgmmiPkHPWHkS9oPs2wXxtoR/2ziKcnSsrAUhov7+HqOeU6Qva9lCX1gC
         zcR+g4WxNLYWIjSIGQt1FEqaEpjn0oTliGpvrEiA9osXblB8bw4idYsj7KqxeWyaISYr
         RN/opKVYkTDfp30vCllgDNMgIFE1Ke7fGJlz5m7Fxhm0H2pNocv4JfymMX022JQ8rPH0
         v8gw==
X-Forwarded-Encrypted: i=1; AKwUvByK4kjyZI5CCH+01qXcb7QHdQBv1cjsue9KHi1LqRlcCc8bmpBBGyZPILfDcMlMWifGaixbVb9EVzn1K5K8@vger.kernel.org
X-Gm-Message-State: AFq9FYLRilwwR6fBPbqo9dOe+O0xQ42cKcoWFnZYdkqHNZ2pQtL0ZnQl
	qU4ClrrVMqAWhwK00u5MI4tca8uVKpQ5uNAp9vBqSZQ7dPcDpbJeVO2xut8OlUkOvH44nP6Mwuf
	chtB2Tg==
X-Gm-Gg: AYBFou0SiWF0e6kAKNCX9fPOAXtfXEY3LGU0pV97MITrVMSOGRTedUPgvAaUbGLHlu5
	0kST7oe35zz8fEKRkML3Jq1ydSrAgZTh5hEBSu4+o6Q431CZ16zYdyaQ8v3mSxHbxoWQOlV6tn3
	gH0g7xzrGkJYRsUeGk+Q91ltokVY0PfabxcBRCcbSHxJez7Wedtgin7OGL4zDpH0duLtAwQx6Zj
	flFqyWwnJ0gPDYpXog0ARpbVqYNMx7CdgyTErggYW3YlvGkkR3tP8Ve48cwLlb6Mithc5uJT61b
	5dHn+c47R3HisVmX30+2gm4TJR9d/GeEfySUMg/vgpsXzJ0YbweHqA8RV/6vNF8gXqIKW+xA2S3
	JzmRqjX31P76yCPztsoK7thZgB2sGP7h5ijqSHdKgyHjYMBsFsUckMvgZmdLIe7iEXsXL6NGv9D
	g9oN1129o0mepLjIEmzqo1sKI6cnkE1nprDHjDZyulw43nwFSkc0Kj4gvK3OnCaYYOZs4devhLO
	AyABiLcO9jaPEsuG6QoWivT5F1DJ5K5AMKl8pzQLTaEUEDG7AkNxfR962xLSoiIZ54xI9ZAkdMA
	P4kQfQcWGBZ1w2un/Hv8Nhs=
X-Received: by 2002:a05:6512:15a8:b0:5ba:3e13:f0dc with SMTP id 2adb3069b0e04-5bfb716dfe7mr2266414e87.5.1793031051750;
        Mon, 26 Oct 2026 09:10:51 -0700 (PDT)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com. [209.85.208.169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb7a894d5sm1630477e87.50.2026.10.26.09.10.48
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2026 09:10:50 -0700 (PDT)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ab3b29a298so21982031fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:10:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBy3Sq/d186r8KjB4yTlNKk2RNfF2w1YSdNtb/DkCab5wR5CRNzLdSRoQvp7/GJr+IAuOG463B/U2oCTWzXR@vger.kernel.org
X-Received: by 2002:a05:651c:a32c:b0:3ab:690f:82ab with SMTP id
 38308e7fff4ca-3ac6fd6d952mr16112171fa.28.1793031047006; Mon, 26 Oct 2026
 09:10:47 -0700 (PDT)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-sp11-bl-upstream-1-v1-1-d39bfaf9afbc@gmail.com>
In-Reply-To: <20261024-sp11-bl-upstream-1-v1-1-d39bfaf9afbc@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 26 Oct 2026 09:10:34 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X+003jZ_LLQK6HEtuKs9Y39z=4=2SaN_=Y0uSXgVXFOA@mail.gmail.com>
X-Gm-Features: AclHuK8VJDZ71e8SV7IfzgVPRQ8znFYiO6UYRUmBFyp4fXJJtzRNheKbSl34Kx8
Message-ID: <CAD=FV=X+003jZ_LLQK6HEtuKs9Y39z=4=2SaN_=Y0uSXgVXFOA@mail.gmail.com>
Subject: Re: [PATCH] drm/panel-edp: disable the backlight before powering off panel
To: jimmie.lin@gmail.com
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Linus Walleij <linusw@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Dale Whinham <daleyo@gmail.com>, linux-arm-msm@vger.kernel.org, 
	aarch64-laptops@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Oct 24, 2026 at 5:24=E2=80=AFPM Haipeng Lin via B4 Relay
<devnull+jimmie.lin.gmail.com@kernel.org> wrote:
>
> From: Haipeng Lin <jimmie.lin@gmail.com>
>
> If the display pipeline takes longer than the runtime-PM autosuspend
> delay (1 s) to bind after the panel probes, panel-edp's runtime suspend
> powers the panel off while the backlight is still on: pwm-backlight
> inherits the enable state left by the firmware at probe and keeps the
> enable GPIO high. The panel supply is thus cut without first disabling
> the backlight, leaving BL_EN asserted across a panel power cycle.
>
> On the Surface Pro 11 LCD (LGD0779), leaving BL_EN high across this
> power cycle appears to leave the backlight controller in an incorrect
> state: brightness is pinned near maximum with a greatly reduced
> dimming range. Subsequent brightness changes update the PWM duty, but
> do not restore it to normal. Cycling the backlight off and on at
> unchanged brightness restores the full range.
>
> The first drm_panel_enable() does not recover from this because
> pwm-backlight still considers itself enabled and leaves BL_EN high.
>
> Disable the attached backlight in panel_edp_suspend() before marking
> AUX unpowered and cutting panel power. This ensures that the first
> modeset enables the backlight after panel power and video are ready.
> When DRM has already disabled the backlight, it remains off.
>
> Verified on the Surface Pro 11 LCD by delaying display pipeline bind
> past the autosuspend timeout. BL_EN now drops before panel power is
> cut, and brightness control works at the first modeset.
>
> Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s probe=
d by EDID")
> Link: https://github.com/dwhinham/archiso-aarch64-sp11/issues/41
> Assisted-by: claude-fable:5
> Signed-off-by: Haipeng Lin <jimmie.lin@gmail.com>
> ---
> Can reproduce on an installed system on Surface Pro 11 LCD (X1P-64-100,
> LGD0779 LCD) by booting with modprobe.blacklist=3Dphy_qcom_qmp_combo then
> loading that module manually after ~20s. This delays DPU component bind
> past the panel's runtime autosuspend timeout.
>
> A/B tested against the same v7.2 tree:
>
> - Unpatched: panel VDD off 3.5s..20.5s while BL_EN stays high.
> after the first modeset brightness is pinned near max brightness with
> a "collapsed" dimming range. sysfs brightness writes still reprogram
> the PMIC LPG. One bl_power off/on cycle at unchanged brightness
> restores the full range.
>
> - Patched: BL_EN drops ~300us before the VDD cut and rises again after
> panel power+link at the first modeset. full brightness range works.
>
> Tracing and functional testing on the SP11 shows unchanged sequencing
> for fast boots, DPMS off/on, and system suspend/resume.
>
> Two cases would benefit from testing on other hardware:
> 1. AUX-controlled backlights
> The disable is placed before drm_dp_dpcd_set_powered(false) and
> regulator_disable() so the panel remains accessible if disabling its
> backlight requires AUX writes. But I have not tested this since my
> LCD is GPIO/PWM based.
>
> 2. Panels with shared/always-on supplies and no panel enable GPIO
> These panels may continue displaying the firmware framebuffer during
> the pre-first-modeset runtime suspend. This change will turn off their
> attached backlight during that interval, potentially making the boot
> display go dark earlier. This matches the driver's powered-off state,
> but I have not tested that configuration.
>
> Testing on other panel-edp systems particularly with pwm-backlight,
> would be appreciated.
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 94bc54c3833a..87f9c13380be 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -21,6 +21,7 @@
>   * DEALINGS IN THE SOFTWARE.
>   */
>
> +#include <linux/backlight.h>
>  #include <linux/debugfs.h>
>  #include <linux/delay.h>
>  #include <linux/gpio/consumer.h>
> @@ -413,6 +414,18 @@ static int panel_edp_suspend(struct device *dev)
>  {
>         struct panel_edp *p =3D dev_get_drvdata(dev);
>
> +       /*
> +        * eDP panel power sequencing requires the backlight to be off
> +        * whenever the panel is powered off. Before the first modeset th=
e
> +        * backlight driver may still hold the enable state inherited fro=
m
> +        * the firmware, and some panels' backlight controllers come up i=
n a
> +        * wrong dimming mode if their enable line stays high across a pa=
nel
> +        * power cycle. Sync the backlight off here so that the backlight
> +        * enable from drm_panel_enable() performs a true power-on in the
> +        * correct order.
> +        */
> +       backlight_disable(p->base.backlight);

The above doesn't look right to me. In general, the backlight should
be owned by the core DRM panel code. Jamming this in here looks like a
hack. We'll also be double-disabling the backlight in most cases since
the core drm_panel code will be disabling it _and_ we'll be disabling
it.

I guess the problem here is that the PWM backlight code tries to
preserve the backlight to handle panel drivers that support a seamless
handoff from the bootloader to the kernel. Since some panel drivers
handle that and others (like panel-edp) don't, it's hard for the core
to magically do the right thing.

I think the right answer is to disable the backlight at probe time for
panel-edp. This is a one-time thing and just to handle the bootloader
handoff, so having the workaround run once at bootup is better.

-Doug
