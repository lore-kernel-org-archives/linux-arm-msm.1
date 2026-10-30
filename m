Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324437;
	b=ZVACqxiSWzOiie/aD7VIeuDjoHo1/gc+U+ufSLma5K2eE7dNtBGCB2WDnz7nsLcC2ZNE
	 6MtgkWCVXUZrxFyZmSMG5yvuqRoy0qrNXg/qdUgeHxJuI3O60iW4zFIIsl6IzGyxRXZai
	 PWmKJF4AYRLktNLiG2Kaas3mn5KKtpovorC0QviAajECkgwkqxF/yBrRrgwItwGxzXZZU
	 I9fayoVD6Rbz+Vi8/BXej243yNlKWMkkWVd5wsGqfR3VCNNUeZLA1/lLINGBs+/YPjQJg
	 wXw9uwUOcC+06LUEVGDWRe4EoofluKeQWq96/KVwjpPlZaOOoNg9xbeqirkzVKBGeGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324437;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=HmOxxSAaFjRQ16uV6mrLf8vylHogbNzAJ0HDl4YQB3g=;
	b=mtc7Hdcb+ikkdH6/AsZFqAKFTdiipzEt0d1fZ2S1Tm/cKp2lnoTepS6gJmcoJbBtfI6o
	 WZapseCRYloHz9RpdwjxJBvSKU2fFQOw/JEjUULudeOzXCuWLqAPsPsEyIe+6XlRmv711
	 kxwqpz/qloGIUieEtTeew4dS9M/qzPdf0BsPF9SxEWYXQsonvD95Wfe72/j6o5AVet+Vg
	 FnAnHahcU0tLKb04gy+7ZAlFo4DnYpMCi7CFMLGooW1WH5VN+SlM6PVSMxk6EJpCG+7Er
	 MbIapXuKDEPj/Z7aJyUyLM0ECro8JOrfDhXQ1ShuW32b23QA2pUnzT8kQ+fiekWmydQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KTPs0Fn+;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A36C606A31A
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 01:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4A36C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=KTPs0Fn+
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so22759866b.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793324436; x=1793929236; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HmOxxSAaFjRQ16uV6mrLf8vylHogbNzAJ0HDl4YQB3g=;
        b=KTPs0Fn+qr16i55kBm2FizWfZDcirE6uJ9I3QPUiJOIMnqsGL92j9U26Jhh3tJ4POU
         /CliQpr2kL8qKQsTEvRcfneMNlfjNTTqz9NZP1QPKJ0cjXGSCbr9Ps0Civs3E2Vzfxva
         /aJZA/JRce62EkRy0EkKayL9Ds88O76k9zP+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324436; x=1793929236;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HmOxxSAaFjRQ16uV6mrLf8vylHogbNzAJ0HDl4YQB3g=;
        b=Zfcc0hjgqOso5sURnkAPJm/cFo/lzQpOqUikfucKX2DPAi35/8/s624UJBTScRLtxw
         XAMvKpy4RIEQexCtV7TSP8rwG/aXXBj4p7T87ib8Lo/MJL12u67G5N+xEyOjhNP8uj82
         TDKB8CP+1iOuNhMZ03vYe7wqlm0uTazyBgnh25mJR8/zEPAtVRvbE8XATJTdOJhVLDnp
         HncTy3PYb56O6RNqRNQH68tkZIfEInrkFTzkZSjHrS06rauWkWlH8sAOU/BDMwF5atiA
         4y+eubKYNaxH3x3KiUuhBFHYsyUe6sHQkchXQjfti4NMzYQ906WWzHwjTHh+C+jadrUy
         k2hA==
X-Forwarded-Encrypted: i=1; AKwUvBzhfqoK9g8IZ3q2nDtXpPfk4+oVONLfSvMktQqG261fTq9eMwxcqUQzckfBhJt1Aqg9HRmcO5nnZ/nTsBtz@vger.kernel.org
X-Gm-Message-State: AFq9FYKclSukHkfvtD4RQumOyL2z/SxAf4L+58eBi9e+5WIhEDIDOe3T
	35JRekiuQyNG+BO+Wxa0dvnTj12HC0w1i/JsJAq93+B34AXTlKkT2HbSc7/KXyckztF/f92D9Vl
	PP6WbLuMS
X-Gm-Gg: AYBFou3Z9yWOnXt/BlHewVCjBoZ8gV6xsijn/XHELeQ49lU40mC4C6gHZVKs0YQjZBF
	ZUV+OIVn2KpO67TFaSLrZRMehoy7uZlnw5KyR82Oac4cVta9txhqWncRkhTMKlFfno0DbPQ6Beq
	Y8T5Rk0VVGTFPBEcBtehas6MwxtfopEAHhveKYw8u07/S/nm9vu8p1Tb6GIXoR81bDHlrbCDzkP
	hkwJCAzAs4sHVBwGNrdGr6gFC0ehpnmZBWBI4Ax0svXjdwOtdmyIjbnvIT7rCIV1AdACJZl1G+2
	gyWZLq0RJD4m2o/U+Pn6hr4hjUj/4QteKvUfKw2nyXtsyMjEYlZoMOiClkmKwetvxzejU91WLKF
	6CLOl7UOrdsaq6i0UHF5KJMnCSJE0ymgzXxekdT4gl5HRxiaX9WIh4BqGG37ujXyJps/wWLkVCy
	Ls7NjjMLftBivyORRD2D9lAnXFZOvQyp38CLmje5GuIJi8Ab+pzJCa8ic14AHb87uaR+PlALGG9
	6+FAnRoldVTlxEPR55dl6EtKdQ99dx8zwXRRbUcTlW9ElfkWZ3dFNWZnhKi1f5jGQMn/MqmO0oA
	TSZ5XjB3/4+28pdUOIp+LELe+ERTJWVMz0D/Usinlis/P8ItEh9Z39tWbnfauKSZJzFT
