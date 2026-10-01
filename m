Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1470A4CCDC4
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 09:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790847333; cv=none; b=SMsTEu1bZEpIb++DU49lCRKkkp2AUgOU37xaD2P8XiE4dmYYpvIEy5WUNNpRgHqKPSxKBPyqlVrYZHRZpsE3lU2CknE2YQgNUW/5WDv8jI/SH4L8BgrUY2n4Htty//tQiguxpxqsS7MV2TGz9QbnDJmtdBvZMj3E3jR+tmv+WDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790847333; c=relaxed/simple;
	bh=KWQYM3wYSXfF0vrX+SA91x3wOmr1p6WK16Wy+pTwYEI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a1osMeBdYroJm5bz5tnjgEN45FYQgjd2f+KyNZvjGfvd+yeIUcfyLCBaZ05W2KjZiThV9XXXMzaeDYqyhDpaX+17yovy11u+nY801fnE7CwSWJfZoXoRyYdw85eVdHlDTCL93qblBJAqZwOgN+VKx8lNX0ReMfE/7D5oHwCxG1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lok2HsC0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L6rJJ3So; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lok2HsC0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L6rJJ3So"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xTv91289204
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 09:35:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8f8yCU90l7t/piDdPkjz04trstPE1azjFlo4hVkkoI=; b=Lok2HsC0+jaf/27K
	LKZRoiL0a6fNuOfpGoTVtIdqrHcyVtTt2CsgM/sM3jLA7XGStp+g1GWjYalbxWwu
	y4UpQQttTZv9nUSQuZCzPINCrYLDbYXdHAfDxcuL0TGK0S8siiPxbFBJnLiubkVk
	jgDvOYw8Kubf9ssr81yBaU3FEKhAEunPOTcsoqariKJqgC5iHpl4IxN9h9vWDjTN
	uRQfrVXb88LlMustQgZMUd6qKMhJSUDB257se33dEQVYnc3f1YwhQxFg+o7GMro1
	Xrf+ID8p9ebUktbxBx3DBR2kBSv53KHydQ8PMU5TQR9zCdJANbPSb4UPX3jtWrA6
	cK1NoA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h17pjb4hs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 09:35:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc72777faa2so3789621a12.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 02:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790847330; x=1791452130; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8f8yCU90l7t/piDdPkjz04trstPE1azjFlo4hVkkoI=;
        b=L6rJJ3SoFjn1/XWeyOCZVtrNJ87Pzz8O5Ro68loIlco/bP3GU5wJufEZ3Kp3e02y3q
         P3FKWR/jk8xgpkCoIbv2taq6b+CI4tBcYhpkBkgGzWtQ3iM4G326x9Or2ipTDhwn1hLl
         WZULsg1g+hWWEoQMWiQ7YT8EnKxhFZ1ZkN4JZm34R+yvqMi4e5mQpR1XQrjIsq8rpzJU
         NZvOA8uqYcU7bBnGAHrzl/AWVXi/gErtfYVL6fsqCKDiCdUrrkvVuySIb2LiANiybpTF
         FpEbiIGeuilDIRfIHd2TOw9cAkgbN/XNpc66b1fS8zIbKJrNfFPnJYy/mUB3t2vlHDui
         narA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790847330; x=1791452130;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8f8yCU90l7t/piDdPkjz04trstPE1azjFlo4hVkkoI=;
        b=N12H/JyMm6rzfXpF2Qs1JMvECctGMrcDU5aYy/vOTvxPpeJH0Jq+lq+FSBharVWr5u
         8O6JmVZTMDyK6bj89Y/63G5EgFc3hRZXQ+QpjfKvWcHbLAgDYgFCbk42sk0g+B+koI59
         sIzfTtfdlmmcUHvJokmEyHMEmXKvrrnO9zAuaTChPEQ+TyZ0r6/xmLH5Oxhj6kWLEKHV
         riZ5yr9CtPs1LKXx5/Hsfb/njbt6pzKUim1m/uxSUbytCH3yHRmXWU4vyLVL6/ynQmor
         AtBPeiyVVEpH+f7nsvxjOwbKYKu0QJVU4JrCNNfrPGEvgYJAq9+9C2QLKiBitRtsPoSN
         4SQA==
X-Gm-Message-State: AFq9FYJleDDXzNmbh0KE4cusUb1R+Jt7Mc5uRBayKM7nhGfyjBNSvZO1
	/0+CHzUQyTwJObFMOOezMHWbtwpWbUGheakfJinSNKIDsRWpVAddQVyomMeI/M2gv/fZKEoMpwD
	4EMtC+z6ZO5SnylhisK/X03n97rlh27Fi7yAIw8hq6xbklDYX/uKQqZZVdbYTiOMoyAd6
X-Gm-Gg: AYBFou3ZOMxo5fiQNXt63k5SVtrcZ1aSTpvi9/+yHrsuoEjcx2Xj0pTvvbKRqptticE
	HDUuQXEgKF8aHhBsti9lTrNov+3dxsc5iAtB7HkFsZ4v1lavv8j4R//qCIbav0HbJNdbmLwRXrb
	9ErXETzMXLDuwfpbNNAsnbcqsrjlOqu/6dpsri/uqZ+1ovhcmnNqvO51/4XbTLDI7NX/wCcFc6G
	/IuHNILlED9VU5Du4qkaJjs8NI9HEs16MFAB5zDFjbXj7Jw6dR3G5lEXuSdETkqEhWY3QUpSwv1
	F7n/pB+Kpgv1E1qsMxrZsJFfXyqaR500Z7QaujK+czSjLotfpArrmLlYYR4I2fF+csN4FRbGJMR
	tuwNGiOp+0jQXoeXMyy4+uT7lEyY=
