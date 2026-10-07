Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82EA489883
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363774; cv=none; b=WzMY0FFqoNEvLwEuIt9LoodDzAHWtgV7FZ6oO1QLoWHkcBGX89o8TQbX+G+4asqHfuOup4/Cjfcljx469juj2Id1CHcHtRpgWe3gWQ8lwws02/Vwxy95k5C3ReP+pN1bRyDoMOX0OiYOZ2kzOsPiKc5Ha6ggDRD3urd0ZgrYvQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363774; c=relaxed/simple;
	bh=2J6dHb7nTSk0Fjk8jYYd1d3mbdbzx4z1EymaSNGZE0E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=u0vlVgCHDQbxSstrRYHCz9aaBhjL7k1M/LpFRVj0ARTTSY9Rc/bLd+koJMZ/IHHMRqFPUOb5kFu2U/STtEjBJEFVAUL1bq0hc71Q1Tnr/8+uWy4mj3kGvpKH89hvE59tCO/w186EUW9KFcRKL1Y8Sx5ORQAxIEQmDmb4Pz68oLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RC4pox86 reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RC4pox86"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977ja0V3810962
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MngPzCaoDfK
	htOea1AzSjCROnKky9IK26Mu/aY+gMwI=; b=RC4pox86ZWmQGV4PQUKj/mKBAvN
	REcdhnFaos1i38OBzrWhzo+7eop4VQcMdXaEgn4GoxaUVGhmuI29bZzeyKHnvjgX
	wYYM73ljGWVqClTDFY7QhhgaMEwLZhNCTzvRfIlMmabSAWXYo6m22JO30lQ2s71z
	TjzNC2gil5Z6XXkMTOhR4+xkWzrzmEw/uKSzWm3IyxxRKQt/ikfTDzNtBuoH7AHf
	VVN5edTMGy2R+ve/DsrTtFDLeZ7lO/fep9sqhqNHY6eCbHRy7INReG0uCVc/VNj7
	u3KYjzQrBnhYIliVtSssKEQ3JT9ARsRsFc6zQKsXdIOxnpypwxHXHg3MUNA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrrg5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:02:19 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93e46c120dfso400134585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363738; x=1791968538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MngPzCaoDfKhtOea1AzSjCROnKky9IK26Mu/aY+gMwI=;
        b=vok6Gxge/D74HSQxXOaBAvYzzIUhaeecuNxJ6uau72GEywH1I4AnLK7VVoKBvKg3ee
         iabXIaVeljGgne50CKriRMToavHOj35eXb9Ekr9C/1klblzhUl6bzT9H4U9dJEGr/DLk
         uboaeV6oEDnHvlfmGf84dMStT7Qr/b2MhdZMEklCgzgoqP9ryrQo+BenVbht5iwindv9
         CnsFL0yAnV9FXu1xiP4MJkyqEljt1SygERpmyg57kH9Qzykhf72af9BMSl2Zr3xP3Bfr
         NbLVB5c3VEt3FYun9YC9gLiGMkv/GSkqHjkLVSlsr+6poE0lYQDs7Fkd1EebUt8ue87o
         9Nwg==
X-Forwarded-Encrypted: i=1; AKwUvBwemIOjsPMiUaxyf+3bxMHXOnLGcU7f4jWgxeBCdMZ7q/gNGc1YWZ3dBZirQ08Vvgw/jjtr0V8oDlg2QbKz@vger.kernel.org
X-Gm-Message-State: AFuF++mLtjKvIRFo+VfSPK7cya9NGyOBBC8X5T5e2Z70OxEojivaiWjw
	NNRiCmaPXnvEI9jd6wbphZOa+Jm/BzQB6g4qHmvWaLPXZ4fIr9g79qE0BmWYzhCEXRPJxma7Klm
	auNlhorh79eZAGz2sLL39h+BeDuyBu1hbk8lAXHh2DN62ahq4VOSKEfjAkmvd5QkdG2p+
X-Gm-Gg: AYBFou3fD1wH19oZzqXV64ta9Sa7Jb9JjKQ7K2nBRlpKNgedyDeZBQ2U79Gnag8OjBQ
	i/U8efXm5Vs6qfhyUfyusAWt05MGD8fWSHY4RHS3g/wKmDxQoeCkDEYr2uvSE6V5XyFgagmMuFC
	ebI/CMzWdSCMiDmfZHoMKa5/yrLRO9arEX3AkXE0A7udagUxqVPaAcbb68jZ7HxJza/R7PqW0j1
	MOU0Bw86MwoTwG9jvSIh9sjD3CwctwE+xpDVsStI7bkh1PxncL+B2cxYyqbA6SHbX+loReKxH0z
	dDZh8AwYf96cQvf922ut7l3fdv5zCh3dT/58gOLcF3FZahXi3lQNG9DQPfU=
