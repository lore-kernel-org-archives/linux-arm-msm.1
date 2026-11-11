Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794398009;
	b=oFa++ZRtL77k8c1pA/wvAjqpVe3mO8ljNQjSkGHc95gWSC3zS5iT1GlGH1p7htEztiZm
	 uKObep9yjsaoTeut1NpM/880xq+KTXXPLtxHms9D0abzL1MA2EsSuQHUf8zAsAfL0b2Xc
	 0h9mE/QvWdwqGbGw7xMrJWEXOjwGmOST+5QJtKVQJeU7A8SOSapmAe1pLhqypth+/Nq4B
	 FFqPXZ8p7vyVL344VkaE/RiixLNAPAHy2vunRC/McynInMRW/KcT23jYijhCtsWO5Gk7i
	 3MR+gCXL7c4qZN6kcpk2vLTq/y/fQZSMBMkbEaELPeBhgPaKvhbATqng35sf7N9eLMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794398009;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-Developer-Key:X-Developer-Signature:X-Mailer:Message-ID:Subject:
	 From:To:Cc:Content-Type;
	bh=bBmIA1Ji9pehsO8OLTZvyh8DgfBjrq2hd0lyT6sPELs=;
	b=PaxTbN/v5XJ0S0YhdBoVjFxvmQZ02LKQmHCdkNs6VBWvbkNLncmt93Quez+mzQwWtl6R
	 Dx+cfNOp+9tFf68GcoYY1e7kHUGCT69TWdm6ZBtpchRQz+wsKBL9g3VH73jmf7kyBDCFs
	 rYEl+LOrA/bRv4GG6HkiQk3qEw55ZAIQ0XEFskJPWh9KeX+rK9zT/smiRgxiWPpYNv+cb
	 VrFrI2ox+JF41f9VCHXv47qWZO8y/MXDfJz+aRxpnwK57Oq1kYMXFSoRQwc+rScE+Irso
	 X3OJzUi10DxHeXkDa96So2Qnucd0YHpOK9hVcm7Q4ENUlh+mjS++pUVkx93Qo5nvwOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--ardb.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYEixGQP;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED59606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 11:53:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2ED59606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=WYEixGQP
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a1fdde384cso20374575e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 03:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794398007; x=1795002807; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bBmIA1Ji9pehsO8OLTZvyh8DgfBjrq2hd0lyT6sPELs=;
        b=WYEixGQPChxL3Sz8rzUDPNn/ndhGnBRk5NpPkwskVtuKsEMvOBEWuRqQHW7BLk8WAN
         GcbBtIUOUuRAqqH4lbMBSihhL2xCnZAkzfRTA4k0Tgix7ywdRG7lEZV7Apm6z+mGazE8
         Tnj/NWlGgsobxxVaRJE9W94WCCQVOR/epluUhlhMd0JwkStmFhVl5n3eKMslxqbKxAd0
         p3Gmo0IWWK2YIoGAf9hsXgiVaxOa3NfMNtstncoviQADK/8SnnnxzECttQbBSn8fSj9S
         h4E0lr6GRDOfmlwe52UG7mM7HbwBQSbHePPRs0rpHdAHGHwAd0qYMuSVqt0PLykghFQB
         8eaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794398007; x=1795002807;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bBmIA1Ji9pehsO8OLTZvyh8DgfBjrq2hd0lyT6sPELs=;
        b=0r3Y8SIJYBuoJHS1ItLKN3fXN3oPBmiL0qgfWBOyn+7onSVbHiLKdKWvm75MYLLP6b
         Zu4VrtfwMFN0caJJAazkPKk3HvNRV3mAKqEJ0HSrgAJ3D8StlVIpRrHnyTdVWCtyrJWS
         UJFEYapgeG2j9TtdxRHUeRTYLymkZN/gJKCFb+9nL2awkfEz7D6lREZJzyZ+PqWMUeYA
         7aHYFRfjJV0u+pciwRvkaVqvk40XwbIOALBwZDmEW9A9N2S3UgZAbFSLwz6TadFQjA7u
         TDTpsFI24sfG4z22ej2yc+5/jrTjkTjQsDyn46P02HfqTKXr9eX84hXNZXNDI8MFqCLs
         rYzw==
X-Forwarded-Encrypted: i=1; AL+hErHdU1rU/2HJwYVqkpe5Px3B3HSCJpQfqfGRVp4bTQQYq6xSoEuh+BvVOFKneQs0S2vlIQqr/HTWwJO2Lrgk@vger.kernel.org
X-Gm-Message-State: APuU4Z/9LZjIAH1diyOUGpOkDQAFPKyxki6GnaH4QAhIBqOqGkp3yuTc
	BNUlSP0RLpkgOtVAtOFLBrxEureN+ZVnHYY559VLItsAz3QIOF6BSPLad+PJ5a9AU14Ik/s6Dw=
	=
X-Received: from wmfx22.prod.google.com ([2002:a05:600c:2d16:b0:4a2:677:24c])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:e545:b0:4a1:ac66:6059
 with SMTP id 5b1f17b1804b1-4ba093bdb35mr28910225e9.26.1794398007452; Wed, 11
 Nov 2026 03:53:27 -0800 (PST)
Date: Wed, 11 Nov 2026 12:53:04 +0100
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1646; i=ardb@kernel.org;
 h=from:subject; bh=hPzIZ0furKnDG7EPgK7IrCj0fkSQAyuPiZdPs8OxyD8=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIetLuML36Pb8Gx7ih4zYXnrcsNqw2JnD2jY59knS4/fz6
 iZ1HHnYUcrCIMbFICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACbySJ6R4fm5K6yPPrPFMx/v
 NzKrXpVxc2JBzpIz7hfUttU+/X5p3kWGf/aPFf1Oqm5+9OvJ+kjj+GO3rDfouoY+OGjB9nz5Zj/ RiywA
X-Mailer: git-send-email 2.56.0.611.g1030f0b940-goog
Message-ID: <20261111115303.3749380-9-ardb+git@google.com>
Subject: [PATCH 0/7] Lenovo Yoga C630 (sdm845) fixes
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

I went down a rabbit hole with Claude to finally get my Yoga c630
working properly at EL2 (minus audio).

This series does not cover all of that, but it contains some of the
fixes I picked up along the way that are unrelated to EL2 but were
needed nonetheless so I am sending those out first.

The EL2 changes themselves may not be as palatable upstream, as they
hack around the removal of the QHEE hypervisor using slbounce, so they
will be RFC material in any case.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org

Ard Biesheuvel (7):
  arm64: dts: qcom: sdm845: Bump fastrpc shared DMA pool to 32MB for 16k
    pages
  arm64: dts: qcom: c630: Use LN_BB_CLK2 as the eDP bridge reference
    clock
  arm64: dts: qcom: c630: Enable DisplayPort alt mode
  arm64: dts: qcom: c630: Use the idle states from the ACPI tables
  arm64: dts: qcom: c630: Wait for the touchpad at resume
  platform: arm64: lenovo-yoga-c630: Disable the EC interrupt while
    suspended
  platform: arm64: lenovo-yoga-c630: Expose the keyboard backlight as an
    LED

 arch/arm64/boot/dts/qcom/sdm845.dtsi                 |   4 +-
 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts |  44 ++++--
 drivers/platform/arm64/Kconfig                       |   4 +-
 drivers/platform/arm64/lenovo-yoga-c630.c            | 155 +++++++++++++++++++-
 4 files changed, 190 insertions(+), 17 deletions(-)


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.56.0.611.g1030f0b940-goog

