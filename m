Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE1CB4F405B
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790779959; cv=none; b=t99LgvY1KIPblyDHwXCc1yV3ESmZdWFc6UF4r7cV+LMapvU1iyteoi/E/Cz0pPkuq52urO2bHVE2CSNFiOu3QYXCTOCP+PBMFej2Z0iD8RGZW8sUgATTOH6U2na+g60idToZsItUnRqJniCFbjFQ5pN1F0TJk9yiL9pV6yw99SQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790779959; c=relaxed/simple;
	bh=XjmZ7HCZSIfcoUltaCRGXefZ8w1zKPfi3DotR5M/Yrg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dvi9P6DGx6UYMjVadF5b6NnMvJDLwdXbxbK0e6VLUXB81D1uhpKujRGB6EKYGknrpl4qLyFCDBPNZD1kK9LG8SWZLsnu/K4YKbBBaeeeDiVCmbsAkd6Suf491OkTMWBJPamK1aKoJ4RgjPbOBzJkRv66QSo3Z5CXbTuLUgoUqgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dl7B4U6L; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G4q0MenF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dl7B4U6L";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="G4q0MenF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UE02qX2970502
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zkTo8nTIePk
	l65P8PXm0LiFZiH9dHt4Vj2fwdowNXuE=; b=Dl7B4U6L/OfBcrryy6otn6p04/i
	UjB8WKsFOwxAf5UChh5PAuojTBPMJvIOqmSrzVZfvpEVeWZ0kgar2B6FFNe6n2pT
	lAF77UeP7IJkBQSKk4X1jAYplq9Bgds1lBvdZ+3bdv7/lZvdm1D6B7V5JGr/+oy2
	H9TsfhHhdhaNdgYHhT/Oy6miYUrYS+i0xN1DIcxEJEPjb31/pRZchhw72pxVWnpA
	k0fhvN9QuGFJhTAMFNpbpbYk+eL0zNvdn3WCV/B7dtooRqU4VrekXYajq7y9qGdl
	o2Ne9GkuLd9CGWqdtg528Qtcx2z+kWYCssOJlxVx1bbLZHZoAHApmxDkoqw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0rhekctn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 14:52:26 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30c0d568830so10662555eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 07:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790779945; x=1791384745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zkTo8nTIePkl65P8PXm0LiFZiH9dHt4Vj2fwdowNXuE=;
        b=G4q0MenF7Ilz8g+4/LiwZpxxN/ieS+AS6Sdp50F+4DY4vJKthEy4nL8Xn90aeSqjFX
         y+oEkYliDg47OznETfdswlzfyCYBb7qqdX9gDdCSOWpvCib4Lm2Tg3XJc2mnBb9Yby+n
         +wAYo8rEpePyeyhMrWz6G/XB0aSoHVR5Yfc5aeB6BLhufpHrbnoJDixdIX8NNug8wGWX
         hFmQk1x2YohoSKfhcuGvY5eKfmYL7zHieYDTW+qrRf1foxVfOfIjvrmZg7doQ8KXMg78
         SAGeif/pMeEpI46Jp++lB8pXm99QMjc0Y28yO6mQLV8Q1ewmmvt3ylwFMyEUe+VNmBWG
         aLwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779945; x=1791384745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zkTo8nTIePkl65P8PXm0LiFZiH9dHt4Vj2fwdowNXuE=;
        b=OzT4U7nco34uJXHPzkjXfTY07TJ08O43Mg4OefszOdmq785ZBsjP/xmyMwhiqTPJ1I
         m4Dpe89bmXWrV5A7flvbOkhJm8zJFbgFLYqeFrZAaWGXDz1QzDgRn7cOZFTHEZbiXk5Y
         vPxzVkv9LBC/s85/poXW0T6oJB0Ngg1y/RT46GzV+Ap+Hq8HipNlpu5+T4PHhUFXy5gY
         CQQ+vRw17F//L2+a5dTrpgxODumvCwsyp6C6fqpiTCbNAQYOKQEv34h3QSnhp8U8S/Q+
         EVOii9PmCy9qNtRvrnQEibgQuUiBvDsJO2cvV4qX6DEpYvDnzdRJcmeUa0AtK7uFEa35
         xisA==
X-Forwarded-Encrypted: i=1; AKwUvBw6doMHM1vITJ7gxlIugrYJK4xaPf2PpCrZDLrjaD8tpqA6DZglUVYdDEKNF3uNWoeNS05TEQri6/fgpmex@vger.kernel.org
X-Gm-Message-State: AFq9FYJBpYo4k23qNhVNVXOljT17lwYs/Shmel99gWuLDR5grBZh0eCc
	aRknysAnU/FZeVBQpo9Zn/gbrjVhCJKRZRjDV8Bq4TjZT6XWfsnqSZY5ScmvHOJ30E/xQ0pcjLG
	zOXG2L7tnUPwvq26snLOiT/ysRZNLrYk8JxpsAgvyXfk6qSQDwOUVTLHb1gKTY2uXZO/q
