Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0B5012B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 15:27:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789745229; cv=none; b=LdztHM01sZZLRhFxEzjyLlQhkEX2PLkZnB7HhSJrh/uevmeD5KKXXafEh8y0RQr7woCOzLfqDsYAZ20nZBHF+CMIipj5VpQWetKW35V9qPkw8+AxbwG21mbfqzJhwHgGqhkKZWwOGPSvlUvN97N+HCQ20mttql7FmLZSBPWhOes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789745229; c=relaxed/simple;
	bh=tOkptr9BfaVbCrQV52uaZxAry7CyPs7yjJOjLHqMWBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i5YcubX5KQagFLyJ7jgM4QkdgRNEib9tPC/5bGW2IrnOxj66HOj830qLInsS9nggISRdHdUsNRa2WaTbEFgUmDJLZf6fdPR+Axe6Sa9GT0u7TVxjkLAFAxnA2WNznHCNOoblChistjlGFH5vkWGSeAWIh97EBmDfzg/YwWQoEfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=S+5GN6xv; arc=none smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="S+5GN6xv"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-90cdfcc3e14so3309226d6.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 08:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789745224; x=1790350024; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ghh/w4C/lPZ4ioS6audGc15+PIVZea2N0UEsPE+cQow=;
        b=S+5GN6xvB+H/y3b1rYc6wjDAP5m/vPzE2ZhHbYMnt5/LxDcf4eaCTlgcpvrHoAlDXq
         H+lHjXMFT3IP/Gxwiwv+ryZwJ3B0vGLCN+Mh0KRQQt9dUd0VYTLku9BPJi/k/72IXZAZ
         YiDSTfXL2VIaCPGgJswdsMzD3i58TAlptpjbCgMjaWuZoqDec3UDsYOIjf20HMWnv9zG
         gGP830nHQ2Oy33CEgvuV12ffKQLnBYYvrsAesGjbnmYaux7Vj7ZI9++1g7FrfI8QDlDq
         wSa6EM/m1EzZkIOVgdrl3EairzVF0Tt3OlzcsqX/UAOdZQqb0noIgyZPJs06S/O/bJVk
         FC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789745224; x=1790350024;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ghh/w4C/lPZ4ioS6audGc15+PIVZea2N0UEsPE+cQow=;
        b=p2thwaKgTOgDr3pnBzgtafNKdiLTo+ue6PHM44DUlGltjTCW7ePNTf+DljzMIbYaCM
         W2ycJIw+ulUmBBXDHfTOa0PyvubEkobhtbV3roEOFo+wTHYc+MNIvw9719dMsW3crgN/
         mPqXJSjCPc+lwOGcoVHaSx05UFxKZ2ZN3JJwNBmhMTAkImVRbmifwfwhn0s5qI0UBcJ1
         ZkCd1yjZSNqpi6aZhffVwBPmhFGx4Pi/AAjNUMUXaIIEYpOqqPLz3ghiooMuGzILD9S8
         rLtAYNYdyguhi4Pljxst/GNgvHyaw89L8heUi13UU5DauDVova33+9Tzj2lZ0ZFdh8HJ
         lWhg==
X-Forwarded-Encrypted: i=1; AKwUvBxo/1oX+U9AV8Fi2UfpD5iBnqZoz8DkuuYG1tELB9GeaBWDSlC1TzLAmPQYJAri3QX0cIhwb/gSNTcT/yvX@vger.kernel.org
X-Gm-Message-State: AFuF++ldXieXREJDeZrHnihc22zuOhai+pyv+MuYhY/ByYGmxk2zNO6J
	MwsqHgAkYkIP06jaGWV+kLI2Pg9kv5IozpXMgWGn0E0aJn4zYEYv5/D5zVNgjSBanwI=
