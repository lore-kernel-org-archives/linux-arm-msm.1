Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795081888;
	b=1bJwSnf4b6p2q5Y3bc/6Vsv6gm3u36diwrtv4hmFXqiGldqBeYFB11wyyw7amQmvj8FH
	 G0Q8PuHoigUFoUKof7ScdYucZmMxIu7tdImuivpx2TzgVLEDNuee0WL5IFHo+yo9CsM+J
	 M+vWClLkQe67jaKSyiYDrBdlYB8aU5K4Idq+AUWs9tDdkzSxWFqbcbQQoS2DfMhdTI1f9
	 tHh/ajSK0ZgBZVWK4E5e3FvWzxaGlOWKt5CvOZ8G0eceNz3Z/ms4sWdm2+ZSVFVY/syrF
	 KS5kjyXwS59/65VuOzcXJU8UoHh/+yQ+LMxhaQFT73a78MBjd+VPEPgkq2gczr9LfYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795081888;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=QCtvpJJpK/tKPwcjLQpFBntT1fd2LvukVv7GFEkPKKk=;
	b=4Uf3Zla61B1ukb9w9KgPXkTkiWPSiYqOIAFbDbUVLkXLKaVpCNuzsOM1ZSXU8uWlUHS/
	 hK4zkmsZIokeComE1fUe89i8+2zj4nIsLESy4lVvsZbBloWGwKHbVG7lQiBOrHB6HPrFx
	 3myLCLcUqcD5zeKcKX8Ox+1jJJJbZaRoHAgYDzo3GGnEl+8Dh01ZuRg4FB8WjknECiEdG
	 XhHjEZv6fD46KydVyiRwRoI4EAxXb+amFF2mcUoC/gopsDtIkuW8ZWmwZ9Y1LTth+Hzwo
	 ZEUYyWITVlUJ84I5y2o/px7WaZui/BoQcR9ZZQSTlaDIxMJi3Srg9lZp+7gwxwOECjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UjzmLULU;
	arc=none smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC27D606A337
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 09:51:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC27D606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=UjzmLULU
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c5123794038so163565166b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 01:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795081885; x=1795686685; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QCtvpJJpK/tKPwcjLQpFBntT1fd2LvukVv7GFEkPKKk=;
        b=UjzmLULUbPuX6Kv+v5NXSiVfqZ4enM39iH7s3fpgsoHsdvGqR6DqCDPTZ2Nk/BSSMs
         NrRUKiKOMKPN3Uo5TCQOpVmslWSouoldP79RLrlf8zrHLk3HTSzZxmYHYq5xyPIz0ARN
         rPlk+s5mhYW6hPr66VMoNsbqqi+5COb3G/Mk/qMS3xGutAMWrfMG84+yFWQZF1G2gBC6
         64NipMh6Uj2gRF/H5gOJNUdq+DIncBQFHb31m8XboR1BhOgxNAUD/ZG4O93VJI2ZD/5A
         YPOD3R59AsyJJckYJHzVb3YCnki9aQaMZ4px+K/iv6g1J29+L0CNgeNduum8NJitorBl
         IcXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795081885; x=1795686685;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QCtvpJJpK/tKPwcjLQpFBntT1fd2LvukVv7GFEkPKKk=;
        b=woloT8Yw0LIZ0dQRXSwGdziLjTG3ri8X8oKw5+nSacOSOyP5mWi7YSNVvHvAWV/9vJ
         gZmNRKqs/QPRgoiE9Hod9XUmRW4kMLm46R0UdZBXlAqVhgZBiPfqrr74uyZe5Ru3yGGL
         aegnM8Qc7SkDAdVaGZJKqJLuysgq5TmWyMH9sTk9UKB80itgnbyZYKaflWgs2Ykkgzox
         T4wKVrL2CLVQEm1rxBvx1cyilswGA4prF3c/6l6ECQ6AJCoGtH8OO7PzHYNi5pRcQQ4i
         cQQaKuIVn4cWiomu4yyCbV1FMtrLbDGyHz8Jpjk8FtbTVBD/RkNmVvYpx0ur255QJ1PX
         insg==
X-Forwarded-Encrypted: i=1; AL+hErGfhH5diefSsDAX/idSJyCMAC2kref8M4YK9zmTQlhKwQzNGvq2XYr65+W3xrvCXkA2lQb12BBGIkU0i6y0@vger.kernel.org
X-Gm-Message-State: APuU4Z8y/6YAK7sr1VYFHfem909IfOfWA8lMnZNuiZry1J1SsDqjXxBU
	9OaNFdfRMccQ9R/GiR9108JIhXpElB2QBgFTABWB0pcl2yeAOFVI6UUVTC4eRGzZZmIVhsprNtJ
	sdXi3+XI=
X-Gm-Gg: AYBFou19vRgn/oDXnHi5s9r52LN/YMtfNBLCAcvOvJc9QavaIsj7IWqCZSMtOsRjtwB
	H8n9z65Hq5gVOC+ndwoEXZmdoMDPgTPuf/q6Gtb4InRpDrEECBCkWltEx3T0MWTR2awCHES/r7y
	kBkFK+5aj5PzYqZ7PwFb5gOp3L54TjUz7m9t64HMO6I2RPVFt84Mw+DaBvmxLX8qZ/ht8QBpqDd
	rjVvYb8k1H0wemrX8v1FjhC/TVYMLhGiFUHPEAXhknRAsGoTsQDRWPONRdyFdLkRkcSXY0zheAl
	OfJHM3kIHaLAgZCbde808I1p/MKUm+thyEr2XXBAjGl2UdZniXpBC760Vx+enSeDLxMghW02W8A
	OxQ50KdRgDCWie4JTCEZdfG1TZ6UYUXQR5lEfVMZD4ZnIt3RLJ2oajEBNRL+OBreGXluWbcIJkC
	uMTwca8YSCTCAIBfQKAuqqn4yG47oItfq+BRdKM3OdmalSujxUtpf+zw6KXSdHhRj8Mz9FahvBl
	5Ie3xrHIyhggC2QnQqrDlSinsZUD/xT0qK92+ju2IsiGmIh9P52bOYd96H9Q+k0HQYb8mbmDx4i
	xYSGa009pmUvR9+KUj6/LQ6XlwJh1Xy9M7JU5GN0nX09GkaOEJYPROuuA1E6cJu4jTUuY/vUM8P
	l84Qt+M8lUv4U
