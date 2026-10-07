Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0C1348380E
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363808; cv=none; b=aYmxMEtCerndOAOlmTT5sEJVKklT7fDuueMbcV2H1vRbsGOme85gbvPbOolNVyq4bomD1tmIzvWmJ+T/BnQrIiJP8Gn8TTKHwXZdCxW3orvRrTB1O3+i/fywPjpUyFJKkn9b7i5pBqevnGUmJrH4UXFJot8h6uK5n+7ML82W+JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363808; c=relaxed/simple;
	bh=kFm8SOkQtolRg/Topb98jefv5hVpImij92MceW5x3Nc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EwHjjwH5c2np0shl0AikHIXcJX5/+5GG2Z29964GggbTw8GHbO4eHdkJejny7BBHN+fg5I7Zy/CywJ/SBl+BB9VDZe1cyR6pFpCdUmdx5LJA83cVj7fZQ86bFCgXaCyggfozkSox2WO0ZbNLWysPeJ1zDJZM0nVoNZAkrUSFaoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ATlMFB7p reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ATlMFB7p"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jlfV3686127
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1dy4HVxT6hV
	bqdtoFT0mNK/Pubse9HC1K0GSZfUvfEE=; b=ATlMFB7p6p3B8+F+x7V7y0fr+eX
	5emenYfn1Sd3A7StUIwAn9Udyy2Pq8QShMj1QlA2ldfzPUObmwmkxGeaXtBotk81
	NrHwVv+vl5HTwTXr1gEbceEBSJwfehKuYKcugOB0Gd0SGsg0MpCOmALtfz6ylfHL
	IfqnzxhbsmjTYjhBBD15C7SMTtrvGNpDPwJHtd+Qrwvv556yDiOuXW1t8Bv+HsFZ
	IVDFaeP50sHmHjzkfUCMdRolrb/69sweZ0np4Q/ZIqkN9gvL8TgPMvfeozgZ37AJ
	B3W2eCLGC8qBMH8d6IPdbYocOrOXseCOvMPqCTtxYto7YAFcwueEp87OGTg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c609ca8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:02:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9308eafb465so921992385a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:02:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363774; x=1791968574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1dy4HVxT6hVbqdtoFT0mNK/Pubse9HC1K0GSZfUvfEE=;
        b=hIh49QerE69o0S+yDGhwpUvqormPbvVZ6cExCeh1YkgkU17CfP+Q0hTl50POXnhD8H
         WcWe5MMwNhmZJ9ZBpYYzJ+yzDWqQlTzQF4yj6Bd1eXAmnbX2vPvbEiBKU1yhWh2smIr9
         wljvYiC2pxVJ+TjzLFOK/TtBXtEyLtdmOMaZGK3dzeUl1bEAZAu17P+fY1BPuHtYUhwk
         06n+UnFk63abpdzEKFkpVRdmhBaAECkZX+CMXWzUS44Kp+A7xPu9l7FLGdEwshyV/f9r
         nNSDk0q/Bcpq7IvNll6Du8l40VS1Q02yHkc/HvgyRyk58tNXQpRbXD8nc0EZkqhry8l9
         0YGA==
X-Forwarded-Encrypted: i=1; AKwUvBy/SkoZYL89BwG5nWlXriN9+Ru23zEke2LXCrh92Xx0z+mw4jA1vw7sW2Hc/HHeZXTq48rcPka60t0QGCVg@vger.kernel.org
X-Gm-Message-State: AFuF++k8TVNUlY6zQMSsm5O8oYzSXddnJjlBTNwCyeSY8rOSYqRZftG2
	Ix1v9YY31mmp7jk46GsBTJSmDB9Ls/YWetSIGTLV9u+/atAwwZqXyWDILkng8bjPz746Z4+jS50
	3GXPgAHDRCDIC4+XJGLZ4iscqQYTdYMtn4DK2Z36yX0EpzVE4/xKPFGro1IbITD0En6pD
