Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAD249364F
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363817; cv=none; b=nFqHi/4/zBm/K5gatd/OvD874Q6BfRhIxTwIGig/1iV3E4pgC4Z8b0fVIKmtpuVbyEuj7wNOnAv9wUuWp9foGMj9Ka6A0bEXn77rDEN7qod3l49g29Db7USykPlEC7uezKj4JPXO/dPT4hmlkZ50SnQNS0HJfulHIt9SOUOzibQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363817; c=relaxed/simple;
	bh=lOmfvyw3XlxTtLP3rd4+jL2YmaWRT6O45D7rsJBBOvI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=rA//N4XSHtYjfsPnJDjh91gS/3z0muFhPx/jpfwCorL/AFxPqrfeCjY72PXhLiVCbPDEn1YSvqgjVxdOwLIDUX1USzeaeeBmjavezs8X3W8pw657eMR8iPpMqXXQoeaYrCrjWvz+RWkeRFNejBkyg+6Ev5o66lQaNtcs/YbeWO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FE+zUkud reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FE+zUkud"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jXqH3810929
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LdndrdMM61X
	79e5QOlAFoauUr7WYD/MqS5dFJt6wZas=; b=FE+zUkuddFs0KpypwXPqPghqFmO
	lSpNbhS2TQjjfybKvUjfL5NR59o6Ds59KmaQL1lxqkyM/wcsPfEqvIPDgsXaktCW
	mCAelTEHb1dF8OzIzQ/uoApE81hT8bXJ28ZUN1uIO3LxXDjCc0D10keMjG3IhMgo
	wO8KRzDH3OMYqcp0uOfw69Vo+rSm4WdtBYxrsEHJP+LNP66jGqfZmsdx2sT43aGR
	tV3cy/9mmwZO9r1NHD3J0A8AxAlnSg5ng2P997yLc7q4Nb8MSGD04dxkt4ULv42E
	KP1cyMxkp2wrykBwbrhF7PJwoC5KcqVHdu27VNlHplYn76Szg2OKU3qqKjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5gvrrg8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:02:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-936aa34873bso745542085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363777; x=1791968577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LdndrdMM61X79e5QOlAFoauUr7WYD/MqS5dFJt6wZas=;
        b=odVRzZ818Vz6SyFOUQGkPwJyq8Vb9ndH5/uwcIfjaaDUl8r+QSgBciKxvoo99jKnji
         Uu0We0Aa07c2+YAdv/ycJm3nOJVdspYXPeJr1MCoROVy7oxkbrK3JSuf6CGI8WG4aQR2
         dgu/opLNpMsTZb5Xt/E1Jn3vLRcFyWRimUXYvTWWoH/OSMOCwV4DJgQMm0Buk3VYOId/
         cnOnF7ocf006vnEXbWx9DaTDi9+Vnqzejfj5T4u7I4QbUtPKMO32crO/Y4fkJmPaeOQ6
         7zViUa9jnje4Th+YwWmocVRlsbHfo1KfCG3gjrQpcjYQOmKcYs/b5SMBTo24O61fTNQ3
         QXnA==
X-Forwarded-Encrypted: i=1; AKwUvByTVkKkrpr/XHRJStiJrD8sEQPaq9U0iulGCItOM5041RxC2cq6D6DcOoADUxwykM0AWwUFMCQfDVZb6V8Q@vger.kernel.org
X-Gm-Message-State: AFuF++lDh95b9vzzwf8MeBS0IrM7tpVAPfj1zVko/WXiWQaaISyW0mtt
	DaMRKfNvZ8YfWivAefgsS46p2uNTIWls1HxxteZYmAXfX7Gw9tPEQv+u4aFWut4/9LXxGkGGHc2
	oJvJNLFkhYdrjPmsk2A38UVRMiPWIzN7bCnHPWyF2TCMo+RVwQ4RLibJbinX5XCkgI6Xi
X-Gm-Gg: AYBFou2/IHSFy3Ge0VToSR/SmKvNdPnHDXDLNT0EOKGqm4nbBYd7A1iObMd3/J7/NgC
	R4zcRQmmhzHdotIwq2xsBRdFo2o0lXME0l4NcOrQ+kJ9CugAEYJFp2O6mHJbwHztZyqyS0hp+lX
	qwS3xsX3u9jMvyC8tkZg3XaB1d2SHOZ3GHt1ewg7L9Pvm7NsEFWVKf8ng3e6sih7YF5X/Pq+Nlc
	ZQQItICZckMQHqemmpW3wgIbDnTSfBNcYRL2dAMBagwZsQWUVBUKVnIpjcU2dQFu9fgEjnEZygB
	z3OXxZxPTLkOHqeCiidiZONA7ij3QXqHdrWlcCvqcKoBzswrfBbI9AiG55s=
X-Received: by 2002:a05:620a:2853:b0:93c:7582:14e4 with SMTP id af79cd13be357-93e9b7b9d91mr270477385a.40.1791363777338;
        Wed, 07 Oct 2026 02:02:57 -0700 (PDT)
X-Received: by 2002:a05:620a:2853:b0:93c:7582:14e4 with SMTP id af79cd13be357-93e9b7b9d91mr270472985a.40.1791363776884;
        Wed, 07 Oct 2026 02:02:56 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:55 -0700 (PDT)
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
Subject: [PATCH RESEND 38/45] media: qcom: camss: sa8775p: add gamma parameters
Date: Wed,  7 Oct 2026 12:00:34 +0300
Message-Id: <20261007090041.3732717-39-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=W66txhWk c=1 sm=1 tr=0 ts=6ac60ac1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=fErnbXRPH48mtnlGaVIA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: dslCqhWgXScShoRPyGvYwIHjVq3YZzIb
X-Proofpoint-GUID: dslCqhWgXScShoRPyGvYwIHjVq3YZzIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfXzaeV4RPRgGu8
 OfjQ01hH5pGyS3opYlnZ3e9fFR6dPQIbWeNspm0rEt3IZrlZbUDcILqQy3YaRD6smb0dA4RjUHQ
 gQSYUOKANQ3ylaL5veZD9VNmvDrVeIIUghgaOtPf8mblXrwdnvs8wUEbe2Icz9R/dMzRYrBDoMa
 nUb/q1c+6FcsjLtHPUnaYlZOrqdLg04YemB9XhnYo5ahafrRipP0YXavrK1J2YLmZDw+0EH6G/t
 3roVDDpfQsi/e69puRN0VljRxLgRpE9EHt3+nhzCDj+vwCB+LFb0S3QJCA7QnklJgHLfckC4xxO
 PQiRdk9pVJ+A+zWPxBCPA/qRJhlABHvO9jaXoHeFSctIsC59atsUubup3YKHu0DoNsV8hXHCdHb
 7NUf81IxvaBukVJ7dx7ZnTngObwYdmDsDi94kIQqJeadZCwU4KUd2J6tOs+CoUZG/R5nPgLQam8
 0b9magP87Tm8k2ZuyhA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX9JVXefUt1mT9
 zZy8lXPf2KnHgMTRqgHkp13IKWwby8Q211H/ed/jblu7wBRUhFNMHTafp5hoiThxfMDQ3TZSVn7
 GlqINJnjreTB/u1kdDoYyhPvg/N9OxA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the red, green, and blue gamma tables from IFE parameter
buffers. Upsample each userspace table to the hardware table size.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
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

