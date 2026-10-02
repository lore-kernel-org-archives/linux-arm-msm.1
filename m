Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685424AEBC5
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Oct 2026 14:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950914; cv=none; b=MgnCmPFwpMBI1YFKIj0r0W9wWtUUX0lAvXc78c/gZpgW9XsVbYaSk9WSxubGXYm3kPoh8pmxG1336KqeedeBkQI6WNOKhY7KawOoX83akhB6wjPdlTqCCGFHbDGJNEXbnNXRm+kR/FRD/azj82mSMvY1XKVdz4QS+hRtUgolzew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950914; c=relaxed/simple;
	bh=ZXP6OkY2DxkiTYSnHO0CLOwn5hC6SXDi4hWyiPvZAl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ee6cCzAu23IN88fxVCdqqmg68l6ereD5z5Nj6h/ZAdEmyge50n7yMCW/I8wSYR4qwqsebepf0fmAdHzlMne5omwjRXxkxLtmn+ZB5UNmKbLxpjdC2Ix+xXBBAbkfTN7I+k8G3pS0DDmtoluhOfMsnvyOnDjW9wIAKmozMwa4MK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=B1amWoIt; arc=none smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="B1amWoIt"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c29703cb796so14521366b.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Oct 2026 07:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790950911; x=1791555711; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Qgqhj3Epuh5RclDvybJ2oNFa673B4IjvzwU5Ux/nnZ0=;
        b=B1amWoIt2znqDUpPbI2WOERHHdAIWflbhwyzxoMrz646sH7zuunHllEAtPoDE9IuhW
         oD5AWrHqEfpTSweitysUnOE7pp5of3SnL5g8H84/TDBudAtzGcOWsng6So28BceYpRjg
         ZDVsLT6khEPsZiTtDTy3qZuVHg1gsMJvj45ZSlhJ2WRpHO7LI1KWjcXBB0veuqtvkitJ
         YTXlczUuqXew4BT1KaTAlI3GMBUW6z8fGptBKmgP0C6cmoGydxOj0ltQvDMkFg00z9WU
         y3Cb1VrIFZgwRwPkrJr76//6JKFfi0HjhgY/CX28BPGtAPm3E0GHGDr1V4reaLsIlZlE
         G2MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950911; x=1791555711;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qgqhj3Epuh5RclDvybJ2oNFa673B4IjvzwU5Ux/nnZ0=;
        b=nTdvAHqVn/qDutTkMv1s7kZPfDXL84usaUu8vr0ioTpG7e/VzrDvTc7KwIbmDyCn4g
         Dmbpug+uJ47n0l359qUIDY6sHmiteTlYISmR8XEOd4AIECPIKHxJ4ovGx+SfF5i+pJyE
         ImTMuhlP36gryJmdchL4iI9gayNSA/wH9AYkOQVTHjPKEI3cOaNfgAXWDcbWtACjr3ti
         +99rEv5tJFbPA8Z5bxnTFkg0LsJgw8yG4HhcWpeZ92MEpOZGCvflmPX7ZgDA1XhSqUDc
         qOZBBVpz21UlDjEKlSYSteXl/mR9mDWj+Pa0bD4z1XUVu0ZnqBAdD5PaHV2T+GYYAJEO
         /vhQ==
X-Forwarded-Encrypted: i=1; AKwUvBx3vAYotwf3k7H+F0y1S/TbBowHlKclWVJkrhnOZj8m/QZ1OmXTWykZnjeuo3E98O659QtwLTy+WkBE2Tqv@vger.kernel.org
X-Gm-Message-State: AFuF++kcZJic3uJiXE/7rDBIo64zvDBbaWry1ydmECu8twzLNqGf8XFx
	AwTKJRih8hh+PUcz7H5TNlEbUlKlwzBXA/kWCtxp0N1f+4oRHDuupiNp01l0OukIhos=
