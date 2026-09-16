Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD67B501F32
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554686; cv=none; b=bO/SgdGYm11T5+Q/ix2O7tdTVeFTsYf7yBN7ffiZVF95qNoVANZlZFzmXvyMoKifzapVA/BUasmM2aXpwBIVNCAlzrTlMVm3/Yr8dgNuuNHXioYnc/uRQeUTZxmwFqAd1naXzG1KbYzSUyxdYvAcfnc7VFclIw8JBahq2NJ3QGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554686; c=relaxed/simple;
	bh=rMtNd5inLLPVsBRg9EFQAd6EW0dUSKpKAosDfVpFy08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=usguZPyJqo6dO4z3C+aKu64rmAu9MGrbI2jGLIth+/vpDiHoBq7LzHxo7G1BCGAS8fXx0sLuHk9N/4QpZAhxSFDdLWq6VMW8xGTJn+kewc3J1s+vLDYBMoVg2okoOBZC8yfSfd60ptUZgn2pJw8m3Y0+2yd4EgShv5BMGnpTIF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdbBrf7s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z/r6OTu9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdbBrf7s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z/r6OTu9"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92qsA3377414
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:31:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AB9zMkKYXVpm67YJvqjEfp31mZrTUmWg/tW5iEZ5TTs=; b=LdbBrf7sV3uj9rf1
	4DNP42lNk6Io3BySgeIlh4ZY+N5JGRUkfK4Lg6MhZfxwylcNEGP+GCK5MUmH6egW
	x/0apcpIjlXYXIQzLTZMrl1sm2fAqZUP9CVs4CQGVYoshTG74vnQ1pPXGBQKiMoi
	Bna4PndQjq0yXi3D5s0BZLz8V6JRHFFfBeUs0UnhZYHWE/tQaHBEXgwEOCNg5FtQ
	6151nxYVlr/pme79N4fF+x/NP5qHxMFfZz6wu/vFg8uoQa8xYYFE+npdRiv3Xm+S
	En9tjuE19zJM02uXx/gQzhsKHV77jt3rQeVE1mjhxh8KRXauTSdrRs1zN96ut9w5
	6IhOhw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqefpans0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:31:00 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93a2d361e1aso19063985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554660; x=1790159460; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AB9zMkKYXVpm67YJvqjEfp31mZrTUmWg/tW5iEZ5TTs=;
        b=Z/r6OTu9/lZijiii9yHOx/HOfgrjFBFjd6yE/zgH/cZI9M9nnBziJGcmV2XAYEHW6X
         pU5l711piF+gyoEqvYtD74rYnRuGmtlagZDftem8vRCfkcCaiMmtLFNfqph0hD8nXD9c
         MsJE2Rphcum68aS8kW9IaB03cIimZuQhcndHzHxwPhrGxwWM5tupC8V3ISOtyERoHZLM
         MwKn+BrwFlej/qiQRp8X0lorpW5o2UzlcWjrSP3q1ctV4vxod04W9xp31+BTv+K9F5Gu
         s2lEf1WWdkElZvM0Hk8V5Vd0sb/d0qOif81YBHjR1n7diaG9g5c61KeUPLvkKHEku1Qr
         POxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554660; x=1790159460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AB9zMkKYXVpm67YJvqjEfp31mZrTUmWg/tW5iEZ5TTs=;
        b=bID2lx0elz95A+bSyPIEycyxv2iar1FezAzYURV0HfyWFUWW0gAD9zb6HkWhPFaG7o
         94Nx/4SZg/OaVNo84RTH2gJR/+lZQtno2hT9ScdRsuYfLhve6H4gVDk0kG/aLK3Djem0
         jW9GeNEqIrEe4xYidbrfYhr/8NMhFYmL3G+Pu9FnfQEqmGSHGtMfuz41fdymOsjRJQaW
         2zRsSiNAH2/zj9CWyMCSUZGsW2UED1BErusEji5o1m7ufi/wDyKW9vS/Qwr/aRxne8nE
         yE7L6y2524OQW/ky1ANnyXxoJMVOkCUGBGxZtEfm2EDH40/flDQ7gUOCf/VQi8PNOxhd
         1VlQ==
