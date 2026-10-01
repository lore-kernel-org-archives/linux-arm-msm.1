Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F372E4A0901
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 09:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847324; cv=none; b=lzjk2tHrq1FP4VxxyDlNvv3HNLnyrPOKohQT6oFR7hXK2ukTKV95ZNxMQ8DH2Z/g+x/Y700R7YPSD1jdZurdJH1cLZCw3C1ed36aNM7oZq7NFB62jNk0PycHtJWOU3Vxe93d7snCUZF4loyVLOurIU0pTQezCbEOirwNoCmJvm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847324; c=relaxed/simple;
	bh=CRcLNa/Cu4cLPoRvzdzxQBYWxw22aDoQmvyGJg/YDnA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fo1gQVOOWE38Z/L/aVUzttUZiI3CFEHe5srcV9xpvwLCM7A3i+YRwP/og5B11wOeG7ly5ZKUWVXyWAuMJG0ZO3xy7IQ/ZaEwPQ/GZQYb0iDccNMU1SinnleQufpE868iH9QUJ/CY9jhdsUfjC+y+tGHJsBaKh0zLpDfrBAVSTEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mU+bWQ9D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KhuSyqMR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mU+bWQ9D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KhuSyqMR"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xffP1511890
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 09:35:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d6bjQ1I/J+lMYzebHvdrZOk3S6dIwxL/iEe5SwfdHAU=; b=mU+bWQ9Dzi1jNbjz
	sehanTHooxWrdtjAhSNp7kdjpG9A9zyXknQUrp32T0fJDtLbVXjqO8FtWYG0jfED
	/6haBKBCdDGFMo/ZaoWOVZw8lDEskgdosXiDkabNziOs7g4QFhsP22TAPn7QrLue
	FFlbquSiL21HjNlpG2zDn/KbuOrGXc2nbVodttyHGIqrp+T3uNgyz8quCwR7Z+ha
	ARtF7wpOb5L0+kS8cUa+B4qtHxZA5AIgzOx8E0k4Y4z5E2PxsQ33ht6WLsrKdMNQ
	CGEz+XeGX9LmAezIz7uV86l7UuD/F1ADVEfY7oe7QZQNDaL7V6U65QG7adtAim27
	wsCJPQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188stwp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 09:35:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbedbd182f5so500625a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 02:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847320; x=1791452120; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d6bjQ1I/J+lMYzebHvdrZOk3S6dIwxL/iEe5SwfdHAU=;
        b=KhuSyqMRGeZUTbammtYpHh+1EZHUx1c7nimEhdfAH+wgs1CSWdJIIBX7IK9c90Iccf
         oBJgIXkAkYQbCgORcpwOXasci7zUhuj2MTQZH0dyl6E917e2VIyzXeI58Vz2VdgKmTef
         yYgM8OcQ2MP7tRElTNmBLdiExH5G1Jy9hWQTjsTNZiGQkhkRg43UJ8WN3w5KEdMsXvCr
         V9qdK+hqVmXJ4Zxal8lsmfclOtScaAWbvXrCw3jGkJeqyLJVuDVBoro6Ec9EQx7a74kT
         E+2D5e0AHoG3zThiPzXv/CwJ/eY3NrbIEShVVue0SrURO1T2c9hOMKmxPu//LtL/Pdn/
         5qPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847320; x=1791452120;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d6bjQ1I/J+lMYzebHvdrZOk3S6dIwxL/iEe5SwfdHAU=;
        b=AlitI1VkmyoHqY8qi+zxk3EUpkWakhtm4m/KJCTfZDSKTma94XLnYMIYD2EXmOD7uu
         ruJI2EUp2xDQlUs7HwurVT2Pl3caRJSUGbU+pwB/DTJvx8lvFpy8NByrQQzJ3Meu+UWV
         sejgS88g04sc789sGd9o6B01voktNNUbXg9/Na3Cn9+qXjqxSZP/MO6Ru8RYMTt6lQpm
         MUdO5mov3NNJ/1M59o64Kl731MJepCijUwI0mhYkrL/x7fmh4PmFeSX3nsR2tP5qnIHu
         gxG+CqBshcgCnZ76z/gmPJm5+GB3HrGmYINFg8NfbZCiQMF24kf3O8/N2Vb0G0tXOYXx
         xJ6Q==
X-Gm-Message-State: AFuF++kJ2pY5jXxAwSoOvGxkvmTudzMahSO8RIzDgoUxmQoEQMeYZqGe
	kxTdKGtuvPhP9VJmBEX5aVOQutXesxstKZNAHFspQQNjieTeWCQVuYfSHkjrs+UYvBY6fLfX2Fz
	D2cIcSdaxm/udqU7vnQPgkG/a3sCOtKHZSFUSDWIDE0gjdRQCKmgmPFSZxK76JEN+ALSj
X-Gm-Gg: AYBFou3UIwiF49zFflXMXJzDxVsxLwkIgmAkdhmZBTRNsozu8mgozStP0uwtAcT6XCS
	646lzSob0Nj2YfMfflBxCtujw+WYbCk9ViCer3hnWKaIIftLYzlOWHI2tQUZZGmPxNWc89s1rrL
	p3OLsASbnBZWoiRj9qU/VSKokEWqEFPF5qduN+8RloimBdTRACpZytGtqb23ApJYkSmpwSZ14sg
	Zvywhb1h27Af8QvwBQTXYPpMz0vPNUHCXUQDWMGfdwXd/Bm6CsyasnghbKtPvZ+wnP0A4K3iU36
	CK0yj+OrjzepC+zUSbdd3SweS3JsuO5GTo695Sdzer4xKFqJQcqxiuUy+KIg88ljX67qdBnUsYy
	VXA7w2uMAdf3eBIheU8+bbNVcu6Y=
