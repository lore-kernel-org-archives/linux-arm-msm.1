Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00AEA4302FB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784617660; cv=none; b=pTpSMU7LJsLxpVtcWltv1mcpuATNkO6UvpTPlF7+Uii42Anb5OI0XXL2il1Ox/I7a+OgkHf4cagiwwLd+gEweL7uxS3MZ6+X4WeTba9dpYYii4c2f0VrKTbgyXNtA8skBgNt/8orLLTVgW168x39LPFMjjIwNwLE7bx8K5fsNLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784617660; c=relaxed/simple;
	bh=DV1CdvMN9m6bWlXx5Ut29Idb/+Jyc4A5Jt70Fw7LcQY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hChKHneYMd6KtaCKlMXgCFCsl+ldP+EzmCEoWbIAHiDGN7s2j9D96pqU1OMT85g1cjmfJjOu5nxDy30N3jDUzomFhN6WTsF3NoojYs8rTbNQeTIzcdMWElhMCEqEZJKBHM14ornmxqijCjaSZx6sk0c4JQs7fyPQDykoA4cR9iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0sIY0Wx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ApHmUYC2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0sIY0Wx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ApHmUYC2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L44CER534726
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/dd1/x4M1c7J6tJdq2UIZ+6b06JDpOzhLnHLOC3/5vc=; b=p0sIY0WxWZdc7ptQ
	rol2VaG5Wyg/pyvtw1vkqLS75Jv4SdViV6YQO/E2qXWzzJOCJKIx3uIZz2tn5aPi
	kfIor6ZVGegzhcz3yVWqhOgRsHo3kPGCYz3SueiEqOKL/vdfAbK0ryNh9p6fxOJ9
	k0HZkHGky6rRFPOEyleVfppr67CWhCwIz+LrlYcVgPLH+9Zp0FDx1vnC8qpOPVJt
	Y+jaKhBMARPdwwU2bRI3Ara0cZ4zI2FvoEd401A0c4eX6aPE5mWqtlF4cpNc9Vi0
	rlCu13xZZkE6zcO23I/vztlmaq3j52zVwmnSL5h+kA3f9VXV8nqjBDXToev8VlYN
	axpdfQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dugnvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:07:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-848860def2cso11741916b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784617657; x=1785222457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/dd1/x4M1c7J6tJdq2UIZ+6b06JDpOzhLnHLOC3/5vc=;
        b=ApHmUYC2ThZHpT3GpSchqvT5YUngC+FeSDep0BKrtuijZ5r4p4CMdyaLcy/iAx08lH
         IeBk5Hhrj2nh3NCOSbepzR+vlMe6g2L/nKkv8VYVk78ufqO3UXVTrdcOCjHi/ZBzS7GI
         4SMLJ7hcaUk/tV556yFhFFC9Xf0OnFnDKst0qzVWfsYS/MGjukglAwDCsA+wlTD+prU1
         mT5tGa6vPgEtIZMP/ksNxXXd67QD9OAInaOwP6StC2Qg7YbqxVxJPufMDAJUUGtx5wQ2
         HglHAtDoYcVanhoea8Ec2ji31yDtr3mn00VN1k4DFzG+FXfxlq4k3ixHW4LOrl0dGQZG
         0j5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784617657; x=1785222457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/dd1/x4M1c7J6tJdq2UIZ+6b06JDpOzhLnHLOC3/5vc=;
        b=iRDRlPkwhNtK95h7Mz8l4XpDrLiq9BZ0f7kOepSENtJgNZ7EQfP8+g3xQNl3E3ZJuv
         nRjblFUfDRm2ld7j3syarx/Beg91+nLqdnHGpWvZLpfzndWa5RvR/HZASw2zQ1PGuqmX
         4rNLX9X51uL7Yqlw+CxuZNu84zMyt3Z6BLFq8CSwBxMYRmezMgWje9m0T6CRh8ijRGP8
         ezCqV+AzqzaY+qvaX0xGaREPIg9ZF71zZX2NyWXjWGjl5qhZHOxSkNC3BsCTRgzAoKeN
         jPN8KLcX9Xe8lSnAdb1VQy21t9Yss9yQgKBvLGH65srfbr2q+xMdukiNj7RxmfZD56M2
         akaQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr3nuHXgzCim0pArXSJPKEnEeBCxlnoj6CkpDA8QLYYAJXKYH+LU6mlvVHkdj5sqJHx50MqNwubMhq/wUN6@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq402cAoXFmBAgHIE3cDvSb/HOxI7ZXYtAlIgMjxkJyIZcEzFR
	+KuqDyi8xAQQU4dg6JaIOnvHBesqm+ZVhhsp8i6yYsx1CXJeANh+f2VK7hoTyZ3qibea27ZK+v1
	FLc4NF7QsCOC/F11x7jPE9FzwVfsxfjuVMrWZxuh9RurMZEW0vp3RqKIVKbFRRMY1AgbdBVNQaJ
	cI
