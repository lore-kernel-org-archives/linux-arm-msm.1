Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82AB33FC5C9
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790230241; cv=none; b=PmY7WUZpxTXUfi1IGQjhTqr9SMig3ShsftU1Bxu7uLtPhnpE/tHrEFu6tSUMVPYXLhnEYUQwjLLz5hlxXpDNcTVRfrFMf6ilyuCEYlc12vIBy2/QEaRgQIIJIm5/XhasVHweUoFeZVwqe8hNA3Dv6zUqnGPPrfE9M0NqAvj81Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790230241; c=relaxed/simple;
	bh=mFZMa7AsDuWFLglUJnP+YjUZySr/vnuKz/pWC+d41b4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uLjyxOtETMO6diRQiF6eq0W3PDxY79ac4yY0CTQ7ROLKm0TZP91opq0HRADySLKB4WvT2+ysxH0cDPrQFbGUcyzbJ2SVi3Uw6KHmZE6hG0A16QGPfQv/3MZx5ss7ApEbyK3qxTMSSVZANskqQom3cTVsi5PmEKtNSJOVTf6yUWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AaH6D2VS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FqfDascL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AaH6D2VS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FqfDascL"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O5e9oI772427
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/aKERj8vOTgNopINdWRvI+TeRfCoisGCiNjo8nkQDqg=; b=AaH6D2VSBcI1/DT/
	6c3/2Evqd8/WFuiZ6mFHriVBrU721jrC+Ih9PeKs3WSQ+0SD7xEA8dgfGYMVLBTw
	r5fFaufh+2QXjnVVWX3PXom204MtQzW0J92KvBJa8NSBjJyAbpYCBg948QyVEtwN
	riFaFwJsss4oBAZWJPOd8r9SPPQIy0vD6r+oKa+qRtJOOBQYDY9rpizs7vBOmS+m
	MwEXZ5h0i7KUkSb/j8N2o3ylK3ZTMpgYUfA+ZErf9UFqfKjG1rE9RPki4IuhZ7BG
	+FGquIHQ2t+PkUOffKtaEPD3zPxrJ36cnZA8sb0v4KzFnMt/Q77XrE/BMon3ZsrH
	iw7eTQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr9098jn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 06:10:38 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-14364a88479so196495c88.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 23:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790230238; x=1790835038; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/aKERj8vOTgNopINdWRvI+TeRfCoisGCiNjo8nkQDqg=;
        b=FqfDascLYATRqGNcOF7wwlhlbtprTUm9ml219SIvZCJcw+8qaMOf3Sq0LzIQU1lAqR
         x6eoJ3FBZNqDGbCNgS/Q0Zql7nihm2UfpYutHFJ4IaI65o5zb8MM8b9OSP/zCYHLC+Xy
         +DhY5sHc9dfuYK2TKhFK4sx7FRGNVSlWMMJAdPyqajYe38Ipo25w3R/eiv4c/QmAyyX2
         KdoYEFe8GhRE9WmbTvuVPkRJJJoy+fjJTBeUHeSrBSL5dt0R1e4U7xoy9DD3kodkH87x
         j40mgdCgk1NZ4f3AxP+JOE17WjXDQpEDNPcx4Ip5xPS63Pfn+voQTYt8OJhLpeg55oLO
         i9Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790230238; x=1790835038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/aKERj8vOTgNopINdWRvI+TeRfCoisGCiNjo8nkQDqg=;
        b=QuoC/qO7FD0slEExt6at+4TwTEppQ1b7O8avE5QS9gkdkNF4p50K14ipZo/jcvoiGA
         LC0+dBxLplE8715zpDFDhSs6EdIf+6Eg0xABaOLCEUIhC4R+iLi4N2rK+i6dstGcd6Sx
         YJgFeJAFGcbFMHKiFk1KSs/Fc5aI4zQvWh2tcpU2UOqnqVpMwtRJ3ejUfP8hNmC00Yzx
         jKBhRevuZIvBsYHYDWE9+mrXneprcoKpjz2C8s6sCPBYzIgajJrN9iPp6HzTKUqwRxNg
         EzvoLtVqe4hGUjgR5SBFaM2PesNncCvmNsdlY/YvDl5u+JuOXO8IXN14FY3RXyeRNDNX
         +U4A==
