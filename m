Received: from mail-yx2-f32.google.com (mail-yx2-f32.google.com [74.125.224.160])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CE8511180
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.160
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790785598; cv=pass; b=cGMiblQT0b2w2n2TQT+EmG3dzREZrdtHOj/7lxzlb4J+vfhpTimyxv7ApL78lbcjYqSnz57CnDZHABkH7kInuKHAA7ygVNrp48VoacwiicdUg50aMD9RCSOwkntF8t1UIkG9ydiwelJXQvxwhMenhbTIbohEPjvDe82AXrmvWik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790785598; c=relaxed/simple;
	bh=WK/XpWKPIWOEnWF+g+kKFp9YCg+P+PyUPeF7SMSzQdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lin3kssRrEPS9j8hgRrZKqG0v2U6/m+UcV/pA0W2H6oSXqkNVn8uPI5++0BBlJrsdfVyegsHGvO09oiVY2InUC5UIp8pcoEIrPqIuklV7qf5pXLoc3vcewzmRh1yj8202hqQXYZHeqdTScU2q6tj7HJ73osp3W3n9t0FOQ6oP1s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZhyXr3yw; arc=pass smtp.client-ip=74.125.224.160
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZhyXr3yw"
Received: by mail-yx2-f32.google.com with SMTP id 00721157ae682-8ac4967f1c9so9773177b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:26:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790785592; cv=none;
        d=google.com; s=arc-20260327;
        b=Js/ynuYv6rbZKyCiYsmcb5GWFtO63Sd2+FO3INF8yamWeSaqhD/pl85cvQi4fOD+On
         xXK3rOiC8bWhmEgRK/l2iXU+KGeIjRLQko+GiGn21mvhVA3XTOxuqK9SPuBsP/WQ7XhP
         uT9ZRrky+gthPHfck8JbwGukyPFGirSsbWVbuQJ58sKtqQ24zZMVIceoeNF41m8uGC3Y
         EfMUE7+2djFMTvQ4JnVG+vbdeC2seOAavk5TEGXaNqufMiYUw+HhUrRFVQQtt/zjzBbN
         sKr2pXIMrY8CMV4ncWIo7aKyIbRAcfzvEvh4vLpQo3pagGmvnZA7iL3gb5gNNJzjEvA8
         J29w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IhetewjBy/ZOEbYKEMiflEbYSnDNrXKR9ujhYIYqZ9Q=;
        fh=ReQBpYiShY7W3CJgHXOG9CCzNX7X8SvsTkgP0p5vxgo=;
        b=F00xgqnvqa0mvn0KereBUu7o7OrnCuPz/MeGDIZjyASG24iaDtGH+ZHSIeebJNQxrX
         RNLEimLgjTPsJj4YWvajtl7v3qsIKX+6fuysOKKKNbn3leh9sNGM0P4JAqqWSsIuUxvG
         EUUmk9urwwyNm71IKoQ0cdFSdq38HDM3E7cbZMlWBkKITEMhDA4MfZg93b9arvum3unu
         FS552im/6Fto0/0Mb+sSPuQeJOiniBpIpnhNFjuhRlU75kF3+iaFjPhpXfEa0iGeWco3
         Jpx34r1c6QyYSZw74sFhEBDmAUjolbf6te9EuB88w52wqmT68P4MB2kfBvdaT5/q3TCq
         4dHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790785592; x=1791390392; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IhetewjBy/ZOEbYKEMiflEbYSnDNrXKR9ujhYIYqZ9Q=;
        b=ZhyXr3yw98Rkn00AbBd+D7MOSoewuPpH0kd6CtJU/EoO5pRm6gY9oCO1yePWqVz5ot
         gO8UhHkm3nh1Pn8OMQkQPWFUpDPCwfSe4LZ7hgWlpxDFDRr11RtEYcz5FWmdP2wcMRNP
         wxr+3+6c72g8BDjFhewiz1VxxIxofV7Rt/A4STV9SWFTA2MdCaPvUiqNLM16mWKXyf11
         62i5FfpBHZu7gnW5FRZNwnHES1gbpU6ZmIJ94FgsRjzJ8KMT0A0A/3JrR1e3Vtfzm80/
         kW2TL3No5jON6hHxU3M+KEJVSDshDO2kqT7zG51IW2ARvjWrP8oDXbmON0HrkJKEwcAO
         0+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790785592; x=1791390392;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IhetewjBy/ZOEbYKEMiflEbYSnDNrXKR9ujhYIYqZ9Q=;
        b=jS8w4xwrWIybWnrzwNBob1eRhXe4hprHzMtOKjnjUwM+OfwWBtHeB6VIwoqcu5BuLp
         l1HKPWvJLoyCrgtXCTY7/XMxKi5Cak6tQL8mU9JAVFFiyjDaCDAHG5LuU40y13nNtkdY
         jOt8qsTyjmP8pdJgOp5sTgEXCq6sYR4vowwN9vx9Ppk4D75hPnsAwvymEW3SxAOWmURK
         Y2W/ZobIRLQB9HyKq1vpNF22hJCkZgsGoYzNSTnYjnDJVFuiNYyyy1WZ23xe29B7c1Cb
         hPLpMYdaGhrsquhmPF4AMQMEo7OSILUoxvFQZeF3tvkgULpdskxbLXZopV7iIsIhBopo
         mWqA==
