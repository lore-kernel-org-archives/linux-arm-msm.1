Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6881F275AFD
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 02:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784342307; cv=none; b=i3AkbIgSKAldBVkcCqycP4jToXERWJJaplBgA8++nyHjixgUfrnLTZ/1MQwtWWE9/1LfN69IjHZQLzyTjldDwLf7dSTjQtuo60s1SxlvA1f3+lDixDcxFHmBW/ywjFGRSY+MaC5sEdGyIdN34enqTluALdoL1+FHufArafFSCpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784342307; c=relaxed/simple;
	bh=4CejNBxwYr6qK2LLBsKy77yO7TG9DBAT6iXNJvDrqBI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l9xbnX79O9g1B3V537M3bUDeo/2ho45QECidlsx29pUtjiuVgS0Fbh6OUfijA0AmqnD3xfHN3pmwY5pFA3w8QyXKQPg/DqF4NORTSVcLOcWHwukDFlyZLsrOWAgUPbjKvVRt+s4kp0Y+dC4s1Obb2MbZZT2oKlJu4JGUlGRH1ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PwxMvhOO; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PwxMvhOO"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49545ba3d4eso10468305e9.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 19:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784342304; x=1784947104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C1zdgJ/E2ohNwZS2QQgpks1mLElw1NRwGvhu99duCc8=;
        b=PwxMvhOOCso7bow9WPrRxW+gm3cDTrq0ZnAarat14OICemiCHNywOac2CCou7HN9Fa
         Xs5qinQ8gkOKdo/5+3SxQ6Q4RmwSqA5Xv3iJk4jmZ6UJM/bnw1xpGmYlTrwAbXcU+sU+
         MTr/TB7Fq7XbWUKE0mlmHbazntAq7wcl8+caJ/2iifa/ihmh8MRAqmfcnbjT0h7eu9sA
         z4FRlGi2g1qlX3OcT4yRqYi/NxD9VcNJtY6RdB4izfMWTuKyrx0LlyLqk4Q4SdIJCMsg
         dGeT6LcntYN4V5NqPdd69k47bHQhebjq/7UUQ2pc3ih9hERUvwfPeC8C+3m/azZga14K
         E27w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784342304; x=1784947104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C1zdgJ/E2ohNwZS2QQgpks1mLElw1NRwGvhu99duCc8=;
        b=XWFr5OsX2L53EAukOdR4ABnLpHI3RNIOpPpM0ER9an85h+gRLSC8uTAPKJkcXYNwcD
         nU+zQEgSzjJuGKnXRDndFgB1Yv3ZKcRIgf9DCeqQupqHkO8raVWI59U7qgjL2fFI1ZV8
         h1Svq57LNkvNQUAH2RmNPk/Mk6GWT/YUSivHorXE3uAvKu57J88Wi/Iew2nZLghAO2YH
         1xdbxLuYAo0EAw/BUcqm6D3WFi2BKF7tXU/GkK3XRmkP+R3xXooRlh9x4hbekd0S3ruK
         vSVXv8GUEzjB/1Mg1tgU15zhkv8oDXkaw+VVC3fiFdzZQE9yQkEgEGEQAMWjRahzS0Nq
         71/g==
X-Forwarded-Encrypted: i=1; AHgh+RrhdV3WT/mVfYUdyglu2D6j5+tPryZ0D7dFR6xv1CAkHWv71OV5b64iwD8iH8tOLVIzf4G8AjyiIMf8xpy8@vger.kernel.org
X-Gm-Message-State: AOJu0YxWGq/WHSlSiN2wBZOBPf1GCopNGM/1jDOc4Gd2/03OZlFoo7Mc
	BwW/95Y54Bc16MBk+0ErvmeeAMp6/x8EaLp5ZRNWkA3s1DtSWHFhQifUDCotfyjf2WI=
