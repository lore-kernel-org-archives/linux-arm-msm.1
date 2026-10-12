Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F5D499F1D
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 15:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791818654; cv=none; b=cLdrDXbgOOAtggcr7apjGcLh6caF5ji8Zk0paTiXFVx1X/MxqS39xFngMRsuF+LhBseHUUXTzVigZfGsuKV4sF+iKVG13SOHj9V0sRC8fXWjHqaJJOcnpC1UUun9YMVE+PAWbiTZ2sQI1bQTWmvAcSbsb2J+8CPnB198wAdrrKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791818654; c=relaxed/simple;
	bh=BPhVdVn3lLt61EeSVOe16izIdtSs7qr03SzF+WwtHCw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Vlvv5AMgKKJPbNJEtY/3qR4EpFKQgC03lHfN77UpgMxlYmCqrr0viQBrC+f9OluTegzqcaZybtC0L9YXJWR0h/UtzUG2H7I5V9Cszv0mC/9nQezRdRkeDnB7T8Pc/0G8D1j9/jWjYVtfO9XyBTpPvH9nsJUAtrqAojK+BZtXIDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=F+SzHLge; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="F+SzHLge"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-917ad52d7b6so25881576d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791818652; x=1792423452; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=N6I52eyh3zXooRwST5ZWSSAFFlPV3h5qGgt5QWGPanM=;
        b=F+SzHLgeYzLnrBR2QMqeSqprXiyECG8R7zUelPJqND5n2lORKaWtTLzU1hIQz9cYwz
         Ekrx5p3BpfVa8ATm3kcElT+2iUTiC3xAliv4LLiBL05ZUG83Ps6hv72lm6hjjvaZI1Jq
         HK1Kr/Rlew1qrQ6Fh2UB4/QYP8JhYdPonZeHAASYP744X5RFysQrVEgZ0jJchbqD4IL1
         pHOQGhX1t924d2pSfOKuG4821OA6toV0moKmDJhYNPvEF2fuHEqR9I8uNHnJfR+5tLk1
         hy7601/fZ7qnJKtNqG17D2Hkvcs11SquoeQaU0XkQnrEiFOIuR11dcDWayrap9i/4eMA
         rE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791818652; x=1792423452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=N6I52eyh3zXooRwST5ZWSSAFFlPV3h5qGgt5QWGPanM=;
        b=hbgHVXlYZ/s52jTRPXB0tu9AjBX6Dby1YB6haaHrNx6DGp/lX76BgvbFUJp4mob33f
         OW284Zp8WFc/uPuLOc6BMji0KZEy4H0WtDpzgj+U/LiwZuCWOt/wCfgF0D1KPJAshWrw
         5IpsqKpG2nyBvMYCbhjX0l8OSIEs58gzyIFp90p/Op1ugNL2zIqOLZ+ZQbyNQxNBG/P/
         MkK1VmMun+BE/lrc9Am1BUup3LrHFlViaI5hJT6/w7IzpmqXmCuZ9wU/NjV/Mr9ywV/4
         hbTDC6cZYxesxpIvA7/FaggtpYyhwwxS7TdcLGmLFnL72CvOqBjeB7GZecONA3X7ubk0
         EGHA==
X-Forwarded-Encrypted: i=1; AKwUvByFqFdNIWlOETppnoEzvpVTXw5VqOA0alff1RMhJUOPkZ43LLrLZmN8VnfzeYj3RdzreoY/GvXFsvqsIs/J@vger.kernel.org
X-Gm-Message-State: AFq9FYIBEghOYP2glwY5C3GiQvLsNc4jDmS5X6iqJnAGj3ZuBRFL4il1
	dD7/l2n2mGySw7xL8kRSU13jG4zKWwe9NSevKajqwxE5wnVe2/GhknRz/WxakSihn5M=
