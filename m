Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C2C48E0F0
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251708; cv=none; b=R0U1kOLZENXaxXWe6o9eI2I1KCtKZXYSI5Isz3hvwrhmc6Pkr97RnakqWnqo4WxGs335EQIgoThLZzYI0SaJECgj7wRO4fyXZ2uPCF46ztTIMANhwTmdH2EOp922MgGsRq9Lo2FFc8Q4nbWsz3aV5Ix6wFONO/+P8HpPSJ3y2cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251708; c=relaxed/simple;
	bh=SUwK7+vvo8MXx+P0Y4VzWQKFb096limbIcKlkagiwbo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UVc7uNwYhKN6PH3HChPXMwLD3Pcl8mLlGcuR/xChDb8/fyaKgpCbWkq8vVYp55zxofAQ37zoNgOX0/OGWJHQZ+czS5or6kOKVO4sHtYRMRN6GOy+qFG5RaQ0CtlSLjimmjRwhgfSHAwOOOTRYzrl2ua7BwfnYu6POoPd1A++ncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TD8srMCp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xpkgo6/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TD8srMCp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xpkgo6/V"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4aZ33282852
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o50Vv5ozjRpwsqKEbhb317IFkWHZ+LfKlaV10R8xyQE=; b=TD8srMCpJN15v3Ru
	neaygED6F6WV2D0RNkXTmU0CRf/zGhNd/FB7gz7V+oc1ci7ZJPKGtWF3oDfIwMUl
	bwMr9x9whqZ0OFebCwF+4V2Y3BAjvwkKPKXBIqe3zW1LjaamH9Ws0fsYjIvW1xoy
	x+6n9oQu9E14eQKS8PfruCJgiAvgpe220HqlVpi6pS6QzYV8peZoBSo37Ijj2/Be
	MpQhuyoh4uzz98sRW8XC2nTgJkQKmUVA21iUcFM5sLOLbYedUZJJebIJPR8eD9/o
	XZftX6K8wBSRb0C5E1hTGCkQzEA3jrLK1oOLsYkAchapzwrWQ55D39jeF3JxS6C6
	EzMTDA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvstujfu3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:26 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7961a79fcd8so595788137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251706; x=1790856506; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o50Vv5ozjRpwsqKEbhb317IFkWHZ+LfKlaV10R8xyQE=;
        b=Xpkgo6/VBY6xlKtOr8cvwoduTqV4UZXXmmeG1SSgLC0N4U48sfEsCgO32KAonusJwz
         1hbjZDJQxl3oKGl4JZZeMfP7I+jcoquTibRcYmVbWoAhoPpltFz4JStfsMPpTVHcDfq4
         plSc+rIwmqBfxwPTAspdIIwzrues51x/Od0IFuerCiYs3yBSH46xLBHjNRc6/aU+VHMz
         mhAzsxRmYc+8hY2NM6eh0D0mS5FI7ULRptK0kqaEvZ+vLI8hrSXm7ELuuSkqKZNtcszI
         yjGig2xKoQFhK2Zgwaz1sWUaWWauZPI3SpGFo+KGxHfJmfLgWi7tw6YWwwMgauepwHY2
         bVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251706; x=1790856506;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o50Vv5ozjRpwsqKEbhb317IFkWHZ+LfKlaV10R8xyQE=;
        b=C0dtYlx6nRqN2YPdZ8hYIZP/cIletvjLgn5n1CfK2SsmjIo9hKF/JCf1vtizmhzTmm
         05G2x3c7J0ne7gHsLnL/x8+sjhK2S6pTMRWTKcPSGzWxk8Ux4uhzapOOtr93jO2n+7Bn
         rXL1GRwAldrKvHe3KjOgR0M8Txsqa8peCp050h5ex38vHixeIhPffgvhYHrKYPm+D5Bd
         ZzFPyfcceD1AHxqtCFAbGnZOPLvK/mcY6WC2Xqd2sthy/o33q1LYr3ubrRrMDoA5Iphn
         oWII1v860bU+3U3Wfiw/548+by3FSVFHAE2sgHlNgJGSMtrBXBaXfV57LALo2QucW/TZ
         yYsQ==
