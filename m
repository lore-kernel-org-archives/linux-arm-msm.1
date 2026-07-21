Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3B143553E
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619350; cv=none; b=WFcZRmK0RMKAufnKaiA8/7TZZm72+JcuZLI3WFpCTcCouAq0J+Q0vvObAMzeFG6bFaMggmaNbY/TY5cnXnift0UiQKi5fog9t+OuVsAwlBdQB7ASvd8Puhz7fey1wgx/Ws/3EQAXhnC83bL/ARFjRf6I3nC3qBnp1okUlRJxzos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619350; c=relaxed/simple;
	bh=mUofERfq/n9bvkJmozB5MEVLjKLsLA471fqUijwrBtE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RypdN5+7fJF79izVFZ2u65S0DIBlb42aEjossa6cuSWdhBX6AA2uJoRXLz0ss9NBo3SpPhbZrvL7YzSw49yVKQHfSaV5AO8eLve2lT0upGyfKPDkxW36TIVm3UwF5abE6V4M2KW4NdAR1LvO9bp+108Hnn3LdFc6jl/IKp52/u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsjAn/el; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMcUU3z1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsjAn/el";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMcUU3z1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6Fqek4107084
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lPzGGWJt6OLARbXb79TXcUx+RHCnNMi3U0xcb+MgwK4=; b=dsjAn/elMnOLJoEI
	7oKBgJ4FKnr3aIWn4vJQ4ZSxPrXfIeoCaz1mLP0vjs0Fa9P4r68X6Bm+ziU3ke5w
	MwYu4g8CK1TpKNXEu8d+8MJrtAb0tfL9lYtu7/i2QmCyokzNeMOtlqJV9hPb6EFD
	5ENTsZdZ2koQcKLmp2VCX8pWKdEbBl1gZcYTAabpY1ee3ByOt2JmuyUzJFbBCa2b
	8pfEfDUt0mLo0tdJ5xFuy4ZhiTWNi9IoEIY2c5n+wJ8I2UEC8DjMoBmIPmYk2PJv
	GqZkJnT6DLcscQmmk0Yysj1eiVGjJABuIfWqZW7+vT0nQaXKKm9B5rKfJt0w2GB4
	eTBGng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhvqn9s7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:35:47 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ce7dff6253so39641525ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784619347; x=1785224147; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lPzGGWJt6OLARbXb79TXcUx+RHCnNMi3U0xcb+MgwK4=;
        b=MMcUU3z1Eahb9LwFqYs1GCzGFL/E2759haKI0/PS4fZY4k3iYQDxXkJdap8Z19T49w
         FIFqf/CuXDyQ8D60au7AMUMgCpdQOexSnkGTiJ0666JeQXkdAZUf08UmxGsYXHmJ8Boj
         LohIwzXWZBEVwgzBCTnz4j/mmv9vud1eyHAYgJFitPEVR14zxTig/j8CuMNnOigyMuz/
         6lzcrX9E1WUzSkKgfH0lytb5P1QR0/BC8LbDbHr44Kfjpm+q4Gpas2aaJkAPDIquRXEe
         fa9xpxhiVuSM/0k7n4DLLd4j9hRnq1gH1PO31fABblrxMYaTTSdmhoM9Ro1wC3GnPYsN
         F7Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619347; x=1785224147;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lPzGGWJt6OLARbXb79TXcUx+RHCnNMi3U0xcb+MgwK4=;
        b=X60CE1sI/prwTV46aqJgDtoHlvVvfF5HEF+KAqGxImfyaE7jSnhED3ca05qzIhXvLA
         sGaHKHrM/1S7M4vOUp0Xjagd2LYaz5OrjfE4iJ+3PGstxIbhyt5aHDJZuPxrLfnSa+ZL
         MNjzj5JGXr1pvk1o2+Pnw0WhTTz3yKq7bOMf4n/YDBAkEtngRcP0Df2qmh/6fLMBmKED
         6/eEeLy8PFmxl/SL3lDl3349QrK9DNH/YVXUbFVzBCUb2IykwmtJGAUSNkBgzekWdzTO
         cytqxVvGEhxZGZEAGPLpyIUkC50OJhiFw8ZZVO/tc0sGTrJmaQQCJX9ySrQ1uhbh+1n2
         T0Qg==
