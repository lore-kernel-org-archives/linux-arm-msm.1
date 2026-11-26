Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795714833;
	b=rsFTk/lLEdmyVyvu1C4qa9R4nItROCU2XO3Tc7cOdJscWjSKn1AENGzMst/gkaFcFDHg
	 9YahTy1DrXtkXqKSWRUwIKxtqwcxQakIt5+MbR4h9PSsnhWG1udraTGg4zPoyhwhKE/s0
	 6vvU4Wnni4y+JdGOuBlGZvv6W+j/5SzE65Nv7lePfPHmovRFqhjssnh39SUPR4WZI2I7K
	 EVWrbZwHLshJUHzmkTf6cTEzVfZdEROd2GOXDuINQ4GBU5EJspSpcUWxjWt16xYflyb/G
	 ifcuOlrrtSOSupZiJQLSU+G98Z9wHVJAD5FEZIa6mxvBrW7j1LOVed8uiV1iVAvjH8Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795714833;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
	b=UM3mOYexGw7yI92Arh0h4CN6U0IhwKILt29XMIw2CWcFYlwAxzKcOdnqGszpL9xaMfWu
	 IFoh3EL6BOX7R3gprgURUNUV78biffezYjuRGHHorQAvt8LTKIeVTy2mpHo9ZR0cReclL
	 r3Z+7FAW7zufDm92tQM9Vu0jyzV3fjsdxbpk2CPeziGAoZsVavUe9cteATCoxr74nNBAq
	 gmNGG30Iwev+TLnw4WATU9KSiS1xRPqbJNDTvPPktdc5zJNqJju0e8UFRl3JMUWaDmqh/
	 wbytS9mOAIM61HHsD5sVx+kIuBLd+xqxsRbXnlaJNxqZW2VvMbyp2yX1cz07M2/QONw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=thegoodpenguin.co.uk;
	spf=pass smtp.mailfrom=thegoodpenguin.co.uk;
	dkim=pass header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZMNXLe8E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A1E606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 17:40:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A1E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20260707.gappssmtp.com header.i=@thegoodpenguin-co-uk.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=ZMNXLe8E
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9213eb1f3a7so61608036d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 09:40:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795714831; cv=none;
        d=google.com; s=arc-20260327;
        b=AL34hcXp37N6IMwVR+wpMIcI7gdtP4RdnAHIvS7YGbW54oU7gPLSw1h/KRn+9jyVUu
         hLCTY+iHwcNW8fy3uAulai72Sz/l2JdhG9Faf0tGilBR0VI+Q+iFzUbZb5hofCQKeAW0
         9zZFN3F5xqLxU/IAs2KU1ZNVu43BJBi2zDcheUQq4apE5aRVmFWnM8cezh4B2LJtqfJC
         9i48Sk36n3SK99IQLrLhy73TUrWEbowUDXtQUJP3RuDQKHRxFU3nk4hPH7JaesEOVHNf
         6rMAt0NXJloRIOYB92UXn8gmUq3/BruUHNuw+EznWzOex5l+dK6EaWzdZUC3pCXusFrV
         DyDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        fh=RpyoxrGCk9ifNZv4kElisDXPo1nYXeH1AibpqWLwOYg=;
        b=EKigfASNH5Epc/fVBIyoXZj/CBtmzS0AgPqDvzZgLInNvcDvdqKGzsnCC6cTWd7QxU
         O8mxRgICUITw1sfcs8VZvtCOTrkjMEvCbREMAtbcT9ZpW+CK6uDRCXM0QHM3Ba3HH7fA
         7dDcup0MQFzMODz1PpJMjXDq2Picl3j7WV1rfFrObmGwQPscn4t77PtL8bbA1dvWr0a1
         qix9v6fZTTJF6b70lcGAhc1KdFzyT1MXDwISP4qyqkfPGw4ekp0vBaWuI1ZdQ0fUea60
         92ZM/wraScwU27GhgpZCIYwBgP8UfXp9LZCvxEDsudwGSBiiF+t7iBSQwwEdEPP5ePNt
         B1gA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20260707.gappssmtp.com; s=20260707; t=1795714831; x=1796319631; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=ZMNXLe8EgywX7hxjNEorZbnF7jUNij7IrkubEnLG6nFqgLC+Dl8PngizshQxaTtoBL
         1WMXlQacW3TnT8SKE50XE/w+9BZpzVDNCDU/yFrY26m2qwrjb4lx+H4c3ZEwfs4ilsE7
         KGISiDmQZqQA403vrLHHKpV9LWTb64Ny4T1pnZbiOnnqgnzjFDoBNIyGF4YbHOyrS7RS
         q1E98gxa3sA6s3rKd5kj7/D+lj+32ePhK3fkhEwwLIUrabJSOEzWWx0e4jfnLKaZxiNz
         eYklr1WPmChaplISDWWf0k+AqrDb1Tv4cZ+Xqgivz7Crwhg+rOFmaBjC/U4Yu2WPVglY
         jbTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795714831; x=1796319631;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WnUI0hkBPpSkdO9GvSJqBbk00QrZu2iiDVFhG7JTP+o=;
        b=Otua/8m3RdU/OlDz1oGjoWoOGTVC41YaazWq0hq9N3RYZ2nbct7uITOfXDBZ2I8Otm
         BLite/jRqgL6KWKSe4Zfd6+zGbVCSjrEN6vKzBPjThBdwpZz6jpSn5VbY0WDyv6iGsP8
         enmYcW5+HxnVqJ7+s7ERrXaQjOQ0MMtdafRJbvhr/+CkhYYIuynfoyYIduiLedqFZEJE
         b0xEZT/IebFN5ieB8Ml4B+/BdnncHt4anc5YIR0ap0ci18z3nW/nsBVU7zaBJHLAhj1I
         cg3TmaoseJkqsno0ElGkqWi7/wJUqbYLM7o5NJgJJMGhQ/jm67kiFg5vKHhbOIqdE5LL
         bHDw==