X-Gm-Gg: AYBFou1OF9WMMkbyGZHyZJRKCg4nitKqGt3uqdtctDkcOATzjpkOym2+C/DSK4ZCvGr
	pVyWm2euYAIIn/9pVkLB92D2Ug+6eGTnJKNbZ0BMPN2UZezAw4x3FiwhsHDjEPNRavnw4hDQhlV
	Ann+tAyFNKZ3u/3v9frbPvVo9b04iJEyWwju0Z5mF6Ef+qBSjxG9IowVk4SbyLofqZejHaFKH7q
	TJXEmuRsEPSO/AKC7+iBHkI2T7pSR1CFAnkerUwEDGCs6WJDuar9Z53cj5zqRwbUvBRWbM+wsAt
	fcqXSE5gupMrHl4zb0kxoVkP8/GdE2hU+qS2wV+UmwYLDlhzM+2Lh0V9OOk=
X-Received: by 2002:a05:620a:4387:b0:93c:61ec:d17d with SMTP id af79cd13be357-93e9b719462mr274037485a.14.1791363773543;
        Wed, 07 Oct 2026 02:02:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4387:b0:93c:61ec:d17d with SMTP id af79cd13be357-93e9b719462mr274029785a.14.1791363772922;
        Wed, 07 Oct 2026 02:02:52 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:52 -0700 (PDT)
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
Subject: [PATCH RESEND 37/45] media: qcom: camss: sa8775p: add LSC parameters
Date: Wed,  7 Oct 2026 12:00:33 +0300
Message-Id: <20261007090041.3732717-38-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: o_JokTRG0QfqpzMYanZfs6rPzTFwp4JQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX/PD2pvWKcntH
 p5LJJLFzd+e2l1y9odH4eKBkNp/3rbalvJnemXA2tbrR+0//6qVfMJ2zSwwiB5NnUwfl27OqtIS
 Jc9I0sCV3olte/61waWFVMnkrb0O57o=
X-Authority-Analysis: v=2.4 cv=PM+aavqC c=1 sm=1 tr=0 ts=6ac60abe cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=RxvoleFuULCwYReFFyIA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: o_JokTRG0QfqpzMYanZfs6rPzTFwp4JQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX+Y11ggNopQv5
 xH0loU1iKoUckd84LbKkVan4GUbZSaYJ7z8SmTORJv6eb1ca6vq1JtoznWDr+gSfVlJpckc+uYE
 DRXIRuczKOqIsjmJh8JHR0zNz3DNdjK9Kv/pMGQY32qC2wSdU31IAy6dFLkdmjrTQzjA6mYHgYM
 ZkdN8eaRG78bZhV8Tl8I6YUl6o8zq+6GhutPbWQy0j6Sgalf1fS6vshcxP8XV70rnT+lYVzSbEC
 5dRWP6l8UQfsVSNYWCeA2b2cU7Cz4EZdQ4Tp+S6dfO3P7TPfp/NvlLOQPtKEhNm2zBnK1/0p7gB
 HP8E6lSlhckBaMd2PYMCC6atbdbrYhrdWjtN2XDS8V7iGREavpBvTTWr0ub0JMk97/lfyxbnQJi
 cu2lQjij9BAlXBN8c/cuPE1u2rxlZ5r0c5uUQAAEuBBjgs/kWWy2NSwtkiWn4MlvQnYGoutp1D9
 PKlfpTJDYJ/KsMwBz9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the lens shading geometry and red and blue gain tables from
IFE parameter buffers. Validate the block counts before updating
the hardware.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 .../platform/qcom/camss/camss-ife-mod-v41x.c  | 142 ++++++++++++++++++
 1 file changed, 142 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
index 0db88534b421..df21ea4040df 100644
--- a/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
+++ b/drivers/media/platform/qcom/camss/camss-ife-mod-v41x.c
@@ -134,6 +134,31 @@
 #define IFE_MOD_V41X_CCM_SHIFT_M_PARAM		GENMASK(1, 0)
 #define IFE_MOD_V41X_CCM_SHIFT_M_Q8		0x1
 
