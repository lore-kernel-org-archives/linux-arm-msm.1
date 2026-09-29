Received: from mail-pj2-f39.google.com (mail-pj2-f39.google.com [74.125.227.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B94E501F5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 10:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790677915; cv=none; b=MPHK4eSo46UtHhjGSHSllyYt0NIYleydPMpvWzbLAgl995B1j1HviOXYIcRFmzDqx0UL8h/DDNNR4YZjwCBEi1jlJEITo9ynDIJDwAsEu8AJWE2Sx+pi1k3fnq6T5PsoNHerBlk6QXZVMcitp6P7YzoNq8oMWIn+cdZ6EVdDIqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790677915; c=relaxed/simple;
	bh=zMJUHsucbxjq4NjtcJvy7yWjMpFJmrb96fv6o4f/j6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tbGDBf9SpesSY3gOBCZgfjil8diKehA5Oyt4f7fsQwhIHUIVfPo9IdfmLOpX0ermsgwunSkmX+7MvzFSEfnPHeKNOEvl9trtpCLdy5uvWTcMlKgHcp/TIdEHRqWTVZhAbDQ3ulCVhCfRjnTZR4B2dafIJ/LrxTZ3ROQQy85os6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nHeTbbCk; arc=none smtp.client-ip=74.125.227.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nHeTbbCk"
Received: by mail-pj2-f39.google.com with SMTP id 98e67ed59e1d1-3a4a98a79b8so55160a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 03:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790677900; x=1791282700; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mOZ3VCO5u/56EZKo21VFCvm6Cf5PkOyX1nlTJy4NgO4=;
        b=nHeTbbCk7nE6C9UwCA2oW59VzTyQKrTk1TvKYGIy6kHp6hMdTq0JhaiAZH2yTjISTx
         cARBBDool2R2xHs/zhNUzrQgbFsBLBDoF8YtBWlGN50pRwpU6Oe9Y1JIiLPdwi4y1pMk
         U0fy6bFMeH+1b8pJQwWy2gnTHGja3I0xyr594pX/NZw4wvw7u+kwuW0z9PqQNiScVn5Q
         7qo9BiC+vkse0fcgEToRQfrJ7dB6zL8oIGCyqGyM3cNk/wz2r4tX5ubnqpH73wdljluS
         RVeFrwxPEclvIS0uB4dEfgBbrtHj3FIFIcpdKlYd78ZYNFgpg8URUGSWfh6S3PQnXIud
         nlmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790677900; x=1791282700;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mOZ3VCO5u/56EZKo21VFCvm6Cf5PkOyX1nlTJy4NgO4=;
        b=zFe4EgxKO5EV9yUXm+NiRiAL97DH4EklkMvNLLJKYIp6CeuGbW2mqVdt2yKhPezsmP
         0RbIIoMOfxL+4FZ9vG5pKtGfqyB+ec35OduXepgqDzJ9KpbWC8g4Vi6zpVhIVUCwOoaf
         BTPo1UAvv68boZM9sLDURuamXbodpPvBqpaA0OjtaHOjOMI1tEzzY4msJfnc6l4HerBX
         b5B4WdsSBd4zNvEMNzCVO5NXK+X2L6z0ZfQ7UTulBwWQNh58ZXT06diQzEZJs60FWTm9
         +QMXcB8yXBW4onT8JJjqErVuTPjusIkGjFeKHpPP5jsIW0xnshwJnFkch6/b3p2khpb0
         AMlw==
X-Gm-Message-State: AFq9FYJA7r5sgtpeR8/XozhZ+uZA+fsZwv1IKl1b4FGWebqsLL53pFP2
	xXHduM+1vkYCGCkcP78uwGeLLHpGoN5kpYYNCo6Zab+C0WfFbvhaH2Kt45ThjT9g
X-Gm-Gg: AYBFou3jrowXSkCMZBOUqzUUut1mQEu827MLHcTByGWSR0fzNlQFvxneBSLG6lQOh3A
	d+lXoVVCwSK0Ri/JsR2t8OUutOkOZB5nFdOzlnX31Eh0EpjwYVIMaD9DpY+wnbbQP9Z/EivgP5+
	egUs83/SgAffdJohPwU+LT/+hnQkeLc4BvGP2fjRMT/T/e4CSDzssRJe33tffdSxcS9XSakneDE
	afEF0pH1G2ue5LROZf6FI7o2QCHwA+T9jyP8nHV+6W6uuNePSyvVoP27P+zqmlpeBwWFJPlMCtV
	quEEwbaZUeRLGfqKav5QM9u3yny6geIAbXyd+inHxXZO49hO1iHaG63Pd4dYKpflThZOU4ZLUTH
	gwGNgOHXYmMaWqGMpqvJVjpQyS9Dszg+JOYFLWNd3mw4xm8KdIKgZjGyesvTIqZzIBiyywIrBwq
	CYKjjfCHsEzFe7B/c7Uo2JAEsclgvlO9vceKKuOxvBBkTWzWhLTLNEEMJV8FHMwwgyV0J3f2zFj
	UptPJOSZZ3Phg==
X-Received: by 2002:a17:90b:2547:b0:39d:e1f2:3400 with SMTP id 98e67ed59e1d1-3a0b263614cmr18497504a91.5.1790677899659;
        Tue, 29 Sep 2026 03:31:39 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc78791c3bdsm5901239a12.13.2026.09.29.03.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 03:31:39 -0700 (PDT)
From: Jianfeng Liu <liujianfeng1994@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: Jianfeng Liu <liujianfeng1994@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] Add support for Acer Swift SFA14-11
Date: Tue, 29 Sep 2026 18:30:25 +0800
Message-ID: <20260929103053.10241-1-liujianfeng1994@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for Acer Swift SFA14-11, a laptop based on the Qualcomm
X1E78100 SoC.

The following hardware has been tested and is working:

- NVMe SSD
- WiFi and Bluetooth (UART)
- USB-A ports
- USB-C port with DP alt mode
- eDP display with PWM backlight
- HDMI (via DP bridge)
- I2C HID keyboard and touchpad
- Audio: speakers, headphone jack, DP alt mode and HDMI
- GPU and video decoding
- Battery charging

Changes in v4:
- Update patch mail with commit changelog

Changes in v3:
- Change compatible string to acer,swift-sfa14-11.

Changes in v2:
- Add power-supply for the backlight (vreg_edp_bl), matching the T14s
  LCD variant
- Fix swapped vdda-phy/vdda-pll supplies on the QMP PHYs, matching the
  reference design (cf. commit 7c1d0ef2969e1 fixing the same issue on
  Purwa boards)

Jianfeng Liu (3):
  dt-bindings: arm: qcom: Add Acer Swift SFA14-11
  arm64: dts: qcom: Add Acer Swift SFA14-11
  firmware: qcom: scm: Allow QSEECOM on Acer Swift SFA14-11

 .../devicetree/bindings/arm/qcom.yaml         |    1 +
 arch/arm64/boot/dts/qcom/Makefile             |    2 +
 .../dts/qcom/x1e78100-acer-swift-sfa14-11.dts | 1521 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1525 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-swift-sfa14-11.dts

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
branch: sfa14-11-next-20260925

-- 
2.47.3

