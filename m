Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8107A3A5445
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 04:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791521438; cv=none; b=JzeeqgTHfjyM5bikQEp76J5SIKLWljZFBAw7Vquej++1mwXC5rQft5kv3WMv2Z0kR+JLTnK6sgAnx3XUHqvKB6mie5bVVSobjMHmcr6WnQCT/6hBl4t0rawvCDybfi0GKJiXdgvuwU43jX3z//t1J4Yi47HOhz/HKS457M1+RdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791521438; c=relaxed/simple;
	bh=Swbffk7gSaWY0Wx8h7GWibLTdR+plzDCp23uNbU2Mss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pAfkT4M73kg14nI7Wm6UhKePM2lA/rbcw7AGN5qdjZZiUkG+ZVnIUWZyqM19qPDPOhwkVXyiTwjf0YP01vV6YRapzGtseq05myico/E1Si3Echeo068o85Zgy/C1M7y5bQ4dIlFksP+EyUaTH2Gq8Uvj/yLx4C4OJxk3JumuVDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kP0nvFZC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7hfbsmz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kP0nvFZC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7hfbsmz"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6993HPKo3768962
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Oct 2026 04:50:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUVEH4qPe/WvTV01E7edf1dmd38bUwh693Oze6d4mZM=; b=kP0nvFZCcq/POuD5
	B36ovih/5KeWFVqfYzFKvk4wMHHiqs0cpla4FQ5oXsPWRyj6mMg1dBs/GQw4JsI1
	V48td2D7LEIE6GjLTaxHumkY/GV2W4o6P4Duavi7/uhCalyDyV6P5PfJBPq91jFL
	9FTlzqa+i3rhaZYINIGztrTB5qJIct+v+dku14JojW2a9ihJJ8MhFITSbNgM0VXB
	gms/ohg137/Dg7DZZvbPEHeN1/2Hx2N5aITNmiDe+xeLmpyeRq+KTXcJJros2TWr
	2BQajE1Sz56trN3cBjSmUlM7tQYH0mAQLZR+I4WGHAHTx5SgGi+VDhi3C/Ft5Lx6
	OT0grg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxu1wnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:50:36 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-152d1363a29so12908805c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 21:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791521435; x=1792126235; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qUVEH4qPe/WvTV01E7edf1dmd38bUwh693Oze6d4mZM=;
        b=a7hfbsmztKLPqv4th00Ruk/Ksdvzllv/uBp+eFbXeVfvO8P0LPtOhsGq8uzED+is4g
         r3J9eFNSCy13nJGMSd13uQMEJOKS42acXTmhq5S44vqg9fK9Sb70naBbX3UR95ervND/
         UT1m+gqP2mfIKKYMhlcr4xqvAltcHNkPd4T4Mr5wqJTJIiTs/uoxIoVbz6uRMdUrdGwr
         oddk8C6D7opZJoyp9h9zrUptrwLEwRv04vAECIJgMyiHUs1PjfNG4VaAJHiN3kJwNoKY
         lcnaToc0qfogE3MDYJKWKsUOmaLsSLcPx7E2B7KDHDnXE1ZLQFnAB8a3SssESUBWX4J3
         n3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791521435; x=1792126235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qUVEH4qPe/WvTV01E7edf1dmd38bUwh693Oze6d4mZM=;
        b=pzbMWfXM91tQ7l+/YbG0Y1cvvQBCEhxBlDgm86KDhXU32g5bxrB3pIM1Wo3gv4ATDs
         zufwnJW6cweLB3NzOptdhcSAUtVcEoIxconmIUdOkpJvtxmO36SUTthTcx174Hk5vzXZ
         4ANXcJLRA5rWdlXnNSkDoXVrol+bYG0WUPXam3jZ+SPuEeZD8OVvp21nvmV9uWNrGZRc
         9czYCJdlKJ7tUC/yzhIXuVNVt1tkGhh2bRwpN+MBDhqMXmLhrVGNb8N0Uti4z9XIp9Lv
         4EzhL4rCNvU/FIMwHBiOZWY0qwkCSTHsTpwH3L/fniaf6LE1NDMQtjjj4btZfgZMnxBl
         by5w==
X-Gm-Message-State: AFuF++kau6zPBsH84vvlble06LCJjMh7WVBfv75p3JGcdmzgMUQsaIOx
	j33QM3DAWD6Xk66X8DVFnUsUpu4gl94vIwGGCAJm/sywvk4Yp5JSjQMWW7MwcrDjKI/bl47FIk6
	SrlVKoO4B+13NR1UJLwgb8Xe93/mQfLtJL4j+tbbaEHPW5K7fszpo4Z91KCKbAKSwhll8
X-Gm-Gg: AYBFou3yvJ/Bl6j2E/C0V28KCBobie2Lu9XAH6RDIcM9qERN/l8lYNG861clHfo8+zP
	+20kKaKUZE2eqW0Cw4FZ9a7ufpx9RuDa5hPxnIpMA3vFS1dri9T/xbKWnXIqNrKkTloR8AY7Emu
	69vwh2d7oKfQxnb3zshXfp+E9yFj4VsMDeReUU6UWJl34eAtrI40Mir1zhgo0mILZmMVLbj/gJY
	B/JWpArTC06SHWUxPRnhmTAyzLD1aCp6sVQ4VhNOzEfPN5ENG5/o14rk7Tf1TFOJE0pIlhBnc9T
	Svk/i5CMrztDYD+RAPpSbah6/OEOPVA2A3qJahx1XWyO674iaxlV/ZnzvSadVPHXD7S0O2Ub9on
	mY0zSsPRzIL2SyarJg7wtPzQ9Jw11tvT91UmLSdczpgs/KeCogZEQReqF5WCmp/Cc30B3fKr8cd
	kggAapUUHjh7gxiap1zTLAQc1SDm72XQ==
