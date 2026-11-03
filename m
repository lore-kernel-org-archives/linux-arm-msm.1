Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793742070;
	b=wvfR1fh++QzgZPdwcSblZYcw35YrXMrm7gsS5svK5OYSRC03nuB7CuTGfyBAuhrcdT8j
	 Y/o2bmB055a6gSyVHCHG8niGYwaedpOP972fXOP7CQEiIHCN3vtOZF3f1dtQu6mQy9Z6Z
	 UwflSZygSBOsn27EzVaAMYJCQMr2nmygjhXt6KvCcFieJDWipV1vR1ONcmC+wZ1jAHMyM
	 FRUjWI7pB3lhnAWQJ+OKIFJRlAnRjQpFRDlzOxf0RvsCWRFGDcAQAEfH2Iqq+lX/cKTgZ
	 ZtfkKhhg8IuizP/i4UbJJA+acCv3qYj8TWkjAqyBJz3zZkDJ9wl62OmyQQTiAV0uSMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793742070;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QoM/IqC1v4fyVgp5mXaugArWmtVnYBKnG59oPWEYQmY=;
	b=SK4AP+8m7GUKfPJ4S6N2PTj6q2bmlJyFOPPoQfaLod+ro7UEaALwO/XaWXi8utABCeFF
	 NT0/kOyiDlT7YKeUMxauIUSKgueSTZDfADvVd5oA4vvHuhSZoeAmI6yuFtzWHfEBLTWxY
	 iXlE0Tp3oWMV9quzgHR/k89oZs1BNnBJi0pPI0fcoMTB3yJx6hCS4jW7rvzxWFZOcVuyE
	 L5ycpcpnFW8Am4oSa6sv8Hdvl6dcIBKtW3P9BKMOA7r4+Mb8y3eTxAfl8rY3aZ9ORuF0I
	 GwCfX3uw25MXXKue6n3smM3ikF+kRgl/eAHLPjBbm7mu7599HMVPifLsZAdi71671Ag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWToFaIZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkZxWV+D;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202F4606A330
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 21:41:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 202F4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pWToFaIZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkZxWV+D
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3LKwv0800032
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 21:41:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QoM/IqC1v4f
	yVgp5mXaugArWmtVnYBKnG59oPWEYQmY=; b=pWToFaIZmO5UuI5rcMdpvaSHr/o
	yBq0Ro0VLdHT5bY+juXr0VJOskZbCxorucOQE9JQv4XiUwV/cKnACEXzWD4GAtjI
	pr8eYaK3bHbpXY56qVRSYgghB1Kb9RMoOBw7OB6u5T3FeMl8qlJ9GK+JNDqt3gU5
	0vQqXFh+fEzKy5fZmZkXX2Jy5ApiioUl8nw549FLKeqvZ68oKHnBO4o0Wu60zON1
	Cy+e4otAst0oBBACkNbQpu3mXvvRW3V6dwHk2ygrFX8FjqFLgoq72t+Dzhqc89qy
	SPgshErcZri3tjVKO0FJM2kIiS8SMtkvmfPBHlDtM5K9tRotyomnUuRbfKA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqm2pgxdb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 21:41:09 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1af203073e0so125260c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 13:41:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793742069; x=1794346869; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QoM/IqC1v4fyVgp5mXaugArWmtVnYBKnG59oPWEYQmY=;
        b=RkZxWV+DxzCK56Ia+iDLkRQdmmzITr6dZ4l41OtnlRBEIQ6Fi1W2uF8HCPVEwGXfkx
         gupnjBwo5+Lr3/YcVSEutf7TfPip+x3G9Y7kpupali/NnnAc6ExagVitOIrl/VmJAJ/+
         y+dKga3FegqR6T/rWVspGb3Gg+VXi8ro40P5MdWkMiYZQ5J/oZg5ZQSa1ZPSQH3KqUKV
         /GHT71i9LM67fyDrowsl+j973NJ4Li0cTYsaLq4m2fnbmBVAuKKG+SmYJQZfo6pARJkZ
         p8V+B6CG596y85BHyUa6m7bTCY16lShlau6hsRErv6W0AwUnHAY2kTADUqMVruqbgU8W
         6MnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793742069; x=1794346869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QoM/IqC1v4fyVgp5mXaugArWmtVnYBKnG59oPWEYQmY=;
        b=IaACWUdW4LMiw60MtoumMRj2rMyTHWAL2G7v5CAKBPLYXqGb0YLy+JlTuuNglBfzXz
         4RTgkZe60bOkrY7mgJrN0JVg2V6IEUvLOHoa5cd1w+JhRFyXe9CoacG+K6m6p82DXtLS
         AjuwpMP0714W6hdnP6Q1kYeeIzzEhjmdXiiJJZBi0GiYhwL1jZMl5oAKz2459xCEcflC
         eJR3GkqnjyfWFCMeK99vJlPB+B2FbvVa8pBj9XxNwPeDMrP7d1UFEvVWLkPSYAOHaygI
         AI82y+fCG3CKlsc+OPLfawMywIiZGroK5410eDbevu3/XfZ60asmrse3RfB9mmCDzId3
         /Qyg==
