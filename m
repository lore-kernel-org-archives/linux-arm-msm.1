Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358424B3CAA
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792194915; cv=none; b=OHUsoLnqqDw82eBKx2cRM7a/RTY2P9XayNj9mFssaDXNefakK0UzSce8zakC93mfIqEXrnDKrYDZ217khbZym1JlYEJuoBbPbYCT7YdSfI9KWmFuP55Z1LJ1RxJO3L6GHb58pzj6q/c023yBA4wSlZ+459c346fg8CR20Nr+/aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792194915; c=relaxed/simple;
	bh=w5+HhoOHpY2OlQdb0VeMExTUge62X+hZEo4LSfzDSws=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bXD3dD+bt6nCZa3fAucDofd9xDWfy52WTskgYyntTLeiXG90LDHznXwE8ZcR85Gz5BfVe3Hr9sz7c4BXStnWsEknQUMbmu2QXidr7GSWIl/iGG1Schox55jtwJtJiZKKhs9YsGzOGLEQjzO3/VbnMNHzI9pvjfeS2dzdvUTC+Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mvkmGbso; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BjFGtAqP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mvkmGbso";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BjFGtAqP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69GNFmVC2785032
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:55:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cjS8ryYJG/C4i0vy+7eXHoEPBMol/N+iKsFe5/ap56E=; b=mvkmGbsoeosE9NPQ
	xPZW8/Uknl5HJf8svzfdAEY7TLnOJbVaWGxHm3qlnUJpiHIpoeNO/DslfyVr51I8
	CLo8TRoBKpMvx1abEkm1CYCt/0e+4GjXpXLHxXhmrjI+WK/d/I71LnAKlD1oK6ph
	5xpzQbh0r5m3DzUdodKbNmkFl1xQ0fkbwxcCdQs7+niWdOtyknneXWz0MMcDpzkA
	GG4g8ouYV8+MOAw4CjPfwhCFlSDLV5PQDVhsjdCEIeBI+kmBHpyc9qexh0fylsSr
	+2yYXq5L7ClYgnebcxf7gu9ZYjuvaLAnzr0cC6Ft2/GOGWOdsuA5YRQq1QlKkHYC
	iabuvg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbk3v2j4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 23:55:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-147be78cd56so1455594c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Oct 2026 16:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792194913; x=1792799713; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cjS8ryYJG/C4i0vy+7eXHoEPBMol/N+iKsFe5/ap56E=;
        b=BjFGtAqPcwIx+i/OVBOzHUfRVWl6z0Gl0iaSN9G2k6qanrrgoldDaTjqDX1T1Di6nL
         cJzoduio9og2kc5ntSUpjslkoWGuy6Rm6u4G13wID+leiWD2ipVAYEKLm4ZcZfunpqhv
         8iAEVlNhVgWZN2IIdE5PMWWDUiIx3f7QSfS/mTFnoYwev6pJtk+Nre+sJGFoTZw79dx/
         d7FMnC+BSKUkUj782F0bAaiLinsGeAAtousC8uXpn9VMPPXk0t6rLLvQUMi2CIu1di7j
         z6vZ/FTc4pENAUeLDbdzho23astVXQxc2t3vNIXvhFaB/fI1JDyiJ/Nn4xCrtZ+FIPij
         2ZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792194913; x=1792799713;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cjS8ryYJG/C4i0vy+7eXHoEPBMol/N+iKsFe5/ap56E=;
        b=Wmot/ZExgITsx1v1BbuY2GcQV9Bfqn7XHMYSR7Z9G/SJmzcZnOHptfH70ThH8VM9qA
         JPTtfok6tU0nk0H0pisp0tY2lE062+zhC2GLfOK8HUGv9znyAQ+7vIS0qNUoQjGmh8oJ
         uf486NRmmUSy/B2ER/bb6UyNuxDqWo1cSPxIYcE1GoUhqLchZ22RPKhjOal/ZgUGkdKY
         mHClhtB4vTlexoMoeThrdyGGHoGWPsqkEeOMblW8C5Yea5Z3/G8RQpXkeTHkTHmqKM5y
         s8RGrEPx4HSBlj3zwUmDj8qc+Nwd5CO1p+Cm7nXTxM0oskuFNvOUJIeHYu2be80kBRjE
         n7tg==
