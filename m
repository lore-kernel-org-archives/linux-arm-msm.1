Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430884;
	b=I7OvpG8DPgAF7g+aPgg8LOmRyTVTpl1j+c9quchss33ACXcbwSliyycfAdApMFSLUoEe
	 ure7dgNoH7YM43iIsNu7e8XD48cYlgN1eZL3YGLBWdes2OyAZ/y4y9CWHfG20F6QOCGTO
	 Q4heH6/6mMv9zQ2ooBTvWhC2+HtF0Uc1kz0V0Uxy7iy96ckalE5Yfg9EOAWzdUZCn6L+S
	 EiyiQqzo/F/Kf0fWMv30c/Ororkr/8Luk+2GH/Ec/gIrAMCKnC1VBfYebBhVzOvVTBngW
	 X3bDe+Be9QB6wJiCUuYPTzrCPnJVx+ziaEEuF+jB5HweJzWDjMmvybpk9fJfBGHgHhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430884;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=1hiszdcfzdCGUJyecppq+zRwkuNF1B1hD+vsd51JBCU=;
	b=tDSKKsO727Y1xfvr8NllSYe59qeT01S7kouqSZhqYZcOxi2wAt0K4bT43sbmFVJXQx9L
	 33LVWa1Xmrz9pujohoeeMjqGTdmxYz9WFd7Q65b6dao+Dr77YRdXRWDSGRXZ0vjjpZp5V
	 sye5S4mJDLCUq21LthDxPY3NctoZD09T3lGP0aPITrb47wa3StU5fb4gSnq29vqtEbXy+
	 SJV7BayxeeanJIKLI4DjR0YvUoEfKJyXsl4d8Fo9IhCpcZtIf+lE8dW1c/GCYlEaXNQsm
	 tsSzk8bw8eQ8sQF5g600jksuYiVs89D7gXPICnH2O1Otm6kYuWNzbOPPeg0EnUUe9NQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KT7cLukP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="FiF/qUYe";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1231F606A32E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1231F606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KT7cLukP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiF/qUYe
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9G40g1899656
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1hiszdcfzdC
	GUJyecppq+zRwkuNF1B1hD+vsd51JBCU=; b=KT7cLukPHNq3j+JRfLnm2/5LBKU
	Twe3coafXUjeVvnOpn5z3Wevt93cTaTFAWtqddIt0Ojx8ph6H4yD49dMwBvWFlkN
	UrwoUpyXO/4TzPSyCAo8Q1cVyI/lhPglEYTtkiVyx5j23cz+0PDz9Ovvfv1ws6dV
	OO0XoZ4dnaWwvehJOCHQBcE3r5p97nR28cDOIWi5oneNVZIA3EiKEu4+Gj+feEtN
	qVngorI2UY9Rk2JU45/K96r9rei87U8/mld1b/+8I1MbWhVoJ+WC4ZYRljiKfQEO
	ahlw+1HtpRP01j5nc3IAd83szfWs8piFogvJ0IOUfZGsxTxl96i+pER+g9Q==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1k11gm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 10:48:03 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b930598cf0so5315911b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 02:48:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795430882; x=1796035682; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1hiszdcfzdCGUJyecppq+zRwkuNF1B1hD+vsd51JBCU=;
        b=FiF/qUYel/l57c2fwjXx9y0+GDO3L0nG9e5tNDAV37PK1OO1LsFtmOBGtNdRr9feik
         RoiaXPyvW8ymePGabd8WdQMimBlssZS8eSjBG57a8GEpd61Rke4UNFmsNp/08loE9yKw
         pMBEy8fCJNTeAQ32TEX0roYRqPBPn18+14wZkYhR7fqs8e/6HbOM/LTOWvDFB4I4ZORh
         RSJvEfN1Pr8V3y68B3mK4uNehwKCvPs20D5nNdeyOOTwdkdPR/r3bB+X9pAVN3B+4/AL
         ZUH0/z/31lPvnpekk/7vmBu7oJQm1RHl6lzbi+DH8iZLPkWL4YX4pl1MyLi3qhpFJJOM
         1R9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430882; x=1796035682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1hiszdcfzdCGUJyecppq+zRwkuNF1B1hD+vsd51JBCU=;
        b=dn7nV6O4Jq9j7DLZ7s0xa2pn/F7PI+gpNddOQ74tdLBl2jOhgq423/ST82owFOmdDc
         FVeMM86gb8xTrSoPchvc5s6lmJ8YiDQ7SM51prrvTxlMVK1EcA3P3/iWo17DL9doWDCR
         aNZ9hNNXKxJKpnfdXw3aVYNwYQNkfR8mBA1rU4AOELBzakLFizu15RM00hSdduzW1mbc
         k2pr7dp/x2qWGhIfsgbd++eCQWNi97mIwJbln+cE5h3cCXfIwvg4JhnA2uI1wlwlMnyx
         ZrgVa6slL3qK65BSYQbVdB4SAKWB9IzNbecoK488s/aRJ6YsUxDU81csDvz9ymwoJ0BF
         lfEQ==
