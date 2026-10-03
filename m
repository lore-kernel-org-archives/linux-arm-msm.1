Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009D0345EAB
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 20:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791058919; cv=none; b=A2rUuxsYu9WscViB9QNKPYD0QaI4j7d+63Ysc/fZv3ryktpX3bmw5BTuf0lUXcVdByMnmk8hQcK+WijDDAga5MzH+ScE4J9hV2HS+sn09hQbT8RZOpvebyyny9q4TG92qS01ibzcI+EPAN1YTVX76mMAY2rpn0u8GAhgwMxFHZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791058919; c=relaxed/simple;
	bh=ashavTxgOUJZqoPInhEpeZj8vfEg6zTM4bvI0mbKNcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahNPYKXvZRViBcbqJtrbHMHkAsDjOyPrwxYWKKMFR+SADSj0lMAZm8VH2EC+1c6G8tmbYCbrCjPV6lshZCyxUnUJWfEmHjTrkq1A8DA+irZvDLVTRDfLxHqNNlYC/hHBkrGvfMUJNLezYI8RJrUjaT+l+9MYAf1Z27LXcvOkeo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YXaninCE; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YXaninCE"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48b9d8055dfso441952f8f.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 13:21:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791058915; x=1791663715; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YMS0fznvLZomihe8C/oJh3xR5MqfRPhNrCBOy3H79Y0=;
        b=YXaninCEyJFoYTbARRsXKA5GvtP6ufWjXg3bIjBprDombPYdFnJ3czmj4dD4IeDmRb
         Ty5enD2vJ2zdJ6P6pGBM3AA+LH6KEVCgNcrwYbnAGS9VyOjIcDFauyjdM/dCv/dvGzLG
         QkczVyRhWzPPkeuidzTnSzTssodwxWZCpaHlqSUAhX1ndFLviubDWP3UkgX+LeGCeQUp
         ZoIOb3mTCfqTirN9bN7DBDjL14ni9fUtiJvvkdSPmnuazXY7EAdHChbN7C8wYGnzYW5Y
         i/K2W7ljP/Vju3N/JoQzswh5pIx3SmJSTzYmvM6p99e0AWyJHei02fFHKyCaFpCcaNGl
         INGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791058915; x=1791663715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YMS0fznvLZomihe8C/oJh3xR5MqfRPhNrCBOy3H79Y0=;
        b=hRkT6fIF6fIgpw8ARUJbcFePBMeMkP5F9EOz9jrHARVPzVkneWAdBfFOkjRvXYtDTh
         PC9Reuw2h0J4Y0Y9fxX1TFqmZjegkEjY7LbmQMJDkOKWls9B9Vwq0F9LXMiQB3TrDaMz
         vStJV0m80YGKlhvfeKeqDnfayUmh28OsGXvpvCDjFyV8nb0Sx2/ioLfbn0ArwfH2ayDa
         Ubj8kQjeB1gcKnhm5racnhafU4PMr2TASTvKIPQ0keBHTk3ee1a8w5RSvxq18MihoWVg
         QKqToR9zkAT5Pm0dFJU8jl1bqzj+CJUOfsbbr4R5UBEJ/ICgZBG+XxW61WnDUwAVu1jx
         gBbw==
X-Gm-Message-State: AFq9FYIB+CRM9CSjXXa43GmBgVMTsblY7bFJBPBBz30j+ep0Zb8cyKTc
	6pI6ygeZIxuV7vD8xeBcCw+qFmqRKwPv0rExY5qozvUCfEmrAwKfJLan