X-Received: by 2002:a17:90b:4fc1:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-3a4d1500fefmr3281698a91.19.1790847330326;
        Thu, 01 Oct 2026 02:35:30 -0700 (PDT)
X-Received: by 2002:a17:90b:4fc1:b0:39e:6795:f7da with SMTP id 98e67ed59e1d1-3a4d1500fefmr3281683a91.19.1790847329831;
        Thu, 01 Oct 2026 02:35:29 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc7e54bf4c4sm1152944a12.29.2026.10.01.02.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 02:35:29 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Thu, 01 Oct 2026 15:04:24 +0530
Subject: [PATCH v5 07/11] phy: qualcomm: qmp-combo: Extract common DP PHY
 init sequence
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-glymur-phy-v3-v5-7-3848c2615d5a@oss.qualcomm.com>
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
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790847286; l=5420;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=yr3dlsAXZBEwcWHv5UMdXOjFXKLB3Ml2ht//o7FmLJk=;
 b=NPdiyX02LIBvfwYBD7zEzQCA2oeI1sRGXERc/BW9ZZKS9uMJZ84n0xBGxzDzPrCFgbHUidxZf
 5kAkYpPHwj2C6cZ9tktAJdA/C4LNrxa8+NbJPCglY/x4Jg5Yj4VGtyw
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Authority-Analysis: v=2.4 cv=eqpKXYpX c=1 sm=1 tr=0 ts=6abe2963 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WQ39YxX6NF7xrdOXP0YA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Kz2fJ98pMFI_t0bHrgJM1EYq7P_m66Xi
X-Proofpoint-ORIG-GUID: Kz2fJ98pMFI_t0bHrgJM1EYq7P_m66Xi
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX0+GM+Kjf4yrD
 ugBeTVxU9TsTr73oiysCEI5AMbWJO6kkxEF64UBbqzPvtZ1x4y3OydNm5JhuUIJVSXRRW8A3EW6
 45MUa1XmmED0VM2BI6Tj+cBv9r1UQkY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzOCBTYWx0ZWRfX0ehf/zJpPK+e
 AyZj/Md9ukuHpwKDRpQGTT9KWYmm8D9IKTVmSDAflS1yFLu2RDCkA5tNAZPJ5c2Xxs3wAPOAjW6
 uHl53rgXkuECpdJ8uYYSNYkm7Ats4lW2FdLeIW7yFyGkr3z7RW1/pOR7ooxSVT1KqdOIH5Uu/TV
 9ZFkc2GdQU5UlpoElC2T7P9UtlofWFGGbNXSGDEspkHrb5mmlgGTBYma4pFLp/UUis53Z2hq9Fw
 vHzbV5/CQTvsxWqD+wrUdUUR1L3rD7iD5uDJHCngFKsnibZHy3qovGDc/rFnkiuXEiLRaUU5LuV
 ZCuFjfgtu6A8Hl/1sggUrheTvM4Oj9kgwZoh4BHPdNgNYpaikFepePU6FfV2+R8suNYABt0QGxK
 HFzkCUzr7ppEMbDTw54nO1kXaiARZOA2kW0k1/j8bN0Ayeo+jdK4chLsEIWnRfkqkfLoCYo+jC9
 YLUwaeaxNKZRuhl2N8g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010038

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
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 99 ++++++++++++++++++-------------
 1 file changed, 59 insertions(+), 40 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
index 5446b8333a1e..fc35da80e57f 100644
--- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
+++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
@@ -3489,6 +3489,7 @@ static const struct qmp_phy_cfg glymur_usb3dpphy_cfg = {
 	.configure_dp_tx	= qmp_v4_configure_dp_tx,
 	.configure_dp_clocks	= qmp_v8_configure_dp_clocks,
 	.configure_dp_phy	= qmp_v8_configure_dp_phy,
+
 	.dp_aux_cfg2		= QSERDES_DP_PHY_AUX_CFG2_V8,
 	.dp_phy_cfg1		= QSERDES_DP_PHY_CFG1_V8,
 	.dp_mode_ignore_reverse	= true,
@@ -3795,6 +3796,62 @@ static void qmp_v4_dp_aux_init(struct qmp_combo *qmp)
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
+	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_C_READY_STATUS],
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000);
+	if (ret)
+		return ret;
+
+	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(0)) > 0),
+			500,
+			10000);
+	if (ret)
+		return ret;
+
+	ret = readl_poll_timeout(qmp->dp_serdes + cfg->regs[QPHY_COM_CMN_STATUS],
+			status,
+			((status & BIT(1)) > 0),
+			500,
+			10000);
+	return ret;
+}
+
 static void qmp_v8_dp_aux_init(struct qmp_combo *qmp)
 {
 	const struct qmp_phy_cfg *cfg = qmp->cfg;
@@ -3895,48 +3952,10 @@ static int qmp_v456_configure_dp_phy(struct qmp_combo *qmp)
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
@@ -4028,7 +4047,7 @@ static int qmp_v8_configure_dp_phy(struct qmp_combo *qmp)
 	u32 status;
 	int ret;
 
-	ret = qmp_v456_configure_dp_phy(qmp);
+	ret = qmp_combo_configure_dp_phy_common(qmp);
 	if (ret < 0)
 		return ret;
 

-- 
2.34.1