X-Gm-Gg: AYBFou2cCBTARulpC7mriUxkX3E4qd29yqssHgXW+TkV61k0qvB9vGIRRrgaU1MFOMM
	/x2JjnO3G1jQILVJYOOQDePkOg+TP8r2X/EK87FrAUf8rubknI++raZZa5i5xH2oRtfIrOmCzTZ
	MfGHTjs/nkzJ0C0Otqy2ztIUlyK2t+7FqJN8yiW5ac+c+mOGQQs4Z6nvA/Ou8mpP3UqDjFRbe5r
	+1k+bNk6yAFWD4Te8Uzf3NoECRVioGPxQ/5czkqNwJ4h3pFK235VvWWDWxguKogamF8zjwBp41w
	yUGPPpytZsLwWA/DxUMLlVBmqZ91WND3SVGCAlABAM0oUuxGfn3SDPZIf+gbud1k2kK4bNo7W/X
	ZW6MhAgUY+R2UPR1H66EplOobht4hhZsl6GFb7EK4BUZPCnknYx2t5//99bOXEJ6WwPzdtecnfS
	vIQ9Qq9PkSPPWX36ER9qk9wZS66jSJv5uwyZyhII560YghMM545o8R+7ZKAlS0w/mIU0SYq4/7B
	SV/aT+ywMx+EmW61WUaNbF1WJB2ySk40m6UxAk8rMZdIoLTHukbc6XnB58KIT8=
X-Received: by 2002:a17:907:c16:b0:c2e:4488:b8a3 with SMTP id a640c23a62f3a-c2e4afb4dfamr203583766b.33.1790950910733;
        Fri, 02 Oct 2026 07:21:50 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf684e3sm89307166b.51.2026.10.02.07.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:21:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:21:45 +0200
Subject: [PATCH v3 1/4] dt-bindings: display: panel: Add Novatek NT37705
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-fp6-panel-v3-1-4b80f83bc936@fairphone.com>
References: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
In-Reply-To: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790950908; l=2354;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ZXP6OkY2DxkiTYSnHO0CLOwn5hC6SXDi4hWyiPvZAl8=;
 b=COCbMQS3AncCT3ls131LtMAtGjNrfapFqjTCKGzpbyoLUllRaFlpMgQRKj5Tez5BqkWhFh/lN
 W1H8eSLRNWGCCSu1sBjRPqGfBc6lhIZA2e1Mh3sB1U6Uiped9YwZYHK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Novatek NT37705 is a display driver IC used to drive AMOLED DSI panels.

Describe it and the panel in the Fairphone (Gen. 6) (BJ631JHM-T71-D900
from BOE) using it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/81a3c207-4d8f-490f-8e2a-6f3f4c2acd35@kernel.org/
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 .../bindings/display/panel/novatek,nt37705.yaml    | 71 ++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
new file mode 100644
index 000000000000..850d91e25af5
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/novatek,nt37705.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/novatek,nt37705.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Novatek NT37705-based DSI display panels
+
+maintainers:
+  - Luca Weiss <luca.weiss@fairphone.com>
+
+description:
+  The Novatek NT37705 is a generic DSI Panel IC used to control AMOLED panels.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: boe,bj631jhm-t71-d900
+
+  reg:
+    maxItems: 1
+
+  vddio-supply:
+    description: I/O voltage rail
+
+  dvdd-supply:
+    description: Digital voltage rail
+
+  vci-supply:
+    description: Analog voltage rail
+
+required:
+  - compatible
+  - reg
+  - reset-gpios
+  - vddio-supply
+  - dvdd-supply
+  - vci-supply
+  - port
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "boe,bj631jhm-t71-d900";
+            reg = <0>;
+
+            reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+            vci-supply = <&vreg_l19b>;
+            vddio-supply = <&vreg_l9b>;
+            dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+            port {
+                panel_in_0: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+
+...

-- 
2.56.0