X-Gm-Message-State: AFuF++kHRUU41z09XUEwk70EwL4T9riaWISzKR5nCuZDkfNzEvabQ/6m
	WhhyFfKg3afi5sQglhr7x+OSYAvbI2TUj711VlQ4OkZy1KHFepqsLekW5YjPOlzDU+EW657aSJI
	7eBpC6pGAx4s6dcpy1XMCCigpr0x2g+GqHxRjbDPRumAfCOh1DCuG+yRWD1Bi0RrcIDy4
X-Gm-Gg: AYBFou0Ur0GQrAqw9r5ywdJqsI7me/TguMU0X0WL29niFavfwq4wypslPSshdLYl59P
	3Ry70qFUYvbWMlVUlatwEJ486pV968BRgAeHQe0erqd9QTZckEUpwym5GPtQGwmchjltjKtIBg8
	HlIashcDv30aifozhf+WholKjaW+r0UTkAPxvScZCWu2EZ3jT+gwl2EgYnnqUUBI+l4vAF825ok
	3Dalag8fS78cM72f0bgR0Mkh7IEcPgH7fuvWLXRlVhkQKRTTHsK9I39zq++a1PJr5pW3xu/dqeC
	htCEfv9hsYbIg+bvVNbKE2Ie/BkCrINlldwEaJmVQvqC6udk5FOCN41jhNArbM1g2k8T7uVd3U0
	QHQregwTf499KoZohsS0/1q0DqabunvtYmm0Q8olzYtYlwvkK1XINWrBm+nQkRU8I+j02uDVvT4
	gCDZn01T/pf5EqHiPngcgwoorCgq55
X-Received: by 2002:a05:701a:ca87:b0:143:6328:2a93 with SMTP id a92af1059eb24-1450404d562mr983341c88.10.1790230237807;
        Wed, 23 Sep 2026 23:10:37 -0700 (PDT)
X-Received: by 2002:a05:701a:ca87:b0:143:6328:2a93 with SMTP id a92af1059eb24-1450404d562mr983304c88.10.1790230237178;
        Wed, 23 Sep 2026 23:10:37 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9895c1asm10197680c88.12.2026.09.23.23.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 23:10:36 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 11:40:05 +0530
Subject: [PATCH v3 4/5] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-phy-v3-4-088e7be0cfaa@oss.qualcomm.com>
References: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
In-Reply-To: <20260924-phy-v3-0-088e7be0cfaa@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Manu Gautam <mgautam@codeaurora.org>, Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <pza@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfXxXzaAGcvdCae
 sfEHVitHoYkQQeqwUTxI0xUIYdHssNWJpt+/OeANr4mt9eHE8qfBHuPO3KAq8MI2MpOrsnyOJOX
 GwmoL6gNRBqkmkv1J7iZxT7bJH0NS8M=
X-Proofpoint-GUID: ndlAILrD4-x64T0AEHcaL3nu-Rwf70SR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDAyNiBTYWx0ZWRfX/r10+cdYv/7J
 bF5WHCZtNup6/Lr4BkqD+dqUmZbt+Ff4oZrgqu8pVyEQK6DZybfCnstkC0Tc+XkXYPbp5ANhpqw
 zygRyPz5kAnUXhS8g+b2ny1KtY95WFl0HgdIXXJ8bYhka3nXnulH7NO89rx+NBZBR2FNBf0ibIa
 7E9SAW8IVukonGi88PnvNxe3vclTJE9RgdlErsEdygbgQCaGRCYffTMkqhMTj6Fsa609BLd6aHD
 RZ/GLPA3YJybwp4tH/AwcrerMEmEXrK7Lki0YZsgmOg+IFb/S4/aNStOzufK2Habg74pS3J5FFH
 yMwjIauk54Az8eCeczmmyAaabkbYM5LvjGPl1uczNGKU0u/wVB2CV4wLntEuuXP2lOTTJzQ0MJB
 atV9bdLS+ywnPg0MVlB4PwT1ZKoLekRwmieLLQO2C9cusU7/G84OYJ5SZzwrtb8tjpC3UFKwuIV
 8RMJuFrq7QjwgGMLAPw==
