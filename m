Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E3A30C360
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161503; cv=none; b=IKYoMkTKnehdK0di0cO/u8Eec+K3bKLlYaskBj8h+ox15zmH3V/7fGLIFzeVf5Sl6+qeAX/S5/u8kzF/P6lbz4f5usUryPbjeLIXDl6CY+bd/+kZ5b2/RcRs+3rSXYMJ1oHwjnw2KKJDcVHq/DVE7MBpT67l7SFZKvMQG3HcHFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161503; c=relaxed/simple;
	bh=HW5o+7T8MhG/dED5+pmSN9kenQTmcJHxIQAMKcoKkwI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F/nE/uSpI9tP4AnYhKUDHB/Le79vr1/x5jrgczmU1eKOatco2qbEtt0F5B/kLcrTDR9E49mVQm/iJJdcR1KknhIiUA0YTQXSVyy32ZaytjEnGKFwVhb9N2xDsSZ01TWaEX35wAqJ/3x54vW1kCXNpKrvRL0rBo9MvJWwUIp95Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BLEQJvpB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kwqcGDjp; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BLEQJvpB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kwqcGDjp"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlaEV3905443
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Pq5KynjG+h3dOD+hNCrGLWYcr2Zxu6lNDSIRze/ZJeo=; b=BLEQJvpBRT3uJD/H
	ikz+og37OcjmaFCUb/fuzYUd4PCf35IWO0kQHT7BqE8FLt1MSaA1Azr0c08IOoPq
	gXHpH0ZRUxRsh9fta3wlW0JSFOHabhOQH5MynNxwfR9tJ9cTV7o1oupINAd7Mgez
	V2K7hp9sIWdVDezZL/PoI3RXVMD9LnBrZ0bDKr7cQEc6wyIZ0/jNOqla0iWx5Et/
	YdTFKFairL/RCe8L5Htae+0rOw+qZZBFxlJJlAZboblWw+w8Wd3OSJ4r2jAM26TE
	l/gvXKFZqUZV4jzJ5Oe9TPPsrkjFBvRowVJxRPBL37vMCFM2vfQaCZM8Dm0m1DS5
	lLxpUA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fp4uks0w2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:11:40 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so6756134a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161499; x=1785766299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pq5KynjG+h3dOD+hNCrGLWYcr2Zxu6lNDSIRze/ZJeo=;
        b=kwqcGDjpOkbeAhjuzzmV2T98WGmfr3QntKKVQrJmyhYhUt+Dlp1co12BY/DOC7SpbK
         9FugsTFmUS0Rrnt0uUP7qUeTPn8Usa44aOFTHpqz5WiYfy5dmxzRrwX+FKO/KJlmX3G7
         L4Fi1MDzuWLBApGhDQSLRopaSgBmD5fFxK3mwSP84IdQC2LkbSqYpH9kXNsx2g98VAm1
         BTYjr/DEqje5hB803tQGHQ+N3UJv449aurvH+PVrvgcX25kAlE6eiOyz8Vda1xYJzD8d
         AmVDPBCp6/asbLHMJPadbX9J7NiCUJkfi3TMlkc0+ZLsI/Lzr7kgaEJzdFObbp+o7E5F
         Nyjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161499; x=1785766299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pq5KynjG+h3dOD+hNCrGLWYcr2Zxu6lNDSIRze/ZJeo=;
        b=STqtRhd6LbyYq7WrGIK51AbUrN44hrO4t+DmUIdomFCnrSfAECqSYuysSDfsAHaldI
         wLsW+vSiecWBrtXA1qKywo1tp+NaQKklPuuE/701UBPdC52lfjRaMniBPvD6BEZwubTd
         V4uh9jPXGDf5nV46AZkbMgrg5ykrrqJxUGNWMLwlJoZmmuaX61yNW79PQV0MLvkg96wC
         ptzHdJh/yjMg3cA/1s7cRl6Gh7037b0lJg6RQdKyThNfdZDaN8TfFr2zkh92FZoDnvfq
         y0bFupVLUoTqbSqvH0E3Pgmw/kj+/fORTeZ9+vf7363f9zorslPzJkurWnLqzojev8+g
         Wwwg==
X-Forwarded-Encrypted: i=1; AHgh+Ro88tszoFKHx95xcd0fEKUQjrKRW/AlCIf8k6ibdBz7yqbCWH/geeNWEjdGXeJb/UP+xGaQy6BLdO1gqMS5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywfiy3bxhaT3RlDfLLO9JpRqUQ9flmfzt4kXpDqhD8BQjTtXS4/
	sTLklbyfhdxHgswo2Mp6Z+TCA9ybPYK0U4Ru/JeoVzRX7nN4w+JNLJJeQgPlIRQoZ8lpS7X3yyb
	C7Wmr6KhIgdgTxscBT3Ef0Kn/jVWmkxDbJwrwKL2d2qkefIG/GxHLEW7E8tbkiyh5QzDwFucJZV
	hI
