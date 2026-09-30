Received: from mail-yx2-f40.google.com (mail-yx2-f40.google.com [74.125.224.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776164EFFAB
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:31:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785911; cv=pass; b=LHquE/lFC0FLXC3XV+rLqK9xmmAY6i+391j1hOyQCXseCxr1Vw+Ro6cNxWAVMMX+JzW7Lq2cu37E5Kas6CKWM7f2BxOBNcJAx0wHCcWAlTdzc7TCHg6I6ftUz2JF7Te7OVjLGASzsuzGMe9s0iet8EvK9wHtnR9RORvGLQy/97c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785911; c=relaxed/simple;
	bh=MA5Z03Ujg7k+1Xpvmgu/oagug0WaGjFD0FDkj7II4qo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sMky6uVz4jkFHNkZih6czY8ptimF9G4AGjgM9ZSrOoeeorCqH73f0eQyTtMPd+t4M0GMqU7sSAL5iwhg28sLincZj9DHnhsct4juypSDWMPdWAlq7jBqWp37jEE4ihComD3d0vORSMlNiWKmRepRTANqUmfaw7XxDr1Vyvb7dHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DYtXWDiB; arc=pass smtp.client-ip=74.125.224.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DYtXWDiB"
Received: by mail-yx2-f40.google.com with SMTP id 956f58d0204a3-6762de1c77eso1160798d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:31:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785908; cv=none;
        d=google.com; s=arc-20260327;
        b=ClGvZicb3seUOd5CbDZO7vln5dJuQCGtnqy8dNETSDBk4j4d6b0ND4/4ZoihaI0evx
         UDvpBfAXUvCTljVMYbWPTUFa6/pdz0t1/MsO6Kf+WerrKiqiblZQtIXI+r7E8vxpjxTj
         T3ZR1rU1A2IKppQAhIVEVAtEoKwSzDVScduKnoCzkbvTk+4tKnElONG4XdopQZ9OiA74
         2OQjH6odufiecBg9XLnxnoHV2zMjClvpWoN8314bDmWEsTgVeMeAh0aCunoZcRXL3f3v
         /HiNWBqHrsRLEpC8Qh2VB9UorOz6v06Dut5QsFId+/OEbeA49kRw7cYR09DYuf0CBfWL
         B68w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kBFSz8Hg+47uuDgA4INkTekVz9fv548HRY4ltJTPkUw=;
        fh=jLSiVJrLP8vy3XT2DSCzWV/jxEcAf2P5tb0aljYwul4=;
        b=oNqNNgBRlNGQ7e9hPTqVP3kRrPjZSTDGDRAmQuE+9/Is3Lx1LlnHR0epE+FwPRClac
         fb4xkgTOGbnJRytbAspAEuATTQ0w7gemfmZozIQZgsHfDtswkceudh2aaLGWhex/YyEs
         5vcMuKk0VuBG/QxE2KW+f7hdGxBTnNMW72MAl03A5MrePTc3S6e+Jg5hS/jX6hdO1tkc
         Z35ZlF/3FjN2oP7RSTx6LnGQabzBYpn0hfYyn/bQoCLb2d3Sgg6okYZnNqS3QlXCVe8U
         sCUsie8pL/Ku5ZlAqAqbJdaqrvt1JR+QX0kx5lyE63UcxvhSvazqyJ4KPb0GCxbHlNnE
         uSnA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790785908; x=1791390708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kBFSz8Hg+47uuDgA4INkTekVz9fv548HRY4ltJTPkUw=;
        b=DYtXWDiBUDM6xXO6F2f59IbfQTkjZM8XBEyoBi966dpqSQuUumWizP2K6+3GmVcvEs
         ySZvpNj/N6hbo9WrfOULPtAqHeAZkC1nDKF7EIWtVdCWHFLAp4mwkLQFlRfDtQiIsKGx
         UEvJPwDFxPVDz5tJj+lPcRfTLN4dJpIdLYAuyoXCVdsv1m1mlfVQgcoMMGUbiPd5602V
         GkddD5ZMtIliRuk26CyndWq1Ewd+5Vk9eezJcfUGx/KOGW2c7HkJcMSo3tN5fID+d+tS
         X4286eBeEw+SQpxqfXy/QoEfxhvLHw3HpT5S5eI8aM5DqEzIfYsuIjn08CpUjkxcYOhd
         ZB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785908; x=1791390708;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kBFSz8Hg+47uuDgA4INkTekVz9fv548HRY4ltJTPkUw=;
        b=AC509HG+doUvbSXBmt14JjHpKm+C7uuzBxR5KZlecTwMSWLopXLVJb+IST5epY04bY
         KFaW5hS5snZfj3q/Y0hmZoeu2xYDSb3PhNhwhsIZhNbHt9Dek8vOYGKdC5LXVt7/ON3N
         4QovqGSltyRJCX1fq813uldFx5Mv/IDyPDl0iYscWmpwBJRqAHTIE511/7466twqwrjQ
         /eABahOWF52Co+mVPGdQbvVpjCqm3bP8tBquSBZpRM8/QWz6jjhKMchtmolJqxr9hYj2
         GJ+di1KwA9vgwaNUdLe6zqKC/5Ot/oNh0BaK3dLYYpwxK4MFzqfUux/SPLz7/Q9rNwCf
         S4nw==
X-Forwarded-Encrypted: i=1; AKwUvBzMwThJ/pzETPKjTSeyE4IYqUGvMF1ooSYmnCxxCx/QZcOKHs3Vxf3SS/UuPjMSgr4ck4GICt5BPno8JXQl@vger.kernel.org
X-Gm-Message-State: AFq9FYJIMKdER7MyWGQAm1cyOOZl84SsmF032HVyZ0lFXMmqWYwxL6VK
	aOaJMu/z0YRFonhbxISb2wzqgdazHHcu1NUY7jC6JANjUhMH+Zl4J7KtPoYTbsHjB3nd7in9sba
	W/AlIEx+3owkHGsASm3ysr9ihjavehSKjk8Kx80O1Fw==
X-Gm-Gg: AYBFou3USVigTo04S63nMAZFLF+5GQzGqC8lxxfl+pdplkSet6mM+5V6X9DzTz0YE9i
	S50dp+LnZu6rBCdiV6iLUFsbTZq1nI0z8SnRWV/tVamTPm+PWglldUKRJkycfLdDY0ITH3c7+Z4
	Y91qI2qFcj1TLl99zVZ3mEASUUkXfQXFp35KZAt/B7WQlPUmyWUGi179T8Iv871ZTh1da+9tC2L
	DZ0uoM3R90fxZNBqBXa1yLWMBnFmv4RjRY6PQZBc7LACECm9ZHPjv7xSZC3S43Eo4LDBG/GlOKM
	+MvPAwBaOgdIRopocIEswV0BLoEz4RgyknMhB1Wd9F05HydTLn/Dty+d5CKZ6r6u
X-Received: by 2002:a05:690e:408b:b0:672:99e1:11e7 with SMTP id
 956f58d0204a3-676834ee0a2mr951729d50.132.1790785908030; Wed, 30 Sep 2026
 09:31:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org> <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com>
In-Reply-To: <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 1 Oct 2026 00:31:37 +0800
X-Gm-Features: AclHuK-Ut7huYikkw-ut_7tEiGgl7jCeAuf3fgmv1fyl04iaoD4uVhF3GKH3maM
Message-ID: <CABymUCN1oxuqPi=s1cpBHvMJorHN62uieD8Pf=Y--WBPp-=NHA@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] drm/panel: Add driver for Synaptics R63455 DSI panel
To: Linus Walleij <linusw@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Linus Walleij <linusw@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8829=E6=97=
=A5=E5=91=A8=E4=BA=8C 21:03=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Jun,
>
> thanks for your patch!
>
> On Mon, Jul 27, 2026 at 10:09=E2=80=AFAM Jun Nie <jun.nie@linaro.org> wro=
te:
>
> > +#define R63455_MF_CMD_ACCESS_PROTECT   0xb0
> > +#define R63455_SEQ_CTL                 0xd6
> > +#define R63455_DSI_CTL                 0xb6
> > +#define R63455_DISP_MODE               0xb7
> > +#define R63455_GEN_OUTPIN_SET          0xb9
> > +#define R63455_DISP_SET1               0xc0
> > +#define R63455_DISP_SET2               0xf1
> > +#define R63455_DISP_SET3               0xc6
> > +#define R63455_DISP_SET3_2             0xcd
> > +#define R63455_DISP_SET4               0xcf
> > +#define R63455_DISP_SET5               0xec
> > +#define R63455_DISP_SET6               0xef
> > +#define R63455_TE_GPIO_CTL             0xbe
> > +#define R63455_PPS_SET                 0xe6
>
> This is more details than we usually get, which is nice.
>
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_MF_CMD_ACCESS_PROTECT=
, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_SEQ_CTL, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx,
> > +                            R63455_DSI_CTL,
> > +                            0x20, 0x6b, 0x80, 0x06, 0x33, 0x9a, 0x00, =
0x1a,
> > +                            0x7a);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_MODE,
> > +                            0x54, 0x00, 0x00, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_GEN_OUTPIN_SET,
> > +                            0xf, 0xe4, 0x00, 0x00, 0x00, 0x00, 0x00, 0=
x00,
> > +                            0xf, 0xb2, 0x00, 0x64);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET3,
> > +                            0x08, 0x70, 0x28, 0x48, 0x00, 0x00, 0x13, =
0x21,
> > +                            0xff, 0x00, 0x0f, 0x01, 0x14, 0x17, 0x00, =
0x00,
> > +                            0x00, 0x02, 0x40, 0x0C, 0x00, 0x00, 0x00, =
0x20,
> > +                            0x00, 0x00, 0x00, 0x40, 0x00, 0x00, 0x70, =
0x08,
> > +                            0xD0, 0x02, 0x21, 0x6F, 0x08, 0x5A, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET1,
> > +                            RTN, 0x86, LE16_BYTE0(VBP), LE16_BYTE1(VBP=
), 0x08,
> > +                            0x70, BE16_BYTE0(VFP), BE16_BYTE1(VFP), 0x=
00,
> > +                            0x00, 0x08, 0x3B, 0x00, 0x00, 0x19, 0x01, =
0x22);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET3_2, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET4,
> > +                            0x8b, 0x00, 0x80, 0x46, 0x61, 0x00, 0x8b);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET5,
> > +                            BE16_BYTE0(VID_VS_DELAY),
> > +                            BE16_BYTE1(VID_VS_DELAY),
> > +                            0x00, 0x00, 0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_DISP_SET6,
> > +                            0x00, 0x24, 0x00, 0x00, 0x1f, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x03, 0x00, 0x00, 0x00, 0x08, 0x00, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x0A, 0x0A, 0x00, 0x00, 0x00, =
0x03,
> > +                            0x1D, 0x01, 0x00, 0x00, 0x00, 0x01, 0x00, =
0x00,
> > +                            0x00, 0x00, 0x01, 0x00, 0x00, 0x00, 0x01, =
0x00,
> > +                            0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, =
0x00,
> > +                            0x00);
> > +       r63455_dsi_write_seq(ctx, dsi_ctx, R63455_TE_GPIO_CTL,
> > +                            0x00, 0x6A, 0x02);
>
> So for the commands above we have a little more knowledge than just
> opaque numbers about what the display controller is doing.
>
> If you have a datasheet for this display controller, then please add some
> one-line comments before each command to explain what is being set
> up.

I hope I had datasheet, but the answer is no. All I have is an init sequenc=
e
with the information in the above macro definition. Let just live with it @=
_@

>
> It still bugs me that we accept this much magic numbers in panel
> drivers but I guess I just take a deep breath and live with it.
>
> Yours,
> Linus Walleij
