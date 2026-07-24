Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2C644B68B
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 17:15:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784913359; cv=none; b=hoz4N5z9LJL/NMUp8YyOiUmbOF2fymT09vcpnMzLpOc4Zf3K0fMPU44GUmvyMhwZ+V/FBymWDdf6bDkCv+EsHpUa5m6AT+o4txQ/8spDo0IQ5inM8I+FweLgGz+0I6J5FJqkdLJyRZHqk6ziMFUGYOyObEtVgY4tLEM/ttC3K1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784913359; c=relaxed/simple;
	bh=d33pkSW9nPc9MCgHWFfBXQOlBDzUOdEtM4193pjNTtk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EnBOX20cARf2CZ2B95uIBtyCfm99dB0PQn48e+pXX0hL60AvItlWSi6ZHIAcfAoUDanPMGTc1ndrACsCAjKL3qCsGQufOKRVybA1yfMqU3/vEdqEMSOxReHClRpk+5e306sgr//uuLcgPMFf2Uivnq95vS8lrSyLKr4PiFoszxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UPZg/vNj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xl93lh7H; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UPZg/vNj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xl93lh7H"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OGqbCP3793524
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 17:15:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wW4jUYLc4ca2lHnf7nWV9JJ9uZ2/873zGPv3zVi76nc=; b=UPZg/vNjx8NKTWjZ
	thtWHSVOTO/I9NnlHlm3a/Gz+GPrnvLsFbh7DIZy46l/steuuISSw33Rv0Fqv2lb
	G6BA+GYtqxf1ocKGos9Cg6vVEMQ3mR+ZDVOHoVaWz6162tjYL8T92yQiFZ9xbieP
	NjSzx/8MoT+GpUZxqztvtbzMOY9unTiMwucmXplqBmKyWSTIYNPUVXQl0Oz1SFCD
	c/zaYNWcrXu7qHkWvCebKO0teIEEIOA7EAHO4WwNUzEe3Sps+XKSTRkOlmBt5t/R
	TY9tIqsjOYu5qrHaGZRMiO64txLI6EkAcVGo912zPOaqoZnHc99M5DGb0GliVpy5
	iPyGgw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cf10bh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 17:15:56 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e11baa66eso690253a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784913355; x=1785518155; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wW4jUYLc4ca2lHnf7nWV9JJ9uZ2/873zGPv3zVi76nc=;
        b=Xl93lh7HiClbjb0WOfYFYT+BWksCzYflASBd5ELv1atICIztglO6j3Aee9CkZCwxdE
         Orm1xfrDKCetIS7ub0hP/xAwCY9tjONDte8X53vp5o0w9eGq1MUQ/mZyctMdNHnSS28/
         PJHxhLkaQkoj+SfC6+a5c4CDd34fYeNofdKKMLAZFlmQq16q3Pub1SaWqa+op6SBBk+F
         yd1FBQRY8kyHced2nAsLNOvOvVGjQWGsrDdttgq2yCttOGILdnIvLFtlN1M9vTNi6UZs
         aGf4yVN4kKedM+oO9v80WNH/uhAGJCTQSST+i8VBnyLB4o5GKmIFNIUEP1/esxovEq7u
         eOfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784913355; x=1785518155;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wW4jUYLc4ca2lHnf7nWV9JJ9uZ2/873zGPv3zVi76nc=;
        b=LZm64B+KZQbFlKYSFDSTay22w871ySnjYw5oEGoFXGMZKAt2tl3bKeudpp+qhQC32x
         94QB5UixXo9cxsCS1nYR7m2o3c8evmL72XZJ0IxkUGkI4cxh3Te+jQSc7u6g/mpL+wO2
         flA1HozPT417A8/2N9bJJYJwISundmDwvWi5eQVstRxOTEEZITimlnGYhMlFVnECsDBY
         +wcKCjzchxpolkVqAlsSw3PFdy7J1S7Svw22QHucT9o0uUKjlM0opIDowWcwPfqxVQRn
         2wnooCK+ySlniuOa5gJWHrr43hVCBiiLdR3fi22mxai2I2JAG0PkFgjACK6DEbIalXmE
         jwrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr41xnVn4Ju+LJ0sG64uFnoLlUrpBvxQRzSuh9m6Fj+yZ5M+YSxXJIcJgAsbCQbUdrfwDgxBh0LE2Hardcs@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf3iz1+2Sh0hfZoJ+pGZHmj2U5Qgsx1npOoP0C8QSoDK6rksuY
	g/McNam1EqHx/iwPahNHMZRZazlPaB8Oc4gOsvLf28JvMFWLn9RKrj1BoZB4uVpuAW+8lg6gQq2
	8or3XkXEbx2m7SnBD6b9g3Bwk3KO55vZ+fmihaJrp2Le3M55NLs6U719soWexb8WMjBwyOL78DE
	hD
