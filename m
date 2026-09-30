Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3644E780D
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779958; cv=none; b=RUkkO3mjTHCOSFjVgkKkXliO9d5hJvgQWcrmcbsZ++ae/kXP3nevj3crDw8iFM4H9xLnZCayNq1BOdhfAO4k8wixJV2EeHhPa8HQ2Dp1eNDauqlg6MPFMOjDMjIcaZQsIU7TK9t3FYe4X1ndk3euMgjy9lIrnTo1B839mPTimXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779958; c=relaxed/simple;
	bh=AZzAXwiHHu9XZEBWoWxjc+qlmuW/9zpL5mYJCWh3B90=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RqONt86MsLpXtBa/bKpeAecyKwSz4+mLszOY9lM1qZuO0Tclx7E4QWGU3jNoeu8ccW8fRKOEgqX+ykf/xyY/nD9GPjNcERwrsrVEOUfO8wjyMjEKKdcXcpA7ZdcKodi6jtTqwGpCokEH2viA7EuV2Yw6A2eNUrZ0HXfDyc/YNIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gIXx5H4n; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRLAd0NY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gIXx5H4n";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRLAd0NY"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE0F1h2406281
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5MQzMnZzp1O
	3Wb7yPZlYEZEBfKkuYTfPW2YrtjSZsDs=; b=gIXx5H4nh3APUmWzu3OzN2slN4F
	77R6IZACbUdAfF4Ycfz6vlQcJAzP+ScK9V+egwmyfaepZa2TYtEMNsKwdOarI7vO
	I+JcUpJnlX/N8MKLkvovgH3P0s9+xNyIrHmP45M/1GIw0XDOpby4Rv2kGsuwweYc
	uvB4irExVRAWwyj2VTCI7i/gBd1wdf0PU/5dtOIFWqUPKHb2gUaTvs6Sxf5KspdZ
	krFWPyIF/GxDjejYHmzTQxVvZpi/irLj3NRsHnTJRxnp6B6QZ13IHcHSUjcTWW/Y
	EHz9Wyw6rHfx3FhVowCVZscOJISQhugEhALJIXyg33bGSDDpIASW927vWtw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c1wv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:29 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34afa104860so2738046eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779942; x=1791384742; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MQzMnZzp1O3Wb7yPZlYEZEBfKkuYTfPW2YrtjSZsDs=;
        b=BRLAd0NY3ki+CyICmQEzCe1whN+HqiC4fNWxf8DE3rCHFfszWtmsjJBlyuYiKJIK6o
         xguI8r7RbHxIhobmfEHh6rFSLdbaiJF/tQGAqAJ3hLlT2erMmswwF6BdIYu4sQZj47r5
         HaGFVAHv2eAlIBYe9yEDgf+P7fpUTsZJ+LMHY0hu4845SPCCa7W+yvbGF7Lhqfvm/Zw3
         ok/jIspNUeR8c95HBNPDx5tyK86bJTFW9tzZ2EBv3pbClIU7nzH+zROhAbrkoP48Fm/1
         d1asxjSKKaUpThQgGmMnkaU3F7Eyk2DZTv5fKqrG3Ro8NE2VUnZFKKS9QcCjz89q16z1
         sH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779942; x=1791384742;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5MQzMnZzp1O3Wb7yPZlYEZEBfKkuYTfPW2YrtjSZsDs=;
        b=Y8NQ70dSZi015/sOcknQPdi0zrkjawHRVY92817xirbnRRbyxFMKPNknXkFgPG+ky9
         deA6TWZ5ui3K4tNvRDbQk1NbRIRk8XRjIIEDfzfqYb5gY161XXSDJOJ83/hxFtA5zNR7
         +RgoonPfUkjbfPKu/MT4Q8HJXSaFy/TKAQ2m1gMpnDNWq1ClGlKwAo1W2vvpjnPJyIRz
         HLsG556IPwn1pYQStsjMcGQzwRBraTEDwouutSDDPljgsbrQFqhJP6LOUvJwnKq7HAmu
         imXWQtAz9e+ZsTa3bGbs+siG1m8Q8xnIJI8jg7R372z3wX0WFPdZkWhDEBHZ4fv+oFwy
         No1w==
X-Forwarded-Encrypted: i=1; AKwUvByMMdRH8fijGiL8JuizXU6xrsoBdSW75ZaT7Zf2NVOVf7p3yrawcykT2DplVBBT8Qcb1ok5iYY2/wuzsJNY@vger.kernel.org
X-Gm-Message-State: AFq9FYJjWfgkKWxQThUgDzt2REKSfx10u7XF1V+WqHGCiWiNED+MGqi3
	GaL9AmCfKG2A6y1BIrMwQURSpzf4BTGyRwfgQOyEyXjPjyaFLmgPC4Ir7NiKKaCuupPFfsSXzsx
	AfBL9yhIWespLPYwqaBUt64v2jbwLghXuWXxfNXehu4Qfg6s9Pmeg7Q5lM/mI4nhFs1Xv
X-Gm-Gg: AYBFou0SYSaTpR9yRI+X03eW0FR9/Nhh/tAN3KKejJtzhHnUclST+Ve1Wkk/YmWq4gu
	Si+MzYxqrvtMJzSdrMsS0T+DYz1e17xDnxg8GJXjahZxMer0S8L34m7nVPQkmo73U8F8s388m3N
	ez40VlfOTWrncz4wwgh7HXq2H0gD/4UH7cMd847m3N0XBNMd+ucay2o7C0SHsLBtGueRBXxucA3
	dPjScJebkRjFn9Q/7PLHLQRA5Y2iqYDif6eFw5QFAUCanYGqmR/HTUGVy9CJPWbD+EzHq9iiEoe
	TyEWD1bTB7Tt0pBQSHqXr3jRr79lbzEaIjKSABVuL3Pe/sCFSF81Jdru9axl6cbKokRktkkwH9f
	jWupv0xesM+Twn3UMYLeZsfDmrHlFv8hg4uR27Qm67wvEaKgf3l6o+Lc=
