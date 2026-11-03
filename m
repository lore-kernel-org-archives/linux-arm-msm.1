Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679511;
	b=49/ewWiT7ULQH9DYYuxXqC7JkkIUAAdgwPv24rUIzBxqV2YL9aA47VJD+YqM7dYClv4x
	 9ZvJDeaYjrsqVyDelK5lfydZe/f+OJvmv2R5YIgpsLeGuEbfGjHxmjeP9a5L0pljKiA0d
	 jMiutZdTLGy75q8Hj6eLjEXGNBRdhyQvLUCn9yO0TG5ZNI8nTcYMo+QYzg++k87w6u9sF
	 ELbFc10wttzyI2WQp6phcZsc03Rj0n4c8cUccQApu5zvkvMwHH5yY8jRdQIgr9lYytZ+b
	 DHZDRnusZgokGdDYAdp3+Cy3H+L+IW54zKl+y58hVVPL982FkSpQmSvnZmOMDQs/lkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679511;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
	b=YwgPO4+pZJiWxipMjPFlTpFJD59J8nmtDoM25+0oOxzqT+O9UCTXVO5lxKFHUy9KJagG
	 zHRsWzxjcIczZzzMy7j+ctDKtpIYdINGJVjEtWHKdcaMKhG/dpX+wDghFqPD4jJS/p7Mb
	 lIPgPewucN44JYbPbsRjNVrvNC9Aeo8Xbr4I5YSkYHknUEGVOEeY/Adjzhv4m7UEMPyRL
	 1dHeMQyeTmB66XWTh4ZGlJ2uTU65BX9eZPoA8sq2ZEXMauT7bW4b6nP9Boj8hYl/1fGOX
	 XLTTOvvTnNMr+Teih6jPcPf4yO/vinI7LCvcenZBa4RFIwwnrJ2yJg15XebgQRaJt0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gL1FLBrJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clvyGhB5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78CB606A33A
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 04:18:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E78CB606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gL1FLBrJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=clvyGhB5
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A32omBd2609157
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 04:18:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=kA7vRuxICWw
	iYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=; b=gL1FLBrJsYgHsyZl2GKn2DigmGW
	r2OpLEPVUWDvF3Zg9yWSSqjvV0KVLjsocQCl9suKn2683H3Y0UCEIfitjhMKUZPG
	1Xy3zILY4bbvcWZBsM/JkDSlySrakWs6gVeCCwWs/7uPfGgUUs6TbjmVY2TxnZtK
	h68rNPyL0eLhejZZHFGguDB/114I6XyIYhSI4jvCto2w/TtEtR6btydhSHZwOPd6
	F3iKS0zdwja06+vhMdwAphVWpTZGSOE4u08C0KSyZHHZ9tc+a9ugd+LqpupPQBtZ
	JbqNc2EQnPmD6mAy5TDNIIp8+jIp9ToFuINcID/LT+ie6DULeiCo6E5WcSQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq76d89d7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 04:18:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3662e7a9299so14994873eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 20:18:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793679508; x=1794284308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=clvyGhB5TprZZJsZiH+tr+NjrDlQgpCUwuRCPtEr4uCWtl8HMZdhKCMTVyzOy3sgK8
         klpOaNkFhtU2VztLA9I1XeNFvGH0ie0lI69BE3tUKw5miVX/BCePu4M5fupis7BfwI0f
         T0YXI5YeXjZ59+/Ul2sPSxy1p2rpm5hYh4oQ9lJq0OXp20Lv4HRdpwVSTECYOdxl56QO
         bARujjDPFsqSHXZ6KLoyGxBi44NyeQ3eCmgKKkVnkOry1lLboir6fuwx1koaZf8NV1RU
         SY2uzcu8CCfYwy7uE3c3shOKVOAcgwU7hC3sG8LK9PjkgE9vvFjOhdM2MmAmeoRcMxa2
         P3dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679508; x=1794284308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kA7vRuxICWwiYwEbVdkNoiazxon2KcFGb7zYOcZ4j18=;
        b=DUl4TW2og8YkXj6cvwM2MdA9XYgYig/lGuSbnGS8dWqAVG2llXGm5SfO+sWmMONHDR
         XhNmPVpcN6aT2cGXlhm6VHHkX+kV3pvi/aSnmKbf8EGpmR9hbqy2u7BkOmgT808p+Bb6
         WfttYVMLDMLQocNEK2uAJBZ445hUy26zeaTJE7+2IqnphdOFUuqW5K6QqEbb9iJlvmaI
         8wVIlbxO45RZ+F3mQwp5n1TRnBodaoDbVwRl1f4SNvHXUj7pOZdBsbcabPZsdtRFWg+p
         TRNZTaagWF3DRn4/vztONHHQLVm9ZJKDbOe6v5SESzhlphN5nZkApYJ0yQfdly+lrqze
         aVVw==
