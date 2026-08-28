Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC3D37187C
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910215; cv=none; b=N8cHSTkPhUnxajyQSWSZyii8qz/VeCwa3ttFc5WiBUX8QoQurVLCnQOMUjoy60Uwe7Y/BRZWiSHvj0t2gMd+lGgkUpew9MKX83xUfmRU6YkCcEMGQ1zEHz8fHbmk0AH/jdF4hsfI2KDaa/oNldl7Xm7qF64k3Hmkwae1gsNFY9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910215; c=relaxed/simple;
	bh=WMHDVTbxnHcY7jpNQFK2ICk9Q4zRiB7mItieGHj8BMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O4qfX2NJ1F5aT9vf50e46Ryc7PSDBYPEopZSWU3B4odxoSgoYaWe51MtQ7l5wlGbAk9IpOVRf7ybbXuMNGoqnt9o6O6jbug1NRR/uYmiADLsgv5Lk5v2jclyEmWC8pxoxgCv/p3t53LaQZOCWGQ/S/7uh23Rhx1UIUEKc7dX+Ys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=a2N4q/zp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PzP/BOcu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="a2N4q/zp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PzP/BOcu"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S672DU1043554
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:43:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QmuSFqdLsFD/wTtT3A8l6Ep7joe4hsvUphR/5VZUX3o=; b=a2N4q/zpT58XNusc
	j5a5/tK2ndoHTSzFYdIzf+aCG0n2mFl6P9ACapHePx+QiKMQ76YkZy4scIfOqI4p
	rD9wOOYz7d9Nlp1smBnfD6/IPslQ0kHh+uDJncv1OKdDhR01LqXxAwIKpa2n4QRJ
	rckAya+9TfQ+Qm3lTqrDjnh0sBuqXQu8Wj7nmeOBFGbw62EzurND0+wwBg6x3frI
	EIoYMG9aVJs0/kUfHWN+3BR0bqJNbQ+d/hHcR1rFh4uJmLCVmyimBI/lxDpoefoI
	tvHwRkLflsRP3nxN0DOAQ6dnMYnEjACx/zL/5AKhEkVbzCOo8UuxEaH6PvU8kRu/
	eie1sQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gatnc3944-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:43:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e475f83a2so1704960a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 02:43:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787910212; x=1788515012; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QmuSFqdLsFD/wTtT3A8l6Ep7joe4hsvUphR/5VZUX3o=;
        b=PzP/BOcur6QNY6fBNAO6XgSwlWNrIxVs5eltQCe9vHNcEAMtlUYIuEp/Sf7PBNHeGz
         fstFqixwEt51y6ym6/3tXIDAyH4yNkHS/cBS0KQVMlJrYZJ+V0BDmuk1YRrq69rNnnxt
         U+Oc++VIu69baSkpg2QOFF8uX0BPmcf1eiMnp2Y7qvneY/F0DtaRgF3jzKraBxYpdKMq
         WDlCcE7l0wJ6IUuAD+jOJajxv8uueJvQ9biR82pJdCCqwVGL6CetQ9qLg6QytR2dwcKw
         oVvkb9P9sMu6FhisKf+ZYGnAhrDsXrTZhokZCheZAuWdvrItSazrkdN9fjDTJ8cw+M3C
         LPlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910212; x=1788515012;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QmuSFqdLsFD/wTtT3A8l6Ep7joe4hsvUphR/5VZUX3o=;
        b=JJGZmbl91ILmzgRKT4yBI0PsfKdLiwlQAqy+2WipfVYUnmXEZ4enKyeJdnZ5Gz+uzX
         BjSJXLchFAok1bLnOz4pfOhFn4GXV5CkydIJXt4SpnsnIxPFvgj9McmEd1cdAmDpimNX
         Gi+PMWXCoVGgHjLdesZEAaSVHNt22hhOklW/zrIHkCyTZNPEgaxef4ItJEvqNwq61qDW
         i4a5Tid2dndBhItoW6/pc6dJm7+BkLuwkk6kYDQ89RTEEMkmFmf9pZd6DuCzFfDXUQQ4
         WK2OwtIqfFi/PzqL38tEs30o39W7W/pIXNSBaSWfV9NEh8PE9Oo1Pb+Q1omwvWnQAF6q
         5SkA==
X-Gm-Message-State: AFuF++m0w3DhPn/pIubk3UwxbHraKRzTShpDFB6yfpyouidQD+SWKzMR
	JUEwwYuSL/fD/yf4iXLVG9xiGxeVbBJejanhlH0aykQomvaYFc8Gpc/7WmhP6D9qAKudeQ4HPY9
	SLxYMlGfTmFc8rAXB7jF+zqPc+ZQl85AKgDPeHgyNe8Mm3tWENPySpnY30gI+hPajSurX
X-Gm-Gg: AR+sD11J30ZyBgvINR2G3D1afmVtpYGdg8h5CH0WyBWtL3EKTjb+6Y8PbUYI6Kgh5oi
	5v/nE2J+rG4nXFTxPnbEVLYjGmHmNLH0Vfi53kmBiFOTADduLrmEhGas0DUWCmmP7x4dAD/Cf2u
	kuinrl6Q88OoMejhNbO4T0LNLW3BDOsA6L/4dK8AsWlTnGYaIYsoxx2JIGZ0YaoIWVrtCWCDVR2
	JoVunNhAVULS/x12SJNBRZ2vmcPn9H9TQvc1jx0/HUj3t5eJFr0EQe6o+8dbR4DmrvT/MW+6emn
	/o+aQ/4QbyBmvFnsITf5U8oHBdz01ks45r7BA5HLksb3oozuFtVF/rAXyARilbwBaQa+4Vd683y
	OJuTe1P1BXIljKPCcGKafR47I6ro=