+/* Shared DMI port registers */
+#define IFE_MOD_V41X_DMI_LUT_CFG		0xc
+#define IFE_MOD_V41X_DMI_DATA			0x10
+
+/* LSC offset, registers and bitfields */
+#define IFE_MOD_V41X_LSC_OFFSET			0x3c80
+#define IFE_MOD_V41X_LSC_MODULE_CFG		0x60
+#define IFE_MOD_V41X_LSC_LSC_0_CFG		0x68
+#define IFE_MOD_V41X_LSC_LSC_1_CFG		0x6c
+#define IFE_MOD_V41X_LSC_LSC_2_CFG		0x70
+#define IFE_MOD_V41X_LSC_LSC_3_CFG		0x74
+#define IFE_MOD_V41X_LSC_CFG_EN			BIT(0)
+#define IFE_MOD_V41X_LSC_NUM_SUBBLOCKS		GENMASK(13, 12)
+#define IFE_MOD_V41X_LSC_INIT_SUBBLOCK_Y	GENMASK(30, 28)
+#define IFE_MOD_V41X_LSC_NUM_BLOCKS_H		GENMASK(3, 0)
+#define IFE_MOD_V41X_LSC_NUM_BLOCKS_V		GENMASK(7, 4)
+#define IFE_MOD_V41X_LSC_BLOCK_WIDTH		GENMASK(10, 0)
+#define IFE_MOD_V41X_LSC_BLOCK_HEIGHT		GENMASK(25, 16)
+#define IFE_MOD_V41X_LSC_INV_SUBBLOCK_Q20	20
+#define IFE_MOD_V41X_LSC_INV_SUBBLOCK_WIDTH	GENMASK(28, 12)
+#define IFE_MOD_V41X_LSC_INV_SUBBLOCK_HEIGHT	GENMASK(28, 12)
+#define IFE_MOD_V41X_LSC_LUT_SEL_NONE		0x0
+#define IFE_MOD_V41X_LSC_LUT_SEL_RED		0x1
+#define IFE_MOD_V41X_LSC_LUT_SEL_BLUE		0x2
+
 static void mod_v41x_wb_gain_config(struct ife_pp_ctx *ctx)
 {
 	void __iomem *base = ctx->base + IFE_MOD_V41X_WB_GAIN_OFFSET;
@@ -234,6 +259,102 @@ static void mod_v41x_ccm_apply(struct ife_pp_ctx *ctx,
 	}
 }
 
