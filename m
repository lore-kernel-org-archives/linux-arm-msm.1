Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20E1C4A33FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785338649; cv=none; b=iXU21M6Ys7coIiuLcBv/OfsO+F4GiMXYfKyRAI+i+THoap65E7t2RmDpWQnQYM+4KNEM4j3o0EH8+ACHi3iIIWCqzAez3Gr4FPw3YUgtz9nJaf9kGqmsRY4gAP5hlzIk90nrQntfW1SjqXDSPFscUr+ZjtCKUtFe34o35zy/nrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785338649; c=relaxed/simple;
	bh=IF3mvxGJ0MO2sFrQjf9weWMiNXHfJPGDAZw23KD0uvE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=sXEulLdAqqgXpGz5BXQNnHtRhdVBpdEyrGfIV2YRu84xW9pUX4/PFotPPQtIgZW8ajkDCw6LN0i1BKWP+EwNxIo3t2F/c+iYSXuSzAgU8TfGglQFfeeVHtJ0SYzVgvjqcvwzJ2KNCEV0u1hhGJq1Qwf9LMc0lPr+Drg8DjBPoO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JNiKFw7S; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jRc5vjvh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JNiKFw7S";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jRc5vjvh"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TF2WZ52396559
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:24:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QutVvloV8VQHn81ETmUh0x
	rjJt+7iIZspS+kx/oCaGM=; b=JNiKFw7Sqp0y9Owx1pNHYCKUqmrpEagD8Rx1Xz
	kpY2p5aPDUc2IYTplP+kJWj2N1KpA95VKfieKxZPp5EGI/3wH2YYjnV5DsVz8MJA
	rhp437e4+08Se1gMp1Drof2gOe0VO/d3J1SAAsKWhR3aAi7TpWyNAX5v6gYqn6e/
	6uAaUHNIH4XgmpxAqN9JfceVjmaaD/Q7k4Oxeb1kAetCtOJbXABM9Qlz9e8abGOd
	fmXizXnkJzGX4+FXOGA8z9GOZ3JGiVLcy7Bfsb4vOKfjEXIuOBzpxE0gRtj8UMfz
	xWJG8Vg+sBBiiAViNUdRwQ7afMi8h75bGhauHI6yjWYOgVaA==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqgr6937v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 15:24:06 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-81e8577d187so38161327b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 08:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785338646; x=1785943446; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QutVvloV8VQHn81ETmUh0xrjJt+7iIZspS+kx/oCaGM=;
        b=jRc5vjvhbFb7ifpHuuj8l5SFLWidBz4z4/9vlGJWWYxd0EB1ZsmG+Q942JOOkx0CMB
         ZJbeSQBjwBFpk9xYS0HAqu4X/nKLNBzrQAiM3CebALj57LSVC26NNGUmTrU/Hs7Lb4YF
         wutFkQMmzY2KkkfQ19a2swAS/YR4m9cfo/xyhfd4ixEq/Fuei4u7iTMeW4ouIGBFc3fX
         7mRYBT82EvjUlnlGK3doH25ZJYkarxp59Gdf8Kmhatc7oMt2k4GNPqqJe2T1oThHHcW2
         5dVjgmobWXM6CcknEnBTHKdmz6/vhG1HAXhoFRtppo8pLPj9CrLWXbHHeeMa0s6Z88vG
         KBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785338646; x=1785943446;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QutVvloV8VQHn81ETmUh0xrjJt+7iIZspS+kx/oCaGM=;
        b=WmJ6RKAzF4iFfBZXzaiBoNMw+FmyenKq8vxqv6VMT+NFyIE2jBNz1Wa65QqaoPi+Sc
         zB3NKNGD+jWXooqbanb3AiZW9TWXNZ9AFgGYd52T8PpVcf64O4TThzan0oAvbiSfOb8N
         KMP1/amOnaB0RzaKbKBgJSzAPuGYIKnmTLGQdAE3u5qpJoZsKtRz/EABEwIROZAhYkfd
         /EKePHo6hXDaiVCVZ0f+m8yYWp+u4eXFzRL9PsRPP8X6fywuA20A2/DTk/9RdohjF5BJ
         HaoK/MxD0TggglYBpTWGx9P+IoStWa/rJdbPvtAgkIN+2kUvIkGfnyoc/H2fLjJ7N2NA
         w7Iw==
