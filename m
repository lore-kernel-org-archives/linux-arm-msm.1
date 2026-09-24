Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E913C9ED0
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251648; cv=none; b=Ye8NzLa3Ntkb7f80tXVGoVBqsOd5WLIqbS+2Zxp0jrxEVME05UewdRRKqyQdErK6BQxyrppGLJYcBVwL9yXXJLU4f+GE9/TLCHI4F3nj8MNSXCtc5hN5BHXIGoN1lJwB9xR+i8MG8C1f/aX/T24lp6tyz1o5dqKqJEuRDdAeKos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251648; c=relaxed/simple;
	bh=1aJTQR0dA/sog7qGkyQAgO7NJrtOYUMQUHZCG6mJu70=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uNmt5bT6lbERP02PCJio8WOeYnGz62moOk519ka/J7S6zMUvmc3B6yGML/RQh51rBosltVXA88cTUvcNFMk44GS0g5zP+9uEQFxmlalP5ZGnBdg7yvVsuMDzOdeLjFC60tGWD64/rZKfsdB1oKHJ3V7fm5ZECNOfnlI6TgKG2uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bcWt3mEM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WNdchNGm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bcWt3mEM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WNdchNGm"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4ZnS2594179
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyh5akvvyyTi7Yve0fYdrjayBHbVCsrQbVTODnYGB5o=; b=bcWt3mEM36QoZyH4
	h2WTHRQlBDaiDWbRAUpngPfZl8MsoOnfQgKft1WTHQYfaJwSTOW6o6H8Qst7mwAm
	e3VbFoBqQsnm/yY4hl6oXdGMkseqyGol+0dj0yz2R3bYq5RShu5ITxRMK4nKDZ6x
	b9vtikJHwuZxaQkO9Fil/Gtsai81bOW10GpTlMCMfSSbI7Q3Y59EpHBmdGqfz2N/
	3akWvrMWnao5ofrYLacjspOOwc1ugGdJRr0V6KfVKha6FLYvYtIgJBhx9w8WNkGB
	qFrsybytfXUErJw5Jjh5nE1mExRBkw76hDLRada2DprKMVLneOJHsHWqMLSkER5t
	vyVkyg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw1tjge6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:07:23 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980882ce555so364495241.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251643; x=1790856443; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyh5akvvyyTi7Yve0fYdrjayBHbVCsrQbVTODnYGB5o=;
        b=WNdchNGmZWTaEI1wSK6dzaajBM0JgPxdrZC0sU5hoPsLYc2pAEnjKk/d/xK9kebj7n
         suyMCVdApE5WGVFEcxPROlDwq9oHWfwkxKyRQhsRJ/5LjFOAWRcpbr2A744rYQ4KX/y7
         q5/5diVb6M9Y/G7XWtL94My6kogiKiOSozmgyDJi27SniWKnlQZaNS36lKemKdMvPT1B
         jbuwe/N8gJ3w+j37JnXlWfTV8dnSqGHxFgMKo1FvVFT8MLEdWumTovlRYDz2E115CBuq
         OJQ0FQpzUDwVzL+Vz9ACh5WmcDaMQQKFMzvSwFWIHPoFyWPo8cREgacmKhwEbcGOG9on
         kugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251643; x=1790856443;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyh5akvvyyTi7Yve0fYdrjayBHbVCsrQbVTODnYGB5o=;
        b=yMz1BeUbynaDqH1uGjRt0WYQ9jaEdHhVRi57MQ1vGIL5bXsUqrNMnb5zgrkXmrVcxW
         sDNQ3A8gqTmJaLyWUQrLwpW571EfQL6ZfOPb+rVfLytvznMwt7wtXYfGa81VMHeLC8GQ
         shp+zrQIfc2sROfpgL1tnYAbkf5DAKsCi++YPbL6XyN+kyXsqfXTNHWIscoxfKOu+trk
         jtngJBdHri5Vv8YVzg4HwMzEMCAak2f2cVqLUjmp5jZX3WQaLbMpH7nQ1J9G7D/klu6H
         7Vyz2bhYqQjwyh83EXmmUDC12tAV98GfR5pcXEj0iY9hOK8+ogCpA4Oh2kvsxKQ4SyeS
         6MXQ==