X-Gm-Message-State: AFuF++kG91LPqT69raAmcTa+XfPlRxOTVglnFK2SVQY6EXw55cmUm1+i
	72M0meuMG5NuJKmaLPei+B6ar8VbwQBOa+oWG6L4kyAsoIhmQa5qCRj17dzV4khAGOEXefjAoSp
	YD0mUKwJufZp6ONUy7n75u0UqvT36exc+4VY6S4rfSWtWHPYEyRtNefSAprgEUaUaW1sD
X-Gm-Gg: AYBFou1Klz62rHuparBZ8lSPV8UkIEQzHQ5TcZb04WK2PCYCsUeihlH/TFxKpoRdn6j
	C6T+s3tMyckbOkXoU9PnMPRFvsZrBgG+jxZOsfs8OJOdigCfrMxONZRjqcR5BZpqkfVLY0YI7kf
	9mQ6l1MsWAySGKHhzNqHwQd82qikc3EotLRJ3eo473c+UKTJV8/loByfXrjO6Vnh2ACXPlJ7OuK
	RYJ06tOyV7sqElvUR4gJN3aUB4iAKxpRGLZnyTRTWGbK6IE0nhbwXY5cg168g8IGNjpKDXMNQLR
	joX/Ifa6M68gQSqZggE47xzR1KhZWag522FnKnye+ZjQwYypTUmZnWCs1w7P27zGRErpWCjqklQ
	Tj9ZqWhTB
X-Received: by 2002:a05:6102:2d04:b0:7a6:accf:72c1 with SMTP id ada2fe7eead31-7af19740319mr1080094137.0.1790251705433;
        Thu, 24 Sep 2026 05:08:25 -0700 (PDT)
X-Received: by 2002:a05:6102:2d04:b0:7a6:accf:72c1 with SMTP id ada2fe7eead31-7af19740319mr1080086137.0.1790251704877;
        Thu, 24 Sep 2026 05:08:24 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:23 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:36 +0300
Subject: [PATCH v2 24/48] clk: qcom: gcc-sdx65: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-24-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2392;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=SUwK7+vvo8MXx+P0Y4VzWQKFb096limbIcKlkagiwbo=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJY86AicJNhLqrdq1luztbEgTGLOJtDxvzpX
 Q7HM85vxV2JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSWAAKCRAbX0TJAJUV
 Vi8TEACE/mcrDGNz4VuYk452D3EH478DgF9c8SDed8rRLGDLcZezJPS4KIxHWkPHQFtZtP9mzcC
 dY0wI56AVVfZ7RXkdArCxJ6oAEC6lBVugfdi3mzukhKIrAfhigl0coc4rr4xfW8Wo7r6VcccBfI
 QdD65aoDpz/XvvZSrQbHWrB6SRA+t1Wumr8+/UtqBIlWyNANpVVxgLjz4xSQbt2QUVKqxNpRyEO
 YZTiD9MSeNY9SHQRZ5q9VlbqAWd4AFg8DbZ3Lqs8gfjSLqAthiVR8oyhh5UZga1r7OUIEOf+n0G
 gr6Qld1/3j2y/h5te3JRLvMWdEs64wJRSepx8Ykohi0dc5Oj1Bnt/cd9GGZJRL8IwmcPo2YqcIp
 GcLqctx8FxwBNnbQ/nTn7wrWW3vIVbFMjuQddI9NnNbZyC74eeQZKP79C9zr0loh10hAG7aHdjL
 9/uODbztknwM36YvabQBiY8O26JQGoTTPLNZmlvvEzHjABSyapzxnTkgDP15bY+G5YYoRV3hXaQ
 UMDaaVjDlCO+oiV1PmChYZej5GlZaOmLcc1fPpRUV3POk6FmuKMw6CEz3BnTE5VHLhDgv308KJV
 j5dp7ASranr0jaKKVl2QwX904rOg0YWTWUPfQndqjEaLRz05O41sQBipnu47/slv52/ErYhIvNU
 ldr9azFkEK5cPjw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX2QrnNZvinP0r
 6Nval9aNkukKXpXMLo2RC+FCOEY5iTPOCGT6hUOAlbDkVvIWbS/hzmu83exvPzGAQgZ9TZUBiQY
 MKvV0voT8vgn5MgpYXHuHEDDoj4zkxA=
