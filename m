Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795502654;
	b=tNMpQrHwGRNiGEluPteEPM6VQt52nhnGYjAESvazCfbgIgy+uG38InLrvNQ8RTfAVr3V
	 70c8rm/0MDFIUKNu6/ql367lm7Bg45xP/jxt5iuv5KKaOtDYSUcYhVZHGC05u9EcltLkL
	 /pDF5GAxoGrOopkaXFTZG5zxEhPhe7zZ9pytghK2c57U2GpK0huuWnrJ0GQB/xOkdWc3j
	 wOs3//tliXGkEP0EQ+YCOEni5244uTyY5fQbHBi1sGpeE+z6N0TbbzHETnqETcknMOZCK
	 VLfv3Eoc3nPJ/YvpxM0ZQQbDRNPNOVbLvXS7Fiawaq1IyK5p2Iv2vS2oU/ULCUvD6Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795502654;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=esDncjNWNQL+FUEGTzl1ho/mJLypwVnQf99TVPdkyYo=;
	b=EE4lmxv6ACKSaRTpkNc6wvraiGGUYagyzyrwJUO4oH7KwCEBAeMvYyaBcllZoW3xhjSr
	 X6axRSToh+7C4lv5+9mUGyxHG/SrcwipbJrEYSRnfsgB+i+4FXcy9auEzaw4zJA9zRJvq
	 PsqA3rYwE+UiD6gFhV2m6W+T5YJD2y0angZr1do9z8lx/sKk9OK9cKNycB1RHY9tEUq4k
	 JVnyQ81bAe8BWGWaaojKiCCBJg5qL/g0ByDOqnCZlTDteudoqMsIvTUCi94pIm9RTOKLA
	 Zgt0rWhzXv5NFTTploYMYvfad8G869kYyEAyTP2pv12lojTA8UkclYykne+8VG7zIIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaIQYHqy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aay3n0Ks;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B894606A330
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B894606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IaIQYHqy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aay3n0Ks
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2k5GN3225346
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	esDncjNWNQL+FUEGTzl1ho/mJLypwVnQf99TVPdkyYo=; b=IaIQYHqy6AACpjrf
	8M8emlrBNTT16tLNOYaHzDPUXXou/8LpgxtQ2H+QyH7JlNhYL1ytfRuuya+YYQ4/
	FPJ7y4O2N+4TT6BFzzzNqWfsnUGjW5sMWHLUQPQmg5hYz3fblrpDxlDyM27ydan7
	wcFoj2lx4UkGvK7x8fE6cI0xXYx35RL7fM1xtC+UWySe/9nGfaQv6//VwODuY8yr
	/T7QJuuaLa1aEo4ALDgqTzwJK3fymstulhEWE7nCuG/vamAOnmKnN2rTrQ37gouN
	7fpq8RIU3tVM1808QYAvSrHU9WAXiTVB7t33p9DQSHQihAOP0BHDVU8uEr/MKIOe
	isYRYg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4x8f1k6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 06:44:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33bf1d17dfeso510610eec.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 22:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795502653; x=1796107453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=esDncjNWNQL+FUEGTzl1ho/mJLypwVnQf99TVPdkyYo=;
        b=aay3n0KsL8WCUhXujotlwUCZUzchQLkyPuETybEtjbNiRW7SiKwT9ig0fKs82BVd1F
         VE55MnGdzM/T86WP+E/UOdt3H/UluWcViLURk5c6n0NagJbTf6XEwq+QRWshsxe/ir1W
         MpTb7YCS+P+JKqx7wsrtS3jKdi19GM6xL8svPtI3i9AHZl0g9Ur+y+jSkJBuFcTtG7WI
         DpfpkY4dEawo9POe3jQZYcxqCGVSfQVpNmwCVu06oFW52jBoO4NuH8r71sw6TKonjNDZ
         a94OQJu7DXwv9VT8uLx6VV9w7eN8nM3tzJt4JoBLwc/ECU1BDwrPIPvIiIUiWwrn8ogh
         ysXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795502653; x=1796107453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=esDncjNWNQL+FUEGTzl1ho/mJLypwVnQf99TVPdkyYo=;
        b=Fb9nXaPi2c+nnQ7sD0IbM7WoU1TlD3F05bETyrIfm5Bc9VtKRxFRC0pBz377vUohSM
         D+jwhTNUA9ZJym9RQ5iF/KjZtnRR35LZ4IxRoFgPBrE+ou00n2AVkXUgDaFchj005GuB
         U/zB/0RWTKeJjGB4hpdsjsZTuOic7i5x9ph/LIQV+lQVpn2I1IZZiGOOR5IFViAJUeuu
         LT2nSmopARzEOaGufniOYxTqDv0eIJVnHnflnzYSBX6jwfTtW4yr7WY652Cuk1amPiWE
         tgwXFvO6uoPiU5OVjtZwTLcxsQgkIzh9QlI+n0XsZVlIRfxyrrUzc93rpnVDRG77xxMG
         NNSg==
