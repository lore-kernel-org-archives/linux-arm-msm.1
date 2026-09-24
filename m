Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B2947D949
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251655; cv=none; b=McOwSSFWhMVo+S1DzIV3MM6MWC/W1xf5iCb7bIDT2mhKNSD0n8xcwmOtpGyszhbhKcfVm61wCYXmJzYOQWuPZLFau0yVrmc9pSWYvDDxy3oz3gr+I7yPajfAaE6aVSBaSzEm5JJJuTpce0cdh+gaZAU7VJ6RjFt1mTJdN27yosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251655; c=relaxed/simple;
	bh=V8qHf+A6jAVexqEBPB/LCPSO1r5T/Alk9AJu7MgXWrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OzVsgmY/jGOIr7q81AI3UJq3mCwNz+ZdjNmpKVQOceeEte/NaIpMqSbXKpbcx7zOZI/y7OnApgLYwx2PPnaDbNFbXse7EH37Rb0cIbnFQonL7hA9ilEm+cFtEMNMGZ5nq0jpFgUBqBtrGSvySqyV7v4ZPajEDGa8+KqSLw6X2oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clSWSh2t; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RGnX/YIU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clSWSh2t";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RGnX/YIU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4kjr2385712
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5NxUdiXrzLkzQ8+8Nc4BBkViGk+ztBOR5ekhjyNIZl8=; b=clSWSh2tNJp/Kgyw
	FCN5QC5mMAISPoS9nnxXgdOlO0cDy8x+ckPlf4rHXXSvYjRHLP1kMiv/lTKDI67M
	AXqOrKFQxwl8gXb4XaK4raEdCTl2xq2Xm/sFiMYYOCFZEhCDKZKDOB9TI/pxbw3r
	Hw0fvE9hK72prEvPNjksYQFSiXgT1Dz5WGeqPUQjJ62DQNGfsjBk9wBxs5dcJPBJ
	B2N+fRyCAnXCJt/a/tFiKpZeym6t3M9fDdI4XKE6Dphm2qgGda2Q3ZzAyzWNGeP8
	Yr8cOGY3w1bVKgRJLvfGKCOmiL6yrrTItjwd8599qs23ktppsymA21bj9LHuI/dv
	P5PZSQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvsfgtcjm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:29 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78350646d7eso795227137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251649; x=1790856449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5NxUdiXrzLkzQ8+8Nc4BBkViGk+ztBOR5ekhjyNIZl8=;
        b=RGnX/YIUjjHMJyBJPE7borpJs6gCHFcxrTURB4LDPbsbuBAaXDnO/64uxWIu15/KLA
         oVMN8xii8arTlaLr8lSTBI0qfQzxTgsRofSPZRNOfO+2meA61G7RFafIes87sAEmAO6B
         XkcsZMbc5kIxVoLYfLXeGnTlNq10Sim+YfEbpQfUYF+XjcODMn41osKxJhNr2Y0O62xo
         cI7OxPcvqpsmIEaR2EF2EXbNpl6lWFgOiHStll/ux4pgF4QmZNXjWWWdm3bboII2q6JD
         cWhdb8Dl5f+r8boZ2cXdRUOCWalljITlnjTI7MdHY0+eGLuv/g3GW3xMj7qcqAW26t7m
         IPzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251649; x=1790856449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5NxUdiXrzLkzQ8+8Nc4BBkViGk+ztBOR5ekhjyNIZl8=;
        b=1rBmjeQw/WthosjohyqOMGo2qJbBbBrQShwbOCvWl5vNzaDzYM1ImiUHodS8ZgwNWW
         GbWGA1+mf1A+su7CCgenEawvEFsTa4cBPeDAjNwZrGcXWQkl/mHrl8MnYqQQodAaPva9
         7N5dydCsL72jWpxElxioOyrEWgb5+nJO7rMFUzXu02KTNWx2yBItaYibReda2z2fP1A0
         +HbU/i8jGm99Q68G1V409lduVHu6hC/Vt2yvpQa0uxFSTI5bD6hfgEYduVx/Nx/xFdZa
         Ly3KHFVmkeJic9t5OvqWJZ4u1UCng2cm7S+hNk36MzY7llQRngliMlnXuS5xQrj77KNH
         zESA==
X-Gm-Message-State: AFuF++l9DHlT7tq3HL8BsLabDK7bqujguIWF/9qOjdr+AkV2vBNhMP0y
	/b1P8iDr7VPow/n2a7Phk9z9vlruteE5jmauMm9Xx+pfwM2B6FQ1berdtAkfZRZPx3KypEPpA/a
	a1ISfcqVYZAqYMwQ6pHBEqNoq5ozx8HjRbvqXrGsyq2UnA7DgY9rdWdA2KfUvMe6uw7wS
X-Gm-Gg: AYBFou0wgelP+lb/qfk5h7D+mrYu6LMquS/gG+dPgAmuKZUyprheXsANua64l3Yt9Tq
	y69gc/CgQKBHCn/T88hPercUt06iIHx3WhNXUjwQK1AsU6rSJ2YBXbNBDHNOmwtd2m3WlFavofW
	7libNAv6coeGkW7hHMqFejMApXJNBBP6bNM8z3sQK1rtRbMUBK451PT+Edw6AbIOAcKL2fdDw97
	uu5Lz/XI3sLiZlfIaY0mHO2L2G+jpmP/UqaSZCo61GXtFQagvR29zCTDc3M1+2IG823zC8B/0qd
	CQlU+SZj9Fg1vQ2YLoSeHIis9lQbxwmQgU0LP+1ahxyyhroEmf+HpEjxm/Gil4QtNh2oYzoTdpl
	uY2XvvKtV
