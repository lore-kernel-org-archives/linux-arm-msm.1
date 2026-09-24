Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F60A411A12
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251695; cv=none; b=Ki7TgUCb2MPOcc8XrTNOv/yT18wbkc0aND0ahwfj3HKR/7eimrhCs4skkyv9MGWKNW+u5P7sK7tHZRJyhauX/YuY9H9Ip8hVmaJv112LTKf1Z+/jdZzbVbZ7ey8SudcUzV06PckOih0XHKtXwhWwsWIzYVfe0bSwmz5iqqLXDxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251695; c=relaxed/simple;
	bh=ARsbxrH/Q7WYwpyJReSEhO4CvLWr6uo+1CRyqPxe4FE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=toqhTnzN1w7L0gxP7e/PsZv29YxeoRGY+sBoOmniiIDSyB8kEm204b7FGZ6AsHItYdI/dGfPwP1Gsn3zOLsniTV1XHRp+g8Z9ASEo6T/D/tYDsAT4b/ZvGF/MiNZs1rXeR09tStAojUsuQ0col/NoZTUAgvtiiUHoPMiY0EMKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eNvodxdH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ALYeefc/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNvodxdH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ALYeefc/"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4sWR2285955
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	87hYcWFubNegLgmjMiXeWDlEjaezFx+NSFVdbN0rlZw=; b=eNvodxdHqoR4CxK9
	YqqlDGraeY9NnEYa8YxgiYfkg/9UF8bmQ8FWiJMh4Pkb7JEZS5VxUqoxntcCFaV1
	vFX9FMjvY7qZseBVlQoI83Ga2vAJ+WUU7ljkMu8y/RdxYAzCIHlZ0EVSGLNMXTu4
	55jO4w2v+p0pZW1JPxkXVzfCT2Yj1pfph8tY0w4CtAWDkyOear0jHddwIK9NZM/3
	luHr4vxLcuZqa/lJ/QB88sxUjW9ukrt1DhJdORokyFV9gYH9/m3OYjvb4O+7CHr1
	Wmw1bw3U5Y2hW81GqscHanl17vBMOJfOZhuLcEwvyepR3Ji05NPNugXR5BKZMe22
	+zvk0g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgq0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-78fb21aaad9so751568137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251690; x=1790856490; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=87hYcWFubNegLgmjMiXeWDlEjaezFx+NSFVdbN0rlZw=;
        b=ALYeefc/Qmwmb8QfDvGmbrnxudCBfKWkdNJ5rMAlVTpWqP+yKbetdbUV3b59+SHJw4
         uqQlxdj+xLFpbvkyNUyjch9cMaT/GCMO8lXkZY3dh4lBiAQ/C9VmLeGpuI4kQr6pkpNE
         uw9O4Rg4M66lbPzFl/trvSrjSE8/v7UIuyhLF9pygTMc+FFoeV7qlMech/vyUm7jDDsq
         R8eYrDMRThXUSVYIYPXnpjkJadbDTwMhjiwI03IAHpzgdiVEFEZbXurpR0biCIcbMhCW
         Jk+mm1yQGFIlJvK9dKLS18Oc6Tx0rQMBMpYmNqKwmmiHziyEu1pn6gXCGy2yUtA7asDE
         JxxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251690; x=1790856490;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=87hYcWFubNegLgmjMiXeWDlEjaezFx+NSFVdbN0rlZw=;
        b=l2ceLxX7Pt+c7W0rBfjCXI3gnblZDTcszo983LKs8QFhSlqlNbr+6ZT4lcUT40kZrU
         G6vzg2L9eGX+SGkC8i4AkFq2EFHSamcd9Xyu016l3QHt58ux7k4PgSBT9gpfgnV9XsZ6
         8+fKf3hsE2gbpbgfdddW1qL+UVr3o7LmbBFTyzL4vBDerzL0CBwF+RtVugcHd0PSQdrS
         0L2Yc5Rbv3B0/afvoM4TaHt8UENPvkk/4sMjl4fu3bMTJW2cOj9BRA+JgFuMgPyH8vvZ
         60xomI+t3VjFyDwCRPUfxJKhAsB3ltrmpaolORFKW9jKuhmwmB4/4hOiPOJ5CjmDl/MR
         2j5w==
