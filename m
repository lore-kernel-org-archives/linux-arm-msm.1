Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795432124;
	b=oBwMigFRECnONza0u4ps66jJh8ai1eKzJ6uznOnVZMQ+uFlj0Bti6KGzXOgzUckTT6j7
	 Mia2ZccguydDTxNz3JjhHaOiYG2BflFFE50jlU83jr02hiUGZ9XyFD9PARz9KkqZlaV2O
	 jrJcfns6OAM4t8/4QATdRifc5tAy8R2OKPvmakWu6UIHOmlURyTPsmwGsfWE9MJ0l9roJ
	 Odr+9JP++c3z0SqqTrBf2/GhAEnD9305Aauybb8q8ogTabxLnLWfrRH6wCV2/d8jSK5/h
	 xdTghXJVs9+VwPJ2oOGjYE6tyWXOR2fs68TjIkBpkTVy3eFtUD1NdxynDItKRHDzFMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795432124;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
	b=qClwgHUFIpT+JllpDAtwzvmKj//+I7McEaDxkTTMALxMPKyfgIwKhRUELTKiAhrzAgOe
	 FbuIE8QUtWV7fuxFsSiHyuERqm0j29QddoweVoOpGu12QXHGWMC7vPnS4ObNKrl93p+GC
	 NHSazkkTY3HGypBEs68g5VdaWwQ/M45C+4Q/vdorHbAP40XbTdtTOUL968Si3AD2VfxyM
	 SCstzeo2GaWnsudHeH+Y5vPdZDk1TCVrkhk7ItWLOKYNFibDqvwEYHIjFu9kyAR7LLkNf
	 ydwlH7vR3WKT+0EEoVxfYbmuGa63IMfKihWGxvA1jw0MUIGWQ45i+21+6zixP0N9IPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYhklWzV;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 494FA606A327
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 11:08:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 494FA606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NYhklWzV
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1a3c08d6928so4313096c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 03:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795432123; x=1796036923; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=NYhklWzVFa6EfONV/VswvwA7Rdk+KRRa+1Ppi9dOVfxxnO6ONCCtVvCV9Fa0jaIgez
         3qyQOKoxOp+nGGCsXHpCSDEMBrgAbdWEmHz781jWAGYqXS3Rad3DfH6UIOHRaam3xaKr
         ZIC6xeoan4KDakRyolQCM+S90cFzwyrVIH6vGUNY/CMlwpofanGGNQNcqPfEiZjM6Osg
         NSAE49kDjc25TZZFzKHxpDM8aemIN8o1tr2tI5Q788T9xeCgjyn5H54frG509qH4iqjX
         TSEGywEVdnSxcGKmIkaDGOBX4iHypo0z45vuHIPjdoF8igDIah2vqzmiyT4xlqdurLC1
         37lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795432123; x=1796036923;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=g38Wd/fBM+0JtbWwdm5SkFifhCj05iHQZ7N1COQVm+U=;
        b=lK9l71MdxP1owI9OsFqf7sqpdRNsC0VI2mBQL9OYr+ScDs6zOJ3SIVGmk7tJs/tdE7
         2wkYxQMNtyRVNZd5zNQnwCks7lTwVXNP9oHUt5k58/evMJxHA2Xop/6uAwRa5wQciXY4
         FDOR+oaNJ99T17rdmDEWXBHgLc0lyfaSCJ3QgSGp9ZPmq5jxt09kRYJHwrIPio8WMs2Y
         60YGVRdAwK3//QITTQnUY3R4JJ51GgS0F/1IQcJuWzy7Rl145TR64EtOPhTfH5Jio+H1
         CG8NeMmDkrSh7uKRI04zNdrzPOlbETPHc12iLbIlRw8np51PdMdtWhFCQJSyy315p6QR
         5YyA==
X-Forwarded-Encrypted: i=1; AL+hErEdxHmlbm8VbbUks7Rp7jImoRjnr3/+c1B2hqPMrzuSPsB8gsr87Ak+1XAhmD+eMkNaUTX1ZrtC9lA2PRto@vger.kernel.org
X-Gm-Message-State: APuU4Z/pCRGm4VvmwcdXW5AUOPMiSWmMz/HAQTHZYVCK1yefjSYWEjhs
	zX1F4T9paYCNdW9jp1FYIdbzzP9UGPHOlgOgdU9ywqDc4cLOc4IgUoVL
X-Gm-Gg: AZFdTZcmj48J7TvHWlJ+Dt5vhrO6RxelDeNRKmpAVftN2eXTlQ/M4eV2aF1KiOzGAeP
	wqwmhCt2BtXOR0/HhbwABE/tRODfub8Gm6StaT92M6CwPrWzqyMNXMn0GqYFS7J2G4qJNDI996X
	VF4Jgpq/x6dv6fzzzggNkb0CkLYrdxWGKffymJ1J0YkgYgoUnfxPXfrKcBYwIrhMSRRDuyXDw0p
	xEUGr6Gmkr8k62as78pLdrZODeDovM6cUfXBE3xCkFokMG1Bjmy7d9gzpr0sVM9JjeQuTj09tcr
	bkkC2CehwVp+Op58LKNfqxHB5379Txwv+RNumulBf65+Nm1oEjCTaBuqOVxQsa9e3dXaHvFeuyX
	sw+JXz+49ywj/0Z/U6915keuKHHdP3Bl6jb/Gs5OxiUVWNZuhoC3852R1bSIA/BY+zCv9yOhiPd
	N0NxGozxU1eFydmh677qsp5ziYDpoxyVIVTZHpQakqilFUL577wkJtN3ew0HaqzlNZPRiiv/HIX
	pBnJD46bvdMDWMYotCJb+ndBzPVt69y3lrfgqPeyYGliE6TZe92eR+4CP5sCnvaspyFyRMgWzUY
	0H5SsZdG381ZJvW00htcroSR7J0m2CRmoodotntvzFitZQ==
X-Received: by 2002:a05:7022:6985:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b55686d5c1mr14442888c88.10.1795432123328;
        Mon, 23 Nov 2026 03:08:43 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5568592adsm27061102c88.15.2026.11.23.03.08.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 03:08:43 -0800 (PST)
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
Subject: [PATCH 4/6] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Mon, 23 Nov 2026 18:08:03 +0700
Message-ID: <20261123110805.119610-5-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel
MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 115 ++++++++++++++++++
 1 file changed, 115 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..6919277c2b3f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org
+$schema: http://devicetree.org
+
+title: OmniVision OV12A10 1/2.8-inch 12Mp CMOS Image Sensor
+
+maintainers:
+  - Hikmah Gumelar <hikmahgumelar@gmail.com>
+
+description:
+  OmniVision OV12A10 is a 1/2.8-inch 12-megapixel CMOS active-pixel digital
+  image sensor with a 4-lane MIPI CSI-2 interface and I2C control bus.
+
+allOf:
+  - $ref: /schemas/media/video-interface-devices.yaml#
+
+properties:
+  compatible:
+    const: ovti,ov12a10
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
+  pwdn-gpios:
+    description: Active-low power-down GPIO.
+    maxItems: 1
+
+  vana-gpios:
+    description: Active-high analog power enable GPIO.
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
+              - const: 2
+              - const: 3
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
+        camera-sensor@10 {
+            compatible = "ovti,ov12a10";
+            reg = <0x10>;
+            clocks = <&camss_mclk0>;
+            reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
+            pwdn-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            vana-gpios = <&tlmm 62 GPIO_ACTIVE_HIGH>;
+            avdd-supply = <&pm8953_l22>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <0 1 2 3>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

