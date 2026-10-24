Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809655;
	b=htA4Ffi0u0TW8ZhrBsFfs4zMBx6YrnXJQbB1JVqeVnHrGhe7rhtFHLphs7D7Bidr/ThP
	 PHT6EWJHMoXjVXFX4CXJagFCaQRY0Gpcin8MctF4amGG/VIP+uv+BjRX8jvOPoPBNeYts
	 ivP24kxwY4B7dQ3ZnYAea2Itw5SAndicmr30zGlB7/ess0q3xssyBeOA+zkia7zgLI1/P
	 c+HIhmhtQDFpDPQlFbuJk1l1Yvb4BmDzJRqXcD4wMk3ggl/gDyDIxXna7nPmm7R53xcet
	 rGFxp5OHnlducGNfxGZiz1RI8tpTlqKehzJuMOtoLZWFPP335DjVzFhhMEmQwfFMrQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809655;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CZm8Y69A5prDDQwZ1SdEfnAEhHWyrujiSq8M4aAwjB0=;
	b=o5zfBXpr2F/6HkBr6rnZp33lRpkUSd6UddLAhQWJApgihF1RC/Cu/NzLg9QXUvEWcUiP
	 bfoaPQyP19vHF8aWeBEjokJLkqA+Mf/Yc+VMhVMsG2QnqaIHb/zO/dE+k4zOYEBIZd+p5
	 V2AELCp1fw5Fd7pa9zbZMf8WL55fJceqi/MAzyn0E6Vn/QtDiXx2+CXn+LQL6D2s9x9D7
	 JHrfTAYF9JF+2CtLJMQttB+T4n4YbRGnqdW6CK5u+QJ7ZkENzUEARXGMSanpDJ74xw2br
	 IfCM2I00b3Q5q+CsprWDBniYF0y3nhuD7aEag2YrE7glN9XjSWAPIgKIq4TGNTJ14zQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AcohlYTS;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6B8606A31F
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 02:40:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B6B8606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AcohlYTS
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91b834592afso16196446d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 19:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792809654; x=1793414454; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CZm8Y69A5prDDQwZ1SdEfnAEhHWyrujiSq8M4aAwjB0=;
        b=AcohlYTSJMZq+GAAY76u6+mVcRlzqGY9BQkfT6KfgzGu9tLA2/wuHyDW6/dh9oFneb
         34MnawYX5F2Zdv/9zHmkLmUsvPJ4084FqYqxNr/oHLc92Q/udQxfdoQpaBJt8RIW6LWv
         u0Jfd16viYrEUpw3wEfpqbndY7fl5/z6UZURZVtB3d28h7PwXAe84DKLIFgNZQZhkUaf
         Dq4LkyvcYNRaV11ykFfCHHBinmWZXGEKK4F9JlJjewB1YfckPufGRWkQN0Lgt+cQMUpv
         V0F/YouaEMOtu0ZJiMtP0Nty1XFdxctkGQSDNz8JhPj8SzvwX36x6LSdF0+dql7dBdir
         +cCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792809654; x=1793414454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CZm8Y69A5prDDQwZ1SdEfnAEhHWyrujiSq8M4aAwjB0=;
        b=g3u4ZiPk0IEzBQcIoTmc2s6UKc73Fc3OZMUtfpV93QD8jU8Q5v7shmo1ru1wQnqE6/
         4Ev15orxNHjC1f0knhpNRDOVehJzpxvmmDVSK3ncEoUb+S5I+cHK4KtBrXA2MIK8ouKN
         5fosIsfmpxtbZTn7J31cdD+us0lwvQJGcfcX0mOupwff61RsQUo6sFzncFIz0PAk8sW1
         k+BCUXCuODMGMOvDAQpWpfvWSN8+4M6WPt/bv4rIBfmyUe/+Eh9YZ2JXZ56iyoheYGM6
         ln8yW3ecqnduUi8A6nAkM3JSrUXgIRctZwacC5zLbsizc90fjd6o5nmChlFCEvsrCYim
         4aaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSnK2lwVQqwkQPHY1+ErmodMu6wSfP+WzVGZAqHVV7iAXWQVB2YCWipFcFXrZAvtrvrve4C9j6Xq/Y7B+2@vger.kernel.org
