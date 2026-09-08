Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEEE54939F
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876111; cv=none; b=M1nT43eiPa0Y3mypW1aa15OC861juac1IOU89atgoDrradl8bugPW4FXw3YuL8Bj5ZRCEbCPfZCLuDrPVxsnLJXbaV8GZ5XydLODy2/oZVuW3MY4SwphWX/ZG0SCzoUbgcmQKBjXGhS9P/VEif+zx57XGGRQT9nb0Lt+Vp3VJds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876111; c=relaxed/simple;
	bh=c727mbtGqmtmQMNx73/W6A2uiQzCoMeEd7VMbbtW76A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRCRdtWmdJ1V5Gg+n4fVWDX4mbAO1jGiQuetCMO+BD5FW1u5xbil2IlvWe0DbQ5mYpO6v437WRwnG5kfLBMx4wAz3aesel31ECOI85vyL3dvvM2MONJifZ6AJFSkl6zm6rZHTYg1qsdl12wwHWGJeBw8a2Mbe0vXXUIPN9hhzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HquavSjw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XfXzmi2p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HquavSjw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XfXzmi2p"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ckvm93844374
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:01:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O/mR5Kpg24q3UNKuC+L1bOVHegCCGwSaQQL7AVGDOXk=; b=HquavSjwbOR+LUgt
	hN1pX2rPn9U/oDYMeprll3+b2tqidLbiVjby1sfAoaXWKIJZrwkLjXDfFzovdLd5
	/uzrkuE5iYXkgh+nulKGO8YUiTqa75TmMRQVpYqvDoJp8fAx8QGt37GmikXOqURF
	cEYuq6gWRUX0A42LNNu3dV102qqni3VXn7E52Fia8hXBdzCvaarrp7cqwDm7Hmql
	cjUnXKDji7rmf8S8lOC89yTS+J7yn0sVxqUyOgSqxZmzO3m1zMnseXUM5cfeSFfY
	0PJPjW3aBoT7jwySnldBS5hhOwPfMX0ZQnOILqozJwfalknE3iff6R6d2qH79D68
	8MYQ/Q==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xrwyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:01:34 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7f653940ba4so5948623a34.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876094; x=1789480894; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O/mR5Kpg24q3UNKuC+L1bOVHegCCGwSaQQL7AVGDOXk=;
        b=XfXzmi2pc+KwNDP5yakq2X0rXEcfRuTeH4Iib1E0cskKDwp5OWRbOnbF/wX0IZ6k6P
         qu9ql+Ng/31BpdZIGBpeL3xraaoWLQb2RafHCMK5hc7/iCMYbeFlOUex3Wlvf56yBRvx
         YGRwbVVMQ9Q85ALYUypsg8Wt9P8h3E2yK156Ax0GuA6t9ElGRlw/SuhJEW9opo7I+cUe
         hrsKiX9x4jgtX9YthyXWjJzA6oaw+DlBIzkcVPYSYYkyFk+Xd5TkmagaLXdabAsNgz9+
         LpNiDIfsxLEdrLnv2dLx/TvuItHkrj2vpErQqv9fclJxQwZQCEB9Do1I5X/rfky+VoUf
         gJmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876094; x=1789480894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O/mR5Kpg24q3UNKuC+L1bOVHegCCGwSaQQL7AVGDOXk=;
        b=mxW6PECD9uXUIRtu+GH1YTWXLCeKApuuDGdae8S9i8Xo/Ti2Y5aaTNqgMbCf2ArpgU
         NiUryE+B6LwGgVc1yrgX0W6bsD7hunLIOL7pM8v2XdngBzRFtjCmskV3UyiG1zLtFm2S
         mp1AGBZi/llWuRxcIUDU2WzNLRaY0EtdrFQwIAeApDwZcNU9d94e/geOdaN4QIMHHLqu
         7M81HFJRlnlhAHUtdu3C0MihR162tlRyTQgJkeVSj1M+bqMyxX4yRwABKoVNyiDn/zfo
         xMb1BYyrMf7OPUzYZ7wBFF8eVmfJf+9fMD+VvXuxV72CeI3n8Jpau4xbt+tFAOnD41iW
         DJdQ==
