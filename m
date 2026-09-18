Received: from mail-qk2-f35.google.com (mail-qk2-f35.google.com [74.125.230.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7475547076
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 16:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789750365; cv=none; b=dKgZioNLlwyThR+VdWJ/oBwjOt8BDlUvHx33d9GG7skUGSIO64BREF/Dg0V/q5rHJeSpvTcTF6GZAXUUtLsReZVOZclH51p5cz/sLZOAErdSVNoN96ZwAYBxZp+exGjY9H3/4T6qVImgLkuYjcV5u3TIIKpSa1l9X/lLTRrjwf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789750365; c=relaxed/simple;
	bh=ut9bu0ogvOe3LaZe7HaU4YRdS8uXZFfbEqCnduNcrb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UA+GjiPDp3635wYTTWuCTVuvRF96eBf1T6S9avpFEw9sZWIFfxF5m4n18KE/D5d7lZVHbpoxC2wx4eXDR09aXqT4zwZSRO9OrYg2NcMTnmyrKUa9hli5gYDdxwB0MGpLFruXaACU+CfLYBbfjYah31lVQ6LrLMh6QfMbwJA90wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b=E5JVYXGu; arc=none smtp.client-ip=74.125.230.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20251104.gappssmtp.com header.i=@riscstar-com.20251104.gappssmtp.com header.b="E5JVYXGu"
Received: by mail-qk2-f35.google.com with SMTP id af79cd13be357-93910cadeb3so76304585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 09:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1789750359; x=1790355159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oe9FkoIahCgEzPBuPDqtCAL2bGeR9kc9QC4Nw24cDKs=;
        b=E5JVYXGu57Y/67BCAKxRz5yPwLfPxcgv6/MZt99eSldvuFl7BWxiWIO1RE4Y69QTK9
         UajLCGadRl40RX3VDBkonBYkX1Em3iai0tdjS8rNdfyYc/lXfOmGWqlfL/M10Eq/SePg
         y5L8zT7xvcKX1WcRIQRzukr/w3kx4nHxUNBmr2C9l/jF2D5dkPHGakBzVRPICV5jA9Wd
         wM7s1h03hHoPUrcTuQiNnb6q5+uBqCR07Oexy15x/Osz/3e478tMvJwJDjc6CB0T00RQ
         OkJcK1rjwlLDARKkNzi1/PYoGzdwg3TXYg42fVoPcZfZHl/7XAG2Nse/MIiSTXTbnCar
         wB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789750359; x=1790355159;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oe9FkoIahCgEzPBuPDqtCAL2bGeR9kc9QC4Nw24cDKs=;
        b=Y3xQ7MFeCzEM0Ro62+eHdM1ZNgIIwSLnCoYSAxKLKrATMQFqMfP0bjMxWQp4ByfvDg
         Zfk4pIYbVhugTltKVxFB0sMeMiXYFxhrgKKenpZ2yZsZJwcv55AFFcmNMVTgYMB5ln74
         Lg7pm/Rus0SsAgesSeM7b7QVQt7YCY+F0gjrBZCYrfP3H2ygtQb2xDwswwA3YEpn1nz4
         DPLvAuviGEgCj+8SflSQQBVdeb8ZnFvXEijmqirAlOw0hDDn7FMVE7416sFnu54RhaUr
         Fz+mJqzTDRsYn0QLBuO36WdXZdnaytWq9RSgTdZmr8Dpk0qSfEezrNmEFmdvBYddtmfr
         ottA==
X-Forwarded-Encrypted: i=1; AKwUvByhZy0KmOKyCeZ0G7UlJ3fjgsyGS9I+WhF3gVUKdWGXL7a5k3q0O8NhuXKpW0I27MYGtV4EmReNjSPSoP9h@vger.kernel.org
X-Gm-Message-State: AFuF++k73YIOPcVth2lmaqAInXqLMDpLjLZU6+uThD3su53FJ4Ctqt2r
	E2+9CMLUeyt4pIG5e525dM0fNA/0peFZcBjM+MiL0hz3l7UUh0gped+snaCccc4l6y0=
X-Gm-Gg: AYBFou2Ad8rEV5fJHa143KipNaFv+umVzUTn0/JaKb+iWmS96j5AYsqQ8WnpqU+/6zV
	2SJCYYOBZ1qhV5iEZPoExfU7e2KubTOLAKmB3hJlrh8x1Vca3SalJ8t2CYlNvz2wC150PqqCs3N
	WhTlZGeJLa5mWKPn/XPgZh+jDRTeCiNJLr4qkMTzxqqksAnsBt8gPyPOcfd3ylAe+9cjcFZAFqT
	ankjWd6ffANgUvCl6oQInjKZQ3vs772ZqeEL1c+264VDuT2BgxWiNFoV+/WIVLpBnFYf5UO650e
	JfvVpKHgOuxSdEv0tyF90MB7iuIQESJKJbhz9mgRU2HDx3BSn1Q8LBiuv7uIsvhhEjdWZ9BFqft
	nG4+CKTxXFGGRnHPTyn+HODHbaJlSuShCkJpJ/EHVSh8pYsWLIZqFTd4SaPMaz42Tn2rM63/NQJ
	yk6k7R1lxsdhC/O/OYDzp5KdlS2yzxYLjsO4qM59QsDwvYkZissH0dRJJ29wjOiFVZsoSXsOj22
	jI=
X-Received: by 2002:a05:620a:4103:b0:93b:d7a2:dd39 with SMTP id af79cd13be357-93bdca3fb9cmr469299485a.73.1789750359512;
        Fri, 18 Sep 2026 09:52:39 -0700 (PDT)
Received: from zippy.localdomain ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93be0f0762dsm183582785a.39.2026.09.18.09.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 09:52:39 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	lee@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abelvesa@kernel.org,
	kees@kernel.org,
	gustavoars@kernel.org,
	p.zabel@pengutronix.de
Cc: daniel@riscstar.com,
	mohd.anwar@oss.qualcomm.com,
	lorenzo.bianconi@oss.qualcomm.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: mfd: introduce the TC9564 config syscon
Date: Fri, 18 Sep 2026 11:52:30 -0500
Message-ID: <20260918165234.687224-2-elder@riscstar.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260918165234.687224-1-elder@riscstar.com>
References: <20260918165234.687224-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define the binding for a system controller used in the Toshiba
TC9564 SoC.

Co-developed-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Daniel Thompson <daniel@riscstar.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../bindings/mfd/toshiba,tc9564.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml

diff --git a/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
new file mode 100644
index 0000000000000..32e73a727c82a
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/toshiba,tc9564.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Toshiba TC9564 System Controller
+
+maintainers:
+  - Alex Elder <elder@riscstar.com>
+  - Daniel Thompson <daniel@riscstar.com>
+
+description: |
+  The Toshiba TC9564 is an SoC accessed by a host system through the
+  upstream PCIe port on the PCIe switch it implements.  The switch includes
+  an embedded PCIe endpoint on one of its downstream ports that provides
+  access to various SoC peripherals (including a clock and reset controller)
+  via one of its BARs.  A system controller provides managed access to the
+  first two pages of this memory region to ensure accesses made by these
+  peripherals produce well-defined results.
+
+properties:
+  compatible:
+    items:
+      - const: toshiba,tc9564-config
+      - const: syscon
+      - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  ranges: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    syscon@0 {
+        compatible = "toshiba,tc9564-config",
+                     "syscon",
+                     "simple-mfd";
+        reg = <0x0 0x2000>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index cf846853fdc79..b2d3257b8f892 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27674,6 +27674,7 @@ TOSHIBA TC9564 PCI DRIVER
 M:	Alex Elder <elder@kernel.org>
 M:	Daniel Thompson <danielt@kernel.org>
 S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/toshiba,tc9564.yaml
 F:	Documentation/devicetree/bindings/misc/pci1179,0220.yaml
 F:	drivers/misc/tc9564-pci.c
 
-- 
2.53.0