X-Gm-Message-State: AFuF++kttOPkU2/y9hFS93HWBk2gyfMbwIpEm7aHmUUDZRVuzgQVgvjW
	T+i6JQXXB+Op7WtsWQ37GgKRFUFQ6J6hBQ1ifoxA6xcHxFW/V/8hvuFIVdzVmHZ2Qza79Zoq+sE
	fE+AQlys4cjR3fcBDsOHjzd/qAZqWNRFI7j9OBkut2Gp+Rsp+G14E1oR0NUNm9e2XaLG59xMbqQ
	PF
X-Gm-Gg: AYBFou2BBn1skzCnPvtJB+kTv2ax39LwjHTmfgkPOz7CP+9y1aJo7Lgtv5L8mom2I+8
	QFoj6Kdh/GTufEqZsuJS42HDs1ZeMUdW+XhnODGrBL06xK1ySktUnAF1KjYETk5rsI2YgvifLSy
	vu8uuCA9S2iUxOLYww0JQguFAtXQUrSYS/tWY7bnWYyRPp0bN5LucL1+lAGwdHLVK7scnQxhSJL
	xGYl9LfTeZhmoDU1r1+yjv+/C5VvKKDlyNbvugc7RlfsznCqpbuBp4U/uiArWjfsyk+RmFqW3mY
	gkFPD5wcE976tzH/w3eD7QvzlVoqFf+HKqn9uQI/dUwZI7Nrugw1CyHQdi4v/OvXqTI3EVdMetv
	R7AlL2N2p
X-Received: by 2002:a05:6102:6448:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7af1e1e6986mr864923137.36.1790251643293;
        Thu, 24 Sep 2026 05:07:23 -0700 (PDT)
X-Received: by 2002:a05:6102:6448:b0:7a1:fa0f:1106 with SMTP id ada2fe7eead31-7af1e1e6986mr864913137.36.1790251642656;
        Thu, 24 Sep 2026 05:07:22 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:07:21 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:16 +0300
Subject: [PATCH v2 04/48] clk: qcom: camcc-sm8150: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-4-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=1aJTQR0dA/sog7qGkyQAgO7NJrtOYUMQUHZCG6mJu70=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJFb4HQenFLnJxdJ/q7QI4+Y4zfD7JGYTQRe
 62F+epUN2eJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSRQAKCRAbX0TJAJUV
 VqnwD/0etOKnxCGD+us360qFyiorQNjy5DIMBJvWAEKyTKVYIy3hnY/dQI5FJ/OsoMozZXywoOq
 lLoJSH141B4xE1B6YaqCW49KE0zp2EQuTxBfmGChABfQwnsYMJUrbnXq2QhrxjIcmtp2izM24qo
 aJPyPf7pjzhEMPadbxQvoiJ8rDMjqnk4F+5jSONEvyySpkn4bTyONJCe4RCvtu4nNBosyJUsI13
 6dnIBN+bclS4BSTuxSjf2Gvnfnc7v3K2vAN8DvC4f7lWlbqJAO+xYqXJQX+lv9jJdA1fG7Cp7Qc
 tk6JyXzLu+YN/Z2QGyy+SXoxBmrf+dX7YNzTNh9fDL3vLbjj0vw1HQ2hE2zrENwbyKZ34nJXpzr
 5Z8B7/rhi85tNufBojyftt5u8eQLRpYXChHfthwyhCdUe5dMG4otiHACs6CvIWJob/REbJ9iWYP
 HbEPHi8IlnZIjQEY5+9YRwIWmezEi1DntEKNeaaHVSBbxUQ8P7z+h1bMtEpMkHjN3B2MY/yTdZ4
 +kFTH7ovunHS42aecASCHKC+EV9buCDfAFvrT7FhfTsqTlNY14tVcbe/blHxL+4gxujCA64MbP9
 u1ClBPADqZEJfz6a+G+H/pSgnzZrGUz1G34rIIEfX6W8MlOnfdc96O5DBhyH1S3K+xbuGyhjfuE
 KGYi5CXQuxz3Kdw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: hX3rvqUhlScPlehJvQKNLjgK9OwqDyoG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX6a7Rf2pdtBry
 TLQDGiLXQ2TMXvrT7PIYPJ8+B9oqZrFAT+YYV9mvGKJjbX+nWPPCDTWjjoJ9WiLGWNXQa9y87ft
 lxHGoyHwgq+U/z2xThV76Yo31Trd/LxrZ9gndBb32nVw4aNSWObi/+TG3fp9A6FFsvbh3m+sey5
 lAX2jnKJEGtzgCo6AMs0Zmuw/NVVVSvdts93qkafKIzYobK/2qPA/uKKLlv6uwdisrPlIJhkacd
 9Ew51t3ftY0ddNT5OEwcf2UiGHEqbz+YzM/SdU9x/xQ/wLB/j1dokQqX4dKkw/VwZI5SWbijBi1
 EfxwrAKWlO9vw6HFU6xkcZOYtmCrUcZXo5Kvb5eQdsL2PE3BxCCW53o335Giijg6D6Sofzydft1
 WpFSjxMMtpTQbFAWDZHzWBIrd177UvclmWTuQNVNO+k39B34GnwnIigeEid+Le6Ozk2Fd8YSEtW
 Q0ogjBhiJJ3hEvrQERA==
