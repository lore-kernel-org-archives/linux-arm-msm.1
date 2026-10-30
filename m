Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793346254;
	b=MJlQ9yBwzLZQIHOQCKlHZ051JmwB0fBcwrvTG3k6FlXHWk3PmTeZXRU64orrZCJ52UfL
	 bWHsZpLUZC/3WJ6C1YvuDQX+Jq424tIzIvByx3GZK/p8ydi7sBFPBKgM7pKoxP91je2Im
	 2euBq8hd+9ARkduEckW2fDt7Co0a1CczCY5eSaea3atv141DayTUxD1/ao5EI24Z7ozbA
	 yBULlqCgaOuF+tV9ui8Qf3SBraEp6g9mwvKJ2HGCNClt6t/1F8yfg6P0LxgWe5LhKIQAQ
	 AENozZ5nC7M/NJC+zrilwljb8iGfXb5fg99fBr7mU8bmZbzy+fP6oaZRGNYkcgy67jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793346254;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=03qqmHBSW9MXdmI5eo6TZGADNcBJXPTGl20o2AD8AeM=;
	b=sFupAk/COZ71OPda4rYLcbkZilUlohPEkK+gm4cPoupgSAc38E6pZ1jagXaFL4F6BBHT
	 +s0FqpjUvIU3rD+3ml64/8yusErPMnCGkRcpTLpegFeinSp6pGxKd4DlbZ1Yfw3LfN0dl
	 gxGpakrW+0q/1bSLvc7zvHgVWmH0knA/hSNT0mo0qknCQxBYQfB4beddj9A7wrzRsU07L
	 84BptTuPJ+D17Ke/IvbenBefn0uXGaqPJadeNvxkv5ndnSiAPNs6kyYpnixXIX1X+jfjN
	 FIwUoJB4Svjieyu2eNUKGRbY7mC2ta+Pv/7uMx5SbJszCaUvlrn1L2zvPQfixIpWkHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="I73D/JIW";
	arc=none smtp.remote-ip=74.125.82.44
Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98302606A31F
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 07:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98302606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I73D/JIW
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-15ea896ddc8so664455c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 00:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793346254; x=1793951054; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=03qqmHBSW9MXdmI5eo6TZGADNcBJXPTGl20o2AD8AeM=;
        b=I73D/JIWeqqMaqnpN2TqvAc4FFoDTlDFdOPfAPRDSQxNojz3M7bdr7pnhe5X7NYMbq
         bgSVBsbpvIMeIV8limp9+keuy7ZIbF9dJQP2PlZ/mtC6c/Qwdp1uZlPXLkLbi06hbTXT
         8ag++qRuiTYIomfEhGtRsOVPQCZsX8jbBnLFXb9yZObTG59HlrGrVs/l7VjKmVj32g2+
         u4OffBLWxV3sLKaX13zTsa3UboHXE0mDwbVlngXoZXYPclNSwo/+EFoFKvb5+GHRSeKn
         fBf0d4TKrihlLG6qNaU4HOw4TN22FkICTjebC0IPL7fQSB/PQyZ4jlP27JUdL3jH4EuI
         Rrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793346254; x=1793951054;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03qqmHBSW9MXdmI5eo6TZGADNcBJXPTGl20o2AD8AeM=;
        b=xwTQu3WrV4H/CiBa/6IgMESZMUXfDvrUiHBodPUfTA+DpD0YVkOCuVggMnct/IwvLZ
         ideE2BJZ+Db4nUYpqpMxS+lA3ZoatOdRs58fV0KJf2Gy+9LG7c9qfdAhAld8/kb6Jll5
         90sw5TUiVY9609U6YLtNxMNZMpLLiUxYrYndXgkPztAzXLQMo5JvD86kXSiq0dcYjF3/
         V6A+XOssBIKAn/b2flgiGHmmyqYwp0SpFSisVqw8mvNvpJ67O3e/ZUBc7QymWMHsuGCJ
         E6355ZZ0gd/KcYVcqxLvqa85NgORGoDCfmXC2mXPXhvvKfM5pTIxf10lsD8KwtTFGN/n
         Hspw==
