Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB51442B1C
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 10:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786012501; cv=none; b=X8o5HkKRGSN8FT7MWbUgHK2Np27BN1FsSnJC3uQPbqWxpxZUAbhZ9LdfvGaR1EtEsKtplcyy6xVvODAv3RGo0NrliMvnhwd1mui4l1beKuvRKSFl3qZ8JRvSr2V+Gv1v2yC6lVHtMhoc9s+4bcTWBTMm+2Vy204sdgtAKr7vnto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786012501; c=relaxed/simple;
	bh=bAnJzL5nLMKzmc490vK/S9JEOOf+TuZ+2sbk011AeJA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dOvRIkQjF/yP26/pdagZKhnWgx7TM2E75w9zvfN3GuXvd2KMsmfNQ197JbjjD2Girox7KE3R4PrZaxduqMQq0chdcpAhRZawslvNXeME9bc+2/4HQLk++8ny3oPb/JTrZeysQFAwMdhkmJJx750wsTD2oiVkEH1oJak1DEhlohM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NBi6GZG9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZxqJD71q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NBi6GZG9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZxqJD71q"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nd6N1625667
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 10:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=; b=NBi6GZG9XRfhHagt
	zH+IApTp2VtsbO2ygg1kI827cdPE0ftcRJt1pTtQJIkuUAM/1gFez+H26SUHhkxw
	qqOftJ+hBpetUuiQ5Q7oYoz4J8xXlVOj4irY/JFMyi4OE+PRWbZX0uRMNz5rDJ5W
	javcZ9dI99/8PQzfjQYtQ0X2nFimzFsH20hGGkH2A0PDn8zosot/QMysaK62tCen
	P+Bky1PqqbqWjX3oVBBSCxDL1ZBrBKGfwRAcxMxgvU5IU7X7gPvQxsdARP596E6C
	9Go6xYlFINxfBQk5X8kLU1f9b6qDvEkBcGQkW7J8FQTxiFCUwqIYuhDOqPXJHcw8
	M71hcQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvntngspq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 10:34:59 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8488ac68185so5059950b3a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 03:34:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786012499; x=1786617299; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=;
        b=ZxqJD71qkGwWn/mDg2DqvpyZO4+uk67+FElyPkgoaQjttndF0grvzJoQia3tejQ2C8
         5fRRFlSin1KfUGwK4z6clSpSTPwwS0aKzVGFvJNHhdqoeObJe5VYzBYltrGrEn1Cjlza
         9Up2Dec9CdJwhav49JWeUit1Wn9xP3tDvXsu33lvVKHFFvNt8CnFneAQLcFkfRZ95ngc
         4sOVgPnDUtwTyjcDcMRL9wOVWQS17TS4G0dSRkgMcIGqQO0Zik347HoYkl3gyHS4kHGd
         lO1Gm20e6TttPiQK9hZFEruS2dAxUzyNgzAVCl7eb8bKbqwSIv8zqth00z1RVf1Fm5Nu
         bQVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786012499; x=1786617299;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VSDEP9DFxsC2WGKb9Mm8ttM1p92PZNbAVOez4KimUXs=;
        b=OuoFpKnHRRliHG9ngCyuMS0CTA40UQfxCwRthy0z0HE7oChKIUcbxQVwfzKO/ykNjt
         GKkIVhOECMh1m7yAZjWh2poBvbw2yoLfrFWCa2Gc7XxxQJhCT3BtOwYzINs1jq5zKyiw
         MZQuR47tTsUnSZS1ZkH7HKgPMGGujuzv4IWNNjvoA+dHUjweXielcAEpkxKwAE4mN3cp
         fDpdX1LZ5cWqJDrXUdRPSWhTdkUJqYZfQnmac9BdAvJ+0Bb47DOM6Br+zZsG/nR62tyj
         ZHDBzH5NzRpQv4hugABVHdpJQk3J1ceAREJstF/SKv1AbjK422slb1ZjQGvJnpDpI2D7
         UxFQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTPtHBR24xr3sv3/uAQAJR57yxKM/sfUV0tC+jZXLEObrGq6vq4Krcgxs73R5eyroeQuZaPvkyMA+THrv+@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz3b5Pc+Z9aplb33mjZtl/5ZYRJmPQN1fsp9RUXdnrRyNG5gSl
	lwrD2GP8icoXvMdcCZpz7muWZZuMtixcCcqIoCHBEz4caCk9u2s8XwysGgDwkIoPbx7nFBX/Uog
	ipBv81mCM78/xuDx+KJncPhdKo58spO452JRZr9gJQvKAwCkHKAfHY6AmDfIvVEB6S9HJ
X-Gm-Gg: AR+sD13vBv6Chd6S99Ct+z7eI8W5Te9vswlUA5Cmz4UesT+Zu2DsSBCnQhGPNwnINkA
	0ESe48vUh+sz9dkRDX88weFZxp5B1jGlBd5Xnb2uLaDxly/dU5ofBW8z185EJEBz70ZD5RgqsPl
	QLcqrg6sn+9tBon3XBDhtI0Uim6mxbdxls7QUNEoeuP+5icSERuzSVBH3WOAqceJrqtdYoFz+Ug
	x7m3AHGGnuV0RVos2wfoTRsGtEyf/nRXpHWlWz1wpeZRRFs+zEY+VPVqyH6AxufQhnfMBNP45RL
	Td3SYA8COZZHmtvlc8l2jLAYGMG9yPKN61wZSXJk7Jm3+xcvtEREAQMEn+JlwDjPr9fVVbPqa/k
	vzVwKAsh6ZXdM8EhEPqaqFkMj
