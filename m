Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 428AE3AFAF4
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789253588; cv=none; b=aZXS4W9CrcIZcRDS1QppUieywroTg+Oyr7z76Dwzaak+Hmblsvmco1KEFuePMmpnna16oDUNmNqfot18OxgSNu87U55hEXgSdYP5U+c2bBXf17iKXsgaMDcggr924q6btw5OYagbv1mHHxrlrzM09jXMts4btPN1cac11N5GCZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789253588; c=relaxed/simple;
	bh=NS67m12FohtVTM0LAceMS1EJYY9P5UQk+hL/TSpoW4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hRKlHPRbh7qLXlM6ele8S5M+KwiUIBQAAjLtpWbTk0+Hq4oWgEQcmrifjKuS0VYdsJ2tfG60Y1KSSHvS/VAZGAokEhVmhnO+XbeZ1m4YHOT3XNuyzCfFMNcx7zRH5Bzd4wfPqr2B8CqAlc6XeknX9pR7mvJyDwGHwVJVJKNFkGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jDUtrZAS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ue9Vz51d; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jDUtrZAS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ue9Vz51d"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CLqVVp822678
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mjs3rlDnLUk
	N31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=; b=jDUtrZASU4zSm1oT1OWb6CujYGu
	3VHS9ZqUu9i2qLC71XTqukm7bWcnoYoqKUQLVFeP5F8aW40RomjcnNFkB6OyU1ij
	2M+7ux7X+/5lDDRy9aYVcfIGpYYw91GEfoQgqs54yVd7q9vzYvC8/On4XAnUL30R
	47cqaZjA50pXcv14fHl9hlEPzE9B/XhrPozkMRT0afoy1pspKFH+q7f54Y8eRJt8
	ujojGJASfisZH1K0rkciGzgrp5r9pnicDVXDTGyVpgO54OIFuPMRRlEGZFgm9FyL
	m7kB0JooX1tovQtYxXKhQgj4c+eF4qeggfZcmptlZD0IeUZujkgFnPbwLKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9ca307-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 22:53:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2dcfed75f77so28493885ad.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789253586; x=1789858386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=Ue9Vz51dPPoD5COXhuyu54RdwQDzpLzGYJ4k2pPoklqf9BenF5cezGKZv8NYaSCqpA
         HV1w8xIgyAmA88VnAHalhJc4i8nnnyJJnBXOParNPe54k4J2f7/aGsXJDhhS5s1TwWnY
         u2oxyBv42AJtK33geR1EmbEwlxWI52LNF07oorX1pEe66/Y86lfoayjnTp2639afTlap
         sDD7gTB8pMr8P3DCN9qlToFiknHzq+qKDTZJNDjVah0pOyQg86y7BazKAlLcJaAu/NSF
         eFxcuQr7soRatUM54pV1JRM5xcr6+hDhc87zRPiqBb/yei8u5STUqr+8F7SNkWnYWGX2
         ij7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789253586; x=1789858386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=nvPzZFmhVqG0ckjNneZq6korsH8Kj8EkIWUIyqmT3ULlp6J6guEqdHp+KtzZ1o2DfO
         DPO2aADv2vNIDUBgvCye6PtS3cCX3iM+UNFx+gMhSQWg/peitdPDK7isAlfgcEp6GPpL
         v+w6PLhSVvISG306C4uaI6eyJwo0r9+3eQ5xOIOAmEJG6Y7o3VtG3ICgy1NhbynzLKha
         fLkCfimBb5NscdySgkTQCoFM0OMbjy+IUJRia7BCPW3UlcbIXSYZpMFCiJ+SaugKg9gR
         mkyoHjcR9IuWZYfMAcTmVJp6w1ngUQDePoiyKtjnuzmDcn9u4cN211E5rs2TsKnaCALx
         4ZFw==
