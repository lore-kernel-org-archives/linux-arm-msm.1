Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874544;
	b=ooGH1HYel30MNqbB8lAf4seBWOaxIzIxEsVnFypNv8enTcqgO/GsArGMx5iApKc5I6aZ
	 mwNz9rXPz/+U5w9wQmgwvma0UyBHM141YrgIJu81k2XO+XjxJjolH/XpIfz4NrsewBsMd
	 0FDIBRjsOXAbsKLC1JmItE7Q65jJ26uNKH1osNkoguy+cagVXEqqT59s2LyXnXYogw/EE
	 EdJRhIMm9cmDOSaIbBd+iGj7qFgVLOtb/AyT+ypwghuHXU7CZZ83eUZNFFM4i+wnD01WU
	 gnDD4/TUwQikX7nBW7URvLnrQhQS29ouH/Xu+TwVtwBSCmugLbNc6I1rJmxY3YWA/3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874544;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=ajLIzQVCgaI7n9OILj8/6lpTK+AiVXchsMOmXAlkCEA=;
	b=LtLjAZWyCv8igv7TcSBC8HaNqXmjr8eI5efP9VYLCBF+Dr6bUbXd0GH8He++2FxWPbXv
	 E6OPGTR377/6fx0Azkuj+5zWuFzF1ug3WajLSQ4q4zPNzLW6AQvf+EDtKcdzXX19HdVL2
	 86NF/6AgPWUlfG3BU4u+kIu7efVzCb03Ne4h8wt/TdikC2qCj5RlzM1VU5JDtoWDpAu1M
	 izG81gjor4xk0ihddlJQsCuzEJnESzz6Ltzu2F2VOi+WylK0ATOSjaA7Ojd3dc0DttO3i
	 vxN7ajsCJkjxgglj5zvhoszaofMqKH7nO5P0YYypEmsJVWoICDQ/nqLV25dl3952suA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=uGKlzRZe;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BB91606A32D
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 10:29:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BB91606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=uGKlzRZe
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b1b13e09ffso1061469a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 02:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1793874542; x=1794479342; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ajLIzQVCgaI7n9OILj8/6lpTK+AiVXchsMOmXAlkCEA=;
        b=uGKlzRZeKSBB7pbWNgXhCMnH9fIP+HhOcCeqRDYbF6gB1fzwZDQM11K0HHL13OoMdV
         IGZV5O8TUCjILvLNde50AKTfCEans1P9/TwPZmsR/VDfB4NdNmgk112k/F4/tuh5ung+
         Vw+BZNNhY/FE0qOH+R7fI9lo4i/gy4J01CjnfEBB46iZBuTmGNrQDyJnMLgS0GcVRdPv
         bzsOyxOyqVlDrIVXxYjBK2wKMPAMvsH3q3d9R5jbi4xhDSsHsQKVA/HCAPRiMP/3dQjO
         FZ/yiaMR9Pz6QKYTfLlu/Xg0/MrmZURk4B6CzDcGtlvTbVUL7qA4xZQ/QNE72quwZiNb
         pWCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793874542; x=1794479342;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ajLIzQVCgaI7n9OILj8/6lpTK+AiVXchsMOmXAlkCEA=;
        b=HmsU5XTqLRzkSWvOJvVMmkPVV2bk3babJ4cRVuOmUqojTFyQKAZBntgiP1nmRUzHvW
         pPV8pGEnwgyVfTgn43rI6x4+0BHAecmb6efqVAz3NbOmL+jAy4EVd1W4B7uf5HTaqz4L
         emO5+WShR1D80SIyrPXXwrHNV+MoTuVxth+E8MtqPZV5kSqXGMZXoSjHlOu/gH/bPmbg
         OClAo+J+9mU2WEA2jAjAVyTZZ3a0J9lMhn+OvMMK3K0vsKSg75JhhupXBJfMmG6iZJhQ
         A2IjDCXujvI9wH9rpypUHWjh2ryigmwlIJHOBtV1eeaxHZXjs3aJyuHSk2+q9o3NOuPc
         1vrw==
X-Forwarded-Encrypted: i=1; AKwUvByjNKGQPvCdK2iFpddWHDZowa+lgkAI7q4DuPSPICWcajtXSzphLtEr9NJ3NSWOUlvy5WBbbPhTJ7R9188l@vger.kernel.org
X-Gm-Message-State: APuU4Z/vPRq9UgrQaFxWAz4AuK6ZSBcdmLHADPcz6Fo7xjBBZCirVPNT
	8Tl43UWasx9yroVrOrv56ekxCTygeKUPAqR5UiexsX/V2ZydJRMV6RGxVL+XXHFaN88=
