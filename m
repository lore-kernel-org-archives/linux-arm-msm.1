Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795627314;
	b=pBAS/5zJ4/gu5QPhxBWMM1ZaY71un8g6fdKQEO1uouK5y8iiBsrxfvzBTd+f2Ducr2Wb
	 dRdfuaT8DhgS1PHcP6H+05dP7UYsVwXUfSgGhogbVSbeq7fOt03Cx1IItHxVofh0VLxt/
	 BreviJNLlMDBpjjwvt5SicUSDs9xbMR6bqypOS8sR1lj6MuVtXux6nk0CK68B4+HvYu3o
	 /ndvD347nch5S65RS49ynZMZ0rNlG4QkARiOfiTuJkECcUt4aAPLbiywq4K+RmOc2Tsoe
	 01wlJL+Lpsp6xwYEp17ci1DyD1XvuFuOcwxvXXTtPKHsaZ+tQC8fRdoXikHRrUdqA4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795627314;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ENdJgXbQROCmKdJO5EaJi6MoXgKwvTQsbT7XHtvuy1s=;
	b=PnatGhk+WJexFsRIwq53oIc7PGPFlLvpiQSiWrnYGiewfJh/GnjepAzB5opgijVWBhyG
	 bw+xOONfDomqYB2DyFHDh8SsAW7MWsweWftT3pYoBfDTVsGpXNopusFe7NbKs7zh5j35V
	 n0fF3XgODzzz+CbYiyJisTTC6Ppg3CnZsRk0jxaT9lbRz1kIQzPgTCf28OX5FEDqDQsh5
	 doNdJu00Q8PneawuCSaplcUtnx4EvcpPUpSysA1V9/G0Qb18xtBQeDQze+69CIfuCSlk7
	 xe/J9OU4wBPJ5mtYbYuJ8KG5Iz0QILlavcMhZVuruGY2V8emO/kW07+8t94lbZYap3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O2Q9k62R;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E6A606A329
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 17:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E6A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=O2Q9k62R
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso47899795e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 09:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795627312; x=1796232112; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ENdJgXbQROCmKdJO5EaJi6MoXgKwvTQsbT7XHtvuy1s=;
        b=O2Q9k62RlVFg4OKwGxOkVt681Enav+V5SL9h+JaY55nhxng/Hjevm6wB40DZnXbdqK
         /n1aJwFKxSnab9rmFsaNjnGc01ZTnrUqeg/mGiO8UTFufzkkpOWQTJ2ya6D8hGjMZEjz
         Nq4YyHQGciJKXpTkvosbzdidaOq/LtbVFTqa41QUhAh5Z2wsKAqpMP6Pak+S1S+n6Uj7
         YgGd75Zu/sEL31B93TpR4BvmuF7++Dnvbl4I94/CpIpOazJ+W0z8C1xKF+5sKJCtDtfd
         eI8+5O/i4x7e9OoPUsoYVaXemK7dnyw3lXxBVOvLZ3nzcn0GAREIUEA7iKsiNVaI6DG0
         o0Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795627312; x=1796232112;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ENdJgXbQROCmKdJO5EaJi6MoXgKwvTQsbT7XHtvuy1s=;
        b=BkvKO/RMa1jHzUxlldZhbuM3lZJTrg4olTHTd452UXzjz9+tRQwHOeZf0s22BOpKGM
         8yPZNeexHZn0I3a6IHcYf5tg1XGnVr1s1db/eAsIndaKnTyxqrzpy3TQZesI9sNAC31e
         OzM+Vd2rDYBFj4WD1GRi+nJNLjAsq9hXqjFeIa5uYZjIHkP44G8zepnELma50yOQddvF
         No990/LrMgbMZiKcCjxW8nQ75aUNXV7TDmNDTgRK+TSvGl1udXljaefTK00rXEKvokZ/
         uUz56TTaH10eGWoFHAM1fy9JVhF2SOZ4Q/lvdwSs0nDUPHkDDjKTC/BYBCW9bmqo2E+7
         t5vw==
X-Forwarded-Encrypted: i=1; AL+hErF9ozKF0zOR1NwRTgAMG9EOqx0eEyHBvgMEFJzwzuufeAlilFsK9+nZdxWpgIRZ0s2afb9NIxsS80wOT0C2@vger.kernel.org
X-Gm-Message-State: APuU4Z8qKyjDNs4JLwuQFi6FQ49yQ6ImxJEWfls+Z+AzGTBgcKkiJ9D9
	U+qR5VkdUaQ0E8kFWuocxded+SvdZQhjWHx97V2j4sOrBxcCLYljCiEsEEN4V9/QarY=
