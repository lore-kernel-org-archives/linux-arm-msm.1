Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795458533;
	b=tkMVCJtLCLzOUH/yZeVB1AD4h1VJrjhhPvHlLIeIoJieI2dZBxNKN2HfSDjYv8cHOR0q
	 49xGsn+bgkwMQVKTC33U/+mplP5W5dr2+xz+H62kEAekUTpCFs7evK3aPGDO3WaYep9zs
	 2wMv1YT9WlHNUaKwp4itRim9nYSL+L6u6X3mE1dYD1BftNqEkyTlwzyiXnENaB+tW8IRR
	 vBf8xh7sQndw1FexxFF9zGuJEM65BgtDz69IeHQZIV8DTZpO6ZQ57r7WSQGYVElZwVwzV
	 YITB9dI/R9a5OnX4ynCuJNNMqCGMPGBZwufsafywvIyPjFFWPbQ/WmYpUKnJZokwYgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795458533;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
	b=FZMj8OxqF4utuDMyB6naoYsEqMy8mbv71UEvKiYYoIC+nVzH9vUeaVZ9jyAaSn9rFmC7
	 /hBTCDb9yMHQLs/gKHrhy96sCV9uuiM0p7MxSrG+FDTUV/ohctf6UHHa316Hh1ybjrln5
	 tPZUKwjFuqVPRCRu7PlxIYCPnXsZ0rn25lP5If/wzDaHS6mo6gBDbB1djGAWxjJTcMlj9
	 Ne66eMnu/ZPriy8hXlFbugnO2bWMiVByzgypAvCJaCopsL2k7142dDqoG7+s2bIDEg/4t
	 9Uhq1A9Pi6izh+zN1AOEXsMNfi1U+CXJvEmTbpST+0oSu7nxTbTFmR+tXg3SjqBVLOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrs0eb9y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQwjKs8d;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D061606A331
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D061606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jrs0eb9y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IQwjKs8d
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANGGlIT3730153
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mjs3rlDnLUk
	N31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=; b=jrs0eb9yNOPRhUgP+oR3l6ZbbnA
	XB8+idsJKDEa7iqJD7cM08ya5idCY31w0TC4sx1eOIbdKn4zwDsYyXnUBF+CEh8P
	WsYPBDT53QOTRtlXkgUHBqp/xeF8WYGzYpTXRj50EDNij6ucnnlHWYpUhVz1Tf9H
	avtew+NWAJJT0GVd+SiXxQ7JiTQjDfIjPNYU/UQyfHdrqmfnrXc8L8wxpQkfLKDZ
	9lFKYSZOiiqvWUAycaZ2151OkR/vaywddhtMflhLR2MkV5wIjNbHaU2ru5bYPMmx
	YS3RsrvJAnZL1daxaLOJDoHyAfOlRFatZAH/zF97x78EiYb70uqp+CIkM7A==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd2w05-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 18:28:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3869accaac2so1910899eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795458531; x=1796063331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=IQwjKs8dahs3/GxFhjLsN5QmRRRvrFQsCKgmPenRMU63mw9FyN+TU1Pv6c7tQaX7+z
         LmgTADiVMXLIr5jIlH9xYRXrt7jmUI702c48w5Lb89LCTcixBeCDi0BZ+jalCJrFlRc9
         y0qBdqWaBZJmMQmz24Xw7kQUatkQrK0kvoEICJLgjM6CsUK6+d8ilCgKrQa7UWBYKXIA
         94m4W1YKfX+1WTZPr9/vuBXa/7QSoZ3/1jd6FiD92cOxnmjxzLUcOhvglWLD04Yjs02k
         AkKI3IQDDzM5B1YlbT5qJCRw5aKavS7O0eT8GLE4+jIpOzCXlGOjiJoaGUZf/8OTi8jA
         1ULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795458531; x=1796063331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjs3rlDnLUkN31VdHb88E8QJ4KDT+KUi0fn1sZoUpDA=;
        b=cei1fuRfWQqpVW7UQi6oBU97k6zsR79CHQV2jUUEEYxVQYxRSC8xuvG4rd9kNlSjSt
         4azxLvnHLiwex1suYfjVSry2/FD8IRGW2wQ8Rr//nSS4a4C4PfwLVx7RJ78abifB/XDe
         RI4hqpVUyEp/Z7gZ9wpavkjQDc+6TRBOZO39RETfwd57VEuLlfrPRHmg6ZFpJ+76vLvl
         FiNYnfTq+utP9Bv6zAm67pOBYhqLIpwvVqlVFQd45xa3qwTJKUi5mBo240bpIJ+UJEBN
         CO4ynwkUDRoT7acoRgIQui1euhRxT3TpUtURMU0qO0q5joAu+tEQ5L3BITWr9wDSda7O
         ReAQ==