X-Forwarded-Encrypted: i=1; AKwUvBzY/1Q0XGAv/D5yXQDA/RDcJ5eG2dxOjxrW1UdwzwmSi2iLLLXdzlbr5lSyhf0ODN5G1eVTbIHzMsD8WCJj@vger.kernel.org
X-Gm-Message-State: AFq9FYIEvzTB9w5zj9WegA8yT3NDXS2P36QmBYyIFiP2jgBNBGIRtMD3
	TuYf32Slc4v6tX9cK/vGCfJCxXrR1s9g4KWn+KByKrTgNEMozG+sQl1RYZzK4fmbz8iLOVCUPxE
	iSK1RWP4KJ+Ui9q4IpGO7Pm4j8YBsUdw1fb3U7CH8URxAV+gwnqwDT62J/iQT7UoWRK8i
X-Gm-Gg: AYBFou3xEcWPhslauLYpS66pNV1fnJ0fP5yTTwyA1NTpuNaAtO7yfhwEIs3O0ZiH9lN
	/vp68yiwCdVtwsDfWn4fD9WF2Iav588Oij1BrAGiZHr2y7FXjS/iCDb1Hiq+p2gPVbbd6O7r8rj
	YKJpyiGRVgGSFsv4PCom+B++wuul3ZyRgH0cFXNWDwv2tTBXQySYtzgDLdeMt9O5LxSB8Giq9xL
	NgenM6ouNtOzN7fYEp8AxtE7v3ahhHmPbV1lMBU87xtXtumKf0beccVnDeF6WDY/eSKbx72VbOX
	Eesu7bp/nLmjyyI8ANUmugzp96tam06kFR609WXGRfiJ0kO2ZecbviNSa8SLImn5CC4uHONrlTI
	ZtnHm1kPjJo+VUihizRYeHsoKVgwkFMbBKqilyxFTAXcURN63BOWWOQ==
X-Received: by 2002:a05:7022:b88b:b0:144:fd7c:84f4 with SMTP id a92af1059eb24-1850ce9b563mr1810832c88.5.1792194912392;
        Fri, 16 Oct 2026 16:55:12 -0700 (PDT)
X-Received: by 2002:a05:7022:b88b:b0:144:fd7c:84f4 with SMTP id a92af1059eb24-1850ce9b563mr1810803c88.5.1792194911763;
        Fri, 16 Oct 2026 16:55:11 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-183190aa7bbsm8556183c88.5.2026.10.16.16.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 16:55:11 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: bod@kernel.org, vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
        mani@kernel.org
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, loic.poulain@oss.qualcomm.com,
        vladimir.zapolskiy@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] dt-bindings: phy: qcom: Add qcom,sc7280-csi2-phy schema
Date: Fri, 16 Oct 2026 16:55:01 -0700
Message-Id: <20261016235502.2274268-7-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
References: <20261016235502.2274268-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: FrsQGImGlvQcG9iR4oA7b0TircgLS7T7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfX1h5ga/9BTImf
 fQAlCkTnMsUoQElxqAOIOhGp4/ihg2Sobu1JBmPehJ0ykqzoGBqYKsxsubWdRM17AO/++HL6LsV
 ewXcITWjHRT2cKL18SA+JNzn3c3/i1o=
