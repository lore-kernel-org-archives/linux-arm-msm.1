Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13D0D4519BF
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 06:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085616; cv=none; b=KCRTbF1StWqgvAYHMKrcqVhGxMLGehDgfc2DEILa1znjiEHWHwN8hbKU0gQ8ipIRJbSf7USiZzzh06lNvbBotcaQhhK9zRgzYGjSFunsr9/TTEzFJZO67dR7wj2aWgJnhhv+uaTPNstbLh+NRR2HTJkBC66fq4Rb5iQ23xgVhvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085616; c=relaxed/simple;
	bh=weKfows8FNPEjrNrqtloW4BpPR7xbWNzhhCb6c50wCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ku7mGGT7gvnt+qpXyF1CEdqL8luRfAz8esQPbcQV5TL+a31ZMr2Ln2iJePCvRMrbBV8rx15N68zTnEgeVYUJZjYPre72zAMYi/PPur2qb92PqbTXG6cU+2XEZFgHdygl7hLo5lNysgkLPDAHyTWFHZ4ztiBHfL21pzkCxWquy0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lxy3xAdQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MN7Wc2L6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lxy3xAdQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MN7Wc2L6"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776C2aB3576113
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 06:53:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d/TTv/TLV0MX8PsAM5rATZzt7fB4lc/kM4OMsMOVSXQ=; b=lxy3xAdQ03Xvv+h/
	iknCZTdt3FpweAV0e7ddlnL+Siegmi+sjweHV+tnWXggd1eVuwX8rIS02RuDHnvk
	OLYpQx+9SarshNDK+AHD1PO6Dgx8DlM6PYoayEE4bEmVqzZxFY5AcLMeJvj/Vj/g
	3XpaIyY3PutLRPmQipzn/jIY6QCEU5YeMGa0aa/8l/iaYS6Kcts7IT4z9M7on3VO
	7sUXykWd+EL4kNouuUOGaXzRy7RH65NACyVGdXFX3+ZAUNXyrPLPrujAtHQAWXj0
	2oEIdoHmubZ25+TEd+LScEXXVkVaeBeEOP/hO9K/6OD1W7o0DQuB8IOKgbpv8pHU
	sY3+Wg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu04t7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 06:53:29 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8485d853b08so5237065b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 23:53:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085609; x=1786690409; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d/TTv/TLV0MX8PsAM5rATZzt7fB4lc/kM4OMsMOVSXQ=;
        b=MN7Wc2L6lSardV//0TF5PPJUyb7NnWv6xjy/e+UM9sblhRvYQZGbOozI55umvMbYZf
         WYITDNG/BwOQ1opQadHOevBQSPmlEb4+h4IRadqekW4yBdMAmIeeCJXDmwnHGAnJCKMU
         aaxPxxZEDTsB6sANtZkpvcus5sWSMbJacnoHurvy87VxZLyJCVLhgiUiVmFCayVjWehL
         qgFQ13VdHYoNddvG/d0JYoljRmVX2FbhyPpZIeiS1zH8B8GxrZFdYwna0diZEoJ115I7
         idMMivaA1SaL/DWj6XIrgLaGmeIzwXSCV+l5OuZ4e9I3GkIJmQ1a4eWa0mfVCtq7tZlZ
         ngMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085609; x=1786690409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d/TTv/TLV0MX8PsAM5rATZzt7fB4lc/kM4OMsMOVSXQ=;
        b=PXiCzGChPIqtYr1A6yebaZq9YgnL2reqXDQUt4eTillChcjPDh4ersWARlDPpwZsls
         WIgq5fKL0G6wrK43oI6qfbEp+J175BMmPHqPwUr2D68AR4Xsv6gPdHwhbHYPwswrY8IZ
         +sz6Bimzdcfr2Zpx62UhD0gLCuLncdPLjbAguDpYnh0m591aFgqJeT//tlkVD12OQ4cA
         yHa2/t9N17foPxhns10ximYob7iqqU4ZpolZMv4X3Wl7awybAB8YEoa5k5DL5ieyIF0A
         a23MV+oa03OzC1+XVA5ppcfmbffZvtFpTga4Z4iQU3bky9lxHAklGnTGIc2iYcfTUUJ0
         v+pA==
X-Gm-Message-State: AOJu0YzCQJ7sv6WoocneIaJeTy6LU7A9fiGDOTfbLlir8TNQgyhMqtje
	MR0rR7oq9wfjLWxdo8dyPjSGyoYsPt0L6BWG4HgR6FtzekxiorzLGyevE8o6gYd9tHwsXp//xd5
	cMX1uVogaaZENxB51srRsfDfHiCIn8IxkbU41nzAuiMV5MgrZPksz7LN1dCCcU5274xol
