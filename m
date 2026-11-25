Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577295;
	b=JpbrJpDB4aocVZpkFqwqZnxWec5sKbYJCD0NewkLGup/DOncfQqOtyO0OpM4PQZL4Pi8
	 hEiIAbvr8Xt2162qCv1BJzWFZ0kJZg5x4ITNhCzFIpG2ruQtqJRaeOR5OkosrtKOAFAvK
	 LjkgQGOWJLKJ5r7lU5Gr7KDlu0KrEAh7u8sQOQlxFJ+KjQc8OUsqT8wA7tAsI1bbgIm9c
	 O3NbOBnei62Pu280xDSElzZ35w0CKWkSE/SOakMkLNn/35QFnO7F0MMIDVeaFPDV2/dMw
	 hzukudCeteaqe1YPdw/11qXIO7pcS6SXkYkaOIxDK89OqfVfMeRquguMVc7Iyv4l7mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577295;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
	b=cTl6NI26DtT8z+Sg0vrSP9Yw0b6g7qeg9cefjxdmxhfL5iS9JLdtPJmsEciP0YVy6oLu
	 56QbL5mmpym7dmvIssl1ZAB80klGXTQ7yn6EuioOP8qaCr8iR3vk7wwp9ykPKX+DOYiWB
	 aOGqUCKug7HXw5h5tW/WUD6GgN7gl6nee5vOpb6yD7w3Ts4d6O7/L2PlcU4BqcD1/v53q
	 p25zLEN0bq1f0wAw374eseNmBwhxZ//w0uZdTwkpnz/C5x0I0IY8WMOkh6mHSeEZfp2lF
	 b4SMzIsRIOGLUvQuAObNMdXa/QtKAMgrmkYNgYWmT8BMYjwErQgM6ixYBq3AjGJiOpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pva+qH5L;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C693C606A6BD
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:28:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C693C606A6BD
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Pva+qH5L
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so3392186f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795577293; x=1796182093; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
        b=Pva+qH5LwkfRhY/HwbuWQ54KdZoI9qwiM2ANNoQjop+Al1lt+Gs2GjJHLVhyECm8Z1
         2CChIklgFlF83RjXCGNzKTVjFdbIyeakGRqfM7vpIyAAloWFT6JAbfBg9/toCxKyOlJd
         xe0Y9nRMliTY7LRnF7+Xl+8iFb1uRZCZFwR3KGlkBm34l64abBXecw4P5+rjfmTV2VXH
         S8WeMlhR7JMXkJYiJrNVOx6dvwMRwMhrxKlkUGvXrWB8DEsZczOtWRAzorpvWKnS3P0v
         aEtnkYsRgeclvDywKMKzvJBSAM0phfesoeu8/WVlmJsi2EO9R+BLhgV4C0eCkJJdYtuJ
         YWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577293; x=1796182093;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sG4IjzQzTOsq8+1nteR/Dqn0VR6TUjyjIc18rbJBV9s=;
        b=lDUQhccSCWhlL6aZ59tHmkYEqEn6Z3NlhuQWAcHYIKceXdfuUfQq7kAP8rltv7uZpT
         L5Of7qSWE78njjeGypop4knjTgfXjxst+77CbGlS1rVFDw9ZU6W9EHvpj9lcr47ibrIq
         LLQvfIO2JFI4LxeLXW9kRRKArUzClM3fsTpPDGAKha6qky4AW8jN7wgb5obknK9SQKyc
         Dzn5Ve58Adigw1Y9d9g/ZvzxpYT78lKRC7bg/lWHpGjRDEcp5rAJjUtz4/0IeXhOTkaG
         7IguTJvvEvAuHP1GfbRD7pUzYhJAnbWs4B0j8yAdUvbMWBgic7IZigJSPu1WK1u+mjmB
         jRDA==
X-Gm-Message-State: APuU4Z9wSJ5qPMWsxHz8nObZlGbeuztY81a0ty5TR3yWJ5dfPLUOlAzh
	OBQz4JoIBIau5Mk0Qztzhm1B2GK0A7fCuAptHQE/TzWOW5kyYgQIIOvvELHgeB0hyzs=
