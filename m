Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4849F3AEF57
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 07:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789974706; cv=none; b=j3do4UBxKTo/6/qsHxjkKbw6AmfqhMPg5ShSml7hYFRe26z2fa2ggKp8LhqZhxDioDyalofymyOBDMNvAcTC0ccFIDsLa0xaBvdxd8JR/0qsCHQ+27Ef5Zhguf7rpcyHpQwxLVnLX31J8U/JzTOZc/6gBPbTxoD9rC5e6tB867o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789974706; c=relaxed/simple;
	bh=IWy4s88MhDwNpHOdGe3jP1qXGMxg1e08ypz8dpiL9Dc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a/h1S2IDX+Mr3oQtmOTDSnlfDSSAvUXX7v/7AdUn14z3V7oJVnGiipCf7gZflk3Q4u7NZk762lh41NGED+/9BNIKbxAu/9rFjtOhzCu05ZzlO03qASaGapz+qNZDWOacWibmg7eBFs+Wj+Yt2DPMheNMcv9b5zXshtdh3Vthw0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk2-f13.google.com with SMTP id af79cd13be357-93a2a8c29c4so287581685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 00:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789974704; x=1790579504;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kOgPfCklfblv+g6nVV8jDyWvhZtKrbscHFmS476/ss4=;
        b=pyegseA8W92ykwYzA5jo886E5R7zE6FqjmTjcKbDS+1Zy4fgDDASVMkevw8sHhsAbY
         EPWOOukXyUN6eEJgxB7WZ8HeAj/Mm4Dg+56VJx30tI3KJVyqKG4h7Z/vELUiEQo5qxgR
         FLkl/nSFGbIo3Cl6HUSQXEMd4kE7ArGf4S0YDj6wEs7UIciHanspYTeK7ulfQN8z5t67
         oPJmYK1Z/lZpCfvonO0fIP5V9IxMe8LVzIITl47du2Eo+CkpSGP5v+a2ICuklc43rZZh
         FrZ8W7i7yYHgLsM7BNjs74+EL/KhYvdf2ffgHEpH1nIYgsQikbJaWvDV+3Swbl0iHk4q
         5jNQ==
X-Forwarded-Encrypted: i=1; AKwUvBzVNvMgspXmfdOlOI+CXy42RZxhJvtKMs6oDo4hp0TSI11SiZ2U4IPjpAp5L54Fmy/iAZSMhvXFC/DZERFo@vger.kernel.org
X-Gm-Message-State: AFuF++kCVZokxXhVZQYOCDYS39oZimIzB5833iaC/qqX+IxxhLVDVWnJ
	gtxI6RHlxA+3JHPsOTzUYiz6GV1ccxaP9ubtdwoBeMDVBH5q8HffycVF1mlHxIqs
X-Gm-Gg: AYBFou00XKGTsF0v2adeNAzZdL2mpbRRi5rwh+Asp3dulam9FB2ABr1DMgq2zxdB+Ks
	PXfAL5EelhxbfvSBV9Jr2z68LOdkrH+6fz1bNCRL0vwb9ntOiyM4ZxyMwFr/XDxcR6EyYA4UDaf
	Gt7nfqaaMV0GHkSGK7RiVO3nJtFvzbodzWsvgQHMJFSkDRFq3xm66qZhUwuzYe0ZTBmD9Ooaanu
	JImhjWANV7lms5hsF57GOHOZng0Ofzu/7h7unnAhDA2bdL+BPxVThmV6mCznqWGwoW9A6aGj7eW
	I/VJzVAn/ybgB7kXh9S60gKS5b6JREdEOvOVxbqNnGKXGc3CXbPjZEkQGUuihO91vb2EoA1mUWa
	7KtyMrCb2ZbvzDbhMbcU4qPOtVG4tUBalDZESZxN/Zs/MZ67BOeIevy88XYLgEWSDmsAtLFT8gX
	MM59QcrErOYwgpUeqMfqY4W7S4TQcYrAnB5PprwMqPlSBDeW0GgO4TKmiIlxmKtciOs7veyQEBO
	0FKVyOtVxNpbfkmlphAColbhFMaShXrs81Whg==
X-Received: by 2002:a05:620a:4611:b0:93b:d7a2:83d6 with SMTP id af79cd13be357-93bf57b386amr897735885a.69.1789974704103;
        Mon, 21 Sep 2026 00:11:44 -0700 (PDT)
Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com. [74.125.230.234])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93bedaaf3fbsm572994785a.19.2026.09.21.00.11.43
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 00:11:43 -0700 (PDT)
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb767cc97so29138111cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 00:11:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBypAlIKprbhzFcsklZe85DhSjVjiC4ofNy1aNc7vqE9Rmxz8g0+ZhZoonlvvT2E01bY+TTZ+xImec+DaYMj@vger.kernel.org
X-Received: by 2002:a05:6102:c4f:b0:7a7:198b:674e with SMTP id
 ada2fe7eead31-7a7198b70eemr2080779137.35.1789974354429; Mon, 21 Sep 2026
 00:05:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Sep 2026 09:05:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
X-Gm-Features: AcwNN1WjYVMR8LtQc9Hk29H2mvcKQfYOy_09b_XHHWkw76vwCkEFuElZphsH01o
Message-ID: <CAMuHMdWWOB48AUCbXh=9ZGCK2qZyVH06kJ2paRY-wxkq5NC16A@mail.gmail.com>
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

Hi Kieran,

On Fri, 18 Sept 2026 at 12:55, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> Add a new dt-bindings/media/video-interface-devices.h header that
> initially supports the Orientation types and convert existing users
> throughout the code base.

Just noticed these are already in since commit 6ab5acfb8dd38729
("dt-bindings: media: Add macros for video interface devices") in
media/master (next-20260903 and later)?

> v3 collects tags, and fixes the typo, but drops all hunks that do not

[...]

> v2:

Interesting changelog order ;-)

[...]

> v3:

[...]

> -v4:

[...]


> -v5:
>  - Definitions now accepted in linux-media, rebased to get conversions in.

Oh, you say so here ;-)

>       arm64: dts: renesas: Convert to new media orientation definitions

So it's been safe for me to pick this up since v5?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
