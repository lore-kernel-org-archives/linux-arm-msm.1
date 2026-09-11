Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1170E4772B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789141168; cv=none; b=qAJchvMfPngdM7owfr7TInfYs3CpJSuWI89VdULNTPX0BrMOCMlfhoV8Sju45fidi+b2AXgiBXsTkwltH0ygf0WXlYnC4zWwTDivncRMdmDJL5rpoFTrnxdzBiyNoWkwnzvizx6HgHD/HkKSc2V9G3obkYkABxbidKhq9kblR3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789141168; c=relaxed/simple;
	bh=nTcVvSgqE0ZHgFe5plmm0DECoPd8tLQSGpkNmzO1gG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XdemSWx/WLs5v7d69wf4MT8QEagjI3Gpu6ELrWT4M6CCcKrgCvxGn5flFdkYYgEumNBK0a9Om9OCpG0R86SI7dupdU5LPZ6YZvc96jGPA3eZaN1/dXyiwBQoNKdc2OpefdJIGjA2ODb8HjSJcycjwFf1IqkpFooxKp1sguVn0I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMUrNJLG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fIacrLhH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMUrNJLG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fIacrLhH"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BFA6rp658277
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UnGddGWrJdF1zxB4VFc2RF/9fwOZjjhxSTnj+Nzo7/I=; b=TMUrNJLGo4CfY+H4
	wgrvvueXkD+Bu3I8ogPvOQXkz2Iu5I5U3QVc31Ty94A3eR8c6upfwrQy09SftJAS
	ltmCCdwbF5QZLBA2A2GTMem/ogime0uTbSFG1kN/wulxeDj8bsemN95Khe+g3gZr
	Ml1frnnXtYs5nxntFynfTJGSumZdfpkEoxfDlxqvP21vyL3UsOKUKKXSgzRZ4ULR
	2DtVb/b1EKDM9I0MMVeapD2/Bu+QVacM25AGehap+/nX3ZzqOSUxSNZue57Lo+Od
	gbqDS4lhEBctFmoELwtZmy3zggF6cRdWfaJyAOMFMgJQEo3brMbvpY/pgBucwuwV
	bOon+g==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22r46y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 15:39:17 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45e45d32bd4so1157100fac.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2026 08:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789141157; x=1789745957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UnGddGWrJdF1zxB4VFc2RF/9fwOZjjhxSTnj+Nzo7/I=;
        b=fIacrLhHLY0YfLOK0NkLjaEYzxk7HmssHYSPHH2geW4r75B1P3CxICJTxvxW21ls5k
         END3Eg2KOI311tm38HFsS3z50F2nY+71kKTQLsy3K0dUxvbQ2peBUVGg/7U3UHKMN5TI
         NkTKKNQSwxgTCqmaNOATZqB33Kic3otb/dAQ3A1uaNakOXYPVxQwDl6ukvFdUFKc4Quc
         3W1FYJBO2u9zgpT2j2os+XRhIdAaGtaoko0fb2OLuoc8JAOVJu+PQUmWKfdXt56YDxJu
         c5Nm/H/C4+g2DoVrp/wRjcH0/jBWSic9CTW5WaPoBBnMeu/2qVPs4rVUQKk0M7L8ebGc
         tZsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789141157; x=1789745957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UnGddGWrJdF1zxB4VFc2RF/9fwOZjjhxSTnj+Nzo7/I=;
        b=SSGJmppDibVNJTc9QYvNZGCNwBICSUTaY339hCsI47H0BBFRR8mOp97yyM5X0Oa2WV
         O2HLAzyJOqJG4KA2ut6fM00nEWotuzG0f4A7mkw6rUN14KW7P+3hAVubEVqn0OIZN/7Y
         PLhmgdUxD+Y4CElTWc2ZLfVzlVLu4RdIxokndjUDUy141Xg2aa+LKSerlvCi4n55K1e7
         eVECrM54iuVSkzTIa/SlLnv25FA1DbzpLWYumRyhyFhXFhJ1L6gmaAQtmrpO5VTOzNLm
         Ko/6nz2CclmhxQtka2P9HBCv4iqVi+WSEu71WlD0FB3GtUjJ4N4G/GJwTbx2JA2FNNq0
         1kOQ==
