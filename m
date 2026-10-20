Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792484446;
	b=OLY82yaiKL2ZK1LjwkkMCy8yFns0f73rYFpC/sB7lMgVP+6eGHjXgopGizgIheBCVgy2
	 d4WUd/8/oJt8BSLmYtTBLQJdhhz7vjch9Nwe4IVihxN8TJ4qEzouFBNJSxB3eACXp49MB
	 ulk89vWRXKfmKCVkL/s7YufLaVZ7Sjl2YLF3HVenIgsLlxAyVg4U1T9KBtqvxsh52gQ1l
	 BHLs6PgpHD9B2FVBQK4rB+7j9Y1oufkopCmD9LwFtIlJJraage8Tkp0/zBdZLeqJUUyHR
	 ERu4NIK6XrbTe2UkIfEFa3LSce/Rj9aqU9lKBVUjKkUWtm8NUJVzpX8GmkHR9Ot3vmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484446;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:Received:Received:From:In-Reply-To:
	 MIME-Version:References:Date:X-Gmail-Original-Message-ID:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=kKIkBo5KGbrigOoOGFBrL+Ie2szW3g61E8oJn61TwLY=;
	b=28VO1/Y3xu7sPVIG4sGEz4Eus1KtR3hkVi9gNixdCDWUghQfLflopwBZf1qI51z9mYfp
	 2pRSoLJU4+X2UJHdt82UsxCtnMASHHBS9iUn2YM9cvwu+bjHbT3NTn8C5UteBMJzwlMno
	 QSQY+Agq1iaWZmIzb62zIcH90PrPb4L8qyN0s8DOk0epMBlEnLLB7Z+uEEsCP1E7ulGKN
	 mcLuJI7GBVmH2CGCxGpOZs24LWVi2JYTLE61MeAnJCI91mJvExnQCGaxEvLJ65a1d7mHj
	 JK7sPMDQt5J0IcKvDxDNElMCkmgLuURJc7bdf/lavIDRo4FKvTtlhZJQcMhtO02v/xA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6lBqTfG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A003F606A324
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6lBqTfG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3A61F000D2
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 08:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484446;
	bh=kKIkBo5KGbrigOoOGFBrL+Ie2szW3g61E8oJn61TwLY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=c6lBqTfGQbD7J9aWnxvxHxkgCZR19XPuTqOlwDbH8HHDJf4kSl9xPUNYTR+4iJCvv
	 8bcCgI706nA8r9oK5fxcR9AuJ+cY4LU0yMxXpSGnqyQPoRGxj7s7IUbIoQhYuMEOxI
	 EPR/i0BT8ufguhN8ZeClkIxcrKYB15+10TisgEj9n/0QJsKBfbRFbSmESJTU5UdI3p
	 L/j08Ql9+HbWnGssufKXYQS00X8LrwWFxOCzcziz0WNo9pvHfEcvzoFKHVEgTZxQFE
	 T2WKZASEuL4q/H4L0gDri7fbe5CrSkBwgQ2cDA7lXANWpm9ua/IHNeDRdMe2W8R5EG
	 yrlsdZb1mjeKQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5ba357a1929so3014560e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Oct 2026 01:20:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5hmumlvV60RiCpDDYSI2F7rKee8E9qpf/XkOnOVysIEkbzricVk+/REZxIiqJdR8CEWDswaxYYaKcEVuc@vger.kernel.org
X-Gm-Message-State: AFq9FYJbPLxYpOUPY+h6oC2McKAg9Ogkaw3o/r6qaNnX9j9xIzL9wK0I
	Rwu+oyNSGKzLcJf9cM9z2/jn/gcxF114PAAINE/EIbRIaOgWKdeM6gby1j+RCEcSjD8gsA6jRU8
	bKaUBfOuKUTMHxBXsJu7zqRavb6QeW1xRAjBlFRsW+g==
X-Received: by 2002:a05:6512:31d5:b0:5be:55b6:7a92 with SMTP id
 2adb3069b0e04-5be55b67a9fmr2509119e87.30.1792484445158; Tue, 20 Oct 2026
 01:20:45 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 03:20:43 -0500
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 20 Oct 2026 03:20:43 -0500
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-qce-fixes-skcipher-v12-0-046e6be9bd83@oss.qualcomm.com>
Date: Tue, 20 Oct 2026 03:20:43 -0500
X-Gmail-Original-Message-ID: <CAMRc=Mfw+gy4wiQNH9wCY3UeyHa37ZWf2FPHi=30dccfenqY2Q@mail.gmail.com>
X-Gm-Features: AclHuK_I405DPm3BS8wwZk1JHxnrPGnEzBl9zhK4ySt7lFNe8JQMTPDxLEmJBRU
Message-ID: <CAMRc=Mfw+gy4wiQNH9wCY3UeyHa37ZWf2FPHi=30dccfenqY2Q@mail.gmail.com>
Subject: Re: [PATCH v12 0/4] crypto: qce - fix self-test issues in skcipher
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Eneas U de Queiroz <cotequeiroz@gmail.com>, Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>, 
	Eric Biggers <ebiggers@kernel.org>, Demi Marie Obenour <demiobenour@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 19 Oct 2026 16:46:04 +0200, Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> said:
> This iteration will hopefully fix the final remaining comment from
> sashiko.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Phew, no comments from sashiko finally.

Bart
