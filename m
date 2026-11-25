Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609965;
	b=wGZBGr0vcwYwBb0HusbGiQaMe+G1os5U/1vw5Uewrm8eKyw6CGXVJ3jl7TG3sYgPgful
	 qRT6UEkGfJ/bZtQdXwluwoDQjkTsMjy99xLOAiKQbxnEr1EjVqLPoN0xQ3cEvYiZ5iIte
	 4UlryIvh9XHR17FoTjRQs/aooYAMrpVyCoNeTBqOR4bzU6Irjy4EaPYk1hPPtonNv9d5A
	 2QcwTY/E+heov48Y+z1K0scJXucsgXaVsm9iWme4XzQ0DK2OfUXg1ATB5vprmuIy7OU4W
	 fse1e+OS24FKoj6Qqjv/99mYB1ihGNMEzvtF6LAnMUHOF5wlnsu0mMgZQLQpQaVEufQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
	b=OnBt6DxWhaG3mgtXCQYojWXFMkTzymxe4HbQkLvalbqbX2kfgxV9WN0PQuJ/W786Outj
	 QMcBiqr+qm/hNvZ8PQAcgIpq64bMMg3txcaXo4wa5Qj/MAxew0RKq/kDA0Wz5jxKx0Z5g
	 WkwmdD2IJgxZVA0zn+hWK/zkoJTkj81MANt1Tx4yTAGbIHqYAkB75A4zYCHQuAUmGxGQf
	 cfzoe/T0cKpsGrABQguz2lW5V6Po/+VqZ5fRRl+prkJssu4iFvB9j1ugKuPqBvX3YsRBR
	 Z0uhAA3qaixvIGAQsmwOJnnar03pA0svYAF+uAgpKj4fzjZIn5YFTWYWX2Q6uY74DxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="NANt/KWh";
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5D4606A334
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:32:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E5D4606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NANt/KWh
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cc751eddf25so3700184a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609965; x=1796214765; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=NANt/KWhIDdvCOeY4utjDOeqLYM4twhmFG1ItWWr3HFT9jCk4yOM+BgBGWNOd5ahZu
         etyEMApCd3o8OOE7+A7McFA3J75fbpLKjLtKw4hs8S5XrQQ3oi6X0ow3zlWFZzwAzFtI
         wLCY/cPCP0Bb74osRlvhcYTbXoe7C86voPzvRciY/wVa5IvEHzGTJpVQwj9Os04aI/v+
         FDcmPfmq+U1YC6K73kI0mm49vPu2QV4pucYa2aEF4YvQWHV23zNY1kpx+bFRH1NOOu3K
         zYibLiQlcmSvn3TzewhtK1BOYPKuemoEFLkGTqdUtQcJKNSFWRXHvmddFInF3mz273cp
         cFfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609965; x=1796214765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=qdFj2CX+wDjFPQ8mSUjXoLL29DCkR6de/MD8jB2zE7VnDUqw5QA8Yj6fPBxN4bBw3W
         Iefecdrc4AZiM/yAj+hrSnkgJRniF6u4a9+5cONoC0/TSslKB/istaywKFYobRn+jRRf
         kMRS2XxRPDvNqOpgTAGNg2QmdwxOa9yLo3v9FZatnLoNR92U+OhLwS5WA9kuXFFNZV35
         /DAPvWVbJ4GfD+TcTwowRiRZo1nB4ACLP/Nf4+44Em4XNNbkcOYVbrtlB/jAJU21ubRd
         YLQurQIu31eGN09L0DmvearHgHNadFLpUVeSmsxA3d45+2ys6lslbCATzc391M9TqSm+
         Tz+A==
X-Forwarded-Encrypted: i=1; AL+hErFnJLKNfUGV8rhrUoHPrrQYKFCuWMrfrkyDlKoGC3oS6ZepzWWb1egBq9RLCSt11TOH864Ub4JEqY/W8nbM@vger.kernel.org
X-Gm-Message-State: APuU4Z8ckR6pyWKMuqqOYZc95tT/LidAaELssL0wtCZ+rp8Z+FOA644e
	V87DH1Oi6WP0diZ+857ydZpsu0kD41HQfxN85P0Mym4v36y9dlsaItVU
X-Gm-Gg: AZFdTZd3rqniO9ohqY1IPNiJkDbT/oi0KOf9f6Z1RsWO+nKtQE+gOVJpxFaUC9id3dl
	+EMkJZtRNqVEDmHQnw4506DFCc/ryo6/DAps/6f88W8IAvITRT+nFTEBMBbLOyWYpck2OMDJgQA
	HhOjCWNj5UFZZL/XiO7Ff4J/KmH8/fHGBg7Lsxy7yYyks1CMYQP/oRvMFMqRJGIXWD4s4+4HSHo
	OpVtlVl/1QjzU+xUh3NCuLar8SikgNFWE/bnE6p+BM38N1h9rUOPrqjNvGOe553eJdDhjuhDNsH
	qMJLnjjXIlq7QUrqx6uJtDbI1aoZTLUl5Co/IxJ60zoHBofBhKZDMv6ZVUJ401nt1Xp6Uh5Idbc
	WdEWDf7KL06y/MxcPnoIIiRzRXn+gXjlIhYqv41wHBohfLoqQbNNS5cFaxM5JyVwBXvtsC9ilqG
	z87elPg959SIVPKjnO+ILdq0sd7YfTrm7xKcSA6bg9QNAYBbYq2thLnOhbZsUjy6UjXaCrk86OX
	02XBQ2rJJwo3GyntIhXw0cxahFp+VcHPXPXPA2kconRqX+th80fbs4CeHtPX1MX4SvBqYlUw6v2
	O/7lshEQLbuatbFgcJWtc7VJ/70a8lZJLon5mW+tMMkceKg=
X-Received: by 2002:a17:90b:380e:b0:3a6:e99b:bbdb with SMTP id 98e67ed59e1d1-3b41c9493ccmr17317487a91.50.1795609964791;
        Wed, 25 Nov 2026 04:32:44 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:44 -0800 (PST)
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
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	u.kleine-koenig@baylibre.com,
	Hikmah Gumelar <hikmahgumelar@gmail.com>
Subject: [PATCH v4 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Wed, 25 Nov 2026 19:31:41 +0700
Message-ID: <20261125123146.379057-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261125123146.379057-1-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel

MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/samsung,s5k5e8.yaml    | 103 ++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
new file mode 100644
index 000000000000..7c538e48ca25
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/samsung,s5k5e8.yaml
@@ -0,0 +1,103 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/samsung,s5k5e8.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+              - const: 1
+              - const: 2
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
+                    data-lanes = <1 2>;
+                    remote-endpoint = <&csiphy2_ep>;
+                    link-frequencies = /bits/ 64 <418000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