X-Gm-Message-State: AOJu0Ywxh3rH6wPp/aJXzKJ4jw7FA8goMcJpb3Kn6mFE1MzbB9fzpl9g
	0hEJgnda6CoT7NZjN/W68iawAilSFp7SZHe4kvhkfwspORmY6yhzsoYedr0g3xpcRaDy2IiitBy
	PVDsfA1V/xB4YP25BW3/7zR1Ig1M2KxqeLtXQTrMqHaAJSf3Devnkuq5JGwS9OHpmJCxJOJLY2Z
	qn
X-Gm-Gg: AfdE7cmaCQv21urIhmx6EQzmmvtRBM7JZSa3asBmbXQ+kGWpuy9SK2pS3jGBniWYkxl
	7sLQYTRv7JoGHfqcmHoL1l5IZPYunLDfFy4vmtHgGJP973pPbPzB5Q+wcVFsT0S9iXnf5Ds1qIe
	oo++oR1iqms/rl2G2wbLytMMrsFpZfDixopJhw4TdyiD+Tac1404mcgEZarWITn/cO2yBwJ3MdC
	26d4pPGVYKs3fuuXyyB6my6xeGyevas5PKUGvQ40n62+bM1CgK3N2f9/wCMiikZ9QLFVzgGWMbi
	XcvS9HyZUBkfDGvN1k6X2HI8Gfu8xQ41UYg9frD1LLdrGpY0zDz+SDFSXOzRxVS+/CRkK4opLcR
	4mRlpD2row1g2NqJYbCi12cnwb3uq5Huo19b12XVQPFHHm1+5T+NFIUOaAqhDjhVN9NcZWaxUgI
	Vq+2HPOtuoOuSA/0XuHBG865+2tmHJEg==
X-Received: by 2002:a05:6a21:710f:b0:3bd:1cfc:1b9b with SMTP id adf61e73a8af0-3c38d90b038mr23029019637.10.1784619346963;
        Tue, 21 Jul 2026 00:35:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:710f:b0:3bd:1cfc:1b9b with SMTP id adf61e73a8af0-3c38d90b038mr23028998637.10.1784619346516;
        Tue, 21 Jul 2026 00:35:46 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a210571sm45224271eec.31.2026.07.21.00.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:35:45 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 13:05:27 +0530
Subject: [PATCH v5 2/2] phy: qcom-qmp-pcie: Add support for ipq5210 PCIe
 phys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-pcie-phy-v5-2-8d403ef7e780@oss.qualcomm.com>
References: <20260721-pcie-phy-v5-0-8d403ef7e780@oss.qualcomm.com>
In-Reply-To: <20260721-pcie-phy-v5-0-8d403ef7e780@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3OCBTYWx0ZWRfX0WDTip+82gyc
 1BW0DVrZ4kSa+LgSHwVy5L7NZsNrvx2PlwAS4aqBqFXb6yfeENGxYfGNMU1Kp3AVBN8ql1X83zq
 usZzbh7vAJsMl9MIl7Fpq8cH4dulFMXSyrcQ20IVXfv7fmdyi2/H/EiDJaKVyNxLh7ItuQ6wPdb
 +eJbisIyvglRRpvnzTOTUujKb74my7Y1ghflGK9uBrZGNZPsF974YR1eLXOnwQMwE3dB8DDc7jl
 wUoEZPmt7KXBYMaR8a52cc5TV3OAgxB5ZVCcsvszVAbqLCpCbJx4tfZv/ec1gVkdNvSkbsu/6FI
 eS6x6N7Ffze7g64YiDBQPeHSKLq6jljdIbqWAJFORMp+ZVN7SAKTMq4RZ7k1N++V9EgMNsO5oOe
 H3IMC138cZZoD+fsBxRpfma8NoQ7NL6XaQHsVVmZpApLqX4Wn5c1K2l8a4BxeREQJ8K0GP45MRO
 z34EQ93etVn32EeEdMg==
