Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037CC483806
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251743; cv=none; b=rnnRhngzmwej6M/Iuv7RXUPCSig1kksFI+EeX9GZ2dRJc3ny/PBKC7WU1Rq4mQvSp5+s7PAX6xO/hRhbjH1/hOHurLZIjsx8Ye+zKQh3UB7qfWe/l9kkMsrifiFngomtjcRH53mQwp7hwML9WxzgkOVPaKhi+TEZCYdjrOb06S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251743; c=relaxed/simple;
	bh=rY7wgkiQmG20BFEGFvP0I4E2oVi8REXs0MtZfXyGIvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jmalFrIY/l4DPg41sgZJ6t5TAOc/8NSGRO2PxIdLf2zdWtTktPOqbK8ehJY+FNvg6AXVPYcPuYkJY0ASn06w/gBRWBy3Ncg8PyE+eDbAnEuuvZyR0rteQluwBGIfSxBiZRbWBFMpRte8/HXwIEQ1LUuv9zaTyvhChBS9Dqdwp9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GMadr6Nx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+2Id+6v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GMadr6Nx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+2Id+6v"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4m312285773
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0PW/zkK58dpl81VK/4qo8pV07u1jHEot7u5W775V9u4=; b=GMadr6NxaJNQ5uw2
	vlRiu1AZFsXPdh9t2ZrFHQ0ZFjLnJDxGHMG1YXNAt/Wflh+qvfawAmAI28pyr/r5
	k+OBUEcJcJmUIlRHxSyr3sCm6hrrea7F+bI8+FO519lJLWQyKaC4dqrgkw2IfP5/
	oI7fga3Zrx1esuNkZhuymWrGyRUiXEugt72bKucTqxJ1e0LTyqEb5MABT8pzX9ni
	GCyE6Y64Kr+z0AiDhWDSLy5EZWs+oc1AolbO58S5Z3cSAJVRt+8Dz7i/eDWH4qMc
	db4fusxgvCvIz5Wjb/us0q1ShtqaReA5/WIaTBtxBSTXHdb9WqdEyoRAqnxyyxtf
	le9/+g==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahguc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:01 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5c82cf2652dso692597e0c.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251740; x=1790856540; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0PW/zkK58dpl81VK/4qo8pV07u1jHEot7u5W775V9u4=;
        b=E+2Id+6v9ZWUFWgblNuBxELQJbA5rE2Fa67MNzWnbiQNzu8Cy+gNPfwcQPnSkxz+6K
         uw/NHG8to1t4u+06GPpd5gjBsW6PWXafqoEEKk/JZj5NkYq8ZyYt0JbnZqW84ANOacQb
         p1JdP+KPBjQbS49xOhJhkQAD7KFiBkgVbZe8kUD2b0WTxnEDMKU41v7MgC7T1YMh6tVs
         qTjyyxSYiWatNuj6s4vlrBhys3Ku1hg1bex5zvKXKAhfqx1V3Ay50txeo993MCw9VdTf
         SDYu4751f1AN4Ffq+h66XtSLGBW81YdFo99Ay5POEvvnWyfVwz8Uu4INz8TCWX7g5inw
         ha/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251740; x=1790856540;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0PW/zkK58dpl81VK/4qo8pV07u1jHEot7u5W775V9u4=;
        b=xOG1Li8jz2apYRio0n+UHfKsT+D7MWhW10tQQ+fAOYiErRyuokVWB+jBRXNOcAKfhL
         xqN/vcgGwRWwqV7lGqQ9K9kILjBW37kJQ0xzQenkrWfSbr9ncd0sUCwJ5b+shR7mu/nO
         raJCQHFLWEkKc9gFgit5kLEDITj8V5PMMrhollY4z2s0YfK7uAI6TnPmHiECeVvJ63GR
         RT3UY2HOJ7U/ZU0Woz3bIIc6CRW6/4Gb+PVHC3txA+BGTTbsi9XCYfyuMBh4v6Tvaz/G
         lmgxx3pira9ddWZfxQjVAO7u8+uLVHvVFaXbqQRnpmuCDmnTUEwErPLfquYUPEHPYOSv
         B6IA==
X-Gm-Message-State: AFuF++kxx+y9T4lHclYjg7mCfKDvLDyn2qO52u7ckjpr2TpHTmLWQLxB
	aXlZmR+Ac/d/deuR+VL0x1h+UouO9h10rOrAo+6Vz9fAs5Sw0cIh/yI5uve4euY9y1QaiOxiuyq
	1HbN0sXtT70oEQuc52YAg1EdV2YRj81vHPcToaV5y5ymeWjac5kRAvs1yJi17H/q+8l2Z
X-Gm-Gg: AYBFou2Zw4LbSlhfLK/U6zuFlSoF+jd0DSoye25n1jPJNoZOLd0uE0rxUPVFQ9gyCFx
	mGrF43VNSYnnOeC7yYsK08K6iU/aQvTrSPpa54FhftxwhM1GGeTw0jzIhn/JKGrV9N2mCCJorZQ
	oyI4fkhy23jdEVnLNoyXFy+jFvDosDQBPoyB4RF2XhzCGbkk/Q9DYYAyTS2+5HQCNF2hJuv/KOq
	lIlf76FvtvEcoceVUSCyAbSjNhiJVujz4BVwdcJIB2pzAg3z8dwUDbvoHFLAMFquoH1Ul7btpIW
	tfVBHHOj/veGPiMOGCN9L1diSujCpxBZQOOHtHVWj/daGIGSMa90O554QqWgRYFCfwBVGruJshJ
	Arba0vZpX