X-Gm-Gg: AR+sD11jOp/pZaKb8KDA4XqEopYIkCOScZM2CoxUJa0503ZDHthZc+hkQctP+mgipUd
	/DL/wSYXOdP5MALJhMzpUcvHReWpm1h57V9ZlHr+5ZmSdTYiYjwWbTihD752suRsc4zZVMt3Cob
	iZUZAIvagm4zVANQbLAaJ8M36mghI9E/G2sSSnF02g/nOSrih5i2MLk3EZ3x2laS1mkQPWEJt1y
	Qs2JOlr+r1tspAm/0wU/05guhKrycOl3svIc0caCJizqqxn0KNm9h6ShE2gynXgEq6AvSKwGeNw
	GtWMnBoRKVnlPn/OISSOTtyzbe4Tc+DLl79AQvrkAsCOxYb2abffJm2/qsh0bKmpbMmOOgfD7bA
	+xaNnnr9lAYB1KMV5guNPkG8Hu1dIlzIzScigqwRMDnw=
X-Received: by 2002:a05:6a00:2a07:b0:848:4754:28e5 with SMTP id d2e1a72fcca58-84f2dffb055mr25089213b3a.16.1786085608944;
        Thu, 06 Aug 2026 23:53:28 -0700 (PDT)
X-Received: by 2002:a05:6a00:2a07:b0:848:4754:28e5 with SMTP id d2e1a72fcca58-84f2dffb055mr25089178b3a.16.1786085608555;
        Thu, 06 Aug 2026 23:53:28 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:28 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:12 -0700
Subject: [PATCH v2 08/12] clk: qcom: ipq-cmn-pll: Add EPHY-RAW clock
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-8-cce718b8ec17@oss.qualcomm.com>
References: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
In-Reply-To: <20260806-qcom_ipq5210_cmnpll-v2-0-cce718b8ec17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=4581;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=weKfows8FNPEjrNrqtloW4BpPR7xbWNzhhCb6c50wCM=;
 b=7z+++t57FkitF4QGy2RzXTIRHVwhiD8ZaUoZUxq+8m0bVIrKoQtJsP9AY1mNefun5RP479qlF
 6xsrBMdEcHwAYFDppyiKpI+j4N39U1MUrPQrVokwIQPt51WY9vQIa8Q
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-ORIG-GUID: qhtVgkfMeY3btbvhLs5sMsyk4svuQepi
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a7580e9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=VFrLHRkP8_lOF4sqez4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXxvykPRcuNUzR
 nMUy8fmluKnJaHR2CohZwfD2TjCVnskSdS6QoT65xzSf/EWN3QahPiJ+J3SJzXL0EIIyWlq8WTM
 duzkRUnIg/56pdqBaI7jkKfAcoJtoMc=
X-Proofpoint-GUID: qhtVgkfMeY3btbvhLs5sMsyk4svuQepi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX+MntltPBAimG
 2DdXmX/raefLidf5Fi3FsR2Frgns6uW/HJia1f6BCGEbgO+GFg0J4t3Bew1AQDRWdDfQIEKt6fk
 UMFDSgBsXcicx03Sxjcs6Eht+8pQR/dbskN8k4xzVoMzXUisRqRtutYmLWGAp3NCV6YM2TBo8YJ
 N/DKPPFaupVHL9F/dsN7D2hOaPiZP7NK/eRxRmPSdkrL8MN2TGvfj/rNrdPK4JbTXK62RncRQCx
 20BMqKu7rVUulCv3CofWMOB4Uci7KodNhFQ8Uu92qP3NDZy1V6UFUwrfohtOeWGVa77B+/gUG+Y
 I428sGEqgZCfV0/O9eXQV0AEa+MpIfeQwr4wFlhx+h4tuWleZ6cDzdVAS4JnueK9K+1wFJsmI3Y
 i5NnnSmMZjQBx1l4mQmKATbWiMP8+zhC+tU3v89AFOQssqG0i82RR5vC1VhpC8JySGay9VGI+WH
 NVbiMOtQN0BNO8QBAag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

The EPHY-RAW clock is an IPQ5210-specific output from the CMN PLL that
provides the raw reference clock to the SoC-integrated Ethernet PHY
(EPHY), which supports up to 2.5G link speed. The output frequency is
selected via bit 10 (CMN_PLL_GEPHY_312P5M_125M_SEL) of the
CMN_PLL_PON_CONFIG register:

