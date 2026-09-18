Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D4050E595
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 15:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789747128; cv=none; b=OpNOatGmwHiwVFieT/yO4VUqM+hdrw5y4IGHgKUtF9Qj6TlUL+Oe+P7rAtcyjHvl1YsHZmmtrzAx8dqxZlXQO1xLWSlrMfqYrjMzuO5pTewNxFYhfr+Iww3jYjo/Pr0C7K5nApK3Y0l+43r3O2sv9mFfiZF4VBQf7rC4yXYDjfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789747128; c=relaxed/simple;
	bh=k6iD2D2etMihq1Ed/Z2D6Mnz744U4yuQqMUM1sM4K3I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OPAdCyfdJ3iIuaxyAgecDoidtBvV9u7Ukgc51Kp61IbZiXObIz6cumhxumz93AfDT1aUaXji1jBOGIEkff42uQ/RmljHMhxuce5CIJJqBg9noycQ1E8f0iMreNuCcWZQ1SYAIkPanEuOXwTpQL99bU45WV6pqmgz8UOOasHklvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=iN3bq48t; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="iN3bq48t"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cc9f581c4so3730885e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:58:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789747124; x=1790351924; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=k6iD2D2etMihq1Ed/Z2D6Mnz744U4yuQqMUM1sM4K3I=;
        b=iN3bq48tlNrunPRtgjFkjHM4AQ4/oH2tuiZTIoQEtQDEEcKoYBONQUVBrbkbDD7X+O
         yQo6MYyOdTofXubCwQpQDGmOT2v1HUA2iOpFnpKAwE2ZaY1cw4aYhooSdIWT+ppmrZ2l
         mrrpkmHnO/SPN+/tush/TNFuUD5MZ5heHXtw2mXjeoqmpWRloJMP0TQkPEoZKxfpZ5XF
         YWRodSb+PzDdcb2+DCx2Tlebeq4z5QOq4yPoGEs6aiLYGLl4fbyggGphDobBDlGVCtNB
         W97ajsZhH8HDhFr7A+cIvwtOAkUz+2bVqjeMDWQ17Kw+jyGqELtjUI4meFo8nEZZi96d
         7cUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789747124; x=1790351924;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k6iD2D2etMihq1Ed/Z2D6Mnz744U4yuQqMUM1sM4K3I=;
        b=X6bOCCY/wZ69bx8Gj6k/JTWKrbX6fqjM2cu0w6MGTSFzlUXO51/kvDoTCyNFKLPqRC
         uNUOiFqKBtQ+SUjdsyNT/PgZWdh3hZRa9j7gsMUBpLJIwJIsWVVBxEGBrxItjaZmtBEC
         Qe83ljMGkUCIuL9yeIdrdP4ngt3TpYW6p1kd/MLu8rotZSR1nKr/GNZfgZof0+B5VhDl
         yAuO68YD/IXC1PDlBugz+qqC22wcpPGLVzmPEahRcuR27GGkustIksKrYCta42u0aHjM
         3YcVJqunVsXiJUZbcRh00hbLtV3RMKiiJE0uwKXhmHBG3+LIfKJ2clDZHP4fm3HDwUyP
         RM4Q==
X-Forwarded-Encrypted: i=1; AKwUvBxFs59z6Xwll20tFg2m2li4m+NEzGPeDc6vTgBuyGVVGp+OG8NI2a1kILwbPc8U925i/PvCg5E4C9Ue6Mns@vger.kernel.org
X-Gm-Message-State: AFuF++lMqXNe+HF5W/EYgP/jfEX0tB8i46pQfr75QWN9hVj/eLFgx3Fb
	jx+IdUI7mE00d/3ooXFBA6movl564mXEvsJKObg4VNPveb2skNd1gEJro0BoL5XUHBs=