X-Gm-Message-State: APuU4Z/eDBmneiCUKEdzvd01AhsCg7TzeAZKbVdU9Y6Bb8E6J/xba3HP
	mx0JC4Oc6h8EO8M3B5TmiwCkl7WgdVq2pmML1g/KNRBaaCuV6swNXxcr6G8Mzc3/vuUXBM7CTGS
	c8crOtez3Nhr57r/VQQZnI/gygrC4AJh54TA+y0FdETaZvdQlVSKNBA8fQ+HYD1PHSHUg
X-Gm-Gg: AZFdTZebJWO+m4LDeu1n+rU5l0ndNFcJAtOCCSEvFpWdxahWDZ67MFI6CwT+H68r+3+
	zXCPE+pN4GErTDdDnUeBQl3oWz2NcYKpeAhVMjvIm9pfTlShBflqCMnSGUtbP7zH6VMP6+GXjf3
	FTsDyFyl4eQe8fNEH6nx6URgq2Cb7w2lFuGzX8RDDScxZ4gKckJC3mUaujNElrWVJrGsvVPVOxx
	LJsSjdUHyudTXoYhuwAkzePb4RuWIl1yCBbQOeLQtowAUE40KhcbQIR08NCL68Dv1Pd899k0wj0
	oJeNbXIGp2GLSe4yAbuALaK5+AUG8k5b5XRlC+EJyTAv1ehnwXxscgbUjCZCDH3oICAVj+lq2rp
	6Auz9cJu29LgsiCn3h2iPzP1gAFXMmm0tn2nMV7H2GohGmOu+tPcf6GGOsSjzINnOSBL4DD9HyA
	HHiZTithsiM1RPSszZsQ7tqEpxvg==
X-Received: by 2002:a05:7301:d18b:b0:386:b4f1:dab0 with SMTP id 5a478bee46e88-386b4f1e04fmr3217105eec.1.1795458530769;
        Mon, 23 Nov 2026 10:28:50 -0800 (PST)
X-Received: by 2002:a05:7301:d18b:b0:386:b4f1:dab0 with SMTP id 5a478bee46e88-386b4f1e04fmr3217073eec.1.1795458530113;
        Mon, 23 Nov 2026 10:28:50 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e99fdsm47697986eec.5.2026.11.23.10.28.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 10:28:49 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v10 1/7] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Mon, 23 Nov 2026 10:28:41 -0800
Message-Id: <20261123182847.143892-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
References: <20261123182847.143892-1-elson.serrao@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: F9Jl6gn0RK9EAwLhv1un9MWley7YN-Ga
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXzrGdlLgdG97e
 w9anmfCZ0rFCPzgEldXjQ45iedY66Pto/kJoLF6Os6BwnMwduByxwwH7s0Z2SoxCcBzTyxU9FH6
 q2LfauHsFxEloO9ZaUgBdpADxuTCPerw/a8/M3mkWG2YlXS6RNbXu9D3uL9qqEaQxoI67fIAPa5
 ISfX5TJVeN8EOhnxcPsR9x24eTywwfBpo4U1VS7qx6ySzU1gBaT5ycjfztAu0o0OV6KDluGHUVv
 pCptHR1LeUYzlyd5yahyVxGus/9YEVpKPwXDYKgcCWHfaoYKsfN2/W8X+/m7BvPbceLoKvd417q
 yu3yGSKc1R4jI4waiA8qiWjnyXVjnwn83eUGyKPOTov3/c3vP1bZwkTto7Os8bw0l4w/4LOLaUt
 impQYajTGFWa6wOWTt9ArjDTwYwgpfUweNHkO9FBHqbmMxKnLvYR+4tBHWnWGXbbego9zBWKmWM
 TAvV8vkbd//weMt7OtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA3MyBTYWx0ZWRfXzMcP63DnDUTn
 3EDEUIxcMG1q7eRBEIs65YI7e4msjog4EWj01K7DzJCY/jbseuIHbZ5aeaNfuoQ/l5BTfufL5cT
 H3Et37cQ1L6BB1nY6T8EKb5J88RVP2Q=
X-Proofpoint-GUID: F9Jl6gn0RK9EAwLhv1un9MWley7YN-Ga
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b0485e3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=RJ9lep_nkaVUh_m6BXgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230073

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

