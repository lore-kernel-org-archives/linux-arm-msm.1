Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5538C3C9EE4
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787043221; cv=none; b=AM4rjoSTS0kob4NgrMpMuOzhfxHGutr6zBj/KgESvkv8HqA3/xwFcpPvLZcZnlJ9VUe+jXxis+i6BQsuSnMoxJHV35MpPyNBEDNy242mHU/qaknELwfVXErf6BPrdlG2+4n8pZdwpWKUP+zB6/Muk+mijT3nU03iiND+HfOOTrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787043221; c=relaxed/simple;
	bh=79RYIFF913FaQlkxpRypw1VybVy1tpFdCTmdzw/Dx70=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BP3u7QJdFue49GlpZR8rIgjf/GCgm+woLDGKLc3Z37LUvuQosWoVLKuR6yOoGDd1E8CG90E9PT1qwJLu04hdI/X2OSUqygVZEcPj1geE+sQan9o2uzCZfOx7ZbU6AhkNJb9G05MAQPfPXNC12kZY/rGa3LLCelU3HS3xAVGXsHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=a4oq1j/X; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="a4oq1j/X"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fe377a217so2956478f8f.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 01:53:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787043219; x=1787648019; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5mBjzB8/1EWlBo8ixiwD3uUsZbNFlGOVh/ZsCswiezY=;
        b=a4oq1j/XeFtB+7f6ISzrlS8MVOY869YfpT2sOXji16Jm9pdJsAFMO7siGgQwjsPcPF
         roS2bWTA/n6rbGrpijUbfrNkPCX883N9lsCIRXWvDdNxev9MyvZ9LYy+q3cl45WXxj/7
         YXgFBc3RTnEIR9qXfTr5zFammv/bKeU0gbPqLZiTpC38RQ69PfX2jV1tJBF8G0qr6874
         OFX+qnaZEQKDrB5RmtliIz5hysrnuXV2LQbwi0T9Zuj2LGqK3yK1A7obCu60ttX86d8H
         z0EYuPIkkGrS21tBkqL1cSVj0tH3ajzi17Yg0DYaoDHGe+ZPfzLTbCvDgj64+r5+e5F1
         VTZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787043219; x=1787648019;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5mBjzB8/1EWlBo8ixiwD3uUsZbNFlGOVh/ZsCswiezY=;
        b=EPgMXFaaOcDCcAhUPU+z/iZAK7aSpG+jda8KExrRBuSJci4wLwGnZZ1kOkRe22Cske
         br9qOIsCXVqhBezSkPc2z+A4N6mcMW5c1298TN0iaw330grDKfP4kLUPJVhxuu/zzS0o
         AVrM4QRYrfvAP7RKoeO/pLDe/5osZADMtgl6u4FEh26AJ88HpVEmyIT5IqOGv8T2Htkg
         NBjiDLtv3rOoF9ZDbnH46hPKqY0oEiyR/3ftEvJG7vRleF2RlndyBFqM9brtXD93RSfi
         L4kFTXt9qKdlMjTslPntV0O6lVdMCbCwJwedPzqjlWe9VONfAqAZrgYaiY6IwvIjlwzZ
         n7WA==
X-Forwarded-Encrypted: i=1; AHgh+RrHJp/3A9So0KwzTHJKx3siVWVMLbuw4LJ79hhnMYDgvx/vZy8Wh+jwRCh3INTbqB2odolkI2ybYigj03Lz@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2UClpFPQ24yrPV6f+joAoXNJVXj/cxvv2mWZRaa1jmYyeXUUH
	ciBp1oOp945iT5eCd8oPSBXH+CiaCwmuz2zvTKw+tgT+Y4gbCeHWvZ9OSKSbFJSfEms=
