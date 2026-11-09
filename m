Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794197116;
	b=PBlVTHt1GzaB6QTEaNMeufJp3Zn9+qYPF08ZVRRFbQ8eJus2PIWFa2HBgaRl/h1mpHeC
	 eLqV6EtQtViEa1VevNlOqY/r7f48yMKsZpeydOLOFRk2fAQiJe1cqDtUouO9PRNwgBuw2
	 z6HYGpcxvE/apDIJzD9IhlmikdGsX6o0Lfi/mi9O1nY1Rn9AOdslcce1/2gxjlURwlZ4/
	 jijjZuwGec6ApDJCt+KcqiRCdkwE0PH80TsY7lwLru4aHMEqI8BsKZSmINu+j9h9NjhjR
	 O+B8of+bmGdKWj5pPHZHEd836GOEwrM5PgJ2i1h4jKinVdpLRgaVBs6E56ZptBtc59Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794197116;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hIU62W0BUNZPKYkLAW26gZ6Vi24pHjTqobWZNWpG/Ak=;
	b=SBhk8TOhJdkOoJ0BriSt/avow+lZlSrJ6A/4ltLJhjc+vhmc+mk0+EeKS/CG49qyMHwl
	 6bI+FAzgFlG2h8nXpSZZXThy5HggH+esYtM3R+cMvUZvqUkbJul6rjXrRhdxRvEl+99WK
	 eshp2lklpl5mCZ/u3DKuu4619MRhS0bmDfdkTu7E0pdqrL/VeK4PM7CApFJejl0x8hQWn
	 4rob35T5VpGrTob7yYRut2LteSQe7ai0PGHeDbsZfHwFtDkwMlo3+Gap69oUuPcAGqMAy
	 HYbdi+4a0gDOu0dRVq8Y82Wn4uRzC5XmnEkV0yEz2O4W8e1SZPgznH6rGxI6se05t7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZGiixoj;
	arc=none smtp.remote-ip=209.85.215.182
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1610C606A336
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 04:05:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1610C606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XZGiixoj
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-cdaefe02d5dso237089a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 20:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794197115; x=1794801915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hIU62W0BUNZPKYkLAW26gZ6Vi24pHjTqobWZNWpG/Ak=;
        b=XZGiixojxhGrpL7RX9KoIGDpUPBaSpf7vBiwjdTA4Cn3bM2A6vNq2xreToPAGaS2d1
         bhaubbweVY59R++EyiT0IRAOpq0cxGu8N9OgEEiONV1ZOxRZSl6dgm2bZNWuXxDIC36U
         cHgrwewj5ZaOJ2zfyVsiCHFlhAwq4TXXILSZc6SAacNpDAkKAfb8wLCGt8b9EAeG+tkC
         lJ/UVBD6CB9mAYm7QTFHvWHMMoImKql7STXMS3zvoRxmZfbFh588IfyBK9g/0Lium7L6
         LZNXrUCzo8EGC3VHgOc6ppqp+Aw5Rdh2P7d4kvdmNFLtaYOROciBVThqCnWRVDGPWOyn
         6sRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794197115; x=1794801915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hIU62W0BUNZPKYkLAW26gZ6Vi24pHjTqobWZNWpG/Ak=;
        b=hZqadSjHH90NJ2eVXGgihlm4nI7HzQw3ZJqokapnZkPa3/dp4ACimv+a7/PzdkQLVI
         +yb5nK9z2ApLxbCCoZ6jBdjtX4oXdyM8CLAWY5UPgRy/rBuE4I4IJ2+ghRBrEkjpfDFX
         HX8FQMvsYtHUV55pfHfLPUrjxWD6jSevxlpGy+dIIFCJvjnIodOe0jK+v+2CdT2vxKao
         DRm2B3YMws9Np4X+zUfGOKsoP+xyvBrbv+5Acgn8wawAWZhDIfqsX54VDEiL0MFX6Zsl
         JmVdqoKWVqZskmL6M7wZja2FOX3Nv9MWfZhawgDLA8+zQCf50e28HPq8cKoPmxXlUOgj
         3S3Q==
X-Forwarded-Encrypted: i=1; AL+hErEHxCeijZAxv2C0w0oLfhlvPqU0PfN2ERH1YdBayFxU+EhFaC5UgWMEpSM11pMBO/q9k+ZBW0OG6nF/rZ+q@vger.kernel.org
X-Gm-Message-State: APuU4Z/3SW5HXGHS/+OTIslddNkOvhGJuBl5YicxdrrUjCjjnFWRH/4a
	MXW2FiJO8ZOpzd/wKy+4E4cxXRDLjXIl5segJotUSb57yWOQn0ZNSSTa
