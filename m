Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A165631F9B4
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785313044; cv=pass; b=csmxF+THBoFg9XcDmm7bh8ZYrzjzDbow92YEfg/txkVy1eTtlZuczePuXZhPx2vJpj2tyvYJZeb+72WYggeusVQhUgqDyT4kUX/qGlPTdg66qZf5fHIA4eVlr/g4h8AHnSihS4MNEqrJeC7vlspxtO1A13rYgTxiK/etTgUx1ic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785313044; c=relaxed/simple;
	bh=l4JsZotX6Rb/ZGZLRDjIYLspHxiktvwSAQJuBdfSCdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ApgIl6Xa1/threZ9LmjPOdBEFvdhimLGjUvQ2D0TKoCgD7iUbW8WWURtIL5XiPF+kw60brDRpLQjJxA2nw63cvP0gs1EaLaI5y97MZNPsa1JXn9kiPI/Xm+HAeM2nb08kGufKIkrxnZPsOmEnxjsZYbNMLm3ELGFr0DxFuxBvnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=diAqbiOz; arc=pass smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="diAqbiOz"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-6611669cd16so867437d50.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:17:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785313041; cv=none;
        d=google.com; s=arc-20260327;
        b=gE++hzVZldFFY9ib23LH90zkkyl4nCyL267UtoWu3ikuq3hGyITEr+bJKqKcS3iaVi
         AgnhaqYd5LNmAbp/c2T6belnbyOyhgUdIp6U8GpmWaJU5Tg9ha3Nx4cwH/X8Tw8PdlfH
         h1gZ8RNDuqSv+vaVjdXuN2xmUYehY0vHYne564s2Hs06i2UG1IZGrk+0aA6q5PDv3ZHt
         ocE/M/D8fWXoztOeKo5B72s283Oy1GZgetRW/zPmPvNLjNUOo7NxMQKJz2eCyNS/ZlmF
         0pknv9xEKRpoaZmxdCII57WSwUkP2Dv975BUs/6OzyP4t1TMkRxInOHjtZm7zHIEiePb
         xG+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WEqhopWknuqx85ckMTtGRckp0jJiYMoXslq0KHJVS3w=;
        fh=c516+9FtB3krQTnimsZ1MsQtwhhFkv8zLXHcsEe5pKA=;
        b=NXoMCd7KsgSzp4bXxXSYNpB2C5h42yZxXAyPOrK3/+Gzpf0z13k8hy5kKThZd8tK+E
         HSWy+PKTClBjlG0FiKW9fzeZtFHk6XVwzKvNVeJAiTI+SoYAH2+JnK44rAIO4ihT0vCz
         8SG8OiVjYFJsKT2csA5NLqkwZw4U2tYpYVhfX8o+VURxNU0ZkOMBgAprDmrFTt87UHKX
         wQDDnBs0g0ZtOxG65cniPic0RhhTNFBbdBP6kZVekwmrlzR9+19bdKShBGNO7r0kj/bk
         ODSNexxcrd3Y+nkQyXkuExBvCYji3tEzwxDtwgMzcusJ7seoucx+/s0/0PIWAgLorrnE
         rfAQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785313041; x=1785917841; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WEqhopWknuqx85ckMTtGRckp0jJiYMoXslq0KHJVS3w=;
        b=diAqbiOzpCacdI/9Xzg3PGwi3M5YIlKE/bZvFsvI/Iij0iIsG0zsVGYoAs5bFU5574
         3Q9e71B58YFEVwUiISjyNnH5hUGBAfxTcG/cS24t1qyKGHMl2A6h+fBzm/XNBfsgxAWU
         SJNin0nm+OxzdJ8FqAq/NVe/tkea5FwkeA2tmvEU1lChHB2ZUcCE/SAc44loUAjt++Px
         KsT0K2UM5cH9zxWiuIXJEkF7mvFc7bzX2LyH49jspMUnFSThQRqNVv7js2PwtTxH6xFN
         +uOySWutQ2oshaG23levk7Gx+CrqE4wmpb5TINW/oK7z6oMTHLmeKsq6E8tGRmyaClei
         fcaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785313041; x=1785917841;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEqhopWknuqx85ckMTtGRckp0jJiYMoXslq0KHJVS3w=;
        b=lEt9yQdBKwZPEOQxLxJj4bfxpeQ5BRcYuYldMqLfv8n1MA2EL1blVJui4oEzNXgxEp
         JqclqTeJ+q3e/SP+AO0lOWv0Vs2B6DywVYX4r6X4gPNLnCQyDnX0QDgCp+zSD0B+39qQ
         uhPEpAZgmtuesKKmhONoLxE9F2wRCgxB4ZFotEkLTaAvkj7moV5pAY8w0Fg2kV/eDhwl
         X8bXu1Fe9Za2N7/C73rVAfzeiV+TldDTGoGORqbvMrn0Jlt1l2AeWPogkQfcFWFxuMtr
         k5LQP1r7r9UntnR4AXSnJ2EsypC1syhebj5Lt54wXO51WBPT9mCtrWHbib0PLRlnZaLN
         3d6A==
