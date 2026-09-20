Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 985C3480948
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 22:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789943525; cv=none; b=Ej7iy1eLgIIY1rtdLnD6hnj6dlliqmGZJ6yT1JCbrrap/kj3PB/yznNb66N2IW/K7szzRQMserybgc3T3b3OBUltTKrF/Ml42fEO7aMycBNwf8xlIr0/dse6VAFs3iij8mldLJrF905Ub5A6iAJSoEtYW+k8lf3gurD8S0e3ow0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789943525; c=relaxed/simple;
	bh=H1RxdKnl+mgp+J5mdKqwKEcwtM2QvVr2AoIW/SdfGVs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=exqlBBzlkMP2UKV/3DwFbK37FLTPetSVMfaitzRdXvMzHhNx3Wqf1iLFOzYIPcURMel1mged7JBs0qFaoMMnizHbRwCBVHwKTXFqXpXvouxzb5d2+iWi54vIEyABEXAEZquLaisdzPU1K/yCEkGLiARwViiTZcvei7+n/JfCgyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P3iLt3zU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P3iLt3zU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068901F000FF
	for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 22:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789943519;
	bh=H1RxdKnl+mgp+J5mdKqwKEcwtM2QvVr2AoIW/SdfGVs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=P3iLt3zUTjFFgdks8BlwU4VmFyNpw0LSZkE+xZhvVXpSMeORe8mWbUqvJjVDxfbHw
	 8LtoNZam0QADhFpcOmFZeo8y8ia0U63KqXCuTjDg+ohT1IHJ0bTqmWP+eravZxMeCK
	 t8JtDdR3PkFjYTLW5Vi+aPvx485rdVxK6SJdWs0bPUrO0+3ztFtgSh7Ttx9Fvijf8q
	 q91Tl2jTx25o+RmugsBSEpJOgoviRgd/kUvV7SGVi0K7Q402T2eKUhQPb2VVH88UFR
	 FkWDUMO5e5vBoSq3lKpBWGzsibM2tN5Mh6uYt+pfhsj4Uir7jEEmCV2F/0L8gugX1R
	 3TBcDjKkvKMiA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f16c72so1877364e87.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Sep 2026 15:31:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzfKKXccJzF0ulFqFQsLbqiD2ACztzWisVOcC0SudmpQqWDfKtPsbyUZu+62gZScYLMXbPRQBJBd1ECpDpF@vger.kernel.org
X-Gm-Message-State: AFuF++lgamjFsDemRbMn9iIgmeXhbTsc1y1Ew+IWm3ZL85Lr7TOMhx27
	aW8SwUOct1BSATvFq5r2ohQ4bOBjayXAV56gpjUxSB3se77OubG3Sv/nE+k7ke2xwc29Xg8huMy
	UBDi0pdlzn7QzhlMNWxj7GEAhZveEVrQ=
X-Received: by 2002:ac2:4e14:0:b0:5b6:95e:87ee with SMTP id
 2adb3069b0e04-5b8c18137b6mr2715966e87.13.1789943193023; Sun, 20 Sep 2026
 15:26:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916-drm-bridge-every-panel-v3-0-83afb4f1a707@bootlin.com> <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
In-Reply-To: <20260916-drm-bridge-every-panel-v3-12-83afb4f1a707@bootlin.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 21 Sep 2026 00:26:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLk66Xj=4qTigoM6ha4G=+E5j7wOQCWEDq_x5BgoxKbqSw@mail.gmail.com>
X-Gm-Features: AcwNN1Xl2NMg3RCxeoynlYH4VMsnJTqdPMGzMe_YYek3k1zZ_YWzrrvsVntgttg
Message-ID: <CAD++jLk66Xj=4qTigoM6ha4G=+E5j7wOQCWEDq_x5BgoxKbqSw@mail.gmail.com>
Subject: Re: [PATCH v3 12/19] drm/mcde: dsi: don't create a panel_bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
	Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Paul Kocialkowski <paulk@sys-base.io>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Albert Esteve <aesteve@redhat.com>, 
	Anusha Srivatsa <asrivats@redhat.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2026 at 3:47=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:

> Now a panel_bridge is automatically created for every drm_panel and the
> panel-bridge API is just a deprecated wrapper to access it.
>
> Update and simplify the code by just getting a reference to the
> already-existing bridge using of_drm_find_and_get_bridge().
>
> Also keep the "connected to non-panel bridge (unsupported)\n" error logic
> by using the drm_bridge_is_panel() function.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
