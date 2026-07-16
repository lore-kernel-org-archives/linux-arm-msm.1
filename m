Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88363812C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784174896; cv=none; b=exUk2JFq4AimHQE7qiblp2/Lx3Mo5e4faSF74pFWVndZhKlg4/k5eOgacp7QjAAEaSqUxAt31ii9jnLWCjegBdDa1pCI5WzFNRLD6bto0CAEbkfis+WkzRJUkz8HlS/Y5nb3t4Ud/1etr9hQnKZdOoFPRi19a4dwsiAmFUl0s6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784174896; c=relaxed/simple;
	bh=+pmmTLiXO5A66kPSR7UeCsqzMfxV/n2mPqjwEH6MHBM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIHaFtjDD8I2pKhpblxNDyBVZlzpGI4rNh5qC+FOHCp/DhNJHu62TMTvVZ0wkOHViomBXpQ8lXrunh5TEx4giz80A9Uf8pjl4VLJeWOAnpMtzCNGlzUppFSQpqmFNT9CJpTVFlrkaj9iqF4ReNh4I/mR25Z5fdEZsIGfTTM4dTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KQsSGgd8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZGZ5Ytgh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KQsSGgd8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZGZ5Ytgh"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G3wL4j1444452
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:08:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0OQcXH2gW0lUun2K3nUAVTX+Nh3eUWT3dg5jaBRZ7Q=; b=KQsSGgd89VWkG6Po
	1a0AD0yE2KkM3AcTJfj1yWUb44On1Oxg7UwZTmjO3Tu/4/lX8Nqq72hoIPdFALMR
	RW7jC9JKjBJ3+FK+itDWH5e6krPZIgDsrJYcwGjUoJiynESc6djqjOeixZ8NNp3j
	XgfjdFdlg2UfVbcneF8YCK4uAutDM1kYoa4MnfoKdf09oABcubSRed9PppiLjHQj
	ip1DcMGU4RpvvOdWyiXLZA1T9UUCGjk6x1vGdcDNWjwhL83lvQCS9B8KGh9eQg6t
	8SzOYOAyS9Z3ihaYH0ncWTW0Q/8ywu+SClqyALeR5w9vzvKwBdYGa2GRUOCh+RWD
	6X6BbA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehv9w3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 04:08:13 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dc101287aso7058363a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 21:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784174893; x=1784779693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E0OQcXH2gW0lUun2K3nUAVTX+Nh3eUWT3dg5jaBRZ7Q=;
        b=ZGZ5YtghDlbibZv/x75SgVWfsZad97A/9ygv4d/eiJkPQo2Dh85BKFakyLjpTp5I2m
         +MW19BnLyXp2KNqwU05ysrPK8+XmVgasIj5xc6gnaKIO4FdEDvUqTi3BqCAv1j+5WnqH
         jNnKaLw+0sbIvyG4dMj87TEIA4qlHN79bJjmJNOTUgVuO+8aotKUJ6ZCLBJ2KNbsngKV
         h9lsXaoF0n2uxyBaERBsXROjwmJO4NwdaqywdiScx1CBsnMngMt3zLHKwyJtp06r7xNq
         HS3BAuSZ9SVs61ze9cYOng0KKE8fBWev5ilW+knkugaOYhFTsEFfRhArEGkGlMFKHrCA
         Cl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784174893; x=1784779693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E0OQcXH2gW0lUun2K3nUAVTX+Nh3eUWT3dg5jaBRZ7Q=;
        b=pqIr4Y8KpepaGadhy6Od2ZrDsDf5bILJ4r57xeAPDZYFf2Q5/kEnNw26EIG8SugPIt
         cSuqxSaxKihm2kETZDS044m47WGczefb4BQuDdRHOpLRBLVX3+pnSwLvt39YGsi5BUxH
         QZH8n4y0/pPSrT451V1zPiZNkJKFTkykhWzm2S4YcZIkHvhHvjjykVGMOCa4vftCUbDM
         LkZS72fQ1oj6eNiRk3NcvhAXe4jP2PG4M5iIi8LH4kuWzsnffiSofy7H+/oWkMw25aa/
         S5chAqio2ofN35RUElGz/NySwbdD+ZJyK6qGmc6rHAwOp0DZwA4DHbJ9yAlOTyftqrLH
         uymQ==
X-Gm-Message-State: AOJu0YwRBTlyOWu5ah95K8q3izRCtijy5S5u4b1P441Y6lqGUMRtd3/f
	HYrT2RrDGL94FGJdg4IZjz9uDxpEOoP0e91lo42hPZnkv9xwBQNLCD0QyC+wahKclLI01acHVN2
	hanVIRR9J45oGx5+gtydoToJdi9qK6S+TJQX17SDQATTDqDJF1jKVCQIFesRoJ8crGTxs
X-Gm-Gg: AfdE7cmGUtZk78/9fB1EceYJJKjGYU7NtrgsS/wHnbhqGVnZIb9exuu+WJjG+/e6uI7
	LnSGdCgbDk2pyKhaDcfOedkSAqYlf8HWx7YO76WT8m6iVVXi7TnYbd2fE3VZisynez4nTCP/g8L
	9nHG5Tcg+qlbCZBqKYA8xAqAxcf96zay/RU/pW55Ivr22xKtkplx3C1CPDx92ldG8yXLbjREi/z
	JrzznkP9zQY3N37dGukXHtyQ8SwE/BdQQBu3wG/G3DdvAc+snJwVzGRPHOFLlmkLaVTw0zej4t3
	HnxwS2buIG0NieZ18Om8Ui7qVniBXwhA1iAyLzi9d71dTvL94v/ryKtH+qgs87KCK0eNgjt+6RC
	6Y//INdtZKVxOWCESvAYIBp9jNJoVQ/o=