X-Gm-Message-State: AFuF++lMFJ6sudnG5uwE8T2NlxCTCB6ETgSjl97jn8Pi7nOAoDYVQaqf
	+8y820nD3B7v88D6CZcffbvhOXTmyJGNHbywu5WBvMXdVNcWIG/gV8djxJ83C3EQXUzSs61C65B
	tHZbbDsaoruJcqrp3MlfXzJyPM7E+V5NNn14/zJEeneEul86wHwR1D2NvkZ5+gpNKo5KE
X-Gm-Gg: AYBFou3gMAA72RVIvzViz1lCaRfiInTE41CudKTcvyAnsECmVUyv2UtunqrluTWmrWr
	l/TIr+bIftS7vEHAxHLDYleyJSZNZc0js4G+kYJj2HHOjlvgLeqYDE0H/+2z7Zot7gXOuvwpxMh
	7EpYqvabTu0E1kBWgFnLvOYDav1hiVo2sdCmlylSmD8pqGoic6G4vlKuMjgqUwu6GLcSj9kU++L
	KQoqFMSOvTNKhdQ892ZBjWXi5o4CsVYfu0qAf10uFOOhiZxM81PrpHjIKHH9vMEotq9wWE2EuQk
	L+owWO8sNewfmRtIEfRXSGZ2M+N8SBmFUbbbvV26W+cCKSwjMQV7tABwT5UUb+Zr4S90mdiGtcG
	0Q5HPGOHv5YjKArf6YhHWuzQwF/6iYXh1t9XnomtVs2SelVS3ERvdPw==
X-Received: by 2002:a17:902:e74d:b0:2d6:fec3:bd57 with SMTP id d9443c01a7336-2dd2a34b154mr185634395ad.14.1789253585791;
        Sat, 12 Sep 2026 15:53:05 -0700 (PDT)
X-Received: by 2002:a17:902:e74d:b0:2d6:fec3:bd57 with SMTP id d9443c01a7336-2dd2a34b154mr185634155ad.14.1789253585359;
        Sat, 12 Sep 2026 15:53:05 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f5833fsm19741555eec.23.2026.09.12.15.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Sep 2026 15:53:04 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v8 1/8] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Sat, 12 Sep 2026 15:52:54 -0700
Message-Id: <20260912225301.3396556-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
References: <20260912225301.3396556-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX7/zbSSCm3gxj
 JaL1KYUNmJZEf29Jye8tsyoZsCEt8CeZoNuu9DRGtVCEKuIfUGcz2N84gkfNoqz7DBAo3GRzzzG
 95lfdYDmtlSBiAI5PC8hVEQUKlKhEII=
X-Proofpoint-GUID: Y3yPzKHxutKe8twDUjlvjKBbm1ppfeZO
X-Authority-Analysis: v=2.4 cv=BdZNQbt2 c=1 sm=1 tr=0 ts=6aa5d7d2 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=RJ9lep_nkaVUh_m6BXgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: Y3yPzKHxutKe8twDUjlvjKBbm1ppfeZO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDMzNCBTYWx0ZWRfX4u9HpXxijGQt
 5JRBtQtqSYbJXyUlBfAEorsTdxfodAPvR+x1TnYbkn4AWv+al8mSsIRQgxqoGFxbj9O6AGhbHp/
 NgjQ5VYoyDcvLAItkiUrd33EM3ZjyG48tH5ADcybj5DcPHLzacoTi3ns/aU42Kqi8dx6+MvS7u5
 Ogl7i4N0EfkZrmTjcG7Dxc98tXzKQsgCzGCHAQ22d5ILSP8weeM58TRMBaZ+3+h1xd6w3AmtARv
 iaIXcCBOlekfVv9KikKNNSeF8HqeQZejq499buHZ/u3/+j4TTlIppHLvvH5WxaiFujVTUtB9Azz
 YWQAHMRXIiIhp+sNWMCiODApqP1xgFT9u17Bi8DC1cFrYlKmL8UAj1zVm6y2YFws342iLOuMzFW
 HVd8UdOgiHO32cVI0QnW2SKLpWh0M1wWfBjhcgf8VPIh98apXf/nC956rZEc95c8PQz+yvUR6zi
 QLI0qCbCeshlWfCvlSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 malwarescore=0 clxscore=1015
 spamscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120334

