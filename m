Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17DB43D50D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045784; cv=none; b=jj4JaLSj3sNYQ/8tpXRekYr0Mh3FHp2RdejxuXk26vGE3A/v3mhXVRO+2/YNN5oj2EwREW0WmRzCTNy5s0YabWey2T+xIQOY/2eD/8MKXiFgy64DVKQqBuPHuxzySLRUUngJUxF5Y7vrPJsYMMxnsWDgrA7JE8M/Puay7J0+40E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045784; c=relaxed/simple;
	bh=Mza2HwlLWqQRyQkXb1ziFQlfmfW6uf43YGjIlmV4nwo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXuGeqYsmINr5Urw9x1o0tx38DFaQ6K41bNohbK3V7xt6f8f19kaNjGxiZefFHHmsjrh11fdLipWPv6YYzFc8WU/h3g91w1gByfPvP8Cfz5KaBzVcMyUmFyPqbP/6DcA56b/3jqW0p/jNmRa2KaNMNfyHEWvDHuu2XB/ZzEioU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cH6/ASkE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cH6/ASkE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2d530328efbso39290145ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:36:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045782; x=1787650582; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZxmP6J0pu/96mrheFiRTnOOfv+FgP/O5o1U6VRpU/0=;
        b=cH6/ASkE5hXb64D11/yrovmMEqgipgTw0z8c1Ohhg1qQ02jv15MmstBtspl322Vxfi
         26Y3Sgr/zVelardZ3Rwif1rAzMwKXbThVZmsA1v0mlVwucR6+BFMAQsR4ybH8eIQYIwa
         QNwjXo1/4SVRLEjmZLghKzafhSekDdSrglJy4qcff4WdwKYVBmfm8rPnFUxuVg9GvEsP
         ggDwnFniTJjLf3Q75yhR/Ax/XE4oRF3jv1TGzE3+K7AVbLuiWzylo6/yUodYTnAkhrNw
         PneBB9mVZpbZOxHQ12XXlHQoxoy1+hXqtyKxa20HxN11m9pMnXP77D9urJOX1YtwlNFe
         mVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045782; x=1787650582;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZxmP6J0pu/96mrheFiRTnOOfv+FgP/O5o1U6VRpU/0=;
        b=Yr9KoI9Fs6LDasJRZH5vq9BpmAkE7uSHTEDAn4FiFYzRA4GpSu2JK9xEH1BcvXDOQg
         IRUlGkj4R71Zkf9jR0PY9VBqd7eb4W2igRx5HFx69pSr/v/igekft9EP4iub4fDC+7D6
         lQ9GCLPxZE9RsJcZGXIHGB+pk7i9cypCRV0oVrkXzS/9e2Eaz/80vMH1v0YRHOCNUPVY
         UlK8C6iq+UWB/l3mVO36v+ZyJtGlRo599YpwOjl20C0uq7ujHjgnTZLx+MkXxPHI8s8e
         abyqaOC7TIEWaWYWpRUuYF4Qf4QJB6Ev3C9VOODsQ/kvLEVr/56Fvy5RXHkk/mMoVTAd
         wkwQ==
X-Gm-Message-State: AOJu0Yx5AwFBBrEdgsCYZqv3r0RuUiERkycDsg5NAAookAT/+NNtjVqQ
	JtUoUhyGZrWmXEw6/HzeNjbN+8QgUGOdq05NV2/+x0kwh614Ghqin5CR
X-Gm-Gg: AR+sD102PtFxdX8vmCpl/mRW0EJse+jwpaMn6B9azei4u6f6NqUGa5ziancq5JFYUna
	/WiX2pFA9D45vKHNALauvrVu/ri91HmsPxA4hz7jCNbQT3zgPj1xe6BXqw2U1ImUSlOvefHy51g
	jdgfBtm3cTJREc/4/4yCmjhXVefCwwVni1BtqVMTOMV8/sz6KOeRmEDSQ9jGHSghGPBxKrE5+GC
	cZtHHntWfT6ESx7etnH+eA0oFhhb48bibUj9fk3sPcm9PsQvoAT3X7t9yhnCMUIpHiWY+gJ7Z34
	jNEy0+Fk4pLn+uanE3vIZIZouQyX7Wnj9sZTjH/NQCPx3XwwNhW6yHI+SBYjt7ekHW9RtzkKpHY
	WG+Gs73iRUnmQrUKeXGGVf217AQ4oDU/UM+sgFPTAlfwTViZ7Lr+i2CiBtMeQuz3AAtsjTYana1
	wy7N6FiUna8gVK6W5DYU1bKWvj+HcGDbDApmNLZ1I9XdyaaBSbtc/APlB+ZA8=
X-Received: by 2002:a17:902:f549:b0:2cf:8131:75e8 with SMTP id d9443c01a7336-2d5c514d875mr89918405ad.13.1787045782195;
        Tue, 18 Aug 2026 02:36:22 -0700 (PDT)
Received: from thefoxflat ([125.165.209.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb51e0e5sm15171535ad.32.2026.08.18.02.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:36:21 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v3 0/3] arm64: dts: qcom: Refine device support for Xiaomi Redmi 5A
Date: Tue, 18 Aug 2026 16:35:46 +0700
Message-ID: <20260818093548.27803-2-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- Add vcc-supply for vibrator

Changes in v2:
- Split the patch into multiple patches.
- Change name in Signed-off-by field.

v2: https://lore.kernel.org/r/20260810105337.855546-1-imkyufie@gmail.com
v1: https://lore.kernel.org/r/20260810062611.735673-2-imkyufie@gmail.com

Reza Kurniawan (3):
  arm64: dts: qcom: Add UART support for Xiaomi Redmi 5A (riva)
  arm64: dts: qcom: Add haptic vibrator support for Xiaomi Redmi 5A
    (riva)
  arm64: dts: qcom: Add notification LED support for Xiaomi Redmi 5A
    (riva)

 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)


base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
-- 
2.55.0