+static void mod_v41x_dmi_write(void __iomem *dmi_base, u32 sel,
+			       const u32 *table, size_t count)
+{
+	size_t i;
+
+	writel_relaxed(sel, dmi_base + IFE_MOD_V41X_DMI_LUT_CFG);
+	for (i = 0; i < count; i++)
+		writel_relaxed(table[i], dmi_base + IFE_MOD_V41X_DMI_DATA);
+}
+
+static void mod_v41x_lsc_enable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_LSC_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_LSC_MODULE_CFG);
+	value |= IFE_MOD_V41X_LSC_CFG_EN |
+		 FIELD_PREP(IFE_MOD_V41X_LSC_INIT_SUBBLOCK_Y, 0) |
+		 FIELD_PREP(IFE_MOD_V41X_LSC_NUM_SUBBLOCKS, 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_MODULE_CFG);
+}
+
+static void mod_v41x_lsc_disable(struct ife_pp_ctx *ctx)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_LSC_OFFSET;
+	u32 value;
+
+	value = readl_relaxed(base + IFE_MOD_V41X_LSC_MODULE_CFG);
+	value &= ~IFE_MOD_V41X_LSC_CFG_EN;
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_MODULE_CFG);
+}
+
+static void mod_v41x_lsc_config(struct ife_pp_ctx *ctx,
+				const struct camss_ife_params_lsc *cfg)
+{
+	void __iomem *base = ctx->base + IFE_MOD_V41X_LSC_OFFSET;
+	u32 subblock_w, subblock_h;
+	u32 num_h = cfg->num_hor_blocks;
+	u32 num_v = cfg->num_ver_blocks;
+	u32 value;
+
+	value = FIELD_PREP(IFE_MOD_V41X_LSC_NUM_BLOCKS_H, num_h - 2) |
+		FIELD_PREP(IFE_MOD_V41X_LSC_NUM_BLOCKS_V, num_v - 2);
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_LSC_0_CFG);
+
+	value = FIELD_PREP(IFE_MOD_V41X_LSC_BLOCK_WIDTH, (ctx->in_width / num_h) - 1) |
+		FIELD_PREP(IFE_MOD_V41X_LSC_BLOCK_HEIGHT, (ctx->in_height / num_v) - 1);
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_LSC_1_CFG);
+
+	subblock_w = (ctx->in_width / 4) / (num_h / 2);
+	value = subblock_w |
+		FIELD_PREP(IFE_MOD_V41X_LSC_INV_SUBBLOCK_WIDTH,
+			   (1 << IFE_MOD_V41X_LSC_INV_SUBBLOCK_Q20) / (subblock_w + 1));
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_LSC_2_CFG);
+
+	subblock_h = (ctx->in_height / 4) / (num_v / 2);
+	value = subblock_h |
+		FIELD_PREP(IFE_MOD_V41X_LSC_INV_SUBBLOCK_HEIGHT,
+			   (1 << IFE_MOD_V41X_LSC_INV_SUBBLOCK_Q20) / (subblock_h + 1));
+	writel_relaxed(value, base + IFE_MOD_V41X_LSC_LSC_3_CFG);
+
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_LSC_LUT_SEL_RED,
+			   cfg->table_r, CAMSS_IFE_MAX_LSC_BLOCKS);
+	mod_v41x_dmi_write(base, IFE_MOD_V41X_LSC_LUT_SEL_BLUE,
+			   cfg->table_b, CAMSS_IFE_MAX_LSC_BLOCKS);
+
+	/*
+	 * The last table's auto-incremented DMI_DATA writes only land in LUT
+	 * RAM once DMI_LUT_CFG.LUT_SEL changes value again - without this,
+	 * the Blue LUT silently never commits.
+	 */
+	writel_relaxed(IFE_MOD_V41X_LSC_LUT_SEL_NONE, base + IFE_MOD_V41X_DMI_LUT_CFG);
+}
+
+static int mod_v41x_lsc_validate(const struct camss_ife_params_lsc *cfg)
+{
+	u32 num_h = cfg->num_hor_blocks;
+	u32 num_v = cfg->num_ver_blocks;
+
+	if (num_h < 2 || num_h > 17 || num_v < 2 || num_v > 13)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void mod_v41x_lsc_apply(struct ife_pp_ctx *ctx,
+			       const struct camss_ife_params_lsc *cfg, bool enable)
+{
+	if (enable) {
+		mod_v41x_lsc_config(ctx, cfg);
+		mod_v41x_lsc_enable(ctx);
+	} else {
+		mod_v41x_lsc_disable(ctx);
+	}
+}
+
 static void mod_v41x_awb_bg_config(struct ife_pp_ctx *ctx,
 				   const struct camss_pp_cfg *cfg)
 {
@@ -433,14 +554,35 @@ static void mod_v41x_params_apply_ccm(void *priv, const union camss_ife_params_b
 	mod_v41x_ccm_apply(ctx, &block->color_correct, enable);
 }
 
+static void mod_v41x_params_apply_lsc(void *priv, const union camss_ife_params_block *block)
+{
+	struct ife_pp_ctx *ctx = priv;
+	bool enable = block->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE;
+	int ret;
+
+	if (enable) {
+		ret = mod_v41x_lsc_validate(&block->lsc);
+		if (ret) {
+			dev_dbg(ctx->dev, "LSC validate failed: %d\n", ret);
+			return;
+		}
+	}
+
+	mod_v41x_lsc_apply(ctx, &block->lsc, enable);
+}
+
 static const struct v4l2_isp_params_block_type_info mod_v41x_params_type_info[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = {
 		.size = sizeof(struct camss_ife_params_color_correct),
 	},
+	[CAMSS_IFE_PARAMS_LSC] = {
+		.size = sizeof(struct camss_ife_params_lsc),
+	},
 };
 
 static const camss_ife_params_handler_fn mod_v41x_params_handlers[] = {
 	[CAMSS_IFE_PARAMS_COLOR_CORRECT] = mod_v41x_params_apply_ccm,
+	[CAMSS_IFE_PARAMS_LSC] = mod_v41x_params_apply_lsc,
 };
 
 static_assert(ARRAY_SIZE(mod_v41x_params_handlers) ==
-- 
2.34.1

