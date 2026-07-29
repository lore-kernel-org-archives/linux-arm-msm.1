Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480973CCA19;
	Wed, 29 Jul 2026 20:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785355493; cv=none; b=DV6LA4YNJoDPJWMw7EehA13Fvhxi68IsxRKoujYMpNnyVZSERZXSDgubpz3K9Woswfz1kZ0mLUz0pK7fvcKUQbuzD6FJ50gUcVus7cuvrO7lb6VlyHQXK9t3PS8CY+zgD5a+MfS3NtXHdsTVgGfcOHgx81zqX2E6yQCjZVKoJ2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785355493; c=relaxed/simple;
	bh=JZ9MLE3H9TJ6EGOX5qtqz9ZVXm7ARpOQsgcPHjCEOQE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=np9S8+NLChG+qYBe8boNpe9eSo4VNAQMy/yM+bh6vdSG4NSHEvCkmKxuKwLlaa1IQIuvXJqYyVJlBUIf1/2gQ8pot5coeoDiolagCL5PdURukk6tI4XSG4whwDabBz2UqccvBFblI/In8GsCw6E1YXAMDGvHHshbsKyRdY612Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A8l1lS6t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A8l1lS6t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4350F1F000E9;
	Wed, 29 Jul 2026 20:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785355491;
	bh=jaR4SAL/ghbKg4OExwH9psv9FHOylZnxt9q6YxKaO2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A8l1lS6tHFmQHP7mGHhV9HRmrhJhFN5WMOM4nyd6uokBLjHsY7sLFC1n1l4pA59G4
	 T7HTNV1dG3agD/BGfrQHw41ioi7xGQKruK9IK3yro6p2hQn/zsog/6m0yF2sU8AMtI
	 JFW6/AWDU7ahReI6av6hmPPu6ojM+8ly2xAESRisPyJ480ItqAnxB6R6cWR2gJ6Tui
	 sZ6Yvzdb37Lgsvv7mBqNKvm5u0kgIfsTlEyW5Nn8RhEtZuKIt0FmLVg/hymg7OfvzS
	 ydhmjhPzFJSlH1+GuNhw+efGU/LETouV5+vcLfxwM6utNr6QzILsboovC07RT/h2Al
	 QJ/9QWNn/6VwA==
Date: Wed, 29 Jul 2026 21:04:47 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <bc461376-292d-4550-8518-3b84eb4fc602@sirena.org.uk>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
 <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
 <da299944-0093-4d1a-b092-f7857b101199@sirena.org.uk>
 <gaigrfpfunsqwuxf24uonw4mrkdse4ap3cywi2eg2qdyfgfzsd@hk6zghfqnkty>
 <amNfHiL2W-uLlPjY@sirena.co.uk>
 <e25dsbpp3chldtoh2awrtxfxkju3jevphn5pcoqvfehibwg2nr@yj5pfelpti63>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Ifbv/oNmyhmtpwZ"
Content-Disposition: inline
In-Reply-To: <e25dsbpp3chldtoh2awrtxfxkju3jevphn5pcoqvfehibwg2nr@yj5pfelpti63>
X-Cookie: Captain's Log, star date 21:34.5...


--5Ifbv/oNmyhmtpwZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2026 at 01:11:36AM +0530, Kamal Wadhwa wrote:
> On Fri, Jul 24, 2026 at 01:48:30PM +0100, Mark Brown wrote:

> > No, that's not the point.  A get_status() operation needs to return the
> > actual hardware status *now*, not a cached value from some random time
> > in the past and not something that was written by the driver.

> I can drop it. But I seek your guidance on how should i implement logic
> to HOLD the enable/voltage/mode for the regulators which are turned ON by
> bootloader.

You could cache the values currently written to the control interface?

> I was planning to use get_status() (in a subsequent patch series) to check if
> the rail was left ON by bootloader at the regulator registration stage, and
> use that criteria to decide if we need to hold the voltage/mode/enable state
> or not.

That's logic that should be implemented in the core rather than driver
specific, this is an issue that affects everything - we just mostly get
away with it since we don't start touching things until drivers do so.
It's a real problem, just tough to solve.

> Besides this, since the sync_state() cannot be used.. i was thinking if holding
> the voltage/mode/enable till regulator_late_cleanup(). is that ok?

Consider what happens if something really needs a voltage raising to
enumerate - if you ignore it then the hardware might be in for a bad
time.

> > > So, shall I read the HW MODE/BYPSS/ENABLE value in every get_status() call?

> > If they reflect values that might be dynamically updated by the
> > hardware, yes.  If they are just control registers that the hardware
> > will not update autonomously they are not suitable for a get_status()
> > operation.

> It not will autonomously update, but it may be updated by the APPS bootloader.
> I guess, that still would make it unsuitable to be used in get_status() ?

Will the bootloader be running at the same time as the kernel, I really
mean "by something else" rather than "autonomously" - usually that's the
device itself (eg, reporting that a regulator was shut down due to over
current) but it could be something else I guess.

--5Ifbv/oNmyhmtpwZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpqXN4ACgkQJNaLcl1U
h9B0HQf/Rago1E98pkYI2E+J7WjYeBPpBRQhYTJVYtzNdQSDc9E0L9RRC+xN2IJV
3MAh0sYvR+z7IB1Ub6EJY3GtVQQtj8cohKXKeSfoEXU1sltIo2P5NGq/RL52/qvW
ub9OwU2FnankhsU2Z56DEb27hh0cW/luhhgMvs3EdZ723GKsvSEBwIw3j1JiUMcp
2gfVpZD7mq/YbHTAlfQDqvXkybtAtArONbbesFSOXdhLynUBJ0U0YcqQhaydtimI
SxeOXOo4rhQQNbjSyhl0dHI7w3id3wtpCSJ27hxOD+gqv1c9Op3m2B5CLR1lCFOk
KzVunrOu12pux/20DHpMPl/HCbUDCw==
=VZDO
-----END PGP SIGNATURE-----

--5Ifbv/oNmyhmtpwZ--
