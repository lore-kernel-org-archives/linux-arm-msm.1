Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8864132D43C
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787574155; cv=none; b=lZnqheNELFiszrGUzB67uApgOXtg9vKO3dwX1mjIW29FB2DZfrPX2CldqCnw+xB4Wd5oDUawOTg5ufiRhHZo3W6z/SuMV5gdSV6lHSvDhxyXTWHqjdbhiqi2zOu3uG+bo+jkFu9iKa6/PpPYoDLY/QtMU7WdHwMZfVSGSpyX+Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787574155; c=relaxed/simple;
	bh=t62Zykvs+8NdpMy0PpJs95Iv6bI1meByLMw4pOoPMnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrteMookAjQye8kO/RT/cYDZPmt+Rz9hB97kYSv2J14BVBY5iJvDhXh8kyVotoTR1I8zlLPyEMhYAiVvyodwiHkx5ILsAjIMw9W8t1mHGU+c2IywAw5SCovEK/Q9fopmF6w+NKtCgmzZLj18BkGhu3N/2zVdbK5Z97n+kTnbx6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=pQFt21Ik; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="pQFt21Ik"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6a0a4aa99bdso5741626a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 05:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787574151; x=1788178951; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MHbWNJk5cOn3r4GzbI0kltGoUU2l7AC2RyCAmVHKUJU=;
        b=pQFt21IkwjmiiRhJbVs9vq5sUPKqNA/BiBzX2+4R8CA5wNXT5sFAXkGqI30NCwHa0Q
         IU7yZd09xRt4vG9OjoNqeimz8I1ZTi3c7ZmE+m0ssjKiAgWzUX1HjtxhfEREDRMXM3B4
         dCehuya0jS5YZgk+kgPbMHbp+Fm86obxRW1ww8YdtAYxNdSURRrUdHlMMRkFGNvEktAB
         Tptvb6uR6imm0sNWpu52XYIZaozPAgTijXUZrq92GqmFBpmZEB1a6qLg7Y+JA+j8/u5s
         qzoBtwmKbGWsFFaH3jl0tNWJK/aCUDORjew3pLnZPEWDWqTL3Jf1Gu6+umBE2MVV8eHr
         /18Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787574151; x=1788178951;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MHbWNJk5cOn3r4GzbI0kltGoUU2l7AC2RyCAmVHKUJU=;
        b=mHfgHJDxlVxHcVWS93Pzur1gg/MqR6ufPZm8tAa12zHV9h7DX+bXeMKpVY8vfytMOK
         0g6xqCtU/CTSHfAvZkr89CYg2sndC+yyiCx5YgB4RhniWvyYGaskdP3OirgNUsWM0UwT
         zZUd+4jdoHMDI5olcEreOPHSqYMwQpnzGYxRPbzS4tuAYnmILGWkh1aob2plA7xx3RAk
         zjX+jbAj6AXbcpGoUwPrxTyylySLONbpBgWE+l65K/asUTHainn2S/u0+dDdYYybXBCr
         Ux3gmIA2LWqIUIGCSwnD/om8gc0V9BbMUriU4m6ST+wMpA4Jpu8TTuinlL0EkwUa0OgY
         loHw==
X-Forwarded-Encrypted: i=1; AHgh+RrfzT+O7f3J/R8IaBND+pMoMFkOdSmCODNySOJIBpTQtjwJMpYQR93LGBa4g0o5E0alOe8HqR4bGr5RCab2@vger.kernel.org
X-Gm-Message-State: AFuF++nv2IC/hNKuabiTgLlLO9PbzRK7hOZrVcCepwHO5SyySql9rpLx
	KpQtI8w06y7hOWAA2RO2VuJbIeYdVuBi2BslurAFp+RV/psxTpygqb3wRfEsHnqmCeE=
X-Gm-Gg: AR+sD10XYDn4mjtkRtdZ59qOknuJBcBytVKY7px5itUioPPnyXf7U3ps9whJg6JSPM/
	6cjHKwZ6o2FCjOQzDYwJRyfMwAHH5SVJnEsBd64SmLJQ4cKsRbzB5o+PBaQsqyUFJ0WC3XIxWRV
	li519lvNlCmY8c/OgLIw90STTZpDeK1uWdF7zmblN2FFWQq3WVEfKJaUsUk7vq1Pd3quubJqhc7
	MbjCj7OtRfFbDjE6+t8ByDFqJ2o9+Z8AeN/iPvonAh+scS472wPR2wx618Ip3Sb1d6PzuemwwCW
	QJh2z/tnZeUboG9bZ0VG3GiQTsOsBdH2D0qZHla2wMkDvZs/syFUk0IegiRGfrj/9NuJ5gtsL22
	DWeIrKsWTYTe0C1H+DNWVXQ3hctI5biJC3B9TUkvLqmYl2BZIVq5w/Y7Drhne8xYXYraooHAEBh
	C7uLjsjhDsC/2Ak4bid1vK6DI/JVBuf6B0irfLYFdvPC6XIXpLLh0Y4ykg6zJ2ZLdWgoytKKkpC
	QFEVTwnE30rL+N4WSDMQYLild0OT3QQ+ioal+Knlf0Bse91VtAP