X-Gm-Gg: AZFdTZe3wLmmtatziYCt2W7aPVDiZY4UgnHxmbssU8oSCCB8Xs3Iu24aQgId/wuOzAg
	al8BFDak4BLOZqAqqk1U1/vUrNfoG/NwIPTr/T9Be0EsKo2WoarFZKRgAakbZiGj35vZfsWHBkj
	S3sNwA6HXrx5KHc3jJY7K9AvnoLV6ChSWXnt0b+h10Sa9J7KgsuQZXQiW5mFV8ZrgpNpglmFNsU
	QIZ+DaJM9kC+xETNCteBVP5ZZZT3f1z6sNRhcLHCc2hRSzi/qwXrj9OKMXC65XoF7u5JM7gMiBK
	50nWT4MZLxvUR2q6WMqRgOLueZvz1h9qiEN20MS6WYanQSDDTSBNEtYwrUnaYXNM9KWH9E9kePu
	iCqRDpOnG/6pDFrQsUDfDmYeeaMropu/lk097MF8pP3m0wr3Ym34URha44l2+dN5dzxQ+f6Ybma
	R3vkDbnBFAqGio3o2u4LOgQQvTCKOQz/Xc4uDRN/vYc6bbQR2c6tA6Z16f5kf5XFXbGTTIjxzc3
	qoBUB7/ux5eGHpC6wGynhnpeLbdmaz3Iar8KeHMtf20/pahFyXOAaXNVRw2IVf40tPTkgxC+Jai
	lHtfU+buKGJaX/MlfBQ6KGvzGlE+OWOwMCNc2gxvv88O+jDFdF75HubvwRoByzszgqFj2oheopb
	odnz/gXPiF7InnuJxWC3Vb0oun8wVdKM=
X-Received: by 2002:a05:6000:2913:b0:4a8:7115:fa08 with SMTP id ffacd0b85a97d-4abb0f3c202mr33671845f8f.13.1795577293140;
        Tue, 24 Nov 2026 19:28:13 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm28918822f8f.23.2026.11.24.19.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:28:12 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v6 4/6] dt-bindings: input: touchscreen: add LG SW42902
Date: Wed, 25 Nov 2026 04:28:00 +0100
Message-Id: <20261125032802.8460-5-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261125032802.8460-1-rofikcoga@gmail.com>
References: <20261125032802.8460-1-rofikcoga@gmail.com>
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

Document the LG SW42902 I2C touchscreen controller, including
its interrupt, reset GPIO, power supplies, and panel touch properties.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..e8ef2d325635d
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: LG SW42902 Touchscreen Controller
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description:
+  The LG SW42902 is an I2C capacitive touchscreen controller used on the
+  LG V60 (timelm).
+
+allOf:
+  - $ref: touchscreen.yaml#
+
+properties:
+  compatible:
+    const: lg,sw42902
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description: Active-low hardware reset
+
+  vcl-supply:
+    description: 3.3 V power supply
+
+  vdd-supply:
+    description: 1.8 V power supply
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vcl-supply
+  - vdd-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        touchscreen@48 {
+            compatible = "lg,sw42902";
+            reg = <0x48>;
+
+            interrupts-extended = <&tlmm 39 IRQ_TYPE_LEVEL_LOW>;
+
+            reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+            vcl-supply = <&reg_ts_vcl>;
+            vdd-supply = <&reg_ts_vdd>;
+
+            touchscreen-size-x = <1080>;
+            touchscreen-size-y = <2460>;
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 6a41a0690d9f0..8c88429e647ba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15211,6 +15211,12 @@ F:	Documentation/ABI/testing/sysfs-platform-lg-laptop
 F:	Documentation/admin-guide/laptops/lg-laptop.rst
 F:	drivers/platform/x86/lg-laptop.c
 
+LG SW42902 TOUCHSCREEN DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 LG SW43103 PANEL DRIVER
 M:	Abdur Rofik <rofikcoga@gmail.com>
 S:	Maintained
-- 
2.39.5

