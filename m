Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E5F339365
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 15:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788966923; cv=none; b=ZebVQtwrLuXpXKO40j0QN/nsZRKrRGti23qTg7uLYCbI1bYoAO8svQNBShIXjpyQtttvj/x7+hSW9Pn0L2a4Vs7mOsKMyLjNswHxavR/QkvgguxQmRxGbFxes3lA/vRD3t7VGy6BSwRKf6g+orXuNbHYEPjU3nLU7L9equ3NF7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788966923; c=relaxed/simple;
	bh=ZnIpv8WZvdJ5YJePEA4oRdI/IfL6BywHnZH/XanqGWM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jj1rb7inzuDI1H++eSBtbJ5tjYxIoBQjNd1vpumJiRp7mXHpzxiM48wIlUs5AY2VVgxnYPNhztgC/7D2cFID7j9/OjSyEr/ijisl7ZRBPZZjudUHiPJA+ekMKICgUeVAKF/Ua6yvE+JHPnm3ajVdnDONSvXizHKEg0Jj73VTOw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFiXfI50; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFiXfI50"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-485850cf499so4184427f8f.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 08:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788966920; x=1789571720; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q7rwmF0hySld2HyOILzYsqpEuhwCI2TFr3jDyI8CRI4=;
        b=LFiXfI50K3RW7L1N0T1iLQADo8TvXmTg1YkOUm3S8XZnqo3XG6nNzKgqYWhTZ8mmSB
         JQNbnYMVUHb8gFjvCknxhlp4rET+qtuwiv3d+FxAjnqbjimnOWzNz04leoU/CRTvesQa
         cYf1OXQ80ofAX1XupIP8iAqpuxCJc7JucTTRjHeVSyRd+Meh4ddbXXGtRenTuTT7tfCi
         tQJCS4WclobUDkgQhkFrULzOOnCBHM0nI0+C3sKfpr05Mg45SpucX1O4h71bFEPkawpM
         YNd6IiyP67yf4k+7IjWiIwofJtir2WrB7GfXdnxDBNzd5kbs79XjmT8m2IRqF6e9wBxz
         PydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788966920; x=1789571720;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q7rwmF0hySld2HyOILzYsqpEuhwCI2TFr3jDyI8CRI4=;
        b=c8bd7c3DJzXv83moy6Xy5tJyYYEBa+77hKCsA/pm09EEgcRZ9nknOsKbraBpuEkRo8
         1k8nfweDqdv2+U6kh56hBBoHMd0/SO4J+tlaEKe6oxZ0E7MOsBGZGLfOiz5sNR6AfbzS
         El5Y3VKyiGul63DRA1otwX7i27EMBK3PIkb2HUgs0O/H0SXHvPPj0DQZlxwCyE6nmQLK
         NuwjBykUjn56Syv5fmz4D8Kr4mkuLZPtFfrOZmOPIpOB03EHWc4YbvPp0wF9g0WEZ9lE
         +0KeRUOEFb/UoJVWOvDDKw/XaK/gVbQaEnLdLOaRMwxt0uIVD+EzK22oSq4dN0mTei0C
         bJ2g==
X-Forwarded-Encrypted: i=1; AKwUvBzv8KzghdaZyvQ3hCXvpwsjtTtI8NQzhGDsMZIhosbMYovW+CXJyKSEB1ZkCBonWRBZqeOgRDPl4Ge8rlWI@vger.kernel.org
X-Gm-Message-State: AFuF++lh2g8PYFD9oSZ/YuxalmnQbKpFc37T4NniMZziY8VzG3YLSlKO
	FcpT4zUTO8VdmE+eLXjW/KzhDQyG+tJxnpr2Q1EO/9PeB4ZOqlTl+Akt
X-Gm-Gg: AYBFou0lnVhA0HeZ3EngKZxRrmOt+5fnhncBsoHDNEv68NlYLxf7XK6yQnmkhEqyJHy
	C5TW6NieAzKM6o/IirVIjPoEb+jLr827lIAlbwlw5NPy8k+MQFbjSZctxLffaIUSqK97jUDF3S0
	kE7UgGZETH7GnI2jHEx8rOwCMWkfbTY0r05u4/+Kt0N3m9AICLLApzcU66KtGz8gEqsND1yRwjZ
	g6olqxNI1UHQHG/kYOpfTmTkwWDlsTTl6gGTKgGzMNtD6zFi76cb6pzt+B0VpJk3BcRuw6bbNwo
	xNmlCvjc/g3h7vBAfHQyAEOfBr43P/RLJfJ+JMO4+mrQTY0e6E2e1CWoOM7WgbGx/hRyXaoxUQz
	ENmJgknBvE+PmdEG6fGYdVLezeWz30Ov3blAuNRJfu4Wag+K+ufltYg8lTHdm5kDIPMOEDobcOi
	nGNYnYVX9X7Ro23mZW0TrrwbCDUDTL88nRN/QSk0LRhBSDPiUTLB9cSllcUWfS+Z2Lq46/IOMRQ
	aWVHWZZMDqzzmCTBrE3s2fxW2IEEf4+A2fU6dUBcvJW
X-Received: by 2002:a05:6000:2584:b0:482:b813:8315 with SMTP id ffacd0b85a97d-485872ac3b1mr40255536f8f.21.1788966920068;
        Wed, 09 Sep 2026 08:15:20 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48594172546sm36325061f8f.15.2026.09.09.08.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 08:15:19 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Johan Hovold <johan+linaro@kernel.org>,
	Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: linux-phy@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Michael Scott <mike.scott@oss.qualcomm.com>
Subject: Re: [PATCH] phy: qcom: qmp-combo: hold a runtime PM reference in the typec callbacks
Date: Wed,  9 Sep 2026 17:15:08 +0200
Message-ID: <178896690892.10327.10619929289869883612@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909141841.532191F00A3F@smtp.kernel.org>
References: <20260909141841.532191F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Both findings are real, and I have posted a follow-up series for them:

  [PATCH 0/2] phy: qcom: qmp-combo: fix forced com_init() error handling

To answer the two questions directly.

Yes, the error path has to skip the decrement when force is set.  The
reference is only taken in

	if (!force && qmp->init_count++)
		return 0;

and && short-circuits on !force, so with force set init_count++ is never
evaluated, while err_decrement_count decrements unconditionally.  A forced
init that fails therefore drops a reference it never took.  init_count is a
plain int, so it goes negative rather than wrapping, and the damage lasts
for the rest of the boot: qmp_combo_com_exit() sees a non-zero value in

	if (!force && --qmp->init_count)
		return 0;

and returns early every time, so the clocks, resets and regulators are
never released, while the runtime PM callbacks only bail on exactly zero
and keep touching hardware that may already be off.

And yes, on arm64 a read or write to a peripheral whose clock is gated is
not a benign no-op - it typically raises an imprecise external abort, which
arrives as an SError.  Whether that reaches the kernel or is taken by
firmware is platform dependent; either way it is not something to walk into
after an init failure has already unwound the clocks.

Both are pre-existing, as you say, and neither depends on the patch you are
reviewing - that one only stops the teardown re-entering the driver's own
runtime suspend callback.  The three are independent and can be applied in
any order.

For the record, the two problems are reached only when
qmp_combo_com_init() itself fails, so I have not been able to trigger them
deliberately; they are found by inspection.
