Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A45F4EA39C
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554647; cv=none; b=USnSFeu8ipR6w9guxGcI+ugBcEv7WY3SGTbji6Pa+GNtecPGt7SGnASIWJlUW2hw8mkSiW0qv+TaebTzcAPCAdPlE+JbgA9anzvD6Tny1p5/6jZKhIgVJwihlzb0mEniAuOQOChV/aGuzZA4PHtu1E8qqOHzdoKNeQ5gAS5vv2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554647; c=relaxed/simple;
	bh=2UaU7R3Klsyvl2wWmbPnmjteeasW2un+bpN/PVjJb6I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cu2hD+Z+Cedvl99OHe1t7tgtC/vvxm5ztWIME7v+0/wpczO5B191lJR6Ggjpuz92ADMWabYLOhbG3wK9h85bOXtKaElFRJICiSrdiZRhXFw2gQ243Gu/dJL/xrCDwVtaOeKZq+QQXiib5g0MtId6foEfw2AoG7EFK7AFdo4PjyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DEd6gRct; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YiKfnHt1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DEd6gRct";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YiKfnHt1"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92j682478061
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1Sf97NFKUaUqW6VmDXtLv92KAWnBnsE42F8yV4CgO4=; b=DEd6gRctHCbTpgrU
	9y22YIuK5oDurM/X90Nfm/M8p0c6LYabztYeFHWI7IrzZ5GiDR21ZVG3s9PXKHRr
	6rMhO40mSvT//L/rH3GovP1lygqyLdRS5Bvbcl9tHvGAsqcF2ELqpT/OW8ufd1/s
	2cCBKc8PJNllOx4rZAa+OvTtIUxYDcMhznUiDQaRN2nQj6YnyWxUn73ub+fO2FHh
	eIcZV//KYrRiFGZ8iGU9LYiaV9pau9I5zPbHXH7mkZ9kQEgkoJmoSysKHM1pNXUC
	QYoawUTX30J4nO+unrKqh444VwTuiEITV/4OO4FdCAdjfXpxNfCGAFu2A/CgQrjD
	g4slrw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksvh3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so852977785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554622; x=1790159422; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1Sf97NFKUaUqW6VmDXtLv92KAWnBnsE42F8yV4CgO4=;
        b=YiKfnHt17S2PJ8BcBbL8ZIFnQy+yQSY0CWKkNpsmK3+X9ydvcPe5QtGp9RcvI1ekRM
         hy9dqnwngCvotfKico1gbhaef6zeIE6udYOJ1IcDGp5lGpn49iU9kPNgY3NXdkJrx632
         C2SyBUpuJvlMSCtxmm9r5yo1bO/DAPSH/ARz4w6QAOrK/MNg+lRBZx+uY0XWHFDMqzX8
         xjsQPVhCdwAeTWySbSXnNChcJ0zISnYQcxgE4+ExKc9YUzjcmjUKaQLKbtaF58LaU+pK
         pTieApPENRXDD9NALuIyVIDedAk+BDJaM4Gjm0ehLStoh2cWCXWoUe0znNrVl8euGNkm
         awpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554622; x=1790159422;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1Sf97NFKUaUqW6VmDXtLv92KAWnBnsE42F8yV4CgO4=;
        b=WvolRU8USz2g8W4kixA2AP3sBsYPCX6Rq+eZNzjU/yo2w4L07tHLRo0+//oUPU/nPc
         LunFydoPvyqrFt7RkqaJZrCsH+HGZ2+qvrR4Z3j98sB1hP3o1q5Iu+Ao5DigATayAKbU
         3jBmtSg4iP0r0nidcGg3GGH/JfDVtRde5OyBzYpRUyfLzOovtquxTr+NScn8kw3v/HTI
         PItiOyf9nvXk2l425D23e+9WtVa4+HpdfYD+jSUAaaLE2TpqPSfObkVQ9gEIsfUBU2dz
         YbWGG0vcsbmNHx+sHqm8txsynYu3F5FzAK8LjXVe6UJrt1AZM06ugcJrHfvwgAxve4P5
         s0yQ==
X-Gm-Message-State: AFuF++mWKUPJxVjbzlZFEbSNH8pRIlzQyLFyQAF2i7VhAAI8jyErnWEC
	MBmE/yKPoi+PaT3UcQlzS24pmWpc3heHS8phOD/bCQeeMHhKyRwoNHl5bHRM+sX5VgGuBnA/j0Z
	34QxXYQSFIq201I4JfLDxEHvmlEnb/OMwIgAbIw21dssS7oKTFC47+gK3mfaeSG+FLm0G
X-Gm-Gg: AYBFou0sBbFzsDn0OpvHiEFBIqTsRmVM1AhYbYU2xkMVCpJ1qLeiNtHrSpHNmco1eoW
	kkeU+tkkgeLGJL5t9qQXOQaPFzW/CAShGANyJoJwE5EwAbuJ6iWxtfx5fPzI3KX5ngMxuqYQLQH
	vLd3tK2OswwnglsIp1VBRTSFvsC/RnnuvoLZDUudI/wyVW7UVgemOxlPsuaEP0IDjI3/cXnLDRc
	EMQLjleKJMntrARqPuyFtERKX7iVihzSBdn4EbO4VMi3JJlF/tGkFUymtTjyR9F4mNqFXJ8prQ7
	cyhWc5qWs8YT2b83RezwwVoYmVUV3sxdO65hEWz6PpdR8WyS8OVsYIG8k29D2rwDQniMmczSygz
	GI1f/BP0=
X-Received: by 2002:a05:620a:1726:b0:939:7f14:ebc6 with SMTP id af79cd13be357-93bb76bb193mr292577385a.3.1789554622026;
        Wed, 16 Sep 2026 03:30:22 -0700 (PDT)
