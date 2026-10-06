Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400DA3A7F68
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326519; cv=none; b=FF1YjfL2ZSBfP1TF/kFnq55CBvG86VVUPpD55td5nb/7zKUxsZ/F1lUwyJTpl2Ceg8QZlEFGf2N2V7hVpzavPs/ovvhdGgaSQ8C3lQT4FMTAkQcf+NUPZZNBMYpbH7puSnEcgMFF0O5XTWKOY+zyVxtO3D8r1C62/PxXo4frQVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326519; c=relaxed/simple;
	bh=dm77JisP2qryPkO1etyQVWroqhfN4DJQbsaMACzJ4JA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X1aPoqY+IP5KSCjuv9ttql2HR0x8oPCksdBQG9k1A14miVkSvXoBSmMQuaWi3EJXzcC0WfRnhyO3c17YkocuTyUquBg0q3afKV6YB4O2CetrlowZctCJISbMs+TJldfgGoymvyvNmE//iIPhY+3S6cvu7bz9Ku09S3i97rcazG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GrGYBGA2 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GrGYBGA2"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeQj03050148
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:40:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=JEsmT2osR55
	9cHG4YCghhy8jV0KEReJym4+XrJb8+5E=; b=GrGYBGA2rKkANgeo69v+DJkkn+r
	MflPSyyo1lVgD6MgIxU5V+TuTBlN/Nc+f2iOVaQHE00lyfPFV8/oWW8l1QDEqzZL
	00rzMgq53JF5XrCOxxnHr4vbvsQj5H17Hxtkj4gRRbifmwueP6MatRh7HKMmKQo7
	TYG3WX+ip8LItqtddeNeV26aeP7nN/RfzgzQLfr6ViE/NqnlddjJbC1Gp0bunqWe
	XPrRlOS854GeLcCzI/h5Wpa3FjcpuQRUFM5Js6qM0rK/LG4NnE72y8FBUDRrhx9f
	i7nRmtQOwcw4GMLmqihIpvlzO9cF9BDtZ1+ExX1yKQ3p5EMPbuOEkKlWOog==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xc5318a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:40:37 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91961374299so91236416d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:40:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326437; x=1791931237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JEsmT2osR559cHG4YCghhy8jV0KEReJym4+XrJb8+5E=;
        b=0IfXZN79uJZosdAKB1vTweXE+c99FdQraSZLJv2BvGLR6/tORQpdYmgrfcjkjVrdzi
         EMweLC3DiS/7QePYmhbVlJZDpbRcwDYORlQGJdCIEO/3w2HKzMEuYf8mujs2oiiJrc+V
         VoYcWAOzTK2KmPx/VzdJPf8WzWnyYU0BFeTW8Ducxl2dmUJWgeFqKu5HndlYu3qABjh0
         WK0Ieca9UIwY1I1lNKphPz/M7eN8LK+xdt0/ahErpJ5wptIx/vSHq3SrqiHdobstfFT4
         v6N0iAxmMqPo5nkSE47JKiUOsd2QWEm4hYsXoRyvVvBdjSxfdUYQO+ma//kz5OTyaHlA
         +SGQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3qBCY5DJJn+G1EjM3ToeNHGh2nzdTB3Wh7zzgZIjv4AUWteUQXxpKS0R7I8nE/MvF358UNuQcOefgVuhx@vger.kernel.org
X-Gm-Message-State: AFuF++lpuIZpu9WKjfbu5Adk6RDU/mBaVkGzEf3IY0BUNApfq3LOhS6t
	ophJ+9hje7/JJQRuQMx/jHycX8XUw0ddUfHJoJr5zFYFpq1mq1kei0e/8zS/ywnAlGpIQe+V8QX
	WwNNWSzrrvhJNiuVzdGl7bvdb4yPRcAVGBacw8vhup2UXcogs4POz5NXSRbEI9dL36lSf
