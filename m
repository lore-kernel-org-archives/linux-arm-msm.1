Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674C53CFF72
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 19:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179798; cv=none; b=LC3V+Hpp85SG05be3rHVj9eGMowP16bfAQI+P1B7s2u5SkYaucvBQlrfFuJlkJoKm7EH7HiDI95RoUjWdifJuKUJZYwtS7ri1ct1E/FDzYPxP5zjhV01RZaiaACoi71iEizAq7iqq75tK15fWlgu/HLdwDLVQcqgDrp9EjFJrfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179798; c=relaxed/simple;
	bh=a79mpsBGOjBG04lPkNMqGEl+g+V/3IKRDyM8eJWkROU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URApwnzX1Aak1uV0hWill3YU7xjroXus/ceYmrgcdmg9u6YuMA2q5B2qE18Zq4I/7OjXohthWDjq7W4j2E2Lap6F7qQ2rZodoPtPLUokXNQi41aHQ2FUAf+3rS8wTxWoxjShoiIuEnWUM82J+ePCXanHxK7SHKSUUkeYtvs6wtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjWFCGzx; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjWFCGzx"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-47c2b362ee2so2573543f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 12:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785179794; x=1785784594; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hUnEXYHfE21rZw1q9AJTuUDahJJZ6wDRNt2yCVGSXAY=;
        b=HjWFCGzxEWUi1ot0o7PPhm4ZzanA/Lgy3SJel1kqjDQYt0Tm95IlL0jiziC5gE9ECM
         CKvP53x1NSAM1yGIs/L86l/Cu+lNv3koCBcEryf6RmWdOQk8o0JK4ymEkJfHY2OERAtn
         gzJSJYugmQZ+dJJch08/7XUyf0rS4FuzEz2GUDai3CL37Ywo2pRU3KJCVzIjP4ly6tR9
         L+fiIjQmQz1r8o/YFaRTLlPFNlO79L/CbQ7lJIqO9PQLIxLeyhV6JdicQw5jR9s7gvJB
         yJP/lFDM825Ac3wiuaJhWxyPQRlGJWFI3mR/TzKUqBAVaQTyWyHZjJE0BUFuo9tmovH1
         UUTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785179794; x=1785784594;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hUnEXYHfE21rZw1q9AJTuUDahJJZ6wDRNt2yCVGSXAY=;
        b=DF7bLql87oIXAYvEVQGvlWeTlDHGyOoJ2/eXWjqpuDocTaXrDG1J995D40OaXpCIKJ
         qwF0KoWxgMG8METaaUJQZAj++3iZv+aNG16ax2I5MHXCPn39N0FRGkYRIf3vXv+bd2zm
         5c0uw34GppPr8qnjodmdBnl9l5GkbO5ABuutCSsHONv63dhr7AiP2ILgcmmwakUIkgYJ
         lnQuu1qXR+GFdtVpEVdJIQXo1XyGm791WrTUM7TStvicZHyjWpIENST8Xp/YedenTKyF
         KrZiI7dP7kE/dcoPFWHqVP5i0EfKAYyRZaEv5HKTYqCJHm/wEIycT3K2qDcltIReDILn
         ZMnw==
X-Forwarded-Encrypted: i=1; AHgh+RrL0KmLqNL1jiGAfpfvPm05K6CVaw5jLFPRXNCuhhwBZkg7r0GYMo4pFLTS+HELnhLLnDD8PaNT8j62LmJ7@vger.kernel.org
X-Gm-Message-State: AOJu0YwyyfxE0smGJAdOqbvnoqeDtNOkStM5G9A/vYmjxruOQnIz2/jP
	Jj8RpE0iOiNLJkQkg7pbNios3GeLVhoMTG50OTPl6sXLZ2R5EYY4t7t3vGoATTofpx4=
X-Gm-Gg: AR+sD12DnR+YybNe7wZzUISXshcrSdwJPH15rrz2LDZKqMWiG47ZRxOZvRssNNffYs8
	tyTsyqXFeSK+YxFphh2QBQ/4z/ywnQAbswOOrP72IGj40tSV57D9a1NnEZ2q3avHAh4wKXfTIPv
	5r5f+7e0a2Z3OvoaOwrNiHQ2gj6Z4ghAr6MEJan+bmrpSronAeJ3QGgNq225EZhDt9XS3D0ypiL
	1++Twqzre7xAz9rcyOLKD8uWxYvV6bQtf5J2DAER1ycZXqowywIGc8GfWlz5U8WFyBru5epdUmv
	0wmwSG6q2ODeE0y2r+RXXRayP6y4Jbz1pM7vpLJGvzX68+tDLtnGAENgTgdpLWls/kXRnhk8p5V
	nvQKvL+HTFWbgp1dfpvhEkZtv5nIC5b0hcljsI5LtfpEWNV1ytP9gC3Vfo7lMIafmQGo0VRIzX3
	0fAERkojZOWdFXiyCnp8LCMBO/g/OkTPrH5LY=
X-Received: by 2002:a05:6000:603:b0:47f:8f8f:e494 with SMTP id ffacd0b85a97d-47f9fc8c3f2mr12091014f8f.2.1785179793590;
        Mon, 27 Jul 2026 12:16:33 -0700 (PDT)
