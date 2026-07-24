Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCC13B27DB
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784879305; cv=none; b=sl4tLFIfdszhkwu9pWTxprKkV9Eqsac1gs7PQc56IC/UGHyfXEACnzLBXqeTr78n5SoZAAwKG36l0FYCfl3AX8ADqkmz1m8BBj6+AmLwcmKaWcZzW9LGScGheysbDQr1dcH0nFUHP25C/yIJ+/Jk60qzpoLfxH+byZzpZaB6v/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784879305; c=relaxed/simple;
	bh=yhfsNlH0RS+IypgukP+bK07b4g+Hfp3VDvpALH2BQRg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=irodCn5xfnBOb2KtS+oevT33h382B4vhUZcQt/EzVRFXZzdl+Y6jqBoCxTfejpUsUfTpll4965DOl+96abs0JGqejGvYcdwnbTpEZLYWKZaizFEWr3TCXDubngC6Wf/6xxsMeXEtXOx5GIF4k/Sty8yKLqVviyp2Wh1+B4wlwuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BXcHTWa+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8fCw66s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BXcHTWa+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8fCw66s"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lEoo3139548
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=; b=BXcHTWa+XdhLzidT
	UzspvCo4elz9OZrnaRGbWgH2zpQ/GWYE9LccH0sMVP7WAJw3SuRxFYtG88PnzXNN
	eQtkNHLcJBEK/XbQppjf2Mcs0vY01OzEY8mZJoEeRYHDh2yijtT+tFOmV4tFi0xd
	8bMT6w5Tpbej5Nw+Q2zLCbVUpDhvs1+5dO4I6aCxINQdAYTmvuH74DijrYQ78jSm
	1xFadpDXjYxwZ05eadgN8GkHVu2JbCRxyQP16KIDVfzvV+A6YHWKAIk7UWTP/B4d
	Cm5TQFV4ILMXtA5jZQiONPlzlu3PZzHfikCFmTYVBQ6JGqHHEHFBVG0R3zbkMbW9
	+dZPGw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a3eg5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 07:48:22 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1d7886cdso2722221cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 00:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784879301; x=1785484101; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=S8fCw66sBDcq5V/NLndGBeU8IzL3xvkcTV62wBOEuto9TlPHy1vU6G7pAMi7ysZREv
         EYvJchGnhnBb2NvFkG66fd0Gh6hvBQBmn17y7YVgTrj5NZAD/Q90OdYSyXjrKphhU+jl
         rvH9CMFkneMeWgWtmEdROHpN6oYz0HV6dd+ALUS+yJAtPxjeYGC9fFBB6X1JEfzpBy6E
         6v2h2wNUiBfBFSIlbXWU8abmakxuJeOF+cJriSPl4wcuBCerC7F+PR+i2xqiHMxQIrTv
         T0hihubQUQwu06nrgY2eR5GkPB8fL7FwYXYi1SK0KocWydZgMJzDh2Ui/15uX7+PKqPt
         zvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784879301; x=1785484101;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xw1CkDWjLhQVF/dM2ooBjoypzkFyoYlTxDKQRjStW5Y=;
        b=FwQ/Oz2k+P/ZIupjxgcokzTq6ZFUQXCka0NFHQhp4RZ0DkWCEr5zI/ubKD5K3FRcZ2
         Opsz4wJDrE+BnM63i9z3RMj3cMZcIXstwlT34UWQiXByhbnekezOK05s7A9h6SAua28v
         rR9YaQWJ2Ts9Q3OG6JUYjIzS/libRzn/v3WUoG/LtQyO1MFJ0H7HGylvnLsM/j/ox0UA
         yC4R9Ln8GftL7/ulrY+Q9DbDQoBr9uowFFgbhMC6ZI9wac4CTeb4VL4GY6yDC2b6PEQH
         UorIzzVRjxPc1oKCnKavcNfCSzZ9FN7uKpa8TXgw6fP+GMHb54eUtG3oqPuSIKVT9QZk
         uFxQ==
X-Forwarded-Encrypted: i=1; AHgh+RqQe1teTNTEsguijolGqpz9lLIm3uDLxqSqWP11YahOosFeHh6t2jyoI2xRPNGEurjx8BMI6112w4lKZEur@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4WwNwfblnzUnGaCUB18k5r7bwwcchVeL85b6iQIcHizAC7T6y
	CMd3RYo3ZBbjD9H6pH8DbuD6s5frlRXhYKTsaZy6HtFTEMIhblBZCvMzQ9bnaeon4BL9vPplmmn
	qFUo6LxVU4t0Hmmw9cLUphfkd8SQtcXyo/2eqtPrM5TXbqvTaGWDcH3vLKW/DC2s5qSPJDK/hxP
	Lc5bQ=
X-Gm-Gg: AR+sD11J/egaVunE8H0K6HnyUquOnuYa703gcyNvQCwbMNTGZ2V8wSyvAujhO+3YLeg
	Qp34xEDE3wWG8eJveUBOq3vpRI/2XPhg9R9g/Tp/zyVYXxt4AfDWRiK2E/P+afv8FM1ASqAABVc
	bBbF9xgHEZ2iBBMsQjLZ7OEVBoAxaDUmuLlnwqfYDyEHqzUjdDFsaL2M35y0tqCEPrrziazJvBD
	53XzRMKybZDxob0FpmzV3Ubf+VHpTU4eg37QVTra1vJTpiMOUWWDcaUC0Q31q6a7RZqw3vywQcE
	IPLIq30CyULVNsqMdbELXq/P9bZF5JMjGqaiIxfAEXxJqQImgTGTw16XiXriEgUl8NJiKEJQ/Jz
	fAN0SNZIX+91b1GenfHm4Whf2Dlgv57raTV+PphDTG8nSIj7r5zBH7KT18nDINwEKjwZrs4CP2X
	l1Ia54/v8DJYrYFcw/Iog6fM83ZgPBP0f6phGh+/jEvWBtj7m5ng==