X-Forwarded-Encrypted: i=1; AHgh+RqvuDh5QV8fVpRtMLha9h6srsIEqzBBvuvcns35dwmUj1sEIRandyTf7jgpEXCHf8FBPyR+7tT99JHqpOkc@vger.kernel.org
X-Gm-Message-State: AOJu0YwLPFNLDkU7gz1OdccGSVu0yceAL+KqL9GtjuQAP1y13EB5UUhx
	KeFT6MPRJDlB93fO/HhJXpUWyOzeANHthLQsLiV8tJlvcwv6KV92fVho1UJBxtl9JqjrRG9xKmo
	fm2wjZFPnZgwKke08vwdG1Sjz0Su60g2Tq5NI+0mAiA==
X-Gm-Gg: AR+sD10To/SxWR+zZLCXDalBoRwSzpIPsbfC+exiIbLWu360WwMnpuIfwA7sVocCjDU
	pEfQ39LyIBI07PnObc/MtABdqx6tlUosEYcnONnrt2He8KkjhFuhfjVJi8BfSvNwlWn6oc6UMe3
	exDBCV3RRYvDyha521ahlpVqSFfMymomh4wg9SOg/0Rng4VxpDf4xw+HssMkJaXyr/LfhPX2AoF
	OFCXEVqN/BaHN6hotDgDQNgaeyZK853ZTOfMqNwLJk0ULgB+6x6rbiqFf2WcGhAdC0vfKzTxAa9
	axKx/IGIQlrtoNaN4+Gm8ktZXTkgrlLgizZKazfGOI+K6AoN
X-Received: by 2002:a53:c750:0:b0:664:f751:4b59 with SMTP id
 956f58d0204a3-669057f6a66mr1929474d50.51.1785313041424; Wed, 29 Jul 2026
 01:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-1-c042266b9eeb@linaro.org>
 <20260727-stirring-miraculous-nautilus-e22bda@quoll> <CABymUCNm8_KNgh+6wKH_PO0Y=N6kxfMxOrWsq=wZZQY9vX2kkA@mail.gmail.com>
 <e7767824-33f4-4601-9b85-8bdc64cb4d4e@kernel.org>
In-Reply-To: <e7767824-33f4-4601-9b85-8bdc64cb4d4e@kernel.org>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 29 Jul 2026 16:17:09 +0800
X-Gm-Features: AUfX_mw9Cu6yAJcPR1V0IIlGNQ-386b7zdVy8vAzfi4FAjHtDNsP_9Xp1j66v-I
Message-ID: <CABymUCOTurnQzSnBHknT_EJ4Hd-BBScebSbA0g2ZhzH0ih7Qnw@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] dt-bindings: display: panel: Modify reset gpio
 number constrain
To: Krzysztof Kozlowski <krzk@kernel.org>
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

Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B47=E6=9C=8829=E6=
=97=A5=E5=91=A8=E4=B8=89 16:05=E5=86=99=E9=81=93=EF=BC=9A
>
> On 29/07/2026 10:01, Jun Nie wrote:
> > Krzysztof Kozlowski <krzk@kernel.org> =E4=BA=8E2026=E5=B9=B47=E6=9C=882=
8=E6=97=A5=E5=91=A8=E4=BA=8C 04:23=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> On Mon, Jul 27, 2026 at 04:08:40PM +0800, Jun Nie wrote:
> >>> Some panel support 2 reset gpio, such as Synaptics R63455. So modify =
the
> >>
> >> There is no such binding for R63455.
> >>
> >>> number constrain of gpio to 1 to avoid check failure.
> >>
> >> What check failure? Please paste actual warnings (but not fake ones).
> >>
> > It is a review warning from sashiko.
> > - [Low] The `reset-gpios` property's `maxItems: 2` constraint
> > conflicts with the strictly enforced `maxItems: 1` inherited from
> > `panel-common.yaml`.
>
> I don't understand what comment from sashiko has something to do with
> some check failure.
>
> Anyway, we do not create commits because of some review. We write them
> because there is a reason related to code, products etc.
>
> >
> >>>
> >>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >>> ---
> >>>  Documentation/devicetree/bindings/display/panel/panel-common.yaml | =
2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/display/panel/panel-co=
mmon.yaml b/Documentation/devicetree/bindings/display/panel/panel-common.ya=
ml
> >>> index 087415753d606..7c450d2799808 100644
> >>> --- a/Documentation/devicetree/bindings/display/panel/panel-common.ya=
ml
> >>> +++ b/Documentation/devicetree/bindings/display/panel/panel-common.ya=
ml
> >>> @@ -119,7 +119,7 @@ properties:
> >>>        confused with a backlight enable signal.
> >>>
> >>>    reset-gpios:
> >>> -    maxItems: 1
> >>> +    minItems: 1
> >>
> >> I do not get why all bindings now get completely flexible number of
> >> resets. I am pretty sure not all of them constrain that. It's rather
> >> your task to check it and explain in commit msg.
> >>
> >> For example the second random I took to check (ILI7807S) does not
> >> restrict, so you just made that binding accepting 1000 reset lines. Wh=
y?
> >
> > I just want to extend the maxItems from 1 to 2 for my case. Do you have
> > any suggestion? Thanks!
>
> I understand what you wanted, but you did not do that. You changed the
> property for every case.
>
So changing to this is OK?     maxItems: 2

Regards,
Jun
