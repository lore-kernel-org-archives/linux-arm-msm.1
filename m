Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78C23AE188
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787910212; cv=none; b=mQuCDrOdrCrnFUhJ/fIwDRN5VYXiOE2j+RTOPI2IxgXMpHpHh2RpVy32GUVBzOSW+zJabv+Vjx4NFzIyRwpHQmXaGGrj5Fb2OApdsMVXwBSQ2L/jSxzfDeCBNF4mfgThIbGlMhAGHUB+mqz17cFkzn8EpR3c5RHSQ3UbCk/gsp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787910212; c=relaxed/simple;
	bh=ucJc3nW/i87dT+xdDkMa1ze6p3xJaqVP7bSjiVj2z6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u1KzQjc0Qja8eMlPbmAzvGJV/D7BAS2qPszepSVzcUJYUv/OlKlhCTCSXVkGTuemVh3yEEJU3MV1eoorMsqZ0LIG84kYw1svCCnz1RXmSjHhoGf0hS4y0VyBUMnMnUUcJkwBPwXvpyHrlK76r2zGtRkyZ+dy5W6IZZEg2OWm6m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ExleYb/M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H011b07Q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ExleYb/M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H011b07Q"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S66olA2196966
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/qRlFcmSygKgPY14wysfKaVSc27D8NeNUpgGaEDe8BE=; b=ExleYb/MbLDVEBHd
	WBAq+KZgDyhLu1OJ3zS12TWdaCVgOOVnVv9mw+lgIOBv5LSMqyYdQeh1Qe+fsD3K
	B1GeiYG23GlZZK3YdoJDgoCFbYt4jERAacS61ow+QCvkB7OK2hOAJ3It/FiKiqMR
	lkqsXhdHZObKyiIkSQwOQm/dXqF7Yjs9FUZbSL0+TGclGpZhtZysZmOArQEOXE8C
	nhnewWr3qWFUuELIy9lV0jgLu6izHfjJjPRM3go+W41gvJDQrxIFsZ28wnK9Lzr3
	mef++YY1O6PG2iAr3ouuDABwWWXLPQkLMyjNxRVp+dxaHd6XqPJoyWZN238kIzmu
	SWpiLw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb3mxs47r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 09:43:29 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so10820195ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 02:43:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787910209; x=1788515009; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/qRlFcmSygKgPY14wysfKaVSc27D8NeNUpgGaEDe8BE=;
        b=H011b07Q/Ns8xdkoS738fXU+sFNekAz9IDGazl81rhaALKjXIjS/e0rk+U5xok4TgC
         yUPrZStYtAKIhcIBneqjUctRSNhFLEXkeVejywH5KEdUWkUHnB1CueyoargLsMAgFU5x
         cTcmMWVzBaOFBVChSXzn9cCj8VCpy/uVPzaqJsWu7f+NviRHKF88tFlB9pIkT+QUpCT8
         vxf+Uea5QRbSZwKtmmlAXVKqb+noG3gJv015y9r327U2mIPp2V/DxgUfKMXW2IyHIhXv
         swRg8dS229szx+OmH/ZF0SXrFTh3emM+lLVRYEEgSTlA0HwwBPFKq7FKNuDpyk2sAV0m
         mOTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787910209; x=1788515009;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/qRlFcmSygKgPY14wysfKaVSc27D8NeNUpgGaEDe8BE=;
        b=DWNR10PfsgGx3YOsylsOf89IXeao5PXz6h0/XmkaQq+zliQUjlPgx1/Qf+cCa3BCt9
         QRr3vUPGlTSLrQpXXvi1fFdaRbv6z6HxYuFpUSwqa1X6jDcrAAa5eQUOzp+V3TEH2kfn
         whfAnvk0iEBurwlxZiTQzEMjEXC+7tE6KXzDn6vVXUfEIk+dZOZEoBZyxUQI1on5xHgi
         /9WlUkKe009yvKXA13RAL4VHyHGESKNus0h+4aLXuLbqHcROk3noYji9dAVziUHufJPx
         t8WonVk+6xz70i9Rihg0pp4u6arYvEBEwCvsewERaziM/KKH79gv9QxWbJbvFFeYQps9
         Nkkg==
