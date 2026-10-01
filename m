Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987343EF0DC
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 09:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847314; cv=none; b=d9icc4fEQDWylav3n/m0A6j7BCT86w1UG/U6fKtJc2vagOrNKE0LyzCosPybF5Le4izzmL8uAF9DG1CCETS8fF+8YkiN9yxfTFxeXa7IETiBGB+4Q18exZ2jx3XELNK9Q4nQb4nhcvYdj2u3Dc6cRHtarYDrQOXg07FnpLBQg1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847314; c=relaxed/simple;
	bh=cZAzsntgE673Ciai3+/Kek2CZGPOx+IfMjnPcEEylGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cfBIWzi9wTjAILA3vlL7xBRLOllGhQkh154a3aTCTXT2WUnUy19UnhK4RFECnyDg4vBFZyqetRMOFyl7HMDNDNdjYyYtSJutDDxTbXTjq0o4tyHVypDjYe+AjF1TWcTKgK9xXXLAFwe15LM9oAX+nj8gPqhOmKEHfCE8qxzVw/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bml1RaLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=esAYte+s; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bml1RaLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="esAYte+s"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xf1M2337464
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 09:35:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PI5DQPrt/oRP+xZMPVMdSRsYmdsy6agxUHeYTWEOomg=; b=Bml1RaLcsPVI58xg
	9joMVOL8V28gF/c1ldNwD1P4DfxEgZpz58GR/W4jSnSPSgwnyT1kQPZd7B5K6COY
	gpS1tb9BYLa3xbWERyRusx+zvXv0bpv5FPr34XALVI6JxQ1Ft2ogPeCn1x+BFJ41
	nWSR/MHNaMqAaOxYP27UaTegq94lL77CNycbFf7P8rp+i97gEE/gT6Kh7NexnIQO
	VmdvwgkUtOuuFmQfqLrTpq2gjsTrKqFTZ76nhb0dDSbbWRloO6B3XZ8OPoavBTCg
	+MGVBBYTQncA+PbjfRlvj+XMtarJoXxnxvXceeCWlaN2Nk56++BZFEv3PRS1eUhl
	Sas+qw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h14n243ak-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 09:35:11 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so3937179a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 02:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847310; x=1791452110; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PI5DQPrt/oRP+xZMPVMdSRsYmdsy6agxUHeYTWEOomg=;
        b=esAYte+s+MI2rZJUs0pIiNs4GTsHhfEnrHk0ZlVog7BJfYTIBhxX+Os3Pu1ku43Bg7
         BIR8t4H899VE/8jMCAm2Hiz3q3ViIp0luQBJmUZLqL9YGP5m1fetbTKOy0u9/pC2x23d
         DGx7BOsoLc/lkIiZ1JTPnnOZxTAN3w1XpCqYC/Yjdnes4BLfpdJnQhyNNGmsJ7InArpT
         lCxiXfGpRj5CU7JhS2QjdujxNPr9IKktrOCyfjqhvvKGxQ8QzmYxZ6HA8gkpFXHoYzJ5
         AvdohoppeU8jjtMaDEas2/eeS9a7vgeLjwLkHGXXo1j/q+BypViZ3y0Hr/vVQjf0eMYJ
         KZ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847310; x=1791452110;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PI5DQPrt/oRP+xZMPVMdSRsYmdsy6agxUHeYTWEOomg=;
        b=LP2HpZgrFbx4Wnved32XfCP7sAy+BjghsGsumedo6+kJXCV1pNJ0eNKn8/z2c0NgxJ
         +wkC9fJQIkirdWxtMRpM7HTdkt1Mj9i6IGvue5REgfFbidjYG7uTV75vZEowHzs03vqY
         P8lFec4NgsAvKfwdXNXQK6hUMjLpV+mRVt2kJeF2cTw/FVHtqgBUVA8qBc7u3PGMHM6l
         5NDPiJ1aZbnqy64+NydeCC6G0hIsRXSCXX9j1JbGm/vkAalGZXsTDhl7oAOkKvuqPmqr
         p9cwACdr8kRIzTC5lzLT+M+q78wPchJwk9f6BBp8pNC831OBSQ91esWiurFz8lrJ4r/S
         byNA==
X-Gm-Message-State: AFuF++n9HQlQbqH0iaOkWax9tq4QC+yDAJ/supekVyArkHsm0YalZFA8
	rQ5rNNVitlhf99ELceJecRGmRS7Gqby2A2NwoRAZj+tEinzr1NY/vgKGuajJbfD5+Oier1+Io3e
	VViBajlGyqOw/r2kHwLk8ddwEcTEdJMn2HbBMpdx54/GDxNYOb3Wb2DtZz9By6g2oA/2o
