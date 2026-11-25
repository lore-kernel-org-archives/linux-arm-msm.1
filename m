Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638109;
	b=JDDx2jTr5HXMoH00DAsbnOkBXVbeLHr56ZdIgvq6uNXdrPvoe8qb+qEmhkPozy9q+8Xk
	 fGyPvok83jyCrU+LVnA+wjC+qIyTY9z2p11iv92uEhDnkpMfkfZqqJhTgVV2b6GryTX8T
	 spEytBsHwP7igzXQuDp5DNVG3rt3kR/d1CwIC5UEBTl9/PZcbMw/tkge0BY6FAZjGwGRE
	 rQ/xDl1TqNlw74M7g6p4GpR5hLsiTqUCgbheK7YdOnRxWZ6xzWF0JINRwLTHi5VJ8P9cF
	 gI6WqyRONwHRGw7g9Azbl4pIbwTmhQNY0U5+KK5sMfiYCJYKSyRFEcS0Qjeh3oFTqTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638109;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=PpjsSnxg1AIeDz8NR7jpTi9G0n5lA83qCQvVaWbPR8g=;
	b=npJ0TH8VUFva2+tnj0T7lAeraE4Thmp/1IyPuP0wJsDnLwt6+voNTCj6UJyM5cmH92iP
	 C2bbT/Yvjb33QJHaOkvJgc/8WcNtLNPZpX9r2RypUW9qsok3R4g1WbDFwEo8sXPR0f+vy
	 eqkaYrwdkZWL2G6I/PlTAd2xu0Ju0cKNn2dE9b8IErqutrJJUK07dx1tDQu+s/V030XUU
	 8Z1GIZ/2NoqXXn59/XAmsQ4KvyY+07fkIdkYvAn8dHDa9lFW5OJn8hEJ/nNuaoKnETkXO
	 zz9dDkEqqNTtejnIFjxxsdFQgbGbygZL8wekJTbsB++yJdtmaHmn8cKQ9tbSCGWk4vg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=riscstar.com;
	spf=pass smtp.mailfrom=riscstar.com;
	dkim=pass header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=A65WD2F+;
	arc=none smtp.remote-ip=209.85.160.45
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC78606A337
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 20:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EC78606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar.com header.i=@riscstar.com header.a=rsa-sha256 header.s=google header.b=A65WD2F+
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-4ad587ba293so3421310fac.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar.com; s=google; t=1795638107; x=1796242907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpjsSnxg1AIeDz8NR7jpTi9G0n5lA83qCQvVaWbPR8g=;
        b=A65WD2F+9AkDkxOhI+lzJ8+i2f6yeI4zUqbQ1QVI8DvGRaHTzJZ2ncnQNnk1vK5mb6
         +HINrbTk1y0ru8Sjx/Qh1vWU5VICdDFRURZC7U8lefYeLyrzgkWTDwCX59UwUWldt2ak
         gpoSY2llnJKuHQSv5b0QXx9AwMbQAApCKyvgQ3Z2QhXu4dXppwGP/KojS9xTvO62PMCi
         bqZAmXkzkPEmBf5q7gXE5NEoHEoc/OBudlIRj1ZiB3KjLz2OSIIw7WBUb3ils6TPp1gx
         IF0MyDrVI2kyYuLIUExUq0b0RwEq+DkcmDnALR/F5fga8GV2mKz7hskbTvLGlwlKzVlX
         k0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795638107; x=1796242907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PpjsSnxg1AIeDz8NR7jpTi9G0n5lA83qCQvVaWbPR8g=;
        b=WMipAYO1yp5RAe11uFnWnDyO1TreJLt0Wrrkc59v0HrMH/KSiHClxSM8p7LQstzFzm
         CKGUpziKZ1BTCYt+nf9pIHJDbmQWRgm/MDLzJ4OsLj+hDxRoMs/VMEhJ7FLD/AyrqbH+
         NKnkg9R6wTVRAhCFgp+ApB3wmX7jIaQULA5nIb5tUg7gc7HKCPPAr9gJIZrxDK+oAYE6
         5+OyKDABdDll957EbRd5+WlwX6mJxkCcoxUBwTHCDWhCfvbdgaUOjIR+AGOclHK7CWpJ
         dmSO7YkfNbhAO1UsN/V5O6NrnMSON9JXszQb7LMYZ/yS+GuXS+BvzXr4yaP/nQUYtRag
         Gixw==
X-Forwarded-Encrypted: i=1; AL+hErEk7whXA7pKvxK0ysY94O6YoGnkXkLDTYgDHOTwzYfQsAq4BlI3k8YISWEzhEywRAJD/z1DKWUNbjWcsNip@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uf51Yg48jQjO9RueVekyiUwGPn2Yx/MSgezcGfId7If29f5jY
	8r0597AxzOHLLGSBb9e8GF6uhrWgyIuSq39xTdbD6G5bkRs+UWYZqPR96JpUhaeHYs0=
