Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E164C0409
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789474089; cv=none; b=GrDTMlqarb/Ki6bMEIqc/QG05h9g7/rykHinES4ohBvdSYNp8Mm3iCq22bbnUL+cX0Ap5J1s1H1a6aDaGXL/SCh4NqA0c7U0FoijXfp0SoGfmzPMvNZRRwy4QboGIpvw/pd+6uMjDy+Z/a8m5g/qgLSjqqb7fuvQoAgIXxnor7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789474089; c=relaxed/simple;
	bh=+KlOZu/f2LT1ws+Y4z3u6rNZ6xKFpD84brrnYx3eEWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b5T4oLkpOdkrkjj96atXsLALmxNE6x/eKy9dfDCKwTMOKCmrW0l6Fk8qQoy0kzbhcyeopw4KiaIJ5rcGPHHXm8PCDEpzKzEQnac3nKTRD2pM/WOuNOXquJLSlZuZ+rEl+il3TaX/VUZgUsI1ercP77a2+h5gB1P0n57tCxgeM0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V9ZXZaSB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L0O+I8Ka; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V9ZXZaSB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L0O+I8Ka"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9gvWC2584523
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:08:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qz79aCejNO+w6+x9f0Iot27RiEWAJlB6x4gOUa3o1Vg=; b=V9ZXZaSBWLqKUTwP
	0JPh7D0oNn0U22psWdWlvlwzhbX/AgxBVsYaUtOLfuazKFbIV1ICV4aB1U47bb62
	5suEyH9D7Yks++lzBlsLJe7J+oy5mqLLQPxaZ8NVYPIABG6G9zLTt6X3X0zf+N3B
	x5HoK4WoRfD7hmjgJoJB42hBJCyxi7+Atwfy2321fXcXaPhR30DLaiJGR3DcftVK
	xUgS41Yk8U9prJvvsJXlrRh3xdqPUt08R9m/BXmFPn1FrIb83ZWXpy1Fu0gHvKrB
	DW6HYLnANgJ/GG9rnxtoD3ddLCuLMPA0Qg51LTPddf5fMJt0pbW/xhJT1EGMm+Qz
	mRG2xw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpx4s9wfv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:08:06 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so7549641a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789474086; x=1790078886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qz79aCejNO+w6+x9f0Iot27RiEWAJlB6x4gOUa3o1Vg=;
        b=L0O+I8KaDogxJjO4GTNd7RkJRG8FeEr2+mEiBslXTzAKtssmjZIa9e8DwPhgR+q/gj
         79RI6U/eZkiHdTJVz8GzxErSimY5jDlNXp7m0RVgmSB/2MmqPRecRLa6+csP43sbXDgA
         3g8JYYNCSpw+/G3KZ33K5UqQb9z7086y2gMvx8/HKVfJX/sS1nQERSIm82EdLhLBKTZd
         gYuw/oC/CbssVa23WxCE8Qj7iJ5jeg5fal9fD+zs7Fw5mBfQXAt914by+M4Dx8vH296Q
         qC09iQ8Ahqk6UJQVKJf9nfJa60Wm9jab5v4E3jZ+84kqhwPYMma1QEyArkQ/9UwtKZSw
         9pnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789474086; x=1790078886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qz79aCejNO+w6+x9f0Iot27RiEWAJlB6x4gOUa3o1Vg=;
        b=IAtC9TGe+WI15czYlkXvKSS3HJtK268ljfwegSx46A9/tQX6lexX5/O59iWV5gEkz1
         2Y4+WDR9jbXI1Ul/2uYSZbcT5e3bdQPVmgcqJqBil08Nr3mjHYFQ1k/oVTIh5SaQxEC4
         6OdtN8ahjDJFupn4OmsDzE5VJFcawuJ8zSXe/5hutP/qFqryQGADZscGXTSg5Sslch4/
         2f5Yz6ShNbcTMeZ6VvceqUKoMOYE8+T0F/OHL0zn53zORPAjg1nfqGfP5k8h8NIa9vU/
         MyYKnClm/vPvuL6jpy5vXr2E6ldjPBLrvVTPyfSqP88tq0DuBeOlKDj9APSmacsR3BwL
         6mQQ==
X-Gm-Message-State: AFuF++nv5J3UnuvR6ItVT2mzPYNw8b3xRDTV4xBvtxjDK50Cg/JTvxV6
	emSvVRhO4HSI8VQrplEnvmxQ3SGH2Byxjv0SOzJlEWqAhAYkXmI0nhf+LeMQt3BhzmgLnHv/lIG
	ety1pjsmqwS7QEXIyVuk/35AAIOIwVm1MlhLZqALWVSNPQrbGJVcHO+7a8XFB54Hh3cZr