X-Authority-Analysis: v=2.4 cv=cK11IVeN c=1 sm=1 tr=0 ts=6ab5127b cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=HACHd5sh_oZ471OAbCoA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: hX3rvqUhlScPlehJvQKNLjgK9OwqDyoG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX17AYxd97hCMy
 WrgTiym2976fQsaNHvgG9R+U07toduiq2K4iY+GBQZk5cy7zxRYx6iuOBl1DxBjLXhn0N2TTH/5
 +c0VqS4IcewRiHBJHbwBDtCCSPRi6BE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/camcc-sm8150.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sm8150.c b/drivers/clk/qcom/camcc-sm8150.c
index fcbaff55fc27..27a51abddce2 100644
--- a/drivers/clk/qcom/camcc-sm8150.c
+++ b/drivers/clk/qcom/camcc-sm8150.c
@@ -2093,7 +2093,17 @@ static const struct regmap_config cam_cc_sm8150_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 cam_cc_sm8150_critical_cbcrs[] = {
+	0xc1e4, /* CAM_CC_GDSC_CLK */
+};
+
+static const struct qcom_cc_driver_data cam_cc_sm8150_driver_data = {
+	.clk_cbcrs = cam_cc_sm8150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(cam_cc_sm8150_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc cam_cc_sm8150_desc = {
+	.driver_data = &cam_cc_sm8150_driver_data,
 	.config = &cam_cc_sm8150_regmap_config,
 	.clks = cam_cc_sm8150_clocks,
 	.num_clks = ARRAY_SIZE(cam_cc_sm8150_clocks),
@@ -2134,9 +2144,6 @@ static int cam_cc_sm8150_probe(struct platform_device *pdev)
 	clk_trion_pll_configure(&cam_cc_pll3, regmap, &cam_cc_pll3_config);
 	clk_trion_pll_configure(&cam_cc_pll4, regmap, &cam_cc_pll4_config);
 
-	/* Keep the critical clock always-on */
-	qcom_branch_set_clk_en(regmap, 0xc1e4); /* cam_cc_gdsc_clk */
-
 	ret = qcom_cc_really_probe(&pdev->dev, &cam_cc_sm8150_desc, regmap);
 
 	pm_runtime_put(&pdev->dev);

-- 
2.54.0

