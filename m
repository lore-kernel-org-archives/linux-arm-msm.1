Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123614FB9BC
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554646; cv=none; b=u4a63ZqSzS63rXz9mv5j5Kkhu1180/GErnLM1UjumPgKCx4C0A2kXEyMtLWSzMQHWTyFolfGOeY9CERRd6q2s7EN+3pmHS8NUMs/4Tb7IhwXEKIT5KAY3Atdo8URYP+Q7o0Rg0WA9BuPxPCuyc6nKJHFJsqPlPb0cGDgqx21heU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554646; c=relaxed/simple;
	bh=U+9VQRVM4S7Z8VJMwjV5ugP/YnxuxuAFNy2XnC0w9rA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mqxj3u3E1B2tbAEUGq5nfldl5wIKQmap1OZawbHR1s+Mja1LEK/elSYtWErMFG/ROCr7yDs4tq3d8Zd0L6+yv0bW3zgR5iILjLJYO4qCdnCP1iHEC2eu8dkcmFDwMRsZp9WrzwhinWEX5N5tE1EycGDn8A4C3a6CjzoxjNV/nl8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ijOEB+xU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/vUmvpV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ijOEB+xU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/vUmvpV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92g3l2348139
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GN46dMW3MStQFHvocVLrbP88+rGtR199PBAALuRhwHU=; b=ijOEB+xUc1ldJsYD
	8n+G+Yw4K/CXadTfC1v2d9tDp8YkHjYJgzAUKGv1GfciAQlybUDzrdzK/wJBJ0Cv
	A3oo3mgPZDn2NoDxgOrONE0lQ0IkQiJ7GACLcqZUPhoujCVbGFDkjBjQCsh5vEeJ
	LfA7BhlCn+KXms+Yv2TjouIVY3nd6p1s7sF/aRdETkjVk15Fx/v1mGuC0t65jG3s
	PLGtaMUzCHUr5CzA8LMW423dEDnveU8VkTLTKTBJjIjv5SvR/uUI/52pcnpN7j82
	605Wtxls8vBgUR0aRxa+Fn38+FsBdh2fAjbSdIYX2ZtFI+j/b/ou4W9Y1NCM8rxr
	9zBGbw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqdywas88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:38 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-936708f129aso835075785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554637; x=1790159437; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GN46dMW3MStQFHvocVLrbP88+rGtR199PBAALuRhwHU=;
        b=d/vUmvpVJAFt9w8anmnXkKWUTPYE1wymokPmvNupDtXQkljok/bzgHFalA3KOFPjL1
         1hvSWD+5pKJdpuHgKmkqyRitrYP6+QrpoUftYOO3hIL5A9cWss5aG+aY92JVjJdid3fI
         WIXXy1V6YUlrB4y9rQSo13p5pZ8pT7R3Ks6LkAHuoaJrpCQDuE76CV/P9ZYz/QFmR5yy
         ZryMJ9U8wY2R7MRhcXrMjIDC4T2x8VkzXUj9AFdZnGXaCYRby+YMZ57KysER/3ZyLw+n
         pDdLpClr7frLOu58QudYlQuU63L/HEuRk2aPs00wSbCgw/YfJA6iViU45ZHztvrUmsB2
         i1dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554637; x=1790159437;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GN46dMW3MStQFHvocVLrbP88+rGtR199PBAALuRhwHU=;
        b=NQJi1jSxpQlt1qfnICi3X2UcW+kNV0pe2a2eWQVuM3Jl5yzg7qEwzlrDO6xzw9xBwy
         uvUt/MmTwmliO+TPKz7UWxFM+16hG7fdZo2HStpR0ErKBCYJHbB9quUeRqyebaDFFb92
         SY1YJ134QL0UyFze21uNVSanPo+x80yCacw9OSe9dMQF81zjOQfW535Pgv7WkLu/zHrD
         2mM5g9BL7KTbOSDpM/2AvnSIsEjGaI4K8RevARoa0RhjGoffeuY8/s0eSmzFDN2USNsL
         h3Iou3VnPxHBGOKivG8yMyz79XA7OEsVL9GyYw6e4S9rqEEQO4/PI3TbAyCn+liyZ5Zf
         T2GQ==
X-Gm-Message-State: AFuF++kya/zIOdTp1RusadTFqHJIT2wOTSC33J1TqOo7CFodT1MkhY7c
	X9ZsUbAnggr2g4Fd3wWssKyOLZ0btkptItTusVdw6rW4nCdzxqWpaQNfsFhPvy/nvlgBgn2rue/
	z9Z4nij3M8JAhJUP5/jf8HsrozUmF95mrExpFvG9cIoVt+0tMfECN6fYH6RhQy3cGTBGz
X-Gm-Gg: AYBFou0+aUrt8gEo8qOJ+Svb4w3D2eYU5t+cRNHwv3Jbrlh5iMyDEwIBbjxoIGKUy3e
	au9+sJE/qhYgTcvrBslETtBvfbOn/HDarDK4p6vcgTw6Zasq8i6TxqNwLobzLX5yEXtIcADc6hT
	65AVLe7FlVdUaF2vrDX7v9JsDuz7HWNyx/FPf73lURXVF0Yb1ZVQa/d9rHq9GEXuXeZ7etAUp1R
	9xMyJQa7U9cDfmLqWx9K2cSccDEECXJr553Y6Aq++3w4D40l35PwqyuH23aXD1kkolOOvyK0wnm
	aLkxS8PBFUveMpVGQ47fohiOWVRx/8kkSJJ4u7t6ppjN8x81q20ZbZhqmx+0jgv/eQhgA4Uyvgg
	OHiaZ6t4=
