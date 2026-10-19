Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792426668;
	b=pHfFFYCUNK2l+58E+kNpZZy9NsNGYRLgMpZ1YYmMFiR7oh1s7yexKtQP2lE320IvxEyu
	 jxJOAiu6hrLk9mHgzzaWcz+wfHPCmtXHAZT3B7+mD0TTj8yxImYya8j0WEqty20lWavPf
	 kNv3DWhXQk9uPl1LOCFxFJeVLneDYVpsw+zIdhgPrXVWZ2ov41rKgMFtzxtz9s9UXDAXJ
	 E91eycwPT4tfHjdIpAUCQG7jax8pkDgADOnbtyx72HOUfFtOCRIKd2OasIxcv801E5A9X
	 gmgKuPch25eAZ4QcRb55ix8pXv4DanL9eUnCMiUHwXzpZMqt+e+xYhx5uonJQSkQXuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792426668;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=pPq1j1hzuHov4jzp9iCFcS5dfiTFka8+sOkQmid/D4s=;
	b=FP0apubAQfeoGuX4uxS+OYn5yFD2S7R2MbHJEo52n26b0kDEUZbNrMfR9UmBaDbCTWen
	 FiHJfr+9nJwOCNUX6TQ2IXNbsHoamqXJhuU1wGvRgZpwe8BWSwPguLXGfcR8VOeM8w+D/
	 98xAQWilJoGKjuSC1Ic/ll8DJawpAr0Yp7A/mYO7WgSJR+WqfqVXkxT8Ta2kDAhpWh5OP
	 i4jtmEbgzJEVT+ouM4V8/iMz3f8gTTRZYxAaCTDvl9navYzm4ry64I8x4prnCT9/L2fuv
	 vGliyQWJRsIYZWR/NBE2NgkyKPp1I3KmrFOk8NVfxGpz6bKJw0LcgAkpcE0w8MmCBtQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K7VaRv01;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A76C606A31B
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 16:17:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A76C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=K7VaRv01
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-3282db206d3so3751183eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 09:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792426667; x=1793031467; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPq1j1hzuHov4jzp9iCFcS5dfiTFka8+sOkQmid/D4s=;
        b=K7VaRv01AhlvkuBbDOCGUqbBkt/N3HMy4qyjvMzbld+rjLvgJIUdgHygzIULhKMqjK
         BkfpKhx7wE5iahfhA45h0klxGuhGmXiN71rjRGuH/ynWvzWQE4vUgucdbtjz14JXPnR/
         vC42iWhgpsIyfYjanqmqNmSsrrclT58wpIbuGikOQUGz48A59cqVCn5J5aO/EydepZ3S
         YOcYUrXfp6Na6c1yhj6vzeQu2BlCJBmATxwUWGFaNFroW61Jx808XkArogBDutixHacw
         8EtK23UKT+QpsNgb58gFh+pKRq7CehUHT11OlOOFhHTPW3vSIB+FNSh5uYlhn7LUzREV
         qkoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792426667; x=1793031467;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPq1j1hzuHov4jzp9iCFcS5dfiTFka8+sOkQmid/D4s=;
        b=a6pqv5u5Vc0j18/uVXTw5ojX0+PKSrseoiXZXzOf/njbohWN8tE0dWRLAGSrc27RHO
         oENSJxB4dfmBdnnZ63mBdjY9MABTBIpuXJtBjBTEAHq3AQaHhk+QNiw4MYsi5r8nQJeU
         IEiMy1RpSUBKR+pI0WQ/4flCH0LAI4Ys6WxsVFHfkUF6Q+LNkykv1p3o5fRDB2cr1Ywk
         WugJhN1M2WOb3h1Da8/rGoM4H0tBMqLy47lqjQexaMWN6NzyQGnY2tyD3/Gd4tdl490n
         w9oxhdo/UUukJIKHEMCsp00NfrVI2IKE+02cRRt0XKphM7Hw+4D6LKEzNUJdZF0okF1W
         iJAw==
