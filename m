Received: from mail-pj2-f29.google.com (mail-pj2-f29.google.com [74.125.227.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C9541A547
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 08:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790238817; cv=none; b=N1Ewj50L0Ik1o5sH04lYsdNHdPzMigcI5tscuK3BUCe0WKFcdL0rhEBz18h/rpwBGWwdH1fRIAppvBNetQPLq6O9iVfmG+SeF9Q0ktvJedefMFMsQZBYHa371zUlnI6hTEzX6I8yC6dgpZlL+82NOgAsQ5XR9m22FefTIwoOKLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790238817; c=relaxed/simple;
	bh=v280c1RxbyJ9BV/xpVpTa4hpsphXrn4DypoxkbjZ5SE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NyX9ZpZN3D4ccxhw4AghCVxivwsy3optExInhX98/Js5ZEwldjgEJOudjWA0L3UntpRQAzXbhm5FgEH3/5bUU5+3b9CYAkkaUyO2rJQfAYG/TmR8Y3RQAQni7bRDJAph+VqGYeriJ56YKvxWPPUh1751oy0dWplQwRCkEOQ1LvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etujzTUN; arc=none smtp.client-ip=74.125.227.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etujzTUN"
Received: by mail-pj2-f29.google.com with SMTP id d9443c01a7336-2dd4ef687f5so1051045ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 01:33:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790238815; x=1790843615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cSk5us1+Cj8LsuotFx3JDoY747soUfy3AbLSDbj7948=;
        b=etujzTUN8IhuQh4YukHgFFkaR1wP9/0e2/CcMxE6jGr5XwWsCu61bS3a/AgVdkl7Jo
         iu3Yp5qH69KGB0aRupmWvGMobdzSi8XSbEmDfN+fYjDMkT/YlSpsIEO69wjwolabXbH7
         jhpHAgVih/ebeWDiTkzWAwS9NKK4Q45Jj/atkRcNUWmijBKPWSYhDBosnCexuMLm+4Yr
         iM19r2QOonWvi5KdKMWvfBQj37qm0lwKaraKFYQ7lphVn3EwNKXvkJg+ljtPqsmIHKz7
         4a6yHPogWt1nXQG0gqBhRnKyvusMHlsi9ZvDsXKM+rwdA6ij9WG8Mkw8XrIlc0hEUxQG
         TePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790238815; x=1790843615;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cSk5us1+Cj8LsuotFx3JDoY747soUfy3AbLSDbj7948=;
        b=bUK3jYC5ZEr/pojjYeNYXv+PLEuCL8S/pj1dvQLkmrZqNOBDYUKK4+IjcldnRW7SO7
         OeTkNT69sn/GVJ6F3YePnJnxCIB9GAvyZt8DYn5FkqvK6hFFfnHI+aRAj9aNJJkNtkvQ
         okOaw6t/+J5KX/hz5d6fn3ZS/WtGqVRBHfqvslDmRe4ijd1vgcSMzNQmpdHbOZee3ghP
         rpLpeOZL70pItlVl5rhOfxtOf3Dcl7/+N0XO/e4jugOgZm/ykQzJ69rQVeuQNIzzX51Q
         R/Qw0hs5XjPo/ITDq/mtxnlnEcQeBvjMT/ryiectxQ5GTVjo5QDtmBzOzitGTsabM21P
         b5mQ==
X-Gm-Message-State: AFuF++nImje/YWQf8DGW0w7LXeULZ9hj9UvDI+qWMJGA+j9NEd3jmjTY
	a3EPHcs3Z6B8zUa4uw9CibmWK2GsAyctBVIPtujWKnZ5ytpTGqU8c/bVdnzbpw==
X-Gm-Gg: AYBFou3C+pJw0DscZK7kmg5off0AOsmHbBjzS5T4C3HbgsDKqX8yh8DFm8LiBwtgukr
	11yLpK17taxlGw9uH0BXYMFuwsGUhkjcldxm7qM7roELOVNvXv8lNaRqn7VUMr7ewbS3/GemQRn
	kA6eqeYhvf/9pKY8gqMldHLM9MnacgmYPCUU4kp7VAFkvQoWSuHVWnG0RcumhkPpw2HlcNGOyJc
	8upP/Zgib7WUp+ou7cEZg7anxtx4c6v1dCGG4xhHG9XOR3p6LRzvMT/1jUVd2LZfQiLN80fq5Ue
	7+qIVhYCY87OXOa9je7VgT0Mxbv933TaplikfkRkJ4VeBNoOLy14J5J727mlUoL/1u/v69JWXJN
	EcWLBpXTWxjjnuAHIb3bI4ZU9FYLDJaZDdaH9iRHN1YuZQS4rfjdyMxYngivYf86R1/72ou14N7
	afcpYk+Io+p8rYbp33gMovTHPGzl/Ct2diorqNSmj77VXJNdYb9Dsn2KcObOYEhnZYbagW7PaRZ
	gHuTzESMg01HjFRgP6RlmDj
X-Received: by 2002:a17:903:19ec:b0:2dd:8b95:d8f6 with SMTP id d9443c01a7336-2df7da60bd3mr24906105ad.1.1790238810313;
        Thu, 24 Sep 2026 01:33:30 -0700 (PDT)
Received: from jfliu-sfa1411.. ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a516d8asm22659015ad.9.2026.09.24.01.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 01:33:29 -0700 (PDT)
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
Subject: [PATCH v2 0/3] Add support for Acer Swift SFA14-11
Date: Thu, 24 Sep 2026 16:33:00 +0800
Message-ID: <20260924083321.33129-1-liujianfeng1994@gmail.com>
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

Note on the compatible string: There are two names:
- Swift SFA14-11[1]
- SFA14-11[2]
from the support site of acer.com, but the UEFI firmware reports the
Product Name as SFA14-11. The compatible string follows the firmware
("acer,sfa14-11"), while the model string uses "Acer Swift SFA14-11"
for readability.

[1] https://www.acer.com/au-en/support/product-support/Swift_SFA14-11
[2] https://www.acer.com/au-en/support/product-support/SFA14-11

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
 .../boot/dts/qcom/x1e78100-acer-sfa14-11.dts  | 1521 +++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |    1 +
 4 files changed, 1525 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e78100-acer-sfa14-11.dts

---
base-commit: 5c4d4169604b335c38bbc79bc1fc03042981fc6f
branch: sfa14-11-next-20260921

-- 
2.47.3