X-Received: by 2002:a05:6a00:8084:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84f2e052343mr17148341b3a.24.1786012498636;
        Thu, 06 Aug 2026 03:34:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:8084:b0:842:48ae:1d6c with SMTP id d2e1a72fcca58-84f2e052343mr17148250b3a.24.1786012498123;
        Thu, 06 Aug 2026 03:34:58 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f45389e5bsm1141098b3a.1.2026.08.06.03.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:34:57 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:04:10 +0530
Subject: [PATCH v10 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-eliza-mm-cc-v9-v10-5-6ba52dd14343@oss.qualcomm.com>
References: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
In-Reply-To: <20260806-eliza-mm-cc-v9-v10-0-6ba52dd14343@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfXwPlp7PdQwVA3
 0HsJOUSeWXabBK69rUg8eJos0N3zbXNXOx0fMW6u9/JjgE/1vqup6USci4grEYF3ka7Wza2S3Ge
 lt7kb0Y+kCJPpgnxl8qaqlQOQ60ONcfnL/VgeZCUNX2ldWeCx0esZHeJeo/fMuAr37zsqFf1fS5
 QOSIbdZXhRdnqFKyFevDJxJfZRVy1RPQiNdw46+N01PlEzUXv8IqCJ5b2dfI9sPGNn7e57cRTJ8
 i8HQiL1lyAEFTxLwlTpCc5IalJ9w0lnCB8imeH7THjC9x+K1Fszyi6g3mUVmNXlvy63NuxAaHQD
 8N2mBOsCKP8v1czbF2AZjVa7qTC9guUlPqHAAjBBx5Q3YNWLpssQz4xJNl/17DPUiK7uROEAjkR
 Q5e1PQ1e0zE1P7WZMjeGXkjxjBkiusxoHM34ZGFHR/DYtAkuEMlYMgRrEiaJalnSTF/xdk6NmoD
 1pdsbjEAB2wetFPAjbw==
X-Proofpoint-ORIG-GUID: 3T3G7aaXiWoE8w0Xq-wwHuO5q39i1qK-
X-Proofpoint-GUID: 3T3G7aaXiWoE8w0Xq-wwHuO5q39i1qK-
X-Authority-Analysis: v=2.4 cv=LpKiDHdc c=1 sm=1 tr=0 ts=6a746353 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=005LtiolIcJ_eoEmTSIA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MiBTYWx0ZWRfX1tYcWo1530v/
 C33b9/REmX7i7FQ8eoGGouIywle6MOIzWtIdviC+eUJ8/W8rQPziN+sTT7y7iIzTlizS/3uHe44
 3995HnHvmBYw5DjcXRaKUn6dfUs7EH8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060082

Add bindings documentation for the Eliza Graphics Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index 2a2d37c59442de427874dfe42849cd0ec1a8b752..7eca456211e476b86cad274a81426f52cf24d527 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -32,6 +33,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -75,6 +77,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,eliza-gpucc
               - qcom,sm8750-gpucc
     then:
       required:
diff --git a/include/dt-bindings/clock/qcom,eliza-gpucc.h b/include/dt-bindings/clock/qcom,eliza-gpucc.h
new file mode 100644
index 0000000000000000000000000000000000000000..c3d9b7827325c5b8db696d1d95b4876e17c01c83
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-gpucc.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_ELIZA_H
+
+/* GPU_CC clocks */
+#define GPU_CC_AHB_CLK						0
+#define GPU_CC_CRC_AHB_CLK					1
+#define GPU_CC_CX_ACCU_SHIFT_CLK				2
+#define GPU_CC_CX_FF_CLK					3
+#define GPU_CC_CX_GMU_CLK					4
+#define GPU_CC_CXO_AON_CLK					5
+#define GPU_CC_CXO_CLK						6
+#define GPU_CC_DEMET_CLK					7
+#define GPU_CC_DEMET_DIV_CLK_SRC				8
+#define GPU_CC_FF_CLK_SRC					9
+#define GPU_CC_FREQ_MEASURE_CLK					10
+#define GPU_CC_GMU_CLK_SRC					11
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK				12
+#define GPU_CC_HUB_AON_CLK					13
+#define GPU_CC_HUB_CLK_SRC					14
+#define GPU_CC_HUB_CX_INT_CLK					15
+#define GPU_CC_MEMNOC_GFX_CLK					16
+#define GPU_CC_MND1X_0_GFX3D_CLK				17
+#define GPU_CC_MND1X_1_GFX3D_CLK				18
+#define GPU_CC_PLL0						19
+#define GPU_CC_PLL1						20
+#define GPU_CC_SLEEP_CLK					21
+#define GPU_CC_XO_CLK_SRC					22
+#define GPU_CC_XO_DIV_CLK_SRC					23
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC						0
+#define GPU_CC_GX_GDSC						1
+
+/* GPU_CC resets */
+#define GPU_CC_ACD_BCR						0
+#define GPU_CC_CB_BCR						1
+#define GPU_CC_CX_BCR						2
+#define GPU_CC_FAST_HUB_BCR					3
+#define GPU_CC_FF_BCR						4
+#define GPU_CC_GFX3D_AON_BCR					5
+#define GPU_CC_GMU_BCR						6
+#define GPU_CC_GX_BCR						7
+#define GPU_CC_RBCPR_BCR					8
+#define GPU_CC_XO_BCR						9
+
+#endif

-- 
2.34.1

