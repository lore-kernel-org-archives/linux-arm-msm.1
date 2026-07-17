Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FF9396B6F
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273563; cv=none; b=l0nrRpRAF2klETZH6S9CqvInITTc2KF5ActklKTfkHYcsIcZGdjXPZph0tQYqgfI021/lKfkNl8bwNs0s7MIraLzsULeNCi4z7+4pEL4RH25Z+FkYn2YO52yIMI0TUXmB0Yihk2KhiEn/N/ZkMjSeFb601vcTiAiNFOqod/o02o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273563; c=relaxed/simple;
	bh=X7A8BvifHg9AJtoStT7CZzf1oH5NsdlyLLNOS9sNvUo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dEJ7rl4U0yzYjze3y/LD2yLRjtYZFv58ajMHZKl11rBaQoD5MOpOHnY9PynmdgPFWbPzOWQtj+RCGfYoYSVcxeN/g5URg0ZBaStYshGgXsKXFrjN4sGgBEXveSv7E68VXqWeKlVQShQBBwVGtIQb4X2U0pwgEW9HXfuK3vfvQrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XTTYbCgy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aWtZ/lsZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XTTYbCgy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aWtZ/lsZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cQXv951335
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=; b=XTTYbCgyV4m11uvU
	Bxm23sW3tw9cP3ktjMtgutrpnBnHceoqV4fIYPWQ5JXvnrOjJ9h3JbIRwYrROJmO
	MQ6Ozs70rRXKRnYeqDUOoth0mhTZr0UqhMfr34ZKjSvGVF3gn8ZG/A9qUEJhD3wt
	Xm16u27tUnpZI7E8FjtgqsiOrp2WsUH9XRsUgiV4vqc3YdJbeKQVCtOFl0xWvIle
	MTMMAYRKOAxZJetughhykVtarfuJGS8DakbEP4vk2mA6Knlu2rERY8YxEmi8vjKv
	CzMSmvYRTma1DWdT4z+l20Dk8UgxDYEDdQ0J8KeUFlL2rms7wXKQPabe6JAZfX+4
	7gPchQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ff2f2u3y0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 07:32:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccafc5e82cso54874945ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 00:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784273552; x=1784878352; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=aWtZ/lsZIhUYw3FVaXm5f65Qjh8N6Yi7q4VrpYqH1UQtTOXAGZpB40XaDL68npdKFa
         HIrebrYFBwZPK1R7NTgGqVzXR3XGv8aoFyolhjrXc8FSCW5GZDG6YMddHXwa7EjOCntC
         3juk96K2rH/5NvpjfHr444TWMEaoXf2EQwe9qxfWXh7ZVlq4aPgY87uSwZ+E2Ofork1b
         bB9aze58PMxAQe/Nx8YzptOHZWZqf8Dhu9H9GeaycXkeVjLHIxCT6YzZoiNN+3jzXiUy
         +ZuQj6aG2eqlKyewEggrheqyQFAzRTWYzQAJW5K16htl6BL8Zbn7wHRQVMlect9nRntp
         Mq+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784273552; x=1784878352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Lu5u9GFsbziq+/TkOaetbPmiQkrUsx3PaJxt/gHkQ94=;
        b=tW0Qg3OURiPvzkf7CKu1cp/zGQ0KFUS/J7TeTViOzkNuVENMVKqSLxhQNKFNiZ+G81
         Dlnnu7pm1Wl6vX+1Ie0NM/zc2uhSfxNNGfctK+X0mwbK3c+cIXn+AzEmW38U9le66a1a
         acwcRy+BfgW83qewiGdV2+7+UmYNkX1Z+sDihiXoZQzxF9c/aId6HEvbeeB33HCEEtcx
         mlgkdSXud4HMFJkgl5AlnFXzmDz6SrY8ismEkUd39oXoNCxttgh2TFh62mDHmK/beDom
         AeCcjmbL8NLXI8O/kR2Ej2WY00NE94J9yKPUAtjb/fdgbrclkuz/ycev/k+c8Vy+/dVk
         2c+Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp3hB2VeLgkQm1fcwHhJqfgmUMh/NEAzzDcIiqC5Jey7eJSyaRxrCZFLNOzhSrVxTdmkWnrgiAGhimYFTQo@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2FOiCTdc+vjMAeje8WT0hETtr9xkUbOk5b11K9ZnTAE400ZHo
	jxW0zGiNFwD0HqhSX/Vl/zUzsbXyCWEAWnZuoxn601HIROGyXNni2c3hCcm/bFYLOI4ZXjlBZcd
	FtBN6FNU0bL/WRL4fo6sR3unRxTnN+DJ+PKHIBaxN6WGEY2em44jilpikEYgDouKvnYe4
