Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E09C43DA3A
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785423932; cv=none; b=c8nistbgSUaXpyUK199KBmpp2mgfbwavyme20gUQtLccF788m+bxVKVCwgJq7BifPXTv1Im0CYza5gfcu/vaqOF1BSvSIHf4/PwrDxbZa8SXiiCslChQJRk/tI1rUAasfMxZkNtGMVUM6vGhGV6WnXqvdV1U7OlRNzo9OIV0Xmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785423932; c=relaxed/simple;
	bh=Ix+wg8vzgUYd7842Y2GGiePZUk39A98Rvb55nGcQ9hM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=B2HPJN/s4kNdaZBwCU4hoWVFnE7E35trcPJ1tc2LfK0tvaDEhPhQR37SQwgSzaggSMDJR4n8uSWNHY1uKzLudv2Cq6psuaT4yaQfxf+k7xxGz78Qzyjd7wDV4uP1IrzEi8rGqobyA/DTKb6Uh7IaEkj8DiDyBGjGDr5kGxr4Yjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iCxAwIM6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ym5ADWKt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iCxAwIM6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ym5ADWKt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEfcUC1117740
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:05:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nkjwgkba610
	1SVmpfEBfl7XWsZeaYnMungObjyn30VI=; b=iCxAwIM6xp6ioJun4iVk1GvL9tR
	FnW4vOjPadvPWGnXSysnkBQJFQjR42s8UEVifxrLz4K0wAUFsyLuT77FAZnoOB0n
	MKRZZXcDX4p6em/jZSzgU+osjaUPl0snD6ADQ713+DOdB9ELDn8UZ6fDurxk6SHY
	bUxruuTEbMbHdw9IfDkryOELoycqcysztZ0kmrFrfpxABcCGcYNkr0JO5Q3ANarK
	5fay3LEQGXMgIbkhe/riUfrUoMCOAjXec2JOUWVHk4bCot7jQgAJ0QRqU8ptvP3f
	y8Voa2gyKx5YCQqfWtDMBozqPpkKJfyPyPePINIsW71/WpwDI0kK8FCllKg==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn04ff-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 15:05:29 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-737bcdb48d2so537065137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 08:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785423929; x=1786028729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nkjwgkba6101SVmpfEBfl7XWsZeaYnMungObjyn30VI=;
        b=Ym5ADWKt4ABXQn8N63NNMmN+OFkxYpffwA6L9mpvOWlNicGq1ElgAMNSet3GmTSBhv
         HBojwOSR5w69oqSxkAxHTBr8J0Xhu0QBMIfSeH8ilMdaR5ilkKdqv6SaEN47s7r/YgIF
         0sJzpoEr5Ewn1ludNEB6f+F2tRYt/CrLMsxPi9VsW82xR9C+X1kpY6jO7m91mG7dhXcE
         eHgu8wMZo/Ha9rGOB41Z8jHopybQKKTNjw4XvEE3f0FP3FnBXV5AZLcVGJnQlS0zWLED
         XbcgNTgPolpSj/iVx4o1qmgD/kOIDkNVe5ms8SNx1ebcXyP6eUnebLTRH6IsH3ubMvwC
         0nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785423929; x=1786028729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nkjwgkba6101SVmpfEBfl7XWsZeaYnMungObjyn30VI=;
        b=CjvI4TA5itqWmmC4DngShX4PxwoxyVzmwS34B9aXcak9D21QdkbJuTUyXp66Tf1KDH
         HaCs53o05uino+LkCfDi2UHs5D5Atgqv9bwc0iHJ7mcDUU1e8aBLofzwv3P7FSKtCdxv
         tEPIl+xbV2P2a64o/s8XqOi6hQ1pRaXGHx+gueLQAROYBFh+JlxdZ6FRxUuyqsBdKKZX
         lkOl/5nOXx8Ct1mVccY2j2Fr1VoG4fLWKkrQp7opuyrE+Pfb1rBA0Q4XXrkytE0FPcI1
         Ii6NINkL269yAB8qWEmJ/EGF1fmR3qdqBuZkxlOsXKcIgVxXm5wG2M0U400NPzv60Jbs
         2XdA==
