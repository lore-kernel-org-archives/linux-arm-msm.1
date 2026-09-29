Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F294E9C01
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790717720; cv=none; b=uWMMx3jgbqJKTHUepGbBrXl6GzMiZY0GZsbqO/diNkLe1ujY7EqbCgJXGr7OCGnlz0WFTzQ5y7STuDBQCUIrMizX37MTTfTwQrLzykPFW/8MKzdzA+YLmllaaM9G8gFrmjv8DiiLnLkkgkxArIGL5MJVZwnmlMYhD1GlN7f8ws0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790717720; c=relaxed/simple;
	bh=NS67m12FohtVTM0LAceMS1EJYY9P5UQk+hL/TSpoW4E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Vm36MmHOUbCfbYapZifEWAoCwbwGqUxB5xGIbdJuv1DpGmMVLOLP2g3s5HeU5JMcQznbm2qCpri75rT/ichlZZxEBl9xwIOaOW4LmMLviM+eqXr1tn984Em+Civt+YJUKhkQe8w5QKZUnoYK0ZeiUY/E+emNzrHJVQzu7Ej6KGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K/1nLxeL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OhFQ3Fnd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K/1nLxeL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OhFQ3Fnd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TIbcEh1649623
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mjs3rlDnLUk
	N31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=; b=K/1nLxeLKcYSOxfqweu66c3+R1p
	QbVy+Iu/N3Uv/tIvQL3P1IdYDW4f5g2qsi0jInw/n7+nqih3o5G55Bc8UXRd4QZN
	Bh1u1YgG+S2HJml3sFEHmvFsHJ8VeLcbbjIXGilmXr8wkdaYKor7dd1/bE3RPn75
	WI/oG01P+QNmVVaJj6kwwpe+vPQCSK09wIvENKbbJA2I3pbYaD7WJXCt5OkpE4kk
	pzYYcRcRTFd9WlRSSjGV4rIdHQjOK4WTV8Y9ewDwirLoHHwwhpa3GOcNf7LQQ4AV
	TtRS/Rb9R2yn4+2ULGg/ECOmuGrNTCycm/sAK6Zm5iNfttMuchshr/eJEVw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0et29xfe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 21:35:17 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30c0d568830so9274096eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Sep 2026 14:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790717717; x=1791322517; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=OhFQ3Fnde+X8RiPmzF2tZEPg6aG7CH0/5Xoj1+kHOJvIluaCsjX3aWSXqEOLrYWdnP
         PZVPuN1+0Y339dGauDBXVFq6IUVcWQKh02fOhWcfrhvMi0cPsEiMChBr5058zjD3bEz+
         0e+AiD98O8/U9tp+4uF15ODFDnsJrNgO8VkKSPrrUayAD+x9A/RS7ehvxQa12VDdfHHI
         FlLNVYkF4Na4JgkZX5yxEf7RMh7eDJbHkBCObg7uY+w6dnvHuagDbZF3c4tXdVR1413L
         TVQ8Fa9CNPXG50rdEVk3RPTzKGpNdRp9fTvLTgzpF/KIB8/Wocein4508EKR75BKrBms
         ghIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790717717; x=1791322517;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=bPnyBbcRwlr4PJFVoZhnpZtqL0FEYHWKQ74B2+1RzP+5t+/xOgLgb6Cf+FbRu3rTMH
         D0Urv5dyKFC07op1+PKam170RnZlfDx8sukWvV7c3zVazmBdDbY8n+J0dlXM34GC97ph
         g1daOp1Q/F2QaN4tI/vlYSKfPUNQZpTnHLHZjFvnyavDhlq4CA/PGETSf+1WPnYBnfHT
         xac/m8TT8aELpU7v7Dn7Jx93FXjsFxnX7tRlsuTyOevN/ZcE9/9lbBkSb0O1CPjgOHNI
         lWhHR1tgikQZRQZFBCY99/ZveAhXPtTEcqTgNPaMfnNNzTjyiQZ/PNEEFtwg1qfh5eAw
         z6Og==
