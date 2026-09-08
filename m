Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B325293F2
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 14:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788876118; cv=none; b=DquXB7AsOX9QQzAI0qcbsvfIgnQ3CDYE5Wq1eaAv0ayQuG/jbTkaez842SV6MwMzSdfJ8PH/ya2DcmMAxXlmyIfil4hWUpF7M33u/cWEB/B4xHpFfvb5FLFWhdbV1sYgSz9TfAP76sFSpGxZH0R6G32RpM6o3fscgCuvexMPuiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788876118; c=relaxed/simple;
	bh=R2QDIqT9C7i7fFeEPAzuPGlnJk4fdpwgemLFW5PRnBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U81Ry/p+EjgP39GVKC9vymHWZ8jbMA/qTVijTKyWHfmvMvUg3uwrFbiE/M3Y8Y1afvSwx+8QN+mHBfgEk5OAE78mVZ9Abzvg5rm5ct/oJnH6im1gfGLuup5vxpOVCOr9+cdjEG+bGcTWiVZaFLUyvCHBw+C0FwqnngaKl5WW4y0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GJzmJyVU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eE4Pdv4Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GJzmJyVU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eE4Pdv4Z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688D1hWf2411891
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 14:01:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0H4ga+O28Y2C4Z6KR4aEEY2DdISay7CfVr4Z+WZcc+Y=; b=GJzmJyVUlpGL4jEx
	79gHXVFYV+K4kTu3PeXSfyP+qiToBAncj1eS8Wm6zldcuYKdH92L4iev1nue+LUZ
	dMKImHkoNcOZlqZ6uNye97J7T6DyabsAjh+aQSJreEqaoHZPn4OYMWy0NoSbm9yh
	zD99DFfcu6HGFTmKvBXtf+uEBs7kiF561PhmDbmf2+VlP6ET8Nr5toKzGu9ssQ2B
	jWXjSYJ+ADvFvkhCjARb9ilC65DMnIkApcGpBZeo0IpWJ8hvY1vOFMQxYJDOpNQK
	Mg+X08KeoDfegIXbDjnFkFLw11eqc18lK7/FaoSME26QwpM7ypkpAR0eUa/O33TJ
	3xb7xQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjjvug8vv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 14:01:41 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-455ad408573so7375208fac.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 07:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788876101; x=1789480901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0H4ga+O28Y2C4Z6KR4aEEY2DdISay7CfVr4Z+WZcc+Y=;
        b=eE4Pdv4ZUoP/jX7J5oGeTUUBWzKdfPUbiqJwtP4JZ/P7ieMdmHLb99ZaaagueQYZKU
         qFKeW+PBAfL2XXm7oHE2h/fetGf3X14+96a+VZzre3QcpMByWsnRuhyoqlM2ya/j3gav
         Y3OjsGh/rB6NBvFLEmmy887cyFWRSLX0sZf5W6EbAV4kaq3YjeEBMP8NSLX/MFvVaJ4t
         v0jNH5SVU/gd6+AtnIibX8ItyqFL0fz2ZUfdu1XhC33R9eBO4UpstHEA2CeqSy72CPfC
         K7TmUYpHatsITXZAvxGZiTvini2HqKnEGth4YUALD9X+RIc2+FIRCGQ5tByiqxYSwOXw
         932w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788876101; x=1789480901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0H4ga+O28Y2C4Z6KR4aEEY2DdISay7CfVr4Z+WZcc+Y=;
        b=K2nK05P+Czchy9OhS8vnwhXXEA80dHVK1/T2JtbF/x21j+RCRa9Oxe+YtZ2UiHGVgh
         z/DDU6QaE7vkqDcP8LRgH/Me/5FSzvbs6xK94vlLsojbcuHRQUClONW+sHuoEDNmwQio
         yJG7WJQaXWZs+OjzWlKpnJOc1Kjw+wSmIQRKR20iFY+q+TzN+XBfGf55pwW1v4i7OZls
         j0gFGT1kXEon9PWsRQusRey13t0p+V1U4hLW8yU4JOpxF0rkeiU6oFrfH+/DjGkDLbP1
         y5fLDcrumbu/5x682LFLLBYJ/iK07CALkcaB1M+W+/DMXzZwWxyNXHPrDmBpmjTjihbz
         NS0w==