- 0: 125 MHz   - for 1G/100M/10M link speed
- 1: 312.5 MHz - for 2.5G link speed

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 98 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 356988c03a7a..586f9c620e7e 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -77,6 +77,7 @@
 #define CMN_PLL_PON_MODE_SEL			BIT(9)
 #define CMN_PLL_PON_EN				BIT(8)
 #define CMN_PLL_PON_DIV_CTRL			GENMASK(7, 0)
+#define CMN_PLL_GEPHY_312P5M_125M_SEL		BIT(10)
 
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
@@ -98,12 +99,14 @@
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
  * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
  * @CMN_PLL_CLK_PON: PON reference clock
+ * @CMN_PLL_CLK_EPHY_RAW: EPHY-RAW clock
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
 	CMN_PLL_CLK_NSS,
 	CMN_PLL_CLK_PPE,
 	CMN_PLL_CLK_PON,
+	CMN_PLL_CLK_EPHY_RAW,
 };
 
 /**
@@ -578,6 +581,95 @@ static struct clk_hw *ipq_cmn_pll_pon_refclk_register(struct platform_device *pd
 	return &pon_clk->hw;
 }
 
+/*
+ * EPHY-RAW clock operations for IPQ5210.
+ * The output clock rate is selected via bit 10 of CMN_PLL_PON_CONFIG:
+ *   0: 125 MHz  (for 1G link speed)
+ *   1: 312.5 MHz (for 2.5G link speed)
+ */
+static unsigned long clk_ephy_raw_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct clk_cmn_pll *ephy_raw_clk = to_clk_cmn_pll(hw);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(ephy_raw_clk->regmap, CMN_PLL_PON_CONFIG, &val);
+	if (WARN_ON_ONCE(ret))
+		return 0;
+
+	if (val & CMN_PLL_GEPHY_312P5M_125M_SEL)
+		return 312500000UL;
+
+	return 125000000UL;
+}
+
+static int clk_ephy_raw_determine_rate(struct clk_hw *hw,
+				       struct clk_rate_request *req)
+{
+	unsigned long rate_125m = 125000000UL, rate_312p5m = 312500000UL;
+
+	/* Pick whichever of the two supported rates is closer to the request */
+	req->rate = abs_diff(req->rate, rate_125m) < abs_diff(req->rate, rate_312p5m) ?
+		    rate_125m : rate_312p5m;
+
+	return 0;
+}
+
+static int clk_ephy_raw_set_rate(struct clk_hw *hw, unsigned long rate,
+				 unsigned long parent_rate)
+{
+	struct clk_cmn_pll *ephy_raw_clk = to_clk_cmn_pll(hw);
+
+	if (rate == 125000000UL)
+		return regmap_clear_bits(ephy_raw_clk->regmap,
+					 CMN_PLL_PON_CONFIG,
+					 CMN_PLL_GEPHY_312P5M_125M_SEL);
+
+	if (rate == 312500000UL)
+		return regmap_set_bits(ephy_raw_clk->regmap,
+				       CMN_PLL_PON_CONFIG,
+				       CMN_PLL_GEPHY_312P5M_125M_SEL);
+
+	return -EINVAL;
+}
+
+static const struct clk_ops clk_ephy_raw_ops = {
+	.recalc_rate = clk_ephy_raw_recalc_rate,
+	.determine_rate = clk_ephy_raw_determine_rate,
+	.set_rate = clk_ephy_raw_set_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_ephy_raw_register(struct platform_device *pdev,
+						    struct regmap *regmap,
+						    struct clk_hw *cmn_pll_hw,
+						    const char *name)
+{
+	struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+	struct clk_cmn_pll *ephy_raw_clk;
+	struct device *dev = &pdev->dev;
+	struct clk_init_data init = {};
+	int ret;
+
+	ephy_raw_clk = devm_kzalloc(dev, sizeof(*ephy_raw_clk), GFP_KERNEL);
+	if (!ephy_raw_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_ephy_raw_ops;
+
+	ephy_raw_clk->hw.init = &init;
+	ephy_raw_clk->regmap = regmap;
+
+	ret = devm_clk_hw_register(dev, &ephy_raw_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &ephy_raw_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -644,6 +736,12 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 							     cmn_pll_hw,
 							     fixed_clk[i].name);
 			break;
+		case CMN_PLL_CLK_EPHY_RAW:
+			hw = ipq_cmn_pll_ephy_raw_register(pdev,
+							   cmn_pll->regmap,
+							   cmn_pll_hw,
+							   fixed_clk[i].name);
+			break;
 		}
 
 		if (IS_ERR(hw))

-- 
2.43.0