X-Gm-Message-State: AFuF++lieWhf+gw2NR9C706Fch00mAFv1AxNrU+d2pj5mre1uEsJty3s
	n3nwd+vHnrURYphHzugFhRkjCvZHpkBtj3qyUYK68dozQSAe7pw/yBJFjnKHXNj+RMyb5KaiNvc
	OYP/hCRoWKFoOv0Ndo/eBoGJGeBfU3BjMMpJpsB9q/bLuBPYmpwVLwnTrz9DsShOlNPHP
X-Gm-Gg: AYBFou0EBnijVb0eYA9aft7ERP1+KYjSW1xjiC5Sd+XUfnApjF3RMDfiTQTYBGphCEC
	4E6PNFxopjkAcaTkNTAefeh7eR/8SXMKwyIJc4PXlVHRkd0rpguFBi43h9lxn7ot8aSqZBhNAfw
	IM0OTcGdjvHfHaOOzcPXHxkU7ROfYFUiIL+nQzZKjGPKNwXAQenrqFcwkMedNoJPbiFGwi9/jXA
	M0Ip5BRQk3FrbgpXunTzBpgMsSe6X6uZUZwxFAgjuRm2ozfXWugQL6jwPa4A6eIkafmFWYJsCbj
	J94UiCMvG/g88gVbzM9yLijJUX9+eNcWKYlVGwo7r34WJIeFo+rG2WWT5OWaPsM5LWv+HtStTqs
	R4SQ5PKPAFsyDQzjG6I/avVPnpyU=
X-Received: by 2002:a05:6871:4527:b0:45e:4deb:92e7 with SMTP id 586e51a60fabf-47de9ea1f6cmr5600520fac.10.1789141157225;
        Fri, 11 Sep 2026 08:39:17 -0700 (PDT)
X-Received: by 2002:a05:6871:4527:b0:45e:4deb:92e7 with SMTP id 586e51a60fabf-47de9ea1f6cmr5600455fac.10.1789141156830;
        Fri, 11 Sep 2026 08:39:16 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-47df90ff148sm1882160fac.14.2026.09.11.08.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 08:39:16 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 11 Sep 2026 21:06:45 +0530
Subject: [PATCH 14/17] phy: qcom: edp: Add Nord PLL configuration callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-nord-drv-dt-v1-14-e25c073cf1b6@oss.qualcomm.com>
References: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
In-Reply-To: <20260911-nord-drv-dt-v1-0-e25c073cf1b6@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789141012; l=5018;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=z9E4EG9wSuZ5+j69xkzxnB+1Nroa+6lja69Qmbxvx1A=;
 b=6id+SyRX/F4n99lfnbRmoSJL5H686LP5GjLFNv025TolLH4cDG8X4GLI5HRPD/xCoO2AJe5E4
 ilic7KghrJ5BbCGAhfAEvuRO4nGuGvV0eaptA9ltOIaTgvhNfhqQtoC
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfX8lgSoWGg/iX2
 on2JG//Bii2hUDrRE4sgpAo8H7Ime3H9wJFM2XM9pr5iW3GDtslo8VUbBY7heyh0u6cs9LuJmY7
 CcLxDwu6tq/XjEG3KD1tEJPDQRbfIzemeFKs2DxhGnyQv/DioUkpsUWBim0gFrixdtNlX6+PKB6
 DxcSgUpVpRfuPzWiSfO6v6Chfa3kjOKeXgtqPqOUQdvmx/YzfRfw8fqbSOaa8ME+lC0S4QSfEvY
 uPx/3znGBp6S6D3NhxgBF6pfL51POBWkguQOZ9FLeXvvbFZ281kFJ2mWb/6UZd2YUXzDfLQbAkf
 dHMfIORpfgyZJb5h2EQKqHlit9v3mQvesythLCCXX9smNoWOpjzQ149Q2p6sE5D9Nf+/e78+XsQ
 lvzhvmqJncC+97QwWliy2xh2DjoRzm6mASE0q/glgKf1hbfpMZEvBcHdueyWHT3cKlfEGBrASrC
 ZTfYmVxuVifKUQo1GHg==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa420a6 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=LM-BLXuauT-zrwgKAhAA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22
