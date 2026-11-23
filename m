Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443990;
	b=BBVRKEv0+MibjD6fOu00FyRn0mg0ZEmMdMqrxAcHBbJWd1IJVoir0wZ5EHPFcNGKfVuX
	 rFclYRVGRKHcYURtb2qMkLn2BjL1aMDJgmya40GQRIp1iS2N6Eq21sadx3DB9yzTLI7ka
	 +JwzUHXaAD3STDs7PJOPqd6AcHm9u1UMIZot4aEP6tYDQzWJ1I3uNTB99U0xDVD2Nappw
	 qwwL0unwBgJKrGvRTFolscDBLZgN8TOxatJJOMDPbeDTqCQRZyMXm7nsNfRgXkIHP3J72
	 xRJ8+n05gXaJpUw6nVIccm+COM5g1XlEdb4PVD7IraakCFGsE9QOZoTJjopSEwHIF3w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
	b=okxBSD34noIuiVLeIRM5i/lMrBNrKPBwfTegMQSVABSaA2kMIrOkuZiO5oeRjrt8+q0J
	 IDtt8gU9c6dq4lQYsEMnV+bsOeYnxphzZ8Bl9RU48eclfM0n+u9RU81tWV8NwpYzFX/Qh
	 icAZh+1oGnVTvtfdYADMYi2ssLNCncDdKi1la1QtcEAturAWevSk+dkyaZAYoe14eFjbg
	 V4+fM67j5MWQCKZOSCHcQl8I3FAHCrTGXxLcI91lC1Fen3PbVJJ3fhhTvTwFSMK5E6mqI
	 9J0nKxfpLL22oyBwsYn3iwmIyrFY622tUHkfYiKtQGZK++vULsQZ2pYUV77ND48VFAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUIY67PM;
	arc=none smtp.remote-ip=209.85.208.169
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399EA606A32C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 14:26:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 399EA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RUIY67PM
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-3ae1fd4252fso31698781fa.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 06:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795443988; x=1796048788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
        b=RUIY67PMq1SQpC96Na5nTl3jAyRwEebw/mDWGod9yXt8IsGlmlTbbsyWn7X2cSb73L
         dB/FORW/5mTkaB2haIysp91S+cFrM2WzVocyIJDpnJKRCsMAZh+2AMPv+Cb9qzJmnN/p
         xVhtvboIzZKmLZuxYSV+bp9jXmGt/XGLsa3NkwIEjKhmnT/FmPcIYkZmo9USpV0+DVld
         +T7wajOC1ZKDFwX45AVhUhuQXPjUbPPbDrQCtLMD5NyK6n3BloDQGZVPITo+qylDu4KF
         qxWCPUIvWmu9AImsOgfgoOsXo6JqMQLDHrQeoNb3vm5Ivrwtz3Ew4LzO8OTKYYbraeQ+
         bbhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795443988; x=1796048788;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MpBy4DQUeAY3YB4hP8JJP2A0Pzqf+41bgmSv+sbuZU8=;
        b=Lw3Hmc/LfTU3/oCgW+5mpG7C3jYzzSZIzlnbyWBhXMDD2620M/xPE9LJzUuQelBlCy
         inEF7K56/Q68CVgUMT09JsUjb89Epsq1SvLkw0LDeWKA8f5E6OqWwFxXpTVWVsSKY6P0
         ypKA2eNEgREpTus+mzzl8yGCxpEx9rA0o+cYoEJd1eMF7o7Up5JW82eESGovWjCOanQb
         ZYhX3G/CSDnKZZn0WnaH6PoE7q8CJ2FR6FSDp0CDKRc+LogT4UHkCcaRv9eWWAx4SdMK
         BLQi/69a2gLOasADK6hylc6aqbQ//EjJ7AL9eJ5sFgqJpdzbDYzpd9tB95Z+jAljlKi/
         zufg==
X-Forwarded-Encrypted: i=1; AL+hErFOrLXb8kfXDBpRAcUyP0gnijAmeuQ2AGy+NtVwDUmqW9/NJCFnjIIVc87AaPWurj2rr++4b8VIaYI7PVS+@vger.kernel.org
X-Gm-Message-State: APuU4Z8SaRIsmEGtBwT5MMSIPEvi0v9jbdqfKUj2WBOo2AtVAr6cPP9a
	1JunF5LJszZ0tXJSKgElchR6C6MPNQP8nR/2nsOZBgjqqv5mLmys27SB
