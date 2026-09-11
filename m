Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CF0374197
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789139780; cv=none; b=u76L1mpqd+B0ZN5PECW6dWBRE5Phqu4hDBOfjtfnS/q3YM1sxeg8mQsYt2Xz1g7I2nnH+8sIMU3gvJUk+RtzJXgn6aMtTotx0xqqrsdjCJx48dvTDVmvpgnqKD39IJA1YrbdNrpo4AuwawRCxg+mCiHoKQx8YGF5pgSgSSRnYRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789139780; c=relaxed/simple;
	bh=8AhNBKZpnaYUD2pQxjChPO5qgquyOMhWXmxX3P9/qnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KO+1LI/tzy4460A/6iHCdrq0Ht49EBTcRiWJ0D5ahxtjVAWLI6Ky/Ky/ZX9I6wh1Nm8uk+qE8M8GBrEbNoo/0B1LuHnLdTNmalBoFUWdagkXvqfcEOdQfOqr1+WtU3wFIC06S47ycOnF0BzerilLQeHcVAsZ3XKz7SiEZKsNpc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=H6mxH4D4; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="H6mxH4D4"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a20319d030so1591938a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789139775; x=1789744575; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QuBzPHoSnBjRL86Zizr+XKaGzMxevhAgb2XWxWkSVN8=;
        b=H6mxH4D4VnGGfHmT0ag9DjctgtlupAtfzOAbpqHc+0+Y4krVg52rRNWmeTeM9yWdYU
         P3IBSloqqNkx0n9xCzcsW2AfeElvPyyg2ZdZKYLOZJD9ALJxuRUKzbSZ1mai7JctKyF9
         +SlmrE4NLlzFGY4sF17j5vqylen+JWu/+mkzC/TCcuf9A9LmtZ2iZUbzGAIR6kzMcUM8
         B0fqdjUxnnnI/Nr3IU10O/+slWjmfKuCoEmWR9+3XyRTwcc4eOjJGg2IKBm+HgBhfPrf
         y1tdx+2qsY77+V2JCTe76pp5hYyjzNkNYHmeQBSyiFg/66F1W+TB7mrfrwfHFmwNAHIi
         ob6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789139775; x=1789744575;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QuBzPHoSnBjRL86Zizr+XKaGzMxevhAgb2XWxWkSVN8=;
        b=Q+IgXRDQxirzW5eY7ZLGBlp9xYcV9UwBEfkU1auK/h4aDnjnNKAZMqf9zmTvIOXqJv
         ZqaqQzxhHioU9Kvhtqv8yCtjNR8Nu1Xa1Orfe+vyFKXBJsuDrvl2nR0UCy0A4qr5OCOe
         mxMbtSoXMPAXGi7vax0U14nMPkEST503v+NCbtoeHufm61QbLCXemDRhNSp70nKByiHp
         evfi/jVSln3rvo57vG2PD+O9Xbtr4U2a4ZqcuQh1Uaw0SVyhfz9SwFCqeK70SompWog1
         YUZpSO59Ewq5KCghOJBUw4I4VBFd+krzMkU/vfBszo7ZL+0udBdm/IsuMAH71EI6Z4q0
         jLMw==
X-Forwarded-Encrypted: i=1; AKwUvBxk8DVHv6bBbNuxzvTo133mDquBovDV8EnDjL7z+AqX4AJZXGQUXyJsKguXf+FVEoC/5QWG14XmLbEAGM3v@vger.kernel.org
X-Gm-Message-State: AFuF++nCfgba77aRoBmBi4lGobsa/VuJ/p+QfnadlAYmzIQ46WlNYVnw
	FUhGYbdTqR8Ess+rR1jmO4LQ6mU2at2HmXivPlYTr2NXOMCNmaomeOeNl+2XpTRvUXg=
X-Gm-Gg: AYBFou0ev/60oSFOrQEWyecBSSFSFX1o1bO3C2PsZwuQZgaTpFyYHo+riJn7ZYMMRyK
	TDZvUOfEgxjWieJHUs2xK5ShkZh6fpywE7ddtqqiMvdBPAIHT9mjrjXs9GOmZeNtWYrUJCMyo/Y
	E6OJ5CNYq8qjjxsJ4L51FheSU1FkREftF+6EuKskLv3e1F/UhW+pTr4k+3qz7c89P167u5nCTNH
	PUGChbPeBo4erFawRXQBreWFKUW1kjo9xy+jKc79Q4LllyFy6Wm6FDecLuUuqMcvfCB72M+vmVX
	uCGs/PzseGfTYQ5LfDTWKeY2JvY6aZK8TORjk6u7+jZTWBzKu6FEidtaw6u83xCgkPW7+/7X7Zq
	CLwFsM5UkKgc+07lJaOXcAuin4waqCOfsGv/GiN43upUWmGEj7ZaXvz0mY71d1gzznEOCEcWsHa
	UgSZMkAriLC2ftBh92TFeKKSwIEl6x6US0/mpesLNztmf4q3yEh/jIOVnsX5j2jfQBivCo4lqPh
	ZaR3NO/CqPoZCgm+YTgvlIt5t0Q1jw/bSuX9jYNyCE1E8M4YvQj+Q==
X-Received: by 2002:a17:906:6290:b0:c29:6400:ef8e with SMTP id a640c23a62f3a-c296671348bmr202563666b.42.1789139775315;
        Fri, 11 Sep 2026 08:16:15 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29660ba623sm94656766b.45.2026.09.11.08.16.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:16:14 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 11 Sep 2026 17:16:09 +0200
Subject: [PATCH 1/3] dt-bindings: input: touchscreen: document ESWIN
 EPH8621
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-eswin-eph8621-v1-1-db447ff9e445@fairphone.com>
References: <20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com>
In-Reply-To: <20260911-eswin-eph8621-v1-0-db447ff9e445@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789139772; l=2508;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=8AhNBKZpnaYUD2pQxjChPO5qgquyOMhWXmxX3P9/qnM=;
 b=klm5WaCMDKqec15ANu9XtYr2/JmBMK+XJPgebCb8nmQlHNdiQ6PGH2kPZYx1us0RzXLSKLfl8
 5FNQAJ9XfH7C1PKqsY0VAh3Ov1W/+d4FyTZ6HK7k8FY5F5hY90iGJ/+
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the ESWIN EPH8621 touchscreen controller, which can operate in
SPI mode. Other touchscreen controllers from the EPH861X family (and
potentially also EPH8621) can also operate in I2C mode, this was not
added yet.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/input/touchscreen/eswin,eph8621.yaml  | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml b/Documentation/devicetree/bindings/input/touchscreen/eswin,eph8621.yaml
new file mode 100644
index 000000000000..03f981ba19e4
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
+additionalProperties: false
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

