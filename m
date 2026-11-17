Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919197;
	b=jAEzeXWuk1b+JreC+XZJuu3vhqqCFMQ5Dta1C4oG9SzlgArqiaC7kUfrIr9olXrgZZXl
	 OPRpnTxMLjgMQT4LZpHi4D/PcRiOfSRTqkWmL2zBnmZ4F+1Rfqu5J/7ErIRGwZDUFRe5D
	 r9H5ZemIO3zJdU0dMq7hsJn4B1n/3Jd3fHb6+q+eeDNscPB9sgZ4mgE2P6NEn8zqVP0UJ
	 aopbmCivJSSWJKdKlNdZ9nmVmxKmEiuyVzalFuF3nLLj4hRqGzX7fgLpHH/ffjC6gktxl
	 qUf6aLzJlZJkyGapJy+mi1uat63VNM3jSzeDgh/CQtwEk1GOTC3YzjkuRgH0csYtQ+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=acRH3NbgLkYCK5iiPRFwHw3LXKQX8KfNDsHlQP+4/XA=;
	b=Kc8C2C44W2SlH9zW8xqVrYJzmX49NHbEcnjV2w0YnUzDtsMAuSLtP1PjoCxxaZkejLsy
	 bvbu20rlzqxkIq+TZvgPj3oa3MiVduDZvcKYedWfzj9iC7Z7yT3W/KHA0Anm7YuhRnppp
	 1SIDG3jb+ofoDAMESD+E6UnIn9MUTQ4GvzSb9Z8LVP8UYg7jiq0HKvEgztDe1OcpDQ5ly
	 35duj6TOpGEc/4T0Jh1BirJdpBJ8hZ9i8JK52O9DblkUZC8+IIfyy3Oh8vQvbqFCKFz4W
	 27f982bGaL+AEtN6F+zz0woSXDu9Zcs9bzk3MQq67MCu4A+akp5gCrqz1X/G+JSNRJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y81t6W7a;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98F2560A3808
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:39:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98F2560A3808
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y81t6W7a
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so6325985e9.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:39:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919195; x=1795523995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acRH3NbgLkYCK5iiPRFwHw3LXKQX8KfNDsHlQP+4/XA=;
        b=y81t6W7aTl95C4y9Rf0QU2nrD+sHK1morXML7lei63TX2FL3EWpNkN9I0aknlqyqK4
         gqHGoz2NXR8U0/otEEzXPgPNGzm/tI0i3FS0qTz08OkkknigPevlog1Q6m3RP7mq4xh7
         0RfSrVo1lbYrDa/L8TWUkyhwAHxnVHA0nNsFgAgAadTUbVUV7wpjcy+WqfOsafTXixTA
         A0Ksby2GTQifFsp4kd+zFwI7enrUtCAQxXxlWM3SNu3pqse7KFQHusE6UEAgcGgQRkpW
         PUcxqKnK+MccmXMoCZfVKYkegfkG4KcED9/9iyc1OUoDzS9PJPfwoWpqUo51uQ0qjeVK
         Tiag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919195; x=1795523995;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acRH3NbgLkYCK5iiPRFwHw3LXKQX8KfNDsHlQP+4/XA=;
        b=zB9hv1PWgffjU2EGB/72rTLSPkHzphLobF7m+2gd/FKqatuqjphIHQr1UwbxRpPqCK
         J2HbF/VBM21D9OsYfT0jqJshE7oK+7ItzLfZbPiM8iQV6+MKQUQpo5A4RkHMQuD8EGnD
         dp+Cs3FP5vTA0wblnkFmleRbszHl4SFkUyE0aaXGxV5A3kr/anZbnlmAxD0LuQ8WPV3h
         q8mogNNnaSxGCjCUI9uq3eKI3U+8c95Df3nw0EW8+PpjABshnQTkWJpmBmvIVAWfq+wE
         JOtT8OjFwDQm0Ri6W0U2zAzbevlxMdgCeyKpoGk4nT5bB4arhM8RCfPt9SFO0kgkAh1V
         awgQ==
