Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF983DAACD
	for <linux-arm-msm@vger.kernel.org>; Sun,  6 Sep 2026 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788704298; cv=none; b=N90KV2hs2F6f22f3FY8rYI2pL9Bz1iI7PTV7rbl1FSQfuEydMeaCf9lSxA6bVw+1RLnz8cLsGPCnFbZ+cGBDlyZe7Ya5FdX4K3x26tj7fx8LwYdZ1yNPlG1Nef5YPRbB4nYSWl8YGMyYGcIX3Q92IoFG7NGDtH7RpFC3I3GCmtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788704298; c=relaxed/simple;
	bh=jkU+fUoOwa28jJYemXg69Wlafd0L7CgVOA0rnavRrGs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E76B8oWsx/ncjnxzdslr3tbRhKEq/ksno66w+rhcw2XnfLB+trN2nm+Vctd4WeJ6owcgMZ1Gi2A3CeL2m/ypIhMFUH+eaJFMGsM48EU8yO8SG9dMHJcY9p3mUcU6t65ZATOZZQgokTwvpLH3vTPiPIY7CBQUYnaZbzSurLzhFiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ans61Gzs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=haOllgaE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ans61Gzs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="haOllgaE"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6860jA4Y3205532
	for <linux-arm-msm@vger.kernel.org>; Sun, 6 Sep 2026 14:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ef5PxdtSb89BiUF4S335PG6FA5fQdwCuZoW2i3J5LK8=; b=ans61GzsC8q0zBdo
	RqsQrH8ZxWT7Tr4kVB1D4Ne5U/RUNrSdDTtXrv4vFzc+1qosHt3paPwPNqfvBbdE
	k1tqm7y9kB16wtnrbhJsJfdVUe4p3g96UY9j7YDZAK1o3VKwM98ZMXyuAnFGk2bx
	i7EprEsMKdfSM88j9v5xBlGvn4ZWrilPU+QMVH/XC5fXZfsN6elnlbRStXMSNA+t
	4zscfwXFsc9cBoqPPiRwH/vFxau0AAyzxSN3IpRtTLbQlwI3MBVqXKJroSWfFxUf
	ZOSkyXRn9DGEijyWKRA6gsD+dqe3j0Wq+2Yopvsuu+LFBBq3+ya/ztMJv3AzhNpj
	oDBjCg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggbf8kh4y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 14:18:15 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so4415088a91.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 07:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788704294; x=1789309094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ef5PxdtSb89BiUF4S335PG6FA5fQdwCuZoW2i3J5LK8=;
        b=haOllgaEXg36kInRpK7zexSCi4otbfqItQXZusDiMUc6eVlg7YUheJGEsr8UoVVIhz
         vneIWUR16wRlQ42IStmW29jdFfmJ3cwUWcP+ssp0n4YuYKYvbe37cjU+qsK4yXL1r3UC
         6YD841JSk4W5YKhhaJj2AoylCOcbrINQemMwtxYyozldry+zVfqdoCBEAWrsEhmFlxaF
         WNgA9hrWcsVL9zEe4QlA7AdiNNCeRuD6giTPbeAa/Q733BdCUC9fLpjCblqgezGEveEm
         mYqJQudnV08/kfk52876ECTc+05TTIp/JQsQfKF/nLRNl/sgG/CH+rBruJdIBhC2tMtN
         nIuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788704294; x=1789309094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ef5PxdtSb89BiUF4S335PG6FA5fQdwCuZoW2i3J5LK8=;
        b=YDzKCETneO8fzHAIb0DWHRN++2hHY7qfaAu2I+tQNYwXvCuxkSq8FX+14UMlbtSkKu
         1OroZ+O1zLrJShrR2+SUvKHrDh5TZD/vE5b/P8onndBM/dwI7IL6YRQ4O4Xz0A5Jpxj7
         CBBP5dOAmaC/9oQSu97MPaprfM525EzFOnNBs9YS69qkvXUfyJURBTWraw4jreIaFO4V
         bZtsVgbvJfThVtz6Gpt7HB5r/GlmDuzPJiTGgDumtCixJf/ByiXF4qAJmlb+k1JxAlfX
         WFZhiDKqTY2yyVQVw4c1vOJCONdj5OWInkICBtp9n3lpr0g9nTYFS9rcGReONBg4bXI8
         yPww==
