Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D96D4E3ECE
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554660; cv=none; b=ap980/0zTXHokprUaemVdg1kxyRnPFzaOz8nyaXoXvG3187+I6BHx1xAMNfMYEVEg/VOw4UAokch9RKs0XNobVZlZdUXKIp8gZr3u5GNGIlQ9hz+2v7GgjX8FIOnUFDP8Xg9BxWzWcU7QkDY8B8NuY4YV40YfzQ4uGoAqrK6U18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554660; c=relaxed/simple;
	bh=xux2LST8xwir1FkQSENASfPbgYAGg/mYsd8LaSFevs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l23+OJHRduMxN6SN7iHvot2y5nRWUz43MzjWRj+0O8SPcMz8B0yTZN5vBHqFTUpWI0Apsy9S7qY1SpHxF/ieD47lgDaqle9SC9eQtlp5UPU4spk3D92Xvp6W/33sjO286kwTSbAxF2+KxsworZg5JeLX5stLKnsD7e5l7s52SHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BEPzxi5o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WZzKAW5P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BEPzxi5o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WZzKAW5P"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G933Lm2226489
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7XX3EFpvysfu1gUnUdLZB4FxWj20d/RsepVeR0k7x1g=; b=BEPzxi5oAxwgb6Qa
	Avt6EHSRfKIoIhjx0obrDH0EeGQOiue1Md8jGUdhs/x/5CNYUKM8eTxe4ubyNEgb
	DRqsTA/i2nvjD/t3hHGEuXXyE2b8XYuvALsecbpnl7E3TaLpEk0nERySOzL6yWtx
	nSCOLXuBoEEtiEwtsnb+LTOiVF06um0YmS2cyG58EE6cw9aF2Vc/L8IQ7RKpY1B/
	6RjJAN/1zn2r41Z4px+0Y9g788ZpDDigD8urONIkJqItOPouC9s7+9P/3oVIjRIG
	STZEsIJvDVHwxJKp/cf9//7+VvUTI3GMuTwBTTbMCAzfNJ5MoA/OLq8DcJuvehX/
	MfbQ9g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqah9ut3f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a08ff8451so657781685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:30:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554621; x=1790159421; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XX3EFpvysfu1gUnUdLZB4FxWj20d/RsepVeR0k7x1g=;
        b=WZzKAW5PwlC9atZaDARmyh8ZH/BnoYXUHi3U6ZmfxBu15QNMsh63UNwM/bEXnWFUph
         6H2giVIOa6msdmOnpi3A+0Rlw4mmRcflgKy2QXUx+B5ZZhFzgs1splW2HUmBQpZrW6S1
         9pYvUIfDDf+rP2E0BOISz8MyW9K/6aOZ6WdUA4cNQPFquvdBI6GcZS2mT/iDDlx4py5r
         cwHAq33U6+VpnSRW3ifMp58NUkgcUTvx7ttVhL3lOtzNexwtv0rcZGUznUz8wIT/PYsQ
         o7dDvaxrBaueL3vSfAKmSEuc/je6fGh8juvt/u6rCFdMYzZ2MBv0C194ySxJkEANR+6y
         +LZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554621; x=1790159421;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7XX3EFpvysfu1gUnUdLZB4FxWj20d/RsepVeR0k7x1g=;
        b=l/PtIET6mqxnd/L07e/nNcctO6noKJvMyioc5kVDJkGpkzdjjcq+HmOe0XUhnBmGci
         4z/ADwA3pIY+nzXfwOU/P4AYnUaoMjP99zw10P2kADp5LvDuw9vE5DVts8LDFp+dzNA0
         3L2buAnQCnTMk1UX+h59dK5YHHNUBrdHAkrIubxSnKslWWWUchv/qJ7KDk8JdG4c1s05
         B08BAhIPOHo1POtHtDEfcHvCgKtqRk7fI3KMj/7LtVawV6W2oHyWQ8PL0UBoPB6+V2Kg
         lWQQQKnIoYQY/eJXr3Ob3dbefQzPytzKwJ+4ZFfY84fie78SA7alcIMOjUbppinBzDIR
         XWiw==
