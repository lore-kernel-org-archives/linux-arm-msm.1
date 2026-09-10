Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3A933DAAA0
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789031892; cv=none; b=gxgaxEjg4OKFFEO87kyFVjUBr1nAC3EAyETqi85DD0+ZhsjzaQFPY9h+nIsgDKv12qfhe/0NoaMIURMB61uaYXExWjyS0qkALmpH9SckrRXp/jzkxB76n1xTnsFHZYfXFRh+sL6PPGJybDdrlNIfgi11J8NOvG0D6Rjmd8CXmX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789031892; c=relaxed/simple;
	bh=uqXaAfYUFhE/LqQ34mcswk141mw9mtdWD/wtSOx2T40=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DK8qm1eGfH3kjsAAHvemzh+EJtx6pZz1RqBlbOYSeIg/CpQphswYajUsw4CVqv04YhrCVrJIRUJkVpeK623kPcLqIXhfzn2igSZ7iJkpvq0EqasDmLcCnMamKLgJY/t+i1Qjt8v0Ztb5zu2rRnLE06kZnLMKpaSeZ2Jcs7iHurY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oaONKq4k; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L32Td5LP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oaONKq4k";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L32Td5LP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8pqEL1000686
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:18:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=R7VlR3KIJ7C
	bxcd6Y1OKzAYlMEijNWEnGLFJbn3lQWU=; b=oaONKq4kgSoIWX9DYW6ICey4NDo
	A7Qs9s+p1M0lndLoniYHtYfIDy3DF+m0tyTmiknvJQAEoza0eAURI/SYXOMQyIE3
	YtHfD09oj64vcNbtAdsRoVQ77OfKX6RZU8K+GIIOqnVSJLo23/Hez0PWnFn3z3uO
	sdhlH82sMEFPDT67RDpUquaOeXnVrSgZxm6xhR8HOmIdoZnruKMG64AXyAwRVmnP
	NXYr8aPHWJap1Ye+9HgP4diKPkQZySqNIO0OCOfnAi2cMitwmm87v2KVwNEd7cOF
	rgVwtZUYmtqvtuJaAy2rT7gm4DowDtPzV5oWwg74IZk9TvYbUSmXwnGzrIg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvrh48-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 09:18:04 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a7de733fa9so7521527b6e.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 02:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789031883; x=1789636683; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R7VlR3KIJ7Cbxcd6Y1OKzAYlMEijNWEnGLFJbn3lQWU=;
        b=L32Td5LP5PfRVJu2Q7y5BmNG63LyzMdWYXD6utNn6oKczkWdxiFwgjm5NwXjVTymq/
         OoFGE/PPIHzWskk/bOOCfWbE849YgAHeKNFMqJDNGuPO5ELiJIUsLBlmvOLL5W63PHRf
         K7z93fP6qWcGSYLwazu5MEtpkNJpJWlomFxfJJ/ih9i2ojIKP7uMstrtDQu/fw7sqbNn
         2NRYjtLpCXgwAdYo1qHtL9emNcTIZ9qnUA0upnJLfr8SR3XKvYodolJam0cJlOjBUNHE
         bdtvTKBg+E6NTO5jH2/W8WVCg+HEjsoGeVoyhAvurDr5D/DCn6lOLCGllVXHGrLCSrDn
         XjSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789031883; x=1789636683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=R7VlR3KIJ7Cbxcd6Y1OKzAYlMEijNWEnGLFJbn3lQWU=;
        b=iyfIoBqJ9Q7a1GgHNUSDuz7AVLxdsxtcKrw2DJ08+v5YmwIcg+lJ8RUOWBGaMYxuDG
         ruagp5NALXVTkOnPJItx5g1FAPRzOfi1prGuOOB9QmH9nTOPa9UcY2pHXg1TQlB6lnec
         aJuC1Wv03MA7UH7lVYKuZBhyAvmGM3Mt6H4YSL9gtBQlynmXcKItwXfcWUFRCA0JGvbm
         DmHH4OROSUFgSXmMSLdJQSGD/prCasLaq3tduw4+hPVsbGml/nkGUcQM0fuIntFObKAK
         41LUOZ5FyU9E7wKzZ7KY6oemHiS8ycp8PRAmJ6tFbA17DUhbSaJtDDyOkASKDtZaGUXk
         dMtg==