X-Gm-Gg: AYBFou2Xb4OVGHU0Qf9OfxIcL3jW7F8hJfyoMQ7Oug7EpZA+3aKuXcqtBhK+Z5uKNOM
	OwxJOj+5YhhKzjSZ0oXgViAOMaPcmDQXyFVCYY3hhnHmkc0Y5HcOZz8VP7N+QMheA1j1PHqZr07
	89qRMTlcu3H5ozoP3VQutesCTIhhAN7wfSn8CuIMoD+4bOoO7qinlnXgLlLlpVvLbwewNWpKAo/
	luNgmNZk14hMC6AL7YIXldb8xhmZ+7Qfk1h9FiceIOl4dUQzXfyC0Z4qJKBNy+1Cup+6XcCtQyT
	3Pmn1mX5tbwBBpdnJcPmCSfWhaO1woQ0d4zCgL2RYc4Uc40lvpoa97ccpMqS7TL/59t+kHanzsg
	L0hqdBF4nYgOSxYboe7g8g8jUdYxy/8mtKxQlMPPq/C9SGG4XNX+A1r4=
X-Received: by 2002:a05:693c:894c:10b0:343:fdea:998 with SMTP id 5a478bee46e88-34cdc0cf62bmr1907085eec.19.1790779944712;
        Wed, 30 Sep 2026 07:52:24 -0700 (PDT)
X-Received: by 2002:a05:693c:894c:10b0:343:fdea:998 with SMTP id 5a478bee46e88-34cdc0cf62bmr1907034eec.19.1790779943788;
        Wed, 30 Sep 2026 07:52:23 -0700 (PDT)
Received: from hu-c-gdjako-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34cf5639339sm4524609eec.18.2026.09.30.07.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:52:23 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        minchan@kernel.org, senozhatsky@chromium.org
Cc: axboe@kernel.dk, rostedt@goodmis.org, mhiramat@kernel.org,
        mathieu.desnoyers@efficios.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-block@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
        djakov@kernel.org
Subject: [PATCH 4/6] zram: Add QPaCE zcomp backend
Date: Wed, 30 Sep 2026 07:52:13 -0700
Message-Id: <20260930145215.3380977-5-georgi.djakov@oss.qualcomm.com>
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
X-Proofpoint-GUID: IGI3XJEBVrs4RMrHpXR-Lo8EtLH9hES5
X-Proofpoint-ORIG-GUID: IGI3XJEBVrs4RMrHpXR-Lo8EtLH9hES5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfXz6tyrX11ln9W
 axa6e64HcQhwEXZ7ZC4t07NlGUnZfF/y0UwFQ2nGuROAq1j5CI8SUlfEgGSfRpv1tbdQ7SqIeaq
 rtsywktgtmK/tDrytkjnBS1lv3sKcwWhCUfTNw7I6knl9os6U1mO/rF9JcZ2KOh/bdenBknhSG8
 RoaGPjBOJ1NK+na/Jtlq6UTqjwzRQhp3V10vSe6uHVqECxDOV2iLKyKboX3l/gqhufgnZGyFg1n
 PMHRwnFB/kdCSlBR61Pm8uKB5Knb6GA1YJiRJMVWRlr8nOz+aA5h2VCXYmnDM9iinNuQ5gzvQxq
 XVxPqboN/FTo90rIvePXEviaqcnlIwApH+q2jeZHRYI/yLBkvhzTc19tpZ5Madc/prmhrWSgF52
 jFNG1JANLP3CXvPWjlmJz7vE9kJh5fRCJ0AVwi9mYrP82tAIkKc+j1pc/+9fu2ODfRMiRufG6lM
 NfsijqABSvRhtZ+ZwNQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1OSBTYWx0ZWRfX93Zhwi3AMNaE
 4gLeBDaFsse4xZJDoq7FKyPubROC2m/KS5qR8dJ5DhvGlLH96CrZ8q+tDi2P0CkZmPQRrbBmabU
 6A9DDOukHkyTtuz+eN3cSCrsAz8EdJY=
X-Authority-Analysis: v=2.4 cv=Tu1zFzXh c=1 sm=1 tr=0 ts=6abd222a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=S8Xc0r_aw9f0a4gVDKgA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300059

Add a zcomp backend for the Qualcomm Page Compression Engine (QPaCE) so
zram can expose qpace-lz4 as a selectable compression algorithm when the
QPaCE driver is available.

