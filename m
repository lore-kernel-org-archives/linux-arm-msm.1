Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2810367287
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 04:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788325194; cv=none; b=ESXd77fDYVimLdGruynP6MUZtG34wvPn4aYTguxexuTvEwnL48wzoDz4yGjy9LXH7/wVSyuPrbACENo3+6DonPiGXU6HbS7aRVg8ZISbUjgTznuM8S9SSDiruczjDSWAzTRpS3lrZS64XF8mYVoyzyYtEvJCdPIFPypvQ4Ehd/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788325194; c=relaxed/simple;
	bh=mL4UmJWXh0YmJ40NhOn8YczxVlIF2tdm50qSEcaXgfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G41fDA9riraOWpeMMcN42LCravx/rn7HZ3lVt3Lu4HzlcHPZ+bh1jsemz/5qatMVWgis0go53Q8jgQ3sn8dYuV2trE9el8vj9E81hU12+kF13y+1PRWCcphLouzzd4sR537tbc8iZm1QOLsnG9y1BIjxBidkYoSW4FBHK4GdGcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G6sa23My; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RI4mXQTB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G6sa23My";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RI4mXQTB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 681KTVuZ3485563
	for <linux-arm-msm@vger.kernel.org>; Wed, 2 Sep 2026 04:59:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yScyxKkUm3X
	/6/JPO3S7l+BZlKIqKpxmH9+HjsGbuV0=; b=G6sa23MyqnoTp8bEBtj5fnUYjXX
	RVkShYrP8Qfpl8rt/xNYaho8TIO9aBqPEiXpipHddEfGexOYRLue9LplRku0XH8G
	Vf1+n/3zN99FsWUZKjU8OQdk/0/yCV7kCW/9OSn2qj6RReNj8I4pDHFHS5gXQRuy
	hAQGs7XW209GjZAiPpNMP275tSwTLFaz7Tngf2S74OiCvQsCsoWanMnxMAuBk1Jf
	heqpjDKYyzsBRQxKX4HBbFijy7uHS+IeKg/r5tkdrTiES9dmgyATpixF3ALrxwxW
	JxpHuCWlskRSrdS/k2p3lg7UL4eNIDiMPX2Jf9FKB4zbw2pZpVa7rAE1KQA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ge435swse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 04:59:51 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc1eb205d31so979969a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 21:59:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788325190; x=1788929990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yScyxKkUm3X/6/JPO3S7l+BZlKIqKpxmH9+HjsGbuV0=;
        b=RI4mXQTB6pqFBIU9VkOq7QTlkaW2Cr+iVSS4Sg7rgN7Anp5r/IdRXVrPd8Lifp08SQ
         NLDpXT/6PCehHAmfWDkWW8laSYgE0VQhogOmLdyTHUhhmWta658oCRK6Y+/93qVfYsff
         y8rAGKGEcQIhEiys50ZSNFp3DhvmS1/Hgn0NkAxY2jf+Zas5SBa6M4pUVwEA8CMynJ8l
         8iOHW1Wz6fMpc7UW5VHT5BnNZumKJXZ1qi5TItkjdldJYqhgWHIO3WYFETlVcaXWilPT
         6sTmEkmsawDrvX7svY+WXRYiALLlgjODoeGO52YcEVnLPSgIu6zDFkHcWHWMtBYfwoy1
         DjiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788325190; x=1788929990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yScyxKkUm3X/6/JPO3S7l+BZlKIqKpxmH9+HjsGbuV0=;
        b=AfXbdmF9QvhKm9/f2s11nBZxxBl6SH4d5NZlTUenRg/5LI0d/LQXSD9YfMKn1/ueuk
         H1rXqxmh1Wv1i4Kcj6Y7MvfFbz7ZzvJXEQtOe1lMrBiLi7GqsuLuNHwhGTt3QA1AA0nB
         SAwX/vecWkVs6jkGARPXMTndjH8zE0gVS48l9ounvqg+gMamBX1fBpN3hJBOxASl97VH
         6sXlq7I9K3Y/ZI+e0aEkPYrL3Wz/vw/Onaij4Y6Boi32MBuUY2rRNmvAmHjGdM27b2Ge
         SUXabADNq508VhKP3VCLO40R36TZwAvjT1UAVaKYbEN4ueF0bhLrT98pgiQ3pGCkpZm9
         jZkg==
X-Forwarded-Encrypted: i=1; AHgh+Rqxsi/neYYeCDY/eWbDyNgFR8FyJjJMztHONT7ZPeVSbHrQPXEWa2nUWfT9g1m6VUqkVAmRq6ph0e80hSb2@vger.kernel.org
X-Gm-Message-State: AFuF++mQhHVJA8vJhchUS9xszIOURgOkcZ2F2Jj7EMsENWaLxFzijlM9
	vLza02WziSsT4tGgFEDY2uoUPa/T5dKuoO4R92vmlSoMTPZn8qDYu/hHFO1BKHiMYs6ZV1NtsEu
	OGG6fySta9PXfJnHx8v5Y3x/VQNRmCuI3Iit2pLnGh33p6oBnRDCimYyLEW7RNMN1RKAc
X-Gm-Gg: AR+sD132sbYIk/GmFgDdBt1mxrLdyBVofh5AyJFkkso+5QDLqTqQVNj+6R2GYAeMLBb
	gUQE8DrqDKpKWl19NbthNrXSrFD6Kycomaj6XMZCoKt6hfpJTQFuqqVq+JwACgJ5JMhqcEwiOKM
	DQ3PsTpci+8t6trTq5Xhal0OQLG3kD5du2epj0fkYLSShP3Fi+lUu3M+tApvPZfN/49bpUJqiPi
	+abzH9jn9sbvek8x/PJ1e2cnDTpjNtSOuGiWLenYNipBoKMtFeqLLRRKUi93z+ahY9/N+8ZVXtz
	AKPUN/asXSijhqA4zzzf7evVf1xYDI+3zpGrDRqFTIaIMHlW4UTpCh0+z0W8RcGFtmQDAjF29MK
	kDIVDy5rEFK7MBfmIG8d74g4Jy4kYxCUIJspb5j2wjA4q4B7a/Rp6IEZcV9FO
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr3457128637.1.1788325190372;
        Tue, 01 Sep 2026 21:59:50 -0700 (PDT)
