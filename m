Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72AB64A8D
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326019; cv=none; b=DYzM3F3HyASQ2NGowt15TZfVm+S3BdsKN6d6dzo5Q/al/uLUvWoEZkij7B64ugO+wtdtSjzIxDYxgOl/fVtin6qLhJ5rgfhWKAwhr5F7njcwUEKswy9zfpGGIWPF+7FOoxUSKX9I7q1cxf5M+QHt7/VJ7dZA84nt37ijReDygEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326019; c=relaxed/simple;
	bh=xhxIA7Wnqk3AsQNrfoSlf+f+2hDRBWo7ifCUUnxI5LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iGT22B4N8hipsLmmZbhp7kf8OY25zjb8K2iSQHA3SWkagowv+9V0hfre66cOBDXS/wizRg8j7LwTySire3M7nGbyB0he9GbG/P9Hk407weirtkwvBV++U0yIP8WyUuAxk+N4QF4xNVBOADbdSzbmI0PAhWkWpdUat364pURmBJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ox+TPQ4I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ua0mOtIi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ox+TPQ4I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ua0mOtIi"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yi6C4102869
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:46:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+yDeC3B2RiB
	ycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=; b=Ox+TPQ4Ic/Vkj/LiIilebPImI2s
	OCUTYvJLAE/64M6JYrWbQOyLJ7eFI/03p9DjfB1ibi7Z68F9ShjHa5MRlE5va0a9
	3jpYrph1daX1rC9NcawOYbfTY2NYG23rBYcmC+Wue9Ci9oLXL0smkJlbYGGkopYe
	hsHaMbCB8qt76k9RuPnzcx4RYYTXfnvZlFk3BpXvDzaGyRv107CobCbybUKzh9rC
	PQ9uOQURmJx/uQ8pAw76bWb5pj6uwfk0/zXHP33t0L6mUAbbKVUJl50bp5L3dGA2
	Gy2qJ3FkvO2Izxpa+F1U5ZOASyjyX/GvxJT8VtEqAiu/wvVSHfmEAMTQeUg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw5q8ujec-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:46:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93be6ed214eso131612585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 01:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790326008; x=1790930808; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=Ua0mOtIiZPvM3YgLgGpi8pZ3NTRuXLJ+BOgiI0mdCugxV3M6i6Osi3SgbxXjPw+me9
         4W8cJzI8+rLSGPomAlorxgOjkadtJ/sok0upb4F+4uLnWbqBuO7HjvEPjm+/L2KY5O2m
         P5vXLUeGOXF1n82J4YrkY+JX8GO3hy1zrWhBjGjaLtlneXECOijdXjAeqfosZRiW/U69
         gaLlV3w7mwJQzzJXNrhk3njd48zBkBGa9zUx87GoZOjuI9kVhi4jJR+JMnwLh6hCkKT9
         hP0qNvrgq+RPV1X5L4XmbUv14fteRBLF/BG8ihP0g2gaFsYBNKgacrsooGBEcfWzdwao
         FuAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790326008; x=1790930808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+yDeC3B2RiBycyMmfze1FG+9+MWYoq+9jpdfX+2cBFU=;
        b=XtG9EtD/rkMPb2UnRQJ7HHMfEOkLxwXKZuWFUW+gEzPs+CVMOxYQdagKamy1IfUwgf
         46+g6xDmDcPzAWA3iCzQV0kjeEFnKi2X3BX8Fu2ElTlisBYXC+oDlmTHo0F8KfRsCl2+
         T/59HZZKRTkBgxD01YbDo44L7fjexOCszUQ15bzPfAsOFsHSfFfU+MP5ZvRJA+eQ019n
         y8ZlFK2PsWwTpUcdiiek3u2Wb8NrH5Dw4Z+2pxuXAQtiNn0BbiHBdrTWPQGIaX2GxSTQ
         kkHHHIyXlnCDohHnzLDFnVacF/nzvrPxgULXv2ZVslMKUPj4vHqAv3DijMoyYSAMxepR
         bg/Q==
X-Forwarded-Encrypted: i=1; AKwUvBzX1/V5s50EzyfN4s1qWUL1O/+sPek7KwlLZkPRDHySuxro7t8LopN3tzTAJ6znQzJ74jI5dBtYWQE9b2tn@vger.kernel.org
X-Gm-Message-State: AFuF++lEDIS6tsIQDSd0Zdr+jdqgfBBQ86WeDnw6xBWyBgOuo6FqpGD6
	RuvjggIPUj0ZpDXI0T4UQaif8Fxc6GRZ+Bwky+ALzhNj9aQwx6M8w0CRhMaoa0tK1ri6c5cwmlU
	6zBN5hNFeiM6O6ttZXqa9gy4mxFCC3+4+FQxBAawzr72M4vZ9TsjuSOjxJ18SllJbKlrh
