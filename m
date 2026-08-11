Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27148388E69
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786484176; cv=none; b=C/ZMz12NrU8WJNoZzfbLTj+qdZSNzRv0h/r5GBtYIC8r6PnX/kRwjp+ieI+eW2Nll1NU/pfpf1oaS4nX/su0kOr2Q5Jlfss1R0RRSdcFtSDD+2qjvAVlJ99ahjb0Azrnix1soTSVI2OkMGquBXDjOhKPu25yxbUEmWlcVhAN4bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786484176; c=relaxed/simple;
	bh=vMN9xFS7+UE4CpC8JHmwvxMa/ZHXGxw+m0BPvf48J2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MWMq0TADK9awDVmK5/9k0SEElaNfU9CaejCRTTe9O2KePX+7GW+DuNwnSoAyEGb6D4uKbiGZlH51jCgWk7o4oW3qRFgRCW5OjJxrWkvHOIA3J+O5dqGxCaytQ8llYVd31lmexJVXO7MCV5uWo13AUnGNAcaPzdpJWAgCwAn55pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FEKvAmTo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T5QsTc2G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FEKvAmTo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T5QsTc2G"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BLQNQZ1472078
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Y6Vl3S9Ln2Q
	++E5qKFv7377jV7NXuG93z+ypJQ+LQuw=; b=FEKvAmTobjJytMmB9Le3k1W4Elq
	mYQ60EH8zAZ2jda057ej2RJlmJUo1xpeBIfcqb7sg9AdBjb/u+JG/xgTwLG6vchu
	V7sM73cb3NpdQPdZCaGZsMMCwt68EzL9X/0w6PwT5fwJzwN4GRGl7UMzaAhaDQgl
	HHaC5WLuzuB6d6uhu29k06K7lsMNyqmliAnJWBZL/0qU8QUBS6l05glBr9qc+87Q
	tFU+BHpNaRWmoHWMOcCJUOxXlyPLG81s4/OIO5+Rla2j2vrQpaeH12y0WNHPbW0I
	N99bMInffo2ffSpL5wX3OfczJWgLe9MK7ag2GI298+QQS6bPLuvOcmQBwIA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g08jrgtjx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 21:36:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cc640dfde3so5643745ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 14:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786484173; x=1787088973; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6Vl3S9Ln2Q++E5qKFv7377jV7NXuG93z+ypJQ+LQuw=;
        b=T5QsTc2GwbAlD5HmkLyNq7xhR2HsDz6R3nwt6VS7ozWJO0KdeTjWKW2SSxRyO0wPRv
         SYEkRFd8nwVV0OGupjrOhSMV6OXKPvlRsCMEIs0Q1CwrAWqZPKePZ5icbABKJVRDUL4T
         8MPGRbC1dE4TzS4feralBNdOnBIFM1IRoE8cBJ6UMZYKZZXxjoqUCyJIeQS67cgsLdZ1
         3pV0fWregnYEKk1D2RGIbZ9v493y0W1GvJL0C3YqsmDuKOg46bW0+obIy+l/jcpwl/eB
         hpxRdBxi+07WiiVYA1tqaB3jyQTyhgLqKha9g2g+bGltu6YUuIB/oE087QB2156zJ9eD
         863w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786484173; x=1787088973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6Vl3S9Ln2Q++E5qKFv7377jV7NXuG93z+ypJQ+LQuw=;
        b=oTi2//d31IOjOvzqCQjUcjf15zThKCkAH1xcryPT0zLN5mh4SSxBXWDB+YGMCN3Ji3
         1G7YxPtGQqJvAQt7++CXd4tw3yTquLgp9/J6krkJrtopu0sX3M8RYbB5nbVNjUQAiKES
         j2HNsl4NdgvHd6Ufr9umLspDcAh89XZdZPHmr3IqjWb0StRqhKUXyL8frA0MCBGJySrH
         X78b8ypI/RzOdC8rZtibAXeaTTKtWzJ3d9Fa2BzdLb06MXAsAAyyZ9WhkMd9oFaJXtkh
         bRZqIaXrd79GdJJpRxw47wgeAu8NdclJ5NQWqTRbSApimlPb5jHqtbnwyUhz7LW1+Qfo
         IRKQ==
X-Gm-Message-State: AOJu0YxB2D1k1U7p/UcwT6MBFwP3/AC0Q8aBEBhBHzn9RKse4MUr2MI9
	Suoz8/b3CfF8N38zxNGfl/ZtJVfibyYiCT0BIUuI4UNG3kY9elV0lggEJGHW3M+Vp00wZDZgpI1
	68hpeBHUe2ftS1pcZDscemIkwbZV87QkZ0MbPYKYEsqeXZOUI24rRx3Fgrjp0KUpAplb3