X-Received: by 2002:a05:6a20:2450:b0:3de:7f6c:b878 with SMTP id adf61e73a8af0-3deacbf03efmr1805420637.16.1790847320308;
        Thu, 01 Oct 2026 02:35:20 -0700 (PDT)
X-Received: by 2002:a05:6a20:2450:b0:3de:7f6c:b878 with SMTP id adf61e73a8af0-3deacbf03efmr1805397637.16.1790847319734;
        Thu, 01 Oct 2026 02:35:19 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:19 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:22 +0530
Subject: [PATCH v5 05/11] phy: qualcomm: qmp-combo: Add hardware-specific
 dp_aux_cfg2 and dp_phy_cfg1 fields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-5-3848c2615d5a@oss.qualcomm.com>
References: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
In-Reply-To: <20261001-glymur-phy-v3-v5-0-3848c2615d5a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=6615;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=ePNqq/ojbPoWMk86wIgOBwLMbYMMdGFda3d/uJWLqsE=;
 b=wFGY7rXOr+HIX0f1cW8qnVT3uUsAe2DCqjkUVGIcegZzmQciG+cFNvAS0eVFGRcTeq2P1BkHo
 u6aed9cxQebCIaMQthuNwEB+513geN7ruF6OSUNiCSFc5aVzwvKkmCs
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX4Di+X94vLMrJ
 opuXiVqgyPCnyXdB4ZaSq/oMg2X4kX1ckrs/s0o7vxBdO7ZBGk/LRbjluUJkTtLog2Wp5CqOZtf
 7JgXmDfzgbf48A1o2zUbby8+OGGOg0k=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abe2959 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=AZ7O3MIRyL_cLquugRgA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: jIVhXdk23E_6PI--mM0IrDEJSxWIIguj
X-Proofpoint-GUID: jIVhXdk23E_6PI--mM0IrDEJSxWIIguj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX4RBiBd6PDUJM
 VrcA954K4K+eWhHIc3R68Jh3JDfOz9cVVmrooaTe/uHz0G5Gyr2ie9Rlf2WzlJbAJiOXRYPJFRZ
 9AtM+LRNGJYmA+/+Y4BzrvrFj+wO2UrVKw+Znf/2sM8xv8K8sNOkdpjGJOiIYCTr3rt49Ffge3K
 R+l+En1x9YrTh1ZzExhJcCMTMfApTbe2cAFppXPKTBuCxa0gOoS+Skt/MHXRwv1NgirIM803bgp
 V7g8Y0dRyNiMidzfgYkqXq/HbGLgafL6f772br4z2zPARcg9Wn8endmFR4/HCqvbSYrwteHclYO
 QEkSYKcrK4pKfHFH5FKQbXNQ4J0KQjWWegwJMnj3/BJW4B6CP/VT9jppz0cGKe4PBdXWboegVqU
 VuBunAWepAYbmsEdX5JwJ/9v93O/c+ozqSp0b/C+LJu4XrSdpG9ISQZsOuSRLMlb4VRA8IaDHSx
 oQy3XEqnl8abWk9R32Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010038

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add dp_aux_cfg2 and dp_phy_cfg1 fields to qmp_phy_cfg to allow
hardware-specific DP PHY register values to be specified per-platform
rather than hardcoded in the configure functions.

Define named constants QSERDES_DP_PHY_AUX_CFG2_V456/V8 and
QSERDES_DP_PHY_CFG1_V456/V8 for better readability and maintainability.

Populate the new fields in all existing DP PHY cfg structures:
- V456-based platforms (sar2130p, sc8180x, sc8280xp, x1e80100, sm8250,
  sm8350, sm8475, sm8550, sm8650, sm8750) use V456 constants
- Glymur (V8) uses V8 constants

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 37 ++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 646e97a52886..ebe2e6136f7a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2486,6 +2486,14 @@ static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
 
 struct qmp_combo;
 
+/* DP PHY AUX_CFG2 register values for different hardware versions */
+#define QSERDES_DP_PHY_AUX_CFG2_V456		0xa4
+#define QSERDES_DP_PHY_AUX_CFG2_V8		0x06
+
+/* DP PHY CFG_1 register values for different hardware versions */
+#define QSERDES_DP_PHY_CFG1_V456		0x0f
+#define QSERDES_DP_PHY_CFG1_V8			0x2f
+
 struct qmp_combo_offsets {
 	u16 com;
 	u16 txa;
@@ -2551,6 +2559,12 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
+	/* DP PHY AUX_CFG2 register value (hardware-specific) */
+	unsigned int dp_aux_cfg2;
+
+	/* DP PHY CFG_1 register value (hardware-specific) */
+	unsigned int dp_phy_cfg1;
+
 	/* Set if DP mode configuration should ignore TypeC orientation */
 	bool dp_mode_ignore_reverse;
 
@@ -2813,6 +2827,8 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -2949,6 +2965,8 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -2995,6 +3013,8 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3040,6 +3060,8 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3149,6 +3171,8 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3197,6 +3221,8 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3244,6 +3270,8 @@ static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3289,6 +3317,8 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3334,6 +3364,8 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3379,6 +3411,8 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v8_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3424,7 +3458,8 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
-
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V8,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V8,
 	.dp_mode_ignore_reverse	= true,
 
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,

-- 
2.34.1

