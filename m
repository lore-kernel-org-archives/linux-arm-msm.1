Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF414DA535
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554708; cv=none; b=eQLFvxLTP6qO+9NCnKHcvbW2U4++ARXYECFk3N/2JW29Ak5JaF4zK8P3nRa01K38EYn//SR79j+EsbkTedfFbOpvNYBntKo61um55V7agePx07Eg8ht8MdQWvIAu++RTGDh6Dc6KWzcAH8EISwatsaYhIz+KXOb6Juj1p5XKklE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554708; c=relaxed/simple;
	bh=16EboWEhK2pj2Pfnz97zp9Iu11Al0FAmwMXJMbuvGJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jP8eTVmB73EToBj3MR4y/z4Il1WVg+6sCC+nNjJFlJ7HM5waciQK/biEBWj8GDgxDL+u8oukJcu3C0Edru1TvI05vsxCbet4rU5AP1S4MP05pBb8RRoTJxrh9b8t1dJNd2OpPcvnIvWsjSkjpThMDEcNa+5n2IjEyiMhbLRwilM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KF7dYozR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B1JVuY5m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KF7dYozR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B1JVuY5m"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92r1c978409
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CIExri27Fu3tkFXyJAX6gm5zvhx2iZpPShmz2r5/eT0=; b=KF7dYozRMFsgIeho
	QUf54NfX15HtQ4V5BiEoNEew9EyqtnzQErr4dWc+htSpQdrhBC7VlVTaTWXBHHP4
	uMQKMM3DDAtEqmYR/FAEm9z1qaLxN51exk85u0S4I+DCTg4BHCSUygcsVkiwQiie
	SOxCF9DO4EyxLIMzC8UIjs5DV34MY90en5bFKOM1LPxzUd1IIDvaqvyR3FadvhKX
	5k1amrp3wDY+7y4UUsH6j3FjpAn5HBG6eFaVwP2TfBOgyNvFbBodxCEcGuX8lnNO
	byj8gvK2sFfaBakgq2k0RneyNuXLgXtFyRJ8Ux/97BbMl8eFLITBMiWVRjlyvBSz
	qEFXrw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rfxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:51 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93909014c85so1034084785a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554651; x=1790159451; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CIExri27Fu3tkFXyJAX6gm5zvhx2iZpPShmz2r5/eT0=;
        b=B1JVuY5mRk6JNW9PNvt0+9ETggQu4WVJ+Q+W9d3IO+7vGu5c9Bc40hXS597hT0lN23
         2lMjv3nPJr3BLdwOdpqvuPI6/fQCUSv+udK+0q2yHgdJaSuDH8DHA1emUDYjaaF883Nq
         RyRXhhPXn52zMuhEQLDggUOV7L0V5Iu+2eqy+puNpQzvYXmfA4xpXL0RyZWZ3Ll5Jh1n
         6YzFL7Z9BDYp46HVp7OzbCqm1seK2vb8+tOnQFlpUXcK3bSZce7Rm1On7Po/kRhsbtAA
         dmKTCZWjUqo+guIgTd4yFnQSG3e9jf3clpiAv5Y4LDyU+7oTdiRlk6CFqj2G0fapvMk4
         apSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554651; x=1790159451;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CIExri27Fu3tkFXyJAX6gm5zvhx2iZpPShmz2r5/eT0=;
        b=qi22st4D1/1GVRYIAnkzpcsh+0f9VDzRcC3TVVD2rn4M0zUfjfcZNK3nccqKrsnfks
         va2B23hP4IT5rKLklPOgU3+l+F7pIHfw6LA8GHWcS94NY+aFuOrZkkbIvCpmJ7H4+CtX
         gMUnku1AsQdY6gzhw7VnjLD6hzMNVmb/FSRv5AXz1z8hSc+ho3yDuXuUFMBwMgK65okh
         qDJ55AXQi123IQ01uYHA062Xn7tyREqj75/X1qF8lD8cPWoSDNQt+zgPE8q4SV2qARrp
         PKjPDG5/5awrSTYaVgdhz/rHtmgEeSwqlLq1q9rNJigkZ4QSMcUgis/Y4pAd0a9R1uEx
         IR4Q==
