Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ACCA4534A5
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 06:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786085615; cv=none; b=M/uSEeZTWqzh2+j9hNntaGun3jH8RhhI0J5pWhpx4p1KePbNFScrtljTrTUfHGxiJrx84efFcJzETEDM2njjsohwxP73CxIXpAzB8fWKS2btabl2paVQcV3pyxwhOshB63TdITjFtiPsmWuEjnh189eowApMhUOv4KDEKIv55L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786085615; c=relaxed/simple;
	bh=UsBpjqso7qwEzQ7kYDKho/dDU1/+mseogrEormQfYF4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hgaeSww6jI+AL+93fFQzUvgHyUgJkRCetOgCpfJmw+O5QayxlWJUeXH2wpHrHX+/ySntEYY1BtTBJ9/j8QqWaGbxwO79whbYJf9p+eiGrQNPtg3Z8F0PcwEXT2BqWJDzzIUnr9CeO4K+aYj7iF8vOxPGXi+N0WwVmVLCuzhSmuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WcOdumzW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FBrl5hyh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcOdumzW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FBrl5hyh"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6770Gk6W493134
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 06:53:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UEZ12T353dcnwo+y/ZW2r5T8BPKimQowLmsXorlYXqI=; b=WcOdumzW2bIcfmPi
	8B/DMJp8Kq3YUXTnxFnl3dV8c58RhyLzOVJAeBX1tvoKSKsVQnqNZkp/OCZeQUlP
	IGpjmu1ulgWZvywdXIS0g/jX1XKLDWKYyfZNxHkfrXgyiU4fCrnM6YlznKi7m2sg
	vDh+pfD/mCSYotmRQgaAyKwnoo8ar3QowVYcaSnTK0p/SaRCgxT9YlUq0YSpGHLO
	o4tqwsNRACelk+hlSt6bMSYUZKBAuIFGKsaojSNsnmlveA062tmHTNJS+Dp/Cz+s
	6+sqOhtriibIxDJTpmv7COM6taTxjnmJoQr/wE0XtvE2P8Hap6Q8c74mepkIDNT6
	6rcGXA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6rakx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 06:53:25 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e13b57b2cso3839390b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 23:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786085604; x=1786690404; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UEZ12T353dcnwo+y/ZW2r5T8BPKimQowLmsXorlYXqI=;
        b=FBrl5hyhmOJoEc8HGAzDil450ALkJC+Rxhdza6i6oN8PdhrF9Swa1onMSanB2adJTU
         RCJ4siMdBCl2XteuQlIeFtw9jf0E1p0ML+t0LzBeBJqQDWjBEKGP+/vmRsDJcpjwFqAQ
         WyHGswVbh4CZPc7f+8JNFWLsP0Icwd+ypiIwdI8ctd6EvcESZ6keCZDrfaUwl46W6b+d
         HRkhtDznzTpPW2pgz23EdU0p+v2C5dOXvE5Vpn3feR77MPKysHNePZ4nSZCfZYCBopRo
         GGiRBguzfS98sbEhXFp7oHuDF9v5OTdfSQo/BX3Y7ENV7DGJSiTCCqrRKygy0I5L3W0l
         Mn0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786085604; x=1786690404;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UEZ12T353dcnwo+y/ZW2r5T8BPKimQowLmsXorlYXqI=;
        b=TAqQKug6LWy+UhgBl3ao6dYyaLb4vDdnZqr2eWAytb53SMuMcBxxOo1wzSgw7AH1pP
         PhuFNOx0EJth6Pnmwb1DnLY8UyLIoVM9ka/fmk9uRvbGD2fhvATzPHAWtG1I1oXDlHmU
         qieXhFxMg+wJw3SSeZvPeJ4g3w+tPriS1LV+Dldk9UJvBFfg+mxzCMC1IUFy1QWvOgsM
         FmWkZacLXcL7oBFd7/J4AaC78YNnNEJjoePh58uXfBUAakgnHF5DWqJ+aZckXbXjBJZv
         5GJim3CJfHYznhfUSNztpZMctIketZIoW0SlAvToIC17s4ou1o02JXnY6mrO5B7AQeFH
         3tHg==
