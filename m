Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795006305;
	b=3FmAjXkqG4j1U46enCyR2gsfOwxg0fMoqnzsz+QfpX4keLA2kb5mgBFeMkIlDqbw+jHH
	 /AhRQJubwLZgZnTWtKi+4OmJ49wVlDLxayVQyfKBywJOz28aFGfJ7hCwEc6yoKB+WOEOJ
	 VyvuXav1FITMzJjhd6UNu9/JQ35sjuKXtygh8H9TwJ9A5CJd7r5k5eYEH2QbT5hbbzCsW
	 xQn8ZHK2nC+aWOX25ZlQeoaNjxwqsqSjTR9E1X7dKIZ3uWj1Gbge2zQlsqG6xkruUS1av
	 nsja0irtRb0YHiAeLzaA+CyB79WxhHMLvpnUgeiJ3H3KX27psZ7YKZVxFOfehA50J5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795006305;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=1Yx3bStzxWZo1rxtm2K8qXh4OTe3FaMWmM4IKC0CO7M=;
	b=dYKokmpiGB+luMkfc3UC64EviwP6Cc94BD3g9yXzYvOS0Hw7z0YYdS0E+lldq3OeOkT1
	 BNIwmFoJio5wUU8j85VKLHBTkzR2eH5rKoffDJFSOZwuCmVEZYa35CHj6Y6dn54pWmDg7
	 nPMU6q4oePiQaysD6Hph5v2U3I5ZgaRZPTt5BjzM5QP8BWsCwUTfvsxNvab9RD5ys0yNM
	 ynVKQ0E+s5bKDfWpuGTso1ditSK4NWdTAQhkVeItIAp62P81xrhdwTiOlQndxFPEyX5SU
	 5BtT0ncNoWcRbx9kQIaVaj+0QBBvlCZymo9Rq4FIjy8X2Umn7pdHhd4/njv+4V0THMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y526emDJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id 14544606A320;
	Wed, 18 Nov 2026 12:51:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y526emDJ
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2B9D51F000C4;
	Wed, 18 Nov 2026 12:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795006304;
	bh=1Yx3bStzxWZo1rxtm2K8qXh4OTe3FaMWmM4IKC0CO7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y526emDJs4OqmzMDD9aY+7lbVaNXBU+tDsbRZw9ZnEq2dartvGH8RplMRQtU+NSgb
	 MW4XODZAQCifseGQ7E5rhhchBOhvEDg+X0HwHkM4Qd9dow/sT2ju7n0hpJjdf4YrmA
	 rbGG/NiHd1pNgVTcaHeWuY6SIOcLqjJVgSBNw3sHbaPda74ygZNe3JmDaXth+ZFfZB
	 RODlED1owxUqX8X01W6o2YFGJA4UPesMz8vowsizuF3Rfcif7ZTdpZOCxdx5Y3kSH8
	 7QIxziRlVUIQy5/sd6mjY8Z41qNrRyIG+ZY5VcC14sMlkyV2IJ1CF142HxQ3aXuttw
	 ODfZp1GXokiFQ==
Date: Wed, 18 Nov 2026 13:51:41 +0100
From: Bartosz Golaszewski <brgl@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shengchao.guo@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: enable the SerDes PHY for Qualcomm
 SA8255p
Message-ID: <zcqjdhqvdieq7kwbhfbw6s74q35xedzuzcsffsugqgz7yzfs7q@dynjfs6njtix>
References: <20261118-qcom-scmi-sgmii-phy-defconfig-v1-1-d0c7d2e881c7@oss.qualcomm.com>
 <c20a2a9f-f40d-4ef0-9aa3-f6eee24ed2b1@kernel.org>
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
In-Reply-To: <c20a2a9f-f40d-4ef0-9aa3-f6eee24ed2b1@kernel.org>

On Wed, Nov 18, 2026 at 01:42:57PM +0100, Krzysztof Kozlowski wrote:
> On 18/11/2026 11:31, Bartosz Golaszewski wrote:
> > Enable the SGMII/SerDes PHY driver for the firmware-managed variant of
> > the Lemans platform. This module is required for ethernet to work on
> 
> Which Lemans? This is a generic defconfig, not vendor specific.
> 

SA8255p as per the subject line. In order to not repeat myself, I called
it "firmware-managed variant of Lemans". I feel like this is
nit-picking. It's pretty clear on which platform requires that driver.

> > sa8255p-ride.
> > 
> 
> `git grep` gives me only piece of a compatible, not even DTS. There is
> no such board simply. We don't take changes for non-upstream boards.
>

What do you mean? The full compatible is "qcom,sa8255p-ride", I dropped
the vendor prefix as this is a commit message and I mentioned it's
Qualcomm in the previous paragraph.

The .dts is now in next as:
  arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

Bart
