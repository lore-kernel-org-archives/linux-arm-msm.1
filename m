Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCA23CF97A
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326559; cv=none; b=nlViYkUXGhlScZWHnLDjw1wRRbEB/rg7TjgZR4c5vCAsG5qdSz0yzdci5InNhDs2fEgLA7nSPHk47qhdJcIRH926NgbxZAX0FIkNs0Ahu1cEaNeRnzZOt7PqT4gbTAq4lo6JVAgMPtZs94wTIeYqesFxggClHxOXKlcJTU5dgXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326559; c=relaxed/simple;
	bh=HVwHToaJyXzsP1X54gd5nmFtr8QmcA1/+NTce1Z1jYU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=newAb/5VwfLdSLDKBTgAIY00+wjTR86h6FYgHWoN+nXYMMpPuY/+OSc/CVrDzTMiFDy2MCH6jW2xa1SRDVtXDJ7FcWADikmf6m0NJ+/lScNpDmHaZKeTwufBCaxaAt0jLdiFneIubLRoJbGk3oFG21Hv+dO8rKAThqKNFUn4Gvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W3MoDy/q reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W3MoDy/q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeV673015319
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zI/OM1DaK08
	7Fl1+eaugez81Hxvhln74qIkYx1WEGkM=; b=W3MoDy/q3AdalO40xjHrJ6gkVSV
	A4xui29D4BNzj4LQW7hjfd8jVHEggQsABIhoRfJioVAo4weLwx+a3IHZZk2K/CjK
	qu3L4AYHOJgLPfb1tdvXzXO8LisSD0jvD166TUK8ZwNS3l8/UqWxmVb1KmpO9KDj
	7kc1wDGSFi6IB47oIjsAMoHoTbawAJUFNTjPmxuPlxygl+w4fWtPdTAUBoEBXRM2
	0Gh8Rfu4a0PyKu+ByEM97Ei+uKpwnn4y/x49VRc6KQK+wf8yKU+Ex2DDCCAvvw6Z
	87U/wrFGHFP3iPeZrRzuT1jFO0CcHhUDrCpgIx0hWJksy/ux9we3K1wzJuQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4kk5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-936aa34873bso658433985a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326499; x=1791931299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zI/OM1DaK087Fl1+eaugez81Hxvhln74qIkYx1WEGkM=;
        b=HCo5co3c6dikfuhf9bSDUkUCEOqVKw7YXBKjU2FHVijsc479/2QbSs9bjWZFzVl48J
         7ADgYAtBfpoAwP7DFd0mQwBAZwOmGd1TayBUb/iC92+YWK/Gip3mAMbTYT1gXukl4K6D
         1KLpwpempJRhrigypDhWmWq/bp3RBABs1SYOX23WB2DIBF4E7j7RItcAcyrgGIqMmL9b
         q2wGPmz3yZNHx39OtgTw0rGPhl4CzjVyWCQaU1FTAIq6zqOf7Xt1Di4LHTmyUZ6GAClk
         oEfMeoRaKA/aoC3cHQJR/yTI+dKKJxGVN/jMQ2gJ1GAtYYn7KKXC244aw6kn1RhNG42m
         Vd7A==
X-Forwarded-Encrypted: i=1; AKwUvBzpYAJvwYEsj24lIl0RWwnYbtPRRtiuQ/haVivjhXbOlO7vGFbkl7rzFIG71nrfnMmGUqred/xoKlQbiM2U@vger.kernel.org
X-Gm-Message-State: AFuF++kSW2R/lvfglrZ2j4jzOy1I4iV4rXWszXc4vkUO3Fh3gWwxs2SU
	3eC0MeKqLh734LRDSb8GdMLau3qsAGGW+ayFKU9NzQqClLkCL5KYKnWltIgJxMgF3cW2ks7YFBG
	nkavxOGh9/kjaB2e0Fur40dcepQ+s5pbJnmc4ekprSwYzofy0A87Ir0qVa6IF5yFB0IOx
