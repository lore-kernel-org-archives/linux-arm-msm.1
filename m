Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF9344E66F
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 06:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085615; cv=none; b=BGMuBzDjTfa/P8jfVgZehG2Hq5IYj3je2Bz7VZflf8wXuNUoIHo0UPukcIv0AoaAFnOz9rLuGPIChhV0fmmONVJiAt7drrCZHQHZwi3jTt55+tPMBMihhvwLE5apiOF8qn50HHDRgbId64RiHIYw9rGXcXKKtAz75H4gF3PlgFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085615; c=relaxed/simple;
	bh=3SshFUJAe2YCABf7vZhxKHsnDDjDnSisNVo3j+1z8NQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lcxFnyV1QHWkmBT3FiLmJJXqhCKTbpQ+qVEZIa/MuVAU9WNRtfe5fFzbdGI0Pfy14rIwAvUo+IkenrpP969BQuELFS7lTvark3+Nj5ILyw/cNOcchOJwW/y8z9UuBkCiOfbp/aw1TUrBQ/4zL8NS6o8nofJwMResFDEgIC8bW0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hMVeEmwU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Edbkdyca; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hMVeEmwU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Edbkdyca"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770GjHK4063424
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 06:53:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qHcrv3pmf0NdyKKv8pTM6iHq5M+b71roOxSHgPeAzMs=; b=hMVeEmwUeBGSR8LK
	+96w8dRK6jlyHSxUzRPPS7MgiSuu0NRAzWUfDwgBwBdK809w0K9WNJrGxjj+CTDA
	8tb0JiWAPQkJvpy6PYPMXzLYQl3qLuAPg1hZ3KM/vSCQqqYJ1OpDHsw8tJ+2Ga+s
	/UbyVQwg9zxLFHh7iJbs/ZHEVMUw9flIGwb23Cwz0WUDpDNNX+NLb7z+tuLsPhwO
	11nFSQ1LT5zhn5pBPgQLhr4RnGluMUo91pZi6tf3eJVC3XkO0cO7pTuKBH0/SK7G
	IzPOMMwCWz/CgXcJxKdaawJkfLGTaAkS4fCgI5CjPRlN1rvQGLGz7gw6H2ekk3Il
	2tnuEw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hak02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 06:53:31 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc6dd43737so57472615ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 23:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085611; x=1786690411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qHcrv3pmf0NdyKKv8pTM6iHq5M+b71roOxSHgPeAzMs=;
        b=EdbkdycaFl5JtyXLPsi4ZEqMQsn5q+nOg9YSay06RqbLb/ppQrzwOuKmqipj4OeiJY
         e5w5FrRzW1McU7NUI79pUwT70mp5NgEm/nPzMgsAonRqeK4WY4E6pXznIo3Dicc0Unmz
         IDYuzU7GeXlTjUhcULcgvCfSJinocHyXroh/IMtr0UCnVBxg2pSAmItK6uq/6eTtXI1i
         wCi6SBvHyJNFcTHtoT3Zr6BXWILjTKYJeJ6am99z0C6qjPBKKh1pfVkXWV1y4FbwdCr9
         bkAT/wpKYA6V4ocUnzeY/X+AnMaQFUq11QLUkDR3SdqPju+qWWm0OL2PQ30M4ikDdXaY
         pL8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085611; x=1786690411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qHcrv3pmf0NdyKKv8pTM6iHq5M+b71roOxSHgPeAzMs=;
        b=FxeGF36Byfg37hLs+aRUPxpgTUk2woQHmKmTAR9tXtqbP4Q9JrMYbSX79IARlnQHL5
         30aGldAhPfdE1Fkd00BOLW99EbBlwRzNH6/OXyIYpErxrMOxIQWaDQiHR6VXOei349VD
         ok0wVcrB9H9aYWaJcIFb0LrNROAP5m6kaBcNgwaxVh+kWkGAY/c9qCiM7XSogHrHXnmQ
         aBFMxMZrfWEyFjPFFuxpEhnFTs3iVPo8n58LAOrZSvA3fGoFzvGaJ6iTPu/SlqGXelCU
         177q6XY093k31LqDF+6zyM08QyumdjS1AeW7wpEUbk+5MPtOEN8UNUPNCSbyjRNGkCag
         urbA==