X-Forwarded-Encrypted: i=1; AL+hErGF5XxoVjxvwQPQAmb+TwRXHIO5Ri5jkqsXQo9fCM4x213Kdr6GC/awkBWWVP2QY/YA5ZSBsPylifJO7dQH@vger.kernel.org
X-Gm-Message-State: APuU4Z8bpn+prdmwYaOO7udNHxhX+qXBSjVkz0u6b7KRgbauB8CBtHio
	8Hy5U/Ddg+Babp7JtUKvtmk4gdCitev3uYlIvjCnajBVb+AFwD39tCpl6Kx80xfBM9Ndc06AizL
	7GZ+w83Ctno27D5EmFF0BJIZAa1WE8jCgxGqtglSX0RW3PAribJRXNeh47Cx5aPoSKi9D
X-Gm-Gg: AZFdTZf87WkbTpQ2ixL1Jkrg9BWZkd3xqEISvYzPXHq5pA5DorBwKrIXK+YWlu6K7xS
	vSotxcPxCiTES61d9IzLA5j5eOuchtkGaBghiSyDPgSahWxSxOnLqxM/cyjzFFdQ48Md7zr7IRM
	4RjxLWKhTiTIKiOlFv+fZNbAF1aC9xEi4Pi8D6eFRmhoMXPPgUAMFVKclQcLIkftT00RQYRM5lA
	PhX/mvSjGQvgYQse4bSzjv+J7Fuyc8N3jGnYXPTbSSrmVzN3pDyRBsAtQQQuPflG1YqP372bDCm
	wJAKrowiEDlLwsLBkaB2FfQsSp2GfloBGDGHhrlfmvgECO4cB38Ou6yEgn+Y5mV73DeVIEIKyQu
	2DR1A6hqpctaSgatLEDf7iivv76j10WVGvmEa+dsABqpg9gMlQrvh2NW2A6yg434+LfxD51Vh/y
	0fu3DpE13pTu1Xtaoszn/zwk8rCMhJK6+utA==
X-Received: by 2002:a05:7301:2624:b0:385:1a45:47b3 with SMTP id 5a478bee46e88-3856e24682amr22610558eec.1.1795502652983;
        Mon, 23 Nov 2026 22:44:12 -0800 (PST)
X-Received: by 2002:a05:7301:2624:b0:385:1a45:47b3 with SMTP id 5a478bee46e88-3856e24682amr22610504eec.1.1795502652337;
        Mon, 23 Nov 2026 22:44:12 -0800 (PST)
