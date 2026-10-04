Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E404441A54B
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 Oct 2026 11:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791114424; cv=pass; b=XMb1l4uZI3wmFt2muNfxsxgSWRpWYuCumuAF2Ph8DShc1Xwq7kdDRruNqFEA9xjSKVtZCBmyQQgneWqh1noK2Tz3V/deB88coP62iH+4aaegTXEyhqD5894hrUvEoOu9X5W5B+zZ4lCGH873SR3bnRfbFuBKFx7CgznffNxQWrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791114424; c=relaxed/simple;
	bh=4tIdOJ4E73NzfC8+HZPUUjeQno126FKXlIlP4skhobc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N5mGsxqzxR1cad2a0Y/maPq5fHTjBfPrm+sk7WtSoxnu1FxJghaS2s0GtDaMvIp0jTnCW0XuIgRuJz9CeRbTLNZLbInDeAWJx6PezIpepojv3khbYL6cE3Th+nZtlRJI/9FeoCcRUe0i3/p1qoOMJviSISqS0SmWDA2JCpv04Ek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rEMsbJBz; arc=pass smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rEMsbJBz"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6acb57c2b88so1271654a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 04:47:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791114421; cv=none;
        d=google.com; s=arc-20260327;
        b=OOTJFTHXDudkNvRlKXkJmFiz3DhudW93GbBQhimaQP72Wb3xvswMkBEFxlvod+c1v6
         TaU3ii8bxgTopMRkns6Muq2E/AWVBdXMAoD9F+Rg3oU6s0e5stJdAAPqBz32+C1kbP6q
         7to86zcgBpPAhOhEsFWoOW/OXTlvSCOea7eVZzPbMgOur7sicDwfnYnNpiaBAEwYGHJo
         ME0U01+5Yc89CSRziplKLIwxvOKJgHDRJUsr4K/LQ2N+9eSko/sAg4g2VpiG1xhzfL/d
         W1Y/kc9Q8deQdBqYD/u98W3e6eL2yMl3wrwnadvLHyJYKrq+zGahpfQwLc+Gf0L/FdrZ
         4tPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZRz7JbcncLnLcW42dvDfeGGoX+dHR78wDKr4f8pv6C8=;
        fh=FSY3g7Y/hP+Uu7NyRuMgHSI/aQDv4/ZHFNEFx+Yib3I=;
        b=osAjFA/0+6Ec+SXZbzmjnXfH2KnjqZI+yTrIkorA91/mBd8w/eDCXrEvKh7oNcZlZS
         Afm/sMcmrKLpOilteRpBOxsPJKOaqvTc25McoV3KAvIQ818MXq3PS39HiSoQnARX6xyl
         kvUzPfg1Cb+sGCev+AjDxBCYXkmDLWMrNKfZXhPq6Yusc8FQfgcTgjE6Sy0ZzZ/4ugMy
         56bpVtynBtd6Ta0QgjFt3mZ5MgUJGzwRZYqz8pGQWU1AvBNyx2iwTLZP5/vnsbY2i3nN
         ssUVQktm/zLEfssofIVLu12B6QWODKfuebzLOwQ1sN5gyIZ5zQQipjbdC6x4hxGRVpKg
         qtpA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791114421; x=1791719221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZRz7JbcncLnLcW42dvDfeGGoX+dHR78wDKr4f8pv6C8=;
        b=rEMsbJBzmtc/NtRtwPDO10uJTmu5iJKC0DP9/tguAEuQrhQU3rka9wVCPgJErPGfUA
         G93LjUcaKJ07uCpkKDqgZtyP8nL39+PMQbq/H6w+EoBeWnxKN7JsL+xZBTdMvWBzgDOW
         k6aQhjumH4eEynNaOgkwL7toiVyfceg1rlPrv330ZYZGi1wtX6Z9vr/PkFvctjZe/ldi
         ghAdAtelL/sQwYfXCpdLFGgBKzCJ/bSH0haE818sEJObMPLdF0qF/Roi1SeEJa3JcDYS
         EZGM2+buXVFQJKixvO86KHfdzwGUCGZ8nvuP+S0+qxI66HYOhkXBTp1MDV66mkvVKWLn
         BYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791114421; x=1791719221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZRz7JbcncLnLcW42dvDfeGGoX+dHR78wDKr4f8pv6C8=;
        b=QVzspkNWwiApsdkgj20C7RFytOuT6v61syAumSf/r7109BR2MpG5AmvHvk9FKOaaLi
         lIqbYnoY2AFN2a+07Yah455smiwTsHS+49okdanCUo27A+0xQVzrqvfXmoFKQ1onoAj0
         85LB6npxmuleKCsBIDHOSm1bjsMY0dG1eCPTj2bqk1kMnMgyd8xrr9I0FnI99xUfekz9
         V3OHaPaZs+ei6RTXOhlfz+RIUItTcLE9hDbiNIKujYBY/VtSqWIidm2l/hPbNzFQS78V
         Ac0gATIvLQ+JHpkk40B0+Y/ePFfKDvJvaN0wCv5lz8CVXtKH84TsMkLsJNZ9Lcc1Ui/E
         ip0Q==
X-Forwarded-Encrypted: i=1; AKwUvBymkQT82wutBFk4PZrSKBu1CNTO87iiziPi/+n+J2Y6q+dPdmlgWkwcfnPfhbc9EjU2h4kZnAWEkjrZcxp4@vger.kernel.org
X-Gm-Message-State: AFq9FYJaxQRE6sawmWNypSA1Fra2rqkcuAkkNpqvuM4oYMXkQU2ekV7G
	ErNkcmovRalIR2cj1TP68GRxf6TB4UJjmI4D0+PtmwI2ALQXRYyVVmRg9TP2gwF0JVmBuneL1tu
	ZXHxHlGdsnnLONtKTCGnh1v3yuRvEEEM=
