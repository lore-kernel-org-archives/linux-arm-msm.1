Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07DEC4908C0
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251718; cv=none; b=sMFWF7C38u0vv7O+Y+TUwqmHgGElL3JrEXPPX5vEKHjo1PQJR1k6FaHWdomlavxAu+p1tLy4CX/aGkvlcKrKZIUo+xVMZntDj6NYebKBwd8+111E1wRRgNKq14XYBnkZ9sua/CSAhGCL03yMWrzjEeJa5NiWv8D7L7/3bKtrUn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251718; c=relaxed/simple;
	bh=5/+yq/OZHU59oTI0w+M5LmDPVmxLF6klF1uvoa/fUG4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pl40KZWgupY/VJTLsnWKOtJXag4vNvwsxu4I36yovxnUxA5a0MlaYBIIDBPFTDBRplDZBqKxzNd5TasazjHbJwCB9L4MEn7L0Jed4gkvWfqXNZ6x8Q2W9tui8QBHzhb11eiviYVw4EBfomCDwZfy2RSgJTcMIYY3pxe0qkBHeyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JgcKaWiw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dBOH+wIt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JgcKaWiw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dBOH+wIt"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4ltN2285758
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dcEkS/CKWxZJmC0ME3XU/7Y2HZzoqTfbuvowuFPXkHM=; b=JgcKaWiwmYXqPm/b
	D0girXkKNmXTcSZpphfTUkqGLEmosZJBBp1I3otCLQd/IYrr6QN2j2RgPMlQf9gt
	bZqWFSIlvK5FyswsxIqttJYw3j9shdXExi5th4rLJZy7do83KZriOBSa3i/Oc8Pz
	qqa0PSqv8gr2+ZoEFYZEVojpzfavPqTfbTruB40ow1DHf8Q/CXYVY5fpZC/8KYST
	TLL6JNurF1NUuL1BXPYVjiQVLYrFQrrctmw/g1orW7woDYKxLxJ6GxnqLBDltq1X
	3mVCyd/VukjtYdpeMZecG7uj5UOt9MCCulxzvfaWr0lIX7ASJWS5EY5J+hYN2M23
	UY5fKA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgsa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-785827e6073so554078137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251715; x=1790856515; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dcEkS/CKWxZJmC0ME3XU/7Y2HZzoqTfbuvowuFPXkHM=;
        b=dBOH+wIti1JxxcGjhEf+yfg7rk1H+haeT85ed/EGA2oF9usEd+XuwV56OOAvlMyURq
         4WEWrH1OFBKEH17dUIEREJsypvnmVv0c7Z13x79SSlTrphTfmO/vB8gt1DeQ2A/X914j
         mO19LwO4QepfUKNa8VtyCMhy/Y1y0ulCnWBClW+6uZ6d5q+ONelf79Rf30AT9sAu+DCZ
         BH19R0N7GWL8OkuPzwHRNwtIacDkKmgy13+YqWM5jeoYlDyrp214a4+cctRIYimTTraa
         NmNDaJ4VTlOBoLpzQ1kodUc/F0ghyd+OCENNUYiGSWYbYAnqCKpbkNc4C4YJrOBN1nQg
         0jCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251715; x=1790856515;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dcEkS/CKWxZJmC0ME3XU/7Y2HZzoqTfbuvowuFPXkHM=;
        b=Kf3qwe5zcKK3yn5UuhluYxOQVadxTTHl0GnkF5bTPb2CwnBlX/AkEXEw87Z28kfxtJ
         lREoHIvLcp6pbMS5N5GIg2+WGoOd+T2s+pUpyDW2XWRamUbOC7gY3e8Pi+ni1TsyXSi4
         szh/dmYpyiz5gMjlI44Ob8iAalcQfFFR4NaQ07wiuQqlBnxxJipAsE0J4EfR6Oif9oec
         QJsOTSVpTHkPabLUhhK18Gdv3DnZWLn9OOaIbN8RbPozIBoCcV4a7HDdYd0lE6CqKYSu
         A2DK1g8Tc9TZS8eeYgM6Wi9NKmZbRJhDfQtRJjBCxHDx7CO8Mn5jo99vAzmLsR06j/b1
         ZAjQ==
