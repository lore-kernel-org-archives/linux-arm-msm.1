Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870638;
	b=2NvI08Vk5zxoPXxpTY66KJyzk7Mvl/Fweq3YKl69C5DroEx5Z4gOqEjFUTdcXYTtx730
	 gv61pqwaWPg2KK7pixOSf21VMkrrdX4s1CiWCyaMKd3KoC+klD63VSOjTHgmw9h/eVxj7
	 lOas/5X2mRWnYEEV0+DCx8Yq/bn5Kji1lpQ1vfIC6jNnosSpcF5DSlFAz6DW34gcwTCUU
	 5Fz06B6tQvpOYolF6ogF3sTkMCOYFrLDNq+EVx5u8gfwuGtVsOtYpcaknSGWBA7630J46
	 hHlDTwBHwBiIsH1m19SnlzwJkEwoi4sKRvo0K7uAWNhD+E4iqxASA1gQS8Wl7llUcIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870638;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
	b=yZ5DVGDSSoxo1VFBqhDG7Fd5JmulAZa9PiApFf+NDAoJXhF1o0QZA0538ibVymNqNo90
	 NfmnIuxVHvQARFv+MH75lSByYEQtVVxnsugWrGHFyFR113ntepGKMm27fPcvoYnhNY8Qw
	 yn6f17DNGkjzQ62q+zTUg7CyBAHnYZud5DtguaanyueErKw7xQWYl9/qCFfMQcrwMYe+i
	 VOfXKRIcMDDVBM9P4dk5TIfZ9LcW1oVKO2huYG8LHLxI1Mrr1vQoV/KBD3Uh64rTUbRSL
	 YFY4zvpFQmoR3WaoRb5MHOfaePg05c6RVjgg2ihvQpTF1NrQMtCJq8wzW9wqyX8qKsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A75AA606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:23:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A75AA606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cc758830601so1159212a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:23:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870637; x=1794475437;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
        b=Wgxa/KGDFBXNTzCviYHNe5y8mtQkDFayWSyddIvEZl2EyyuByN4o5zmF3rW1WFMtnZ
         vZh3mk2APMhhbF7PUNEVzC9HFV5K9GCDpU450g4ciNRmK7Z3cYwcX+wqPlkfeZ4FMJ5O
         KRkAwDaN5MK52DUwBg/FessT7eO/9kEr2vagOaca1OdBEbWI6BqmMdT7RxWyw2QLRDX5
         0DTiL5qCh35AUtMgWYPtNP+hrAVHODqIwtyRlgIgPWFyuv+p89offRzz+n97P/GuWci/
         yJWtyxl+ghLz9C7zZVczIAI5IKdNtgF0y+p+aFTY7WMbN/TufacplOfGbRg5UOIpZZoC
         GKjw==
X-Forwarded-Encrypted: i=1; AKwUvBxinZE8/vKZF0w4oHTGrko7MWB4F6zV+FzdwZOLDqJiSwmbhctvgUV6s2N/S5EILzfWm3GO0cUf2D8zwUKL@vger.kernel.org
X-Gm-Message-State: APuU4Z9d5B80TI2WKHFuvfhJhI9GYX3fEXusQ8MWI7YjKPCHEL0XOQMH
	KFUEvRXEk45ToaigQk8rBobQd+Iw8dAHuRsE6lRKKhotrMgJLCHtckhsPlbCSwfG4qY=
