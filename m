Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655346;
	b=gC6vephzdbXCdggSxTUH18O50MsOkpvjrFcq4UKn1DBeXSENlTGDzTX80WvrLSORBZ/q
	 pRM3yGPHy8M1HtS0JbVFw2RZr0lQrqSHjzJzcY5dfq3iWHQqfApp/8KXcTAa8kEe40gTE
	 bTIAeQm5LcRf+cu1RFOIZetdhoauLvadTdhPyj18jPecRrBIOh5xIk+Aq6SUchXJUaFPf
	 qpf6nIt8PfPpHtDupyiKQsK1iHhxgu+YwO5MFC84vVzUM5K7oW/vWaAaGcvtytEGMfDmc
	 W4qqX4YjQ0DsSvOObgivk+whtfb7IxbGJOy2fpXuj/btlQ7JkoadUXxR5ljo2DstnAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3PPbwIXTSfL5INVkpoXipMr1LonhcpwjQNS0NDqz+/s=;
	b=lerbjWRWiANdrDeNMG59GemMKnvNdkimvBCpTvkG3tt8AHuPTzksMMxE7s1eGr2GCWwH
	 is8bI6jpV1U16b1QPa6flijZPsubIPYg4YKCNvtTDYAwtNAd2GQoQARJbQI4Bix4uZKZg
	 HJvCW7bxU6JBZYHK/IsVgDKUZw4iVYks1BmfxU/6KXtQ5MFItEFRE6wN3iCxO9TG4A1uK
	 A1IVwzkW5bt52V/LVV1H95J8se+nbUEfRvXngPQwcP3AwpvIT1sHndoQTQAmY17Qi31R6
	 VEqJRCxP9olngvmPmXJOMbeRbNZbZqmPwiTnQJK7r0H8r6nDMEO/J1DIPRnATPhGdDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="X/QRd9tY";
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90247606A323
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 11:22:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 90247606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X/QRd9tY
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0b3754f57so1396783a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 03:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794655346; x=1795260146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PPbwIXTSfL5INVkpoXipMr1LonhcpwjQNS0NDqz+/s=;
        b=X/QRd9tYzMUrGM9ds4MFgmgnjgzlmMZQUvIuQQBK2gHq2xohb8KhWkuTSwbaJ74Zud
         UO9hYbk3WsKBa/AlLsZ5050aLkPgC1SNwvlVCpqzMuq6n2k84iJqmjp5Rm1UCcT3op+y
         RNQWzpZYbLmhwfEu6LcRUSg9ZERYaxvr7r5pPGBbHl8Gtpeq5uVVksUcIfOHDZWPslku
         7nYUyJ6/UWupvH5mxF7aOntC4A5NmIYdcmBI/AjUtwOM+2P0z9QrWqvVSMTn30+8LVEL
         sHtHLcNvup3KATG570d3LQ5Moy3R5T6+D2vBEJuTvAUlpEOp5EYSqHZ7DwipYOPn/5mL
         4MTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655346; x=1795260146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PPbwIXTSfL5INVkpoXipMr1LonhcpwjQNS0NDqz+/s=;
        b=1kvmJM7QSnnfaGrV5p6KqSJsNtphX6sxIJlHeRli33dKUVwownY5d5DxJaeqB/3j7V
         lCUBZAa1uWANTjOegkIVGpK9VCDwhXmnc3d5+lifo17p3P0/cLUZsJkIhzJQ1WIm88PW
         u42wmedg4yYXvSjXjD586Dg1knfAkOY+Z7Pg94JEyo+blHssEnVt49oQ0Yw49nU2aAS4
         V9rxq+DdJBqCr9s2rI97k95Xz0DIgkWEX4mI4HQVQ5wa7emcbUdHWgD+qACCkKbuMrSA
         RsbGYhyXYl4hJCye/apFkXw8q0jrExKz296+GLE0iqY2UiVLetAUUInQrTjDDaaK9Nh6
         IwdQ==
X-Forwarded-Encrypted: i=1; AL+hErEvylBNQ5nTrtadpwYT05G/EC6cAz9JdjbE1FY1knjC12fz+hmROaVBFYGaZDYjpYIgFmc4H34/6xVU+Q7r@vger.kernel.org
X-Gm-Message-State: APuU4Z/3aMnRRsNeKQZbdPnYgRCrqQ83oarbZ9X7rK+Yl6YZDpA4RfQg
	cdqJRRQd2/juOn2VpiX1j3kvjGzyhKRR+wYUnlIQYs0yAbsN2V7uXqsV
