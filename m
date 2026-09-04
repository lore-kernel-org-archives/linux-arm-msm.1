Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42DE851FCD7
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Sep 2026 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788547876; cv=none; b=nr3XULl7uHA1vI4cD0MVfZOB1U/6Q6p0/V/0LOBBIvrYRnqLbx27qGTlM9Ea/eAR7+doWyWLSdr9YsT8W1k9yaB9JggTbPVXrp23PxRISGKfveVxl5IMM1p7qzz7bnC7SQyWJ99+V1p3Dnk5P7ztSjECgkHJ9RA6sLi4sUL+/6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788547876; c=relaxed/simple;
	bh=AGd8PVFjejRaBqOqc+Hed7Vw8Z/bsMaaQEaAP++NI+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YX9ykxACIClWpigMp7aTaW03tmJRAWDH5ZYcsuEnFP9g0CzQOtJ4J8F6a3Uptp4zhX7E/jlH+GyE0KbppUGg+AncqyhXvlhfLEE5wHsmZq2mbSNvZEfA0cWxUecDev29rkK/80XjK3f/SSxtFRpAvyPIAlDfNz9BgrdrMREjl1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YuO3GkF2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IfBDkY1L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YuO3GkF2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IfBDkY1L"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 684HI3mD548685
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Sep 2026 18:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lMSGUWNgzAszcw7Mtld+PV5sp7Qc3oZxRDMjw/JIqg0=; b=YuO3GkF2XdbhUMj0
	RoyNK5pn1JYOAR2wuhJKh9JYihbGxzohBa0BPg3DclutJrJ8uinaS/8XtmdAlRne
	GytVELSeT7SIdXVqBz0lT1sGAXne+3vkALVzRAxdy4pYZ/ahurkOtn6mTAKH3cHL
	rwPavutyQdr6UfhrQ1lBAQ5nDJfwekWEIcXOS6qHxSU00U+PGoWUi4ndBq/9Mhky
	wkWyBfPyTQCEks8aFfzWnKHkQobWk1Jxybjei4ebnuGCu9m7fF72ViGKTEoutKXe
	i5V7r6og5LsXDT8BXxfm7b2t92VIEV1ugB5aMDIwcf603bgqvJijV81PNa0j5fxx
	GzyvMw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gg0121hdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 18:51:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398d0010cfaso2653655a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Sep 2026 11:51:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788547872; x=1789152672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lMSGUWNgzAszcw7Mtld+PV5sp7Qc3oZxRDMjw/JIqg0=;
        b=IfBDkY1Lj4+6xbr5U7d0u0cBB9cOjXlhsJufI8fqJ5ZKwrl5qMLyHgG8xfuiDlp5RA
         BN/ZSLYGfF7oJGofLD8OOWnXPUx+MThikUC8LRcOXo39R1m4DBOfj7DD75GTB8BHPG+J
         VjCYGbOd8eyZsgp3Ni9L8/LHwFW7FQJblWlst5lnp9/WgTc8hTfOSzgqKqjASAZR2vqU
         2OgnFd0FLCybeciufH0D7AdHu0fwlH1Y7VWAO+TO4LUSDLtmkHWod7nFKcvHy2xA1Xnp
         vHVV9tnAVmRbgorKw/bjH1fHwwhUELaQyNTIPuGcsRKEYt/GHjrtL2pgH06UgUIJV+Yq
         oEiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788547872; x=1789152672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lMSGUWNgzAszcw7Mtld+PV5sp7Qc3oZxRDMjw/JIqg0=;
        b=nGuYkR90+im5IEO1iL0sqxGw17to+IjvFMVi4qzZyaqa8eowXSaZn5/FTJjDJPv1Dh
         2eR1khQcbpiAFK9+7R0ncbngjg0uKAVvsT8BGBQ6qzzk6vPUTn4eQMKPu880ee7HxSaK
         t5zqmV1pg967TdxbDVZZNUXW3wGOlR08Pm4FakgzRdQxtSBDz2zImwad6gLjZ/qPf9ao
         2vkv6NU9nFIXu+qJsgF01ep5+lkhsh5L171DyAvkI6cTLFiITnZYNmVq6g4PFDCsfkN0
         YEk9CooxMprxAu/2FAHOFLFRvW8UBSm393P9sce31lZQ9v4qEZbka7HCaB49o0hGL8V0
         IEgQ==