X-Authority-Analysis: v=2.4 cv=BZdNQbt2 c=1 sm=1 tr=0 ts=6ad2b961 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=dfoMB3O58h9xp8Lkk0AA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE2MDA5NSBTYWx0ZWRfXy0JlPPhDjejf
 tR4mjnqT9XCU3V8gMCFjGab/CCTStEjBsg0HOCqg6MEFJRGVDZDoz1isrGBTEHf+ObH+WcIElDj
 6JOh+/nQXe2MW3YIYCDU/Apb3zY0MueKmGyAFeZ2DEbCbpoDmdyEVH8FPdW0EKdpmyQ91fiJ/kL
 8XO0oMLDxRxmoEGBgP6aJFveNtQGMwFEgb1ILNNNLEBuhdZUjiw+3ItnR1eCvgfW4BWXFQOUAHY
 HR8UTo5wEiS8lChc4vUktKmFKSDylLxzuqAMvPtozmVkhxCkRgzv0AgXX/2awr8ldqBNtLcrrZZ
 hbZLCjPl+FiAUma7wyuPIqETOaJJyPE4B/zBHIt9dzmST05s/xYm+yedmZRUmPj8QzVpjiwSh9Z
 b17O6XIVoD1jlYGwrVsElEy9uYiQ/B3wnHSoRK6ZW9dR+ZR7bJX4+U9CkFOhDXhfvBPmw8K8fsG
 26juCXd4xBYH26zWTeQ==
X-Proofpoint-ORIG-GUID: FrsQGImGlvQcG9iR4oA7b0TircgLS7T7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-16_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610160095

Add a device-tree binding for the Qualcomm SC7280 
MIPI CSI2 D-PHY, modelled as a standalone generic-PHY
provider like the existing qcom,x1e80100-csi2-phy and
qcom,sa8775p-csi2-phy schemas.

Follows the same ports/port@0 data-lanes shape and mandatory
operating-points-v2/power-domains as qcom,sa8775p-csi2-phy. SC7280's
CSIPHY has a single power-domain, the Titan Top GDSC, matching
camss.c's sc7280_resources.pd_name = "top" and kodiak.dtsi's existing
camss node. Two clocks only (core, timer) -- SC7280 has no shared
CSID-RX clock in the legacy driver's clock table. The core/timer
naming matches x1e80100's and sa8775p's clock-names convention for
this pair of clocks.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../bindings/phy/qcom,sc7280-csi2-phy.yaml    | 169 ++++++++++++++++++
 1 file changed, 169 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,sc7280-csi2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,sc7280-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,sc7280-csi2-phy.yaml
new file mode 100644
index 000000000000..3b73a9933f03
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,sc7280-csi2-phy.yaml
@@ -0,0 +1,169 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,sc7280-csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SC7280 CSI2 PHY
+
+maintainers:
+  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
+
+description:
+  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
+  CSI Decoder on the SC7280.
+
+properties:
+  compatible:
+    const: qcom,sc7280-csi2-phy
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: core
+      - const: timer
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
+
+  power-domain-names:
+    items:
+      - const: top
+
+  vdda-phy-supply:
+    description: Phandle to PHY supply.
+
+  vdda-pll-supply:
+    description: Phandle to PLL supply.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/$defs/port-base
+        description:
+          Sensor input. A single sensor is described by a single endpoint
+          with one to four data lanes, numbered 1-4. The clock lane is
+          position 0.
+
+        unevaluatedProperties: false
+
+        patternProperties:
+          "^endpoint(@0)?$":
+            $ref: /schemas/media/video-interfaces.yaml#
+            unevaluatedProperties: false
+            properties:
+              bus-type:
+                enum:
+                  - 1 # MEDIA_BUS_TYPE_CSI2_CPHY
+                  - 4 # MEDIA_BUS_TYPE_CSI2_DPHY
+                default: 4
+
+              data-lanes:
+                minItems: 1
+                maxItems: 4
+                items:
+                  minimum: 1
+                  maximum: 4
+                description:
+                  Data lane positions following this endpoint's clock
+                  lane. Positions are a per-port logical numbering, not
+                  package pad or ball positions.
+
+            required:
+              - data-lanes
+              - remote-endpoint
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
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sc7280.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    csiphy0: csiphy@ac9c000 {
+        compatible = "qcom,sc7280-csi2-phy";
+        reg = <0x0ac9c000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+        clock-names = "core",
+                      "timer";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy0_opp_table>;
+
+        power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+        power-domain-names = "top";
+
+        vdda-phy-supply = <&vreg_l4a>;
+        vdda-pll-supply = <&vreg_l1c>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+                csiphy0_in: endpoint {
+                    bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
+                    data-lanes = <1 2 3 4>;
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
+        csiphy0_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+            };
+        };
+    };
-- 
2.34.1

