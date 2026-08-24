Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4B942DA4D
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787580923; cv=pass; b=nEfutc6/ISUb/0Yorc4YMTZZdO+U6mJoZBUxYJhKnnm0Q5rowqosmHUwgvc5IKBeU3Cz+D5QxNCZuPTedDiS+Sjdau/tu/waRg9YKtTYBFRDolH+A2+JOAPAre+GTznDM8lCVArD66RnA8ZZxpqvpixY/T2Npf8pqB8UtAyS+rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787580923; c=relaxed/simple;
	bh=0kks+j63StSPlXTF3OV31d0II5QMTMM20avDv0cE8Uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T7cW2IePdEYLSGCYPqdUNT9whALU/pd0s2edSIgK/2lR/qTZ/XICz9Tpwg8iAuXpc8QGFrqCj0Ak1SFtyfGvKZNK1pcyuXd9QC0PJCP5WwU9j+VjUTlYMH8Sal3z2S6sRMK0kbAafSvcRJZMzPx4vxvMQQvvJ96+AqxIZvDzP8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IDGJJ78F; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IDGJJ78F"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2074710751so636194166b.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 07:15:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787580919; cv=none;
        d=google.com; s=arc-20260327;
        b=o5UUrn2tCH2mWFfSo9QvWljtHNVE4/4BDX0EJOT/NxwgkDsVOQi09W4IYfvWxrnzRG
         4ZG39c4H5HT/4QP5NBeVPdUadWAIDuQwa/LeZMZfv94dhBMK+DXJBWAPnKlKQks4UtU6
         gLdQZY/++Reqljxi3iV/6ojVRWMUr5oJpmuptOd+yDTk7yhm5fQfgCuxICbYqriN/db2
         haFHDu57l/iuGFdjQUP1ATZWdK9HNJxGoRwL6M33tR3K5k+BLhaUh+e1jApVosHgoHC3
         6HKNy7IfwUOlPz8wHWxa3BnNqP0RM78bdOgtE174NAKO346VOkZhrW+Hq9nUsy8k8RDH
         dcJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=FrjX2y5M6BTYXuv5wkBHtI4BXsIYAL02A5EG/qzfCHQ=;
        fh=8CbjcpgrgJUU3fUlhzbIbtNY+C0O2FpAYOK2H10pizM=;
        b=FpU2ODzku2W+/0hTxGYJsJlfXjlhAAKsrrWfREwmciMEmITHc3afP0P0/RTnrON33H
         j/cr3mtY+5HpYiO9dRbWplXE/DmS0BINvS4e9ezfEfVFYnD4OGW9W1USrNk1NIgcqKIt
         YohpZ4c5mbSWy7G9ssqloKxGwE0nNnBSCFRBjmNu4cuiMa+ig86yQDd7IYzZds8JhXOI
         jk3M8ok1VKhnyfcAeMXlSY/RD79R2RISmwilOJscFiZuyrPGOtjlT3Sfw+3abFcWnWYY
         nfEV+Ir5NPRUQ25txaONvOFR/Z3Ga3m0q5RAW3mqjSro1x5nOvge1Qd9/fJ6yIviQDSm
         qxrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787580919; x=1788185719; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FrjX2y5M6BTYXuv5wkBHtI4BXsIYAL02A5EG/qzfCHQ=;
        b=IDGJJ78F3Ipc9tB0nbEffHy2jfdT1CrCCk4hIeHeL02LxT0clK4aILUCWwf2BolUbr
         wxOMh2hBeW+7aJ1e9wNd3P+Hn3H1M773HuZi1a9uORkh3kauQNk66E9VImH2UnISY+du
         H/zJedVRgM0APaG+w34ig2+9rvrfyHyCf8XtBv1mh3c1umdjzmjBsmHQ/0Wq3Qama6ff
         +xhTGOqAbKhkOiWQm82qhjQqy+ls6ciwXytomojpFytyOWDJyFeSar4DdF6CyNrRxpgz
         x33NlK9pJkVxTMVNaQzeTtnAgtlawn8Wze9sSXH2KsQgydBZS2VbU7qbClJljw6MIkgM
         wNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787580919; x=1788185719;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FrjX2y5M6BTYXuv5wkBHtI4BXsIYAL02A5EG/qzfCHQ=;
        b=CQAeJvasNQOIjEikPq0q2eyt8wXwlw4C12IuuBBK68XVU1zXj90wIH5D3kLVF7Xu+o
         NkF/UyXnjCH2PtPI4HjmSR9vo1CZmZtkCijyiM5XBTVblqfZ1Xs1ykmjW33Rdud4PAFp
         evzJWJ9+Kk02QFr0zI6nvymDgYgy3TgcZiTzI19t3DOU1FRvo4+qzpSWCp8JpbdJo9UQ
         OukZIzJZBMH45901pzsjrHPpSV8s7BUfejek0TgLDORnrzaBZR3xnGzHITTHHXu/fdcs
         B4kxoHYJ8ziEPuandYc5JvYTrdywfS+j8KhtUicT+tV38SMBaNpPTHND8YCZrQ4TZlL7
         A2iw==