X-Gm-Gg: AYBFou01EljH1QhNcNaMPtzDagNFvVT67ozkaXx8gpODNQpdqi2K+CWUsY9UZHot9n/
	1O1bGStDqXtwUJ1jxSaNqfJmfegsRfO5xu8ddLMrs32D7c4GUmQc+WpxpS+UlDZgOMsNLY4a0FN
	PeGOJlELxWFSNGYjlo6A9Q4yG91BMbCuf80jzxECaKI8PlBsO+PAlTU3fP2CBZIpGL7NT2PkE8m
	qEgESlP/n17G+CDnswFy+ugAqcJDFUFJKK63yDj5qqU4rbtZU1oeDvQZJ1mEYUVWMJKc45aUrUa
	hQ5WitkQWU160aqoBxWV0ScIHWL7sKjL+tb8M3tXR+nWFsawe1q/UBpE7MWo6AiAg355nD8XkiF
	o9ro5Ox9ff5RKxYLXVJv/KTSfRpxCTt5i725cQZuJlSXDb2YmXpOaaFBXlj9z9qE1CZcRcQPQcG
	5N6Rg1bk6rlpCK8lrDZKBMFkQMAQo/i3gKRGxDU2iS6ulCIkpZhbG06M2+qeN36itW9EO8Lvmk8
	Sd15IYRRXqjWXRnxE42NoSG+DerPcDVBOYSUOWrxKpnUIRHJk/kzBTngr6O1231WMLOW+McwJpo
	isFWki+06O4eJfcVeNgNR3aGyD1F9xmiIaXh+I1iDLiQlHcOwgkI2SKcJjzlx2CSm4QEIoniVAG
	WCaiYUrY+MdH1Y2NWrPeVhBCAw71QuLeZQfTq+Z7bsIvNcVwOnobOs9qMYRvSWerNQoYTrIkZvN
	k4GPk=
X-Received: by 2002:a17:90b:442d:b0:3ad:6090:a190 with SMTP id 98e67ed59e1d1-3b12d4b6839mr3064156a91.41.1794197115134;
        Sun, 08 Nov 2026 20:05:15 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b127891fa4sm5116170a91.4.2026.11.08.20.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 20:05:14 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Alban Bedel <albeu@free.fr>,
	Vinod Koul <vkoul@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: phy: qca,ar7100-usb-phy: add AR9340, QCA9550 and the analog reset
Date: Sun,  8 Nov 2026 20:04:50 -0800
Message-ID: <20261109040451.114135-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261109040451.114135-1-rosenp@gmail.com>
References: <20261109040451.114135-1-rosenp@gmail.com>
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

From AR934x on, the analog part of the USB PHY has its own reset,
which has to be released along with the PHY one. Add it as a third,
optional reset, and add compatibles for AR934x and QCA955x, which need
it.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../bindings/phy/qca,ar7100-usb-phy.yaml      | 38 ++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml b/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
index 029665530829..358b3f345c12 100644
--- a/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qca,ar7100-usb-phy.yaml
@@ -11,8 +11,13 @@ maintainers:
 
 properties:
   compatible:
-    items:
+    oneOf:
       - const: qca,ar7100-usb-phy
+      - items:
+          - enum:
+              - qca,ar9340-usb-phy
+              - qca,qca9550-usb-phy
+          - const: qca,ar7100-usb-phy
 
   reset-names:
     description: Names of reset lines in order.
@@ -20,6 +25,7 @@ properties:
     items:
       - const: phy
       - const: suspend-override
+      - const: phy-analog
 
   resets:
     description: References to the reset controllers.
@@ -27,6 +33,7 @@ properties:
     items:
       - description: Reset controller for phy
       - description: Reset controller for suspend-override
+      - description: Reset controller for the analog part of the phy
 
   '#phy-cells':
     const: 0
@@ -37,6 +44,27 @@ required:
   - resets
   - '#phy-cells'
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qca,ar9340-usb-phy
+              - qca,qca9550-usb-phy
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          minItems: 3
+    else:
+      properties:
+        resets:
+          maxItems: 2
+        reset-names:
+          maxItems: 2
+
 additionalProperties: false
 
 examples:
@@ -47,3 +75,11 @@ examples:
         resets = <&rst 4>, <&rst 3>;
         #phy-cells = <0>;
     };
+
+  - |
+    usb-phy {
+        compatible = "qca,qca9550-usb-phy", "qca,ar7100-usb-phy";
+        reset-names = "phy", "suspend-override", "phy-analog";
+        resets = <&rst 4>, <&rst 3>, <&rst 11>;
+        #phy-cells = <0>;
+    };
-- 
2.56.0

