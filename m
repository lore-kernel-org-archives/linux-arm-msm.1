Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793871615;
	b=ErvIaRXBE56acn2opBVnvmTweA+FK3KaQnVRuGP36pC9biCWx9s7gdCIJyNjP+jNokKP
	 +gds0y472FpLeW40bLvrwjgeoS8cZWZAZS5ZF4HTb+4XsObSgu/TIni2O+Z4JtLr9gtMT
	 K8TjOBo95IIqroiY8aAwL0zG1lweF1/ppEdd1JZT9As7JtLKp6SQMwgjjgzDM8PHHgJ3r
	 bvNpFuAPiS62VDJGlYrP/+8jrjJRM3k1yU+V+vemoI9lIIHz9aCwOw0L5RrQ0mkYv+5JW
	 v6JnCoq+OfUobImcKSasrbOg2MB9rmslG8DEAMcpW2riAR555a/nuk2KapbtJhMQqEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793871615;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
	b=ZkcNk2BgqpTaJiL+EhE5mw+y5S0tqFchtX9spjMv9awqxwm6ExMiipEAweKWEF33Xc+S
	 LJfTqG7+pUn8Rts4WU9FfdV9P0O3BKqX98E5O9P8J+ofsihMkItgn8NdgEptayA1vgeXK
	 om5laSc23XydT0kR5VGu+PxIXdGuAO4PhKDSm8ifeglfuIC2jqDU98Fes5XWzQPfUQiUA
	 U4FKXSfWiiwbqbGhs9bMABMcyjjsptq+ISINiXoZMt4hamuOEwhNx/GaK2sMkK4H8eWTv
	 v5znLjHwyqItMb9nFjjjzCWvBm69maSE4A0zyArw+gvApN7lyqwxcdzcNKiXIA35mUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2DF606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:40:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D2DF606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91b8306b9f8so25557216d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793871614; x=1794476414;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gp+XvZ8u5ZE7X4dajdQ+NYbiZBnTVLgwCjJL4l80lxA=;
        b=UzEfGWv0onN3o+eDoxditrIE+7TwKSzTX3P6j0o7pEdPlW8pYWzkMzk8vISWgho6QB
         EnlSooMKyhHBWULxrVVy+kreS8waeVJcf5ny3JCwneK5PkKsfTJ2tRb+1Y0fnq9cbwv1
         9doftGwuncX8GnYksZjtxiP+nP+ovUrEDem2L7RFGJLLkmw3gaMeAfI6K1Pj/R7Co+Kj
         YAUEew1m8mVJhauZEkrd00TlCfQgp4X7nAKP8nr7iUX2EpGfq6EUL9cd3+zNA3aNk/oZ
         G8oLV+d3+2WjBx2Iwpo0nStcBmOoNaAg3YiZ/fsy7gaDZr7EbIx6rNSwjIxWqkN3B65F
         U2mQ==
X-Forwarded-Encrypted: i=1; AKwUvBx7JAKtcBB34QXFUrt31Yq+J8eRBe9hZY8nidbemYqaAJZDz8SHmpgyJ9a3TgK6bx8dQv8hcCrFlkMWnQvU@vger.kernel.org
X-Gm-Message-State: APuU4Z9vwMyi98zQITdXjQ/PUhmCO7CysmWEDA49rdQ0ZjBoZkxRvNQH
	Ph7dIwyOroFGjzQtOr36MtPrl1bWIbpWV0yY0aem0rrk4mmuFoHas3HuslJGw/1XskM=
X-Gm-Gg: AYBFou2/doPRDfpO/3ymdwXEipSRsLFVDlxTIDPgtLB/1RbXXprO2sq1DB4yVYkiW2c
	GC8y9OHYVg9lIIUwdzFG2QZ53cIt8SX6ICjVRHidSP2aEMa1AIfmZAg8E6fZjJ1b9PEq43wUxlj
	Fgc/pzH5FkHYNzgQrB7h0PC8sDilndOiY6fQkSQz//P0HEr/M/LYEj+3voVNrCh/DdzF2uSVheJ
	YsYRTBYi+1gnv0j0MUwHk8VLmk2GHEza8Et+HKdL5k2LPP+gzCST4mLyJAWhzCWHVtzTlmSx9Zj
	fWKEhOk7AnLqDMvzVrAfSR6/5WR/hDgdRMTYYhX2763dLXT8RhLNJOFvbAfDilfvXgCoCf/gGvu
	GkpCEm2905/aC+fivrq2f6zKuL8t1vxBIX71kzIfCpRPeTjDLgNL+wSreNCrxFB6sxUUbVkEfJW
	dcWymKBvJwcVr4Pyz7TffWI2zPiAlBKAWJoVvGzllHIDfio/jTc90XMdVvILDhoEXk2kuWbYss6
	1/Algr7KjtFdfZDro/ep7mF1KnfjOjKWIbDWtFiBN6tpDiZbcdo2tQFgduZPnkk96FbYIxDS1MY
	8mYvtS4tRAVscjuzR3Tt33kNxL5sLrQkEE8puRUBilrSVxH31Om5B6Uy/EzKK220FAJcX8Xvj1i
	skyu2xCh3LT6VBLA=
X-Received: by 2002:a05:6214:2585:b0:91c:797f:1210 with SMTP id 6a1803df08f44-91ca4c0357cmr312545846d6.55.1793871613674;
        Thu, 05 Nov 2026 01:40:13 -0800 (PST)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com. [209.85.222.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9a5d0656sm9854056d6.16.2026.11.05.01.40.13
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:40:13 -0800 (PST)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-945ae2daa3eso201260785a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:40:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzV3dOAEu2n6TW2z+lvbesv/P+cOizQ0oIKf0ez9rvydnv9g6dpP/HQWECT/a6XCUbR1Mt4J4D5NY0MAZwO@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:7cc:3eb0:6ece with SMTP id
 ada2fe7eead31-7d072d53fa3mr9146730137.33.1793869733877; Thu, 05 Nov 2026
 01:08:53 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261102175527.3957740-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:08:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
X-Gm-Features: AclHuK-Joxo1A4dnmlO7hQLoxC6QCg3Be9nelvt7mgpbpsg01EIWZ9Dok6aJ4CQ
Message-ID: <CAMuHMdWHyQhJwFHd5dguORb0=KTeQPT8AwMr0Uo6UAJRcn-fsg@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Laxman Dewangan <ldewangan@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Cunhao Lu <1579567540@qq.com>, 
	Raul E Rangel <rrangel@chromium.org>, Yenchia Chen <yenchia.chen@mediatek.com>, 
	Zhiyong Tao <zhiyong.tao@mediatek.com>, Carlo Caione <ccaione@baylibre.com>, 
	Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
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

On Mon, 2 Nov 2026 at 18:56, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across serial drivers.
>
> No functional change intended. Prepare to make struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

>  drivers/tty/serial/sh-sci.c         | 9 +++------

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # sh-sci

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
