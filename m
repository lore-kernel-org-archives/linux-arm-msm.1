Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AF34CCDD7
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554607; cv=none; b=L04EeB3x8ORdyr9R18mahFd35bYyPTSF3cs0EqOjiqfoYr8buyOKJJTitgHmZLz4lCBiI/KvFXdjHKWfoMWHBilOzB09EKNz08mg+RvEioof7qLtv7FQaF2WaAKgx53eNc3DbbQnuAfMEBb19w5UoZllbGK9fUpdoCo8vxwbdQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554607; c=relaxed/simple;
	bh=X4mrTovvzWU4pCQoDOQAcqFq4rqaImzZ2MR46kww2do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=No6j2AZJdc4vzTEsd+XCeIRu+8j+WjM0ORFGpQ1RXqcmTszau55pSoVxLNT4T9b9iJsaaABCQTZFedqzDJITU2Q8gtW20Wc6dhItDf8R1z9907N3BtRhwKif0qdccHkASm9i8dQrykI8TdROkteoZPb1t+d6RkiITc01ujnHl9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X9D0S62O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bGcM7keG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X9D0S62O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bGcM7keG"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92gfU2477701
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5WEOM3pZT2Sz5mDmvEF/K4tpmGZSJsKRSyBEHrIbj6A=; b=X9D0S62OcZ/f/2If
	3yKcOHwklR/nMgjv19X4JU1rptQuMBhXni8Wa0rXtWa9BfiIFQDmVMmgoD5rDMEQ
	zx4nfaFZZQaEHqDS8vhh5OZqLPGzhcAea9v211I3/6Mjib6nD2DMOos+j65leRX6
	D3J6xydOWKiGMq6RxXwrwxaB8GM6lR20OjVopc4o3lel430rjLqZY0pokvE1A1S7
	FuChGRQzY2vFSd/M5OGhUGM9eQyZF0YFkVsVMl1b0Oc2osiL8KsMXkqscudKbKfc
	pxvwCGCGVhfNfsR6fj5A2ziVtjB02Nky4l6/OGDS3/32NplQE+k/Ss/70RTtuIeW
	dN3Zfw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksvfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:29:59 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so21401285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554599; x=1790159399; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5WEOM3pZT2Sz5mDmvEF/K4tpmGZSJsKRSyBEHrIbj6A=;
        b=bGcM7keGiNkH+KqzqHHL4FpMyDfv40r74GJdNzRpWq+RcyQqYsAEkUv8dmCu2qqONY
         64Bov6c+j//y6swUW0za9lIpx8YzUOX/WK0C+6j/naxu8nX2Wa3tDxOzey9nJAYpvjmc
         VH95wgJbNihJ70ePfVbXVkeqs5zcugZBFVDTdanMsWw4qdIKYnsHkGOEf1r32Suo9DZB
         bKb9oTV9yRd8xEjbYbsb+09r+JgTxoogOO9vCd3DGddf/fQmxz1W/XYtXaVM8Dm4QvGq
         gW5SFHKPTLPfW7orfYQRM5dKGAL1dD0qpo6RcraqJK0g2zH+UiaKnqObpRJ+UfP/Phq7
         pYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554599; x=1790159399;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5WEOM3pZT2Sz5mDmvEF/K4tpmGZSJsKRSyBEHrIbj6A=;
        b=Z1aykSws0RxoWNeVhvcQ0qoVx4+Ju6qv68xQn2hV7jYjnhnoJOEbE++qL+WCwtQB4J
         Mi8JqLqPY3mafXCHvXEln78gaW1zKSW4jDEuX1eYOqYszvVCmWiNb5wNncI/SwcLGQOg
         Nuad4KjX1b4zsujDv8z2ZGZo/MgvbbxyH/T50jKODlWNZe1XBSNME2h+U+1JptH9s2bj
         L7aJ89kLnR+OH53S2SAnNddSF52OfvgWktv03JbtHyTPKtG/6FfNZehd/+MwTMwKCDEB
         69NScpUxrbDEw90TD/r2eJFCam3elJtM7MuyNOqWGDNfoiedu1chGsxQ/6TtnUO3xh+g
         A4fg==
