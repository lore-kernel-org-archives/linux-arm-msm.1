Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C9F2FDC30
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045118; cv=none; b=VIFNugEqMYog3AkvQlR1pRjXHEbYGBf9AhJznZWgm+wVYrF7A4SmRKM5yKCKFylOZIVGURJy1GXqkss7Hc1b7/fCkICjW8/oA6UZ0wyC96TqxfR3xyqPsm4Qqo2uFH3oDmy+Ivi+nmSG+tPx5yEeOHcXr9d/uYrZGVVhyfVOW8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045118; c=relaxed/simple;
	bh=1w4CgMY6hqW0RscoW+I4KpJUnvg/6sO9akTSyFxDnD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N4tSBn2+TnXFARFCvzg5tpNdwjL9KZ4q/NDKfHnAlnUILeRk6EXUDh6aL57DN0X3Y0tDohKfunhpzmwP6RNEzfRciQy6AcDpVHOLAXGYHv44u68c+nA1HSyABV5hGO74bGGVPiIzpQbjSpb4jKknmoaI7TB+g54VIarlRkROn/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=et8My78g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GunrLxXr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="et8My78g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GunrLxXr"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5RKFZ3890750
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:51:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	etB4FVaixj6pjK5WgAj9fa3+p1eiXpv7Kfpsfz5keYg=; b=et8My78gyoSp4MGr
	Bw2qpiWsFCinpTt4wYYApXTbfrtplBIyofelI3nFcQcdUQWKzsrmPKi4O/tjrkap
	vutJ31bLFrqsQZQ+geVhwomWbhx8xHsgf4cR7Gdn8FXP7iJ35wMzLBFElgqZpRRR
	QRRClg0aZD6ADpAeqgcS8LUqPYTQVXcE6iuucwJOQRBtTEnq5qzw7m0tGFPun66a
	XX6IIVvVG85j4LZD4PlzPKoNzUjulAMQnpG5iljsh7cmyls2GH6GeIWdJTLNJP+Y
	YabNckdeYCw9HPVwiilLtmpQ+OvpKE1Tmq4gjXNeBd77FIQ+gHFJ2fi45x57/2PE
	k28y1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnwet7g7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 26 Jul 2026 05:51:56 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso2158877a12.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Jul 2026 22:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045116; x=1785649916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=etB4FVaixj6pjK5WgAj9fa3+p1eiXpv7Kfpsfz5keYg=;
        b=GunrLxXr9EQpravcHuQl0xwzRllRwNJvno6LbpIJvMWXJRFuIP0Dr/lHelQMZDHQCa
         iwlPD8YfnTLcF9+3NFTfUdggfMUT7kiAqxSoaNS3ihsL+ZCTxDEpRe10+415INF0P21s
         bKSf8cVqSSsr31zwFLhlRcKOiakM6oXGzsPYKNP+jQXRrsNB+IgWkqRDsehYUTelqRl8
         LoeXzEht/CFZJL5co77O3GBrJBpHGs45ywEFchMfOnT+75Uz5WoH/aYmlijrX8z0RbF6
         jcJMcrhu5dUP9LWH5HPD15n/THe/Z+jc+L6tika4+97g65Z6T6kXuFrNFTAAPaMcIS5I
         qoHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045116; x=1785649916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=etB4FVaixj6pjK5WgAj9fa3+p1eiXpv7Kfpsfz5keYg=;
        b=PqCaAqhHdqmuaGykkCO0rsszs+p+Lg2YJ3cmO6aXrLotdpTrtUWJJdeEdzqujo+Lkd
         iiU0UpZ81hlbEwKsyYOLog1up0J1qPAKV9+wiuVDjpxS//Lp2RU0TYTL7dVWDRWGsMVP
         5wxG1gz1tXMeEcr+rp9lTmjOca8gPKE71BBFi3msqjJ0u5Dp1sHi1YaPhBwd5JhRrvnj
         jFCTL9LZ0kBXWAhf/8Wifs1JclZ0YKsRGVhE6UxQLR67pQDVs94V90D8E86NX5JdJ/gs
         8IUc593XekVBQe56NHnA8mg9aD3dt3vztiTW4q/+DqaarV4EnRtJzzBoiEmm8kJeQxU1
         dBjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpflF6zOJG4Ft+3ZvvL555KyIjES+RUYuJh9nkiDOfDES2RzDELAdH0FShD7YNayDTNeGBG2EMEipw2G4ZJ@vger.kernel.org