X-Forwarded-Encrypted: i=1; AHgh+RpiX/ln3/s//7GG4u4krrGYkY1ufOFMadbUyloFcebsZNj7tZvhXZdHj+vFilV/HpKEdlfkIYwzb69rRnf9@vger.kernel.org
X-Gm-Message-State: AOJu0Yxf74eT60ahKSyW4BSSb5Ie5Jeg90Y5xDR5ox+w+8/Ruh31/rkn
	XBH1CIlEAJ4TYSG6w7r62axI1zX+WhsqQx/pTJvz8Omk91sSVzxiqEnlkfsICi8Pzmo05uKwqmY
	sRxetndMw5X2e5f9jDsM2gxGlD+lw+TakOrBQljHB33KHKfyVzXeziym1M7btkFOZKqjV
X-Gm-Gg: AR+sD11L59jdDHHIDL9PezkFC9WZiNSlwy3NbWNIfLXavIlefEjfF+U4WZD4/NxIm7n
	qj2N3m/0JE9YyL8TeHehTpwpcYBdrWo15IKjYqvMdUuySrPJr4gxbOPI2bTcpsD6F5TOdMjAHEq
	DjnyblJjRPrE6BdD1JvQfzqEXAoqZaKufJcIQG61A77OGj9xK42UCEP7+FvMdCI7jf9aX0JOJgi
	vmoAlTsSQx6igHgskEL5TioD/mqMwk2pBIOwGy2GE0die9NTHnU4RBGBn+cwSEWGFpESSE/E6bq
	w2V9v2Sft25tW4rnvi1QyK+HgL58vxDs1leb8kqQTIC8t6todd6y86ABQV8XljrMFDF4LDAJ3VQ
	PoxuhFLIvrtvPoyNhTDfhiBG7JTVuc9E=
X-Received: by 2002:a05:690c:6309:b0:81e:edfb:3194 with SMTP id 00721157ae682-81f9928e45dmr31850667b3.59.1785338646147;
        Wed, 29 Jul 2026 08:24:06 -0700 (PDT)
X-Received: by 2002:a05:690c:6309:b0:81e:edfb:3194 with SMTP id 00721157ae682-81f9928e45dmr31850377b3.59.1785338645539;
        Wed, 29 Jul 2026 08:24:05 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa27592f6sm20198977b3.9.2026.07.29.08.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 08:24:05 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 20:53:47 +0530
Subject: [PATCH] clk: qcom: Fix test_ctl_hi field for DEFAULT_EVO PLLs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-pll-test-ctrl-fixup-v1-1-246d79589380@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAIbamoC/x2MQQqAIBAAvyJ7biEVCvtKdCjbakFK1CIQ/550H
 IaZDJECU4RBZAj0cOTrrCAbAfaYz52Q18qgWtW1vTLoncNEMaFNweHG7+2xM6S1kT0tykItfaA
 q/us4lfIBEQY1a2UAAAA=