X-Gm-Gg: AR+sD13ZD4jFXrk5atI9bAAAx5FY8W4NlrmFIs6wfpd4vNZ0dFDRTvxBmSJ/poI6Z2g
	mceLCveOo7eC//CF/4oYvehrrkW16x5/+UMEo4+XdHNBwkDslxHWzm4ABimRxrDM15pbDOrBXVn
	h2AdV+DmUqGmgFshKzLpM+nW3Z1OR1vOM8yD3jdGAPfxdvonXwNf0OH7Rkk2nstuvGQhVnmfDkM
	mez5RiUxU8L5sDc1ofLpuZoaQ2hH1KfgbEZLdqTdm/m++6dmje1AUtsMe7RmFZnettXsuiKlPqu
	CqJGF4cThiNsoxM7kurlYJXPZpVWJyuXtvP8iruqjN8UnxhFbYkdPinmdcXo7VZDJqIRvmCwL4U
	AI2M4JMYN+DaERcF9sKddfaVFPaHQ0cVUPAwsaNAu+MX41m0isxFaGg==
X-Received: by 2002:a05:6a21:6014:b0:3c3:8d4c:6679 with SMTP id adf61e73a8af0-3cc2baf91c1mr9221724637.20.1786484173501;
        Tue, 11 Aug 2026 14:36:13 -0700 (PDT)
X-Received: by 2002:a05:6a21:6014:b0:3c3:8d4c:6679 with SMTP id adf61e73a8af0-3cc2baf91c1mr9221656637.20.1786484172935;
        Tue, 11 Aug 2026 14:36:12 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31cf3c08163sm2713563eec.7.2026.08.11.14.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:36:12 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/9] dt-bindings: soc: qcom: eud: Add per-path child nodes for UTMI routing
Date: Tue, 11 Aug 2026 14:36:02 -0700
Message-Id: <20260811213610.2956147-2-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
References: <20260811213610.2956147-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: yJKSMdwEbNBtnE8h4iS8epnp3vWpQuPY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX8c9YoItIFTgr
 GPFKivhA0kZWoahx7IbsrtZiQ11UemtfD5wcAZ64vjl3TuP1+ywNhHFkufVgc+0J1pX85admGtH
 vZEpiVayAkOlybQnqPd+g2xXKPZtXlw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDE4MiBTYWx0ZWRfX7eOkR4PCzAbj
 8FgJAEx7+HAJ/o3j/DoDP1ZujJKB+600MeuMa8Z4+udmetPDcXx3/57mwgkbkW/yd2Po97jTGGa
 ZJodvfFkM+ge/VMioRjXhcV06K+zV85ya/+MpQF7VhBirbWi0e/tXdE/u+ZQ1PytsUgQvLSKaLn
 WP+YRAOnb4hslqzxTKIgAoU8R2aqxsXd1yUCnJpDNeUvmXHQ7Jw51FTdvb5BX/Bynhlld/BQ7cv
 jq3iv02IBKXgZsq5M6q/kKUsCu/RUIThfWpB2jYdtja9SRXNIM9Wwip0gPIXIpSiq68pF4WINTh
 gVYW2X9zic8vZGqrzbSFYhdpMdg6DLqR+0W9ul+S93BDLeZm88buaP0jWipgAXnqDgGRTVrmOUt
 BiEvC3ymdDNhwiO2Xy+qO7XOv+ozLeCFZLpUUhJ5I4/plF0bJnOz+TGlxprjuaSmxPKFk7SlRZV
 grExkc5JsQpjKDXUX+A==
X-Authority-Analysis: v=2.4 cv=Z7Dc2nRA c=1 sm=1 tr=0 ts=6a7b95ce cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=RJ9lep_nkaVUh_m6BXgA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: yJKSMdwEbNBtnE8h4iS8epnp3vWpQuPY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_05,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110182

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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,eud.yaml           | 133 +++++++++++++++++-
 1 file changed, 132 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
index 84218636c0d8..0e35bc9a9d20 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,eud.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,sc7280-eud
+          - qcom,sm8350-eud
       - const: qcom,eud
 
   reg:
@@ -45,10 +46,87 @@ properties:
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
+    properties:
+      eud-path@0: false
+      eud-path@1: false
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
+    properties:
+      ports: false
 
 additionalProperties: false
 
@@ -77,3 +155,56 @@ examples:
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

