Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A095E43E06A
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787581581; cv=pass; b=T++35qCMNivRcCE82NzrYhRYShKSVeMmUE3cEto5zjb5oJ8VO9ULQwlBq2Ecr7ofG8x1eUpazYDcqlc+d4YYbaLjcSspz5mfGbEDA8keaE13OJ05VqrqdsgrD6KO9DuKzNBtcF6xbBdeMBq+Ovs3WOKnW0Cfo755C7R+okeaddg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787581581; c=relaxed/simple;
	bh=g6YG7ebYQXB3bRpGj/OB4nhiGkj6yamYDPhaSzTu1Rw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U1tey7S+wZkJLxM2BfMbTVRfJje30MEAtt5g5pOcIupHFfL7cgMhWOpWTTQ0usCnr5mNRP4aDUgBq6abwS0Ivt4LiAmj6hUk7bM7mt2FD+IplY4DkbxI+FRXfmFGVJzgxBmCyYZI60x3RRps7O1meEAgGLjybTmwG3WH99wng8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n1oYoH4d; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n1oYoH4d"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c20fb91ed0fso541781966b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:26:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787581578; cv=none;
        d=google.com; s=arc-20260327;
        b=n/QcTu/Ge0dm0s4N9NDh7z+YqZqEL6NTV4/YYHyaN+gLRCAp62bR6u8Q5V+/F8TlgQ
         nH4cBdUD7L3bfNznpn/3D8oyGgOgGE/FSy7DZqhOD5iIXuvR2yUrJrL7q3XuYw7KNK7D
         kI5yjwPV4LRVlFXClBPQtjSRZINj8/I45egP2GhgOnLofaIGip/x2FrOvhqvoWRPOGs3
         H70SbDAgp2ZH+oIgkFAkEW75HHnNMBh6KlyQQKejGQpr51+60HrvXoKzh3TPsDyQoQdg
         vivdMU/c4lT+5XDJUfqV+e9FrAhomgY1mo7AdqgRSuEcrIoRHc/kscEnzvgBo6WaMHkh
         OgCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xKq0tTixvb6fNGgIvXcGGKjXYqHTulwy/M2vtC3qFIk=;
        fh=r1e4uYlfebQEbIKIBqJj2sxWiBVbebPCOBpqff6/xB0=;
        b=q7kNse7ukN+B+Qd84yKqbV4gNqJBMrflSXKAH+2P5DKqE4oeuLMk5NM9lqlWUGCWcs
         PjeMvluqHywdaOPT7fwI/fQPU/HHobgnV4OYOM9yOV41T1MzOckjj5rK6kqLN/3F9vRJ
         gM/qkB/no9U7ADrGNUJoAYCgNJOTOth2HPellT/8JUJ+eRGB9oxoju0NAM1rxdp5Mp74
         P8DLBl2lU0k+JqJqdxlkkhmwHmX6rCe4M0DuFCa2ZxGtipwf8o3eynNQtz4K1fMAR4if
         NxvC7e816eyhQQm2wVTmUnHTFu2zmyXvyHg71RgJCWU3e3Yb77HzBAgv51JLFE+QEb9w
         +oqA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787581578; x=1788186378; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xKq0tTixvb6fNGgIvXcGGKjXYqHTulwy/M2vtC3qFIk=;
        b=n1oYoH4dUCRj3F9ZgC3yBwfZexnJT8/KJhMCduQEU1+cJaA9tU+5SvkjfbWSTe6a+U
         +fFySSiAmkV+2cbe0eknWQ2nmqO71qEFOlZ/JEPOAq/jT4NLmdPnGTSPZuD5EGwliEHq
         o6w95odqn4McNp/DtoWDr4tLSS9/0VZWgLUq4YFzx50XPKsr9QNIDCNlYlwvHtK55Fjx
         TMkdcmJfxBqdqX+0ZxWdOXBOMUk49a4nEYpQmG7BE1YjncK/En3+JBapAukgCV/7zE1R
         GLRpOmMG61umcPPFDrePpyN/sKrMg2Fv93hBC8d2ll106GksjIdZvW86EM0bfXqfE13+
         QMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787581578; x=1788186378;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xKq0tTixvb6fNGgIvXcGGKjXYqHTulwy/M2vtC3qFIk=;
        b=PNUaqzkBeki6c+Yv2iAS5BxpIntiW+GcagGbz6quHDT/yczwi4LK0DFaTv3Bul+EAS
         fej3ATTYhNfJ5t+YwhDWa8Bicht6skgG43p3uuuUg9KsX1qpJJQhZGiXFElQXUjmuo0r
         +fuNYCMBX0xmme6hNFv50cfwHy1/6oVYmVYdwcNz9Yul1h5YI0FqmMLkkn76ysLuo0J3
         9tAzu+JNJoS059vp582bxD3n30G1ys1OJtbNCnkFaBMWNsqhovv9k4ps0R0ax4wvq5zg
         vG4qkBpsotbmuDqhiYOAGxX4t+pblbxuvcC6izUe3Q7yC8nNudjj+YogqYp5AKEu1u3e
         pAog==
