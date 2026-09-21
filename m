Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com [74.125.226.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E4D367F25
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.226.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974437; cv=none; b=mv28qnx49MWtduso3amHCs74F+LR1LNuVPZdMiF73eODlyrvdupJY3KL1RMpg8lVKi1J7t3/8VVUfDOnfgoCQrC/KhaVMe9oLk19kwg8Jh3Y8dkBL6Ij5J/+3Wcsc0fgPx0MlwPD6lHYbdl8PuIkXmWGM/VrN1W2Wkl/poiQdo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974437; c=relaxed/simple;
	bh=mlXvSVm/Lq7qa7w+AV7HA/L3OjWuvTwojTve2NS37ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o+7sP2UJQlnwxoMZjLntOvEX39SmHptk9zyFRPCxAklM1bmhhA+BXiwznmHnWRznb1E18WuiAanZs7/7fXCjuntCcGzQzQOH90wsNBkEAC8FcjhlINgTsdRLubOISFiTOMr+Gkk2/2cGaSwspA10vQsU4G7Yrk1vYbpU+i6lGlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.226.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e7c8d040aso1337795241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 00:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974434; x=1790579234;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HB8j5/kP2XPOkdK+SCbhJLf9Uj+WB32C7OC3D9kNjGQ=;
        b=vCVcgeSqt5ebts2LTMkJNlCyn24Jfk4ysLG6egIMMx0s57c8zFLVv2g5GRUKByFbtG
         HWC6DwSNDgyanjuxoC1slkwX47srjbmMu6rZDejaWv0WqFTafP4r6dxDS/aqr4FXZg0u
         TIu3qTwsWxet1sksarL4spdO0SVMpk29sCNlaiV3dufy2zqKAPv/+uwvmOUQee7ITUup
         5x+MMqkeV4m5SNWHmDbqbQ9uTMm4tKA5vRyw1oVeC3lFhwnOyRMUPzfeYIqN4f/2DyWO
         b/rM0f1ZwIcYYYl+oVFBET9D2i4EQdc5WEOrYW+ocygQrDiQ4rCgq457C2hKA8yDQDN7
         mfiQ==
X-Forwarded-Encrypted: i=1; AKwUvByivwqt95Rmz28d5lFhtpwFiYyi3Nu7UVXhckdE5xsIWXKIo0qxKR2ZypwK6GQJTL//eDYIYYXKjIYpzLCF@vger.kernel.org
X-Gm-Message-State: AFuF++nhNBrPXjTRUaDnP3qGzgicXUOrT06v9x3GTnlvZ3ijcdGRiJ6c
	W86oSZx2x2n6GkETctkVOtTbUmQNCBAbk8mA5xQLXTjh5kJkcUMEDxqSBq/kfj9i
X-Gm-Gg: AYBFou0rnth7pDE4NWnuxfnqAYbawQ377iyZNLh2fz7s6jHuEQNZz7MLh8wabHhcme+
	PXyLrnajA6STk/yVSeICwoW3SlU3x2fveSqLOr237fdpih0DI/Eb88Oes0egOsYmqXpvlFeYyJ1
	iSz85wR5qbYTUP8IT0/X2pe1p6MnDw5xVtMx0Z5ByZzewCwtpFu/xC3llwjZN5vy9O0TgPwJNdt
	qpa2nD3mxCDbCbuaCLsko7ujWmvGP5gD9DReYyp0As8z2z5f0Ez6w2/Tj0WxmHsQGqOKwQtMnMy
	Jtc6IyazAwY8S7Wwu4dTDs/ND/vGAOZhyR1JaRmC5b7sbg7ZY8ZLmvcEXF42vpv8bjkgqEylQ8j
	tZibMVfJ3mUEX0g9v4836o3iq80WgHcD69PWJaTTr1khYPGlddmzbez865iGvQr01Ag3I895zPF
	cATOZpY38bXxBerolIcVdS8cx39fCmQh+EL6+fVW1b9A/I3eKv/9uA+j/hANE8TpSMEUSmKZ9tn
	EdlBnZy6DHPn9QTLwVPmKOuFeg/pspj8vm62Q==
X-Received: by 2002:a05:6102:41aa:b0:7a7:19aa:8a83 with SMTP id ada2fe7eead31-7a719aa90ccmr2054405137.30.1789974434398;
        Mon, 21 Sep 2026 00:07:14 -0700 (PDT)
Received: from mail-ua2-f12.google.com (mail-ua2-f12.google.com. [74.125.226.204])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-984d53846f1sm7404149241.12.2026.09.21.00.07.12
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:07:13 -0700 (PDT)
Received: by mail-ua2-f12.google.com with SMTP id a1e0cc1a2514c-97e97e2c7b3so1403136241.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 00:07:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxTrsqBgoZEeuexS4vqd0l+tB4d61Huwcp3Tz8XQre+99qlq6PrDNitUYkMQgVkqPsUFCpD5U7t+INlMsd1@vger.kernel.org
X-Received: by 2002:a05:6102:b02:b0:7a4:da60:acfb with SMTP id
 ada2fe7eead31-7a55af3177fmr4503081137.8.1789974432591; Mon, 21 Sep 2026
 00:07:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
In-Reply-To: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:07:01 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
X-Gm-Features: AcwNN1XBDwh6z17IsaQFiDrYFydSgUDFMGU_5lJeAdoD724Pjbvrq8QmlAe59_g
Message-ID: <CAMuHMdVhK0vm_Ksze_=jG8D_=8Q45v+ezNbxwL7JntTt_v_fkg@mail.gmail.com>
Subject: Re: [PATCH v6 0/6] dt-bindings: Orientation defines
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Jimmy Su <jimmy.su@intel.com>, Matthias Fend <matthias.fend@emfend.at>, 
	Mikhail Rudenko <mike.rudenko@gmail.com>, Daniel Scally <dan.scally@ideasonboard.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
	Tommaso Merciai <tomm.merciai@gmail.com>, Svyatoslav Ryhel <clamor95@gmail.com>, 
	Richard Acayan <mailingradian@gmail.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Quentin Schulz <quentin.schulz@cherry.de>
Content-Type: text/plain; charset="UTF-8"

On Mon, 21 Sept 2026 at 09:05, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
>
> Hi Kieran,
>
> On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
> <kieran.bingham@ideasonboard.com> wrote:
> > Add a new dt-bindings/media/video-interface-devices.h header that
> > initially supports the Orientation types and convert existing users
> > throughout the code base.
>
> Just noticed these are already in since commit 6ab5acfb8dd38729
> ("dt-bindings: media: Add macros for video interface devices") in
> media/master (next-20260903 and later)?
>
> > v3 collects tags, and fixes the typo, but drops all hunks that do not
>
> [...]
>
> > v2:
>
> Interesting changelog order ;-)
>
> [...]
>
> > v3:
>
> [...]
>
> > -v4:
>
> [...]
>
>
> > -v5:
> >  - Definitions now accepted in linux-media, rebased to get conversions in.
>
> Oh, you say so here ;-)
>
> >       arm64: dts: renesas: Convert to new media orientation definitions
>
> So it's been safe for me to pick this up since v5?

No it's not, there is a hard dependency.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
