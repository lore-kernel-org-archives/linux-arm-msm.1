Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638108;
	b=PwirssR0erLrrMJIMi0xkVcUK8bGv9/k/014yIllSFlj5/b4zWcjKR4sGqsQ/PhP/Cv/
	 1aFYupjRvrTZP3eJqYnI/Y5bH5gSbw4/+gn59j7zqGeex/1WadI62XhP4EoaBWkr0xBJC
	 eKVDETR0W7bd4ifkseEZbx9WJq0jOvbE25zlitYRejaoWqkq7LGlsTbyjeqmsHti63wFE
	 pYslqMXpZd3G+yWRWfSCC2OBp89VimrA+uwKJV6/3SOFYFfiGJDNXprBTPlZV1CHP4bbd
	 kIr1RgdM0Cew6rkEdLEsV2RRRvYKbapDlM8W4T9rXZavib5wkFf6hZE+OoSEq8/vx3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3CfQrYxGmVhqVfBjXz2JxOYBYnlyriKE0w7C0oW3eCw=;
	b=FIeVFHmGFLDLgpwCQpZExF8ulDtFVvQw9qzS7+V6NEZjrkD0y246aQ7eeEDbX1UPufmT
	 cuyiSv0S9I7v7lWCuRNP/tZuODf+qx0AO/3UfHTS1paSCLZWWYwvXIL/E8f/Z+u1B+CpC
	 tc4SKstrFfDhO3gKQHOpM6IdE/mpepVaVI5acmQwEiIKBQovFeC/Ew/YVWedjFJt6/OB9
	 zD6hElMTGGc2ArlcRH2SMFsbT9Ebos00SVPBO0tkdUZatNSbEPt5t/0it/ASLbrQ9goqX
	 FakFpKmmbyxukCJ5/2toS2bei3MO+2yAMV8dCrGOcApAYn3mT3Z/aJKkv/xSBr7CLGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=yvL1qbup;
	arc=none smtp.remote-ip=209.85.167.176
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F47606A327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:21:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17F47606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=yvL1qbup
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-57148b8ec14so2262611b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:21:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638106; x=1796242906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3CfQrYxGmVhqVfBjXz2JxOYBYnlyriKE0w7C0oW3eCw=;
        b=yvL1qbup9iqNKVVTLxLarpET/deJHiZWhfe/gHkYx5+N0idKilfWyv3K/XqdT+n2lZ
         lgf5muna3z/KdRp5A3+UrrU2U4QC0wrFU1txXmSQrcRU6MUd/8AxqFTA/VZNhycOu7aJ
         PTGdx1VdDxANBe8cmsOUEGCOjLvcD5V9nbJ3w0nNSE795XK7JHb7kz7J80xdbDadDxXM
         4D0RuiVWYPziTvo3JTv5rFl14ciQGGXpHJhr+Kr/smdO6DhvySOY/b1fCqQ4kI5LYLVa
         Hh/3m1kD3LcNoZIsQEtUSgj6KLUUshK68BWFUBTTsWdG8HRZacDo5K4XJoACvLIbxRiJ
         9muA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638106; x=1796242906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3CfQrYxGmVhqVfBjXz2JxOYBYnlyriKE0w7C0oW3eCw=;
        b=F+ocd88WqK3raL3iT4Ih460BM7Z/l7mDOCZhL8ixCjlIelB+2WL/p55nv7dwKhQE8F
         EoZn/mvogfQfzqqjdTkagMs045Zjpu8eiKcRiXqOt7Qw3wANSFYY6DF+lkpOKH1RLW2z
         gCJqN3hH1+39b48N7Js1Rdbl4gh3IZOveHZqVRmIQq/2hhinGDGUrtp6yLAZp0/aZnfB
         dI7jKyOSHGvWW41O8KcWX/XUU0fCWZoP2DBUUuq4dsC4UmCO8XNKZ5PyacQHTio+Qssk
         ej/ZFQmYMeFBv0D2c8xl3EN4Q4+SQFl+uXm7Bw1wIv9P1BiBKoPNQt7HJh8g226nyo6z
         091w==
X-Forwarded-Encrypted: i=1; AL+hErHS74yZJIhSM83K2UHRR3zaRvgSsSRGYyDhyLHk5AcmMgrHr4MpBPNeNNQmYHm/abxuCy3+yY34e8BvrqoM@vger.kernel.org
X-Gm-Message-State: APuU4Z+PRfmx8qK5R6n/5hpIZn7rSLBi0V9imMIBxWdH/wIYyfEZ4rln
	VdoZTBvrWCBwA0WF3gf41EAyaeUOfDHH1woT+ni9G2ueB2mzZImDi9ppcUqV0T+uwsA=
