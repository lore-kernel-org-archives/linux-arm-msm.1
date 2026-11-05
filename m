Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793867569;
	b=VzVNgEV0e+zRtlAqETVCAWDprLuBiUIHwi3X2+Tr1DRylGTqFzv18v5p+CP6XxzVu3c2
	 XFGH4pnf8IehtW12tUqnZz8pns6p5HHWawDZ5X9pDbLIZMoxxYvNzG6amndMr0qRwpyRb
	 Bt4LmnQjfstNaySp3EwOe/3JLyjyiEF7buvrPg/ezYCK3p6pRCJmDoBxyBU5rCt912iSY
	 ygGe9bSmuhikb59+oRBLus3oRMkBFyK3SXgVQggRNwu9nCuvgFYZ3BKzqPvjzvjhyKFXg
	 V41Jv4GpBqjOzRA49MzV+sFUqmiEZ1KDRaQbaOdlS59IbRpUvP6JJzorEy0kmgboojw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793867569;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=9G6iLyQ27qSO6+jySl/BSygI1MuIdzR4p+hafZm2OuY=;
	b=hY9ENtgvbVLqpXld/246gz5c24TGmDg5xoHYBEdeQCuziB1fcnaaAAP5gjMMoVsooQEb
	 SqGJd+KN3hE5xPFdZo5ZkahbyQA6oWjGMmDC+5u9kq0Urf/w2qvlh9Nb6do4iFFIhm7m3
	 AHMOPWkzROsUoe/Y0eq1Tbf6B/AuN4FWb79J/KpkjYOoEZoRO55Tv/wmJlsdG8F3+kf8/
	 P6RqF18yzn1PzjK2FeePL52oB4Llr22U4x2pMa/F2qbY/eXfleTB5ShHBMuOY3ypKfLpm
	 pZim/lbf81/tFh98qhh51D0/RKxJXZwhzLqOfALjGT6YcMwx9cvPinPGvjy26U7gGeQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENBMEQYw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E8606A336
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ENBMEQYw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DB1F1F00A1B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 08:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793867568;
	bh=9G6iLyQ27qSO6+jySl/BSygI1MuIdzR4p+hafZm2OuY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ENBMEQYwUKLp+rvTag3iQxGfQvFALKFvWzDGMvkQZAE0gQHDxADfPDayM81rcu60c
	 vwsfRZ3dVO+fy1syM2n71wGVrXhYzAxuicxQEpij/IC73cnLMuzZXNI9frDB1MiX//
	 lQitXaHcfWTPQlhLNYrOyEkKm+Di1SfFfnRDPY1dj3iUHzSHxgqTN6D/9WpXY8syvt
	 WZqR5Y4pFZOi9/uAksjtwUNCI0ijYVWhetoOpa6lOsUIsXH0A1VCAmBev4GtCFx6du
	 DyDW5cC/b8nevAKCMxOpykFfTl3rUjv6zCetE9e36B+/mGwyZ09h3cOejbKuGoYDFM
	 DM3nzV+xe8DxQ==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1695094e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 00:32:48 -0800 (PST)
X-Gm-Message-State: APuU4Z8Lynh/xFg7OB0y+DzqFxbC+ab4Zxj485OKSje86/HoZVTTH4Ui
	No/hmELiWTXxI0ZlNCxaiuduvu4Or0OBvwZrt6Te4hGu0cmVXtkA4HfYRY42elpoAz+E6mi/m5g
	3w5VTmonHTUKk48Aeis/9gd2ecOXacMw=
X-Received: by 2002:a05:6512:124a:b0:5bf:d60c:9f98 with SMTP id
 2adb3069b0e04-5bfd9583912mr7021382e87.59.1793867567355; Thu, 05 Nov 2026
 00:32:47 -0800 (PST)
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>
In-Reply-To: <20261016085202.40187-1-bartosz.golaszewski@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 5 Nov 2026 09:32:35 +0100
X-Gmail-Original-Message-ID: <CAD++jLkD+j5HNA48vzuyVDxSJ+J2mYpTD_kaDAtDBYvWLV5y7g@mail.gmail.com>
X-Gm-Features: AclHuK-_e7x6gp0MSxZ4qc8ym5mKcmCBlv1VkGDlRNSYFA2jkqkO8_sgAxCWvSM
Message-ID: <CAD++jLkD+j5HNA48vzuyVDxSJ+J2mYpTD_kaDAtDBYvWLV5y7g@mail.gmail.com>
Subject: Re: [GIT PULL] Qualcomm pin control fixes for v7.3
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, brgl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 16, 2026 at 10:52=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Please pull one final fix for Qualcomm pinctrl drivers for this cycle.

Sadly missed the v7.3 window because too late.

Pulled in for v7.4-rcN

Yours,
Linus Walleij