X-Received: by 2002:a05:701b:4518:20b0:163:d97f:96f3 with SMTP id a92af1059eb24-16a55481281mr929364c88.4.1791521435036;
        Thu, 08 Oct 2026 21:50:35 -0700 (PDT)
X-Received: by 2002:a05:701b:4518:20b0:163:d97f:96f3 with SMTP id a92af1059eb24-16a55481281mr929330c88.4.1791521434444;
        Thu, 08 Oct 2026 21:50:34 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm4151609c88.16.2026.10.08.21.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 21:50:34 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 09 Oct 2026 10:19:59 +0530
Subject: [PATCH v6 5/6] phy: qcom: snps-femto-v2: Move PHY init registers
 to config tables
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-phy-v6-5-50408e45bcc1@oss.qualcomm.com>
References: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
In-Reply-To: <20261009-phy-v6-0-50408e45bcc1@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfX8QDlO8i32xCt
 L4rhtD2Ph3xe3AnK1Qx9E8g1SCV7dydv7e5xbTek79k4/e8m9leSwnOrpKbeYS07IEIaGQcSx4y
 xK9NPWAP0O1LRYgsEmK2v4Zj7yCJidB5BK1M4933yDvd2dM5RcmrwMhIZ574baYuWJIwUtAM3+C
 sJMDQKekGxjeGkAmmC9SJ4SQeQ7zK3paiZXJA/WJZnAvXOqXS7A3rVrZnMqZ9ub1x8NwBqnZRcr
 FUfs+RXTQgqz0ikWeUNm2dha+Evm814XJ4Sd5hYvX7T8Ducv0CCLNaKZsET45M+/5/2yLSUaKlg
 ufOcTzF+Jxw8xnXJHDp+htTqHlU5tgVn0H0/5ycuaeTAV7buEfUmZaFOKIh0fDsZzFRPDA+64Xe
 UjK3qCFabJy0wrW9uutGsaXZFUQEvGvWCEQcB6+TrtmPMslK9CfH0y4ASz9jz3GI9CrlwPWaaUZ
 sMRiSRYQhqE7VD0fr9w==
X-Authority-Analysis: v=2.4 cv=QbjzLcbv c=1 sm=1 tr=0 ts=6ac8729c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=dpbSYRCFOxhwq305YcMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-GUID: xVDTtCClS6GZXOpM9-zFmw-HkGiuxrjO
X-Proofpoint-ORIG-GUID: xVDTtCClS6GZXOpM9-zFmw-HkGiuxrjO
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAxOSBTYWx0ZWRfXxPgDxQwiToXU
 vzx2BIMHOgd53rWFik1fuQkXXGns5Rhwg8VS8xulXfgih+uFV1N9Zb3+AYf6lGEdw7U61/94YKb
 fkFIR32WMGBdloXfPATX5FkO9XbVli0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_02,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610090019

The driver currently programs the common PHY register sequence directly in
qcom_snps_hsphy_init(), with the fixed register writes split around the
override parameter handling. This makes it hard to support SoCs that need a
different sequence or different values.

Move the fixed pre- and post-override register programming into per-
compatible configuration tables, and keep the 7 nm override parameters in
the same match-data structure. This allows the driver to share the common
sequence while adding SoC-specific sequences for future platforms such as
IPQ9650.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 129 +++++++++++++++++---------
 1 file changed, 83 insertions(+), 46 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c b/drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c
index 0ead37c0dcfd..2e37b39dabba 100644
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
@@ -383,13 +397,39 @@ static const struct override_param_map sc7280_snps_7nm_phy[] = {
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
 	int ret, i;
 
 	dev_vdbg(&phy->dev, "%s(): Initializing SNPS HS phy\n", __func__);
 
+	data = of_device_get_match_data(hsphy->dev);
+	if (!data)
+		return -ENODEV;
+
 	ret = regulator_bulk_enable(ARRAY_SIZE(hsphy->vregs), hsphy->vregs);
 	if (ret)
 		return ret;
@@ -414,24 +454,11 @@ static int qcom_snps_hsphy_init(struct phy *phy)
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
-					REFCLK_SEL_MASK, REFCLK_SEL_DEFAULT);
-	qcom_snps_hsphy_write_mask(hsphy->base,
-					USB2_PHY_USB_PHY_HS_PHY_CTRL_COMMON1,
-					VBUSVLDEXTSEL0, VBUSVLDEXTSEL0);
-	qcom_snps_hsphy_write_mask(hsphy->base, USB2_PHY_USB_PHY_HS_PHY_CTRL1,
-					VBUSVLDEXT0, VBUSVLDEXT0);
+	for (i = 0; i < data->num_pre_tuning; i++)
+		qcom_snps_hsphy_write_mask(hsphy->base,
+					   data->pre_tuning[i].offset,
+					   data->pre_tuning[i].mask,
+					   data->pre_tuning[i].val);
 
 	for (i = 0; i < ARRAY_SIZE(hsphy->update_seq_cfg); i++) {
 		if (hsphy->update_seq_cfg[i].need_update)
@@ -441,28 +468,11 @@ static int qcom_snps_hsphy_init(struct phy *phy)
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
+	for (i = 0; i < data->num_post_tuning; i++)
+		qcom_snps_hsphy_write_mask(hsphy->base,
+					   data->post_tuning[i].offset,
+					   data->post_tuning[i].mask,
+					   data->post_tuning[i].val);
 
 	hsphy->phy_initialized = true;
 
@@ -495,14 +505,38 @@ static const struct phy_ops qcom_snps_hsphy_gen_ops = {
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
@@ -541,11 +575,14 @@ static void qcom_snps_hsphy_read_override_param_seq(struct device *dev)
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

