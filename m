Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794948594;
	b=fjMG8xRDEceP6OMuvxeRlWzRYTsv2lWIF9rwqy9/FEG1Ws3wMwKbcnrR+Ntvr0jktmkx
	 qrUUlPp7F+tlqkD/S4DJqBA3yl2WoLp7G9wf3ZEAR8FYvjRB+yiyz4L+zliPpqdOTReXP
	 q0zsX+mxU6fJLLY5/cL5H4Tp02//5efuXJQX6syIfF1UKSw/Z4xADv2SBNio8vZaTKk56
	 lazQiNnHNl8sLmsPBlniSuFra3f5H66HFlARsJ7NHgL50fLWCaxxC3wpvamNjkbP6igs8
	 J/vnL7RuECSbJv8+JjSisGENvUn/d4GZKtGJmYQxjkNdoa/492N9GqBLGWLzShgmKAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794948594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CKcvaAq+qg8KxGmh6JcxNp/XvZlSd/D4jcbmaL+gnnU=;
	b=uC/vnuXeJOYC94aPIP2/NzH1u2gycPACxCwstQUvWVi/UyqeTLmxF8B2KMw1AV1Rdiyj
	 sDok5F1saO0l7z1djee47ccZwtQnxKOjVpD0z6Xn3ERHN5tRUb9M76ZEcFiTH8OHg/8+K
	 dgyTwccGR78ZZ15gtjIBZD860sJjsbKYQUQvmgB3w29Hh4rxy0l1nINdlE+6cWMNaHlhh
	 lEGx39q5nmIjZZxXvda82H5f3lvE0E4TBOW7Sn01rkfxHop9oXJvF5frgEKZOohu48Kcl
	 Dc20jdHHusai05RNxgz7uyQxRQUbhhgmwRbIFd9iX5KpNn0n5rAjHGupEXKTm5iMqAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8Cem4km;
	arc=none smtp.remote-ip=74.125.229.137
