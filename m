Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29E0468C04
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363689; cv=none; b=jH8gBGwZIyTXXWSLlujDk6c+qK2Dc8BsscXJoHyPm8Z0XCHDV9EV+TGjek6wr689kMSBqphoUIpSw9QYQkPZJHoDrFevMLvsT4uprmENBl+N3Bbo+n3w53GBfwUF+41Hxq2jvtCtIsuxPqcKZfU3Va0OLl8StMRWJ0vl5XrIXDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363689; c=relaxed/simple;
	bh=WGgtkWXk/4OTyIrCdnNYpcbvJuJSEwslMqxmHE6lnuM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MoVZ8tvaaMp2F3lhgHpltAdtMQb07kisI30+bAPcTugkwaw3rcxTwTdUR+nZmANVPx2KdeK8sxG9xQi1W0r/ma7kl0OHu3J9pYp0MRCiip9Yi4ukPE8b6Cc7ASurHShZaqEf7NKsaeW0sE3x99QqVuC2QhoWSSn7X666OcX6rtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LgMReqNd reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LgMReqNd"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jjNX151972
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zQtfPnn1PTG
	pnbnSjBfizU0bftFTFsUaBnQIlBDG8yE=; b=LgMReqNdEcLsslVab2h78FsNmjb
	BcinyXxzrGI3qpy/EIsNulJUTc8ArBb/2LNdPkKSoGDfO/3CwTC08cd/5LbiOMcx
	S8N0GmFR8tJsJPIyz4zNSYlE1l5YdpLFrOxy9bupvhpmSOI7PEa8KGBzG4ZIAOgu
	2jdhhQbdaAMNGb0z5YGobuGFI9lpF7iXE3IA4MRUPlpVgsq0m/y7e8X3cLmtbJT3
	Ni9jEGtTIRjPFeHhqzgZbOQHC6kY1GBKjRUYVxYY1OG13yvAKh1pnIlh/315Lu82
	DUV77tl/G7h6Ip2Nl+R6Cnw/YZk+BS8F519nChSyqZVKe1vleaAH5xWNAeg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719bs5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:01:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so645811985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363670; x=1791968470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zQtfPnn1PTGpnbnSjBfizU0bftFTFsUaBnQIlBDG8yE=;
        b=dlgEi8QLVrJ+TVOVAPI/wfSoT8c0ad7l1DQYPa0acm5LS1+OxBaPQ6nOFNQ8JKOU/W
         FT+X43NRXOKbGpg68pT6VUaYtih/j24oCNXpyJZz3Iki/YkviWjJIC0/pEbGt7LC1m8t
         RIbSm0T3jnp5lqwqVltrSe4fgh0p0KPMNbB5XPqWBdKoxuyPJvZ4DK1ZlHjNXvd83XCe
         Ly/dvRnb9DsHqvVuha1PPL4VUTV4ro5TlRYHqrHTtp+WzVT2scbLOToPkZxw+HJN23wx
         rbj9B5qILlRtHyHGexEVx1pNpkfTrGyEIqkjobw1qnxzWje2mROlsrhf9OIsqmHV0ZLO
         TsFw==
X-Forwarded-Encrypted: i=1; AKwUvBzFgC2+tIViWF0Ml6+tG0R4uCeH+jTD3HVoxbN/p/PycsusN8KzJneqnvbVta8xuTC8r9zdhvOjUrrCqBLN@vger.kernel.org
X-Gm-Message-State: AFuF++kG2JHC0ufUGDBEYiEQ4qJHd2QjDiQr0hJjYahXcgrBwmb6lQc6
	prgE2n2V3qriB2VIUEqu1lPcGkvpRjDj+29nnhsKeWOuJ2EsM3hQBLWJeRa7//ak4/fMMce1SuG
	9lnupAeJY6UW3w2gJiW8KgFWTSSsNXnDirsl1eFW7FQbWxva4GYNgO0bGpY+0iXPnCW2Q
