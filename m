Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210021;
	b=Tfy3AC8/xWOlPLNTBpeGpdcjaC+P/Pfms2Bg+ytHxgdm/2s8Zk3CQMksYbb47ysA422l
	 SHpz/uL4u7aZvbWZKZboqZPL5qpny02K/cJJiNpvJrkqVTY38C7L/2KXcXlbAH9uRQFTv
	 cj3pP+bX/bP+Ai0/nLXJY/F2gcUo5oNDnHl7D9tIbu5X5fdfw76uq7JVZQlw1k8M8b1W1
	 ZWnTyuPNbEOVsUviRdXtny6PLar0p0rAvwGkW2FjV8SKeuDt1GWDoUxRmRLnBhW370RyD
	 zzNPNXrj0u79h8Z/mlpPYPCGtejoc4H/WLCXdhPrqv5awPJ+HuXgCMjsVyXqLSjYWPA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210021;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
	b=43to15aQtUErafl7jFZZ/MHBW4ZDKlosLJE5pqe50rZ12EEYZ8Zw3Yj6lGX7vW13VSzz
	 vENwjob1C2PwsaA23kZZhjofDsMeVeE+TUVK6S6eGfLtDcZ3aC4qwrFWx+Kh3UsVra/BK
	 hJSr+PgUtNAlQBaTfKf8K2/j+VENsX93Pdrt5WGSnSwiY32kaG4BidGNZosM5S9mx5bIT
	 MSHO54NHWPqNpQlFoJa7yJv0I7ibrpF40War7ETbQhpNyFE4prkxEUHpD0ovOE0Y/xQ43
	 /aEQzv2XLcF+siBn7/0oRpOdvItvjHdA32QNCgqtPHSpToKhHQp3sDKC6KGd3yyWKUA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.179
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AB3F606A330
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AB3F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-cdb15cd8558so201787a12.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 23:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210020; cv=none;
        d=google.com; s=arc-20260327;
        b=W6ObuRD2vqP+nSWWcEcOktZqIzXvNk54dHVcH9H20q8tCtCGSKuPsnYhzFHhBhQaga
         hK+5cKFKmXLdmc3wwzRikj1LGyzQfbnkbVzBPjilhyqvUvk4DrzkZc7hbbWIu0qQIZav
         3URN3xqwW4Zoy4KGgpiyT9lXdD66TeoMWohLyVLFmZRdMjXdazDER1UGAMUxl2z6Tvb6
         WSUG7Ju8gjyAf7Tu85K/xgaUeTmbDjQ1eCjQz4LTBrBPiQh8Zi9QNPVvosjVfn8i2fHo
         ZDEyrtpImae1Ny+/YIUn8lYyDCs6zFRiV+RWqDNVtgAdjoN60Tp112P3MZX8DBBKwSbm
         0H8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        fh=VHXTN6Tuto0G467M6zDzIPmd6uo/65hi1WsB7XEqYQI=;
        b=eDsw3WFYG/H4uiQZ0aHGmzREMnRtOiZCfqCuC8Q2FXo5vz9/Y0ZnpSzR9slz8akvHE
         u6GSZ/Q3VYN3viltxyL9ujrkLKl49JoqUveiQvPRdl9R5mYWCnn2t6IUo1GWvYTiQkAt
         d2z40VDmDOBxT5KaQRq+dtN8QgJ/l1cwhvcOJ9CCw3btb6U/WBwatHFF4Nc4gnfN/IdR
         oi5yHOajOhfiBNlXcclRzec7W49ob4s4tC2t0LA2FEuonVcget0hn1zqw8/e/ydjOXC+
         +sQnZi8wnxtBgPSSXO1DidNejA0yCpHP/V2B5XBUll7iJXPgNc4oUO/kOOfaJXC5n/O9
         gJHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210020; x=1794814820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=Fw1HJ3eBrEG+YcG2OfXIKNyXLbtxL6pFyShNR64xnTBicLVJTLcqI70PP7XlmXPNx6
         VWmQ662eksYGc8vJo+lcMpjTIaYcJB9aokKPIxavS8OWhjpOs8W89bix1ozwYvKeb3b4
         M7C1Y4n+R7cdsAeFDh3I3fT0WNvzf0CnRZWDlQZYC+5M2rSyX8wMQx9uS+vQs8QSo0d/
         2FLip2Uo0zLuYIubK7TNTBZ4sl8ZrZ+JeHk7SDm/ZlHHFtWu1M3YyNEi+YttPBGWC2RM
         X/hXAhXzRlZNf20NwByFmIPl+GnzmQCqAB4nehLzmm3jWxLA5k3xC+msTg/JbR6XvUqv
         ep4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210020; x=1794814820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=cUEUbxuDxM13JKvXFquxcxnTFl+hpeiA1aHJ7/8YDymNLahlT/3zgJs0ShfUrov3qp
         8ElQ+R8ZYDk9VHPEkQRLooZ0A56/0etHrEUUwkTbTP80H8143uR/lFh77C3j28hWMr7U
         Pzl/UIPR0CHv+1EIazOapfPPnSkgzdsPjgpub1IOXVm0zfS4v+ZpDT1Td4eOezIuSNIf
         hsonyu5L96WGf0IC23CctYh2qPsYCqA+je1hWA2V0PK3LrmhHY5t6qmlBE9WDQ8odQ3B
         Ay4s5nFiLWKrGqWumlbDf5RgO02iE1DlAu4bh9PJBYnGQA3HhHXV2hIayeytiunWNSz1
         6TxQ==