X-Gm-Gg: AZFdTZc5MyNURieIpNe0mF4dM6IV9QCHtDmu2Mrwzy5mH/AnhiyZO6f6YItObVAcut/
	VEO0ZnVITPtUC2kflbwcAUAyZDxgWgCXYljvK28iOxxYxFaCH47OiVNdom3EjiqR9TvNShYDV4Z
	sDlExxDJxDC/7olRo/rTjT/WSVg7tLVKvcNjhcuu6vTHK1bwO7Xy8ZFfCVbYiDPSkNsi/6VUe6t
	yELe8JVHx3cY+sGtVfelnJg8InnacBlk1s6+wEyycM4UKABJgljA4JTuPTan0diDJzWoe8NBuvz
	7Sei2xHNtmCnEW8uP2+ZQIqWFBHh93URmLKMmB98WBoBUIM72Ln3hZIDCwcZ1Rlsa1tqmhmLNsV
	JxXu588JQRkDfrr3C+wSoiZmqwWKK+mfPjb0vE5Ko/kc6B947cYsxnhLIzxinJr+w/ErDzukp1o
	op2CDetCYlSitv098BXKzmeQYZHEDl/tvpQuu2o3wYnAbDzVMITK/h4jCXtw3YPAQrIUoTuo0kf
	mT6/UHi35RNcuYIWth5oXPKyQ9FvvxfUFIMu+DbO2boHfSFRqOspR/qQSSh45PEDShrbZ91vzw5
	SnDaZyXP/mQEJ9kjBrf+zn2XEdgPMQ0iCM04FJaF2NwlBvE1xFDtCFgPwvLkF+yoxt7Tuk6gntu
	pd2tGjcv7WSkyp1LR
X-Received: by 2002:a05:600c:1547:b0:4a2:397:73f6 with SMTP id 5b1f17b1804b1-4bb8880974amr419686485e9.8.1795627311811;
        Wed, 25 Nov 2026 09:21:51 -0800 (PST)
Received: from localhost (p200300f65f19a904452474b9d670397a.dip0.t-ipconnect.de. [2003:f6:5f19:a904:4524:74b9:d670:397a])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb853b216esm590410475e9.12.2026.11.25.09.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 09:21:50 -0800 (PST)
Date: Wed, 25 Nov 2026 18:21:50 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
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
Subject: Re: [PATCH 04/10] mtd: spi-nor: Unify of_device_id list terminator
Message-ID: <awcY_FIcD-Lt0_am@monoceros>
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <20261125-acpi-mtd-v1-4-42ad2f645bee@thegoodpenguin.co.uk>
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
	protocol="application/pgp-signature"; boundary="vscxo3nc4bzujlaw"
Content-Disposition: inline
In-Reply-To: <20261125-acpi-mtd-v1-4-42ad2f645bee@thegoodpenguin.co.uk>


--vscxo3nc4bzujlaw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 04/10] mtd: spi-nor: Unify of_device_id list terminator
MIME-Version: 1.0

On Wed, Nov 25, 2026 at 04:28:30PM +0000, Pawel Zalewski wrote:
> Unify the list terminator to have a single space between the brackets and
> no trailing comma. This change doesn't introduce any diffs between
> pre/post to the compiled binaries of the modified drivers and just aligns
> these to the common style with other *_device_id arrays.
>=20
> Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> ---
>  drivers/mtd/spi-nor/controllers/hisi-sfc.c  | 2 +-
>  drivers/mtd/spi-nor/controllers/nxp-spifi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/spi-nor/controllers/hisi-sfc.c b/drivers/mtd/spi=
-nor/controllers/hisi-sfc.c
> index 4f6631950a5b..01048ca46a60 100644
> --- a/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> +++ b/drivers/mtd/spi-nor/controllers/hisi-sfc.c
> @@ -474,7 +474,7 @@ static void hisi_spi_nor_remove(struct platform_devic=
e *pdev)
> =20
>  static const struct of_device_id hisi_spi_nor_dt_ids[] =3D {
>  	{ .compatible =3D "hisilicon,fmc-spi-nor"},
> -	{ /* sentinel */ }
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(of, hisi_spi_nor_dt_ids);
> =20
> diff --git a/drivers/mtd/spi-nor/controllers/nxp-spifi.c b/drivers/mtd/sp=
i-nor/controllers/nxp-spifi.c
> index 30fe2d414f07..71ee50eb1a71 100644
> --- a/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> +++ b/drivers/mtd/spi-nor/controllers/nxp-spifi.c
> @@ -440,7 +440,7 @@ static void nxp_spifi_remove(struct platform_device *=
pdev)
> =20
>  static const struct of_device_id nxp_spifi_match[] =3D {
>  	{.compatible =3D "nxp,lpc1773-spifi"},

If you touch this struct you can also add spaces after { and before }.
But that's a nitpick, ignore at will.

> -	{ /* sentinel */ }
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(of, nxp_spifi_match);

Best regards
Uwe

--vscxo3nc4bzujlaw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmsHGSsACgkQj4D7WH0S
/k73ogf7BALXlCQ8r5M8ZULyZTCXZBckvup39sfY/19fBNNwXXunI63allBA3oeS
J2HDGz0wNdZ2/y1iggGBavEtOaE6mVsBVcm3jdJ97l/vwZ/DzZ18bG17D+lOa6o0
Kukj1hQ5Q2qvFM8u49aHT99Zp8isHlf3GpEqLzOnphUzqGPj4/9xiIWC887HPgq0
Nfab1Mu6GBOwgze0VnJbpJfJ4rOA6Bz+tZOVjrFqShym3ZSG1ADwwM4HkOixY93y
2Z/oy3nqZHXEeEEg9uml7t299pECJEma5xTr5gSqY9g8tcQXvO8QVWh+dTUSYLTO
i5jse6iRjG93iBKa+gKKv3oEi8y83Q==
=PjDZ
-----END PGP SIGNATURE-----

--vscxo3nc4bzujlaw--
