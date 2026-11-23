Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432115;
	b=nR8G588ryXxV5CjfBdS7U+sDqXP1TNbAIjtOlnvd3cWfUSZjAEAOCjSMaJy56VX5C5Fe
	 QdCDjepI/Yo2wv1mm1Z0X/G6We2p4j61QQXAJ8Jg3DtuHl6UKWgMs10ws03+f8EELfDtp
	 V3rn4apnm3PaJMhuZfbBIDeojB3fehaTKIBzAX1oflqBK4ucBpoiW47DckfhtfoOHWDk7
	 s5iYQrxWmtUD1KIYD5XTAubY5JqeFVtzXigKMBFdeZdAW+Rbc0VD9iHJTvFAzdGbuAN+u
	 uY8Ux/QFjtS/OfeNkIhk2xdD4snxaCStb4+7fjfUDxV1rUpm5JpBmHVJQhlWMW4HLxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432115;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
	b=KAAk9OEk2gcucMBJKggnXvmFyKUAPtQHFc/cto1WsDt1tehyf+KbQwvq2hB7jnUPUFW+
	 u9pBXrcw/XLfkG0xKdu6+r/4ANaMUKoJVluGLz4EBGvLKrxbls+qnElZH1sc9vMAeJQ9n
	 Joidf8avXqsp06+sunQekMaogJ7fR6SZctj8PZbJD4kRszVBkjGw51pgANXQ1mEwB58MJ
	 sb5dHO75iUOfTyu8S9dcROn4fTVPWIpxFc4s3Xjit8bfrYKwAFjCxUy1rSIrmTPvVYlcg
	 0aC8/nv+ZiUdQmlePS2qS4jxyMbbiqmiSLpwWV0x8rU2wp1JuRUFHihqMvONq4Wj1YQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdMpA+3X;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7EA606A321
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:08:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E7EA606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=kdMpA+3X
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1b3acec6677so4401593c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 03:08:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432113; x=1796036913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=kdMpA+3XEIpWJhRS0Cf/pmEdcgIkOQFvMDyFXDhVHlrltr7setMvk12Eq5Fw/oUozO
         ARismXyoNbCSoI01ed6CtEwAy9cYw+tXXBPhv/0+Fr6Tu5sxBskpG7CN5/+XS2alDltZ
         sNDYUqnOc5ZXU1EAOUmUooKZgc/OKtZSTGBDRgWf26KYnmIgGVrvbP2lT/n/n5iWEqIH
         c/nmBEfIw0e1dCac2inrtRLqu5kewWHzHfWn1euJZedgvxfVLOcNnrGHCzc5Geo2LAmX
         vCzjk9trv0j8wKgVzqsSU99Zvzy0q/AR0s6oDGOiFiC86Hzw8Qr6VQDdaZmegnZT1hgm
         xVDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432113; x=1796036913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=juwJSElkuTZTjlAy0EAfRjHcZzdFHrLQA/izVCYAfJXCL5rBM5wMMIxncdZ4R1mf5e
         iAaz6PAvVpLfrDt8msN3r9Ko3aE0oljo+fTZ2Sko3caiy4LMvyqYJ0Gn83eqEgMzxlKv
         VTXPPFn0107RUboeoPNesPQBGCRxLWEFr7vFgUI9Rungpd84yvAKu3Z0RqVUZsaeyJ+V
         A1nx5JC0bv0XPbkqhTDW21f/xpBZYMtGzc+l/5O4U83hqD8uIjFPi1byNcaYjUpXy3W8
         x8TbFkmrmkY/l2XfmNbQN9Jhfxu6JbX1LJ5n0jzMlJSrfFrE872slaDliSeAh3oa5K9m
         e7eQ==
X-Forwarded-Encrypted: i=1; AL+hErEvh6Kyi0YMhhQ4TRazsKaLjb9+mmDEducapS27igg5CcH1UH6z/G/K6GHJZb6/uPnVOIRdfkDzNfCcc+aN@vger.kernel.org
X-Gm-Message-State: APuU4Z8kJ7QDUnad6SN7GyozmwGTbFq8LiLVFELfBMw/odxEfN5wi0lv
	+9/gs17RnoTsR/sfzKslaVx+cgdPvUyTp9OuojjQvZPSezbMvySAgxV/
X-Gm-Gg: AZFdTZdxEHpWNOphAVBmzUkLEP5UI5jkD9Wk9mN+JTzc5hscaJfD4I7bti6NEZmcZTz
	9scTbwyWPG3uvfUrwhj+98P246vZx3yvdgLVV1tE0S0kB5/CzElrna4rDbaGkRaFJctdyBiiH80
	R6+M/OvzOVUdRKSYJv89DjuBPkoiUWlnBpYmiwxvjcR4R2/7nbR+rG6hAutJH+E/9aw2rLRy5j0
	65MWPMlKARXBwigomPpX8n0nRlvilS/AwimQ83M1N35jgJTO7xN4kI+OD1CExrwEPW9dIEB3B1J
	Ek1elpG2v3V4fq19kuO26A0wc7LQzh4s72REywe3j48RLjci/pUyKtsjEcqpUWPVuFdyoQgvBVx
	lBf+0SVtcOclfGPspdT01jx4hAgWcsfPWOgscxi5R6vHE0quuJPYH/1TTBfovUM0VzD3+39qL+J
	+b7GSlPEC91DYdcAeH52EUIroDOXIrNX2FrhY5HFdf7Kgg346/s24JFgPYyPMfSHDPHUrkPJCr/
	wU20rR5k15bAWXXTePdXvVhUSxD/loXOSC8P5xYmUr8kqpLkfp6GOBPawdx0acnszf4rpR7bU0T
	oecHspsMX39qturtDASklePA4OCXErFD8g2HP2qL/oFnOw==
X-Received: by 2002:a05:7022:3b8e:b0:1b5:10cf:c402 with SMTP id a92af1059eb24-1b5568a17d9mr12384482c88.10.1795432113393;
        Mon, 23 Nov 2026 03:08:33 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:33 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/6] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 18:08:01 +0700
Message-ID: <20261123110805.119610-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123110805.119610-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI
CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..0e440209c3fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
+
+title: Samsung S5K5E8 1/5-inch 5Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  Samsung S5K5E8 is a 1/5-inch 5-megapixel CMOS active-pixel digital image
+  sensor with a 2-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: samsung,s5k5e8
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  reset-gpios:
+    description: Active-low reset GPIO.
+    maxItems: 1
+
+  avdd-supply:
+    description: Analog power supply (2.8V).
+
+  dvdd-supply:
+    description: Digital core power supply (1.2V).
+
+  dovdd-supply:
+    description: Digital I/O power supply (1.8V).
+
+  port:
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    additionalProperties: false
+
+    properties:
+      endpoint:
+        $ref: /schemas/media/video-interfaces.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          data-lanes:
+            items:
+              - const: 0
+              - const: 1
+
+          link-frequencies: true
+
+        required:
+          - data-lanes
+          - link-frequencies
+
+    required:
+      - endpoint
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - avdd-supply
+  - dvdd-supply
+  - dovdd-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        camera-sensor@2d {
+            compatible = "samsung,s5k5e8";
+            reg = <0x2d>;
+            clocks = <&camss_mclk1>;
+            reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l23>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <0 1>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