X-Gm-Message-State: AFq9FYL3+gdCVxuNXh3oKuaq+iJGugCDMfMsW0Dn8rYJ3LdqfdDjmE1c
	E439t0uNIEVILIOy8suEDRizrCeNKsHgdmiwkvO4l3rairn8U7vBN/tl
X-Gm-Gg: AYBFou2WPv/aiDx8NB6VCurSHWN5YYSqTOPBVOwlbOqgwxjMKEItRPueozlUbVSiAA2
	6jyKlGf1KL8CX7Ly3CoGNZ/PIJpEGf18eI5HBRFig9FrlhuxO1D/UVxRsRiUKF3DMKnt8T6Uxn7
	hyfUmi93YfnptGDxQ5LZ/Etsak6+InwjO4Idqr01xaPsXDrvx62zC1Im166hrvbHKIwJ7gV+Vnx
	owA+o6PBuT/7EuYcNns2iG92A4wTSAn+CAR+cs1vBxuCSN/2f0Dsp2ZZ7UT/o1Hn1VFZFO41X6T
	IDCGDPriMesJ64a80qjr8FCgwn9tS5F3TY4U3l+d6mMrsb0RW3jRcGShxDEUgGcD2gPcjOBu1Zj
	FtUr0FTmzA1xZLVJDtH2DEDQ6/6vbM5tplx06+zInH6LN5th5yAx4mJZ9HccZdnFT3wHxhrn6jw
	9L2O8AV7WZDQAG1GOCuW20DTOVm9Ekr+gMGREUfzCUxcQ0b/XatlM7w+Ew+mq96GGJtmDIiXsT5
	N6BDUCCtuG0U1gXGBW7Hw==
X-Received: by 2002:a05:693c:8955:20b0:35c:707b:acba with SMTP id 5a478bee46e88-3619f1fd96dmr12005989eec.3.1792426666488;
        Mon, 19 Oct 2026 09:17:46 -0700 (PDT)
Received: from redducc.localdomain ([183.83.156.125])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360819be413sm33410985eec.13.2026.10.19.09.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:17:45 -0700 (PDT)
From: redducc <sushmit718@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] clk: qcom: sm8450: Fix eUSB3 clkref rate and camera power collapse
Date: Mon, 19 Oct 2026 16:17:37 +0000
Message-ID: <20261019161740.2384-1-sushmit718@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three fixes for the SM8450 clock controllers, found while bringing up
the Nothing Phone (2), which uses the SM8450 derivative SM8475.

Patch 1 parents gcc_eusb3_0_clkref_en to bi_tcxo. Without a parent its
rate reads as 0, and the SNPS eUSB2 PHY rejects it as its reference
clock, so USB doesn't come up on SM8475.

Patches 2 and 3 fix camera power collapse in camcc-sm8450, matching
what camcc-sm8550 already does:
 - set RETAIN_FF_ENABLE and the GDSC wait values, so the IFE GDSC
   doesn't get stuck off when powered up for the next session
 - park the camera RCGs on XO while disabled (clk_rcg2_shared_ops), so
   the Titan top GDSC doesn't hang the SoC when it collapses after a
   camera session

Tested on the Nothing Phone (2) (SM8475). The patches apply to
next-20261016 and build without warnings at W=1.

redducc (3):
  clk: qcom: gcc-sm8450: Parent the eUSB3 clkref to bi_tcxo
  clk: qcom: camcc-sm8450: Retain flops across camera GDSC collapse
  clk: qcom: camcc-sm8450: Park the camera RCGs when they are disabled

 drivers/clk/qcom/camcc-sm8450.c | 113 ++++++++++++++++++++------------
 drivers/clk/qcom/gcc-sm8450.c   |   4 ++
 2 files changed, 74 insertions(+), 43 deletions(-)


base-commit: 6a56f4f29711dd2da49f03a5b99ce53779e638d7
prerequisite-patch-id: 154550924ab1d2c1bc95517c058aaee0bb242f92
-- 
2.43.0

