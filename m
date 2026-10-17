Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEDD3C73EC
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257232; cv=none; b=tkSfLcGF0MVz4YMOHdJQsxOK4veKF7gPQbOZyJlcPYSWQ7JiDJ/F+AernjNrVvcbfB/mP4SlKvy/tE5hUPRfE+meCOd+rMwOBYvT0zK2ULCKocpRdAP5FUHaDZ/KilyE/cROwShdMA2cAbSEk+kBeet7gMnHd4btdM32puV2b2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257232; c=relaxed/simple;
	bh=/F9TRm0NTslNDbQdeo2qFId/qx6xQ99rqJfy7SMqejU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URChp7FWwXi6wWkKNfl4jJbmQisAeF+ohZirWqpaBpHUKwD9oXmH0cMjgtw7Z5UvACzB+4yLynVOHLVCM/Ed/+xQ8KobY24fnGUf5rjvNyrhr9Vo2pAl9na7u8qDgnLT9Q64W4FqGzSr37wJC42C62xHSsWpmm1vyTv4Air2hOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HnDGDYBK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TB06sAsY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnDGDYBK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TB06sAsY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69HGBXbl1523442
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3vvHyWJklprO2+4qDOkCYLJSMqQhNDPpdS73Of4XPeY=; b=HnDGDYBKtYhjPR0/
	dL1OPHuL5UNDuzswJ0L8sxtkBom2X3Mhk4zrdbVo7hWgEFm4EK+J87AJkEiasiiU
	uoe7eATdxwaZtLohyPeN5YsSFWgKe4GwCafWYR4UKug0l0jP4XKH1pHOaosEpwGz
	kIkz2z1vwp0iCJg3tfcPZ4M6vbLl45Ch3q2QHygurhl1AlWp07e3qNbsuE7bi6ow
	r5NIUIe+x3GHc+qyIjez8PWvo8xBgLKU61iEY0AGA/5Aq/tFmV7UVknz/8fz54IU
	UECh8T5na1M0CG2e3RZyTe0h6CNGR4xlCB0xT4qThpEHn3hi8esXq8w/k+HDZjL5
	rtffFg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hc1839d50-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 17:13:50 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35fb6be0f9fso2405604eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 17 Oct 2026 10:13:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792257230; x=1792862030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3vvHyWJklprO2+4qDOkCYLJSMqQhNDPpdS73Of4XPeY=;
        b=TB06sAsYJ+5iol+QcRzihvr7GG8TM3jWRnWEoEepClfm0lYZ2QPAn68ciYQn6j6A1D
         bypyvtFS+8YzvFLgkjo5UvvewIa47r2VZSLBDzhXzqrHDHsYSYbxvSC73moo8BqKRIOj
         JwZ7/YqzR/GPiqtIFwy416i2AHeyzM+Y+SKXrhad5psw5o9ZCb5ZmqIk4V5q8WoyS6WD
         qQnTTbQ0AVwQA/M9Mn/mMibgXQlyGOiNKr+k4VPzvVH5AuvBMjsy/AbCbL6WcuD8ZjvD
         FOonYTUuqjNGMheAnCHXZSgVjIx0FJpBlYRWzUcYKYgaVjGxUmybG9xXHMOn2vGsjgf1
         YOlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257230; x=1792862030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3vvHyWJklprO2+4qDOkCYLJSMqQhNDPpdS73Of4XPeY=;
        b=gu1/rgSYZdKlflJOLdnjexctYBrPDjZpJhFjwnj2l3ZDjXr3fCdWQOWhUPSO80awGk
         +0LKOqga8fTtO8obYlKy0kkPvRIXl+HZ5LjIF/gAqROSrhWvSZ/bUOHquyzgk8YVVCh4
         o+gXqhlXdGpk7izLkNYCJIMGTybHOWOsPC8ZSTf6ijLV91HZlCzfmvQmTis7XUhl0NGT
         hd2G8yBY8Ssi5w8XwraC9Zu1TuzXH9ixbyF170LUtI4k9C+UPQ0fHnz7TMEQS3tGuNP9
         WZEdlF0sWriyq6Zdks5W1DzUNwIFkEWi6X1tU1JG4kUdJb30YqW7mMCttjzKjKd97aOG
         U7NQ==
X-Forwarded-Encrypted: i=1; AKwUvBwK6lgOjxX17o7XIzFyRiVackwSsBSZRia8H643J+bqor9/li4vi0B83hI8V96hFBorRL8jQwEt1l+8PY2Z@vger.kernel.org
X-Gm-Message-State: AFq9FYLr8MplCZFiH5i5OAJYW+bvD9fODmoafUcr3k0Z2IwehQs6gzKj
	kdxmuXepfExh75zOYldXfgvhVpzqDPtDYIqBaFj7UaeGkcdvTJlTYWuKX0y6xtBHuL3A9HOXIo3
	nxN7s12dY6U80+os1KzdUcmw2n+6TzYU4414dzMkGIv2VGmhHm3TLsxZVQF1BVCEuLcgR
