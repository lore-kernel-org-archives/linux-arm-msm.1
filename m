Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793984368;
	b=SlhczSDo2zgXJxlOTpWRS47b1bvS1hWzCgVy5tywuoFOayUvjQ+CxkgLRTE7kUbvllmW
	 jzij31bU0ar7lRA32BpVO5WFX7/ioFqbOYIS25w+AvzlGu/kYiIBIoH+Dvz3q9IHMJryA
	 JsAj5Uxu5vZayIkuOYFAxiRf8U2Jp34Pq/cqbk6EX+7yhKvR9wJZEt3MDfQGTeJjdeFTO
	 YDcxSQZF3+hFrYE6u7lsmWiJClhztC/vY7QplMI2wq7wmCIMjH7s1g/ja4tdsCS0gE4Nx
	 p26qzrOiz5pWnLiEqVlSbUGc/rooIU1nxkF+zrI03hV3eKAvWR70xTq78fQZn2mmncA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793984368;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=He80xqzSECUlwJoMnQoGCscLltd1EBIEH84Xtz6o9n8=;
	b=udwXCkopOK5ni3owRy+dAsBLC9ZqBdeS/pbwc9rTmONJK0h86K4F2oJ3DZInhFMPmCwH
	 x0qOKAQOPpVnJAU+A4C0zcRkdA0ZANVFg0C0RWBvEWgxBB8JNqhrEQemgcReZBi5fpzIS
	 vXRonYGFbXcIpq48er10PfqrF3VU4P7Y6OLzIFKb/CAMEhNGoHe7Axjy7IZKesYE4g9ie
	 cCnldghdCvS9qMq7KgG+JY51/wVqmRVWOKtixdfm9rNXCbg33lVeUMbz1BW6dkrxt59PV
	 /zcIB+T/xHjaXlGPHVQ467kE4g8j1nRTOCU6wFCoAc5ExzYcwmDLoIQ7vOuUGNqsu9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IW9u+YJi;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F08606A329
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 16:59:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69F08606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=IW9u+YJi
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a60f9474c4so10329165e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 08:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793984367; x=1794589167; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=He80xqzSECUlwJoMnQoGCscLltd1EBIEH84Xtz6o9n8=;
        b=IW9u+YJiOW2+z21M7QUKqWODPqGNgcxkSgBdL8rFtFAPP6DJB/T8SLXqx5woyJxqjd
         s1wm5P9v3mo47s/qZXzrOTtfkr3my54cWP/ahfFfsZIKCcKROCdfguM1qaBrLGg42JU9
         HHz9M9Xv2Ktd88qEPa91zAD8IWrUDGwhbvmRuwYCvGQdZbFV/3cXx319XmqXSe0u1kG2
         GsLzjXBEgl/yClnIBL6ny3sur36m1oj7AsY/Lp/C5u5QuDwdi9ONIoWJ/3fFJRqPV99n
         uHD8ZtgAeLJkRqHM/XBaYT4FuU/LamzAaY32EwIJLgmdCHCVEbezOGXcbqZXqt+4LPA/
         vqJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793984367; x=1794589167;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=He80xqzSECUlwJoMnQoGCscLltd1EBIEH84Xtz6o9n8=;
        b=SE1UAhBlZY0xjmed9e0D8B+X+ofiFDAxI+sVLw1f0Be3ioAAp2/q6sr2k1rl3H6VVG
         EejImOyiRPX4nKQMly1bSvCiyjv5AHE3OfPDEaMZQuy/4/oyap6uQi9Z9gsJpYfbhKa2
         nIfi+5vv2kIMVWx3K+zWuYwJfFO7lCXTdyv4mPnou3WrfN4sfVAjYOtAlxsHd2Y3YPmh
         iH1lM1oRzsGO2oBfj6DhlEqwQ81TH84jtlwUlWwM3hi+36eTvm0VP6wvTwaDJE/rtUFh
         qMfjZSjwSvY4Jkuc8LiXvAqrrr75jrA+wvNWwh2nHLLIXaVDgYU+QZ2+j59D3/vVzRJY
         3dUg==