X-Gm-Gg: AR+sD10+fgiyfm8tgVJ5qr29JUii308ozHQOXg5x655ttO7ySDZtNy94adSzn0kKEFs
	orkwyvb1xxZ6pO1RcosuzYIE7ignSmlqwhiBQWMj89S7bVkADpseM2vGx4/nEIM1PJ1BFCrwIUj
	ITtBnCv8gUCEdUG9atITBY/bsnWpuFJcbzL0ptOeraHHM1WoplLEEqqcfDF3HTGppdAwn/Uf2nF
	NoT35kDL+ryo7peMRDM1+Xm/aoCxOzm9bJ6Oez1VX0Eb4r4NF2IWA4DXp3aC38VpPo+huSIu5UC
	wLhYgE41b3nJzlIlk7GL8boMP8i+4kG4h5GWUmcrQrOOhRuUdIm0WmnHVXl/eAkKCRQsYOCjk+U
	+YNFSa3I+/bLC7ww9N5H5fJojKSbZoPY7LFyr+6FyjhDtyN8uQggeHiXOOVhJyKN0jVKSkkvLqd
	zEImwnXF3kWakaeQXuy0c4mlPpfrw8kBzpm3n4DzhWCJf82fbyfBV04gNj6Ere5eANuWLxhtTlF
	RIn+okRrP8No/IJuqgVJVQGyZofQ2dlzxtmjudVtO1l0kx8f1TOWD3tC3Yalvo=
X-Received: by 2002:a05:6000:40da:b0:481:5003:c654 with SMTP id ffacd0b85a97d-482a8ff6003mr10697063f8f.7.1787043218545;
        Tue, 18 Aug 2026 01:53:38 -0700 (PDT)
Received: from localhost (p200300f65f01710416869d85a644e839.dip0.t-ipconnect.de. [2003:f6:5f01:7104:1686:9d85:a644:e839])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-482a5b77f41sm9680514f8f.27.2026.08.18.01.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 01:53:37 -0700 (PDT)
Date: Tue, 18 Aug 2026 10:53:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Sumit Kumar <sumit.kumar@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, 
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Subject: Re: [PATCH v5 3/3] bus: mhi: ep: clients: Add loopback driver for
 data path testing
Message-ID: <aoQc2aVZ5MR5OKje@monoceros>
References: <20260817-loopback_mhi-v5-0-50efc7360b7f@oss.qualcomm.com>
 <20260817-loopback_mhi-v5-3-50efc7360b7f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7oc3zz2p7n6vaxev"
Content-Disposition: inline
In-Reply-To: <20260817-loopback_mhi-v5-3-50efc7360b7f@oss.qualcomm.com>


--7oc3zz2p7n6vaxev
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v5 3/3] bus: mhi: ep: clients: Add loopback driver for
 data path testing
MIME-Version: 1.0

Hello,

On Mon, Aug 17, 2026 at 03:44:36PM +0530, Sumit Kumar wrote:
> diff --git a/drivers/bus/mhi/ep/clients/loopback.c b/drivers/bus/mhi/ep/clients/loopback.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..18a92d6a40e0f7de277d155cdb5495d14a60c19d
> --- /dev/null
> +++ b/drivers/bus/mhi/ep/clients/loopback.c
> @@ -0,0 +1,130 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#include <linux/mhi_ep.h>
> +#include <linux/mod_devicetable.h>

Similar as with my feedback for patch #1, please don't use
<linux/mod_devicetable.h>. Either rely on <linux/mhi_ep.h> ->
<linux/mhi.h> -> <linux/device-id/mhi.h>, or explicitly include one of
the these headers but not <linux/mod_devicetable.h>.

> +#include <linux/module.h>
> +#include <linux/string.h>
> +
> [...]
> +static const struct mhi_device_id mhi_ep_loopback_id_table[] = {
> +	{ .chan = "LOOPBACK"},
> +	{}

Again, please add spaces before the closing }.

> +};
> +MODULE_DEVICE_TABLE(mhi, mhi_ep_loopback_id_table);

Best regards
Uwe

--7oc3zz2p7n6vaxev
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqEHY0ACgkQj4D7WH0S
/k7YBwgAmrxBnCENBhtnqeEuJ1yhX/F/+5dP+2pviuRThhUBDMwsNGw27KtBZEaU
S5y/S3T7dEbOQyqg9rGireCNBBpuLilhdPhSU/srmyf6MbjL+KrYL1apHKMzEGF6
mO18Q3h9zTatfoUDTQY8ahqDTX4CoOgBzcEfK8Dc9r/GfkT2CVQhC4EkgqVDJN+T
vnlXq8KecLz5ynZM2OVGfHuMCPZi4OGzM8FEzqU1116/67AGYEXhlKbpQfybK0wZ
tNVLfVNkoYRmu67Nlu4aC9vvhj27pNkQ8QvvIYViPhA+Qd3VZL8nBcE74WSWB9AR
rsjBXwRj1qpzw7VK2WnW4MFO8mKvSg==
=0Wif
-----END PGP SIGNATURE-----

--7oc3zz2p7n6vaxev--
