Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D59383990
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379406; cv=none; b=EXsk3gQhvkRv9A5U/BA6t179T9/9dZ6U5xLUN5EADH7OSXT79HlBLo51xvui119MVkAwgV08SsUwIaliJvMmRzux9YjqY+j4OSa6CBCuWqZSqipRMdVFO4XAunP7qOq9Yqojr4m3875WFLiBWQPyPFM3XLm35AjhnZAU/DJFyUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379406; c=relaxed/simple;
	bh=R51D9HeZ+Vg0Rsl0PNUJ14lRccWMdZfVaqTmaO/sjmg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KHC4nYaN3OuHZn0ykYoBvqrQ1+aZfrtn4rt88AiyHAEHlSJlMBRFVT1l0ZkT0J5fh/mNLEMI/3EfoiCd6Sa/jKi1zZc/0IGonLm00Yn9RxuvAslXeJKtxzC/hpiihxOYkKZmneUAtoLwMRL0l0Ngy1CfWa1v30YFohvwaceJlSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Roa8Fvuh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IhryPR2O; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Roa8Fvuh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IhryPR2O"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAJOwk209412
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zUmmls/L94UwYRqT4cXSw29pARzyX1sbrFhRE5+U1l0=; b=Roa8FvuhcR0xGF9H
	x9b7KhUVDwPKgdtdrEzlp/Xk+bB+99st6iD17rO7Vb98aJf65U1/tHz+SJTyAj8p
	jNPNubu/eKfbqO8mJ0M6durwqTNo8OkfNVw6yZJPn2aUx5yk95ZTCmDRU9GJRH4v
	7ibn8zEB1wp0qFafD8wlNFjMKhP32pSe+IgfDkuzUXEymrl09OHgMSQZ1SKPxrHQ
	dSy4gP0+nsreCUkeBOdrmi5bd440MXM2GcVoWIc6FyNHOdCvnpXqJ26DBphWOlcM
	aEY2mz1B4mCkDnSyr4V/crsPiObVgEj4NlnWnrfaerlRW012P3pe6w4UixHomMI/
	LIstDA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bvrrkq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:56:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cee1ec30f2so73733455ad.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379403; x=1784984203; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zUmmls/L94UwYRqT4cXSw29pARzyX1sbrFhRE5+U1l0=;
        b=IhryPR2Oo94lArttO+NdOsOkVnQkVsp87rtRZrc7Ft5Ac1CUVQ1ZKvIMsGaceojDe8
         v4Cz0tEkjmlnOsuRiCOuQeANWeFfze7q1+oyDA3FN9oqgTpUZc0/U88S8iVa8QsyodPu
         r2SzjdRgLaFm6ULMBmce99NONn9d8sLZalbltmBQX4XqpDBJ6+H2rUQxw2FI/BPPEHRx
         YVlKae+5JKFz8IYv2tFmHBvaOsv+T6kLxuqNZ2cQz98YbIlWokkoIxIQLRT4BNmHKYBj
         ffCPDm7HpqIrTzT9FbHxQ+UdyaCM15pTl3xJ1geOgW7R+FVbz2EjKVARokfg+JovIq6F
         52ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379403; x=1784984203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zUmmls/L94UwYRqT4cXSw29pARzyX1sbrFhRE5+U1l0=;
        b=ZNK1ukz6G6Nm30eKphu5FwYJ66cgUYitOwwXPrn7UxX9ppTnG+0U4tTFXKJoeW0x+a
         uLZmv+uAExv5O6gEyrB9imohIN0CeeieCO8/ICR8tLaDBhI5jUrVKD2lq8XoJC+klTEW
         7xtiS21YqrGZLhD/PojcLh8UrlevogUj3LoXNI8SzM5AgVi8qt5SNl+4qo0Svg6sj62B
         U0DkJgpPVbFAR23/OOXi5MJz91uEoXGMlIaysYpEvUJL8loJ89C+ud4G9P6SuC+e9WiB
         GZv1XtIo2i4pKs41Lc7rmbEIRH9ZqV/qQQyOjaCdUt8SaquW5ouzQ2HIubb7gphcMIJ7
         Vomw==
X-Forwarded-Encrypted: i=1; AHgh+RodcPRTYrYHtW5Mcnk+DWqlnIvJ4F5FuAh7tuoyFrKFvf4yQYesaWTyTdiEk0cj7n4JXbaXl2Nhmgqiv/Cu@vger.kernel.org
X-Gm-Message-State: AOJu0Yxnyq4h8biCx3OBuNYP2pnAz6iCWMAoEf2NIedEDFCb9eyZyrWb
	7K+ee2qUOiiNp1RRAIvkzdzkJv8LXhbWjyO/UuXlp0vpTLXngWJ7mnNyyXzL07dZtjGhFSCx2S1
	3+YnZLNPZiN7yLGnIY+HHrQHeUs9rXYCJTnAKRj4fM22qkln7aUsp004aNbZWqnZq3b7Y
X-Gm-Gg: AfdE7cmce1aiAG1E85rDAByUtwVWfDlghfXVx5tboM60CWH2aNw8PFb41u0kSR5Rcb4
	RYuCYsvJ4vNGNwvejVNKpywLLM7KDDvit5Xq7jGbwkufCNdQmbvOgBizFOY5w0dSMBq9qJt02HR
	j3NSanE4P/CRJ/k9wjz6G4exk8zCMIH0I4zdX1L7wyw8P9T9uaXo0HHk2byz7x9KcVER4f7oxl3
	Wfjhcam1dJNdx9OijqWi9755VV+gRvhKW7QejMpw/I11ZOdtbiEc2bYtFipWOAEqVQiZtBLHxok
	ySm9+NHqeNoA10GWGRBWmU3Bc/4inQ3spnatSdxBw9h434sxX3cUXOprsXvHPDqXBKsqiKV6MwF
	w3SEiFheq1z/Eco/dfoTFPC37A4YSCyk=