X-Gm-Message-State: AOJu0YzxvVQpcB1ZsygwI/23+2oZm/Df0bcHvrqcWKHMAra6PzF8fO0r
	ekSsDVvUT5nIUUNnV07TsA3owfDyKboKPSP2yb6qIhpAyeLSNXyGCmQSgzN1lj9eftJB4psDZms
	IB2LzMauBrO5UPU8x/XJC/j5+XQztsmILEwyu1hy7m2GPSZSrDl9zOBJ16UINwpqWM81N
X-Gm-Gg: AR+sD11lPAkEINgMSE69KuxLeOBrC1BghbmDzWtmHTubzeXpP/Tnb2RjYjJW4i5xykz
	rF8BbnmRlG9yMPApsaAZGWjRgI8cxjJzpE5CyEthikVSV3tlW5vExRjBqenQNfBFMRJs0bMpPPR
	t0gVsinbtysSbaZkIjbUQ3UNPi8zEYQhY53+pq5s+a+OA/dn+/A4lVihma0SWVpsXXAtmaMryYM
	Acmb/cxQhMHuBr8QvnVuCQxB+saem8M48Ig/ojwKSEk2CNaA81v/fQYneCR6AhcVamGrGZ/htFP
	Dd7esjrTFWhV2bIkD2CG089TOMeofk10hAeHaO99OCgEzKWOtOpvTbFCQglwPTHvlDOTpqaiNf6
	Qnat7Ua+/LWwcdxESzKCO0bSfnJh6bnLFsQyGvCO5TfQ=
X-Received: by 2002:a05:6a00:1144:b0:847:9015:e68c with SMTP id d2e1a72fcca58-84f2e024dffmr21079833b3a.17.1786085604398;
        Thu, 06 Aug 2026 23:53:24 -0700 (PDT)
X-Received: by 2002:a05:6a00:1144:b0:847:9015:e68c with SMTP id d2e1a72fcca58-84f2e024dffmr21079800b3a.17.1786085603972;
        Thu, 06 Aug 2026 23:53:23 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f19842bsm223493a12.4.2026.08.06.23.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:53:23 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 23:53:09 -0700
Subject: [PATCH v2 05/12] clk: qcom: ipq-cmn-pll: Add NSS clock support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-qcom_ipq5210_cmnpll-v2-5-cce718b8ec17@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786085595; l=5236;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=UsBpjqso7qwEzQ7kYDKho/dDU1/+mseogrEormQfYF4=;
 b=H9l39pKjv9hSE9VgBhsevPNsCU9f2/Dnhl9XiA/q5ZzUhSMl3LkL57WvLHmQYnF3cp6bm76l0
 2mx0NKhJ21qDedtd8UCvJz4JhjAu3R8+5HvKWTlcVvHoV6im9Ept4Q1
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfX3agDdXlh1eEJ
 4gerf9+Kz9wgWeKnNXYk8iAWRHuZJMY3ovkRxF4OCeBAv2QiqKJIZXDVGIpDLMIWGqcn1gwgR3j
 KhxoxgFk0ciCktdyCd3IKLXWZNbARJ6PDAgKXBGs4oeU3Mxc0Kb/g+7xlMGa+t0+V5f2udvYZzA
 zUQqXe1Fl57syMGwHZGJ81LomdTpfgNAaYX2sZOW8VzJnfdRCW3mlUYprLXTWKiSfxsXi2/XOwU
 WlnXuGIX2KZMxk9gNwPr/wWkSYivxk/ZK2GC1B+HGABUk9+PeEAXBKuMQfSA/TUPqWzMqjQNguy
 Eb4z9906oFXfwy+wMR6OBQL34wVlZTcGFX3tsMQ1hcSKQYHzK1ZAFH5e6wORZ8ikJXQJgoVsZ/Z
 JKVudt1KmVreNFcDBdmIGcNqmN+KYRbUGej6dW2bURFIDwO4LKtj4/RdhIn4w8j3A9etsJryjCd
 AAbGybl6C9nrhz7n67g==
