Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660760;
	b=XoaI1g6+uZ01cUDlXc8UstMhKGvhBeWMQoeqGP+e4JbUoNobpNYLpnpZ1KJ/X6CQFH+J
	 2kdKWlyO7Iw4Ej7eqfM+ho8OPb/ZwlFxk6TthMOhGdT02pPPPHL/Gt2LS+Z1Mne+nZs1s
	 +scabsT1uTRmY3ATywDRlfVQClPa4aIhmYETDiOslivBX53VVYN4oQf/usaGRP2BvQI0D
	 ULQE4aaaKM0udk16DqROQa/UZCg3oVP4t8HU7vuDlyCUKv1sgInI0PSZquycgWquidtf/
	 fbzsEr8Cb+SR1Ws6m3aGJCeRm9tYeCRm+VqYcBIAv1TLPNCKunElBgHJaSbajNxSiZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660760;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=x8jM4tAINOfg6rs5A/OqB01VfXYqFURFLCrahQ+gFPg=;
	b=4mtMP9rlrDKd3DzALQ+AotAdj8Yu/fZrfF6Dur8AU01+GNW7MzEibi2IL1yqV0jmdLAU
	 FEXw9W3y1DzcASWtOrTk/Oc/ekPcCFoEXEbKcmTeSw6fCFTV/6lSG4qX+qdXMGQfO1NZN
	 tyo16CLweBX5dVAISQ0ZJci4GSzRhvjvBp6V8JjxcvBoj3vnKd2orMoRlSN9nGKBQEzzx
	 zbRNFtW8xVddY+VSfLuo5yr/WWrw/f32Ov6WibDb455XAxaqvrxKA6o2KLLCg7zWq4aUq
	 IJ96BwTisni7u1BAK+8L9rfoOJsVnhIE80HZm7Yv5sr2PULi12EUAVSfVzKcBrSftmA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=XdFZXixA;
	arc=none smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BD5606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:19:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94BD5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=XdFZXixA
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c4682977f9aso151111366b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1792660758; x=1793265558; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x8jM4tAINOfg6rs5A/OqB01VfXYqFURFLCrahQ+gFPg=;
        b=XdFZXixAP3+1xIqY19/pqmBDJ0RWMabLR5crxFylDucQM0LfrtTJ3IvNWyXLNulwAW
         LWjaTt/NwVpCvEV/Cld+WAICdUHyvhfhunyyn6CSy6hhnyrPR9cY2Lpoj7HMFzJbjUJH
         pItVH3nhGL6vFiJRC1ESOPfvzgIepgzPk5zS/SPOC4H8xov/KpBmnt7WgoHe5nwbRp7d
         oQSRfk240nnZbeSIIeRNz3gQzgqk98dudyxpvENRsSVkwJyYi2DIgKCRrZAqPBN5s1VE
         amgTaHVi6B1dBaPFMUmsXTJKshCrGbHc9hWOC+GQqEAMllqXJ3/dI5qYPcANx0Q8qUOD
         YN6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660758; x=1793265558;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=x8jM4tAINOfg6rs5A/OqB01VfXYqFURFLCrahQ+gFPg=;
        b=pMNDTJiLSXVcozvDjVRICMZnZA3Kq3b0bTL5jGLtgeM/qAcCgfpLa2LcX7oqU167md
         Y2E1gEgAOFSYEcLIGgXDAqU6wTKsqyu+YshhdE/mCVKr1zOhAk2/lj1HJTR6sChJ19Yo
         w7Jn1fXFw6iaGn1QH4CiLLPT3wgZMmQA89nIHwX5iYrOPSMONoKi5fi5I0W6HMm20SA6
         BjkrqJn0gF15I13tKiGxfELZTaK8IFTbBa473K9y+ye6LWdLyeQj8ZSTFMrHRD+c8Ttq
         MQCCEaFl33nsgZkSz041Mq5TFpQwJjHa6uzlNwwNlPlWTOX870mQPmDQBhdQdUL1Z0To
         3OmQ==
X-Forwarded-Encrypted: i=1; AKwUvByQb7TxRm5zQN+3BxQFmCYmxhZ8oXDQuVfCW85f1XX0dOZIOVlYYzVQ99N1S1a0p4lITcjXa6SZhvluB+v6@vger.kernel.org
X-Gm-Message-State: AFq9FYJp+VT9S7A8Oyd54zPQC3dtrpLUTcwgd/Vy5tA1wrS4wSUvEPwS
	IjbvO6W/NjF+fTuJOKrfIXhXIkWgk5f8cBgHPApLXTFPlS6bbQvx3Ng+ux82hRQvGgM=