X-Gm-Message-State: AFuF++klGTqhoOjEDAbGlyWesS+ssfiY0dmrVNFEBBCZUZap08YmfM6p
	EAp5RXD+QD61zfiiEpk+NV/bTVXyj/YvCbsiXxkV6ylEEz1oZ3N/nqXy6S0zywyTXBhVZBRWALe
	0Ok0PUJf70KjnaCbIIaLm9fDYK1V1ZKCRP9vIGuShNzY6Q9ac8A5c8u9z17U8B0DNd9nn
X-Gm-Gg: AYBFou2UCdCQMG7gMZjR4f7WIZasQRs2GgqmAujyW0vyUUI96uAgerl7+5puWYVYuD5
	vgrT0eryWpTMpVWQtFu95goeSH5JGvOzTQoX3Y4h4TYuKJ/3tyAPoWcgoMKPzpiGHzFntc2K0u+
	s8KjPia7VeHC16UYKwKElVTFFOq7jOjLJXo546WWQOBOBjXAExaigsTWg4SOTfQelRRpJNAlbHH
	lXezkOlNlyMPVh8APjIqE+svye016dgJkFU2CXPWW5DcoubRvAH/ZfDWkkmrzQOYs+NgAOCRwMc
	sMdhpDFyPpF12HJrMaZUEV9rS3Mr6OuqbeHRSNECRrDSD7hIMeGQg80DnzsHKHA2yN2d3hgIzpn
	yZBDukVN8
X-Received: by 2002:a05:6102:1627:b0:7a6:f970:27d6 with SMTP id ada2fe7eead31-7af1e9f2d0cmr910346137.20.1790251713711;
        Thu, 24 Sep 2026 05:08:33 -0700 (PDT)
X-Received: by 2002:a05:6102:1627:b0:7a6:f970:27d6 with SMTP id ada2fe7eead31-7af1e9f2d0cmr910329137.20.1790251713148;
        Thu, 24 Sep 2026 05:08:33 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:30 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:39 +0300
Subject: [PATCH v2 27/48] clk: qcom: gcc-sm6375: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-27-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3051;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=5/+yq/OZHU59oTI0w+M5LmDPVmxLF6klF1uvoa/fUG4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJbeYoXXFrv60EPCFg65cmW4ghKjAtUc5qi8
 kVRvFqQrRaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSWwAKCRAbX0TJAJUV
 VtY3EADIv/2HrvaCDhOkhl4o6eD7YMZYF/Jlov3xKJA6Zjj0cdukXsV/e3DEITItCHnfmX4kff8
 Cp+6CTrKMT5Zc7sXO0GYEvbOvTHHbnrdXMSm2saldq1AiSk/446EiGIBMTy9fq21MOdq41taahO
 7NPZWiio6GkJUI3qJNS/ypb/zU87n04cVLB5BGHxgT85+TgK797pkwwvzRQpIZ36AdsqG3qU9Ke
 W5YzMOWJnaPPjD2EPgNb7R4F7ZY2kdp77FBU4zJhxOqCikDv4WBEr3YilO6gN/67l9QtScn8gT8
 XwGIPAV5d8vGj91Ckfkaqh/dPEVQRKesK1vfC2tbCbfsj39/k/87nycosdEyLMKkiACg72fE7Rz
 F1xIJGyD7v+M+dJZIe3uQdWdc5495hcoqqTx5zoSPLbrPvc+IjTl+ISCwdmWYFwOYF2LdVZsSjM
 CjklAYQZ8xTEYvj/5x6PeIxOMm00Q5sc/VciWpJGI1mriK1fsYX5+/AHlM+0gA4ufLzbT8lPVcI
 2qiXntTaowkQJfyIZr+hqEF9T8bvydFozMP0be1yHVpks5qXfGq/8q3YB7OiFCAfpH2ce/gCtQ7
 ZoamorJIv1jsvAZhIsSxN+Zo4yXMU4IxmNX7LG9hAqiVDFtoijvwxyHdgGLHSX/HQmb1Fzvl4V9
 fe2Z/WASLitzaHw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX0JIBmkmSomD4
 ToJvmBQVD/GB/cJ3wgDXEBHN4Tv4joGyL+7vs54q2WjgVXIo0bHdtJszK1MYjjv7coqPwQiG2L9
 SyC7mrzxgUSuzmAcbeuXPzAcX3MBCBg=