X-Forwarded-Encrypted: i=1; AL+hErEptLg7tE+q1D8xr+oCXYFxk6S768eN2y1CFRmDvxggevRu8W+5wHGre0ZHMra+OmfvkHxORdahYQ4pxvhV@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ptq5t82rGtsJ5jlETaKyzhEYL8Ejl5aD8PSUUQyCKhUrxLhSS
	7u58rC1UZx3OVHHYp8ouAMDgDIlBSlpkHWIZWx5jzsCGrb+T6al/MnGq9oViX/olY0A/kwwrTlj
	S5WGUqIQb/WqIm15wet0bnCf+Bq7QUkeijRG8VOWJTTCl5Rmp134o4K3S+z5xXCy9GegZ
X-Gm-Gg: AZFdTZeo3OFCkrWDLNmlsGjFobsQw7R5o2c0HokfUW78bGWkH98rttS77QD4p7/WeAm
	BYWDtoIoRhK/XgzLqAL1t+GUBRklUwnH5jMYvKvSt13TSC90xx1PmjZ1ZNGn6LNXIjXQY9+Wt6f
	RTl+S0PJPyYRA21xFgdZX+vWwmjXVp5ulgNnE2BZeLhF6+4VuircgykF6FTL3eZWfhNqOSYA8Cb
	YC+10jj/rRXUYCfoNDmSAK7QD1keCWI2ITqrV9/UHaZyrxD6fPBmspJyRl1e96PiemTcRs8xO1T
	jK6K7rekWlO1xMzmEC/w48+lZAzUR9O7stjpIWe57F/1d3dY1ioexC+f+0eP76ZO42HAjyUoGak
	Pb/ESh1CvrZbtjVdAxc26AjYUt/5LBryrB/2iqu83TR74c8YetQN/FFWQ8lDQYtGG8PXxXauW03
	whSDoftg==
X-Received: by 2002:a05:6a00:4c15:b0:880:b709:cefb with SMTP id d2e1a72fcca58-8c87ca508damr9415776b3a.45.1795430881984;
        Mon, 23 Nov 2026 02:48:01 -0800 (PST)
X-Received: by 2002:a05:6a00:4c15:b0:880:b709:cefb with SMTP id d2e1a72fcca58-8c87ca508damr9415757b3a.45.1795430881475;
        Mon, 23 Nov 2026 02:48:01 -0800 (PST)
Received: from hu-faisalh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873442863sm5413467b3a.43.2026.11.23.02.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:48:01 -0800 (PST)
From: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
To: Thinh.Nguyen@synopsys.com, gregkh@linuxfoundation.org,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Cc: linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        krishna.kurapati@oss.qualcomm.com, peter.chen@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com,
        Sriram Dash <sriram.dash@oss.qualcomm.com>
Subject: [PATCH v5 04/11] dt-bindings: usb: Add qcom,sa8255p-dwc3 for firmware-managed resources
Date: Mon, 23 Nov 2026 16:17:19 +0530
Message-Id: <20261123104727.1539149-5-faisal.hassan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
References: <20261123104727.1539149-1-faisal.hassan@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX7u/ZDRjVoQS7
 Hc3WZqPBcWIkyFsT3SwmOfm7lTQ1mDJ0cbJxtjYI6g0PPCTZCOa6rDV7kEEPVU8LIK8lwchCqBM
 weE+adlA61jTt8ZTNxkjK2Cxk0DYdZE=
X-Proofpoint-GUID: YA8_P6sYWeG9qKGDyLEjXv9uMwZcYKir
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0MiBTYWx0ZWRfX93lBjQaOda4+
 GF54qkRgl6J+dfn7aizHriTUCk9a/cArYxTUzpKQ4iVvsnyJv6H5pXyTHWBV/Li1tAS45nF62mv
 kjvqUkWHjv/R7CowRVs1I/Tl4TyzhmC+cbYwhH7QRs+TE9yxkQjQ2PdpzfRzkr6g3zW4gSdP0ML
 6LBypx1Z9KFSQlTxRPpUeVzH4zadNNLSYI/EPa3GRDKjvAzjd3QXRgRi2rqhGpAi4H+uQzHiJtU
 DnGAjwrexYcQUGNiPvDW9EcOwGNPD5JMsFcWr5aCuZrPupfrk5ItQyCi2/HPNWmAKrBdTURmlfN
 XOz0xGz3r49MKzBbpB4x/CU8y0h/g0kQxCTa2QxzOEkE77FtEui/nW3YHqVxjmo7U6TxImBeMuh
 S3W4L0FHgxvdX1KTKpT9ylFLsyYf3yNcQjY2gmA1BRuptLpLH+sMJdYxl6pSV7dpZQ3ULKy4ffM
 ecCr247dSbChgrPqh6A==
