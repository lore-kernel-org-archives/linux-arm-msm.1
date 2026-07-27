Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0C9C3C09FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785131418; cv=none; b=a8QWc9zKMEAAFIHRhKFijA5eK+rPsQK6ox4Vhl9xiz9GB2UkYag9lzvPjPI6HaBl6U6yNA/YhD9nChvBph1k1LLyIbFOp7Qbm2J0qI7zsUDO3N2bW+sfLK/PcXOyAqd3mi3TIA54lfQTZhSm4/mU1pwcs/MEc9uNXbxwT4ZRoe8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785131418; c=relaxed/simple;
	bh=T+/3fSRFw3A8HWWvriA1hEv3HJ1qFSuwfYVycpp4/Vg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNudUmM7iMSIxoxYiJhlhMbFiW4bRfTb0zfX+wd8fIaszDa3lDY8mCGsoXI/CRCqfAdRadlZA9DONWmnInr5PDkrBPbn1SvX/h2+EX/0bmcdPwmMr3CzEUUsmr2PQDSfepvdqCtIBilzw5wvx55USYWVBtgGEcM59hSPDFM1jXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hKrbSaUL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OH8vpnOe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hKrbSaUL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OH8vpnOe"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66R1fpiQ2466719
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:50:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rg2cLVCT+7mXMttiqg5O8SDWGQHK5gHK0XrYKUIEYJc=; b=hKrbSaULOFlowtTK
	ajSIGHfYHXc7g91shUf0jOutdf4ALwhW+3VY4pD8w/aoCXL89etqpSEP0eMnLrB/
	BdQTUVFqhH9zjUx6TKJkV1LEp/oD1P2JTPAPdVspibL1gwl1T4iJ5ONsAwohAnot
	dy/RfcEv9ipTBkIkDOXOCcJa6vU+Mc9JAj1O6Y+kZoWk4BUtTeQ6RYq3BRD2/yIe
	Mes11bdHo2BXualqZDJRwEAc0RoHl7ABf3AsVPxUOHoazEAr0S2WlBXF6QbRn4Z+
	tRDE4mYrIa+p1lA7HEdXFQlJiWtM3YeKL1zC/7qWJNtiGRWfElJTMNvLZwXcDteZ
	aF+8uA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm574vb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 05:50:12 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso3797390a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 22:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785131412; x=1785736212; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rg2cLVCT+7mXMttiqg5O8SDWGQHK5gHK0XrYKUIEYJc=;
        b=OH8vpnOeQC1f8+kEj8nQ9d7IXItiE+0qakhMZyBOKaIT0Q+HNr8vheaC4DJUq4WcBo
         WntYi264RfuTDkTEMqcy1Bjkn3yJIMzk922i/pXK3jtprhNN5LNyzluFzJySA8A+HBSI
         eiealWTFONOX518cV+d1e63HAf6bIXzs29QjGOYnSr4CR1V+IEF2AdNZ0EBCAE3OzqjD
         00QD0mEFc+1h4ZhDKE6muPDn5hBn8FvsMQmFpzSF9X+xGdjHy/jfhCzeoU5LFuwCkehT
         XGMrXjyVqSMoJdRwpSrHSEpsXs1hLwdkboBihfV+idQd6xDzHaq/hBG9LxyJ+tz6d+0o
         BWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785131412; x=1785736212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rg2cLVCT+7mXMttiqg5O8SDWGQHK5gHK0XrYKUIEYJc=;
        b=s3JfG0H44dCH5XYCzFC7k4PtroyvUOvjJxpf2VBYnx4g/jV7z1Bu7P7QflaSc0gV2U
         9gAVzWiJraWqGNvczv/uKynAlRGm+Z/wTR7iCRtILyQ6Q5aYv9FGYvakmbthSvvUNkTC
         STU2c3LVShzH4q/1YS+WjC9Hgps9r1t5ZsgjqJqwVUmVZ+nHu5V2Xu2z5eTl5dPovy8o
         L5Q3X7CM2Uoad9KQXd41cl3F3qZJ2XkLl9Fk19QdHeIGkw5DzkI2hVhGE+NC6o6o+6la
         UjcRQ2+HNkDzseXfHIehg/qwjjiHurr+tfVVLu4l9z7m1PxrHLw8Zj20aDutFtZVJ0Vc
         ZGUw==
