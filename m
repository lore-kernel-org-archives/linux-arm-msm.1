Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160047;
	b=DPjbQ/sy05LUbJBZza2hUwgupofYj55FE5O0sQXZUVNBlF9AJ3bWKVzOutzwiZtXnBYH
	 m5geELvVzXJuzfmuQ1BpDBpNXnHMKEonJpHz0fejVD8LHDB+h8T79Jspl8aNDcjExPH05
	 PraWMewGM2bDjUI8QwRbkRHEYbHIJ97pdAjnXIoP1Rdhk03nYxBuQZD+y+eHdm48gfvWL
	 S+Pft4v2y2aGzib6DTsq4sg1dZ2rC6tEol3xSPEpYRh3IysD79BCpyQcMYrWSSyXdV4Z0
	 K16lcHKJt50FIS+0xOF3lEfHGtpsVr+bJvnkkKPzhtwTBgBCzN6Y1JLp6ClPJa+OUAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160047;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
	b=A5xKRqYDjZ0rNcs86yMthchd9Dl4TJwXqlQIJHnGtkuN8mihb/FH7vt4i3QOy52oUbnD
	 E2qQ75Wj2vJIyPv03waYx5AWbojRnZ1N2HxgSLDMz3Y9vP5lv3640dxzCb8pAL3KFs0z9
	 qY8gZvcrm8jozKPX/+yoLDoKJ7h2dewM+6lvxdvDOJKk31OBsLDj6hr9pMtMBaC+FolPz
	 S1PTglb1oVkbwzYeYoXqMeumwJ2c3Yi0bsVgTeaeM1cpD8w/HiGudpGEmFDBfVx4+cJAz
	 Jxpo1svSYIPmb2uasedGp2vQkZdQ0YwKdTuTdRDe4Iv5dSGSQFjDHw45iC2UzMadlYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QomUB9wk;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1173360A3819
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1173360A3819
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QomUB9wk
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so5902865e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:34:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160045; x=1795764845; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=QomUB9wk5UINFnNmRIvHm/ArMbX6n/cgwMpT4/4Nyjr1QDC9P82L5pLn7KFoBaJ2S5
         MRNX+Q93EVcI6f7taqmmyDBlHekO8S7XYnZHlzpW1YjWWrUpQ68XElhy2WriGo0TvS2Q
         eAgH6Mhv2D/Zb+QnbtMnkIwaumlMpk4WiY4xbvX6bd0u/Gzq+Ps+Ntd2CANoqmt+k3UE
         Xl+qpKBEwHT65+WEXab9TmclpX+XkvTgg7i+al4ZPxzRqTlhqsmXHqAPh967SXNpmCo7
         6DfDg4dDd6a5690opLuGnSaxGtRaokNqbSVP093PUcQCdXJrl3k54pKCgW4v+blQZQd6
         vhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160045; x=1795764845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VlPXjcEHW+lGnIptKKRSC5EQ8CQecxUOoIc+hyAGrok=;
        b=Ib5CQqqzdCwhRWjPKeLbBN+KopBZnVppJ20a0W3+K5Jbx4SJs4lofA+PADjA6m0eYF
         oWojepd4JOduLFr6/bDGC76xAT99lPjz7pf83H7QAbfhB4sxojzgvgyV/l3jFpRLWR1B
         MFJo2pU4RWPcpfjLBL5sGN8fN2r1x35UgwQkEHSu7OfJRfPeD+Vl6pcP29E15Jj/WXOZ
         aWTc9E2gY1gdGNLeOKmxv7dU5Ecr/iKK9EAxMDDG1JgzviQf/eT9bkku/EQlZMR56N1M
         BqqbpQNvxZlWCzBi2KvKIwOwaCJnDZMvJzX/jK5zvxit+BLmx9DSIrnTtIsyLK9g2JZX
         dt+g==
X-Gm-Message-State: APuU4Z9jAMPStJX5kVFtb9/LPiHLLcWU+PVrYN+84sH913PpDgrqMNoN
	66CWThlQdWp+y1rXZCMVik6u+ZUR8T32bXNs+ggq+Bes0Y6ulOVrflhfX42mZJYjxWo=
X-Gm-Gg: AYBFou2upaiUo70O+PXPmEPYmJEczvhXxl30D0XFQ3bc58j60AB70OS6rymMeJA7Gq2
	DTQ4nzfYBg0psoT/iS8kwtWw+Dmmje5iZNj51RjVSWtjFk4drK27i9GZrCtLVnUvYNstQ/ioYvd
	8SQw81zfmJSql9Q0efAPNJrYh5YyrKdmZLLUlSX/WC3JtWpBsarE+b0Oh0/NRQb1qdRE2++8D5U
	n9jy1/yosuJU1kFLsRpNu1lZnbcpmqvF5CgVMroa7dU/lNAH0AYg6JxMZlHBm0/oEUsdfCdotbF
	a4cuCRJIbHo3Klj6Y1EFLKjXz3GRTF4wUrLLWK8FILAomOGUf4vlrUs+jY0QduxsLdavhDz89J9
	oi+fXVJ4iRKDm2Fs95ba2zUYf4K+vEQEZbHMUr8cbQeMepuG9R6SVA/wlQrcFERa2fRzy1kxjVQ
	jhIf3YOkz90hSnoxJNNeGDlUP+e/KDZuRor8EgJkU5BaKgrknNudLu24/oD3GmSciW8aLjOKscQ
	36/w/VPpxOWkVFVIV/6wO4qOHE/OYxaeGVNRI5oiGtNwWfWaTDFbgAJxCllyAEK6OJvXV4unPto
	hnMoyJVyvY+290BT3VTauq91L5nRpqgXVcnrV3rBVidUCUYM9eHdHHTDmKbf/7JGssF66Neqxz0
	U8+bs1ZQhRisp3HRc0m4G
X-Received: by 2002:a05:600c:6749:b0:4bb:5d38:259f with SMTP id 5b1f17b1804b1-4bb8881099cmr44675865e9.12.1795160045388;
        Thu, 19 Nov 2026 23:34:05 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:05 -0800 (PST)
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
Subject: [PATCH v4 05/10] dt-bindings: input: touchscreen: add Silicon Works SW42902
Date: Fri, 20 Nov 2026 08:33:53 +0100
Message-Id: <20261120073358.10267-6-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
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

