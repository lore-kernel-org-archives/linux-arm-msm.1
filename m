Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792655915;
	b=f0qf/Cyjj3ICrlALVKj6I1+ffHwAdaRtzdmPis7DWPSU9Q57EedILl2sQn01RCcyOPIi
	 5rPgHyrKE0Bf6Yq+iJpljWNLATxOARrQIehTjB/wAjrWOn55xfr77xqSZ0xxMKqgfoVKZ
	 QuZJbh1EFANutiwJfMKdBsW9i121j82c3QIbsRdnSqhO3ftejaaYAZHlnn805NOUXbgWr
	 dd/9S1TCKWY4vqE6uaeQg9/pdsL3UvzqLJ+twIV8mrLQ2RezN0lkdN+Fo2S0mTO5S065+
	 YogAqfApSqB/3V6AxnoRhM+6Kkx79eMA1KuCvh9hwAyo1WEQodFLVqvunPSDqEzn63w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792655915;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=DOGsbHPV9Q6LEJI4bp7YU9lC5DA9e4STqXoDKb5ejb0=;
	b=m249T/m7g5uLJ2CrKaGbqjHiILX9aiQ7I2ptFAkJtrX5Fy+L5kqB9aC1UPE6vZ6ar4cy
	 VWCMPcYI4G8vofyiG+CZyr/5041u73hsUesG7Uoo0Bmf9H9Jg9FPjUWjTcSMWyRUYHFNN
	 869QqFPM3fta4eB5NmtrscQXKekXLoseJqNmgQcV7buTDpCv8z1yhdX9sKBbDqigo0ySV
	 5yT2MzrKQa8dm1TqVB9Afx+Dio0D0GnFyfaGFVMig7GhM0hJOhiihycB5qIoi16n868mb
	 rbH44QgcTRxnzduU3I3sLN6B8uzyaGtluuTJyw15wcyUU2y+YoomzUW8VWhCMYGgtqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M76WzVlP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D279606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M76WzVlP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B5051F000CB
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792655910;
	bh=DOGsbHPV9Q6LEJI4bp7YU9lC5DA9e4STqXoDKb5ejb0=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=M76WzVlPBD5y4IqVS2atl7PqIsbChiueyPRFZxYypwtus+8TtzwLM94gtwqzkzIi7
	 Uynjkei/JU0SDmBsWe1Nk8I3NJSux6STZOQjVQ1eQfOQZz6HffJeHfd/TzpY15o8kc
	 8WhqCoOFQ0jxu+kkVBQNE/Yx7na5wbewb9gOJL1F8njrh6otFV4Qkg5psTGcxAq8/C
	 +zth5lBobhZL4ML2CkEKJIHNRBU6e0m6mO5QdVaQxiZpgQzE1zsViAQ+u4M5ONY3Mo
	 Uzi2d8bmao4mA3WvpxO2Ei34QzcdEAV4CGMARW/VfVP8A622QmeMYJgRcAo4DAgXmF
	 o7l9TiqPsA39A==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3a9e87ba7f2so13118811fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 00:58:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByE332Pj67jxESbTtshDESNOyj8bMZHG9mdfGbs7uTU8YSzTjS1QmRiaEKwDrAMQ2UhjGNMCXbKIaFJJIlA@vger.kernel.org
X-Gm-Message-State: AFq9FYLSP2jDhrnZfvBsXyqL57fOUsTIO1l1ySgoaGkHtoBNVY8nMnGM
	F/JzoC3Th5Ky6hJLRriCmE4Jy+teBtj8rYpnuhGp3GSsDCcb+LBfE0a5A6yNGSdbM1ha6JL3AR0
	UHazd/W+XsWjk+Jo6AhjORIBKeIg7NkagEysoURRpiQ==
X-Received: by 2002:a2e:a9a5:0:b0:3ab:48e6:6789 with SMTP id
 38308e7fff4ca-3ac4414620dmr13295841fa.8.1792655908769; Thu, 22 Oct 2026
 00:58:28 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:58:26 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Oct 2026 00:58:26 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <179261435862.92690.4559755086697722828@pm.me>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
 <20261013-qce-fix-self-tests-v10-10-57162a38a554@oss.qualcomm.com> <179261435862.92690.4559755086697722828@pm.me>
Date: Thu, 22 Oct 2026 00:58:26 -0700
X-Gmail-Original-Message-ID: <CAMRc=Mc1O-xSOt9RNTTF-ue_3skkNoQ4a0h7RovbCbQtexKkdA@mail.gmail.com>
X-Gm-Features: AclHuK-ddH3eyHdZmxCdnhGchR5nIcmlb3fM-yPWg22T-Acg-ykEAHgaJMn9PAk
Message-ID: <CAMRc=Mc1O-xSOt9RNTTF-ue_3skkNoQ4a0h7RovbCbQtexKkdA@mail.gmail.com>
Subject: Re: [PATCH v10 10/14] Revert "crypto: qce - Mark QCE as BROKEN"
To: Birk Skyum <birk.skyum@pm.me>
Cc: Thara Gopinath <thara.gopinath@gmail.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	"David S. Miller" <davem@davemloft.net>, Stanimir Varbanov <svarbanov@mm-sol.com>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>, 
	linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 22:26:23 +0200, Birk Skyum <birk.skyum@pm.me> said:
> On Tue, 13 Oct 2026 11:57:39 +0200, Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com> wrote:
>> The self-tests for this driver have been fixed. The crypto algorithms
>> are only registered if the user explicitly requests it with the provided
>> module parameter defaulting to false. There's no reason to further keep
>> it unbuildable with the BROKEN label.
>
> On X1E80100 the BROKEN label also costs deep sleep in suspend. With
> nothing bound to the crypto node, aggre2_noc and mc_virt never reach
> sync_state() ("sync_state() pending due to 1dfa000.crypto"), and on a
> Lenovo Yoga Slim 7x a deep suspend on 7.3 never counts aosd, cxsd or
> ddr in qcom_stats.
>
> I built qcrypto out of tree from 7.3 with 09 applied, which is what
> this patch makes possible in tree, and loaded it on 7.3 (with distro
> patches, none in QCE, the interconnect drivers or the driver core) and
> the crypto node as in mainline, with ALWAYS tags on its paths. It bound
> without registering any algorithms, went to runtime suspend with both
> crypto paths at 0, and both providers synced. The next deep suspend
> counted aosd, cxsd and ddr, with about 13.7 s in them during an 18 s
> suspend.
>

Thanks for testing!

> Herbert asked for the series to be split, and the resends since then
> don't carry 09 and this one. Both should come back as fixes, for 7.3.y
> as well.
>

Yes, I'm waiting for the fixes to be picked up before re-sending the remaining
two patches that depend on them.

Bart
