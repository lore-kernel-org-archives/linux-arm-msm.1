Received: from mail-yx2-f13.google.com (mail-yx2-f13.google.com [74.125.224.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF524E0B98
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.141
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790776392; cv=pass; b=RRuBvCvKGWMxkVEBk1We083kw7fxo9jlEgKDdrYA0lQsxQdreK6o9jnjjPG7Polu3FnWBuL6L/thY62mc21B2vwd9y6nj1Fjwbn+UwtCB1xPeHcu2WLEwGcMW2fhyNh//P6eW3K/S+5RRyIJiquW9bWxb6NzG4m1QfCF/NVKd9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790776392; c=relaxed/simple;
	bh=7tXfNmQFPthqRgnD+N2jwL6JcbsMYPl/OeD0b/XvCME=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ga8mXzt7x72XE+X07ILMHs8TBD4TbS4yMzQGFXnDuh818JhTX/27yh8wECVUoyRoXJOKJXO8SqjyYiH3VwQhN6mdIMkcuQ3C2h2Zo2rvzcuOcsgRRn5Zi9OqxJD/C8UbuHbYrxGk7E+cV7vGc82qmskw70tWpOE+m7P4wADqEqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZsBKmqyR; arc=pass smtp.client-ip=74.125.224.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZsBKmqyR"
Received: by mail-yx2-f13.google.com with SMTP id 956f58d0204a3-66e50968489so4684082d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:53:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790776379; cv=none;
        d=google.com; s=arc-20260327;
        b=GkHZ5EklLfKcai5noxunniyD7E0/e8xezw/yXcfqm3N+G6VqdCQmfi1pi6au+M+DCo
         SxXE8QFQdLoRGfenqmN3ER2A9sbnyeRvHMlk7VrVGk0plUge/JcVqUg++gitNggMb6dB
         dMSF6zBzdOi9+vtXnkBRxs5f75K7DaDfKT1XfS6DVhQxLJc2WrShEbSu0NEm4NZc9TQa
         0uxKwp4O5PWTFbXsorZt7z7hWN7tXpM+9jJyUBG5j5t+8E3G7LK9kSBUG7fMbg6mvBjq
         vstkTHH5ubSBQ/oC663j6naasNI+bJjV2R36kYWIS8Rzb7RG+nPYuURgH2faOCYk2kdc
         VoSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpNeLRajldsJyb03io5TqUKkBsu82dkOKDvxIHvX4/4=;
        fh=658MVHbgyn46gQX51zPQJM6LXV7Q6cYNU+E+WGsy8e0=;
        b=VLCjqQ52jJVEco/pQLUoIpSMEe0AcNyBB/6buJ9VPnpUcb7PK9Ff1BCy8N9vkzhwzJ
         fii4Mumz3UVzngFYDYXE/sjcFPaxI4AZHcZkrj3pRfjzWBcQPaGiF2j302OIFIyHZunL
         ep8iy73UoND9VscNXqsmR0YPDqfvaTXZU0sqBrPhBna1MgB68suFEXwPjNqQ453dKbEm
         8fLgfLrXW0jUraRJA97yvs9Q4nzsWIqVxsoLkqbNq6H0km780bFKUk4lZjYy9bDb1aOg
         CZFPBjrzCl+6/5CTDRAsWT0Goj3tmGWzZPjXu5xNuqbS/0a2hfN8Y4TltdGqIQXDapcY
         /NWw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790776379; x=1791381179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RpNeLRajldsJyb03io5TqUKkBsu82dkOKDvxIHvX4/4=;
        b=ZsBKmqyRZ6rJ942Mdt4RDpu8ZY8T6cScQSRSFJjTOrrywHu7nAnAYLEe2mzTzFTlHM
         Z61ZlhY/Tz8Yv+w0h2HhaFmPnOxWBLZYXLhCrMwxdJsrVAoCIlLuedrXcqH+B0LrhJgq
         O7kXEordVRtnlc5hsNHT5BIWQokOsmymI4M5RCab07maYZ+65l7T3b7DDsz6mCkuU76s
         o5CcfvouevvKQcIGUQlSpBDP5a3PKJwe5aJT+V25PtCGZXI5fEx7btFyD26NNLx7idir
         dMv1+aqzU51eBhEeydcVbFgaFMYqXRhP6TxaX8qADSWrX+D1L2OA42VOJCE7FDEJeeZ6
         akgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790776379; x=1791381179;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RpNeLRajldsJyb03io5TqUKkBsu82dkOKDvxIHvX4/4=;
        b=Fwyma0cPck7/AD+9Ylg218nsyUB0R33HxJRHrI4GLyiMEyv1lYSWU+87SmtowqnDJq
         gzxT9cZtkXSKk9gb81m009SxnKmafzn/DxY/tEGKG60zXDWeZHD9ZOL5zvYofPRHhzSk
         laAOES28DyKIUUIn/GE8sE7U2329M0Uzbq8qQBbDymcBlYGyGtLtpTHcj7A80CA9vjfN
         97tGYt7KrnIsZ09dsttlTOir+a/IxcJCtuP8dJYjZ+QtEYM14mEfRgaW1RVVq/KmpjgK
         jKOIpshG1dq/cZG1bjHZvf4+b3G3K2uKs1OlrrXwEJU+tJsJKaF5aII+9A6+cFi0/JLl
         RJug==
X-Forwarded-Encrypted: i=1; AKwUvBzykdU868Lwyx9iezeXWwNda4rMftMyFXC2DOPj5Mnwx2xRtbNVpULrhuijd52kPVESF37qhW/YPmLkvUMT@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2jGz6YoTmxQuFKPAwdZB6XSpCk8UTjfaCqfbuIbEK256NkoHa
	YItx0qE1y1Xufzs6w3BYC+QaoMT6L6oXQ3I1nn7h0XxOEDnVMxXIpT2Sw+FWP7ab4OjgMC11FUM
	S08/7SZFtGem+xu4u37MznIQ87f7eYvM3A2+CJEj8eQ==
X-Gm-Gg: AYBFou06XUHFtmoaCxnfmbicMk9pJWQV5S67o/4mlGfkZxRAPcKBcO05jNawk9dckTO
	XexqadmJIrcWbNh/ZmM8FyPRsVbHZcHKDl+7JuVtwx8ufyG2E4D88cq54fS0k+YZ5Le8qQ9DW53
	wNQkngeFj/Tb0cOVbTaX/DGrpc/MoFjmVI4iSqDXaNoFyT8sON2PKpHpsAMKKT4f3o1QaIgB1oJ
	MJK9k/g3rBzld3uNg0YylvWDoJFpYGZkkynceaXWwB2fjLvObjzwcbIIJyB3ZQDnYmUYmAhwsu7
	3lk/xc3jE8oY2Rv1S0dH8nZNu59rBP/kqULYzFkY8/8wqCDuMrWRTpLud0WdMJSI
X-Received: by 2002:a53:bc0b:0:b0:676:24e2:c67e with SMTP id
 956f58d0204a3-6768351ba5fmr612451d50.89.1790776379376; Wed, 30 Sep 2026
 06:52:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org> <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
In-Reply-To: <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 30 Sep 2026 21:52:48 +0800
X-Gm-Features: AclHuK_VxnR8JOsc80IMzuEQ7RuAU15Ps6hnH2uLVe_uy8XWpyeHRK9yzrHieFo
Message-ID: <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel configurations
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
9=E6=9C=8830=E6=97=A5=E5=91=A8=E4=B8=89 00:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> > Some devices treat two independent physical DSI panels as a single
> > logical panel from the CRTC's perspective. However, two separate DSI
> > hosts are still required to drive the panels individually.
> >
> > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > allows a panel driver to inform the DSI host that it is part of a
> > dual-panel setup, enabling the host to coordinate both physical
> > displays as one.
> >
> > This change does not force individual panel driver to manage
> > system-level display topology if the driver does not intended to
> > support dual panel topology. Only the driver that set the flag to
> > true need to take care of panel topology.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  include/drm/drm_mipi_dsi.h | 2 ++
> >  1 file changed, 2 insertions(+)
>
> Do you have a single MIPI DSI device, or are there two independent MIPI
> DSI devices? In the latter case, the flag is wrongly placed.

Yes, there are 2 mipi devices, and 2 mipi hosts. This flag is used for
mipi device
to notify host they are one of dual panels, so that horizontal
configuration(width)
in mipi host can be handled correctly. Where do you suggest to put this fla=
g?
Thanks!

Jun
>
> >
> > diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> > index 2ab651a36115d..889ef1421207a 100644
> > --- a/include/drm/drm_mipi_dsi.h
> > +++ b/include/drm/drm_mipi_dsi.h
> > @@ -169,6 +169,7 @@ struct mipi_dsi_device_info {
> >   * @host: DSI host for this peripheral
> >   * @dev: driver model device node for this peripheral
> >   * @attached: the DSI device has been successfully attached
> > + * @dual_panel: the DSI device is one instance of dual panel
> >   * @name: DSI peripheral chip type
> >   * @channel: virtual channel assigned to the peripheral
> >   * @format: pixel format for video mode
> > @@ -186,6 +187,7 @@ struct mipi_dsi_device {
> >       struct mipi_dsi_host *host;
> >       struct device dev;
> >       bool attached;
> > +     bool dual_panel;
> >
> >       char name[DSI_DEV_NAME_SIZE];
> >       unsigned int channel;
> >
> > --
> > 2.43.0
> >
>
> --
> With best wishes
> Dmitry