X-Forwarded-Encrypted: i=1; AKwUvByGeKkDDn7Q6PcTyujVR0P3+BuyB/7sthxei3d/FBCipDv/ijEz7c25Skwsb3Lb6RmncK83VUSEIm4k2k1u@vger.kernel.org
X-Gm-Message-State: APuU4Z+ThtQk9ig8zb99OAVPoLZ2pl2mTgtJ2v08wI6e0B/vE5wuXudq
	6fC/NXPenjnq5m4/8NlX9VyI4Gd2IfWJ96BrRbLcD+k0HmXRR2QWgfLz9fq5FypwQzc9c+gde1j
	O5FvdFxgeH1TsTIN+GpXvTWJ5P8WdQ/ZzTSj9Zs4Ex7maIII6W5mfmSjEz1WlVwvRaBYZ
X-Gm-Gg: AYBFou31hpZAxpwwpdesccKoQg4ckJ7PCmWhwuAXWDPPKFOVLaL9E02LzxfOL27I/hd
	O26L09lXoDp4obr9aJYd2hYDoR0kFxkxU4ULWFPZAOsHJIR1Vna42SThGRW+XsuJT7HZa/A1jLu
	5QbY3QJXw4T7gN/eLKmHv74id7a7U0/hneNoKYI+4M8V7UB6Me3MIcOvPhGxEajNN42h0TFTjXB
	OKacnNQ2ptHVby8vDYsxY64+YK9TwqQ8VfVV+6F6nbUOAGrkySKxz/15n9fsngcUU+Y5053/GY2
	1HNEJ5fLShGYHrl93ywkcMuqnnZgiPr93cRZXauy0SimkTJCVcqJsHc2UN9V88DKNuBoyE2OsKd
	1AmRlUblU/Gr3K5mB2ssjMxSyRJ75ZpWrrmr0QfybZRr01ZhNGvcfg7Nla3GAjonEYPANXUHlSu
	aEpaUpekIXasJCRoOyrd9tIL3IIqE=
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr23890999c88.3.1793742068335;
        Tue, 03 Nov 2026 13:41:08 -0800 (PST)
X-Received: by 2002:a05:7023:90c:b0:138:30b1:4c00 with SMTP id a92af1059eb24-1ac56d95448mr23890961c88.3.1793742067759;
        Tue, 03 Nov 2026 13:41:07 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c1c272sm1537440c88.8.2026.11.03.13.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 13:41:07 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: phy: qcom: Add common qcom,csi2-phy