X-Received: by 2002:a05:620a:3903:b0:937:675e:2903 with SMTP id af79cd13be357-93e9b721a60mr282315885a.14.1791363738214;
        Wed, 07 Oct 2026 02:02:18 -0700 (PDT)
X-Received: by 2002:a05:620a:3903:b0:937:675e:2903 with SMTP id af79cd13be357-93e9b721a60mr282308285a.14.1791363737589;
        Wed, 07 Oct 2026 02:02:17 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:16 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Subject: [PATCH RESEND 26/45] media: qcom: camss: sa8775p: add IFE BUS v3.1x
Date: Wed,  7 Oct 2026 12:00:22 +0300
Message-Id: <20261007090041.3732717-27-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac60a9b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=m-RkIwnzgGneSlHtjuwA:9
 a=UPhfUc_oUKe9iv7q:21 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Cg6H7xiIGMp_FwvqLLba6CYmbC6tOqNF
X-Proofpoint-GUID: Cg6H7xiIGMp_FwvqLLba6CYmbC6tOqNF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX82UukCohuDHS
 0bQsoEx84/SO4Wf6PobYI7yTKWJYBjo0fPzeLNxrJMMmkQi9ThBcrn3aS5QHDyDViiHLvojtePK
 qdlQ7wt3D044iELltfZtHE9ylfQBwVbh0tCsL1okXyAbQUmhvGkai4wh7rU5trYLP3HKxasiS8p
 whDFrf/r77jIEPXJpzCSzPMa2eVzdZ+VepEPrz63eLnqvJFODVkmex0RSsSQnrXsKNepHsaX+mi
 ch/jLjDClG2G8bDH9VKTZ0VK4Vpw2gIs8K/j1k6gmDcKuoiZbTnXiRv2u6ZQIAnxqS0xoRYVWNW
 Rg3BqTjJCXsys42i/Me/3JAsQwVTkPaohR2ElORpHdNJV1oBnM1HitAokdacVQKRXxzcm7RSx/u
 almIbxYW5Q2UP25faw0oLFbZ+FXM7+AeJZhjmVxqDtN8R4nSWizgVoPayXvfiDlWRoNS2VcoVmP
 2C7tMz1OQqjhf9sbirA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX6eanSc+k/8ED
 nql2sqbDmevgKm4KbG1FRn8Rf/9YstOJQ/uQb1/7C8cCI3lGK2aEtL5g0y28KGoxEZ2ckTsnYC6
 3rXG4MbjbiKn1yFC9NePZfRa7cmSoPo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE BUS v3.1x write engine used by the SA8775P full and lite
pixel paths.

Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-bus-v31x.c  | 267 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 269 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 500b056a906c..2251b57ba38b 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -16,6 +16,7 @@ qcom-camss-objs += \
 		camss-format.o \
 		camss-ife.o \
 		camss-ife-bus-v20x.o \
+		camss-ife-bus-v31x.o \
 		camss-ife-camif-v10x.o \
 		camss-ife-lite-top-v10x.o \
 		camss-ife-mod-v10x.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c b/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c
