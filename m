Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B07345EAA
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 03:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726941; cv=none; b=c9G0gWJRvcqrTI07ENtOv7SIY2OlMu9j2Seiad0YcUI+0uVu9cIFlti5YYwRoWpf2BWgsOd0YRp2Fr8mD/v8ydi58UiB2Y1tJLRlCTFYEK4D6lfYbtzt24y0jGwgQnFUGkUMckPn/sYNCvFHsTAXaoCgTbbIlAvmJWHZdVHkVwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726941; c=relaxed/simple;
	bh=Ms8xCSaOs/jykWnpXTey6hmewHvpI4F5jGwv7/LeqII=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PjMkqSY28x4LRb1ZgD/SJKxZ8+/9dlxKqAUP4JAh2DZlGOaqWgM/XQl6dx4IhpEYa/uSPs0YTXODLf6SqflKxf6tOEtQ/e+b90ufOFLU4eqEenGGHrYrh7xGUfAa8KwytqRxmYVMvy94cbgtzlLBkxPDXcbWpToW8uyzb0lQ8YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CMFxrHhT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kdPe/C21; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CMFxrHhT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kdPe/C21"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LVQME3959761
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 03:15:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Yj9yTw9oRgk
	ITJCjIE93n/SQASuWUbkhzKAsAeSQGow=; b=CMFxrHhTxZ1G42ZEnq+Jnl6Fqa+
	LFg6koyCTJSQBcKGZ9kksVwzKBXqqFBq4fkYR0V5fHb0PzqVHehMgoPPwm1e5Y9l
	nZtrVlpGeBZOoSxCJ3USfHV4Vrpcb2BXM3iH2635tICPWLG5GA3p7/VcZ1zi6fL0
	uFYdMfysYMVf8a/XfylRqAay2Hv+HCQ7zbWssTpwoCveE4K66e+iIf3g1fkVVUri
	O0kUHpkSRhtUIAXFbqM0eveXN/7r7B9KdCJtudrgaTU+FrxEz7K1k8eBMgs7GCEu
	mT79P28eBxEKlGq010ckHKBqiOgvfT4pb3lBm8RcbtXQcDeFLHJ4YBxDgoA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fah2s3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:15:38 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c860544c077so7071187a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 20:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726938; x=1786331738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Yj9yTw9oRgkITJCjIE93n/SQASuWUbkhzKAsAeSQGow=;
        b=kdPe/C21AdDuXLtSzd9dkZeFCjXDJHxtxET+aq24JOg3m5hxqTCeFZ4oztNIlerPsP
         fRDIRRwjdWCqr89X4ESTZdea7TzpvhFbbVYYrNVQ3ezOePgHV9GyJACljwGB02puLXa8
         a6zEB65Qiv6wd39oKWfHavdsYQAURXH2ABn1tjyACSGUBLQY77WpYRPivcj43qsSbf6P
         LKy/o8sx1ssQQZDu9P/dfquf53T56Ym6uN3ALcThG8qBsvzuJ+nL1q6Yr34MEZZEfvR7
         BwTZ+5aS1njEqxqV718sd4pRTRjgo4CAlFiEQDiJcnKtNxju2YVxqFFqmoJwzKguQsen
         GbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726938; x=1786331738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Yj9yTw9oRgkITJCjIE93n/SQASuWUbkhzKAsAeSQGow=;
        b=WCZzCqPM4sOZq93/lGsp1wz9NxH/Vguu2DFQUrA3P90okFbtZvsi8eJiVS747GMdXB
         vGK0qhgL9w5b3FASZmmiEtr3D4H5vjYMSrToYjKHi5TS7/bYhazI7L6SM2hO8DPViAKi
         M52G83XOChgaFeu1fo+cPrqKCAVfiDlonl6g639UAEN0SjorXNQm9KpTiblq3U2nKJAb
         G0B57WU5CkrcW51VXmfSYb4I+mCRPSwVNPj7P4oR81M02mw9nDceXrR7Y0Rsgl6JweIt
         oRkvNzq1rQHRSch1bPqyqCsGzDofa9Bc+HgxdJI5Fp+8u8WT0l3PDpy1uK56xuIx4swG
         MZ/A==
