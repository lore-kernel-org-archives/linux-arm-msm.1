Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B3D46E008
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 09:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791365785; cv=none; b=lA4zLTAS0Ic8bqvIQQP4Xx4VHRBdraSv/kej6hjT/a9ShE93rRL3u/5JKlGr3dQWiNM+K8ZUJHLBvSZTF5LZR8jd95UnlQ7Sb1zaXm4Z1+JT4ZnhlT0R2D0+lWJaiCofMuqShdoxGKA0V8utlYLlfCk0JFoR/fsQgdROtxWV088=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791365785; c=relaxed/simple;
	bh=APy35WtXM0aTQOARfPjmaOGp62HPvSDDlyhrnOOB614=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HTfu5rz8M3ppoD20MtYqUFMtI/zIx5B0AyI08VreIHQpphxZKhA41dk8BftlXqb6JqCGenGubG401BSdUUJMP6Pjy7+EfJMNS7epET8jjZBN35TcT1iGVSzL2pDOkk87nQWpm4SEWP/h40Uo/3qaDevPQ+T3dJG6R+7XzamntgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jYGuSu1q reason="signature verification failed"; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jYGuSu1q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jiVu151949
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 09:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u23gRjYZxi4
	Ye8E66szkWxu0V+sZV9asYPu3dndyBcQ=; b=jYGuSu1qIMd3HDbdU2Uu0hpLp6d
	tvu+fNxpMZQq4TO5kJuxd/S/U+7Qn9bek7+j3hWGBgXRLXp+TtPGM2R8auy1FGIR
	PDEGUeV3Ne9kvZcCxENRLW6I7vnrECC/cvtk2mCd6T6Up2dOMweg7hgjrn2/5Sux
	fBw9xjS0Jzeps/HK/vdn25Ml5AMspqbo5pRhTuzLbHvs5HxczKLbWfoD6q1MkXfu
	L598Rtcne9bJotw2qPiIaCMq4ixa4bid/ba2s5/IfpSOimY2WCX2+BwObsk/6etJ
	6m5TJk8RbCXGQQyq756TSe7jq+9Fnu69lZ63aemWH/1FSYccoUAz6CZd3lA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c719c32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 09:02:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a082c014aso739040085a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 02:02:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363771; x=1791968571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u23gRjYZxi4Ye8E66szkWxu0V+sZV9asYPu3dndyBcQ=;
        b=cCwvSIL8H7JU4VMO9QzxNz4mnCtKhI7SABer8cZp83sqNHQSh/v9XkVj7Jme5rXZIu
         yKna5ptfWhUPxwswIBvmaoBZpmIVmmHQnsqvdo+VzHH/n2nluVtX/FO05yfK0/xRrcbN
         MzvOdfF5BhDxldsZqKqOr/PcbYMU4arM7kBshSD+ah+mpCmWsyyGEibxSIhASGjFoZZ6
         BGq17Z5doVoSwKybuBW0vBCsxxqhL6brCNG87+RRuxWvac7i6KQDB9TxtIJmBbH/JyZK
         UKC2kT/+HsGFhlCTCO3Z6l+KdF0aujlkbWwK438f4wLDZ/0EzDKtbfoKlL8enWLXfQ9T
         DIHg==
X-Forwarded-Encrypted: i=1; AKwUvBxU8kbk6Ae2zsR1Ck0cxGk9BpQ2RYZr23yYT0u+2siFms4u2akepp3nKO0WAGcS6hkl6hU6JdGnDmfWHo82@vger.kernel.org
X-Gm-Message-State: AFuF++kkTitw8m9+0f7L88LTodg8fx/ogr7v1v2SZ3/RXgsk/k9sW5xo
	ffj7r6yeKpH+GuNaDjfePzWpAS+SH9KHbKYaxGALKsnixzctd6ih5phgzGHgggKuCQo7qxuRiUq
	TxhTd2/441KeC2NNvq8FI6N5mEcFiibPJw57xtIwOO4x1ORzZ6/JeqODeyJl5y8+lrExR
