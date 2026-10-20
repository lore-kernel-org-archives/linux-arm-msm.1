Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792502008;
	b=yIf8Jud3mBB+nbk2y4XA7mTVh4JMrGIebmjWmcZCHkr/9jYcwwuZbaIcbGfM/cy0k6Um
	 vYPpkQ1nu3BzAF+5R0t9tWz/Pp95ZQlMY+0t6MXjHAyBc5mTaKMI97Jn01LJjt6sejPr5
	 NQvKKTFYpLkMChv77fEXJmql4zFmgL2kEa1pDncGgGhPUNwhw7txZb2auuDCrT1lsg80T
	 icc1HKg5RigsfgUWCy1XKnIfmE+W2teOaVhzTyTXv+XxUhwbrdyqmtC/IX9orfMIe3N/V
	 lR+a50GtLWgzQDxkvLL1UOoHV5XlNxUgZsrkJeoafHh/Ecy4UEZBrlcE6vD6TZj+loQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792502008;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=7Xz5yxwYccCRdcBBh2Atm6NcgygrMQamQyqFOlgMgL4=;
	b=kpt1K5ybBN0BiD8q/rxMhD6BlOtyyDHnXFlJVu0itvSh/Kg1TGI7i954pcCiyipD+iL6
	 kCRthe3ghinr5Tb5vgu8cOvU43kMOZ3WviV2ObWchtrcBwG/TfmkqBdQkTdlgPfsOaHkp
	 Lu9MzcVSY1MsylA91ncGjuDVy+rBzUi4QPcBXn0/UGiz5rc+7COryE0ZLFobi1wPtIBe9
	 uturv3WPeuyIcPqTMkSROWFdWffax6gpDRbCpp4+lDiqtF3oOkLnWizCW3IQSZcS6sqjN
	 B51wmbhZVBpWUwP1rfMm0mUGbda5/koFAC9j2IQnZ4Q+JnUAoHu/z0L39Od/i6xv60A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HS7b82uW;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9566606A327
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HS7b82uW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F95B1F000CE
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 13:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792502008;
	bh=7Xz5yxwYccCRdcBBh2Atm6NcgygrMQamQyqFOlgMgL4=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=HS7b82uWyekcgqxXwEU13FGJ+BTpnXBAZ/QOJ2802agY9d5yk3hM8WjbxDnbHXW4L
	 h1kShO5bk8jZqhi4fVARFnRxSS6ZNi0NBcRnf3oQzNmMzDBV9PG4MYXnO6IAarbJeX
	 5S9+JvRuklkCnlk4intNgTvUwd8Fu+ST+HqBlNSFXWRgZRzCWI0WMK6wBTnkbTmdiG
	 +/Fs9PTKfzHmF9r02UO5imCwIF3e+vT/ZcCm95WRww7YB1ESLy2md2A7UDt+NiBxPh
	 pyNJ29levKkXabuCMIdLPXW6SDWbwjsxGIQHBJWyXcQR5+8i8ip2wWQr5nixR5vTw/
	 VT9ashzfzJhIg==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a98f260f85so26774741fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 06:13:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxxvdKMZjM5uUfm7e8T8lJKrrOvRZtE7GVTaE2UAdae9BKXI8ZmOD5e0yLIQxPejvNwmXFU2rdInHuroK0Z@vger.kernel.org
X-Gm-Message-State: AFq9FYKChYtlY6Bxsg/nYLFfHRAtJZEgWPpdzh7qm3tLUUN28INcSzMP
	NSCdiP0pj15qusyNWQJllC2TbWN2WwDjX4RlTVBwO3dHsF+3XEa+k8DwNuXbv1OUYv+8I82luv/
	TOuJJWyVD2oXi8e3NAdNOnD9chR4MWvkPRD7fA3VnNQ==
X-Received: by 2002:a05:651c:b29:b0:3ab:1fc4:8eb6 with SMTP id
 38308e7fff4ca-3ab292aac57mr24128571fa.5.1792502005805; Tue, 20 Oct 2026
 06:13:25 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:13:23 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 09:13:23 -0400
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261014121910.1509541-1-linghui.wu@oss.qualcomm.com> <20261019093911.3199891-1-linghui.wu@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 09:13:23 -0400
X-Gmail-Original-Message-ID: <CAMRc=MfNYiKG05SH=1iu-=5=-udUZ8D119FW4NWYv6OONz0_Xg@mail.gmail.com>
X-Gm-Features: AclHuK9cEPruM3nikBKdX3c6tCX1jD7CMOwmmVs7mWGQbc7Fpw7kzXpuklCrV3Y
Message-ID: <CAMRc=MfNYiKG05SH=1iu-=5=-udUZ8D119FW4NWYv6OONz0_Xg@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] power: sequencing: qcom-wcn: support SW_CTRL wake IRQ
To: Linghui Wu <linghui.wu@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, linux-pm@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 11:39:08 +0200, Linghui Wu
<linghui.wu@oss.qualcomm.com> said:
> Some WCN3990-family devices use the SW_CTRL GPIO to indicate that
> resources need to remain available while the application processor is
> suspended.
>
> Teach the Qualcomm WCN power-sequencing driver to use the existing
> SW_CTRL GPIO as a dedicated wake IRQ when the power sequencer is marked
> as a wakeup source. The PM core keeps the IRQ disabled during normal
> operation and arms it for system suspend.
>
> The series documents wakeup-source for the WCN PMU binding and enables
> it for the Shikra CQM, CQS and IQS EVKs.
>
> The series has been runtime-tested on qcom-next and kernel 6.18.y on
> Shikra hardware.
>

Please don't send new iterations in response to previous threads. Use b4 for
patch management if that helps.

Bart