X-Gm-Gg: AYBFou3k80rdwBZzrM8Xhb1bMsV28y3Apm/ok/cQSgVk82o04p4sE56mMeWYidiMnCB
	sewsqv8Sv6OMn+1loB4bR1FEqaZWVzkovNpIrxdy4MXODy1cMx64iMs8SqFxAznWrSBVW9Axv4v
	nzFxLop1dVrFMAynncAAmv83KQ8Wk4yXYRVkLDFjkqbJUnVBBMWbGbNSoKk5s5/fY6yXrsmFi43
	usX6HiSZ9arHaFJ6Io0fGDfxSd+l7scSISVXxdpPg4t3ZNnI3o9Eg1Aw6mB6eOutj+XhONuJ418
	7Ml6V8TS1LpFZpa1HMiHKyVq1kLV3o2uww7Wjt76YafXTye76udmcWrrLdbnvOqXH9c0o53Cp7b
	k3CBFo53moghxI9qBrLvNQdv+uKA=
X-Received: by 2002:a05:6a21:32a2:b0:3dd:a197:735c with SMTP id adf61e73a8af0-3de9e84e31cmr3888802637.53.1790847310400;
        Thu, 01 Oct 2026 02:35:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:32a2:b0:3dd:a197:735c with SMTP id adf61e73a8af0-3de9e84e31cmr3888770637.53.1790847309893;
        Thu, 01 Oct 2026 02:35:09 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:09 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:20 +0530
Subject: [PATCH v5 03/11] phy: qualcomm: qmp-combo: Update link rate
 specific DP PHY tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-3-3848c2615d5a@oss.qualcomm.com>
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
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=8118;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=iOUaDDtCSeyW1F94wi9QqpR/wZVtpMc/oViGj8eDNq8=;
 b=kyjNrSnLu06QskVcUn80MTFUO/4aZfzHQ2KXzkFCUzExPY3JvtmM3L6cCbgA+jRG1pL9fkBo6
 /i7ohY6jXE2BALEl0qWgLuzh4MFNwCrELRD0OJLVQyR76zlnyuyUxbO
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=Gr3XaU1C c=1 sm=1 tr=0 ts=6abe294f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=pfGozU-De2Ei0FjDxxIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfXwfJCXXS4UnyN
 vEg5zA4Tpiim2k9qqBQDSROt154HkbeGehLHWAhVU79tKJpN+/q409tN2saH4odpvq5IZcueHgX
 kFIV23YbJsuRciHOA5MngDdLB5G+RKI=
X-Proofpoint-GUID: Rr5We6a6MEaAHUCclbRKJ-2gglBtu14v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX055UFcmdV5j5
 K51UFphEz05CWt26SsrC9dhv2hW+V/CqMa6W9uRgdhG7Y5X3p1dTgiP7JPEkTKhqtVIdp3U3gop
 Ji0oTnmssfjoGTJKwkHv0b/sikbwICO773jmCQ/zT8BMkWjRW1wHSWuTKjVMpu8NMrJBDN9CHmS
 JQ/Ra/OU78Qpynv5d+5A+YyeIHbYWzEPDXL5BqTeU8XF2WydcbySyNcCCFY8dyfWxRVDFuM2LV/
 AqyYwLLwKCcdygAuM8N9vQCVmdY0dKfe3N2DsJM5eTCPg+6U7XirS2kU10FkVGguvC1fLvlOMn3
 MNg1sUmGJmaBKxXqLOD43kVZsSnmTEuEMC6NiiDl5H0mWp15DLCRfhMrEUbT6yPnU8GV7FhPnFz
 TGEj9qvyi6bbUvMKV86n/hBNRnd0UErj23MJqzHpyMrLBHjAZd+fxjwJrHPkLZyIpFBKi4T+DGO
 CxB2QSiNeXrx9xpz6Kg==
X-Proofpoint-ORIG-GUID: Rr5We6a6MEaAHUCclbRKJ-2gglBtu14v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update DP PHY initialization tables for all link rates (RBR, HBR,
HBR2, HBR3) with corrected VCO calibration codes, lock compare
values, SSC step sizes, clock forward config, and bias enable
settings for proper PLL programming across different data rates.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Fixes: d10736db98d2 ("phy: qualcomm: qmp-combo: Add DP offsets and settings for Glymur platforms")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 43 +++++++++++++++++--------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 8ae8b4e531bc..b672adb33fc5 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1754,11 +1754,12 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl_hbr3[] = {
 
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
@@ -1766,16 +1767,17 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_rbr[] = {
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
@@ -1792,7 +1794,8 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x03),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0xf6),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x0),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x10),
@@ -1802,9 +1805,9 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
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
@@ -1812,8 +1815,8 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr2[] = {
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_HSCLK_SEL_1, 0x02),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x63),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE1_MODE0, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_BIN_VCOCAL_CMP_CODE2_MODE0, 0x25),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE1_MODE0, 0x5b),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
@@ -1821,7 +1824,7 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
 
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x17),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP1_MODE0, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP2_MODE0, 0x15),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DEC_START_MODE0, 0x4f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
@@ -1840,19 +1843,19 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl_hbr3[] = {
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