X-Gm-Gg: AYBFou3xhjlIY0aDY9nPYcPPBuw3RleUViHB3FzBH0YK+FhvlKKttTexLb8xE4BAF4y
	bdOEqCYEXIGe9QZISVyCFjuxX31/ocLQgFPdH0KhXiWowB1g152V9g/DER7te+uR2F19sGqNceH
	SsJcH5MUv4new3S8IZ1DmM5s9qlthWa6zr7Q3YgVO1aQX4JbwVu4RYSKfkWtU7DFXJsy6qYqX+x
	UejoM/wTriNb7ZqcHOo2Qw/tkoiRPalGB5bfe2xCUuYeeEqw8ks1ygTm+1+S3FLfOUxycGuGNNw
	n+RmT/Ayi/Kxo/dU1emrr6kzy3hO1FAeCSJVnf/jZjRSHwTZdvl8LtJXIOPv16+OOuhA0DEPBk9
	0EVnwmskpnOKbmIiUTF1MDyUDJKrCtPRF1cyVa49gjdl12o0pGo7pXUKEv8Dfqqy2RnDKV0alvX
	Rpbyy74yBlCs2kzn5M/+qQynZR8GJxCp0hJf6P7CAi9CSzXLGPD+zbz93KuAPfLXkqIEleZH/uD
	3nuKYhQ6UcOSg==
X-Received: by 2002:a05:6214:2b8e:b0:91b:8d97:122 with SMTP id 6a1803df08f44-91b8d97039cmr23749566d6.51.1791818651854;
        Mon, 12 Oct 2026 08:24:11 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91b97178de2sm659086d6.0.2026.10.12.08.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 08:24:11 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org
Cc: abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	danielt@kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] clk: introduce TC9564 clock support
Date: Mon, 12 Oct 2026 10:24:03 -0500
Message-ID: <20261012152408.3729237-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds support for the clock controller present within
the Toshiba TC9564 SoC.

This SoC attaches to a host system via PCIe.  It includes a PCIe
switch with three downstream ports.  To one of these ports an
embedded PCIe endpoint is attached, and it implements two PCI
functions.  BAR 4 for both PCI functions provides access to the
registers that enable or disable a set of clocks.

Both TC9564 PCI functions can provide PCI endpoint buses via
devicetree.  Each PCI endpoint bus provides access to one of the
function's BARs.  Subordinate devices (like the clock controller)
can then be defined as nodes accessible on the endpoint bus.

Only one of the two PCI functions is permitted to define the clock
device node.

					-Alex

NOTE:
    This series is built upon linux-next, with this patch applied:
      https://lore.kernel.org/lkml/20261002181849.790275-1-elder@riscstar.com/
    The series (with that patch) is available in this git branch:
      https://github.com/alexelder/linux/tree/outgoing/clock-v3

Between version 2 and version 3:
- What was formerly described as a "clock" node is now "clock-controller"
- The clock-controller DTS node, which dropped its reg property in v2, is
  now a sub-device of the config syscon
- The config syscon is now (also) compatible with "simple-mfd"
- The clock-controller DTS node no longer defines a toshiba,config-syscon
  property, and the config syscon no longer requires a label
- The clock-controller now requires a (parent) clock property
- The header file is no longer included in the binding example
- The binding example now includes the definition of fixed 25 MHz clock

- The clock driver now gets its regmap by calling syscon_node_to_regmap()
  on its device parent's devicetree node
- The clock driver now must its parent clock from devicetree
- Added Brian's Reviewed-by tag to the second patch

- A new 25 MHz fixed clock is defined in a new patch, and is later used
  by the clock controller


Version 2 is available here:
  https://lore.kernel.org/lkml/20261005230927.2000398-1-elder@riscstar.com/

Between version 1 and version 2:
  - Previously, this driver also included reset functionality.  That
    is now in a separate reset (only) driver, which will be sent for
    review separately
  - Dropped the "config syscon" devicetree binding
  - Reworded the clock binding description to focus on hardware only
  - Clock IDs are now consecutive (no more commented-out values)
  - Get the definition of of_device_id from <linux/device_id/of.h>
    rather than <linux/platform_device.h>
  - Dropped a comma that followed a ternminating empty array entry
  - Config option COMMON_CLK_TC9564 now selects MFD_SYSCON
  - Clarified in config help text that the reset and stmmac drivers
    are the "others" that use the config syscon
  - Moved the clock devicetree node to be a peer (rather than a child) of
    the syscon node.

Version 1 is available here:
  https://lore.kernel.org/lkml/20260918165234.687224-1-elder@riscstar.com/

Alex Elder (4):
  dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 SoC clock driver
  arm64: dts: qcom: define a fixed 25 MHz clock
  arm64: dts: qcom: qcs6490-rb3gen2: add the clock controller

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  65 +++++
 MAINTAINERS                                   |   8 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  22 +-
 drivers/clk/Kconfig                           |  12 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 268 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  34 +++
 7 files changed, 409 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: dc44eb73f8da11f478815bc29b6509a6a4c5c35f
-- 
2.53.0

