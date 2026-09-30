Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0C3519DE8
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784632; cv=pass; b=G2dUjlL/JX18UaEFyyLng5gxWuiGVNoxjCi8AhD3RQHTGNf64L+4CtsXps2JpDjyHjzURp/pzfExo4wxJG2J6fsUBOEtyXUjAhkzvz1RqHGQ0yfe8zYnwYwe9B5H84B2X9exHRuh0rbgadeYv6hZ0FEGNAygY9muBF1L7pnh2LQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784632; c=relaxed/simple;
	bh=qbmBOUyTIkFn97xlWxW8cCn16CXOpuvU6kguW+yai08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J1EJnsHbtqF+skTTqvGp3qkpqsXXBcAilon7iHnaP0aYq8cHP7HofFw7b2NDgffx3FpbvjaryqyPLhmHW2OPTpprTxcCjivTjKzjcxeNNCXe/JDwF47JcPgKiX4Qxpraqec1hm+PvMEYgy8t1ZK1ShnN/TA9CDL7ZTCOp/4hW98=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VT2+JgWL; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VT2+JgWL"
Received: by mail-yx2-f40.google.com with SMTP id 00721157ae682-8ab42612328so23317417b3.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:10:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790784626; cv=none;
        d=google.com; s=arc-20260327;
        b=fwr4EzgQvkRRNBCK/PF9EJ3TRx0kO2c0Gt20YWjdIMuFayoazeLGm1EbHleqpWmoVw
         TB4aXkYJRdFQzqdbWOtKEBp83RcR0SKRfPg7g4D+Zqsr9qFKtCxihi0bdxO7irZZtjIy
         onU5xNrA/+b9JQZrfHH9AIlPGTYK8YdtntXCeSNRBKgYgNPUtiU7+S8AnsfKwJF28li3
         H4cUactN9wJcy1h9V1s3n6mUv/+74jp7Gc6oSAjgo0DZK7VXK/qMeESXltKm/qDiLtou
         iwUcM522SbQh1CRqZTZrG6ujUZ1SAOdb4ES3lRjmM1YzpOP1iaGawpjHIz3iygvhnlOt
         SWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iRehZjrfjWyoiGL/7MRfV3/j/MJLZDIiqHOFJW1M59A=;
        fh=m6xEDvG64bs+T/3mEWGBhkA9TJUWG+7e2pbb1f/Yz3g=;
        b=KlwhRjlZqHyDnPLCK3ECo6JEN54fLU5bZTu0ujqX450tnEHGNuVde26VRq1OXGBDN/
         4Q/m4UNLnil824OK/MOrC7tyFcGbHaPRNg+Ew7ZRVjmEmqnCysZW69a6gfkT1Gh21OJ6
         aQJtfbK+CIBejeb9UIOA+x2USM0L4nxciYdilV/d2GhXpw6dlC9QIQ5KqA2DokeTYy2B
         r1YViFLDeAV5WsLDI52Y6ndxNJtSICc74RpCh5SHGjTCNBtvU2nXZREls5p6WeCfIb+G
         wrtDsc7Rdv6nu9Z8fM7D/lA8p0Du8BZ/fB2YXvHNMA/Itpg0CYR+s9YXjwQMXiHw2kx7
         VROw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790784626; x=1791389426; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iRehZjrfjWyoiGL/7MRfV3/j/MJLZDIiqHOFJW1M59A=;
        b=VT2+JgWLgimcuMJsTbAcqj0ioTRNLareIGmaozCqNVC/jj+Sm8DfX2W/RuBeE22Ki8
         TpsiXYdbPC8i3C8muD0LMynycVRlY8NElDv8GidVCJM4tWeqoU5QEMP/nNbyzb8iK4SS
         c0FJnZjUMjPcuX+FenQIiZhGmEZXy066wd20ml4jLzqe+kkBVUbZeniAl9FArxGO81j/
         Uz2aedKkz9NFm/dXamRQ61+M5a2MY43CeexQIDONT5br9STXSicPMSOMBUyhXE2KzgzT
         2Llyi2PWaJKL3c+oCseUh8VCscSD238SM/eAMxtWS9oLqZ8iikAK3q6KkEMSi6nqdXoP
         QfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784626; x=1791389426;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iRehZjrfjWyoiGL/7MRfV3/j/MJLZDIiqHOFJW1M59A=;
        b=uHN14ISrDnVLeQDhnYldVfOuB98Jfk4vY/A9ue0siVrLVfzv0afysimRmWOxQjMRvr
         h4s+0ByQa6Fxmj4GOf7etVEYvvKZk45FmHxP1ZRJD0hvhBTDhNbXG8M36qc7Q/EdPXPU
         Ueq5Oy+GV/f0JAyhjhcNmbBAAaYDZCBN7GfU1ca6wnlvlu5nPsN3Z+m8pH4PQ/Y0lETW
         w+GgazfeoYEXs5vdP+cO5mM4xU/b6rOrOl3HxPgzAHP3ypEQI+NK4Y1j29logcf2vtMu
         WaGQ7ofYOBdX7/SIAHfBkfLg3Nr/MVZHWPbtJS7XxnT02Xcn2gbiIs+PGUErRhAvNAbl
         eUbA==
