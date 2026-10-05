Received: from mail-qk2-f39.google.com (mail-qk2-f39.google.com [74.125.230.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEA141B8F6
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 23:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791241776; cv=none; b=U6YPGTOUg3ym22d/DkklGeLKaBARgofBYvqslVZWhOdjjOUncMj2zOoPY0rOMN6r45ugeqYOmlJUnd/VPFeqYOK4gZh1KhYtY1F73z3t1iPtzrliigc4X309zd7eH8yfZyx0MLNNZwn+HYgiOFf5HgLjbIibT9mO4BwQg6U4Nok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791241776; c=relaxed/simple;
	bh=LsfYzyQMlY3KUZE7nNld+sgYJH83jdPT7t/VFrodmFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OizSI3t9zy7AAxh3+ylTf2w+BQ+lJOalXh4veVzI2t8BPv8MpMWRfarayo12rEEKC8hTundq1LVjuoPQvMzWLIH6T9AQLN7Z7LBCqmSMAXvG9bMgGQsXYpcHlaRPygMvzJKPX51Seee7FHUcyjHX4cfughJd5EVRWzzMa4D3b5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=ZqDNeGIT; arc=none smtp.client-ip=74.125.230.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="ZqDNeGIT"
Received: by mail-qk2-f39.google.com with SMTP id d75a77b69052e-53331a61f71so19930051cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 16:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1791241773; x=1791846573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnECxew7J4Xp6tWZ1eSlOBhzTTpVtZroz73WdaNvDzc=;
        b=ZqDNeGITc5jSFPJn7sxzxSb0FVBPG2BK2dxJGpvxR5XroEhA1TSpLxPbP0VdImT86D
         OF05QJYkC3eVeY63bCWZQbzhoqFQ0GWfKQY0h9/elPV4bbI90SrWIPQof6TJ5/KvLZGz
         ZjqSom42i1kh3oDwd/38MbFlPJgJnSpzj4jI/uY0V/PPJS8kRHV+0X3Zfb8cQRIbBEkC
         MtAExhuixzsqAiKFaEV+Cib8asCGdqYeTQY2gJ9LFGOd2Puc8Ch31v8o8Sfhpadf4RXu
         sBWWcb9YPpuUwBqHb1AEABJEgx7IjR6wM4sQPWreZ2W+oF7o+TUxZdawZQpoWnEx4idT
         O6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791241773; x=1791846573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nnECxew7J4Xp6tWZ1eSlOBhzTTpVtZroz73WdaNvDzc=;
        b=2ttXA4LiR4p/A/5xyynHQWYfX5reuy8CsZgF8WRy5Xh0fEh5PUWd66GQL1X0lev5TN
         ZTG4e5nyorMFumnEjjvDG8zawmuBofykeZxPz85MGymcYNBIdTFwJGmOe1Ksw/h8djL0
         DHADk6EVOe7surOOrCkPl3Fs53Lv+OPQy6oxDCtZgDEgBvxjeESY58b8Ad7603HR9MJk
         CX07CMuJC6CDahrzq7AHEnbwXv/kYHvjcCQYke/8apyLjAdYdcqXarG0lgioi/KWf8zJ
         pi/hKOqo9oorN80slfn1BnHVCHDO+/6jKJf46o+KiyNCQRw7UqJUrZnUQpHBqPy8paIL
         iM3w==
X-Forwarded-Encrypted: i=1; AKwUvBxTByG1Iy7FwJdZoF+HEyXFDxFw4aTztkjOrqCyKeDIGGr/0yTHTFVq5yv4kVHeLS4RVohOacwao9fUsJGd@vger.kernel.org
X-Gm-Message-State: AFuF++mmxgwVBNPhhRSvZ1pGe4BubcLJrpdiOBHIW0ab3HsmRfgGLp4d
	wxksVJkhWxRLOt+qAWl7ZBWqdDrQFt4xtCSkTDYPzF/eIsGacNr+artAqERa8RwxKqA=
X-Gm-Gg: AYBFou2os5B56VptWPbeye4qxbxlzI7d8d9MAjX6Vc7XoP3NfNas6bM/hbRFcPdA8gf
	BR+fCBVRAmezAs5E3fvXLM+H+ftW/ApFYDPcPRwzXxfkWwKNQMBGj4BY+mvzPNy4ppzOMhqG+tF
	EwAk75ioJ+APqrF8V2vTO0VT4dWukQmct4NVcB8fyv4rTs7ot9End8sdNZzfTMNrcIj0n5H2Yj+
	LE+Y36oWFuluFT4Ft/PWtIX6vW3vFXtlG2x98ECeenlKnQJwtjZs9grmnwQWMVADs8OBsSVxNcb
	1HjMCiKMR8lj2aWdO7w+JXw8slAppXtHlrZgMX996a1hz7PtzP1E6kiTrCHhWXF/JW0O/vBBxYM
	vZ104MaiB7k0mHTLL/wl39dH0xLCIHGql7D5yQ89lEcy5WtRHyhWYEitu1qEru/pRefpGOgWzsn
	r+O6iIsTXa09FcilDy29udIAjLgBbrV69/mkRwBEVtm7L1whi7loNba4HMHPUGmYxzuspEoLfzR
	4OE
X-Received: by 2002:ac8:5946:0:b0:530:b2e4:d5a0 with SMTP id d75a77b69052e-533d96ed32cmr214089701cf.59.1791241772999;
        Mon, 05 Oct 2026 16:09:32 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-919442ce1c4sm89892116d6.3.2026.10.05.16.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 16:09:32 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Daniel Thompson <daniel@riscstar.com>
Subject: [PATCH v2 1/3] dt-bindings: clock: introduce toshiba,tc9564-clock.yaml
Date: Mon,  5 Oct 2026 18:09:24 -0500
Message-ID: <20261005230927.2000398-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261005230927.2000398-1-elder@riscstar.com>
References: <20261005230927.2000398-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for the clock controller functionality present in
the Toshiba TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - Only define clock information, not reset information
    - Reworded description to avoid talking about software
    - Clock IDs are now consecutive (no more commented-out values)

 .../bindings/clock/toshiba,tc9564-clock.yaml  | 54 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 include/dt-bindings/clock/toshiba,tc9564.h    | 34 ++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
new file mode 100644
index 0000000000000..329b8f002cf2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 Clock Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description:
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch
+  includes an embedded PCIe endpoint that provides access to various
+  SoC peripherals (including a clock controller) via its BARs.
+
+  A total of 21 clocks are implemented, though two of these are not
+  controllable.  Access to the clock controller relies on PCIe being
+  functional, so the PCIe clock is assumed to be always on.  Similarly,
+  the PCIe controller relies on I2C, so the I2C clock is also assumed
+  to be always on.
+
+  Clock ids are defined in <dt-bindings/clock/toshiba,tc9564.h>.
+
+properties:
+  compatible:
+    const: toshiba,tc9564-clock
+
+  toshiba,config-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle for the configuration space system controller.
+
+  "#clock-cells":
+    const: 1
+
+required:
+  - compatible
+  - toshiba,config-syscon
+  - "#clock-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/toshiba,tc9564.h>
+
+    clock {
+        compatible = "toshiba,tc9564-clock";
+        toshiba,config-syscon = <&tc9564_config_syscon0>;
+        #clock-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index ff3bfd42d3f3a..860cf437574cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28128,6 +28128,13 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 CLOCK DRIVER
+M:	Alex Elder <elder@kernel.org>
+M:	Daniel Thompson <danielt@kernel.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
+F:	include/dt-bindings/clock/toshiba,tc9564.h
+
 TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
diff --git a/include/dt-bindings/clock/toshiba,tc9564.h b/include/dt-bindings/clock/toshiba,tc9564.h
new file mode 100644
index 0000000000000..2106e4199ed45
--- /dev/null
+++ b/include/dt-bindings/clock/toshiba,tc9564.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+
+/*
+ * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights reserved.
+ */
+
+#ifndef __CLOCK_TOSHIBA_TC9564_H__
+#define __CLOCK_TOSHIBA_TC9564_H__
+
+/* Clock IDs */
+
+#define CLOCK_MCU		0
+#define CLOCK_INTC		1
+#define CLOCK_SRAM		2
+#define CLOCK_UART		3
+#define CLOCK_MSIGEN		4
+#define CLOCK_PLL		5
+#define CLOCK_SGMII		6
+#define CLOCK_REFCLKO		7
+
+#define CLOCK_MAC0_TX		8
+#define CLOCK_MAC0_RX		9
+#define CLOCK_MAC0_125M		10
+#define CLOCK_MAC0_312_5M	11
+#define CLOCK_MAC0_ALL		12
+
+#define CLOCK_MAC1_TX		13
+#define CLOCK_MAC1_RX		14
+#define CLOCK_MAC1_RMII		15
+#define CLOCK_MAC1_125M		16
+#define CLOCK_MAC1_312_5M	17
+#define CLOCK_MAC1_ALL		18
+
+#endif /* __CLOCK_TOSHIBA_TC9564_H__*/
-- 
2.53.0