Received: from mail-dl2-f9.google.com (mail-dl2-f9.google.com [74.125.229.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC2A606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 20:49:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CCC2A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=L8Cem4km
Received: by mail-dl2-f9.google.com with SMTP id a92af1059eb24-19305bcb6d5so37281c88.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:49:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794948593; x=1795553393; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKcvaAq+qg8KxGmh6JcxNp/XvZlSd/D4jcbmaL+gnnU=;
        b=L8Cem4kmYuHusy5msUQWLAqRF5dfQXadzTcD4owreV8CgrXMHJEVYuKm6pMlmDu5q7
         9vgzQotO+bGKfZjuBiPM/mkyMHuQTIjYI3HhEhwsv2ZYPce1PmBU6a2OMxG4vgW7A1V8
         NSpCEEIaZgUFL9Vru4NHSeVFDQv/OY5z3rH5tUG5nNNqu8Ndxzy4UVx1d5foLLg8YsQW
         nk6zVOrxBEHUI32Jur3tuItF0bZhbOloX4yKg+FpfSga7SovmAzUV8T9/oiWW3pfDUCz
         A4/rdg5g7mJ1xbDuN6TcUsZZLO+UORhmG2aZcOXgx224+NVkgxJSaLVWAwXxoO6Zojxv
         QZ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794948593; x=1795553393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKcvaAq+qg8KxGmh6JcxNp/XvZlSd/D4jcbmaL+gnnU=;
        b=D6VpPcvyocWLyiVB2wD9AY1vs2hYAsW6O6/k60CtDHU030sBu6t+N031BPOMm72iEy
         O7Ytgie8kJ2RzysItarsZWhfZRsee7eTtnpSFx6Ij+kVmPn7TLpSZ4aBEP/5FcabVQwM
         pe2NtGj16MIbIkNv6rXGh2s3N+h8Jq8KquIy1XBic8d6PHJpXa9QMkP2nlz9drEQxH8W
         8/xrcLMiquW3oVQE3SORwb/rey3p+s0E94FPEU3tiD3K07YfwG7q0VpSkxblziFfsll7
         90pK9XzkAKxxx+DhIpfPF/fqqGOZuGT68TvBEpR5VHHPKFI6HRskJ2jyjnynrdDRq9d4
         8lyQ==
X-Forwarded-Encrypted: i=1; AL+hErFOSEsWBuKHRNCqvWcvXANFOS0aSNjAkYrCPibV9px4yWaw13ho8ozyXHnS5PKmpFvpxI1EgYYYhJRFn7Uj@vger.kernel.org
X-Gm-Message-State: APuU4Z9krNFag9OHYFuC5+8tMTO66aGPa4FSQ6SxIivXTtoim7KSUXZn
	yIK7QovYm1RuNkLC3LcTr5zbPX1nl1lIbB7q9bXS3PmBuyFg1HyIQvPOHY8Q1ixz7bf/0g==
X-Gm-Gg: AYBFou0X5lxAwKTs4B2hAlVUor21rrlHvGYCfe4W9GZHyJuhfHxHdPzNxeKlgwSIRhu
	wsk2gLhFTmxyzvRiZ2LZBV55HEZWsiqQtTtymyg6ICJzsHSDeqF8Qis/AU7FBWFluIF6D+FQffm
	oAU0TFGn1H3Ehn2u0q7p568yZZXYEJlmZlbanOJxrUvObLzCb0kp8iJ5Z3QaHp3POtcIM6FjXDC
	q0spDcQqr+SQDzgyr3eIvCCY+BzuC8exz9qqzm0fvWMWI8U74G1W4lEsS00UPSx0sus7I3SLAC/
	u7RB/JuBaiUx7lFBg85Fhpq5CaE9o6APaA85nKr6XZohHG86XXwwYevO3Y6AIgS/MOgDkYxvUcq
	Nhb1MGoMHYl0FuxgjPOzDO0z8AcRyZdKhgRppH++TQl65OIOglfMbOI8320ex1ynaQq1LrosU7u
	wg+ygMQjJ9Y25srrg3QG8ZbtWyBc3JcpZ5ENOt/e21U7D0pJzuLU9Pg6Q2etSfYwa/OtceCc3xy
	oHm1t5AL04H5ZaxmqLSB3k9ORuPhH+7imWv1xkBZ/Y38RGybESyGbw2GCr6PLfqHeZ6j8RCp7vy
	EYxc1eEzGU1jZOkc6dBHf66tEqSzalVhI/XzS9piui0DhA1JkLYrVOGnOkkdO/zpD9q1ggNENt5
	3A1pR74j461nBj+eumBAhbUj+Ngle5tS2FbY6ag==
X-Received: by 2002:a05:701b:4348:b0:1b3:a22e:b74d with SMTP id a92af1059eb24-1b543d04c19mr547908c88.34.1794948592840;
        Tue, 17 Nov 2026 12:49:52 -0800 (PST)
Received: from localhost.localdomain ([98.148.34.5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5447dc5e9sm989029c88.11.2026.11.17.12.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:49:52 -0800 (PST)
From: Hungyu Lin <dennylin0707@gmail.com>
To: vikash.garodia@oss.qualcomm.com,
	dikshita.agarwal@oss.qualcomm.com
Cc: abhinav.kumar@linux.dev,
	bod@kernel.org,
	mchehab@kernel.org,
	hverkuil@kernel.org,
	stefan.schmidt@linaro.org,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dennylin0707@gmail.com
Subject: [PATCH 0/2] media: iris: port two packet size checks from venus
Date: Tue, 17 Nov 2026 20:49:43 +0000
Message-ID: <20261117204946.21359-1-dennylin0707@gmail.com>
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

venus got two fixes in May 2025 for packets that the firmware sends
through the shared queues:

  49befc830daa ("media: venus: Add a check for packet size after reading from shared memory")
  06d6770ff0d8 ("media: venus: Fix OOB read due to missing payload bound check")

The iris gen1 code has the same logic and has neither of them.

Patch 1 makes sure that the size field of a packet did not change while
the packet was copied out of the shared queue. Patch 2 uses that size to
bound the walk over the properties of a sequence change event.

Hungyu Lin (2):
  media: iris: check the packet size after reading from shared memory
  media: iris: fix out-of-bounds read in gen1 sequence change event

 .../qcom/iris/iris_hfi_gen1_response.c        | 73 ++++++++++++++-----
 .../media/platform/qcom/iris/iris_hfi_queue.c |  2 +
 2 files changed, 56 insertions(+), 19 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.43.0