X-Gm-Gg: AYBFou3ICM6utZ5h/iK2m1u7W6Ww1tYhRV/sx6QBcNOXGx+8NCM50gf8hUQ+2ycu5gr
	nXmqjb4EeBOeS5bMo8OymbbyDyOl9Jb6szzBrRG3ix0FauvzySQn2AA+zTDPIF1L9T08snJ8R/8
	RPztS8C7fqr8Nh6u/+XiAh5h3KCyhNBG5X7UOHjWDL6AB1KHMbPoettCAS0iPj637zwYOT4mSOi
	3KFV1egl1+iUwKoViAVKChvfnytiG8WqOAoPGiUIue1EI0xYCejzCnbWumjiKj14geuAGHapBT2
	bZivLDHDMGoTKID0j4Vjin+DPUzrOviV3lbZBzAMfxP/mUKCoQRkSC8BVZEjkzuD1PU+aMeK3rD
	GyXyUe00J5CV+xw/1VWy+xdWqpAiLNQA=
X-Received: by 2002:a17:90b:554e:b0:39d:f823:ecff with SMTP id 98e67ed59e1d1-39df823ed94mr10689641a91.11.1789474085960;
        Tue, 15 Sep 2026 05:08:05 -0700 (PDT)
X-Received: by 2002:a17:90b:554e:b0:39d:f823:ecff with SMTP id 98e67ed59e1d1-39df823ed94mr10689559a91.11.1789474085412;
        Tue, 15 Sep 2026 05:08:05 -0700 (PDT)
Received: from hu-jkona-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39dfdcb618bsm4905004a91.5.2026.09.15.05.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:08:04 -0700 (PDT)
From: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 17:37:32 +0530
Subject: [PATCH v2 2/2] clk: qcom: gcc-glymur: Use clk_regmap_phy_mux_ops
 for GCC UFS muxes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-glymur-ufs-clk-changes-v2-2-d0aa1c60c269@oss.qualcomm.com>
References: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
In-Reply-To: <20260915-glymur-ufs-clk-changes-v2-0-d0aa1c60c269@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfX6zCNllqhgKgN
 hX4g/198sMkSRlfG31d6H1Hi1BP+45Lq/0N6H6zk0/j1+WmaSqNyUcfNcX9dSm2lYMUlgtsxWeB
 wPTzjg9e8heTFvKV0lWkVZ4xmJ009NQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE3NSBTYWx0ZWRfXx71EYWsiI+gh
 KgjudkksNP22DpRSQThEgC5oJWnrvYBd0pyocmQvJdnS/r4MEroDRBrvsETjy8pccyR//TWDy02
 wGHBy47I2l3zw721gxnglC5xrzxDS2C2Ia2wjA/fLMt9b8MjpV+Jp3a+gFf7lCogETxOW86LcV6
 Jrp4rBW29q10LUpkyg7pDWSlPn6uQySJ7zXEuXZ+8QwJWhRusO5DPlYt3OWETYcVpcJMrb8bT7+
 lLuewZlZVTV6x4ybmtmk6VYVKT0EOTqftTTFXGdKSozFobXATUz7jwFH6kfAhzc9NuVYmuNp+vZ
 2nACTVMLuO4FRiWdCHqGML16SGsMTP1lFpb5g9mAbCbKXNkA2YHHgxlXDvTbh3BiCh/mUJ8nHCE
 lTUzm7eeqW9l85yoDSVB6kxkz4NSFnyt1WMPP9Y3dliR2+pLqeAdQvqq162GMTGb2ZOO35lEeU/
 RVJ3HJYDaHYnxsIw8IQ==
X-Authority-Analysis: v=2.4 cv=HsDjiETS c=1 sm=1 tr=0 ts=6aa93526 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=dqVVpOBFKaflNhj4CZAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: W3rK65uSjLWPGuSMWlQMDMYIf74kxiSV
X-Proofpoint-ORIG-GUID: W3rK65uSjLWPGuSMWlQMDMYIf74kxiSV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150175

Use clk_regmap_phy_mux_ops for GCC UFS muxes so these muxes are
automatically switched to UFS external symbol clocks during enable and
safely parked at XO clk during disable.

Fixes: efe504300a17 ("clk: qcom: gcc: Add support for Global Clock Controller")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
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

