Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D47C3FA5F1
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784199572; cv=none; b=aCiRYaH0pUFhMhCeZ7XtRXWyOfD800Lot5mlWlKmAdhM7WV0BFAJevZ1G7lW+Ls9xlzwr8cU23GsOO3DqZR7PyylVpPcG5y17C2gkKnibkB9byS/wOQqIx95SVqffVOxzDHD6D9wXYg8vaAXzcHJSuW84Kii7L9zcOGJVkAay20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784199572; c=relaxed/simple;
	bh=m/IS8SY0Y5UMnBDUOucpxn6BfOHeUPPCjbWpo2UY09Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OPXu+k0dbMigwwFNAPtQF3GECLLNu5ipzKhoV60wSG3GHqhmv/3xrKmuDPpuYh/05cGx1w3LMiGG0I21URlwZAAw8xmaKGnfVh9wbWmLGFa2lcI0uSYGH23mccLoJsR3yD+c8Sq8iP7NL4PFElWz+TrU2WhspbmPKXYTQRgxhnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eBdKQ8ZJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QR+BtN89; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eBdKQ8ZJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QR+BtN89"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G9reaR2415976
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:59:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uGUKJAEWTqF08TG7LOKkRvuqQq/ZKgYfhqqPumRE7ZU=; b=eBdKQ8ZJbgrhkUfl
	++N/CBCb4n8PP8K32lURWJ0bFqkAWcTdY4YOT6j9x68Q+BlSMZy7ug6MeEEadVhg
	kVoC4jHiLieerjjy4k0IGB74+oKMv5NFN+o2P1g34cfEnXmmh+d4hl1Ur2WM7X0V
	1gO2daKAPXgSZ/nN9eH/OlEmm3ojN/YYN89wRo+zY8LE+uIDAtHzqLVRzcLOtAmS
	P8tQRJbWzjbIRYtZHHL9cHU3R7CFG9Z9HgoBreAPpBnWDnNPHv6Dgy/szpGN0fZr
	EyXdjVQqiPvJ2J/bqmX0Jq6ngervvuGC8+xdA1TeBIdZXLy1W3ZcNV5hpDrinNDY
	Se+ZsA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feve1rfk6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 10:59:29 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9151bf6ce7so7258820a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 03:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784199568; x=1784804368; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGUKJAEWTqF08TG7LOKkRvuqQq/ZKgYfhqqPumRE7ZU=;
        b=QR+BtN89aeRHdcGHWbPgqQoaQ3GTMg32Z7lGJw+D/QG4Xt1AgAb97D33fNu0giuMLq
         M75B/dqFlTeqfdt0hrMVormZuDeuS9y8i2KG8ziXcL/6OxoHYrd5s+tduD2wbFRUagEn
         E6iSQvCiEfQSiQE9jFU3c5j42zA2H8j5IQIKR1TqWSjqomt9iO3hK11Bcgd1BcNUh/08
         TIg76zWt/33d7JV9qvq7zNaBHLKG4OZv682djd4jo5GBwFkTpYSxZhP6VAtyDjGSEEL6
         BocEl3ief0TsCznrXpiiuzl/qx+Hqs72GTthOWkm26iQdrJCN7uh6B0ZCDsXMH7Mupkb
         bPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784199568; x=1784804368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uGUKJAEWTqF08TG7LOKkRvuqQq/ZKgYfhqqPumRE7ZU=;
        b=OXhbhUoO8CMwzYPyzz2bxpUENwsjJ/Nb3c24aizRedIWnqkekhhkXZoPaEMucqWc0C
         gZ8shveugsPGyppWmdanKBKotJOyP3Qx0GfakkMt2fDB6dpBUAR+KY6+sDlwOE6nkYVp
         WYglsgRj4lOlBFQg20SlAeaKEbXjBO9mLHOiuEUPVp2XTXrmg8OReFINanACrR2pX+jC
         CSJEC7gewxpGDRWPlHb8QsIEuqG2NqgT5PM61bEn0boqxHK+xh44m+D3cu/RfDR0jj3K
         Hg6u2S1hosFcp01PtaK6CiPFDzIIG++Jj7abrZHIWV41H9yJkr3en8fHEMladwl9YTlw
         r4Ow==