X-Proofpoint-ORIG-GUID: QUkbTYsXRF1zfDp_HYtNGx-5IKo0wpHD
X-Proofpoint-GUID: QUkbTYsXRF1zfDp_HYtNGx-5IKo0wpHD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXznHT1yabqTCg
 FDC7HM6HzctVbZp2WINLB3k35c3QjJeGe7BvYpIRZ78dL3wtRfrYmMr4RCcEdQAnuc6SPktD3/s
 N8knAymq6IXUI4m+BnJDpPR6Aj7XK82eU6ljC/p5TvUNmZcrwba360RyYztJ7vZM/X2msd5uo+d
 g+lj6n90Avsn0oGWOpP30SusvWwNAgD2vxov+j5M+CurKwdudS9r4rEybltN0EuSj6g7cYuMFvz
 jacijT4NvxUVrkKEx2/ETieRfY/45CFanR1JIdRDXntClAkcfkUHsd+aiyG2XqIZI51YbGmNCJH
 B5/rksQLockzktbBQQeqBCwktJjjpSSxBLALJMQpXvA610qY67mGuilmwP4v4nLSvulT/mQA3mS
 MYN96oesC/rIIcb08TrV/Ll5P3y1f+pHvw0JTkLZ2eGU3jdllCsZC/zxR23C2fuCgejlA9jZmyd
 R4OMcahEFjFvI9KRoJQ==
X-Authority-Analysis: v=2.4 cv=cKp1IVeN c=1 sm=1 tr=0 ts=6ab512ba cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8L-1-Gifo5kdOXCWqOUA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array
and move the register programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx65.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx65.c b/drivers/clk/qcom/gcc-sdx65.c
index 8cae11a0b2c0..b1ab265ba2c1 100644
--- a/drivers/clk/qcom/gcc-sdx65.c
+++ b/drivers/clk/qcom/gcc-sdx65.c
@@ -1551,7 +1551,25 @@ static const struct regmap_config gcc_sdx65_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sdx65_critical_cbcrs[] = {
+	0x6d008, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
+static void gcc_sdx65_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Keep some clocks always-on */
+	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
+	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
+}
+
+static const struct qcom_cc_driver_data gcc_sdx65_driver_data = {
+	.clk_cbcrs = gcc_sdx65_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sdx65_critical_cbcrs),
+	.clk_regs_configure = gcc_sdx65_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sdx65_desc = {
+	.driver_data = &gcc_sdx65_driver_data,
 	.config = &gcc_sdx65_regmap_config,
 	.clks = gcc_sdx65_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sdx65_clocks),
@@ -1569,18 +1587,7 @@ MODULE_DEVICE_TABLE(of, gcc_sdx65_match_table);
 
 static int gcc_sdx65_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-
-	regmap = qcom_cc_map(pdev, &gcc_sdx65_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x6d008); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(21), BIT(21)); /* GCC_CPUSS_AHB_CLK */
-	regmap_update_bits(regmap, 0x6d008, BIT(22), BIT(22)); /* GCC_CPUSS_GNOC_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx65_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sdx65_desc);
 }
 
 static struct platform_driver gcc_sdx65_driver = {

-- 
2.54.0