X-Forwarded-Encrypted: i=1; AHgh+RrP8/oSWtu57bj9Nfwjx/z+H/3hoYy/SOw0ukqNQc9PRYp1a6PNT6YsE1NcOYCbJj/fu9UJxfd2jFY2BSBW@vger.kernel.org
X-Gm-Message-State: AOJu0YxIGiHZHH1jTMN70RZpHDPgPfed8lzvEA9cIIZfnjw72sl3g8lX
	nkNYLLhc/GOpmKDCcn2va9mUEvGKxyjvHS/8fDuTOCOUfGmE8cjDB/xOKqC+KjjCgHrrj2oD6SR
	tB8d6uY0iJcoykEhNsN4OBGHjpvBCZ+uruvTCSxT6CG8z+ZrtYSasGc6m7ggdvFixURP7
X-Gm-Gg: AR+sD109+kJFX7fqg8PbKUKWMyKQLqnCIxQP6UbQ/Izkhx3YapaOMhMEyCJKV/FWle1
	ePGNDddkklVvMk7snLvX2DtPkeCJ54TVYmPE35BuGyoq4PlccQc3vSZJ1g6ITiw9FPfqb5tfghQ
	LEdqx4lQNS44CJu6cITwdAP8aDV3QZgzWOtIF3R92W92oVtMWf4CinBTkOMgcopIyfYi4LvvjGN
	RbAkbvNdVmC3tKlfEmsKfede8gzpTPUdIGoVaLztXn+nvfsPIXPq8F030fb/syQnueNeMsQaAad
	XoQrbfPXhPfWxxByaH5nYDEGjeT3IXs849rkOjpzKkLXYi7v6xfsAfz/ODLwkIE4fgqPqBnDZk6
	lJSMQ7jlwGoO0Z4hkxFjTNTQiQX0QBY/9kFH7yZ+QRSDjvOIK5w==
X-Received: by 2002:a05:6a21:4cc1:b0:3c3:c71d:9030 with SMTP id adf61e73a8af0-3c67e1589d4mr7131329637.65.1785131411635;
        Sun, 26 Jul 2026 22:50:11 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc1:b0:3c3:c71d:9030 with SMTP id adf61e73a8af0-3c67e1589d4mr7131299637.65.1785131411213;
        Sun, 26 Jul 2026 22:50:11 -0700 (PDT)
Received: from hu-doz-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc549cacsm27934761eec.16.2026.07.26.22.50.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 22:50:10 -0700 (PDT)
From: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 22:49:53 -0700
Subject: [PATCH 1/2] dt-bindings: clock: qcom: Add Hawi GPU clock
 controllers
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-gpucc-hawi-v1-1-224e7884cf9a@oss.qualcomm.com>
References: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
In-Reply-To: <20260726-gpucc-hawi-v1-0-224e7884cf9a@oss.qualcomm.com>
To: sboyd@kernel.org, andersson@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robh@kernel.org, mturquette@baylibre.com
Cc: mike.tipton@oss.qualcomm.com, linux-clk@vger.kernel.org,
        konrad.dybcio@oss.qualcomm.com, linux-kernel@vger.kernel.org,
        taniya.das@oss.qualcomm.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785131393; l=6798;
 i=dongfang.zhao@oss.qualcomm.com; s=20260706; h=from:subject:message-id;
 bh=T+/3fSRFw3A8HWWvriA1hEv3HJ1qFSuwfYVycpp4/Vg=;
 b=7jrpdJ5BMg3gXntwVSqpHxb01htVI3XXTgB1sRfa95k7N1tXGGWH7OsPmV2SoxnlVfSa7/SVv
 BE/QzZaU902AVx7gM8JfcwAbtJfpPjGWgM8a5Bi0EM20EGBuJsoytUm