X-Gm-Message-State: AFuF++n55HBI3Mev5XnCyu9WiwZ3bbB37rYTkPT1gKQWMuh+3yj5cZZY
	VMS+SgtSJRwyqJkAOnTUI5A20ivvIO+y7bIRyvKMuhLj2bNW4SB72kC6hiG+mFKhXR4xEWrtUIr
	CVmXlbTiefLpplX7E38u+uU/y7v/SDPqy8K5TbRJ39B0d4bSt/T+n7FWB6P75aweE49Tx
X-Gm-Gg: AYBFou1B6xIdbB6ttt3kS0mN8wTe0cN7N0W5wJ6fl9yeRgI3Ci3gG09/wFjg0ypN6Ax
	vkrHk3zbO5s3Sr49rPY2LpFImjJzkW+Kw1MfjlDqBa1lUvlLSk6ysCGcmsgl1CnhXsx6myAVvEE
	PGv/L2LNjvSJFMAsDG0WubQv8hPEO9lDMTTwXwkbU1/yyRp/9/Du5Xsy8Y/D+JM0sLhtqcJe6Ku
	w5zmBH9m0C7PWJG86KUQTTZ1Qi4Y2HkNTomBnLmqkA2OQsb5LK4Zsrhjzf4GcpIxPM31C1IbdYV
	d2GzcBAMNJFrV3cb8RXEpMQhrHnhfOOmtb6EG31/y1IlkUV1vr2I3LPxnNDHpCV8DLqowgBPgNb
	03GorJBkXFSJMv7K05p3nxEz8tYyT0lU=
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr14332818a91.16.1788547872122;
        Fri, 04 Sep 2026 11:51:12 -0700 (PDT)
X-Received: by 2002:a17:90b:1343:b0:38e:9eb2:9d43 with SMTP id 98e67ed59e1d1-39b261b1bcfmr14332716a91.16.1788547871596;
        Fri, 04 Sep 2026 11:51:11 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339b9f68e4sm8682644eec.24.2026.09.04.11.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 11:51:11 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Sat, 05 Sep 2026 00:20:44 +0530
Subject: [PATCH 3/4] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops for
 GCC UFS muxes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-glymur-ufs-clk-changes-v1-3-cdff2c67a8c2@oss.qualcomm.com>
References: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
In-Reply-To: <20260905-glymur-ufs-clk-changes-v1-0-cdff2c67a8c2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX9GQPCvd4b63a
 pR320XSnQDm9/gG8lsVsiJ83zXSRnm4K5wRzUgFOGu4w2dnP8PoWEqMU59NjuKe3fmZKdogofcp
 b5H3TO86L/26d/cBLX5QqzNqDSw8XQY=
X-Proofpoint-GUID: It2-pmcT6YvwIRku2wcu3hgzy76uDH9u
X-Authority-Analysis: v=2.4 cv=LreiDHdc c=1 sm=1 tr=0 ts=6a9b1321 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=dqVVpOBFKaflNhj4CZAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: It2-pmcT6YvwIRku2wcu3hgzy76uDH9u
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDE3MiBTYWx0ZWRfX8ce0h1ov2Cgy
 dCANEgyqdhgLNtKsajraaRlxBMJ/5Tn5i4MsABkbnxODcH6x9jtCKmwocCPl62U/GehIruB80d/
 6gvLjJh/UhT3QSltq24T/qdATq/XJI/1e74hiIxSxBu1PjN9ab7+9tSsnbYtV+cTorfqIQ1ciE4
 lhVFNC64jp0q9Nqjo8UtmwZClMcXiyWuARasdVGwZ/1AckjeL7dJbxAsikj1Hyaz++X6RORQV7U
 z35wrkG/euCQHeEbZADTLEVGeB+fnIEGC0WgAAKKpgM0JzQKgHiLMd8JdlNt5xodkZxPTiywe0y
 pLzy+KTSImzCpnqBo9bv+mXl3qKttcX1/ndlt6opr5jjhOSRlMNMcJgQ1ISVX3bMo23+RgOcrHv
 G24xLYDpU5ihZXWgGVRjsp4Bjrv8kpUHQSJ5pI/zfcrCZ9O2oPGlEAoYs9cfLbl0UPwoOEy4Sbq
 oio3+PUfmYCZYLznkCg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_05,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609040172

Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
automatically switched to UFS external symbol clocks during enable and
safely parked at XO clk during disable.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-glymur.c | 69 +++++++++++--------------------------------
 1 file changed, 18 insertions(+), 51 deletions(-)