X-Gm-Gg: AR+sD120lhhwu3a2gzqhlVRRdyxd7EPPNJ47A4T0Tpk6KpzbeDWPXSLG51kPz8fAUF8
	6pXxzv8SJv0l19m8xPr69peZ7Y4KImNGhAd+m1V5d4xy2nwWe3d19LITlA3CskR55sNIaUqCKOw
	tK3cbRS18S4Xkmk9m3pnZy9DoGyHcXz0fGZuKsBiAAGOwK2q96YmbMWyGvtXr2OpU/4Vn8r0+d+
	GXnCBjl/wtj+oMYqpbul8WvAqxKzWKQJ8zMwUv1lS4+MLbWeitwcaFXY9Y8ARiqweqCkM6xYO1S
	RAuX49n2dGEYp/mWalaBTMvmEKt1TuQIMgZ4RvEUaCBT24kXY8OHTHHnTUmptX560FZSC1AAZOO
	vb9ngFXlxPMwUV3IxUtOJ+TeIamBL25s=
X-Received: by 2002:a17:90b:5650:b0:38e:cb1:8ec9 with SMTP id 98e67ed59e1d1-38ec661b520mr8030871a91.42.1784913354876;
        Fri, 24 Jul 2026 10:15:54 -0700 (PDT)
X-Received: by 2002:a17:90b:5650:b0:38e:cb1:8ec9 with SMTP id 98e67ed59e1d1-38ec661b520mr8030826a91.42.1784913354373;
        Fri, 24 Jul 2026 10:15:54 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d2eb01aa0sm8400892c88.3.2026.07.24.10.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 10:15:53 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 22:45:32 +0530
Subject: [PATCH v4 1/3] dt-bindings: clock: qcom: Add Qualcomm Shikra
 AudioCoreCC and AudioCoreCSR
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-shikra-audiocorecc-v4-1-0a89bb13d817@oss.qualcomm.com>
References: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
In-Reply-To: <20260724-shikra-audiocorecc-v4-0-0a89bb13d817@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfXzVErpjgolJk5
 /ltbrM4z5P1WvDmqcPLq2UY5K/8+xVyeEUZPFMg3FqmdpcH6DH1u5qVwz1LMgZS1jRKmseqPhKS
 kTt/lgYXsboh+CETffhd28BXQkwWt/8=
X-Proofpoint-GUID: 2CXuIJGZ6ZhKCNd6RW_Wf7urZtq_Wx4F
X-Proofpoint-ORIG-GUID: 2CXuIJGZ6ZhKCNd6RW_Wf7urZtq_Wx4F
X-Authority-Analysis: v=2.4 cv=er/vCIpX c=1 sm=1 tr=0 ts=6a639dcc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=Z3K_AQPDDkgJnXkyaHcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDE1NSBTYWx0ZWRfXz111akvgUAwW
 Xi6m6PkfVUo8MTq1+8LAXmdejkxQPYljuO+JbKsmIdl6O+8TlGdOhGJGjYXQ4Vh7/wyhIpiSqGV
 rnLXSk2EG/jC5s1SmlWVFWeLC6A564kW0zK7oRHt7P5SbEs5Zo3t5d+v6e6sfU1J3Cw6801VT8h
 fmH1Yf2AdKF/lvjPrNruKfWbD4cGvhbpDNa9vDZ69M1yEfsQV1tey7l0621mencts1GEDBdOmV4
 54OLAyieusHny8QQB44PvZAIsOfCPsPHxEB+MpAoMgNZDvUx9F/vXRQzSZpHb5J8BwAOb0j2I6r
 Pnb7UIKJBMhCeStLGA8G/EhGKPuwYgjVokkVu+zVHayQTfUxGKhDYtP8mbMe1ZqSk8c9x1BH1i/
 7F/KJf2WEMKlyQD18NVta74W7GwRjvMDNk6efMuf1jhAJ01dPLV3RkpHg5h07D4791Iviqzgd+p
 V/o7xcZLwPBntdqVN8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240155