X-Received: by 2002:a17:907:9612:b0:c3f:8c92:3b51 with SMTP id a640c23a62f3a-c4ca793c5f9mr71677966b.4.1793324435689;
        Thu, 29 Oct 2026 18:40:35 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4cabcfdc3csm6670766b.17.2026.10.29.18.40.33
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 18:40:34 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a2000d5fb1so706915e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:40:33 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxMTIolpaxl0YbCkjY/VYdYdbhG3nZ0JOmfcvLSU0njoqyNFM5ictTjXd7bTb4ZQhlKie1Ho8f1buyku6zo@vger.kernel.org
X-Received: by 2002:a05:600c:6384:b0:4a1:702f:c736 with SMTP id
 5b1f17b1804b1-4ac150b20famr15395995e9.3.1793324432913; Thu, 29 Oct 2026
 18:40:32 -0700 (PDT)
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
In-Reply-To: <20261026-sp11-bl-upstream-1-v2-1-efc84396adf1@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Oct 2026 18:40:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U2sZaobJMHCimqB5Kw0fZ_-7=9tHAxT-KrSP8uQiY-vw@mail.gmail.com>
X-Gm-Features: AclHuK-a_bsoEb-o0aETxELr_2WmGe4RidhWC24wa7LjtqTEfpGeuw0FK2upUAE
Message-ID: <CAD=FV=U2sZaobJMHCimqB5Kw0fZ_-7=9tHAxT-KrSP8uQiY-vw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/panel-edp: disable the backlight at probe
To: jimmie.lin@gmail.com, Neil Armstrong <neil.armstrong@linaro.org>, 
	Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Dale Whinham <daleyo@gmail.com>, 
	linux-arm-msm@vger.kernel.org, aarch64-laptops@lists.linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Oct 26, 2026 at 6:14=E2=80=AFPM Haipeng Lin via B4 Relay
<devnull+jimmie.lin.gmail.com@kernel.org> wrote:
>
> From: Haipeng Lin <jimmie.lin@gmail.com>
>
> pwm-backlight can preserve the enabled state left by firmware to
> support a seamless display handoff. However, panel-edp does not support
> such a handoff. When probing a generic eDP panel, it powers the panel
> on to read its EDID. If display pipeline binding takes longer than the
> runtime-PM autosuspend delay, the panel is then powered off while the
> backlight remains enabled.
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
> Disable the backlight at probe, after acquiring it and before enabling
> runtime PM. This clears the firmware's enabled state so the DRM panel
> core turns the backlight on after panel power and video are ready at
> the first modeset.
>
> This also turns off the firmware display at probe on systems where it
> previously remained lit until the first modeset.
>
> Verified on the Surface Pro 11 LCD by delaying display pipeline bind
> past the autosuspend timeout. BL_EN now drops at probe, before panel
> runtime autosuspend, and brightness control works at the first modeset.
>
> Fixes: 5540cf8f3e8d ("drm/panel-edp: Implement generic "edp-panel"s probe=
d by EDID")
> Link: https://github.com/dwhinham/archiso-aarch64-sp11/issues/41
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Assisted-by: LLM
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
> After the first modeset brightness is pinned near max brightness with
> a "collapsed" dimming range. sysfs brightness writes still reprogram
> the PMIC LPG. One bl_power off/on cycle at unchanged brightness
> restores the full range.
>
> - Patched v2: patch provides the same full brightness range on boot
> (stalled or not) as the v1 patch. BL_EN drops at panel-edp probe,
> ~1s before VDD cut, rises ~0.5s after panel power at the first modeset.
>
> Tracing and functional testing on the SP11 shows unchanged sequencing
> for fast boots (without artificial delay), DPMS off/on, and system
> suspend/resume.
>
> Panels with shared/always-on supplies and no panel enable GPIO
> may continue displaying the firmware framebuffer during the
> runtime suspend before first modeset. With this change panel-edp
> disables the backlight obtained through the backlight phandle at probe.
> The DRM panel core enables the backlight again at the first modeset.
> I have not tested this configuration.
>
> Testing on other panel-edp systems particularly with pwm-backlight,
> would be appreciated.
> ---
> Changes in v2:
> - Disables the backlight once at probe instead of
>   in panel_edp_suspend() following Doug Anderson's suggestion.
> - Only disable the backlight obtained through the backlight phandle.
>   The driver's AUX backlight setup is untouched.
> - Link to v1: https://lore.kernel.org/r/20261024-sp11-bl-upstream-1-v1-1-=
d39bfaf9afbc@gmail.com
> ---
>  drivers/gpu/drm/panel/panel-edp.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/pa=
nel-edp.c
> index 94bc54c3833a..d019f4165674 100644
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
> @@ -918,6 +919,16 @@ static int panel_edp_probe(struct device *dev, const=
 struct panel_desc *desc,
>         if (err)
>                 return err;
>
> +       /*
> +        * Backlight drivers may preserve the state left by firmware,
> +        * but panel-edp does not support seamless handoff.
> +        * Runtime PM may power off the panel before the first modeset,
> +        * leaving the backlight on.
> +        * Disable it here so the DRM panel core enables it in the correc=
t
> +        * order at the first modeset.
> +        */
> +       backlight_disable(panel->base.backlight);

While still feeling a little ugly, I can't think of anything better to
do in this case. Thus I'd say:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'd prefer to get a second opinion from someone else in the DRM
community to make sure I'm not missing something, though. Neil,
Maxime, or Linus W maybe?
