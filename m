Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795701006;
	b=Wo952cjv6fhmICBQiPWRPygmnnYXIiF4ZQstuYhCpM/N5mJdwUtihqaGN0ZyBnO+UJn8
	 SVQlpmrxzvez9Vahkob9ovclaRjcRAIGPHzC+sdPszwH7CWEtCjObkQc4A4j2QmYdBXoX
	 wjtcsq+wrJliCuwrz+AtUSYsK+0DayGRzRNizNfE3GBrBZm5f1hMwGCnG3qhVsK60Bl4U
	 nlqoGWH1dfB7wgPFfRlmjgTnioB56CBetUJ4hB0Rr9GOdf9qW0g0SwTgTfojuwojqPx8K
	 09YMG4wyGB+Ixbcvby/99wxyErQhw4fBXOf0+1aJL2VOhm+rbTnlZC7LV4HRw3DSiPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795701006;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
	b=cVmmFu1iyIIRYK8S4/v2ZNLNvtQHrpl6YbxF2XD5QiD6PfbYeV5183ResWBWbkoCZ5if
	 QW4Un2qYjGMrZddKEhPCjb1y1CD8D/kXvuSy3W2bLJU+JKkoLxlgXVhZJk1pQ9BmkMuSf
	 +If5nM580ZwetIJfzsYLUmIm99JvYwMY6a/jAINmqZyHNE26RGBqMafiqcML8jqPoMyEy
	 s5uESvGhzKROlFCf03ZKTT7jCLyuXDdsBksbG9bqqTHVu3nikosQ6oIT9fiWJgCGw0a8e
	 u+4EZawvF26eZsTQ02O2OIjqTh3wSvSakPHUGPlf3m5xGPUIpl856Wi71/zF+2RjL5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HEwQyzgC;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708C6606A330
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 13:50:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 708C6606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HEwQyzgC
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-49465892f7bso5136856f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 05:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795701004; x=1796305804; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
        b=HEwQyzgCCIfsVYHkVbmM+YTPRxGBrue358ebBtB9RAGDX1yeSFqL2CvlCqbKGnV3vy
         lL1uCOOh+auuhxJbFVCmuSHE+kVsL4z8vg7BoAZpdK8JvhZYaYrljBmF8sN/Z0SaRGgy
         iSDCDSsvbQ+1VV8q9NV5yhQOBr3/yiWFjsOqATFT6Wh+bRB/hyqItyURAzZBC/xVHmqN
         pGRbUTF1Aj9FMR3lIK7FDVXVpbfiB+yA/HqBV0H9oTSP5fQOt9w4xpZogiQ6nyvyXGNF
         mpRdJGoQWeHhkGroE06n7RKJyykiXFC14T0p42YH11syijtZFmxZ2byyL3cTqmgaFtd/
         KtEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795701004; x=1796305804;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ayDmQOMbnPDID0tnpH0Cz9zV9aQl1tR/L4IizHW7J4A=;
        b=F1+XxrnJGuXQqOK57XmKOOFKeOVOq9OZi0TZsy3h7DRk0Dg9r/Dg2+qxkVMu4Sc46s
         sVG1y21eLSFrqZ8sWadp3haVzzgPh98ELpLGvqMDttsaR10fNvwTouRlRLbCg6uwIja6
         eaR+GBS4/2W0uPKzS2ZbsvlNc61v/4v06An0qQaKyDTqsxe3lw1uSSmQ7CzFTm4So5E4
         59eVxpWEDm/5pm7ej41fc4lV0eahA3Qd9ZQKcEDGfclkG+bt0VO6GylWOu0DlrNVKT53
         56lRVyzVR4U/XOmpYYaQ6ZhZO/up2DSWFXaBLN6rPsiwW609AYoxEmHdQJ1cL0fKWv3n
         uuYw==
X-Forwarded-Encrypted: i=1; AL+hErHRawDnTxYRUlbRkaZ0mLHH3nB1nIB0m26jyo3mzNlel+VeYykEKdCIc5RTk0Cat0fNUS+G3wnso+9tuflp@vger.kernel.org
X-Gm-Message-State: APuU4Z/fGKSkPYzIbtBaHe59/timkEdgfqRgWZUbmc3ItcxQfEiZKuSK
	/QYc5SrBDiATE29OsQMp3v8Pyk/w//NBbAd1p2tvh9jQh6Hf0ocYZYuyJwZOev8pm1o=