X-Received: by 2002:a05:622a:1a8e:b0:51c:1590:8e13 with SMTP id d75a77b69052e-5283ddd1751mr62829291cf.4.1784879301689;
        Fri, 24 Jul 2026 00:48:21 -0700 (PDT)
X-Received: by 2002:a05:622a:1a8e:b0:51c:1590:8e13 with SMTP id d75a77b69052e-5283ddd1751mr62829231cf.4.1784879301298;
        Fri, 24 Jul 2026 00:48:21 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:48e:a2cc:6c4:c92a])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32a798a5sm320764566b.9.2026.07.24.00.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:48:20 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 09:48:16 +0200
Subject: [PATCH v7 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-monza-leds-v7-2-0125a3bfea98@oss.qualcomm.com>
References: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
In-Reply-To: <20260724-monza-leds-v7-0-0125a3bfea98@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfXwLmUvE2Rim0u
 Uu5IVRkkWeW3CQ6nWj5Hm7mVEn8gyqKDhjBYqesLmYGZiEde4oWj8PZaeOdh0TQ030QrFEuS0Ls
 ooKqLynDYGyKPDPbaSeFwCPtmXAW0PE/CSSn2IL8zbFVguDIFOxOmbYlQFAlIsdRVhNkSsVr9wK
 QMRqCyvCyW41OTzlahoazL5I7oTapkZ9oeR7rw3QIR5/r7hgMP/uljl4eIS8YGWlsm4Dt7UFFwO
 wEbVPDXjyPrXxdeOQS+BsT582BP1+ElOGkhHA5Omg1TVLWj3p03e67WguX4ffiDWT+/h40nhr1D
 8IwQlbgGAG2PtWGmwK004fvfMv//1rsbyqtaBYgpG1AkpFOqjomYIKpoAx9j8mtIXXh+QPv1qyr
 BGPT8c50XYxItV43XvOH2Fw0/Sgvi2yE1yaBSds+30kfYeChlgF6hRWlJVQ0qLORDQn44ByEjdK
 2JxXRCnU9RtMXKGtBWw==
X-Proofpoint-ORIG-GUID: eqLJgq6rb4P5BFwe4bbCChE87Bop8oqp
X-Proofpoint-GUID: eqLJgq6rb4P5BFwe4bbCChE87Bop8oqp
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a6318c6 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2OSBTYWx0ZWRfX0hd5O4wXGvZC
 MQ1OwXCseY+gKxvjEMlhuSMmTy5dZi8t+3MCRMB2ZfKLkJtyAXazlV7et4Zv6QgvSBlbCpn8F6x
 7FW4iDEgrQl7IfGbwRyXgq5eFhaXOts=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240069

Add support for grouping individual PCA963x channels into a multicolor
LED by introducing a multi-led@N node pattern. This follows the
convention established by other multicolor LED drivers such as
kinetic,ktd202x.

This is necessary to support and model hardware setups where multiple
PWM channels drive a single physical RGB LED.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/leds/nxp,pca963x.yaml      | 96 +++++++++++++++++++++-
 1 file changed, 94 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
index 4fda602912f7a9443b8a77e46bc015e244f82e08..eccf37de51285a0dc6d28ffaba2d47a9f93d867f 100644
--- a/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
+++ b/Documentation/devicetree/bindings/leds/nxp,pca963x.yaml
@@ -74,6 +74,40 @@ patternProperties:
     required:
       - reg
 
+  "^multi-led@[0-9a-f]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        maximum: 15
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[0-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            maximum: 15
+
+        required:
+          - reg
+          - color
+
+    required:
+      - reg
+      - "#address-cells"
+      - "#size-cells"
+
 allOf:
   - if:
       properties:
@@ -84,10 +118,16 @@ allOf:
               - nxp,pca9633
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 3
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 3
   - if:
       properties:
         compatible:
@@ -96,10 +136,16 @@ allOf:
               - nxp,pca9634
     then:
       patternProperties:
-        "^led@[0-9a-f]+$":
+        "^.*led@[0-9a-f]$":
           properties:
             reg:
               maximum: 7
+        "^multi-led@[0-9a-f]$":
+          patternProperties:
+            "^led@[0-9a-f]$":
+              properties:
+                reg:
+                  maximum: 7
 
 additionalProperties: false
 
@@ -143,4 +189,50 @@ examples:
         };
     };
 
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@62 {
+            compatible = "nxp,pca9633";
+            reg = <0x62>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            /* Three channels controlling one RGB LED */
+            multi-led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RGB>;
+                    function = LED_FUNCTION_STATUS;
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    led@0 {
+                            reg = <0>;
+                            color = <LED_COLOR_ID_RED>;
+                    };
+
+                    led@1 {
+                            reg = <1>;
+                            color = <LED_COLOR_ID_GREEN>;
+                    };
+
+                    led@2 {
+                            reg = <2>;
+                            color = <LED_COLOR_ID_BLUE>;
+                    };
+            };
+
+            /* Remaining channel used as a plain white LED */
+            led@3 {
+                    reg = <3>;
+                    color = <LED_COLOR_ID_WHITE>;
+                    function = LED_FUNCTION_STATUS;
+            };
+        };
+    };
+
 ...

-- 
2.34.1

