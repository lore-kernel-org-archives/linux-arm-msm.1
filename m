Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577139;
	b=k1E3kMF64Pcm14KfewsNxcrsyeu27eaZg27TpzKpdYN+WEU3gM/T/18sp237TV3FIODq
	 ZgN5XSUZZd8aYha9YPka0CFBkpl84vK29F/WOD1qK6UTYA+bNKob+MRog3Ckf29lFJSR6
	 UWFuq8iR7Hc09zJ3+vgalRRiDe3leJQH2/ObFsqANHpbuWYkmZKwpGabBY+IWveoyVeRh
	 z3u06/ImKamnzAmcee1Kalzj+cmQc+IvOaLOiK84ShoJutIVBBXDTIFU+TAwGuRBTioik
	 5VQkwX4TNxvtwBEiMwk9qv1Q/JEduRVfy2oFya2nVXZsyO/RkBJ0cUU2rUvB+35p0rA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577139;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fxW02MjIIj9lNpN8LtrcO3xk8J8fGx0yK28B3VA44fY=;
	b=W2hCq3G44ylZoIBkndYAoLS/1LD+juR62pSnE4kn8tzTrYBQWIYX40H2uNF8867lJA3z
	 eoURyiV9tboiH0Q4mTPCfFQTXI7a7fDEKw+YVrXUbTlKPC9EcTt5QMmhjaElyQAFc3pWd
	 kpQnTrnFrO/2YXEWBkcBV2IDVV7FMDVVkHg4pbBZsNa8AZ4QQgKwWvTaPHDBakpMAyIXE
	 gG50SNEqX10dZ3/ATqEw5k/fZYSloeJc2ddAiH0gDpoh9YroTiDcgTYMlMQLVBDP1USup
	 JPP8924B/4mhUAEjJaNgzooDfO2NDFaSmBv5yBVAVD+dGZLCKA2CYSIaXAlVL+dX+Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZDEqt8X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbwg+2Eo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B110606A321
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0B110606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZDEqt8X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbwg+2Eo
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2BSPA3112100
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:25:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxW02MjIIj9lNpN8LtrcO3xk8J8fGx0yK28B3VA44fY=; b=eZDEqt8XulVDGJCn
	Kp66i7jlsHV2B6h+SFq3lMl2RrzACNngTk18E+bjVwE1DhSK00S1C2FJsq2DJZux
	rTQEAstPeaKz2XUWzMi+WSrjDPgikk5gZOKfDtPkgatbU4wxM207JDIgcaY4fLoK
	DmSja8BYZNdC1tKsOgZsOGwjSDj6wVBfwiKfcW836ZYRNRnh8AZ6dT7hF5jNpIfy
	aB9AapkAXX+bKDMjFzK4BQErmLVi8jR2aCjePq4KSODOz8kQ/pkyacegphneAEcX
	q7ZB21/Zqc/6cLh1UBM/uT8OmIGnwRhJRDn4NyfQFRRzc46cgfw26r4AtgraoaX4
	3/fUAw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5b8038vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 03:25:37 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde02b50dd6so3872793a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 19:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577136; x=1796181936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxW02MjIIj9lNpN8LtrcO3xk8J8fGx0yK28B3VA44fY=;
        b=bbwg+2EoSn+8N5G72mpAfQwDjaZteapE62ZnGuIEU4903cP1lPCjCPy41TIH2+z2sW
         Q27c3JwiXmL2DaWzq9FzzEIhushOEfuRkOOKb3/u/OsCPDZ7IpPMHl34gN5YGHyRcxEk
         ZTa2A6bze1jc+gLacdnQfbxGblPCPWXRFqWHWkXUpeI2cvPtuShfK1Z2pQ0/XHqdTaRf
         9eb7FLMEzQWKb0tzSxQqmXTyx9kbVGYvq4oOd+RdwdviPwJzV/inLPUuoF5jjXzYtu/N
         Weh1rCyCI4BxtP/ITyJuBPUFyl2JevMu4HazoA7S33ORcLqvqbMh965EsDG7CpPGlRy/
         5asQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577136; x=1796181936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxW02MjIIj9lNpN8LtrcO3xk8J8fGx0yK28B3VA44fY=;
        b=xePqv7f/mYEqVHH0nRWG8bpZURGaHL7jOnsgiM7mGdUU1BeDm6moNST4WSTVX7e1Pa
         wPuIlmnM5OjrET4SAqDyUCz82XSoBjH/gV/RZ6RbVkYXpgzkdgbkRXLkZebZZWrdAiTi
         BhKgRODdsFBJqOHLHDbRRDgykzsQOMakcfQQosUthIiSotIFyPjbgQi9py9aHhAsuMvM
         TkcAZhFPs16PI+R0geEkUrT+8xDpAtjm5GDfbprsYFetV6Dq398B1PhSlIl3YCiGgY4w
         f4BzklY/5YFmQOiLJ0DHkkZw+3mUCigbNMSmAKQJ5JP9tvxeCnE1CV3KrNSgsQjrYlrp
         dxbg==