X-Gm-Message-State: AFuF++nAck60NcOYofl2EAbyk7+TmkvgLrTNO3YmZ6EFQBbcPFsaDQO2
	IOu8ZheSzZnMt6rX3C9Sn/QzEGzvlPctBVes85NoYB406yqRRDpKO58wxmyQdVISpAq7Mlw5cb2
	Az3RvBtJvZS3K2F8QxF53tnfDGtg7QtLGT4EfZk9mN/5997HF4dvEWMdoX+A4y4LpY5oj
X-Gm-Gg: AYBFou0Fd543bdNXBG2KIWm/X/pTj82DlsZoRnpd6nRmSblBRov54AyGmuLLzUQIFSm
	KApBmBOMhuXpB8tydwEg6ca00LWgz1xNWs1sFG14NXBsnz0H7i191qU2+iXZxmwld+26M0mP7fR
	tTOyMA53602lQeVue80u6Ah83KoskyFTGcdOvdIb9T0R2z8VvnOTpKNQRUzR7AOCCezgXYYEuKj
	XRvTcU+OuPUeI3zIJA8rTrpYrFr2nlvGKV6H/NCoGDNpOIck59AqrFGSfP1CdUNao9wfMaPR5Vy
	aUZly5diTNboHww25jdQae42nBBfxRFVCGdXuc/hyl2s2UrvorTW6aDulQjzS+x7GsJq9pQwHxa
	3COu+S7bgj9EACYJtk+hZhVEYpkI=
X-Received: by 2002:a05:6820:1c9d:b0:6b1:c6df:868e with SMTP id 006d021491bc7-6b6fa3ddfd4mr17217610eaf.13.1788876093653;
        Tue, 08 Sep 2026 07:01:33 -0700 (PDT)
X-Received: by 2002:a05:6820:1c9d:b0:6b1:c6df:868e with SMTP id 006d021491bc7-6b6fa3ddfd4mr17217527eaf.13.1788876093064;
        Tue, 08 Sep 2026 07:01:33 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:32 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:30:57 +0530
Subject: [PATCH v4 4/9] phy: qualcomm: qmp-combo: Add hardware-specific DP
 PHY config fields
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-4-ff22e5150538@oss.qualcomm.com>
References: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
In-Reply-To: <20260908-glymur-phy-v3-v4-0-ff22e5150538@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=7393;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=s0NCoMqwgDTMHYa34sPnu4vrchO1ye5QcjKsdOKSeu8=;
 b=Ve9IPWcBWSyGHkN15hx2BYH/mmkCPVk8W/Osy0cyG33guvbaC+qh/d9P84Esqxkjs6Br8MOSH
 P6n/iMl4W2tAGV2FyQBSWwYsy/Hn1btUh/v9mcuHevbNRz71Hg1WaL2
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6aa0153e cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ewTIzfVZd68T06PS6vkA:9 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-ORIG-GUID: YJAR04xqDJWiz2zJxBxTzFkktUj2JqaL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX+Fm1r4CE+uKQ
 lNU5I/pU2uhCVdw3jot7eAcv/it1cK4AdZGswm6H6xjIEOeflKc4taGSOJ+S421m+Z2hgWtm2t/
 LdqDyQBeZLkTlnUiTpiJQvJIILeYDN1Q8/tH/8YDITxKNdNgWVFEdaHlYlP7kADeXxCsNns4kgh
 HBb4HSvjdZrEDyfqbDkrEe0/VaTTV/zL0DGh4k9TuIkrl51HRDcGJA+F1j6U1HeDB6QUK6q+n51
 s5cvdbBan/3unQFtTHrdeJ2HxtIypAaKpYrlLjE+QaJxoI3c2lVqcpHnSjWRmODQz0qcNQYGvmf
 Anf792NorrCd1oMnkY5N81rCSoxak5XK8M+aOj5SRPWAdQ05Kfxg9RBWiw7HeEcC+RvXK3/QlK+
 FYcS7q7poVsKTD9VIsszo7QnvJtumkx7KjEQ1HbU3HxVz7qSbwHB1u+EUDtKJJGcFgngRpkQ4/+
 xqN2TnZUmKQCRBPY+Pw==