X-Received: by 2002:a17:90b:134b:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38e17dce582mr9767452a91.19.1784174893220;
        Wed, 15 Jul 2026 21:08:13 -0700 (PDT)
X-Received: by 2002:a17:90b:134b:b0:37d:ee77:78ac with SMTP id 98e67ed59e1d1-38e17dce582mr9767409a91.19.1784174892679;
        Wed, 15 Jul 2026 21:08:12 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6a4779sm7623907eec.17.2026.07.15.21.08.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 21:08:12 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 09:37:59 +0530
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom: Add Qualcomm Maili video
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-maili_videocc-v2-1-7ed5ab140770@oss.qualcomm.com>
References: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
In-Reply-To: <20260716-maili_videocc-v2-0-7ed5ab140770@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58592d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=_g2Ecp_Vah_XpkdnnNEA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX7q30Yxfdg6GQ
 VVpbZW8xQonzXaEmA30+R1RbPWMcQHuGvgxubGt2JgfV1sfIkVxP/7+gm3MlJnDnrKHmplUJhr/
 FTmtvkSMnB2YSNIUlNjUtgKHaxjn5b4HyflfO/kqOp/fePC+fJZZiMAhRnFm6SfI2PkJMCHEnsK
 xvxvglzvjp1UZ3BN1u2lnPejzlI5LnT1OnWG4YO3Rleu+cMdm8VnNvje7yOI4XZplrormQbj9Nu
 z6IbTSnaMpSkPJvVwSc2hg7UaLQI1M7oTd0+0YdW6nM/YPjaEQ4ULBcUt0Whr+4ELKq29hOEBFY
 /v9ono/v8iULCGVipT5HrBO20LfDke85987v0qOFhuFsep/qKClrwV1U0yNKWNc2pDzQ6Us7lGF
 vsy6CzhBTntkyboLysOLjj4ZVAagrhtPZLEM6viPIVhb6QgtPzCJheg+HM0yVf7JPFmhMx/zJrU
 OM9pRKbFle1Nl0CspQA==
X-Proofpoint-GUID: QLyR_cJo8Lyq7tVkH_dQBzHFNsE5DvKB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDAzOCBTYWx0ZWRfX0xuwFXLqfp+n
 I29yUMvgkhJtnyV7XBLMIb0mCbR7KB8GyAxTLrB2y/6sJDbWepI87y5jAAiGCN+LLi/g/bcTZyE
 p/xAM+ZWQA1jcSrWth1dh+PpTAShjjM=
X-Proofpoint-ORIG-GUID: QLyR_cJo8Lyq7tVkH_dQBzHFNsE5DvKB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160038

Add device tree bindings for the video clock controller on Qualcomm
Maili SoC.

Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-videocc.yaml        |  2 +
 include/dt-bindings/clock/qcom,maili-videocc.h     | 49 ++++++++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
index 1e1fec1cd7ce96f103348baf85341e775fac690a..910c6d5672b8657f161058c4ceba98637c299b73 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
@@ -18,6 +18,7 @@ description: |
     include/dt-bindings/clock/qcom,glymur-videocc.h
     include/dt-bindings/clock/qcom,hawi-videocc.h
     include/dt-bindings/clock/qcom,kaanapali-videocc.h
+    include/dt-bindings/clock/qcom,maili-videocc.h
     include/dt-bindings/clock/qcom,sm8450-videocc.h
     include/dt-bindings/clock/qcom,sm8650-videocc.h
     include/dt-bindings/clock/qcom,sm8750-videocc.h
@@ -29,6 +30,7 @@ properties:
       - qcom,glymur-videocc
       - qcom,hawi-videocc
       - qcom,kaanapali-videocc
+      - qcom,maili-videocc
       - qcom,sm8450-videocc
       - qcom,sm8475-videocc
       - qcom,sm8550-videocc
diff --git a/include/dt-bindings/clock/qcom,maili-videocc.h b/include/dt-bindings/clock/qcom,maili-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..ae52686639db3231b8705e28667d3a65192d4de7
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,maili-videocc.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MAILI_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_MAILI_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_FREERUN_CLK				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0_VPP0_CLK					6
+#define VIDEO_CC_MVS0_VPP0_FREERUN_CLK				7
+#define VIDEO_CC_MVS0B_CLK					8
+#define VIDEO_CC_MVS0B_CLK_SRC					9
+#define VIDEO_CC_MVS0B_FREERUN_CLK				10
+#define VIDEO_CC_MVS0C_CLK					11
+#define VIDEO_CC_MVS0C_CLK_SRC					12
+#define VIDEO_CC_MVS0C_DEBUG_CLK				13
+#define VIDEO_CC_MVS0C_FREERUN_CLK				14
+#define VIDEO_CC_MVS0C_SHIFT_CLK				15
+#define VIDEO_CC_PLL0						16
+#define VIDEO_CC_PLL1						17
+#define VIDEO_CC_PLL2						18
+#define VIDEO_CC_SLEEP_CLK					19
+#define VIDEO_CC_XO_CLK						20
+#define VIDEO_CC_XO_CLK_SRC					21
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0_VPP0_GDSC					1
+#define VIDEO_CC_MVS0C_GDSC					2
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0_CLK_ARES					2
+#define VIDEO_CC_MVS0_FREERUN_CLK_ARES				3
+#define VIDEO_CC_MVS0_VPP0_BCR					4
+#define VIDEO_CC_MVS0C_BCR					5
+#define VIDEO_CC_MVS0C_CLK_ARES					6
+#define VIDEO_CC_MVS0C_FREERUN_CLK_ARES                         7
+#define VIDEO_CC_XO_CLK_ARES					8
+
+#endif

-- 
2.34.1

