Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 724A95208AA
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789756260; cv=pass; b=RZc+NW16go84Rhwqt0gjEAEfNR0dUMw0W1YM+DIJy8BbCvU9M67K19utiCnbTrkZ05TaZ55w7raRzz0BWfCrUIjzMSo0iEMuGVUydu0Oe80GiZHrnRWiV3MyV5FuI1TWLU9+oPK2o5JZfO9NHTFChQJjagCPyjPUCSleV4P2Dhg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789756260; c=relaxed/simple;
	bh=Z3GCDadB22nJ3H8dlp8oFEKsrJ7JLQwFPKhgk/HwR1E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hjZtUbtuqN9FeXB6p/apPC20g3wUSyzdQg/iJlLURtncWfBMphQjwCEh60U54vxqrwMQc91pqWSk6C2zNsoe2ZiroZhcRRDNFnOzQSp6g2E3QlJNE73t+5wvo1Juf4d6P8Yy7fzo67ux09RlxVuSe4Zgd2/RbTTUq1naTIK75QM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C7pXUP8g; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C7pXUP8g"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4d2fe2056so691662a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 11:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789756253; cv=none;
        d=google.com; s=arc-20260327;
        b=oeeQQIXc9k16zo2hEDKAADDRvEFJKDbEcy7DKxySCjNjkmx27VJtmtuV7tlgocX2Eq
         nWQafWI6QdeqYOE9hBICfdDDkisvTtUDkA0ppTRsxCFFsC1kPK4pF3lCDIvsPWLZHvg9
         UApiAxDYGKlmLv1zNta5y/UkMjQ/u9QlaV4moSbvecQuTeVFM8rNzhvqNTUP4Ab1dBET
         44wzoutQsQnsskDne3ju6OYJZUE0olcCaYNRubhcJzavP1GFE90/x9zIA3nJndTkJDkL
         OHY3U7apDqwacpuqotVLi/NA+j4WOnHF9v8rzB69xNPrWM6WHY9XL5ZlgEqRWgwnBIlC
         tMiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        fh=SMhUzwAyn0BjXLpIUoqO9ooXpaC59WUmZM+hha5eFkg=;
        b=fS0dHNuLkIXP03I6V0O41bNnX6nEJus7E4pEnYQPQmxiNstrxfEW01+27V5idTFiWt
         Rt+cBty7QP6BLpdIW8M3O2fPWDv0ZCD7GlqQ7zOfB3EzA2yBrU/nZB60Ywee3Q2ut3Js
         beav2dAJuLgKJElsTpXQ2tqiC0sU6duKRBT1GVaabFTvkSBS3rGap9ND24dPjO8vmycJ
         ZTj9By9P0BMp2syoKDieJ/TotoMBal6Hs3QUTOQp0Q7A7VfWlKh2irDK3/IZUxEAaSJf
         YUWizEyZtFvIQGHPSwFXwpTm+/H8L0ReUmfga3NN+1bqD9nIvM7hffzok7uwOQl8neO0
         +OpQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789756253; x=1790361053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=C7pXUP8gPhskr6JrmaOqzZbQFyo1KCY0eWKQkzc1OTFuEgVNYdOOrYRvHXw4nvnV9X
         mBJPmUNTK38gMHYRi6phSIKGl4On4aHQGIrh/tv15tmpYc/TdZdWJidlJ3FLVoSdZv3A
         FMoXWk0qCpi8QwmMIh9pp8LuAIMuI+NYcr6bn5YVg8vUm4kSXDfisDdtDWvcU+0buAPa
         GATSG9GzrWjt6/EwRXvdqd5nItW2XnjP5ciEFJ4zvwfY4YLLtuNpZ/+47iKZdFBt2F+a
         GbejvzsiPaxFvUyr4smI7t8qM4KBpFVHBG175O6AcfOs0HAmLG3eoKCS1AFnL6nqubHI
         npyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789756253; x=1790361053;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UthLOTqsgx1H7Ky6X1sMBpSJ/ushOzRSeE2EVOIQouM=;
        b=qXntfAdnd36SC8mVLYpM5VnmbhxBjNdjc2svDBNSwMv50egr/ZcVMM1fS4iglwtinM
         kVL70dzJefUsuY2NVtIgpE9JBl55xlM7KTLrW5AWWXz9wlqTIx5mLPYsu/P2mYbaRgRL
         lqOLwqJ0vIjQergnLUShz4YOdC8djNmGi6vwSERJruR+rtqgpjLHvpbqNf5piu2UsW1y
         rAx7kLYJ6XPfYVlx2Zs1yI/Oj9LczV/OGeo9iSd8mVvOQEHCKz+VdAsRHRGmmdd8dhMk
         wstlbZBP4YxpZCljtGX1mrOXLhhQrTQcjbBhx0rNVUhsV8d2IqDgipBh1aOmFYoQQtxy
         /Wcg==
