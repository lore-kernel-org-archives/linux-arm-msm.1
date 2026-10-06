Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84313BB112
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 22:41:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326600; cv=none; b=gXuKIr1YD0zbYpmjTbtzWpqYsAsuzBoluA/w869ddBtmukuxwe5l/YSr9QASekuXnx71QhUpGMBD5I2rEJBL6AvNqpRd+6Bdgeg/sS+vafvYEBtYZkbm5KSxB9z6pmcYMuclBv/qFtRuXSIWdr3RsHpnf0dRyjAJDNbQRGUbMug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326600; c=relaxed/simple;
	bh=H8xW3WaT5QzL7YlCh599OMCWmKVT/zJTArtkEPK7F6I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fq4u9bmb8MpXMw/2E/8moGejjp7ngSDuFzuBFrynQ1t7dqKKO1r2KM7/TpIb8V1Dw+OSP8E87g4ro+/uX8ZfQDlLWKvAtXcmzbOfddH0OgD8WO7/++X1cOr/vFfbcmCFrn+PLK4fWl/KmbKCIy1bEF4X2mLDbLHY8oQYvFOG2JA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Cx2Ceru9 reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cx2Ceru9"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LeV693015319
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 22:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qyjU6pygVpJ
	nJM/+E+bubKaUn444o1Lpl8EIN3PRpWw=; b=Cx2Ceru9JX84D82EkYNx5nu+f+S
	iVxXUSMD2OdF87dgj9DmTYKRvIK4NxfbyX6Kmc2XsgC6zlBmqfLw0PByu+Zoyk84
	3Q6zNBv88gkqwWAIprn+FlYBVwqDH2ccEOUXbWdrAdFzQtBevqrDKnlNlQzZFf/O
	LYnS868iXPm3atbXfTrzfkXYRKhfApIv0/plKS93GFCs8WGJjet2FWjqkPl78uNX
	4rFujavQ+7tTFx9vlAedNwLl7k3nmfm9ePu0W8uF1CirbZBLL8pD4W+/i5OLbSS+
	51jr33tW7EyHQTrOoYPHvYXRLPZkzugF314IGa7L1HSjCYUJ7IUaG2cJN3Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4uy4kk5q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 22:41:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so641742285a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 15:41:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326503; x=1791931303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qyjU6pygVpJnJM/+E+bubKaUn444o1Lpl8EIN3PRpWw=;
        b=aLWItQnFOBkEt9ekqtTtQsEGH+sb1Rf2avZ58sRz9tFRFLvmQlDeJPk48f6KCEnN22
         m8UCO060iKN7MAhCn99qxTYk6fOIL9OjjIC4iBYlMOatxeOcv5OY/kwl3YywV2s/kn1r
         ggY/n2fPv+CGyq0msREZZJzrIXGwIp0Mp6/IxICevydNDcp9z9mYr5/DBZWLDueYhXBF
         5KfA6pYkRYcyA9iQ951q/dJa1ZVyb3d3IG8NQzFPV2FdexZD0UG6X3HLnOL1/JL37HFC
         IuuY/SXS4xbjvUdsRAN6twCKoLIRRpu9ii5C/2qZjZUw48H1AmIlgZgmv4Tj1HQ9DJRy
         gpbA==
X-Forwarded-Encrypted: i=1; AKwUvBzOsryVJ4nFFaAo1Q4cWVrGt2Jq73/S7YdFe5VwJuZ37Qmic4sLra/g2BwxbQW3nqly5eObnOEjQ9pKUJke@vger.kernel.org
X-Gm-Message-State: AFuF++l8VJBqQsQSTN2Y2PrpNgE+IPOPIlFL6gP7V4W58+I4NJoQIH/6
	kcrFvJ4zM12aLH8xV9Y7d55/lwZlY+1Hd4RAd5AkcCvhyxfEF+NAo3JztHIVQ2EsZRnNT9nhV+h
	1wV5mxUBnCJ0Kr+jFFYmlyDFlAo+dQ3Cb55zfLUKkfjH0ucLNdDXubpJ7ph6txLFtppqr
X-Gm-Gg: AYBFou3i7G0Fawl+TbZUWrYpiGt9azn4X2JtSMhPcVhnEOjsG8/4Tg2NvLfhefaKHGe
	/eBLwkDZzjdcKFVsN6fErLuq9efdWzZGF4iJsv6XEmrneFi2FdYansvVs109JWZ6na6n1IMXvcI
	YJ07V7EfvSqH1s4TEG908EDmKkuvWTb1pj1Hbq6gAHdn3w/vJCyAL7DRXOo3hbLr0uPcvi5m3jp
	mW7LvOXt3inx1O3DVtWQljzBi2gDdy+6YevwsjA8YQ8UMAXsjU/qUNHKvF8e9ETvWVa+xVMm6T8
	gFQ6a/ooy9tWe99cdFj1viM7S6miPLjrqRpZ6oNtk5VH9GE1+kzLPClWEs8=
X-Received: by 2002:a05:620a:618b:b0:93c:65f2:7d63 with SMTP id af79cd13be357-93e9b7c2094mr80059085a.31.1791326502922;
        Tue, 06 Oct 2026 15:41:42 -0700 (PDT)