X-Gm-Gg: AYBFou0XAVdSc0ugudddA4826/PqEAGJNcOe+g9XA2ZuHkJlSb9Xujw1tMFJUpbQHxN
	HIieWHufCkBZJQgF5YGapljegndvqCnTqfjoYZ5UG1xdvXt+DMokXKRDfm4MYnW0eB2RHyNBV2m
	A4juHG6X4H3ob/QSu8/FM3n/QMYTGPLwP2iHOMxSsXFUpbLmw874xW1WLOcMwM1WfbsCN168RAY
	imvABWyBy0flJNgoeqqBhIRLkG+thGGwCMED/kOLvgt1bAjW8BEcOggyTkvZMManmmiAlH1HOTf
	xTvAU6ln8rLtXT29UfY7H2nchk/WCSY3gMSOHr4ZuahbfFhojw8taOJtTyY=
X-Received: by 2002:a05:620a:448f:b0:93c:66da:ee12 with SMTP id af79cd13be357-93e9b74d219mr76115585a.19.1791326498758;
        Tue, 06 Oct 2026 15:41:38 -0700 (PDT)
X-Received: by 2002:a05:620a:448f:b0:93c:66da:ee12 with SMTP id af79cd13be357-93e9b74d219mr76110185a.19.1791326498229;
        Tue, 06 Oct 2026 15:41:38 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:37 -0700 (PDT)
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
Subject: [PATCH 36/45] media: qcom: camss: sa8775p: add CCM parameters
Date: Wed,  7 Oct 2026 01:39:44 +0300
Message-Id: <20261006223953.3382273-37-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX7UJGbAAK1oTe
 OjPJoITYOtvY150ou8zzaCXfhnHRY9xeSrLTwk5VfLwAzw6KjfrMfcYKtIe2x1aNMXWCNw+lbm0
 dSkWGXb3/knHBUHXM2jnOx/3GNI3wppWI+hWZOnEy6B592hCL0bc64wlIsZssIX9bIAchXnJxww
 LQuawwCZyfdqEvJ4QxAsY0s2N7pd5cllmYbx+OrZO45/5K+SujR5ebNZuwDeDNdLg9hq8jjNfb3
 XAWaF3UZHdszP/KYVgg2n0AZdsQXF7eX/R0aeExeT4epH+3QocZGwQF8i6ioWjwG06Nh/u81UL+
 nIXh589vExOuQBPfm8WKzO3K8Ou59LWvXtEMsvqhrluR7uOQPWmO5wUUaZgxvy8ATwFO3Sah9Io
 WlxtRoVevMY5JOzp2VnVosaB4+kEeiHwHwQBEXIhoWecSjGJuujaiPIpE7adk66dRWrKtWgPzgZ
 KRIAR845BWpLo6yYWLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX7Wbfw6jNzH4D
 zMd3tPQt9DQUYjT/KRcXLlr90+r6YGroMpiUK9R/rpVMbmfvkDX/Wpn2xSkGyWTUAH3POUxz4pO
 OwDjILQcq5X2oPrVPoEBj0G/fgmoKR0=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac57923 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=MPkjE9NDq9863M1uKlEA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ZfKN_yi_oS1O4ZYs8e4VxrjerA0RhBFi
X-Proofpoint-GUID: ZfKN_yi_oS1O4ZYs8e4VxrjerA0RhBFi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the color correction matrix, offsets, and Q8 shift from IFE
parameter buffers. Enable or disable the block as requested.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 139 ++++++++++++++++++
 1 file changed, 139 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 9f4c8ae9667e..0db88534b421 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -7,8 +7,14 @@
 
 #include <linux/bitfield.h>
 #include <linux/io.h>
+#include <linux/slab.h>
 
+#include <linux/qcom-camss-config.h>
+#include <media/v4l2-isp.h>
+
+#include "camss.h"
 #include "camss-ife.h"
+#include "camss-ife-params.h"
 
 /* Module base offsets */
 #define IFE_MOD_V41X_WB_GAIN_OFFSET		0x4000