X-Gm-Gg: AYBFou2/keAqP+0TIJcKNuZYebY3E7ybIeLYD2vuTjtcaJAx+Vv1lxSX5tZqFZSJ92B
	N+o+zJuxFiLI+ezEYFJZrSvoRJPpclpv7j/SkPEpt8Ar9ejE8fExaHpnLXsLYhM55x0tRHnkAsq
	1oCxZN+WG8ItGhYz+usrV4YKrCKgz9KJbs1lj5o5UM7sM1uKzrTMqkfziL9jNL1aEr0SXmbSkUD
	59CWtd5Yk2ie/eayjH0H8jHa2lUoKx9Lfp1C1Lf7Jt6mOP0XN6D5kd5mAAeeiTlJm1Ep9fahi+E
	EOSsBfrN7KdUbZGD+Rg70rpTX1DXmrv/jLjhc2QuwB5jQF/7rZuCWDJWjDu4/zk0tsrxSA4Nmld
	sSURzKc/uCKtYJBH2X6BNLYt2HZlrefC2c9KvK8GJQHz364Gdb6XmdaeUOZnxvbxlGrjwj3aSG8
	trcxAMhbTkc23XP3UwN8BLNSdvk2Wqqgksbw4f9qLMk401cRVSX474TETdJdhPabe6J17j3Ym40
	zuLWy/fcJmlOS/d9Z2FaGfgGglHkL0UbvpMq2JBxXh9qxcWbsxaCCmUp1AFJQ==
X-Received: by 2002:a05:600c:1389:b0:49d:2936:8ad1 with SMTP id 5b1f17b1804b1-49fc4f71c7dmr45192755e9.1.1789747124490;
        Fri, 18 Sep 2026 08:58:44 -0700 (PDT)
Received: from localhost (p200300f65f19a90444c8989fe13f5be4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:44c8:989f:e13f:5be4])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-49fc56eff84sm56426065e9.1.2026.09.18.08.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:58:43 -0700 (PDT)
Date: Fri, 18 Sep 2026 17:58:42 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for Novatek NT37705 panel
Message-ID: <aq1erjmXLCFB3uoB@monoceros>
References: <20260918-fp6-panel-v2-0-6695c4008920@fairphone.com>
 <20260918-fp6-panel-v2-2-6695c4008920@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qruxh2qmdhupwtoy"
Content-Disposition: inline
In-Reply-To: <20260918-fp6-panel-v2-2-6695c4008920@fairphone.com>


--qruxh2qmdhupwtoy
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 2/4] drm/panel: Add driver for Novatek NT37705 panel
MIME-Version: 1.0

On Fri, Sep 18, 2026 at 04:40:05PM +0200, Luca Weiss wrote:
> +#include <linux/mod_devicetable.h>

Please don't include that file. of_device_id is also provided by
<drm/drm_mipi_dsi.h> (transitively via <linux/device.h> ->
<linux/device/driver.h> -> <linux/device-id/of.h>) and you can rely on
that.

If you want to go full iwyu, please use <linux/device-id/of.h> instead
of <linux/mod_devicetable.h>.

<linux/mod_devicetable.h> is a dependency hog and will hopefully go away
soon.

Best regards
Uwe

--qruxh2qmdhupwtoy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqtX7AACgkQj4D7WH0S
/k45Dgf/cdIUUEx1eWlxLi0ByfmazBebC1gamR8J8DORRZZV6FdlLvHC+Xy2/RL4
slct57z4ZQbBeYwbTEYHirry7VGiKwEpKPQDLmLDnPWad4IuhJyPJHWq1qextxYL
Jr0wsKOilDFYPTydHs9WPS30t/IUFq+/EPzL5pa8ZeGgOVFoqNsW8b/ZrfoDFdJc
O+3m9OwNRXXICF7BpJ5BeHKu3Npv3CiukAmilSjD8dyFd3JXZX3b02ursgRjuDyR
4k+acvjvKFtZ9V4lJpvtwU/6XQxLiQNmLT4YYEYx0aH9JNlxjtie+CUXYEDKcNoU
ynf/eUOrVnbj4s3Yoh1l7LkySt2lyA==
=Sgj4
-----END PGP SIGNATURE-----

--qruxh2qmdhupwtoy--