X-Received: by 2002:a05:620a:618b:b0:93c:65f2:7d63 with SMTP id af79cd13be357-93e9b7c2094mr80053585a.31.1791326502350;
        Tue, 06 Oct 2026 15:41:42 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:41:41 -0700 (PDT)
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
Subject: [PATCH 38/45] media: qcom: camss: sa8775p: add gamma parameters
Date: Wed,  7 Oct 2026 01:39:46 +0300
Message-Id: <20261006223953.3382273-39-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX4/NJLW9knXdN
 qXZh2bhEe1R/dKgyPyPdHIopsAnv5e+zJaHbsGSg8uYSqD6yA4sayoLt5BFqSfiPRSBcsfM3fLF
 ZSErF8YyZ22l8XSOyURSOODmuB/2SOdsuCJR5aNxkbTRPWaYp3IDRuK54bE8LC+NHjFyMftialt
 gQlOH7fUIFhEG/eAqz5f+VpsCqg/vhlBKsc6PprT3APqjOu4q7fTmVmHd8yXSNauRw7YJZ2IVzy
 lb2aEnKSdB2sC43zHakPhl89rAyDeWUzKo2KkRFcpuRkACH9lxMMCIjG55QyRbSpxDY1WRYeQgf
 7tixyNVQ1uJl/doHD0PzfqtEWwOuqPme4vUWmYm8d2CgGIgR+87F3Cz8HERiF1xfBmg5En56MdP
 h2KTkaada2/Tg1ZILRKWjjOzLQgu1LStG1q1xcYjCqaNxruLh7GBiqIIQLwzcO/ZWc8ZNk3Kbri
 ygiHQqB6NrysBFxhMpg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX1jJ9RM/UrZqG
 OUWt34ZoQVMo7YMoB++vTvKaiUtQ0WGtNozF6FtaL47ZhcUiz267aeuxd8WjBIpEXJZIFto4ukx
 AikmUX5ZngMkTbEliORU7lKz/wWgjW4=
X-Authority-Analysis: v=2.4 cv=F97C5ahN c=1 sm=1 tr=0 ts=6ac57927 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=A9bscV92ZXObkQ-UZPYA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Wf-dSI-DFnmNerWjxNIp5dg1G4ib-MJ1
X-Proofpoint-GUID: Wf-dSI-DFnmNerWjxNIp5dg1G4ib-MJ1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue gamma tables from IFE parameter
buffers. Upsample each userspace table to the hardware table size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 73 +++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index df21ea4040df..77d33c05cc6e 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -159,6 +159,15 @@
 #define IFE_MOD_V41X_LSC_LUT_SEL_RED		0x1
 #define IFE_MOD_V41X_LSC_LUT_SEL_BLUE		0x2
 
+/* Gamma LUT (GLUT) offset, registers and bitfields */
+#define IFE_MOD_V41X_GLUT_OFFSET		0x5f00
+#define IFE_MOD_V41X_GLUT_MODULE_CFG		0x60
+#define IFE_MOD_V41X_GLUT_CFG_EN		BIT(0)
+#define IFE_MOD_V41X_GLUT_LUT_SEL_NONE		0x0
+#define IFE_MOD_V41X_GLUT_LUT_SEL_G		0x1
+#define IFE_MOD_V41X_GLUT_LUT_SEL_B		0x2
+#define IFE_MOD_V41X_GLUT_LUT_SEL_R		0x3
+
 static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
@@ -355,6 +364,58 @@ static void mod_v41x_lsc_apply(struct ife_pp_ctx *ctx,
 	}
 }
 
+static void mod_v41x_glut_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+	value |= IFE_MOD_V41X_GLUT_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+}
+
+static void mod_v41x_glut_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_GLUT_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_GLUT_MODULE_CFG);
+}
+
+static void mod_v41x_glut_config(struct ife_pp_ctx *ctx,
+				 const struct camss_ife_params_gamma_256 *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_GLUT_OFFSET;
+
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_G, cfg->table_g,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_B, cfg->table_b,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_GLUT_LUT_SEL_R, cfg->table_r,
+			   CAMSS_IFE_GAMMA_256_SIZE);
+
+	/*
+	 * The last table's auto-incremented DMI_DATA writes only land in LUT
+	 * RAM once DMI_LUT_CFG.LUT_SEL changes value again - without this,
+	 * the final (R) table silently never commits and GLUT reads back
+	 * black on that channel. Deselect the LUT once more to flush it.
+	 */
+	writel_relaxed(IFE_MOD_V41X_GLUT_LUT_SEL_NONE, base + IFE_MOD_V41X_DMI_LUT_CFG);
+}
+
+static void mod_v41x_glut_apply(struct ife_pp_ctx *ctx,
+				const struct camss_ife_params_gamma_256 *cfg, bool enable)
+{
+	if (enable) {
+		mod_v41x_glut_config(ctx, cfg);
+		mod_v41x_glut_enable(ctx);
+	} else {
+		mod_v41x_glut_disable(ctx);
+	}
+}
+
 static void mod_v41x_awb_bg_config(struct ife_pp_ctx *ctx,
 				   const struct camss_pp_cfg *cfg)
 {
@@ -571,6 +632,14 @@ static void mod_v41x_params_apply_lsc(void *priv, const union camss_ife_params_b
 	mod_v41x_lsc_apply(ctx, &block->lsc, enable);
 }
 
+static void mod_v41x_params_apply_gamma(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+
+	mod_v41x_glut_apply(ctx, &block->gamma_256, enable);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
@@ -578,11 +647,15 @@ static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[]
 	[CAMSS_IFE_PARAMS_LSC] = {
 		.size = sizeof(struct camss_ife_params_lsc),
 	},
+	[CAMSS_IFE_PARAMS_GAMMA_256] = {
+		.size = sizeof(struct camss_ife_params_gamma_256),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
 	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
+	[CAMSS_IFE_PARAMS_GAMMA_256] = mod_v41x_params_apply_gamma,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