@@ -108,6 +114,26 @@
 #define IFE_MOD_V41X_AWB_BG_THRESHOLD		0x3ffff
 #define IFE_MOD_V41X_AWB_BG_NUM_THRESHOLDS	5
 
+/* CCM offset, registers and bitfields */
+#define IFE_MOD_V41X_CCM_OFFSET			0x5800
+#define IFE_MOD_V41X_CCM_MODULE_CFG		0x60
+#define IFE_MOD_V41X_CCM_COEFF_A_CFG_0		0x68
+#define IFE_MOD_V41X_CCM_COEFF_A_CFG_1		0x6c
+#define IFE_MOD_V41X_CCM_COEFF_B_CFG_0		0x70
+#define IFE_MOD_V41X_CCM_COEFF_B_CFG_1		0x74
+#define IFE_MOD_V41X_CCM_COEFF_C_CFG_0		0x78
+#define IFE_MOD_V41X_CCM_COEFF_C_CFG_1		0x7c
+#define IFE_MOD_V41X_CCM_OFFSET_K_CFG_0		0x80
+#define IFE_MOD_V41X_CCM_OFFSET_K_CFG_1		0x84
+#define IFE_MOD_V41X_CCM_OFFSET_K_CFG_2		0x88
+#define IFE_MOD_V41X_CCM_SHIFT_M_CFG		0x8c
+#define IFE_MOD_V41X_CCM_CFG_EN			BIT(0)
+#define IFE_MOD_V41X_CCM_MATRIX_0		GENMASK(11, 0)
+#define IFE_MOD_V41X_CCM_MATRIX_1		GENMASK(27, 16)
+#define IFE_MOD_V41X_CCM_OFFSET_VALUE		GENMASK(31, 17)
+#define IFE_MOD_V41X_CCM_SHIFT_M_PARAM		GENMASK(1, 0)
+#define IFE_MOD_V41X_CCM_SHIFT_M_Q8		0x1
+
 static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
@@ -133,6 +159,81 @@ static void mod_v41x_demosaic_config(struct ife_pp_ctx *ctx)
 		       base + IFE_MOD_V41X_DEMOSAIC_INTERP_CLASSIFIER_CFG_1);
 }
 