X-Gm-Gg: AYBFou2tsH2uV4FkQvwP+5/plQt+Eh/5Wm36SfLoC4s85/6SBxF4oua++P1Gs9dArhz
	q/pE8uEpNqMquQiSnQZRgaT4/mNqelqVYP392hNSa0idIlDGOXs48eMS2zOoENlx2C8rzEGaWoI
	bmneis6221Jjyx9i7DqSKA13wbwo8Oll2/E1vZfAB8jbTU+KZJZ4ehdIX+5ak+FJHP59q7J6Ln0
	Py2KZo0zlhNxzqbdx5z9aM6PDINF5De5jVL0Z6Vtcyeh9IcTC9Ktk6i7zawl2rrhVc3nqnQzNJo
	oKnsiSYHGZXQI01DUvEiDmHEreRxgoxeddZJi/vqvQouyNx1GnR9C0HQSdI=
X-Received: by 2002:a05:620a:2711:b0:93e:74b4:3115 with SMTP id af79cd13be357-93e9b795c5cmr69849685a.38.1791326436827;
        Tue, 06 Oct 2026 15:40:36 -0700 (PDT)
X-Received: by 2002:a05:620a:2711:b0:93e:74b4:3115 with SMTP id af79cd13be357-93e9b795c5cmr69845785a.38.1791326436382;
        Tue, 06 Oct 2026 15:40:36 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:35 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 09/45] media: qcom: camss: sm8250: add IFE scaler v10x
Date: Wed,  7 Oct 2026 01:39:17 +0300
Message-Id: <20261006223953.3382273-10-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X5THu2Te c=1 sm=1 tr=0 ts=6ac578e5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=xvU-HC0LZq_kf4miMzMA:9
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX32HtMuwNCJGb
 JAICeYJorWMUP6XwarHBIj+TXMoxDfLwjujyajCt1extZQsMJ6f7yc94Vs05bvITyAM0T/Y3wI4
 08HJVnadiY+wZGJ7fAl36vfyn7NJd2E=
X-Proofpoint-GUID: Wf5JefBIV-v7vM7OAp5qWErWUS15Na5I
X-Proofpoint-ORIG-GUID: Wf5JefBIV-v7vM7OAp5qWErWUS15Na5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXysxSXqteb+VW
 ZM0M3YaR/mwi0SDYW9UvKpFq9NtCTQkC6p/lJFc42hSPTZ3FNQVXMp5HnA130iihX5AW+2rucG7
 ht0fH3MKC/B/tkHLQniAIw9RRpcRzYqu57BARytaZSvIIOa8fH+DQsWmK7sbmmNXatmVpAiwhvN
 FoWbSS25NpLysQ2n37MreKYIk+cu4wv9Y+7ecFcWZArrw5gAXicG0MgL4mS/5HScCofWspqRxym
 oHTUxja6EY2TUrR3xkNDSNbV391k2uFwo/Be8GJ6EKQSS880SwU/XJhQl8A0funmJuPikgbPtsA
 mRtRGz6xWVj4V6ydIBWNu2RKF39aqASnVRPh4a9J0/nesjkaSqmstQv8N6fhzdBQfYV8573s374
 hnMyGGFQTbp+9Y+J9y3XyA93RHlYGflDbwCCv43Dm8nXD9YL5bTYKG4NzzC15tHBy7rwAvlQGU5
 l7ZU7r9RIKgAzlaINFg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the M/N downscaler used by the SM8250 IFE pixel path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../qcom/camss/camss-ife-scale-v10x.c         | 148 ++++++++++++++++++
 .../qcom/camss/camss-ife-scale-v10x.h         |  15 ++
 3 files changed, 164 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v10x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-scale-v10x.h

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 2da998444554..dc0f307894d8 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -16,6 +16,7 @@ qcom-camss-objs += \
 		camss-format.o \
 		camss-ife-bus-v20x.o \
 		camss-ife-camif-v10x.o \
+		camss-ife-scale-v10x.o \
 		camss-ispif.o \
 		camss-tpg.o \
 		camss-tpg-gen1.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.c b/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.c