X-Forwarded-Encrypted: i=1; AHgh+Rr//aNXIlLm6ihr7qxruuuzO6MbR47BB4k2R4onmyeOrJMC5v8S/GgxF8mZhUGJ52lv078Eu476/KleMRDl@vger.kernel.org
X-Gm-Message-State: AOJu0YwMSZ10BecMsoVtKxZPtiBwfqe9RCBjrKDKpQb/byu4x5Us7Ydt
	9IHy/d1UbG5ytzsDHWdPtVRo1uucWoOxRr5nB7jLu5VDdB75y/oBVQiy7ttVKqX/+dDSLHKIDp5
	sHVhWener2UiJQMtaVu3tD2DaLr8En8kJnAAqGJfMM9nl2pv+v6rb0J7iAodzDCd53GCt
X-Gm-Gg: AR+sD11Tuoa3fKFE99/rhvbuIZOLJdVhQffahpg3Dv92NVeT2B0/uErErltIZq818e1
	f/Ty+ZI0aL41Qjcb1QiGm6S//z1hLG3CsivbQPwX0ZZSn5M/SdMQ4LOoR1KLoFFY5zCEEZ4apaL
	hT9bgnUv2WJh9H+ymw85utQKQvHXy5tG4e3Q7om6HXAHnH0OPzBylZfBNdkNWfzzgQvW1Pmj33o
	VcJUOwg2oMzQTzyF/v7tjTOBnPpcro5DqsCY9a4cth8ew92LLoXM3MQIbzJRSNoMAoPTlRQOQYq
	/Yc33RFDOqSLVobD42C4w9ngsKcJj5NxtepUxe+XLy1LgW3j3uH27yYpwvoeVv2D8LdT6KNVvg6
	8PDBSjeGxcTPuB6rlnIG5IXI4
X-Received: by 2002:a05:6102:3708:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-75750786c56mr968834137.23.1785423929038;
        Thu, 30 Jul 2026 08:05:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3708:b0:6c2:e290:cc69 with SMTP id ada2fe7eead31-75750786c56mr968807137.23.1785423928521;
        Thu, 30 Jul 2026 08:05:28 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8bf2417sm75211166b.59.2026.07.30.08.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:05:27 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: bod@kernel.org, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        loic.poulain@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/3] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 30 Jul 2026 18:05:22 +0300
Message-Id: <20260730150524.2659577-2-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNCBTYWx0ZWRfX/uLA1DgzKK56
 nKYYAoRUR6LMOcrcM9GVMp37HIVunIwnEUFLKNz4amIT+yaeJShmSEQVkESMU8ToasPcjfbugbt
 waee7sD0Bn+HzXPt7YHmxBMSvbmml6o=
X-Proofpoint-GUID: n7LpBn5dynUcNhJy-1eljduJjunvtHPB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNCBTYWx0ZWRfX+en1V9iSVvkS
 6Y98tDd1LrPwqFYt9/tRwYLT0IjAFORoquW30S0pQ9+oj2D59HYygydx7nwgoKsJzMDyNfkP+BV
 Yrdf79124RD7CK9eCj/M39br8I8Ei8HDBuJCwzVcrn02W65yfEsZHqIH7c6zuGDquosL9muUuKm
 iu5DYJJaaa6oR0Rw8zlSM/pswSUV/VErGadMowxh9uA+UBs9EhNAyKjgq24MRxtMYWI4/DO0PaF
 WnybUEaR/wQCLIrpdqxOpEmTobaYPcbpjZmef9Ntv4YT0LvDulFKtXzpp0Q0NBMREH4BoKPxngS
 uwaRH5/emk7/gQBAk5eFcozTsFkvz53fw+B6fIYbb+2mLGxP34RqUMgCZn5jUBW5FNtjwKcoxbW
 oofJggFEI83zruY3g7R8QzstN11BLQpD2F4mwTpJx3HygdD/CRxTfk7CWHeLcBaHrIQGs7wunRg
 VrDrGQ/EPXHHcGPG4sg==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b6839 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=2iIih-OIPD95PTVVQyMA:9 a=-aSRE8QhW-JAV6biHavz:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: n7LpBn5dynUcNhJy-1eljduJjunvtHPB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300114

Add device-tree binding for the Qualcomm JPEG encoder hardware block
present in SM8250 (Kona) SoCs.