X-Gm-Message-State: AFuF++n1ViRvqwOkpWHfy9PeweYqQ/98jAAgnXwYRSf5ICsxXOmm4B7+
	HowAuisoWEvnfHUX8WpFu1zHblflQq9aYjDzqOyFaDoTsJUaObEVE+ja6JhIdmdmP0W5sH1wGPL
	I+69fu5sves/r/gUO7byJbFTFEIt9kvWs215GqmQ55tHeLycwHLI8AZfF++CStr5uhA1S
X-Gm-Gg: AYBFou1x46uf/PZyW+RPLph0Gh/a39vAnHhhIxl9t6V+nMyvw/I0JXsD72/nedQ94xe
	/aB1MLUdlsf0YCrCACL50urh5LqXzb6DvsiSECvsgoc0NeyJUgxKttq2OUvFQlxwPu2Y89gqurx
	A0+lTvpl95SnUPFosxQunB8ot8Cbybc/Gs8226sCdRYKXnoUYljIhjOIVgvSniYWK8uNqa/7iHu
	wS5Pz0fYJsB5ErfhZ//7Ibzylk/IXSGBwCYUnT4ecvPIYrnsH+qOOLTZk5786DMf+fDl4JwZFmT
	1j6VnIseXGbp4Cow7D0Bga0ZrdkcP6O5Yucp5gE7UNX6Luj055Sj/Pp4bwBHZxulFoylkux1/wh
	diTV/pmMxqM1Rz0Pr5BQV5/Ecs2IGO579r+zNu1Zhj/s=
X-Received: by 2002:a17:90a:1c81:b0:39b:2c00:c3f5 with SMTP id 98e67ed59e1d1-39b2c00ed40mr15915448a91.18.1788704294383;
        Sun, 06 Sep 2026 07:18:14 -0700 (PDT)
X-Received: by 2002:a17:90a:1c81:b0:39b:2c00:c3f5 with SMTP id 98e67ed59e1d1-39b2c00ed40mr15915386a91.18.1788704293965;
        Sun, 06 Sep 2026 07:18:13 -0700 (PDT)
Received: from hu-luoj-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1432435ec2bsm17904550c88.3.2026.09.06.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 07:18:13 -0700 (PDT)
From: Luo Jie <jie.luo@oss.qualcomm.com>
Date: Sun, 06 Sep 2026 07:18:09 -0700
Subject: [PATCH v4 03/12] clk: qcom: clk-regmap-divider: Support
 CLK_DIVIDER_* flags
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260906-qcom_ipq5210_cmnpll-v4-3-aec5ed642f4f@oss.qualcomm.com>
References: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
In-Reply-To: <20260906-qcom_ipq5210_cmnpll-v4-0-aec5ed642f4f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Luo Jie <jie.luo@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_suruchia@quicinc.com,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788704288; l=3160;
 i=jie.luo@oss.qualcomm.com; s=20251128; h=from:subject:message-id;
 bh=jkU+fUoOwa28jJYemXg69Wlafd0L7CgVOA0rnavRrGs=;
 b=j2leIUEhfSDDDrGD4b8B8t3cw90gTQJOvq/BrwUvMJr982mw+sKUjJnDXhj0PrOBZGX5BsJQ1
 dNuNJ7Rh6n3DpMKWk7k7BgWvG6lOa81O+i4zfvLjcTeAktcQKL/b6Rh
X-Developer-Key: i=jie.luo@oss.qualcomm.com; a=ed25519;
 pk=gSsYMDakxtd6UDFYDdA9y9yjIs5Etp5GK/3DoXWPyS0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfXwHJcOMy79gj3
 HPkQvtP+FDHYdxc6s/U2YqKDMPfDPZe3UXJV+jnNjA7E98wW3KFl6C0e2CM5D2B4UicJCAyi6J2
 /ibKpbPI182t67GPFxRBJnbkaBRY+Sk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA2MDE1OSBTYWx0ZWRfX9D/jAPBTvM2C
 gchiRwCzUTGEKkSMgSt3GfO9bgKdtlLCOa1an1wqZg5+ab+pUIvf6WYzsLylVWdVn8Isu349Z1H
 aHapfqEGKCyivjZGwTkLZZX5xEtHtALQ3/nM2SKvvi9WFEwlI9T5WM6uylaIEcjIAjPNo+eS1Yb
 kTrTLWBASrvhtWuGpKokLJDIivUR6L+Vu9pfwOd9GB464plj4hFiYD2uSjPauyPGls/D5lerdBv
 Tz+PkzHokbwOPof/sUWvYUI+ucvIoZZxJ9V3MRuIYxROIVr1upryz9Whx+Oizp8ek4matkjAc6L
 O8jgXjHEOO5jhwrlFugvQu6fco6Mj7L6MLGekF4Mkl7zDeXQB/WcZYla8gAJTDQR02Y9kpa6vvq
 lz1+sDs09EKUnJGl5J7HoezrCcmR66D2Dg+RFEXLbJkpToxAD2BjeWUnb4RlsECShn9eck9Jk/S
 8Yhq5q/1J4kVSDk1IfA==