X-Authority-Analysis: v=2.4 cv=HPXz0Itv c=1 sm=1 tr=0 ts=6a7580e5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Z-rpqniIaXCS-UcZ7pQA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: IQqHghJnOAX94I5b4UURATQPAOUX2HYM
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA1MCBTYWx0ZWRfXyPq3NbiqNwNf
 284EtbD6BpFI53kxGvFAnPMu/ZhUUysXiMXapfqkpDPFEz4zK9JQSALW9B8KENG85BmS+mg8ZWU
 LakgChDQFYUle5r3479nCwEFht35Vcw=
X-Proofpoint-GUID: IQqHghJnOAX94I5b4UURATQPAOUX2HYM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070050

The NSS (network subsystem) clock is derived from the CMN PLL output
divided by 2 and then further divided by a configurable 6-bit divider.

This is functionally identical to clk_regmap_div_ops, aside from the
implicit divide-by-2, which the new CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET
flag now expresses. Register the NSS clock through a new
ipq_cmn_pll_regmap_div_register() helper, built as a plain struct
clk_regmap_div instance instead of hand-rolling recalc_rate/set_rate,
and drop the [8, 63] range clamp that the hand-rolled implementation
enforced, since the full 6-bit register range is now allowed, matching
clk_regmap_div_ops's own behavior. The helper takes the register field
mask and clock name as parameters so that the upcoming PPE clock,
which shares the same register with a different field, can reuse it.

Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/ipq-cmn-pll.c | 80 +++++++++++++++++++++++++++++++++++++++---
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/ipq-cmn-pll.c b/drivers/clk/qcom/ipq-cmn-pll.c
index 4fdf78f6829e..c1b00699eb72 100644
--- a/drivers/clk/qcom/ipq-cmn-pll.c
+++ b/drivers/clk/qcom/ipq-cmn-pll.c
@@ -60,12 +60,18 @@
 #include <dt-bindings/clock/qcom,ipq6018-cmn-pll.h>
 #include <dt-bindings/clock/qcom,ipq8074-cmn-pll.h>
 
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+
 #define CMN_PLL_REFCLK_SRC_SELECTION		0x28
 #define CMN_PLL_REFCLK_SRC_DIV			GENMASK(9, 8)
 
 #define CMN_PLL_LOCKED				0x64
 #define CMN_PLL_CLKS_LOCKED			BIT(8)
 
+#define CMN_PLL_NSS_PPE_FREQ_CTRL		0x98
+#define CMN_PLL_NSS_CLK_SEL			GENMASK(13, 8)
+
 #define CMN_PLL_POWER_ON_AND_RESET		0x780
 #define CMN_ANA_EN_SW_RSTN			BIT(6)
 
@@ -80,15 +86,27 @@
 #define CMN_PLL_DIVIDER_CTRL			0x794
 #define CMN_PLL_DIVIDER_CTRL_FACTOR		GENMASK(9, 0)
 
+/**
+ * enum cmn_pll_clk_type - CMN PLL output clock registration type
+ * @CMN_PLL_CLK_FIXED_RATE: plain fixed rate clock
+ * @CMN_PLL_CLK_NSS: NSS clock with configurable divider
+ */
+enum cmn_pll_clk_type {
+	CMN_PLL_CLK_FIXED_RATE,
+	CMN_PLL_CLK_NSS,
+};
+
 /**
  * struct cmn_pll_fixed_output_clk - CMN PLL output clocks information
  * @id:	Clock specifier to be supplied
  * @name: Clock name to be registered
+ * @type: Clock registration type
  * @rate: Clock rate
  */
 struct cmn_pll_fixed_output_clk {
 	unsigned int id;
 	const char *name;
+	enum cmn_pll_clk_type type;
 	unsigned long rate;
 };
 