X-Gm-Gg: AR+sD13NyUtR6/5TQodyeySoycJMbjheTyPXxYj5ddoZqVI5kC1E4+80xMJ3+7wi67d
	U/1OeAVDSlwKvEWi+ToaSM8dp80e1ox+QSYgaoFp9DrovM1eJnVD91fbUSnGilzXleG4x16Gv52
	fZi//jSgYoF5r6Mre7BiTMpxyaQG3bz/7yz2yY4s6+W1sZx44KBpMSFodQUvCbIu3d7xb9GEDwD
	pbk4EQ76TZYlbVA2E5aoyYP9AV+rXRyJsbGnyjlbVlt5ur/lowq8DGttZUTpl3X5eW0NywpRBhr
	YFC8PRbHwsPpi1O7fhWd0kvjXragQtDb7COmdOTdZwMCir7EHn//i5OG906NNrB03CDTiM0unu6
	quhO2ffnyRyOoxOqJrgqxZ5JLplA/uq0=
X-Received: by 2002:a05:6a20:d50b:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c67e0b1d30mr8680634637.74.1785161499458;
        Mon, 27 Jul 2026 07:11:39 -0700 (PDT)
X-Received: by 2002:a05:6a20:d50b:b0:3c0:9c1b:d0bf with SMTP id adf61e73a8af0-3c67e0b1d30mr8680592637.74.1785161499048;
        Mon, 27 Jul 2026 07:11:39 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm53438677eec.13.2026.07.27.07.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:11:38 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:40:57 +0530
Subject: [PATCH 1/6] dt-bindings: ptp: Document the TSCSS on Qualcomm
 Lemans and Monaco SoCs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-tscss-v1-1-beed14e72510@oss.qualcomm.com>
References: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
In-Reply-To: <20260727-tscss-v1-0-beed14e72510@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: _0RirsafScD0u0S73733XJbWxrUifMLF
X-Proofpoint-ORIG-GUID: _0RirsafScD0u0S73733XJbWxrUifMLF
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX/G01TuYJMTkF
 1xQBtPUMV7kA02EK4ehihlRPklP2jVSDB7h2xR7jNXpKnMZbw5kLnSU7T5eZ8+ofALKdUyR9eyX
 OomxlwD8+9QzS7LiA7TYBIZ169H8Zos=
X-Authority-Analysis: v=2.4 cv=PeHPQChd c=1 sm=1 tr=0 ts=6a67671c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=LvIppRi0fLrXIX5vxKMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfXyJgEm8HHghSK
 Mnhf2lgW/f4obk1gwl9h68GwUdNeIK57HUVkDu3nVzWv5PNIJA1+0XKWzPqzLQsP0/6JoAjK0rB
 jh/Y4osm6OzXbvVhby3MFkFSgIC4ufZ0/cgikTabldQ2pjt4O6tfhHuiywR1pAWWcxlnRSNykdD
 iLb1d1vby6LxgbPoeZ8hLbL11MUBhvZythg5CB9v9C55YSjt5KUg/ogR87dWXI8LiM1gEucfmvL
 UfRnAQ2GGXsUkHIS5ceC4DYpmxf0+yXBjK87ik6VCfppgGqz9RjVYVv0jkaRxl7rwzMMQ4+sEI+
 eicplcmjrIOS+o4ldIr2ZXWk3mjvTlryHTzBZKA/nAKsWlbxDb6AcdLDlQo5ktsAFwv+6mDvm35
 eBPh13AbaqtnF3LPrF5vlXjzva6f/dIZ30kB9C7WnXOVcZ+ncDKAoYFBxKMGYC8ygyXkDbsHvwU
 SE2jPXtopCI+Lse9kjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270135

Add Devicetree bindings for the Timestamp Counter Subsystem (TSCSS) found
on Qualcomm Lemans and Monaco SoCs.

TSCSS is a time synchronization subsystem composed of two main blocks:
Timestamp Counter (TSC) and Event Timestamp Unit (ETU). The TSC block
provides a continuously running counter used for timekeeping, while the
ETU captures timestamps for external hardware event triggers.

Co-developed-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../devicetree/bindings/ptp/qcom,lemans-tscss.yaml | 198 +++++++++++++++++++++
 1 file changed, 198 insertions(+)