+static void mod_v41x_ccm_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_CCM_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_CCM_MODULE_CFG);
+	value |= IFE_MOD_V41X_CCM_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_CCM_MODULE_CFG);
+}
+
+static void mod_v41x_ccm_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_CCM_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_CCM_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_CCM_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_CCM_MODULE_CFG);
+}
+
+static void mod_v41x_ccm_config(struct ife_pp_ctx *ctx,
+				const struct camss_ife_params_color_correct *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_CCM_OFFSET;
+	u32 value;
+
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_SHIFT_M_PARAM,
+				  IFE_MOD_V41X_CCM_SHIFT_M_Q8),
+		       base + IFE_MOD_V41X_CCM_SHIFT_M_CFG);
+
+	/*
+	 * HW banks A/B/C each multiply one fixed input channel (A=G_in,
+	 * B=B_in, C=R_in), and HW output indices 0/1/2 are also G/B/R, not
+	 * R/G/B, same as IFE_MOD_V10X_CCM. The UAPI's coeff[out][in]/
+	 * offset[out] are R,G,B-indexed on both axes (0=R,1=G,2=B); remap
+	 * accordingly: bank X's slot N takes UAPI row (N+1)%3 (G,B,R output
+	 * order) and the column matching that bank's input channel.
+	 */
+	value = FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[1][1]) |
+		FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_1, cfg->coeff[2][1]);
+	writel_relaxed(value, base + IFE_MOD_V41X_CCM_COEFF_A_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[0][1]),
+		       base + IFE_MOD_V41X_CCM_COEFF_A_CFG_1);
+
+	value = FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[1][2]) |
+		FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_1, cfg->coeff[2][2]);
+	writel_relaxed(value, base + IFE_MOD_V41X_CCM_COEFF_B_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[0][2]),
+		       base + IFE_MOD_V41X_CCM_COEFF_B_CFG_1);
+
+	value = FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[1][0]) |
+		FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_1, cfg->coeff[2][0]);
+	writel_relaxed(value, base + IFE_MOD_V41X_CCM_COEFF_C_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_MATRIX_0, cfg->coeff[0][0]),
+		       base + IFE_MOD_V41X_CCM_COEFF_C_CFG_1);
+
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_OFFSET_VALUE, cfg->offset[1]),
+		       base + IFE_MOD_V41X_CCM_OFFSET_K_CFG_0);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_OFFSET_VALUE, cfg->offset[2]),
+		       base + IFE_MOD_V41X_CCM_OFFSET_K_CFG_1);
+	writel_relaxed(FIELD_PREP(IFE_MOD_V41X_CCM_OFFSET_VALUE, cfg->offset[0]),
+		       base + IFE_MOD_V41X_CCM_OFFSET_K_CFG_2);
+}
+
+static void mod_v41x_ccm_apply(struct ife_pp_ctx *ctx,
+			       const struct camss_ife_params_color_correct *cfg, bool enable)
+{
+	if (enable) {
+		mod_v41x_ccm_config(ctx, cfg);
+		mod_v41x_ccm_enable(ctx);
+	} else {
+		mod_v41x_ccm_disable(ctx);
+	}
+}
+
 static void mod_v41x_awb_bg_config(struct ife_pp_ctx *ctx,
 				   const struct camss_pp_cfg *cfg)
 {
@@ -226,12 +327,17 @@ static void mod_v41x_xform_write_channel(void __iomem *base, u32 coeff0,
 static void mod_v41x_modules_acquire(struct ife_device *ife, struct ife_pp_ctx *ctx,
 				     void __iomem *base)
 {
+	ctx->dev = ife->camss->dev;
 	ctx->base = base;
+	ctx->params_scratch = devm_kzalloc(ctx->dev,
+					   v4l2_isp_buffer_size(CAMSS_IFE_PARAMS_MAX_PAYLOAD),
+					   GFP_KERNEL);
 }
 
 static void mod_v41x_modules_release(struct ife_pp_ctx *ctx)
 {
 	ctx->base = NULL;
+	ctx->params_scratch = NULL;
 }
 
 static void mod_v41x_modules_config(struct ife_pp_ctx *ctx,
@@ -319,10 +425,43 @@ static void mod_v41x_modules_disable(struct ife_pp_ctx *ctx)
 	writel_relaxed(value, base + IFE_MOD_V41X_XFORM_MODULE_CFG);
 }
 
+static void mod_v41x_params_apply_ccm(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v41x_ccm_apply(ctx, &block->color_correct, enable);
+}
+
+static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
+	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
+		.size = sizeof(struct camss_ife_params_color_correct),
+	},
+};
+
+static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
+	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
+};
+
+static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
+	      ARRAY_SIZE(mod_v41x_params_type_info));
+
+static int mod_v41x_modules_apply_params(struct ife_pp_ctx *ctx,
+					 struct vb2_buffer *vb)
+{
+	return camss_ife_params_apply(ctx->dev, vb, ctx->params_scratch,
+				      CAMSS_IFE_PARAMS_MAX_PAYLOAD,
+				      mod_v41x_params_type_info,
+				      mod_v41x_params_handlers,
+				      ARRAY_SIZE(mod_v41x_params_handlers),
+				      ctx);
+}
+
 const struct camss_mod_ops ife_mod_v41x_ops = {
 	.acquire	= mod_v41x_modules_acquire,
 	.release	= mod_v41x_modules_release,
 	.config		= mod_v41x_modules_config,
 	.enable		= mod_v41x_modules_enable,
 	.disable	= mod_v41x_modules_disable,
+	.apply_params	= mod_v41x_modules_apply_params,
 };
-- 
2.34.1