X-Received: by 2002:a17:907:845:b0:c20:fed2:898b with SMTP id a640c23a62f3a-c2492782dbemr1724856766b.23.1787574151309;
        Mon, 24 Aug 2026 05:22:31 -0700 (PDT)
Received: from localhost (p200300f65f19a904efa8a94b704adaa2.dip0.t-ipconnect.de. [2003:f6:5f19:a904:efa8:a94b:704a:daa2])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c24962a3c13sm1308598466b.26.2026.08.24.05.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 05:22:30 -0700 (PDT)
Date: Mon, 24 Aug 2026 14:22:29 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
Message-ID: <aow2GFAfy84k-N2B@monoceros>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
 <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2tfcczky2nyuuvxm"
Content-Disposition: inline
In-Reply-To: <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>


--2tfcczky2nyuuvxm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
MIME-Version: 1.0

Hello,

I just replied to v2 and only then found out there is a v3 already.
There is something wrong with my mail filtering, sorry.

I'm forwarding my review comments to here (the part that still applies).

On Thu, Aug 20, 2026 at 09:48:48PM +0200, Hans de Goede wrote:
> diff --git a/include/linux/device-id/scmi.h b/include/linux/device-id/scmi.h
> new file mode 100644
> index 000000000000..4150481524d4
> --- /dev/null
> +++ b/include/linux/device-id/scmi.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +#ifndef LINUX_DEVICE_ID_SCMI_H
> +#define LINUX_DEVICE_ID_SCMI_H
> +
> +#ifdef __KERNEL__
> +#include <linux/types.h>
> +typedef unsigned long kernel_ulong_t;
> +#endif
> +
> +#define SCMI_NAME_SIZE		32
> +#define SCMI_MODULE_PREFIX	"scmi:"
> +
> +struct scmi_device_id {
> +	__u8 protocol_id;
> +	char name[SCMI_NAME_SIZE];
> +	kernel_ulong_t driver_data;

Please use

	union {
		kernel_ulong_t driver_data;
		const void *driver_data_ptr;
	};

here instead of the plain driver_data member (or don't add driver_data
at all if not needed). This yields better type-safety, see e.g.
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com
for an extended explanation.

> +};
> +
> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index a397213bedac..d241421c36aa 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -49,6 +49,7 @@
>  #include "device-id/pnp.h"
>  #include "device-id/rio.h"
>  #include "device-id/rpmsg.h"
> +#include "device-id/scmi.h"

Please don't add new includes to mod_devicetable.h. That header is ugly
and each include makes it worse. Just add <linux/device-id/scmi.h> to
the modpost source.

>  #include "device-id/sdio.h"
>  #include "device-id/sdw.h"
>  #include "device-id/serio.h"

Thanks
Uwe

--2tfcczky2nyuuvxm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqMN4MACgkQj4D7WH0S
/k4yMwf+N+KJ5sPPSlOgLDa7K8R0+3z3wNZSXpKG1mfo73lwlNuUQ0o9mdIVnCSh
HjOljqygnPT1KDnD0tyk4aBt8VyDQ7dC93v2tUbPE2EFoHWT9BR9lAcDJY3TqVqz
tjL9DZtz1eAcw4OY5tm7FW6fBRLJTlGAgyzkcgBHxrB/6dIPZ2BaHa+eoJFUN6xU
dBhVHRKQFKBn79sVAVD5tTw46v3SHrs1nbvdIsEtAeVZ+RE+fI+LWfjIknQiSaZ3
4Nlmi2JnGiX9tgfeDp4HEArbnCzrtXLfmr4z8sEMjKzmk6yTKI5AxNXgwRVyD7Eu
UpZzkHPe9Uo1jawnTLk7PSsbMrZ2/g==
=yxWM
-----END PGP SIGNATURE-----

--2tfcczky2nyuuvxm--
