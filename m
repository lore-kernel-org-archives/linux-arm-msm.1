Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107271;
	b=Vg0vDOxH+zH2kO0HEU+qrcAbCa1nwZOwZ0ttIzOhQ8F5YRG8sx+nNQa5sgk6SZeYayu3
	 caBk6yFzOUH2nHfwu5hJs7PPX4KgJk2HVxwc6INNV+g1TWTcqiSSkVAVTZi2oektXPtzS
	 QYJqeQfiXAGlOQtmj0MBUCrR7lct6XmD0EvBwoZol8/s0S4+YOU9cYusF5w9wqpdLQHuK
	 amTXl5NBb43WhBREubVCvkAN27A5vqJ68Xhin5UI0F2XCo1a/rXuBs/nI9173oc0zU5SS
	 Ecy+Xo6fkv8i6vcA5GS27sJBejVBxmLXc+otBSz02R+AUTAyTDkE9RNNwCSJrxCvabA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107271;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=zX3Vc24t8OMQR37F4hs7AGZ1Tm+c5pnX209fBjc6YjnpF23wUhkqB+kZH2K5HWmqtrRd
	 6licO1HIRHa4vr4Cri5f9uJjxz6OZhoJl627e3JR3152ruiOaB/EsthMF/DOnHCBZWu4W
	 o8iIj4w/SvNFSesq8XFwl3xNjqlTKXTLBKluhqDk9U027kQyFgVrVmMZYKar40UUMTQin
	 QpW/GcJtGH98jebkTZ/WQMxWNvbiMC6RhQUlfp3naIzPMTQ4BzCg3ITqYLLdXmRt331wD
	 WUlTQsa2t3Awiu79ar91Y6ipxQGLzeW4QT2VWoK/3+j0iFfFUKczDkzesT/6GIe/Udg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+5DdiOM;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8BE60A381E
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 16:54:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5B8BE60A381E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R+5DdiOM
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4b467581b98so30224435e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:54:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107269; x=1795712069; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=R+5DdiOMtL80c9mcJ5/KFHY0ZO+dJukfZdTMC2UzdCESjd8f1Ba/Hc3GxX3xNxmVsL
         ZVbM7daQY/whHTYRSQ44gXKI/K8p7wFjj5fzydgXq9FHdiDNMf7UHIaSB1XvXWGhnv/m
         Yc4iPjIVuZr6a8fd6I3YnVVNGO2oJBhwb6XMEX0OO5H8Bw0x0bNj6qmEmnoPXB14KLag
         DUP+9XNzj+038+vk+FXla4L5LSkEkaMl22I0svP6z6myJoGAFCVFnkZmhZGFacxMxRUO
         cucQKdZtIa4k1xngqIh6GWtKQcDtwwoxmzOtybDXsTvU/2S1bsaJNw20j4Wh0K7gRLSn
         zFMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107269; x=1795712069;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=ig/NZCCNAzPi90vFq5slrODjCiRf8D8S0uRMISCHztwz6+dcaXQL5sBMYoHfxiOWdF
         jY6c4mxfyu6L8zq6hpiHp4KpOqLXgTNiAZ+wDLVExgvJ1NyJ0ElnU3nJdjrcsfKE/gJ9
         lP1C3Iq/LaHcBYN5pfEcx2tSYHKdGm+HDQ2QkvDSN5saboiVJn/NP3f+eIUrm5yHIYzL
         xu3X2HtrbHUjcLQug9tIzVcdDdI6L5mjkZE7Qzkn4A1FBKk/9mUGW/guZHScxS8d3jX3
         ULoFQWVPmHxKDTv3RdwPoGvF8/HEy2Gy1F0NX9b6IVkWo/KdCWyg3fAy/hCiJwYFynjb
         /QJw==
X-Gm-Message-State: APuU4Z/CAqPad8vSoxK/9d+tj1lJbSSVufjE4+ElaN5a226f2HB+YkQL
	yP3qlK+L5D00YOoVsfgEgmiPwtYp+lXlC//6BUAkrjWqo2Mc0YICllUbf/+mdFzGhYY=
X-Gm-Gg: AYBFou3tWVHtLYTkclzYTFH/3lQvMHzF8OjExEl8hQsCU1ZzQkiC0IOYrO0fdTELHnJ
	pTik0LKaTalcn1Y1qYUIKAWFyb0uCaTOgT1Q93qlbpIUq1iRBq5VKA/UZrzbkP9Vpp/TSS6spf0
	h03W+ZBOXF6KeARyQThToranWCcmkbsS98gXiBQAaWI2Noda6ExzYuW4PqVRFFlfHVVx+2o1tud
	d0g6GvMRuwH4g96pGSN9tpEvqW2psFu5G/1uNxsMEeiRz2frcHcTAetAqzcu1EYkI3/yT5s9Rz6
	LIsf5DPDl+dbTEQiJVJi5bETKMVTKK/oWHqGzr0usmZI40UZ5uw0H+0h2GpnOF9bv36eArUrKbR
	QNParONxy3YIN5Ii1Es+VXxuTme/WW00klvK1ehcMxpiJd5WQi1+/mcvll8eF8DF7YeUeJE1o/F
	ZMK4d0Z9BHq+qZUl8mV5kHvzQEP3QrPW19m1YohEFqd81QRZx11EjQ8g67090/m40/JmJguEMgA
	UtSE5qRLoaysASe4RsW9dY5vp+5Arq1jTBvoSxgaQ7nvOWfZV9cAJw7XN/luw6onmKn2gOvPUL9
	IWhwiQRpZAd/Ry1rC/urUEXHCvaLgwwsWTbIozuiLTG7Dt29l0cVC96GpId34JqpdXEzvj/I0I0
	=
X-Received: by 2002:a05:600c:3b98:b0:4bb:7033:c92f with SMTP id 5b1f17b1804b1-4bb88826810mr1542285e9.11.1795107268658;
        Thu, 19 Nov 2026 08:54:28 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:28 -0800 (PST)
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
Subject: [PATCH v3 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Thu, 19 Nov 2026 17:54:15 +0100
Message-Id: <20261119165420.24466-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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