X-Gm-Gg: AfdE7cloaQtLx0rWijfd6mVrJnzWNgtbAGYZQnRwmq4tJLT6GR2k5qwD/XeUqN2XK+1
	bp6N2nnMOjjcyGnh0l/zDpbszsu9wVvuVXSPNkBr4jdrdsPjApmd/Vw1Lq5K6qZ+24NWe4YeQ3n
	YbV0ae0mokFr9jeWZ7WBUBtJqPD8nCqqxvlM6rEIR8vTl3l4pIOJbJ1cjAbdTKc8hCY9EP8GFHQ
	3NIGMzlnq6uWWw+egRkAfE6qfGo7fsrg8B2Q/ivO/rpDyVbD1bjwsbieiI0V179AV1Infcz8X5C
	yBurS3Hqii1NUZJpdkXDnyPk3Q0hqXXK5kirpwzIILTGHgXLOcCtSZSMt2LBw5vVoOJ4tZbHCfV
	KNLXH6plHamH+WXU43qnenopxISNNPMtP5zuprdplFzVJvn0WEIhyFDz5RmfP3TVbVRo+oNRu2O
	/ST//w/Qyf+ax1
X-Received: by 2002:a05:600c:4585:b0:492:45a0:dcef with SMTP id 5b1f17b1804b1-4954a3eeb63mr57220575e9.5.1784342303493;
        Fri, 17 Jul 2026 19:38:23 -0700 (PDT)
Received: from [192.168.0.35] ([109.76.30.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49548e14e1bsm67524235e9.2.2026.07.17.19.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 19:38:22 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Sat, 18 Jul 2026 03:38:17 +0100
Subject: [PATCH v10 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY schema
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-x1e-csi2-phy-v10-1-5720a7888953@linaro.org>
References: <20260718-x1e-csi2-phy-v10-0-5720a7888953@linaro.org>
In-Reply-To: <20260718-x1e-csi2-phy-v10-0-5720a7888953@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6162;
 i=bryan.odonoghue@linaro.org; h=from:subject:message-id;
 bh=4CejNBxwYr6qK2LLBsKy77yO7TG9DBAT6iXNJvDrqBI=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqWuccR4/99Ti/mSZWTs9hwp+xMB6opOoBdZDY1
 BkyiC+f8g6JAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCalrnHAAKCRAicTuzoY3I
 OqdrD/9IGCUSzAzY3e+PzlnyOyJDkZmAI0VPNiJV5bmz9O2udJuaYDUBVTlDitGO4agnKlaP9iy
 FGKA+56SBdoNldIw3Eonob4beh678TAK/DdHkjhVqnmU9TMb6KiCP87/mg+MQZC6UnwvpAM7mou
 /dujngstFjE81sctbqs8BAkLRJWGv/UIeyim2UKVLdwQbVyhzjejCECa+r+V6GlOD7fpo4nYOvh
 3BL/CrSXaU865RktVcQYzwd0VbCabMJsgjfl+1s0iSnj728bALSS/MufTTxUG6IbI/EvN9DYZ/y
 nHi/f0dxDeMin8c3IaHxxgeupnajcmFJ+YqQsxRdRO2qqNeWWi4EGOQvJ+ecvzKVz5v2+AOmewp
 kUHzniHd8UxhDEZCbH1LJXnS0qNZH8vLWHBD2j+kY595wMB99OGWoVkV1EnJBncli0wM+q88/j8
 YLk7183Zox8GTy+KKyRGiG33PA9jV9O+AIpQ+6Ln+ckdx4aweRIq0TifDIdJ8cS6Ktc8iraEvRa
 LxhqqdGYjK3hGHhNd3Bpz4T+WEStAx/KzMaNvZaKHLX27f7/lfkED2YTuLSJoFmwgaiR0ojAcXW
 aOOaTOegULeT+Azv56loxZfhHyRp7+ryzSoC83iuxMjqrrBbjnwMrO2eByM1lQ5oeWEF8dOM2U4
 h8Hvnf3+CeMWl1w==
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
 .../bindings/phy/qcom,x1e80100-csi2-phy.yaml       | 195 +++++++++++++++++++++
 1 file changed, 195 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
new file mode 100644
index 0000000000000..880fe602945cb
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -0,0 +1,195 @@
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
+  "#phy-cells":
+    const: 1
+    description:
+      The single cell specifies the PHY operating mode.
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
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+
+            required:
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
+  - "#phy-cells"
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
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    phy@ace4000 {
+        compatible = "qcom,x1e80100-csi2-phy";
+        reg = <0x0ace4000 0x2000>;
+        #phy-cells = <1>;
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

