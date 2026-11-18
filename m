Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003644;
	b=RYTIMTsEpAwStZ8lJC+j8TJWK8xXYtuYApX/gEtRLWpia9fdUWcAXWlx0BzsWPYwkDso
	 ANnq4Eho/1QDNkepJZ1Ysj0QyefLpZBzhRZz5iB/pNsoX8pzBl9eWpwh4fDNYTLQk/OY6
	 6UIkRo1lWlHDtRD6PfbFmxqPZIE902ztkgFy2W0b50Pprn7rLWGGfigtVIy/Uo5C5LX3N
	 Cpf3kJOBUPd9+Q645R4LIpCVRec8j+UGFI5rSReOk9uJflJh099GZ85intAOU6dBVhyev
	 BoejUq5BZI+zlczY75/nP1Z2gcjac4+jed+lBJJcoU4IH0OG7erve3Z7Dko4lapVCXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=scQFJ7bXP3mW+xyxeEH8RPwp5sK6VPMJdo9mUuq3kgCiUaEp/rWqmJDoS4NRtMfqCm7p
	 vuiiNaGpJb/CDpPZwjjICeoZOtzkj/dlD5qLLRJJ/w5EpTvbG2br9DZnWR92JAHTocyZ3
	 SZ10BmRMwufCE7g6OGBHfBszLoVZikRBVl++Ooc2+RpQf8tJItNwGUrd9gdZ2di4zZpZd
	 v9j6thATnyZq0rXwoHmTLI5yZrVs9fAkxBCbcI+KdYscTXOLiCvPn6QzPaGiQGBtU7h4B
	 ofefvttKhnaIECyvlwMQABoY4f/37Lk6nETWDp4QZEXRuXwrF2q40LAINdWLdvzYFbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3BerShj;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8296A60A3815
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:07:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8296A60A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V3BerShj
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-4a42b34e930so641297f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 04:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003642; x=1795608442; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=V3BerShjEcnO6pe46yCvBfsF74qmcI5GXv6i5t2GXlYnum36x79Gj44I4wU+QwRo98
         G31Ub/yYW3mQOO7WABbSJOLZszoXUT+NI7FoVgT0Qdt3ukQWC9WbBYmhcmNjnLnHkTyG
         3kV3336CjyZZdZ+S/1EUWo7anKHT4hqcaxtwJTnrYToIb/suWExTnoaPjWOQ1tQqzILm
         o0NLa767nkp1DqgMu102X4ZZ+YyfcLEZ4QAAvT0TndB3jh02IY4IOtFhPGcHtf/Xj2+q
         dsQXY+OeOTuT+Mz9xF0Hbnko+PpTAr/UeetYn4Vt3fjLBSZ132sCBsWIRST0vkJioAW2
         R7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003642; x=1795608442;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=xoMMd+F4BmPFRFDxNj06tent6WUQEfD4dtGUiMTdIEZ+pe8hnHIyziljOP6sfEewy7
         6T9hXZPLEu6zSQUsgDRHAqqRmATHW/JaaZmtG/Zt4WYIvgHaD8RN37RawaNMBrYjs7NY
         6sdo152JgcF9tWLLldQp35n+amDT70O4Dv2cvRuYDC7SF044i/FAuGFWWop4fEZwwabh
         Fl/6fqNKVHcjcq0VH0pABk5HEBH4mvIphr6ifIUswt30ob5CLR73QgXeTgjKq1CsuH8/
         yoYqNDSHXTWK9pr6kDDZBUEbJOWylxyzL0kjWBa/hW9TscbA/xfMq35XLt5UAFj6qjpc
         jePw==
X-Gm-Message-State: APuU4Z+XEXIaVO3aC+J8V8n6rCTgw/8cy/Xvc9RaSmTcsc2MQ8Scctsh
	ZJ5D4IotbZizvYfCKpxBpcNjQO78XZmqYy4WiBjQs6HHYa2KErMAVHFPOpSKC95jPhH7Xywv
X-Gm-Gg: AZFdTZebkr4OIKUTTg7STrHo2JCeJCRe/uE/O3K1XsLEoyJJbGb9J6a0Dhn3LhM73pZ
	8t+e9Tw+NqfgwsvhcqbXmb6g7Xa65TysO1gINy52yB3CzEyUEsbXWq3DpygWI9kfhTgoOfZV/X5
	a41zKHUtHQBmeWBicOfJMgk3h9SYRa8T3thOqW7I1f7H9jlP/19e0TiJpVeQ5esxUCt/hsevAXH
	jlMGQAY2NbZDn0WJauBJe+4Ap5xTYfiFZ6mvL94jJPw1O0s2h8JJeQZqHfJh/PIfA3i2AWdFYyN
	9CLcoijOXjJTfv+B/t1yTmy4X417VWxP1tXF24UL5gQ2FHOhAdUuPiQV3izuta4DGW/Qk77F1ud
	MPlGYYJS6v0OwQUhBLoQF6HkEE9FuCpKJz2o3QVVLHIla3zeWZLUlB9hP/XfZDKP6jcpcxS/e5k
	1rIrS3US7PCspLYsbCRerOT1uXE6X5rW05A82W1HTXUSrD8w5wnH8Cull0hQroUn6RElJIiXQ2S
	Zhi9PlA1SJmXZk3F3XOKw14ph3ytCIHu0NsB7NVPWhlnSdqwyq3+6xIQwxyG3aP/cizyBiXuoO0
	F6aFKd5Ia6j7SXrWjUYaKB8BvguhW+yZk5s0eDgkcmOjINXaedMPD5F11NJWej8YsDYw3VH1enU
	=
X-Received: by 2002:a05:6000:46c7:b0:49c:192f:cf1e with SMTP id ffacd0b85a97d-4a63b13855amr3763095f8f.32.1795003641960;
        Wed, 18 Nov 2026 04:07:21 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:21 -0800 (PST)
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v2 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Wed, 18 Nov 2026 13:07:09 +0100
Message-Id: <20261118120714.31505-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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
 .../input/touchscreen/lg,sw42902.yaml         | 73 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..c5ec3bf4e545b
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,73 @@
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
+            interrupt-parent = <&tlmm>;
+            interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
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