X-Gm-Gg: AfdE7cka3kPHd5lD15mDpR3Z98ZHGiLxGFliEBMitbc72iTEJDQHjy2k/95DhDuI/cR
	FamZpDia6z6UumtRWp6hy301p7Ugw7atcVwP04b1hJVBr8Do14BXFsImJBHms9m9QewOU4vgVKA
	vreuLCGbxKqDzCto35PHRZIojs+a4hQO0guykT0iSnGyUv7Wi7/3ou7vIiRolEE0lvtg/770hrz
	UnULg7FjeCiJPUK2NR2mpyY1N+5IY5JHBaaCByLFmbXz8WPLhCjrDZw+7tNlTsRvoFNdqKtfDyP
	0FwUwAnxIx+Fjo9bopIkQw95ppfW2sPTH9iQqdCHUEDZJ9Zbh7JbhE7wroeJ3/gf+OuP1U4RO1p
	BWRF4hQ20KA7TAhG1lgnNIxjn
X-Received: by 2002:a17:902:c401:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cf3484726dmr15951995ad.2.1784273552383;
        Fri, 17 Jul 2026 00:32:32 -0700 (PDT)
X-Received: by 2002:a17:902:c401:b0:2c8:f34c:82c0 with SMTP id d9443c01a7336-2cf3484726dmr15951625ad.2.1784273551875;
        Fri, 17 Jul 2026 00:32:31 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448fba7sm5882525ad.6.2026.07.17.00.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 00:32:31 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 13:01:49 +0530
Subject: [PATCH v8 05/10] dt-bindings: clock: qcom: document the Eliza GPU
 Clock Controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-b4-eliza_mm_cc_v6-v8-5-5cca1bef2e48@oss.qualcomm.com>
References: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
In-Reply-To: <20260717-b4-eliza_mm_cc_v6-v8-0-5cca1bef2e48@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: Qwx4KukkapMVddJun4pxSZ7TWX5QKvfW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX5K3ySyoRroUO
 OXDCBcoDXOn0A/5wiqHd4c+M4pBA13qYHoeP0rCFhJmxGGNZlwvB+QlDiNK4S0Ag8E86Rv0CK+S
 LKUHWai6SllKkBof8YcPeOaoPl8rznA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA3MyBTYWx0ZWRfX0RjeobxsU98Q
 0gMtpyahtYVpNDCWbLh0czXBwRpO7QtBwBTloZVhFk1OonO7s8eZZKZokwx68JxD7jIrqXio1hO
 9Wd1I9XAfOvv8gFMwWqdryx9qvG0GAqOXhQfIR136ewWLCU0J524HQdN9izNl5PrDzRDawM2qst
 GRSyCTK6OsEaGKTFzRo7UKVP3VdbURsQ5gHPfk41MYr3JlXwk+0wOaXlUXTtF/ECp5Hm4UNLq6l
 Fef2T/ETQNdZjSWXcau1fDNJv+4ZQFbDzFCSU2BSGlEv5HC6Ymp9HbaU7QPH0VCiWeX8KIShnOt
 f43Cjh58TBv8eMPNhayLNH8IJVcCeD1u1OeqUG+xlRKQYQScnBYrHV92dOsu23n+CgwssReiDqX
 +KIfgMHCV4wPoykxG24x7KnqPV8EwW6t93ur/P4pYNm5jDkSkNx4Sa6A7WS4Jnmf5ACSKHvxYRx
 fmG2yXLJ3CN4hzk8zug==
X-Authority-Analysis: v=2.4 cv=NcTWEWD4 c=1 sm=1 tr=0 ts=6a59da91 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=eqSiwPykCNIpSPSkj8oA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Qwx4KukkapMVddJun4pxSZ7TWX5QKvfW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607170073

Add bindings documentation for the Eliza Graphics Clock Controller.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8450-gpucc.yaml          |  3 ++
 include/dt-bindings/clock/qcom,eliza-gpucc.h       | 51 ++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
index fdbdf605ee695637512ce4f98c9b6fcfacb9154f..734bab762a30800bda94c726f48013679f9ec542 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-gpucc.yaml
@@ -15,6 +15,7 @@ description: |
   domains on Qualcomm SoCs.
 
   See also:
+    include/dt-bindings/clock/qcom,eliza-gpucc.h
     include/dt-bindings/clock/qcom,glymur-gpucc.h
     include/dt-bindings/clock/qcom,kaanapali-gpucc.h
     include/dt-bindings/clock/qcom,milos-gpucc.h
@@ -30,6 +31,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,eliza-gpucc
       - qcom,glymur-gpucc
       - qcom,kaanapali-gpucc
       - qcom,milos-gpucc
@@ -71,6 +73,7 @@ allOf:
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