X-Forwarded-Encrypted: i=1; AKwUvBxac6f+HHyPoLSML0AQrhpyfjTPyShOHwD3Pk5mUiCfnR/U180/x45f2aCrl4Q8Q08MTswaKS7q7PsG29en@vger.kernel.org
X-Gm-Message-State: AFq9FYKamzq6Ihh1D724sB7CuQt0F8SewV0iwX301FugN7JcL2qjKkAA
	vdmCcbGLsr9mRx+n+t1vqQQQ8eDQX2Iw7M3eGtMb8eJKhMSwJwnfWXVpExQbklaMEGbo3leKlUo
	p9hmGuVRBAESdt29blpDEsSlCgDQw/QDlHr7NJoZgRA==
X-Gm-Gg: AYBFou0aIS0ZP6r/GXPkI3HC9cGHqTtwB6SrPRSw+3RyTu2b4rSS5g0+VQdm1cfq5WZ
	3DzqzAl2BImF+Z2v5UuRpI39dBJms5KyNs6HUZ3zutazTdiNeKtdJD1ivJUS4Ug3F7ILqMtb2+e
	Sb43uWCWOjfB8Lit+Uj/qJj9F1qMcx1nWyhEziRfpPAughctgFSLl6w7xgzSE6YJhV7YzRQCQ8i
	LGgXLFGcS1d+N8XOf7PwIudtZcmn/hSotfoBgKAXDRn4+JYUo6Z1t/aBHHT/8S2sVaXmYDR0lO7
	p/TNUfnOMNOVqcO8AJ/7paqFrWwERnpRS8BkZeYAen0mPzcuIJxtAZfeH6BXNDyL
X-Received: by 2002:a05:690c:89:b0:8a9:e801:231c with SMTP id
 00721157ae682-8ac9331841amr6405827b3.20.1790784625575; Wed, 30 Sep 2026
 09:10:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-4-c042266b9eeb@linaro.org> <jwlmzhhgpvbi47lt4biwn4razrvbf2rfi5uyyvfhjomzo7uqyh@ahf4ubqvegst>
In-Reply-To: <jwlmzhhgpvbi47lt4biwn4razrvbf2rfi5uyyvfhjomzo7uqyh@ahf4ubqvegst>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 1 Oct 2026 00:10:13 +0800
X-Gm-Features: AclHuK-jey2UN0A8sWN4rkcybsqPqgekH6oh4yBkzdH-hTkcWanw8jO2ZFUX2MU
Message-ID: <CABymUCP7DMOqN9j2ZWEtDxWpZSbNWbrYzdJ57crsR03hys67mg@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] drm/msm/dsi: Support dual panel use case with
 single CRTC
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2026=E5=B9=B4=
9=E6=9C=8830=E6=97=A5=E5=91=A8=E4=B8=89 00:20=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 27, 2026 at 04:08:43PM +0800, Jun Nie wrote:
> > Support a hardware configuration where two independent DSI panels are
> > driven by a single, synchronous CRTC. This configuration uses a bonded
> > DSI link to provide a unified vblank for both displays.
> >
> > This allows application software to treat the two displays as a single,
> > wide framebuffer with a synchronized refresh cycle, simplifying renderi=
ng
> > logic for side-by-side panel arrangements.
> >
> > At the DSI host level, the frame width for each link must be that of an
> > individual panel. The driver therefore halves the CRTC's horizontal
> > resolution before configuring the DSI host and any DSC encoders, ensuri=
ng
> > each panel receives the correct half of the framebuffer.
>
> I guess, the flag from the previous patch should be coming from the DT
> node of the DSI host. The DSI should then get the mode from a single
> panel and then set the adjusted_mode for the CRTC (note sure how this
> will work for the compositors though).