X-Forwarded-Encrypted: i=1; AKwUvBzm4RHpFjW+NFHHGiM8uWzJyRDQjZS6JiqydCvR/G5i9UDUwwpU9OfUfPjX5C58QtFwg4wuYCl1FA0SfnID@vger.kernel.org
X-Gm-Message-State: AFq9FYKDMIQy8c0J63CdiTHNW+aOoCmUStpMUBhmObb+NM6SABT190C4
	0lWbGMWUk0bep5J8EwsIhIc+6Mf9TllWMu9q0a+gFLcTCfuPBNaZq7p6JCtLBXKlVpCpdOmYNi3
	uDoerQS9TeGr1YnK0xYPbE+zLMZALRfiWteFI1c4rJJRRkIdGjRnwAbc9FPHEMpDs6ZGK
X-Gm-Gg: AYBFou2JVPVw1wexnOncJeBadmx0SEUASbaRiZJYhHyZPBXxoE2DgMHkig2bLmoQ14L
	owjx+41rt4jr3RK6Hv+fwGB5+Lopbrpuk58vM38mWyDJniN4XxjixLSxSCJMxtU3a2L1MBtxIFq
	5SSZUtNYlx+4aKCJP8BUJuSpANQo25Us70GzL0JjMNH+qPum6qOiLQd7OCfvnO0X4XJpSAIGNyV
	bKWQtExeRI2w3Uwwm7U3Ci/UIkbMAtzUJWw9xCStKzKNw2a6eiXwwfkAUAtgRZ6INP2nmLJg36M
	Akr2UWxuukPsDC39XCnYpavIolOU9f4Em+2Xj+/EsaM04TZX21/BaVzAwrJjuOHnGDBIXR+icMW
	QC+bMHBF7G/0sA+0pt4iP1uXDRPu67GqCO83tgA9RjFZkNrpjOi/jseHiQiBn9iVUJkUmiGdkb9
	WsfbXvuaJOscrq+7rGLC4ssOUA68bbhASR
X-Received: by 2002:a05:7022:170c:b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1aeabd0fbb9mr11594661c88.38.1793679508201;
        Mon, 02 Nov 2026 20:18:28 -0800 (PST)
X-Received: by 2002:a05:7022:170c:b0:1ae:abd0:e2b6 with SMTP id a92af1059eb24-1aeabd0fbb9mr11594623c88.38.1793679507479;
        Mon, 02 Nov 2026 20:18:27 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm21701617c88.9.2026.11.02.20.18.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:18:27 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Tue,  3 Nov 2026 12:18:05 +0800
Message-ID: <20261103041806.1885974-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
References: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=KJTPn1Fo c=1 sm=1 tr=0 ts=6ae96095 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=pw356RtDBc5WmomScbsA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX1Pl0Ei8OGM+V
 Ms+mZxcp/wVHgvlTW4EBR5TVJ8mJ5hAx5ic+VV9IOAW6cX90Lfzl18AJQJHE8kPIa43dUIJCx0n
 WhNqnv1Q3X1OwtZwH4CBBGqmOfDUelU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX1IyDTiJ8RpDa
 CRZUXNa0+MeiPt6AP1u+ogB00rEkmHtixPPC0uUocT21r6BNQe7k6lQYxqkvVgeOwHGxN1QkLoM
 EWiOZD0QYQsg1awf3TNPieF0/5jfFi7nuSWIdMgK+2rybIG/b+YJZP3FAXyY+AN0VUA/sUNspuF
 SihDipUrRYYFqJqBQatHJ4BbBdKsOEqlNyAOdj9q5bV+EOrnRLCojJRVrHf30slrrABYxNaRVCE
 pP1lVzIiyJ+hXajzkJPZUrD/sB05RJsJTuV1pUoA1LVI+4NVCAo6JhMMEhdwPvXXjRaPedX2Fcx
 vrbiXQ6hG1OrUUs2EkBPl8QJ/m/ZIAtDZDRux9C52VBBq/CVXm497Uo30FlwZ6QoCtJQGMMHeLk
 z5FEqsK2boOBsQyufiETlbeRWieR+Q5IS79TVqWYEwFRSvypmj4j6vKWSlGKxVX7/gNCDk0ONA7
 8as+dicuFqVTBzblsrg==
X-Proofpoint-GUID: kvx6T7Ik5hcJEroUZOEGQoLv8OF1XWsU
X-Proofpoint-ORIG-GUID: kvx6T7Ik5hcJEroUZOEGQoLv8OF1XWsU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030016

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

