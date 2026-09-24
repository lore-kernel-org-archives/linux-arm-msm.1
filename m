Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD88495038
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251745; cv=none; b=Naq6UFojhqyzEEmyH4nNocV2dBtCJDJ6CdNFZkoq+CfnC5mDRHltJdKAL9n79bgmza3wdubQ6qlfULtgyUeoTORUQyrY/DovwVnrr6mGfJzc2jQWAgf5T9CG+T8WYwX1MP9Qn50XbVnzAzOX0VwudV0O5FOswhuymizHAG286rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251745; c=relaxed/simple;
	bh=c0wYPNUgewRDJMW5F+vd3xsVEtdgJT3QfwAzWTspO3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XIqcisFCTUvKfu5i+mvmXvRKw1wZbN1YCAWtRm/QmfQIy8SAzpo9urpIap1qLTD8bm30ZYXXocwsaXoJZYB2J5gO7LG9dl11xYBD+4WCaIwnEWLtpiP84aqIAUlRES2rBU4Pt3JzyH/TtkudVZYTQg+JU5L+6y0PmqIK3UlnjSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qp0KlL+8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Uts076WM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qp0KlL+8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Uts076WM"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4ghk3134239
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y3li9eu0m/HtmddfnsisJDYsvstqJmy8Yy/P6jNbQpI=; b=Qp0KlL+8sSm9NYbb
	1uLWae2ye9pU00CprxrRVIW3vJEWeyDdK61aZuGF6erkjKIijx6MierlwnoDdnVu
	MvZjcpyPvCEEJJB1jXlcicYfPVVQ2sy/2VAhQIIX3fmTKTbzkFd1mKi1JFMjB00s
	MhZKM5oniciI7jCaYIBDeloRUxWG2EIkk3uIha2uqMC6973BixZHs5HxJutgSM+5
	8ZX3DB/y/fMSSv2xKItFv5bEA8QtNN4AFMqTaoGGRXDq9t1bQmeYh200V3GWfwP1
	gAI4NRloS60dZW7cV86oYeWe4ZtGo3RBopMtTVbfnXxKZc4jm21lQkt/QiL4jYdR
	KOXQ+Q==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1raggp3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:02 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-98087b0c5deso1551079241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251742; x=1790856542; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y3li9eu0m/HtmddfnsisJDYsvstqJmy8Yy/P6jNbQpI=;
        b=Uts076WMCLbbRiGQQi2evgoLAmyMWcXxlVfvfBDLnoj1+esg8KIiK5qsDB9XUL9Rna
         7HCYYkiNylcZ+KLLf/euJp7c0GTroORUfesfSsB9sqVLJzxnbvYIE7yziJZqTfVwfS1F
         BnBarPQh+UfWKuwmmle8c0VFdakv40mHmq90+KcdTI3kSdb4Iy4IH5APdpE4TtEdajDq
         MAGPVoA8GInf4RsjFOGneESpAKQyF0alDBVItP/ZZTGl3lHmmq22gjKMhLbJ+fTGE8zA
         nKIw2+Yk341j6sQRPRA6cgGqn9+xQ1QNuZFenjPV+wCDne7/OG+JoPGsp4/fIp6PxI2Z
         pE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251742; x=1790856542;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y3li9eu0m/HtmddfnsisJDYsvstqJmy8Yy/P6jNbQpI=;
        b=2ZBsD4CmrhfZEkdtD3Np3Yd+DVvRSnAO3dQuVYZzkFoBZs1qpNvTuZomNrHiENRSHV
         PoFQGeuTWbYtuw3+fIFlj3MGwKjLBHo0Ok7yZaGCvPIM7yTlOcB2tN4KG8L8EMLCSOXb
         TmAcY/TzwmSCL0BFB6FHg4WELPBZiSdVqUdH9kIhtt4KWu0cgSG+mkJqKBPXI8td/+Jf
         kh263Mn9BkV5HYh/+UszgwfAfL3Unis3eBBRs66MESYueoOBoz0mxFTAASkY/eLq7XGO
         jeOe4xgymEMBBsnQwv4ZB/WfPhF34f+1XAsg+EDwWLjdFtOH/CefySDwCmcBijUoe12W
         THJA==