X-Received: by 2002:a05:620a:1726:b0:939:7f14:ebc6 with SMTP id af79cd13be357-93bb76bb193mr292569185a.3.1789554621405;
        Wed, 16 Sep 2026 03:30:21 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:20 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:48 +0300
Subject: [PATCH 32/48] clk: qcom: gcc-sm8550: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-32-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3400;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=2UaU7R3Klsyvl2wWmbPnmjteeasW2un+bpN/PVjJb6I=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9pRzt6zcSHKcFZCSTUWhXZf6Nk0cg6V8EDu
 5lGQGsJvqmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvaQAKCRAbX0TJAJUV
 VkeXD/9ehP+Lz5BOO2Njg9IIymYBBm/k+XyNrFwd3mxET/HLz4wVgYqyBzxZBZ3Y0PW6s7+Ht0g
 kTWVYbZ/ljJiihojDM8xZ+uv2xc7b/uyQ1Tf7XEKzzFtSqaGZKMQO6yoJ6We4PQUwuhrx6pGU4F
 vbnqeRuWCWLY7hy1AP60uvgGvcxsyHIDQjuDoRfUAivU9TOhjOfp4iMP8ZzcuHdo848aamSBinf
 /VHcyahw6woVIN6g1VqRLxYVNzikYx7/V4g7GYQHwuK3z5tKZtnF8IseE0GhTeCvzDVqCv9ZAwx
 le8gBpXRun9Juhc+u7sLk+3ODJDesqaKbMm/BQ8Fec0herBbh3r/xT/h1KWErgxu7Oc+CcFpp1i
 NDjIqmF2Is0M9c4zCdDIqSNwQtG/EOLSo1+Ckyx+V5gWcZxPDkZWRCjydyZlE1KnsLpIGDkDf49
 jC9+XNwubYbcu9I/Ujj7ocksB7kjv2PS6Hwo4OdAQdk1CgAvIbTmm1b/A0S5GROOzLbvJLvfE/U
 jw7e5zZIkRJypdqoxyI0ozDifK4s3KBdtop7NrKW0qBjOH0sp4Y98gx+So9hqahRnOej5izOguH
 d4YwNljnLviU3da/p372P9dsriDT++cje4ZDzAvd2COqyz5feiJ99H1z+jeG2KR3/TZiPkzIPkh
 KIniaY1DOs5rUOQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXyS2yvAprBtQk
 YF/lH4HhMk0BReMfCzKB/DI/Mqa5ifuc80sUnm3qtCLI5oeE+v+yklekAcK+oxqL6EojZrHdTBz
 OiStOxWgiScizYqVAIMaWhY02kpkU04=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa6fbe cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=RW22A4phRzxp-fsVvwcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: X7ap0FybuAeu4hPcdtHkDEWquRY0OWG_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXyk5Sh0RD8DwU
 z9AuK5tbJuQihq+fYFkFPvYoAl+uyAS/Gvc2KP/2plKAj+TqB9wSCGzjg7Xj5dAUPTo9gNyXU7r
 AWWWRuHk3VbUi+SOqiuww8CsRMRC5DHcnIC/rPLPJFMfbqLvMph08ecUrFpvr69aOMIUsQHhw/M
 mfvrcqo/XgYBQu7XzZFkUHxCXVveRoz/Z8Ebs+AFXbi+wqnGerlh559aLJSac26SXII2Lx/TvBC
 Hf52UsgG5Bq7iDU+4L0/1xFNhSIB8OfzmPNMqNpOjPqUUIiobZrDG4E8j4UAc/Y4xg2+S8IjmgE
 ChnNju8iKFe+qlVJNaqhS3YcrQ4Is162FA86T6dKqYHXNkfO42Ga5fL2jeH28CKtJDS0qUU79Un
 8w03OEl8pPtfUeyjELXseKjjy6DVZITqn1XznrPwopST0gBKyXAA+kqCbeNcywS5nejnGsZZyPz
 8mb2uG5Z9wlCZImHhQg==
X-Proofpoint-GUID: X7ap0FybuAeu4hPcdtHkDEWquRY0OWG_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8550.c | 57 ++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8550.c b/drivers/clk/qcom/gcc-sm8550.c
index 36a5b7de5b55..8a8c541ccc10 100644
--- a/drivers/clk/qcom/gcc-sm8550.c
+++ b/drivers/clk/qcom/gcc-sm8550.c
@@ -3319,7 +3319,35 @@ static const struct regmap_config gcc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm8550_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26028, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x27018, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x32004, /* GCC_VIDEO_AHB_CLK */
+	0x32030, /* GCC_VIDEO_XO_CLK */
+};
+
+static void gcc_sm8550_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
+	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
+
+	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
+	regmap_write(regmap, 0x52024, 0x0);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8550_driver_data = {
+	.clk_cbcrs = gcc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8550_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8550_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8550_desc = {
+	.driver_data = &gcc_sm8550_driver_data,
 	.config = &gcc_sm8550_regmap_config,
 	.clks = gcc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm8550_clocks),
@@ -3337,34 +3365,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8550_match_table);
 
 static int gcc_sm8550_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8550_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* FORCE_MEM_CORE_ON for ufs phy ice core clocks */
-	regmap_update_bits(regmap, gcc_ufs_phy_ice_core_clk.halt_reg, BIT(14), BIT(14));
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x26004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x26028); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27018); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x32030); /* GCC_VIDEO_XO_CLK */
-
-	/* Clear GDSC_SLEEP_ENA_VOTE to stop votes being auto-removed in sleep. */
-	regmap_write(regmap, 0x52024, 0x0);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8550_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8550_desc);
 }
 
 static struct platform_driver gcc_sm8550_driver = {

-- 
2.54.0

