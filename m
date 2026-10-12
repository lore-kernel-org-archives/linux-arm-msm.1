Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB84643F080
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791787538; cv=none; b=N7ACoACmRO23IbPadHMd8uX5YIZHgmqr9yLH1ICpATpKxyAvH99II9UXJavQ8zdig1/z1ByRrThPjN7OHjsm13Conl1sQXmcE/YqQEN1xliOmjcZN7fq7DbdCiL8QoF2YLEhp9ejHMboSfewCEpiZGv2jKPY/K4uKln8qhoUsXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791787538; c=relaxed/simple;
	bh=ZHkg5zM+lJIOFrCLJ/Suoj+HX48bpaqLr1WZJ5FQ+VA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H0VcBcU6ORCjCB4rwq1OpG+zZVZTKVYABUVGuMpppWVCfGx87vhcBRSNxKGha0ShaHCOHCG7umKbhcCtyriV/PkAiOj4L19gfnKoh7oGPMNS5tsmLgIUZgXoxyI+wTKqFIuF/npxW394lraNaVNCKyjdJKv5FO1QyI/xZLyfQWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Nu0nPlPn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Hb6LAq59; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Nu0nPlPn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Hb6LAq59"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C5PXVj1786966
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=; b=Nu0nPlPn0gBDMIRO
	ScBTB8pBWKueMLJy3nvdq/gh+bAyEtB5mfCMFGF/AcfWriUTe2ZHdIhSayGyHxpr
	ZycqrfrUkZcfNomvncw5aKHTa7vfsJY39jvfSriHXvk6hqMqU327si0gMDvtdxTa
	q+g0sRlvva0TIR9MhSMavoQFsTfRIhbX+wQOjWkJ/VNxBOZt4HUxwEMT0HreINfq
	4ETC4kVTwlC6UIyvqbNEq9WnYZgKI8BEYBIblPLU+2NsHyb+SV+ReGUz1VB+Z8/3
	ion5Pp1mpryxqp/W4Ma6bTuY0r5ZC7iqjCdofA7F8W4MOnM3GfYc3Oc6WcUcR7NB
	hT6K/Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8sd1rb52-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:45:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-88b9d8c9e55so1216473b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 23:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791787528; x=1792392328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=Hb6LAq59WOfChVFVtsJArd080YTVZmJUFvmrGgs5ccS/Gh4pMSe1I9AzBdfKL+QKEC
         qaRlAowcNiSfuebunpN31mm8Le+Vkjru4szH9RogNobwbhcN4lFyiE5L4Yr41LsQ2kKK
         A12il1E31Me+K1e6MKIpXB+0k3WzD7UtzTYMWQpkGxe5DC1AcRxikVDGYBdUyHEzHLNJ
         Fi2BcdtgV2H9LXsLWQ78KD2BU5u+unG8wrYXxDg+fTv35tbSjbhyIl8vhI9HAjkWzthI
         HpUQHlKPGmiuOo1tGwD2IjQsuPppiHTo7vJXHDAL/nM46KRHYcHJbyx/fdb0RC0/aQoZ
         BwIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791787528; x=1792392328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=jDBZ/Dp/ACstEobTxswN8/9nHbuJIc3Pd2yRhHFtX+5ign9pmTq6z1kQZFjotAEBhz
         +IOcHkDZj04+LgsnaVNk0pp3Ih+wN+6IgpZq7lxuySW9NpBuJJX0ue1QxBBBFGe7bowo
         ambNnLsJuRB2txbH8AZmSNl4vlNq2Jc64dJ9GB10EW/YzI8Bdb/mMnu99fG0cqCRyueV
         Kpi/p8iSKS3SEzgp5ADjDfjG9TXwOKn0g/mjv1obXbCX86JANV/uDgeAWXHHrdK5EEu9
         +vbLcLopFpw91RznsNF2PnfYrAxDBh3RAZhF150GJ2KakC1xsWqQE9XlgR9l6X007bPn
         xoPA==