X-Gm-Gg: AYBFou2r+b7MA2jep6R8LEShIe88o+wbyuH7iUVxPNXTLHv9VT6CrB864KOdkYUDzAf
	iHyJET3Pa6Lks4KmZNScmJreKmwMKwmOtGStAL5sF1XpBXyHJTuKCulzGGvbAdnSgEMIWTsrnTj
	88iOarbZsKRJqQShZPv+5zAKcWhMLEm9dqno6uYgAY2ckyP39nLtvVMKWQDyW/tBC4VE4pwn1BR
	EL48R8smsMAJRlbgRZXl9cYr2M7Ff6UThzQvlzvb1m0AkMsLUyabz+L9cxTdMdPv660za0vJj9N
	0ynzKcLvMB7klFCBiDsWSi0QSJEDFf/FiFtaJ2HmQfvELVqYHkGjEDb/d2I=
X-Received: by 2002:a05:620a:1725:b0:93e:9809:dbf3 with SMTP id af79cd13be357-93e9b8a1b85mr289588485a.70.1791363669859;
        Wed, 07 Oct 2026 02:01:09 -0700 (PDT)
X-Received: by 2002:a05:620a:1725:b0:93e:9809:dbf3 with SMTP id af79cd13be357-93e9b8a1b85mr289580885a.70.1791363669122;
        Wed, 07 Oct 2026 02:01:09 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:08 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 06/45] media: qcom: camss: sm8250: add IFE CamIF v10x
Date: Wed,  7 Oct 2026 12:00:02 +0300
Message-Id: <20261007090041.3732717-7-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX25+ORTlX+AkZ
 WiUx5/fcmHUGTC3iBd7SaLx8TmUzpQg8PqPF7da7RG33ItXbjk4HaimoCb26TuQo4AbL3lipDpz
 GxSfQ7OFvgTqC2EEQzReLC9DDfrJruw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX5XAn4p2bFIGW
 t0LsBG9jty3GsXzzo5zBSSFz1MfA50OC0og4irFJ4YAw5xnzqobcYedeQ4u/KlIKZU0LwHWNTRk
 SYxmOhMpByTrEZPiOgg87D6j77fL79mP20uAYawbJSZQUn2S1V0WR76jzAoqUU2cMNFyX0FHZto
 ckQP0ISbDIBX9JlBVspNIlEjgHVG39RVMBHWrTIbrT7GqJN2NUuWZna9rbNCEETCYJ+fReDBtBa
 gGSp9MRkdt20zxO4pOVpb6cxUM38KRkFz6ibBISPr4FyzDH7HcLyK5cDtd971EIPI72BkYexdO7
 h+SQK0bIDqGDL8i7xuMoG7cuejZM6ljCaKRJtnCndRWK0sNRG9uljmPm730ySKM+U0VvI6RWRs2
 bXZkgey1KEeZS4DqEd5sAkP2ZrD1AT2/YqZiIiP/QCvAt2gSaSQE393sdKyx0EsbQyoFv8TYQ1m
 5w7zdwegQg5vnzFMngw==
X-Proofpoint-GUID: uInKyQfihRYMC3c2lB5E32_1mulfFCJT
X-Proofpoint-ORIG-GUID: uInKyQfihRYMC3c2lB5E32_1mulfFCJT
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac60a57 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=WmRFchFSvUI5OYwuZKUA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE camera input interface used by the SM8250 pixel path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |  1 +
 .../qcom/camss/camss-ife-camif-v10x.c         | 59 +++++++++++++++++++
 .../qcom/camss/camss-ife-camif-v10x.h         | 42 +++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index e30fe07b16f4..2da998444554 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -15,6 +15,7 @@ qcom-camss-objs += \
 		camss-csiphy-3ph-1-0.o \
 		camss-format.o \
 		camss-ife-bus-v20x.o \
+		camss-ife-camif-v10x.o \
 		camss-ispif.o \
 		camss-tpg.o \
 		camss-tpg-gen1.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c