X-Gm-Message-State: AOJu0Yw64Oznj+0+5tbPZ3d0YSddNuZaxKsOBMCu7pBvO+G5fmAVGG/1
	sYXh0ZTHClkz3hB/AyKx2FjEf3JYFLcWzE1kpxHS320x5/5m1QtBKRdP8s0RZ7wGYh163oZdXfA
	ktV04auHIypmIUb12Zgz9INZ5rFmnjKQXMU9OdtmanYZeaZ0gsoqUXQjk6LXqUyM/vt2r
X-Gm-Gg: AR+sD12/Ra7tnIbrTQz6bW3W9QiLDWINL7925euO2ZIlVAtXOM3WYhlL9QZeJLNxqRP
	6ptSxEXrN4H9jNwBsTp7WuhhrVktHgTkDkUymX2Bbf46TJOORNvap0x1sNtG3wbPcLEiRnW9LEb
	ZZHJmMZMMK4Ki+/nP2Xd+t+qs1oKefE22WMl5iFX6fq1qa2E+tBD1Js7kUUeyXFhB0xqLX/Qv9i
	JfmRxCZpQ9M0ek6Si6BqPOjBn4Bcm/dn3FP1f9W0IgVy4omlNyJTXIwS8TAGueV3cMK6gxIILQO
	fNNcK9KDiFM0RyOnO2M+KBVc5tm0CD5NDTnC6nUHQpaL3UNAGOcGCV4ytJ6gZtQfrfAl1TD3Cif
	ZReFPqYnSveo/qV2okp789ei5AUyXu/chxcSF9193q8M=
X-Received: by 2002:a05:6a21:3a82:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3cb85ded954mr25940094637.12.1786085610551;
        Thu, 06 Aug 2026 23:53:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:3a82:b0:3c3:704d:57c4 with SMTP id adf61e73a8af0-3cb85ded954mr25940037637.12.1786085610081;
        Thu, 06 Aug 2026 23:53:30 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:29 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:13 -0700
Subject: [PATCH v2 09/12] clk: qcom: ipq-cmn-pll: Add clock gate support
 for fixed clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-9-cce718b8ec17@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=7262;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=3SshFUJAe2YCABf7vZhxKHsnDDjDnSisNVo3j+1z8NQ=;
 b=hK08ThqyO3RY9ir1gTDl9nHHgGCOoRV14/brbkyv5V35V5k25bLaEsKlm5KnpTeblLgDYEmb6
 TGmRN3Yx9jFAYasJqu2pB5d1ZlZkInAqZiUQfUydrhiZFG+5/STnyTk
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a7580eb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=iNkdjwxjGt8fguHhLfQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: l755VcO1svMi9gL17AhTJ1pKwonOgO0f
X-Proofpoint-ORIG-GUID: l755VcO1svMi9gL17AhTJ1pKwonOgO0f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX9EwhngJCTbhD
 C767E1Ib2peHVOsb5sQhIwejm9B7LA3IPz54IRyUvXCOpaDtXvbWlqRz/RhMnV28oToV3pIonaB
 dN2fprdoeGMuyHXoBNiFDmDCItv7mwQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX0Prl1ci0T+jH
 QYXyaGnhPAc7Li/oSxIAeI+N55EZGtCFKqAt15ww+mW85+2hv0eE0ok7B1Jt2D/ATXuL64mTNW+
 wWW93bgF1And9fJn6ujC2HE5QJgFQtEu3qcjWuvDoJChon65ksYBGsFFoo5ilDRVBGrCOcLnHyP
 ZfIDQPNb2HVr+1bWuRQrB08JbIBXXX4uwiVpCwtdqsfD6xCIi2iIDNEXzg17uQDberm632H8KZJ
 wexw/0g6Vkd8N8uZZX2tRHoa8GzLnmX/Rx+/rpTp2C0oPZWEJFriDsw36+1e2mjQx9aGqnzVWSG
 jikaFFo6+LtpN3TaK6BG+yRE5L0mmiBRLgNPn5NJ4nHSKoVhyjUIv/fv1ZIMfy9MYjcXGqB0thZ
 un+meqZ/k7bCVdqBhs6B9yKM0DXPgU/j4/9sQ2RhSkyREHipnTuB1nNIJ+9F3vGvBXsgnGtH8Ph
 d+wDWKOSt0OS/HQlH2g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070050