X-Gm-Gg: AYBFou1a/KjZnSuWR6BKCQNhsbF3g90+RW3xgu1H6D6Z2d0h1UlmAvd82VUl1JlOxyc
	qwYMX+tOg30eFMrVQvPxcHeIjdcF8cKHF2Iqctf6hc/0CtndH4JIxRHraQRL9tWMmLDypU9YFYQ
	2nymDrZn7CleXl6GYt5AnRtH03L5r4N3+fi9EyrTqlEWzVsfIdk/dWDLcUpAr80K6W+ejDOMA3f
	rJ9KGBjah7Ly/wdUUlNsMwm7SMDg9Z8afE7wQBYZjX6wjtQ2T1bxBQf9aNy4cCrlBY+fUjs8J4c
	8bwYTp0SVE0KfP1tovuyoJMoFgfD2sgJAdFjseKbfDonhgFO2/Dt3kc4baToi/9RwDkktVMpKVY
	U/hMjQoKzdCCeb+3/snheXBmSQfXkJ9R8R19N43lRyErBckqjFEb7KSnEcllIj4roTfEc8eTIST
	V7gRFtT1xgR0Sf9yoAtIWgSepvBNh0QW+7Y74Lus8yd0rch3P5gDeP4a9MAXTE1MdjfGvOnDu7X
	I845euxeu4/1hUsdZ90DXnOurkDsxdeWgcDlV3wHrXqPfPV/S2wGREo2tZaqCigX/QlfYRV7HgO
	bsOwm0j5QOg0dwL0GRe/4XPrjs3rWuo8cbDv0erfFLpmfX/X41m3A6J+SJ+ODpzeSVbA+NWaIS8
	wQ5w2hhybrRFyFgcHJouxdpBjmDp4G1rS
X-Received: by 2002:a05:6402:274d:b0:6b5:5ad6:2ff4 with SMTP id 4fb4d7f45d1cf-6b55ad63471mr4129137a12.28.1793874541906;
        Thu, 05 Nov 2026 02:29:01 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b5864a87c1sm278665a12.2.2026.11.05.02.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:29:01 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v3 0/3] Dongwoon DW9800K update patchset
Date: Thu, 05 Nov 2026 11:28:59 +0100
Message-Id: <20261105-b4-dw9800k_cleanup-v3-0-6850ee6a5a5a@fairphone.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGta7GoC/22Pyw6CMBBFf4V0bUlpeVhW/ochZloGqcrDFlBD+
 HcLxJ3Lmzn3nsxMHFqDjuTBTCxOxpmu9UEcAqJraK9ITekz4YynTEaMqpiWL3lk7H7RD4R27Cl
 TEjJIIoxiSXyxt1iZ9zZ6LvbsRnVDPaxLK1EbN3T2s1knvnI/QfxPMHHKaJokgmcCAIQ4VWBsX
 3cthrprSLHsFovP0X8w7GqiwCH198YMeTBlYUytjjy8fAEH5U4r9gAAAA==
X-Change-ID: 20260910-b4-dw9800k_cleanup-0b9a7a51e149
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793874541; l=1675;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=zYExRqYQL9Fc6YcansLrZhaOHhoc55JMwPP4XAEEjC0=;
 b=NMqoBXeKooo51DzMpMUBdJJltOpoY1I5G43h9htz6lWJ4sYgqEHve0DhWTrVM/Fd8WFpF6xne
 TW7IVn8hTfiBGFbmz5R0FwOiH0rghv7/vJyqvxu2p/8pxyLngfTY2aB
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

This patchset edits the dw9800k driver and related files, to properly
match previously mismatched register writes, variables, and logic now
that we have the datasheet for the dongwoon dw98900k.

This is a breaking change, but is necessary to ensure proper bindings
and driver behavior. The previous naive approach did not ensure proper
functionality with different device tree properties.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
Changes in v3:
- Added more detailed descriptions of the changes actually made
  to the driver.
- Reverted to using vcm-prescale attribute to avoid unneeded breaking
  with dtb.
- Link to v2: https://lore.kernel.org/r/20260914-b4-dw9800k_cleanup-v2-0-6553273aaa33@fairphone.com

Changes in v2:
- Expanded commit messages to be more verbose with their changes.
- Link to v1: https://lore.kernel.org/all/20260910-b4-dw9800k_cleanup-v1-0-608255ea61ab@fairphone.com

---
Griffin Kroah-Hartman (3):
      dt-bindings: media: i2c: dw9800: Redocument DW9800K
      media: i2c: dw9719: Update DW9800K driver
      arm64: dts: qcom: qcm6490-fairphone-fp5: Fix DW9800K support

 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts |  5 +-
 drivers/media/i2c/dw9719.c                         | 65 +++++++++++++---
 4 files changed, 150 insertions(+), 12 deletions(-)
---
base-commit: bc71431221f5ba8bb33918399552636e059c2c45
change-id: 20260910-b4-dw9800k_cleanup-0b9a7a51e149

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

