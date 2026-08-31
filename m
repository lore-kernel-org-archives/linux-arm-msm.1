Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC4A23546D9
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788145314; cv=none; b=UmliK/19JUye7i1b3pHXCda82yZ7CaEOfc4XzYGZdsxu8t277rXUP+gHBs4CB9G0brMK99L+vVF0PQ8I8fMK7N2dkcZHzXYRWMpNrrtdUY91fjemPCkbCRCUyvBw8a2usLsQv0jqmg2K2e2BWTDwMOjrlWPtpOnoi4g1Gv3Hoxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788145314; c=relaxed/simple;
	bh=iWIKG0GsxJ37P8HUU/8Um+QELLwdikK/1FiCSUl8mYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZaY3w1T7GIXkzMDom0lBmQJkUpFitBbvBHVSK8Qi636Pe9Z09x+4pHeTJ58O32Og34YeqxdL2GHah/6hjz2Mg2IfeViMD1ECa7gZTwG3sJCNbasVxJtc73v5XPtHPbQujJqP4C5JUDpv6VnQMM6z8oSkWL4Z4R/agQUUm1EkJVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfvXYaml; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eL+wbcgS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfvXYaml";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eL+wbcgS"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V1bc5I3239077
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aWYKs7l6+KL
	Di2n39qvOHhp68UV5V4YMkiiC01L1WMc=; b=pfvXYamlRMnG3qIWKlLQ5TRkpbL
	Oa90EyscGEd59WvIwmhkM33ImEYeWJVWZDj10VsZA7rU6kcCeboCfqcj4/oL9PqA
	hsE/nRBM7TG12wyNkXUL7S3+M+Cc/yWkWbx0h4Ox3HQN+BXEVn8XfJEGXMlo8qP7
	25HzjD+rh62Sere2GSLtMLxapjZllEHNV7IZ9F63D3mE9BuuMDIFo7AxmdomTz06
	OU2PW1AUmnALJk0DSM3P4bxW6+UfCG9S+GLtLLwUoV3ptsN3D/XGpbbGIAuPuAYn
	J2MvQHDv/dJGJM2gT4WKEhFbKdHl/yMH6oMcqTK+klvgASZ+LjK+TeFZgBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gcv8h0k2c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 03:01:51 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2d6f80c76e6so48518685ad.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Aug 2026 20:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788145310; x=1788750110; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aWYKs7l6+KLDi2n39qvOHhp68UV5V4YMkiiC01L1WMc=;
        b=eL+wbcgSZGFR96j9mxmC2MTpuILOxJgaeOW31INURJAmimbWQDtea2f7s1AnXaiy/Q
         CMzQ0+aDQ3n1tYuF9QgwGt0bcduIMazE331qoKYYYjeCjib/DsTmGOPOQKy7zS7VbAWE
         PH8aUXJzHrV+E6jj4aWTLGiXJg2SxhmXli5cWX6VffPSZ9mSu6naLdFJPzd/3scDrhGC
         iFfyjeVg1l54wbAWNgKoLpRyO4KtjaAc8rvMLQ8S9akUSHENa/xx0FwMJMhAiS2Q4QAe
         omqebczFKPsGP6iVMRoCBYDhVrNKQ0fYAQMcz/j13Zb1A9JJ6IFTOORG4UWBcytuUV3p
         riQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788145310; x=1788750110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aWYKs7l6+KLDi2n39qvOHhp68UV5V4YMkiiC01L1WMc=;
        b=OzIUvmahiGnW7DgMP2fxGIzoixbqrrsf1HlygvBpA7MgEr6AxabnOwu3VUXfL3ROJk
         Ytq5a77UzTJMeoIKnEr3KQ/b9iHjqfX/c+WUi5S6BO9jBoAfAcirbOdxEHx8fQSGe+yR
         4q8F4O6WWpYwiri2rnVwbqJUjCXu9jW7ug2QqvbNHyKi7bLwiOtJa77EcrgS/z/H92dn
         7+0kaKR0A8E932mZKAUMxD+TxHEIbWBRhWuhiowhcCAXaPIlhZj5iL2Ecr8H/GdPhqhg
         ggqz5yoUR8j3RLiK/kszZjrtsCeENVUODjd1RV8sCM4PzW1706ZQ4YYdZFha8OkLgwuW
         3exw==