Some CMN PLL output clocks require a hardware gate in addition to a
fixed rate. The gate control bits reside in the register
CMN_PLL_OUTPUT_RELATED_1 (0x79c). Each such clock is registered via a
new struct clk_fixed_gate and clk_fixed_gate_ops, combining a fixed
rate with enable/disable/is_enabled gate control through the shared
regmap for CMN_PLL_OUTPUT_RELATED_1.

The enable_bit field is added to struct cmn_pll_fixed_output_clk (set to
-1 for non-gated clocks). The CLK_PLL_OUTPUT_RAW() and CLK_PLL_GATE()
helper macros are introduced alongside the existing CLK_PLL_OUTPUT().

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 141 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 136 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 586f9c620e7e..2b05896ff00f 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -93,9 +93,19 @@
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
  * enum cmn_pll_clk_type - CMN PLL output clock registration type
  * @CMN_PLL_CLK_FIXED_RATE: plain fixed rate clock
+ * @CMN_PLL_CLK_FIXED_GATE: fixed rate clock with a hardware gate
  * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
  * @CMN_PLL_CLK_PPE: PPE clock with configurable divider
  * @CMN_PLL_CLK_PON: PON reference clock
@@ -103,6 +113,7 @@
  */
 enum cmn_pll_clk_type {
 	CMN_PLL_CLK_FIXED_RATE,
+	CMN_PLL_CLK_FIXED_GATE,
 	CMN_PLL_CLK_NSS,
 	CMN_PLL_CLK_PPE,
 	CMN_PLL_CLK_PON,
@@ -115,33 +126,66 @@ enum cmn_pll_clk_type {
  * @name: Clock name to be registered
  * @type: Clock registration type
  * @rate: Clock rate
+ * @enable_bit: Enable bit in CMN_PLL_OUTPUT_RELATED_1 for gate clock,
+ *              -1 for non-gated clocks.
  */
 struct cmn_pll_fixed_output_clk {
 	unsigned int id;
 	const char *name;
 	enum cmn_pll_clk_type type;
 	unsigned long rate;
+	int enable_bit;
 };
 
 /**
  * struct clk_cmn_pll - CMN PLL hardware specific data
  * @regmap: hardware regmap.
  * @hw: handle between common and hardware-specific interfaces
+ *
+ * This structure is used for all CMN PLL-derived clocks including
+ * the main PLL, NSS clock, PPE clock, PON reference clock, and
+ * EPHY-RAW clock.
  */
 struct clk_cmn_pll {
 	struct regmap *regmap;
 	struct clk_hw hw;
 };
 
-#define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
-	.id =		_id,				\
-	.name =		_name,				\
-	.type =		CMN_PLL_CLK_FIXED_RATE,		\
-	.rate =		_rate,				\
+/**
+ * struct clk_fixed_gate - fixed rate clock with a hardware gate
+ * @regmap: hardware regmap.
+ * @hw: handle between common and hardware-specific interfaces
+ * @rate: fixed clock rate.
+ * @enable_bit: enable bit in CMN_PLL_OUTPUT_RELATED_1, which is shared
+ *              across multiple gate clocks, but regmap already serializes
+ *              read-modify-write access to a given register, so no
+ *              additional locking is needed here.
+ */
+struct clk_fixed_gate {
+	struct regmap *regmap;
+	struct clk_hw hw;
+	unsigned long rate;
+	int enable_bit;
+};
+
+#define CLK_PLL_OUTPUT_RAW(_id, _name, _type, _rate, _bit) {	\
+	.id =		_id,					\
+	.name =		_name,					\
+	.type =		_type,					\
+	.rate =		_rate,					\
+	.enable_bit =	_bit,					\
 }
 
+#define CLK_PLL_OUTPUT(_id, _name, _rate)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_FIXED_RATE, _rate, -1)
+
+#define CLK_PLL_GATE(_id, _name, _rate, _bit)	\
+	CLK_PLL_OUTPUT_RAW(_id, _name, CMN_PLL_CLK_FIXED_GATE, _rate, _bit)
+
 #define to_clk_cmn_pll(_hw) container_of(_hw, struct clk_cmn_pll, hw)
 
+#define to_clk_fixed_gate(_hw) container_of(_hw, struct clk_fixed_gate, hw)
+
 static const struct regmap_config ipq_cmn_pll_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -670,6 +714,85 @@ static struct clk_hw *ipq_cmn_pll_ephy_raw_register(struct platform_device *pdev
 	return &ephy_raw_clk->hw;
 }
 
+static int clk_fixed_gate_enable(struct clk_hw *hw)
+{
+	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
+
+	return regmap_set_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
+			       BIT(gate_clk->enable_bit));
+}
+
+static void clk_fixed_gate_disable(struct clk_hw *hw)
+{
+	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
+
+	regmap_clear_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
+			  BIT(gate_clk->enable_bit));
+}
+
+static int clk_fixed_gate_is_enabled(struct clk_hw *hw)
+{
+	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
+
+	return regmap_test_bits(gate_clk->regmap, CMN_PLL_OUTPUT_RELATED_1,
+				BIT(gate_clk->enable_bit));
+}
+
+static unsigned long clk_fixed_gate_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct clk_fixed_gate *gate_clk = to_clk_fixed_gate(hw);
+
+	return gate_clk->rate;
+}
+
+static const struct clk_ops clk_fixed_gate_ops = {
+	.enable = clk_fixed_gate_enable,
+	.disable = clk_fixed_gate_disable,
+	.is_enabled = clk_fixed_gate_is_enabled,
+	.recalc_rate = clk_fixed_gate_recalc_rate,
+};
+
+static struct clk_hw *ipq_cmn_pll_register_fixed_gate(struct device *dev,
+						      const char *name,
+						      struct clk_hw *parent_hw,
+						      struct regmap *regmap,
+						      unsigned long rate,
+						      int enable_bit)
+{
+	struct clk_parent_data pdata = { .hw = parent_hw };
+	struct clk_fixed_gate *gate_clk;
+	struct clk_init_data init = {};
+	int ret;
+
+	gate_clk = devm_kzalloc(dev, sizeof(*gate_clk), GFP_KERNEL);
+	if (!gate_clk)
+		return ERR_PTR(-ENOMEM);
+
+	init.name = name;
+	init.parent_data = &pdata;
+	init.num_parents = 1;
+	init.ops = &clk_fixed_gate_ops;
+	/*
+	 * These gated clocks may be relied on by external hardware or
+	 * bootloader-enabled paths without an in-kernel client driver.
+	 * Add CLK_IGNORE_UNUSED so the clock framework does not disable
+	 * them when no consumer has claimed them.
+	 */
+	init.flags = CLK_IGNORE_UNUSED;
+
+	gate_clk->hw.init = &init;
+	gate_clk->regmap = regmap;
+	gate_clk->rate = rate;
+	gate_clk->enable_bit = enable_bit;
+
+	ret = devm_clk_hw_register(dev, &gate_clk->hw);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &gate_clk->hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
@@ -709,6 +832,14 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 		hw = ERR_PTR(-EINVAL);
 
 		switch (fixed_clk[i].type) {
+		case CMN_PLL_CLK_FIXED_GATE:
+			hw = ipq_cmn_pll_register_fixed_gate(dev,
+							     fixed_clk[i].name,
+							     cmn_pll_hw,
+							     cmn_pll->regmap,
+							     fixed_clk[i].rate,
+							     fixed_clk[i].enable_bit);
+			break;
 		case CMN_PLL_CLK_FIXED_RATE: {
 			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
 

-- 
2.43.0