X-Forwarded-Encrypted: i=1; AKwUvBy/s8kvYB/rtvw2N40AFlT5VPVdgL0GTsFvwlSpfwVKmn2gHURzTBGG2ZF0P0A0ZbQaujEQEdpy6Yntrn/T@vger.kernel.org
X-Gm-Message-State: APuU4Z87AuXRZrNFG1VLRySPUclCqoaZslLgvvgisAAjXNF5WkRyKSHF
	e6IKO58YfK3TkLkTCQn7XPiU2qQyQQ7bdUu/8LOmy3p5pGEKtsfqzbZMIqBx8JzuxOE=
X-Gm-Gg: AYBFou2mTOktFbu928Rztx0ARhJkpCLetKDv0j7yWiDgIzSbOrxY3v4m/2sJc9ZVVsm
	n0X7QLTyRVNT7zznrn2eKWXk7HZau0xySEt0teA58makxmyfgPLVhcUePvujMFwfQw/QflKDpLT
	hHJadyED+5a+YbwOfpvjje/iR5EzlbMAk8K6jy2VVLAECtUIiIO1aifUVOhMxxQ7Oo69FpeWUst
	4Vaun5suAGcdSez3AiM5uuf5cl/MjMItpiM9jpJVSKEX7vigDD0jaHF83wrshjeTdlv8sr1+HSn
	2kJBQVz/l/Pdo0AB9m3k0heB8rQPhCTSbM+lV7hZUlJYZHV0S4oZvtdBFJ5qRXGQuv1qwDZ0fYc
	6iveQdq89bqpbqnsFKBDkm7KPAUTNUB+T3SOsqR2VIL/gIxju/VZmZA1cgqkanj1Vf4hQxO2mRJ
	cv7lyWP74Pt4MqSprlu3nruyl/JjvA88UrD+ajVeWe98ZIb6bZby7febUqKaPw0rPDie34K/95b
	wcprB02iB802Uwn6DzqLfz+WAluioJAecQlS0AO4PtJbQZOOVf479YYXTuu7SGgQNq7b5GrCnYS
	12COAN5ymg6RMtVKdSqyh7+1NDbkUuHA2VGyvYATXOoFQhffIGKRZM06
X-Received: by 2002:a05:600c:3e85:b0:4a6:eca1:7d5c with SMTP id 5b1f17b1804b1-4b6e035ef86mr50697355e9.32.1793984366792;
        Fri, 06 Nov 2026 08:59:26 -0800 (PST)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4b56e58fcc6sm271729585e9.2.2026.11.06.08.59.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:59:26 -0800 (PST)
Date: Fri, 6 Nov 2026 17:59:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Vladimir Zapolskiy <vz@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: Add SM8350 camera clock controller driver
Message-ID: <au4HToRcyRPtlOrG@monoceros>
References: <20261104001704.2744766-1-vz@kernel.org>
 <20261104001704.2744766-3-vz@kernel.org>
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
	protocol="application/pgp-signature"; boundary="27unomee4c2a2acv"
Content-Disposition: inline
In-Reply-To: <20261104001704.2744766-3-vz@kernel.org>


--27unomee4c2a2acv
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/3] clk: qcom: Add SM8350 camera clock controller driver
MIME-Version: 1.0

On Wed, Nov 04, 2026 at 02:17:03AM +0200, Vladimir Zapolskiy wrote:
> +#include <linux/mod_devicetable.h>
> [...]
> +#include <linux/platform_device.h>

Please don't use <linux/mod_devicetable.h>. <linux/platform_device.h> is
good enough to provide of_device_id already. If you insist on full iwyu,
please use <linux/device-id/of.h> instead.

Best regards
Uwe

--27unomee4c2a2acv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmruB2sACgkQj4D7WH0S
/k75Lgf/X/gQ12cXgo6nsk4EXDZYkr8FQDSpC0uKXhfmB/r7EILSd8SjAvIot57F
qB8dFy7S88DSeDaL3vu7EPr1aRkjaxgBQPzybHb9sFTkAYBW++6++VMnsvekOXI6
SqwxrQYgyRF1tIjO2wudqpq34uraG8yQk7HrhxudUJRZRIMfucrirHshkIWQRyB4
hQzb/5ApOHw5zK53j/kvXWMKmlxziXsl1V/6no+W71bgnWHkmuZY+a032blW6xfH
Jyy4w+WBdsmYezTvMt38tUiMQ0qE6O5oT7OLyxgeaSSKUT6QZ9cvi/sxDsngQaNp
qFxPxTJv+s+t8FhM84ScwzCh5Urq3g==
=r1vx
-----END PGP SIGNATURE-----

--27unomee4c2a2acv--