X-Gm-Message-State: AFuF++lajmzTzSEdbUXztZJ0ZHP0I2FrqwUWNXlVz6COjts8HvYgiqmZ
	RT+eO6zT58Q8cplcKV2184PGuiMWOxHBxoLQhgWhGpDnNPpgBjTR476EYXQlN0XNdCLTvpA8qGQ
	TOl6Qte3ZsMKEXd5b4MbnkMnjAOyCS4qkuZoUGkfTh3FkWJiBSI5odVNGUTsa2cZack9E
X-Gm-Gg: AYBFou2LT5XDedFQVKkoYEWYiVIDYZr0DdEngbE7uFHIKQwsQueJQBirJh+TB0o0gsW
	n3sE1Jq+5ht5JTTvSksWI9UCXR4JIwwURz2XfVA5L7Wp27LLPcPA4mjEBZjS0BV+AUHVPRiJ15g
	uErDo2/L93cgtsqCmnuIDxjmCraBHT1LNfcdWMm4v0IPaFMDIOKxjc2WqCMv72MNkKg4VqkQ6vL
	KDvF7xuPbfX/Di8iA5ZXoU0HVZTVHGPaBeQhX18cPvNjVqXtrHHV8FURNowiyyPgM+fuClyPJd/
	8HtI7+rBlOGE2mkXFIFhSB0Rg7HCcV7YVADZxcFHPi70hhT2eiwivL9qL4Qt730HWYhGBcclj6M
	H/s03+3h8
X-Received: by 2002:a05:6102:f8b:b0:7a1:f7c3:3a47 with SMTP id ada2fe7eead31-7af1d6c2e25mr1025321137.20.1790251741852;
        Thu, 24 Sep 2026 05:09:01 -0700 (PDT)
X-Received: by 2002:a05:6102:f8b:b0:7a1:f7c3:3a47 with SMTP id ada2fe7eead31-7af1d6c2e25mr1025312137.20.1790251741280;
        Thu, 24 Sep 2026 05:09:01 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:00 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:49 +0300
Subject: [PATCH v2 37/48] clk: qcom: gpucc-sc7280: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-37-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2147;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=c0wYPNUgewRDJMW5F+vd3xsVEtdgJT3QfwAzWTspO3s=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJl/9yp3g10naQVMDMNr5N+hsbFUv8EWIvVJ
 UnXbdxKer+JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSZQAKCRAbX0TJAJUV
 VqjND/4z0NkhOw/OWCCz0rQkE8gUjGr463luBVOcGHGelzCG3o+vOs60/WH/LQaH5hLqixx8SN5
 IWGsrWnOkWEOhAjm+HEXgtrltybm8OnSqVFOWkSbJWsmWVShxyx6tAWk1/3mIdt/3I6mE6SxCZ6
 pra9ZwmS/OSojq7kCf4idb8iHDTKbJVKC8h12wby/jeq3CSbCTnr//Dqzb+tR88scZg4QjmIhpb
 uTF/7vBZK6MzMfJ7+53UzSwwaFNao60RQjT1MiNbh6GwUl7jZst5avM6lBPLPk0BCpO3wxOmY+w
 JeZHKZx4HT0FooPRY/otkqII3JKrTSrR+18xeCn66hMpSrB0nRciU2ljp2NVmtVu5nYcYWHzxa3
 EHrMKyGA4wsPYjyRwJhWsYILqgW+LeFQeeZ4gT8KPFKXEnnOWa0jJKN/WzseG0rfE/KwN5Ba+kG
 TW5HvPI0vY/fYpTolNdsafTi7BF88EO7jx3b6y5IbjBDbcCSo4d1S9B7BMQ/c9MhPyLO9+Bub+v
 eULRWTEaHwN1qQGuI6oqbmDaHZJf4GJA7oox3yAYskPBjRoynLYPwPzc5bRGsS1ZTmV+g/S4HU9
 1eoAVbGx9YGjMvTwEJWIpUAE8D+3jaTYW4mXvbbbCdO5Aj+Be9S2BI8J0JOJbi5CGTGVnPUZj+T
 axSlTRfrelsbrnA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXw8m92yO72DRk
 +/chhjY5rn30iKZkqpKv4P9tzm5CfvIntROTSG6bvR00t3ZCq0sOji/EKT2pV37n0iPWQVaUuSc
 89h63iMNBbDwin5R5FB/wpvQM0poPJ/B4Er2RhEivLO1pXKLCvP9JFMjjhA1gtxYFSHHDkFbiXh
 SrSqeFeK8yv0spPUHUZmB8qsspR4efJCmjW3MW5dz/VvG5PTGbgprzOW5UqNEdW6n/HqMVOReLJ
 ZlnAc5Kysvod0Y77S2fGtG13I2xC3Ebq191klTpTADT//2D8AEeOpmvkr5t5n9ov3CrHVKavd0f
 c0HKJe5QhiHwOfCOHURrxsr2LvVCz31zpEeMPR58Sz4vYtVDgRFUQ0Pfa4gnNJaV2IRcduXU9gy
 lbL80hMo8ldQUqgBVCBIsRQiNiADA0PKCwjBXbU9/dN6PKdBX0DiyrVI9x5Jfex3+fbAA08G0m9
 9DIuBMoyPC6veUUhTgw==