X-Proofpoint-ORIG-GUID: kMRBpxA1t-WY7jLMwK0UT2stOuROX6qZ
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDIxOCBTYWx0ZWRfXyvvUHGI0nSkQ
 SGyaMqw0BdVb/gTThyAjgfUm+I2SfVWK6nZH+i2NU3RnrXMqvK1wXJp4rJrX71TdMsZkaa3IQ1u
 dik7Nph+/f9A4c5QGlTB/bPe87Eq5t8=
X-Proofpoint-GUID: kMRBpxA1t-WY7jLMwK0UT2stOuROX6qZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110218

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Nord uses a 38.4 MHz CXO reference with a different QSERDES v8 COM
register layout and PLL coefficients.  Add
qcom_edp_com_configure_pll_nord() which programs all QSERDES COM PLL
registers with link-rate-dependent values for RBR, HBR, HBR2 and
HBR3, per HPG Table 2-1-d.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-edp.c | 112 ++++++++++++++++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-edp.c b/drivers/phy/qualcomm/phy-qcom-edp.c
index a0f4b12e561e..4d1b2c81d956 100644
--- a/drivers/phy/qualcomm/phy-qcom-edp.c
+++ b/drivers/phy/qualcomm/phy-qcom-edp.c
@@ -1688,6 +1688,118 @@ static int qcom_edp_com_configure_ssc_nord(const struct qcom_edp *edp)
 }
 
 