X-Gm-Message-State: AFuF++nu/tJxWDMz6cGQwZpMyV3o2/MJJBbfew10ADaQSNw4GM51h7oJ
	xgpdLS/dB+iwCBR2s195sSwf+aUJgX2xTrcyVyU4BSxAlOUZotHoJwMB7CqUGjsuLBjRfcnAinC
	abCJBbH/IYaBRn9pBsyVxsrdw1ZSSXY3zi8gtTCCGdPLC3FfN3CWOcfqFuDL7djIS4P5W
X-Gm-Gg: AYBFou3I1HgvjQ0PCvd18DbF662MHQZMdgLdRzwAF5xnsvrYB318dp3ULqMr430i/eG
	5At4w1iDtNItK6nHLrDGiUQXIrRTunTkYuwcIqoUhBPci2clwLNI4Gl2K7Qpc8wB6KnMEtYGW8y
	FNevrVDOLNFQ30xbUZiJnNw6L5ZLZW3h+7fZ2L80ydNEz+j9BbzM/rdh4JE2RORndGqCvsZkuir
	ZQvswkWoLvFUu3215kGVA6hrKYXuZG/boVBl1Vb2JfIUKr/QO0GzQUc9YEFtNASlJ8wxULHPxTV
	sD6ID3aU1QW3eE9zoMypXlSgmtoNBLwN8Rq2UUbzc6ENtUQx1kH/OrX+h8+/eS2tJku78R/0t6I
	GAG7ycUU=
X-Received: by 2002:a05:620a:6504:b0:93a:48a:171 with SMTP id af79cd13be357-93bb798e710mr289694985a.51.1789554619933;
        Wed, 16 Sep 2026 03:30:19 -0700 (PDT)
X-Received: by 2002:a05:620a:6504:b0:93a:48a:171 with SMTP id af79cd13be357-93bb798e710mr289686185a.51.1789554619271;
        Wed, 16 Sep 2026 03:30:19 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:18 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:47 +0300
Subject: [PATCH 31/48] clk: qcom: gcc-sm8450: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-31-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3821;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=xux2LST8xwir1FkQSENASfPbgYAGg/mYsd8LaSFevs4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9p5BLy09XicihrlHUF7+8+oHeBaRSdMHPyc
 MFEg2S1pCuJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvaQAKCRAbX0TJAJUV
 VpblD/4ku3RgQf5az/4ylh0bSX5w0PZtyOG9uiL4N4LmbPhrZY/NJfj1/6Z0MbJYXCGWlEMrqdL
 7AX1yAHakLGfoydlS/NAQOuTxPQyj/DwPWa2nMa4yxidd7oP2VsJOOkOPrcMqgDtVPJT6RTtWz4
 /AcGguZNMHVQnLxhX8x/ECugUFHxvutMrEZuTdbVuvsmhkHzHKWQcHT54A+Rkox1b8bvBfU3Iws
 kDjz9MEoSxmcQtVL7vVaRVyANT2KNHXFbttdYPDImmq2DZw9HhRzqit4fbi3dKxx/EppbCeA7I3
 kqHX/SssGvPBapTIvYVsRho7I/hfZlDGSVA+4+hOiZ0VVOTuPFYvAkavut/t1Yor8QTUAbaGhx4
 PovAu7aOL1B4NQyZxvi7cbkBw8XOMnGJ5nJhh7hD0RYFPr5PAPErHaVjTtzocRq8R6kRVNzfLPt
 0tdA11dLnX15DUqzKml798MTrF5yRwgToJXihTYbCrGaWT6e9Ha1Ezo8OuhH4uL9mPzQ3aXJhgH
 UtWfsm8gYZHsqzdZhRdbKVDb1Tkw1RfpEFaNDCrE7LdddV61uTuDGPX20R8EMBva+u/1wykDZ/x
 nk/GsdwU7fGAOw/QqR3V2Az68sVxQdRloc2ERP/v+PPOpOp5bEjwOUWB6Ck0pmlfR9iTovJ7dJR
 U1fxZV0YuIM24LQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=BtkIUoX5 c=1 sm=1 tr=0 ts=6aaa6fbd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=39i0T9gdeGRrow2g5OEA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: HwHEOkjVGB4HDycOeQ2TPBVmEStIi3n4