X-Proofpoint-ORIG-GUID: 6N753moearZ4UQQzKwG7trco8uB6-Wpf
X-Proofpoint-GUID: 6N753moearZ4UQQzKwG7trco8uB6-Wpf
X-Authority-Analysis: v=2.4 cv=M5F97Sws c=1 sm=1 tr=0 ts=6a5f2153 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=lQuujfteSIboIXYB3dUA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3OCBTYWx0ZWRfXwgXoQcaKGBH+
 +9VNxfbOnfl0scmq43tT16Us/HPpsTIwljV2ewFqRlLknauQ5FC+BO8GE40VC73BP3Zh79wVjRO
 qAvJqIrWlEn5LYIE982g1gaFUgEjtY8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210078

Add support for a PCIe phys found on Qualcomm ipq5210 platform.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 129 +++++++++++++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
index f54f66429f37..f4b25a7b1604 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
@@ -636,6 +636,89 @@ static const struct qmp_phy_init_tbl ipq8074_pcie_gen3_pcs_misc_tbl[] = {
 	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_ENDPOINT_REFCLK_DRIVE, 0xc1),
 };
 
+static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_serdes_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TIMER, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_BUF_ENABLE, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_IVCO, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE0, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE0, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP1_MODE1, 0xff),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP2_MODE1, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BG_TRIM, 0x0f),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE0, 0x23),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CP_CTRL_MODE1, 0x23),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE0, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_RCTRL_MODE1, 0x10),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE0, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_PLL_CCTRL_MODE1, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_RESETSM_CNTRL, 0x20),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_LOCK_CMP_EN, 0x42),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE0, 0x19),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_DEC_START_MODE1, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE0, 0xfe),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE0, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN0_MODE1, 0xfe),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_INTEGLOOP_GAIN1_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE0, 0x24),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE0, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE1_MODE1, 0xb4),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_VCO_TUNE2_MODE1, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_HSCLK_SEL, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORE_CLK_EN, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CMN_CONFIG, 0x06),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SVS_MODE_CLK_SEL, 0x05),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_CORECLK_DIV_MODE1, 0x08),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYS_CLK_CTRL, 0x07),
+	QMP_PHY_INIT_CFG(QSERDES_PLL_SYSCLK_EN_SEL, 0x10),
+};
+
+static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_rx_tbl[] = {
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_FO_GAIN, 0x0c),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_GAIN, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_SO_SATURATION_AND_ENABLE, 0x7f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_UCDR_PI_CONTROLS, 0x70),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL2, 0x61),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL3, 0x04),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQU_ADAPTOR_CNTRL4, 0x1e),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_LOW, 0xc0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_IDAC_TSETTLE_HIGH, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_EQ_OFFSET_ADAPTOR_CNTRL1, 0x73),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_OFFSET_ADAPTOR_CNTRL2, 0x80),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_ENABLES, 0x03),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_SIGDET_DEGLITCH_CNTRL, 0x14),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_LOW, 0xf0),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH2, 0x2f),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH3, 0xd3),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_00_HIGH4, 0x40),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_LOW, 0x01),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_01_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_LOW, 0x00),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH, 0x02),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH2, 0xc8),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH3, 0x09),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_RX_MODE_10_HIGH4, 0xb1),
+	QMP_PHY_INIT_CFG(QSERDES_V4_RX_DFE_EN_TIMER, 0x04),
+};
+
+static const struct qmp_phy_init_tbl ipq5210_gen3x1_pcie_ep_pcs_misc_tbl[] = {
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG2, 0x04),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_POWER_STATE_CONFIG4, 0x07),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P1_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_L1P2_WAKEUP_DLY_TIME_AUXCLK_L, 0x01),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_EQ_CONFIG1, 0x11),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_PRE, 0x00),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_PRESET_P10_POST, 0x58),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG1, 0x02),
+	QMP_PHY_INIT_CFG(QPHY_V4_PCS_PCIE_OSC_DTCT_CONFIG4, 0xff),
+};
+
 static const struct qmp_phy_init_tbl ipq9574_gen3x1_pcie_serdes_tbl[] = {
 	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CLKBUFLR_EN, 0x18),
 	QMP_PHY_INIT_CFG(QSERDES_PLL_BIAS_EN_CTRL_BY_PSM, 0x01),