Add device tree bindings for the Audio Core Clock Controller (AudioCoreCC)
that provides clocks and Audio Core CSR that provides resets on Qualcomm
Shikra SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 .../bindings/clock/qcom,shikra-audiocorecc.yaml    | 55 ++++++++++++++++++++++
 .../bindings/reset/qcom,shikra-audiocore-csr.yaml  | 42 +++++++++++++++++
 .../dt-bindings/clock/qcom,shikra-audiocorecc.h    | 49 +++++++++++++++++++
 3 files changed, 146 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..d59f7e47a0d7d9ee9def49be9954038e43785e91
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,shikra-audiocorecc.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,shikra-audiocorecc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Core Clock Controller for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+
+description: |
+  Audio core clock control module provides the clocks on Qualcomm Shikra
+  SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-audiocorecc.h
+
+properties:
+  compatible:
+    const: qcom,shikra-audiocorecc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board sleep clock
+      - description: Audio ref clock source
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmcc.h>
+    #include <dt-bindings/clock/qcom,shikra-gcc.h>
+    clock-controller@a0a0000 {
+      compatible = "qcom,shikra-audiocorecc";
+      reg = <0x0a0a0000 0x10000>;
+      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
+               <&sleep_clk>,
+               <&aud_ref_clk_src>;
+      #clock-cells = <1>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/reset/qcom,shikra-audiocore-csr.yaml b/Documentation/devicetree/bindings/reset/qcom,shikra-audiocore-csr.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..bfad1d20e7cd1281c4c182d5f9f887d8c4c86125
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/qcom,shikra-audiocore-csr.yaml
@@ -0,0 +1,42 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/qcom,shikra-audiocore-csr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Audio Core CSR for Qualcomm Shikra SoC
+
+maintainers:
+  - Imran Shaik <imran.shaik@oss.qualcomm.com>
+
+description: |
+  Audio Core CSR module provides the resets on Qualcomm Shikra SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,shikra-audiocorecc.h
+
+properties:
+  compatible:
+    const: qcom,shikra-audiocore-csr
+
+  reg:
+    maxItems: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    reset-controller@a0b4000 {
+      compatible = "qcom,shikra-audiocore-csr";
+      reg = <0x0a0b4000 0x1000>;
+      #reset-cells = <1>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,shikra-audiocorecc.h b/include/dt-bindings/clock/qcom,shikra-audiocorecc.h
new file mode 100644
index 0000000000000000000000000000000000000000..0e64a42523f1ec4213ce8cbbbe6f8262d414f0eb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,shikra-audiocorecc.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_AUDIO_CORE_CC_SHIKRA_H
+#define _DT_BINDINGS_CLK_QCOM_AUDIO_CORE_CC_SHIKRA_H
+
+/* AUDIO_CORE_CC clocks */
+#define AUDIO_CORE_CC_DIG_PLL_OUT_AUX				0
+#define AUDIO_CORE_CC_DIG_PLL_OUT_AUX2				1
+#define AUDIO_CORE_CC_DIG_PLL					2
+#define AUDIO_CORE_CC_AIF_IF0_CLK_SRC				3
+#define AUDIO_CORE_CC_AIF_IF0_EBIT_CLK				4
+#define AUDIO_CORE_CC_AIF_IF0_IBIT_CLK				5
+#define AUDIO_CORE_CC_AIF_IF1_CLK_SRC				6
+#define AUDIO_CORE_CC_AIF_IF1_EBIT_CLK				7
+#define AUDIO_CORE_CC_AIF_IF1_IBIT_CLK				8
+#define AUDIO_CORE_CC_AIF_IF2_CLK_SRC				9
+#define AUDIO_CORE_CC_AIF_IF2_EBIT_CLK				10
+#define AUDIO_CORE_CC_AIF_IF2_IBIT_CLK				11
+#define AUDIO_CORE_CC_AIF_IF3_CLK_SRC				12
+#define AUDIO_CORE_CC_AIF_IF3_EBIT_CLK				13
+#define AUDIO_CORE_CC_AIF_IF3_IBIT_CLK				14
+#define AUDIO_CORE_CC_AUD_DMA_CLK				15
+#define AUDIO_CORE_CC_AUD_DMA_CLK_SRC				16
+#define AUDIO_CORE_CC_AUD_DMA_MEM_CLK				17
+#define AUDIO_CORE_CC_BUS_CLK					18
+#define AUDIO_CORE_CC_BUS_CLK_SRC				19
+#define AUDIO_CORE_CC_CDIV_TX_MCLK_DIV_CLK_SRC			20
+#define AUDIO_CORE_CC_EXT_MCLKA_CLK_SRC				21
+#define AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK				22
+#define AUDIO_CORE_CC_EXT_MCLKB_CLK_SRC				23
+#define AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK				24
+#define AUDIO_CORE_CC_IM_SLEEP_CLK				25
+#define AUDIO_CORE_CC_LPAIF_PCMOE_CLK				26
+#define AUDIO_CORE_CC_LPAIF_PCMOE_CLK_SRC			27
+#define AUDIO_CORE_CC_RX_MCLK_2X_CLK				28
+#define AUDIO_CORE_CC_RX_MCLK_CLK				29
+#define AUDIO_CORE_CC_SAMPLING_CLK				30
+#define AUDIO_CORE_CC_TX_MCLK_2X_CLK				31
+#define AUDIO_CORE_CC_TX_MCLK_CLK				32
+#define AUDIO_CORE_CC_TX_MCLK_RCG_CLK_SRC			33
+
+/* AUDIO_CORE_CSR resets */
+#define AUDIO_CORE_CSR_RX_SWR_CGCR	0
+#define AUDIO_CORE_CSR_TX_SWR_CGCR	1
+
+#endif

-- 
2.34.1