X-Gm-Message-State: AFq9FYK0dn9nivsIEOW/bIDqBK8rpsg/K5GiPJ7gyBeRYUPhe6cObbUV
	LKSzwFFvy5/88VZHd+b5JAGpv+kBRj7Zsa8IRP1AanbOG3eDJPbstI0=
X-Gm-Gg: AYBFou20+CsDZMwOa8zztEZuCN0OnqvHHcJhuoRLVomo4thfyxflfn6Az/YLXkzEVQ4
	EsRJ+8HCyBQ1x+PNvL/YxAwpI8t/TEZF0Xkcv5NxKZxm7+cCe5GbhO7UTa+Q5hgCZ+uLBskF33W
	sKIWMt9OFKgULK04TKB6yRoDmLvQ0AJe1SYf+1WLsiTnXEVyFrGmrA3PSBVxMtS5ft3Sc1e/5DW
	OqskmSi6mq8zpD3cbQMxD9v8WCmeSVe5kFpD8YHn4ho3Jsag3zGFYRJzAowv9T2MZnL0+z7dKHQ
	FYywFZoAMFb2uQMfV/FMkZCiErCyvnU+wMbr8ldhbV8e54MrFdqGRqpEmPRPbdykfsQWBSJ+iEZ
	u0sCedwNc46leB6uv/se08fCJ/1MhzWwxb8qfufZwVV9cvYIVJoL+G7JgSHcgk56iQL5zrF9Ks1
	r2jjT+WFITxiQncYMOV3y38bi4gShafSYvkBvOvY/I1+cIvqXpF87dCk8I80uoAagcXS9tqHQKL
	WgUGmD7NQKBl7QzlmLAvpV1X7LqGbQZ/L+ATFrFhC83dSIoJfveM/WXxc9Qo5HiiPNPIVOyX+Of
	RN63qSDW3hOJ4DLIJnT66HEe3lTj/TkZ6TbyLtQ/XJSJnRHWy2a3RsV+2VDtuk5Uce6mgkXUw4Y
	ZAwOYQno8QQ==
X-Received: by 2002:a05:6214:5001:b0:91b:b0ca:9f8 with SMTP id 6a1803df08f44-91c48e57971mr14566376d6.26.1792809654071;
        Fri, 23 Oct 2026 19:40:54 -0700 (PDT)
Received: from i4-gl-tmk5904-1.ad.psu.edu ([130.203.156.90])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c48feca9bsm7203526d6.39.2026.10.23.19.40.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 19:40:53 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH v5 0/2] media: venus: fix HFI teardown races
Date: Fri, 23 Oct 2026 22:40:49 -0400
Message-ID: <20261023223635.3c895c4752c4-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.53.0
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

This issue was identified as part of our ongoing research while
reviewing kernel code.

Synchronize IRQ handlers before freeing HFI state, and disable recovery
work at the start of remove to prevent it from racing with teardown.

Changes in v5:
- Patch 1: no code changes; carry Bryan's Reviewed-by.
- Patch 2: drop the duplicate work disable from venus_hfi_destroy(),
  keeping it only in venus_remove(), as requested by Bryan.
- Rebase onto media-committers.git next.

Compilation test completed.

v4: https://lore.kernel.org/all/20261001175502.4045853-1-mhun512@gmail.com/

Myeonghun Pak (2):
  media: venus: hfi: disable IRQ before freeing HFI device
  media: venus: disable recovery work before HFI teardown

 drivers/media/platform/qcom/venus/core.c      | 2 +-
 drivers/media/platform/qcom/venus/hfi_venus.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)


base-commit: d7e7bca7169873b46e857c025c10f3336c1258d8
-- 
2.53.0

