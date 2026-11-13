Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794580160;
	b=u4vMYz35QRKB/tzrJm0nZxmn6rdvGfHeLSMrl0xJ8HPA9M5qWC5BAdXP8FcDUWnXEO1B
	 HD+qjs84V+6/0tUAc07bz9UlmFvy/hoEcWAJVc7to/77XjWgbCNeMCegj1JolOl+8aGZU
	 UMMijMwuH8+fRPmbq7p0Vvdak81nh8mYLIl7L/KO8kYNURBFmgGszifQknEmfAeUdMDW0
	 XUwQFGfV7/M8G7gR3moxCqewF4tijmvbqgIa/0up2E5rujBkDutukgDx2LPt09GoPjcgV
	 PDyb0mw3FXCLTy8Eoo3A5LAm1b9V7AeLbhkysmicTrEVQYSZZnkQASIDRepohcdiyMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794580160;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Received:Date:Mime-Version:X-Mailer:Message-ID:
	 Subject:From:To:Cc:Content-Type;
	bh=mrFnkSpDwPeFa+M1IqygXhZz7/qA6wHfwFX1sY22H8I=;
	b=uA7sEhPZW7mEOAlpBG5KI5nYaWEZf1ooxxkoXFvw8VTc8Lva5LE/7SMDVHaWGSlaXKdz
	 Y5esTB6ch/ZUCUhungXHjT2ysdAQ5AZuH5yb5/TsVpklxkzBysRozpc1J9MxwBXCH85N3
	 /vXyvRG5fwsPUTmZj0Rj+MD4hElSGX3Vtx8+PSz7ocGa7sKGLWKGlGCtm5aU8L97n002I
	 0xD2gyYkYs+NOMV+I/mAh6A07yBclsG5Qy5V+33zANp5f7lIQXGlhp2YPpsBzN06yYShi
	 x8ohO99d/kCn66EqP/CCigfe2QAbQg7ZOUrxjaOsLzuNF3CvF2Ub6rE1Q6LYUUKSCXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5Wfyz1+;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F721606A333
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 14:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F721606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=p5Wfyz1+
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a77c1cbd15so8877085e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 06:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794580159; x=1795184959; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrFnkSpDwPeFa+M1IqygXhZz7/qA6wHfwFX1sY22H8I=;
        b=p5Wfyz1+aOhdni0i8oRYNdeaB/FihhXMOA/hsI0gZ6rbVCzONfqA9Xl9iYkcY1FwWN
         RLBzMAMRG/aZMRBqdCLYCentT0hGBVfCq7AGv2f9dtZOpvi01PBQFt7y4NmqQHXL6poe
         SYD9Mhh1eE/kMR2O0R4HeDtWvCNKNuNjYtwLyHhj4JKqIMumA8Wcv2JILtn25HIUOQtE
         xNBlqCwRGvvUpp3konTq9sYZFr6+sMFW5grY8x13KBYYqq9en3famQyQRQ4/gSmrmF4g
         4C6UUdLpk8rc+wwiXI10YkS1lSVwZvZlVVb/vSCo2ZPvAVD/TBjwc1EBWuaM6IqAePYd
         X9Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794580159; x=1795184959;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrFnkSpDwPeFa+M1IqygXhZz7/qA6wHfwFX1sY22H8I=;
        b=fafiy+juYdWXnbOaxyPwr7969IyVXmQFPsLnnXm+P4XI0v3bim1qA+oHHf+7x5m0GK
         ltO1vw7vO2VqZpSteqrI7lfYpkD3RPDfsJPS/sC8/twH5jrJOu0vC1XEwHYH3eKkluuo
         VjI/RLb2udLuaDWXxJy0WzFkV91yLCcubUjKb6rMaKKbUeLGHhPJj/z5Qly3EMijz56+
         i6m4/YFXRNapW28JHq50tZUL6wwwiZx4bw/MM2NicRFg7LuH0AkBJc/qsZHBPPaJ8kVd
         F/m/oPTeLUOVz6nxRJtlvsvi8FoWWJbC3PZbQH0/pb7roMf4sQbtgcQgsd+lwB+44Njt
         9rIQ==
X-Gm-Message-State: APuU4Z9cK+4IEdoEnIfBdaGLQ9FR8v1lGF8pc4TGktHYMuYOdF4Zw+Bo
	HpHyBAo4zMNOavZJ+7gFsO83O50mwQAOc6AL0eEJnQ6XwjFt2JJus8sv08wY69uzYKYSS0Kjjx6
	oAjdId8+F8fvMAw==
X-Received: from wmg12.prod.google.com ([2002:a05:600c:22cc:b0:4a1:989a:a866])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5852:b0:4a0:1fb9:2f51 with SMTP id 5b1f17b1804b1-4bb55a832d4mr36306945e9.14.1794580158523;
 Fri, 13 Nov 2026 06:29:18 -0800 (PST)
Date: Fri, 13 Nov 2026 14:29:08 +0000
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261113142910.3477757-1-smostafa@google.com>
Subject: [PATCH v3 0/2] dmaengine: qcom: bam_dma: Fixes for unbind
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org, 
	bartosz.golaszewski@oss.qualcomm.com, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

On Lenovo Mini-x Gen 10 (X1P42100 based) I am using VFIO-platform [1]
to assign the QCE/BAM to VMs.

During unbind:
echo 1dc4000.dma-controller > /sys/bus/platform/drivers/bam-dma-engine/unbind
echo 1dfa000.crypto > /sys/bus/platform/drivers/qcrypto/unbind

I see a system reset quite often, looking more into this,
that seems to be related to runtime PM, with those fixes I don't
see that anymore.

[1] https://lore.kernel.org/all/20261024161902.2093581-1-smostafa@google.com/

Changes in v3:
v2: https://lore.kernel.org/all/20261023101536.3965344-1-smostafa@google.com/
- Rebase on 7.4-rc1
- Collect Bartosz Rb

Changes in v2:
v1: https://lore.kernel.org/all/20261020180804.140766-1-smostafa@google.com/
- Collect Frank Rb
- Drop call to pm_runtime_dont_use_autosuspend()

Mostafa Saleh (2):
  dmaengine: qcom: bam_dma: Take a PM ref at remove()
  dmaengine: qcom: bam_dma: Do not touch remote BAM in remove()

 drivers/dma/qcom/bam_dma.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

-- 
2.56.0.611.g1030f0b940-goog