X-Gm-Message-State: AFuF++ngsKpD8kFsWTDcRhoWec6l32HkFx6Jd4Nkcb9ic6HS4T2w+y9z
	2gscDAN3kG1xG9+1bQjE0s8hUevKHvtE5Z4aaF/Qkdq8LWxNcopifI+Qu6XeK7coDf38ZI1gQPl
	sTEXDsvIy6Yw74R5/HLHObfAfPwBDoR8fEGlmEEHDkWFgrlbPmyKP+vsqArSxJLrVzUon2yMEys
	aO
X-Gm-Gg: AYBFou1KdCk29eMppIzbUzjovHrrdxMhYHPGtt9dNd4Ado8JYSae8sZwuVRiy6Pzb/0
	YINiUW0XFuISspaJtX2V6qIyEHOQPBssVMm2nRBP3PWZSb5/5JexrouB9SkNoqox49J+74LWQqt
	GS+p6+fqGirsL87zs4QBnpsK3SYM0+Mzrj+JcBKqMPDfJMsq58kz7rt5zCDyNY8JKoaTVw37ikI
	p1pRW28OTB9MWdZcOW69P+eI7J0ay0pzqqRZP+GgYJ2BnNSZ9eAsceG7K8xpb6z5gBygjuE7YiX
	XY2iFs1KwZXekp0dIVzLA7US72ZdH7lr8DQb21qVAm89tflbVIYZFwdWfya+0Hjjz5tjJcvGOyQ
	x/JeOP0E=
X-Received: by 2002:a05:620a:1b84:b0:937:1097:feb8 with SMTP id af79cd13be357-93bb785a7a8mr333206985a.24.1789554659674;
        Wed, 16 Sep 2026 03:30:59 -0700 (PDT)
X-Received: by 2002:a05:620a:1b84:b0:937:1097:feb8 with SMTP id af79cd13be357-93bb785a7a8mr333199785a.24.1789554659120;
        Wed, 16 Sep 2026 03:30:59 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:56 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:29:04 +0300
Subject: [PATCH 48/48] clk: qcom: videocc-sm8350: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-48-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3067;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=rMtNd5inLLPVsBRg9EFQAd6EW0dUSKpKAosDfVpFy08=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm95wf4fTycs6dfIv2bVwj/rNy9SsFZ8weo5a
 J2iDqVjbmaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpveQAKCRAbX0TJAJUV
 VrSOD/9DRaFrnFC7FqAfn4FkpGEwD7CY3hBn6l6ZmIgdeK3Mn/RCRA21TCVRHG1A6eC9pGISAiO
 /zugxMATdqGwOwTChGwKDAzwR6dkjJcYyTm3wdOTxnoNtETloDm2HUxqEnnl97+wBGQKFx/wI9n
 uUGZ00PYFrnDdsyBA+Ea5frdg3iYsK7dTkyTs/a80gM+YNQnil46FzaRFxVt/jxdo4rN8TAKIal
 kkwN/bfceJk03OuLwBOM7x5voiSG9S9+mqheCKTkIT4gG3gdiGayr094lBlV53LeIf9hk6Porbt
 SKfepreYW+UF3z6A4mxo0JCWEqd38m63zbYSeTW3SRNCPzucKi76Tyrtk2n2pDUTJAgp0LxBsUs
 eQR10AoBmfJx/PESWBtnrEDsB2vMW6gAFmlPkFIlO8fssY/9xomHQLPSBvxCqo+zxLxOvx182Ta
 MT8U0mFDhTwRFZnAEBlPyGxy1GOPCF46cwQ8ScLidj+Wvi/UuqAFy4NiXpqXijNihz0SvkB6BBD
 ME7nPcQoKQrNr+j8GBJB9SdfPi8ypjEDPEdP+yv5oINq1ZE/bDDT8nR7r/+xFlHRWavGpCa0o7Q
 SrNz7O8VPDeMSmdYHG40RIJ8c3vef2mVrh9VcGhM0U59wJt9sdbD+A3in9EgCgnBQm7kY9fwKh1
 bDQXcxmKtxnGefg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3knCOFbgc2OT
 +AkPOKjRFZjZoOcwxsZEOY5aiNrO8LqpooaLgxeG5rFruKbmxTheLOna7/C0WIpCx+Chnns/I/U
 WDhbLYmFdck8nOdEoXnsp79tFoBQXF8=
