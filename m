Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795609977;
	b=PrZWVgMFkbiktPYoo4Uq5ppXhrddv1R3jpIQay72T5PhyNOhZ1+fH7DL/N3KdGXA5nT3
	 k3vJY9yME3hAWNMDVwUIXJX8fLfzhi/q6suYq3rfGPgAaWAmWSPGyy4V3b9q2SPDENbgM
	 Q+gU0QnnklLOAmg79WA982GazTMDoGLZJTWvmqNP6bE8BqZ1f/77vUxdGjZ5XnHWAWMFq
	 CSLWYMUw67IjXMxX2+2gR0Q36gIYhar8HgmjgSWO1Prpef8fR52nZvsmBd0FUUlY6awLX
	 lLNPrkYGuoaxrxzQBXs6Q7oZZscOtXm12nJbovmf8jZP1HMtaDGMyTywHXeMcpUgqyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795609977;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
	b=ebCp69FwPTHg80GX2++T0017nPavkr0dNwgtEvKo9t5POEc0BkyajCmHk6XVzDoPA9AX
	 YuSvT2aaSJQVFyEgtd7xGDNiwUFcy0nPJi6pavG6uHld2OEs+V49VB989RFnBZe3y87oL
	 CHo4MEgkQMa/Wa0oOfq1Sy+nEnuPbkWQBUGAbi+M+MsH7jpCg634jPR/E+/EyPJgmo8+1
	 QjYRMTtzhUdF3gdj54BXSbEljqhY9aSnRQtJy3MjaWYHCR5athH2JRvnVeBHcyWJZoCLi
	 Q4r9wP63bt8K/WizWJd/TKJj8xTXm/deLhoXSnkXTCVcnrYWP/8fig6oKti2lplq2TA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFw0of7v;
	arc=none smtp.remote-ip=209.85.216.44
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25F04606A69E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 12:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25F04606A69E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=wFw0of7v
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b3a42a4bcdso2390963a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 04:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795609976; x=1796214776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=wFw0of7vrl/UYupGvwc1d1CRi+/6e/EN7A7sYCP3nbhQDhcX/Y1skD7RavLyQeOkZw
         IRMp5I+hBjc3wKEyhhcFeN6Il1U2Q1C/yjWHMD2alXL1jLUOQFf/DRRnRX3NlbUrx06J
         OUa3C56ISoskjoQ0/6QwwM+nRHd6DOyx6RAJvdsq9zb8gcLroTfWl8PzYO3y0H88uml/
         i9bQVE2mVvsSALntek32xUwl/3q9uOxlPkxXWdzcM3Z1z4fNM6QAYC4qMxk5zu8oE9TH
         uQ6dNPA2xPxvyQCgdrt8xKa4xf3MiLGBV4z4pvCiblpHGsNDb1gBcXeUGm5a9ehwO4jl
         mi0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795609976; x=1796214776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QpW5GamT1ITQWdyRA0Wj8i8QuCat+Ps/5liJwGN59OM=;
        b=wlXj9kSSnmLfkGv1uHAPLOiGkk6M6Su5qPKCMbTcHbrRc5/bmsRv2TLQ303rqF7AEN
         XtkiiJDPN0lRw5h93Rnvs51GwsDOQYr9pfpIdvUA8DNrFRKtCXSINwswVflHWLmmjUIA
         1iG5baRVJS4w/khGgF/Dui4HoV5hyhWKU1LC7NWTJFi6N5hjjccLuTwpDt56p3e+iVFC
         I+2l60uVKZl3eSAkYy1hPHMsEBuStfY5ASfrCWgPejVgfSjFA4NmIM5tnOyihmQKwaJc
         e+eOT6VR8l7j4gED12/S9Yw9Y7CwRKnE5BDvQMXoK7NEz7rKJ2Ek0q2E2CtkASkerl/W
         oCBQ==
X-Forwarded-Encrypted: i=1; AL+hErHv17EDAPhz/FWihflrvFBx48erdX1haLaW2FMR3T1vJHpyXqCeYt9M0WIriqrCU9dvC5zAYTGB/ByGHLaq@vger.kernel.org
X-Gm-Message-State: APuU4Z8YfI1irsmOxHXDUaIPjeMs0nAFAffEgxQDULxeYi+DFfrhCTYs
	cJ2HEIz/54exw0BJ13CydNB2njgs7SFhGp3Rn5i1oeNsMNMB09Y39WLN
X-Gm-Gg: AZFdTZeNkhQq5FiHgdVW8u2sujopt21vM9KFULdD2NXHFaO/GEVNOExv7cGFg6lD2Vu
	EZwummPB/DOrYEFeGlo5+uSiFa5kO5Alnk99psMunXxl27rryeE/QshUWLzcK05MgqOzrLEYYu5
	mhexOVhVIeS2qKf65rRnXi3QO0ZPfoSI7I/o1oFkq38AD6Kr7PgozNNQtsyJq2qu3zURPWEZSra
	lT/RxjLsMHH7sMTHzfoiQSxEYtFQL0bfhRRfGMIKQp7u+CG874DpCyHmUid/0540qCCLN8MLfe3
	3Mf/p9lKFsC1w6q6uss6m1ARwoDA7d6vib8dDJDmbUCJnFM2jfbU7+gY9I61HRx7GyT69LykxgY
	SJihMHlvk9KVt5IhvuinynQ3zk8l0ngie3C7B6ZpKIzRVXi7jiUDJ/bgnwp0jgseuovvBl78qvE
	6Phkc1hzqyIaOOTIwF4336vEfGiy3LsNpCtmz/uNlaJxMqLCSaCQNWS63lffBU32V6NhUuLzwNY
	TbB2GHVZaGQuJUO8H1unYo8ipzQGkgNbCnycxR1o0N3N3ZsbWOzeGRUWb0P2rSWc08SUlEvLq98
	neil3lthaWXpgcVWdkA1EErEqTL9nt7M9C32Df55u8EwBsD6
X-Received: by 2002:a17:90a:ec88:b0:3b1:3e7a:6d8e with SMTP id 98e67ed59e1d1-3b41c8e0c73mr14764645a91.10.1795609976464;
        Wed, 25 Nov 2026 04:32:56 -0800 (PST)
Received: from localhost.localdomain ([103.118.130.202])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm12698366a91.3.2026.11.25.04.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 04:32:56 -0800 (PST)
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
Subject: [PATCH v4 4/7] media: dt-bindings: media: i2c: add OmniVision OV12A10
Date: Wed, 25 Nov 2026 19:31:43 +0700
Message-ID: <20261125123146.379057-5-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the OmniVision OV12A10 12-megapixel

MIPI CSI-2 CMOS image sensor.

Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
---
 .../bindings/media/i2c/ovti,ov12a10.yaml      | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml

diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
new file mode 100644
index 000000000000..f27c304843ad
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov12a10.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/ovti,ov12a10.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
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
+  powerdown-gpios:
+    description: Active-low power-down GPIO.
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
+              - const: 3
+              - const: 4
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
+            powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
+            avdd-supply = <&vreg_cam_avdd>;
+            dvdd-supply = <&pm8953_l2>;
+            dovdd-supply = <&pm8953_l6>;
+
+            port {
+                endpoint {
+                    data-lanes = <1 2 3 4>;
+                    remote-endpoint = <&csiphy0_ep>;
+                    link-frequencies = /bits/ 64 <216000000>;
+                };
+            };
+        };
+    };
+...
-- 
2.47.3