X-Gm-Gg: AYBFou1PpAa6cd1YdoSK7okg6wXCzidFsCu8D35ga4K7bB+8P1FX6l5d0ne9xvoORbX
	OaGlafKCwzTCRlN2ebr/my+nT6xS69X9uS6uq85tGEZcMysOaC4ZoUpX4QFFHd98FxauR/3TCXO
	mFzf8c9NJKD8c25QrzfzkA0canWmH7+i72tiwSwC+lcvVhWL9lzZU3ylQY+9dhFJSs0mz4NNY7j
	r70i9aHyqNGeq8fDX0NnsZI2vdFx6UNaIGo2Cm9nh6UIopoeK6DFeYFiRaE1gvo/t/BwmV6Z/GO
	oGp07vvb8+sEKakZULn0/QbzhqbvKHZxRA1p0CX/vKv9w28EZtYrsoxtfZxLbp10dY8m0eHPPAa
	5Nn5P0jQegDRaBWiyg6jIBFMNcvZwNg==
X-Received: by 2002:a05:693c:8092:b0:35c:ea0d:a9a6 with SMTP id 5a478bee46e88-361a2942afcmr4574720eec.32.1792257229697;
        Sat, 17 Oct 2026 10:13:49 -0700 (PDT)
X-Received: by 2002:a05:693c:8092:b0:35c:ea0d:a9a6 with SMTP id 5a478bee46e88-361a2942afcmr4574696eec.32.1792257229161;
        Sat, 17 Oct 2026 10:13:49 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b6e33sm17893966eec.7.2026.10.17.10.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 10:13:48 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Sat, 17 Oct 2026 22:43:12 +0530
Subject: [PATCH RFC 5/6] phy: qcom: mipi-csi2: Add C-PHY settle calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261017-cphy_support-v1-5-8b0e1237ce95@oss.qualcomm.com>
References: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
In-Reply-To: <20261017-cphy_support-v1-0-8b0e1237ce95@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792257199; l=4083;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=/F9TRm0NTslNDbQdeo2qFId/qx6xQ99rqJfy7SMqejU=;
 b=GDSk0X42CxuJzKq/lb5YRKfcYqa2y+HIwbATp9KP6sHmlOj2RJLcPdUZXULKwnjFrtHzwsXC/
 Osi6BYHOA+uAVqGcW1jksi9xBhDMcU2+Og8NS58kM0zVNEqtT8sX2BH
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX3X7c0HZKn6kv
 3cNTzxTgUWggTcPWlsCvJ+lRBXHaBW40VBKHrf1iIr5nLGD/+z72r5fkHVcJHqcaa3ecGEBA/XN
 9+2kFZLBvx+XxvDG1NOtd/7c5a0PPGA=
X-Proofpoint-GUID: FOZqno298M0Hhopa1SzRPJPmQDAB-AfC
X-Authority-Analysis: v=2.4 cv=Bu8IUoX5 c=1 sm=1 tr=0 ts=6ad3acce cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Mptn33ViN8VS2oBQBPUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE3MDA2OCBTYWx0ZWRfX0hRTctOiIfxO
 EkURQy/XUNPAM6qNPg7Ba8q39IHGuX0flnzMu3Zt1Y8D8ms/CDshNGU5gEOX8l1X91N+bcdJxCn
 2CXrpP3rynJe8sAHNZB5GwCgOTFIJmYgsubfyRtE9/gAn2vYTxNjSYFoHmU56miHbTVGZvJgZdi
 BdpYOrnw0xro23fxsC0aWr00xyAt4qHYaFk964e6q0pxP4/eJQSwZGyNGa1HedvjYvMFMMDnk8h
 L7a6cEE4MQ9CUTO1N8yBkFtV56ZAHsyTDtQ1ioPpjXl897aDJ90JNQhXpw+XjKx9x+n6D+7jmmU
 XK1BeVmcHWQAMzl65W+5PQ8uxKSFlFJmglvbUe/KNYSGB2in774dVN/c265LF9PDve/gctEM6er
 oCycH0EnQDQ3lYNrHorVNnW4ICxehqVNE5dAcokjtT4TQeepqHzr2j3WFho84lCwCoLldWJa4Po
 F/gs9nKQnUdkZh9OtfA==
X-Proofpoint-ORIG-GUID: FOZqno298M0Hhopa1SzRPJPmQDAB-AfC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-17_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610170068

C-PHY settle timing is provided by the sensor and does not use the D-PHY
T_hs_settle calculation. Add a C-PHY settle count helper and select the
settle calculation from the configured PHY mode.

