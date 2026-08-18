Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AD93B9D95
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043772; cv=none; b=nhYk0NHwfZpPZCiCXDSw5UNVbqn6i4bSd1DJHoJjaf0WwndvQDBQAxAX4LAFQmafTCIu16syzZvM5PW/owOETujfKMwcP5O67fJdpPi0iLITQld0hFzDBHeogmxZsqlIlueyp4wiWdLSodWcz7Ar2qSQweXtIdYSUpjoynf4UqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043772; c=relaxed/simple;
	bh=eChyA7CDxlYeBJLejN0iFpFfZsSUbo1lCtEsg42Z+T0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DGtDnLxEPivduUmtnVzRzvk0q6X++aPIL9EITwr3vNEKatzw7tc3YABhvdo/lh9hL29s8SA6ocKWvaVzmWJVgeoTFrjFIH8AO4do9oqRu8RJKJW8szYqDqjZAx4W0Ut8C0JEhga8qeKSe6NdHtv2B56ImJWtUDj52MpTpPO13yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=GMwHq7/Q; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="GMwHq7/Q"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495437bb891so6977795e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787043769; x=1787648569; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4KyNSj+8sUobZeYhYQqt4N2hKwASTLbW+ZVkivK17pc=;
        b=GMwHq7/QXaPEd/eoFifImLTMPA7TyzFMd742IydXD+RDRb6LmDW7bwkvTNt1/UPuZl
         3L47vUrI6NHFMzCHct6Z7TWfvmWE6dq6XIGQ8r3BnAFnSUyVDa/nWBjagXmsbSE9+3H7
         uxL+eFkbDyQ80PoD7R//4IRKVv+APzx7ZezfQXMr/o3m3/v1TCM6K5wMNck7Scc9oZBJ
         LfB6gohiXFaaI0SKciEKreoyR8qx55hZo3cVIeMtimh4rwVk3P6leGlKZOd5Phe4XH/J
         3TWCmJbCbzKc1K1YlrriYH0MzUFGzwDpHMlhpEz4iDHrpP84mtzWUVqzm7IpV04J6Rw/
         rxWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043769; x=1787648569;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4KyNSj+8sUobZeYhYQqt4N2hKwASTLbW+ZVkivK17pc=;
        b=BiqeqnYh0IH3KRFIxZ3y6oRnFEHvxBjHvqB5QZ4b0vOaUQYMf+9teuLVfiBa4oF6Qf
         8Yx7nfNp1z7vbGnfQG/FVnmpftv9tGorNmVRzhNkceJEkuMYJbpsIPliXnH3nYRJ1ZPB
         O5VzQHjirxH2dV81faFfZG5iyV1QaMZV4sApfN+ZEyTxuGGZ2S1qMRX7aFjCUgsGZgon
         pJUjcXaJRP4mc+4t5Bg0oSzPDDKkuzbxVjDxDC1XsIOCos9aFcuYmplULKHADuDmLDkq
         7flfVJNEXnvlOdaEFOlj1N4xLTn3oQQlqviZpW3Ycy52wEZdkckIEf7/PQZcqhTiMbdE
         28Pw==
X-Forwarded-Encrypted: i=1; AHgh+Rq2kyOLPJfolYWXioMZrVY8VZcy1fGsCWVwnWxSEUfUlrHquDebTF/eGF8WaHzoiRl81m1gmRBbJ8RN5jqP@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb0h3v+E2U2ATzwukpsHZcnv/8tocRAvT5zy7oq1Gkq5v5fbXk
	67rKoXWs9VmcCIpOZUJ1060mgbz3pohWz+XGHegCnqDmXBtAnoSLmWHozi04KA1GlZY=
