Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794221388;
	b=BET5gNr4bytSjplSu6co33VVpIsvRD4boo5IfEiSYBrzoltyyKVwRig9eCKJHOhOKt52
	 YvOU2elsqm3zgj+8vfCsSgMBh6Q1rSeR8uL/ySIC4pu8P1mkd2sJ0fgSNamHcZRMvTXPU
	 Gb0eF8UIb15htC1Td+uFx43f0H/LOmUh23Vwp1kW70ms2mXVcfiql4M+rIdW+zcoM+v1x
	 eUwbFU4lb0fPXvLQ+7xrKObC3QUf+g6kzbk1LEj9QSCMoJ8W2JCsP2svVsvMSQsGYbEXC
	 dF5SL0aZTc+271UsaVaZ0QDsK4/KCQrc32BoBWyOk4NCn7HquytIHQZBchZesZ7aBPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794221388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
	b=I3QYThsaYdd5wOJe4otqYLQOhPEJibAowecrLn83EqsJ/punp+JOV/kzFYwFPVTfqiif
	 eXbSNcc/yYHFjW8O72ncITWbETN4QWfSapKCTygu6ZKr1tyDG5/3Xq+UozBRHIjxSNxkc
	 ppJIkcQnW18R16AJmLAHw0UDfZ2mrYyAx1sv3ALjpmXRxpslpalSKwK+Y3MnIEX0F4Efv
	 0hOq0asi8gQK5b8jM2ZGU7w7Rni1XyfeE7Ay3EjapQ7T8MR/1eMQFMV6T3S3k7aGAp9qs
	 T8cMDrLNQ0VECJ6xwITPO+pQc19mH3ZSzDTpdIw1IjA5YSPEP/dMHr9ZjRiZYyRIGrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3TITIqY;
	arc=none smtp.remote-ip=209.85.214.173
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC610606A322
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 10:49:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC610606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=d3TITIqY
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ed28bac8d7so2461375ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Nov 2026 02:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794221387; x=1794826187; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
        b=d3TITIqYEQy2nVPw2nwc3LQqZM4/kzPbuGM44hHPAGvIZFeNP1PUYtBhrYtiGZk2aD
         KAvRce1tF3JXHWqC9dHn7JRr6A4nfBgVAcIEZmrrEtB8JwfNzjNWCETv+AGtA2kJnlS+
         BV+1CPLQwcBl8vg7XDgD3/3aFJlaX892W9xWCtK8oDnivRGcOhOW8yvROkjqjdMITkgH
         BKqq5rDsiEuMwhq8/1EzAjSco3LUB2Nbf+dPtpxSTojqXN2BDmSQRyD8KXML4eOo62lM
         rHGW5+ZO5c3XG37HoOIIHZVD4kpUO8Bfjl9x8UEHpP+lXnTyKnggpXRmmshuqoa/54Cp
         rGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794221387; x=1794826187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zNKMNT5jDjx45/qe7hJ3H8U6Y1OTdrZmQFqKaBSTnKk=;
        b=fhMZaeXSkGXviXQeW+iOwpdy/mv1gebwCkRcUQ3APEzCOb8Tur8FCvka18nQbWzRQB
         s/+GuvMcg6G5aEPmXum9Zk69Ie1EczOXzbeRKSxSEzOAIS/EsOnDmPQswBoK6DwOe1py
         ANJuBxUhj+c1n1i3GUjikfRcYEH83dlh0X4paT3zWNDW1T484UTNW6Md1m6ZfnvlW7D2
         4tsFs0E14lEZVQolbffE/EIHTkHyxcXbFoO5fK/tcS1AXPsL66vL4MVmw8bQpnrnfjlP
         hYjWNojoDAou27goDu0Ae5cpRmmVhs1afFy3Bfh9txGWx3DNXhpGjhZW0Hbi72aY2ohu
         8k7Q==
X-Forwarded-Encrypted: i=1; AL+hErEb4iZh0A411DnDN+DinGFW+9gkqnMShJ5DG2FCiw3UACgRId0A9naP4jdaL0sQrY/15zeox/T9spni4tHv@vger.kernel.org
X-Gm-Message-State: APuU4Z/Af0dcx9t9P7PAZS7JIhOOe9Sz2xOl0njzbS2mhjlBsY00iAzC
	b3k8V2Q8bHLLWUVZ562ZcSR64xGIUkU4yqH3fj9LN1npL2mCBtLEAlon
