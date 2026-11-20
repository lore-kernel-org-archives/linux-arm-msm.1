Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795190100;
	b=DsZP7MzNKdUrZpYnKXLMiGseIfskOw7lRhVssmXyAdr+b6SpigKYp8lUH6lmPv5OL3B+
	 afcvwYVrO3t+SBnadLszFDOs3kYjikdHcoKNwVI+8hbl6g25lYkr+Rtkq3X1zEeZlWVaO
	 MsaN3NOmFnNFJOF71DzcCQG4f4cYDNIuLRgEdIh+1mBZCIyRMXaUjTFg3C4KYpt2+yZgu
	 nj7t30iC1HoWsqWOiFOzULNF1z50rBdTNbVfkg+eTBTw9WNxxW7KXAt0hW0igi2z0iCeI
	 5T9+LwBGEtQrCbTEGPFibZF42K2TEr+uItyzYSrptlcK7IomHEYEVNDtQkPk5lvpTpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795190100;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
	b=OGnFy+IyDhDUJszsjHtrYAWr1msYu0s0ZDOZxGF6y4W5yzBIgI/5mnvGM9mMc8g5MUgk
	 iO3QaGlzweCnY8JlZ0AYSJvFeRZimOixEO2TWYbfTH9QG9c9iL+8pOu0WskmzJ9lv/hbE
	 iW8Qs7KvvrKzpX4yQvvH9Iy0ztF820uuxPDKDHxTAeLmoDv/mJCQPVuDSKb3asDnB8fOR
	 4Abaw1rl0/OYVgevOZ9ua7jWc5HMZcznFaMGxcLhqrKk9JR43mmMel9KOhK4aL/9HtZsl
	 MVy1/3ylcTlM+NHx0rYXa9enePoF5wgyQRNnsnrXMZ6r4q4eynvKBrApW0UzK85blEw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwF0frtf;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8AE60A381E
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 15:54:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D8AE60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xwF0frtf
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso6140665e9.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795190098; x=1795794898; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
        b=xwF0frtfkMY1/qxSag910+kpSRw/8ZVubpuHSxXAaNIq9SXBxwLe1oM92PaVz6Wyzj
         vxastdnUrSKlzDSgoIAQAcBH7hbsaPd5hq4pfvE0pJoJglVlIC1KVSOcER2nPgBLgG28
         F1eGt8MeHrxFOLnEU4gf0ZlgffcQwpKbgRUBTLzAin0a0I8t8gBOGm3zMez/zPaorjUU
         pfTYKnbXgR1nsXluRpvk5bdFa+5BxzTg9G83t3RyJJqJk9au6RC+zYZDpKgQfKg/4PQL
         FebUt9XOCiKmA0U9r0ueLv7OfuEBSZ6M4CLvZBWdSjN8DsD2jfRkjSxr/QLJCDnuwNIf
         HhGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795190098; x=1795794898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t5vfznkr0ETpK/dRsbewXSnBOXbKtjjAozkIrt96x4M=;
        b=zXnJNd/oDDFNP2Nc5YGUqCoH/ED+tGxz5DhCUagEbhoBvsBKR8j1hYd+saSM1nGBc/
         4W667MN7HGrCQLfuob9lkV8h1qZCobihapoS0MNTthtv66Mr+X0SqyaP/7fPQDjZ27dj
         B9rDBEz6FrdvvxrdM6rJPaW9dLdGn5/+rSZoUEQLGGsalmiY79UOV8fmh107hPM7iqCK
         T8JZVIwYlx+83kzgQidxGfdsvvCVmvPxnyIdpXHZb9SitpOGplZ/bE5RZPE/9dLraeRA
         /epxOoy27NjCljKxybkKoffvDEPEi7QCUx878jTaVUqBA5yfHrrMKPP20Oh+7lLOSpYp
         PqXA==
X-Gm-Message-State: APuU4Z9zsaZUj0zxOlcM6Y+5eo+SqwhbKawQcoYeO9FfaB7O7Znxt+Pv
	qtm8C8vX2DVdLtSIWY7y38OssEAdq96e+QvRC0n9essy2kiYnxJTeerVZoaWcpdf+74=
X-Gm-Gg: AYBFou1M1VDhTAo8kkOopv83UrsTSlgyBLjkV+D7zW489FG/prrKdHWNBAbrw09DIdw
	gWUTXl/xBdVxakdTtgJILsYP+3FlxPfqL6Rsn5BvFND9pfakPuk3clQXcwu9Lnu6NRKhmylbwf+
	qHz6unZBDZYGF+wf27yY7ruOvzB++EZGUAavELyLm4bhlYsDzwOLTZEYmwilyhT9pBFDaP0VvNn
	o/4gtqdVH0XmtwQws9TV2elhMtSX/O8TQOn0RT87WQaZLKj0TGycN4KvpJ8B6B6FN9vWiOSEOpx
	ZT7qFJyFRsBBLMUPeZTE7TwL0oIWZ89pVOP5Yf7JNmp/4YEahSu/wHcqkMsm4cl0kmStGP3fpFv
	PkEmuJOeQtbyk1KdgycEu2N2aOEWEql9rn0z4l2oNg6UyauHDUPdqbv9IBqHSy7+msah7i2eq/e
	JpenT3SC3JbaHga/e/q938pckxoDATogImSAPl9YN7uUpNJ3SGqS3UPD9B7Kg11WNuIVgyARLkr
	Mqzh9COeFXVuGi+Ffu8pNtBAmim2F2/dFLuL2Kat7+uC1yvaV2Kg80Wfyy/kX8bw+5NEmwtUxsE
	1ZaEpXvtvJIaFNKuvIfrbs0XNe0Z71cu3psb7Nmc2JtIZVafQ8BvYLlmtb4qm5Uwp/jAYKkglAQ
	=
X-Received: by 2002:a05:600c:3ba3:b0:4bb:6118:4c9a with SMTP id 5b1f17b1804b1-4bb88819940mr86535245e9.30.1795190097249;
        Fri, 20 Nov 2026 07:54:57 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a15absm83982635e9.9.2026.11.20.07.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 07:54:56 -0800 (PST)
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
Subject: [PATCH v5 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Fri, 20 Nov 2026 16:54:44 +0100
Message-Id: <20261120155450.7719-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120155450.7719-1-rofikcoga@gmail.com>
References: <20261120155450.7719-1-rofikcoga@gmail.com>
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

Document the Silicon Works SW42902 I2C touchscreen controller, including
its interrupt, reset GPIO, power supplies, and panel touch properties.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 72 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 78 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..2d6d9b1500faf
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Works SW42902 Touchscreen Controller
+
+maintainers:
+  - Abdur Rofik <rofikcoga@gmail.com>
+
+description: |
+  The SW42902 is an I2C capacitive touchscreen controller used on the
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
index 28e4aac18d44a..a29019d984393 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25835,6 +25835,12 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SILICON WORKS SW42902 TOUCHSCREEN DRIVER
+M:	Abdur Rofik <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Frank Li <Frank.Li@nxp.com>
-- 
2.39.5

