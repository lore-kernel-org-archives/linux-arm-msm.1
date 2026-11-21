Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795294018;
	b=YiK7CmUnlTPqUztr+jOmr5hfL/LVmH8kK3Q2hAMlySFbNtD9ZjDk66NAIQJ7xUn4FA/a
	 EYmWFvfZbF5JUL6icIArODB5I4U7quy+kLvHhefWf6UzrAKimmTTnekJaK3YS7Oa1kdy6
	 dvkmyzP42Bq1uvVWt7427pq7cnRGydg+gYCJg2wZyVWOHiWjS/q4VT0LeWqawuxLleG0k
	 jnz8y/ypLG+pHJv3kaFLNWBhYsbPxmMcdCS93RSsEm08rJ7zkITsA8wpa9gMlIHorPjDL
	 R53RTKrleEaCEGg6Jvj5fRYvXjARfZyp+II392c0okUzGXMkYdgb9aYV7yHIn+34ZOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795294018;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=KBAP+JWazOGOCfastfioBRGlItoj95+2iYLwUgECcdg=;
	b=mcV8hehXrVUHwSkGyuBaAniLZ5CABmjxBnIxUmdr+Fhkw+FaKTNWd0OeEfNUJfTYn41B
	 uw/Avj9LelJGM0RCaDUsvARAulK6EoP8VTZi5ssUIwZQeUTuy5Mcl2LVE8rp1DdH7+paT
	 RIjN24lKbX+X1shMPt+NP/+aWg0S8IiQHkucaojrisLyWSSy7dql8XTgf1YEVEcK4I0Gn
	 d/12AJg0SKJ1kqTIatsvQd1lQG9OIsCgUzv6a1pitLpmQ5e00NpGqlSHYlrWp8WD2RZX6
	 aFEODWXgp+T6BJTDyGJjVcBgjzJnH16/LS4VaQxfJVwDUIPxVkhEGBjwbmtFsl8YONQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYCJCo4w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB2D606A333
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 20:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WYCJCo4w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AA4D1F000C6
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 20:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294018;
	bh=KBAP+JWazOGOCfastfioBRGlItoj95+2iYLwUgECcdg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=WYCJCo4w136y0Fv5X7VFsWrs1eharrpyUYMdpn0pkCL/Ks/7iUSascPrPiKFNzyys
	 uXZJTxXgoHxl90No9O8upE9fnjorLJ0KeMFsP/M6Bs5fpgWm2FrkmiOUvwCBiV02OR
	 juvnnrAAmum2VYuMkQCEibMtal3H4ZhTkbfyM8BDCDyNBP0ryJaGDjQCEBxQHapOMb
	 hIFiMY/QEn7IopwGpLhXG73YHx+AuTzdw23MCewWBuDUKCz75d1uNOTfLtge693PAN
	 xy83diRqxtZol8QGqmpiEbNl2IW8K8LyEneLfJt9rYAtODqfKW1CPAyH1yUZzW03FI
	 dux+IB7cYVNnw==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso2980504e87.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2026 12:46:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHPlAEReRmILr9NUsQvw0FKIfFpV6/SgRUqhxWAQVc2oBYq+AcezMOGZVj6a3amdHLAVgNQv0B2gL0LY2SX@vger.kernel.org
X-Gm-Message-State: APuU4Z8e1j5hzpm4RskoagY4TUVIpv9uuIJSHC3/e2eNvRfCPQzpouBY
	UPno2A0JLKaTsW9ZXeHw/Eof6ns0eDjzpe9qQVxH9dD02uOVEugGlXq3aX+2fy0pdKgCUEtoApT
	Hfv5tk5o1/VeCebTqaQ/ONC05+DAUbBA=
X-Received: by 2002:a05:6512:1042:b0:5c1:4c4a:f026 with SMTP id
 2adb3069b0e04-5c1bc6f633dmr2383041e87.4.1795294017042; Sat, 21 Nov 2026
 12:46:57 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-egpio_fix-v1-0-569d220a4748@oss.qualcomm.com>
 <20261106-egpio_fix-v1-1-569d220a4748@oss.qualcomm.com> <20261110-modest-significant-ostrich-8dd408@quoll>
In-Reply-To: <20261110-modest-significant-ostrich-8dd408@quoll>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 21:46:43 +0100
X-Gmail-Original-Message-ID: <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
X-Gm-Features: Aa3M54pkPP-k4Hfm-HVSsCMs91C14Me4yvAKh2ZGSuerCOgY9HmCsGMWje0k63c
Message-ID: <CAD++jLkpFWWSV55LkhAa4YfckDvzB6PrHWugX0Mth=cQRYkMDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: qcom: Add qcom,remote-owned for
 ownership update
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prasad Sodagudi <quic_psodagud@quicinc.com>, Rajendra Nayak <quic_rjendra@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:28=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
> On Fri, Nov 06, 2026 at 01:29:41PM +0530, Pankaj Patil wrote:

> > Add "qcom,remote-owned" boolean flag for egpio capable pins since they =
can
> > be owned by remote island io independently of the selected mux function
> > even if function is non-egpio.
> >
> > Presently egpio is treated as a mux function level decision where as
> > hardware programming guide(hpg) specifies it as pin conf level decision
> > i.e setting egpio bit is independent of selected mux function, the
> > driver/apps claims the ownership of the pin if it's egpio capable in
> > case of mux function being specified as anything other than egpio.
>
> I don't understand this. If the pin is not owned by Linux, then simply
> do not list it. What is the point of listing a pin configuration which
> should be skipped?

We have instances of device trees which are maintained in Linux
being used by e.g. secure world, U-Boot...
So something else is using it perhaps?

But I don't think the device tree should decide system partitioning
like that. I think the boot loader should set gpio-reserved-ranges =3D ...
before passing the devicetree to Linux instead, then pass
other reserved ranges to other operating systems in the
same physical system etc.

Yours,
Linus Walleij
