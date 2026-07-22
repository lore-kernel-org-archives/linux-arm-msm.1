Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA85A471CF1;
	Wed, 22 Jul 2026 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738810; cv=none; b=JePdN8AppgcCBg67zSiFv8T72cirt5unJWP+YWsJzjlY7sFI9HPWMmwFKaRM6vokcpqZWv9KvV9aTvRkTZ9tzpW9cMjDZV/GkVg/eLLA4cE/ZbFz0LiCpz4+Ql5OhxZxc0QwXt51QvkuhlHu9M0oz0Euo+uMjZFBYGWln5XbJoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738810; c=relaxed/simple;
	bh=dGVOW0fNFy2k+utYdf7+ICoA7n39dvJq6Nxizw1P13U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WYWAtUEf4HIGR3IrvTiB6xqiEiXPBOfgbguSTrx1peJhbRZl5FhJzSnP9FszIK5K0cWjlW6v/kpb5AyRCqVVnfdgUcoPZahgJC7nyWKCdAkwJBeBmafJRZVQmc5LN79Boe6aJjo0sxsUvAh0DxYgkQ2t2/x5Qc/SDFEcplo2g04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1UxmbHK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1UxmbHK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBE4D1F00A3D;
	Wed, 22 Jul 2026 16:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784738801;
	bh=sBn9fi4YkrZadcUimuxkLNchnROOlWrK7qc+5kQRAdY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L1UxmbHKiDabvgbiYbOFWcVOXV91s1ZBpsQGkopFA+ntxoYD5EZrAn1tUdLKYsz/b
	 AYVXXJLjPqQIl7yLjfWRAuU8MZbNVGk05dKsAeA9JnEC3hrtxf45LqfNaK7Jw8Jphs
	 OolnTWVB0IpGA8FNe0dpjZrwHbv0pJ5ZbzwPHd4TxLl+kLuAQC9/HsVqhEN0HDZ47Z
	 uKlWdl2EXDIbIaFphn0LdoYcy3eli15maTgwc28g2CtROTrZZP+DV8dIH52K4Vi7s5
	 XOsKgVQ+weHKA6T1fs9B8BPuOHiEPs6IcZ79wxN24rb+KSlYM9rQL3GMfK296tVEC7
	 +dG1fhQ2Wzl/Q==
Date: Wed, 22 Jul 2026 17:46:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <da299944-0093-4d1a-b092-f7857b101199@sirena.org.uk>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
 <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XEL1f9ee3x3d0UZD"
Content-Disposition: inline
In-Reply-To: <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
X-Cookie: Life is like an analogy.


--XEL1f9ee3x3d0UZD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 20, 2026 at 09:06:40PM +0530, Kamal Wadhwa wrote:

> Currently, during regulator registration, regulator framework sends an
> unnecessary `min-microvolts` request for the rpmh-regulator device. This
> happens because in current design, we do not have a way to readback the
> voltage settings that was set during the bootloader stage.

> +static int rpmh_regulator_vrm_get_status(struct regulator_dev *rdev)
> +{
> +	struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);
> +
> +	return vreg->status;
> +}

A get_status() operation should be reading the actual hardware status
right now, not driver state - this should be reading whatever the value
is right now.  If the hardware doesn't support this then just don't
provide the operation.

--XEL1f9ee3x3d0UZD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpg8+wACgkQJNaLcl1U
h9Cvmwf+NUcblreFdLy1nC6HvyvUWYWg6C4vXuyZKuPx+5Oi+0kkzQB6CXkqm0Cc
Y5QcEWb3m17g7JP8uYlXTYfWCtsyBDUUQZD86phxwXahhpDZska5lUqYKYX/PQt0
yVdMrKCNca1zq4Y6t5lTEg+HYG68aYyhpofST5fv6NayjbXmiXEWjQAXg1R16tEh
yCVvZA7lcKDrhx7aAbKuxRlu/igKqFf91e0x+xYcmTRXKOGoo3R3+Pct9IJRtNUm
B5ZbgjDYNSma83qOw3mRSDb1d5TM09WvaOq1M0/hgyCa7wRFL/3WD19Z8Fhepg5b
m4Sc0JI7/OxWxHMqDJGtYRS77PQzKQ==
=xDhH
-----END PGP SIGNATURE-----

--XEL1f9ee3x3d0UZD--
