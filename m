Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794551230;
	b=5DUV13WjpIatugsQbM69zR8h3WG4FeO5kMtB9JMrGdv8S4mu+GLlrdCW/RZLXp59gMV9
	 swzVGPxh7nogRdNIQoDADIaTLf/hmoJ0VMbo6l0VrQwmqWoQpakLWgfjVeUoLajaBONlD
	 fd54w1mcoB40h4y90Gss8hN/moUBOloJQCWgudOnQQyqb3A6rNQGBlvhIMfUHinldK26o
	 09ppjwGyN3/HdtIpNM9P8fVpaNyC91zXUDwhBQyPp7hy3yG3k8/lGvwG84lzhVlOgq5lE
	 sMjVt55oNNPyBqL3ufSkmc4VXdRTLysU3XT8zNcsVB2Gu4iMQuhY5kp0bKdjSqvQtHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794551230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
	b=BEYqbL4GGklZawW469qsWy6rpll80n+kG8UuhKjkBK+reLl/W7G0qaiuddOLJhdVkoEk
	 k7mbO/Ov492oLCt0OTMLJupxCnri0H5sSSYU0Q0CSmJOHVqcBeWMTllXZW7oxwL0bW1MG
	 YJADvflV1SlXxI7/Zme40l6xpdSt/wKS5ACGh7PFgK24LawxM5lkCNk3pWSnUDIk/6xPE
	 hLkOqBAK6D5FVfhsQwypdq4ANGi14cMqAz4azncyBDb4tJ+4LkGI7z2S14vCyPuZO9xiS
	 3dAVpwtCeWTxBAHWJzR9CiWdpr2sagsKTzrW5rxWxMOVYdFouzpmTq/QgBIVXOm6yGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MUvxZhYm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A36D606A32E
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:27:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A36D606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MUvxZhYm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so3681885e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 22:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794551229; x=1795156029; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
        b=MUvxZhYm5+xi+SJfP8nHhsZ1GXHZRgKcmtYpFlDoXTjjRpAAhHrxK/sL0p5zR3UDxZ
         zoFe6J+qpK86Rz4t3v2DUKvCLnSK0WziR5goLmM6ybJ96s52a7n4l6ssjhqsUYaR+Jm/
         Xs9hOLXj9PE+uwryRlkvLuERCrqJTf3zLvvS2FCslyTZTd9wswIAMULtnwF8vJn7f2H0
         3wTzjD8Hp6/wsmtQJ0eNgdgUe4JwuhUhUM8UnvqdKeyZwp2YYRSg+jZBqsj6tEhsE3zD
         Pz/u5C9YRb5rfcke4Gy7OJXnRI/iCfjiVWknhEe2HE/M51peV4kwHUDOt1TkMoov2shs
         xFfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794551229; x=1795156029;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XltNWiKtwG9iBw8+GH1SYk3VMgJFEJVDDOL9ejVnQFk=;
        b=1/W1VoMnGGWuJAKZO+yielcZaEpW8hBXv6xXMQFyYl4ijyJzxWVXIBBjCJdtt3vZBx
         hNNoBiPxbqIv9BoKVv+VbqPC2MIj+xkeH1+RWUdrxl/apvvIzjYH3iteGge4j3L6X8cG
         eQUPjI01v08K1K9rsT44btE4rm6OmlVpPfKVPdJW6m3yzJBeo2IDxyRa51aT0hOWu9hD
         06r8dXKfjVkzuXN040LrdyBtVBqUgVzn3rAerXRqREjNlCukgSyUl/dPj5vHZiIAd8VS
         tFgO6YOB4s6W+Egb6SltBhR0B6bbSZ/FBQsWnk3NZcTti40nX+RgOrWvZ41VXdXwgXBk
         W7TQ==
X-Forwarded-Encrypted: i=1; AL+hErE0abUjxAJ5hr2DUSWytvRTBG8NKe7oNAXF9qRGj9sjGsEmlYbWeQE/32XUMdno/rDXmlzZlRnJHkFMjH+s@vger.kernel.org
X-Gm-Message-State: APuU4Z8lq1e+f9OIAkcqQPlygUHFQKWWYfs5Z02ayEnL/X10uN4oARUZ
	ESS0Rm/LIdDuyeaTFBnWpnDWEmoWc5FG/3bKCeOBf40TVdxzAU46Lws+C/Vo9k68nXY=
