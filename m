Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF6240DFDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411489; cv=none; b=jJzMSuOHBNotr/dIQtPAj1kfgkcDhvq59kKA/40ntxs6M/v9a9UXdrx2b8+RDDFxWwWYcbdkhafHz2WMr+H9DyD3XcHQfICSC/TKzFeLPZHxcmGAEWrNoU0Did4cKi/lXmBifnuq2nq6y0EQKWygeSszAvKJ0yIOJ/Wxn27nA6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411489; c=relaxed/simple;
	bh=V7OWRjin0cgiOYtCoB6GXiQjClXbT2S/XjK0Vy8bIHA=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jPnLOfui6LmVmPTQomKHzPOOHwvkBNFVpTN3bEp5/j12BOwgrTzXZH2w8KhJTYYAGpLDX2mA5c6UOPmbe0StGmH4Q1B7xZtGamMWySExj6SFW/Do00oEtxL8RZ4amvVl2hU3YxisGVa05KLdLTUeic+WZDd7dYb1J1IE0G2um5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kl6Wu9rg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kl6Wu9rg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 347C31F01558
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 11:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785411486;
	bh=pQ8afElaPZYIadu7W056AAzxSCoB/beP+M9RAOwsZi0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=Kl6Wu9rgUBAxBWaM96E3JtmKCI04Gb4dAUeG3mZc6e9TaMTg8A1l8eGfNBbHpAcHn
	 U76wJnBBxeugP4PMILlsr4hos7t4c/xjruUw53I9Wi3jTZ9TQZzt+7Ds1KO40gV199
	 0EIB96Y8AR73Q0GCq3SZeMy6WdTsfEr1Xya6Lh0p877SM2kmMqwYdbZl9zMkHBEgtj
	 YaLtNGUdgQn3z4N7pqT0JruU3eSuyrqEcTZo399NjEn/f5qfOM9qy/PPeaVdeuRGTL
	 dFd1knW0A1GBfnf/NvcoQ0MDB3DsuJLUowkJBM7I0vBTIZPQSgdfPva+HBWL7RWqAG
	 YAxaLNnBWp57g==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5b29599b81cso2481736e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:38:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp7WIhsGun3BHNlTOrH/1oEFmilw5tN9ryiGEM4AyR9TRrlmIlj9CTcgkn5iOuEOnWutYw8q7XTxHba1sjT@vger.kernel.org
X-Gm-Message-State: AOJu0YxZt7k8n+XcKnP27W4cYksCoi6wLgdWf6I8659sGdBBi3ZplP54
	ZQJ1rwH3zuyjshY+MDc58Ojcd3RRbnoc5K4aDoFOJBJX0lwbZ7zsAXBNamHN23r4B88m8uwYcHC
	KYS/uaGCqccVXceGJCJp+sa11ENh/+MYH2H46dWt64Q==
X-Received: by 2002:a05:6512:6894:20b0:5b0:ceb2:194b with SMTP id
 2adb3069b0e04-5b2db36f116mr269174e87.36.1785411484885; Thu, 30 Jul 2026
 04:38:04 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 04:38:03 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 30 Jul 2026 04:38:03 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <bb6a9164-6dd2-4d11-a9cd-a2ae7ab43949@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260724141708.2212057-1-prasad.kumpatla@oss.qualcomm.com>
 <CAMRc=MfU=u7tH2r19H9Ex9uEDAb1V3Fanzi2EuqzB+iohPQkog@mail.gmail.com> <bb6a9164-6dd2-4d11-a9cd-a2ae7ab43949@sirena.org.uk>
Date: Thu, 30 Jul 2026 04:38:03 -0700
X-Gmail-Original-Message-ID: <CAMRc=MeQRn6dSZ8KM1VGg_7sqqS7p3XjNXm-ohhU6Jm4hVJvVg@mail.gmail.com>
X-Gm-Features: AUfX_mw7XKDuIJBUfTFbP1hi1hz1AjkBP2S645XyXXNZE8slKUswvBnRqke5P2w
Message-ID: <CAMRc=MeQRn6dSZ8KM1VGg_7sqqS7p3XjNXm-ohhU6Jm4hVJvVg@mail.gmail.com>
Subject: Re: [PATCH v6 0/5] Subject: [PATCH v6 0/7] ASoC: qcom and pinctrl:
 add LPASS LPR voting and Hawi LPASS LPI support
To: Mark Brown <broonie@kernel.org>
Cc: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Srinivas Kandagatla <srini@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
	Takashi Iwai <tiwai@suse.com>, Bartosz Golaszewski <brgl@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Jul 2026 02:22:08 +0200, Mark Brown <broonie@kernel.org> said:
> On Fri, Jul 24, 2026 at 07:32:55AM -0700, Bartosz Golaszewski wrote:
>> On Fri, 24 Jul 2026 16:17:03 +0200, Prasad Kumpatla
>
>> > The intended merge strategy is:
>
>> >   1. Merge the dt-bindings patch adding LPASS_HW_LPR_VOTE to
>> >      qcom,q6dsp-lpass-ports.h.
>
>> >   2. After the header update is merged, the remaining ASoC and
>> >      pinctrl patches may be merged through their respective
>> >      subsystem trees.
>
>> Do you really want to wait an entire additional cycle for a one-liner to first
>> get upstream? I mean: I don't mind it but it's a weird strategy.
>
> I presume the thought is to put it on a shared branch, but that gets
> problematic if I create that branch because the ASoC driver has
> dependencies on whatever is in the huge pile of stuff that's already
> going through ASoC so it'd pull in my entire history.  I suppose I could
> do the tag, merge it into my branch then apply the ASoC driver?
>

Sure.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Bartosz