X-Gm-Message-State: APuU4Z+YjhL8nwCz+3AbboyqWHpudPsbqlNGIgLFs1EUBfUBrg84cZGD
	Pdgvgtvqsx3AcwTkiROU9/da2IsflE2PKziFceONsqIH0fjegk8ySgdwvhFhus0PC+PXVw==
X-Gm-Gg: AYBFou2PkeBwTlUfgLbMU0VYx5K0h/kpaCvTQmESCCkIr+TArpDWmtBIcVZjIuNTIDI
	DNp1YZ4RAZqUKKsE230CywG8GfGf+xRJ11dHW7gWyQvx+WJuYC0zFzRTakAF1UG76FntVKirAga
	ho4rZfJRuHWOHe5ch/F/gw5CpKU+F6h8gQOnOyerv24JKPgleVFzNVW4sCi9YDHk1iATm4Kdn5n
	Sb4dsQVjM2JjMhb9x/ffoWMtjkyODqH8FDvZZDYPvUmZsehiofbRonRT35XERCwcUDz1tcxgOK2
	NlLL6Ro4jwTbI35ZoDSW8xCAewCw/VlNCPzHi2sUqjvhkapOnzoSAIwmTE6I1bruBurV809wCfd
	f4hsBO1zPtI0XNqS+B/24rr9b0rFec7CW/PbhM6dSS1fGPcWPIec+THInpPlUi12tlPsB/TKl8u
	RZuKYpUPNOA38WtHoOP14OifPPlkvJ1YCqdtY6/726WPgmuRf2nLTvVdT2HrYltBLIQqbkxKGn0
	iNaZVfFPmEY+AWd0cZMTkijauHCBes7PfKnxC6enHaYbNckRrOosW+Nfx0HsOf6s2IyoV8v1ycO
	7RzjbNcZJm1hoIwXb9iJ6JJ77P30+0mtbNUkLatFDhmAACJ9ECWrnhcK5PeRHc2JW11F2A==
X-Received: by 2002:a05:600c:5012:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb7837264cmr55075555e9.3.1794919194974;
        Tue, 17 Nov 2026 04:39:54 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:54 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
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
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 06/11] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Tue, 17 Nov 2026 13:39:41 +0100
Message-Id: <20261117123946.668557-7-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Document the I2C touchscreen and its interrupt, reset, power-enable,
and panel-size properties.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../input/touchscreen/lg,sw42902.yaml         | 74 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml

diff --git a/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
new file mode 100644
index 0000000000000..c56cfb8530eeb
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/touchscreen/lg,sw42902.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Silicon Works SW42902 touchscreen
+
+maintainers:
+  - rofikkerneldev <rofikcoga@gmail.com>
+
+description: |
+  I2C touchscreen used in the LG V60 timelm JP DCM. The controller boots
+  its existing flash firmware; the enable GPIOs switch its 3.3 V and
+  1.8 V power rails.
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
+    description: Active-low controller reset
+
+  vcl-gpios:
+    maxItems: 1
+    description: Active-high enable for the 3.3 V rail
+
+  vdd-gpios:
+    maxItems: 1
+    description: Active-high enable for the 1.8 V rail
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vcl-gpios
+  - vdd-gpios
+  - touchscreen-size-x
+  - touchscreen-size-y
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
+        touchscreen@28 {
+            compatible = "lg,sw42902";
+            reg = <0x28>;
+            interrupt-parent = <&tlmm>;
+            interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+            reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+            vcl-gpios = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+            vdd-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+            touchscreen-size-x = <1080>;
+            touchscreen-size-y = <2460>;
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index abdaabe16ed53..f4c54d7d86bd8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25835,6 +25835,12 @@ S:	Maintained
 F:	Documentation/fb/sm712fb.rst
 F:	drivers/video/fbdev/sm712*
 
+SILICON WORKS SW42902 TOUCHSCREEN DRIVER
+M:	rofikkerneldev <rofikcoga@gmail.com>
+L:	linux-input@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/input/touchscreen/lg,sw42902.yaml
+
 SILVACO I3C DUAL-ROLE MASTER
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Frank Li <Frank.Li@nxp.com>
-- 
2.39.5