X-Forwarded-Encrypted: i=1; AKwUvBxaD+683NY2eanAvmqazhfyV2QCFblZKJ2U51qvckzVUCe4VAH/wDTMj0xox/kicuU65jLp0Cfy4+gbr/6F@vger.kernel.org
X-Gm-Message-State: AFq9FYKUB6FUk7149/RYoQYzF0t4RqoQau7t5McnEbWPjEjKNHT6BLEn
	u15LSQweWxcCp+C/kpo8ck4BszhztZ+e5Dr6/ZOMToE/5uVkunxT7J5yMj3w7LV0xD7AaqONDeo
	KtfYwQZCpaqRIwHJTCVqftfElP77BH8BU9h2RZKJi9w==
X-Gm-Gg: AYBFou0im0tFwY0W1X6MkL0mWPnpeXPnko5tD39+Di0NKfifM3JKE6ndyEccmw/kTX4
	pNnTlwUcby1/lC3VKwyAYaf8cZFh09pFZuMG3E+Sxp6+Q2DNobaAoMGw6/FheKRLozls8mYSctp
	PvECKji23HTpiIaSA9uqJpoyv835JGhbO+cKF5K1O26KRKujwNVAJCJrL8PsHtYG4J23w8AImuT
	ja2er+GKMbGIazfI5hX9MfXqJm4jztFfLS7ZdvEdrJpWIHF2DWv/kB4rAHhnyyH/5UDM2Vt6RnD
	O3HHERywRHNGNUOOR5KlPepjVpHoFkks+Es+e3NZ77SwAtIcqcL5dsU/0AdmacUZ
X-Received: by 2002:a05:690c:e205:10b0:8a8:8945:c3ce with SMTP id
 00721157ae682-8ac92d31f55mr6394247b3.63.1790785591578; Wed, 30 Sep 2026
 09:26:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-5-c042266b9eeb@linaro.org>
 <20260727-spotted-winged-mantis-7aa1ce@quoll> <CAD++jLkX0m6_GJd4Pd1Ko4tghta4AXQ5ALZpLe_x-3xxqu1Cvw@mail.gmail.com>
 <668e83d0-a017-4f59-bc76-bf6c9a80b5ba@kernel.org> <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
In-Reply-To: <CAD++jLkyEPY5cFg_pHb71yG52iLwS9tQDpcHu=TTBknQMeFctw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 1 Oct 2026 00:26:19 +0800
X-Gm-Features: AclHuK8qxVxvhel2lglijF9Rc5ozZymwHXuo3kOm52fjKYrNUnWjF5DWZXE12Tg
Message-ID: <CABymUCP0Wk+wogyj=8CJJ5qrGtw6qe_FihB5vuSxBc1wVd37sA@mail.gmail.com>
Subject: Re: [PATCH v5 5/6] dt-bindings: display: Add Synaptics R63455 panel support
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
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

Linus Walleij <linusw@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8830=E6=97=
=A5=E5=91=A8=E4=B8=89 15:44=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Sep 29, 2026 at 3:35=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
>
> > This entire binding seems like stitching two devices together, which
> > might be fine (I don't even remember this stuff... two months old) or
> > might be artificial grouping of separate devices.
>
> I think that's a good point and fair pushback.
>
> Neil and Jun talk about it yesterday at XDC (1:15 into the stream):
> https://www.youtube.com/watch?v=3D6tNGW8PoSzw
>
> The current binding does not reflect the physical topology of the
> actual device, and the bindings need improvements. I have a feeling
> there is one display controller with two physical panels.

Sorry to confuse you. There are 2 r63455 DSI controllers for 2 physical
panels. This patch set aims to hide 2 set of DSI host/device and
associated backlight/power/reset handling in a single panel driver. So
that it is much simpler for DRM CRTC/connector and compositor to
handle 2 physical panels, just as they handle a single panel. No change
is expected at all.

>
> In that case I think it's better if we do:
>
> panel: panel@0 {
>     /* This is the two-panel package with one display controller */
>     compatible =3D "sharp,ls026b3sa06", "synaptics,r63455";
>     reg =3D <0>;
>     #address-cells =3D <1>;
>     #size-cells =3D <0>;
>
>     panel@0 {
>         reset-gpios =3D <&pm8550_gpios 3 GPIO_ACTIVE_HIGH>;
>         reg =3D <0>;
>          ....
>     };
>
>     panel@1 {
>         reset-gpios =3D <&pm8550_gpios 11 GPIO_ACTIVE_HIGH>;
>         reg =3D <1>;
>         ....
>     };
>
> ...
> };
>
>
> Yours,
> Linus Walleij