X-Gm-Message-State: AOJu0YwtHKWbz+hQblWe3bBdo9jlCbbbSmA3AOtrKAuw2dQjlRoxO4/4
	SBf01HIWJ+nyqWC9KtnHjrSK9KoRIOZsDBBpDloFJ5UCQ6hvHV3JgtDOG00/aTpdU+D+/1Ev0Lu
	pTFsxReUfh7yt9rDUCkmywafGCfRT9AgRsha3HyVvQUPWb3+jHLFdKCGdNZ6y8kvP+uaD
X-Gm-Gg: AR+sD1039L/8K8PymHt5yfgBd+xIUNUGz8Pd735ATsCAnGH2Yj84vReA1UN9CnzKEhC
	XJRsbiosVJQAyaPI7agjHKcBX+g7S/YzC8M3981/NpXCqxjLwKMxO1lM2VqDv+/HQjdgQZUX0au
	2H6ktuQqm1vHXYZQoGsEqrujLmNRcGltQVo+dqVwAzks35ZANmR9m0Iy2dnnoJl2fA3vcB7eTqC
	K5MpMt2IeAaMYKVfQRVxldsBu7j/Hdpd3jbUFACIOWat4SuCbB5ssgHRZJZPP5sSVfWLKQEVteg
	SxM0SaDVwu7mNkp2pcuZTZH/QdAcpXSqOixZ07rAYSN6l7BMuKF8krrzztn8SO82pH7C8jA8STv
	lK0ggr+YrHs0kOBhI7WN1rGYNA9SRv9WJ7A==
X-Received: by 2002:a05:6a21:730a:b0:3c4:511e:26ab with SMTP id adf61e73a8af0-3c67dab5eaemr4046464637.3.1785045115815;
        Sat, 25 Jul 2026 22:51:55 -0700 (PDT)
X-Received: by 2002:a05:6a21:730a:b0:3c4:511e:26ab with SMTP id adf61e73a8af0-3c67dab5eaemr4046444637.3.1785045115377;
        Sat, 25 Jul 2026 22:51:55 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.51.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:51:54 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:42 +0530
Subject: [PATCH v10 12/14] media: iris: Add platform data for glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-12-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045024; l=8204;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=1w4CgMY6hqW0RscoW+I4KpJUnvg/6sO9akTSyFxDnD0=;
 b=DPjdGJfWzEqB6Vqf77ZHBdXB3a/hKJhWHmTmnPlBb6Cp/uBybKHtQYAzOXI1ylzbNMJ9vezPa
 WU+7TIL2LR7D5vJSFXpfdjYE4BuPGTS/bWcs33MBEHD5xGKPqgfztK4
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfXxd6X7FdcVNeR
 XJcSme3HWlwouQvWAhb2NJ1muSr7puuhmVNoAUGXe6KyuAvw3mRhK6J9AcmFRBpXPtzcKUxELG5
 uc7mLGC+YiUxUosErwvrp1gMkErGrGkzt6ycgV/ZlEvZ029+xTGjmBBS3I465x1GVKSyhzi6FZ+
 m93+H5GFgll2RjZSMMonPexD5tg8AjxcwyQEp8t3gd7sUG7CBw1D0C7MxJ3ToyEtbwjBS9vZvDx
 BLoVHB5Nrsjwj90dF0jP15lmG9jKPHsNhuTKnHEnxTjunuHEet+STqXZyeClvLz8TggQOAEYOqt
 LB5pTHgMXGL6BaElL9cpkMvXrKpMEZIy8pSoUAA44egtWn6nGM+qUHFOQilCKJV2nApKM/zECP4
 BZhaHaXM/0oUkvMU56qJKstQ2YoD0qYVIIZzDILs2F1+tT3gZxy8sZeNvVKFnDhAuqdgAW9jtaB
 NU+0bbdNuKY4elQEo9g==