X-Forwarded-Encrypted: i=1; AHgh+RqvficIpuVBtb7tsAWPT7woIcni3X1dWTCoA46Gj8PStClh8AMKC/lC+Y2C+TkiFUrGaMiQkT2IqvmOM0N5@vger.kernel.org
X-Gm-Message-State: AOJu0YwUgpvs1P0QC6BEd/CbFWknsT81YxzU9zocP1Ut+JHVmyqJYH3x
	fyD1D1pb88HNHNccB26ecGOnQ9qgYerhzfSiXg8Tb3pTv1tz4o/5BNav3jLfvftEBAO9d7UkcFr
	O1GbECtsBM8oIQc5mxj6CvUJ8ie7ZWS9Vp8hRjZE0u673s+pBByRy0cwMXmPk6ZlOlbGr
X-Gm-Gg: AfdE7cky++rp1CfaMXKyvowOccgumsWlTjz47ziXuPvdP/7ThbqZMnwGaAw2iDDXcot
	+wYYxHvBgfCHZrya7ingyQkM9EyO9lE1PnAsK+Oz4SmoHHiP00NE2gKd+Y34IKEldDWAJ8F/iJI
	uDqPC2YTlb8qBVB2jjUZiAc/yYMzXdbq1qMHit3I6YwKRsJiNY8dbOiaQFVGMMiWHcN8GMb9vyn
	F6VaH0a9Vnp33gpcn5j9ecAmA2g5hPLG0a4bSp2ftyUgJCOtxOqFgAN/bj4TAFbg6W3WlWGPb05
	MhZyvXspxYLi4PNUWwbxAXLyEfha+OL9IXZEA7pCVlHdJbdL4TfvVCeqSYRI7/rL+miM8sdcEKj
	JDNIHuC86VIhaQr8T9EkDeH4f
X-Received: by 2002:a05:6a21:329d:b0:3bf:a638:4371 with SMTP id adf61e73a8af0-3c357313267mr12241808637.10.1784199568439;
        Thu, 16 Jul 2026 03:59:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:329d:b0:3bf:a638:4371 with SMTP id adf61e73a8af0-3c357313267mr12241777637.10.1784199567998;
        Thu, 16 Jul 2026 03:59:27 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13cd432e848sm11175385c88.9.2026.07.16.03.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 03:59:27 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 16:29:12 +0530
Subject: [PATCH 2/2] clk: qcom: negcc-nord: use clk_regmap_phy_mux for USB3
 pipe clock srcs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-b4-nord-pipe-clk-fixes-v1-2-e4f583633356@oss.qualcomm.com>
References: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
In-Reply-To: <20260716-b4-nord-pipe-clk-fixes-v1-0-e4f583633356@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfX2YGDzYpbaKYC
 lTK2+bnRc1KQNUooP+0+XMXkZzPKpsfWrSyys/wENas/iLP8DzuzSTHbHOx+PfIql9L7k5gZ6cp
 BwUsFK60U/rClZPViKDeG//sI3o73OSMIzT6impCeH0NHQ37ih1/x5FIvxPMXxeO5Y/y55Fzcgw
 +RinMV244lJNJ83+OMZZHCrQ/xqlPphu4m4KfzLh/e++8iRDi47A7/jo1aVbfYU0nX+Ns4u9pXi
 /WkG+q83CrHypVPTYmjpxy06tdnbWCDA493nmIBgHmtyz3Ul+L9+REYg8pq53fQZMekCaFs4JdY
 UIat10UEqA0AYI3K1XJd9IM1w5l0cAQZLtdiBwgZqkB0s+rlFRePIO4p52DIKNF7zSqu8d+gfR1
 ELOEww3shZl/50Cvt5BKooR5ibuqoMjjLZLoD99On/hoz5ZTBrpqAjB+NIV+AvzEusmSNb32VJm
 j3M3UyJx1ly3MESNWKA==
X-Authority-Analysis: v=2.4 cv=DvpmPm/+ c=1 sm=1 tr=0 ts=6a58b991 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=pPQLn2__wvtNpd6-jXMA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: dtAcWOYdKMzYFNUGE9ecGP4D6wVQ7xxD
X-Proofpoint-ORIG-GUID: dtAcWOYdKMzYFNUGE9ecGP4D6wVQ7xxD
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDExMiBTYWx0ZWRfX2SCKEV1Pomrl
 c/dj6C8dFLgTeohisL4NR/Po0nCikz4UrHG+cN4lNGbL/N/5meEIsosPZKNKqSEkptEqw5Gd5mg
 wZeU96qM14fDFeHPsecw1Du7CyZfVBk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160112