X-Received: by 2002:a05:620a:2618:b0:939:f7e4:4f8a with SMTP id af79cd13be357-93bb76bba90mr333784185a.5.1789554637134;
        Wed, 16 Sep 2026 03:30:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2618:b0:939:f7e4:4f8a with SMTP id af79cd13be357-93bb76bba90mr333776585a.5.1789554636547;
        Wed, 16 Sep 2026 03:30:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:33 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:54 +0300
Subject: [PATCH 38/48] clk: qcom: gpucc-sc8280xp: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-38-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1810;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=U+9VQRVM4S7Z8VJMwjV5ugP/YnxuxuAFNy2XnC0w9rA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9vNtZ1AAAaxGDuuEJBhH2VfyTKPfvGCdG39
 L6eSxuqyMqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvbwAKCRAbX0TJAJUV
 VqucEACCd9UTuZo6IC2p8zfCsgUYsm6g/49ObJnDkUBIIltUy7btBOAu/DBjaFkjQXTiLl06L5R
 AK5qdzCX7vuAXFERVajKMjGbZjBlUNsOf3LgE1IZ2yqYbLMh2IiXspWKeEOHoAAu2Grdi2MCf1J
 DQErmraCBnmR2gfZliuOeQUrLm3GsT4WlA22Ny/SpCrNRxYHukEb1FqUAsinNhjBeYX2Z9O2sxJ
 HbjsuC2D7Jo0hXfJQ8OnrKy8SrdtgWdG7TK2uGkZ28vMczauC8jca6egqhWEuP43SgfrWyrpqHH
 ik3X2+pAnvmYm57wl5pPODYuUJbGtLvkoHpt/4Og05WGMF/MW4u9GOXhxeiRus3QkDdfuCTr7Xz
 558A2uZ20rSRu6KroTwsGRScxqgxKaa1Knvg2u+PXzENUixAiD5VH9FM7ijoeI72/umaJ36Xnug
 GQ1QXOnEKFbPUxGWyQoNfPd4bm51oYNb7nDQl60wPmOisb2qGfeg7IgcAdWZQv065rXFYa2sf4e
 WxcDpI6DY+wsyKmDQRcCHMxTCFQdP4HI7G74YAHujhl28Gc84dZshqkmZHoxjh1w9bvN3kjngyg
 xi0PXu8QpxjZLMRngEjEqLcufP/TZRXq5KKwrzoaGtxa2F3ago73qEQ+TC/KjYrnWJ4pC5ZbWWT
 8FB6lXm7wdvfuAg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: FP-00N6hIDR9JcowAoSi-AEoMuF6B8N0
X-Authority-Analysis: v=2.4 cv=aJ1lOr9m c=1 sm=1 tr=0 ts=6aaa6fce cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tHUDbLQnBSC955iDWYgA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX6E+ycrZSngcj
 Fjok01BKO6Hxcq9xgXHhJn/IciHLZlZJnnfDiV1cah2fqTAI42z0dgy54+rM/e3kO2WJUrwip2/
 /KrWq7f1GFjBqAwhgpIHa9SFyeItE55nvjL7TaK/1RdxXRK/2PSfjNxQwLY1+NaKiWkSJxG99em
 VEjbUHAlIvjmdWX9pcaIZm6TiuqbctQNQvIzpFZxQdIjNWjYuqDVBMt9fKLS9rsBskarv0TJCmw
 wLGK/Tmw3Sm01hOCGD8BW6meQ1t62EITMnEi11IqIcnH6Twi1ObSEkOIknNUD7CHr+FwQo99LO0
 n2/ncA6pj+z9tnbHCWw16TyXpmNHwq43x0PvkGUYF4c+q29ua7OVDbNAOUj4Gn5xMFjNrWg60va
 ODt8rONxoeSTW78SAMEymS/Qoc+2WVcMcZtJk2e7E3HakNfu39pMgUtZ7GTQPBb2ujvdevqR6GW
 bzYh/Jhef38/Rayq42g==
X-Proofpoint-ORIG-GUID: FP-00N6hIDR9JcowAoSi-AEoMuF6B8N0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX7LPp9KaDrOFN
 HycTdnAUIzCN9yanynaIX23CpHbw8NbwjCP18w8R4NygtcjIQxA7gqv4/DvUahshs5LoEWWBkhM
 pxP780wG07+Y4xMuP1zFeJEok6O1PTs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sc8280xp.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc8280xp.c b/drivers/clk/qcom/gpucc-sc8280xp.c
index 5dd90b854afb..2ccc083a4f98 100644
--- a/drivers/clk/qcom/gpucc-sc8280xp.c
+++ b/drivers/clk/qcom/gpucc-sc8280xp.c
@@ -415,7 +415,18 @@ static const struct regmap_config gpu_cc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sc8280xp_critical_cbcrs[] = {
+	0x1170, /* GPU_CC_CB_CLK */
+	0x109c, /* GPU_CC_CXO_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sc8280xp_driver_data = {
+	.clk_cbcrs = gpu_cc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sc8280xp_desc = {
+	.driver_data = &gpu_cc_sc8280xp_driver_data,
 	.config = &gpu_cc_sc8280xp_regmap_config,
 	.clks = gpu_cc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc8280xp_clocks),
@@ -445,10 +456,6 @@ static int gpu_cc_sc8280xp_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x1170); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x109c); /* GPU_CC_CXO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc8280xp_desc, regmap);
 	pm_runtime_put(&pdev->dev);
 

-- 
2.54.0