X-Forwarded-Encrypted: i=1; AL+hErGFiWiMlZk1CntNPXCZUz9XedA3AFC05Jag/pqk5zbs1fCN7dz/czJXjsopI5JlnxrHviHOEYIhX3C6JrpI@vger.kernel.org
X-Gm-Message-State: APuU4Z9QK0LOI5/egr+4A1mYsyRBDi+hYi81Zqb4MVtl5yWRZvtj/9wz
	WwWiC4URYjzKgxFcO3gKwz7UR3p1FUmNqTxsd455K8gZE1Gje9xHO9Bwf2+fa4p3JZUbUueR5Qe
	AFlVxXccBUZYISTvoZBhxMTbjRz+IEuI=
X-Gm-Gg: AYBFou1MQYafEC0qZ5/PgZIc3758R2tnA87oJ36KUd30/OGnyzw0Jso9lXoxolNWVRz
	HEs4P0ljVT7PDEPmyp3KOesLHkBL76cX1RIEY5YtcAtDAhYNSjpE6Op56P1FC2azV54F+2KXJrQ
	lzLYGkyPnRK2FJykLvo9pmupJM4hDiZ07usrxm+HFXY5Ul6EcjGdr/hkbGkvLpgYtb05B5awpoP
	zWTKZhoWDowNyerSH6rHLjv26KNzBOR8mk+DT/mVjO9KPRqicGF3kAsxrwMOlGUNeDTQsiRxaqi
	YzhGyg+2zifVZrEEVzhMTlWQKlDDOmxMtxIbef+OMVe3xJYYEbwM/DAHl5DO5FiERYsVp0r5OpK
	ULhHjD8sVuU82xpxTo1QjQkkG4w8EY5Iysas=
X-Received: by 2002:a17:90b:384c:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b12d107e44mr3364118a91.4.1794210019701; Sun, 08 Nov 2026
 23:40:19 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org> <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
In-Reply-To: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 9 Nov 2026 15:39:42 +0800
X-Gm-Features: AclHuK_dnPMk52UN3-2_wspDGRy5a6s-cwmnh8paY6ZY-G54Qz5KZ0bygsAWCVc
Message-ID: <CAAfSe-shr1+0YpxEvf+4k+DyGe3==PUiD72CwjE+RC4gX-ShiQ@mail.gmail.com>
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
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 10:39, Chunyan Zhang
<chunyan.zhang@linux.spacemit.com> wrote:
>
> On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > Unit-addresses by default (and most commonly) are hexadecimal. There's =
a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yam=
l b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > index afa551f6185f..222d70baef1e 100644
> > --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > @@ -47,7 +47,7 @@ properties:
> >      const: 0
> >
> >  patternProperties:
> > -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> > +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":
>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Following up on Andy's note about this:

Please disregard my Reviewed-by. Even though I did look at some of
the other hunks, given that I'm not familiar with the other hardware,
I don't feel comfortable giving a whole-patch Reviewed-by out of
caution. And since I'm no longer the SPRD maintainer, an Acked-by
wouldn't be appropriate either. So withdrawing is the best option =E2=80=94
sorry for the inconvenience.

Thanks,
Chunyan