X-Gm-Message-State: AFuF++nIYRyR/0cHA/UbN34eFe10JPVXuVsm6NbLT5iDj7h8a9w9JB/Q
	2eJnVKInpLVrqcx4fhdlgyYqPEPQs+uS82eRsONWxQh3hv84ryzEMRnL7NNQYYHtT3npPSgE2WP
	+vtFnRZbYBiVoC4iMkGAYS++OJXcIkw7MUu7q2CS9gq7t/3e3R0YsF1XTadgpRBUOsJZy
X-Gm-Gg: AYBFou1Z24Wcv3rvpMf0Q3XKk0C4APPNl/9/UyLnIuxbfjQHFsFv1wqHi3STdsKSPw4
	lis2LT1E0roqxxF0KwjUD4dMGvHMerInexCZFI1OCaMhwlDyVp/v/EetFLN2snDyQoIC+0ajlxD
	6nN9UeIhkdQY3VwGBZ0AUCV+JT70lqI4zexwrTN0Qq3nsf7leUDhCNh6QmJ0GMi4kEZATpYL+Li
	2geVRLGI2rFTwL7h7F+ihXVUbHGNoS3LSnWTxV7mkwgvBdZtj9GEcAHu0/oNHVMGDkmJUZkySsi
	t7OHybt6tMaD6k5E6Y5xpNutHspYG3ry3cl9tIdXxzd8FoeVe2HNu5KXA9V2M/15vwxsTfopqgk
	or98TeZE2ztQRpuUiuP/JM4GmxcE=
X-Received: by 2002:a05:6820:1888:b0:6b7:46fc:1cb with SMTP id 006d021491bc7-6b746fc0236mr13541417eaf.42.1788876100943;
        Tue, 08 Sep 2026 07:01:40 -0700 (PDT)
X-Received: by 2002:a05:6820:1888:b0:6b7:46fc:1cb with SMTP id 006d021491bc7-6b746fc0236mr13541350eaf.42.1788876100350;
        Tue, 08 Sep 2026 07:01:40 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339af25062sm57506667eec.16.2026.09.08.07.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:01:39 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 19:30:59 +0530
Subject: [PATCH v4 6/9] phy: qualcomm: qmp-combo: Extract common DP PHY
 init sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-glymur-phy-v3-v4-6-ff22e5150538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788876071; l=5351;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=/0W1HtyMzJZnHCI/4jyU/mPASbtzcORTNRg7Vqo80KY=;
 b=zI0zk9ihaXQ/NdfHEw/7YXRj3HXtc9jB7bjKbQ0PfjLjV8iQrUNtObadGAiTNVjZ3zNCbX49W
 ASK0mw1Ad67BPsH+iDUDSq4/KHc1X48cqx2FC2WCkqTD6aAUN9sInP8
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-GUID: TZ2PdfQh2lYzv3K0EUaOP7Ho-g-toe-R
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX9cdmCGAfst6s
 01fwreiI1GNmjHL/eU9bUJd9+2SWunx1IPPQWsxQMFjLGHy+YhYUL9RXN9E2JUOS3nMtXSyY/mW
 ep8NAitM0TmtRQse7r4rJ0XH82fDsCc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE1MSBTYWx0ZWRfX4Lsp0BrvorFb
 L2PZZoVbzNk9wCVYrmjurfFTVfUiEJKHfRsR8drY3NrSk8JsJfHMGJ/NDNQabdAGpEsYC6karAR
 H6cieoY7o+rW5dGJMAwNzvusPTusMHdOtkq3qz+nODm6wF1ApH1j91AUFzfEAJ17KI8QIPXWMy8
 GsqPdfdI28igNGehG8fEzRq1ZL+pRgXP9erPWIU407RSwwWnyLOrKvzGyc16YUjEOu4CtL4jh/t
 uUyi6eqQq2T6EDeRZ+IfquoQnQRl8B945WW1ZzD1A3qTm28r8IrxuzRZhLZw4E9379W7a/HDrRV
 mJOExy2AWikzjFAiyq+3S+mcydLdrT2qqtXiT3C5odhHWoiRIJPxRxMJcTxR+ZociDcDeEoEVrq
 QzKQwztd93B93sGSLhVhOxzxj1qQXA==
