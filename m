Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794828893;
	b=mApV0ImOVEezYBy6i2m5UvRMQVJXNYJjIBmwWr4SvVqcFxAd3spqdwGp2KpsX1BQpA21
	 KR6qih3I8PU6hYMd4Adxiyn+M/gEt+3KMYSiYutt7BO8MutEEghSbb9QmKjTfz6MxJvyO
	 mdnRqJlhUUMAOjlSEOH7YtpromVl2FEMAsLc2URsBiDVRQ+2iscBOOhqvJsTasgJzeMed
	 BnsbvxeGhKAwtK4p5bDypzm9NqjbecWrSD2o4l4oFuqvvErUz9IsrQHIYsMTc5D3lp2lB
	 zVL5y3DzZOvU+9G0jOlbWY3dhGFBEU2Xc5xTaUY/I9wcM+VWnSgW2whILEWQ4KsMLWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794828893;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=;
	b=U8T1cwxk/WYN7HTFrYQ3t1vpUhOKFViVmbv9X9VrTw7klmBPuzopPMSS6HUvOzcdDGiC
	 9kkWCAcq1rPxxrfwJ42N4Lz0gxxI9mvndTMsfjZKGiJQ8psNYDfDsUzqPg2u9nvXSaHIi
	 GQMK9pDieVXc/fQkQK8cpJwN4Aj+V+EdQztiv5ri/+8Xa/vUwSRS0rXUAjpM9oHirvGrm
	 YPNpGqheGkBVVdhTbnlVF67vl04PTEZWAXKNXw4aiWc8oYSwURbrbJaoll7rHZLTTYuk6
	 7+6xB0g4kwA8OT01rcutpYLNTBrNk5oUdf/eaiwQmBmg31WX8hRhZpW849oJfNxvIHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2QX+32Y;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gQG/wRoO";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178CF606A31C
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 178CF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2QX+32Y;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gQG/wRoO
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLRbB3685284
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=; b=Z2QX+32Y9/8Ixjps
	svM98CT7t5nw8ZiK3q6x0xO2l/iDYJE8ktbl2uCG5wSDEa0hn1SCcOup2LVclavB
	nRO4Sb1fsmByzbRybkNmer9HNSC6zHPbGT98DvohpPOkmqsObH3+9gwt5mY39PUg
	A3CimrVpsK7eq2F3Fd8T0rM1u+Y9QBzVVeOl1rkJemmGgqLyJebzqwNvUGXS8goI
	lA0dYZ+RnWjNFa9+OXi8DNyJuiHuI3ghuiM3hkuJrE2jazUtCU36z7a+aqHlAwR/
	x2sFX8a4O0GmQ0ROAlEeLquVxUnlHXcL8YElvcuHH2OygFEwJE193bXyTqLU4kOd
	kkSR5w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyy6ggenq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:34:50 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3b10afdf947so4218571a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794828890; x=1795433690; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=;
        b=gQG/wRoOhlna4BgUQLnLC3GW6qAdmCaxtKJ5mHeqiYMj1B2uBRmJ2SrfuKNCMHYE/W
         72mpiI0lMujz3FlA+rFzTbpM54vXltVq3yElt6eoEpXuBIm+KCPxAEXuDDJ6gQRiJ+oe
         KGB3P01asLfDqxW1PVOBhZfLWAIB1opKTmoQ7NWg6MCgoUSAMv0J9pmHrl6/GIE7Vj40
         MDTAd3y5NTA0qzH1wHp5a09MIrbrkcK+U+E32Yf8AfVQ7+DGhyY18CBQR2v1mHyeusvU
         q6YoEvYjPmif8cQEBeh9aC8t4MLudkwKF8Qr8Jlqwn2s1hghBVPx/XkNL1Gj8EIydMbS
         A/JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794828890; x=1795433690;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnF7nUiKa64cGMOPkzafRQ+xlLpRILvOHKnNIMFoPAk=;
        b=rVw5Wk2t8J4UWrqGNedLX/aQPAqbgp8Z+JFmzSoLkvNu+HeyKxz28E880LUlwm9XkG
         WmKDR1g6GN3igmPqhccvUe664ZffXeQzncwlCX4sNe9Wv3J28kSzDOndk4rCrFSfOUqO
         M8YObwMXcLs9mM5AnkfjWYBYsUg66F65uvzLjylg9eEpZ+HG2iyFuqL0RD0t0qp1l5AD
         zx25LfQz4b3ur5yyweZ5ndX5Kyvg7bQfk8k0ZrzpgZXWoFYQQOzmxVbkuZTkUFeC2g7h
         PQgcsF+lcp86AiGTtcNHP8HroJE9CYsyQDXW76BXly7wA02TBZsGTshJVjNs/kx6y6BB
         qJ1g==