X-Gm-Gg: AYBFou2ho7R+7P/uWgzVZSGLwB5aG8Ao0hja4htLyYhmI10xHZhznw+aoQNlVgj/AjE
	T2Vokuu876pZot7s+FOBbeLCRc6pWbJuv2WJNlZXIxTIzqnG0E5PbaWJUBske4+0fVrZ2tZLEZD
	Deh1p2d3zddDfQHEuvbdhYXqEw8prDQ2FhM8eMudpHBoNeQSv8Sk6uqHzNKIIAsD0870NGbEm9d
	3e97POar2fX4zSsThwhufP0GWuBOer10/W9J6S6TSc9swSqH0QPSlAnXg7w84sI2PW5IukofWR/
	kVTQOIKJZbupe9v7l/o4KigXMHAUY1JGprV7PysqZWI21odUhvNdN7gIT4v6MEc4t3LlucjhXw/
	0AHOdSSiqNw==
X-Received: by 2002:a05:6402:4021:b0:6ac:aec6:a3b9 with SMTP id
 4fb4d7f45d1cf-6afad90627bmr3827480a12.24.1791114420829; Sun, 04 Oct 2026
 04:47:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261004102758.84436-1-26rote@gmail.com>
In-Reply-To: <20261004102758.84436-1-26rote@gmail.com>
From: Pengyu Luo <mitltlatltl@gmail.com>
Date: Sun, 4 Oct 2026 19:46:49 +0800
X-Gm-Features: AclHuK9M0MD-4wDlLCu7PKAzHiucnOaIPii0zTGjuitof7jNo1-BtNJqT62chRk
Message-ID: <CAH2e8h6RPMF+Tod==XKjAbjmnzUKs1skCpvN7_YuGyao9m2baA@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: round up the compressed INTF width
To: Joonhoe Kim <26rote@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jun Nie <jun.nie@linaro.org>, 
	Jonathan Marek <jonathan@marek.ca>, Alexander Koskovich <akoskovich@pm.me>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, "P. Lewis" <liu224806@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 4, 2026 at 6:28=E2=80=AFPM Joonhoe Kim <26rote@gmail.com> wrote=
:
>
> For DSI with DSC, drm_mode_to_intf_timing_params() scales the INTF
> active width by bpp / (3 * bits_per_component) and rounds down. The DSI
> host computes the same width with DIV_ROUND_UP, both for the pixel clock
> (dsi_adjust_pclk_for_compression()) and for the active width it programs
> (dsi_timing_setup(), from bytes per line). When the division is not
> exact the INTF line is one pclk shorter than the DSI line, and the DSI
> FIFO overflows.
>
> Example: a bonded DSI video-mode panel, 952 pixels per link, DSC 8 bpp at
> 10 bpc: 952 * 8 / 30 =3D 253.87, so the INTF uses 253 and the DSI 254.
>
> Round up, as the DSI host does. Qualcomm's downstream SDE driver also
> rounds this width up, and Pengyu Luo needed the same rounding on the
> Legion Y700 gen 4 [1].
>
> Tested on a Lenovo Legion Tab Y700 gen 5 (SM8850) with that panel, with a
> module parameter selecting the rounding: rounding down, DPMS off/on gives
> no vblank and 14000-17000 DSI FIFO error interrupts per second
> (dsi_err_worker: status=3D4); rounding up, the picture comes back and the=
re
> are no errors. Only tested on this device.
>
> Link: https://lore.kernel.org/all/CAH2e8h6oinKxN1ndcvHCSc+=3DbFLXVVDZVAVF=
0cQHoiaMvEwhPQ@mail.gmail.com/ [1]
> Fixes: f9ce482d7dc0 ("drm/msm/dpu: fix video mode DSC for DSI")
> Assisted-by: LLM
> Signed-off-by: Joonhoe Kim <26rote@gmail.com>
> ---

Thank you, Joonhoe.

I am glad to see someone is raising this. For most tablets, the
horizontal pixel count is not divisible by 3, so rounding up is
necessary for them. Besides lenovo Y700 gen4, rounding up also helps
dsc display on gaokun([1], patch initially provided by White Lewis)
whose horizontal pixel is 800 * 2.

[1]: https://github.com/whitelewi1-ctrl/matebook-e-go-linux/blob/master/ker=
nel-patches/0003-drm-msm-dpu-encoder-fix-DSC-width-truncation.patch

Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>

Best wishes,
Pengyu

> This does not touch the divisor discussed in the RGB101010 thread
> (bits_per_component * 3 vs 24, with and without widebus); that patch
> was dropped from the series pending that discussion [2]. This one only
> makes the rounding match the DSI host. The panel here uses widebus.
>
> [2] https://lore.kernel.org/all/20260321-dsi-rgb101010-support-v4-0-eb28e=
cebbfe8@pm.me/
>
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drive=
rs/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index ba810f26ea30..2ac517db50fc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -134,8 +134,8 @@ static void drm_mode_to_intf_timing_params(
>                  * TODO: replace drm_dsc_get_bpp_int with logic to handle
>                  * fractional part if there is fraction
>                  */
> -               timing->width =3D timing->width * drm_dsc_get_bpp_int(dsc=
) /
> -                               (dsc->bits_per_component * 3);
> +               timing->width =3D DIV_ROUND_UP(timing->width * drm_dsc_ge=
t_bpp_int(dsc),
> +                                            dsc->bits_per_component * 3)=
;
>                 timing->xres =3D timing->width;
>                 timing->dce_bytes_per_line =3D msm_dsc_get_bytes_per_line=
(dsc);
>         }
> --
> 2.43.0
>