Use the sensor-provided t_prepare_ns and t_preamble_ns values to derive
the C-PHY settle count:

  settle_cnt = (t_prepare_ns + t_preamble_ns / 3) * timer_clk_rate
               / NSEC_PER_SEC

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 54 ++++++++++++++++++----
 1 file changed, 44 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 30f7f39ba855a0a2921189050f0084dead207fbd..d93fd9845b50bd7e5623013aecd6db42dd491dca 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -210,7 +210,7 @@ static void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy)
 }
 
 /*
- * phy_qcom_mipi_csi2_settle_cnt_calc - Calculate settle count value
+ * phy_qcom_dphy_settle_cnt - Calculate settle count value
  *
  * Helper function to calculate settle count value. This is
  * based on the CSI2 T_hs_settle parameter which in turn
@@ -218,7 +218,7 @@ static void phy_qcom_mipi_csi2_reset(struct mipi_csi2phy_device *csi2phy)
  *
  * Return settle count.
  */
-static u8 phy_qcom_mipi_csi2_settle_cnt_calc(s64 link_freq, u32 timer_clk_rate)
+static u8 phy_qcom_dphy_settle_cnt(s64 link_freq, u32 timer_clk_rate)
 {
 	u32 t_hs_prepare_max_ps;
 	u32 timer_period_ps;
@@ -310,14 +310,44 @@ phy_qcom_mipi_csi2_gen2_config_lanes(struct mipi_csi2phy_device *csi2phy,
 	return 0;
 }
 
+static u8 phy_qcom_cphy_settle_cnt(struct mipi_csi2phy_stream_cfg *cfg,
+				   u32 timer_clk_rate)
+{
+	u64 settle_cnt;
+
+	settle_cnt = ((u64)cfg->t_prepare_ns +
+		      DIV_ROUND_CLOSEST(cfg->t_preamble_ns, 3)) * timer_clk_rate;
+	do_div(settle_cnt, NSEC_PER_SEC);
+
+	return settle_cnt;
+}
+
 static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 					   struct mipi_csi2phy_stream_cfg *cfg)
 {
+	struct device *dev = csi2phy->dev;
 	const struct mipi_csi2phy_device_regs *regs = csi2phy_dev_to_regs(csi2phy);
 	struct mipi_csi2phy_lanes_cfg *lane_cfg = &cfg->lane_cfg;
 	u8 settle_cnt;
 	u8 val;
 	int i, ret;
+
+	if (cfg->link_freq <= 0)
+		return -EINVAL;
+
+	switch (csi2phy->phy_mode) {
+	case PHY_MODE_MIPI_CPHY:
+		settle_cnt = phy_qcom_cphy_settle_cnt(cfg,
+						 csi2phy->timer_clk_rate);
+		break;
+	case PHY_MODE_MIPI_DPHY:
+		settle_cnt = phy_qcom_dphy_settle_cnt(cfg->link_freq,
+						 csi2phy->timer_clk_rate);
+		break;
+	default:
+		dev_err(dev, "Unsupported PHY mode %u\n", csi2phy->phy_mode);
+		return -EINVAL;
+	}
 	if (!settle_cnt)
 		return -ENODEV;
 
@@ -334,17 +364,21 @@ static int phy_qcom_mipi_csi2_lanes_enable(struct mipi_csi2phy_device *csi2phy,
 	writel(val, csi2phy->base +
 	       CSIPHY_3PH_CMN_CSI_COMMON_CTRLn(regs->common_regs_offset, 5));
 
-	/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
-	for (i = 0; i < cfg->num_data_lanes; i++) {
-		if (lane_cfg->data[i].pol) {
-			u8 pos = lane_cfg->data[i].pos;
+	if (csi2phy->phy_mode == PHY_MODE_MIPI_DPHY) {
+		/* Lane configuration for polarity @ CSIPHY-base + CTRL9 */
+		for (i = 0; i < cfg->num_data_lanes; i++) {
+			if (lane_cfg->data[i].pol) {
+				u8 pos = lane_cfg->data[i].pos;
 
-			writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos * 2));
+				writel(BIT(2), csi2phy->base +
+				       CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(pos * 2));
+			}
 		}
-	}
 
-	if (lane_cfg->clk.pol)
-		writel(BIT(2), csi2phy->base + CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->clk.pos));
+		if (lane_cfg->clk.pol)
+			writel(BIT(2), csi2phy->base +
+			       CSIPHY_2PH_LN_CSI_2PHASE_CTRL9n(lane_cfg->clk.pos));
+	}
 
 	val = CSIPHY_3PH_CMN_CSI_COMMON_CTRL6_COMMON_PWRDN_B;
 	writel(val, csi2phy->base +

-- 
2.34.1

