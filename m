Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA455463B64;
	Fri, 31 Jul 2026 23:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785541185; cv=none; b=FCAx5emmcnjyDw3MttOVLtEIsPZDJWBOu8FeMVyvbgDRb44+dgnKVzxflXmb105qpTHdsdOIT4K2IWJDda6JbyXX55V7hoLNkV0W3yRB4aEqAr+qSi2W+btcrg21SZP6MXC4+yZytJRVDVEqTPWzq68Fvi4dsX5zTQriTHMhHSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785541185; c=relaxed/simple;
	bh=4uE5/fcQ3jfl51ZrUUAoXXlOzG4oGXVZPmk/5ODVK2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iE3bn5Poso0deEPWGaq7SHP8CkAqjQ9QyxPQoyD8WQsvG+1Qu8IzD8UPqEhqyr3Bs4G6J8e4sqzSs+d0u2p7W+NOHFeQa0FTiKU4SuLLOYHJk16UTOVG8RRgVCv9s8+6/vLddOYjorGtMmpmG3ZjwU/axqYOuSsWpNbYV/LStUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4mTy3kQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4mTy3kQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E60F51F00AC4;
	Fri, 31 Jul 2026 23:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785541184;
	bh=vPzqZPV68utA6ovAw0l48Bj6JsT8Pzq6ThUdpqZlDBQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y4mTy3kQkCkHVgY517fEvq/TZYXgAbq8epcYt7+W56aUXWkMbzuTWtMogMi7JAlgn
	 5e+nUeXYNUvffH3+8dlPsxE84zJ+JhNgE4LO9F9os8IgoHeyjPX8I6dPcdp2iDxKWA
	 gDJkrQ6c1SFz6bn9P98LY3Xb39/7YonvtSpKal8TafyTDsMSDME/Ww/jfCRcbeYFNM
	 Kr1007y0FsboiBuxWqGw80rGl/kQOZiUqLml3RN61z+zJTWCUFNw5nRz52D5fJYhbe
	 FV44hfcT4CS2vOM7y5IktlDBWhhmSVM5qqJwcGfpV+Gt0chOBhX7Vej3PNprk+wFg7
	 VMfCmYyM0hR7A==
Date: Sat, 1 Aug 2026 00:39:39 +0100
From: Mark Brown <broonie@kernel.org>
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, Vinod Koul <vkoul@kernel.org>,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/4] regulator: qcom-rpmh: readback
 voltage/bypass/mode/status set during bootup
Message-ID: <f36836c5-6f96-4749-8cf0-80ceb7f8a572@sirena.org.uk>
References: <20260720-b4-read-rpmh-v5-v5-0-cb93fb95f565@oss.qualcomm.com>
 <20260720-b4-read-rpmh-v5-v5-3-cb93fb95f565@oss.qualcomm.com>
 <da299944-0093-4d1a-b092-f7857b101199@sirena.org.uk>
 <gaigrfpfunsqwuxf24uonw4mrkdse4ap3cywi2eg2qdyfgfzsd@hk6zghfqnkty>
 <amNfHiL2W-uLlPjY@sirena.co.uk>
 <e25dsbpp3chldtoh2awrtxfxkju3jevphn5pcoqvfehibwg2nr@yj5pfelpti63>
 <bc461376-292d-4550-8518-3b84eb4fc602@sirena.org.uk>
 <j2tncckz6mex4q7yqkw2prpi5yml7sdka2etlmnf3knyamvfun@pizpb76ilcsw>
 <791a22c8-8c3e-403d-9737-c5957ca2a0d8@sirena.org.uk>
 <bu2teppx5i2zuz5paq3gkdluizvaywbdtz6frhe3qwihrgph3p@kts2nhyjkbax>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="52SzeKNP/XfGtbOQ"
Content-Disposition: inline
In-Reply-To: <bu2teppx5i2zuz5paq3gkdluizvaywbdtz6frhe3qwihrgph3p@kts2nhyjkbax>
X-Cookie: No shirt, no shoes, no service.


--52SzeKNP/XfGtbOQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Jul 30, 2026 at 01:40:05PM +0530, Kamal Wadhwa wrote:
> On Thu, Jul 30, 2026 at 12:11:26AM +0100, Mark Brown wrote:

> > It's certainly much less likely to be an issue.  There's some similar
> > issues around enables for exclusive regulatorss though, and I wouldn't
> > discount lower voltages being an issue (off the top of my head I've got
> > a feeling MMC needs to lower voltages to up clock rates but I could be
> > misremembering the use case).  Whole thing is a massive can of worms,
> > that's why it's not been addressed :/

> Do you think allowing this behaviour via a new regulator DT prop like
> `regulator-hold-on-boot` to allow per-regulator control.. rather then applying to
> all the regulators which are ON at boot.. may help address some of those concerns?

Possibly, though it's all feeling very implementation and not really DT.

> IMHO, from the design point of view it has to be either allowing all the requests
> OR allow only the up-ing of the voltage/mode till all clients are up, may be needed.

Like I say I'm not sure anything survives special cases well.

--52SzeKNP/XfGtbOQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmptMjsACgkQJNaLcl1U
h9C+7Qf/UgPH6g7uthgryPWeBlsDMUXqJjxltaEYFigMu58pUrYZQSUFfvZIR1So
LzhKmYdxO4yJ5ie2J/BuajcxkgHEi1ORDXX3uxelvUQru66IkajMEIHMky3p+L/F
hc0RBkA7M3cL+ZN/ONylL46bV9dVdQortyRcbl/kwgHYLXeTgEJ1mZG0cPJUxA28
RGg4RW4WOMcM/YlMz9a3ZuPoWqMwKfbRgcE+SgBzhrsUCDVjRrRwpt3FR++m7nld
V1X7kAlbZ7fvk101X3BsR5U74Wl8DvunEkAH+hyJSyN7/B0T5IHhQld9ykTeaEnX
o/epgI/SbkZi83EIf8NFI/HFAvYl5w==
=ObXl
-----END PGP SIGNATURE-----

--52SzeKNP/XfGtbOQ--