X-Authority-Analysis: v=2.4 cv=X8hi7mTe c=1 sm=1 tr=0 ts=6aa01545 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WQ39YxX6NF7xrdOXP0YA:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-ORIG-GUID: TZ2PdfQh2lYzv3K0EUaOP7Ho-g-toe-R
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2606150000 definitions=main-2609080151

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Extract the common DP PHY initialization sequence shared between
qmp_v456_configure_dp_phy() and qmp_v8_configure_dp_phy() into a new
qmp_combo_configure_dp_phy_common() function.

The common sequence covers:
- Validation that dp_aux_cfg2 is configured for the platform
- Writing dp_phy_cfg1 and dp_aux_cfg2 hardware-specific register values
- Calling configure_dp_mode() for TypeC lane orientation
- Programming AUX_CFG1, TX lane control registers
- Invoking configure_dp_clocks() callback
- PHY_CFG reset/enable sequence
- Polling COM_C_READY_STATUS and COM_CMN_STATUS for PLL lock

Refactor qmp_v456_configure_dp_phy() to call the common function,
removing the duplicated initialization code. Update
qmp_v8_configure_dp_phy() to call qmp_combo_configure_dp_phy_common()
directly instead of going through qmp_v456_configure_dp_phy().

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 99 ++++++++++++++++++-------------
 1 file changed, 59 insertions(+), 40 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 0ec382aebe2b..79006469f3d4 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3459,6 +3459,7 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
+
 	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V8,
 	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V8,
 	.dp_mode_ignore_reverse	= true,
@@ -3766,6 +3767,62 @@ static void qmp_v4_dp_aux_init(struct qmp_combo *qmp)
 	       qmp->dp_dp_phy + QSERDES_V4_DP_PHY_AUX_INTERRUPT_MASK);
 }
 
+static int qmp_combo_configure_dp_phy_common(struct qmp_combo *qmp)
+{
+	const struct qmp_phy_cfg *cfg = qmp->cfg;
+	u32 status;
+	int ret;
+
+	if (!cfg->dp_aux_cfg2) {
+		dev_err(qmp->dev, "DP AUX CFG2 value not configured\n");
+		return -EINVAL;
+	}
+
+	writel(cfg->dp_phy_cfg1, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
+
+	qmp_combo_configure_dp_mode(qmp);
+
+	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
+	writel(cfg->dp_aux_cfg2, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
+
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
+
+	ret = qmp->cfg->configure_dp_clocks(qmp);
+	if (ret)
+		return ret;
+
+	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
+
+	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
+
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000))
+		return -ETIMEDOUT;
+
+	return 0;
+}
+
 static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -3866,48 +3923,10 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
 	u32 status;
 	int ret;
 
-	writel(0x0f, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG_1);
-
-	qmp_combo_configure_dp_mode(qmp);
-
-	writel(0x13, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG1);
-	writel(0xa4, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
-
-	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX0_TX1_LANE_CTL);
-	writel(0x05, qmp->dp_dp_phy + QSERDES_V4_DP_PHY_TX2_TX3_LANE_CTL);
-
-	ret = qmp->cfg->configure_dp_clocks(qmp);
+	ret = qmp_combo_configure_dp_phy_common(qmp);
 	if (ret)
 		return ret;
 
-	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-	writel(0x05, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-	writel(0x09, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
-
-	writel(0x20, qmp->dp_serdes + cfg->regs[QPHY_COM_RESETSM_CNTRL]);
-
-	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
-			status,
-			((status & BIT(0)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
-	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
-			status,
-			((status & BIT(0)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
-	if (readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
-			status,
-			((status & BIT(1)) > 0),
-			500,
-			10000))
-		return -ETIMEDOUT;
-
 	writel(0x19, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
 
 	if (readl_poll_timeout(qmp->dp_dp_phy + cfg->regs[QPHY_DP_PHY_STATUS],
@@ -3999,7 +4018,7 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
 	u32 status;
 	int ret;
 
-	ret = qmp_v456_configure_dp_phy(qmp);
+	ret = qmp_combo_configure_dp_phy_common(qmp);
 	if (ret < 0)
 		return ret;
 

-- 
2.34.1