+/*
+ * Nord PLL configuration per HPG Table 2-1-d, CXO = 38.4 MHz.
+ * Supported link rates: 1.62 Gbps (RBR), 2.7 Gbps (HBR),
+ * 5.4 Gbps (HBR2), 8.1 Gbps (HBR3).
+ */
+static int qcom_edp_com_configure_pll_nord(const struct qcom_edp *edp)
+{
+	const struct phy_configure_opts_dp *dp_opts = &edp->dp_opts;
+	u32 div_frac_start1_mode0;
+	u32 div_frac_start2_mode0;
+	u32 div_frac_start3_mode0;
+	u32 dec_start_mode0;
+	u32 lock_cmp1_mode0;
+	u32 lock_cmp2_mode0;
+	u32 lock_cmp_en;
+	u32 hsclk_sel;
+	u32 code1_mode0;
+	u32 code2_mode0;
+	u32 core_clk_div_mode0 = 0x14;
+
+	switch (dp_opts->link_rate) {
+	case 1620:
+		hsclk_sel		= 0x0c;
+		dec_start_mode0		= 0x54;
+		div_frac_start1_mode0	= 0x00;
+		div_frac_start2_mode0	= 0x00;
+		div_frac_start3_mode0	= 0x06;
+		lock_cmp1_mode0		= 0x37;
+		lock_cmp2_mode0		= 0x04;
+		lock_cmp_en		= 0x04;
+		code1_mode0		= 0x8d;
+		code2_mode0		= 0x27;
+		break;
+
+	case 2700:
+		hsclk_sel		= 0x04;
+		dec_start_mode0		= 0x46;
+		div_frac_start1_mode0	= 0x00;
+		div_frac_start2_mode0	= 0x00;
+		div_frac_start3_mode0	= 0x05;
+		lock_cmp1_mode0		= 0x07;
+		lock_cmp2_mode0		= 0x07;
+		lock_cmp_en		= 0x08;
+		code1_mode0		= 0xf6;
+		code2_mode0		= 0x20;
+		break;
+
+	case 5400:
+		hsclk_sel		= 0x01;
+		dec_start_mode0		= 0x46;
+		div_frac_start1_mode0	= 0x00;
+		div_frac_start2_mode0	= 0x00;
+		div_frac_start3_mode0	= 0x05;
+		lock_cmp1_mode0		= 0x0f;
+		lock_cmp2_mode0		= 0x0e;
+		lock_cmp_en		= 0x08;
+		code1_mode0		= 0xf6;
+		code2_mode0		= 0x20;
+		break;
+
+	case 8100:
+		hsclk_sel		= 0x03;
+		dec_start_mode0		= 0x4f;
+		div_frac_start1_mode0	= 0x00;
+		div_frac_start2_mode0	= 0xa0;
+		div_frac_start3_mode0	= 0x01;
+		lock_cmp1_mode0		= 0x17;
+		lock_cmp2_mode0		= 0x15;
+		lock_cmp_en		= 0x08;
+		code1_mode0		= 0x14;
+		code2_mode0		= 0x25;
+		core_clk_div_mode0	= 0x0a;
+		break;
+
+	default:
+		return -EINVAL;
+	}
+
+	writel(0x01, edp->pll + DP_QSERDES_V8_COM_SVS_MODE_CLK_SEL_NORD);
+	writel(0x0b, edp->pll + DP_QSERDES_V8_COM_SYSCLK_EN_SEL);
+	writel(0x02, edp->pll + DP_QSERDES_V8_COM_SYS_CLK_CTRL);
+	writel(0x0c, edp->pll + DP_QSERDES_V8_COM_CLK_ENABLE1);
+	writel(0x06, edp->pll + DP_QSERDES_V8_COM_SYSCLK_BUF_ENABLE);
+	writel(0x30, edp->pll + DP_QSERDES_V8_COM_CLK_SELECT);
+	writel(hsclk_sel, edp->pll + DP_QSERDES_V8_COM_HSCLK_SEL_1);
+	writel(0x07, edp->pll + DP_QSERDES_V8_COM_PLL_IVCO);
+	writel(lock_cmp_en, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP_EN);
+	writel(0x36, edp->pll + DP_QSERDES_V8_COM_PLL_CCTRL_MODE0);
+	writel(0x16, edp->pll + DP_QSERDES_V8_COM_PLL_RCTRL_MODE0);
+	writel(0x06, edp->pll + DP_QSERDES_V8_COM_CP_CTRL_MODE0);
+	writel(dec_start_mode0, edp->pll + DP_QSERDES_V8_COM_DEC_START_MODE0);
+	writel(div_frac_start1_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START1_MODE0);
+	writel(div_frac_start2_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START2_MODE0);
+	writel(div_frac_start3_mode0, edp->pll + DP_QSERDES_V8_COM_DIV_FRAC_START3_MODE0);
+	writel(0x12, edp->pll + DP_QSERDES_V8_COM_CMN_CONFIG_1);
+	writel(0x3f, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN0_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_INTEGLOOP_GAIN1_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_MAP);
+	writel(lock_cmp1_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP1_MODE0);
+	writel(lock_cmp2_mode0, edp->pll + DP_QSERDES_V8_COM_LOCK_CMP2_MODE0);
+	writel(0x0a, edp->pll + DP_QSERDES_V8_COM_BG_TIMER);
+	writel(core_clk_div_mode0, edp->pll + DP_QSERDES_V8_COM_CORECLK_DIV_MODE0);
+	writel(0x00, edp->pll + DP_QSERDES_V8_COM_VCO_TUNE_CTRL);
+	writel(0x1d, edp->pll + DP_QSERDES_V8_COM_BIAS_EN_CLKBUFLR_EN);
+	writel(0x0f, edp->pll + DP_QSERDES_V8_COM_CORE_CLK_EN);
+	writel(code1_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE1_MODE0);
+	writel(code2_mode0, edp->pll + DP_QSERDES_V8_COM_BIN_VCOCAL_CMP_CODE2_MODE0);
+
+	return 0;
+}
+
+
 static const struct of_device_id qcom_edp_phy_match_table[] = {
 	{ .compatible = "qcom,glymur-dp-phy", .data = &glymur_phy_cfg, },
 	{ .compatible = "qcom,sa8775p-edp-phy", .data = &sa8775p_dp_phy_cfg, },

-- 
2.34.1