X-Proofpoint-GUID: YJAR04xqDJWiz2zJxBxTzFkktUj2JqaL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX6gz40e3xXNCh
 adX6K6n2MbQ29rz/SR/feMcDn+nwz0eYbieiM2PFt4jUJ4LTpFNP9PC+J8SgzD7Z9ZHnMcS+LVx
 +dwQYDeipJftjmuIB8w28wvj+YA0jRw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080151

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Add dp_aux_cfg2, dp_phy_cfg1, and dp_mode_ignore_reverse fields to
qmp_phy_cfg to allow hardware-specific DP PHY register values to be
specified per-platform rather than hardcoded in the configure functions.

Define named constants QSERDES_DP_PHY_AUX_CFG2_V456/V8 and
QSERDES_DP_PHY_CFG1_V456/V8 for better readability and maintainability.

Populate the new fields in all existing DP PHY cfg structures:
- V456-based platforms (sar2130p, sc8180x, sc8280xp, x1e80100, sm8250,
  sm8350, sm8475, sm8550, sm8650, sm8750) use V456 constants
- Glymur (V8) uses V8 constants and sets dp_mode_ignore_reverse = true

Update qmp_combo_configure_dp_mode() to honor dp_mode_ignore_reverse,
so Glymur can bypass TypeC orientation-based lane reversal.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 44 ++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 16ccabd945f7..53fc1d1e8494 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -2478,6 +2478,14 @@ static const struct qmp_combo_lane_mapping dp_data_lanes[] = {
 
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
@@ -2541,6 +2549,15 @@ struct qmp_phy_cfg {
 	int (*calibrate_dp_phy)(struct qmp_combo *qmp);
 	void (*dp_aux_init)(struct qmp_combo *qmp);
 
+	/* DP PHY AUX_CFG2 register value (hardware-specific) */
+	unsigned int dp_aux_cfg2;
+
+	/* DP PHY CFG_1 register value (hardware-specific) */
+	unsigned int dp_phy_cfg1;
+
+	/* Set if DP mode configuration should ignore TypeC orientation */
+	bool dp_mode_ignore_reverse;
+
 	/* resets to be requested */
 	const char * const *reset_list;
 	int num_resets;
@@ -2780,6 +2797,8 @@ static const struct qmp_phy_cfg sar2130p_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -2916,6 +2935,8 @@ static const struct qmp_phy_cfg sc8180x_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -2962,6 +2983,8 @@ static const struct qmp_phy_cfg sc8280xp_usb43dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3007,6 +3030,8 @@ static const struct qmp_phy_cfg x1e80100_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3116,6 +3141,8 @@ static const struct qmp_phy_cfg sm8250_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3164,6 +3191,8 @@ static const struct qmp_phy_cfg sm8350_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.reset_list		= msm8996_usb3phy_reset_l,
 	.num_resets		= ARRAY_SIZE(msm8996_usb3phy_reset_l),
@@ -3211,6 +3240,8 @@ static const struct qmp_phy_cfg sm8475_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3256,6 +3287,8 @@ static const struct qmp_phy_cfg sm8550_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3301,6 +3334,8 @@ static const struct qmp_phy_cfg sm8650_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v6_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3346,6 +3381,8 @@ static const struct qmp_phy_cfg sm8750_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v3_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v4_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V456,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V456,
 
 	.regs			= qmp_v8_usb3phy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3391,6 +3428,9 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
+	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V8,
+	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V8,
+	.dp_mode_ignore_reverse	= true,
 
 	.regs			= qmp_v8_n3_usb43dpphy_regs_layout,
 	.reset_list		= msm8996_usb3phy_reset_l,
@@ -3539,7 +3579,9 @@ static void qmp_v3_configure_dp_tx(struct qmp_combo *qmp)
 
 static bool qmp_combo_configure_dp_mode(struct qmp_combo *qmp)
 {
-	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE);
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	bool reverse = (qmp->orientation == TYPEC_ORIENTATION_REVERSE) &&
+		       !cfg->dp_mode_ignore_reverse;
 	const struct phy_configure_opts_dp *dp_opts = &qmp->dp_opts;
 	u32 val;
 

-- 
2.34.1