X-Gm-Message-State: AFuF++kv2S/OWcgIAuCu89AgF+YJqH+HN4+ywH6DpYa96P5X4nmiws+L
	TLKGGriL0fs3YZHtW5HK2fQdXFa3h39knf8bePWogCBFLco7X+t/ePaeNpkJZDA54LKlsc7wPyM
	M5nwVh2jteXDAfwYlsr/5ftB/2t+E+UvCEkCpGA5w1JsBEj9hZgbt77VnH7NqHi5qkoIxULJk9c
	Bw
X-Gm-Gg: AR+sD10roa3ShQttA27KAil75l4xacJyGUDmBTE0eBJ6jZhFtyMpjfWt67qksIuI4Ju
	cwwJOxNquTzASUhIBllbr4tSw3EeAoml6uoiOJpXYpeeblC0GNJivazqcxF60lLhgxUIfxtuNPe
	6W/3X7Li8kQX50ynnaXARADYUZXaJ2nKANWqS06D9qoIVHL+YrRjKcH3AGI6FIMDNU7C9pgMClk
	+HhVnArsHu2xacR4nOilAn1r5zUPCSSUaTl0qbea5VUhzg/gwM1tOk8bOQpzCBlt+wjyAXp3WXn
	F6NwcGQX+AUZxiF3BoMDLK0L9fmsEQg8YlaDnRVWl182EFq6ndy18A5r5Vj9C3M5V702g/VBjdf
	Mh3nCDm+ctVw9C2ICg+U4fBAbwkk=
X-Received: by 2002:a17:90b:4a42:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-396d0e7c071mr10409584a91.4.1787910208686;
        Fri, 28 Aug 2026 02:43:28 -0700 (PDT)
X-Received: by 2002:a17:90b:4a42:b0:37f:e326:6557 with SMTP id 98e67ed59e1d1-396d0e7c071mr10409518a91.4.1787910208235;
        Fri, 28 Aug 2026 02:43:28 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm4166331eec.22.2026.08.28.02.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 02:43:27 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Fri, 28 Aug 2026 15:13:14 +0530
Subject: [PATCH v3 2/4] phy: qualcomm: qmp-combo: Update DP PHY common init
 tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260828-glymur-phy-v3-v3-2-8e73ce7c4636@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787910197; l=4620;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=XbPxVSk6L0oRrRG/BJlHisKaCA2cnH0nHYc6kchbpjY=;
 b=8jSBWj2dYaoHn5RI78oFoNzv8mWQ7E3LX2u/i4n1o8f3HFxtFhNJ0rzsbMAt64Rteg2pSS8zo
 +ObiUws6aCwBv8205IXxYV097d0obQBghGbL0EKaSuPSr2U3Aa+hrF9
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfX4bHFpG2xb1Bo
 2V2tmzougcxn8h+z6LZ1x6na00GIJFV7MpCJ8xwhR3V/jdaukZxXxKVorZE9I62CMJss4j70sRk
 pvNol0DlZ6dpZoK1UckNzFtvVZnoOmC1jxqqqq3P+gGziJK4gvmeFhbsdmYWykUwvWO4CssFH9m
 F+gtMk1dCFBoMOPGFNkLkA795WJrWunkupf/uJTx/pUujuncPICnxcVCVmPMdnWT1fZP8Zb6BBe
 z1vS/vyDEyq1YOstk1rRsKG8zql3F1zSGF3i/id8dZ0bNfFmeFh74cYou0lgSvrQ4mPSuCiNqEt
 lxvnTPGpyYqRLzg0n35J44zvrcfFLLT76P6uITj3/z6h4U9HHpivRklKS4KE5jx3MHEoRhoRbay
 wOXFNfA7g/2LNquJhbsZV29SDk7lHpbXILad5b8HgsAnYnv3iwKOd+kKOs70RG/JEZc7dqocwwm
 pcgBFlhKSk+dzOxPzRQ==