X-Developer-Key: i=dongfang.zhao@oss.qualcomm.com; a=ed25519;
 pk=oRbMthG8BHvTvcxks87U5rUBoZiRXWKs6KZR6lV5C64=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDA1NSBTYWx0ZWRfX9dkfi6PLh1zD
 64n3I7rD11cZ3nsRttmArf0N0dJmmN+f+Q/S++hZbz7cI2Livwpm/O0cv4imBmySHVZhOQDHg6Q
 F9OPyDqZ4AxdfAp6fFrSIJG0e+GJ1vs=
X-Proofpoint-GUID: iLVTLDAbOvPxG1D3sCuDGWJcd3eNGKqF
X-Authority-Analysis: v=2.4 cv=FOErAeos c=1 sm=1 tr=0 ts=6a66f194 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=A1q_97lxy2FG9aqMPMkA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: iLVTLDAbOvPxG1D3sCuDGWJcd3eNGKqF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDA1NSBTYWx0ZWRfX1JsRVGsH/ajr
 ffAFDNR3eA7jSEa/8L5d2tH65A0Sz4NWuDTkoegP2dEmH9e5415DODtCvPWMXU8w6mpflmhndd/
 +8TD9viZPTHepj9B6Mj6unAkTuaKNfZ+yB8YoA+O+Wya2Th4M9x2tmyIbESlHm7YYL4nDLfCc68
 awmxOzzSd74fxXLFIC8sqQ6T8I8ecLilVjOs3AB+c3oCFfQWmqWWVNre0uE1s1p0ePXZg7c+o+S
 byI63z424fGPXoOiQh3bxhtOsbmxRDZ/KqT6s2I78ThEFNskTPmm67C9o+vmnZQa5Ev4NPCDyhD
 6GVJaNMV9S/wVAov9AGmCsWXiiLdYYFSVkM25bvKXLVIh5ApUbh7W8Je9K2foZnzCrvbS9FZ199
 baYsimVYuEj4zMAOT4hI5GzdwGp3XjQa91C4AtjpK7ztq52D3+5+pF1KdW24p4RlnNN8qN3Xz3a
 mOEEfrPrndyXfJm9HdA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270055

Add the device tree binding and clock, reset and power-domain IDs for the
Hawi graphics clock controller. This lets Hawi device trees describe the
GPU clocks, resets and power domains, and lets dtbs_check validate those
nodes.

Add the qcom,hawi-gxclkctl compatible for the Hawi GX clock controller,
using qcom,kaanapali-gxclkctl as the fallback because the register layout
is identical.

Signed-off-by: Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,hawi-gpucc.yaml | 78 ++++++++++++++++++++++
 .../bindings/clock/qcom,kaanapali-gxclkctl.yaml    | 22 +++---
 include/dt-bindings/clock/qcom,hawi-gpucc.h        | 47 +++++++++++++
 3 files changed, 139 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