X-Gm-Gg: AR+sD12fmpLfhnHihXZLUAQw9p/jl9Zx9WWYEY9ulzkJvCxLWucqjO2SA3oddUtbvRB
	qNpkBTFnlq/0LvLWz6NrD/FChYkHJM3IVK0M+vrfJxIctxpXpgNVmgs9UapmPbtMu8PikuCIuO1
	4eGSJCCQcsKUiWBhBgp48HdN+2vH6Ob9LNsYd3E7hFQnYCo/3QiwKhIqBKf6KZjuvWP4nPYpWmh
	qTiIYRmtIzoMWKERcAfGm+GsVv6o2BTtPBhEqm6G85yi8xG0cZxldtaAFq6WgujSkO0DNx6ZdZt
	PsjexN4dIrWnfZgTv16/c3Ckc/wn0zy0J5gGUPmhA7+wlM6qvqazcpbsnrAeUCwrlb0hF3y121G
	Zqzg+Uf6yR+jhrqc84MDVT08S5w/imz7JEnGgBYY8X+NcACQh9GDWynpdQbOKZCRNcYPhrWM/7q
	aw0EryU6GTAuWW497Ke6vuKXxaUdFPFt/rUAvlXniyTHQNeY01JRbKsciHPbtlhIGp7tOCDKoum
	Ak5S83IyV/4ubd3Y5k4TtjUFmOFrY698C33VoivcdoM6FZkZ2NF
X-Received: by 2002:a05:600c:190c:b0:499:a5cb:b7c0 with SMTP id 5b1f17b1804b1-499a5cbb84dmr11657195e9.3.1787043768231;
        Tue, 18 Aug 2026 02:02:48 -0700 (PDT)
Received: from localhost (p200300f65f01710416869d85a644e839.dip0.t-ipconnect.de. [2003:f6:5f01:7104:1686:9d85:a644:e839])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4999d10b7f6sm111662805e9.12.2026.08.18.02.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:02:47 -0700 (PDT)
Date: Tue, 18 Aug 2026 11:02:46 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Faruque Ansari <faruque.ansari@oss.qualcomm.com>
Cc: kernel@oss.qualcomm.com, avaneesh.dwivedi@oss.qualcomm.com, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] power: reset: add PSCRR NVMEM recorder
Message-ID: <aoQe4dvuUtHOZ0jg@monoceros>
References: <20260817-pscrr-provider-v1-0-88a318c13d41@oss.qualcomm.com>
 <20260817-pscrr-provider-v1-2-88a318c13d41@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pc65ox73fytccpxr"
Content-Disposition: inline
In-Reply-To: <20260817-pscrr-provider-v1-2-88a318c13d41@oss.qualcomm.com>


--pc65ox73fytccpxr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH 2/4] power: reset: add PSCRR NVMEM recorder
MIME-Version: 1.0

Hello,

On Mon, Aug 17, 2026 at 06:59:42PM +0530, Faruque Ansari wrote:
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/nvmem-consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/pscrr.h>
> +#include <linux/reboot.h>
> +#include <linux/slab.h>

Please rely on <linux/platform_device.h> to provide of_device_id and
drop <linux/mod_devicetable.h>. The latter header will go away soon (and
<linux/platform_device.h> only includes <linux/device-id/platform.h>
which introduces much less dependencies.)

> [...]
> +static const struct of_device_id pscrr_nvmem_of_match[] = {
> +	{ .compatible = "pscrr-nvmem" },
> +	{}

{ } please (i.e. add a space)

> +};
> +MODULE_DEVICE_TABLE(of, pscrr_nvmem_of_match);

Best regards
Uwe

--pc65ox73fytccpxr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqEH7IACgkQj4D7WH0S
/k4CJggAp9uDCUWRCiyr2147aanmWPbdc7axHmbE3IvRbuv2L/D4B+lMbboRWYAt
52J++aQF/9SPP2l90lZZ53SHpgHJ0ozF2g5YU9lq5dYUr3xOvGR8MmR2s3jwpyvc
9UDrbDCswAFXWMsvQBSavAS2Kn3l9lULtHoLxYiJe7Jiin0lY8k0RM4MqaFh+z26
442c/JN8WSLjNpDrcLJ0R3oWt40K5cvC3aXkngD4CpyJe8cwjvy0pZoM5f/EtTuH
WaEHMpjr7GMZjN7ehy+C+axFeiPJsdTZH5XJ73cKkD7aYwbzzmY2zpHanzwSYnHj
ZsCNx/HqZi3ngW4AqBuOsmioABAUYw==
=dFaa
-----END PGP SIGNATURE-----

--pc65ox73fytccpxr--