X-Proofpoint-ORIG-GUID: ndlAILrD4-x64T0AEHcaL3nu-Rwf70SR
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab4bede cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=dpbSYRCFOxhwq305YcMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240026

The driver currently programs the common PHY register sequence directly in
qcom_snps_hsphy_init(), with the fixed register writes split around the
override parameter handling. This makes it hard to support SoCs that need a
different sequence or different values.

Move the fixed pre- and post-override register programming into per-
compatible configuration tables, and keep the 7 nm override parameters in
the same match-data structure. This allows the driver to share the common
sequence while adding SoC-specific sequences for future platforms such as
IPQ9650.

Additionally, address the register bit field mask & value mixup for
USB2_PHY_USB_PHY_REFCLK_CTRL in qcom_snps_hsphy_init() and USB2_AUTO_RESUME
in qcom_snps_hsphy_suspend().

Fixes: 51e8114f80d07 ("phy: qcom-snps: Add SNPS USB PHY driver for QCOM based SOCs")
Fixes: 0d75f508a9d56 ("phy: qcom-snps: Add runtime suspend and resume handlers")
Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 126 ++++++++++++++++----------
 1 file changed, 79 insertions(+), 47 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 980ad1fb1e2e..b6bbf2b570c7 100644
--- a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
+++ b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
@@ -104,6 +104,20 @@ struct phy_override_seq {
 	u8	mask;
 };
 