new file mode 100644
index 000000000000..c89caf38fb8c
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.c
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include "camss.h"
+#include "camss-ife.h"
+#include "camss-ife-camif-v10x.h"
+
+static int camif_v10x_config(void __iomem *camif_base, enum camss_ife_hw_pipe hw_pipe,
+			     const struct camss_ife_pipeline_cfg *sink_cfg)
+{
+	u32 period = 0, pattern = 1, epoch;
+
+	epoch = FIELD_PREP(CAMIF_V10X_CFG_EPOCH0_LINE, sink_cfg->in_height / 3) |
+		FIELD_PREP(CAMIF_V10X_CFG_EPOCH1_LINE, sink_cfg->in_height / 2);
+
+	if (hw_pipe == CAMSS_IFE_HW_PIPE_PP) {
+		writel_relaxed(period, camif_base + CAMIF_V10X_PP_PERIOD_CFG);
+		writel_relaxed(pattern, camif_base + CAMIF_V10X_PP_PATTERN_CFG);
+		writel_relaxed(epoch, camif_base + CAMIF_V10X_PP_EPOCH_IRQ_CFG);
+	} else {
+		writel_relaxed(epoch, camif_base + CAMIF_V10X_RDI_EPOCH_IRQ_CFG);
+		writel_relaxed(period, camif_base + CAMIF_V10X_RDI_PERIOD_CFG);
+		writel_relaxed(pattern, camif_base + CAMIF_V10X_RDI_PATTERN_CFG);
+	}
+
+	return 0;
+}
+
+static void camif_v10x_enable(void __iomem *camif_base, enum camss_ife_hw_pipe hw_pipe)
+{
+	u32 rval = readl_relaxed(camif_base + CAMIF_V10X_MODULE_CFG);
+
+	if (hw_pipe == CAMSS_IFE_HW_PIPE_PP)
+		rval |= CAMIF_V10X_PP_CFG_EN | CAMIF_V10X_PP_CFG_OUTPUT_EN;
+	else
+		rval |= CAMIF_V10X_RDI_CFG_EN;
+
+	writel_relaxed(rval, camif_base + CAMIF_V10X_MODULE_CFG);
+}
+
+static void camif_v10x_disable(void __iomem *camif_base, enum camss_ife_hw_pipe hw_pipe)
+{
+	u32 rval = readl_relaxed(camif_base + CAMIF_V10X_MODULE_CFG);
+
+	if (hw_pipe == CAMSS_IFE_HW_PIPE_PP)
+		rval &= ~(CAMIF_V10X_PP_CFG_EN | CAMIF_V10X_PP_CFG_OUTPUT_EN);
+	else
+		rval &= ~CAMIF_V10X_RDI_CFG_EN;
+
+	writel_relaxed(rval, camif_base + CAMIF_V10X_MODULE_CFG);
+}
+
+const struct ife_hw_camif_ops ife_camif_v10x_ops = {
+	.config  = camif_v10x_config,
+	.enable  = camif_v10x_enable,
+	.disable = camif_v10x_disable,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h
new file mode 100644
index 000000000000..87faa5776c31
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-camif-v10x.h
@@ -0,0 +1,42 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#ifndef _CAMSS_IFE_CAMIF_V10X_H_
+#define _CAMSS_IFE_CAMIF_V10X_H_
+
+#include <linux/bits.h>
+
+#include "camss-ife.h"
+
+/* Per-RDI register offset */
+#define IFE_CAMIF_V10X_RDIX_OFFS(n) ((n) * 0x200)
+
+/* PP config bits */
+#define CAMIF_V10X_PP_CFG_EN		BIT(0)
+#define CAMIF_V10X_PP_CFG_OUTPUT_EN	BIT(8)
+
+/* RDI config bit */
+#define CAMIF_V10X_RDI_CFG_EN		BIT(0)
+
+/* EPOCH line fields */
+#define CAMIF_V10X_CFG_EPOCH0_LINE		GENMASK(13, 0)
+#define CAMIF_V10X_CFG_EPOCH1_LINE		GENMASK(29, 16)
+
+/* Module config register offset */
+#define CAMIF_V10X_MODULE_CFG		0x00000060
+
+/* RDI register offsets */
+#define CAMIF_V10X_RDI_PERIOD_CFG	0x00000068
+#define CAMIF_V10X_RDI_PATTERN_CFG	0x0000006c
+#define CAMIF_V10X_RDI_EPOCH_IRQ_CFG	0x00000070
+
+/* PP (pixel path) register offsets */
+#define CAMIF_V10X_PP_PERIOD_CFG	0x00000078
+#define CAMIF_V10X_PP_PATTERN_CFG	0x0000007c
+#define CAMIF_V10X_PP_EPOCH_IRQ_CFG	0x00000080
+
+extern const struct ife_hw_camif_ops ife_camif_v10x_ops;
+
+#endif /* _CAMSS_IFE_CAMIF_V10X_H_ */
-- 
2.34.1

