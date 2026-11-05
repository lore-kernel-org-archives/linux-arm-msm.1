Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.207.19.206
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846396;
	b=lKh+BSXX1ixadR/HlypUASdds+PaY2Wbbi6eefBb97tAPcyxYldZ1qotQaPmauy9mZpK
	 e5WBUnx+2iFsfXwKGsNzdDc7SxUNhkkGCxSNY7I8quJ8auhkczvoj0l0bZ/zSgIrj2yOn
	 kQGyL35/FHeYDYEVEC3Kd0GWm0UhW5cgXWaXVyd5RLqEvPUKSQVJpvZZEIg5070zffxZL
	 9b9A4PR24oXpnWg7ptDcug4PLUBoj54jKBOOtpyMhkE9Q4/xB4jNn7NH21bK2efEtLXqs
	 uyG5udtD8vozBzm03rIs7uEDABiRjyk9Cq8BGLq3mkkmldpxNtYZ1B4aY+vQ9Y6PHZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846396;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	b=rouLDyJW6sARch/X+qQtQwnOVTYhzvLYt8PGT4G1OtQkaKwwrME90xifot7DqXO0Qv/z
	 kDtdeXzFkgsgsVbSzfSzD3LkY9mdC1fyN2jdmOgmJDKWyyCNgVn47ejfXoOWWYBx22YFp
	 iPKfSXSuSfFKJNXf4NUcUp2GPsgZxIIwDFVVk8ShI5fKbQmJQverZXBnIx/n9xD8WyNPz
	 rN2XwOuyt4Qova/Q66Xp7W/HDmk8MNgxTG/uVgu699xJWJpSKcqLcSVaFGXZyT/0SoeFV
	 QMJP4YF9kUyRTWlHyYTiNpfzIZlpC6S1vrafQJY0eBHO/2CAKl0EyTiXKO5wjNzQX+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih;
	arc=none smtp.remote-ip=54.207.19.206
Received: from smtpbgbr1.qq.com (smtpbgbr1.qq.com [54.207.19.206])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDA82606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 02:39:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDA82606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Nqz4+xih
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793846386;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=Nqz4+xihSRA/SOazc9ytMPaaon6hM2Zpa/k876GDLA/rAvSdmROK7bgusiNH5yJRm
	 MxDa4YviOx4vP5CKZmEuJc3kfvwqLKu/L2OohyPYk21mJnJpm1Y7KU5OpOGkVf3+ti
	 zev+B3KBBNrXf3bQvlO8tLbPTEvcdSoXebx80EGI=
X-QQ-mid: zesmtpgz3t1793846385tc3e42d85
X-QQ-Originating-IP: Y/lf91m3+kHsq0ivbBPh4MQNPsyUfRakOYukFfLZUOY=
Received: from mail-pg1-f174.google.com ( [209.85.215.174])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4827102102613573879
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso959048a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Nov 2026 18:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzb0faRqW0EqE45gBwk2tbq7A1yGknFtSozOUq8MhCAHqnlBxd9s82EscwJ3Tm1FaWEjvuwNLTmMBFDlIF3@vger.kernel.org
X-Gm-Message-State: APuU4Z8I+2TG+f8ZlRuRP0RBfvI9z1lw5APwRECNEDIdJSOGtFfdsn0K
	s+bXtcLlhRCQa6DFW3ZtolcArCgCmODQe+nIXpO2B2x+g3syfJerXcfeh8oFR+aOMg/UwcAG6yf
	jwjufQiD0/UhapYbmZcD10T0vsmirB+Y=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3ae8982c1ffmr16206466a91.45.1793846382617; Wed, 04 Nov 2026
 18:39:42 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org>
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Thu, 5 Nov 2026 10:39:06 +0800
X-Gmail-Original-Message-ID: <872B2B4EAE847E62+CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
X-Gm-Features: AclHuK-lEE7dv-iC1Lsio6aPGOufL5hgelB1hFojisk2-zoMsjC0hhsp9HraOXA
Message-ID: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: MRiafWprHMtCy62Sgic98fP4NMhIJAe5OEG2qKF9uB0HOXLCELeGeXB+
	w2JL1vBnsWwiF9P3aGvR0dkHo1sqKpPSP50bKyc5TO7M4aN9QiVFVRaPtBk4Ekn/izTCL6M
	BjBEzouQDsBOXlTG5jYIksXS+tMAQO0UMEEfD9M1lct5aXf2829Z9TxhOtDUUykcH17PvB9
	g0J/wjA2W/GPcQComNTFIS+eod28t7Z9wQqvXSqLa4LLi6VSdbI/UXNhbfF9VDnoyWmFqOB
	qBavfVHXZjbAYmk/LZXO1R0CZT4OBcPElZD+3ryasxsM1Z8TYXOxFK2jcS0LqmNUauXjZlA
	jTDEoQBy2UVsT0O92KS0+NTLlpjuDzU6hMgdHflMwtUUyNAphgvq8yxdS7i3U57dX6ry3Jm
	eFWToisNmpxiA2BjP+9+1YrF5DqeLWIfLIOTpFXes9IBV5I8oq46Z4e6HGZKP95xCJAPbyF
	ubY7AgVzKMAtb2E8Ey/VrpQaIq3ABpNg2UYD0t4oPmZbDpqRUJR61e9FZhp2yYxlCtHD0Z4
	+RT7r6Ug9mhuJroc/v4LcDuJRNh1xbKYBlyj0gFuQvTzlCDSUSdKog/0l6PEC9AtemkqqZU
	quZiDrJAdJjBFTz66pIrcDsFaqWpUH+HETmSSYo9OFvBRX1OYdPhZdSCypV7qLyM+86hD0B
	bgXkSb1vbyqvZJTujVmkYXAH3yX8YtHB3lez58EPyDq2q4eQ8dM4aHALYko8BU0EG5gayUN
	ji2KgLVai/HRovapiAUUYYAMD6ixIkCLy82h6GVw19fzXL69ugwIKo/OSmRnGUX4rWBAhqs
	FBJieNae2zW1cJ32yDKsX5buBy8J5/b/2mngs1BD9FoaX073sO0VIimRosNJXde2yliy84Z
	GPdOdr+h7lvkc+yF6EtKd64L2tl0sJVOhsi59ggt4FPUYrVhUUfUkKH4R3r4pXpMuAw+mIi
	3TzRhpv1UTIh5z2rBZyPNN/c7p3pM3kcwqxSRz7w7utG/UE4lIiGBF0vvRI4wD8izXewYyY
	Fwk8soakNShxwSJlvJKarOTb0tnqsdnLe0cO6I5A==
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index afa551f6185f..222d70baef1e 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -47,7 +47,7 @@ properties:
>      const: 0
>
>  patternProperties:
> -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan
