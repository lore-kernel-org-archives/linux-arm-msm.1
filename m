Received: from mail-qk2-f13.google.com (mail-qk2-f13.google.com [74.125.230.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1A23F9A1A
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 03:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789441844; cv=none; b=HTgjHbwataAIoQut0MsQ3tyAkWsjtKBqAf34ln+AaekqEi3L8pkf5eic5LCN7L/bHX8pfS4gULv2+2d7fbeXwSo0KU0uceG1quoJQstpeiFpij7uXoR+y7QR2wwZKJIbogAuClgJR/qHIh1EQjpI3C748P8eN1K0QytGvwIj8DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789441844; c=relaxed/simple;
	bh=f7Iqm23CyhCZNlQSgebFwaEFnlASpLDGTdD+2Mkgv+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tu6EWdORkGOI5UXIJDjLSQQlXCTRyvL87IbeMX+ou5R9WYronrOrDUI/b8fMVxRk6ngdaGlUY09/cErNCP6PRWO5+dBmPkRlXh7HqdJwgN0XDJVvzmuhS9Akwg4/ZLKhYRgGtXVG+BqlRorQQexFqAKY4AXTRTKdVhzUxPKfEGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=Aqct1f6s; arc=none smtp.client-ip=74.125.230.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="Aqct1f6s"
Received: by mail-qk2-f13.google.com with SMTP id d75a77b69052e-530e2f50d01so34111551cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 20:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789441842; x=1790046642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YKF9FJ3sfZcV6ZcqIr7QU8JMz0GcZ7UOcl6ndWiktF8=;
        b=Aqct1f6sH9d1/GpE3gqjmQYrRSIij4gsXYiEUWF4QZIYa8YmmUWqqw0zFKn3q1E5Ns
         hHff7zcaWFDTNzq3vmlxax6FJu0JebP7XQDRzcbmafCHdxEGiGfp7AMp4jWt8P8VNJF3
         JeLbodxr1j7nKoNS75lbXaXb2WCApj1gBb6JMEMUjNsdO64PyZQoQ70Q017qHrEhQUw1
         +c8eKQ03JWKMOo1PB0CmMs6HPin0fVrJGEi+Z7MYm7Fhz+GY7AC8RaLspwMsj/P27D0p
         W6YLSfQaj58riIqnqQlM3YCJYz/lgsMjrTazIUFjUYbetBLJ/hidhwRgVaDd03qMGD4O
         bxRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789441842; x=1790046642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YKF9FJ3sfZcV6ZcqIr7QU8JMz0GcZ7UOcl6ndWiktF8=;
        b=xpR38AL3XYQoO8o018hxLM+n7u0Vtu1IDbkS9RvGJVzAHNCpjZbobCWqtv5aJiwBGp
         9dSpK4EU7YzGvN1gRSJMx0oSaZBJa6jm+FmVUM8QE1hlRugQQ2Aq0p4yLtewAeoSDDg0
         bMSnGdEIzJXUz9iO5tYlZG9yGQdfDd2UNvQkMFJPz9TTdmYWeYLyVQHuG1J9/jZoS3jY
         G6V2G3A19PGBWrb/IHBTzL+4mV194VaJ9WUE5FOFAl3gh3vEkTk/gRQy+f+Vid8nmkmA
         BBrvtHHUvAG1KJAnBGW/WvNIFKEwMQMYgySjEcLbK1ZgFMDrM5XopCdCaBtiRG3/Mifr
         Lg3Q==
X-Forwarded-Encrypted: i=1; AKwUvBwUnlqd70BKoT+gYehTXFJW7pKvqpfoOhYDH83I5EWqvad9v/JtppTMp6ANRZkABBRocJgWqNlGvjYZg5Ig@vger.kernel.org
X-Gm-Message-State: AFuF++ksW6wHGH27oKQwdr+xcD5DlqDO7NdLMhoiM8Jle/A5wpO4tyDA
	A7m8q+lTgaTeo8QURsEPf+gzrid5v4pZVqsD2c+e/YvqULC0MC4SdYpbm0B0DiamQxw=
X-Gm-Gg: AYBFou10eV7Hxh4qjgU6AEwjRjygfUSk4nCCCh0TvkfESrW0GALFhX2JVihcHTEt7Va
	20oa4jGwp4XqVPU6fBeyThQDBj6LOBQ1E14dT5TOdiDjwuIOaZJJyWLefIjjrQ4fvl8tJs7HwmY
	mxmHcIQKw+O9esAR5Og3ZPwlngcc6/++Xg/bR0iZV+tKS7QQvp48aslSzznW1nR2CrhQJq/+ZFK
	k7t5lnZfPxZ5nFTz60OkPd04ebIGHrH3DMOraOVX5C9Q5oLqeR5RhCir6+H97i1BqEC9sPU8Jfp
	/i9TjwZPXub6IzkdQp4VHKhWaDFEF5Q/xp+fGsVtGNJcUC0Gjn1FaSuw9DtQDQys+d03VXbOU2E
	qTxTH0oCkXW9p8qipxATYMVPEwDiuESmr9D97I8YIf3U8UR9fi/dtEhR0O5fcWW9vHXUXrvth5/
	IMGdXFKzt5vRcKOFw0icJUnCwG02Bwj5poTxY8FK8JmaZpQvHm8zV0jX6WWYZmmC+0rD6ePaG78
	+E=
X-Received: by 2002:a05:622a:2285:b0:530:fe26:50c8 with SMTP id d75a77b69052e-5310d0308c1mr80574991cf.39.1789441842008;
        Mon, 14 Sep 2026 20:10:42 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ce4ec298sm118563841cf.16.2026.09.14.20.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 20:10:41 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	arnd@arndb.de,
	gregkh@linuxfoundation.org,
	bhelgaas@google.com,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohdayaa@qti.qualcomm.com,
	lbiancon@qti.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] PCI: introduce TC9564 misc driver
Date: Mon, 14 Sep 2026 22:10:34 -0500
Message-ID: <20260915031038.1087264-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Toshiba TC9564 is specialized SoC that implements a PCIe switch as
well as an Ethernet AVB/TSN bridge.  It also implements other functions,
including a reset and clock controller, an address translation unit, and
a few other devices.  PCIe BARs provide access to registers that manage
these IP blocks, and the SoC is modeled using a PCI endpoint bus in
devicetree.  This allows the IP blocks to be bound to platform drivers
using MMIO through the PCI BARs.

This series introduces the simple PCI driver necessary to implement the
PCI endpoint bus.  It enables the device, enables master access, and
then scans the devicetree subnodes to discover any devices defined
within the endpoint buses.

The driver is placed in the "misc" directory, following the practice
of other PCI endpoint bus drivers.

					-Alex

Note: to work correctly, this series depends on this:
  https://lore.kernel.org/lkml/20260910021919.3421449-1-elder@riscstar.com/

Between version 1 and version 2:
- Updated the block diagram in the binding to include BAR2 and SRAM
- Use KBUILD_MODNAME for the driver name
- Removed bogus initialization of pci_driver->driver field
- Added the third patch, which defines pci-ep-bus DTS information.
- Now based on the Qualcomm for-next branch

Version 1 is available here:
  https://lore.kernel.org/lkml/20260813222943.1655453-1-elder@riscstar.com/


Alex Elder (3):
  dt-bindings: misc: introduce pci1179,0220.yaml
  misc: tc9564: introduce base PCI driver
  arm64: dts: qcom: qcs6490-rb3gen2: add endpoint buses

 .../bindings/misc/pci1179,0220.yaml           | 154 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  30 ++++
 drivers/misc/Kconfig                          |  10 ++
 drivers/misc/Makefile                         |   1 +
 drivers/misc/tc9564-pci.c                     |  83 ++++++++++
 drivers/pci/quirks.c                          |   1 +
 7 files changed, 286 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 create mode 100644 drivers/misc/tc9564-pci.c


base-commit: 27b3028b7d65cbc44fc5b60d2e977ce55cf186f1
-- 
2.53.0

