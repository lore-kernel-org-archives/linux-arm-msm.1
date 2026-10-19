Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792429331;
	b=qC/U8m7nambPZD0D7r5GxpuG8B5Kogod+ChweJx+PwmilkyMjrrVB5ZiuZJTyxpe3tK3
	 AcUG+XsI8nT+Iz3JDI0UmXr2XD70/7DKXkCULo5bFmF+9458Rg88OxW65mZTDQd/nMxyT
	 F9jkLJk8bNprZ4xQRjWYSZWmfCFZCARA9ff8h1KNpxonB3Ks8Jn6nUG/WYRm+1HORnZso
	 46li8lK25UUZMXJgK+OjTbourgEJcUZLW6iqoq1+E7fH3iSsKC3k6SddfF3gMOuNFZdWP
	 5y7GMyNDZgKh81jPLvTzdBd8TyREr6Ou6/pGPAOSwF8If/C3oX4W1KDUZSRJjBQh3HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792429331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=kLmRjl/7hUdjB53Saldnnqoyygt+0gEwTjW2wNuq+z4=;
	b=oyc3iIRphstoiKy6FEghjyt4Vt8HNtAKEyrIjlNACnmm+AknIuwo/Qfbs8NN27s7xi/y
	 Wlzzyka2RJeRbTOQpiSMWANGEs5JubZvSo//qR9vUWGgNyE4ct+rqvpErx3pcigE9m4Il
	 tVBr+2tAyhR5lzHUw0qCHn449Y1l6MGsh52r08o2DNwyruElkRymCNC0ziIlf+Hj2oiXz
	 kjaM5TdIUF6upAuwrL3v5paDY1VRGc/k+t1qRA7butq/rFiC93iC0XDfwDXAKhjK2DNja
	 K91aFHiKtwUI/Xz4oY1o4qSA0J79LL0ZkR4QPXP5cZmbjMFyat5Byzixz4TBDnMo6DQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ocTiixAb;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFD1F60A260D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 17:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFD1F60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ocTiixAb
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1610803a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 10:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792429330; x=1793034130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kLmRjl/7hUdjB53Saldnnqoyygt+0gEwTjW2wNuq+z4=;
        b=ocTiixAbjoYtkjRsCv9M0YKgBpnrHWSeHIIkjyjbhquGpkRsl8UMyaFPwDR7MLhJsQ
         Sr7aMcUBEUqnEuXDZTr7qAlCFByQllvPI+WpqNSCaiRl1DMGhpyMv1xvzCx3lm4S9H5X
         lCoj6ec881I7WQBMs/cbTgGDwU+qt489uMT1RAWSppIEAofBa45rbSW9lH88afJ8CqqN
         4icg5rnrzIQuuc0CLuBpCSU2k6nnQ9YyrmGVy88bXEMqBuXHNKU7Xw2NPF5mSiO93LKI
         8lNQ/zcr+7p9S76HCBrrrKEV/XlQWo7Zvdck/r68ni4/VmUdZz9qdso13pocoPYfNRwR
         n27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792429330; x=1793034130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kLmRjl/7hUdjB53Saldnnqoyygt+0gEwTjW2wNuq+z4=;
        b=DiwI6GZWCbnA/JwHqRgITOmQfUinoro23BpkkX+5UV36WOYp9YTi/Epmciwh2L9AXQ
         2pgl2GiJ77pQ+SyAvy9u4PbLxIDqy6RI5bIcTI3wZCTkyBt9mYUMmhg3s4QxP6rbddac
         GU22kxRFAu9SfjE07oU7SMjb0MTv72FFimH/S4NFhaD/ywLviuX65qvIKMgBe+viBk02
         9QMJd86he7rWsfEHGZvouwAmUfZP0Gviq3MpUP2C6NO1EsanjO74FR1I6glVQ9riQFzq
         DeLwdwHmCLK5sjn2XoS4xiJ5cedYhFPjtBRMt4GfuLPIH2l0puzY7814gZaCP8ZmcJ0B
         wl8A==