X-Received: by 2002:a17:90b:5747:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-396d0ebd946mr11898007a91.10.1787910212381;
        Fri, 28 Aug 2026 02:43:32 -0700 (PDT)
X-Received: by 2002:a17:90b:5747:b0:393:1d92:db5 with SMTP id 98e67ed59e1d1-396d0ebd946mr11897907a91.10.1787910211849;
        Fri, 28 Aug 2026 02:43:31 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm4166331eec.22.2026.08.28.02.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:43:31 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:13:15 +0530
Subject: [PATCH v3 3/4] phy: qualcomm: qmp-combo: Update link rate specific
 DP PHY tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-glymur-phy-v3-v3-3-8e73ce7c4636@oss.qualcomm.com>
References: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
In-Reply-To: <20260828-glymur-phy-v3-v3-0-8e73ce7c4636@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787910197; l=7830;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=sq0tx9rey2c1GrW2EbthwHAupdro/sU3xtkkkTsZcw8=;
 b=2R2DI+Qo40s9Fh2XPYdDS+yIGnJx3ngQxX0k+aeT/6bszgBc5g2xqYsbXETlgNdgz8KlIFBCx
 BR5hiMuXGvMBSGkcDaIZJZcAwwfKenF/46Ip2Bx/nXJR2iSRNq4rQ7L
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfXxzL+g7mf6Wvi
 eSDBi0QCE3nVx3t7QDImB4ZbFw2qo8CfTncN7SgrdBLyc9SjiRvmu3zAQjvL+rVJhh2tZJGl6Ur
 uM0Uf2TNcHhnQSY3InYYARFUTLbsNN0+ivcgCY2cEsi9HDmPDp5J9v9MbFQGOcuEhhIXPq/TyR0
 d2/yMExpmHZKXy8TTf+1VGz0aCc2Jocl0nTSTNlZtZ50CVvXrV/aMdBJ+luQvnWNZmY29/ld9n+
 qlJoeVARskb2PRII2O+iJcv71k/bCnbBJMHG05FSITrpypFIpFVNvWEWg5j3ub7hOK/R5NrubkT
 NpNz/ox0EzsYW9GS585kUnyV7grmB6aXK4nfOJRrWK/sOqmfPwRypYb6CWlafbA0DxqZ1L/I6uP
 FNEwnPtZ3gfe9PSuOcHbp9BNzNks7a0kWGwy9hphrP8bMyHvU0qPQ6/vJaPjBpE3L71tCOMiFRW
 gPA9xCDMMc/9osBYeHg==
X-Proofpoint-ORIG-GUID: 7opKlEZBZvfpmXzapUzrrkJqHgmvPT4N
X-Authority-Analysis: v=2.4 cv=HfUkiCE8 c=1 sm=1 tr=0 ts=6a915845 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zspsGGxiltJpwzvJUFIA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX/dOzwV2wMyxG
 yZMi9eBTP2MMf2z2BTzlf7YP7eJPi9WsIPfaFAhFy2aySA3hsHl20HHQ4+j7K6eZ9cDKTnr3lbk
 4MQIyn20RT9kBlVck0TuLAA76hLBWoM=
X-Proofpoint-GUID: 7opKlEZBZvfpmXzapUzrrkJqHgmvPT4N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280082

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update DP PHY initialization tables for all link rates (RBR, HBR,
HBR2, HBR3) with corrected VCO calibration codes, lock compare
values, SSC step sizes, clock forward config, and bias enable
settings for proper PLL programming across different data rates.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 43 +++++++++++++++++--------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index b2ffc20e8f6a..16ccabd945f7 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1746,11 +1746,12 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl_hbr3[] = {
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x05),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x7a),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x8d),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x27),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x83),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x37),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x54),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x06),
@@ -1758,16 +1759,17 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_rbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xa4),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xa7),
 };
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x04),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x21),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xf6),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x18),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x08),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x46),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START2_MODE0, 0x00),
@@ -1784,7 +1786,8 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x03),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xf6),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x10),
@@ -1794,9 +1797,9 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START3_MODE0, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE1_MODE0, 0xae),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE2_MODE0, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xbf),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x1c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0xab),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x17),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_RESETSM_CNTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x03),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
@@ -1804,8 +1807,8 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x63),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x25),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x5b),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
@@ -1813,7 +1816,7 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
 
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x15),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x4f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
@@ -1832,19 +1835,19 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYS_CLK_CTRL, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x15),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x30),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_FWD_CONFIG_1, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIAS_EN_CLKBUFLR_EN, 0x17),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD3, 0x05),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD1, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_HSCLK_SEL_1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0x84),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_IP_CTRL_AND_DP_SEL, 0x87),
 };
 
 static const struct qmp_phy_init_tbl sc8280xp_usb43dp_serdes_tbl[] = {

-- 
2.34.1

