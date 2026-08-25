Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 754563E316F
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 08:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787646750; cv=none; b=X4cGtCXNDgI5LDZnrxd0dri1+w9yjdfibMfqmqGQhIord9kDpaAePGo3BHq8k93DQ7lOpKNRVqZsvZHwx5foUa7hpuqt8AosG0qthBdznzl5q4K+12uOGF0rSuzkGKQdWsUZXMG25wVABgbvp/MOISDEHBbb06ml64CaDV8DKbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787646750; c=relaxed/simple;
	bh=BvmmOIR737EjiK/CBJK1dwXBIwsPS1i17yPukRjji44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8neB4XLuHDBGjy3rwRakalahMd5/SbS3vQp3EONPw5kS86e1nCWeW5cS9br0lvmfDPdCqtD3rrCJHV5V9ogzLy6ru0wogZZ6gvyIXuQSlIx4gjNQyzhqsv08qfShczUk23sGDg3Ohur/V7/HXXzPKf3M1EZ0bosL7eQgxvmusY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=lGpPeCoO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="lGpPeCoO"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c15e2dab83eso832394566b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 01:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1787646747; x=1788251547; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lD7UStE/XOr8A5NJ+GnuX9Z5tu/0sy2nS7RxI5FuuYU=;
        b=lGpPeCoOH2AiGyQp3496h8lsOdfml219oaMmYsdUfPBBd7l/cQ+01xjJPAptspaTmK
         b1oGlpEF6Qz0QhML+kJvDlpBFnY+2sYz+mEAHqfEE2zPbDCCnKhOiPnV1P+/n1YTpX7v
         enk+xKTknNxF4LF/MlQbJN5Gg7SnxAgVzOSb3d6Ph9FNxm+OROX0vhAqJDHn6ZfRxG1q
         kO1y3GqPdD9ZoA2+pJdHoP1RjpIldR/6AkT4SijtPfPcXd6G4oCHJ9sFfiKC3Q5cVQxr
         TES7OzMVnBLUiQIN+m0RTrv9TMttgmkFrofW5wTHueAq/pa/cUuu0dsjckNOUp0OPs9E
         g6bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787646747; x=1788251547;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lD7UStE/XOr8A5NJ+GnuX9Z5tu/0sy2nS7RxI5FuuYU=;
        b=fdq4g3HfBVASywF6pcpC7c7mCR/oOFuRfk9xjxgTu1MlBI+/HzPDutCkEwGButuwGd
         S+eLKiPlnvvExJ0dxE/fg81Xgc7T4s2Gkid5AqbZBu1PgrZ/VIDHBjW88ygx2ENINzRF
         uVROpFtX7WA/QeaDhM3DGMHhYJgYV93L2g+rBSSSxVe7CI9qbb/yynRRDpdUb5yfI/Ln
         TOuiEpp/znVjB0RYAnv7bpp7Fo8IWXvomonotJ9LDSzzZpWQRDf85mWG3yuE5JIM/mcA
         4qVi2SNNqdQdMh29HZg5Mf9uOUPu+IhaMs1+e/iNMhmPYqDdJ+AEdCr7Jgf7yFN0W+ye
         1yvw==
X-Forwarded-Encrypted: i=1; AHgh+Rr78vjDaFzs2mDGnVtfWCn3TTm7n4huuCVUOwrgn9+8yGGb708twXLHvZqSUJp35fXn8vKh4AJwMt2XEhcP@vger.kernel.org
X-Gm-Message-State: AFuF++nOMoWDrW2ZUc703aNeO2KtwlvhQsyujXB0NPIOtaRdP3wJxxN+
	xucOVAOOEdNkgmnIv+rND8SdW5JRFkIuclvf6Z6W/S7MsEufEaziJ6wmy1h9AZsrfsYpH2i2F+e
	7lA7IAZE=
X-Gm-Gg: AR+sD12cdpg7fHFS9uzD8IERrLBHYZDGFO5Cl7ENhONNyLvy8GFSimH+iAChzsLpSMk
	JaqcsjqEWnUX/Hg/I22Jgun4V4wGUyzJukGL5e0SenaeumpiIW3H/UCnz05G/tkH8S0Afp1eHq2
	5wIMP8MEYWE9llm1c2xwg2NveBuHvPdj5yLdzn94k+DHc6HjkMi4jXPqx1fjCFWBBbYDlPyZwrm
	C4oCyraRCIZXZKluWEryZ368O+cOWhQW59W6toLMtv6uojuoi5HJbIO+2e9bi2Fdp5cDpJPE/wW
	S1hYvqUmxJULUS6RpLg47adrUkfJic7RbjKGvnnFdMHCOibFkYjuSyDOhLskB3UDFxWM38pr8fG
	WgvjfR8jfGHwiubwdSnR/2PeGpk8V6XFx2i84CHomS0YgmXBPHJxis7KGwZxV5E7we+2VTSslmr
	sZNlQEhxSNFSagCfUiPpj1DFgZ2EUCzkq6gJ5LcxkKvWcUEZotbRr/cJgVCyW4mDhYz9rUhHb5X
	oGlNfuDEVosSDQ8DKEa0Xu6R4BzFavpSdJrIqaJetd7tlAdy/8U/5YZWuj6EA==
