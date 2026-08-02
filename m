Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E55E25B090
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 22:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785709246; cv=none; b=gWOFO+SVn8T0ege9vG/N+KMXkcFnx28pHcvyNatSidWfDB+6xshRg9bWyv+r5FfJQ2XHEn9pIX7/Wo0N3cqSGk/IwXLcikbvRjHIrAO4dstvnobFT8boEVNwvlqkPEDJizCHA/vuN4gR6Ve99wHgmwG7wRYAVTF7rbqI+aAm804=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785709246; c=relaxed/simple;
	bh=K/2jAp6khRcklPkNtuC/joaYI5lCI1uQRDZekKuvXIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E2a6zhLs6RqI0Hzshpuesls8ZF8xo42dISs5VTc8NYDRNMCyjbj9u30Ewp0CT3/G6/8dkY0VTDPkEjeiK9J3Ty/TzqJjMeIi7RcOVgGeO6T7wPlqirs2dsaqj+Ww9wAWzmLNQsm8F0pZJUA9LjqdWJpbcTnQQDHJyTRkZQbBoBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KucLgUYr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KucLgUYr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-495590dde14so14307725e9.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 15:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785709244; x=1786314044; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i9RUjiVyXXCN2eHfX1I53hQWCYFwzgd7w4b5P9lpT/E=;
        b=KucLgUYrXLYkqFnnrB+OswFPm43aE4h+rQLBGHyCrPaPHwHsOg0wXRAX2KQJrPx3h+
         EGAv8BsR0jrLauQPLWS1a0aaETpcngmntxISpqgHs0Cc7q/9ysdMNtzxqp0pnbrd02ct
         ON34Lyg/Vc9ZJc+PkqeucW5X3bXGI/L5Ma4tdm9jlQrvvgDXTuVCoxZAZHLs1XKnx6UX
         YAmNueUDeTPOBOkv8IqfCznAn/ncOvQOwC63Ylzc/7CwN/toh1OIrTntYZ0osH3BpGXa
         wdLuDJg44HljRBy3GWId3xSRUDjM7JMnm1pr7ZBiRSKUgsvxgQTKz5dQBVrl2yD6+4OY
         wv7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785709244; x=1786314044;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i9RUjiVyXXCN2eHfX1I53hQWCYFwzgd7w4b5P9lpT/E=;
        b=l6L/h9UTnEoNL9MxQb2Xqg3SIXd2pUuW4zUnZnfskmv79+YKS4R3cj1uDz7cUlwUw/
         a19e8l80HF+EvTkprk5Pvnv/VZv55Uj+HQM8vyxDz0eHaS4IZji3zoWTjG+m2nB9RENF
         OqUEsikQVHPEaOb6/CO6f0LTBTymPOdMP3jal98YJkAdGxW+PM3tXnCe+Viiqw2SyT3c
         aFOfXd38P/hQ/1yGJBu21wgzLQC3vsi8ZHe23IOmIKyp0J0KOwTiQpRQ4DpqiLAjh9dq
         UAmSMmvM7anJW+RnZ7qvhjrJNgFm34wxlUnGE4SQMbdHNt0n+Bw3ws0y/AnfDLla/QkF
         7//Q==
X-Forwarded-Encrypted: i=1; AHgh+RqXtB0LzbaTLNVpOKNaUiWN8d0qtbIvoNClyYc/ZHUxQrd3ETj5ZfWCK00QsW0QLHb5xFdZCLGoho0eQ91v@vger.kernel.org
X-Gm-Message-State: AOJu0YykG9EMBOXeOQzPU5s/kdQEpDXL0ZwOuxnOprr2L+luFuvMbDZW
	A5ASVvwS5ArCAzNRayi8tgMXih5cOeTvnleNIiOPPIMcGbw+i1RRWp85diwjRpKPgfI=
X-Gm-Gg: AR+sD12QUp/hXoGRKeUfNjXuHkSCjCDv+QFbLJOcgC7g12L9Tx4e6xrAaclDNSmXkCT
	H5Y1kZwdU5RHsCexFJ449X/O+kiX0wpHLb9GwdFdyAWJuIDxI4ptXtJUOCZZxc4bGseEMYNFJtp
	qugNgAG1hNFrIuX0drRxag/qSIIOG9VxASFvkluVl35FXr7xhthIembTD3kRS2FzVp/6okklyG1
	bZkaVKJIPPjIjRHIErBiilKmMBjlBHjdp0O2U+zqyxp4+mF80n3T4Jh2Xs3ejd2oKkbLOeIQg/d
	/SUIrHY4paFyGie6jMMt45xT5bldvvv5l/JpK3LhjNeYvuIgWXDM4jzFeyZWTMJG1O04dhyHwqV
	IWrcL9OmN8HLQhY8lHNs/Z9JG4r5W23KlNSqh8KK5xBqDsWJ1avT2Wd1Iti/Cd9U8RpV5W6HzVG
	Emc5ukEKY36MzhjUcE3d7Jm2uZlThvgvP+mfY6i41FQN8VocmQbE+rkjjrDzmsMi9sxw==