X-Authority-Analysis: v=2.4 cv=MONQXsZl c=1 sm=1 tr=0 ts=6a915841 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=hi1czDCzuCcYxUEklLsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDA4MiBTYWx0ZWRfXzQzvHHAFoLVP
 VcBKLsuguz05GHr+tcYjgQX3dRGDWOeqKP/TgHSRzpzxtAaHoO62kzAt470QNeDfHM/sML7b9DX
 Ph13bcaZxjMiII1dxXOxiangZIiNHJc=
X-Proofpoint-ORIG-GUID: 4EN8qIFwfAoHK37e5qJT5GjCx69JYyet
X-Proofpoint-GUID: 4EN8qIFwfAoHK37e5qJT5GjCx69JYyet
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280082

From: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>

Update common DP PHY serdes and TX initialization tables with
corrected PLL control values (MODE0 instead of MODE1), updated
SSC step size, reset control, and various TX lane configuration
parameters including emphasis levels and driver enable settings.

Signed-off-by: Ritesh Kumar <ritesh.kumar@oss.qualcomm.com>
Signed-off-by: Mahadevan P <mahadevan.p@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 4d31637f1dce..b2ffc20e8f6a 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -1494,10 +1494,10 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_serdes_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SSC_STEP_SIZE2_MODE0, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CP_CTRL_MODE0, 0x06),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE1, 0x10),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_RCTRL_MODE0, 0x16),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_CCTRL_MODE0, 0x36),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORECLK_DIV_MODE0, 0x0a),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DIV_FRAC_START1_MODE0, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_INTEGLOOP_GAIN0_MODE0, 0x3f),
@@ -1512,12 +1512,13 @@ static const struct qmp_phy_init_tbl qmp_v8_dp_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_BUF_ENABLE, 0x06),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_PLL_IVCO, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SYSCLK_EN_SEL, 0x3b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_RESETSM_CNTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_LOCK_CMP_EN, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_CTRL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_VCO_TUNE_MAP, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CLK_SELECT, 0x30),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CORE_CLK_EN, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x56),
+	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_CONFIG_1, 0x16),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_SVS_MODE_CLK_SEL, 0x15),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_CMN_MODE_CONTD1, 0x24),
 	QMP_PHY_INIT_CFG(QSERDES_V8_USB43_COM_DCC_CAL_1, 0x40),
@@ -1553,26 +1554,26 @@ static const struct qmp_phy_init_tbl qmp_v6_n4_dp_tx_tbl[] = {
 };
 
 static const struct qmp_phy_init_tbl qmp_v8_n3p_dp_tx_tbl[] = {
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x3f),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRANSMITTER_EN_CTRL, 0x1a),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_VMODE_CTRL1, 0x40),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT1, 0x07),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_ANA_INTERFACE_SELECT2, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_PCS_INTERFACE_SELECT1, 0x50),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_1, 0x0d),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x07),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0a),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_CLKBUF_ENABLE, 0x87),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_RESET_TSYNC_EN_CTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_LVL_UPDATE_CTRL, 0x0f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TRAN_DRVR_EMP_EN, 0x5f),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x20),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_EMP_POST1_LVL, 0x2b),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_EMP_POST1_LVL, 0x2b),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_PRE1_EMPH, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_PRE1_EMPH, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_DRV_LVL, 0x00),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_DRV_LVL, 0x00),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x30),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_HIGHZ_DRVR_EN, 0x3f),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_2, 0x50),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_LANE_MODE_3, 0x51),
-	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX_DCC_ANA_CTRL2, 0x0c),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_CAL_CTRL, 0x20),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX1_RESTRIM_CAL_CTRL, 0x02),
 	QMP_PHY_INIT_CFG(QSERDES_V8_LALB_TX0_RESTRIM_POST_CAL_OFFSET, 0x10),

-- 
2.34.1