X-Gm-Gg: AZFdTZdFv6O50GoFA/WcdaOrerYLZfc7clSw/JAA4p3KPDWdjk4HotiQP2HYe/GhH3C
	2tReZizj0n9BPZjI5q6H6+OTmGb9JGHHUlQbNi7RScp3XRJeHPfgImkjvEQoecrpBBWgHLUuxrH
	6fvp+H7D6TSP6VBujzDl/Xz3YnnoQfh11Zjfbm+n13WV2SJVnt/suLzjAGggl8LT8eaLOfvawY9
	cOPJPBevt3VzoTu8modg47SFXPZCFveY7hqw12hJ23M1eabQvP5IznfI/00tz14/IZ8yX+m/bhJ
	BoPpMe1T/AFgh9gc5pvzRi+LsiG0cwKhJN8GEK5TpHNroE7XBOozojFpWE+BiiuioxLPErPwB9t
	A4buFa7sCd8n5OWwLFZtsxzLgIMNg5K1wNsungPLLRlvqCIVUhz5eSN7VTRoc5KLr9PnDOkdvZR
	c4OCvJOyKbMb6Iijk38ZPprvhqj/ZhXAh81WIPvW0J63J490QoxjvLwyxj9a+CBJ6Tfy18ywXzi
	bG6TKZSgqTHO5Q9i7+vNu2LyHqoRLPp476htgG5XF1qy8pUIo7Tm/V2v1sUHZ5/L2ml1ec7gvBG
	sZcxGvc8L6HeU+IjD1qyacCI3stySVKZBJva
X-Received: by 2002:a05:6871:7bc7:b0:4a7:2bbe:4601 with SMTP id 586e51a60fabf-4bc85af4396mr16373413fac.57.1795638107333;
        Wed, 25 Nov 2026 12:21:47 -0800 (PST)
Received: from zippy.localdomain ([76.156.233.211])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4bc5edc52aasm18900550fac.4.2026.11.25.12.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:21:47 -0800 (PST)
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
Subject: [PATCH v3 1/3] dt-bindings: toshiba: introduce toshiba,tc9564-clock.yaml
Date: Wed, 25 Nov 2026 14:21:39 -0600
Message-ID: <20261125202141.1288493-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125202141.1288493-1-elder@riscstar.com>
References: <20261125202141.1288493-1-elder@riscstar.com>
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

Define the binding for the clock and reset controller that present in
the Toshiba TC9564 SoC.

Reviewed-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Added Lorenzo's Reviewed-by
    - Changed to @kernel.org e-mails for Daniel and me
    - Only the gated clock IDs are now published in "toshiba,tc9564.h";
      the PLL and internal fixed clocks are implemented and accessed
      only within "clk-tc9564.c"

 .../bindings/clock/toshiba,tc9564-clock.yaml  | 73 +++++++++++++++++++
 MAINTAINERS                                   |  8 ++
 include/dt-bindings/clock/toshiba,tc9564.h    | 40 ++++++++++
 3 files changed, 121 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
 create mode 100644 include/dt-bindings/clock/toshiba,tc9564.h

diff --git a/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
new file mode 100644
index 0000000000000..026ed949f0f02
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/toshiba,tc9564-clock.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/toshiba,tc9564-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 Clock and Reset Controller
+
+maintainers:
+  - Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
+  - Alex Elder <elder@kernel.org>
+  - Daniel Thompson <danielt@kernel.org>
+
+description:
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The chip includes
+  an embedded PCIe endpoint that provides access to various peripherals
+  within the SoC via its BARs.  These peripherals include a simple
+  controller to gate internal clocks, and a reset controller.
+
+  The TC9564 chip has a single input clock.  Internally that clock is
+  multiplied by a PLL, and the PLL signal is divided internally into
+  a set of fixed rate, always-on clocks.
+
+  The clock controller exposes a set of simple gated clocks, which are
+  controlled by two registers.  Each is derived from one of the internal
+  fixed-rate clocks.  A total of 21 gated clocks are implemented within
+  the chip, but support for enabling and disabling only a subset of them
+  is provided at this time.  Two clocks (I2C and PCIE) are marked critical
+  to make it clear that they should never be disabled.
+
+  The reset controller uses two other registers to control a set of 13
+  resets that can be asserted or deasserted.  Here too, only a subset
+  of the resets can currently be managed, and the I2C and PCIE resets
+  are treated as critical.
+
+  Clock and reset IDs are defined <dt-bindings/clock/toshiba,tc9564.h>.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,tc9564-clock
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 1
+
+  "#reset-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - "#clock-cells"
+  - "#reset-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@1004 {
+        compatible = "toshiba,tc9564-clock";
+        reg = <0x1004 0x10>;
+        clocks = <&tc9564_xo_board>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 64f8b6153b870..36107e0790780 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28716,6 +28716,14 @@ F:	Documentation/devicetree/bindings/media/i2c/toshiba,tc358743.yaml
 F:	drivers/media/i2c/tc358743*
 F:	include/media/i2c/tc358743.h
 
+TOSHIBA TC9564 CLOCK/RESET CONTROLLER DRIVER
+M:	Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
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
index 0000000000000..7de8c8165199a
--- /dev/null
+++ b/include/dt-bindings/clock/toshiba,tc9564.h
@@ -0,0 +1,40 @@
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
+#define CLOCK_I2C		0	/* critical */
+#define CLOCK_PCIE		1	/* critical */
+#define CLOCK_MSIGEN		2
+
+#define CLOCK_MAC0_TX		3
+#define CLOCK_MAC0_RX		4
+#define CLOCK_MAC0_125M		5
+#define CLOCK_MAC0_ALL		6
+
+#define CLOCK_MAC1_TX		7
+#define CLOCK_MAC1_RX		8
+#define CLOCK_MAC1_125M		9
+#define CLOCK_MAC1_ALL		10
+
+/* Reset IDs */
+
+#define RESET_I2C		0	/* critical */
+#define RESET_PCIE		1	/* critical */
+#define RESET_MSIGEN		2
+
+#define RESET_MAC0_MAC		3
+#define RESET_MAC0_PMA		4
+#define RESET_MAC0_XPCS		5
+
+#define RESET_MAC1_MAC		6
+#define RESET_MAC1_PMA		7
+#define RESET_MAC1_XPCS		8
+
+#endif /* __CLOCK_TOSHIBA_TC9564_H__*/
-- 
2.53.0