X-Gm-Gg: AZFdTZeluY5xzCjiUJBgJJyH8QwIG32LpWn7pLtoEdqWHvlqPffwTxLRzEumt97pO2w
	nak4l80e8gp78DcLL/PbTiIpE46PPENFhpcnc2wmlAMPolHRJO8JBAqSBYM3DD42eZvpKoLf3is
	Hie3xosk88GirA0yI3MXJm85yQN+Z7SY+VCJPOZOW2V7lYxSIUE/2kRjqrDUdjDVFngHmnA6H/b
	H7XrKYluObA/32i+0VdNA5E4Br1kzjWmiTubfPSZiewlP3TDkOhl08dnunuBQ70WK/bYSGmF8z1
	jYYod5hlhHmDpGE2SQlgSXBSLDS8lTmDlhNdZf7QLN1Pqsepv/r+3ji6xkooQ6Ws7Uz/rt7xirW
	yD0lmJ1owaTM+wqG2hwGU/Rtn9OSsXBaztiCNS24xo/6zl5CJOfNqpXqxYseUas1XxEt/0L9Clc
	sBnCGWw+qk8ycP2u1TRY8nXKxmE4/0ltkV6k+EFKR8BAp7pb5dUrCMgE5icFsUfeihjh0A+79EF
	RL5mB8yjbRz5FVUILuRxWQEfMPV2gzMvUMIjXeseXjpFQ7K7qn3/aYYomYzuAgmXNWwm26oKze8
	OFEKONFEUR4/wzgH/miVU97P9DwQ8O9P3vC/
X-Received: by 2002:a05:6808:1310:b0:573:d802:fb0 with SMTP id 5614622812f47-57a09504ab8mr19901858b6e.13.1795638105859;
        Wed, 25 Nov 2026 12:21:45 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:45 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	fabrice.gasnier@foss.st.com,
	alexandre.torgue@foss.st.com,
	marex@nabladev.com,
	changhuang.liang@starfivetech.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] clk: tc9564: introduce a clock and reset driver
Date: Wed, 25 Nov 2026 14:21:38 -0600
Message-ID: <20261125202141.1288493-1-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
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

This series introduces a devicetree binding and single driver to support
the clock and reset components present within the Toshiba TC9564 chip.

The Toshiba TC9564 is an SoC that attaches to a host system via PCIe.
It includes a PCIe switch with three downstream ports.  To one of
these ports an embedded PCIe endpoint is attached, and that implements
two PCI functions.  BAR 4 for both PCI functions provides access to
registers controlling blocks within the SoC, including the clock and
reset controllers supported by this series.

The first version of this series included a system controller, which
has since been removed.  This version addresses all review feedback
received on version 2.

					-Alex

Version 2 is available here:
  https://lore.kernel.org/all/20261120183212.1264522-1-elder@riscstar.com/

Between version 2 and version 3:
  - Added Lorenzo's Reviewed-by on the devicetree binding patch
  - The devicetree binding now uses @kernel.org e-mail addresses
    for Daniel and me
  - Cleaned up the patch header text in patch 2
  - The Kconfig option now depends on RESET_CONTROLLER
  - The Kconfig option can now be enabled if COMPILE_TEST is enabled
  - The generic gate clock controller code is now used rather than
    implementing a custom one
  - Only the gate clock IDs are now published in "toshiba,tc9564.h";
    the PLL and internal fixed clocks are implemented and accessed
    only within "clk-tc9564.c"
  - The PLL is initialialized, followed by all fixed rate clocks,
    followed by the gate clocks, to ensure each clock's parent is
    initialized before the clock is
  - Updating the reset registers (read/modify/write) is now protected
    by a spinlock
  - There are no more "unnecessary newlines" in the initialization
    arrays for clocks and resets
  - An update to the DTS file is now included as the last patch in
    this series

The version prior to v2 of this code was included in this series:
  https://lore.kernel.org/all/20261104004332.2141282-1-elder@riscstar.com/

Between that series (v1) and this one (v2):
  - There is no more syscon, so its devicetree binding and driver have
    been dropped
  - The clock and reset components now have a single devicetree binding
  - We no longer use a syscon-generated regmap for accessing the common
    range of memory used by multiple drivers; specific sub-ranges are
    instead mapped
  - The clock and reset drivers have been combined into a single driver
    located under drivers/clk
  - The config option for the driver includes COMPILE_TEST, as requested
    (last month) by Jerome Brunet
  - The help text for the config option is simplified, first suggested
    by Philipp Zabel
  - The driver now names clocks using dev_name() rather than trying to
    hand-code a unique name into a fixed-size name array (also suggested
    by Jerome)
  - Certain functions now always return 0, which simplifies callers
    so they can simply return what the called function returns
  - As suggested by sashiko, a counted-by field in a flex array is now
    assigned explicitly

Alex Elder (3):
  dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
  clk: toshiba: introduce a TC9564 clock/reset driver
  arm64: dts: qcom: qcs6490-rb3gen2: add TC9564 clock node

 .../bindings/clock/toshiba,tc9564-clock.yaml  |  73 +++
 MAINTAINERS                                   |   9 +
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  15 +
 drivers/clk/Kconfig                           |   9 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/clk-tc9564.c                      | 456 ++++++++++++++++++
 include/dt-bindings/clock/toshiba,tc9564.h    |  40 ++
 7 files changed, 603 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 drivers/clk/clk-tc9564.c
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h


base-commit: 9437046953b2fb3bf55b36582450ea0267df82a7
-- 
2.53.0