X-Forwarded-Encrypted: i=1; AKwUvBxoEpHSaJOqIxHBPVh1QyKC1VE9xHN+Zh8K/vfIt/Z/PcdrYP7eohT2p/IvqCKf22+TXci0Aceuu4rXWgdI@vger.kernel.org
X-Gm-Message-State: AFuF++knxhBMI6vk/yoyoY7jPAqm6VCIrrHZQ0kuuRoYD5wxKY22EpNm
	ukVJlltQOKz3KD+DLb8fvXhW7NJ3SaT4P3hiFWORLI8ilwP7YY06TysorLEfol+p6p0EFPfkEx2
	6EbdTwpnywhLborXzfHG8kA1pdumdv6g=
X-Gm-Gg: AYBFou3mx3X66ZUVcWB5IuhwH4B+v/QeX3Jhjx8jpOOAIXSyPOgBO4PIuLB4p3E4xAZ
	4xb5hDoMUDobI5Rqv1Rg+1qJfwjWG+dlmQkrcr6auXFaIsX23+zi/Veo4IxVMRF8/jFHXBkP9Lm
	z10Lj1eI1UYaFbdmPYsXAwMoHL4NhWFm5dHH7VuXF4N0DI/gVy4f+GSgsVGtswH2Px7ndIJfbj4
	/JsFX1f3hcOKLKIOK2OYjRt2JM0/ePJ41uXH1mx6WHBkYdBtKO3GR2r13Fsx3fuItgqp8rExpkg
	A04rq8G+ayC7x4XWxIXSOqK2FD6Xi2w71P55l+IhpSSQ7YhS/8fe2TlBt/EPKD9lTihsNIpvXSP
	4C/DpZUn9/5F8
X-Received: by 2002:a17:90b:2681:b0:39e:6c69:f482 with SMTP id
 98e67ed59e1d1-39e6c69f55fmr655165a91.65.1789756253090; Fri, 18 Sep 2026
 11:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com> <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
In-Reply-To: <20260918-kbingham-orientation-v6-5-5e8b1f01be29@ideasonboard.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 18 Sep 2026 21:30:41 +0300
X-Gm-Features: AcwNN1UUuDTcQsQdT6LSC3YiQR-XJenFcyp7p3MxtUdbO4cYi1dTxigUEDSEcPc
Message-ID: <CAPVz0n2pZukL2tnaJef-N=kRiudVLN7RsTjKJJkTqp9-_k7HwA@mail.gmail.com>
Subject: Re: [PATCH v6 5/6] ARM: tegra: Convert to new media orientation definitions
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
	Tommaso Merciai <tomm.merciai@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-tegra@vger.kernel.org, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 18 =D0=B2=D0=B5=D1=80. 2026=E2=80=AF=D1=80. =D0=BE 13:44 Kier=
an Bingham
<kieran.bingham@ideasonboard.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>
> Update the users throughout the nvidia device trees to use the new
> definitions.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> ---
> v2:
>  - Fix MEDIA_ORIENTATION_REAR to MEDIA_ORIENTATION_BACK
> ---
>  arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-common.dtsi | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-asus-transformer-common.dtsi    | 3 ++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts                     | 4 +++=
-
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi                      | 3 ++-
>  4 files changed, 9 insertions(+), 4 deletions(-)
>

Reviewed-by: Svyatoslav Ryhel <clamor95@gmail.com>