X-Received: by 2002:a05:693c:87d6:20b0:34c:6942:8a47 with SMTP id 5a478bee46e88-34cdb8e6084mr1938456eec.8.1790779941346;
        Wed, 30 Sep 2026 07:52:21 -0700 (PDT)
X-Received: by 2002:a05:693c:87d6:20b0:34c:6942:8a47 with SMTP id 5a478bee46e88-34cdb8e6084mr1938430eec.8.1790779940718;
        Wed, 30 Sep 2026 07:52:20 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:20 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 1/6] dt-bindings: soc: qcom: Add QPaCE binding
Date: Wed, 30 Sep 2026 07:52:10 -0700
Message-Id: <20260930145215.3380977-2-georgi.djakov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
References: <20260930145215.3380977-1-georgi.djakov@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX4u6xB9ZujMVn
 tbRdcuHSxcCLFlsaYUkbUUbGCS5JFa1j7Q1RpDRaq/wIXKv/Xl0CS89EkSXwV9G/ysS5G+m1y9s
 Au+m0xXk6/PHl8ClzaceDjwRAlogpP8=
X-Proofpoint-ORIG-GUID: v7ltVqBnOZTZqhue68D-Rprj25fSlCfu
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abd222d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=P4ADLzTW1IxIBgx77pIA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: v7ltVqBnOZTZqhue68D-Rprj25fSlCfu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX0Wg9Ek5jrGjM
 Srh8AYneQv7ECd3WmE9nxkpso5Z3s2FIxlY2QOQNu9FAzkqNp9YRnrtGS7UKHqODuBuV1cSPXWT
 Alm3C1WyxE51IzthJagbmoCNzfX8VtoOYldFnHp/Mhlm3c7AHwtj/816mF5HPs66R7qzYJU/xrd
 eV6ksmKxIxthK+vced7mPtY0CH5hwcNYAaJhAfYzMOJ4dtbdIFQGZOqEclOcNmU3JiW2DYAhJNH
 HiyRyi7Lf8+KvBxDs8z210edBePE1X0KPYZCmWv1BJug723d1LON8D6OMa3cLKX0tW5Wm2fm1Ho
 HeRB63tnhv0ttJWBUxbMr5bcjZzGlRiTCM/9VHar9YCkq1WhcTv1MU8VNswzPNyMxH0gmu2v02e
 d0XUfaBKUjoIj1mib6xR0JM+/C6a6LEFWd1YhkrrHPmabLNb3fcDivy1cFhWfq1lsQonsIM+M+V
 jKmE2Gfw4a2e7rhznVA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059

Add device-tree binding documentation for the Qualcomm Page Compression
Engine (QPaCE), including the resources needed to describe it in SoC device
trees.

QPaCE accelerates page compression and decompression for use with the zram
block device.

Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
---
 .../bindings/soc/qcom/qcom,hawi-qpace.yaml    | 94 +++++++++++++++++++
 1 file changed, 94 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml
new file mode 100644
index 000000000000..b7ae50f34f16
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,hawi-qpace.yaml
@@ -0,0 +1,94 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,hawi-qpace.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Page Compression Engine (QPaCE)
+
+maintainers:
+  - Georgi Djakov <georgi.djakov@oss.qualcomm.com>
+
+description:
+  QPaCE is a page-oriented hardware compression engine found on Qualcomm
+  SoCs. It is composed of a number of compression, decompression and copy
+  engines and exposes both a low-latency urgent path for synchronous
+  single-page operations and a high-throughput ring-based path for batched
+  asynchronous requests.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,hawi-qpace
+
+  reg:
+    maxItems: 1
+    description:
+      Single contiguous register window covering all QPaCE sub-regions
+      from the GEN registers base through the EE registers.
+
+  iommus:
+    items:
+      - description: IOMMU mapping for compression engine read DMA
+      - description: IOMMU mapping for compression engine write DMA
+      - description: IOMMU mapping for decompression engine read DMA
+      - description: IOMMU mapping for decompression engine write DMA
+
+  dma-coherent: true
+
+  interconnects:
+    maxItems: 1
+
+  interconnect-names:
+    items:
+      - const: qpace-mem
+
+  interrupts:
+    items:
+      - description: Ring completion and bus error interrupt
+      - description: Urgent command completion interrupt
+
+  interrupt-names:
+    items:
+      - const: ring-and-bus-err
+      - const: urgent
+
+required:
+  - compatible
+  - reg
+  - iommus
+  - interconnects
+  - interconnect-names
+  - interrupts
+  - interrupt-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interconnect/qcom,icc.h>
+    #include <dt-bindings/interconnect/qcom,hawi-rpmh.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        compression@31400000 {
+            compatible = "qcom,hawi-qpace";
+            reg = <0x0 0x31400000 0x0 0x80000>;
+            iommus = <&apps_smmu 0x1c20 0x13>,
+                     <&apps_smmu 0x1c24 0x13>,
+                     <&apps_smmu 0x1c28 0x13>,
+                     <&apps_smmu 0x1c2c 0x13>;
+            dma-coherent;
+            interconnects = <&gem_noc MASTER_QPACE QCOM_ICC_TAG_ALWAYS
+                             &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+            interconnect-names = "qpace-mem";
+            interrupts = <GIC_ESPI 72 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_ESPI 71 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "ring-and-bus-err",
+                              "urgent";
+        };
+    };