@@ -4061,6 +4144,49 @@ static const struct qmp_phy_cfg ipq6018_pciephy_cfg = {
 	.phy_status		= PHYSTATUS,
 };
 
+static const struct qmp_phy_cfg ipq5210_gen3x1_pciephy_cfg = {
+	.lanes			= 1,
+
+	.offsets		= &qmp_pcie_offsets_v4x1,
+
+	.tbls =  {
+		.serdes		= ipq9574_gen3x1_pcie_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_serdes_tbl),
+		.tx		= ipq8074_pcie_gen3_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq8074_pcie_gen3_tx_tbl),
+		.rx		= ipq9574_pcie_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq9574_pcie_rx_tbl),
+		.pcs		= ipq9574_gen3x1_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_pcs_tbl),
+		.pcs_misc	= ipq9574_gen3x1_pcie_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq9574_gen3x1_pcie_pcs_misc_tbl),
+	},
+
+	.tbls_ep = &(const struct qmp_phy_cfg_tbls) {
+		.serdes		= ipq5210_gen3x1_pcie_ep_serdes_tbl,
+		.serdes_num	= ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_serdes_tbl),
+		.tx		= ipq6018_pcie_tx_tbl,
+		.tx_num		= ARRAY_SIZE(ipq6018_pcie_tx_tbl),
+		.rx		= ipq5210_gen3x1_pcie_ep_rx_tbl,
+		.rx_num		= ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_rx_tbl),
+		.pcs		= ipq6018_pcie_pcs_tbl,
+		.pcs_num	= ARRAY_SIZE(ipq6018_pcie_pcs_tbl),
+		.pcs_misc	= ipq5210_gen3x1_pcie_ep_pcs_misc_tbl,
+		.pcs_misc_num	= ARRAY_SIZE(ipq5210_gen3x1_pcie_ep_pcs_misc_tbl),
+	},
+
+	.reset_list		= ipq8074_pciephy_reset_l,
+	.num_resets		= ARRAY_SIZE(ipq8074_pciephy_reset_l),
+	.vreg_list		= NULL,
+	.num_vregs		= 0,
+	.regs			= pciephy_v4_regs_layout,
+
+	.pwrdn_ctrl		= SW_PWRDN | REFCLK_DRV_DSBL,
+	.phy_status		= PHYSTATUS,
+
+	.pipe_clock_rate	= 250000000,
+};
+
 static const struct qmp_phy_cfg ipq9574_gen3x1_pciephy_cfg = {
 	.lanes			= 1,
 
@@ -5929,6 +6055,9 @@ static const struct of_device_id qmp_pcie_of_match_table[] = {
 	}, {
 		.compatible = "qcom,hawi-qmp-gen4x1-pcie-phy",
 		.data = &hawi_qmp_gen4x1_pciephy_cfg,
+	}, {
+		.compatible = "qcom,ipq5210-qmp-gen3x1-pcie-phy",
+		.data = &ipq5210_gen3x1_pciephy_cfg,
 	}, {
 		.compatible = "qcom,ipq6018-qmp-pcie-phy",
 		.data = &ipq6018_pciephy_cfg,

-- 
2.34.1

