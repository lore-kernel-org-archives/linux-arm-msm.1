Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0109C496D26
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251747; cv=none; b=b9DA5XymMth1gbutExPvvEUBgwa0mss1lUleo1PMkwyM8xsrQjIRPBMKABP7VEIDCYjz7FdOJJkY8FjJdio63TfIYU/SlHE4renst8+Nvz2yDptB8HXvBUyV+nqaCTug7JSZD4PQY3ZjoOo1kV+x7Ho0pUh3MRv2oV1iJ4Teu8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251747; c=relaxed/simple;
	bh=wxH2A5NltypVNyoBLsOyo7htIGEyAFYuwAaak2EL2YI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PYNbL0OyOkRWwr1e0WHtM4S4NiJGdaDv+aArn/4Ox2vX2x64xJJBQOHbTWJlOgqxqtxGKZrNWTq5sBXv4R+vs2CGeooL1uko+srTBJrf7Ucg/Y4KQNal9Py46G6SbbNNC+5c72W16bvxAnAjWPf5oZx2ZE7FJyjdBEDMhcchIwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kZSeca/y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkfSNeGV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kZSeca/y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkfSNeGV"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4sWY2285955
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vKdS2+i+Or9HfpD28AojxWPrXGU6WCfX2xA9f2H8Fk8=; b=kZSeca/yFBbsmVLp
	DZMbZVOUcU3ehICxDieN4WkrPkOTdz5byOqaixH/7Slp/E/0be6Jem3YwhKSx3FM
	E4db1ugYULb9T9XhRbyuLy2C/tYJLDpLxUfPuoeeHGu6eiDNRhH9gF3do/D8+4hs
	FrDCz23Gtszuy2QGL6qMzEnWu0gJelr7Yt49UqN9TxZR/y70zfj71A92WpQMVKlt
	gElWuLhmH3sQ2K3Lw94bbSQg7+vpYsBeAtiBFUbT6fYH4xxV2+M6JwgnRM6mvU1i
	PRZaz6Ox5wkMh9U2rUKMdj+VxtYxRf6F47Q3qbeRvlr+ycjQifFUrw/1pFVEsCxi
	Fk724w==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:05 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78830f4bebaso534135137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251744; x=1790856544; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vKdS2+i+Or9HfpD28AojxWPrXGU6WCfX2xA9f2H8Fk8=;
        b=SkfSNeGVHrNfCJVFXhotnpg7djCExSOczYnLons2gVFncDVp8L69fd69OlLmT80Yw/
         ed3da0KFZdjtdTwTNy8k7kkI1zkc5HgnUBoqir/ELHP2QGkhb1T++OJE8hiBXAxu2NaV
         6EViDGcjgIoccLNGKyV93mAkdsskGPEQVLGDJDhERbJccCFWSwjC9uPk24v6XyBsWl5n
         kV1fzGWMT3sM0NW7sykzeQHKa01ta3C4b/I2HxzQU1HAqQyhP9r+aUzv4nx9Vn55e/jO
         pJ8blhtSW1nUHv2aXzQEwCjPNMymiEYgixII7aAD1TpBp/ty32cR8AYCi9aCW8I5t8SJ
         s8xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251744; x=1790856544;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vKdS2+i+Or9HfpD28AojxWPrXGU6WCfX2xA9f2H8Fk8=;
        b=nRSoClQhI+H0mzU0vJ5zXErMvD1mViTM7fyZ+INXL+KiUB6TejIlQ1Xx+Wa5RlJz8h
         gjrADiFpy6k0LAxD7O01RnNuPabfrt9YLpoGPr8hEsAN1gCeEQZbZC2NgZdO29V0YmN6
         xDl4yfo/owqY1Tm3KYaBCKA0APp8WGr47Zo3BNY45uFZNVUdiXADFo+ENl1E4hdmG1C6
         nIi0u+0ojAXLx2LO7DjKQsRO3nDIFRQGKjfXcmNppebzqLYn/MFSQIVOS2GnBWc070P4
         JEJCPBndQHAzZ0ZXqbVClT86CrG5YK2WqMfXCKqoP3CRKx//Qp3IgS/OOVaEtv76CcAZ
         YCFQ==
X-Gm-Message-State: AFuF++nUBS8OjmB9ZuV1d5gE5glWDqFSMVzza881p1seOWq521xpLkVA
	k3iKNFzKrdkmz9TiNc/fND8ngcKdVGz4sQEfnRky+tTA9MEUR+LFdfyPyMAWu1bdwn6r0L0caDM
	U4YV+aw+r7Iyy/LreTJbnJrUuskhvkrwYWJ+1ZSGQCsx4gZ/rtNoRgRF2rjQXTJrw9Khw