X-Gm-Message-State: AFuF++kY9OtuC+3lFVF/Ucq9FYSMy1vQ23qZS7f4MRp5JG7PQSA41OJ+
	KASgqaNaMKit0Csu6LcEaPsi4KIYBN6Pm7U7cEso4zmufldGmwGh5+n7FKSq0SwxBRm+ckQwpf8
	H4b1dFVjkWSah9WjNloQk/mmJDH6EHhSiXzTQsz4cl1j2aZvAUlcqofT2lf5Q8jJStX5i
X-Gm-Gg: AYBFou2CoC6ytjChev2VQ3KarHa5tNmjoru2JyiC5A1GVluzSwBmsD4YOJtYQSDXtWT
	IwnmxvPJRCQSzb4+HcNYREop1OG8GqDS0MGrIg1cj9ueX3rx1T6ZQ8yU7LtUx/rIqlcWADdBhWa
	qsRxxugpXvUYbqyO8jGAqd6M5sG24goqVV5juc+M/VoS7KeX0X5S1nUsxzGEK4iiZaRKPJAv+7J
	mQlaQh6brltb4KS3HCqObNGrb+wf4sPiWmLgkDJYhFwkDn6RfezA87HFTX5YYjSE0mAF1XK/1eo
	wRovzl1WMLZ9wLJC0uhmtmC5KXLPfJFpZwpd3OmJVGxZUaqWToo3jUJlaw/w9oJ2q0udYFnNq6r
	+0/yQyV8=
X-Received: by 2002:a05:620a:a18c:10b0:93b:bc51:b40 with SMTP id af79cd13be357-93bbc510c4dmr130502885a.2.1789554599197;
        Wed, 16 Sep 2026 03:29:59 -0700 (PDT)
X-Received: by 2002:a05:620a:a18c:10b0:93b:bc51:b40 with SMTP id af79cd13be357-93bbc510c4dmr130499085a.2.1789554598592;
        Wed, 16 Sep 2026 03:29:58 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:29:57 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:38 +0300
