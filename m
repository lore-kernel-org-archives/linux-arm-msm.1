Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795108085;
	b=4SFiCv+Gjc+6haTIUZFx5KKiCr8WKhlOvamwCx7mE3nUxquhLjSEyKXWJY5bPFOo5Fs0
	 +PfDTuHPImXjhZMOGxPpEQ5bnPN1n51ZH2kVvISU9IhYUXo2QUsGFiZRlqVGsf3/b4Qaj
	 5SIQ/6rIn70NlqMjckUPk9j8+my7yKaHW0SiHyRIwIPzltMrYSgtlAfDJJoqAcOTOvuXZ
	 Fw8cDfSWZ0GjIqbC874PxwL9Kxkx+yWgXl9ORAbn6aO5yKCRjewYttj6nNlBJ+Bv7rZfN
	 Vz/HtZujjIuu4Xw6HKz+pXhvQ5C732mbkknQNzT9KkxMddc5lQEzC7YP//FbPDbKvTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795108085;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
	b=sXXRgIvK4T4bf1sBuOnTGf/HtaSnwiquCVchmZzuwklJE/J31x4pfw8L+FQjzVjfaWZ8
	 ik9uxMQsH+2zKGGkKtug6u4H8Y6wJpwW2bq009sJTuNTd5wXrq3Hn2gEMfbw8ZwVqINO0
	 lg8CNW4iTRPnLMF1E9bsjI4cuQZ70K7NoTPwjwf1QEmF0MP8ZE02E76QBQWgmqbIXVT5l
	 ZMrzF0X4R184vekUSfg0TDHvwZX+2pGup5ZE9S+82AnzfSt+qVDxemx5GcyRpIzkPLA8p
	 hBezTheQyKl7yNFd7vW9O3x+vbDPK6I1wnWg+8vMmnSRd1SFMOxkTjvSH7KC4GovmxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--irogers.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LxGOfYTI;
	arc=none smtp.remote-ip=74.125.82.71
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42AE60A2608
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 17:08:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D42AE60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=LxGOfYTI
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so1573111c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795108084; x=1795712884; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
        b=LxGOfYTIQUdp4BvstsQzdRlDDDBEeN7//lrx+SIeNyZozXK5Z2dXYiejZYGuw1gKfE
         W94z6v2dDqiJWdyFH8Ug38FwPUmCqgWPb4FJBLNqo2yOnzGrnlwkKtk5vKsU3QhcTi5/
         fzZiQt2imtcRqKFqiwNTJ6qwYnIkdTvFp5xr0T6VvYFd8l59VmYkfBRJQw2PTLllorLR
         liJi7C42MCIzYBHbqKjVSr3iu2OZDGmumZtyatjMrIUEnYaMz42nUT7UJHrkmb8ozBYc
         wNRbc/FBGWl2fp16kuo55OCsaahfOPc4+r8BAz+qH8SiOjc8Anc/bAH07t7o1XFqQpOU
         taxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795108084; x=1795712884;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/yO05ZhWslsHUsLICn50QCqN0v7/0NGOtpyXnFxA9Yg=;
        b=NLQTvYODZXwJ14Ds8dSBGx/x3llU8RYFCQr6MQsejGdykAkdkhYN3GMeWoN2cKJfVr
         Ht0Cq80NJkft/S7ABGHNan9bUWvizBImlW6vMXM5uqRFcIg4354qI4W0hhTsaLvdCytM
         R+iCaUHM4uuTLDGT//7SjHly+fNjl6iJgAReT8UGrCJiUsCP/H+hngdahZWlFyXRLG/N
         WsgKGVslPVmEyLengSNc5+vtz4nWPx8CjIpB+JkxZSRhk8MI/xA7I7Vlz8SwV9WuvPUd
         3NqjUVJvOppDyKd4E1RSAJ22rxmvm44D5zbecDIocuB4PFbPWM/YYmZ5oYGonkM02EW7
         ew4g==
X-Forwarded-Encrypted: i=1; AL+hErHYgiGb6lqE6DYAfdf5a8M4ReM1CrJfA78ZML/+r8GweKjJ4lXYc0sdmxwk45WrQf8eg6LHpUl5nhsrYKn2@vger.kernel.org
X-Gm-Message-State: APuU4Z82WBiydNazWc2VC5ynPZ3AMiL90M8MtVhxChALkN1E78Rw+SeP
	d3oi2RwUEMf3cpt9p4vMSGQrRfKIgQ4ok48P055Ntb0DRq99ge68Fp9TyJ+UCOg1Suxlvj3CBcO
	vHu60H+F+oA==
X-Received: from dlar19-n1.prod.google.com ([2002:a05:701b:21d3:10b0:1b2:48db:23f6])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:701b:2215:b0:1b2:42db:8a54
 with SMTP id a92af1059eb24-1b5568b3154mr212363c88.23.1795108083489; Thu, 19
 Nov 2026 09:08:03 -0800 (PST)
Date: Thu, 19 Nov 2026 09:07:57 -0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
Message-ID: <cover.1795106962.git.irogers@google.com>
Subject: [PATCH 0/2] ASoC: qcom: Two fixes from Clang warning audit
From: Ian Rogers <irogers@google.com>
To: Srinivas Kandagatla <srini@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Elkin Cruz <elkin@google.com>, Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Two fixes in Qualcomm ASoC drivers found while auditing Clang
warnings (-Wconditional-uninitialized and -Wassign-enum) on an
x86_64 allyesconfig build:

1. Return early for non-HPH interpolators in rx_macro_hd2_control().
2. Return IRQ_NONE instead of -EINVAL on an invalid DAI ID in
   lpass_dma_interrupt_handler().

Build-tested with LLVM=1 W=1 (-Werror); not runtime-tested on
Qualcomm audio hardware.

Ian Rogers (2):
  ASoC: codecs: lpass-rx-macro: Return early for non-HPH interpolators
    in HD2 control
  ASoC: qcom: lpass-platform: Return IRQ_NONE on invalid DAI ID in DMA
    ISR

 sound/soc/codecs/lpass-rx-macro.c | 2 ++
 sound/soc/qcom/lpass-platform.c   | 5 +++--
 2 files changed, 5 insertions(+), 2 deletions(-)

-- 
2.56.1.708.g77570a6a1d-goog