X-Gm-Gg: AR+sD13tejezVKjk5YQk9abIbbjt5G1YcgMFQTgG1NRmaOsmmIVL6s0O24dQj+w7guz
	xI0bfH89GoLP+hdMf+J02jFFsRP/zhoE8zCFIsC+Gjgm3NSCllnewgo1ssoTpYYeEa9neuk+v/L
	UU1SNd/Z5wbn8U24wilrs6Z3yhGw1ZmoFT52Z4mtPTzG/m+wF80r8G+jrkLncAOUik2w8gX7K4H
	Zwr/tyDEUpre3RCOdH5tpnvTjdFwv6PB704CQZ/lA+M9TB8TQydfBPMm4HQcxRG9N+1GuYkYltK
	8bDx4JVlJ2xZED4DCV3VxEWR9LlIBcbWollEhDkIG5jbrnBZAswjqua818QCOShAmhAlawvpOSo
	L4YnpNCVnWpC+kcnIHgrTA0RD
X-Received: by 2002:a05:6a00:6d56:10b0:84c:5349:daa1 with SMTP id d2e1a72fcca58-84c5349e426mr6481123b3a.76.1784617656891;
        Tue, 21 Jul 2026 00:07:36 -0700 (PDT)
X-Received: by 2002:a05:6a00:6d56:10b0:84c:5349:daa1 with SMTP id d2e1a72fcca58-84c5349e426mr6481097b3a.76.1784617656467;
        Tue, 21 Jul 2026 00:07:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adcc74csm7080833b3a.18.2026.07.21.00.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:07:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 12:37:16 +0530
Subject: [PATCH v2 1/6] clk: qcom: gcc-nord: mark PCIe link clocks as
 critical
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-nords_mm_v1-v2-1-17e5a445a512@oss.qualcomm.com>
References: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
In-Reply-To: <20260721-nords_mm_v1-v2-0-17e5a445a512@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: OJq5O_d5mnI750xUF8nZvKMEm9YhWQAh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfXwI4WOzKPFCcg
 tYbXy4jWTvgGaNmjuRz6JfnNjj5KNLkYoKrdH/iZzu8FWcUOY6gOV1nWxcY40i04PNfm+zgAwEo
 yHnYyyS1Jlz2vRwKWRHtGHsjxW3isA+xw1cwfeqajSTKsPA54XUSimgHLjs0HgBmgKzf4go/tWk
 1tTyXw7Zrzg3ERtaJ1nezJuwrdMrjuAD5zacv/tj5CKbVX2NEucvvOQlSkVqmrk1NE6PAdaFAIu
 zxUq9RT954gcMh4cB6PNUViPqaSO/4INywk+7LhJBgjR4vE5EeQG3OB3QqVwPsNzGzsuOCbjomz
 zSCOMX/WMIXkPkmriah84tGct3Hz80rRi5TXz6LhXJ5/p/a2tP8O1ErK1AVnb6NkJay74zSWBfp
 SulkP6XZ68DuRo4YjHZNkWdj4+QH74fFzMmNS0iQN8B8cZ9llAXtU8j1bb+j1mm0MCVJTAtTHEg
 OG8yHM9+aDXSu9e84pw==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5f1ab9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=CVX4TxgtaZIOJJKr5bQA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: OJq5O_d5mnI750xUF8nZvKMEm9YhWQAh
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3MyBTYWx0ZWRfX4XrWALCEuntt
 eXkaVIbjIZ8QuE6Ivl1yFaqVLrMflKVxIlsBxZuYQPsNY9ho5HjHC9G2XIHN62HqM4u+/3sMNTr
 tZMR9XJsMIFCUp4dUfqbSDquvmRc55Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210073

