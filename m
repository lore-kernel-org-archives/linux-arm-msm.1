Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6063F37204C
	for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 07:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791703311; cv=none; b=XYHRO74Nr3NbiBlEKlWyQ88PLeX88y05Mqhi/H5tIuLEZe+jDVa3Ap2O0pGb3aQtaJDNIigk2c6wT+YnYOVVK6s9U5KwXWezg8k0FNLlKeoEqaRy/kMGPpEIl9PyvSGiFAzOS1l3f0FG4raxUfJKizr1xPIHloX8ov72rnCUfkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791703311; c=relaxed/simple;
	bh=CW/YAYb1vtWn6URZaC87QGAL4tKrBeM3z6okiqv7OyY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MweFMI8Ww8KgFfTxqyHi3HhPPPgu2Rrp6yACkqfaLIzbFmzqJ8cJblJil34k5wH/XaiX/4YGuWU6S5KprOzleoykl+pj1cE7Eebk6kZLztfB14E1JaSMi8R8pPOUX0JVSlSfLSGkc6DuZYiFglksgGdiXNEwwaabpRjDw7RYqH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfQ5ozgZ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfQ5ozgZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so333265a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 00:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791703308; x=1792308108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0lGXyhozolZaf2R6y/wYIeMjrbWniClpdVf/8X5Bfuc=;
        b=jfQ5ozgZYs/Ogijt2OIQ5Mpoe+RKhbrB4Alb3v6gTmFi2xB3Ofx9tJI8tnYBmq3y4F
         9WUL4dEcvpohpw2IZ3KJN+xoT9OBe0KvDMPnkwIBoExJ6pYjUsXdjUhJG7dLwsP8/z50
         RM/uwW4nhiRr6wtKpt8WNZ3bz+wzmDOT8KKe+6h6oeZ0b4yKKxabTZkiXgXN80Mj7CUS
         86Li7J+EiA98Dy8ajtNr3auN/fELymI/6hM9LJzPwojTaThxQ7KBdU8/K1PYweIb63gv
         EzCbbFXynDC8eOGnyog96tdoJsPhcdvO4ulJ8yYBKOhjIMfSwBrzTj3aO5I862CGloOA
         wiuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791703308; x=1792308108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=0lGXyhozolZaf2R6y/wYIeMjrbWniClpdVf/8X5Bfuc=;
        b=oxeikibUtr5x6MNOFzvopmgrbWbqlLfGIjy50G7s3Uar6Gr5aJ39ZlIaK9kyRRZZA6
         8hIitEsCKFCWWNCQbaQ7Q7hEyU0pjr122nhOZTCI02XW5cGxstQUU9P/cLmpPkuiSqbY
         6OwU4HYNc/OCafMYFcTSLwqsKhcRVgBQHGDaK3+cKSRNIwnZ5F0j0kZ8dnMPkOSev+zL
         GsRGa9wmyXdxgsBgDS0Ar3II0Vo39oYr/2volb1gsdc5P7zEQ1hmq1vHqkVwAKH80vuP
         cTtchCpPy7KermasCI+eId5WrbZo85nxNAYSwSbMttZsNewVO8HGmB7sc/iQjg4oc3JK
         Clbg==
X-Forwarded-Encrypted: i=1; AKwUvBz7NapHe+U7KddNlJkrYYnZ/RRoYVn98oGlRfZI7XYy6/vRD6sF5Fq2HptgHKZcnAT5hz5jX3I0kRh66ndb@vger.kernel.org
X-Gm-Message-State: AFq9FYLQoircMciRu8dKB0tMxSIL8W0jwmz0CA5DWn1CjXEMzsG+QenB
	Q5tK5oFWNGKCBvJPrVZ8yCYogGLThrRvtJnk/pth3D/uW7q49NjJybt9
X-Gm-Gg: AYBFou3Qsr7VxAY2HJM/NYZHx1cH7c/gBb67iYcxdhl72poF8Qwx3aiHTOE0yULXiFc
	aNJSWvUe/jtsKfl2BNPCz6mU12G916MV+zy4O57PWb3oprCz0NSLOWqxi4zBQte//yzrCWn7Hbo
	4w9CdKuLz9U9gXlWsBaM92Apq0l9A9DrUclZTRB7P0o9/bZIiwMHTH/R+0attWUea/hecyNvaHS
	2hEKLwRSHQRzyPBGhDZVE+HmnSR70q9u5hR19R1wi4Z9qsOxQZH51JJzjW83OhlZL+6f5ozq08r
	qA8XkW9M6R/j4SiuxPGuaZvbUmJCWsIrTGJ3Ff/LRVmfHeQPIdCyG9GE8ccNhCLsKIxgI7QBx2x
	BgTbo6eJyVIsFVZwf2zrUOs/gCibSytofFFFGumkSZECs69lR+SFmec77f1JFBQxWiQYbZBDnNU
	V2QolfLxVXWZji7FWYS5IMibhWLoE/y9L07tgm+jZfqHH32MYuqJspA5o8Irnvb3BCZT9CjyT/m
	2R9xU14RSXlgs9k56KvYiMpAczqerAtjJImqEUrXOCrVaUOPtls1NHp2wxE75DX
X-Received: by 2002:a17:90b:2d86:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3ab3a746d73mr5472110a91.29.1791703307573;
        Sun, 11 Oct 2026 00:21:47 -0700 (PDT)
Received: from localhost.localdomain ([58.186.105.39])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed053csm11591358a91.4.2026.10.11.00.21.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 11 Oct 2026 00:21:47 -0700 (PDT)
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
	Adrian Nguyen <thenguyen1024@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: power: supply: Add Qualcomm SMB1351 charger
Date: Sun, 11 Oct 2026 14:21:34 +0700
Message-ID: <20261011072135.12757-2-thenguyen1024@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261011072135.12757-1-thenguyen1024@gmail.com>
References: <20261011072135.12757-1-thenguyen1024@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
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

Assisted-by: LLM
Signed-off-by: Adrian Nguyen <thenguyen1024@gmail.com>
---
 .../bindings/power/supply/qcom,smb1351.yaml   | 71 +++++++++++++++++++
 1 file changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
new file mode 100644
index 000000000000..e08aeb4775e8
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,smb1351.yaml
@@ -0,0 +1,71 @@
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
+  monitored-battery: true
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