X-Gm-Message-State: AOJu0YxmL8m3DoLHXdMBZ8Cfydy4JwwJzHkiaIYjKfkIRFLYW8zJo18p
	1xy7FGI3g3525cZ4/TMTVwRXVOj46NoIHuhzl60RTwWZ2zm1+08IoMbRLGlfCr27+hgBkVcd/yV
	PGAQdWNMIWSNfvxHDg1annNAhcZwPJr9w1aH9hP9Zks5ie/ux+bqRs8ROoW+2+CdGF/2u
X-Gm-Gg: AR+sD12I4SpHapHLJQ5Vtw2dBYkko/7skVoz9jLY0eKiFyioKoX9iNXlm+5TnOFRISJ
	XjpZf9+fb4QW2KzQxFEh7pW4quuevXqhZ4iWA9kngufsERacGjvqpISM4eGII6GefTsX6xgVX+G
	KUTFOIYeUk6EBuszNh71BpBDKN3IDBVqbShd8sjQA5DSNoN+aRms4CDr5VmwlS++ef3qWOGj44b
	i+UUqrFONHkq1A20xSxUDTNsdqL3MIuHU7t9GhvY3AlLEmFshwNE6aj74Z7GhpKcDQIDct0mSEv
	V62msbehioUWGXW7SxQR/2Pu9SjtHDk1uZXOBjmD3tz1863nZnpJfAr3nKzh3O506CmzESP57W7
	K1sApIsLpBjocvWWswxj+YGXo0J9Ss468UD0MxZJ/wVzkbe+oFwsGsA==
X-Received: by 2002:a05:6a21:7a82:b0:3c3:9557:3b56 with SMTP id adf61e73a8af0-3c92a992c4bmr8639753637.72.1785726937672;
        Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a82:b0:3c3:9557:3b56 with SMTP id adf61e73a8af0-3c92a992c4bmr8639735637.72.1785726937285;
        Sun, 02 Aug 2026 20:15:37 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:36 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/9] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Sun,  2 Aug 2026 20:15:26 -0700
Message-Id: <20260803031534.2942628-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a7007da cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RJ9lep_nkaVUh_m6BXgA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: PEIGSq7G7yiWwLfcb22WMeJPqcydjHYb
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX5kBOYSi1uxaO
 Pv07zZQ1UKaxluYf75IWhk1r4QGpMF7L+MCvMFmTMQW/hAaeCyE6DhPM+hvOcx3NEWYkRqHevcG
 JKsG1G3F5OMTuX3wV3jEbPAU91rcBHI=
X-Proofpoint-ORIG-GUID: PEIGSq7G7yiWwLfcb22WMeJPqcydjHYb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX/TnqzgkHYBPq
 qfka0jcBF0Vmsa69D6Mqrz/UAyQ3qg3bA0vZxxc1dfVTlFenIYJcKJSJ6L0CeCUQaEk/lsgVBxi
 1w3ONLn+98+u2+eRzc1SCS379eFMtDtvZrNWSNOR9NRIyHRY4XYlZlF9cVPTry5mj/3KGFSZkVI
 F3r6PtSeBozSzMFAsuzhGE9nYeijrBo6b8klqMEZmp1HxM4N+U7L8Re3T/EYvJZZLEkzbSbJX6x
 hLDQsLS8O5ulLOnK3svuRtREVPaiF1c8eHv/NM9doRSPginzCMGmBoBLeJ1Om4EbOPPMPyosF+E
 Wp2Dg8KFomkTVbNr3MXUNa3kUGTwiK5NFg/gdlmB6hTZ57+XOWXvg8PB+qTDd87b51aPNswnMy1
 ftt5cZFpvz05Ncd5fvt9UFiD9QXWU+LQYtsJmLfQCEXB73aG5Ei0PYkRywm+JQwihw8wYUV2Luv
 12MZvhZh/ucGBbmMp+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030024

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

Model each UTMI path as a separate child node with its own OF graph. Add
an SM8350 compatible for dual-path EUD topologies while retaining the
legacy ports representation for backward compatibility.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 128 +++++++++++++++++-
 1 file changed, 127 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..6fef958487c8 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,82 @@ properties:
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
+oneOf:
+  - required:
+      - ports
+  - allOf:
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: qcom,sc7280-eud
+        then:
+          required:
+            - eud-path@0
+          properties:
+            eud-path@1: false
+      - if:
+          properties:
+            compatible:
+              contains:
+                const: qcom,sm8350-eud
+        then:
+          required:
+            - eud-path@0
+            - eud-path@1
 
 additionalProperties: false
 
@@ -77,3 +150,56 @@ examples:
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