X-Forwarded-Encrypted: i=1; AKwUvBx78nLcth24PGYMCrleu8/6NAyEH13+vnH3pNsI/M/I56TgoojMZCXHyzENlUiiOGzeZUfwzr8SKLK6RkeI@vger.kernel.org
X-Gm-Message-State: AFq9FYJ2JGMkrTMqfCJPbyz0geMwc6tOuvtODrGL/7EHGBiocSoX2exF
	6JvIwPsGNlIoDqxAkoUXUsicWXODgtRsMFk+P2eO++iKoiovnWwxkeSKXumJ0fExoUnplhENeeO
	gBGoDMDb8TqOFQdkPFCW3qDSyksrL3ncAYezbPDDQlIqOUdPeU6NRBt4sUznt72L17rZP
X-Gm-Gg: AYBFou0kVUVRUIEegHPUSW1aRs/hAEFKXGZW+Ttt0/KPBpNKSmFYuMJw64TyG1WuQjo
	40O5ud4sMfhRZMie84tRBvX7i5eZRy9I3zZPj3/7UtJBsp+toXbIrN2/kO68hcrnSF9u/tceNJl
	50Kb14dEnVzovXvZqrwY9DCxJmJcNv86WPnbJC3HrOG9Z6uD+f/K4GF41322ZOy+zNVIwWKxxUa
	30dOe8cBQ5z9dHGr45PHjNgKWY4nveYO6Iz46cqQMqhHZmiez8zMrPwOCd7dcXSdg0SUpcno3Up
	xxvGNPm6q+Hg93Nl1ZFeT+ydP+pBkt/cqAjwPNxf2tMv6VnKw/Ich6KiZL9J+ujdsLKve2p9WsX
	8ebuhlPEBjSM9y+pDPyDXgo4864AT6eoSJA+fVBnDU21B6YcVw1Rn2NtqtZMP/ftQkJIyOqs73i
	d9KAUAYAf8NQ==
X-Received: by 2002:a05:6a00:3686:b0:880:e0f8:2da4 with SMTP id d2e1a72fcca58-896898e8277mr5751271b3a.5.1791787527520;
        Sun, 11 Oct 2026 23:45:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3686:b0:880:e0f8:2da4 with SMTP id d2e1a72fcca58-896898e8277mr5751256b3a.5.1791787527052;
        Sun, 11 Oct 2026 23:45:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-896c3dc6c93sm3534420b3a.33.2026.10.11.23.45.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:45:26 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 23:45:05 -0700
Subject: [PATCH v21 03/14] phy: qcom-mipi-csi2: Add Kaanapali support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261011-kaanapali-camss-v21-3-04fd28d815c6@oss.qualcomm.com>
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: pHJnzE-qc6NlPN2niySC7Gj9kcJmVd2Q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX1a3cNNz+nmhd
 Mh1Q6A8kAM8P6HMi6oyUtSfFO+/HK0FuDZhHViq1IyBouT3HbjuGQ4NGOxJZwEuLQpiKYI2ESDn
 jz6WpsUH54eLiUekcLwiVJKfDtPdkkI=
X-Authority-Analysis: v=2.4 cv=QtHLTlyd c=1 sm=1 tr=0 ts=6acc8208 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: pHJnzE-qc6NlPN2niySC7Gj9kcJmVd2Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNiBTYWx0ZWRfX55+dX8/F9Wns
 P6YVn9IaIOu5wonT+pxEUTuxPhX5f34V7hGRaovurXVWrlO3S9g3C/VCUs1ewDmb83mhRJyGRFJ
 kwZIWheDZEdmPIDlHh31unZ/YC+SYD5KflWD7w2mGuSoKBOYHqLagdqjPsdGUmrUeI7b/I8HHKq
 Zbji/mOuKs+LpsoYoXiUaKIX7aABYjuFzIxKmUdDmcgSU4OtgpJlAhlKbNptaoSlE2mQdHryvix
 qrd1Qttx9rlOLRQ3+qzuUUXAyInfmTVhrUqHFQ9bq8ATKQIUebc9jX/S+HYr/cc95strxZW9AFA
 Em1fXIL3PMcOiGyzU4sZcpvPGV7HGh068OO0UlPyImSItM8WYsldSXfS8zRuHxSHbiskD0CDnR3
 HnLlATqEO5XUYn5UHQFu4ElMAYWvQy3K+hz6FPd/b+FRdIanvZvuqT4RERB5gCtodNuJLO2eQ8I
 p9nRbbm5nnfjkhKzLvw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610120026

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