Compress and decompress operations are handled via the QPaCE urgent
synchronous path: each request DMA-maps the source and destination
buffers, issues a blocking hardware command, and returns the result size.

Signed-off-by: Georgi Djakov <georgi.djakov@oss.qualcomm.com>
---
 drivers/block/zram/Kconfig         |  11 +++
 drivers/block/zram/Makefile        |   1 +
 drivers/block/zram/backend_qpace.c | 134 +++++++++++++++++++++++++++++
 drivers/block/zram/backend_qpace.h |  13 +++
 drivers/block/zram/zcomp.c         |  11 ++-
 5 files changed, 168 insertions(+), 2 deletions(-)
 create mode 100644 drivers/block/zram/backend_qpace.c
 create mode 100644 drivers/block/zram/backend_qpace.h

diff --git a/drivers/block/zram/Kconfig b/drivers/block/zram/Kconfig
index 402b7b175863..eece67e7ea83 100644
--- a/drivers/block/zram/Kconfig
+++ b/drivers/block/zram/Kconfig
@@ -44,6 +44,17 @@ config ZRAM_BACKEND_842
 	select 842_COMPRESS
 	select 842_DECOMPRESS
 
+config ZRAM_BACKEND_QPACE
+	bool "QPaCE compression support"
+	depends on ZRAM
+	depends on QCOM_PAGE_COMPRESSION_ENGINE = y || \
+		(ZRAM = m && QCOM_PAGE_COMPRESSION_ENGINE = m)
+	help
+	  Enable Qualcomm Page Compression Engine (QPaCE) hardware
+	  acceleration as a zram backend. When selected, zram offloads
+	  synchronous compress and decompress operations to the QPaCE
+	  urgent command path, reducing CPU overhead.
+
 config ZRAM_BACKEND_FORCE_LZO
 	depends on ZRAM
 	def_bool !ZRAM_BACKEND_LZ4 && !ZRAM_BACKEND_LZ4HC && \
diff --git a/drivers/block/zram/Makefile b/drivers/block/zram/Makefile
index 0fdefd576691..9e1c35f942e0 100644
--- a/drivers/block/zram/Makefile
+++ b/drivers/block/zram/Makefile
@@ -8,5 +8,6 @@ zram-$(CONFIG_ZRAM_BACKEND_LZ4HC)	+= backend_lz4hc.o
 zram-$(CONFIG_ZRAM_BACKEND_ZSTD)	+= backend_zstd.o
 zram-$(CONFIG_ZRAM_BACKEND_DEFLATE)	+= backend_deflate.o
 zram-$(CONFIG_ZRAM_BACKEND_842)		+= backend_842.o
+zram-$(CONFIG_ZRAM_BACKEND_QPACE)	+= backend_qpace.o
 
 obj-$(CONFIG_ZRAM)	+=	zram.o