X-Received: by 2002:a17:907:9445:b0:c21:6f8c:2335 with SMTP id a640c23a62f3a-c24e5ff7a2bmr571761466b.16.1787646746723;
        Tue, 25 Aug 2026 01:32:26 -0700 (PDT)
Received: from localhost (p200300f65f19a904037016a565660d5e.dip0.t-ipconnect.de. [2003:f6:5f19:a904:370:16a5:6566:d5e])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c249686e37bsm1692467466b.55.2026.08.25.01.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 01:32:25 -0700 (PDT)
Date: Tue, 25 Aug 2026 10:32:24 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Hans de Goede <johannes.goede@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
Message-ID: <ao1SHx440b6OxUDm@monoceros>
References: <20260820194850.459739-1-johannes.goede@oss.qualcomm.com>
 <20260820194850.459739-2-johannes.goede@oss.qualcomm.com>
 <aow2GFAfy84k-N2B@monoceros>
 <1bf5984a-d1d2-4763-bb4c-b17ae8360192@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nfxdkmmv4cdosfpl"
Content-Disposition: inline
In-Reply-To: <1bf5984a-d1d2-4763-bb4c-b17ae8360192@oss.qualcomm.com>


--nfxdkmmv4cdosfpl
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/3] module: add SCMI device table alias support
MIME-Version: 1.0

Hello Hans,

On Mon, Aug 24, 2026 at 04:58:43PM +0200, Hans de Goede wrote:
> On 24-Aug-26 14:22, Uwe Kleine-K=F6nig wrote:
> > Hello,
> >=20
> > I just replied to v2 and only then found out there is a v3 already.
> > There is something wrong with my mail filtering, sorry.
>=20
> Not sure if it is your filtering, v2 is somewhat old
> and I only just revived this series.
>=20
> I'll add you to the Cc list for v4.

If you don't make the mess that is mod_devicetable.h worse, there is no
need. I'm already overwhelmed with mail ...

> >> +};
> >> +
> >> +#endif /* ifndef LINUX_DEVICE_ID_SCMI_H */
> >> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devic=
etable.h
> >> index a397213bedac..d241421c36aa 100644
> >> --- a/include/linux/mod_devicetable.h
> >> +++ b/include/linux/mod_devicetable.h
> >> @@ -49,6 +49,7 @@
> >>  #include "device-id/pnp.h"
> >>  #include "device-id/rio.h"
> >>  #include "device-id/rpmsg.h"
> >> +#include "device-id/scmi.h"
> >=20
> > Please don't add new includes to mod_devicetable.h. That header is ugly
> > and each include makes it worse. Just add <linux/device-id/scmi.h> to
> > the modpost source.
>=20
> Hmm, I did that at first, but that is quite ugly also because
> file2alias.c, does:
>=20
> #include "../../include/linux/mod_devicetable.h"
>=20
> So I ended up needing to change that to:
>=20
> #include "../../include/linux/device-id/scmi.h"
> #include "../../include/linux/mod_devicetable.h"
>=20
> my thinking was that the purpose would be to move other
> consumers of mod_devicetable.h to directly include
> linux/device-id/*.h"
>=20
> And keep mod_devicetable.h as a file which includes all
> of them for use in devicetable-offsets.c + file2alias.c
>=20
> But I can see how actually getting there will be a long time
> in the making and in the mean time this will cause longer
> compile times.

Yeah, I'm still pondering a bit if I should start dropping #includes
=66rom mod_devicetable.h or if that is more annoying. Fighting new
includers for mod_devicetable.h itself seems to be a tough task, too.

> So if you're saying the somewhat ugly thing of adding
> linux/device-id/scmi.h directly to devicetable-offsets.c +
> file2alias.c is the right thing to do, then I'm happy to
> do that for v4.
>=20
> If I'm reading your comment correctly, that is what you
> want me to do, right ?

Yes. I agree it's not pretty, but IMHO better bearable.

Best regards
Uwe

--nfxdkmmv4cdosfpl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqNUxYACgkQj4D7WH0S
/k5wCgf/eIWRfjCexiKewtXq3u4X6kYeqNfHxU/aHRvaG2XAS6E+1RPly2vZKqRP
S+yKDqswE2AFauvgqGNf+U3VjCqnf6AQdButjabhaAkBoumLTSz8unOA54k89HjY
ThBXcUmVtt1D5s/rBi0lh/Ak4BpU9pSqJgw4CwLS0P6hESLiGfqhrD0P3E+/KghH
Le7l4PIbYdhN0xCAObN5xv6Hd95e/k3i5+zG2kmjw8VZAHvQ8eixXynbI6Ch0MOV
6TXmQs1gWz+lqtKVk6SSdOwjQFynbbDGAJdAIkys9CxZxwOGSoJyq6rcnQMn5+t8
awDppaPW9PyQKN759eqifr7kB/XR0Q==
=xnLj
-----END PGP SIGNATURE-----

--nfxdkmmv4cdosfpl--