X-Forwarded-Encrypted: i=1; AHgh+Rq7DoPTJ8argK8q3I10MzO8vsLyoYKvr71XsdBpYTnwFkzCcF9fJUNN6GIuvGFIQtVLUfqB2J1GWX79rQbZ@vger.kernel.org
X-Gm-Message-State: AFuF++nLXDJzlTmiWW3nMZj9HX5+118ASAfMyrNDL9J+G31ywk9QE0yw
	/D2Lk0lKdXZbvV3fZQl6nvwfRd3/koWuFC71jzJlH1MRHcnku2irHQHAoo1xVECig/eyAmzNUZk
	0YclcWKgeFLigsgVhJq+tgyL4dXZ4nqA=
X-Gm-Gg: AR+sD13bdUEqCC3gZkTgWbxmd8wffrf4nP2dOSsr0k/OrnNjmTe+QyIPAiodNFBU3+p
	Ogf8kBgIjLYz0Rl5m9aS0iQSh/lJq6v1v6wxx1lKPEA3na0Dcw/6V3hGg1eJfp4Jx2kWAJ4qjTB
	cB+WdW/T55OVoBAMecgRbYr7i5pAieU2lVoplLmHUoIWHS9lImzMzedwGNp4lZFyugK0PbQD298
	ZhfDv7gH5vLFCnIeeT4cF/b4o/8jCXzB0Gqncmi6jbr4PMOjvttiuaLC+DpxIX7HdjxcyLz3O+N
	5r+lNxzW8wjt9//6x/oMreWp+lOH7TVhrgwyvq0FTT2z6jKnOvv2B732B++1WoGdg+7oJnYii2N
	U5A==
X-Received: by 2002:a17:907:3e9d:b0:c20:f4ee:7c97 with SMTP id
 a640c23a62f3a-c2491c2846cmr2216363566b.5.1787580918870; Mon, 24 Aug 2026
 07:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824130437.2771-1-sreeshankar0910@gmail.com>
 <20260824130437.2771-5-sreeshankar0910@gmail.com> <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
In-Reply-To: <5ybg37jlklgrkxseu24xytbom3v3rnzbwpudg7jftr6g3oqvo5@x4sfjci7v7m3>
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Mon, 24 Aug 2026 19:45:07 +0530
X-Gm-Features: AcwNN1WcsnGQSHLRyuZJ-yHONrPiOQJH8iqD06u4L2i4WB6_vuJbh1UpdH1J-_0
Message-ID: <CAA-+ukJT1=RYfTFsRvkTsN+Yca5yhgS+1xS=Gb1HmFWaSQM2Sg@mail.gmail.com>
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

Thanks for the review.

Missed that, I apologize. I will send a v6 patchset with everything fixed.

Thanks,
Sreeshankar K

On Mon, 24 Aug 2026 at 19:21, Abel Vesa <abel.vesa@oss.qualcomm.com> wrote:
>
> On 26-08-24 13:04:28, Sreeshankar K wrote:
> > Add support for the global clock controller found on SM7250
> > based devices. This should allow most non-multimedia device
> > drivers to probe and control their clocks.
> >
> > Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
> > ---
> >  drivers/clk/qcom/Kconfig      |    9 +
> >  drivers/clk/qcom/Makefile     |    1 +
> >  drivers/clk/qcom/gcc-sm7250.c | 2275 +++++++++++++++++++++++++++++++++
> >  3 files changed, 2285 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gcc-sm7250.c
>
> [...]
>
> > diff --git a/drivers/clk/qcom/gcc-sm7250.c b/drivers/clk/qcom/gcc-sm7250.c
> > new file mode 100644
> > index 000000000..bf75c8ec1
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gcc-sm7250.c
> > @@ -0,0 +1,2275 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
> > + */
> > +
> > +
>
> [...]
>
> > +static struct clk_alpha_pll gpll0 = {
> > +     .offset = 0x0,
> > +     .regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID],
> > +     .clkr = {
> > +             .enable_reg = 0x52010,
> > +             .enable_mask = BIT(0),
> > +             .hw.init = &(struct clk_init_data){
>
> You missed my other comment from v4.
>
> const here and everywhere else.
>
> It is always a good practice to compare to other (older) drivers from
> upstream.
>
> > +                     .name = "gpll0",
> > +                     .parent_data = &(const struct clk_parent_data){
> > +                             .index = DT_BI_TCXO,
> > +                     },
> > +                     .num_parents = 1,
> > +                     .ops = &clk_alpha_pll_fixed_lucid_ops,
> > +             },
> > +     },
> > +};
> > +
>
> [...]