X-Forwarded-Encrypted: i=1; AKwUvBz0UedjtSAdAyQBRGAN6gMk7kSiM6iirQxYPUb46jOh8rQe9DZglkHTo/6rhTpmOMiKskrSqnD53oRqZO4c@vger.kernel.org
X-Gm-Message-State: AFq9FYL9YG69VBl+7HpWI+HB4XIsduOgup6sAHw8pYWNRDAjpSi+8fJ0
	urnbl6/3fQoR4GWtMug/kWmKVaZbg5FoV/6kfzP5/BnXFVoNPz+v/xPo
X-Gm-Gg: AYBFou09O1n7tQDP3rZM8IN+D+8ZospR+AoEcCv1NTR1ayQm19k0554J0kkk24ZWAn1
	52WjnIdR4rDvtrXtBuE4ZIX3+mW46yQCoCFdY2Fayb66+zUoQ1Y8A+2pOULrKZ9nT0pjQjOKy2G
	+4X1uTkiWpy+yzra2Pd0/UZq6pSSDAclzkIntrNhDqWncKcx8pBimI1tZVc4Ur2e9jkHdED4/3K
	XSmhPxeuHjXtlgOEIGijgzHpMZPYEnaggPoG6Xduiz6+qJPn8QC2YqYlaNBvQ3eUxtHbwaTSBSR
	J5vUm5Pn9eqXECKBSDWAm5P6FCFmJTKblyNEaATPwbLtMXAIk3fDp8tdXTyA5CZEnmyV3kS4+Fp
	rsT1yfQ1BOTQEGPn2z+q07KdTbXbJj+MPTjcXWCebXMIoF/vTIUkvK5fvz9QqtBtrxLmkw2V7zw
	lUn4QAzhQCa1/ul1rJ4hgKGKZJPgICxFn7TMB1pPj9sc6tnwIdSAtPj5iVT5NssbD4SCzScFZut
	O1J3K2UTldEiKacvnOob3+1gf3PN5FolA4ejxvKiHJrh79WtroINnrQgVrgO9m49Aeu7Ju409H2
	UqKBsIB+tmy9Ybl9w7OaIoMHda14F8cH4j/XQlkLTKjRwZWEVj/qVxE=
X-Received: by 2002:a05:701b:4241:20b0:143:2968:564c with SMTP id a92af1059eb24-1ac5b9cb040mr2258198c88.26.1793346253483;
        Fri, 30 Oct 2026 00:44:13 -0700 (PDT)
Received: from 192.168.1.130 ([2402:a00:163:2ce9:fd6e:e797:613b:a5eb])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac192c27cdsm7466562c88.10.2026.10.30.00.44.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 30 Oct 2026 00:44:12 -0700 (PDT)
From: Ajit Singh <blfizzyy@gmail.com>
To: andersson@kernel.org
Cc: konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ajit Singh <blfizzyy@gmail.com>
Subject: [PATCH v2 0/2] arm64: dts: qcom: Add Vicharak Axon Pro
Date: Fri, 30 Oct 2026 13:14:02 +0530
Message-ID: <20261030074404.33517-1-blfizzyy@gmail.com>
X-Mailer: git-send-email 2.50.1
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

Add initial devicetree support for the Vicharak Axon Pro SBC, based on
the Qualcomm QCS9075 platform.

The board description includes the debug UART, UFS, USB 2.0 host with
an onboard hub, PCIe1 (NVMe), GPIO LEDs, GPU and DSPs.

Changes in v2:
- Use the "lemans" subject prefix and name the SoC as QCS9075.
- Drop the PMIC gpio-line-names, which did not match this board.
- Drop Ethernet and audio to keep this to initial support. They will be
  sent separately.
- Link to v1: https://lore.kernel.org/linux-arm-msm/20261029133654.6585-1-blfizzyy@gmail.com/

Ajit Singh (2):
  dt-bindings: arm: qcom: Add Vicharak Axon Pro
  arm64: dts: qcom: lemans: Add Vicharak Axon Pro

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/lemans-vicharak-axon-pro.dts     | 514 ++++++++++++++++++
 3 files changed, 516 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-vicharak-axon-pro.dts


base-commit: 62f4c998b297cf233997a2b4cd6fc2d2df0319c9
-- 
2.50.1 (Apple Git-155)