X-Gm-Message-State: AFuF++kRFr1ZsD9B1GqkpLVL02FBWcwcc9G3/9NJr2KSYDVz5z5Hnr2x
	p0RkKvAPmg8cTPG1NgMir5CT67lpm2aZ8dXO7/IsFtg36OXUtOmegTYeGWgVofP9Rpo32nEjLh/
	9NAhk5ijH2yH4HKiPvnNPeeUWqb24ItV/gHfpEzAefZfNjhoCHS2gBJLo57SnY5ticpeS
X-Gm-Gg: AYBFou2rfgWqAkPQP20h9iYDcG8gVncEA3OyCUtxlUbHsNarKqguiquniXgrkiXTryM
	IjMf5M8Cw1hXN8LcOu3ppebcUeA65a1ep9q9BycdLeLPahzGJeGrFOg9be83AbKqr1LACcKvvbX
	ZT1zOPvH7U3yFA/KZ/gIXFRdJUUWIRVVsWgbZHuDn0CfJmMXin5xOl/xSNMfeEqAM/5k0ksHzAs
	6j1xpGDA99q3VoXz8FOIKkpfGRbgSSPI0Wu4PnaLONLdrWO2BJxM4sdGpY3sYXIHQRpQzMkG3j2
	GCv2vmp3kk50FhHdVnat+SVI5v8dhDoN/kYZz5oPpH+3Ly7zkdAOxHx8IJVTexxycdTYZ9ieNPQ
	VjJO29i8=
X-Received: by 2002:a05:620a:4481:b0:937:3a1d:175a with SMTP id af79cd13be357-93bb76e6cb6mr315683785a.3.1789554650359;
        Wed, 16 Sep 2026 03:30:50 -0700 (PDT)
X-Received: by 2002:a05:620a:4481:b0:937:3a1d:175a with SMTP id af79cd13be357-93bb76e6cb6mr315669785a.3.1789554649117;
        Wed, 16 Sep 2026 03:30:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:29:00 +0300
Subject: [PATCH 44/48] clk: qcom: videocc-sa8775p: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-44-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1945;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=16EboWEhK2pj2Pfnz97zp9Iu11Al0FAmwMXJMbuvGJ4=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9127Djy28rq2CimIujWCBAE7XQ+ihK2ln6p
 aDDUoHrB/mJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvdQAKCRAbX0TJAJUV
 Vp3qEACPGKh2o0SFQaZLB0gTdar+Ye3Z2dau+IeQUwbmdlBR628TD+SwIJa2OaEap0wpdjC7TKF
 wWKaTFHL2kR8772zs7AZm7Own3QlRRP1uSOVwsT+MmKRRO5nTioOEHLkkCZCsGxWBP/gsUDeu3I
 waT/nqQgxYPoc2emCO5NDgLvtDHB/HdhWNFfVLN7S+UIAu7rXbOXwLU5/2Hhby387hQFhfC5jt/
 XWFyDzb2Nf7a5JxINbF+Boul3JJOuziooGnMb/fDhzfvk3LNVWCMQLBWm8q9AJGfraZm3/VFcBz
 4A9tqs+rQyI+o2JoIjl9yINoKjlOPLU7Xt8bUzEzK4K1CabjoFKSDQFh3K/nAJ3CvINpp92nEiK
 sPbQMDIZY0AJiKzwVB13fbTOUhiTeUMhd/Mp6KZdotqrSscpUT8wc5dSfVe2gTBQjMhxC/0O2Wa
 xAf2mOU6RtellVKtOzwxesQdz6Gvuw0dEB6TLAOsGVMrGnNsAnHWUlGPJoxWZy3wI7Sx/5a87Hn
 nyRjEiUIkTq/D+CcwCbYYceBIfdtolpBHNlDXFLlJXQMnZYcrxRH4imS4iHOC69A7kuRo/fz1gO
 zA6IREMC9qG/dzn7oysogOtuUqZIYqNusRxFd46H5e9Bto5++l875cd2ThRCfOcFWNS4SrfzMI2
 M7DTIipvO78fpxg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX79Klymjga3nU
 WCx9Li2ppJI2+wCFAd2XiqMl93ExgS+30m4qpzzKgxRcjgHzp3LOMK9SkbRRoMKnYwwPb1PZH86
 DDp6iIT+/QQfEfsUkMSH7p6NiR+/dq2xMiw0w/InizmxhnYAtqjwR2OypvsZEKDNPGccbY1rBEJ
 AbsKwN15eE+GRX6/eU59KtDBmpZLkN/0tzFoCKCcO8H1mnkUCjyF9UwPaZzai1T+F8HQlIc8BYd
 Zgzl/dD/QvBhBk62SjKTY2fz/snyA5rzkYsFI4ZtsuNfKgZvp87Z+lvwnEDDZR4+yZu923gQQef
 cViKQ2I5qA5Nnm8vfIV+AA83tcbAisfnQpY6YvbP9ZcvzyRoJ4gxId4jtd26ZThExPuqLI31K8Y
 YUsoK5eYLn8ABq/RTvp4C0ZVpLCXDGkQugL1oPkugMFMVAJ8K2BJAIlEuuPdUhvdmiWfq24tYZh
 nbaZH8/JPfMwXbggyMg==
