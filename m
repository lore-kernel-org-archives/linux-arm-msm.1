Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437378;
	b=vGNTp86dWijqydNkor3UHjtWbaW8eePcAjvQJNlEDFC4cYWmci3UXs4xgo6FSX6MKUlH
	 50cq1Uw7C4pAx5ngfTVC52oEhy07+XW49pCkygqFoaDpWclsd8v9Crwbcv7dQuDmtdTCf
	 79AF2Gi+Qr5cKMIXPoLW9pMBaZ4c+xN/NCrjCPCTOz3428kO/14fX/j7urAZ7K40l2Cir
	 7cU5BKA7UFHlT8UHYy7exlrg8XjkL9Qkx/PquulDkS1vRcxZONBJ9VUILL/vLMWBymV/Q
	 DedVKbySx9sS/jmhOWV7tVwVo+Y51lHZzHBFf6+8Neh6vv0crVT28UjNwD7/lD8M2Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437378;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
	b=I5wVu+Fo4YxWwn/euR6HPNjQFuxtHvBV0vCEqgQ2yv/r0pM1PfRrCo376LDAcKz03juv
	 EMfEhcvdRcR8WwDqp2/Bjn42yIantkty33gZ2NroH2Uzp4OoOaDG/1wuGkh0ZnhTVO3Ty
	 KnYGd+kaxHhBk55vVjfZLCh1VLiBuOsOS0UWb8qwkFDuPau9QgFEHBHW/uHkZ7PSpZ4O5
	 Ils0X69lRnu/PYTbIWZjeem33sqsgMAYFJOQJiIglVGiPJoGyv5NyqWDF2bGzuGE42kRS
	 yZLOWljTgK6/8SO9lRjj+ZwpjfLXvo59ACiMyICGr1jIwld1UVS/6JPX2DBrHzoK8nQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6i2UD+8;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC56606A682
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 12:36:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC56606A682
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R6i2UD+8
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-15dd124bbe7so1858918c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 04:36:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795437377; x=1796042177; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=R6i2UD+8+1SWXf6raMYqaGU6H0ZivEnYsZ600TnGXzjRiBt2okNAeVKSlYBYOoW5Nq
         sTjhq6t3svnLQy8/KKx48rxekAp41/oU8wMvLXcUJHSlB5ws6nby/8WiCuiIEWqZLPUr
         6OGGhhdkAW1bGGOeS9cZHZv2TtjQaATT+kczHXZnkMDVUZZZvTfIXWopXsEX6nkGPNCE
         +7IuT+u4Ag53FHsuExyb3aJTlEaKFfKiNEBtMP6fFKFDY5fqs9/0WjfiJDyXqyqAxzcp
         2ShqeKYlzL0+vd4juk0LrKZE8XEezjB3tuvKz1g483yqW+hjXYLFccv2syX2DSBi9/YX
         lD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795437377; x=1796042177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3qI+mCyJNRelKwLCc2C0inNZM4PZfqwRA/mGvnNAgm0=;
        b=QkvaU3m75l1q0YLvXydbF+q31rBwXqfpdRNxqPjokXhDeLjqsAGkeDTfjUN2FCCDUQ
         sRYasfjqHoIWJLbO0NGgqi9BwBdcFJRTxm11HdDyRgKX8gC+v8ZeSg67qDWsPN26jV4K
         chDUekrOFs4VzC4fAtTUniBdMtDwAtv50w89Bv7nD0JEBhe+fC27ExyD4TiOJASlo0ph
         zrVUOoQ5YR/6a3R7uqWZ1nFH9EnN3xevOwjlM0jGgq5pFpMsvFgpj3bArbk6MNdFZ98e
         m2gWzPuFbFGBdgUzSeo44gZqIn607VcIZKi+8tg4fN1ZSQiAux3jusxZ4A8LLOgUEa6g
         eqNQ==
X-Forwarded-Encrypted: i=1; AL+hErFi07xFOUGHo75UGagwdGbfCaFPOuEKKqN07PYv3Hhu/lUES8+T9zq+UuwMjNlQZPid25E54A7UrNP8SiDc@vger.kernel.org
X-Gm-Message-State: APuU4Z8kKsYhiSOlmW1gCM5HBQbGEO+8C0isi0D/Ywl0KXMivrOZznXw
	srfxj8hhj5JfHEi+6NGkkV0iqjRAY24JdwLTuhpxeI7Slpg0FlANif6j
X-Gm-Gg: AZFdTZcnqUWUs4fB1PIPm7vw5421kunxgKJ/WpMiaTrpqzADwNkzhPtujxijvHT0HKY
	PgtebOrDvekUl3M8l2+tYrT9zs7TcXN8AW4U/ggXlGOBT/JTo//j8yjWWWRkb+Ds5K1PwGVop3t
	KzRfK9KXUdfZZK6Fg7Gzpsp51bOg2NSD9A/eequi+9T1B+iGTYecnS28L+Z9o149WYHHotfXX6g
	TS3LoxXqKxu5grpAIN2bd1ZP8g4ZDX3uN89qDwPibt/wAQaD8AJy4sv1XlbAxismqFX5SUOCstZ
	HU0ac8ry/7H1P6xwXbaesSyrDce6EE+kCgdi5i+lnqd6zbbrGKtEMbR2OeBfp5UiELWSjQG8TLc
	a3VUsaNa3k4dX1nRL6H2q6H7onUh6KS/VgGuzJrTkFpPeFJjT18iOnX4O9JOIu9dznW/arE6eOR
	lVVfIS3oyQQdbjXOlQhGAio40bV6ZGzSTHHHq2gnfg6ra7aggciJ86l99Os1Fkrj5ZFP4QSC6P0
	MwSyPloj6KvrnlTw6BNd2ZwnygkCvwJLjYXLS7Qi9nlNylFS1+2RZ0TKxC/qbm9e6iDz7yzulnu
	x5qXuMqg2uiI23W5cq6MWwgwNUxw1cUK5cldfK3crRtfE7PrP2CwV9H7xHye4+q7FaY=
X-Received: by 2002:a05:693c:88cc:10b0:386:b306:4ff6 with SMTP id 5a478bee46e88-386b3065916mr2485851eec.21.1795437376602;
        Mon, 23 Nov 2026 04:36:16 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm32854353eec.13.2026.11.23.04.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 04:36:16 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hikmah Gumelar <hikmahgumelar@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v2 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 19:35:41 +0700
Message-ID: <20261123123546.152162-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123123546.152162-1-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
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