X-Forwarded-Encrypted: i=1; AKwUvBxXOgHsLynAC6Z8OzlHEuHpH0hvuk3G7EZBRP3tvQzC7cVxvuco4abQ6SBJ752Ma5RY1xy/NbiXcyl+yVEO@vger.kernel.org
X-Gm-Message-State: AFq9FYJMkcrzLqMI4v2K8MV/wZTUFsnx4QRSkTm4fcqvRw9bWnYIb2HK
	CGOGchvNeSQdR8kW+q6+rtBDkEoeOGU9XpMAArkUv9EQTZeI48yiPgIU
X-Gm-Gg: AYBFou0YH7lXDPhob/Mfr3+8RyNhz7CClmPjyb9lMtdG2UeQMheYsj/VrhXZ7Y8uaFo
	yDtZiMkCRBA1dg2miawDmEjXGbHZ9A9YpVyvdbT7LVT8ew6OSjEAZtDCF22ODSsCrpdtYylfIY7
	bpObr0ofVqnAgMbjTPKhxzgzs6BMlcCrD/nWjS5zJXJ+lQPlMOyNBBnVbeESdOJ7r+sfA/0oX1M
	x/Fks8RBwqBwweARUruTEZS/xRulRpAmjVLJnMbM9pVLU+LkAGEDZKmaY46P2+veE/n6lpZIAXk
	DeJcaWa575Rmfk3wFV+cg+KraMp7bw4gBWoZqWIz6WsipvcLsUpODpx/EF9XXtUo/PlYSOb+eVP
	jPCshO7Cio/gi+1U3H91tYNvbrMik84iVrtmsqjVaooN3sj8ZXIXFPUyOz7lvq73/sl3exYna3W
	kxc8iML8i5hdNHZU6bGc5Q5fe2YPc0bRi0djSm/roNlIMFnaq+u8lJ8AxXJa97RdxF1pzetJBm6
	IsZ9bFzDugbk9+tB3xtgLpLors+/L3SIk70TMR5NwX1BX3ssEcS7Y8jZJlkiGhS7mrXeRoF
X-Received: by 2002:a17:90b:28c8:b0:3aa:548f:eb77 with SMTP id 98e67ed59e1d1-3acef5f1ccdmr7554752a91.56.1792429330017;
        Mon, 19 Oct 2026 10:02:10 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd6549c5621sm4317511a12.17.2026.10.19.10.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:02:08 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Srinivas Kandagatla <srini@kernel.org>,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] soundwire: roll back failed master registration
Date: Tue, 20 Oct 2026 02:02:01 +0900
Message-ID: <20261019170203.2533974-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

A failed master registration can leave partial port allocations in the
SoundWire core. The Qualcomm driver also ignores registration errors and
can retain reservations from a failed attempt, so hw_params may report
success with incomplete master registration.

Patch 1 makes core master port allocation atomic and restores the state
changed by failed configuration. Patch 2 depends on patch 1 and restores
the Qualcomm port bitmap before propagating the registration error.
Please apply the patches in this order.

Tested with ARM64 QEMU KUnit through real SoundWire registration APIs,
Qualcomm hw_params and the ASoC wrapper, using synthetic devices and
task-scoped allocation failure injection. The baseline and a return-only
alternative each pass 2 of 8 tests; the complete series passes all 8.
KASAN and lockdep were enabled. Product-only ARM64 LLVM W=1 SoundWire
object builds and strict checkpatch also pass. No physical Qualcomm
SoundWire hardware or audio playback/capture was tested.

Baek Kyu, Kim (2):
  soundwire: stream: roll back failed master registration
  soundwire: qcom: restore port reservations on registration failure

drivers/soundwire/qcom.c   | 26 ++++++++++++++------------
 drivers/soundwire/stream.c | 35 +++++++++++++++++++++++++++++------
 2 files changed, 43 insertions(+), 18 deletions(-)

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
