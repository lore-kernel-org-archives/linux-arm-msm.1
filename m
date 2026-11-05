Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869589;
	b=RnDIqyx9wwsiD5x5iofUWMZzCoCDf/r0szxIqgSmjebcDKX9qt6v2b0VMWd7yAotAwUa
	 UqJcJHa5Q9L21raRyc5yqGw6VAu79mUkK3JtN2WCj+3/8mFvlnM344z8/7adUXEmNXC1X
	 j9NvRfff4yENu0isQkBKr9YdZE/Xn9TIunS65FM8y5NwxE0XIUKEA28xY+flgo7iVFNJo
	 7W60YBzlbpFB+PtZ0eOT/eJi98cmFTJxvNFA2Q1zCD54OsGOikwUr+glNN4zrznaaBv8x
	 0YolMqbcS4HxwnorlORzLrdzgDCVu8aJzUWKi4ZSHeV8cZsazNKGAH9XLyyZhYpWxGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869589;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=szpNfl+GjhJRGxd5gIdXT6EIIa0n90qEKCnRhD5COi8=;
	b=dLhYM2kaIN2jpRe7So0z+c2SdyEtZXtd202pSzRQ4qfigGhDq0KzfLqyrjQvLLUMtkwO
	 5B9qZahLH4oPGCEAb6vp5QK/1h8gKzyaUtpl6nnYwUyTdrs7XLFt81qZVOE+VgnlEP4Fz
	 ebz536FKCeANlZ0BKERkyTuTaKUcJGUM/KY16RzwLftCDAOXohMagoWBukwtX7LD+sf02
	 /QbA8isiGQfW/HRU3qcsWA89kO78y2Rx4LaVk9MG43Au2riYXMlImgPJKy/H1wKKHVw1U
	 cUwcxsEo5tSijFso3UKxISiTAE5rFwAa8exB7m6djEOVWTTpVErKLjktgYCOv/84Zvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.53
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16527606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:06:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16527606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-99075306daaso864694241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:06:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869588; x=1794474388;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=szpNfl+GjhJRGxd5gIdXT6EIIa0n90qEKCnRhD5COi8=;
        b=G72pv6ma6srJF5qAAYHrJUa6XRqMNREYpM/OFXk3TubZOydM09QWKsi1FQ8Q6daQqs
         jwsy8UCKTvPYC5pjKJk2PBurcaj9JVStjL9lLElgOY5eCYeAhk0E0C0JeGEnNIOl61BW
         4ImjYgP3gjma27j3VzliLQtk/fFcqLdYwAwjhqNOA6UEJmKMveJuL5q5/KsM22/Nc/MA
         pVXa/stK2nrjxM2Njh60ukph6FkCKkq+ySl0w8GE26rZTUnejaJqWovB4IEJWKBfcENZ
         b8cslGV2y0CGGbdBNWo/ZjUtQ3hMnEn6oOqwXQJXJYGA9MahA/Qq0fjVfLs4uL6UVgYn
         AjEw==
X-Forwarded-Encrypted: i=1; AKwUvBxV2JJY0ljdzsXlhBGULAXdBGf7mGsRWdDzvEJr9VxzERpxQ5QWO+cgKzhULuKSZZ8maj5UpnD/4fkEgXQ+@vger.kernel.org
X-Gm-Message-State: APuU4Z/TRySfpBon7HDHhSi0gSVEJXRnDYeZp+YV6/sPC5eEr7dszsCL
	PvzRxp5YzQMO2IjAuSkE91OyiGofgm2jrc7kUGXNN9L9CpGjr3KVSxiyxp1BH8xm1wU=