ne_gcc_usb3_prim_phy_pipe_clk_src and ne_gcc_usb3_sec_phy_pipe_clk_src
are 2-bit muxes selecting between a PHY-sourced USB3 pipe clock and
BI_TCXO, implemented with clk_regmap_mux_closest_ops. This requires
manual parent switching and does not park the mux on the reference
clock when the clock is disabled.

Convert both to clk_regmap_phy_mux with clk_regmap_phy_mux_ops, which
automatically parks the mux on the XO/ref source on disable and
restores the PHY parent on enable, matching the existing UFS symbol
clock conversions in this driver.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/negcc-nord.c | 49 +++++++++++--------------------------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/drivers/clk/qcom/negcc-nord.c b/drivers/clk/qcom/negcc-nord.c
index 3427a0375373c6843fd6bb02e0e05e51380b15ab..57b90f11bc06834a68adb3bac9911967ffa60d55 100644
--- a/drivers/clk/qcom/negcc-nord.c
+++ b/drivers/clk/qcom/negcc-nord.c
@@ -16,7 +16,6 @@
 #include "clk-rcg.h"
 #include "clk-regmap.h"
 #include "clk-regmap-divider.h"
-#include "clk-regmap-mux.h"
 #include "clk-regmap-phy-mux.h"
 #include "common.h"
 #include "gdsc.h"
@@ -41,8 +40,6 @@ enum {
 	P_UFS_PHY_RX_SYMBOL_0_CLK,
 	P_UFS_PHY_RX_SYMBOL_1_CLK,
 	P_UFS_PHY_TX_SYMBOL_0_CLK,
-	P_USB3_PHY_SEC_WRAPPER_NE_GCC_USB31_PIPE_CLK,
-	P_USB3_PHY_WRAPPER_NE_GCC_USB31_PIPE_CLK,
 };
 
 static struct clk_alpha_pll ne_gcc_gpll0 = {
@@ -165,26 +162,6 @@ static const struct clk_parent_data ne_gcc_parent_data_5[] = {
 	{ .index = DT_BI_TCXO },
 };
 
-static const struct parent_map ne_gcc_parent_map_6[] = {
-	{ P_USB3_PHY_WRAPPER_NE_GCC_USB31_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data ne_gcc_parent_data_6[] = {
-	{ .index = DT_USB3_PHY_WRAPPER_NE_GCC_USB31_PIPE_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct parent_map ne_gcc_parent_map_7[] = {
-	{ P_USB3_PHY_SEC_WRAPPER_NE_GCC_USB31_PIPE_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data ne_gcc_parent_data_7[] = {
-	{ .index = DT_USB3_PHY_SEC_WRAPPER_NE_GCC_USB31_PIPE_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
 static struct clk_regmap_phy_mux ne_gcc_ufs_phy_rx_symbol_0_clk_src = {
 	.reg = 0x33068,
 	.clkr = {
@@ -227,32 +204,30 @@ static struct clk_regmap_phy_mux ne_gcc_ufs_phy_tx_symbol_0_clk_src = {
 	},
 };
 
-static struct clk_regmap_mux ne_gcc_usb3_prim_phy_pipe_clk_src = {
+static struct clk_regmap_phy_mux ne_gcc_usb3_prim_phy_pipe_clk_src = {
 	.reg = 0x2a078,
-	.shift = 0,
-	.width = 2,
-	.parent_map = ne_gcc_parent_map_6,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "ne_gcc_usb3_prim_phy_pipe_clk_src",
-			.parent_data = ne_gcc_parent_data_6,
-			.num_parents = ARRAY_SIZE(ne_gcc_parent_data_6),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_USB3_PHY_WRAPPER_NE_GCC_USB31_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux ne_gcc_usb3_sec_phy_pipe_clk_src = {
+static struct clk_regmap_phy_mux ne_gcc_usb3_sec_phy_pipe_clk_src = {
 	.reg = 0x2c078,
-	.shift = 0,
-	.width = 2,
-	.parent_map = ne_gcc_parent_map_7,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "ne_gcc_usb3_sec_phy_pipe_clk_src",
-			.parent_data = ne_gcc_parent_data_7,
-			.num_parents = ARRAY_SIZE(ne_gcc_parent_data_7),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_USB3_PHY_SEC_WRAPPER_NE_GCC_USB31_PIPE_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };

-- 
2.34.1