X-Received: by 2002:a05:6102:83ce:10b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7af1f40bbddmr770449137.34.1790251649169;
        Thu, 24 Sep 2026 05:07:29 -0700 (PDT)
X-Received: by 2002:a05:6102:83ce:10b0:7a1:f2b5:6465 with SMTP id ada2fe7eead31-7af1f40bbddmr770427137.34.1790251648550;
        Thu, 24 Sep 2026 05:07:28 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:27 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:19 +0300
Subject: [PATCH v2 07/48] clk: qcom: dispcc-sm4450: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-7-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1853;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=V8qHf+A6jAVexqEBPB/LCPSO1r5T/Alk9AJu7MgXWrY=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJIkSYSO84FCpTJp+KZw2eg5gIWdCDYX1U8I
 drbqYi+vWiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSSAAKCRAbX0TJAJUV
 VvQvEACWsnJ5sKFIrJqFPVOci5oKKfk6gwF2M52OQlagnvIRVtfFtWn+tqnsM7JfHpkbIxfLMPi
 F7gh/SRxzI4QPGz970RJQZTZjgq63M8hAnQrfNLOcZWsxfiaIofOV57MxEjVhlMH0KBu4iFHvyc
 l6F3wg5y5A/PTRhFc28jPPrWQ5k+1fSOYjKXvs3tBtNHvCm94O/XChF+S5AhCWfW1sNdlD/OcFu
 vdwzZl02pgSYezd294zskC70zuyTTQ5ejel/IA0iqrd1YGELRPOEteElEh8MqfFUuyl+oD8JVC6
 tnM24DjE1K8T8vduOfHyJXE/PEPz8JEHzuMi735EbzbTxiwBA367z/zK5yjD64eMl7tYhkxOznW
 dwsuopmiDz3Nxo8GOm11PcMuvvwDlAQFSEXPyKOFa/cKSZP/S3+TWjBy/MaIvgjX120nKv1wEk5
 puifuJkOraTavhy1uob5L+sC0v2sgWqc+EE+CPszFqId+s9Qb8bzkNdYfnpnwwCTgagw9HLmwS4
 uixOoovYA/IBcFPSo6F960SUNswK1aIMAsSM8h0rrCc5XCRW/Lr5dOODTFYrz+hkn3xCLKLfToN
 HX9nZm58HcfwemMGFdgv+oNa5N3P9f4VSYF0qectLF8Q6wTj79wmVsCA3an+M6j4CW22zOMcAHK
 TuguDwcn22fPe0g==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=YfoodARf c=1 sm=1 tr=0 ts=6ab51281 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Mkos_PfpLiWYs3bmBbQA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: VyN7cKOHhB5932F6jjnqXicBuckt8AYG
X-Proofpoint-GUID: VyN7cKOHhB5932F6jjnqXicBuckt8AYG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXyhJakWBmdQOl
 dRswQy6v4j2xqezpi8UXsUwOj5ChTLd+pdGfmEmCXG6FwDzLRnvjjQvohF9aaNWQH8U2SGG0jgL
 xllCxhmeFBe1hvYhySp8m0yiT56V5XU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/uh5jjmnlMRc
 lX1CAAawWqNiy03KWbOZDYW7/XhRJwSA4ei8bj00nMLzES1/AkzMwXMUs6GBLcISniudKYHPodJ
 zXAvInLlGxSqjoX6se1CVbnGdwx3XBokTjDqjzZm5KIJV5FJVsNxu3BncI8MoAHt4zZbz1D97Fk
 RDBKXWX7qYaOQxLrCWkCCR+403V6z61F2dpq80CdRQq2zfiNiWjGD4SYS8oGqi5BrUmzgD7iC5l
 OATFHpI8Y/UB6XQNVJTCI2E3UY2mZ8qPNWzYu0q5CPlG7zZ0eRGENUDNZPQmNpGxbAKYgo3VreM
 T79214VHvrULx4CRl38fi63KNJ0ZYYNPVungzFxqTJlTmp4HO/6veTqqs8TpcqJ8pb6AVpLI/0f
 OcQ0devj7F6YtUGWvupoCSEafEjvXW5cL5PayOqDMLajV7d3RG6jFASwNAoujETLI/Nb2yFIdxX
 gjNkZp8VHnkydwfX+tw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/dispcc-sm4450.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/dispcc-sm4450.c b/drivers/clk/qcom/dispcc-sm4450.c
index 4a4811db55dd..f39afa067cc6 100644
--- a/drivers/clk/qcom/dispcc-sm4450.c
+++ b/drivers/clk/qcom/dispcc-sm4450.c
@@ -719,7 +719,18 @@ static const struct regmap_config disp_cc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 disp_cc_sm4450_critical_cbcrs[] = {
+	0xe070, /* DISP_CC_SLEEP_CLK */
+	0xe054, /* DISP_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data disp_cc_sm4450_driver_data = {
+	.clk_cbcrs = disp_cc_sm4450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(disp_cc_sm4450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc disp_cc_sm4450_desc = {
+	.driver_data = &disp_cc_sm4450_driver_data,
 	.config = &disp_cc_sm4450_regmap_config,
 	.clks = disp_cc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(disp_cc_sm4450_clocks),
@@ -746,10 +757,6 @@ static int disp_cc_sm4450_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&disp_cc_pll1, regmap, &disp_cc_pll0_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0xe070); /* DISP_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0xe054); /* DISP_CC_XO_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &disp_cc_sm4450_desc, regmap);
 }
 

-- 
2.54.0