X-Forwarded-Encrypted: i=1; AL+hErEMogX7GpFSAqFE0cwGRRuN8fYcHBkc0x3AMwp9hsSYE0ImiU3KOlkoR/5zH+RxKDf2osNR/C9OEtH/L0bB@vger.kernel.org
X-Gm-Message-State: APuU4Z/cBADAkMeth6lN4nwGpml+EPPMfSv18W+2zAFINbc0jFCIiNN4
	4kkFfsNxXYBCgSQCaqi6MfFi96BYt2DKqKaPT/vgLN1I8shuHEyZ4xVq4DdFRI6YuYlr7/a/xXA
	i43YGdZ1ls1HWeuCSiABzSLD3XvbYoQ5xv7C3x5EeKHdO8TNcLQV/nI/QIJDEIM5pIWOb
X-Gm-Gg: AZFdTZfrqt0lLyIaBDRhcJErPj9HwE82/VbgmSB3gzlZ5AcFEJOpikpUHTImrNn/vJ6
	xBjOoj9N/g0NTKfrfBuY6WmQ8jSOy8VTl72EWqEdOizIcAKLNtDkVOdD+bwS9Kbxnf4CQc9Br7E
	rZBKg0NGfRsFx2LSFixA5E+3bGuQ0XRbBoRy07wibRiob6t7P43hzLvBmkexqdYzgFzbaO2HUb8
	1w/ENd8VKlVAGEvzKmsaAF9QxLMh27sYzIFbAFjCWHCFFsrxQGapSmc/xZ9Kv+Z8Bztp25jYQdM
	37GSzY3kituSdbxQ/Sw8NNy6oqrYWWqwcZ8epSiIK6GqNeBRxFcujWJIQy2P/jKBbhGFJn7fnrI
	hGv4rUk2l7Qb5lRsFX9KGxkrtXhWma4Ck+fGE7ABGHDNY5cb/gw18VMuUNtZ+egB+RRx0LfVZPa
	Af0yH7B/Y=
X-Received: by 2002:a05:6300:492:b0:3e0:df21:9df2 with SMTP id adf61e73a8af0-4014ca45234mr9898097637.10.1795577135730;
        Tue, 24 Nov 2026 19:25:35 -0800 (PST)
X-Received: by 2002:a05:6300:492:b0:3e0:df21:9df2 with SMTP id adf61e73a8af0-4014ca45234mr9898044637.10.1795577135012;
        Tue, 24 Nov 2026 19:25:35 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:34 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:14 +0530
Subject: [PATCH v12 7/9] media: iris: Add platform data for glymur
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
Message-Id: <20261125-glymur-v12-7-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=8372;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=EXAYms0vfMmdIXWMf76HNXfjxCH2Q/exRT6gyligzFE=;
 b=pHOnrA5evF9yPeyEshe9XQ5393PtvKeu1b604Zh8KJvIN0wmJdlglshPA28+omR2PXsJhuPp8
 9JOh7ritWZtCDMPguGRpc8Ba0l17wrTLDTBcyUj/g6mxU04iR/K+SoZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX90NGj1h18O57
 pF38XHVO/x3KFGlFFaJH2n/FZeIy2Ww6pIWZ129OQis2B7feOvf/6rMvEANQHEbLdZruQuOuXU+
 Cg4MlUggyuEB6t/zwTUdGbrYyjyCeEPbAp+3INKdWKvXPSOTVkdhtH1QXDGU4XhSaT63FWhBu7/
 +5eIMcsOW5vvNEJAR2Bx/2BpjkdDuNQVgxOI2S40xTjn8LBje8K5diFPIu3qIT0o90eWb8HdoKq
 aTAXWzFtBulooUl9MIm73SEipVuWRuKPF+iu5Z7aNqG8DYib29l+QPI1uf8wXGTa9X/SNW39bdK
 pNf3vFLd+BR/OgFLYnKhRvJs8OCR6jqZWhQBstZObJ5PGJKa+Qn6OndmgUbLl9f2vHdWgX5RsrE
 IWx4EfvWUS+a5QFogeK2M6zURWZQca/3Go1WlI6O2XTcjWMcth3mFabyr2P7gjHsDSBKrZ+PirC
 nwlyv5nAMwXze965xVw==