X-Gm-Gg: AYBFou3fbQa70SCBRG44/IqW0O9183OV9ePRFdijgsZ0JU3f5besENY4pufMHZMjJjW
	NkYwiR4FvC2ewjlipfaqgqX5F+zb8hLDMAVZDqFl0+YecDKLy2ITfMwsU6cW9jZZt7DLEI7Smhh
	D+scyWrH7A15wMMlHijbqZmNVF3Tk5wLVWyqt573bRD1YVZEb4lnmCav/gB5mPvMxVz/F/wrPva
	pz324dyLxu1rEbZEEiJzhkbDDHnFat048W4GhO4ng+BpclMYGW33e2Q9oxhZenPbcIeqp+DSpzn
	nTgHroX4AcxGmmi0hYzugLF7RRdSxf7VPhsz/R93pdSPZwFE+lOcvNC0yB5sGMwE6FH0yOYoP9B
	1ofp4eSlj54ReC6H53C9AO7DiC/P6tVH8wcJ6DDSCqR3GhcNXLaTAWLtBaeUJ5VAmuYhBgr7pmY
	EBlI6mRQchbSD3VkDeivOsCUnO5Cxo/fuYpaOFpYLzecKpUWJ0xHaJj+xSzRZFwIq6rWiSqUCQE
	Oteqaclt/U518I++Eqxm9hSxHpsl8VGrZ0IyLxN/xPbu9W8MslaX3HZ/hivd997LXk+hMe3dD/i
	u15aelMFRX3bt4p6VYTVMn9BmrLb9KG4mIDnIoKdHUMZ8nwbyA3PWuV1J1gTfF7YCg==
X-Received: by 2002:a67:e111:0:b0:7d2:8dd0:2eb with SMTP id ada2fe7eead31-7d28dd005b1mr885168137.8.1793869587962;
        Thu, 05 Nov 2026 01:06:27 -0800 (PST)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d277d13753sm3008626137.10.2026.11.05.01.06.18
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:06:21 -0800 (PST)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-990835cec4bso924124241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:06:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzJbS8cIxjcZHUaGvRl/NRt9+bfeoLoKjy1alD2/RwWCyVnAq4Xz4ybJNDgST9D1AIcnpsCUeSvVcJOBjrY@vger.kernel.org
X-Received: by 2002:a05:6102:a206:10b0:7d2:8610:3223 with SMTP id
 ada2fe7eead31-7d286103264mr1300643137.34.1793869578105; Thu, 05 Nov 2026
 01:06:18 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com> <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
In-Reply-To: <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:06:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
X-Gm-Features: AclHuK_EWQ4VeHP65pJfIPjcWj5wVVyn8PWm9OHeuqD-F_-a-ZgbZgStzpLwqQc
Message-ID: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Cunhao Lu <1579567540@qq.com>, Raul E Rangel <rrangel@chromium.org>, 
	Yenchia Chen <yenchia.chen@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	Carlo Caione <ccaione@baylibre.com>, Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Fan Wu <fanwu01@zju.edu.cn>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Sherry Sun <sherry.sun@nxp.com>, John Ogness <john.ogness@linutronix.de>, 
	Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>, Robin Gong <yibin.gong@nxp.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Zhaoyang Yu <2426767509@qq.com>, 
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Myeonghun Pak <mhun512@gmail.com>, 
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kezysztof,

On Wed, 4 Nov 2026 at 18:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 02/11/2026 18:54, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > Replace open-coded assignments to callback and callback_param fields
> > of struct dma_async_tx_descriptor with calls to the
> > dmaengine_desc_set_callback() helper across serial drivers.
> >
> > No functional change intended. Prepare to make struct
> > dma_async_tx_descriptor private to the DMA engine.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> >  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> >  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> >  drivers/tty/serial/amba-pl011.c     | 6 ++----
> >  drivers/tty/serial/atmel_serial.c   | 6 ++----
> >  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> >  drivers/tty/serial/imx.c            | 6 ++----
> >  drivers/tty/serial/msm_serial.c     | 6 ++----
> >  drivers/tty/serial/mxs-auart.c      | 6 ++----
> >  drivers/tty/serial/pch_uart.c       | 6 ++----
> >  drivers/tty/serial/samsung_tty.c    | 6 ++----
> >  drivers/tty/serial/serial-tegra.c   | 6 ++----
> >  drivers/tty/serial/sh-sci.c         | 9 +++------
> >  drivers/tty/serial/sprd_serial.c    | 3 +--
> >  drivers/tty/serial/stm32-usart.c    | 6 ++----
> >  15 files changed, 29 insertions(+), 58 deletions(-)
>
> ...
> I did not look at this code at all...

[...]

> Therefore:
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Then please add "# samsung", to make it clear and obvious.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