The JPEG encoder is a standalone hardware IP within the camera subsystem
that performs JPEG compression in memory-to-memory fashion.  It is
separate from the CAMSS ISP pipeline and has its own register space,
interrupt, clocks, power domain, IOMMU streams, and interconnect paths.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../bindings/media/qcom,sm8250-jpeg-enc.yaml  | 156 ++++++++++++++++++
 1 file changed, 156 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
new file mode 100644
index 000000000000..70f573100573
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/qcom,sm8250-jpeg-enc.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/qcom,sm8250-jpeg-enc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm JPEG Encoder
+
+maintainers:
+  - Atanas Filipov <atanas.filipov@oss.qualcomm.com>
+
+description:
+  Qualcomm JPEG Encoder is the JPEG encode hardware present in Qualcomm SoCs.
+  The encoder is a standalone hardware IP within the camera subsystem that
+  performs JPEG compression in memory-to-memory fashion.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sm8250-jpeg-enc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 5
+
+  clock-names:
+    items:
+      - const: sf_axi
+      - const: core_ahb
+      - const: cpas_ahb
+      - const: cnoc_axi
+      - const: jpeg
+
+  power-domains:
+    maxItems: 3
+
+  power-domain-names:
+    items:
+      - const: titan_top
+      - const: mmcx
+      - const: mx
+
+  interconnects:
+    maxItems: 2
+
+  interconnect-names:
+    items:
+      - const: cpu-cfg
+      - const: sf-mnoc
+
+  iommus:
+    description:
+      SMMU stream ID for the JPEG hardware. The stream ID 0x2040 is used
+      for the JPEG core engine on SM8250.
+    maxItems: 1
+
+  operating-points-v2: true
+
+  opp-table:
+    type: object
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+  - power-domains
+  - power-domain-names
+  - interconnects
+  - interconnect-names
+  - iommus
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,camcc-sm8250.h>
+    #include <dt-bindings/clock/qcom,gcc-sm8250.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,sm8250.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+
+    jpeg-encoder@ac53000 {
+        compatible = "qcom,sm8250-jpeg-enc";
+        reg = <0x0ac53000 0x1000>;
+
+        interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
+
+        power-domains = <&camcc TITAN_TOP_GDSC>,
+                        <&rpmhpd RPMHPD_MMCX>,
+                        <&rpmhpd RPMHPD_MX>;
+        power-domain-names = "titan_top", "mmcx", "mx";
+
+        clocks = <&gcc GCC_CAMERA_SF_AXI_CLK>,
+                 <&camcc CAM_CC_CORE_AHB_CLK>,
+                 <&camcc CAM_CC_CPAS_AHB_CLK>,
+                 <&camcc CAM_CC_CAMNOC_AXI_CLK>,
+                 <&camcc CAM_CC_JPEG_CLK>;
+        clock-names = "sf_axi",
+                      "core_ahb",
+                      "cpas_ahb",
+                      "cnoc_axi",
+                      "jpeg";
+
+        interconnects = <&gem_noc MASTER_AMPSS_M0 QCOM_ICC_TAG_ACTIVE_ONLY
+                         &config_noc SLAVE_CAMERA_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+                        <&mmss_noc MASTER_CAMNOC_SF QCOM_ICC_TAG_ALWAYS
+                         &mc_virt SLAVE_EBI_CH0 QCOM_ICC_TAG_ALWAYS>;
+        interconnect-names = "cpu-cfg",
+                             "sf-mnoc";
+
+        iommus = <&apps_smmu 0x2040 0x400>;
+
+        operating-points-v2 = <&jpeg_opp_table>;
+
+        jpeg_opp_table: opp-table {
+            compatible = "operating-points-v2";
+
+            opp-100000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <100000000>;
+                required-opps = <&rpmhpd_opp_min_svs>;
+            };
+
+            opp-200000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <200000000>;
+                required-opps = <&rpmhpd_opp_low_svs>;
+            };
+
+            opp-400000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <400000000>;
+                required-opps = <&rpmhpd_opp_svs>;
+            };
+
+            opp-480000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <480000000>;
+                required-opps = <&rpmhpd_opp_svs_l1>;
+            };
+
+            opp-600000000 {
+                opp-hz = /bits/ 64 <400000000>,
+                         /bits/ 64 <600000000>;
+                required-opps = <&rpmhpd_opp_nom>;
+            };
+        };
+    };
-- 
2.34.1