The original information comes from the panel. Panel driver exposes
the flag to dsi host. Because the panel driver hides all dual physical
panels stuff and exposes a single panel to DRM framework, so it exposes
the doubled mode to DRM framework level too. This simplifies the
handling of 2 physical panels in DRM level and compositors level.
>
>
> Also please note that the are other possible configurations. For
> example, for some time I've had a setup using two Raspberry panels
> attached to two DSI hosts for exactly the same purpose (please check, I
> think Neil might still have it, or maybe somebody else from the team).
> Each channel is an I2C-controlled DSI-to-DPI bridge + a DPI panel. I
> understand that it's not your target, but it's something to keep in
> mind. I'd say, the bare minimum would be to resolve a second bridge (be
> it a full bridge or a panel bridge), possibly create a second bridge
> chain (remember, bridges don't support branching, so you are a bit on
> your own here) and at least manually call the callbacks. This would
> ensure that the second panel (or a second bridge) is properly controlled
> (and thus would get rid of the second reset GPIO from your patches).

I asked Neil but he has no idea on this. Per your description, you have 2
DRM connectors/bridges for 2 physical panels. I guess you have topology:
1 CRTC + 2*(encoder / connector / bridge). The handling of 2 physical
panels falls into DRM level, not inside panel driver as this patch set.
This 2 methodology does not conflict in theory. Do you see and conflict in
implementation?
>
> > The pic_width is used to calculated DSC parameter for DPU DSC controlle=
r
> >  together with panel's parameter. While panel driver that support dual
> > panel shall provide slice_width parameter of single panel. This patch
> > only impact DSC configuration, so crtc is not aware of it and not impac=
ted
> > by it.
> >
> > While the DSI panel driver should manage two panels togehter.
> > 1. During probe, the driver finds the sibling dsi host via device tree
> > phandle and register the 2nd panel to get another mipi_dsi_device.
> > 2. Set dual_panel flag on both mipi_dsi_device.
> > 3. Prepare DSC data per requirement from single panel.
> > 4. All DSI commands should be send on every DSI link.
>
> broadcasting of DSI commands is controlled by the DT flag.

Do you mean the property, qcom,sync-dual-dsi? It is QCOM specific
feature to send DSI commands twice in host driver. It can be done
in panel side as well. The bonus to do in panel side is that the
panel driver is more generic and can work with other SoC in theory.
And the DSI commands can be handled together with regulators
etc for 2 physical panels in a centric way. The panel driver is
more self-contained, minimizing dependency on the dsi host.

>
> > 5. Handle power supply for 2 panels in one shot, the same is true to
> >    brightness.
> > 6. From the CRTC's perspective, the two panels appear as one wide displ=
ay.
> >    The driver exposes a DRM mode where the horizontal timings (hdisplay=
,
> >    hsync_start, etc.) are doubled, while the vertical timings remain th=
ose
> >    of a single panel. Because 2 panels are expected to be mounted in
> >    left/right position.
> >
> > To maintain synchronization, both DSI links are configured to share a
> > single clock source, with the DSI1 controller using the clock provided
> > to DSI0 as below.
> >
> > &mdss_dsi1 {
> >    assigned-clocks =3D <&dispcc DISP_CC_MDSS_BYTE1_CLK_SRC>,
> >                    <&dispcc DISP_CC_MDSS_PCLK1_CLK_SRC>;
> >    assigned-clock-parents =3D <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
> > }
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index e39938fb0f502..a3c56c3dc7904 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -186,6 +186,7 @@ struct msm_dsi_host {
> >       bool registered;
> >       bool power_on;
> >       bool enabled;
> > +     bool is_dual_panel;
> >       int irq;
> >  };
> >
> > @@ -1024,7 +1025,10 @@ static void dsi_timing_setup(struct msm_dsi_host=
 *msm_host, bool is_bonded_dsi)
> >                       return;
> >               }
> >
> > -             dsc->pic_width =3D mode->hdisplay;
> > +             if (msm_host->is_dual_panel)
> > +                     dsc->pic_width =3D hdisplay;
> > +             else
> > +                     dsc->pic_width =3D mode->hdisplay;
> >               dsc->pic_height =3D mode->vdisplay;
> >               DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
> >
> > @@ -1705,6 +1709,7 @@ static int dsi_host_attach(struct mipi_dsi_host *=
host,
> >       if (dsi->lanes > msm_host->num_data_lanes)
> >               return -EINVAL;
> >
> > +     msm_host->is_dual_panel =3D dsi->dual_panel;
> >       msm_host->channel =3D dsi->channel;
> >       msm_host->lanes =3D dsi->lanes;
> >       msm_host->format =3D dsi->format;
> > @@ -2600,6 +2605,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struc=
t mipi_dsi_host *host,
> >       if (!msm_host->dsc)
> >               return MODE_OK;
> >
> > +     if (msm_host->is_dual_panel)
> > +             pic_width =3D mode->hdisplay / 2;
> > +
> >       if (pic_width % dsc->slice_width) {
> >               pr_err("DSI: pic_width %d has to be multiple of slice %d\=
n",
> >                      pic_width, dsc->slice_width);
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry
