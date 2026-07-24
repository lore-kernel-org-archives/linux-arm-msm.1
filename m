Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE323451B5
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784905240; cv=none; b=mUS3DvIB448WZkhr9KIFcIezG2h5jPEcE2rKg3dnEZuTrBmWvRhcnYaj/tgWWjm03e3+ZqKt3zCAO4LwCqH1/lhH6rGP2Hb8ZcoajDFIVCwYq1Mi3oAQblUjlvRHmKc8049xT9NWBDp4MFOsG4k9gjGwN1uEHGSGgTHdDvy4Qjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784905240; c=relaxed/simple;
	bh=DLI8h6G0/NqwUS+zVGJ1siWTzN3VJ8p851OawG3o6CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzOJ7BdBurTvyfRRJgeNgIk6SiBz0urlleqt4MsEPf4+AOhYK+3f03IWncN8TnT8Ko1CgU1un/5K0v1O3pXbtXjY0lmFvKalqhRhkVU8lnKw3kF4LfvTNjNYVz+okaQ4F72MIjgtvLvu4wo6vu4N1w+LCiRcMp3jERuzPgTQcnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FG4xmGt7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTTdWgVr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FG4xmGt7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTTdWgVr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ODbLD22710351
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	98+s7tp5ft9/GsQHFbxG9Ae5OsEtklJmf3P5WPWMxPg=; b=FG4xmGt7WRByeyMC
	4AVQGx9IK+DyrxelxMUqS6uU7yYKloEcKT6WJkbhZokSwYvKIUdjNSNrEbj4hOxe
	61+t19lyGrj1KdvzRgqVp6Tut+CEEl6bH8pfPqJPNT0T2whc1iW8jNfBUw3beadi
	a5jSNIgwiwBJJGY6UEbU9DhVM8026mw4JrITDubgqVrLpw2McZoBGwlL88dH0t3Z
	GisDWFgl1JrVos4mPWOvleI4D5o/t0PZQAx09Vt5RCSXuh85OeplTXroOBDEhRr7
	oZexZqTRbNI9CMJJ1yzNTZwlwcuHXa8gggLQSRbShPgLcuTqojyZSrObyaaGq0cl
	9IQ7mA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm8cgggan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 15:00:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb92868263so610558a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 08:00:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784905236; x=1785510036; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=98+s7tp5ft9/GsQHFbxG9Ae5OsEtklJmf3P5WPWMxPg=;
        b=VTTdWgVrSB2biyRl1s8J92FgoJA0XgOc9+2YXEWCEp4Gjq5xOi7zFOF1f1Ulhrj3MI
         BZcrZph1+z2MdsMZ6Q1EGJ97gqNM+/mqyhcxhj7ugh2bCtAjuO0cNRgqo2vT1h1JCOW9
         c54bEaz5RIoScSoCxB3JZUYHNbqKZ4G+tKLS1BPFWLCxuRm+MMQ/y7qCGjIRc8jzkhXS
         uv4O2onPWXwd8+WSjIDJIlaLDF0hnZtBojgwnYhIBU6SjSlO3jdzntYnlfUGva4VdvgJ
         xoIDcp5RYqfx+ToKEwKzn2Bhi3DuO2caS7OSfhT0Ujbz7C/Me22cAdKfrYyGijJgydDd
         wKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784905236; x=1785510036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98+s7tp5ft9/GsQHFbxG9Ae5OsEtklJmf3P5WPWMxPg=;
        b=kv3Z8OYdRx1ytdM8uW73wPUDnHbUUVVpVbLJVSXmCoW/Jh0GwDrSwer8mG+bhcV43R
         WlEyjaexbSrTJk0owRxOdw1SSpx8SlFqdU2ret5X/ZgpxIP9oOAUK/m/AebYzvnBrfnC
         kb+Cr/HYMlb8/0yb1dXbLCGdpaJyn+/lyz7IldDj09RE4CH33UcGt3gsUXBI9Jf9DhmH
         q3Vq1AdrtLMyE5nDLMmP5kStOOPOQu5JS1Urj3WDtp+kPyFgWh7+6JuAkjU2ZUNM3XuR
         R4yrGElZj/wkeNh0+ry3H9IS79LYT8NM6XJONNIhmRGNSpZKtF1sVTRu5ea373SlLbHQ
         w7qQ==
X-Gm-Message-State: AOJu0Yykj85J0EWDVSVx+jOrEgQvunt3UJosuOoK0D0xHU6D45bUkCrs
	ECLggO0wBCfzz+45IiJkJF0ajR8NAx7dhp20/60lBGBQelesVOCMu6t8OhBafZDsP96Pr8RWbgx
	yeyQx4jyj7S+cPHlvTvJiAfY6GHCbtOSl66llk+lIh71KykzGLUdZbkmwvgVe4ypayNGl
X-Gm-Gg: AR+sD12ls9LcJrQ1ei0IEgtrJnbNZAXQJ4awFqX7FobunflDsjD4axAcAd2D5ITDj/j
	5po8PKpZnsI287tEr3EcC5RrMvtwTON2jCrmEUKGaEpp8RqqPHIiHKZkfyDzZFaI9DKOsCNcXu+
	rM+7wBt/Bzeb+wUvmWc10GPykJpbF2nZppXlRxfe3cBz8MXzgOz7Ml4oPH5ClAq1fGfy0bGTcua
	pQBctX6szs2bFN1sq519leyRFwkm9L+ud3YZrqMCvIZl/oc3vPJjKuOg8a77MotBE7AqUlFt5Eo
	5R5pm29CLPHgtkNsVxlF76tlona77Lm8zGzJbaxdGfRGD7dX9TZlGcmUzH22ZNBcY2Qjqp9N1B/
	W844wWe1FUIzIVPJlOHHz8HdLApEh0e1s4hx4sJ7XU1g=
X-Received: by 2002:a05:6a21:7303:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c44b18ce94mr8155430637.42.1784905235281;
        Fri, 24 Jul 2026 08:00:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:7303:b0:3b3:f46:1efa with SMTP id adf61e73a8af0-3c44b18ce94mr8155356637.42.1784905234709;
        Fri, 24 Jul 2026 08:00:34 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc593b57sm621809eec.25.2026.07.24.08.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 08:00:33 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 08:00:31 -0700
Subject: [PATCH 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support for
 fixed clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-qcom_ipq5210_cmnpll-v1-9-a8b8679d215f@oss.qualcomm.com>
References: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
In-Reply-To: <20260724-qcom_ipq5210_cmnpll-v1-0-a8b8679d215f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Luo Jie <jie.luo@oss.qualcomm.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784905224; l=5971;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=DLI8h6G0/NqwUS+zVGJ1siWTzN3VJ8p851OawG3o6CA=;
 b=mwC4Wq7Tq5UuKlPatOvvI0Da0Jmj3yyyj5EZBNcdk2c0PQvrKoVRF8CJRP5/Pl5nb38UDl1fr
 TSEHnMo38Y6CDBbzgM7DCBTa2/oCnrwi+RxMrGULj8AGnyeYJiUkhA1
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=JOMLdcKb c=1 sm=1 tr=0 ts=6a637e14 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=zP2XRvvY85Lzq-CNeuYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: l-PIbUNSCxFO8uMHH2A1TbjeyNG7QTLc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX9t+u8L2E1cQb
 wKbqEchfAGGB9/i8JrqoSwtW2YGZyJwepI8MXds7Vm1ZPPS5L0sSYb+U666BUCOS1FZL8BgXmpX
 Cz70EeinAF7+p9HeIvcCqZ0bOvaeIxY=
X-Proofpoint-GUID: l-PIbUNSCxFO8uMHH2A1TbjeyNG7QTLc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDEzNSBTYWx0ZWRfX9xbyqOCEIM2H
 FAZMK+XlOh0U1Mk9tzAYz4Xyl2EXc4fVDPj2ta0RC8UzeqxDU0AkZe4vX9Bh23HTZ7tnqAHKuEz
 EgyDuzC/lgNoPD2hQby7XPUwcFhBg4Xx1wS4ej0F+vhydeQiBGeoRjKPoBOpoGl+sWUyoDpT3WV
 JlOclft+Mchepgd3LoNS4+2yzRLHfrRAbA5OvHQVu0VzvyDI3D8GUmfJVbVsdr3KB1Lan9LJwfs
 8E9ZLydKJxepASHQG8qC3Jje33g6pyN38qVk1SA4MslYMfP5yYu1Gkx8usoOIVcdaezQDggzei6
 f3DXQlXrQJoM3i2tncgd2MnuTo+Mwl0cn9P6RU38fDdreuxuutcynjYf9ZEZkGq/vn4PaPra3ei
 iJP+OI67xU3FbLCSUu+GrnAyJLJmh+ov0v04gbMbl4CIIIXRcfM8H4jZj1YV+LpGDgkER56aFDp
 +H253xKQbQlQ1/BGwSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_03,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240135

Some CMN PLL output clocks require a hardware gate in addition to a
fixed rate. The gate control bits reside in the register
CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered as a
composite clock combining a clk_fixed_rate provider with a clk_gate.

The enable_bit field is added to struct cmn_pll_fixed_output_clk (set to
-1 for non-gated clocks). The CLK_PLL_OUTPUT_RAW() and CLK_PLL_GATE()
helper macros are introduced alongside the existing CLK_PLL_OUTPUT(). The
base MMIO address is added to struct clk_cmn_pll to allow gate clock
registration to locate the output control register.

Since CMN_PLL_OUTPUT_RELATED_1 is shared by all of these gate clocks,
protect it with a single spinlock stored in struct clk_cmn_pll, so that
concurrent enable and disable calls on different gate clocks correctly
serialize their read-modify-write access to the shared register.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 86 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 84 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index dfc28c12468b..00e243282b31 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -92,34 +92,62 @@
 #define CMN_PLL_DIVIDER_CTRL			0x794
 #define CMN_PLL_DIVIDER_CTRL_FACTOR		GENMASK(9, 0)
 
+/* Clock gate enable bits. */
+#define CMN_PLL_OUTPUT_RELATED_1		0x79c
+#define CLK25M_EN_BIT				15
+#define CLK50M_EN_BIT3_BIT			14
+#define CLK250M_EN_BIT				13
+#define CLK31P25M_EN_BIT			12
+#define CLK50M_EN_BIT				11
+#define CLK50M_EN_BIT2_BIT			10
+
 /**
  * struct cmn_pll_fixed_output_clk - CMN PLL output clocks information
  * @id:	Clock specifier to be supplied
  * @name: Clock name to be registered
  * @rate: Clock rate
+ * @enable_bit: Enable bit in CMN_PLL_OUTPUT_RELATED_1 for gate clock,
+ *              -1 for non-gated clocks.
  */
 struct cmn_pll_fixed_output_clk {
 	unsigned int id;
 	const char *name;
 	unsigned long rate;
+	int enable_bit;
 };
 
 /**
  * struct clk_cmn_pll - CMN PLL hardware specific data
  * @regmap: hardware regmap.
+ * @base: register base address for gate clock registration
+ * @gate_lock: protects read-modify-write access to CMN_PLL_OUTPUT_RELATED_1,
+ *             which is shared by multiple gate clocks
  * @hw: handle between common and hardware-specific interfaces
+ *
+ * This structure is used for all CMN PLL-derived clocks including
+ * the main PLL, NSS clock, PPE clock, PON reference clock, and
+ * EPHY-RAW clock.
  */
 struct clk_cmn_pll {
 	struct regmap *regmap;
+	void __iomem *base;
+	spinlock_t gate_lock;
 	struct clk_hw hw;
 };
 
-#define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
+#define CLK_PLL_OUTPUT_RAW(_id, _name, _rate, _bit) {	\
 	.id =		_id,				\
 	.name =		_name,				\
 	.rate =		_rate,				\
+	.enable_bit =	_bit,				\
 }
 
+#define CLK_PLL_OUTPUT(_id, _name, _rate)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, _rate, -1)
+
+#define CLK_PLL_GATE(_id, _name, _rate, _bit)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, _rate, _bit)
+
 #define to_clk_cmn_pll(_hw) container_of(_hw, struct clk_cmn_pll, hw)
 
 static const struct regmap_config ipq_cmn_pll_regmap_config = {
@@ -368,6 +396,8 @@ static struct clk_hw *ipq_cmn_pll_clk_hw_register(struct platform_device *pdev)
 
 	cmn_pll->hw.init = &init;
 	cmn_pll->regmap = regmap;
+	cmn_pll->base = base;
+	spin_lock_init(&cmn_pll->gate_lock);
 
 	ret = devm_clk_hw_register(dev, &cmn_pll->hw);
 	if (ret)
@@ -776,6 +806,50 @@ static struct clk_hw *ipq_cmn_pll_ephy_raw_register(struct platform_device *pdev
 	return &ephy_raw_clk->hw;
 }
 
+/*
+ * Register a composite clock that combines a fixed-rate clock with a gate.
+ * The gate control bit lives in CMN_PLL_OUTPUT_RELATED_1, which is shared
+ * across multiple gate clocks, so all of them must use the same lock.
+ */
+static struct clk_hw *ipq_cmn_pll_register_fixed_gate(struct device *dev,
+						      const char *name,
+						      struct clk_hw *parent_hw,
+						      unsigned long rate,
+						      void __iomem *base,
+						      spinlock_t *lock,
+						      u8 enable_bit)
+{
+	struct clk_parent_data pdata = { .hw = parent_hw };
+	struct clk_fixed_rate *fixed;
+	struct clk_gate *gate;
+
+	gate = devm_kzalloc(dev, sizeof(*gate), GFP_KERNEL);
+	if (!gate)
+		return ERR_PTR(-ENOMEM);
+
+	fixed = devm_kzalloc(dev, sizeof(*fixed), GFP_KERNEL);
+	if (!fixed)
+		return ERR_PTR(-ENOMEM);
+
+	gate->reg = base + CMN_PLL_OUTPUT_RELATED_1;
+	gate->bit_idx = enable_bit;
+	gate->lock = lock;
+
+	fixed->fixed_rate = rate;
+
+	/*
+	 * These gated clocks may be relied on by external hardware or
+	 * bootloader-enabled paths without an in-kernel client driver.
+	 * Add CLK_IGNORE_UNUSED so the clock framework does not disable
+	 * them when no consumer has claimed them.
+	 */
+	return devm_clk_hw_register_composite_pdata(dev, name, &pdata, 1,
+						    NULL, NULL,
+						    &fixed->hw, &clk_fixed_rate_ops,
+						    &gate->hw, &clk_gate_ops,
+						    CLK_IGNORE_UNUSED);
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -812,7 +886,15 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
-		if (fixed_clk[i].rate) {
+		if (fixed_clk[i].enable_bit != -1) {
+			hw = ipq_cmn_pll_register_fixed_gate(dev,
+							     fixed_clk[i].name,
+							     cmn_pll_hw,
+							     fixed_clk[i].rate,
+							     cmn_pll->base,
+							     &cmn_pll->gate_lock,
+							     fixed_clk[i].enable_bit);
+		} else if (fixed_clk[i].rate) {
 			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
 
 			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,

-- 
2.43.0