X-Gm-Gg: AYBFou1WOKkCIWBHgd5d8/KvfrM1s1HmgyhYLGdHr3ZBsgxyOePAZ+RpNKVEfmj88JE
	dq9CpytZ51xE1FDqLDTxBgfrpCwYF8r1I6i04Tz3KiUS7w5dq8nWLD+h+tP0TJ4LuHCjeu6mvmO
	kNIlSaN9Sr3xwyl2+hvICAjkEubPH/JsiXLpzpiCD+LyJ8HrP/BmU6D4ffn2iAewMEjCiUf8CNF
	sehbdYawAFwFvk5foB5cgY5UeRoL0DQv+z/pRmRzRHeKvxuOzrNxvYRHzA0lE9IBKdDy5FdaTe5
	tL6rXPcHd1B6Fv+TKwjIX78iZJtI7ngNgsaefZNxxGN2VILVUnia3JQu5SE=
X-Received: by 2002:a05:620a:8803:b0:93e:64ac:5dfd with SMTP id af79cd13be357-93e85ea76bfmr1080600685a.3.1791363770536;
        Wed, 07 Oct 2026 02:02:50 -0700 (PDT)
X-Received: by 2002:a05:620a:8803:b0:93e:64ac:5dfd with SMTP id af79cd13be357-93e85ea76bfmr1080592385a.3.1791363770001;
        Wed, 07 Oct 2026 02:02:50 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:02:49 -0700 (PDT)
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
Subject: [PATCH RESEND 36/45] media: qcom: camss: sa8775p: add CCM parameters
Date: Wed,  7 Oct 2026 12:00:32 +0300
Message-Id: <20261007090041.3732717-37-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX9OesGojQAFr4
 0fEaKBOBiVZCFX8cs0AENMr1htPAgxmJ7wBH7cRFmnjACwSb55hvfq0vKmHBwrOI02PpnJFms9y
 aKE9a6Gbp2A+MZwbnNyU4sQPShoN5mA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7XcU5tcSGfMr
 qduOo1q8LI9bz4ZyUAZymQ3fPnOCDzeWgEDiN1Pb14FYoBG07P8dlgiYsVxaQRbQXFjWx7/QAv9
 IKBNqEtGg7LuksT+/7FWgtDlwEJr7thPYiLSgrKDsIhCMrR3QLuFQzg1wF2B5/dh9QuVPX8cRiK
 xx7G3aBG77swRabHyCgRtofNTAE+1CQul/AxpB2yA0AaBvPfLV2cpIZv4HE8UDWC7Wtvuce/7UP
 bwnUPJI0+I8VbjOTKzsIQsdljOEF2g24YF4CSnsJgDo/srAgFeNBVyWB+kTGPN4po4RKYdUxbkD
 hpgwBkhzZSdZ1CAZSG4V6KGe7vqRblbDy9gFYSFJCMQ5CeaIpbS1stTdafH4/OURm6TMiNiyUBc
 9ZEcU7D3TzT5iS5tXEwomOGEPickQL+LORDf4vqSy/952vuzXqkm4Kt5oe3HvgC9dUoLNDVT+lO
 ZmdbPQyCMZef1/OsPJg==
X-Proofpoint-GUID: 0dnqP8ArdyZLniDx6_RDVclYB-pKDEqx
X-Proofpoint-ORIG-GUID: 0dnqP8ArdyZLniDx6_RDVclYB-pKDEqx
X-Authority-Analysis: v=2.4 cv=LvYHWXdc c=1 sm=1 tr=0 ts=6ac60abb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=MPkjE9NDq9863M1uKlEA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610070035

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

Program the color correction matrix, offsets, and Q8 shift from IFE
parameter buffers. Enable or disable the block as requested.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Co-developed-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
Signed-off-by: Prashant Shrotriya <prashant.shrotriya@oss.qualcomm.com>
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