X-Forwarded-Encrypted: i=1; AL+hErF408F/QrALbZmPu5Cab1+B/cbwL79M7uxrTS8c4Ae4Z35Qi3jNnox1O7nAXgbLWTzDTtN2YGKNTu6gy5+5@vger.kernel.org
X-Gm-Message-State: APuU4Z+NQ7Ejn9yg0Qp25t2z7ia3tSCKo/kPzL4y4OSBRW+MIb8dZ2Jx
	zQQ0XBciIizDnc7IiYKWFSeeqptam2sWl3e6fPrGTku3cM4rSlVSySQ1NnOTLyuKMdOzontUCLZ
	sWg+V9rWlwKtwgcO0qZDrpGuLc6ao8rEWUkj4wlr+ztBOF1FcYXhKCJYXiJNGHxh1bdp0
X-Gm-Gg: AZFdTZfsNAgF57A9AScXFWrOArYbcjZYleYlY2fG2A4F8DZ7HF7t0D42s+O+HBIYg63
	jI5g6aOqdLcLRdASdenD+BSEDTm+cJObQ6fSBrK2K79LGZ2bB4f2kdErQQ/CcVB/fLJK8zeFLoD
	Md/jOukje/PJXt0yM8b4BHX6r2/kAHA/NnpKFma5lEG2cXQ6MYE4T2Tq6265CmLjCOWEXP7TZSr
	YxIWPV+vegRgHBzyTKoPenxF+kjea/DBhXxFWA/PlbkZ7xftxg9FFNxRPTyP47HKD+3PucD1Eq4
	zVjYZLzAtIeIRsNAAeXpi561gjTO0IYhlrbu/Hx6kGZ32P4HrXXpwmiBHQjJRBBxmS6ZgJlPs7P
	kuT0TjKHDXYZSCjhoZ/Pw0lT8MZFVDL9Urlik9FAgDc7xGHP/2WWQNm3GjbWO1Prwz1geWTWGYt
	F1
X-Received: by 2002:a17:90b:184b:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1b0ccf45cmr6831670a91.30.1794828889778;
        Mon, 16 Nov 2026 03:34:49 -0800 (PST)
X-Received: by 2002:a17:90b:184b:b0:3ac:9ed8:f301 with SMTP id 98e67ed59e1d1-3b1b0ccf45cmr6831633a91.30.1794828889253;
        Mon, 16 Nov 2026 03:34:49 -0800 (PST)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d27d26sm21000719a91.13.2026.11.16.03.34.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:34:48 -0800 (PST)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Mon, 16 Nov 2026 17:04:04 +0530
Subject: [PATCH v2 1/4] dt-bindings: display: bridge: Add Parade PS195
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-mahua-hdmi-v2-1-0b5af6bf9e70@oss.qualcomm.com>
References: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
In-Reply-To: <20261116-mahua-hdmi-v2-0-0b5af6bf9e70@oss.qualcomm.com>
To: Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794828874; l=4283;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=XqWVS/G6kyEGs7FM3vsOHGEHaxWN/UrO6qm6Co6aCVI=;
 b=WtBTscvQ0DovqRE3dOcQSKtm7PgukaEYc6NSnRNGQ6EeL0dXOyYpjQV5IcW+0oPs2xVZ5B56F
 oeXiTxWZuOTB1Znac4fzZm5gCusQZAZeTeJaJSrWwzttE7+xenJOj3B
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX3t43laIEpoMX
 xGNsqKNEwufjNx7/iyDLdrxiIy+TUnSe9usMUSfJb41sQGhulphVDjotQmJKZrAPqO66+ie5bpt
 KovCbYZN0NEKczjEZB6R0vwzqqWRD4sopV2V62NwiCBMq+Kgi4inddFmR7QBPCRysVXs3WaHdRc
 G2mDkzKBp7P5tpgWXHsFdqmcvLsb6lnRyWVZKuxLhALUCjsM+gpsZhGgNNUVNd45bscDIrffNlA
 nggdR1Hm8BIjyz29+LFhq8uGz15O1S6CN9CwlcQriSJ8o3c0bPe7dlsiG6loOBoLVyHzZBT2cNb
 ZSvVdeGmaTVMeJNt3l8xYPl7UcaGODFFfzJ3mOWKRq8hc01YZOsqbdxHCnKCvI2HXj0Jsv89cgE
 kDhH1V18y4BystSrRhxGykuTBD9/WDIK8lppqfzfXdnGFHjQkGqD23fHC2v8fAvfTeybSox5tq9
 6yKHzUhr7uNxyjtKaiQ==
