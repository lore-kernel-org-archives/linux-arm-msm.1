Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9A43A7F47
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 19:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789240073; cv=pass; b=IHy9gIIlHxq+udkNVqisyjoqVpdwEZ6egpDgkys2nt2jU5U7p0S2XnSOwkf0i6kMXUttVR+Pug6g3BoXhh701gF9KtGymQ9Z9hXQmS42/qhlxgvoZ/a4AXt1zi2H7X8HuuVe52MxTPvo+E2ku/jOs55sce+en5jtTpCRlQ98iUo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789240073; c=relaxed/simple;
	bh=vBGRoQcJXlxAMtSg/Ev+xruoEjdajUUrjRvI4ba6Pgw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DWD205Y5aCrimH/5v1Uk8V6WBEUZ/2DHT7fHzXDg7ExbFKiL4AvwzQwtRPqtQLbvDMeM8ZJVT2sjzqJV3XotN40ItPZECKvUbPIDe/AzWwUGWLEUVCAztzY6ntwa9j4JnIBkYN/Aw4s78p1Jv2OEoIE0+wlOhzLecAcfvFOQgb0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JkapOxgQ; arc=pass smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JkapOxgQ"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8588583a7c3so18474287b3.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 12:07:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789240070; cv=none;
        d=google.com; s=arc-20260327;
        b=DCDGIqcWLEIsLABPtsY+9Z0zGm7iXPPvrZLIjAjOvDQi+Id30QXVPelhiU2OnHr1NL
         cLY/NS1b27kLfNiqxEHZ1e4kAtWRQwgR7NsT0H5YPIfpKG7SGtKSCdLIFPCglzBv7J65
         SUjQPrLjfnNj2aVqnG9e/phZShSdQDUP7y2pqedIaNWLdFlAaJL+4O7+KNvVdL07syy3
         UfwWvcalh+KJkmbi/zrgF3mut2UV0tsM5hUf30bMLsYlZS4ygV6fNpHlVOkRhaKQbA8s
         26h21gVr5UoUtOADNjK52v5ZFCng8GekLY/RN+BnQoKO5mPtf+KCgjTzzH1x76h1vo7U
         V2gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        fh=F0f61hcHeLXTOsfFT8i29U+lTd3fFWs7Ucmaa1O6sao=;
        b=Xn+itY4LVAGpq81VnA4h21kEILaO5MeMBV9COoJOEuG+X06v44rQpz1SnbJSzTAu7M
         NnvkWVn8Bno/nlOOnxe15t9IQ6FTJupGy+UjiQj0BfQl7AuuUVzDvCg7F6f6HUlwmHcD
         WGW+XAqXFTfxxDnbt4mlMZg3xOKFNt1fJQKPibG4pEOj2kW4jgtXB1eMGocbXXqFEVDS
         nY5tAPUbV+JyYUoifwWBu2BZWDGLxt1DMV5ki3MrH29WRB6cHGBGIXPQhtbJKs70D26g
         netUnEzN1GHTBgkK8OIr0ygMd2TZ3u4cY28pO1YtSG24it6IzpSX9EaUxzEMRFJv04MQ
         qAcg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789240070; x=1789844870; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=JkapOxgQXv5ET8Qb94XeyLO5pdOFXllOR0Q2jHzDfQFmE5TApts78X36dzgsP4lV2F
         AJpPEUcDjvOL9fMptDgklbypBepaL7YvWJbxaU730rnc/MoZzNy6Mhu2h+zxGE+CJc5M
         k2hgcKXkNs6qxCDziHeQObBXqeI0kQpb+nlsaaUMYz0ugBeDOBKsSZK1/hu3sLnnrDSq
         hf6LcnHprhEv4+71lL8LrKSogYSjPi/n9si1jW/+mhYjriYOk1P037UAE/S8G2X5R7av
         pmPULYCr5onjsvJKFLbXL0cmoqgxlAq4gzR6aQ/7jJhtlhxPZVHM9fSYbghe748bl4rL
         qYZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789240070; x=1789844870;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=frZxPsvBVeqqB8BxzOhZbWb1UNk2/xKGtRE4rwWtWZ0=;
        b=IQFUHO5nDYbIQMKdomh9+bB+AeJC8c3aBPxcEFhUjdbVcbrqM5OvPNw73IVXoN58ew
         o2Ks8Pdbnpwa8PndU4Xtks7/abjSjH9kDaVQJ8/zjD2vfAuEoSh62+M4mjaMcxyYvnld
         ocs3vL3H1WwmGav3e6lw3SaDRIqvNyKDOfwwFp1cSoBuSD3jbsSFtexBDKwvrWntXoM3
         v5G65VPCpZaHSp4cW1qFqMeLIo3RNtG/QjgjqOlWfXtCRWV6HcL6Zo7B+JaK19r94KXw
         2vpx+aT2w45tkImcdul6typSb+8HB0wY1NoVQLyDPmGj3ZrOpJjRqY6PfiYhWpkH6fOw
         ADgA==