X-Gm-Gg: AZFdTZe1lbo4BExvH2+nAQJDYMlgA12GlzsOHaefSQU9W4nL8tQbFedUA8Vjq9GGoqK
	LY5vG1d0Zw39f/xNt1yt0eQ/QhHe7ckPIDT2A8JY6YaQG1in1wxRlirXBRWIZcDa/Ed/Oa2AUPY
	QOXOH/fO2VTPKkhVtcsi7nWVNW+cKigaay5f1ZTZZLNDf6VEtIt0MzbmenHkUrNzdMZcUNZnrPw
	O4DsVtAT+mo9LvCQ8JP57PrI1Ezk5KTZwAcArhvK8etWdiT9GT5CrpaHg+szXvYzegUTBuG+Fqr
	Q3gzHclk/ejGkQLhdfYYgaGqFyYk7+TPe9OWCy9ywzkE3JKnpEdPjrNrFI7abamTrFckGfNeWFJ
	cXbgkk+l+2ZBAwty9P1nAJc2vxmAfxTybYHSJMg+hIxjuC398hOWYBIRap6Wp5BQ/0LkFdpnQc1
	dJbIds7ZZ4y8gvgYT62o9ZO1e2wR2otbwx5o2IRodlM59JZdBSmfsJp4n0cLXO9s3JdpC/Dv/64
	c/8foZh6VF2CQG5ymxoaB8xoHPOs0JfynNVFgD+7RTklcRH7KCtquQF0KBC5HIDbcOzW0gJBE5L
	D1fgl4fkJ/AAIOLn5paNaX0oBWk60MNHf+XQnkPHMYwNYJ7Y7HcFGD2/dJ3bKM/q879oKfZxhVB
	aN5+YMl17eA==
X-Received: by 2002:a2e:ab0a:0:b0:3ac:e4b6:b93d with SMTP id 38308e7fff4ca-3ae7f9a072fmr31420641fa.8.1795443988058;
        Mon, 23 Nov 2026 06:26:28 -0800 (PST)
Received: from ?IPV6:2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703? ([2a10:a5c0:800d:dd00:8fdf:935a:2c85:d703])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae80536529sm33679491fa.27.2026.11.23.06.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 06:26:27 -0800 (PST)
Message-ID: <bc178673-54dd-4811-acdf-cb6327ec2417@gmail.com>
Date: Mon, 23 Nov 2026 16:26:25 +0200
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 16/17] mfd: Unify style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
 Lee Jones <lee@kernel.org>
Cc: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>,
 Linus Walleij <linusw@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Chen-Yu Tsai <wens@kernel.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 James Ogletree <jogletre@opensource.cirrus.com>,
 Fred Treven <fred.treven@cirrus.com>, Ben Bright <ben.bright@cirrus.com>,
 David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Peter Griffin <peter.griffin@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Tim Harvey <tharvey@gateworks.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Charles Keepax <ckeepax@opensource.cirrus.com>, Sven Peter
 <sven@kernel.org>, Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>,
 Saravanan Sekar <sravanhome@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade
 <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>,
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, patches@opensource.cirrus.com,
 linux-rpi-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-amlogic@lists.infradead.org, asahi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-rockchip@lists.infradead.org
References: <cover.1795431460.git.u.kleine-koenig@baylibre.com>
 <b69bcdcc394e46e0eb60947f23923e6241d24ff4.1795431460.git.u.kleine-koenig@baylibre.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <b69bcdcc394e46e0eb60947f23923e6241d24ff4.1795431460.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 23/11/2026 13:18, Uwe Kleine-König wrote:
> From: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> 
> These arrays already mostly match the most used and generally
> recommended coding style. That is:
> 
>   - no comma after the list terminator;
>   - a comma after an initializer if (and only if) the closing } is not
>     directly following;
>   - no explicit zeros in the list terminator;
>   - a space after an opening { and before a closing }, a single space in
>     the list terminator;
> 
> Adapt the offenders accordingly.
> 
> Reviewed-by: André Draszik <andre.draszik@linaro.org> # for Maxim MAX77759
> Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas
> Reviewed-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com> # max7360
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>

Reviewed-by: Matti Vaittinen <mazziesaccountw@gmail.com> # rohm

-- 
Matti Vaittinen
Linux kernel developer at ROHM Semiconductor
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~