X-Gm-Gg: AYBFou0qFXwz/Q3E+B1VFBkb5PuWczzzQP8U6DQNwVe9Yj97KA7TiBj77wxKFfum5Is
	lcqj6xzIHwTl63md808ZXy8G/+wTI5N4nqORXy3bM4tFdxJLygPqqPQuD94FKj/VMo1y7sd1LRw
	VJvNTMMTMLZBVVgMmsWpnzJXIpVZFz0kvO1GsgfrvwXa0lwORDA9FiBPgFNQWOzNvGKIBY41cHA
	/t854Gy8Vb1d/eb7NAygHwIDvPkGDUwBMOC30D8Jf380t6ZwB864FkGKkb0AxKN0itQky4bbf5L
	ugWcM7uwoFyJO3Ce8gOsXLUn9e3q6d5nDtV+zfxRo82LbkaPKo5E32G7kaODuzA9Yt5vqzJTfqQ
	5ReurqSbePvGYrosvChDaA8iHFZz2ov02s+O4afO9eGJJgHzDzAQ9+W/2VR3azd77utvncrmg2c
	H/SBL+YKtnsyvK6w70jb1J9vLT8T3XDZz2qIFcpcGFN1xdVNRkgtiw5OBEClS8XjhHf9Yq7G8Hl
	YU=
X-Received: by 2002:a05:6214:5089:b0:90c:c1eb:ae42 with SMTP id 6a1803df08f44-91254e92916mr36470276d6.13.1789745223692;
        Fri, 18 Sep 2026 08:27:03 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91257f326d8sm15099766d6.6.2026.09.18.08.27.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:27:03 -0700 (PDT)
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
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/3] PCI: introduce TC9564 misc driver
Date: Fri, 18 Sep 2026 10:26:55 -0500
Message-ID: <20260918152659.413268-1-elder@riscstar.com>
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

This version of the series was sent quickly after version 2, to just
address some very simple Sashiko-reported observations before others
had a chance to comment.

					-Alex

Note: to work correctly, this series depends on this:
  https://lore.kernel.org/lkml/20260910021919.3421449-1-elder@riscstar.com/

Between version 3 and version 4:
  - Dropped the pci-ep-bus@0 node from the DT binding example, because
    we have found we can do without programming translation unit, which
    is the only user of this bus (BAR).
  - Modified some details for the TC9564_PCI Kconfig:
      - Added "depends on OF"
      - Added "select PCI_DYNAMIC_OF_NODES"
      - Added "select PCI_QUIRKS"
      - Added "default m"
  - Probe now uses pci_enable_device() rather than pcim_enable_device(),
    and all error and exit paths handle calling pci_disable_device()

Version 3 is available here:
  https://lore.kernel.org/lkml/20260915181003.1633543-1-elder@riscstar.com/

Between version 2 and version 3:
  - Call of_platform_depopulate() if case of_platform_populate() returns
    an error in tc9564_function_probe()
  - Eliminated an unnecessary dependency in the Kconfig file
  - Updated "parent addresses" in the DTS file
  - Fixed a dumb typo in the binding
  - Note:
      - Ignoring the Sashiko report about the place holder ranges
        possibly not being updated at runtime.  (The above-mentioned
        prerequisite series will cause them to be updated.)
      - Ignoring the Sashiko report that the pci-ep-bus nodes should
        include a reg property that matches the node's unit number.

Version 2 is available here:
  https://lore.kernel.org/lkml/20260915031038.1087264-1-elder@riscstar.com/

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

 .../bindings/misc/pci1179,0220.yaml           | 146 ++++++++++++++++++
 MAINTAINERS                                   |   7 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  30 ++++
 drivers/misc/Kconfig                          |  15 ++
 drivers/misc/Makefile                         |   1 +
 drivers/misc/tc9564-pci.c                     |  84 ++++++++++
 drivers/pci/quirks.c                          |   1 +
 7 files changed, 284 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 create mode 100644 drivers/misc/tc9564-pci.c


base-commit: b41f628f0cbcac09e6bfe7bc322e2d0c7c7403d0
-- 
2.53.0