X-Forwarded-Encrypted: i=1; AKwUvBxtJUgCagDnXbvikoq1IclUz5RLTUCsWzJkf4nRubctfDuz5UNNx+GCtg2pukfHDt4zSiI2iIRoN5POhY4F@vger.kernel.org
X-Gm-Message-State: AFuF++n+KpAlGwpjh9ORCfSOfPTc3Ywg9EtAl6npfA3GWILoA9x/TEzS
	pqUOI5tEw8r6+q2j6yaLXyIFQQDAACExhTX8Zc8QtnPg3N8ZVOdrTVOhU4ZINN3EtZ2eneJTAsB
	KbZuN9jgtnzrvRCmStBxBt6s6DIggh18=
X-Gm-Gg: AYBFou22vSyf+3ZydkssxdFBQFKN8qu2Yo3yfVbFW7mq819UQreZ9Ha+rMZ+rT7kGCV
	uz4n+IWtm9GBT1EUc+t3Hj+UU/phTb0g5bYWuerC2+D+Z2JB+NcmmKVFbRzuq9YcI5seuV5Swqf
	vXqQuSOaq+I+8jVm2xdTOxIFiZW3KrglA//fCvWX+3THMgl7GDHsxlu0TE1coLnFXCIuaXhF5EF
	jS+YREgcoDbBysii4cz+kK3u/paSUoe7XhpdzyK6jBJCQLqypbggeTO+cVjWk4U8ZY1VowVOsJ3
	m/C05MCNEP6rVjmw4R0LoPFkfHlYnCPutcPUUv4rAJ8b+0sF5Prv
X-Received: by 2002:a05:690c:a790:b0:873:5bb2:6c0a with SMTP id
 00721157ae682-884b6f29b6bmr21177167b3.52.1789240070580; Sat, 12 Sep 2026
 12:07:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260906061755.5103-1-sumeet4linux@gmail.com> <20260906061755.5103-5-sumeet4linux@gmail.com>
 <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
In-Reply-To: <98a0dbf7-9724-4ccc-8810-645dfe715656@kernel.org>
From: Sumeet Pawnikar <sumeet4linux@gmail.com>
Date: Sun, 13 Sep 2026 00:37:38 +0530
X-Gm-Features: AcwNN1XqTP8GoNHaMkR4dokovXZ0UiUGTDkYaF2EyUFt2qLbm2siHwKKSL9BVhQ
Message-ID: <CAJ9orWStxJLN-0Dk2LqmyxEagC_nH-veS7wWrN_kXvb6WEUWiw@mail.gmail.com>
Subject: Re: [PATCH 4/5] devfreq: Use %pe to print error pointers symbolically
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
> >               ret =3D -EPROBE_DEFER;
> > -             dev_err(dev, "failed to add devfreq device: %ld\n",
> > -                     PTR_ERR(drv->devfreq));
> > +             dev_err(dev, "failed to add devfreq device: %pe\n",
> > +                     drv->devfreq);
>
> Instead you should use dev_err_probe and drop the last argument.
>
Sure. I'll do this suggested usage of dev_err_probe in different patch
series for *_probe() functions update.

Planning to post V2 for this original series to use %pe to print the
error pointers symbolically, reverting the change for dev_err under
*_porbe() function.

Thanks,
Sumeet.

>
> Best regards,
> Krzysztof