+struct phy_reg_config {
+	u32 offset;
+	u32 mask;
+	u32 val;
+};
+
+struct phy_config_data {
+	const struct phy_reg_config *pre_tuning;
+	const struct override_param_map *override;
+	const struct phy_reg_config *post_tuning;
+	const u32 num_pre_tuning;
+	const u32 num_post_tuning;
+};
+
 #define NUM_HSPHY_TUNING_PARAMS	(9)
 
 /**
@@ -193,7 +207,7 @@ static int qcom_snps_hsphy_suspend(struct qcom_snps_hsphy *hsphy)
 		usleep_range(500, 1000);
 		qcom_snps_hsphy_write_mask(hsphy->base,
 					   USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					   0, USB2_AUTO_RESUME);
+					   USB2_AUTO_RESUME, 0);
 	}
 
 	return 0;
@@ -383,13 +397,40 @@ static const struct override_param_map sc7280_snps_7nm_phy[] = {
 	{},
 };
 
+static const struct phy_reg_config hs_5nm_phy_pre_tuning[] = {
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, UTMI_PHY_CMN_CTRL_OVERRIDE_EN },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, POR },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, FSEL_MASK, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, PLLBTUNE, PLLBTUNE },
+	{ USB2_PHY_USB_PHY_REFCLK_CTRL, REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1, VBUSVLDEXTSEL0, VBUSVLDEXTSEL0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL1, VBUSVLDEXT0, VBUSVLDEXT0 },
+};
+
+static const struct phy_reg_config hs_5nm_phy_post_tuning[] = {
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2, VREGBYPASS, VREGBYPASS },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
+					 USB2_SUSPEND_N_SEL | USB2_SUSPEND_N },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL0, SLEEPM, SLEEPM },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0, SIDDQ, 0 },
+	{ USB2_PHY_USB_PHY_UTMI_CTRL5, POR, 0 },
+	{ USB2_PHY_USB_PHY_HS_PHY_CTRL2, USB2_SUSPEND_N_SEL, 0 },
+	{ USB2_PHY_USB_PHY_CFG0, UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0 },
+};
+
 static int qcom_snps_hsphy_init(struct phy *phy)
 {
 	struct qcom_snps_hsphy *hsphy = phy_get_drvdata(phy);
+	const struct phy_config_data *data;
+	const struct phy_reg_config *tmp;
 	int ret, i;
 
 	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
 
+	data = of_device_get_match_data(hsphy->dev);
+	if (!data)
+		return -ENODEV;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	if (ret)
 		return ret;
@@ -414,24 +455,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 		goto disable_clks;
 	}
 
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
-					UTMI_PHY_CMN_CTRL_OVERRIDE_EN,
-					UTMI_PHY_CMN_CTRL_OVERRIDE_EN);
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL5,
-							POR, POR);
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0,
-					FSEL_MASK, 0);
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
-					PLLBTUNE, PLLBTUNE);
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_REFCLK_CTRL,
-					REFCLK_SEL_DEFAULT, REFCLK_SEL_MASK);
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
-					VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL1,
-					VBUSVLDEXT0, VBUSVLDEXT0);
+	for (tmp = data->pre_tuning, i = 0; i < data->num_pre_tuning; i++, tmp++)
+		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);
 
 	for (i = 0; i < ARRAY_SIZE(hsphy->update_seq_cfg); i++) {
 		if (hsphy->update_seq_cfg[i].need_update)
@@ -441,28 +466,8 @@ static int qcom_snps_hsphy_init(struct phy *phy)
 					hsphy->update_seq_cfg[i].value);
 	}
 
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON2,
-					VREGBYPASS, VREGBYPASS);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					USB2_SUSPEND_N_SEL | USB2_SUSPEND_N,
-					USB2_SUSPEND_N_SEL | USB2_SUSPEND_N);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL0,
-					SLEEPM, SLEEPM);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON0,
-				   SIDDQ, 0);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_UTMI_CTRL5,
-					POR, 0);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL2,
-					USB2_SUSPEND_N_SEL, 0);
-
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_CFG0,
-					UTMI_PHY_CMN_CTRL_OVERRIDE_EN, 0);
+	for (tmp = data->post_tuning, i = 0; i < data->num_post_tuning; i++, tmp++)
+		qcom_snps_hsphy_write_mask(hsphy->base, tmp->offset, tmp->mask, tmp->val);
 
 	hsphy->phy_initialized = true;
 
@@ -495,14 +500,38 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
 	.owner		= THIS_MODULE,
 };
 
+static const struct phy_config_data hs_5nm_phy = {
+	.pre_tuning = hs_5nm_phy_pre_tuning,
+	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
+	.post_tuning = hs_5nm_phy_post_tuning,
+	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
+};
+
+static const struct phy_config_data hs_7nm_phy = {
+	.pre_tuning = hs_5nm_phy_pre_tuning,
+	.num_pre_tuning = ARRAY_SIZE(hs_5nm_phy_pre_tuning),
+	.override = sc7280_snps_7nm_phy,
+	.post_tuning = hs_5nm_phy_post_tuning,
+	.num_post_tuning = ARRAY_SIZE(hs_5nm_phy_post_tuning),
+};
+
 static const struct of_device_id qcom_snps_hsphy_of_match_table[] = {
-	{ .compatible	= "qcom,sm8150-usb-hs-phy", },
-	{ .compatible	= "qcom,usb-snps-hs-5nm-phy", },
+	{
+		.compatible	= "qcom,sm8150-usb-hs-phy",
+		.data		= &hs_5nm_phy,
+	},
+	{
+		.compatible	= "qcom,usb-snps-hs-5nm-phy",
+		.data		= &hs_5nm_phy,
+	},
 	{
 		.compatible	= "qcom,usb-snps-hs-7nm-phy",
-		.data		= &sc7280_snps_7nm_phy,
+		.data		= &hs_7nm_phy,
+	},
+	{
+		.compatible	= "qcom,usb-snps-femto-v2-phy",
+		.data		= &hs_5nm_phy,
 	},
-	{ .compatible	= "qcom,usb-snps-femto-v2-phy",	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_snps_hsphy_of_match_table);
@@ -541,11 +570,14 @@ static void qcom_snps_hsphy_read_override_param_seq(struct device *dev)
 	s32 val;
 	int ret, i;
 	struct qcom_snps_hsphy *hsphy;
-	const struct override_param_map *cfg = of_device_get_match_data(dev);
+	const struct phy_config_data *data = of_device_get_match_data(dev);
+	const struct override_param_map *cfg;
 
-	if (!cfg)
+	if (!data || !data->override)
 		return;
 
+	cfg = data->override;
+
 	hsphy = dev_get_drvdata(dev);
 
 	for (i = 0; cfg[i].prop_name != NULL; i++) {

-- 
2.34.1