new file mode 100644
index 000000000000..c3a99bd0f75e
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-bus-v31x.c
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/bitfield.h>
+
+#include "camss.h"
+#include "camss-ife.h"
+
+/* Block base offsets */
+#define BUSWR_V31X_OFFS		0x400
+#define BUSWR_V31X_LITE_OFFS	0x480
+
+/* Per-client register offset */
+#define BUSWR_V31X_CLIENT_OFFS(n)	((n) * 0x100)
+
+/* Interface interrupt and violation status bits */
+#define BUSWR_V31X_IIF_IRQ_CMD_CLEAR			BIT(0)
+#define BUSWR_V31X_OVERFLOW_ERR_MASK			GENMASK(25, 0)
+#define IS_BUSWR_V31X_OVERFLOW_ERR(s)	\
+	((s) & BUSWR_V31X_OVERFLOW_ERR_MASK)
+#define BUSWR_V31X_VIOLATION_ERR_MASK			GENMASK(25, 0)
+#define IS_BUSWR_V31X_VIOLATION_ERR(s)	\
+	((s) & BUSWR_V31X_VIOLATION_ERR_MASK)
+#define BUSWR_V31X_IMG_SIZE_VIOLATION_ERR_MASK		GENMASK(25, 0)
+#define IS_BUSWR_V31X_IMG_SIZE_VIOLATION_ERR(s)	\
+	((s) & BUSWR_V31X_IMG_SIZE_VIOLATION_ERR_MASK)
+#define BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION	BIT(31)
+#define IS_BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(s)	\
+	((s) & BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION)
+#define BUSWR_V31X_IIF_IRQ_S0_VIOLATION			BIT(30)
+#define IS_BUSWR_V31X_IIF_IRQ_S0_VIOLATION(s)	\
+	((s) & BUSWR_V31X_IIF_IRQ_S0_VIOLATION)
+
+/* Client configuration field values */
+#define BUSWR_V31X_IIF_CGC_OVERRIDE			GENMASK(26, 0)
+#define BUSWR_V31X_CLIENT_CFG_MODE			GENMASK(17, 16)
+#define BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN		BIT(4)
+#define BUSWR_V31X_CLIENT_CFG_EN			BIT(0)
+#define BUSWR_V31X_CLIENT_IMG_CFG0_HEIGHT		GENMASK(31, 16)
+#define BUSWR_V31X_CLIENT_IMG_CFG0_WIDTH		GENMASK(15, 0)
+#define BUSWR_V31X_CLIENT_IMG_CFG2_STRIDE		GENMASK(23, 0)
+#define BUSWR_V31X_CLIENT_PACKER_CFG_ALIGN		BIT(5)
+#define BUSWR_V31X_CLIENT_PACKER_CFG_FORMAT		GENMASK(4, 0)
+#define BUSWR_V31X_PACKER_FMT_PLAIN16_10_BPP		0x5
+#define BUSWR_V31X_PACKER_FMT_PLAIN16_16_BPP		0x8
+#define BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD	GENMASK(4, 0)
+#define BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN	GENMASK(31, 0)
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_PERIOD		GENMASK(4, 0)
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_PATTERN	GENMASK(31, 0)
+
+/* FIFO limit and frame-based RDI defaults */
+#define BUSWR_V31X_IMG_ADDR_FIFO_MAX_DEPTH		2
+#define BUSWR_V31X_RDI_DEFAULT_WIDTH			0xffff
+#define BUSWR_V31X_RDI_DEFAULT_STRIDE			0xffff
+#define BUSWR_V31X_CLIENT_ADDR_STATUS_2_IMAGE_ADDR_FIFO_WORD_CNT	GENMASK(2, 0)
+
+/* Common registers */
+#define BUSWR_V31X_IIF_CGC_OVERRIDE_REG		0x00000008
+#define BUSWR_V31X_WM_TEST_BUS_CTRL_REG		0x000000fc
+#define BUSWR_V31X_IIF_IRQ_MASK_S0		0x00000018
+#define BUSWR_V31X_IIF_IRQ_CLEAR_S0		0x00000020
+#define BUSWR_V31X_IIF_IRQ_STATUS_S0		0x00000028
+#define BUSWR_V31X_IIF_IRQ_CMD_REG		0x00000030
+#define BUSWR_V31X_STATUS_CLEAR_REG		0x00000060
+#define BUSWR_V31X_VIOLATION_STATUS_REG		0x00000064
+#define BUSWR_V31X_OVERFLOW_STATUS_REG		0x00000068
+#define BUSWR_V31X_IMG_SIZE_VIOLATION_REG	0x00000070
+
+/* Per-client registers (relative to client base = module_base + CLIENT_OFFS(n)) */
+#define BUSWR_V31X_CLIENT_CFG_REG		0x00000200
+#define BUSWR_V31X_CLIENT_ADDR_IMAGE_REG	0x00000204
+#define BUSWR_V31X_CLIENT_IMG_CFG0_REG		0x0000020c
+#define BUSWR_V31X_CLIENT_IMG_CFG2_REG		0x00000214
+#define BUSWR_V31X_CLIENT_PACKER_CFG_REG	0x00000218
+#define BUSWR_V31X_CLIENT_IRQ_SS_CFG0_REG	0x00000230
+#define BUSWR_V31X_CLIENT_IRQ_SS_CFG1_REG	0x00000234
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_REG	0x00000238
+#define BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_REG	0x0000023c
+#define BUSWR_V31X_CLIENT_ADDR_STATUS_0_REG	0x00000270
+#define BUSWR_V31X_CLIENT_ADDR_STATUS_2_REG	0x00000278
+
+static void ife_buswr_31x_acquire(struct ife_device *ife, void __iomem *base)
+{
+	struct ife_buswr_ctx *ctx = &ife->buswr_ctx;
+
+	if (ife->res->type == CAMSS_IFE_SUBDEV_TYPE_IFE_LITE)
+		ctx->base = base + BUSWR_V31X_LITE_OFFS;
+	else
+		ctx->base = base + BUSWR_V31X_OFFS;
+
+	ctx->dev = ife->camss->dev;
+}
+
+static void ife_buswr_31x_release(struct ife_buswr_ctx *ctx)
+{
+	ctx->base = NULL;
+}
+
+static void ife_buswr_31x_wm_config(struct ife_buswr_ctx *ctx, const u8 wm,
+				    const struct camss_ife_wm_config *cfg)
+{
+	void __iomem *base = ctx->base;
+	bool align = cfg->packing_fmt >= BUSWR_V31X_PACKER_FMT_PLAIN16_10_BPP &&
+		     cfg->packing_fmt <= BUSWR_V31X_PACKER_FMT_PLAIN16_16_BPP;
+	u32 pattern = 1;
+	u32 period = 0;
+	u32 bytes = cfg->bytes;
+	u32 stride = cfg->stride;
+	u32 lines = cfg->lines;
+	u32 rval;
+
+	if (cfg->mode_config == BUSWR_CLIENT_CFG_MODE_FRAME_BASED) {
+		bytes = BUSWR_V31X_RDI_DEFAULT_WIDTH;
+		lines = 0;
+		stride = BUSWR_V31X_RDI_DEFAULT_STRIDE;
+	}
+
+	writel_relaxed(BUSWR_V31X_IIF_CGC_OVERRIDE,
+		       base + BUSWR_V31X_IIF_CGC_OVERRIDE_REG);
+	writel_relaxed(0, base + BUSWR_V31X_WM_TEST_BUS_CTRL_REG);
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_CFG_MODE, cfg->mode_config);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_PACKER_CFG_FORMAT, cfg->packing_fmt) |
+	       FIELD_PREP(BUSWR_V31X_CLIENT_PACKER_CFG_ALIGN, align);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_PACKER_CFG_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG0_WIDTH, bytes) |
+	       FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG0_HEIGHT, lines);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IMG_CFG0_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IMG_CFG2_STRIDE, stride);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IMG_CFG2_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG0_PERIOD, period);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IRQ_SS_CFG0_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_IRQ_SUBSAMPLE_CFG1_PATTERN, pattern);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_IRQ_SS_CFG1_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_PERIOD, period);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_FRAMEDROP_CFG0_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+
+	rval = FIELD_PREP(BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_PATTERN, pattern);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_FRAMEDROP_CFG1_REG +
+		       BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_31x_wm_enable(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	rval = readl_relaxed(base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+	rval |= BUSWR_V31X_CLIENT_CFG_EN | BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN;
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static void ife_buswr_31x_wm_disable(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	rval = readl_relaxed(base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+	rval &= ~(BUSWR_V31X_CLIENT_CFG_EN | BUSWR_V31X_CLIENT_CFG_AUTO_RECOVERY_EN);
+	writel_relaxed(rval, base + BUSWR_V31X_CLIENT_CFG_REG + BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static bool ife_buswr_31x_is_fifo_full(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	u32 rval = readl_relaxed(ctx->base + BUSWR_V31X_CLIENT_OFFS(wm) +
+				 BUSWR_V31X_CLIENT_ADDR_STATUS_2_REG);
+
+	rval = FIELD_GET(BUSWR_V31X_CLIENT_ADDR_STATUS_2_IMAGE_ADDR_FIFO_WORD_CNT, rval);
+
+	return rval >= BUSWR_V31X_IMG_ADDR_FIFO_MAX_DEPTH;
+}
+
+static void ife_buswr_31x_queue_buf(struct ife_buswr_ctx *ctx, const u8 num_wms, const u8 *wm,
+				    dma_addr_t *addr)
+{
+	int i;
+
+	for (i = 0; i < num_wms; i++) {
+		if (addr[i])
+			writel_relaxed(addr[i], ctx->base + BUSWR_V31X_CLIENT_ADDR_IMAGE_REG +
+				       BUSWR_V31X_CLIENT_OFFS(wm[i]));
+	}
+}
+
+static u32 ife_buswr_31x_consumed_addr(struct ife_buswr_ctx *ctx, u8 wm)
+{
+	return readl_relaxed(ctx->base + BUSWR_V31X_CLIENT_ADDR_STATUS_0_REG +
+			     BUSWR_V31X_CLIENT_OFFS(wm));
+}
+
+static u32 ife_buswr_31x_irq_status(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 bus_stat;
+	u32 iif_stat;
+
+	bus_stat = readl_relaxed(base + BUSWR_V31X_OVERFLOW_STATUS_REG);
+	writel_relaxed(BIT(0), base + BUSWR_V31X_STATUS_CLEAR_REG);
+	if (IS_BUSWR_V31X_OVERFLOW_ERR(bus_stat)) {
+		writel_relaxed(bus_stat, base + BUSWR_V31X_STATUS_CLEAR_REG);
+		pr_warn("BUSWR common overflow: 0x%x\n", bus_stat);
+	}
+
+	bus_stat = readl_relaxed(base + BUSWR_V31X_VIOLATION_STATUS_REG);
+	if (IS_BUSWR_V31X_VIOLATION_ERR(bus_stat))
+		pr_warn("BUSWR common violation: 0x%x\n", bus_stat);
+
+	bus_stat = readl_relaxed(base + BUSWR_V31X_IMG_SIZE_VIOLATION_REG);
+	if (IS_BUSWR_V31X_IMG_SIZE_VIOLATION_ERR(bus_stat))
+		pr_warn("BUSWR common image size violation: 0x%x\n", bus_stat);
+
+	iif_stat = readl_relaxed(base + BUSWR_V31X_IIF_IRQ_STATUS_S0);
+	writel_relaxed(iif_stat, base + BUSWR_V31X_IIF_IRQ_CLEAR_S0);
+	if (iif_stat) {
+		if (IS_BUSWR_V31X_IIF_IRQ_S0_IMG_SIZE_VIOLATION(iif_stat))
+			pr_warn("BUSWR image size violation from CCIF: 0x%x\n", iif_stat);
+		if (IS_BUSWR_V31X_IIF_IRQ_S0_VIOLATION(iif_stat))
+			pr_warn("BUSWR violation from CCIF: 0x%x\n", iif_stat);
+	}
+
+	writel_relaxed(BUSWR_V31X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V31X_IIF_IRQ_CMD_REG);
+
+	return iif_stat;
+}
+
+static void ife_buswr_31x_irq_enable(struct ife_buswr_ctx *ctx)
+{
+	writel_relaxed(~0, ctx->base + BUSWR_V31X_IIF_IRQ_MASK_S0);
+}
+
+static void ife_buswr_31x_irq_disable(struct ife_buswr_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	writel_relaxed(0, base + BUSWR_V31X_IIF_IRQ_MASK_S0);
+	writel_relaxed(~0, base + BUSWR_V31X_IIF_IRQ_CLEAR_S0);
+	writel_relaxed(BUSWR_V31X_IIF_IRQ_CMD_CLEAR, base + BUSWR_V31X_IIF_IRQ_CMD_REG);
+}
+
+const struct ife_hw_buswr_ops ife_buswr_31x_ops = {
+	.acquire	= ife_buswr_31x_acquire,
+	.release	= ife_buswr_31x_release,
+	.irq_enable	= ife_buswr_31x_irq_enable,
+	.irq_disable	= ife_buswr_31x_irq_disable,
+	.wm_config	= ife_buswr_31x_wm_config,
+	.wm_enable	= ife_buswr_31x_wm_enable,
+	.wm_disable	= ife_buswr_31x_wm_disable,
+	.queue_buf	= ife_buswr_31x_queue_buf,
+	.consumed_addr	= ife_buswr_31x_consumed_addr,
+	.irq_status	= ife_buswr_31x_irq_status,
+	.is_fifo_full	= ife_buswr_31x_is_fifo_full,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index c163c336fcc3..efbb1e75d550 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -397,6 +397,7 @@ camss_ife_pipe_for_stream_id(int nstreams,
 extern const struct ife_pads_descriptors ife_pads_v20x;
 extern const struct ife_hw_top_ops ife_top_20x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
+extern const struct ife_hw_buswr_ops ife_buswr_31x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
 
 extern const struct ife_pads_descriptors ife_lite_pads_v20x;
-- 
2.34.1

