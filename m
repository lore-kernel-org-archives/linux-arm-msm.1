Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AFB48F006
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816072; cv=pass; b=eN3M7hWA6lFkwIMaQKPc5LAHO2Is/vo83y+UpkW8ZOGGOYBIIU38VeiRcrFK9LHaTtBJ2tjokX+jTRcbOYyyCSme+KltBmEROgb1VHCY2Br/jhLulwDBL+hGr3nKgtm5mQwTbVkn3uV+Lg8VwvWwpit/0T+UXWwHpv/CPBqNqB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816072; c=relaxed/simple;
	bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7qmHkZ1mFWJ0M71kmiXFzLM+G6emxhgAtQSUc7Rhlt16IFbsaKuEHcdqKobA6WFPn/sX23/Qzz9v7rNrYDaOG5UtUNmVvYMdW/jQYbTJdJRxwRuSDHsT9Lu+lT14PLTFZzQZ+qea7ZRyep3JVwFMgQGIhlogq1jkATRAhSdxMA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFpS74P8; arc=pass smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFpS74P8"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-67718201466so1277549d50.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:41:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791816070; cv=none;
        d=google.com; s=arc-20260327;
        b=eLAyjDvZxHWBL+nb+5EtenufgjC5KBkHyPz0bXlHOrP5g4Bqg2/mNYlGGh9/Pk4vBr
         EXtZQq6jQNBM9KFwO2QG3penNcszFk2DEwPotgJC5c5yfFoe/E6jYSrWHaXFmB4JHZjZ
         pzahVEDAt2T2JKxZVwmNrl0FSNRgsQTYo3mQ1B/QgOQCwNyT/1hyIXg7Evt9olbVmJJc
         loOH1FG4MIPAy0aU9bFfd4dyGjs1mHklfIs6lBhViKPbj0DeWgHGyyHb+/mWDCXmLdIA
         9ARvSncf5f+rIdjacgRWsiwrebyMXRjJVKFabnT2S4FHHM+W9ohxExTDyo/M2oUh/7KI
         9eiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
        fh=xOsS904ERflq1XP5kp1//tdoN9Ro73owtKeBkDZqgh8=;
        b=mF20beCOkd+ymIqDXzfbyXgNu86K0jeEysg3UQPfzzclxF9cmKpW8RZWd/uW2KqnsP
         OOQy4vT2uWd1BPepssx7ztOWmKUxU7oI2P374q1ojSt+UWlloI/7AQndknYL8CCtHncB
         gLyMIxDvo/YCcQM9GzpUabRqTgJBJUbU+n8YtzSHiPD15BHb91Ozuzx2nE5Gxig6/yaN
         dHcI5624aUOY9qcgKZxLqTIX4jvHxnEe7kyxzkckC+t8RcDh51CohdMFHD6T16XYVKJ0
         eQVtdiiuIJ/Wscheg4a/7+M5D7Iazu049ShmOcWRaAWktcIhumSwRx6gKMiCjOeKprCl
         8dBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791816070; x=1792420870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
        b=kFpS74P8ZDdCA26nVw04HM42OMf1cNkn/VJPpG16VpzwruZD1f16lkLbP3D8IOQveM
         kqeZyLSjmlNvtIo/rw/MoI3HDASxAPajiF9NRA/DIuaIXgBpmCbjvxSS/t5rp3k9JgWc
         R/nRpgdbpSxlO/srnTFQUNb/aku5rSYDpgBxVPwxO/SFJnQkHmWXjQw9gLbwVgRaFeeg
         y9ncthHN5jFtZD9FpbD51sxYx59Mdd0uKwIO2JboQema9E4RO9zUwySwBJRmoV358t7O
         cpBNNLV6jUVqQLhUOPwpBETLp9CsP2BGPBBkCSr5XKCmEpQGw3AY7cYw5sR8ile7ftjp
         6YKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816070; x=1792420870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hVt+2VZkW4XSaJKirxsUTpM7f+JQAOjlXtbg/RMP49g=;
        b=QMdQPslCe+kym78iZxWnMpXFxpd74UWsV+8tRQ0cX3FnGobm29ESQ8BTQyyoCPqU7o
         eTBlxuzJJUV9S5uuDCREtjR3SNV29euDvrnBDMZIcuLzy12z3ZG5aXcseml3mN6DhSDM
         Pwn2Z1EUt/nu9D9vdavQlPBEOrESIpkUULw7Qu8838JtkDMs7cDUcChmf9nZLiNiiKXp
         +hp5A5s4lAmSDreaw+g6aXIPz+5Zmm8W+d8mkr6lnAfeNKHYXy23P+iDd0zUnAv7ABw6
         3Mb42qzwFD477hMv5QCeIWaFK98whCmFABKQpykEkBI/0wsacDmSO8RiGEtnJ/CROugg
         ab5A==
