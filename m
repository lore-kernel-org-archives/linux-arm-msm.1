Received: from mail-ej2-f23.google.com (mail-ej2-f23.google.com [74.125.228.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 337C640098A
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633542; cv=none; b=bmaFa6dpBtrc5nbmF01onIP1ICdJ6NObBRmSgwmO2AcFAsa8UxQm3aSb6up5LlTXsVyBTXtXVMNPYrfvkJe8PpnZJ8JT/BJ5dcC3fCpaUGIwT70XhsBn89sTSqqfKbKT+1ZP76wHOCQpJ3UxMuK4oXZJAg2DIGntaSQGe0eLLlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633542; c=relaxed/simple;
	bh=0M4sE/hfoJQ3CKEy3NN7fLe6+z2efpSPXuBLPdijfOE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rw66/j4kGRkUsbnSrkz5Y+wDHpeb9ZrBqbaA7fbDqfobvr5BesJGTyQC2Yz4asxOtglzv4uNJ42TUux2lpLFM+Cuk35hsj5KV7+DVU3sUAQlYZbTiDN4+6llTXvQCrj229cZcE1Vnfa9+rX940kSKpeD8+qjFfdj0POEdtJOsLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EH1U8rNV; arc=none smtp.client-ip=74.125.228.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EH1U8rNV"
Received: by mail-ej2-f23.google.com with SMTP id a640c23a62f3a-c25ef7a3ce9so81691466b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 01:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789633527; x=1790238327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H2L0ZhsQmTrZuxVtkeygootsPfgjhBA7S6bYd0vwJVs=;
        b=EH1U8rNVmy+OssuI2v6iA38ey0v7C2k+YMkHBYnCiLT33JTSoXrsNCSB56xHnrDO3/
         +Nvuh2Y3IwE5jb0uBVNjuf1rN7FeMPsH2cn4dS4DpK+sywmJTTDR/rupzgEu9WWoyneX
         vl6N5eBmflcBheSKrvbZ0WtFYMBs69Lx+Lqveg9REM5oovmEpSvkNdtno6EXV3PmI4JW
         XLGUrqOq5aWtnvyazNbk9p4zoEFFBL9WU3/VFhX5X4AXp2qD/Duint+F8lL59n60+riv
         fXc2KZ1pou2JOHV2eFd7SODs8sWgW7HUvHAfd+8lfIZOMVd/KNy5pqy12kkoW/xDJr5q
         GNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633527; x=1790238327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H2L0ZhsQmTrZuxVtkeygootsPfgjhBA7S6bYd0vwJVs=;
        b=02DN68GOKqTe/KjhC0+JulRQAWdWzD9jym7g3Xqt2Cj/ex4i3V+NhU1ZL0kkoAF5E5
         nL6agSw9vu/j7CX4kro3YK4DqvLWM0f3NX1N0z6tA2KXeiAhekfTx79awuBizJhLiIvx
         2RhHygLWN1MHxydQo7BBfVMVB8HZwNsZ70LuxZQ9T7ZzeFWEecMSWm+QOpCqV3sUfS//
         /cYSOvNYwSw25i1EH/FDGm2tmSHPV8uYpiDd/RIxNU/uPoUEPSLYugj3ed0TWTNqGvCT
         PDLs4rhtunVmKgx2uo0ieZkH5h6iqpgEt86itLUm/TOq69PQ3lKB/BvSNPV43HzEMDB9
         yc9g==
X-Forwarded-Encrypted: i=1; AKwUvBzqWYY9Yoz9DTTRFXQ2JEjs3WUzADqSahS31nK8JM9/0S7INY4BEYduIehsM3/JXowYW5xkOgY62cLI/dOZ@vger.kernel.org
X-Gm-Message-State: AFuF++mcaF8SPO1l1naDdy1utyen7VSit4wDyBu0Jhd3rjelaNaS/PYb
	B7jz0df0gMPwTBEx6DLvSNWQIduW8CSV+4hHft/dYjaooy7jZBfi1EpuXczdGej1VNy9ceTJ9vn
	FBG34
X-Gm-Gg: AYBFou0xTmpfwwj3c4Fkt5S/ULTwygXds0lH1bYfbYJzYEbQJu+lakvpf55pdTatFBp
	ln9ApWoize3Krgnx48DYjHMA4zsmpKGbYHq03UPIeYMann493wyr8WUPzBNWtiZ8y6DkG7/AH32
	tVL48tvsZN4tX0TUJXbc4QlopnI/B+gCYQdGBC4jXu7tKK1+sXCl7mPmqKUO3E6mmVTMEsHd5QE
	IiiTu2A6xijvL4kmmN1ucs23oVpCPD4mzJnYd7ZkLL2wERfOnxlnr3qcTBYw5J45pXDrT+kXnjl
	yZP7bs7eeDo3sDDmk//aNet3tql7d9ntBqKee6HHPJor1rwdDhHXPOj/jIlfd/ZjzGSwMjcChkm
	RZEX71T6llAjx1oPyaSDgOwBtXYlXg/6OM4na0IuRQC+kcAxbFVjYV54A5yNlJSia3v/VeoQlm6
	T8lqA/7VJY3Q5hjpn9nnXdeg8bVtE2dcFcjy48Evu1E5Q230xpfTrmWh/5Bl2bGY02vlThlazEN
	NnJN3QtrM2DBC3dUIr4n5fIIW8Godnwd03Nna946bhtkoi9Y85Z
X-Received: by 2002:a17:907:3d05:b0:c29:6cb1:bc56 with SMTP id a640c23a62f3a-c29e532bea8mr428959166b.46.1789633527061;
        Thu, 17 Sep 2026 01:25:27 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0851ebsm242943966b.4.2026.09.17.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:25:26 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 17 Sep 2026 10:25:23 +0200
Subject: [PATCH v2 1/3] dt-bindings: input: touchscreen: document ESWIN
 EPH8621
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-eswin-eph8621-v2-1-f534080a6338@fairphone.com>
References: <20260917-eswin-eph8621-v2-0-f534080a6338@fairphone.com>
In-Reply-To: <20260917-eswin-eph8621-v2-0-f534080a6338@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789633524; l=2581;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=0M4sE/hfoJQ3CKEy3NN7fLe6+z2efpSPXuBLPdijfOE=;
 b=LXWHrieBinkzfsTRaq07FaLKCin0Eu5cmjS6OAWA/r1KViaF57s4hblQsYFmgEQcnOHr2Cul6
 hY0762LRPc6AKstqWT1UE5YLKBty/MiBTvGODlIV2RMM1xsh+00KP8M
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the ESWIN EPH8621 touchscreen controller, which can operate in
SPI mode. Other touchscreen controllers from the EPH861X family (and
potentially also EPH8621) can also operate in I2C mode, this was not
added yet.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/input/touchscreen/eswin,eph8621.yaml  | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml b/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml
new file mode 100644
index 000000000000..ac7fa58644ba
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/eswin,eph8621.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ESWIN EPH8621 touchscreen controller
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+allOf:
+  - $ref: touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - eswin,eph8621
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+
+  avdd-supply:
+    description: Power supply regulator on AVDD pin
+
+  vddio-supply:
+    description: Power supply regulator on VDDIO pin
+
+  spi-max-frequency: true
+  touchscreen-inverted-x: true
+  touchscreen-inverted-y: true
+  touchscreen-size-x: true
+  touchscreen-size-y: true
+  touchscreen-swapped-x-y: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - avdd-supply
+  - vddio-supply
+  - touchscreen-size-x
+  - touchscreen-size-y
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      touchscreen@0 {
+        compatible = "eswin,eph8621";
+        reg = <0>;
+
+        avdd-supply = <&vreg_l22b>;
+        vddio-supply = <&vreg_l9b>;
+
+        interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+        reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+
+        spi-max-frequency = <2000000>;
+
+        touchscreen-size-x = <1116>;
+        touchscreen-size-y = <2484>;
+        touchscreen-inverted-x;
+      };
+    };
+
+...

-- 
2.55.0