diff --git a/Documentation/devicetree/bindings/ptp/qcom,lemans-tscss.yaml b/Documentation/devicetree/bindings/ptp/qcom,lemans-tscss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..4cbe4b00ff7dcacbd8cc111e2b4b61ebce7104aa
--- /dev/null
+++ b/Documentation/devicetree/bindings/ptp/qcom,lemans-tscss.yaml
@@ -0,0 +1,198 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ptp/qcom,lemans-tscss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Timestamp Counter Subsystem (TSCSS) on Qualcomm Lemans and Monaco SoCs
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TSCSS is a time synchronization subsystem composed of two main
+  blocks - the Time Stamp Counter (TSC) and the Event Timestamp Unit (ETU).
+
+  The TSC block is a timestamp generator that maintains a running counter used
+  for system timekeeping, and is functional with just the AHB and counter
+  clocks.
+  The ETU block is optional and captures TSC timestamps for external
+  hardware events, each ETU slice binding a slice identifier to an external
+  event selector. Support for the ETU block requires the additional ETU
+  clock along with the summary interrupt and slice subnodes.
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,lemans-tscss
+      - items:
+          - const: qcom,monaco-tscss
+          - const: qcom,lemans-tscss
+
+  reg:
+    maxItems: 1
+
+  reg-names:
+    items:
+      - const: tsc
+
+  clocks:
+    minItems: 2
+    items:
+      - description: TSC AHB configuration clock.
+      - description: TSC global counter clock.
+      - description: TSC ETU clock.
+
+  clock-names:
+    minItems: 2
+    items:
+      - const: ahb
+      - const: cntr
+      - const: etu
+
+  interrupts:
+    description: Summary interrupt raised based on external event for any of the ETU slices.
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: etu_summary
+
+  assigned-clocks: true
+  assigned-clock-rates: true
+
+  "#address-cells":
+    const: 2
+
+  "#size-cells":
+    const: 2
+
+  ranges: true
+
+patternProperties:
+  "^etu-slice@[0-9a-f]+$":
+    type: object
+    description: ETU slice configuration
+    properties:
+      reg:
+        maxItems: 1
+
+      pinctrl-0: true
+
+      pinctrl-names:
+        items:
+          - const: default
+
+      qcom,etu-event-sel:
+        description: Event selection value for this slice.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+      qcom,etu-slice:
+        description: ETU slice identifier.
+        $ref: /schemas/types.yaml#/definitions/uint32
+
+    required:
+      - reg
+      - qcom,etu-event-sel
+      - qcom,etu-slice
+      - pinctrl-0
+      - pinctrl-names
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+allOf:
+  - if:
+      properties:
+        clock-names:
+          contains:
+            const: etu
+    then:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+      required:
+        - interrupts
+        - interrupt-names
+        - "#address-cells"
+        - "#size-cells"
+        - ranges
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      tscss@1c80000 {
+        compatible = "qcom,lemans-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>;
+        reg-names = "tsc";
+
+        clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+                 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+        clock-names = "ahb", "cntr";
+
+        assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>;
+        assigned-clock-rates = <15625000>;
+      };
+    };
+
+  - |
+    #include <dt-bindings/clock/qcom,sa8775p-gcc.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      tscss@1c80000 {
+        compatible = "qcom,lemans-tscss";
+        reg = <0x0 0x01c80000 0x0 0x2000>;
+        reg-names = "tsc";
+        #address-cells = <2>;
+        #size-cells = <2>;
+        ranges;
+
+        clocks = <&gcc GCC_TSCSS_AHB_CLK>,
+                 <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+                 <&gcc GCC_TSCSS_ETU_CLK>;
+        clock-names = "ahb", "cntr", "etu";
+
+        assigned-clocks = <&gcc GCC_TSCSS_GLOBAL_CNTR_CLK>,
+                          <&gcc GCC_TSCSS_ETU_CLK>;
+        assigned-clock-rates = <15625000>, <15625000>;
+
+        interrupts = <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "etu_summary";
+
+        etu-slice@1c91000 {
+          reg = <0x0 0x01c91000 0x0 0x1000>;
+          pinctrl-0 = <&cci_timer0>;
+          pinctrl-names = "default";
+          qcom,etu-event-sel = <1>;
+          qcom,etu-slice = <1>;
+        };
+
+        etu-slice@1c92000 {
+          reg = <0x0 0x01c92000 0x0 0x1000>;
+          pinctrl-0 = <&cci_timer1>;
+          pinctrl-names = "default";
+          qcom,etu-event-sel = <2>;
+          qcom,etu-slice = <2>;
+        };
+      };
+    };
+...

-- 
2.34.1