X-Change-ID: 20260729-pll-test-ctrl-fixup-69e33917eb2c
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>, Shawn Guo <shawn.guo@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Iskren Chernev <me@iskren.info>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX4H92GEIfvJ3T
 XVf8uxO19ds54ZoEhBdwsa10B26xTL3xK7slP2ZPcXpxp/c1uWjcDs2vmWCz42vxF6bfAUccWv+
 8//qMdTq3gZuXhX4K2Pr8wx4YplkxD3YTN2X2Fbz4kkQ3hisFz5Eh92XYXcW35XIKEaxeZZmuJJ
 2tPPLKMTSU3GwauExb4AAtAmoCsTrw1csYG9+vEWNIsqhXPSunUJSUjE/O208nhWcJuYnCgCUsd
 ooJPZnkhZZ6TG9KQb8XXGYrT2scBf1OusvNrW7ImSQDrVlSV0iGqBKFJbeby4DWCmerTQD+CKEN
 Fstgv93QqnhfbZHgnQk9t9KQDKN/W3ktcqGeRVrroDlrMmcBCNIbTm5mNtLZMN7dcgVYBDW8T4B
 LEYEfm2+7b3mxB4J/p2iJfKmKn6PhTeBa5AAdjXjGwK9KroU7heTpujSgmdUVBul3sq01gv4RZM
 xI49eTig1Lz7qgOhmJQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEyNCBTYWx0ZWRfX6a4Glqp42Ivt
 8LP4yNKMeZmvSEgkJqe+7bjwKe/oI8y6W6rzU89yZLcuOUFhsRkNoSxz7vpfDqlUfOAoEX/mDCh
 qEI6FIkWKqWB+BNItcwhT6Gi0u0ieAU=
X-Authority-Analysis: v=2.4 cv=Cv2PtH4D c=1 sm=1 tr=0 ts=6a6a1b16 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ZfmlxCiM9nxkjRjWVfQA:9 a=QEXdDO2ut3YA:10
 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-ORIG-GUID: BJRqwhq2NhM-vjFJ6UhDFNCp3CuPXiHP
X-Proofpoint-GUID: BJRqwhq2NhM-vjFJ6UhDFNCp3CuPXiHP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_06,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290124

CLK_ALPHA_PLL_TYPE_DEFAULT_EVO type PLLs do not have the PLL_TEST_CTL_U1
register, so clk_alpha_pll_configure() does not program test_ctl_hi1_val
for this PLL type.

The GCC PLL configurations for QCM2290, Shikra and SM6115 wrongly use
test_ctl_hi1_val instead of test_ctl_hi_val, deviating from the hardware
recommended settings. Fix them to use test_ctl_hi_val.

Fixes: 496d1a13d405 ("clk: qcom: Add Global Clock Controller driver for QCM2290")
Fixes: 01cf3e27824d ("clk: qcom: Add Global clock controller support on Qualcomm Shikra SoC")
Fixes: e88c533d8a2a ("clk: qcom: gcc-sm6115: Add missing PLL config properties")
Cc: stable@vger.kernel.org
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-qcm2290.c | 6 +++---
 drivers/clk/qcom/gcc-shikra.c  | 6 +++---
 drivers/clk/qcom/gcc-sm6115.c  | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcm2290.c b/drivers/clk/qcom/gcc-qcm2290.c