X-Proofpoint-ORIG-GUID: wHJ3NvpKxoCQv58leG9Wlx1tT62jp2Jh
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX4ZSS6b94of2T
 1/ZVsRPR0OKqfsy21hRKo1kxE1kBib4qI0aga8T9CQj+dcVbfl6ufm7/HOM5OZRedqzYX/PWzSY
 Cz+S9MV3jWTa9naM+wVuC1SePV25qH8=
X-Authority-Analysis: v=2.4 cv=fvpJ914f c=1 sm=1 tr=0 ts=6ab512de cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=W2O9Cv0nt9n2xGTIkqUA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-GUID: wHJ3NvpKxoCQv58leG9Wlx1tT62jp2Jh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Move the GMU branch register update into the clk_regs_configure callback
so it still follows the always-on branch enables.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sc7280.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sc7280.c b/drivers/clk/qcom/gpucc-sc7280.c
index bd699a624517..9b267276eac7 100644
--- a/drivers/clk/qcom/gpucc-sc7280.c
+++ b/drivers/clk/qcom/gpucc-sc7280.c
@@ -440,7 +440,24 @@ static const struct regmap_config gpu_cc_sc7280_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sc7280_critical_cbcrs[] = {
+	0x1170, /* GPU_CC_CB_CLK */
+	0x1098, /* GPUCC_CX_GMU_CLK */
+};
+
+static void gpu_cc_sc7280_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
+}
+
+static const struct qcom_cc_driver_data gpu_cc_sc7280_driver_data = {
+	.clk_cbcrs = gpu_cc_sc7280_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sc7280_critical_cbcrs),
+	.clk_regs_configure = gpu_cc_sc7280_regs_configure,
+};
+
 static const struct qcom_cc_desc gpu_cc_sc7280_desc = {
+	.driver_data = &gpu_cc_sc7280_driver_data,
 	.config = &gpu_cc_sc7280_regmap_config,
 	.clks = gpu_cc_sc7280_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sc7280_clocks),
@@ -464,11 +481,6 @@ static int gpu_cc_sc7280_probe(struct platform_device *pdev)
 
 	clk_lucid_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x1170); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x1098); /* GPUCC_CX_GMU_CLK */
-	regmap_update_bits(regmap, 0x1098, BIT(13), BIT(13));
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sc7280_desc, regmap);
 }
 

-- 
2.54.0