X-Proofpoint-GUID: DAFl_KNr6WMI5CNmYGZy_Sbhfib8wocb
X-Authority-Analysis: v=2.4 cv=S77pBosP c=1 sm=1 tr=0 ts=6a65a07c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=0Xn_3AH55rwbdtokavwA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: DAFl_KNr6WMI5CNmYGZy_Sbhfib8wocb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NSBTYWx0ZWRfX0EXbCAQ/3sDo
 Zax+CG/Xy8F/Q+wY0yYLeO3SYE8oPwvC1wcl9zr8bCXq930Zri/wGQV6ftRlhaGZRvbVkE17mrs
 pQc/3RAEjhdLqmobBCPprwCoxvdAil8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260055

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
 .../platform/qcom/iris/iris_platform_glymur.c      | 78 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      | 15 +++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 35 ++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 6 files changed, 138 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..48570da56aa0 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_glymur.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_power.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 99f59b64f853..e182030bd537 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -39,6 +39,10 @@ struct iris_inst;
 #define MAX_HEVC_VBR_LAYER_HP_SLIDING_WINDOW	5
 #define MAX_HIER_CODING_LAYER_GEN1		6
 
+#define VIDEO_REGION_SECURE_FW_REGION_ID	0
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -53,6 +57,7 @@ enum pipe_type {
 extern const struct iris_firmware_data iris_hfi_gen1_data;
 extern const struct iris_firmware_data iris_hfi_gen2_data;
 
+extern const struct iris_platform_data glymur_data;
 extern const struct iris_platform_data qcs8300_data;
 extern const struct iris_platform_data sc7280_data;
 extern const struct iris_platform_data sm8250_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
new file mode 100644
index 000000000000..49edae8120fe
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
@@ -0,0 +1,78 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+
+const struct iris_power_domain_data iris_glymur_ctrl_data = {
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
+const struct iris_power_domain_data iris_glymur_vcodec_data[] = {
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
index 000000000000..9f2877ec9901
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
+extern const struct iris_power_domain_data iris_glymur_ctrl_data;
+extern const struct iris_power_domain_data iris_glymur_vcodec_data[2];
+extern const char * const iris_glymur_clk_reset_table[6];
+extern const char * const iris_glymur_opp_clk_table[4];
+extern const struct tz_cp_config iris_glymur_tz_cp_config[3];
+
+#endif /* __IRIS_PLATFORM_GLYMUR_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 72dd23dbe02a..4049e134c3f0 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_glymur.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -48,6 +49,12 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu36_p4_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
+};
+
 static const u32 iris_fmts_vpu3x_dec[] = {
 	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
 	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
@@ -83,6 +90,34 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+const struct iris_platform_data glymur_data = {
+	.firmware_desc = &iris_vpu36_p4_s7_gen2_desc,
+	.vpu_ops = &iris_vpu36_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = iris_glymur_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_glymur_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.ctrl_data = &iris_glymur_ctrl_data,
+	.vcodec_data = iris_glymur_vcodec_data,
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.opp_clk_tbl = iris_glymur_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = iris_glymur_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
+	.num_vpp_pipe = 4,
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
index 9e96fa218dea..6ad553990c89 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -493,6 +493,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,glymur-iris",
+		.data = &glymur_data,
+	},
 	{
 		.compatible = "qcom,qcs8300-iris",
 		.data = &qcs8300_data,

-- 
2.34.1