X-Authority-Analysis: v=2.4 cv=K5W3jCWI c=1 sm=1 tr=0 ts=6b065531 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=lg3Sk5cav7_8jeuIVHsA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: qZxM1vdeW2SdsZKz_lma3RV8jiIKBV3t
X-Proofpoint-GUID: qZxM1vdeW2SdsZKz_lma3RV8jiIKBV3t
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfXwL4KUnpNAfaB
 djfrJcWVOW/LRlUtYwuY17Ypm4rRoX1MS2rwVc+VouZI0Qh4sPouQb5i7F02L3kUZSrKG7S1YeN
 mYs0uWbBHavnxh8SjeuCwAD033eq4PI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

On glymur platform, the iris core shares most properties with the
iris core on the SM8550 platform. The major difference is that glymur
integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
one. Add glymur specific platform data, reusing SM8550 definitions
wherever applicable.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 .../platform/qcom/iris/iris_platform_glymur.c      | 79 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      | 15 ++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 38 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 6 files changed, 142 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index bbd1f724963e..4a70e124e75f 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_glymur.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_platform_vpu_ar50lt.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 49a3dcec7546..1eb8f33a7564 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -43,6 +43,10 @@ struct iris_inst;
 #define BITRATE_DEFAULT_AR50LT		20000000
 #define MIN_QP_8BIT_AR50LT		0
 
+#define VIDEO_REGION_SECURE_FW_REGION_ID	0
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -62,6 +66,7 @@ extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
 extern const struct platform_inst_slice_caps iris_vpu2_vpu3x_slice_caps;
 extern const struct platform_inst_slice_caps iris_ar50lt_slice_caps;
 
+extern const struct iris_platform_data glymur_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
new file mode 100644
index 000000000000..268f57d95989
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+#include "iris_platform_glymur.h"
+
+const struct iris_power_domain_data iris_ctrl_glymur = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"core_iface", "core_freerun", "core",
+	},
+	.clk_cnt = 3,
+};
+
+const struct iris_power_domain_data iris_vcodec_glymur[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_iface", "vcodec0_core_freerun", "vcodec0_core",
+		},
+		.clk_cnt = 3,
+	},
+	{
+		.pd_names = (const char *[]) {
+			"vcodec1",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec1_iface", "vcodec1_core_freerun", "vcodec1_core",
+		},
+		.clk_cnt = 3,
+	},
+};
+
+const char * const iris_glymur_clk_reset_table[] = {
+	"core_bus",
+	"vcodec0_bus",
+	"core",
+	"vcodec0_core",
+	"vcodec1_bus",
+	"vcodec1_core",
+};
+
+const char * const iris_glymur_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec1_core",
+	"core",
+	NULL,
+};
+
+const struct tz_cp_config iris_glymur_tz_cp_config[] = {
+	{
+		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0,
+		.cp_nonpixel_size = 0x1000000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x1000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda600000,
+	},
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
new file mode 100644
index 000000000000..577a1a4d58aa
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_GLYMUR_H__
+#define __IRIS_PLATFORM_GLYMUR_H__
+
+extern const struct iris_power_domain_data iris_ctrl_glymur;
+extern const struct iris_power_domain_data iris_vcodec_glymur[2];
+extern const char * const iris_glymur_clk_reset_table[6];
+extern const char * const iris_glymur_opp_clk_table[4];
+extern const struct tz_cp_config iris_glymur_tz_cp_config[3];
+
+#endif /* __IRIS_PLATFORM_GLYMUR_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index bcda31a5b8f5..e64a6386ace6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_glymur.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -50,6 +51,12 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu36_p4_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
+};
+
 static const u32 iris_fmts_vpu3x_dec[] = {
 	V4L2_PIX_FMT_H264,
 	V4L2_PIX_FMT_HEVC,
@@ -85,6 +92,37 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+const struct iris_platform_data glymur_data = {
+	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
+	.vpu_ops = &iris_vpu36_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = iris_glymur_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_glymur_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.ctrl_data = &iris_ctrl_glymur,
+	.vcodec_data = iris_vcodec_glymur,
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.opp_clk_tbl = iris_glymur_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
+	.tz_cp_config_data = iris_glymur_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
+	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
+	.max_session_count = 16,
+	.num_cores = 2,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4320) / 256) * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 37401365192a..26ae8d246e4d 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -666,6 +666,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,glymur-iris",
+		.data = &glymur_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.34.1