Subject: [PATCH 22/48] clk: qcom: gcc-sc8280xp: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-22-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2673;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=X4mrTovvzWU4pCQoDOQAcqFq4rqaImzZ2MR46kww2do=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9g9I551LMLbD+EsKc3LDqTEvZR1TtX9WjnA
 pvo1MGJYKqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvYAAKCRAbX0TJAJUV
 Vi2LD/96i7KL91hbFWT2FaeFarj9W7KGu6JTl6klg8MGWDovFQWZPCz0NAfx2Q+iJMsMq1RzCeQ
 aB6MuVKgu4kNgG0qyBr9+i4aSf81oeAHcSeIhPBb3N7HAhUQRkDXrcMqpfQlXtSJ3uIXc1olHd1
 KArfnD/L6o2dwpb8xkaaUCLO1Vg1MXHcJ1nbRgoHdAhhJn8U3TTjIgT7tB0q5C2gPBMUI6zH4ry
 7+w//NJiXWAa2fFCj+b9ppZHvfDWhoyrYKitezyp0GVCpFRSo5AcvtaoeBRGmEM5V+XvoE3kb2B
 eF8ktt/b5i2DgVLNtiES9xxbaRlO1hS1sSuzSdZCbUFYykXTmNeN9vqhGE90Ohx1AxLUbQehf3t
 iQrAS+/RQkAu6Kmg3yVcUaew1Vdjlg+bCjW9sebbxlW82NJYCdfavFnTYbGbohcujMC6bEO0jx5
 0NgfnxswlHPv5VTR75uv8TWoJXXTuPB/Nplv30NnTodXR2M6hWayyxALP6Mlih7K9W9UHIb1gzY
 LXFqA3BnjGyEID8sViKIbyfpSdwkKtzNSDbEkx2LvxQFkNfdtYlDUgmxd8wlFAE2lKq5AHbuLA+
 Zgya+vb+8vN03wsSzUloMNyQnbT9eOn5MFTeg7Ytq0HoJf/5VnCm7JBUkc/SePnm96aDI/7elt9
 72SCeTDAsFS7W5Q==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3HTWji3Jm77v
 pSfMU3sA5ThDR67djwBmqiLYH/Fohs+MIBWwKKUOFo8ETiOhJ/g0uhYTT3xdG59vATmXcZ5FiyQ
 MATf3b2ogBcBW//2OtPgH3czWFhHNN0=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa6fa7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=jsp9moliOvjHjNtoyGEA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Y2nVA6pfiV_OVfHg3lvYQGBk7Xdkv-Ok
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX0gXLD8vVlkJo
 emZNS0QELnaX5z4rRkRbBZ79YhZEQrnIgZsfMJvGuguqUo/Om4QLJzpU3yyx3q2QcM6sXHcN5nj
 dAXb+UWt/wTSttXlKv8i/bCAUHpopbuL8p6CsZ+b35GcFwQXuvduMBKp06cgkCjZMFE+Fx7EAzD
 F7Qn/FVHZyrQTw6TEeLGpGhgME/J7iZ6MEoenlbiqZN8KUWLOyHgZRw89/LhaRibBDmHdQBBJHH
 WDl0053iv4JT8ppLkcirb+grA5S/4f73ZauBxJYcnpVUEIgRdc2TMvar1QLrXZheTYg+9j0exq+
 nsxog0plvCk/I5wSpyzRgsZRem2YBA8/gihw9i5MR+VxicEeUaKhR/XwtMNt+x1cTKcvgg7JwgU
 b6+LLlWCDdNjLtNky/QNcjhCBT1+6nE7cHYaxxWD32w3pHO8c6C/Mc2ZHOC8ZzYK2cIY/ysXUBl
 jQ7Py1jOKtp0CbL47oQ==
X-Proofpoint-GUID: Y2nVA6pfiV_OVfHg3lvYQGBk7Xdkv-Ok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609160137

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Delegate always-on branch and DFS initialization to the common probe
path while retaining the device-specific setup in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sc8280xp.c | 35 ++++++++++++++++++++---------------
 1 file changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
index 2ab111585d7f..7fe5ad529de0 100644
--- a/drivers/clk/qcom/gcc-sc8280xp.c
+++ b/drivers/clk/qcom/gcc-sc8280xp.c
@@ -7509,7 +7509,27 @@ static const struct regmap_config gcc_sc8280xp_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sc8280xp_critical_cbcrs[] = {
+	0x26004, /* GCC_CAMERA_AHB_CLK */
+	0x26020, /* GCC_CAMERA_XO_CLK */
+	0x27004, /* GCC_DISP_AHB_CLK */
+	0x27028, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x28004, /* GCC_VIDEO_AHB_CLK */
+	0x28028, /* GCC_VIDEO_XO_CLK */
+	0xbb004, /* GCC_DISP1_AHB_CLK */
+	0xbb028, /* GCC_DISP1_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data gcc_sc8280xp_driver_data = {
+	.clk_cbcrs = gcc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sc8280xp_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+};
+
 static const struct qcom_cc_desc gcc_sc8280xp_desc = {
+	.driver_data = &gcc_sc8280xp_driver_data,
 	.config = &gcc_sc8280xp_regmap_config,
 	.clks = gcc_sc8280xp_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sc8280xp_clocks),
@@ -7538,21 +7558,6 @@ static int gcc_sc8280xp_probe(struct platform_device *pdev)
 		goto err_put_rpm;
 	}
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x26004); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x26020); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27004); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x27028); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x28004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x28028); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0xbb004); /* GCC_DISP1_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0xbb028); /* GCC_DISP1_XO_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		goto err_put_rpm;
-
 	ret = qcom_cc_really_probe(&pdev->dev, &gcc_sc8280xp_desc, regmap);
 	if (ret)
 		goto err_put_rpm;

-- 
2.54.0

