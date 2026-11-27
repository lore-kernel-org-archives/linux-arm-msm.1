Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795787141;
	b=IiwJpV6ajVgp0/bMx+EjaUq1iPVCqC2163eAah/iOXGHgni5kuMLiH0qo02fia3hDib/
	 D0jTqj5bcX+BZr0+9Qza1w6FabV5+AjhSxXOPx56OHaXaHazE/bkt+DDupBDUL887RrK+
	 OD1kUvJbeOEDBc0cTYyoux6NqWi2yOH9TXfk/JQ0mbapSj1bHql+fW7qsLtBtLYLjA01G
	 Lf4hoNcq5Or3iwWgcNxS8J9jcRMJnuTpGmZA+XBK/qttTyAyd4vM7u8YZ9HINuOtRRq4t
	 OR25vHvWMCtpp+jSgUHMB1bmHGCStj1hYJvfHmSfD5oMM+WnN2cVs1T9tSf7vKIjKqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795787141;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
	b=mxflaRz8NqprHH59XDwQ2XLbcSULH9AzrDX3UBin1GN0Oeb8yG07jiW7m25nk5i0jc/6
	 f+MpPBjC6oeta+JfBgQ5UdAHAaRcG96WKy4Vy5TaA5hSKiqkKAIzZeHblzkoWwmDJDcc/
	 OPVpbmWVJXQ08nt1y/Lnkhc6WLojvHy1me+79a4M+ZxXiDKa2r/FRfBHMFBvCko+hCewF
	 Tfi6SdBgf/tKV9DYNRR0EOjDCuKcVwOZ2Laxe61V12a4yFjzphTEHHJoPI5IVxUwaIYZj
	 dVxNOdAND9gGRpS1YQpNaFAKPrwJ/L5b7Eg1mlk7RxwlpNBRBLDNNTt1pkYZX0Y3NsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqWC59HF;
	arc=none smtp.remote-ip=209.85.214.176
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CF5606A338
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 13:45:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3CF5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zqWC59HF
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2f066274caeso38782955ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 05:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795787140; x=1796391940; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=zqWC59HFBxeqnkwiJcA/vmF7PXqaSn4cPlghUfmvZNV5G3RaxpsuHbuhncRjcKUvVL
         RgVWQMgdXN58QHoMug3raBl6dLYdDukfKBAcgyeL28e2BM5cL5Hxg45qmG4jBDawc7S7
         lAEjzMp0sak/BpEjHW6drFOVkxWkD/DpzpIzeKtu6KfB+8s94kiR9T6TxqTYjNvoZOVW
         uloDbZg5rFJzZY5VgoLAdc+uiTL38cnKFgWeKaB+TMTTtan+bHjkFDVKszaB2FV/MKDt
         qUJrHVLE83u4ZrxeAcFD4bNulHhzew7Ez/XbUGlvtHVKZZZmkem3K3rPoh5EatDDP2EL
         X1tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795787140; x=1796391940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4pF+Ou2aaG2HAoOOE5cGua1SJMvhnFZGEE47jSLez/g=;
        b=kr69XBteByOmxuhyUkWMPmNdjbUNdXM3J3lvMedW+X74r1omcA7O37yDhsfB+CFnTX
         gI/lgzzYrYNR3cCUDL1WNND5+xw5BLvzuKwg2UgV6PSFMxAHZoonGWFh3WW4POljqNr3
         EwKZIJ/aCNRGKN+fHdDJ6Cw0Fn6U1ImVpZn1O2at2bLLm5THazYsGEqhD8+qwpKRQVjT
         BSPSDsR18arFa4Yc9W+U4MWJa7boJZZ4COHsBRMQEbMTaOt8pmC/trAMCd7ndSG3eP/d
         9lvU1Fj2/dM0snNxiqWPhIFGc2jjf4D/HPcs9bCrEylGv+pT/m6OhUbdZvYHowkhbtrD
         OkUA==
X-Forwarded-Encrypted: i=1; AL+hErEN1eqoSMIPHbGG1+g6KixzbCdiKPOBemC4ChLHl7jM4z9H/utwdiMxQRWK8S5cpvculeX6+QmcxoG0cDBE@vger.kernel.org
X-Gm-Message-State: APuU4Z+Osa4XA+0RYCQH6PTEZ3D4pdZN8XzgIYx4C8XMmmyasQGNtDpD
	UByCWAyS9WhsTH7+RymCzmlwqrFzQ2UubpTM/ovWIwY/m/rGQyGrhbBU
X-Gm-Gg: AZFdTZcODx/G0GlhNtK3zcwLeThVX7ndWJQXSpnVcTYshs68DDEVzn9GI4dANk9AzTX
	M3JK6htXhUAiloA8neafiaXMrZY6dSLCQMogBvF66t04nC3VZXeNdcJfkzPYjgQbc3WOe0henqv
	EP+OnRQcxD8Eu/VtiTQXcSDE6/lk75bwhokBUuqZhPh+NtZ/8A2jBU9zk7bFEBZJ1o3kJcwy7q2
	D0wur9a1jTMIt6VoHKuTi9LHqj/5HrwrOzbUx5MqC6RijPfMALuUTDdrqAo1eP6/Eb7mpInVtA5
	QYQTBzOaaiHjFE5cfCE1m9IcHSjLlPllN7d6kbCq/BTHOcqMp4lpCfgkBakqg58gWNW4bZ+t8R1
	AtXU49mC92yJsdQdOPoPwVGvY1tkXFMEb+3ele9TQFsz4sSLHwRhkn0LESkD53GZ+AAolw1nAbO
	Pn8ADqmKKp+RihIdcntxiJOVvLeK7hp1c4a0awmBV7yhQtuHElb/50JT+AC/kktRGJ8qrFI412j
	Me9HK68VMxnBHQkAZKy/9/GBC5+WOiatw/cOhtewDoHYz2zVlZkro26Y/KwFnZ9FuqQBJP4bezH
	NyNIw3uuNf5zK2PGSPCCeEez/M1LzI7w+oAaRxTGrXfixQ==
X-Received: by 2002:a17:902:d2cf:b0:2dd:b6e7:ac1b with SMTP id d9443c01a7336-2f03ef3d3b0mr270576165ad.2.1795787140051;
        Fri, 27 Nov 2026 05:45:40 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0c1f2csm121741545ad.22.2026.11.27.05.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:45:39 -0800 (PST)
From: Hikmah Gumelar <hikmahgumelar@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Abel Vesa <abelvesa@kernel.org>
Subject: [PATCH v5 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Fri, 27 Nov 2026 20:45:02 +0700
Message-ID: <20261127134507.125513-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261127134507.125513-1-hikmahgumelar@gmail.com>
References: <20261127134507.125513-1-hikmahgumelar@gmail.com>
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

