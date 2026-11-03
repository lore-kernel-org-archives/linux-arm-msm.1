Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793732348;
	b=IiCVvnLUA0sznkfisaNuwVYHDxzEi5OPNonxZQGsSaxcCriTSd7KlI3SKWTqYDTsMGPK
	 YO0tdT+gxgEmsMnBiRPvruS5j02OzM+iMiIT2GGiGZBwZwOlxyrgOIUrmy2wuSfGNkKNo
	 EeJG6wIZoL5SrpxBlOmbz57y9+ILSFhL3V8QjhCygzWSdfOsZrb105vyXb8bq0Ft3PQRW
	 GzYKak0vUhXoqq2vhHZtV8VOPnfOlQsaERz7rTFIJtVb/LAsDa7eF8BowcLFUr4UPX0iV
	 yn3NXPAAVHEj8CCWb5SyF9+JbulUV2/t4CqUm6e2cZzqqGgXXQk8jB0cd4xm0Fh/jEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793732348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
	b=AIePFP6Cp95PBGvmTGDFKT6c0Fj1/LYfCcBsSdklMi5NuwJjX2Nz/K/VbK6n21FdjHNw
	 /fYlg2h2z48juAJp4rvzeQ1uJEiuehj/D+HlAnd5ZSzJGDdvuuQwkWkOKdg911lZMYCj5
	 Tqubgg2fxCWD6HgKeAbo/OU6Txost6yWL85r068rJrkpGooSjBJsD1j2s+AiXalzYHjjO
	 5uRxjIU/HoBJPIxCjdGiuSIgvySJft+ynjAn+4WqLT6+gkUurBNnZTONbgrCRPS8Kopf1
	 rk9XoigHwtG8NH66/dzsXWTsHE1FoRX45EwvdNPpt+yH2a6VUTnZi3JSzwvvds8Iy8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MUGv2Kdq;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B1F606A32E
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 18:59:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08B1F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MUGv2Kdq
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-36a17a332ecso6821954eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793732347; x=1794337147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
        b=MUGv2KdqugwUjwtDn+5TEs87XsBH6SLTKU2VnuO7MeKo6hr4G5WH4O55wxRf43JXjq
         s4GLbtJziYvCL8aJeaRkPvbVSJRuYcD79RqLOhm3K8WcuWsYcB6Ziudrzsv1CrC07u0F
         eeK0IGODbK1MBN0NyElMx/axzRgFDpbY/f4N1s0bQx8OzhaCbM4C77eijEtz2tK6avwd
         jIuK+W4ysYUA0fCY/zhjI3sP/rkF9QL4GSrBo5192CeRPPyJlisVudQsAqBsfuVbx201
         8WfWRhga3xBSMnG6+AMLIpCzka4/V3h3bqBZnqQBBngmWmeWgvYnwglc9N9f6vswPPA4
         4s2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793732347; x=1794337147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J7X+N3b/Iozr8Iw7Q9vLqcq+wqZH/CWnHiKVeMbKEmo=;
        b=z85BbYqVXt1ud60txyRoWSnVEMUDbRGRmoD3mGX9NPoK8jE7EgE5rvEkiHUpnnp02V
         ALB9twv0QUNkWAazSBAD+YUQ92xVchNnutbhfZ1wjJgWRBYmfEalF/oRPkStfihZ3EKc
         Lln00RZ8J6Ydki8YR3HDBW8ZaXmVKA1p5olLHmw/UvT9s08Hsdj+VslUp0ETUc5CbBEm
         4Dyz4nP0Tfm2WgsELyO0rNnZAVSyIf9VPNwWudhL6T1WpmXWvc5xg/j3NMvrPZ/EFdC5
         0KO3xZqLo2v9MQmXuu9IIMLBDP9KrhUF5drv8KckKbKQNUorTT1dbOCDnn9TG51xJCkK
         HyJQ==
X-Forwarded-Encrypted: i=1; AKwUvBzD0JEAdwaM9tzZfdPf7Rx5p8mdCuC1pfEqgVI4zR3pH2Gw9kPUHqiZWmGmVcUyTWf0ppQFJHXP8hdeiRpY@vger.kernel.org
X-Gm-Message-State: APuU4Z91YYzckpZWBLsikXhF1UEbMxfwpiGYQL0NvR2WnUeBe12zuggW
	/aMMEsYabStlq9xxGaltXMbnlf7zBCLyLPtTgbp8KOwv1tV2Lrj+oS2H
X-Gm-Gg: AYBFou3OIWK1tlSIlIglGFJxlDHAY4oyPXlUkU45YKom31tia6vo9wGCMM1OBb1CN3J
	58X6yuz8LjVfuGQVeag46W33DzMLkkpGB23ocqOaMCfaMrywcLJFLCHhxtD496k/ghX2WOmh7re
	PteYEueN/fQ6Gc2Htu3nqICgNJgNyntZW5xJ0vxM/9TNxmpkxe3iVlKzyp1z/0fZSVHV9n7ls9g
	gm4ybb2DhG1VFP694m2BwBUOYat7aOZY2gRY8D5oet0q0UI+2rHZmbSDHt860XA2QuYd/VIcgD8
	2ZoH2h3+JEEh3/I++PAbmOciXTQ5wGi1dbW3lzHCOsh7lGwRTVBqgSUg8D/ogbwxyY8UXdg01Il
	jauQO8dQD+SiUZnAhq4ePJq23B29AEFkUtPb5pbwMsibamkYukYHR+KRuXal8Yys7wFNSxKXm40
	ydn4QWZko+ueHbQjErxcnwFbXwQt19XF4mK5WmcA53P1hwRW4W+63mfotDcfLvDkMlKCBgirnN/
	VA+j3H38LOwa3jG2R5+7hVnLVsXyXF93mzeQFzeVvqqepnikXftY1bsGbQB2IezBIf3dkI1RZ7P
	qqjk1g8MmW1bZuZTqz0qu18Tg6/VNRfQW2d0c2d+rGZUJBsrROknVOE9hQ3yPaneONiX
X-Received: by 2002:a05:7300:7b81:b0:351:7ec1:a92c with SMTP id 5a478bee46e88-36a42431768mr30787340eec.28.1793732346941;
        Tue, 03 Nov 2026 10:59:06 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca39b3b7esm49159eec.28.2026.11.03.10.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:59:06 -0800 (PST)
Date: Tue, 3 Nov 2026 10:58:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, 
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>, 
	Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
	Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-tegra@vger.kernel.org, mfd@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-mmc@vger.kernel.org, linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
Message-ID: <auou2CBiiR6zA0G0@google.com>
References: <20261102135330.2493332-1-robh@kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>

On Mon, Nov 02, 2026 at 07:53:22AM -0600, Rob Herring (Arm) wrote:
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/display/xylon,logicvc-display.yaml      |  2 +-
>  .../devicetree/bindings/dpll/dpll-device.yaml        |  2 +-
>  .../bindings/embedded-controller/google,cros-ec.yaml |  4 ++--
>  .../intel,ixp4xx-network-processing-engine.yaml      |  2 +-
>  Documentation/devicetree/bindings/gpio/gpio-mxs.yaml |  4 ++--
>  .../devicetree/bindings/hwmon/maxim,max31790.yaml    |  2 +-
>  .../devicetree/bindings/iio/adc/st,stm32-adc.yaml    |  2 +-
>  .../bindings/iio/adc/st,stm32-dfsdm-adc.yaml         |  6 +++---
>  .../bindings/input/touchscreen/cypress,tt21000.yaml  |  2 +-

Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com> # for input

Thanks.

-- 
Dmitry
