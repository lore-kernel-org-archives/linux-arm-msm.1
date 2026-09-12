Received: from mail-yx2-f12.google.com (mail-yx2-f12.google.com [74.125.224.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5969357D1D
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 19:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240238; cv=pass; b=ObTFimwt+64aGBvrImCgE7+LlAD7SD7mBWC9LYsob4y7Af2rUXQ1NuR7UjoV78OD/GL6/GhxMkCB9Gv2uSyvmYXaj4gPIcsYkek5NlsbZnFnErBa/2pMDZdv/hWj/8IAxb/MCijZJKbvkqFEeEL2OXDbmXwlAp0t0fGcLKXqyd8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240238; c=relaxed/simple;
	bh=nC1HlSANXwPCu0TdcZsZ/ITYqsAJked312qQsvhydMU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wsmq5drOvW8pMYo2USSCDSViJl8EQzM3g6hf6iE2oIJE7yIthSn9TLniNpNvT8HDMoJ7uCL77H6q3ciyb6wobOwhmkfvK1vRveInJxAJB2LsFqsLJ0vi2QH73l0vdHp4CtNegZT9YOFGzyXMh9as2GEoe7X3GV2RLpQtYEEVdPg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UM3eExt7; arc=pass smtp.client-ip=74.125.224.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UM3eExt7"
Received: by mail-yx2-f12.google.com with SMTP id 00721157ae682-85d43da99easo9279757b3.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240234; cv=none;
        d=google.com; s=arc-20260327;
        b=VuCyykGtL9hpqz05sJxXzrTq3V2S5yipu1heHaaB7uzkfy53byzPkVeAIUZlLZaWQa
         ICIBx2M4Vo0oipv9RcW5UzC57maKocQ6UtPcbgf1/a+RyFTVwmxYkgInRl2KfkXWF+Yb
         qn+ZDJ6A52QmFFH73c12D7Jf51HZeFibZXYsbOKKkkUOmyGYtVcPueugva1ZnBtsmS6+
         +t/QRl/3rr8FVRZ8RaNz8nyQwTCCWyoJTFBLsCmhZDZHQLvq4XAJiTAGvXr3x+TpLL0a
         QMvxArkeTTGWeWw1jeBmAfZs3kbYfKTlendv2BucL/VElfdYhoBV7nIPvnTq3RAQo78j
         EgDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        fh=gH3oMEQxw3rE+trmHcIG7dKsrF8Fkn7LS+1BJDD8jJg=;
        b=Y+yHCHgwEWwhRk5AdNJJ8WMKa7AqdLv4/uyoWGKUQFVokxxFIHBeidts7KzSCCk5Un
         xiR7gKhWF/3fpcrxq3TmCObxb8MuySDe10AaCCS83/nc0CoRvGAIO4efw5GMaUnEuhqZ
         EtWeSHZNh37gNieJggapqHo+ix99Erivx/g863Sd3T2MwCgmBl6O0Wq3cCiAcGLh8qQo
         lsxGNLi+DnY+A027bVw8KVq276+6lB1XK1pz/JD5MAdNIDAGRkwbpSrCQQLD5rmDQSqo
         hf+Q+m6uNvy1I3l3Txp3obbpu5o67tIMqiGDx1DghahcVBQyYDw4qNTfrauJA/mKWkx4
         S3Cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240234; x=1789845034; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=UM3eExt7dIEMPJGPVysCGiZoJvVhl544RBXMSKbBfawBd4i4ZIIrytcZCFRMvLVM3d
         5eiLXNBDNhGUMAKnG6+WP65Yk3S5t/+rAwzH/7NjWzps65qzaYK5evMfM2Ot0BwfJKKV
         Ur9kMpPKFdo6S1W2rH2aAcvBKX0zTWg5fXJq+vpV0d9RLgrOa+S+PC9HyUoFTSQCjtFd
         JD4zSgPlW2NuoroUQpoOJwihbV7zD0Cg/GWE0WN2p7DYdnNKSzI3g+aNV8qr42Zoe0Gk
         JFif1loFi4gJt8pMKaQWUrcfxAo0tHc55cAf0+3XSSY9XfGaK7lJQrhx3Hx1KnuPFD73
         RZ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240234; x=1789845034;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daj75kJ6ldxZJz9wLYTKbQQmIUWSVox4tdaNBDn6j84=;
        b=ehm76d/m92bPRum4AiwssE60sx4CpkZcQgV6TOwrttyetD6jcVijY6fW0ZQLBbmyQw
         /gEmhkAf1SV8UMSR1Gdd/2VWjbq3yRqb9p3vWWdiR2hWzKu/q4pRiT/2pVC4z+3YXDrk
         Fir88YJhazaONeIa3VyAC1IEsWa47Sbbetg4MVS8cEyWWfVPkj15Td/r1gv0bQeX74fZ
         DF+YhiucRxHugo3QkDq9vkhC4Kz1gFH2nYVSB6WzEgiFY2qEbZHjuzxhzWMl66J5WOg2
         m2hox1qGkA1kD+/c3tKCXXUsDWV02ZjY9tbK5IbVNJq7yE+DPtSibjfXoZidVGiubVQH
         PtmA==
X-Forwarded-Encrypted: i=1; AKwUvBw3VUos0EQct17/d5W6fIE1ARzcUzoy/fl9sjB2Ltnm2urKxivjg5I7+1lnhHsDBXH8+73UexBS/n8DTJnb@vger.kernel.org
X-Gm-Message-State: AFuF++m0VpSdF+ErC3kQAHsB+clhA9u0x/w0Sek4/L2BU30LSkGfw2AQ
	So4qnfrBhX6ky2z9unk7vRtSYPQb76JNx443OYaf5fW4rSYzi8fPSJIDz7JMHG8TCx/jZ1PNaOG
	pBEVa6QRZxzK+pkMsvg+q/m9qOYXaV7A=
X-Gm-Gg: AYBFou1kp/Emk2vLcPou2/xAK0PezqXmaKp4JydTZOtK4bVp3FfN6iYLABXDDFO6W43
	/JMFV3mQlyIhaEyd7zNT7MC86nrBTbGSYGJa36LGHlszSBGcZ+RSIs022joCwsz0V/tA0Krd63u
	mGIPpwar3T452bs1+xusJaV184iJhq0AVFV19HVb9Wd/v8lOY950YG9cjjZvTmvulSeiSr5pMR1
	oO6fR7qhNYqGVaAUUtAAHgGtVNGioGNdlcPS/Unp4PfNz9aW2r7HFTbHQkkdpSnvOeLAONREp2y
	WSKdS7+ccUeMzqDaxRvoqycmxxH2hqlBHksOueU8/yMSXEueZ7/m
X-Received: by 2002:a05:690c:9a91:b0:873:5bd1:98b5 with SMTP id
 00721157ae682-884b200e9d9mr29464677b3.39.1789240234520; Sat, 12 Sep 2026
 12:10:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-6-sumeet4linux@gmail.com>
 <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
In-Reply-To: <1a5fb9bb-d057-4579-8b2c-b81aa16a61cb@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:40:23 +0530
X-Gm-Features: AcwNN1WFgZ6qmRCXqz0Ywv_tzPCCXsJ0jqSiA_xFTFPzs4rsV6HyVJPe6GfuozM
Message-ID: <CAJ9orWRgatqn5gLx5+eDu7-T4s2PWcoVQPvuyMBgEp-KwDwkfQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] power: Use %pe to print error pointers symbolically
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: rafael@kernel.org, amit.kachhap@gmail.com, daniel.lezcano@kernel.org, 
	thara.gopinath@gmail.com, talel@amazon.com, hayashi.kunihiko@socionext.com, 
	mhiramat@kernel.org, mmayer@broadcom.com, viresh.kumar@linaro.org, 
	sumitg@nvidia.com, peter.griffin@linaro.org, myungjoo.ham@samsung.com, 
	kyungmin.park@samsung.com, cw00.choi@samsung.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, sven@kernel.org, j@jannau.net, 
	marcan@marcan.st, casey.connolly@linaro.org, sre@kernel.org, wens@kernel.org, 
	t.schramm@manjaro.org, bcm-kernel-feedback-list@broadcom.com, 
	linux-samsung-soc@vger.kernel.org, kernel@pengutronix.de, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 6, 2026 at 12:00=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 06/09/2026 08:17, Sumeet Pawnikar wrote:
> >       }
> > diff --git a/drivers/power/supply/cw2015_battery.c b/drivers/power/supp=
ly/cw2015_battery.c
> > index 1bcb60cf763d..48643f7bf503 100644
> > --- a/drivers/power/supply/cw2015_battery.c
> > +++ b/drivers/power/supply/cw2015_battery.c
> > @@ -658,8 +658,8 @@ static int cw_bat_probe(struct i2c_client *client)
> >
> >       cw_bat->regmap =3D devm_regmap_init_i2c(client, &cw2015_regmap_co=
nfig);
> >       if (IS_ERR(cw_bat->regmap)) {
> > -             dev_err(cw_bat->dev, "Failed to allocate regmap: %ld\n",
> > -                     PTR_ERR(cw_bat->regmap));
> > +             dev_err(cw_bat->dev, "Failed to allocate regmap: %pe\n",
> > +                     cw_bat->regmap);
> >               return PTR_ERR(cw_bat->regmap);
>
> return dev_err_probe
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

As of now reverting the change for dev_err under *_porbe() function
and planning to post V2 for this original series to use %pe for review.

Thanks,
Sumeet.

> Best regards,
> Krzysztof