new file mode 100644
index 000000000000..3ba6e4d212ed
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,hawi-gpucc.yaml
@@ -0,0 +1,78 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,hawi-gpucc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Graphics Clock & Reset Controller on Hawi
+
+maintainers:
+  - Dongfang Zhao <dongfang.zhao@oss.qualcomm.com>
+
+description: |
+  Qualcomm graphics clock control module provides the clocks, resets and power
+  domains on Qualcomm SoCs.
+
+  See also: include/dt-bindings/clock/qcom,hawi-gpucc.h
+
+properties:
+  compatible:
+    const: qcom,hawi-gpucc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: GPLL0 main branch source
+      - description: GPLL0 div branch source
+
+  power-domains:
+    items:
+      - description: A phandle to the CX power-domain
+      - description: A phandle to the MX power-domain
+      - description: A phandle to the GMXC power-domain
+
+  required-opps:
+    items:
+      - description: A phandle to an OPP node describing CX performance points
+      - description: A phandle to an OPP node describing MX performance points
+      - description: A phandle to an OPP node describing GMXC performance points
+
+required:
+  - compatible
+  - clocks
+  - power-domains
+  - required-opps
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,hawi-gcc.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        clock-controller@3d90000 {
+            compatible = "qcom,hawi-gpucc";
+            reg = <0x0 0x03d90000 0x0 0x9800>;
+            clocks = <&bi_tcxo_div2>,
+                     <&gcc GCC_GPU_GPLL0_CLK_SRC>,
+                     <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
+            power-domains = <&rpmhpd RPMHPD_CX>,
+                            <&rpmhpd RPMHPD_MX>,
+                            <&rpmhpd RPMHPD_GMXC>;
+            required-opps = <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs>,
+                            <&rpmhpd_opp_low_svs_d3>;
+            #clock-cells = <1>;
+            #reset-cells = <1>;
+            #power-domain-cells = <1>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
index e868963f659b..28b653f6b64d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,kaanapali-gxclkctl.yaml
@@ -4,25 +4,31 @@
 $id: http://devicetree.org/schemas/clock/qcom,kaanapali-gxclkctl.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Graphics power domain Controller on Kaanapali
+title: Qualcomm Graphics GX Power Domain Controller
 
 maintainers:
   - Taniya Das <taniya.das@oss.qualcomm.com>
 
 description: |
-  Qualcomm GX(graphics) is a clock controller which has PLLs, clocks and
-  Power domains (GDSC). This module provides the power domains control
-  of gxclkctl on Qualcomm SoCs which helps the recovery of Graphics subsystem.
+  The Qualcomm graphics GX clock controller (GXCLKCTL) contains PLLs, clocks
+  and power domains (GDSC). This module provides the power domain control of
+  GXCLKCTL on Qualcomm SoCs, which helps the recovery of the graphics
+  subsystem.
 
   See also:
     include/dt-bindings/clock/qcom,kaanapali-gxclkctl.h
 
 properties:
   compatible:
-    enum:
-      - qcom,glymur-gxclkctl
-      - qcom,kaanapali-gxclkctl
-      - qcom,sm8750-gxclkctl
+    oneOf:
+      - enum:
+          - qcom,glymur-gxclkctl
+          - qcom,kaanapali-gxclkctl
+          - qcom,sm8750-gxclkctl
+      - items:
+          - enum:
+              - qcom,hawi-gxclkctl
+          - const: qcom,kaanapali-gxclkctl
 
   power-domains:
     description:
diff --git a/include/dt-bindings/clock/qcom,hawi-gpucc.h b/include/dt-bindings/clock/qcom,hawi-gpucc.h
new file mode 100644
index 000000000000..181534771b10
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,hawi-gpucc.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_HAWI_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_HAWI_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CB_CLK						1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_GMU_CLK					3
+#define GPU_CC_CXO_AON_CLK					4
+#define GPU_CC_CXO_CLK						5
+#define GPU_CC_DEMET_CLK					6
+#define GPU_CC_DPM_CLK						7
+#define GPU_CC_FREQ_MEASURE_CLK					8
+#define GPU_CC_GMU_CLK_SRC					9
+#define GPU_CC_GPU_SMMU_VOTE_CLK				10
+#define GPU_CC_GX_ACCU_SHIFT_CLK				11
+#define GPU_CC_HUB_AON_CLK					12
+#define GPU_CC_HUB_CLK_SRC					13
+#define GPU_CC_HUB_CX_INT_CLK					14
+#define GPU_CC_HUB_DIV_CLK_SRC					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MXG_AHB_CLK					17
+#define GPU_CC_MXG_XO_CLK					18
+#define GPU_CC_PLL0						19
+#define GPU_CC_RSCC_HUB_AON_CLK					20
+#define GPU_CC_RSCC_XO_AON_CLK					21
+#define GPU_CC_SLEEP_CLK					22
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_MXG_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_CB_BCR						0
+#define GPU_CC_CX_BCR						1
+#define GPU_CC_FAST_HUB_BCR					2
+#define GPU_CC_GMU_BCR						3
+#define GPU_CC_GX_BCR						4
+#define GPU_CC_MXG_BCR						5
+#define GPU_CC_XO_BCR						6
+
+#endif

-- 
2.43.0