X-Gm-Gg: AYBFou1/d09OFSsIIKIlDupX6kAM4sDOPWrT/xP6WF49qK2jbWdG34eHTC3WK5lbxuD
	F0XhsjNxm5+mRgua1VKiyWxlJ0qeUMFdPsKX9z6LfxiYnpP6NH7cI5a9TVN00M12fN3lp7WAWXb
	+y/o6XM8cnnNcxMJxzWf+5W3dxwQOo8q3HrmDF41Cp0unA7j6xDn7/IEx/8vU2MLcSDMeZ8RXJp
	fnmEON55zvNpfgLgXwildBa/erNC/oFU2/7JR/BvFacjf8UwgvQP2cqorHPADjm/iWVt3QwOUF8
	J9SDk1075nw5t2qOmpPe6AjpRSuegwTKXxFSdNFapKr2yivnjT8Si4aRKNNVqkVbT/XfmPx8k8I
	MbyJUPTOcwIJi/HDoNcirhAtoaNz9Q0aUlxcQ5Vi3pyunnwTP+oT1eCZJvMGYR2NUvHHTwBj2kv
	j5cMFu3rR9BdcvsR1bH0qJg6bEQJx6v47UI++B7auV0hfMuRyigeR3sCP0cbdJmqlKSoe95Hyte
	cSorNp2u9MMAhHKvjqdRHl3PZ5C8CANJ2PMI1vvagb+LhG2APq1wHwunmtaGxcq+Tpk6rqtxtsZ
	dHZ5PYjkbkicKwnmfNykTmPm+mkZv2kSJxG+s8Y4HdPDt/MOyowI0tlio2pHoTaGqYf/oYldrbZ
	NHU6xkmtAWy8D12SY/hmzjs3iBnsAFdkQBjAVttYHcPG8fH+Z9Oh8e1woh1rZumP8HgnWdg==
X-Received: by 2002:a17:90b:3146:b0:3ab:f38:2b43 with SMTP id 98e67ed59e1d1-3b1b0a4513emr4900156a91.34.1794655345714;
        Sat, 14 Nov 2026 03:22:25 -0800 (PST)
Received: from localhost.localdomain ([118.68.25.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1b3b110c0sm3981142a91.3.2026.11.14.03.22.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 03:22:25 -0800 (PST)
From: Adrian Nguyen <thenguyen1024@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Casey Connolly <casey.connolly@linaro.org>,
	Adrian Nguyen <thenguyen1024@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3 1/2] dt-bindings: power: supply: Add Qualcomm SMB1351 charger
Date: Sat, 14 Nov 2026 18:21:54 +0700
Message-ID: <20261114112155.85068-2-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114112155.85068-1-thenguyen1024@gmail.com>
References: <20261114112155.85068-1-thenguyen1024@gmail.com>
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

The Qualcomm SMB1351 is a switch-mode battery charger with an I2C
interface. Some phones use it as a parallel charger next to the charger
in their PMIC: both take power from the same USB input and charge the
same battery. On the Vsmart Active 1 (SDM660, PM660) the SMB1351 is
powered from that input alone, so it does not respond on I2C while the
input is absent.

The SMB1350 has the same programming interface, and the two can be told
apart by their version register, so the SMB1350 gets its own compatible
with qcom,smb1351 as the fallback. The version register of the chip on
the Vsmart Active 1 identifies it as an SMB1350.

Document the chip with the battery it charges and its STAT output,
which it can drive as an interrupt line. On a parallel charger,
power-supplies refers to the PMIC charger whose USB input also powers
the SMB1351. The SMB1351 can also be the only charger of a board, with
no PMIC charger to refer to, so that property is optional.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Adrian Nguyen <thenguyen1024@gmail.com>
---

Notes:
    Changes in v3:
    - Drop the Assisted-by tag: since commit 1e035297ffda ("docs: remove
      Assisted-by references") the cover letter carries that information.

 .../bindings/power/supply/qcom,smb1351.yaml   | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
new file mode 100644
index 000000000000..468899c15fa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,smb1351.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SMB1351 battery charger
+
+maintainers:
+  - Adrian Nguyen <thenguyen1024@gmail.com>
+
+description:
+  The Qualcomm SMB1351 is a switch-mode single-cell battery charger with an
+  I2C interface. Some boards use it as a parallel charger next to the
+  charger in a PMIC, taking power from the same USB input and charging the
+  same battery. On some of them it is powered from that input only, so it
+  does not respond on I2C and loses its configuration while the input is
+  absent. The SMB1350 has the same programming interface, and the two can be
+  told apart by their version register.
+
+allOf:
+  - $ref: power-supply.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,smb1351
+      - items:
+          - const: qcom,smb1350
+          - const: qcom,smb1351
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description:
+      The STAT output, which the chip can drive as an interrupt line.
+    maxItems: 1
+
+  power-supplies:
+    description:
+      The PMIC charger whose USB input (VBUS) also powers this charger, on
+      boards that use it as a parallel charger.
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - monitored-battery
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        charger@1d {
+            compatible = "qcom,smb1350", "qcom,smb1351";
+            reg = <0x1d>;
+            interrupts = <61 IRQ_TYPE_LEVEL_LOW>;
+
+            monitored-battery = <&battery>;
+            power-supplies = <&pm660_charger>;
+        };
+    };
-- 
2.43.0