X-Received: by 2002:a17:902:d586:b0:2cc:df15:91f5 with SMTP id d9443c01a7336-2cf34a2a314mr75017085ad.44.1784379403172;
        Sat, 18 Jul 2026 05:56:43 -0700 (PDT)
X-Received: by 2002:a17:902:d586:b0:2cc:df15:91f5 with SMTP id d9443c01a7336-2cf34a2a314mr75016645ad.44.1784379402683;
        Sat, 18 Jul 2026 05:56:42 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:56:42 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:10 +0530
Subject: [PATCH v6 03/16] clk: qcom: dispcc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-3-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: mtU2zJSqeFkYGAcCmboel6zko7t2ObmP
X-Authority-Analysis: v=2.4 cv=EcH4hvmC c=1 sm=1 tr=0 ts=6a5b780c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=5-E6Jl9njFXL_0F9BXgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX4PncfWrOwq35
 Br8KEDhKQw5JedLj3Hw7kYKxpV+DYie2EGGCZb7nymbMEx9oVa/0HO6LqLO/vT04bpMBBkfl75Z
 gnPc6S9BLaBV+m3yB9nN4Jt4RLCe32Lat16dXq9PDHmf1AsDoHjUzLDrlOnlFtIcJ/tFfrQMuoo
 kbREkbFaRAMSBX7JF9FbW1IeI95eG7oUntbaWmQ7eehonyLqNvf3No6J8SGXfCUexCeyKfioy7L
 b/8rID/N7hodtA3qZollb2YKkmO+CcRVy9Q/hh1JXDrbKM2Dyf7X169+fE7uDqDSEfc557Awfd5
 x9EIAQbyd/nMC2sGuW8HICRUn3/3l3nJv8e93quJyLrmbWeCJUX0V4Arsu7Yhckhx0qsm52HwL4
 yH7W6wXIM+hQIbEABCStNBxOu6qIncGhMk0lz3f/PNqXPwY36FgzHPk6A+athbAF6kMjxIR+54S
 WPr0M8lQ8PfUQ9iLlNw==
X-Proofpoint-ORIG-GUID: mtU2zJSqeFkYGAcCmboel6zko7t2ObmP
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXxSqclmWPgIck
 vIjPWtqNxYb8V+bem62nalRpwHMhV56exf+QKcXnw2rqbERoNh/hFby9ENi0Ao//eLHCPErHHEl
 qLHnt6Qq8h4zdKEWVuNgUoEod0zTBXY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0
 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Update the QCM2290 DISPCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-qcm2290.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-qcm2290.c b/drivers/clk/qcom/dispcc-qcm2290.c
index 4d6aad280ae178426bb70528fcd9699627359ef2..50a0705128a37073a077b560d0c9e57544d54348 100644
--- a/drivers/clk/qcom/dispcc-qcm2290.c
+++ b/drivers/clk/qcom/dispcc-qcm2290.c
@@ -2,6 +2,7 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2021, Linaro Ltd.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
@@ -48,6 +49,7 @@ static const struct alpha_pll_config disp_cc_pll0_config = {
 
 static struct clk_alpha_pll disp_cc_pll0 = {
 	.offset = 0x0,
+	.config = &disp_cc_pll0_config,
 	.vco_table = spark_vco,
 	.num_vco = ARRAY_SIZE(spark_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
@@ -482,6 +484,14 @@ static struct clk_regmap *disp_cc_qcm2290_clocks[] = {
 	[DISP_CC_SLEEP_CLK_SRC] = &disp_cc_sleep_clk_src.clkr,
 };
 
+static struct clk_alpha_pll *disp_cc_qcm2290_plls[] = {
+	&disp_cc_pll0,
+};
+
+static const u32 disp_cc_qcm2290_critical_cbcrs[] = {
+	0x604c, /* DISP_CC_XO_CLK */
+};
+
 static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -490,6 +500,13 @@ static const struct regmap_config disp_cc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data disp_cc_qcm2290_driver_data = {
+	.alpha_plls = disp_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(disp_cc_qcm2290_plls),
+	.clk_cbcrs = disp_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_qcm2290_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.config = &disp_cc_qcm2290_regmap_config,
 	.clks = disp_cc_qcm2290_clocks,
@@ -498,6 +515,7 @@ static const struct qcom_cc_desc disp_cc_qcm2290_desc = {
 	.num_gdscs = ARRAY_SIZE(disp_cc_qcm2290_gdscs),
 	.resets = disp_cc_qcm2290_resets,
 	.num_resets = ARRAY_SIZE(disp_cc_qcm2290_resets),
+	.driver_data = &disp_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id disp_cc_qcm2290_match_table[] = {
@@ -508,25 +526,7 @@ MODULE_DEVICE_TABLE(of, disp_cc_qcm2290_match_table);
 
 static int disp_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &disp_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	clk_alpha_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x604c); /* DISP_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &disp_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register DISP CC clocks\n");
-		return ret;
-	}
-
-	return ret;
+	return qcom_cc_probe(pdev, &disp_cc_qcm2290_desc);
 }
 
 static struct platform_driver disp_cc_qcm2290_driver = {

-- 
2.34.1