X-Received: by 2002:a05:6a20:1611:b0:3cc:f008:8125 with SMTP id adf61e73a8af0-3d9ad9a7feamr3457086637.1.1788325189953;
        Tue, 01 Sep 2026 21:59:49 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1430ea31f1esm2782639c88.8.2026.09.01.21.59.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 21:59:49 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Wed,  2 Sep 2026 12:59:37 +0800
Message-ID: <20260902045938.184221-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
References: <20260902045938.184221-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX96W4/VYdJZSQ
 kB+AP0fe10WjxizkdAe6MqzfwqASCvkK6KngMQ3rpVKX9q+ZaviVLzffRQS3KvYzz8qwhN4+qJJ
 1kfrXTxn2bhvRef9+TOfobWT8yiovZdNTA9pkkcVyAn124XdeiL1AtYqsANL57gqFDp/iuEI5hi
 T7EF0lXO5rx3sebQjzPAin/lOHhIokabWMnAU+jNrgby39oPxp2CmE2ejk/lyPzlddY/WLXrt5P
 B+5f+EFgWyb3RRCe8SQB1ZeAmaFXj5vLC34xv5JYBpzMQdNNbW61kA/Y+/ONCwDHJV7vAPrOnGW
 wm04d7j5mrMwtgEiLNFTXwIvIKuaoN49SzhPvBt8SjoVvICsqCOMJM7ZfwOwwnGNvsKiEIK1ECl
 DysQIPWBx3tL3gsjYjrxHYznUFHjYEFS58NwwpEC75bxtkk3m1EMpKAVLEoL7dA2Yq5PB6dQ2Os
 C/x4VEYOECKM8QWQ+IA==
X-Proofpoint-GUID: ND1Li6_1FF7Z3T6xP_LtHn3BxBT7BlNN
X-Proofpoint-ORIG-GUID: ND1Li6_1FF7Z3T6xP_LtHn3BxBT7BlNN
X-Authority-Analysis: v=2.4 cv=JpnBas4C c=1 sm=1 tr=0 ts=6a97ad47 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=3WC7DwWrALyhR5TkjVHa:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAyMDA0MiBTYWx0ZWRfX7DrHOGumt8zi
 Um05tlBMGf9iJP3i1zTFKzJDcMlBRauZVO4KJQHcrD0NewktyzKDjoIDpVZCkwTKcKDnxOdRwjh
 vwJ2Pr7PE+I+jrEIi/FlcGJK4KvAwIs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_06,2026-09-01_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609020042

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Assisted-by: LLM
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/usb/onnn,fusb15201.yaml          | 152 ++++++++++++++++++
 1 file changed, 152 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml

diff --git a/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
new file mode 100644
index 000000000000..09f2e964d3ef
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
@@ -0,0 +1,152 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/onnn,fusb15201.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: onsemi FUSB15201 dual-port Type-C and Power Delivery controller
+
+maintainers:
+  - Shawn Guo <shengchao.guo@oss.qualcomm.com>
+
+description:
+  The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
+  controller. It runs the Type-C state machine and the Power Delivery policy
+  engine on an integrated microcontroller, so the host is not involved in
+  Power Delivery messaging. Over I2C it reports the attach state, CC
+  orientation, data and power roles, faults and the VBUS voltage of each of
+  its two ports, and accepts commands to initiate data and power role swaps.
+
+  The two ports are described as connector child nodes, addressed 0 for port A
+  and 1 for port B. A board that wires up only one of the two ports describes
+  only the corresponding connector.
+
+properties:
+  compatible:
+    const: onnn,fusb15201
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+    description:
+      Interrupt line shared by both ports, driven by the I2C_INT pin. The pin
+      is active low and stays asserted until every pending interrupt has been
+      cleared, so it has to be described as level triggered.
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
+patternProperties:
+  '^connector@[01]$':
+    type: object
+    $ref: /schemas/connector/usb-connector.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      compatible:
+        const: usb-c-connector
+
+      reg:
+        maximum: 1
+        description:
+          0 for port A, 1 for port B.
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - '#address-cells'
+  - '#size-cells'
+
+anyOf:
+  - required: [connector@0]
+  - required: [connector@1]
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        typec@50 {
+            compatible = "onnn,fusb15201";
+            reg = <0x50>;
+            interrupts-extended = <&pmic_gpios 8 IRQ_TYPE_LEVEL_LOW>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            connector@0 {
+                compatible = "usb-c-connector";
+                reg = <0>;
+                label = "USB-C0";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_0_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+
+            connector@1 {
+                compatible = "usb-c-connector";
+                reg = <1>;
+                label = "USB-C1";
+                power-role = "dual";
+                data-role = "dual";
+                try-power-role = "sink";
+
+                ports {
+                    #address-cells = <1>;
+                    #size-cells = <0>;
+
+                    port@0 {
+                        reg = <0>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_dwc3_hs>;
+                        };
+                    };
+
+                    port@1 {
+                        reg = <1>;
+
+                        endpoint {
+                            remote-endpoint = <&usb_1_qmpphy_ss>;
+                        };
+                    };
+                };
+            };
+        };
+    };
+...
-- 
2.43.0