X-Forwarded-Encrypted: i=1; AKwUvBxMZuFOzGZ5+hQkECzjJnzfY+BjXwrsRfXTep9QEkqPpmMtgPndUyXANpdQplhoZApcT1npAgl2l5WngbFB@vger.kernel.org
X-Gm-Message-State: AFuF++kDOPvDrluU9HloldzK2cjSRkBZAEiMmVEGupjxpFdUA6T2KVQY
	hSshfYy74AX+//w98BAKw1w2VzQDoT9/+XdFVirSi2t6xcUb6f+sUKzs8hr8t0fnG4sTUGfreSo
	hXRmXgYU9dQVhOgCmvarxodghx5kr08H/xStsoTQgq2odcOdKGztgZfaWHd8C7AfEXhNK
X-Gm-Gg: AYBFou26SvfRZuMcMG/c1NpHHrlaJP+v4Y6dsMBvc7whmsVCX9CEbHi9wODmnJ2xSTR
	m6NtMdlELh5Im9jF7WdqH757QGFewZRqwKjrJTuajzwhviq6zJ+JwGjj8wfhVxbfOsu7kFNQcS9
	Vxwt0/6pTWbQZysVagb1GH0y7c/PyDSog/5dCjscyNfR4nOpFtiTRW5c2t+v9gwrpN2Z5Tv4ZnH
	zN0ppDT1AWsElLICBlWfyhZXksjVHMX0A28P4uQ+5GqeynIKAlvhubyOEjbhNQf5UJBPc5QuA+v
	3qo0p/2/ZH3B64NVkSo3AcnMDZHm4TUOyAUyDqyZ4RPo/EhVjwPVzvnZz4+t2sLbzUWpOn2dm/2
	qvo2GybWBhkzY9bJx/KXYo6Q5leOQAYGsRQ8479QDmREIveK4A4eTY+k1tB6n
X-Received: by 2002:a05:6808:f8c:b0:4b9:a829:f018 with SMTP id 5614622812f47-4b9a829f8f4mr21445245b6e.36.1789031883374;
        Thu, 10 Sep 2026 02:18:03 -0700 (PDT)
X-Received: by 2002:a05:6808:f8c:b0:4b9:a829:f018 with SMTP id 5614622812f47-4b9a829f8f4mr21445217b6e.36.1789031882907;
        Thu, 10 Sep 2026 02:18:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1433171a97esm57395988c88.12.2026.09.10.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 02:18:02 -0700 (PDT)
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
Subject: [PATCH v2 1/2] dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
Date: Thu, 10 Sep 2026 17:17:50 +0800
Message-ID: <20260910091751.819264-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
References: <20260910091751.819264-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa275cc cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=gEfo2CItAAAA:8 a=pw356RtDBc5WmomScbsA:9
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX0ULIpvN7yi9G
 IPmYxIzGZLMgFnfaZVqSvd/VeHoPVjipSqMheYP9iUbE4lXnJ4E8HeIiSoN4YNJAxjp73MdyW4E
 EA8uXGc+jtUnM+Ja0ltLliU+BoB3yEaf/IeTFhoSnrv7j7DAnCDWu8r6TPECpSa0ukwskEZK/bV
 BlqDLSB0pnyOgIR0YXNrOJmExjpvuQphMawSvabn+D61xZdjJCNCcZZu8jJ177ZWovN/EeTxfW0
 KIoSEZ7EMbL5iDJJXjFyiKGDNCLrZGLyBsjftvwxQaGfVij7g6HT+kE7o7h9BdcJYclo2jAcIdB
 SaGMJKQxilP3U/W06C9cu8VsnaLnjE+m39dZv3xj5WyF5GcyTGePAm//0OEC29KQBM6dYWGxWW7
 UGMCH4/HrPMyypWhMqmv4kc9maXSfn4Gl3UdysFhmGFUkoL24kXiArZU5e2VrHwWO3Mvzx6XnEW
 9pRreLf+GF9LaNC1dHw==
X-Proofpoint-ORIG-GUID: qTJ5EMjnq0XlWBmrQPWVFPiC9LJz2HJ_
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDEwNCBTYWx0ZWRfX6m48lJXlDaC7
 OO6HK7OLicRIVq3gOwrL7GJUNeJ1xk/081MU1BQgi/BnFxscPO/zZ3IQL+zXatlpZ7boAtieB5k
 fyAjOA+AJMz1flEvwqRBtj3OlVvzwQI=
X-Proofpoint-GUID: qTJ5EMjnq0XlWBmrQPWVFPiC9LJz2HJ_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100104

The FUSB15201 is an autonomous dual-port USB Type-C and Power Delivery
controller. It runs the Type-C state machine and the Power Delivery
policy engine on an integrated microcontroller, and exposes only a
status and command interface over I2C, so it is not a TCPC.

Describe the two ports as addressed connector child nodes, so that a
board which wires up only one of them can describe just that one.

Assisted-by: LLM
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Link: https://lore.kernel.org/r/20260902045938.184221-2-shengchao.guo@oss.qualcomm.com
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