diff --git a/drivers/block/zram/backend_qpace.c b/drivers/block/zram/backend_qpace.c
new file mode 100644
index 000000000000..3af13727adef
--- /dev/null
+++ b/drivers/block/zram/backend_qpace.c
@@ -0,0 +1,134 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/dma-mapping.h>
+#include <linux/slab.h>
+#include <linux/soc/qcom/qpace.h>
+
+#include "backend_qpace.h"
+
+struct qpace_ctx {
+	struct device *dev;
+	void *in_buf;
+	dma_addr_t in_dma;
+	void *out_buf;
+	dma_addr_t out_dma;
+};
+
+static int qpace_setup_lz4_params(struct zcomp_params *params)
+{
+	params->drv_data = (void *)&qpace_lz4_algorithm;
+	return 0;
+}
+
+static void qpace_release_params(struct zcomp_params *params)
+{
+}
+
+static int qpace_create_ctx(struct zcomp_params *params, struct zcomp_ctx *ctx)
+{
+	struct device *dev = qpace_get_dma_dev();
+	struct qpace_ctx *cc;
+
+	if (!dev)
+		return -ENODEV;
+
+	cc = kzalloc_obj(*cc, GFP_KERNEL);
+	if (!cc)
+		return -ENOMEM;
+
+	cc->dev = dev;
+	cc->in_buf = dma_alloc_coherent(dev, PAGE_SIZE, &cc->in_dma, GFP_KERNEL);
+	if (!cc->in_buf)
+		goto err_free;
+
+	cc->out_buf = dma_alloc_coherent(dev, PAGE_SIZE, &cc->out_dma, GFP_KERNEL);
+	if (!cc->out_buf)
+		goto err_free_in;
+
+	ctx->context = cc;
+	return 0;
+
+err_free_in:
+	dma_free_coherent(dev, PAGE_SIZE, cc->in_buf, cc->in_dma);
+err_free:
+	kfree(cc);
+	return -ENOMEM;
+}
+
+static void qpace_destroy_ctx(struct zcomp_ctx *ctx)
+{
+	struct qpace_ctx *cc = ctx->context;
+
+	if (!cc)
+		return;
+
+	dma_free_coherent(cc->dev, PAGE_SIZE, cc->out_buf, cc->out_dma);
+	dma_free_coherent(cc->dev, PAGE_SIZE, cc->in_buf, cc->in_dma);
+	kfree(cc);
+	ctx->context = NULL;
+}
+
+static int qpace_compress(struct zcomp_params *params, struct zcomp_ctx *ctx,
+			  struct zcomp_req *req)
+{
+	struct qpace_algorithm *algo = params->drv_data;
+	struct qpace_ctx *cc = ctx->context;
+	int ret;
+
+	memcpy(cc->in_buf, req->src, req->src_len);
+
+	ret = qpace_urgent_compress(cc->in_dma, cc->out_dma, algo);
+
+	if (ret == -E2BIG || ret >= PAGE_SIZE) {
+		req->dst_len = PAGE_SIZE;
+		return 0;
+	}
+	if (ret <= 0)
+		return ret < 0 ? ret : -EIO;
+
+	if (ret > req->dst_len)
+		return -EIO;
+
+	memcpy(req->dst, cc->out_buf, ret);
+	req->dst_len = ret;
+
+	return 0;
+}
+
+static int qpace_decompress(struct zcomp_params *params, struct zcomp_ctx *ctx,
+			    struct zcomp_req *req)
+{
+	struct qpace_algorithm *algo = params->drv_data;
+	struct qpace_ctx *cc = ctx->context;
+	int ret;
+
+	if (req->src_len > PAGE_SIZE)
+		return -EINVAL;
+
+	memcpy(cc->in_buf, req->src, req->src_len);
+
+	ret = qpace_urgent_decompress(cc->in_dma, cc->out_dma, req->src_len, algo);
+	if (ret <= 0)
+		return ret < 0 ? ret : -EIO;
+
+	if (ret > req->dst_len)
+		return -EIO;
+
+	memcpy(req->dst, cc->out_buf, ret);
+	req->dst_len = ret;
+
+	return 0;
+}
+
+const struct zcomp_ops backend_qpace_lz4 = {
+	.name			= "qpace-lz4",
+	.setup_params		= qpace_setup_lz4_params,
+	.release_params		= qpace_release_params,
+	.create_ctx		= qpace_create_ctx,
+	.destroy_ctx		= qpace_destroy_ctx,
+	.compress		= qpace_compress,
+	.decompress		= qpace_decompress,
+};
diff --git a/drivers/block/zram/backend_qpace.h b/drivers/block/zram/backend_qpace.h
new file mode 100644
index 000000000000..03747405edcf
--- /dev/null
+++ b/drivers/block/zram/backend_qpace.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __BACKEND_QPACE_H__
+#define __BACKEND_QPACE_H__
+
+#include "zcomp.h"
+
+extern const struct zcomp_ops backend_qpace_lz4;
+
+#endif /* __BACKEND_QPACE_H__ */
diff --git a/drivers/block/zram/zcomp.c b/drivers/block/zram/zcomp.c
index 028e2f0f587e..b5bd0b11a975 100644
--- a/drivers/block/zram/zcomp.c
+++ b/drivers/block/zram/zcomp.c
@@ -22,6 +22,10 @@
 #include "backend_deflate.h"
 #include "backend_842.h"
 
+#if IS_ENABLED(CONFIG_ZRAM_BACKEND_QPACE)
+#include "backend_qpace.h"
+#endif
+
 static const struct zcomp_ops *backends[] = {
 #if IS_ENABLED(CONFIG_ZRAM_BACKEND_LZO)
 	&backend_lzorle,
@@ -41,6 +45,9 @@ static const struct zcomp_ops *backends[] = {
 #endif
 #if IS_ENABLED(CONFIG_ZRAM_BACKEND_842)
 	&backend_842,
+#endif
+#if IS_ENABLED(CONFIG_ZRAM_BACKEND_QPACE)
+	&backend_qpace_lz4,
 #endif
 	NULL
 };
@@ -80,10 +87,10 @@ static const struct zcomp_ops *lookup_backend_ops(const char *comp)
 
 	while (backends[i]) {
 		if (sysfs_streq(comp, backends[i]->name))
-			break;
+			return backends[i];
 		i++;
 	}
-	return backends[i];
+	return NULL;
 }
 
 const char *zcomp_lookup_backend_name(const char *comp)