X-Received: by 2002:a05:600c:564b:b0:495:52dc:73a9 with SMTP id 5b1f17b1804b1-4980c675370mr125127215e9.11.1785709243887;
        Sun, 02 Aug 2026 15:20:43 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:1d24:d58d:2b65:c291])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47fd456a6besm25058203f8f.22.2026.08.02.15.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 15:20:41 -0700 (PDT)
Date: Mon, 3 Aug 2026 00:20:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
Message-ID: <am_CG_kR24lpos6D@monoceros>
References: <20260731050838.158825-1-ebiggers@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ll56pjw5fggcc5xl"
Content-Disposition: inline
In-Reply-To: <20260731050838.158825-1-ebiggers@kernel.org>


--ll56pjw5fggcc5xl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH] crypto: qce - Replace with stub driver
MIME-Version: 1.0

Hello,

On Thu, Jul 30, 2026 at 10:08:38PM -0700, Eric Biggers wrote:
> diff --git a/drivers/crypto/qce/qcrypto.c b/drivers/crypto/qce/qcrypto.c
> new file mode 100644
> index 000000000000..d526902b3060
> --- /dev/null
> +++ b/drivers/crypto/qce/qcrypto.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2010-2014, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/interconnect.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/platform_device.h>

<linux/platform_device.h> already makes sure that of_device_id is
available, so don't include <linux/mod_devicetable.h> which will go away
soon.

Also I wonder why/if you need <linux/device.h> here.

> +static int qce_crypto_probe(struct platform_device *pdev)
> +{
> +	struct icc_path *mem_path;
> +
> +	mem_path = devm_of_icc_get(&pdev->dev, "memory");
> +	if (IS_ERR(mem_path))
> +		return PTR_ERR(mem_path);
> +
> +	return icc_set_bw(mem_path, 0, 0);
> +}
> +
> +static const struct of_device_id qce_crypto_of_match[] = {
> +	{ .compatible = "qcom,crypto-v5.1", },

No , before a closing } please

> +	{ .compatible = "qcom,crypto-v5.4", },
> +	{ .compatible = "qcom,qce", },
> +	{}

A single space between { and } is the most usual form, please stick to
that.

> +};
> +MODULE_DEVICE_TABLE(of, qce_crypto_of_match);
> +
> +static struct platform_driver qce_crypto_driver = {
> +	.probe = qce_crypto_probe,
> +	.driver = {
> +		.name = KBUILD_MODNAME,
> +		.of_match_table = qce_crypto_of_match,
> +	},
> +};
> +module_platform_driver(qce_crypto_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("Qualcomm crypto engine stub driver");
> +MODULE_ALIAS("platform:" KBUILD_MODNAME);
> +MODULE_AUTHOR("The Linux Foundation");

Best regards
Uwe

--ll56pjw5fggcc5xl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmpvwrUACgkQj4D7WH0S
/k67nQf+OehFcZIDtgFxkyFvQZvZvj8xuSmIv0XdUJH05uJUlrPzdkpGEIhFcanz
X8NT6EKrJBiBvrf3pUe00j0mjuhrKvSlNwD/OIOfIyKO/vqCUA7I9I7Z2rytufiF
ctDEwPQm1DhHjgqODVsHjkhxh8GL/DJRZfJI5rlD/owrDhjUVV23+9el/AnKy9Pa
rbNI92rAQ0E6Oqn6PzhUz7szbSaZwNOIHHwEDSKza6Nz2ReOBoqmNzb+wtiSV0Zw
ZU88/nUiGRYBZohrjw28Vog4+tLMFK5yqZunqMgevvJNdVSkJCt/6DSH0F5uI4py
p1VS4MphWJzPY13zmlS5FUlxowzcFQ==
=dBQw
-----END PGP SIGNATURE-----

--ll56pjw5fggcc5xl--