Received: from [192.168.0.35] ([109.77.105.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a6d7sm50749607f8f.2.2026.07.27.12.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:16:32 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Mon, 27 Jul 2026 20:16:23 +0100
Subject: [PATCH v14 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-x1e-csi2-phy-v14-1-27d1bf477593@linaro.org>
References: <20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org>
In-Reply-To: <20260727-x1e-csi2-phy-v14-0-27d1bf477593@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6404;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=a79mpsBGOjBG04lPkNMqGEl+g+V/3IKRDyM8eJWkROU=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqZ66Jn5OlDyo6vhpgCBin+L7h0YqWxbGjstZVP
 C66uQ4oTc+JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCameuiQAKCRAicTuzoY3I
 OjgLD/9B+NyWa4Vrj9hwA4hOIP4+MnDvWvT4lU0FeJStXf+PS5UL/DJDI9kn+zRvpVNH4UiFm5K
 nD3FfNcC4yGiMPheIeSS7C3lgRgGW9FRt04CTiSkkYQ1OooIFY7IObhF0Mny/t5JmPSCDdU/9cy
 XmW5csB1WjHEIfGLGGYZae+ubqazIjj83VD4e07U5nH6U/UIMZajAeE3C+FH2q4btUUOz/5Pty3
 9iE21Tzbnm+GfdP+kvgBRRzZWLtfSfRj6jmfXA/pWi/Ygb8S25/rtG0N1oivKts3hLqA8vVE/hv
 qgke0/e/lH5i096Mm0DfYHoAPLjrviJ3nh+ILOwdEFO5zd3w+qPVtGfZ45cl+10TKUAE8lrxONh
 fy290+FWYkjv0oY5cTcgs8z4gSDENtX+cwZQjai/7HzCs7W/DkTEkAeOPXeekpjoBjXmJy9EmKG
 EmFKAo1Kpf870hWcbFtvCT4B8XSakoo3VArwVZTYnA0ERccDyPHhE5iIS4JVDpe1SepJWdiE/IB
 1G+J0EEC0T3w2aGfFi5LIObt9oRaEKaclxMf/h5r+OR4s8LTH+s+sTF2VTAaBoB4m4oFd4DbxTb
 Oab+Gi2Ry7gJ9qeiPe89bLwfEmtY/NLF8Wg6E6NIHItI/xjO2INo3soJ0ZONnJFtKae9n9J/Fyi
 ZgtEtc2KRY2obKg==
X-Developer-Key: i=bryan.odonoghue@linaro.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A

Add a base schema for the MIPI CSI2 PHYs on Qualcomm SoCs. This PHY
supports both DPHY and CPHY operation. A special mode of DPHY operation -
called variously split-mode or combo-mode also allows for two sensors to be
connected to one PHY.

The submitted binding here describes the DPHY modes of operation only. CPHY
is left to future work.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 198 +++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..7d0363812aa89
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,x1e80100-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm X1E80100 SoC CSI2 PHY
+
+maintainers:
+  - Bryan O'Donoghue <bod@kernel.org>
+
+description:
+  Qualcomm MIPI CSI2 C-PHY/D-PHY combination PHY. Connects MIPI CSI2 sensors
+  to Qualcomm's Camera CSI Decoder. The PHY supports both C-PHY and D-PHY
+  modes.
+
+properties:
+  compatible:
+    const: qcom,x1e80100-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
+      - const: ahb
+
+  interrupts:
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+  power-domains:
+    items:
+      - description: Titan Top GDSC - Titan ISP Block, Global Distributed Switch Controller.
+      - description: MMCX voltage rail
+      - description: MXC or MXA voltage rail
+
+  power-domain-names:
+    items:
+      - const: top
+      - const: mmcx
+      - const: mx
+
+  vdda-0p9-supply:
+    description: Phandle to a 0.9V regulator supply to a PHY.
+
+  vdda-1p2-supply:
+    description: Phandle to 1.2V regulator supply to a PHY.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Sensor input. Always present. A single sensor is described by a
+          single endpoint with one to four data lanes. DPHY split mode,
+          where two independent sensors share the same PHY, is described
+          by two endpoints; endpoint@0 with exactly two data-lanes and
+          endpoint@1 with exactly one data-lane.
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@[0-9a-f]+)?$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                description:
+                  Logical lane indices 0-3, not physical pad positions.
+
+            required:
+              - bus-type
+              - data-lanes
+              - remote-endpoint
+
+        allOf:
+          - if:
+              required:
+                - endpoint@1
+            then:
+              properties:
+                endpoint@0:
+                  properties:
+                    data-lanes:
+                      minItems: 2
+                      maxItems: 2
+                endpoint@1:
+                  properties:
+                    data-lanes:
+                      maxItems: 1
+              required:
+                - endpoint@0
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output to the CAMSS CSID controller.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - operating-points-v2
+  - power-domains
+  - power-domain-names
+  - vdda-0p9-supply
+  - vdda-1p2-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/qcom,x1e80100-camcc.h>
+    #include <dt-bindings/clock/qcom,x1e80100-gcc.h>
+    #include <dt-bindings/media/video-interfaces.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    phy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>;
+        clock-names = "core",
+                      "timer",
+                      "ahb";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy_opp_table>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "top",
+                             "mmcx",
+                             "mx";
+
+        vdda-0p9-supply = <&vreg_l2c_0p9>;
+        vdda-1p2-supply = <&vreg_l1c_1p2>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in: endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    data-lanes = <0 1 2 3>;
+                    remote-endpoint = <&sensor_out>;
+                };
+            };
+
+            port@1 {
+                reg = <1>;
+                csiphy0_out: endpoint {
+                    remote-endpoint = <&csid_in>;
+                };
+            };
+        };
+
+        csiphy_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+                required-opps = <&rpmhpd_opp_low_svs_d1>,
+                                <&rpmhpd_opp_low_svs_d1>;
+            };
+        };
+    };

-- 
2.54.0