X-Forwarded-Encrypted: i=1; AKwUvBwEkBjhZU8XbtOgX59CcD3FUKgQJaVwmoj5lvTEanUER/3S5+SBbO0xp68y13nUF6svfDgli7SPK56R1dyz@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7OyINYp+Nn3AZTChkcyEzBByY3y2vzC42QHR5E2j7gCHjtnEW
	PFmjGc9Ql62F2wMG4WulccoZGpmVoa2V3ftomOA4M1PeSpytej8YDKVYW/eopCWxRuc4BUlZvUG
	Yv66haZG805sBRHq3DybBEoW95xgosbbubydNZ9qqvA==
X-Gm-Gg: AYBFou3Pu2wZ0OZALr7/bgJ0pYYaZrTPL9Mx1lM8+xLioJV+l+vZsvuRASx7LcxJHZK
	dVkZzXn+ok0xx8uZRatDA4REwIQpz2R5s4qRYQvQbbm3cU8kR4ouERaAfYJ+3UqUurSRxyzkuJx
	S83OuudrzbgPcfKpc3q76fq48uZ9qZeZPZqrGq3k6xrAvNLI4wGChD+Lg8djORpR9MjwiisKvul
	2bfKqfwVn/LBBunlRbx6lY+tKgsIaZlmeGvjGLPXvr7Tp0GTb7xeQre41rzija0h73qzjpwgyv7
	nYTi/XTmPr966mHoojnz0WIf5CD41WzS9S2ZpBgq39FOmfW2k1YdGDgxIMKECfv9
X-Received: by 2002:a05:690e:1907:b0:66f:b528:cc51 with SMTP id
 956f58d0204a3-6793698594fmr4322156d50.21.1791816067411; Mon, 12 Oct 2026
 07:41:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-6-c042266b9eeb@linaro.org>
 <CAD++jLm2dVVKM075MDoStTudO+2hdECS-XucFiMGnM1H-Xk=TA@mail.gmail.com>
 <CABymUCN1oxuqPi=s1cpBHvMJorHN62uieD8Pf=Y--WBPp-=NHA@mail.gmail.com> <CAD++jLnkr+M9Tn_zAL8+owO7H706XYSMosSz-1D20rwbUukQ3A@mail.gmail.com>
In-Reply-To: <CAD++jLnkr+M9Tn_zAL8+owO7H706XYSMosSz-1D20rwbUukQ3A@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 12 Oct 2026 22:40:56 +0800
X-Gm-Features: AclHuK8DXIfIQSpEn-02OXtKO750H1QIkJhmjnTnvXTflrGk6XkO0SctyamV-mw
Message-ID: <CABymUCNzxWhud1qtv3os=f2txZ=nrTdMrQ6BOYkbfK87D=AnHQ@mail.gmail.com>
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

Linus Walleij <linusw@kernel.org> =E4=BA=8E2026=E5=B9=B410=E6=9C=881=E6=97=
=A5=E5=91=A8=E5=9B=9B 03:49=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Sep 30, 2026 at 6:31=E2=80=AFPM Jun Nie <jun.nie@linaro.org> wrot=
e:
> > > On Mon, Jul 27, 2026 at 10:09=E2=80=AFAM Jun Nie <jun.nie@linaro.org>=
 wrote:
>
> > > If you have a datasheet for this display controller, then please add =
some
> > > one-line comments before each command to explain what is being set
> > > up.
> >
> > I hope I had datasheet, but the answer is no. All I have is an init seq=
uence
> > with the information in the above macro definition. Let just live with =
it @_@
>
> I would send the message "upward" that you need a proper datasheet
> for this, from whoever wants this to happen.
>
> I have seen from the presentation that you will be working on
> compensation for chromatic aberration for this device, and that is only
> going to have a point if the color representation on the display can be
> trusted to begin with. Which means
> gamma correction. (Which we don't yet support in the panels,
> but hey, another opportunity to be first!)
>
> Gamma is invariably going to be one of these
> "magic commands", at that point of depth you really need the manual
> to see what is going on.
>
> Yours,
> Linus Walleij

Compensation for chromatic aberration can be done either on the GPU,
or display controller, or by panel. As long as the R/G/B channel
can be processed individually, that's enough for the aberration. I will
work on the solution with processing inside the display controller. So ther=
e
is no dependency on this specific panel.

Jun