X-Gm-Gg: AYBFou0z6e/sSpEFtD8iPpvRGu/IX8QAkEPpdGuWnveJOGioVkdpEa/IptqQSk0ssJY
	RDPuSunKHYWTmMPieDGXJnLrimCFc0G/mcbq73PQhv2S4BOg0ag/MNe+MkgfqmkU+eJLQPIXZNL
	U7gLgYTD/4VfQLhX7npIYzt4icWtrfeMfHrCbOfwepHDwKs48I4dSCKfcUUCNcHzwL5s482yTao
	UnGffRpfdKruGGwlEhv4ZvKC+/jE/UYXdKFf9LQtDw8utwWOQlIk8LUnrnWJn5blm25us79pBnk
	Rji5k1OX4Vfx9MhqJVfK2vze1siPfbDGZ35ylawKMnqTT8OHQCgkIGXQUHht8wVckqTOiU4UD4a
	XfT0EXDU4Tadwmgcsa1a/ZugG3kLPLYEWoGxxSP4D870fGjRxSM1VtyEJ8pCBHIkbTWMDF/aEnr
	jCwkYnqdWFSPN6E6t6DmSQVkNErlLKSZ7NjvafEDoMqAMFmojdRXrK/eY1a5cFLUSASwwmHXTET
	idKBwDiG8AhC9JPqr4kfozRv+jdwgkLXLpaT5rrhst+O90sWsSP7/fldV4V0WqXJmyZSvanK+Tv
	s9XoNyP2i5Mr68CCpt1j9ptXknNuNZATNt3860eu3oZi3UaqF4206EViXMNir/5K52yVoWm62GR
	rD8Yw/TqetNn2iE3tPPA+z6XXUbe8HvNgKPAwwAZoj2ma9vYEKNgqgL4ZB3r2J5+jzdq27A9Lzt
	Exhu9fRTKzVYQOcg==
X-Received: by 2002:a17:907:1b0e:b0:c3e:f39b:2296 with SMTP id a640c23a62f3a-c4679620f94mr494323166b.31.1792660757898;
        Thu, 22 Oct 2026 02:19:17 -0700 (PDT)
Received: from 2001-1c08-080f-fd00-57f9-c36c-aa93-fd36.cable.dynamic.v6.ziggo.nl (2001-1c08-080f-fd00-6fe5-b143-671a-f202.cable.dynamic.v6.ziggo.nl. [2001:1c08:80f:fd00:6fe5:b143:671a:f202])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a50aa01sm85790866b.22.2026.10.22.02.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:19:17 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Subject: [PATCH v3 0/4] AW8695 haptic driver.
Date: Thu, 22 Oct 2026 11:19:14 +0200
Message-Id: <20261022-aw8695_haptic_fp4_driver-v3-0-ac8c14377e82@fairphone.com>
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
X-B4-Tracking: v=1; b=H4sIABLV2WoC/32OQW6DMBBFr4K8riMPNjbOqveoKmRgKLMIkDF1W
 0XcvY4jdVGpXb7Rn/f/TURkwijO1U0wJoq0Lhn0UyWGOSxvKGnMLGpVW+XAyvDRWt90c9h2Grp
 pM93IlJCl9s5oQO+sbkV+3xgn+izql9cHM17fc8P+OIo+RJTDernQfq6SO2nJgxP37ExxX/mrr
 EpQwmWAB/P3gARSSWjs5BqTgz48T4F4m9cFT7mliFP9IwOl4B9ZfZf1o2578EaP+Ft2HMc3/bR
 PzD0BAAA=
X-Change-ID: 20260716-aw8695_haptic_fp4_driver-397431e97638
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792660757; l=1833;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=CeRNtKXwj6aaH+FnAhN1LCI5wbPc6KwuhA86xbBDykc=;
 b=eNrI3Wlge9SCKhzCcm+PxA35epMAcHqYm/Df48RSkdmGmgrSpp0fkkl+DYQ5Rl98R7KcvsnWB
 kPzCfRn6rVqBYF8l+Vq4D/stBObWcSYlb5RtMptUR7WNU0qh1YZODAr
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

Clean-up of the aw8695 haptic driver patchset that was sent in 2022.
Variables dependant on devicetree have been hardcoded, and unnecessary
functions have been removed.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v3:
- Removed potential race condition in power management.
- Fixed dt-bindings.
- Added MAINTAINERS entry for the aw869* family of haptic drivers.
- Link to v2: https://lore.kernel.org/r/20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com

Changes in v2:
- Added power management.
- Reformatted DTB schema.
- Removed unnecessary IRQ dev_dbg messages.
- Changed reset pin bias to pull-up.
- Changed error handling to reflect subsystem style guidelines.
- Link to v1: https://lore.kernel.org/r/20260914-aw8695_haptic_fp4_driver-v1-0-156f7549149a@fairphone.com

---
Griffin Kroah-Hartman (2):
      dt-bindings: input: Add compatibility for Awinic AW8695
      MAINTAINERS: add entry for AWINIC haptic driver family

Luca Weiss (2):
      Input - aw8695: Add driver for AW8695 haptics
      arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695 haptics

 .../devicetree/bindings/input/awinic,aw86927.yaml  |   4 +-
 MAINTAINERS                                        |   6 +
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts  |  26 +-
 drivers/input/misc/Kconfig                         |  11 +
 drivers/input/misc/Makefile                        |   1 +
 drivers/input/misc/aw8695.c                        | 805 +++++++++++++++++++++
 6 files changed, 851 insertions(+), 2 deletions(-)
---
base-commit: ec8bf8280261294a9b9b4520414b42704c7f9f6b
change-id: 20260716-aw8695_haptic_fp4_driver-397431e97638

Best regards,
-- 
Griffin Kroah-Hartman <griffin.kroah@fairphone.com>