X-Gm-Message-State: AFuF++mueo7hqsSPrNBs2o2BLTsgIHtM2a6EsK9QCqRDsZaOy1z95f13
	+fWDa1IJNFfHLJWQqF96sCVMVjoAGh33xfOU9DQMmH2PYmQiFmoXH9oWE2quyULV6F+ESelIZp/
	VhoSr6I3Umbz323GH4bZf9G3rZa2bpnDP9w+zUaH5gJej/RoFB6C+WC1gpTaqcEqT0HUg
X-Gm-Gg: AYBFou1FTq3ZR6PvPRu/RvWR//G6FtDS5GVeytvw5w0zybVibsafhgVd54hY7IN1uz6
	mbfQq/evSF0P/Ib9r+rqyYbtHDfnoSIesADPHoxkTuSJpkmfX5Uhf1EdBmJ6aYCXUU3IizNzxDc
	bz6y6MlGlpc/z4Nf4KNkr0VqNTokbmKmAmGozobLZonwMjclFvrwgkbpLlZcOIFisN73Myys+gL
	01Zrmf/udTOA1PADQyWnvSl5nQKtJ0fMbMpORhgnZG49GYFadjAw8h+syUJdjIpa4Kq00qpIBxK
	zYRqbqgIq+TLT06wvjAUMPRWLHQ38WAR97jZMcmUOQY+yJm8nwVdsweZGgSgG6lGHqbXdUVaaRO
	jYoRjceJj
X-Received: by 2002:a05:6102:a216:20b0:791:40c:a2ca with SMTP id ada2fe7eead31-7af1c692a3emr669694137.9.1790251689735;
        Thu, 24 Sep 2026 05:08:09 -0700 (PDT)
X-Received: by 2002:a05:6102:a216:20b0:791:40c:a2ca with SMTP id ada2fe7eead31-7af1c692a3emr669683137.9.1790251689066;
        Thu, 24 Sep 2026 05:08:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:30 +0300
Subject: [PATCH v2 18/48] clk: qcom: gcc-sa8775p: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-18-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3431;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ARsbxrH/Q7WYwpyJReSEhO4CvLWr6uo+1CRyqPxe4FE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJSS5om87WcIhDTC7qf1gzvcQ7wAFHW3Cqkc
 061PURAv+6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSUgAKCRAbX0TJAJUV
 VvcREACBmmog7zmvfyXOTZhZb9dhZTaioFGbQD3KcIaPS5vwz2AMsPQMC6MgzJCrKHJ5PZJ3zoq
 Tc5SGSVtg+95YGcXIWXOcYJ8pDm1S0tWGIA6Of/UcQ+0fivQJaftnldHgLPTlUrQqbAQ8fVDImB
 awMLHZPuqr9TM09hAb+c1A4wQ6Etd2hlmnG+z0jL0z8OWc7YPEEZUUeacQyMikVe8YAj7iDBAhG
 KlcMSrr+z3tyRME8UHH968a5n6imO/0VSq1eoum4R43a9zWi5Rbn2lwm4BFM0xeYuechKHfRFQ9
 d9TFDO3t5rVQTdnk3DYUgI+z6wq+mz3wHT4lJXn+GttY7Iy/ITSaEXowBGl4hIJvm+EKZ3K2q0U
 sn5uq1J3m2xyINib6pM0R5Kwa+gJf/WzAzjS+l8tImU5veU+RIQ4awQwBccfN8oxVR20D3KFLNd
 BdzborU5JmYmGJwxeotMr48xZZopfnuBhvt+NA54eyUTuFRgZ6u377cheuZ2kuesba+6NmbArEe
 zR6AVR84JxBjAMqOUMITdk7W7XRzDGt+WP1XcCa/czt7ytxW0tl7NAzVbBkqByIh85rxxztLQUu
 CkWXnvyzKp2PkcteFpV0+sP0ubPFJgGfPanAEWnLXOvpPgYop9twhPqLikckIokRDhAZknhdT53
 zv/haOm8U1CMcgA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXy0yE4SUEr0cE
 GhJwgZ9u6ehn5DqZH9S292vJeB7Jl/VsXjVq4tu/km2X3XpZw01Ir3PuXx/1tS6lZctZ2sRV9NX
 CvKhmyEyn0243JeosThw+di8mJOaviQ=
