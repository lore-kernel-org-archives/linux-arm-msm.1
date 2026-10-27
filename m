Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793087504;
	b=JCUTnBkbjQWSfYCB850uX7EoYVYD39NDJ1FfM4duhUOiS18KYAWuoFdsr4dO0A66FieI
	 bWz0acWrhdH9lHWmPkJIM593J3xtELKK1XRz3QmKyKukzFQ9dDm6GqnwnG8Lmgsgh30qy
	 zjtSZXPPi7ThF50wSn5o1BQtb1A+k31gqPFiWQYNL2dGKp7ogOCwLwpe+q57zA6wil3Am
	 2ULsPaMZr3JvJIqUTVmNxA23FPlqGxkA/qsJr0ZxiKTos9wmDarfPq9sZJjjQvN4ZbODl
	 ZqVLIFKO/bUfyKgoxJL1AJ3x5CHeb+j1z+JGUcq0lyBElnZstNWOMH/7J/Z4uGF4tSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793087504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=acnStiLnhMHoFtH9MxN6320P5itUUR4d4HGEJJqetkY=;
	b=WHBIDGxi0f5TqHkfw0ln46ZGxE8V5rBljkl+k2lZtJFMLLiNz1g+nbQ+GDlufM5m1F8Q
	 wLpMJg8zPLyKbN3gaY4wQvfhgj/7bAbmKbIhT6eMVTpZhU4YMc2Pq83mmrDXmk48FkGTX
	 mvEL4Wz2KK26nbJtxb8JqsOwAESs9GFhWvV77rKG0dxhVHV096EQLYveAbq8T1Z4NuBqE
	 uS9efGwD+UGi7hyk3KwnlNsGsm3Sdq+Le6jSEpGYA6Ft0p2Rs32wIvm1Yl7RaoCdCr1rv
	 R8FtQcf7qg2vXS7lUQLu38HBFGzkahvJ9LnC8YtPldBGJ/Ei/Ki2BCdtDOnlyfFRYZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsuF8IBF;
	arc=none smtp.remote-ip=209.85.215.178
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20773606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 07:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20773606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EsuF8IBF
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-cd6a7e1f4e4so1389738a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 00:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793087503; x=1793692303; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=acnStiLnhMHoFtH9MxN6320P5itUUR4d4HGEJJqetkY=;
        b=EsuF8IBFEyWcx92BGt0MefrirPegPiY5VvVfx0NRbT1NBCbqvuXxVtodUpzbjZ/OK8
         CKVrL2M/UxNsGf9+j3FBShQCCgKymDyDn2TrlM4ZBGsvtLBmPKPlA5z2lr7xH5QHXYBi
         FZEyuspH0U7Jph7qDwuf+M8lxutNE3bF7zqA7rJWOSoWerCgxAmdatquMPmsit+2A5U9
         gIdnxXhwfjEG5KCSbiImFm+bpQk9zCld3WhSjM/WEdxzAL23vvz2InTpPRYXUmRLyN3B
         Lr4T1wfVdvOnTcovr0hU8Lt2UeYWgfcKW2ZQx+TrA3lvwKF0AMzPPan8H4YCiglETX/A
         4ZrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793087503; x=1793692303;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acnStiLnhMHoFtH9MxN6320P5itUUR4d4HGEJJqetkY=;
        b=YVGPT0eDQ13LCb19pUlUpRNSVDuHYOHOvbGcuBJhBk185Y9xMGzAyK8uw0WcUipGkR
         oEfk5xjiHB5iThpy6h4gj7+Anmq7TjxvmtFJluPwV+A5cPQeStxPpPldQJ6KCej0fJNg
         NYxY8M38JIqN6AuxgdhSQ/o7lgJ9uFzuBhImv6fHSYT4mtXPa7g/pdSAOBVe/KsBbeVs
         toh+yxk9I1ETtXhRhiJBuW0F21vxJf3sWDZrOOMP8EWgn1/4qLuROABXmxlk4neuumEm
         O3dIotEVJjOP1GOF4cUHn8JjHGgP5yL/tBKdIpU1XCSrRek3XnlQftKm79hcWcEjP9jY
         791w==
