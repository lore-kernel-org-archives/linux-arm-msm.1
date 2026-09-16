Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A3564CB8B1
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554631; cv=none; b=A8PtLCBUur7wSMk+yPt0qogoOct0+82FhuqLWtu0O9Ovo59m7ThREtx5YATBbjhZK6r3fMOQDE2w+rqnRMVxw3lUiMl6HTgHv1uXMQN/+aq/RRsU+OlCdlYVuQpwXOLVG8jmV/F8ujoqS9++sJWKtY1IXpz85RFtQ9oUGH5WtBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554631; c=relaxed/simple;
	bh=H40n+mvt5HXpOzvWMVvPPk12LQpk/ikH2qup6sMR2FM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iPByXebYB7oGDyOFvzTsu1y0+TNdcvaNH4Pe2S0HnFymNo0Q/+Wf2l8ESLNAikxLGOyjmIN/K2pHNVUqb6SkjaPoIvHOHxhwqinzzpQW1QBEEYNDe/Hr5cnHfuWKvrCd+pIAKNU93IesUTSgu52oQTYFUQxNfwZrRxicq7ah0dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LEZuK4s3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=je/5A0NV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LEZuK4s3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="je/5A0NV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92f5w2477683
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+k67sqJegtHeFtOHr+Fy8Ofd7nepynOHVRQFUJdphc=; b=LEZuK4s35QyEzcoK
	7EPbH3XY/cmCHhQh807eytXpSgazZWKHGIDHECBqzmNq338zCBzHBCCprK1uz0of
	VKPjQjl9vazz9Te312RRVPCtqhvtBYlaydAdEj+PdHI6v2sPlivfWy2llNbkg7gL
	y7iMXKyiQSitumbsPJRM94NnZ62LG4HygZOxLjQYY28mqKecv0BOc7LdmDUCmIEh
	nnfS+g9FlhAt/mwX5UszfX+FTzKIVTOrrZxxcsbb/2RuZ3IwLdgBPAxemVfNQbAO
	xm3rywRiRzbZ5+9WukKCoEkbf27FMI2ISSi7Zslo0iWCesCUkg9DaJctXObPcXd7
	DPSoSg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqjcksvg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a05d645acso1039459285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554605; x=1790159405; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+k67sqJegtHeFtOHr+Fy8Ofd7nepynOHVRQFUJdphc=;
        b=je/5A0NVNugiML0WRRUDhJ07T2sS5EJhJ18pDwXGJ3e6NVM/F3JvaiygWZMGHYf9Ve
         zVC78GJtUyYxSv3BRz7wpyOyrI22NI/hJFZrFu8hHKknsp5QV3jD7736SasJGY7I56WT
         WUz3OP4cJv+F/uS/mSelllMeZK2vJHqt5XQIjKrIqz5OYaqMOPM7w3ofSC41FLEGc2V4
         /hwooi8g9l9ue76U+W+JjGW07pVakV9UU+19OHlCB9jTMj9e+cyJk8HUKeTsr0ESVByG
         qVRqxu4doTGG5pC9tvngASbg4Tios8VDateKHBPDAWiYffCZVpwJVMGJnh2Q7A+gwUpz
         Z0wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554605; x=1790159405;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+k67sqJegtHeFtOHr+Fy8Ofd7nepynOHVRQFUJdphc=;
        b=0qyJPpCrkjBFr37OmciyFeOYU+Z3p64qEUn7mUvZ/vpaM2QVXpcSzU7DHy5NGnlgvU
         lnyZZyBrHza6WpMzejmF9EydyX2dckdjBOUHNpq0/a7kFFfvub3A3ocZ92oEd0PNzCqa
         ZxF6sUZf5RbMnTPQPnNnWEttvQe0koK83Bbjd+DjtRGyVoblJb5l8NhcrEI91YpuAaXm
         iK6a/JfPlZaf3zAoITyq71B6GpF+xvSMBXdHjTJppyBlZpm0SB2h7zHw9WgWVCEBbnT/
         k8FB7y4trlIKfBoitwdsi6lMsRL8JE6RIUnyf5QHtx91JlHnHpU3MCrAlQzjpKjfTcXd
         U9IQ==