X-Proofpoint-ORIG-GUID: JXVYh0tTUTbZTCBwzQi-sjiPLWdBClfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6Tm85JOb2vsd
 ZKUTk8pTdiG9ulpmRyELnPtbSUTSWEx0MJILH6cwGu7ZCUhGs4HYX3ZNaGzKnxoUCZQ9Htl1Vqv
 UTrd9Nk3v4Gb19ekS1Gv5Y22dEx+yWE6CThxCc5nWsB9Lq+x8kugqHEKZKkNT4HhGeaCWfiGNWC
 1UYWjI5TFFy0e8vM6q1Em3Vij2/e8fpJEv+bEy6wdTrYymGFyh9lsRHfElklkTiTtLi9zOaioy1
 dBB6SpdCATJmyNwfM1v5wAKUmSkXiwAc03HD8J0qUJDpU7XhmG54IG3ZCZAb997yoN+WF4yQK1N
 hGspoVME70glHPrzuOGHrqxI4wIBlFyIgNisCVc/D+ep9yVxdffxkPVtq4oKUXQwsGmxUBAfVJK
 p1cuHaYikuhMNj//8QYzy2N+qE0YUXpdxNGGEyjr96v+dWAyXgpXoGjCL3B4hokIS6/B00IVBBX
 m6sw6sNzQCkUaMo0FmQ==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab512aa cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: JXVYh0tTUTbZTCBwzQi-sjiPLWdBClfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sa8775p.c | 55 +++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sa8775p.c b/drivers/clk/qcom/gcc-sa8775p.c
index dca316decd0e..fa31710ef557 100644
--- a/drivers/clk/qcom/gcc-sa8775p.c
+++ b/drivers/clk/qcom/gcc-sa8775p.c
@@ -4644,7 +4644,34 @@ static const struct regmap_config gcc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sa8775p_critical_cbcrs[] = {
+	0x32004, /* GCC_CAMERA_AHB_CLK */
+	0x32020, /* GCC_CAMERA_XO_CLK */
+	0xc7004, /* GCC_DISP1_AHB_CLK */
+	0xc7018, /* GCC_DISP1_XO_CLK */
+	0x33004, /* GCC_DISP_AHB_CLK */
+	0x33018, /* GCC_DISP_XO_CLK */
+	0x7d004, /* GCC_GPU_CFG_AHB_CLK */
+	0x34004, /* GCC_VIDEO_AHB_CLK */
+	0x34024, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sa8775p_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
+}
+
+static const struct qcom_cc_driver_data gcc_sa8775p_driver_data = {
+	.clk_cbcrs = gcc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sa8775p_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sa8775p_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sa8775p_desc = {
+	.driver_data = &gcc_sa8775p_driver_data,
 	.config = &gcc_sa8775p_regmap_config,
 	.clks = gcc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sa8775p_clocks),
@@ -4662,33 +4689,7 @@ MODULE_DEVICE_TABLE(of, gcc_sa8775p_match_table);
 
 static int gcc_sa8775p_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sa8775p_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc7004); /* GCC_DISP1_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xc7018); /* GCC_DISP1_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x33018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x7d004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x34024); /* GCC_VIDEO_XO_CLK */
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	qcom_branch_set_force_mem_core(regmap, gcc_ufs_phy_ice_core_clk, true);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sa8775p_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sa8775p_desc);
 }
 
 static struct platform_driver gcc_sa8775p_driver = {

-- 
2.54.0