X-Gm-Gg: AYBFou1GlZlFr1rR9HjYjoeqaRrKRaFPLtPaKOBZp2M7g0rXv6d95WKpEI/W+lOxwJx
	eumlj8XvhVpZkT3O1vdem9OmTUbXiczJRa9/yKSOA0RTa+y2G+xQBt7wJrrgOdyEi9d4mBCc9uY
	lbeL1Ltev/CnrQ3ReRK+3ePlJudHx6vBf5jQYPEeijNrVf86prkxmt3wvheJ9xBYLJpZ9RnYp+N
	xHuBSEbPwJ6NhvKfBBRYhAfn/JD8TVj6e9HRCn2dPZbIK6eorUBvRbVp9fO4m5VAWlX/6UILEcn
	OA++FH5wwagHEK/Sahbc+nFtX5uZ/V3/meemzOf7su4Hwe3BwwB4iF30J6kEeCC9nr3FTjR3TUB
	qVrxEIloj
X-Received: by 2002:a05:6102:3ec3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7af1f621049mr1004962137.37.1790251744044;
        Thu, 24 Sep 2026 05:09:04 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec3:b0:7a7:19aa:f0d8 with SMTP id ada2fe7eead31-7af1f621049mr1004946137.37.1790251743411;
        Thu, 24 Sep 2026 05:09:03 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:02 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:50 +0300
Subject: [PATCH v2 38/48] clk: qcom: gpucc-sc8280xp: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-38-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1871;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=wxH2A5NltypVNyoBLsOyo7htIGEyAFYuwAaak2EL2YI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJmmLf9L+zeW+sIikLbJmIHAg+4ekWaUHnt9
 P3bPRZ0/OmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSZgAKCRAbX0TJAJUV
 VtekD/9rGUwcl8cNbr3rDfQgLAAkckSiqbtsKLaiDjvDE+RerfHlcOQjrg4WMhy1qDRrGJzbF3P
 2ktJkJ4KwhT3HxK96Sx9LTM5FKk486+BpiCkyM1ldaZCFniC6zozIHEb+yCLe8GLI65OS3pEkdA
 bMGpUQZnu5y13ex5HCu7sIi4+h14nOFVm8I92/J3WGbAXcCpgPVEIsuTuqAjLePsjTmwoGFYEg/
 0OZdvf/UpvhTU98D/pWVEQJNs85H7ZE/njwZyEbn1hoJER8iMbI+YGeggbLXje5ieIlvRJAkWFX
 i+rHIq4sU3ayCoUpl3wL0HBzRhUJVyA7uClgakWHXw3vCkmfsHyxBMK5rfyvIHCCuBQ0jGd5O03
 5fNQpIc2gqok8vfMm/77u95R3Jb9iryioKwmU/cOAcNQ3Ns5WmETrNZGAbJKLOdi2vmCQoQG9Xd
 y5+QnnrXcI97sbuk98wpSuM4eC+Ur10VMDQFp/p1HN21gRMDQSdZyZU88iRARc5a+T73V3ZNnz3
 3rVsPCOwu5N/iqhkagTTurekisnnIX/FiKkfFxZZykyEi4Ml/gJPWCQNo/rzwDc7mF2gZLxEXBf
 CPZJ6ELumRbIJnblCq4J/qBd6cKUFUQRMgdNoOpzZF3ME4bh/j9blcewDTcsrI3d0qNlN3VrApH
 saCiVMme2zhRDrg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX+6Q80nmT6yGV
 lrLi9f+HcitA227KKvG7P80p82tjq+KjzkdfmMYkYLxbqi84B32k4Gm6z9uLyVAKgghkzEP6bNR
 DJ22g+Dr8xzrgSFtjTqqwR8tOy4v7ro=
X-Proofpoint-ORIG-GUID: J-Lwv1Dslb8bURvs4uYyxJcBzHrMjuNc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXxwWb6DJtuBpz
 cehEMpONdEzHBPT6+C1IXRkBFRSAgw9eZ4CL/7FGs1UOX/dKUI6/ipIyHxrH6LvoJO69t7Q1j6e
 tqI2VphP7MwlyHl/7yvOuKciAljs3pKUDKQGYk8BO2/KD1Senxw8+vJdk3TJFhkRySl2BN2XwWG
 g+O9mUX9LavdKyWbx8vmZE5aA3lH8mMmfQfjNBZqVahTHJxLru6urhoyouWehxnWVF7eM/4ywjZ
 qLPtrw2cqEHteFEP40XbZbz+M94PvDKcohA6ziMOAQ6a41SDEIbvnrIHVpmomT4x1nVh7l9Gguk
 40D7D9WQ9pALY0ZgxpVHOOsOmky7L4ZFn1WRihZeqfzqIsSBZj7jCmgnUodWSlUXweqnqO5JR+E
 2m5zz74yAF1n90Pe15udjG4+c1+fTm7lxEoB7hn7secrASR87iBAbWrnl3FGEGjhuz6nfZhXScF
 BAO5cmcPeN0Q+ii4ftQ==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab512e1 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=tHUDbLQnBSC955iDWYgA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-GUID: J-Lwv1Dslb8bURvs4uYyxJcBzHrMjuNc
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