X-Forwarded-Encrypted: i=1; AL+hErHr5Hnb80nL/YgMMYTCP/FoYsz5rtMOQYyhIJGTPJIHzaGiG4/1GScqJcFkfxFtF2IWn5NrNyjxu7SEoCoI@vger.kernel.org
X-Gm-Message-State: APuU4Z8TZ3do7BZGlINy0EybE6ef3BSTYGHk0jmunvJiKghQ/VAc1EMi
	4r5fqM56dFbS7kOH+f5Fm5gmIZpHSshiWQDEqPULGNHqycQIiaWGmPF67L/yBPXE0DjtMyDZOrd
	yfUey0aoGGTqMycScpqOsgz9KhKm1Bc/xRdgoh1jaqw==
X-Gm-Gg: AZFdTZeO8Ul4gL4ORl0aRRGkr3k4iBTKltiVdV3qEuxkQTScdwApzzo/UDRi44Wi+Y3
	lJF5Qe+9jpNvql2Jvxc4huLAAoX1nfL5VVmo+9ZYko4hnVO9u7p5dJC4fjUBonAtYbgDNacd2aF
	KeHEw+BkXnGVgv29q4WSaRB5EU+3R8PLccuO0UZYw21Rk/29nmkGhuEXCG+rPskQzd38A4RHkxY
	4r6nxEFXc6E46A5z71WMjs3RR7DXTvAqqHPl0GjbxpxqRveOo7hJeAPK+VS+OO1FEFY9niOkvKb
	i8zwo7LKqaj30JG8/n9un3HVtLAASN7CU+OxZBpbiXC6ardw3Pvifhc2/k4bPxpiynzB4ohq6+X
	28vs6BRKHQBIa2RX223kJBqUObJ74N9OAzEZ3XJXgO1Ux6mxJiZNQiHqWwHzgV8+MGWNkOHM=
X-Received: by 2002:a05:6214:3c9d:b0:91c:9316:f4e8 with SMTP id
 6a1803df08f44-92134baab8amr374316166d6.54.1795714831544; Thu, 26 Nov 2026
 09:40:31 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261125-acpi-mtd-v1-0-42ad2f645bee@thegoodpenguin.co.uk>
 <awcZcuSbse5g3FWK@monoceros> <87v75jyiw2.fsf@bootlin.com> <awg4ubbFu0FksThB@monoceros>
 <87a4mvwv1b.fsf@bootlin.com>
In-Reply-To: <87a4mvwv1b.fsf@bootlin.com>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Thu, 26 Nov 2026 17:40:20 +0000
X-Gm-Features: Aa3M54pTYXahjqTv7_MT1I1wEAeHDvmXQpnCEn41MhhclxuSVrfOIbrke1NKz3k
Message-ID: <CAA6zWZKPY-wjq_sbheLBK-k1b6rCdXs353b7j-fTYB6vTGLmGA@mail.gmail.com>
Subject: Re: [PATCH 00/10] mtd: use desginated initializers in *_device_id arrays
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Pratyush Yadav <pratyush@kernel.org>, 
	Michael Walle <mwalle@kernel.org>, Takahiro Kuwano <takahiro.kuwano@infineon.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Alexander Usyskin <alexander.usyskin@intel.com>, Joern Engel <joern@lazybastard.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	Michal Simek <michal.simek@amd.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Brian Norris <computersforpeace@gmail.com>, Kamal Dasu <kamal.dasu@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	William Zhang <william.zhang@broadcom.com>, Anand Gore <anand.gore@broadcom.com>, 
	Kursad Oney <kursad.oney@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	=?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Han Xu <han.xu@nxp.com>, 
	Paul Cercueil <paul@crapouillou.net>, Harvey Hunt <harveyhuntnexus@gmail.com>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Liang Yang <liang.yang@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Manivannan Sadhasivam <mani@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Linus Walleij <linusw@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, linux-mtd@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> Let me know what you intend to do.
I might as well address the nitpick since we are refactoring already,
so please wait for v2.

> Not related but since you were removing the /* sentinel */ comment
> sometimes, when do we get rid of those extra entries entirely?
I don't really know if there are any plans for that, I certainly will
not attempt that anytime soon.

Thanks,
Pawel
