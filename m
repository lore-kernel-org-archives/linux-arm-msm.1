Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602BB41A56A
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785164083; cv=none; b=BILsX1TCvaoNgasuc607IfJ9JFQNngUUHVjbbZTLfKWB5sxeeasWSHrzPKXSRYLu0yTLQdU275+vYWejOrolBg3BsGPlQgxgKDf67ax5+rAyBZJwKbQDt3mlv1ZFFOCljY04X/2uC3PKL+An8BIPn+wLdpJQdW4cLKCEuuqTsxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785164083; c=relaxed/simple;
	bh=g/zrKQ160WAN70Bn262Z+bN1bqh0zhUIFpg0ryQ9x6g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Akbr9Pvx9I40PaGVhnvB+vhug5+ouM82NMBcw+/mWsTSLgd67KjMnM96oylB5XBUrO7BVT5DM+nZSRZkj0xG1hYHaVN8BhsE5Tg9cijdrMxS4dh6EjA1kcTuA4ioFEZBpHk7hHy80Pq3grxgRNVVJWWk5mHLlS5/EP4GNjCfdVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/JrSdm6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IkUGdVhd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/JrSdm6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IkUGdVhd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlsJ23787481
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8HthprQpSRunL9egCyfFegD4fPnR+j4G6f446WVy6Xs=; b=X/JrSdm602KYjvc+
	L9nVa1fERvz8MBaC8z0gTOMiI+CpTol8c1b+TZQPm24+itLBVZMgNy87NxyEZARv
	BeVQOzcNdAxyOaDDWJuKeBw2BIYFRU1Lm4soNBFTBqg90fznPuigZZ2dgbWKzXHB
	W4anzbJM86e6IxxVBRblwH/cD+cyNYWIeCTd1Md1Ktace2qQP0NFASV1EJsgM9Uh
	/BBCxT4gDB7bQixCitHugN9iLpknssjiZKtju1/6/ksbPiTadanpsunDgj60MITs
	helmat18vZXUTKgJ3odYzNoSaV9hvoSAX2nbPDiCsdjZ7tcRJu1BxeBaqaag7wat
	pX9S7w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp3v2hg5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:54:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52769fc3f2eso34422331cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785164081; x=1785768881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8HthprQpSRunL9egCyfFegD4fPnR+j4G6f446WVy6Xs=;
        b=IkUGdVhdhKSjvBA8FbiJXiv/cI7cBfEswuDFgioX9Q5klrhX7hf5IxEjO0RiBTguzY
         3mdK6hvTU76wohWQ2vHTb0v9WuJT5Zc4wFmtqNqlt7X0qa8M9jU58xsfQ2z+6dkdkY3T
         vhKm3spyu/qdCDmMo7q0qOpOjLnvR4FaqBpyvZXJXVPe0BqcZ5ZC4rAYSc7XCk/D16gl
         bUZJJgGnwmDnFzT1DJVmCsLV5qPiKccro4vWtdIlKBsg94B6QwHyHk0q2vSRKsG//FX9
         9amwHHNNbVYRU/aUiB3Fr2wFgQM00HxZWuBGDlhNwK11Icc01U//GJUsbje7N19KFils
         L1Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164081; x=1785768881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8HthprQpSRunL9egCyfFegD4fPnR+j4G6f446WVy6Xs=;
        b=OQDNlJFl1NZjWqvlw4XAORgEq3JaCMUHPwunDhFaoiL1WV2olSFaGNa5ilQSxfBdPb
         KbeiNUiEGUUrTpOJQbsodFD+mMRwCKaL83TJzjF/8rtRqjCVhTIklw8ZFE729Fh695LU
         f+fNymwndK1n27OP50IAGSduvj1OUiBTCUEZKgqLKtKsG610qEsYhYVtxg94/O4W+3aY
         mC15MuU3l2qBSIYRMqssTJ3KS2QjBY4+dmU4t7DNmF2K1b8iib9fVsiVpZYENSTLPJZE
         HIn3Is8tZLTIhoQVIWmZceRkfhoAZw+rUWjfDuOxj1WgTTqsOqa11JIm802+F9pVhzIC
         2BNQ==
X-Forwarded-Encrypted: i=1; AHgh+RrY8g6jiIpgQL5vtJVDM29D6sDvXjc7Gceap5JxklxtflTaHcybVJpaw4/uoujMQs8Kl/DXW5V9Li28/9sT@vger.kernel.org
X-Gm-Message-State: AOJu0YyTfoxLvqHVJqEclWAYbyuRbdy6PlJKEDeu6RuqVkfUaxzBRhhH
	V+0ULNYaB75jno5/GbXW0sID4+x+WHL8Bqx0tXLgG+T6cVzzFvn3OqeYwS3vaVBg1RLHUAgkv56
	A8d8567gWUJ3lj5mKf0CdualzqFSC2Wy06IfKTscV6q8CN7/8SLvEZU8VA/B1jkYuc0WD