X-Proofpoint-GUID: XIylX_wxxGGuNQVSx2R1ZxchSdQKprWx
X-Proofpoint-ORIG-GUID: XIylX_wxxGGuNQVSx2R1ZxchSdQKprWx
X-Authority-Analysis: v=2.4 cv=D/DSufRj c=1 sm=1 tr=0 ts=6afaea5a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=e5mUnYsNAAAA:8 a=cm27Pg_UAAAA:8
 a=9e7qC0O8hlTshWeg44oA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=sptkURWiP4Gy88Gu7hUp:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NSBTYWx0ZWRfX7VYoPmG35jj4
 Twn1MyjpWccLNWtjLcMJz+AcP8DTj0DRnXmzJiug1/4ohhm+Au6GgLH2BJDnBA/hwRt+AmAnZ3F
 xcVTLceywi+y9TPRmHr/DcYmlbtpX1Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160045

From: Mahadevan P <mahadevan.p@oss.qualcomm.com>

Add bindings for the Parade PS195 DisplayPort to HDMI bridge, describing
its power supplies, optional reset GPIO and display ports.

Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 .../bindings/display/bridge/parade,ps195.yaml      | 111 +++++++++++++++++++++
 MAINTAINERS                                        |   6 ++
 2 files changed, 117 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
new file mode 100644
index 000000000000..b7484caf93b6
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/bridge/parade,ps195.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Parade PS195 DisplayPort to HDMI protocol converter
+
+maintainers:
+  - Mahadevan P <mahadevan.p@oss.qualcomm.com>
+
+description:
+  The PS195 converts DisplayPort input to HDMI output. Firmware loaded from
+  an external SPI flash handles link training, EDID access and hotplug
+  detection. An I2C control interface provides access to the device registers.
+  Reset may be controlled by a GPIO or released by a board resistor-capacitor
+  network.
+
+properties:
+  compatible:
+    const: parade,ps195
+
+  reg:
+    description:
+      I2C address, selected by GPIO11. The address is 0x08 when GPIO11 is low
+      and 0x48 when it is high.
+    items:
+      - enum: [0x08, 0x48]
+
+  vdd09-supply:
+    description: 0.95 V core and analog supply.
+
+  vdd12-supply:
+    description: 1.2 V I/O supply.
+
+  vdd33-supply:
+    description: 3.3 V supply.
+
+  reset-gpios:
+    maxItems: 1
+    description: GPIO connected to the active-low RESETB input.
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    unevaluatedProperties: false
+
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: DisplayPort input.
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        unevaluatedProperties: false
+        description: HDMI output.
+
+    required:
+      - port@0
+      - port@1
+
+required:
+  - compatible
+  - reg
+  - vdd09-supply
+  - vdd12-supply
+  - vdd33-supply
+  - ports
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        hdmi-bridge@8 {
+            compatible = "parade,ps195";
+            reg = <0x08>;
+
+            vdd09-supply = <&vreg_hdmi_0p95>;
+            vdd12-supply = <&vreg_hdmi_1p2>;
+            vdd33-supply = <&vreg_hdmi_3p3>;
+
+            reset-gpios = <&gpio 0 GPIO_ACTIVE_LOW>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    bridge_in: endpoint {
+                        remote-endpoint = <&dp_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    bridge_out: endpoint {
+                        remote-endpoint = <&hdmi_connector_in>;
+                    };
+                };
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 46c416cadacd..9e1db88ec1c9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8581,6 +8581,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/display/panel/olimex,lcd-olinuxino.yaml
 F:	drivers/gpu/drm/panel/panel-olimex-lcd-olinuxino.c
 
+DRM DRIVER FOR PARADE PS195 BRIDGE CHIP
+M:	Mahadevan P <mahadevan.p@oss.qualcomm.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/parade,ps195.yaml
+
 DRM DRIVER FOR PARADE PS8640 BRIDGE CHIP
 R:	Douglas Anderson <dianders@chromium.org>
 F:	Documentation/devicetree/bindings/display/bridge/ps8640.yaml

-- 
2.34.1