X-Authority-Analysis: v=2.4 cv=HrTjiETS c=1 sm=1 tr=0 ts=6aaa6fe4 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=8NXlPAYpUir2QwZKpCEA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: iNUEnCQtNh-_eQQuh3Y4ERGxbqUyZeUp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXyV/4zsbcwoEQ
 6G3XWok5PCcEMeH9y4mM+fM6GdtciT+4ulPMDdsN/FDwXR4NUh7D6OAcgA/gQUa8DgUiMba24xI
 pdB7M930NJ7jQWF5+D85hdzBAu5u5MNqNA4dQIRcQjlO2EDEwidKupyiO7TiI+5zWnnt6GAN26d
 CdBwuWw5Ypk8/iJL0QhTCNyEJgcyMRGJ9PvdX00YicMHG7/lotI6gm2mBc/gozMgZL2TBReaBLb
 e7lK3mz7fpKmZkMu/JByaw0U7L2ixikkJ3XW2BZfy9NdNQaqHXXhbdHIsjy9nVHdm7hF5IeIqGI
 ifSdA58jyTk2lsAYNI2anhcYe/mlJAMQgdgpqdCSFfLGN0CDUgwdLo6tNy21Z/nW5JkPFf3PvPw
 PgP+Db1B/Ps8cT/g0pd5otkj/bnpSJrhUnpgbAuzSiRyUwd8hv4camj746kAYq7dogJVgWyuGlM
 4F2BP2JsDMdSYV4IbSg==
X-Proofpoint-GUID: iNUEnCQtNh-_eQQuh3Y4ERGxbqUyZeUp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Keep separate CBCR arrays for SM8350 and SC8280XP to preserve their
different XO clock register offsets.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sm8350.c | 31 ++++++++++++++++++++++++-------
 1 file changed, 24 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sm8350.c b/drivers/clk/qcom/videocc-sm8350.c
index 057a9474894a..8528aeb3a342 100644
--- a/drivers/clk/qcom/videocc-sm8350.c
+++ b/drivers/clk/qcom/videocc-sm8350.c
@@ -510,7 +510,28 @@ static const struct regmap_config video_cc_sm8350_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sm8350_critical_cbcrs[] = {
+	0xe58, /* VIDEO_CC_AHB_CLK */
+	0xeec, /* VIDEO_CC_XO_CLK */
+};
+
+static const u32 video_cc_sc8280xp_critical_cbcrs[] = {
+	0xe58, /* VIDEO_CC_AHB_CLK */
+	0xf34, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sm8350_driver_data = {
+	.clk_cbcrs = video_cc_sm8350_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sm8350_critical_cbcrs),
+};
+
+static const struct qcom_cc_driver_data video_cc_sc8280xp_driver_data = {
+	.clk_cbcrs = video_cc_sc8280xp_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sc8280xp_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sm8350_desc = {
+	.driver_data = &video_cc_sm8350_driver_data,
 	.config = &video_cc_sm8350_regmap_config,
 	.clks = video_cc_sm8350_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sm8350_clocks),
@@ -522,7 +543,7 @@ static const struct qcom_cc_desc video_cc_sm8350_desc = {
 
 static int video_cc_sm8350_probe(struct platform_device *pdev)
 {
-	u32 video_cc_xo_clk_cbcr = 0xeec;
+	struct qcom_cc_desc desc = video_cc_sm8350_desc;
 	struct regmap *regmap;
 	int ret;
 
@@ -539,7 +560,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 		video_cc_sleep_clk.halt_reg = 0xf58;
 		video_cc_sleep_clk.clkr.enable_reg = 0xf58;
 		video_cc_xo_clk_src.cmd_rcgr = 0xf14;
-		video_cc_xo_clk_cbcr = 0xf34;
+		desc.driver_data = &video_cc_sc8280xp_driver_data;
 
 		video_pll0.vco_table = video_pll1.vco_table = lucid_5lpe_vco_8280xp;
 		/* No change, but assign it for completeness */
@@ -558,11 +579,7 @@ static int video_cc_sm8350_probe(struct platform_device *pdev)
 	clk_lucid_pll_configure(&video_pll0, regmap, &video_pll0_config);
 	clk_lucid_pll_configure(&video_pll1, regmap, &video_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0xe58); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, video_cc_xo_clk_cbcr); /* VIDEO_CC_XO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sm8350_desc, regmap);
+	ret = qcom_cc_really_probe(&pdev->dev, &desc, regmap);
 	pm_runtime_put(&pdev->dev);
 
 	return ret;

-- 
2.54.0