X-Gm-Gg: AYBFou04mkFHRenewKWO6QGPj3RE4vAikEKiLCZlQE49DHrXdnAzIz5j03ExN3iNcuQ
	8OtOYeNQDJVVbscJQz16zYOd/xp8J50IxAcaKllsHq6DIoWVbMR9AMPn/2fi2TYCBSwzYIqPXw1
	xWGjeLcSbNbqoU4mJVxlDp4f8L9Q68yudtp9nHknocptl4gBmUx/FsD6Kz1jSYrcLCi5a4CRyJM
	Cr+IdreVW05zp8Y4Ch3O/NAa3JsIHqlFnDoAFpIlGEpvnrRxHFVJZeLv+yUGkeXXbwZQCo1adoM
	H7G2FrxfOxeDJOY23eT6GARz3YgYZcRARmISHxoR7uAjn5fZBDL7dBDNxQMxDScD3lgr7ea1HUA
	Kseik54plvuRbx6InjZWsfKtWlWzUvlBjDy+FdQRs5kw6NmaZ93OfnUSVwgZgiPxkEIEv2DTkP6
	XggZHViqKWK6aUB64miQmQvjoLqLBwFr8DNFiQBIutAtmG2hxdKVvsGlXQ+lwTpxkBEQd4RLoEi
	VK83g==
X-Received: by 2002:a05:6000:22c6:b0:48c:466e:9d06 with SMTP id ffacd0b85a97d-48c47fe73eemr6546300f8f.20.1791058915157;
        Sat, 03 Oct 2026 13:21:55 -0700 (PDT)
Received: from localhost.localdomain ([94.252.75.11])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48b380facfesm15083316f8f.23.2026.10.03.13.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 13:21:54 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 1/3] dt-bindings: embedded-controller: add Lenovo Yoga Slim 7x Gen 11 EC
Date: Sat,  3 Oct 2026 22:21:41 +0200
Message-ID: <20261003202143.4697-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261003202143.4697-1-okerixx@gmail.com>
References: <20261003202143.4697-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
address 0x70 and is distinct from the Qualcomm reference EC that the
reference designs place at 0x76.

Signed-off-by: Oleg Keri <okerixx@gmail.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../lenovo,yoga-slim7x-gen11-ec.yaml          | 56 +++++++++++++++++++
 MAINTAINERS                                   |  8 +++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
new file mode 100644
index 000000000000..37337de86b0b
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Lenovo Yoga Slim 7x Gen 11 Embedded Controller
+
+maintainers:
+  - Oleg Keri <okerixx@gmail.com>
+
+description:
+  The Lenovo Yoga Slim 7x Gen 11, a Qualcomm Snapdragon X2 Elite (glymur)
+  laptop, has a Compal embedded controller on I2C. It reports board
+  thermistors, battery cell voltages and CPU fan speed, and drives the
+  keyboard backlight.
+
+  This controller is not the Qualcomm reference EC that the Snapdragon
+  reference designs place at address 0x76; it speaks a different command
+  set and answers at 0x70.
+
+properties:
+  compatible:
+    const: lenovo,yoga-slim7x-gen11-ec
+
+  reg:
+    const: 0x70
+
+  interrupts:
+    maxItems: 1
+    description:
+      The controller pulses this line while it has events queued.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@70 {
+            compatible = "lenovo,yoga-slim7x-gen11-ec";
+            reg = <0x70>;
+
+            interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5c57cbb68060..0bc10ee20cf8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15063,6 +15063,14 @@ S:	Maintained
 F:	Documentation/ABI/testing/sysfs-driver-lenovo-yb9-kbdock
 F:	drivers/platform/x86/lenovo/yb9-kbdock.c
 
+LENOVO YOGA SLIM 7X GEN 11 EMBEDDED CONTROLLER DRIVER
+M:	Oleg Keri <okerixx@gmail.com>
+L:	linux-arm-msm@vger.kernel.org
+S:	Maintained
+F:	Documentation/ABI/testing/sysfs-driver-lenovo-yoga-slim7x-gen11-ec
+F:	Documentation/devicetree/bindings/embedded-controller/lenovo,yoga-slim7x-gen11-ec.yaml
+F:	drivers/platform/arm64/lenovo-yoga-slim7x-gen11-ec.c
+
 LETSKETCH HID TABLET DRIVER
 M:	Hans de Goede <hansg@kernel.org>
 L:	linux-input@vger.kernel.org
-- 
2.55.0