X-Proofpoint-GUID: M2r7T6Zz4hIii9lPoAJXHzrmJqo_pQ2L
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX4rKhBu3xdUz8
 AfYQuFI2tIeF1+AveIF2zz4uvpxV3E04L+mBEpYkDDOOixQtlyQaPZZ7FB/ZhcGgS2FMxkvivum
 YevSV8iGNz5QZJFrIshipIK76tVBI9A=
X-Proofpoint-ORIG-GUID: M2r7T6Zz4hIii9lPoAJXHzrmJqo_pQ2L
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa6fdb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=i-6CURGfGzB18q9V7KIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160137

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/videocc-sa8775p.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sa8775p.c b/drivers/clk/qcom/videocc-sa8775p.c
index 65a2d5bafea6..2ca78af8c20c 100644
--- a/drivers/clk/qcom/videocc-sa8775p.c
+++ b/drivers/clk/qcom/videocc-sa8775p.c
@@ -511,7 +511,19 @@ static const struct regmap_config video_cc_sa8775p_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 video_cc_sa8775p_critical_cbcrs[] = {
+	0x80ec, /* VIDEO_CC_AHB_CLK */
+	0x8144, /* VIDEO_CC_SLEEP_CLK */
+	0x8128, /* VIDEO_CC_XO_CLK */
+};
+
+static const struct qcom_cc_driver_data video_cc_sa8775p_driver_data = {
+	.clk_cbcrs = video_cc_sa8775p_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(video_cc_sa8775p_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc video_cc_sa8775p_desc = {
+	.driver_data = &video_cc_sa8775p_driver_data,
 	.config = &video_cc_sa8775p_regmap_config,
 	.clks = video_cc_sa8775p_clocks,
 	.num_clks = ARRAY_SIZE(video_cc_sa8775p_clocks),
@@ -557,11 +569,6 @@ static int video_cc_sa8775p_probe(struct platform_device *pdev)
 	if (of_device_is_compatible(pdev->dev.of_node, "qcom,qcs8300-videocc"))
 		regmap_write(regmap, video_cc_mvs0c_div2_div_clk_src.reg, 2);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x80ec); /* VIDEO_CC_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8144); /* VIDEO_CC_SLEEP_CLK */
-	qcom_branch_set_clk_en(regmap, 0x8128); /* VIDEO_CC_XO_CLK */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &video_cc_sa8775p_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

