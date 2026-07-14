Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79B9E3EE1FE
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 22:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784067257; cv=none; b=H+ZJhSwmFqjk7ZYrLgXFm5C+ctuy0oP+k3sWD4iH/lTuPze6XXWp8Ww1BH7cQWQ8oifA5M+OGvXw4BicmGldDG6Xw5nbvfQ6LO+AlfgJbsNUaniRHHT5xlbBsyn8fv3qsfddNiosjJWMN0RGmufjj4AgGFbxf563t6sUigBjV1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784067257; c=relaxed/simple;
	bh=sQo8MyflNQaFf9wonNZi16/VWQyCHrzPFF6L24qGfiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m0aULxRriNprvsc0YtUN1avlloDwNV5r/3487aW+8aV/0t5enbR7P9d/mnfn4oS0OloHDBMtg4MjVc3BMWqORqz/187LmAP6Op88gvEmC82TvF1pBVORogUfYXSno/pwx4EPEaOQem5p9hxHFumL0HE6Qim2rJqHd0g8UkhaGPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaKgu+vB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaKgu+vB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3019A1F00A3F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784067251;
	bh=BLIsbd3rIu0q440Nh2W6RF4EH0NXixw4UPs/AFN2KRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FaKgu+vB2YYShsFe2M1JXkalONH4g3PsMIU7elO6lSWiO9dMoJwlqx4j8W/8cPjYg
	 x+t2lVWhdjNNhMEYK4ngb8iqlT1Kj+JEQ/eCDilp9c4RWCuPiwkFuxCiatLqDGF5SL
	 2MOtduM7IRUQnPl2+LwD636S9a16tBhEDpCJaBLWK3zViZ4djKjamY+ToFzDEE/FFy
	 VAGAvB9TamK+/1fem6UcIodLpkiMqFiO/QyajNcoQu6P2ak6ssvHffzC3O7E81K1WG
	 GApTL//Y4RCUu/ta84KBQWM8VeimHtoQaOyZ/XPxfPQxb/EJi3FtHkRTc8dzmjVhZ3
	 7HsXS5GEem7zw==
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c167aa9500dso6877766b.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 15:14:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrndaUZ4Jr4d+ow1XvQgCTjXE3nVdSnU1AObiLp2o4KrZTSzbXuZ1/4eczBSES2iCAbgtBApzEdbOAXDqMj@vger.kernel.org
X-Gm-Message-State: AOJu0YxvWFC7HsQoXYQr3x0NfjtkY4F4oUzF44lw3t0cIarBIzq5swRj
	jTpRFKj6OIrGanvKl4B317hX0V/V1JEUVyTNmR0ToDrpJlApznLWFwJPlbf7GBC2z13QKit+eG8
	mGxcdpuXr6c/BBeEQpYk1GVLQPvS4Xg==
X-Received: by 2002:a17:907:97ca:b0:c12:73fd:a6cd with SMTP id
 a640c23a62f3a-c1661928df9mr370952366b.52.1784067249841; Tue, 14 Jul 2026
 15:14:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
 <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
In-Reply-To: <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2026 17:13:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
X-Gm-Features: AUfX_myV2MEj_WnNpL4PNdWyXrVcH3TfBaO-6JJmtqnBFQREW3AFA5aOuTd8Dkw
Message-ID: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 8:58=E2=80=AFPM Jie Gan <jie.gan@oss.qualcomm.com> =
wrote:
>
> Add DT nodes for the CoreSight debug and trace subsystem on Qualcomm
> Shikra SoC.
>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 1298 ++++++++++++++++++++++++++++=
++++++
>  1 file changed, 1298 insertions(+)

NAK

Fix the sashiko issue.

Rob