X-Gm-Gg: AYBFou1UfGZiOqjKWky/ON158/GteaVUOGfyRiALYMjxlJdlk45Gg7e3kE/7eFAF7gl
	bn2MmviPo4waUhT8tsdwcFCTFOYIecutkmhqSn3sF39hKw1ccC1snKG4N+rAyWzvpJwbj4GBQ56
	zGErUTWdwH9OvSIQeGH2Fnlk65LwJCPF24jPjxvsJVmRamFK/3V8kWIL1YNgZofABhM08Hx35eq
	FtZfBt6gNimcJ6EWFXTRmTVWbsCz1znxxitKfb4fu69ML3nQGOiSbbQOoHtONRGyjVQOA56L/m9
	fa37ICoFf2Mr/bVbWRa9LRUmkufQDrQgMBvIc9K+aThiY+Ad4CT8gpUpI+FdOhDtLr28F1ri5dt
	NvqZHenP+6cKBsxbreqNRLq34xdkDcqjIgKZ7VFghVbXru/zDlUDUf//T5h2rOa5RGLsozxYoPk
	ERARVLT+h3NhGVBRsYA0l1gHitw57bp9VjkQF3PCB/IEXgz/45DZg4u1vnm+m5O2WExTVyxTfoo
	MhswBnDokZszm2clZq8LLb7jvSzdJ1IqQwzcQYwKBy4ZmJxTe3NHT7GhUJba/KQPozdHCuxP0gD
	NrgZZaVEjY9L3Jg24VCjJIUdQAWIInehvfyMXpBBoSptcvV5WWYd8JdidOB/Q7hskvLxAOzrKvN
	Cf9tpwndLfXOJG73C5wRFW1fmWZ5I12ux60wHx4obEieXt1hJeziIqrcNgK1vgkW+ho4=
X-Received: by 2002:a17:903:2304:b0:2e4:cc75:2728 with SMTP id d9443c01a7336-2ed837a7559mr29304325ad.36.1794221386941;
        Mon, 09 Nov 2026 02:49:46 -0800 (PST)
Received: from rahuls-x2elite ([152.57.87.39])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed81739d6dsm8602685ad.66.2026.11.09.02.49.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 02:49:46 -0800 (PST)
From: Rahul Pon <theflyingrahul@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: embedded-controller: Add HP OmniBook 5 16 EC
Date: Mon,  9 Nov 2026 16:19:13 +0530
Message-ID: <20261109104914.1534-2-theflyingrahul@gmail.com>
X-Mailer: git-send-email 2.56.0.windows.4
In-Reply-To: <20261109104914.1534-1-theflyingrahul@gmail.com>
References: <20261109104914.1534-1-theflyingrahul@gmail.com>
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

The HP OmniBook 5 16 (Snapdragon X2) has an embedded controller on I2C
at address 0x76. It runs the fan and the keyboard backlight and reports
the fan speed and its thermistor temperatures.

Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
---
 .../hp,omnibook-5-16-bf1xxx-ec.yaml           | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml

diff --git a/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
new file mode 100644
index 0000000000..be4c845067
--- /dev/null
+++ b/Documentation/devicetree/bindings/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/embedded-controller/hp,omnibook-5-16-bf1xxx-ec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HP OmniBook 5 16 Embedded Controller
+
+maintainers:
+  - Rahul Pon <theflyingrahul@gmail.com>
+
+description:
+  The embedded controller of the HP OmniBook 5 16 (Snapdragon X2), on an
+  I2C bus. It runs the fan and the keyboard backlight and reports the fan
+  speed and its thermistor temperatures. Its four thermistors can serve
+  as thermal sensors, indexed 0 to 3.
+
+properties:
+  compatible:
+    const: hp,omnibook-5-16-bf1xxx-ec
+
+  reg:
+    const: 0x76
+
+  interrupts:
+    maxItems: 1
+
+  "#thermal-sensor-cells":
+    const: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@76 {
+            compatible = "hp,omnibook-5-16-bf1xxx-ec";
+            reg = <0x76>;
+            #thermal-sensor-cells = <1>;
+        };
+    };
+...
-- 
2.53.0