X-Gm-Message-State: AFuF++lgTTifzUjCiiY6td1TTnc6k+0RXGA0GWw7TGTizc+r/W87OS/F
	N6o0OnAf88lsBbDgDi5lfTH+VvULV/4C33tLjqvEsPfZcJpQ6cFqAhWEm45suatukgeOrDPZpgQ
	1KTGF+BSk96sbvCFs/gr/YWS2BkR0DJuLVbsyczwWnScfLhbm0jdiRWHuA03MDHwVkzhY
X-Gm-Gg: AYBFou0d9cs5erTmCvf5VZimNo81wzoY2+5a08C04w0CzfaIaoyX9kCrVTeKpnPdohZ
	GgXiNIbFKNh89hF/L1rDUyb9/fI1Hc40TXoqwNkWOqtosOPi2Rw/i7+BX91HmsSHQeLQm2jScgm
	hrAQokwcaT+4C0BV47+jQPkELC5CsxYl2zFOlq4J7HiklfKCBIqquAssHaRp1XVsjFoLW52fo6X
	RBPqPWZBc2On3JXvwlSRoQ84/RWwWCeNsZRr8HQKj+Uk47Rd+d1JWolZeg2R3v+PG0rMR7OPhPB
	lHeiLm1NwPtZUh1nYcnp+7aNQMiZiWWI2qoKgkRMnV7i72I8y+qzUuymAC7d8hSLuouRKhdfo1P
	9xFwZHX4=
X-Received: by 2002:a05:620a:3713:b0:939:3626:558b with SMTP id af79cd13be357-93bb76a62f6mr299435285a.5.1789554605110;
        Wed, 16 Sep 2026 03:30:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3713:b0:939:3626:558b with SMTP id af79cd13be357-93bb76a62f6mr299430185a.5.1789554604627;
        Wed, 16 Sep 2026 03:30:04 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:03 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:41 +0300
Subject: [PATCH 25/48] clk: qcom: gcc-sdx75: Use common clock controller
 probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-25-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=H40n+mvt5HXpOzvWMVvPPk12LQpk/ikH2qup6sMR2FM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9jhMSt/VB5IalTTXQibEni93TF2viJxxd5K
 wBUOaQ/1Y6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvYwAKCRAbX0TJAJUV
 VquqD/wI/T5UfJT4bVsMPWUos4cpPaNpVrY6/WzH6Qx51KCWlzNoCCNoJIQbevt8Viho37aTcLi
 9NHj1aRxW5EXYuuPpXR/E2LwIgsCoQyeXF4YxYJjjBWdvVvugQFcm+oidp3y7ipioW4S9KOSb5R
 +G5YwcytxWnWNB28QkRLKG5x4DIU+aAYdeET3QCjqf4QG0edIQ/0V0Oer4ySXIKCtoa7NEh4yxg
 cXRE/3ZxMpat1mL7/YMbpzzn/6hGPARqALSUa5cTwRqxOpfdeZHB8ZNvdZkVda+k/5Bdiqn01Cr
 bT7uG4unqA5dHBaLuJIiXyBmyg6fPSxADiW9JcYmVh265ZkBY+ZxZWOvLFCpGqrq4/FiN04diB9
 fMDUtPB+cDqPzv5ci6t6frfUesn2uUKK4cV6kgxRWy+1mf0qs8kHNvxyqMYgbTtdYTjIWVho5bX
 5wrwTbLFQW+QsVCwIwrFFvCIhFFY8GJpT7OFdAQxFeQ3FlN6Sekmo44Zr+mhliGAzAKzmU6jlXy
 +HPY/6ab0MwdE5HUVwJOyO0YkDVD32X9OhWV/b7/2yHyrNBl3tCWK5xe5kvIXFKZPu7XGu/L58b
 NyaLRmStMoXNq2slGnKFOIHx2v4jErv5ELSYkNKWyUruYUgL+VZncjQsTAJEZt1iue9uOHZVw2+
 XPSlHjNF2dKQWDA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX3XOL/qUWUlKP
 ZIvpj7Xn8ZwsaU+UyB/ryZ+sfNR4qRbxcwxzq6PUbHbwKnnn7NIuIUyvelkd+KvYDjNTprOpbXn
 eFqnWcERidsxUM8u76oinpeKtZq5lV0=
