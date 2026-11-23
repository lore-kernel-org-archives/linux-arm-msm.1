Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447693;
	b=SX8oocZPwDXWrYtZkU4463lCvaXZT6yiYI7cvWGwpX3PbgopweCW02iIXLMlGuol2ljG
	 IXPRA1RgSur9romUbSA3CNUFERKMADwaFm4xLGGA915I/Lc4+9Ah/iOhcZKPDXAc7AYzk
	 L0RlB+3zX7VBXi3xd5sMOUhBuow/dy1e7tp7Zej0P9oohi+TzjGMODcVjY21SluUCpf/i
	 9xQvSn2e3xwLDs8UjvTGWwcyqosbzWtRRguGv0lUpADTXA3d8tpc5ApLah302mRG+PhmX
	 FtX0dxPgiZeE7gmJb84YWnRvAvX13r8xYTdARVdcblJoD3AS068bOTf49SdaQVu3/vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447693;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
	b=ea56qDEuXQMcG1kpUIcsNT67pXpKqMD5CcaxVoSYigsgj0V6x7SL78mtff49Se6GNniE
	 SzSZh4TIYQNsRDM5gCXL+p8gfPeqbX/I58Oq2CLMbX+r3XgNXI5HNGegHOwiFksQp0Vbm
	 Pc+4llfd9FQQzbqvR3fDD47lGIx02KtF8Nutc7DwT9cg4PgQzLPRVrrQNq0ouTPM63MdV
	 jZrrGUYeo6vd6Qbb2sH4m+WFg7bfk5UCnlJGP6SAB0CT3wmjRFEeHUzmlM0AaqJnTvV3V
	 muDTpJFK7CcaVvwbVFjg3TLdcBKBauD9sM2EkyVoHvhMSTb5Zff7q62TEnlTm26i3rA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuKkteo1;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC63606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 15:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFC63606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fuKkteo1
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3869f03af6aso2541241eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 07:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795447692; x=1796052492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
        b=fuKkteo1U3dppxRP2dfHZJlaJGXVfzk7FUDnXt8LXhm8fvRhvljLUCN7f18PvukRPU
         WWDpbqYrzmrS5+PO9OZTwcY/Y+zcoZbDol2fisOndc8AkOhk4n63tiyyp8khhsZbSFYz
         Uk20qp+Ms6uRkWeEuv1pAZOzSg8x3zA0PNd6YMcfxGvwxLCQar58MFTeiqu5hvr94TaH
         P0p1/W7tMLT7DLuBxYK6tVAoIIeP2XxRCOXdyHU6uJwrTVyiDpqMLFS7Y+hAnrJO2pKR
         LOU3lWmb0cQJnm9tz32aC3NKKysBMksBDm66doIzP+z2/Ai9KT/lYg6QBoD3jW11k27I
         uE0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447692; x=1796052492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JHQcxU+wIWklcmL8z5l9MQwsDbaWbhPYpwQ5MUgrJqU=;
        b=n5Gba0CJS/hQLp7ffeMkDJGgO2v+Z8ttYL20nk6DSSKT0JJXF7Wu655SJMladXTR/x
         l05pVVnA48sPfPGwuqUhmYfCzoSyWhhjBrZZLDvd5glPC2AxgJbUc8cd2Z4N/qU67uKU
         oR6gdbWROzKM72iqmTS0tdYtrTTxReqXfj3OhMLtMwzgUGnLYljy539M3B6QiI/LZYQZ
         W0xKNZwp9npeef7dqvJ/j1e0i8RJXy6ZO3cpVvSddopZ7x5klZ0Rpe6jiaZH82OiFTIE
         fULslcb9sjIimYv4NRuzpOiMvtMrL2YWZswsa3v8n/qhWrVOSFlk4zqvzKjOswL+C0In
         r3hQ==
X-Forwarded-Encrypted: i=1; AL+hErG1he9wHhNJ4vdYTz+iGFZv7RbxRj+cdxJgZS22S/ttlLYki8G2zwj9zgUkDgPiM770TyRRxKDtLVXNIHzo@vger.kernel.org
X-Gm-Message-State: APuU4Z8V3rN4Y2dfxKw+bc9Jedq/e/U5j2M0BxPIXsDqz38+d9cL436B
	7pRfn+YXLPebe6cdMRZ1oJQlVrE0riqb8xA15iHIgKIi6o3eFxu6UCgc
X-Gm-Gg: AZFdTZe4bP4fJelYPCixenybNn5coh9BOMg9QyCtaFN0RP2BvpcQcVI7XqyDjhIC3s3
	KD1+Hd7S4RmQxWWxwOZImRP/YY42scFe0QNnFd8C6PbmmykilVIIS8owdEynAimnvFHRLsGHRQo
	4e2SlQ8mjiflCmVpn8NgyOMp8FQ6ZQ39Ku9LUTT8+4kONa9Lg1LABFcZD1QIwfwXW/Yme0CUVdn
	HSjQsTr9ks2bw69xM3eph5PUubSTZo+Ln+kiPGLYyEG7VPv0bOtnULDUmRYi6hW+WVh+ZqY2Eqo
	5KQbjJZbLwy+d9GwZKwxsC4UnSeJO8Ygd6JJUKtPs0U2hRSIlGefW9EIjwOU2dtnYiR/zRHpPdJ
	XzUQBtjjpyIesoJ+9f5j5EjDHMAZgcNkQf9tXiZ1jApZmwrB5SsppjhguExRetqprdkZinFsj5f
	ucfE6EMjVtsnE5M6iaqwPjWgQTSfmN1UsdXmYJigQ3FkyF7zd1fsxtMce1uh9VZqNyJWPhEJb+i
	v8EBSZYbO4APAFLoPkYNmnZ4PZ94jQJhLjlX1ytdPekK7NARpJol4xLj93UOgAatayAq8gy7nKd
	s1bSqytgQCALPjuVCIgmJzz74ZYOdxJtXqk/bHvyRB865Q==
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr10401298eec.18.1795447691706;
        Mon, 23 Nov 2026 07:28:11 -0800 (PST)
Received: from localhost.localdomain ([2404:c0:aa07:12b3:e89:dfdd:d14b:d911])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm46569087eec.5.2026.11.23.07.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:28:11 -0800 (PST)
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
	linux-clk@vger.kernel.org,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Subject: [PATCH v3 2/7] media: dt-bindings: media: i2c: add Samsung S5K5E8
Date: Mon, 23 Nov 2026 22:27:17 +0700
Message-ID: <20261123152722.168879-3-hikmahgumelar@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123152722.168879-1-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
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

Add Devicetree binding schema for the Samsung S5K5E8 5-megapixel MIPI CSI-2 CMOS image sensor.

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