Date: Tue,  3 Nov 2026 13:41:01 -0800
Message-Id: <20261103214105.3605181-2-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
References: <20261103214105.3605181-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX4cx2P9pruBvr
 Hftxx2gwer1MigQdxaemKvSQl0xF37ISRpj6S1uFqZlebuAh17c7yVhjWMGFNhYTlprUDNe1s5+
 W5f45pdPmebJMP2IpR42yXzW4Cz6nUEfLKMbW3+0yyYCjgulBz/8ACe7aWuA2OyuJSCS+8FKwya
 1xLnebSXoWjJ6q/xjhfkxAzIBK9VkX+DjYKrqiWRxEm8bI/k9PaMKTcf+M1Dt5uW8RRM3ywBM6v
 1FPtOsZ65fXWAgs9zrtQoOw68CNlhXFzWXBGzC7cw6KCCdD/16QMarkJRzoqAaUPURKYto/VH5C
 zVc1o9sFPv7EGSPz5NXvChbXWaPehhRUbK69l6fEvS2W9dwB9PNaiJ7FjaukkrCkk0SWlGUAx7h
 g64HCwJRKdW2cl0Z69u1Tuy+mOmuiaI6QJZTY6E0e9AQ6cEMw/NN+HZVpY84Dcc6ro/PIl+fUIE
 WRXHA7D6LD+f1sakT3w==
X-Proofpoint-GUID: wMTZqql6lnMxrYyn8gScojdgNWu5BWj7
X-Proofpoint-ORIG-GUID: wMTZqql6lnMxrYyn8gScojdgNWu5BWj7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA4NiBTYWx0ZWRfX+Sqcpce1ii5t
 LZZGbf+A85qNqgdlcFEr0HZ5T4MXDEcn90qIBFweQjQZiMcI/DoRpgCG3dH0dvCKy55imr366mj
 aPtz4FhA9uIk9SEFKEDNC90KK8LH1V8=
X-Authority-Analysis: v=2.4 cv=c64+0h9l c=1 sm=1 tr=0 ts=6aea54f5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=sx4psc2xio7dPLQVwlEA:9 a=vr4QvYf-bLy2KjpDp97w:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_05,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030086

SA8775P, QCS8300 and SC7280 CSI2 PHYs are bit-for-bit identical in
devicetree shape (ports, bus-type, data-lanes, operating-points-v2,
clocks, single "top" power-domain, vdda-phy/vdda-pll supplies).

Describe all three with a single qcom,csi2-phy.yaml and a compatible
oneOf, rather than one standalone schema per SoC. QCS8300 is further
required to be paired with a qcom,sa8775p-csi2-phy fallback
compatible, the same way other Qualcomm bindings express full
hardware compatibility between two SoCs (see qcom,qusb2-phy.yaml);
this lets the driver bind QCS8300 nodes via its qcom,sa8775p-csi2-phy
match entry rather than carrying a duplicate one.

qcom,x1e80100-csi2-phy.yaml is a separate PHY with a different shape
(3 clocks, 3 power-domains, different supply names, DPHY split-mode
support) and is left untouched.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../bindings/phy/qcom,csi2-phy.yaml           | 176 ++++++++++++++++++
 1 file changed, 176 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
new file mode 100644
index 000000000000..5d25547528bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,csi2-phy.yaml
@@ -0,0 +1,176 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,csi2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm CSI2 PHY
+
+maintainers:
+  - Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
+
+description:
+  Qualcomm MIPI CSI2 D-PHY. Connects MIPI CSI2 sensors to Qualcomm's Camera
+  CSI Decoder.
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - qcom,sa8775p-csi2-phy
+          - qcom,sc7280-csi2-phy
+      - items:
+          - enum:
+              - qcom,qcs8300-csi2-phy
+          - const: qcom,sa8775p-csi2-phy
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
+        properties:
+          endpoint:
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
+    #include <dt-bindings/clock/qcom,sa8775p-camcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/media/video-interfaces.h>
+
+    phy@ac9c000 {
+        compatible = "qcom,sa8775p-csi2-phy";
+        reg = <0x0ac9c000 0x2000>;
+
+        clocks = <&camcc CAM_CC_CSIPHY0_CLK>,
+                 <&camcc CAM_CC_CSI0PHYTIMER_CLK>;
+        clock-names = "core",
+                      "timer";
+
+        interrupts = <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
+
+        operating-points-v2 = <&csiphy_opp_table>;
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
+        csiphy_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-300000000 {
+                opp-hz = /bits/ 64 <300000000>;
+            };
+        };
+    };
-- 
2.34.1