The Qualcomm Embedded USB Debugger (EUD) can intercept one or two
High-Speed UTMI paths depending on the SoC. For example, SC7280 supports
EUD on the primary UTMI path only, while SM8350 supports EUD on both
primary and secondary UTMI paths.

Each UTMI path connects an independent USB controller/connector pair and
forms its own role-switch domain. EUD routes traffic based on USB role.
In device role the debug hub is inserted, while in host role it is
bypassed.

The existing binding models EUD using a flattened ports representation.
While sufficient for fixed device-role configurations, it cannot naturally
associate a controller, connector, and role switch with a specific
EUD-routable path. This is problematic for role-switch capable ports and
becomes more pronounced on SoCs with multiple paths. In such cases, each
path forms an independent role-switch domain and requires per-path role
awareness.

Model each UTMI path as a separate child node with its own OF graph. This
representation is used for role-aware EUD routing regardless of whether a
SoC exposes one or two UTMI paths. Add an SM8350 compatible for
dual-path EUD topologies. Retain support for the legacy flat ports
representation on SC7280 for backward compatibility.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Bjorn Andersson <andersson@kernel.org>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 138 +++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..90dc104e4475 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,92 @@ properties:
         $ref: /schemas/graph.yaml#/properties/port
         description: This port is to be attached to the type C connector.
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  "^eud-path@[0-1]$":
+    type: object
+    description:
+      Represents one High-Speed UTMI path that EUD intercepts. Use eud-path nodes
+      to associate role-switching behavior with specific port connections, allowing
+      EUD to manage role transitions independently for each UTMI path.
+
+    properties:
+      reg:
+        maxItems: 1
+        description: Path number
+
+      usb-role-switch:
+        type: boolean
+        description:
+          Indicates that EUD relays USB role-switch events for this path and
+          performs role-dependent UTMI routing accordingly. In device role,
+          the EUD hub is inserted into this path to enable debug
+          functionality. In host role, the EUD hub is bypassed and UTMI
+          traffic flows directly between the PHY and the USB controller.
+
+      ports:
+        $ref: /schemas/graph.yaml#/properties/ports
+        description:
+          These ports are to be attached to the endpoint of the USB controller node
+          and USB connector node.
+
+        properties:
+          port@0:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB controller.
+
+          port@1:
+            $ref: /schemas/graph.yaml#/properties/port
+            description: This port is to be attached to the USB connector.
+
+    required:
+      - reg
+      - ports
+
+    additionalProperties: false
+
 required:
   - compatible
   - reg
-  - ports
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sc7280-eud
+    then:
+      oneOf:
+        - required:
+            - ports
+          properties:
+            eud-path@0: false
+            eud-path@1: false
+        - required:
+            - eud-path@0
+            - '#address-cells'
+            - '#size-cells'
+          properties:
+            ports: false
+            eud-path@1: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,sm8350-eud
+    then:
+      required:
+        - eud-path@0
+        - eud-path@1
+        - '#address-cells'
+        - '#size-cells'
+      properties:
+        ports: false
 
 additionalProperties: false
 
@@ -77,3 +160,56 @@ examples:
             };
         };
     };
+  - |
+    eud@88e0000 {
+        compatible = "qcom,sm8350-eud", "qcom,eud";
+        reg = <0x88e0000 0x2000>,
+              <0x88e2000 0x1000>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        eud-path@0 {
+            reg = <0>;
+            usb-role-switch;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb0: endpoint {
+                        remote-endpoint = <&usb_1_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con0: endpoint {
+                        remote-endpoint = <&pmic_glink_hs_in>;
+                    };
+                };
+            };
+        };
+
+        eud-path@1 {
+            reg = <1>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                port@0 {
+                    reg = <0>;
+                    eud_usb1: endpoint {
+                        remote-endpoint = <&usb_2_dwc3_hs>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    eud_con1: endpoint {
+                        remote-endpoint = <&conn_2_hs_in>;
+                    };
+                };
+            };
+        };
+    };
-- 
2.34.1