X-Forwarded-Encrypted: i=1; AHgh+Rq51NgYJ9XHbiwidbzKwZV6yTGAIg/YVQQUMlD9XeGElYuSpknZQSAIkNkHxbzYY2M5ddoOAQ4aDtpPmg7z@vger.kernel.org
X-Gm-Message-State: AFuF++nx2ZOT6jgR8XCzhQDcg1v9MRqgWt3kcEon9xo4LeAyFN7ZHsHk
	hnezakNqu7uwtEp3zn7/iQaYTN9WPVjbbL2G5RTJXbBPueIMZa4RSuq6pgPJY6TjsKrgaY/pQ1q
	s1mHHpzqav/Ur/IA/d9fxHoYWKcLt1XQ=
X-Gm-Gg: AR+sD11/vIbf25C+SWHxok3py6Fo8NO9uAE2yKvul+N/8/g8w79DQQkPqmSxK1tTjls
	GHizCAqcHPGs46JAbZBS+4PKLZE0lylACH+LAZsvRyqXl4zfRHafclMxYbVBR4ntLzdhiJA0H20
	L90IJByig2cb8UYZb3amvjzHQNoA3xpzjVP14WciQ7pT34blZPialtK68MW/FlUa/daFRgfsE2w
	mS3O79AbPlW1QOESM1Q02OqAk8ivYbrEcfnCchMEvi0aw9VGFqqHzA97dUHp/sYDrYcUdKcyyCt
	41lfPwQhOeh5RiybFK0+ueNhUxGj7PWZBi/nVCCiP2dc7mWQs3PV6jFBfoJXYx3PRU544BHRzLr
	/CLpqhwhLPQo8
X-Received: by 2002:a17:907:97c1:b0:c1c:64d4:5ba3 with SMTP id
 a640c23a62f3a-c246a651d39mr3008695466b.20.1787581577574; Mon, 24 Aug 2026
 07:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
 <20260824130437.2771-5-sreeshankar0910@gmail.com> <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
 <CAA-+ukJT1=RYfTFsRvkTsN+Yca5yhgS+1xS=Gb1HmFWaSQM2Sg@mail.gmail.com>
In-Reply-To: <CAA-+ukJT1=RYfTFsRvkTsN+Yca5yhgS+1xS=Gb1HmFWaSQM2Sg@mail.gmail.com>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 24 Aug 2026 19:56:06 +0530
X-Gm-Features: AcwNN1WD7-RHPqzMcCh82DKazoZZTBj7FvE-P3djUsyLE_onjNfXG89rO_KrT4Y
Message-ID: <CAA-+uk++=6z0Ri1drTEKT-geGDU5ZFv2aQusC7ZLs-Pwf87B1Q@mail.gmail.com>
Subject: Re: [PATCH v5 04/13] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7250
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	rafael@kernel.org, viresh.kumar@linaro.org, konradybcio@kernel.org, 
	tglx@kernel.org, ulfh@kernel.org, bmasney@redhat.com, radu@rendec.net, 
	lpieralisi@kernel.org, taniya.das@oss.qualcomm.com, danila@mainlining.org, 
	davidwronek@gmail.com, mani@kernel.org, robimarko@gmail.com, 
	linux@gurudas.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Aug 2026 at 19:45, Sreeshankar K <sreeshankar0910@gmail.com> wrote:
>
> Thanks for the review.
>
> Missed that, I apologize. I will send a v6 patchset with everything fixed.
>
> Thanks,
> Sreeshankar K
>
> On Mon, 24 Aug 2026 at 19:21, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
> >
> > On 26-08-24 13:04:28, Sreeshankar K wrote:
> > > Add support for the global clock controller found on SM7250
> > > based devices. This should allow most non-multimedia device
> > > drivers to probe and control their clocks.
> > >
> > > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > > ---
> > >  drivers/clk/qcom/Kconfig      |    9 +
> > >  drivers/clk/qcom/Makefile     |    1 +
> > >  drivers/clk/qcom/gcc-sm7250.c | 2275 +++++++++++++++++++++++++++++++++
> > >  3 files changed, 2285 insertions(+)
> > >  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
> >
> > [...]
> >
> > > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> > > new file mode 100644
> > > index 000000000..bf75c8ec1
> > > --- /dev/null
> > > +++ b/drivers/clk/qcom/gcc-sm7250.c
> > > @@ -0,0 +1,2275 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> > > + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> > > + */
> > > +
> > > +
> >
> > [...]
> >
> > > +static struct clk_alpha_pll gpll0 = {
> > > +     .offset = 0x0,
> > > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > > +     .clkr = {
> > > +             .enable_reg = 0x52010,
> > > +             .enable_mask = BIT(0),
> > > +             .hw.init = &(struct clk_init_data){
> >
> > You missed my other comment from v4.
> >
> > const here and everywhere else.
> >
> > It is always a good practice to compare to other (older) drivers from
> > upstream.
> >
> > > +                     .name = "gpll0",
> > > +                     .parent_data = &(const struct clk_parent_data){
> > > +                             .index = DT_BI_TCXO,
> > > +                     },
> > > +                     .num_parents = 1,
> > > +                     .ops = &clk_alpha_pll_fixed_lucid_ops,
> > > +             },
> > > +     },
> > > +};
> > > +
> >
> > [...]

Thanks for the review.

Missed that, I apologize. I will send a v6 patchset with everything fixed.

Thanks,
Sreeshankar K