index 6684cab63ae1160848631d1f8cd3c9cb691ff4ec..690f23793af6b55b205341112b478bf34cf71722 100644
--- a/drivers/clk/qcom/gcc-qcm2290.c
+++ b/drivers/clk/qcom/gcc-qcm2290.c
@@ -116,7 +116,7 @@ static const struct alpha_pll_config gpll10_config = {
 	.vco_mask = GENMASK(21, 20),
 	.main_output_mask = BIT(0),
 	.config_ctl_val = 0x4001055B,
-	.test_ctl_hi1_val = 0x1,
+	.test_ctl_hi_val = 0x1,
 };
 
 static struct clk_alpha_pll gpll10 = {
@@ -148,7 +148,7 @@ static const struct alpha_pll_config gpll11_config = {
 	.vco_mask = GENMASK(21, 20),
 	.main_output_mask = BIT(0),
 	.config_ctl_val = 0x4001055B,
-	.test_ctl_hi1_val = 0x1,
+	.test_ctl_hi_val = 0x1,
 };
 
 static struct clk_alpha_pll gpll11 = {
@@ -309,7 +309,7 @@ static const struct alpha_pll_config gpll8_config = {
 	.post_div_val = 0x1 << 8,
 	.post_div_mask = GENMASK(11, 8),
 	.config_ctl_val = 0x4001055B,
-	.test_ctl_hi1_val = 0x1,
+	.test_ctl_hi_val = 0x1,
 };
 
 static struct clk_alpha_pll gpll8 = {
diff --git a/drivers/clk/qcom/gcc-shikra.c b/drivers/clk/qcom/gcc-shikra.c
index d5222756f214c356214039f95a93a28fc542801b..4974bb64af98167db83f852c124c014a81cd6da8 100644
--- a/drivers/clk/qcom/gcc-shikra.c
+++ b/drivers/clk/qcom/gcc-shikra.c
@@ -123,7 +123,7 @@ static const struct alpha_pll_config gpll10_config = {
 	.vco_mask = GENMASK(21, 20),
 	.main_output_mask = BIT(0),
 	.config_ctl_val = 0x4001055b,
-	.test_ctl_hi1_val = 0x1,
+	.test_ctl_hi_val = 0x1,
 };
 
 static struct clk_alpha_pll gpll10 = {
@@ -156,7 +156,7 @@ static const struct alpha_pll_config gpll11_config = {
 	.vco_mask = GENMASK(21, 20),
 	.main_output_mask = BIT(0),
 	.config_ctl_val = 0x4001055b,
-	.test_ctl_hi1_val = 0x1,
+	.test_ctl_hi_val = 0x1,
 };
 
 static struct clk_alpha_pll gpll11 = {
@@ -361,7 +361,7 @@ static const struct alpha_pll_config gpll8_config = {
 	.post_div_val = BIT(8),
 	.post_div_mask = GENMASK(11, 8),
 	.config_ctl_val = 0x4001055b,
-	.test_ctl_hi1_val = 0x1,
+	.test_ctl_hi_val = 0x1,
 };
 
 static struct clk_alpha_pll gpll8 = {
diff --git a/drivers/clk/qcom/gcc-sm6115.c b/drivers/clk/qcom/gcc-sm6115.c
index c5251aff98864c539f5feec3ffe9adcd2cbddb20..a3c9dbe3a48af130499a722bee7dcf1243b548dd 100644
--- a/drivers/clk/qcom/gcc-sm6115.c
+++ b/drivers/clk/qcom/gcc-sm6115.c
@@ -120,7 +120,7 @@ static const struct alpha_pll_config gpll10_config = {
 	.vco_mask = GENMASK(21, 20),
 	.main_output_mask = BIT(0),
 	.config_ctl_val = 0x4001055b,
-	.test_ctl_hi1_val = 0x1,
+	.test_ctl_hi_val = 0x1,
 	.test_ctl_hi_mask = 0x1,
 };
 
@@ -173,7 +173,7 @@ static const struct alpha_pll_config gpll11_config = {
 	.vco_val = 0x2 << 20,
 	.vco_mask = GENMASK(21, 20),
 	.config_ctl_val = 0x4001055b,
-	.test_ctl_hi1_val = 0x1,
+	.test_ctl_hi_val = 0x1,
 	.test_ctl_hi_mask = 0x1,
 };
 
@@ -367,7 +367,7 @@ static const struct alpha_pll_config gpll8_config = {
 	.post_div_val = 0x1 << 8,
 	.post_div_mask = GENMASK(11, 8),
 	.config_ctl_val = 0x4001055b,
-	.test_ctl_hi1_val = 0x1,
+	.test_ctl_hi_val = 0x1,
 	.test_ctl_hi_mask = 0x1,
 };
 

---
base-commit: 3652b49adac266a3d27cb41cdfdb7d8790fc3633
change-id: 20260729-pll-test-ctrl-fixup-69e33917eb2c

Best regards,
-- 
Imran Shaik <imran.shaik@oss.qualcomm.com>