X-Authority-Analysis: v=2.4 cv=UIjt2ify c=1 sm=1 tr=0 ts=6a9d7627 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=vx7U0BMSOfWHh9VQJyQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: ValMOaSb-EcosmmadhZTKFnZhw4YaAwn
X-Proofpoint-ORIG-GUID: ValMOaSb-EcosmmadhZTKFnZhw4YaAwn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-05_08,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 spamscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609060159

Add a flags field to struct clk_regmap_div and OR it into the
CLK_DIVIDER_ROUND_CLOSEST flag passed to divider_determine_rate(),
divider_ro_determine_rate(), divider_get_val(), and
divider_recalc_rate(), so that qcom drivers can opt into
CLK_DIVIDER_* behavior variants such as CLK_DIVIDER_ONE_BASED.

This is additive and backward compatible: existing clk_regmap_div
users don't initialize .flags, so it defaults to 0, and
CLK_DIVIDER_ROUND_CLOSEST | 0 is identical to current behavior.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Luo Jie <jie.luo@oss.qualcomm.com>
---
 drivers/clk/qcom/clk-regmap-divider.c | 16 ++++++++++------
 drivers/clk/qcom/clk-regmap-divider.h |  1 +
 2 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/qcom/clk-regmap-divider.c b/drivers/clk/qcom/clk-regmap-divider.c
index 672e82caf205..6e12aebf14b6 100644
--- a/drivers/clk/qcom/clk-regmap-divider.c
+++ b/drivers/clk/qcom/clk-regmap-divider.c
@@ -27,7 +27,8 @@ static int div_ro_determine_rate(struct clk_hw *hw,
 	val &= BIT(divider->width) - 1;
 
 	return divider_ro_determine_rate(hw, req, NULL, divider->width,
-					 CLK_DIVIDER_ROUND_CLOSEST, val);
+					 CLK_DIVIDER_ROUND_CLOSEST | divider->flags,
+					 val);
 }
 
 static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
@@ -35,7 +36,7 @@ static int div_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
 
 	return divider_determine_rate(hw, req, NULL, divider->width,
-				      CLK_DIVIDER_ROUND_CLOSEST);
+				      CLK_DIVIDER_ROUND_CLOSEST | divider->flags);
 }
 
 static int div_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -43,14 +44,16 @@ static int div_set_rate(struct clk_hw *hw, unsigned long rate,
 {
 	struct clk_regmap_div *divider = to_clk_regmap_div(hw);
 	struct clk_regmap *clkr = &divider->clkr;
-	u32 div;
+	int div;
 
 	div = divider_get_val(rate, parent_rate, NULL, divider->width,
-			      CLK_DIVIDER_ROUND_CLOSEST);
+			      CLK_DIVIDER_ROUND_CLOSEST | divider->flags);
+	if (div < 0)
+		return div;
 
 	return regmap_update_bits(clkr->regmap, divider->reg,
 				  (BIT(divider->width) - 1) << divider->shift,
-				  div << divider->shift);
+				  (u32)div << divider->shift);
 }
 
 static unsigned long div_recalc_rate(struct clk_hw *hw,
@@ -65,7 +68,8 @@ static unsigned long div_recalc_rate(struct clk_hw *hw,
 	div &= BIT(divider->width) - 1;
 
 	return divider_recalc_rate(hw, parent_rate, div, NULL,
-				   CLK_DIVIDER_ROUND_CLOSEST, divider->width);
+				   CLK_DIVIDER_ROUND_CLOSEST | divider->flags,
+				   divider->width);
 }
 
 const struct clk_ops clk_regmap_div_ops = {
diff --git a/drivers/clk/qcom/clk-regmap-divider.h b/drivers/clk/qcom/clk-regmap-divider.h
index e75a65c3839c..4fde766b2633 100644
--- a/drivers/clk/qcom/clk-regmap-divider.h
+++ b/drivers/clk/qcom/clk-regmap-divider.h
@@ -13,6 +13,7 @@ struct clk_regmap_div {
 	u32			reg;
 	u32			shift;
 	u32			width;
+	unsigned long		flags;
 	struct clk_regmap	clkr;
 };
 

-- 
2.43.0