X-Proofpoint-ORIG-GUID: MJQiuoLc7NFw_2LSfO-IDPFQgYH-uhhJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX3k90SUa3eVOy
 CYKnhl5jsF8Pp/MH82mDGIcdXU5OJTlGnpC1iNsZbaJUCPnm+aACG+9rxN7HFwIsJ6pGuNXlyRi
 rp4b8XCwAvgliRvmnEmyC7IGsq3ulu7yACTZTmwtoIMYqtw8mnSN+TBCuoY6PEAyPbMo/+tT2aT
 bKLVXz+2WOz5Ht8LVbyVfIgwxdvhhQYheSFlNpyfr5UCv8XePFreTnOQWL8Dp5p1XGPyMIWwkbb
 YNF60Vsi/GoEcQOlLqplbRioor5qHPhjKS6C4dPaC0FrXteudNa0PuU7mCB6szvGtaiQ6BdEW0Q
 krqmv4b7lhFyYWAIj2/taIBSvbBfYu4Yz87bRtMSVm8NebgJxQbwaZp622aWennnmCIHkr0UJmX
 hFBBVfgTVLAjzFY7RK91PojzoTkraXJuuDyZTSrqGlvYnJhodaPVMVhlCT7p43u7va2Z1qnda3L
 KKgmfTv9ySuNSimjmEg==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab512c4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=Ob_rVKpFIq5ZwUCH2zsA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: MJQiuoLc7NFw_2LSfO-IDPFQgYH-uhhJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array
and describe the DFS RCGs through qcom_cc_driver_data.

Move the configuration of GPLL10, GPLL11, GPLL8 and GPLL9 into the
clk_regs_configure callback. This preserves the existing ordering of
enabling the always-on branches before configuring these four PLLs.
Using the alpha_plls array instead would configure the PLLs before the
CBCR enables in the common probe path.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm6375.c | 46 ++++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm6375.c b/drivers/clk/qcom/gcc-sm6375.c
index 9c2acf8dc4b7..c67d4293c76b 100644
--- a/drivers/clk/qcom/gcc-sm6375.c
+++ b/drivers/clk/qcom/gcc-sm6375.c
@@ -3853,7 +3853,30 @@ static const struct regmap_config gcc_sm6375_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sm6375_critical_cbcrs[] = {
+	0x17028, /* GCC_CAMERA_XO_CLK */
+	0x2b004, /* GCC_CPUSS_GNOC_CLK */
+	0x1702c, /* GCC_DISP_XO_CLK */
+};
+
+static struct clk_alpha_pll *gcc_sm6375_plls[] = {
+	&gpll10,
+	&gpll11,
+	&gpll8,
+	&gpll9,
+};
+
+static const struct qcom_cc_driver_data gcc_sm6375_driver_data = {
+	.alpha_plls = gcc_sm6375_plls,
+	.num_alpha_plls = ARRAY_SIZE(gcc_sm6375_plls),
+	.clk_cbcrs = gcc_sm6375_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm6375_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+};
+
 static const struct qcom_cc_desc gcc_sm6375_desc = {
+	.driver_data = &gcc_sm6375_driver_data,
 	.config = &gcc_sm6375_regmap_config,
 	.clks = gcc_sm6375_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sm6375_clocks),
@@ -3871,28 +3894,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm6375_match_table);
 
 static int gcc_sm6375_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm6375_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks, ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x17028); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x2b004); /* GCC_CPUSS_GNOC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x1702c); /* GCC_DISP_XO_CLK */
-
-	clk_lucid_pll_configure(&gpll10, regmap, &gpll10_config);
-	clk_lucid_pll_configure(&gpll11, regmap, &gpll11_config);
-	clk_lucid_pll_configure(&gpll8, regmap, &gpll8_config);
-	clk_zonda_pll_configure(&gpll9, regmap, &gpll9_config);
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm6375_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm6375_desc);
 }
 
 static struct platform_driver gcc_sm6375_driver = {

-- 
2.54.0