X-Proofpoint-GUID: HwHEOkjVGB4HDycOeQ2TPBVmEStIi3n4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX6ko84UI/FNE5
 4fXR+oPVzw2pSS4QWMMX7aR70GfYoIXd0JR5Z/IuqLJFKCJvd9qf8nugKFV8kesFwal/QTrJZTW
 zmMpr0D03rW10fbkfxAG9Jz/DAa3DFF2z+l0EevijS2r13r4fC2csFy7xqOkC6Y3aZMN9g36PYw
 lxN0MWqinMNzZ6ybyg6Pg642b725ShM4UyQYuI6Pr3mlQVkXXdlUGNtvrzwOs4XG3J4aiPtGPut
 Vk43oQNjUfVIg+9PACTv/ykfYTd6Xgf6zKtZxWGxPGlW9ptmbl9a8sTJb8dP8GHq3eBjQe8564Q
 ilmApkkJXLRx24kXpPD3JndqEqW5id9ZnMSrDtjC074HIkYMWpQgKgDcjhjUwDgVhks/1AkVwQ2
 7seDeLmxT+151dVEqcEDMVDDlYODCIy0GcU94kfUusP/BQyI9gEroR3WSEtUNvkIltCXgAUdVut
 AVW+Qtf9UIKO0vScN3g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXx6vPgtt0c/2g
 uY/iuPRQLCLFfUP+W/VwZNYDZh6bo7Fhc0FzerZSVWu7NQWdFYMMPYTm1thZcf/ydNYBPnbEyT8
 tiD0xJLxNZr4648T2oujNqP3RfGM06k=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Move the UFS PHY ICE core FORCE_MEM_CORE_ON setting into the
clk_regs_configure callback. This moves the UFS setting after the
always-on branch enables. Those branches serve the camera, display, GPU
and video blocks, not the UFS PHY ICE core clock. The UFS setting is
still applied before GDSC and CCF clock registration.

Keep the SM8475-specific PLL and RCG adjustments in the driver's probe
before calling qcom_cc_probe(), which now handles register mapping and
the common initialization sequence.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8450.c | 51 ++++++++++++++++++++++---------------------
 1 file changed, 26 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8450.c b/drivers/clk/qcom/gcc-sm8450.c
index b18bb34889ab..0d3ed24628fc 100644
--- a/drivers/clk/qcom/gcc-sm8450.c
+++ b/drivers/clk/qcom/gcc-sm8450.c
@@ -3392,7 +3392,32 @@ static const struct regmap_config gcc_sm8450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8450_critical_cbcrs[] = {
+	0x36004, /* GCC_CAMERA_AHB_CLK */
+	0x36020, /* GCC_CAMERA_XO_CLK */
+	0x37004, /* GCC_DISP_AHB_CLK */
+	0x3701c, /* GCC_DISP_XO_CLK */
+	0x81004, /* GCC_GPU_CFG_AHB_CLK */
+	0x42004, /* GCC_VIDEO_AHB_CLK */
+	0x42028, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8450_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
+}
+
+static const struct qcom_cc_driver_data gcc_sm8450_driver_data = {
+	.clk_cbcrs = gcc_sm8450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8450_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8450_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8450_desc = {
+	.driver_data = &gcc_sm8450_driver_data,
 	.config = &gcc_sm8450_regmap_config,
 	.clks = gcc_sm8450_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8450_clocks),
@@ -3411,18 +3436,6 @@ MODULE_DEVICE_TABLE(of, gcc_sm8450_match_table);
 
 static int gcc_sm8450_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8450_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,sm8475-gcc")) {
 		/* Update GCC PLL0 */
 		gcc_gpll0.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE];
@@ -3456,19 +3469,7 @@ static int gcc_sm8450_probe(struct platform_device *pdev)
 		gcc_sm8450_desc.clks[SM8475_GCC_GPLL3] = &sm8475_gcc_gpll3.clkr;
 	}
 
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x36004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x36020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x37004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x3701c); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x81004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x42028); /* GCC_VIDEO_XO_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8450_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8450_desc);
 }
 
 static struct platform_driver gcc_sm8450_driver = {

-- 
2.54.0

