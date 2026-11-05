Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867646;
	b=oSJZSieWyRI8dvox2Cd0S/ruvaSpBrZSYwOamt4Dv+kNmk8MkXwXOe7x2d0/u7MpuDEJ
	 WMpmi8Hr4HBqdjXpT7Yzq3FLWX8v2uAWpI0AViaVGCB2Gcu2qUJpmLEzSXnDi6cgFwHEc
	 mZrHo3UaFGGbzl6ER52gUhewCIuUuA8KrqkBaboWAxnweSU5kkAI/5StZ5Jd10JKxeK62
	 P783C16CX1Yu6oKC6kD1ytpivIpZdSm/UASpT/9CzNi/w64ppo1cjulQ0JspdKqLvHR3d
	 6rpDGZiwKfYW7qb0t3s9leLx1P79TZW7nnd9jpv10etcLCX60g2kq+Y1siX118xHe5Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867646;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WxzGpf08LrKpKuRsmQ6LKWumhJfgKnAt6y8cqHphZJc=;
	b=q7a4x3g/HYUnycYMIIA2I47SUaQ7Nq3h5kDmD60IygusJUN/pZPMBpOiWFdi+r162j23
	 uavNWsQx692cxlWSgnOpM7IE0mn0XDLXNFr9rI0MqcaF0IzjcaUzXszjPnqtcYJ4SUOjQ
	 gBgKesW3zG9JJnu56sgn7HfXKrGvjbSLhkzjDGRtM6E+eGSLpMGIfmrq82ms1U27Miq/P
	 KFOhvyl6uhOsvlBilp2GuXMW4I2noKytRDmuXHUvWVm7yk2qIXnJwFNekqPeGQmWeDMJb
	 OGvKnh5KTASh+2eNmtMrXXYXc5aws3jhAzSUpQh7XwgkXdRBfCYz1AGwPcxe9vxtV6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfdkFSMO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AD6606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NfdkFSMO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEB221F00A15
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867646;
	bh=WxzGpf08LrKpKuRsmQ6LKWumhJfgKnAt6y8cqHphZJc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=NfdkFSMOQQWLe65YCQWxRnqqqdGtVtJSIFDIdL8GU3ifFX2o+bzacWfF6GYxlSXKp
	 k6mKicu7tCbL0txb4S7yIaJbaEbXhNFiwCR4vLNWIAD4p4fudXl1GblFBBMrHK8GTZ
	 NAwN5Pal4Nu4hH1WfQ4kt+ly1ZJHd8DRTuqhcYqQfRT8LsNLBO18V1LldWCZmH2eIj
	 1h8pXk/xhGSVRmEh1axeuQ4ymE97ROq9s5/n4nrLOTEsKIOJdaJQW3tykNFq37/YHt
	 lV91nBGRED12BKsfgAXWbSRAihYrQ63Jo7LGC/COMWWrs07Dk0he3ZuF1lgEC1qdY2
	 HyWvEpnXUhs6g==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2012819e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:34:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxB6FpEaxERo8oc3DyHnHNmNd571j5AfZHdknmUFArbVXifj9zKWDaIpDn+1sUYV0kqLiHrQqISri2dzpK/@vger.kernel.org
X-Gm-Message-State: APuU4Z8bJIk0EFhQysg9CWudia/RkZK7moRc0RcAzQoqYo8BeVsseSn1
	SU4KrHHdB1Eamamzz4V4I6PGCyGFclG5lo91+Q+nrKXNlo0qrqXvTeoCvDB+66rQNVUx0SF2XDa
	lK+SAqMeVSXeuFi44sOsM3N2Tox4w6iQ=
X-Received: by 2002:a05:6512:12cf:b0:5b8:f81b:dfea with SMTP id
 2adb3069b0e04-5bfd95892f8mr5387682e87.62.1793867644786; Thu, 05 Nov 2026
 00:34:04 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261101100030.15744-1-surajsonawane0215@gmail.com>
In-Reply-To: <20261101100030.15744-1-surajsonawane0215@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:33:51 +0100
X-Gmail-Original-Message-ID: <CAD++jLkyETpvCxbvcvSSZ4_ZF6vt20VrLfkVsskibZ3QpceMuQ@mail.gmail.com>
X-Gm-Features: AclHuK9s22LU3ZgfcLC37072WMp1FnHaL0iX5l5vecmBSPJ2_rBODkzGQKAE7xo
Message-ID: <CAD++jLkyETpvCxbvcvSSZ4_ZF6vt20VrLfkVsskibZ3QpceMuQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sc7280-lpass-lpi: add ext_mclk1_c function
To: Suraj Sonawane <surajsonawane0215@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 1, 2026 at 11:04=E2=80=AFAM Suraj Sonawane
<surajsonawane0215@gmail.com> wrote:

> LPASS LPI gpio5 can mux EXT_MCLK1_C, but that function slot is left
> unnamed, so a device tree cannot select it. SC8280XP already names the
> same slot ext_mclk1_c.
>
> Name the slot on SC7280 and assign it to gpio5. The third slot stays
> empty; on SC8280XP it is qua_mi2s_data.
>
> This file also provides the SM8350 LPASS LPI driver, which uses the
> same pin table, so the function becomes available on SM8350 as well.
>
> Tested on the Vicharak Axon Mini (QCS6490): selecting this mux slot
> drives the codec master clock, and ES8388 playback and headset capture
> work. Not tested on SM8350.
>
> Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>

I'll wait for a v2 which comes with a DT binding patch.

Yours,
Linus Walleij