@@ -105,6 +123,7 @@ struct clk_cmn_pll {
 #define CLK_PLL_OUTPUT(_id, _name, _rate) {		\
 	.id =		_id,				\
 	.name =		_name,				\
+	.type =		CMN_PLL_CLK_FIXED_RATE,		\
 	.rate =		_rate,				\
 }
 
@@ -357,11 +376,46 @@ static struct clk_hw *ipq_cmn_pll_clk_hw_register(struct platform_device *pdev)
 	return &cmn_pll->hw;
 }
 
+static struct clk_hw *ipq_cmn_pll_regmap_div_register(struct platform_device *pdev,
+						      struct regmap *regmap,
+						      struct clk_hw *cmn_pll_hw,
+						      const char *name,
+						      u32 field_mask)
+{
+	struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+	struct device *dev = &pdev->dev;
+	struct clk_regmap_div *div_clk;
+	int ret;
+
+	div_clk = devm_kzalloc(dev, sizeof(*div_clk), GFP_KERNEL);
+	if (!div_clk)
+		return ERR_PTR(-ENOMEM);
+
+	div_clk->reg = CMN_PLL_NSS_PPE_FREQ_CTRL;
+	div_clk->shift = __ffs(field_mask);
+	div_clk->width = hweight32(field_mask);
+	div_clk->flags = CLK_DIVIDER_EVEN_INTEGERS_NO_OFFSET;
+	div_clk->clkr.regmap = regmap;
+	div_clk->clkr.hw.init = &(struct clk_init_data){
+		.name = name,
+		.parent_data = &pdata,
+		.num_parents = 1,
+		.ops = &clk_regmap_div_ops,
+	};
+
+	ret = devm_clk_register_regmap(dev, &div_clk->clkr);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return &div_clk->clkr.hw;
+}
+
 static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 {
 	const struct cmn_pll_fixed_output_clk *p, *fixed_clk;
 	struct clk_hw_onecell_data *hw_data;
 	struct device *dev = &pdev->dev;
+	struct clk_cmn_pll *cmn_pll;
 	struct clk_hw *cmn_pll_hw;
 	unsigned int num_clks;
 	struct clk_hw *hw;
@@ -388,14 +442,30 @@ static int ipq_cmn_pll_register_clks(struct platform_device *pdev)
 	if (IS_ERR(cmn_pll_hw))
 		return PTR_ERR(cmn_pll_hw);
 
+	cmn_pll = to_clk_cmn_pll(cmn_pll_hw);
+
 	/* Register the fixed rate output clocks. */
 	for (i = 0; i < num_clks; i++) {
-		struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+		hw = ERR_PTR(-EINVAL);
+
+		switch (fixed_clk[i].type) {
+		case CMN_PLL_CLK_FIXED_RATE: {
+			struct clk_parent_data pdata = { .hw = cmn_pll_hw };
+
+			hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
+									 fixed_clk[i].name,
+									 &pdata, 0,
+									 fixed_clk[i].rate);
+			break;
+		}
+		case CMN_PLL_CLK_NSS:
+			hw = ipq_cmn_pll_regmap_div_register(pdev, cmn_pll->regmap,
+							     cmn_pll_hw,
+							     fixed_clk[i].name,
+							     CMN_PLL_NSS_CLK_SEL);
+			break;
+		}
 
-		hw = devm_clk_hw_register_fixed_rate_parent_data(dev,
-								 fixed_clk[i].name,
-								 &pdata, 0,
-								 fixed_clk[i].rate);
 		if (IS_ERR(hw))
 			return PTR_ERR(hw);
 

-- 
2.43.0