X-Gm-Gg: AYBFou139OeqWxv72iSEwHYD3Yf4Co5xs6NPbngeeJAEFtZVWMaJAHgPW78KNJXwPj8
	pLgiscMElRmtbYyIwmpvR8pQ0C03Z8zyOYTiAf0qbX8AgrQi7AoVvGUo8jjXU26yGEMhzIPYiy8
	+BqaAPCiXsin1/M5HwtLeeSkFOgYN8CcYOFOnEE/cYoa8QBnPxynDbhJ+k8/m1WdiN2JSMLFO39
	DlhcvamroRoFd988+ZhxW0i/BF6jbcNIa53ZLApGBnjgwlfw/1z6DX1WfGsgzBbQluvH5+B+BQq
	qSxj1lSgz/hJpcfF82Pa9P/HBbEXqmKgClgM9st2yNMvsvoaoXEnJBfg7qqJ4be0iAYTpV31d2z
	mmNeEAywdRiQltl9inw1O6FPsjwMvCDUON91Wnj6IAoTyP0qOj22x6kq7/ziGkredWa5ecp3L/v
	PLoocFT6xjYJb9tlck6hQmXCc3RpptnQnk1TEIxEMXr0LEYZ10CoJaXG/seo4d64tA05paS9XVZ
	CIlcKoVP5mIFbxevwhzbO/HuOzJRLRscr746LxKWyicaUEYQM8bj11U3bbT3ZoVYeD+cTDBgsS6
	kJdcedxgk0cVlQMiOstjuZPOsbqDObMBaowYVFdjl44FbwEJ3fNUVGgIbprNxGeE
X-Received: by 2002:a17:90b:3c08:b0:3a8:bd51:205b with SMTP id 98e67ed59e1d1-3ae89812f18mr16628992a91.37.1793870636823;
        Thu, 05 Nov 2026 01:23:56 -0800 (PST)
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com. [74.125.82.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b32678ecsm3247270a91.9.2026.11.05.01.23.55
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:23:56 -0800 (PST)
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1931ff67a29so426335c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:23:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwyYPu9xSSkqIzCUuebeuQjlVM3GQH+Rxpa2BiybelvHKnJBD6f4lQQ8G7ggrRB/HGQxU+INw3i7nlNcIZ3@vger.kernel.org
X-Received: by 2002:a05:6102:3711:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d072695e4emr7033715137.14.1793870187629; Thu, 05 Nov 2026
 01:16:27 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
 <b656861c-a087-4087-952e-91fd15fadd52@kernel.org> <auuZHTvr5UI9Q9Q4@ashevche-desk.local>
 <fbcb650d-0f60-468d-b1cc-255ea8a93db3@kernel.org> <auxF9RT5aljXkfh7@ashevche-desk.local>
 <auxGdYgJvjq9EBu6@ashevche-desk.local>
In-Reply-To: <auxGdYgJvjq9EBu6@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:16:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
X-Gm-Features: AclHuK9751j09IKd6_4EIkqyFvn0FA5bsvqOYkEgIDax6KzLeXviQYPveqzIsxk
Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Konstantin Ryabitsev <mricon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 5 Nov 2026 at 10:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Nov 05, 2026 at 11:01:55AM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 12:02:21AM +0100, Krzysztof Kozlowski wrote:
> > > On 04/11/2026 21:44, Andy Shevchenko wrote:
> > > >> Andy,
> > > >> These three lines look correct.
> > > >>
> > > >> LGTM:
> > > >>
> > > >> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >
> > > > As
> > > >
> > > >   Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-quadspi
> > > >
> > > > Note, it's in your power to ask the author to split out what you maintain
> > > > to a separate change. So, it's your choice what to do, Ack the full patch,
> > > > give a partial Rb, ask for a split, ignore reviewing (often means silent
> > > > agreement when maintainer just applies that kind of a patch)
> > >
> > > The "# note" after the tag solves the problem partially, if people were
> > > actually using it. Solves people looking at the Git commit and being
> > > mislead by partial review applying to entire commit. Does not solve
> > > credits, because Rb for three lines is not the same as for 100.
> > >
> > > From v1 of this patch, four people (Alain, Lab, Troy, Kunihiko) did not
> > > use it even though reviewing only part. Only Wolfram, so 20% of partial
> > > reviews, used that syntax. Without that syntax, b4 will pick up Rb tag
> > > like it was for entire commit.
> > >
> > > So I do repeat - if one does not want to use that syntax, then just Ack,
> > > instead of creating false impression of reviewing everything.
> >
> > +Konstantin, then we need to teach `b4` not to break that or convert it to
> > something like
> >
> >   [FirstName: reviewed only ...]
> >   Reviewed-by: FirstName LastName <...>
>
> And Ack is not the same as Rb, when I *reviewed* patch, I have *reviewed* it,
> even if it was partial one.

Exactly.

Ab means I won't take it through my tree, please take it through a
different tree.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