X-Gm-Gg: AR+sD1295HQcjoyrQlfAIn6AshVlL+JaU7NmX0IQ6KEHp/glv57Hp/zU24UnKyWf3oT
	GUVPXTpUVWzNu1sNyUm/1mMJ9Bk0Q4kmQHi4QowEA/suONGBDT0GyzPDAcp8IhbFacI7nutMW+Z
	S+0+hxFYCSFgDGKvJhhQDP1a0UYa3sVzvMQhwAFKO9RPCbsrcIfCnaZJ1Yo2rJtkQ8/SDcfin9W
	6atqTEooLot14Go0ScyBfXnKmcRkuhzM5nnkTUUlRHar68R5Y2rYwnttM6CFFxxyPscYYF+dtwj
	GTDPlvsBQDVMn/7XDY3pgNNrGvz/S9qP18bWlounzlRSMy59dT/hwM0ezqZAxEWgR3NfntRhiyc
	vuLTBN4R/lraVw5Vma3Tsx2juG/He9U0p1rvOwVomVnRj8xUymoQq+pnq6I/gYldhklhOixaqfa
	k4PrSO7H0uHW3XRAfTwt0pi37/qXbAesWpHnQMZI+6c5NYzuUyzAq5
X-Received: by 2002:a05:622a:112:b0:527:7dda:ee5d with SMTP id d75a77b69052e-529a86e7bfcmr85593411cf.57.1785164080588;
        Mon, 27 Jul 2026 07:54:40 -0700 (PDT)
X-Received: by 2002:a05:622a:112:b0:527:7dda:ee5d with SMTP id d75a77b69052e-529a86e7bfcmr85592931cf.57.1785164079935;
        Mon, 27 Jul 2026 07:54:39 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69fb594622asm3027582a12.26.2026.07.27.07.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:54:39 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 16:54:34 +0200
Subject: [PATCH v8 2/4] dt-bindings: leds: nxp,pca963x: add multicolor LED
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-monza-leds-v8-2-6e7e93d44dba@oss.qualcomm.com>
References: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
In-Reply-To: <20260727-monza-leds-v8-0-6e7e93d44dba@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX+7tvYoWOvUcC
 dE/dqQyMeshihexeVg7Mx2X67b0gyG5gS8LULl2b3L40tW0XWCiyctumGiHLHTN8W5q+3XdGRz1
 8l9QvT/YZw4gbKBv1SO5S74K9/BJZqk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDE0MCBTYWx0ZWRfX8OtG8/nSkVn1
 aTlmt0ay9lMOoe3ItNo2cwqcXmHIUBrG/Y/Ko6lc4FrvcnE+0IOWxGdW6N7iucpgt+YbG7np34N
 JQJBN1dUGI0q/9rbHpAAxJ6da9lBW9v3Tk1Ae+IC8/sU9RyzjdheSCd/CkL2ilGCI+Ff6Ib5vnz
 USntcClXIAwAGEzFgJadyPLlF/5wd7/YudxC6UZFo82JjVGQSoy21Yw3NkQFtnFJ57hyrVq2QRs
 t86HVVvChawiAXDyoGz3HOH75NHwej832ZBCLjomFx8aT+6h0X76DaJVpdLd1Oag3mtOA1nBH1Q
 ZPPY2Gx5rIm1lmYhbVoRbD0YkiWPv1QQw6BGCONLxfXQNFjk4HFuaob9D5kPh55zHgYIbFXvi5d
 sUVqk2mkurtjIZ44/q6KubkLB2O7V4TV8MPheO7KhZl9UpRbFWeLgYn6WwpiP9UYS58ATXMg0y7
 P3g5oJyxxcbEMg1EWcw==
X-Proofpoint-GUID: RfPeGNSmjQpS91J_6nKlBM0f2wQo1ekA
X-Authority-Analysis: v=2.4 cv=KJ9qylFo c=1 sm=1 tr=0 ts=6a677131 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=XYAwZIGsAAAA:8
 a=EUspDBNiAAAA:8 a=OnDUQqxwl_I-XVlDrPYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-ORIG-GUID: RfPeGNSmjQpS91J_6nKlBM0f2wQo1ekA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270140

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
index 4fda602912f7a9443b8a77e46bc015e244f82e08..a16ca11f630b00325a07940d9cd2f8f47cced73b 100644
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
+                reg = <0>;
+                color = <LED_COLOR_ID_RGB>;
+                function = LED_FUNCTION_STATUS;
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                led@0 {
+                    reg = <0>;
+                    color = <LED_COLOR_ID_RED>;
+                };
+
+                led@1 {
+                    reg = <1>;
+                    color = <LED_COLOR_ID_GREEN>;
+                };
+
+                led@2 {
+                    reg = <2>;
+                    color = <LED_COLOR_ID_BLUE>;
+                };
+            };
+
+            /* Remaining channel used as a plain white LED */
+            led@3 {
+                reg = <3>;
+                color = <LED_COLOR_ID_WHITE>;
+                function = LED_FUNCTION_STATUS;
+            };
+        };
+    };
+
 ...

-- 
2.34.1