X-Authority-Analysis: v=2.4 cv=PsIG/AM3 c=1 sm=1 tr=0 ts=6aaa6fad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=XazbkJH4cJJKrr3KiP8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: pWbCiU3yG79mcoHJnNuY6PU0_IVBxd4X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX8KSpqH3YeKjZ
 G3RQuetHk7FCr9K0FxfdqmPpiByqU3NVpAFq/HTTlPTbodOUFmbeIIn13aZWuIJWxWBkgR5Adj1
 aiBdDS4hT8JV/PM9KvM14VQWBauOtHL65Y4GVB7hL2PS3BRiGF6ceE73NXLdMwhZi/JeiEiixPV
 +UArbmrBnizvg7bRHTM9DX/ti8u1X/4IMLqCnuue54zV+UHAhAmbFxEsS6hDX+CjEIjAj09fLEA
 6u6tSpz/+s6Gc1mTYYJKcwBHhk4lsybM0/m+871vcDOC6Y4mPTERB80+pKC9TsvBn6qdkFLU9Mn
 ohI4DPHoxfM9ex3aMeYV4MZkw7y9Kr1R92UfhnNUXOOgWN5Frjtop1eXSwwfwNM1Xnh6CEPELGd
 Agio+KSmospKUb2TZOnhhCXr3Sbj6+L0jTXYxkiHxzSbpXwirbZKyc9M0a0RPULTsil8kNt8xke
 EUKh1Mf7RGOdwiDq6lQ==
X-Proofpoint-GUID: pWbCiU3yG79mcoHJnNuY6PU0_IVBxd4X
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

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sdx75.c | 31 ++++++++++++++-----------------
 1 file changed, 14 insertions(+), 17 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdx75.c b/drivers/clk/qcom/gcc-sdx75.c
index 6712e76f875c..ddc368a9db39 100644
--- a/drivers/clk/qcom/gcc-sdx75.c
+++ b/drivers/clk/qcom/gcc-sdx75.c
@@ -2905,7 +2905,20 @@ static const struct regmap_config gcc_sdx75_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gcc_sdx75_critical_cbcrs[] = {
+	0x3e004, /* GCC_AHB_PCIE_LINK_CLK */
+	0x3e008, /* GCC_XO_PCIE_LINK_CLK */
+};
+
+static const struct qcom_cc_driver_data gcc_sdx75_driver_data = {
+	.clk_cbcrs = gcc_sdx75_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sdx75_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+};
+
 static const struct qcom_cc_desc gcc_sdx75_desc = {
+	.driver_data = &gcc_sdx75_driver_data,
 	.config = &gcc_sdx75_regmap_config,
 	.clks = gcc_sdx75_clocks,
 	.num_clks = ARRAY_SIZE(gcc_sdx75_clocks),
@@ -2923,23 +2936,7 @@ MODULE_DEVICE_TABLE(of, gcc_sdx75_match_table);
 
 static int gcc_sdx75_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sdx75_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x3e004); /* GCC_AHB_PCIE_LINK_CLK */
-	qcom_branch_set_clk_en(regmap, 0x3e008); /* GCC_XO_PCIE_LINK_CLK */
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sdx75_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sdx75_desc);
 }
 
 static struct platform_driver gcc_sdx75_driver = {

-- 
2.54.0