diff --git a/drivers/clk/qcom/gcc-glymur.c b/drivers/clk/qcom/gcc-glymur.c
index 2ee4820b6fdfb1ad2cdb15366cf746651fc1a36a..a47a2c6b961ba01edc69be91e299a190f4662c3e 100644
--- a/drivers/clk/qcom/gcc-glymur.c
+++ b/drivers/clk/qcom/gcc-glymur.c
@@ -481,36 +481,6 @@ static const struct clk_parent_data gcc_parent_data_17[] = {
 	{ .hw = &gcc_gpll0_out_even.clkr.hw },
 };
 
-static const struct parent_map gcc_parent_map_18[] = {
-	{ P_UFS_PHY_RX_SYMBOL_0_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_18[] = {
-	{ .index = DT_UFS_PHY_RX_SYMBOL_0_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct parent_map gcc_parent_map_19[] = {
-	{ P_UFS_PHY_RX_SYMBOL_1_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_19[] = {
-	{ .index = DT_UFS_PHY_RX_SYMBOL_1_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
-static const struct parent_map gcc_parent_map_20[] = {
-	{ P_UFS_PHY_TX_SYMBOL_0_CLK, 0 },
-	{ P_BI_TCXO, 2 },
-};
-
-static const struct clk_parent_data gcc_parent_data_20[] = {
-	{ .index = DT_UFS_PHY_TX_SYMBOL_0_CLK },
-	{ .index = DT_BI_TCXO },
-};
-
 static const struct parent_map gcc_parent_map_21[] = {
 	{ P_GCC_USB3_PRIM_PHY_PIPE_CLK_SRC, 0 },
 	{ P_USB4_0_PHY_GCC_USB4RTR_MAX_PIPE_CLK, 1 },
@@ -907,47 +877,44 @@ static struct clk_regmap_phy_mux gcc_pcie_6_pipe_clk_src = {
 	},
 };
 
-static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_0_clk_src = {
 	.reg = 0x7706c,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_18,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_rx_symbol_0_clk_src",
-			.parent_data = gcc_parent_data_18,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_18),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_RX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
+static struct clk_regmap_phy_mux gcc_ufs_phy_rx_symbol_1_clk_src = {
 	.reg = 0x770f0,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_19,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_rx_symbol_1_clk_src",
-			.parent_data = gcc_parent_data_19,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_19),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_RX_SYMBOL_1_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };
 
-static struct clk_regmap_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
+static struct clk_regmap_phy_mux gcc_ufs_phy_tx_symbol_0_clk_src = {
 	.reg = 0x7705c,
-	.shift = 0,
-	.width = 2,
-	.parent_map = gcc_parent_map_20,
 	.clkr = {
 		.hw.init = &(const struct clk_init_data) {
 			.name = "gcc_ufs_phy_tx_symbol_0_clk_src",
-			.parent_data = gcc_parent_data_20,
-			.num_parents = ARRAY_SIZE(gcc_parent_data_20),
-			.ops = &clk_regmap_mux_closest_ops,
+			.parent_data = &(const struct clk_parent_data){
+				.index = DT_UFS_PHY_TX_SYMBOL_0_CLK,
+			},
+			.num_parents = 1,
+			.ops = &clk_regmap_phy_mux_ops,
 		},
 	},
 };

-- 
2.34.1