new file mode 100644
index 000000000000..a8939114cb4d
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.c
@@ -0,0 +1,148 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+#include <linux/bitfield.h>
+#include <linux/math.h>
+
+#include "camss-ife.h"
+#include "camss-ife-scale-v10x.h"
+
+/* DS M/N scaler register offsets */
+#define CAMIF_V10X_DS_MN_MODULE_CFG		0x00000060
+#define CAMIF_V10X_DS_MN_CFG			0x00000064
+#define CAMIF_V10X_DS_MN_IMAGE_SIZE_CFG		0x00000068
+#define CAMIF_V10X_DS_MN_H_CFG			0x0000006c
+#define CAMIF_V10X_DS_MN_V_CFG			0x00000074
+#define CAMIF_V10X_DS_MN_CROP_LINE_CFG		0x0000007c
+#define CAMIF_V10X_DS_MN_CROP_PIXEL_CFG		0x00000080
+
+#define PP_V10X_Q21_FORMAT (21)
+
+#define PP_V10X_MODULE_DS_MN_CFG_CROP_EN		BIT(8)
+#define PP_V10X_MODULE_DS_MN_CFG_EN			BIT(0)
+#define PP_V10X_DS_MN_CFG_VERTICAL_SCALE_EN		BIT(10)
+#define PP_V10X_DS_MN_CFG_HORIZONTAL_SCALE_EN		BIT(9)
+#define PP_V10X_DS_MN_IMAGE_SIZE_CFG_INPUT_WIDTH	GENMASK(29, 16)
+#define PP_V10X_DS_MN_IMAGE_SIZE_CFG_INPUT_HEIGHT	GENMASK(13, 0)
+#define PP_V10X_DS_MN_CROP_LINE_CFG_FIRST_LINE		GENMASK(29, 16)
+#define PP_V10X_DS_MN_CROP_LINE_CFG_LAST_LINE		GENMASK(13, 0)
+#define PP_V10X_DS_MN_CROP_PIXEL_CFG_FIRST_PIXEL	GENMASK(29, 16)
+#define PP_V10X_DS_MN_CROP_PIXEL_CFG_LAST_PIXEL		GENMASK(13, 0)
+
+#define PP_V10X_DS_MN_H_CFG_INTERP_RESO	GENMASK(31, 30)
+#define PP_V10X_DS_MN_V_CFG_INTERP_RESO	GENMASK(31, 30)
+
+#define INTERP_RES_Q2_0	(0)	/* 1/128 <= M/N <= 1/16	*/
+#define INTERP_RES_Q2_1	(1)	/* 1/16  <= M/N <= 1/8	*/
+#define INTERP_RES_Q2_2	(2)	/* 1/8   <= M/N <= 1/4	*/
+#define INTERP_RES_Q2_3	(3)	/* 1/4   <= M/N <= 1	*/
+
+static u32 camif_v10x_calc_ds_q2(u32 src_size, u32 dst_size)
+{
+	if ((u64)src_size >= 16 * (u64)dst_size)
+		return INTERP_RES_Q2_0;
+	else if ((u64)src_size >= 8 * (u64)dst_size)
+		return INTERP_RES_Q2_1;
+	else if ((u64)src_size >= 4 * (u64)dst_size)
+		return INTERP_RES_Q2_2;
+
+	return INTERP_RES_Q2_3;
+}
+
+static u32 camif_v10x_calc_ds_q21(u32 src_size, u32 dst_size)
+{
+	u64 rq21;
+
+	rq21 = (u64)src_size << PP_V10X_Q21_FORMAT;
+	do_div(rq21, dst_size);
+
+	return rq21;
+}
+
+static void camif_v10x_crop_config(void __iomem *mod_base, const struct camss_ife_pipeline_cfg *cfg)
+{
+	u32 rval;
+
+	rval = FIELD_PREP(PP_V10X_DS_MN_CROP_PIXEL_CFG_FIRST_PIXEL, cfg->ds_mn_crop->left) |
+	       FIELD_PREP(PP_V10X_DS_MN_CROP_PIXEL_CFG_LAST_PIXEL, cfg->ds_mn_crop->width - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_CROP_PIXEL_CFG);
+
+	rval = FIELD_PREP(PP_V10X_DS_MN_CROP_LINE_CFG_FIRST_LINE, cfg->ds_mn_crop->top) |
+	       FIELD_PREP(PP_V10X_DS_MN_CROP_LINE_CFG_LAST_LINE, cfg->ds_mn_crop->height - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_CROP_LINE_CFG);
+}
+
+void camif_v10x_scale_config(void __iomem *mod_base, const struct camss_ife_pipeline_cfg *cfg,
+			     const struct camss_ife_wm_config *wm_cfg)
+{
+	u32 rval, h_q21, v_q21, h_q2, v_q2, width, height;
+
+	if (cfg->ds_mn_crop) {
+		camif_v10x_crop_config(mod_base, cfg);
+		width	= cfg->ds_mn_crop->width;
+		height	= cfg->ds_mn_crop->height;
+
+		rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+		rval |= PP_V10X_MODULE_DS_MN_CFG_CROP_EN;
+		writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+
+	} else {
+		width	= cfg->in_width;
+		height	= cfg->in_height;
+
+		rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+		rval &= ~PP_V10X_MODULE_DS_MN_CFG_CROP_EN;
+		writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+	}
+
+	rval = FIELD_PREP(PP_V10X_DS_MN_IMAGE_SIZE_CFG_INPUT_WIDTH, width - 1) |
+	       FIELD_PREP(PP_V10X_DS_MN_IMAGE_SIZE_CFG_INPUT_HEIGHT, height - 1);
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_IMAGE_SIZE_CFG);
+
+	h_q2 = camif_v10x_calc_ds_q2(width, wm_cfg->width);
+	h_q21 = camif_v10x_calc_ds_q21(width, wm_cfg->width);
+	rval = FIELD_PREP(PP_V10X_DS_MN_H_CFG_INTERP_RESO, h_q2) | h_q21;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_H_CFG);
+
+	rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_CFG);
+	if (wm_cfg->width < width)
+		rval |= PP_V10X_DS_MN_CFG_HORIZONTAL_SCALE_EN;
+	else
+		rval &= ~PP_V10X_DS_MN_CFG_HORIZONTAL_SCALE_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_CFG);
+
+	v_q2 = camif_v10x_calc_ds_q2(height, wm_cfg->height);
+	v_q21 = camif_v10x_calc_ds_q21(height, wm_cfg->height);
+	rval = FIELD_PREP(PP_V10X_DS_MN_V_CFG_INTERP_RESO, v_q2) | v_q21;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_V_CFG);
+
+	rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_CFG);
+	if (wm_cfg->height < height)
+		rval |= PP_V10X_DS_MN_CFG_VERTICAL_SCALE_EN;
+	else
+		rval &= ~PP_V10X_DS_MN_CFG_VERTICAL_SCALE_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_CFG);
+}
+
+int camif_v10x_scale_enable(void __iomem *mod_base)
+{
+	u32 rval;
+
+	rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+	rval |= PP_V10X_MODULE_DS_MN_CFG_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+
+	return 0;
+}
+
+int camif_v10x_scale_disable(void __iomem *mod_base)
+{
+	u32 rval;
+
+	rval = readl_relaxed(mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+	rval &= ~PP_V10X_MODULE_DS_MN_CFG_EN;
+	writel_relaxed(rval, mod_base + CAMIF_V10X_DS_MN_MODULE_CFG);
+
+	return 0;
+}
diff --git a/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.h b/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.h
new file mode 100644
index 000000000000..cb548e69f321
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-scale-v10x.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _CAMSS_PP_V10X_SCALE_H_
+#define _CAMSS_PP_V10X_SCALE_H_
+
+void camif_v10x_scale_config(void __iomem *mod_base, const struct camss_ife_pipeline_cfg *cfg,
+			     const struct camss_ife_wm_config *wm_cfg);
+
+int camif_v10x_scale_enable(void __iomem *top);
+
+int camif_v10x_scale_disable(void __iomem *top);
+
+#endif /* _CAMSS_PP_V10X_SCALE_H_ */
-- 
2.34.1