X-Gm-Gg: AYBFou2RfQkqdJp1M+OlWG0pGZ4iKFac3iDU7z11Dix0oL6D2v7KuHr/HB4dIV5ZhPj
	NlGU28gy+2AZsES2F422hnjHGYkj3iK2XWy5cZsfydkeVa+tHAHYaGsQacJSbz97tuveEISuHDz
	oeZP8mdHuzE+0X4Y3jNZ9NtuuqZ8xROp/DGE9eDb1LIDtCs6iL6+TK3qBFx13gJUOpod7Y9lBV1
	6k5hLPNjmCt31xSD49Ca3gIW/TsuhJf62VccGAeXhu1PR1evEbbGC1+0eg8QWe70cuNh1NyS7UI
	Bl8cSSV+ZRKxzNG1apYO3NOXkYI6mL7JXxtCFMTK/0HweWIfv0QJmPUO4+pIMkJVtZTwNBTCxEv
	/SIG0nD+YfNER
X-Received: by 2002:a05:620a:40c3:b0:93a:c102:1123 with SMTP id af79cd13be357-93c43bc8ee5mr325647485a.15.1790326008345;
        Fri, 25 Sep 2026 01:46:48 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93a:c102:1123 with SMTP id af79cd13be357-93c43bc8ee5mr325644585a.15.1790326007881;
        Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f9bcsm5281953f8f.32.2026.09.25.01.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 01:46:47 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: clock: Add LPASS AUDIOCC and reset controller for Glymur
Date: Fri, 25 Sep 2026 09:46:32 +0100
Message-ID: <20260925084635.112399-2-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260925084635.112399-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX5mEZvosTGgvW
 EEdEKEKh6txVjHitPnDzkRxGScTK5J3Xf+M9dHje8dmNtb8lZ9WcXdnuWP34sdJ8+Ya9l0wc+jG
 uqnrUKFw4BGQtO3yQNGiP7nVeJHDvgE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzNCBTYWx0ZWRfX31qDWjLCRxlK
 Wh7V77IgggmGWSe+JbFZB9cXBiS8c5Rkwy7Z0LzsFi3Y2P6m/1oT9JFpUtEjgjGyHc0+HjDd2T9
 Gpkrnl9fRRwku7xohRc7O7gOy7koctvdx8Z291+CzAceLujPPPGZGvmLTh2dYtFOpAEdZy97BDD
 NZVEgv22hCc2kC6HizgrfGZOYfZlIU2SiIq6ayYUh/zkYWseBaM/Baq4J40ZHAGINROR36mat+1
 cFMGkkyH3JkgFr96bbkLWe8LeP3ZUHiO6AgFl+grgkYrgCyXZwqxnZyC6jDppSw8SK/TrJeaYnY
 KI2qSoqQxYX3M4tsM6IQHXhxpAL4s3PFlT8+TZqLlBN6cngD6KKkvQXgOmx6mVXoOrrDup10Ss5
 G/PRCnOHNFXQczVqx9MQAkNxD4i6LrFAnjaZtXpVoD+Wi+XRIoLziQE86shz0zhVERiNRZrTVe/
 2+nHJCJtDfqPw/0fSOg==
X-Authority-Analysis: v=2.4 cv=SYRi5fRu c=1 sm=1 tr=0 ts=6ab634f9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=yiKMOllxs-7wBVDooBUA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: JbWoEH4SvKN5BsU4_nADn6EFek0mD7K2
X-Proofpoint-ORIG-GUID: JbWoEH4SvKN5BsU4_nADn6EFek0mD7K2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250034

The LPASS (Low Power Audio Subsystem) Audio clock controller provides reset
support when it is under the control of Q6DSP.

Add support for those resets and adds IDs for clients to request the reset.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-lpasscc.yaml   | 50 +++++++++++++++++++
 .../dt-bindings/clock/qcom,glymur-lpasscc.h   | 16 ++++++
 2 files changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,glymur-lpasscc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
new file mode 100644
index 000000000000..c047c0174a93
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-lpasscc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-lpasscc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm LPASS Core & Audio Clock Controller on Glymur
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
+
+description: |
+  Qualcomm LPASS core and audio clock control module provides the clocks,
+  and reset on Glymur.
+
+  See also:
+    include/dt-bindings/clock/qcom,glymur-lpasscc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-lpassaudiocc
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-lpasscc.h>
+    lpass_audiocc: clock-controller@32a9000 {
+        compatible = "qcom,glymur-lpassaudiocc";
+        reg = <0x032a9000 0x1000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,glymur-lpasscc.h b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
new file mode 100644
index 000000000000..3006b12e385e
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,glymur-lpasscc.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+#define _DT_BINDINGS_CLK_QCOM_LPASSCC_GLYMUR_H
+
+/* LPASS AUDIO CC CSR */
+#define LPASS_AUDIO_SWR_RX_CGCR				0
+#define LPASS_AUDIO_SWR_WSA1_CGCR			1
+#define LPASS_AUDIO_SWR_WSA2_CGCR			2
+#define LPASS_AUDIO_SWR_WSA3_CGCR			3
+#define LPASS_AUDIO_SWR_WSA4_CGCR			4
+
+#endif
-- 
2.53.0