The PCIe link AHB and XO clocks must remain enabled for proper
operation. Representing them as clk_branch instances allows them
to be gated, which is undesirable.

Remove their clk_branch definitions and register their CBCRs as
critical clocks instead so they remain enabled.

This matches the handling of similar always-on clocks in other
Qualcomm clock drivers.

Fixes: a4f780cd5c7a ("clk: qcom: gcc: Add multiple global clock controller driver for Nord SoC")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-nord.c | 37 +++++++------------------------------
 1 file changed, 7 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gcc-nord.c b/drivers/clk/qcom/gcc-nord.c
index 8a6e429f264022d55fc5e59b9ec46ae1124f9ad8..299c616be325156ccd457b7b6ef45afef364ad4e 100644
--- a/drivers/clk/qcom/gcc-nord.c
+++ b/drivers/clk/qcom/gcc-nord.c
@@ -1185,34 +1185,6 @@ static struct clk_branch gcc_pcie_d_slv_q2a_axi_clk = {
 	},
 };
 
-static struct clk_branch gcc_pcie_link_ahb_clk = {
-	.halt_reg = 0x52464,
-	.halt_check = BRANCH_HALT,
-	.clkr = {
-		.enable_reg = 0x52464,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_pcie_link_ahb_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
-static struct clk_branch gcc_pcie_link_xo_clk = {
-	.halt_reg = 0x52468,
-	.halt_check = BRANCH_HALT_VOTED,
-	.hwcg_reg = 0x52468,
-	.hwcg_bit = 1,
-	.clkr = {
-		.enable_reg = 0x52468,
-		.enable_mask = BIT(0),
-		.hw.init = &(const struct clk_init_data) {
-			.name = "gcc_pcie_link_xo_clk",
-			.ops = &clk_branch2_ops,
-		},
-	},
-};
-
 static struct clk_branch gcc_pcie_noc_async_bridge_clk = {
 	.halt_reg = 0x52048,
 	.halt_check = BRANCH_HALT_SKIP,
@@ -1758,8 +1730,6 @@ static struct clk_regmap *gcc_nord_clocks[] = {
 	[GCC_PCIE_D_PIPE_CLK_SRC] = &gcc_pcie_d_pipe_clk_src.clkr,
 	[GCC_PCIE_D_SLV_AXI_CLK] = &gcc_pcie_d_slv_axi_clk.clkr,
 	[GCC_PCIE_D_SLV_Q2A_AXI_CLK] = &gcc_pcie_d_slv_q2a_axi_clk.clkr,
-	[GCC_PCIE_LINK_AHB_CLK] = &gcc_pcie_link_ahb_clk.clkr,
-	[GCC_PCIE_LINK_XO_CLK] = &gcc_pcie_link_xo_clk.clkr,
 	[GCC_PCIE_NOC_ASYNC_BRIDGE_CLK] = &gcc_pcie_noc_async_bridge_clk.clkr,
 	[GCC_PCIE_NOC_CNOC_SF_QX_CLK] = &gcc_pcie_noc_cnoc_sf_qx_clk.clkr,
 	[GCC_PCIE_NOC_M_CFG_CLK] = &gcc_pcie_noc_m_cfg_clk.clkr,
@@ -1850,9 +1820,16 @@ static const struct regmap_config gcc_nord_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_nord_critical_cbcrs[] = {
+	0x52464, /* GCC_PCIE_LINK_AHB_CLK */
+	0x52468, /* GCC_PCIE_LINK_XO_CLK */
+};
+
 static const struct qcom_cc_driver_data gcc_nord_driver_data = {
 	.dfs_rcgs = gcc_nord_dfs_clocks,
 	.num_dfs_rcgs = ARRAY_SIZE(gcc_nord_dfs_clocks),
+	.clk_cbcrs = gcc_nord_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_nord_critical_cbcrs),
 };
 
 static const struct qcom_cc_desc gcc_nord_desc = {

-- 
2.34.1