X-Gm-Message-State: AFq9FYIE7YoAJTGnkkzIg0NAhy8uDQf0W/xmyGsvTKAstCmY2RPggmx8
	5e6jzKNRJekBu0hj8em/YxKVZKkcqiiNDc54M1RIXgnlpB/KulxtP64dK2CbWdsBDiWawsl+wnL
	EE5ImhKNKKJE+mLIALO3K5O0QOTbq+hYBhqHXMXJoTfhvDXs0rkuJu4jrqS8f3JgeVo5j
X-Gm-Gg: AYBFou0KCnOnmZJaAEeVwDzgiwwgvID4//9wk5e2eO4qp18lNUmZ+9u4tzMweIxPQc+
	XO4XdF5KHfsDdvrc6YH6/Db/Ee+ZVRn/r8c0XxWKAuNY2JaqTC9uCtZjes3FnMvPBYnPcuwDUBU
	MG5PswGaYz7GckvgT3CfRWN/zCu3cqv3FJjtxw/EIALMlXkkSjH2LuRXFs7bYruoSxaIfyUgj+w
	zvy3LvpdllUTVJXrw/Z1jELBYGNd11ozKjquoNOpHvFB33AcBgStOWbJcxcKzkQ9Mf7Rhe0AaY7
	2rhTrGkQPoDsMJ4V/dyf5Cv5A7RNdckFrCq+mHm6+1VvoW8FiRZmMp44LdpvXV2r8iRZ3s5lgVe
	RycCCpFSgbJTeKtkO6StzXJEO7p7elDOCp3o5oN41OljgiKyP5x0o
X-Received: by 2002:a05:7300:e9c5:10b0:33c:e74:4624 with SMTP id 5a478bee46e88-34c63afc496mr775815eec.27.1790717717164;
        Tue, 29 Sep 2026 14:35:17 -0700 (PDT)
X-Received: by 2002:a05:7300:e9c5:10b0:33c:e74:4624 with SMTP id 5a478bee46e88-34c63afc496mr775765eec.27.1790717716443;
        Tue, 29 Sep 2026 14:35:16 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34c391e25e1sm1512570eec.30.2026.09.29.14.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 14:35:15 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v9 1/8] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Tue, 29 Sep 2026 14:35:06 -0700
Message-Id: <20260929213513.2401005-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
References: <20260929213513.2401005-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: L8HRGhFDjCC_4ltfZr-L5XoFd2XDLEQf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfXx7nLsK58oH7N
 kcnoGBgKKhbFPJWBInN1Arwbc1lvLmmzqxCju16QOEtRNavnMtdGQ/2eRDnMbXgd8uteACwlf78
 nEV2mXScbMsLWoj8jBhG7+dLWrhkIaswDUd2N8Ivj/l2gWkaRFs4vSkwaySw3on8F9s0vxI1GVV
 fhu4ajb7pbBp6T5+FhkZKJ3+OARRY4Cq8kOME43VjSzI/Sl6Pu3rAfNk2cJTwBU4cZB0jvbj8JZ
 7d/spPS/n2Q2F6JwF4kthk5p/4kzoyApd6xVb3uV8ZaEBX/i4T4OHTYfZDFnXNAuGLJ/3BXA0M4
 p88+t3kFNY20AX6lc8uAtufr2moYrLwN7+vACDzPW2K95oQbpn9m+usvRPZHMk4zfyzsk9upGxn
 sGvs+K6ncwrfMc1kUimqOeQ8LbeBlQBKrPhPZMO+pr84+5aNTJFAyP3agXLHOIEEywS8gCPprnO
 O0PrwsJvonLMxN5jqiQ==
X-Authority-Analysis: v=2.4 cv=cokOAF4i c=1 sm=1 tr=0 ts=6abc2f16 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=RJ9lep_nkaVUh_m6BXgA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: L8HRGhFDjCC_4ltfZr-L5XoFd2XDLEQf
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA4NiBTYWx0ZWRfX5yzz5EMNk/Xd
 zKhoPua+15bYcq91jFypx/xuV1eCNpqCUR5zbxYsjiFWHJuhLWJPRkOrPO3Bd5zX4kK1/RJz3u7
 /JcrDHKgN9Q4BPM2k+DCRu3nQbdczTs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290086

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

