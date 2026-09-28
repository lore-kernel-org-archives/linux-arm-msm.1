Received: from mail-ej2-f42.google.com (mail-ej2-f42.google.com [74.125.228.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29C0450254F
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 22:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790634040; cv=none; b=BfnSe+UD+fH5iIcAj0P3DUWDoyy5VUkoqp9TGjNWMreGlj8R3dvOh84BDCKcl39q0v3EfRl/5REqt7DiVLN5lcwyWnRSbc7vnzl5PaFGQpJmL3f64CGyNPG60dPz027ZTuAXjci70Hx0rBMqRH2n22/vIs1T+hV9GGXZEBhoaV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790634040; c=relaxed/simple;
	bh=CMhVbbwMjVNodf67+oObxNDkfFFuusEAICzl886gi4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Iehr4OBl4Sr8tHiDcCoIaPoVjo7cgY4/usFhlmmWYmIOEbIqlg4ua8SzDoCyyDxpYC7fQHR4HQKR7eWGMCIgRw3jzRdoq5dR7wJz9oB8COvDRSj4K+6kYey9chHyCNH2OLh9/uhAMRbxaO+jblCi7qKmuPvPEAqKfr7hmhRSirw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Fao//qla; arc=none smtp.client-ip=74.125.228.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Fao//qla"
Received: by mail-ej2-f42.google.com with SMTP id a640c23a62f3a-c2dbdcb4f59so332273066b.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 15:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1790634036; x=1791238836; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JArXmWr/mVGoLLKcByjQ5+EXzcvGruMpOpTO8U+lXSI=;
        b=Fao//qlamZSX+f/2MgbwFl3r2WcI9gFqrW+kTk+X/UTVx84y3mzqKtyxTbMaNzBXo+
         wioYr9LnT+cUplhdPYW0fTbGD49TmAAwXyx7/LIqJGunvDweMIW1WqTcT7QUaS9yapSA
         Wskvo9sG+e7fvyhx6M9SzBJyiOppU6ZT8mjUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790634036; x=1791238836;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JArXmWr/mVGoLLKcByjQ5+EXzcvGruMpOpTO8U+lXSI=;
        b=2F494PKGPMlopeM20AwHLda4LsShF7ujoixtUc7G0tXyXHi03Y4os1ssl/5cnOBFZJ
         qcP8xZMSd6WTh8n79C4KFpHGpIMfs62aoC6gtXNM0R2xp4iyQhqpDY6LdcrkGvCh/ZVf
         beLgj24Y/J2+f9EvvpHnOilRRfvY9HyxV4orBH12ujRozveo1X9klVc2TlVMpubgT0T8
         wrgfxeCx8kNETWaol90OfK9F0+dyJ2nOWYGPJi3UxcPwBJ+Ngtz8X1G9KiVhhtbl5LoN
         fAGyu1eHjy9qEEH5N5JO/FI/KPTX8nzid1tlvodVQaAvF9icpLTqqTIhryqEFICmV5jb
         mNEA==
X-Forwarded-Encrypted: i=1; AKwUvBygSHbc9UVi5d+YyhjRQxelpVbB7Rp9mDqkHO0Y5iwNywuXcGChaq25Y1ETjW7y/IoPTv/w47PGrnUZ1eto@vger.kernel.org
X-Gm-Message-State: AFuF++nVfXKyPP18vpldB/lM0ClXCZO2P+GH8aTICOO4/NRov1uhgM8c
	n0Mp7ew7QSAZnXiUSrltLbFU+DB7HoJy128QNoytXmdLhIyHtO7OqUgtZl+yEMC1UNc/VjDv8rz
	So9CiNg==
X-Gm-Gg: AYBFou2q9ODuOx9fuAm4Y7ZoX0/bho7mn8rat4DgdL24DUo0ldde9x616ENpaq8Edo2
	iIzgnycrPG4pHLU50K5fiV35pQFdubLBJhm+XCWBc00tmp7sOoP3NpRFnqM2aQtLS4G+vRf/AEh
	r0hAFN9e9HCDjj1x0VlqhwR71tKKuRNzkGYGtVdkJZug3s+vkOE5toDS6Dd4QB3p9Wro1O9DaTi
	wCoLKtU0HIeHCldOFLSvof57R1Sr7XaSLNPawXaXSmga+dTFombv12bvruA2WIRB6W2EJCJSVWA
	9i6giVH/lQb3+eD+7h/EtT/NT3gLJjTRPjXYp3QOQzm2oRD6p/X/TusiDcr8pHiN+XCJQL4HhwI
	iOYDtaV1TnZpukPNH8xbhdJ2wB2iJkolB0H0qcFq+b8TqQv8ThVZqkLkV2AklurviSGwk1e7/Zu
	+d925Hhkyg6JPFNis7HtltMm4N8IlsLT/dwvQ+1Hyu3RcXNhskrVGihYoP+tU6BqnJZSaM8SnOL
	pKWum78RuDsDzEEB6SvKJeZ+/xj8x8+1XEA85AIb4oR+DJaig==
X-Received: by 2002:a17:907:3ccb:b0:c26:1648:a074 with SMTP id a640c23a62f3a-c2ac2599f1emr1232132666b.47.1790634036356;
        Mon, 28 Sep 2026 15:20:36 -0700 (PDT)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com. [74.125.225.141])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2af70056bbsm458508766b.49.2026.09.28.15.20.34
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 15:20:34 -0700 (PDT)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49ffe817151so12820345e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 15:20:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByBC6g0E88DSf2mRYCcLgHtRExKVGspAi3nJaPof2Va9RLBBPoWwZJn5/6bxwdl3Kle2Fr+FYXmrKiSCdW6@vger.kernel.org
X-Received: by 2002:a05:600c:6986:b0:49c:fa21:e73c with SMTP id
 5b1f17b1804b1-49fe66f147bmr235241965e9.18.1790634033791; Mon, 28 Sep 2026
 15:20:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260928161605.2271412-1-arnd@kernel.org>
In-Reply-To: <20260928161605.2271412-1-arnd@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Sep 2026 15:20:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UzWmSjWZ96sBYvRLr=EbYqqBZ71o2BqotUsxRf5zqjTg@mail.gmail.com>
X-Gm-Features: AclHuK-sVszmxzKslRXTzUjiQ3wDqpSD15BZhQhdtvRJFSFfPWjQSieqaRkgVN0
Message-ID: <CAD=FV=UzWmSjWZ96sBYvRLr=EbYqqBZ71o2BqotUsxRf5zqjTg@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: add missing drm/drm_panel.h inclusions
To: Arnd Bergmann <arnd@kernel.org>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, 
	Sasha Finkelstein <k@chaosmail.tech>, Janne Grunau <j@jannau.net>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Manikandan Muralidharan <manikandan.m@microchip.com>, 
	Dharma Balasubiramani <dharma.b@microchip.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Liu Ying <victor.liu@nxp.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Sep 28, 2026 at 9:16=E2=80=AFAM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The devm_drm_of_get_bridge() declaration moved to drm_panel.h, but
> not all callers include this, which leads to build failures in
> some configurations:
>
> drivers/gpu/drm/imx/lcdc/imx-lcdc.c: In function 'imx_lcdc_probe':
> drivers/gpu/drm/imx/lcdc/imx-lcdc.c:404:18: error: implicit declaration o=
f function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
>   404 |         bridge =3D devm_drm_of_get_bridge(dev, dev->of_node, 0, 0=
);
>       |                  ^~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/verisilicon/vs_bridge.c: In function 'vs_bridge_init':
> drivers/gpu/drm/verisilicon/vs_bridge.c:306:16: error: implicit declarati=
on of function 'devm_drm_of_get_bridge' [-Wimplicit-function-declaration]
>   306 |         next =3D devm_drm_of_get_bridge(drm_dev->dev, drm_dev->de=
v->of_node,
>       |                ^~~~~~~~~~~~~~~~~~~~~~
>
> Include the new header in all files that need it.
>
> Fixes: aa8a8c7e4641 ("drm/bridge: panel: move all code to drm_panel.c")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

[ ... ]

> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index e7f9e6d58927..e50737432071 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -36,6 +36,7 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_file.h>
>  #include <drm/drm_of.h>
> +#include <drm/drm_panel.h>
>  #include <drm/drm_print.h>
>
>  #include "drm_crtc_internal.h"

The above one might not be necessary. drm_bridge.c only references
devm_drm_of_get_bridge() in comments.

Other than that, this looks OK to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I'll assume Luca will apply the fix since he landed aa8a8c7e4641.

-Doug
