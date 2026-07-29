Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F60381EA3;
	Wed, 29 Jul 2026 23:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785366691; cv=none; b=Ouc7Drl3VGFfZeL9gT5IPiqBuRkP3oSMJkHZV3TA07JAPAFwyu1upsTWGs4JI34m5g/dGsZM/7W5r0ObWSpGtIowGh8UjNjRqpNQRR/RULkN3r4XPq+3+PRbv/yAj0JeWl6QjcadUaEviTTfWT8QtKQUwcTuovUcLYOIM7pgs8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785366691; c=relaxed/simple;
	bh=xVhJMoGB8f/Wyc9AcM3Qk4r5yWG7dabsKJ8X9m158oM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAE4BtXgxHITBibJeV/L9jCIO9+ZSMH+RuIbrN0Y2BIBCnI9HFRN+xiwc5b5wYW7TEQ8AdQ9kM2GaJu7TI+bKNAM2XpYxebKts3SixjT7ORIaxfkix/4sa6pukKPCCKSlu0846l40c/b96yN2EUEIU7mXd3RqJRJa70uJ1ZYWns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F8swS/ca; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F8swS/ca"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 961E91F000E9;
	Wed, 29 Jul 2026 23:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785366690;
	bh=JPrRO2GL50+pJAUYIEECC/MaO7uH5tNAKmX17j7xXnU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=F8swS/ca3u6mpgMpAOSXcdBx+Q5nrwoHKimqnT2xRxM5lKUzbVhkYnQ6Iz0HR/F82
	 IcGWL1dcuq17ip+E+pWyHoeXD2kVYEOsRkDUskde02YS3Dun4XA8ZjNjXqdT8XMR5L
	 JdOUYxnBBKLDVxyXNOWP/6svNmK4YTR0xKOLsValS9j0UKyORslbvuD9ndLTGPipHo
	 kA9ewgWxKuY6Y0WoR225dwFocXAkAa0HJFPs/rIgcrtfOIY6P59LTlbIxOF0srjckl
	 QuIhJWa3TffTfCQ1vFS2SfpfwBNEJXgdx6+DnmFAm6ZP0WxklkDtgTHDNP2rxiHfOz
	 tU1ao92tb8IFw==
Date: Thu, 30 Jul 2026 00:11:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <791a22c8-8c3e-403d-9737-c5957ca2a0d8@sirena.org.uk>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
 <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
 <da299944-0093-4d1a-b092-f7857b101199@sirena.org.uk>
 <gaigrfpfunsqwuxf24uonw4mrkdse4ap3cywi2eg2qdyfgfzsd@hk6zghfqnkty>
 <amNfHiL2W-uLlPjY@sirena.co.uk>
 <e25dsbpp3chldtoh2awrtxfxkju3jevphn5pcoqvfehibwg2nr@yj5pfelpti63>
 <bc461376-292d-4550-8518-3b84eb4fc602@sirena.org.uk>
 <j2tncckz6mex4q7yqkw2prpi5yml7sdka2etlmnf3knyamvfun@pizpb76ilcsw>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YMspz0hZlNo/nuDB"
Content-Disposition: inline
In-Reply-To: <j2tncckz6mex4q7yqkw2prpi5yml7sdka2etlmnf3knyamvfun@pizpb76ilcsw>
X-Cookie: Captain's Log, star date 21:34.5...


--YMspz0hZlNo/nuDB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2026 at 03:28:39AM +0530, Kamal Wadhwa wrote:
> On Wed, Jul 29, 2026 at 09:04:47PM +0100, Mark Brown wrote:
> > On Thu, Jul 30, 2026 at 01:11:36AM +0530, Kamal Wadhwa wrote:

> > > I can drop it. But I seek your guidance on how should i implement logic
> > > to HOLD the enable/voltage/mode for the regulators which are turned ON by
> > > bootloader.

> > You could cache the values currently written to the control interface?

> We can cache it, but i was planning to add change in core,
> which will require get_status() or something similar i think.

I would have thought we could use the currently configured state here.

> > > Besides this, since the sync_state() cannot be used.. i was thinking if holding
> > > the voltage/mode/enable till regulator_late_cleanup(). is that ok?

> > Consider what happens if something really needs a voltage raising to
> > enumerate - if you ignore it then the hardware might be in for a bad
> > time.

> May be we can allow the up-ing of voltage/mode to go through? but cache the
> lowering requests for voltage/mode and apply them in regulator_late_cleanup()
> so we are sure that there is more then sufficient power during this sensitive
> phase. will that work?

It's certainly much less likely to be an issue.  There's some similar
issues around enables for exclusive regulatorss though, and I wouldn't
discount lower voltages being an issue (off the top of my head I've got
a feeling MMC needs to lower voltages to up clock rates but I could be
misremembering the use case).  Whole thing is a massive can of worms,
that's why it's not been addressed :/

> > Will the bootloader be running at the same time as the kernel, I really
> > mean "by something else" rather than "autonomously" - usually that's the
> > device itself (eg, reporting that a regulator was shut down due to over
> > current) but it could be something else I guess.

> Ok, so is there something similar to get_status() that i can use to pass on the
> info to core (from the driver) that regulator state was ON at bootloader stage?

is_enabled() would be the usual thing.

--YMspz0hZlNo/nuDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpqiJ0ACgkQJNaLcl1U
h9Be3gf/di2sXqEtyYXhmHQS5pr3XLxPyXCMDpocWS6hzQxTPETLmDqxk1v8MTbU
fivXkGO6pik+LXDHNJRrGxJGAtF0owCnuxT1lkJEM/NBDNd1Nc0cN0qy8CCf0uDC
UjaUYW7ekbVryQM6+uFjGCRNvN9xtgIJTGSqN/aBqjvEK8yfaswXT2m8ZddZnqdt
XXQm6Cpi7fPypexD12aUuVcIGqdfpJLV2r0FmGOiW1ccavgdai4+VHByuBw/Ou3Y
E3X/jtseehiIh3YcdU1ZEAqT45RIlP9EjwKk8Oz1g767oJOTxNALLXckYAFVkOM0
38Czk+/sMB6ohX/bPwO4qwEYcPlbpw==
=kwvh
-----END PGP SIGNATURE-----

--YMspz0hZlNo/nuDB--