X-Gm-Gg: AYBFou03qCOWB/YPAj78NAatRPZG9nhI3x///QnHyXFLdTgjdaRsfX4myEvNa9p4dkO
	tK6HYNov665kYaUM7toXAfhrS3qQWTrylupj2MptiyEluVs+JJ8vtmrjetLfaVhHU6oyVFH5tF3
	3RNWfmnkpGidc2mNbP/fN1XHfAX9WqQJUi8/HOM9TrFxXmvo58sn/ZBbJcAXbZHGC9O4j3YndI8
	38jIOKIfOKcBkM4Mjr+W2iwgiZ7RfQnS5dbaKoj4ztahb8rVbDFAAELHFT1L8jzDK3gr3thwFO+
	2ieIyn+r8wHX1Suv4puSM2rJy74OXBcYLobgNQXYT8+DTiG00/T1EX4EW3IQrQK/TYiweEmM9Kl
	euXNceHHzqTeeWQwqxf3aOGaftQDh3XmJcFq2q3e7kn32sgSg9zHY0+mXc90YuOpoe0kwth501M
	VN42bq92TyTztRJRpuQ8TY6eG0BN/NZ3KAJvCMxXm9w+BHgWzQ88yNDkXLc2vreqSiSn9r7I0R8
	izm0fc8RzEjTRpp38UB+LbmFhzG8ZQOJhMC1Q8QfPT6JqcWojnYVfnPr3+9ishz9UIzh1WH1vpO
	Xt4C17y5ZP6/rcFULCUiIBpjgdMT/66eIxTY+yGGeTt9EOtwgkK/Hv8Eo1D4QWpPsGBFWBuzOQ=
	=
X-Received: by 2002:a05:600c:4ecd:b0:4a1:e6a9:4086 with SMTP id 5b1f17b1804b1-4bb5599a73fmr36037725e9.0.1794551228841;
        Thu, 12 Nov 2026 22:27:08 -0800 (PST)
Received: from localhost (ip-091-089-005-024.um28.pools.vodafone-ip.de. [91.89.5.24])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb4e29daa5sm133039875e9.12.2026.11.12.22.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 22:27:07 -0800 (PST)
Date: Fri, 13 Nov 2026 07:27:06 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Val Packett <val@packett.cool>
Cc: Sebastian Reichel <sre@kernel.org>, 
	Marc Lainez <marc.lainez@gmail.com>, Luca Weiss <luca.weiss@fairphone.com>, 
	=?utf-8?B?QmFybmFiw6FzIEN6w6ltw6Fu?= <barnabas.czeman@mainlining.org>, Danila Tikhonov <danila@jiaxyga.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, phone-devel@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] power: supply: add Qualcomm QGauge (qcom_qg) fuel
 gauge driver
Message-ID: <avatRCrAgoPjV7rP@monoceros>
References: <20261112170841.2189322-1-val@packett.cool>
 <20261112170841.2189322-3-val@packett.cool>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mwyna4jkd5v6s5iv"
Content-Disposition: inline
In-Reply-To: <20261112170841.2189322-3-val@packett.cool>


--mwyna4jkd5v6s5iv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/5] power: supply: add Qualcomm QGauge (qcom_qg) fuel
 gauge driver
MIME-Version: 1.0

On Thu, Nov 12, 2026 at 02:07:28PM -0300, Val Packett wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't include <linux/mod_devicetable.h>. That introduces a bunch
of unneeded build dependencies and of_device_id is already provided
(without these dependencies) by <linux/platform_device.h>.

> [...]
> +static const struct of_device_id qcom_qg_of_match[] = {
> +	{ .compatible = "qcom,pm6150-qg" },
> +	{ .compatible = "qcom,pmi632-qg" },
> +	{}

Please make this { } (i.e add a space) to match the most common style.

> +};
> +MODULE_DEVICE_TABLE(of, qcom_qg_of_match);

Best regards
Uwe

--mwyna4jkd5v6s5iv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr2rbYACgkQj4D7WH0S
/k7nbgf/b6/rA4kIW1NyMoOtnNVBeGIHHHNfMkct33HHb1h0CiT6Hd1RLEJ6HH+F
sW4pjg7G0QStID55MbOeFsfsHKUaOEsaLwutZ3fATturnz7k7RZRvLfAjNtR3k18
hiWFbFdsTjH6SuQ/g7OijXpDO+E2v/5FHg8g/V0U5xwL0w4sWAME2Gxrc9Aed+1Z
yb1H38UcmdaYkNs0WgAyYt2rGVtGDyt5nQqLm9gBfrCvoxDzCIxgiXJ61C9JMF0t
UIk/sLbujBcPF2qrtmodX0CUE07kBKD7PV1TOWjB7Gcz+f3E/X3eQGPNNOk8mEQn
pqgA7hr5DNGO6zRenFbDHgtssAhenA==
=HgBt
-----END PGP SIGNATURE-----

--mwyna4jkd5v6s5iv--