X-Gm-Gg: AZFdTZdHUFHg4cgZMGLka8bjb0UFsw8xjnKmF9yh/E+/iAUnKcmUKwo1BhhEiUlQcHE
	GE9/jW6oM9A7XMvyHWFWrDqGjbx6AvPM2o+q5jFksNFZzKTc+7ny2VNSxN5VBxI19NPP6T4YT8G
	Oujs2mr7KjGejtsNLDmuu2vCs11hpkMUSwxbpSXHgEpAzrXqRHLdPx0CsQYDPvAAHGn2MFxnaCh
	JtR6YPfXZiW7ezlofH/Ue+d0q+GF5VGlzmsKIWOD7AjqjGwo/h6pKR2B2KukFc6JpbgXWHIlDlH
	NWHEo+ehUh+2mtp1ts/quAS9j2rGcv9BCH3GmpnibcoThyqRYupjt5RzIMo+TCGi/+PoM0ahxqt
	xrTLzR/7OKIRvkVsN5QnS00t3QZdsJTU8IwXo/MFsBeVitqgl82rQg01BC+N8QYFBJYZ4ZDKjEc
	CGqwFqtOoOyMEfm3agITexqJVPLEn1Am3rPviz6XNn7McZNPU0OM9aqxI2weAU27rRNgiHgEIJ8
	ypVqv74yxfsxvkqF8eE/ldiknSYyGrLKRQS9kSKD3p0ZmC1iceicjD6iW+waE020GWOB/rrZSeI
	luyllZU39lKXXqVl1J4zVzLVuZgy3/Luc6bcChjjHiys2a65UVpwHx9C3rOQdJw1T9A/kFxjfSV
	kI/ahUDbNwcIX6KUviLj8osbvC6of/VmDV9j9
X-Received: by 2002:a05:6000:4b17:b0:48e:f47:273c with SMTP id ffacd0b85a97d-4abaac57a40mr41489070f8f.8.1795701003612;
        Thu, 26 Nov 2026 05:50:03 -0800 (PST)
Received: from localhost (p200300f65f19a904aae808b8a2e91502.dip0.t-ipconnect.de. [2003:f6:5f19:a904:aae8:8b8:a2e9:1502])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm40247966f8f.32.2026.11.26.05.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:50:02 -0800 (PST)
Date: Thu, 26 Nov 2026 14:50:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
	Takahiro Kuwano <takahiro.kuwano@infineon.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Alexander Usyskin <alexander.usyskin@intel.com>, 
	Joern Engel <joern@lazybastard.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Shrikanth Hegde <sshegde@linux.ibm.com>, Michal Simek <michal.simek@amd.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Brian Norris <computersforpeace@gmail.com>, 
	Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, William Zhang <william.zhang@broadcom.com>, 
	Anand Gore <anand.gore@broadcom.com>, Kursad Oney <kursad.oney@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
Message-ID: <awg4ubbFu0FksThB@monoceros>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros>
 <87v75jyiw2.fsf@bootlin.com>
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
	protocol="application/pgp-signature"; boundary="fjhsfzw7maxs7oq6"
Content-Disposition: inline
In-Reply-To: <87v75jyiw2.fsf@bootlin.com>


--fjhsfzw7maxs7oq6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id
 arrays
MIME-Version: 1.0

Hey Miquel,

On Thu, Nov 26, 2026 at 11:41:33AM +0100, Miquel Raynal wrote:
> >> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> >
> > Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> >
> > with or without addressing the nitpick I had for one of the patches.
>=20
> Let me know what you intend to do.

Your mail was sent To: me, but that was directed to Pawel, right? (FTR:
I intend to do nothing here ;-)

Best regards
Uwe

--fjhsfzw7maxs7oq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsIOQcACgkQj4D7WH0S
/k7VGwf+JohDT6rUS7ETNio1M8Z7P9mW/dw41gur3gOUE8OBNxOfsasQ0n/riOvo
4sT4fsGJWgm+ezHKcYcrXNknVg5Hmfpk4HeA47K1y+P9G6LhwsBLtqRGMM/7dCMd
nWmBVR77ExMyThLv6M2Li7HrkLHKSnuq7/HXqOD93OrqD6YYrrRBvTsBklbEdhWB
wm40UJgQd+3R2Lwq+CSDVUYqVGj8LP+XGj2vNoHXEfGlk93ZED7JguilGU62561G
N5qNDGfQC+CzqYC7tQ2tj0TNnOK6kYXrK6jxThQovh4ubLadqtHT7mVLa3qbS36h
iO7uFgMsn6ww6nNgTXKWH62VZzkJPg==
=6HjX
-----END PGP SIGNATURE-----

--fjhsfzw7maxs7oq6--