Received: from gu-dmadival-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm39265484eec.29.2026.11.23.22.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 22:44:11 -0800 (PST)
From: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 22:44:04 -0800
Subject: [PATCH v2 2/3] media: iris: add mahua platform data and enable
 qcom,mahua-iris
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
Message-Id: <20261123-mahua_iris_enable-v2-2-b1a16b16afca@oss.qualcomm.com>
References: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
In-Reply-To: <20261123-mahua_iris_enable-v2-0-b1a16b16afca@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795502648; l=7954;
 i=deepa.madivalara@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=m73ySzdA9FnzAjPI5jh0sJ9CpBEKNdD01Z41v/VEBWc=;
 b=1W9Z7Ke+ZzPNXuutO1AHCKYaN7bkawLY8eM4WxBJR/wMW1Ivqa2+fKrh4I0ZxfP6mjtj7xNKP
 H5O31San1skBSQA0iErehPvsIBlqvrEhsFn6EpXYbbAedFjrYCmev3D
X-Developer-Key: i=deepa.madivalara@oss.qualcomm.com; a=ed25519;
 pk=MOEXgyokievn+bgpHdS6Ixh/KQYyS90z2mqIbQ822FQ=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfXyMfvFaZHyIBi
 k7x6ArGyO/QwJewmVoXEaCIX7fTiBBM/JHj3XT7xZmEE1oDzhIMx6rhxTRWQmwy2MrKfqwxezct
 vpSawKlB36w2vP6ZR5iotUeNaP/XXtY=
X-Authority-Analysis: v=2.4 cv=JbgpPkKV c=1 sm=1 tr=0 ts=6b05323d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=qMmPMGTIe4Jfwz3yK_QA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: mdACUATnZez8dNLT4X5Nx3mSZ_ZnrGy6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAyNiBTYWx0ZWRfX/BWLsQMXpVKR
 BaGYGqkhr47/MgEcKmLP1auThNKR4JiEk1dz/uqgNhhIuAJ97VABtNRsXI9NUEUJdD1hsZ1g1OZ
 lHV17y7V4Pe/JF0oP5kvGTBWsbY2YdkkJd2Se3h7tMhzHaP5Hu0GVOIqSVgvZJfwIkzSK9Pu7S7
 wlclQfZqlnQYSH6xUuiU1bNPKiIRkmN1omvWOo0i3O3ACbrjZeFZROghzHFtMtIfCz1VevRdPqS
 7VEVvqFm+Ouhx1qbAsa0q1q292SaNtUEmptinxjk2oc3eDDpAXKPLrTmx4/yAyy4mTVgP69GHRt
 iIQ6IXVWLaJVDf9ffssXDq+9G7nk0Q9eXypEEguunpT90DzEXZXi8EipPBXtqaMvh4bUYsgzk8g
 QjJ9BMfkZsb5yMHpxioDkKUASgJL1vtiG8mCPMDqvielzLfgnRT1RZgZR3+jgDX3j95ZtmavlLY
 VCls1o4njmN7ShqU64g==
X-Proofpoint-ORIG-GUID: mdACUATnZez8dNLT4X5Nx3mSZ_ZnrGy6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240026

Add qcom,mahua-iris compatible to initialize the hardware
and necessary Mahua platform data describing the needed clock
resets and powerdomain tables only for one core, vcodec0.
Most of the data is leveraged from Glymur as they are the same
Iris variant. Firmware, vpu ops, buffer sizes are the same as for
Glymur.

Signed-off-by: Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  1 +
 .../media/platform/qcom/iris/iris_platform_mahua.c | 44 ++++++++++++++++++++++
 .../media/platform/qcom/iris/iris_platform_mahua.h | 14 +++++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 33 ++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 10 +++++
 7 files changed, 107 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 4a70e124e75f6ea3f46cd33021dcc1f3cd7bee99..e9dbc0c94a1b4797b56917917cb6bc5c43c670ad 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -13,6 +13,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
              iris_platform_glymur.o \
+             iris_platform_mahua.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_platform_vpu_ar50lt.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 1eb8f33a7564f9cbcab6d2eaf80afb50af597e2e..a68f49ed59feb802eac6be115991db834f2c81b9 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -67,6 +67,7 @@ extern const struct platform_inst_slice_caps iris_vpu2_vpu3x_slice_caps;
 extern const struct platform_inst_slice_caps iris_ar50lt_slice_caps;
 
 extern const struct iris_platform_data glymur_data;