X-Received: by 2002:a17:907:d7c9:b0:c2e:63ba:1f90 with SMTP id a640c23a62f3a-c510e58731cmr485530666b.48.1795081885550;
        Thu, 19 Nov 2026 01:51:25 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51231bc213sm95057166b.12.2026.11.19.01.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 01:51:25 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 10:51:23 +0100
Subject: [PATCH v4 1/3] dt-bindings: media: i2c: dw9800: Redocument DW9800K
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261119-b4-dw9800k_cleanup-v4-1-df26c431595e@fairphone.com>
References: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
In-Reply-To: <20261119-b4-dw9800k_cleanup-v4-0-df26c431595e@fairphone.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Daniel Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 stable@vger.kernel.org, Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795081884; l=4477;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=g/OiRwFsFfdmnWKD7IddFC6HC4DRBlfOM96+ymjJkqc=;
 b=+9IaxyEdEXtMhI8Q3RfHlupMQA+Qy0T5cjXDl1x0aooiVjh1QhbWPkDRwu49Vw30ieXUb25Nl
 SfvolKTIkzsCOUMlU/9CFGhBywusMmHFMFgObvIcA5prfDof5CtDFpS
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

The DW9800K's properties are too different to justify sharing the same
bindings file as the dw9719, Create a separate bindings documentation
for the Dongwoon Anatech DW9800K with its updated properties.

More specifically:

The DW9800K did not share the SAC1 and SAC6 modes
that the DW9719 used.

Description of vcm-prescale does not match the calculations labeled in
the DW9800K datasheet for how clock diving rate is computed.

New property timing-control introduced to offer more fine-tuned dividing
options available to the DW9800K.

Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 .../bindings/media/i2c/dongwoon,dw9719.yaml        |  1 -
 .../bindings/media/i2c/dongwoon,dw9800k.yaml       | 91 ++++++++++++++++++++++
 2 files changed, 91 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
index 8e8d62436e0d0c4f9af9e52262b23881abd37cec..38db0764c0f70ad49295dcddc182b7e100a68b29 100644
--- a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9719.yaml
@@ -21,7 +21,6 @@ properties:
       - dongwoon,dw9718s
       - dongwoon,dw9719
       - dongwoon,dw9761
-      - dongwoon,dw9800k
 
   reg:
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..99f3b506cf12c63ddef1e3d18fd59179a5e7800c
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/i2c/dongwoon,dw9800k.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/i2c/dongwoon,dw9800k.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Dongwoon Anatech DW9800K Bi-Direction Voice Coil Motor (Bi-VCM) Controller
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+  - Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
+
+description:
+  The Dongwoon DW9800K is a single 10-bit digital-to-analog converter with
+  +-130 mA output current sink capability, designed for linear control of
+  bi-directional voice coil motors (Bi-VCM) in camera lenses. This chip
+  provides a Smart Actuator Control (SAC) mode intended for minimizing
+  mechanical vibration.
+
+properties:
+  compatible:
+    enum:
+      - dongwoon,dw9800k
+
+  reg:
+    maxItems: 1
+
+  vdd-supply:
+    description: VDD power supply, can range from 2.3V to 4.8V
+
+  dongwoon,sac-mode:
+    description: >
+      Slew Rate Control mode to use: direct, LSC (Linear Slope Control) or
+      SAC2-SAC5 (Smart Actuator Control).
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # Direct mode
+      - 1 # LSC mode
+      - 2 # SAC2 mode (operation time# 0.48 x Tvib)
+      - 3 # SAC3 mode (operation time# 0.72 x Tvib)
+      - 4 # SAC4 mode (operation time# 1.20 x Tvib)
+      - 5 # SAC5 mode (operation time# 1.64 x Tvib)
+    default: 3
+
+  dongwoon,vcm-prescale:
+    description:
+      Indication of VCM internal clock dividing rate select, as one multiple
+      factor to calculate VCM ring periodic time Tvib.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 #  Dividing Rate -  2
+      - 1 #  Dividing Rate -  1
+      - 2 #  Dividing Rate -  1/2
+      - 3 #  Dividing Rate -  1/4
+      - 4 #  Dividing Rate -  8
+      - 5 #  Dividing Rate -  4
+    default: 1
+
+  dongwoon,timing-control:
+    description:
+      In LSC mode (252 + value * 4) * divider value in microseconds
+      In SAC mode (6.3 + value * 0.1) * divider value in milliseconds
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0x00
+    maximum: 0x3f
+    default: 0x20
+
+required:
+  - compatible
+  - reg
+  - vdd-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        actuator@c {
+            compatible = "dongwoon,dw9800k";
+            reg = <0x0c>;
+
+            vdd-supply = <&pm8937_l17>;
+
+            dongwoon,sac-mode = <4>;
+            dongwoon,vcm-prescale = <0>;
+            dongwoon,timing-control = <16>;
+        };
+    };

-- 
2.43.0

