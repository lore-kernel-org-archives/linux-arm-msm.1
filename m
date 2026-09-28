Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6089D49A3D6
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 10:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790591402; cv=none; b=kM+zLYCwzxLr5EJRyeLcenHpakc5jE3eqKXPDuuX2XAC2PES8GIw/mzmwAHfRJBODRVC97wxFcziZvIwTRkXvz/7SJfsvydnDqmeyCZV9HrZwElZLeL7eltJRm26ifD1AuU+CQJCet+e7I/moRaQoJmpZnN61FA7Z54KFXK+RG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790591402; c=relaxed/simple;
	bh=2glsE5Cmd5RFiqe/xfQlOTA4A7Rw4VEXRsQ+5/ZN5fY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rln918mSzHf33cKGlv13xvOw4QpdWdOdEzYLDU8g5clQdsUIV4Al/0iOP7W+V2NFR9aWFKD7URv8QfackgZoIq61oZEnubKAFCGYwVe/lnifG42TRHos7MjufP7S4DUk35vWXprXjmtU37TyBYwUgzZ/n9R4qZOcs0P9+ZePdpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Peqzom7y; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Peqzom7y"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0acc274baso224751a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790591401; x=1791196201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Twi5fQzle6f9n3uo368zx2Nqx5/BlakhNld/RfUfYA=;
        b=Peqzom7yIdPk1o81Zdm0ZZT3Wz9zef8acm/7PWcRgTkxNoe29w6v8u5ajOaa50BtIR
         1IqxWyO7QJWL5kSnBa6bPTMdvGgsACNFuEolioeVsq4a9BbOYjR0JxoACjpXU+kf3p/f
         Ju7cLiCop228J16IPfpTV/so+IncCoACpSnxow28ZvPn5WYc1R1UbVI6OPgDq+JxhWdz
         RvWgOy0UHrWuTUJAAbC/ScPSbxQorUNNB3I4z3uDRCxyEVEst8lYpnDHXbiwU1aSP8Ur
         4KkT1PaYj3SajfsqnbKxVPvGSKZWzs+WuRlZgsKOWar4as1iovo4VmB6i3g4HD0zM4uJ
         UmMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790591401; x=1791196201;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Twi5fQzle6f9n3uo368zx2Nqx5/BlakhNld/RfUfYA=;
        b=H/hF8NhTZLELHxsU3iuvR+Uy33E0vOEvW56geCCTMqmG5yFoMdIyc04D328e6P6g0+
         kVwI5+Vp4W3+7EXYOfe1hBIDffKo0mSnX5g4kpW7/4ekO40AfZTBeS0HrHXeR0Nj60bY
         iyKFj88/Mr3+/fH6GBNd8WhyxvdhQJGUIYoQihCu6zlcPXgoMm5Gt6HhG2GZUt1BmVvF
         y1S/ZuVpVcWL1/0tEEIXDT/LUxP5/uncopwAxdJYdX0E+vJ+X9yl4aRn+Hf2aT+0wP9p
         3IqbCM7En1nuU4KKZ6Y1Lglb/tlVL2iLoE+Z7DEWI6UzkS6eoeudAc8obnhn1U+PeZpp
         IzHA==
X-Gm-Message-State: AFq9FYKvaTChPBpup4nqcQRF2+3oAWRghG/XffL7d5Y8zC/VGwFFb1vY
	ksj22i+n45Jm3aQh8+I9R9k96SXoIpA8IfnRaIezJXS0817PHRkAtEmK4mo4o2Gj
X-Gm-Gg: AYBFou06kX/CT7+bU8TUMEgELtUD9S4SYdc6M7flxx5DNyKEUh9/YW9Feab7PtJOn15
	xROIjqdBDSzvsoKkLWJNJXeW6cu6Pu1oQ+oCns62KsrHKLVC+Zyi4rBxWLC9MwLMZtty3q2xbv+
	sJJ6YFDGLqtJlBS2QP6zbNG912vYoUSRUP4YIsI5psoZwLW9m4f37gR9EY5YqhseHy4CkmZBj4L
	DK4Iredng1KDnFO+Y9MKapGVkiOqKwXrtoKZBpWsUxUyvkimAeoHmUHzf7/NkK5bnD1qtZBbp7b
	CDODKbm+zRjui749D/uVKdIPIeKQHt3ezfumwD8Q2mnQ00O3x4rpJTFYH3jp8gYETzcIMo6FzVd
	rep/rLJjt7bMGEYWCwiqL4ZzM43OQnEiGep2v3JlkoZf9juCW5nn8IPPnkzaeQ+Go48YaN1POKY
	fdLK1Y5efnCc60p/7PZ1rQ6v8gI4WRtHUbKjb2y64/BV+bTIy+xfbQ+nN0GNnm3H8+4k9en3zkR
	DQUIxvCNyunxg==
X-Received: by 2002:a17:90b:4c81:b0:39e:3728:3b11 with SMTP id 98e67ed59e1d1-3a0b2507f4cmr14034686a91.3.1790591400646;
        Mon, 28 Sep 2026 03:30:00 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9355e49sm20234282a91.4.2026.09.28.03.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 03:30:00 -0700 (PDT)
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
Subject: [PATCH v3 0/3] Add support for Acer Swift SFA14-11
Date: Mon, 28 Sep 2026 18:29:40 +0800
Message-ID: <20260928102951.18369-1-liujianfeng1994@gmail.com>
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