+extern const struct iris_platform_data mahua_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_mahua.c b/drivers/media/platform/qcom/iris/iris_platform_mahua.c
new file mode 100644
index 0000000000000000000000000000000000000000..14b085426ac29cf69824d1d0da142c026266a0bb
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_mahua.c
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+
+const struct iris_power_domain_data iris_mahua_ctrl_data = {
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
+const struct iris_power_domain_data iris_mahua_vcodec_data[] = {
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
+};
+
+const char * const iris_mahua_clk_reset_table[] = {
+	"core_bus",
+	"vcodec0_bus",
+	"core",
+	"vcodec0_core",
+};
+
+const char * const iris_mahua_opp_clk_table[] = {
+	"vcodec0_core",
+	"core",
+	NULL,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_mahua.h b/drivers/media/platform/qcom/iris/iris_platform_mahua.h
new file mode 100644
index 0000000000000000000000000000000000000000..fa30f33c5b03b515fa57e52a1b7413406cf5823e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_mahua.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_MAHUA_H__
+#define __IRIS_PLATFORM_MAHUA_H__
+
+extern const struct iris_power_domain_data iris_mahua_ctrl_data;
+extern const struct iris_power_domain_data iris_mahua_vcodec_data[1];
+extern const char * const iris_mahua_clk_reset_table[4];
+extern const char * const iris_mahua_opp_clk_table[2];
+
+#endif /* __IRIS_PLATFORM_MAHUA_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 6ed4de2d15ceca24d018628ec55b2cb3c42b3168..1962d27c181404998c4f31fbb7626bc9f0cc74bc 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -13,6 +13,7 @@
 #include "iris_vpu_common.h"
 
 #include "iris_platform_glymur.h"
+#include "iris_platform_mahua.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -120,6 +121,38 @@ const struct iris_platform_data glymur_data = {
 	.max_core_mbps = ((8192 * 4320) / 256) * 60,
 };
 
+/*
+ * Shares most of Glymur data except, num_cores
+ */
+const struct iris_platform_data mahua_data = {
+	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
+	.vpu_ops = &iris_vpu36_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = iris_mahua_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_mahua_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.ctrl_data = &iris_mahua_ctrl_data,
+	.vcodec_data = iris_mahua_vcodec_data,
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.opp_clk_tbl = iris_mahua_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
+	.tz_cp_config_data = iris_glymur_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
+	.num_vpp_pipe = 4,
+	.max_session_count = 16,
+	.num_cores = 1,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((7680 * 4320) / 256) * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index f5e5044ec3be01c23eb9fdcf54d144b91b03fc28..e784e3e5c2b6309450d0e899d1e46b8e301c7055 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -643,6 +643,10 @@ static const struct of_device_id iris_dt_match[] = {
 		.compatible = "qcom,glymur-iris",
 		.data = &glymur_data,
 	},
+	{
+		.compatible = "qcom,mahua-iris",
+		.data = &mahua_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index f7260eda7f459ed371b5579a3e8582c1691e4190..93bc222629d4aa6a809fd2785d82098a50b48b05 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -365,6 +365,16 @@ static int iris_vpu36_check_core_load(struct iris_inst *inst, bool mbpf)
 	new_load = mbpf ? iris_get_mbpf(inst) : iris_get_mbps(inst);
 
 	select_core0 = core0_load + new_load <= max_load && core0_session_cnt < max_session_cnt;
+
+	if (platform_data->num_cores == 1) {
+		if (select_core0) {
+			inst->core_id = IRIS_VCODEC0;
+			return 0;
+		}
+
+		return -ENOMEM;
+	}
+
 	select_core1 = core1_load + new_load <= max_load && core1_session_cnt < max_session_cnt;
 
 	if (select_core0 && select_core1)

-- 
2.34.1