X-Proofpoint-ORIG-GUID: YA8_P6sYWeG9qKGDyLEjXv9uMwZcYKir
X-Authority-Analysis: v=2.4 cv=cpIOAF4i c=1 sm=1 tr=0 ts=6b0419e3 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=HmkRj0nT5UQon3SBszkA:9 a=zc0IvFSfCIW2DFIPzwfm:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230042

On Qualcomm automotive SoC sa8255p, platform resources like clocks,
interconnects, resets, regulators and GDSC are abstracted and managed
collectively by firmware.

Add a new binding file for firmware-managed USB controllers where
access to these resources is exposed as two power domains:
- Power domain: Controls power supply (GDSC) to the USB controller
- Bus domain: Controls clocks and interconnects for data transfer

The binding makes power-domains and power-domain-names properties mandatory
for firmware-managed platforms. Clocks and interconnects are managed by
firmware through these power domains and are therefore not described.

Co-developed-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Sriram Dash <sriram.dash@oss.qualcomm.com>
Signed-off-by: Faisal Hassan <faisal.hassan@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/usb/qcom,sa8255p-dwc3.yaml       | 114 ++++++++++++++++++
 1 file changed, 114 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml

diff --git a/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
new file mode 100644
index 000000000000..50361fe97c7a
--- /dev/null
+++ b/Documentation/devicetree/bindings/usb/qcom,sa8255p-dwc3.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/usb/qcom,sa8255p-dwc3.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SA8255P USB3 Controller with Firmware-Managed Resources
+
+maintainers:
+  - Wesley Cheng <wesley.cheng@oss.qualcomm.com>
+  - Faisal Hassan <faisal.hassan@oss.qualcomm.com>
+
+description:
+  USB controller on Qualcomm SA8255P automotive SoC where platform resources
+  such as clocks, interconnects, resets, regulators and the GDSC are
+  abstracted and managed collectively by firmware through SCMI (System
+  Control and Management Interface).
+
+  Access to these firmware-managed resources is exposed as two power
+  domains, one gating the power supply (GDSC) to the controller, and one
+  gating the clocks and interconnects used for data transfer.
+  Both are SCMI power domains that are only switched on and off, and
+  neither carries performance levels.
+
+properties:
+  compatible:
+    const: qcom,sa8255p-dwc3
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 6
+
+  interrupt-names:
+    items:
+      - const: dwc_usb3
+      - const: pwr_event
+      - const: hs_phy_irq
+      - const: dp_hs_phy_irq
+      - const: dm_hs_phy_irq
+      - const: ss_phy_irq
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: power
+      - const: bus
+
+  resets:
+    maxItems: 1
+
+  iommus:
+    maxItems: 1
+
+  phys:
+    maxItems: 2
+
+  phy-names:
+    items:
+      - const: usb2-phy
+      - const: usb3-phy
+
+  dma-coherent: true
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - phys
+  - phy-names
+
+allOf:
+  - $ref: snps,dwc3-common.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    usb@a800000 {
+        compatible = "qcom,sa8255p-dwc3";
+        reg = <0x0a800000 0x10000>;
+
+        interrupts-extended = <&intc GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
+                              <&intc GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
+                              <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 7 IRQ_TYPE_EDGE_BOTH>,
+                              <&pdc 13 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-names = "dwc_usb3",
+                          "pwr_event",
+                          "hs_phy_irq",
+                          "dp_hs_phy_irq",
+                          "dm_hs_phy_irq",
+                          "ss_phy_irq";
+
+        power-domains = <&scmi_pd 1>, <&scmi_pd 2>;
+        power-domain-names = "power", "bus";
+        resets = <&scmi_rst 0>;
+
+        iommus = <&apps_smmu 0x0a0 0x0>;
+        phys = <&usb_1_hsphy>, <&usb_1_qmpphy>;
+        phy-names = "usb2-phy", "usb3-phy";
+    };
+...
-- 
2.34.1