X-Forwarded-Encrypted: i=1; AKwUvByBDnJpHJeIV1AeEvy1N7YwkTeBJkgpP5zAe0/82/QQu1D5rVpGP6wFmq2fq4yGUaaOJSSv7YP+FOiPbb5s@vger.kernel.org
X-Gm-Message-State: AFq9FYK3QDbftZgco4DbDyQFzwq39KnKdF+hAVjcGmEbiaM09kRSEVaf
	b+gmgESaNwBHn31YqsXfa3DnJxEXNA7YHMybgmF1EaS1IdKIElnTmXHs
X-Gm-Gg: AYBFou13e6DU/3p7cc9A5vH+y4cFYksCPaMFrHzZpHYRsU0LqKUophYqNy2zJ9ri/lX
	VgQOyWxY5Isrp104ucAOc+AuxSEdSt7EEDtI6UbWh/GftVyW+/91ThWlB7pD9OsjcD8qS0KSQC/
	a+PWxP+PyyEyS6Gy4G/pXndVRj3YL6ns7Ssn3oIPl7E95kjynYiQkuHOO00XL7dv/LCSuEcSTYb
	10STEXvexAxJMZI63/uI0GhjId+j1dxSth4bsokUis+Nw5ERDOIh/JJCz1K4KnHKEvqgBZqtiiw
	iXKJTiEbUpKhmS/1NBHxRPfHJm/CDeDThQr1RxC6POXLQQgCzkz49RXo5mQpJc+AUB/aVw5+sAt
	R6ftGFwqtbP80RjIMb879PrAnXzRBfbaYr8u3SdbznuaP3Gp4y/+E1ZhJGk5WUH00oysZt1CK/Y
	MYCbQvdCdKkXNDS1Aoasg2b++fDndB96bRUkAOG5qGWDHysDF1i4S+fDEMiescxngatu077OX5e
	4I+w4v5ToIfs76qshB+BCOe+OQWw91odGFiHJZ017ItCuJJWRQSSJj52gHUjCVJnymSTXR+U0Ii
	pWHX
X-Received: by 2002:a17:90b:52c4:b0:3a4:8c41:fab6 with SMTP id 98e67ed59e1d1-3adead50adamr7301154a91.46.1793087503455;
        Tue, 27 Oct 2026 00:51:43 -0700 (PDT)
Received: from debian.lan ([121.101.131.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614d7dsm2542311a91.3.2026.10.27.00.51.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 00:51:43 -0700 (PDT)
From: Amir Hanip <killdeath104@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-arm-msm@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Amir Hanip <killdeath104@gmail.com>
Subject: [PATCH v1 0/2] arm64: dts: qcom: Add Xiaomi Poco M3 (citrus)
Date: Tue, 27 Oct 2026 14:51:14 +0700
Message-ID: <20261027075116.41673-1-killdeath104@gmail.com>
X-Mailer: git-send-email 2.47.3
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

This series adds initial support for the Xiaomi Poco M3 (codename
citrus), a smartphone based on the Qualcomm Snapdragon 662 (SM6115).

Currently working:
- UFS and microSD
- USB host (OTG), limited to high-speed (SuperSpeed is untested)
- WiFi
- Bluetooth
- Remoteprocs (ADSP, CDSP and modem)

The memory map for the ADSP, CDSP, IPA and GPU regions differs from
the SM6115 defaults and follows the layout of the stock firmware.

Not included yet: the display panel, touchscreen and the GPU display
pipeline, which depend on drivers that are not upstream. Until then
the display is only available through simple-framebuffer. Audio is
not included either.

Firmware and userspace: WiFi, Bluetooth and the remoteprocs need
device-specific firmware which is not part of this series. WiFi
additionally needs qrtr, tqftpserv and rmtfs running in userspace,
and the Bluetooth controller needs its BD address set from userspace.

Tested on a Poco M3 booted from microSD with a v7.2-based kernel.
The series is based on qcom/for-next and passes W=1 and
CHECK_DTBS=y for qcom/sm6115-xiaomi-citrus.dtb.

Amir Hanip (2):
  dt-bindings: arm: qcom: Document Xiaomi Poco M3
  arm64: dts: qcom: Add Xiaomi Poco M3

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6115-xiaomi-citrus.dts    | 516 ++++++++++++++++++
 3 files changed, 518 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6115-xiaomi-citrus.dts


base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
-- 
2.47.3