X-Received: by 2002:a05:6102:4b11:b0:7a7:36ed:4b43 with SMTP id ada2fe7eead31-7af1eff6667mr853408137.25.1790251740179;
        Thu, 24 Sep 2026 05:09:00 -0700 (PDT)
X-Received: by 2002:a05:6102:4b11:b0:7a7:36ed:4b43 with SMTP id ada2fe7eead31-7af1eff6667mr853394137.25.1790251739560;
        Thu, 24 Sep 2026 05:08:59 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:58 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:48 +0300
Subject: [PATCH v2 36/48] clk: qcom: gpucc-sar2130p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-36-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rY7wgkiQmG20BFEGFvP0I4E2oVi8REXs0MtZfXyGIvs=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJkRfd7+v5hA45Elj+8OnFoV0Dv48n9myJHb
 +igJm+qFsOJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSZAAKCRAbX0TJAJUV
 VtJtD/9Bs5HoRLWMA3+F2VAkRdXLwilTCmynPrurTptuvvBLSvDg96BMoILWLxu0RRd8nDPKU9h
 vBmgcfNuYOIq4ZiNBtl+FZx5f2PIMq5dSgOchNkWgTp4mtjcEHdIZnExYFGdO8Z3IXLpL13nnCl
 bmHpm6pG+CwroCiEw6sJaw3yuUJQEPZeesoGQWeU0hnDoZGXxy2x+R5/+0CldNPp4dN1KWxxwsL
 VTkfB5E/GDonwz+Pr/8nc54CndnFqTgtACUvnqzhmVtCUJGQCg78xeE90TK5qXbJYkmeCE2/Okv
 IYNGJ8t5V3qSlhKPYQBHBvI1EaGKCHi0KHNOwRtfeZT++Ap/odnPkSX4jn7bxqdJfPTalGTH83M
 OM2WxJFJBTnR1ydFNw0xRzYYgcuTRYRNy1WN8e25OzZwyiymA2RKDz8HtXTxLlLV0kFZO+KxXzt
 Gztom8QQx4506/kZm0mwlWbFI0mzJDFO+xkOQO4XmM0iMiW4t8BaOQDWZqZzzjp6p8L7gp1Oogq
 7elImwNO4NFD2p+cjixNYS1etJCiAVSn8uMehAmjRQZ9pRN4EOv3/D87vGF8aj13YTOjkQlbs+s
 Eb7bBsNH8KHOfqQnDx6NOJYAgyxbmyix2f7ZiUM8kaMosEGISz+1/dFJiwyiosOpqdiwjQN5upF
 tcsNqkrLLwBevMw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX9+CwZUUm2bW4
 gsmiPBUvBpRzX8GHVQ1NgIkARvg4SxEgeG5/KwQrSOjxACU3b8d+7cGWsOdrb1j1w19pbLENXuv
 6wOGUtiugE2lWrdFk3jO4lYYD3Qq1aM=
X-Proofpoint-ORIG-GUID: NHENUSMxFcU_tX5ixAOkGWMPoXb7yy_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6T2YnFMl9ID1
 2f7drHnxFh37/4S1Gm13pmtuVtr1gb8SSlpmRd03Oo26UWOGigJ8kbnkwihfu/ceNNGiwokGB/b
 2QORCyPgHjGUS6zEzqEb4nCSSGba1B6jRT76GB+L374UhnG25Sgpt/W1tHS5TYLWodM4PCN6ehn
 jBDLuxNhwvEEuJY40r1e16Uj3TjlfOJ25nOwn/Yn6DnFKCg6Q3CwsO6ZPPqXRAmEl7pP0d1tb2k
 gPgyf2sTfa7rYTaysGTX6KpWVdqGaT9SKcEP4Ybk8etVJxq6rs7h+ojWR7NGauaSkCEarY81tbt
 YH1AgaqivsW58S+IvXnVZd+A+sRcgrEz996uJLK0ln5iC4d+SCgn92zZc+HP/bO/JzhFHM1SSFs
 q15nVHs6gg4OKSzMQJrtVSqk4qGwR8F6DQw7QB5i7CUZ6B+zKZE5R0O+kks7G7LzTdvTsEeiDVW
 nUNlFZ6ua/zfNyOzNLQ==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab512dd cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-GUID: NHENUSMxFcU_tX5ixAOkGWMPoXb7yy_q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sar2130p.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sar2130p.c b/drivers/clk/qcom/gpucc-sar2130p.c
index dd72b2a48c42..fa261664c1bf 100644
--- a/drivers/clk/qcom/gpucc-sar2130p.c
+++ b/drivers/clk/qcom/gpucc-sar2130p.c
@@ -455,7 +455,17 @@ static const struct regmap_config gpu_cc_sar2130p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sar2130p_critical_cbcrs[] = {
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sar2130p_driver_data = {
+	.clk_cbcrs = gpu_cc_sar2130p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sar2130p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sar2130p_desc = {
+	.driver_data = &gpu_cc_sar2130p_driver_data,
 	.config = &gpu_cc_sar2130p_regmap_config,
 	.clks = gpu_cc_sar2130p_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sar2130p_clocks),
@@ -483,9 +493,6 @@ static int gpu_cc_sar2130p_probe(struct platform_device *pdev)
 	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(dev, &gpu_cc_sar2130p_desc, regmap);
 }
 

-- 
2.54.0