X-Gm-Message-State: AFuF++l7VsCiCZmueHtRNBkHEcTA27jXb6cE651uj2B/uerjjhcBfEM8
	ybQwrr0UJKKXGwyXX/pSHuOUea/lye/e3HhA9GdOmf9dI+xkZmE8wsiIfazfy9iQEfwpZCVCOit
	IC70W1C/YTJNvB63OziAFzNyvzFe7075F7WWfTqVERES3x0knf+kfyaB2xmsp/nlKeW14
X-Gm-Gg: AYBFou3sr4y8yX04ae8ndhB/hcpsNiOynGpoxjejv4QFGLKpJ4617F3XIDvxU+FLZkl
	j1MN/9PWD6xq1pDofU6JMBOx1J02Kd8q39Iwk9y1IdI4GUq4uzMwaBMkyWKlG4N2JnhBTgdjLv4
	lPOvUmGGx+cSEKehXtY+Bzo3O9UZHEfzrH9wYssTBSwxvI817QiArv7KYxyATGXo9FSL7O46VjL
	qXvJBQItwCKzzwgN0P3d0rbM92jhVFiRKC8GbYY0f2AABbUWtO6uaMG0XpqmksqXA2uMjERC0dp
	7sj65RatZEn4O6k2FXD4zdrHcUGDv5/1B5T3vgjuhvonQI2yHOfSDXR35bkyQ0ENSTj//tmJYmu
	PYj4CwjM0gw8EgtBssubJr3+3UKjpdGCYgrCIHx5iBaDAlMAB7W/+Eg==
X-Received: by 2002:a17:902:ce8d:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2d93fa2fc9bmr5106975ad.16.1788145310331;
        Sun, 30 Aug 2026 20:01:50 -0700 (PDT)
X-Received: by 2002:a17:902:ce8d:b0:2d8:d4cc:be63 with SMTP id d9443c01a7336-2d93fa2fc9bmr5106315ad.16.1788145309878;
        Sun, 30 Aug 2026 20:01:49 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f7bc825sm30011973eec.9.2026.08.30.20.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 20:01:49 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 1/8] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Sun, 30 Aug 2026 20:01:40 -0700
Message-Id: <20260831030147.1500616-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
References: <20260831030147.1500616-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DY0nbPtW c=1 sm=1 tr=0 ts=6a94ee9f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RJ9lep_nkaVUh_m6BXgA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfXwTYpjQqYmJH0
 oimH4yMuSfviJJm3F2vrvAHiCiH4JN+pZ0JyYBtbvjZrBsp7B5YxJQrte60fYZ44OzAX2aWRFIc
 S/4VhuhHcVAyLA5SP+qoc03XC/eNJIGt02qFEGVdEmlI+Rc6bwrRX7wmVCgb/U8ktJNcInOlewX
 JrX6bAPHhyusVDvlzxxpp0cc9M5QA4n9vEOXB2wHmvD4gWX3/ZahdzKcH/dnAKGb93QYUYdfEcD
 Yyw7aqBAigA7zzRRA8WFBrfq7rb7vPrbar3dnNxd7zuyzYKYWzmNUx5uJh1R9NyRzhZpTWWKPSM
 0iIS7pc2fzcjf2n6QKMdByxKb1Txf31Jkpftyxz9xh6KMWz9nLrWmvHXmy7/GSlxHZKUYhj1cm9
 5pCwj2bsfV8+bp1Lv+y+LZqPQe/aFB/7bwCEcU+G6aVwbbFf6Axux5C3EuJgIkLuiNQ4q/1FY3P
 DgHriIoaiaY5F24sMOA==
X-Proofpoint-ORIG-GUID: vc5uAM3xOWQ3ocr_X3ovPF4IkZpwvWQJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDAyNCBTYWx0ZWRfXzikpKW94tx6k
 70oSb1Q7UPxpBNIuiNTvnt+PIHy8JWAB61NZ2jpKu2cHp/oNiqHBYir10JFxIfIYJUiwv42D16o
 aVh7ySOCsmI0MgzVJE+Ca06Xo+WXY5Y=
X-Proofpoint-GUID: vc5uAM3xOWQ3ocr_X3ovPF4IkZpwvWQJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310024

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
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 134 +++++++++++++++++-
 1 file changed, 133 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..c377a77d623c 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,88 @@ properties:
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
+      properties:
+        ports: false
 
 additionalProperties: false
 
@@ -77,3 +156,56 @@ examples:
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

