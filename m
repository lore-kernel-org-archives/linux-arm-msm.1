Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1BD481A92
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251722; cv=none; b=LFEqPzXCnjOgnqsdWBgNU8XYfOb+fKXcOBC92lAlQYvJ8dtNflx/hodg6/xuZ8eNoln219y7sTtFRxKNFl8qvUembKtp3WZUtlbR5P8CJG+MtB69Zc4vJSP8pVzmZM3zy7y98De+sATH0fYn4A2x3oR4WTIb7x0qmK8EPIv+iI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251722; c=relaxed/simple;
	bh=930j+Yt2IV5aPts+d6X+P6nNn49+MTBzgKfv23AxygU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CdsPe/BPpdAkjYHTfJMjOK2CmzpvNL7t5X53vJOvjdUDttECtpvl0zQHyRUqKJJk8qZlOu5f+2rWRVblp0eZ4+NBJ5uZ7v587By2fMJul6T5GWVe0Cx3dxkiQJumxFoRhHTTVlLUfCLTu8PjRfzFpofl+x/Ziq4WgjL3r3WGIOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FT3CwevA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QF+mxjAK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FT3CwevA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QF+mxjAK"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4vfZ1630822
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1pEaX+hgn1vMihkCpuYdkI1lXN1VpbY/l6gRmgJPZHw=; b=FT3CwevAgxUEqcuu
	TqEfZULKCf7c5g/WCEjaVQKu7TdyZO33S3NABjvYCoX368i0lelEDjX3ylFhOq1Y
	hIrXM2utwpiXUed+6sXAWCWw39/DT22p7fz14HJbWe6e5UTniRHJystclzsCwL8M
	ZTRYWTcKOO4Drcy48yT7HkYwBtsvQ76TaaW6JQvv9Y2H9tfqNoU0DN4cgvx8VOv8
	wCYjKlZb/2m1c0aRxm8OFv17ZI1FhFDljOYpzNPZtEqZ9foOr4Gtji5uwbCbweVM
	O97VpXb+Y9Yr+c/LiOKB72KPci/ZX4ui067+py5cdcltma0RPX2TIpPZzo/ZmEUd
	dLRGsQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvr90axfd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:38 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e9e2deaa4so1762283241.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251718; x=1790856518; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1pEaX+hgn1vMihkCpuYdkI1lXN1VpbY/l6gRmgJPZHw=;
        b=QF+mxjAKw97pLxlOMiIHxwsEEEDc1YTYrrBarvR1j1aa1awK/engwD1U0RDKK6dHXn
         iXgg5D0d6TmdfQb+XarwE9TkWJxUH0dWLJcZ3ZDvqPAu8cDrW9PuHrYhWnMrafhHNzpA
         8jWaDA7DDZxPEaJ7prljAKPtXZpDb/RPDHdF47w0vmmI6iu9B3ydkxRddZNAmyLaBl0O
         PZItA26qyuxaXVcT+f7nOYzFGCzoyaN9JOG9XJlkJ7jUD5nr2yEb4fk9YG6hb0XDMSNw
         QUfgxlcU4eEcECC8aXKOMJ213pvppOgw9lHLV/44iPBHo4Pon7JjoIrwlwQXBUnV1/ZO
         R27g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251718; x=1790856518;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1pEaX+hgn1vMihkCpuYdkI1lXN1VpbY/l6gRmgJPZHw=;
        b=yM1VjwrG3z57z6scVGIQ15pkgiIPAAbXjBJeFAJ0zWzlM/gSf/ev4XmYVbFiaBPCmL
         xv3Y21dn/YJfWV7B2DIDdKDM7bgF4tKav84zM0SdXs8luOGoHXpgqYeoIMszx9tsYEhp
         NAWAwoMVK7O9zPuJylufnD2gFoxEdm/ihZwx5NNU4dpqzPni8B5rQ08Tymmn1lsaU+uv
         W7f2bmDVeeqf2aj5X7lT3DAleKhN9SvTstokIn0jPRnCyqERoQhujRZ8WVWaJ9d++uni
         w0cwe7PdThZzzyiDoAepBBE2GF/pme4Gf4HzP3ONVK3w57SLc3pOHD98MD2DPyg5yYKA
         7rNA==
X-Gm-Message-State: AFuF++k6GZ1axSYF/I+y5BM1JvHv/PufXhtFPaLVdkoHYVdFLYfq/z8n
	7iXaUSj0hkGok/B7FDt+ggG5dXhb2yv7kPDUj2xX8/wPhLB85Uz0coomXO25nNHQShyTRAoq0q4
	gyyUs8IZKT4iKFdGQPOBrVIlcfV2u2AQed+vqxY+q3Jv3Y7NX5SRw13tTI9A7CDAUMIG0
X-Gm-Gg: AYBFou1iFJYc+9bpgwIju+MpuiKA1tlbK2dAybBTrN0AUX2vSlXeblrypkauXrVZVKn
	egp/Oq3WfGzDBd42Q33rIi1OUV4r5h6ptXTI7GiacJ3emgdYyuAGhKnkH9WyxOXmDqZDaBPeDTU
	v+zeMdZYMQ+KSl3Bspiu+YK0JgHpcxdgvxg+2wexlC/qtm84mkW6KUlx0Sb5nOsy9XVJM5HhHYb
	iOJOd+dHhN5P18W5DxyJZ94WZSvSNjCaJ42G7EzAA2WwV6hWHYWpeD9LZ09dXzRNTwlyGgEqhbx
	H7eP2GXUWpcjDz9WBHGnT61W5MfT002oRpjwvszPfM8KNVDGL832H1vHe1CLqhTnA+OsJQYufXz
	OPNSi/WtM
X-Received: by 2002:a05:6102:1489:b0:7a1:f7e2:aae2 with SMTP id ada2fe7eead31-7af1e6f380emr1144009137.20.1790251717665;
        Thu, 24 Sep 2026 05:08:37 -0700 (PDT)
X-Received: by 2002:a05:6102:1489:b0:7a1:f7e2:aae2 with SMTP id ada2fe7eead31-7af1e6f380emr1143982137.20.1790251716962;
        Thu, 24 Sep 2026 05:08:36 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:34 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:40 +0300
Subject: [PATCH v2 28/48] clk: qcom: gcc-sm7150: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-28-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3551;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=930j+Yt2IV5aPts+d6X+P6nNn49+MTBzgKfv23AxygU=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJc0vLQPdDyaZ6dZPF0Av3pwuTqhr50eTxGi
 nt9fK28OsCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSXAAKCRAbX0TJAJUV
 VnJHEADE0K8tztCP/AHg05VbvHfB+NGQ0P/lcojqj37YIoqEHibHyxKYeMFWe3N/mg7fF6c+Bj0
 cDsgwKslPrmGXaw8g4MTc1wLvUQam544VJpQpXMz1sYOTh7oKE2hTvvX2AO891qCpwROmmvT0fv
 LzM1SqXLr5CYoS/yIaDWTmdMY+/g1lmXYoLgy3a9gswUKuxblTIB/PyNEGpVOOZ4Gw53fhVPZ/h
 DK6Kn+qk0NIG5dyezfUMiu7hXtVeK9ojw2Xn2itWwgcNA+H5El4d1tOTJwtn3fP0F8tr/pXmA//
 vQqkJ1LRUFccKYHKgYTjtu3JPyfkY59DD6x/ATKEWnuzwuYR/cW6vmYVKxLbuSfW66uS6KG4PzY
 H4+LxoqLqghZLGa2UDSW5g5Jcxk1Qf7iNmEA6TlCPCedcngmoZOz4a35daDF0N+Ky6OERYlru6f
 Rc9PEuvItRuTHq0MyeVs0m+Q+RV2ymTWTv+oWoEORKx/+rTGIYjlI8/POn/jYX0eTVw7QjX8RcK
 aYxkGfLh4sgMMg+AyOVI+7LSa08d8THJNBEA7EiyWTL61ClyUYGx39GkwXj5kgM+OuNLYS+t98E
 s5Hy7/0qG/RaMNwWOh1eaGdCtGouVUXGtKOFW5BpU0+tDu2tu2TN3uxxMaqULJ9JQ156Vdy+dyA
 F2m3nihhGAI8gMA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX+yCC5FCbsLtA
 Ea2QaaLNWDGSXgXh1I16PXkOwBM1POsR17SR1WvJqQ+bFRz2kDaVHOCckc76YKSnLUBWofKiZpR
 xZArEa7eDyOyd1IW4GdR2Ic9l/TnePU=
X-Proofpoint-GUID: ydbXYynK3VnZlPzOGWhGXtzBIP9uu8zX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX5BLDrinjnBxt
 Vn+7DV9ZcWw6xN9+bS4IJkRrNboF5isVWNI4Fo8eeWsZtK//k/UhmeFjFVEaan2aANsBvQd+NNM
 v900SoaBCFYT7AHoCC+k/R61Zu72Q8IJ8qGboZscyc6Dvdken6dC/sCNT6KF9JbDsDuLHXeI+c+
 TGGVUs11cqUcDwF0taD9PKGB6wBMUmGUjSD5BvTJy2upP5dTgJ4PYLDIRh8AcONv9QPz0c2sKIe
 KhT7yojXe7OCFvJdO1KHCIxdCtum3/bk/XtaVplAKKcIq/zipvnFyTAgnZhasSbunSQaJ8kLd+X
 jBJPr03Wj3glMaXXuhTRwABKPMZLkwMDPkfelDWHG7+/3rqK0mMDIguljc1OhJGx416KjCvsneH
 qKSlBelZQM4D0L2afTrAqSm6ayEtmEf0r2xR0kosZyga1MhzUKE41KGZb3r6kC53Fhha/+RZiEv
 I+g0I4g/tQY29GxYDjA==
X-Proofpoint-ORIG-GUID: ydbXYynK3VnZlPzOGWhGXtzBIP9uu8zX
X-Authority-Analysis: v=2.4 cv=fMusTpae c=1 sm=1 tr=0 ts=6ab512c6 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm7150.c | 60 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
index 2ab3e92eb3c7..169aef61e749 100644
--- a/drivers/clk/qcom/gcc-sm7150.c
+++ b/drivers/clk/qcom/gcc-sm7150.c
@@ -2966,7 +2966,35 @@ static const struct regmap_config gcc_sm7150_regmap_config = {
 	.fast_io	= true,
 };
 
+static const u32 gcc_sm7150_critical_cbcrs[] = {
+	0x48004, /* GCC_CPUSS_GNOC_CLK */
+	0x0b004, /* GCC_VIDEO_AHB_CLK */
+	0x0b008, /* GCC_CAMERA_AHB_CLK */
+	0x0b00c, /* GCC_DISP_AHB_CLK */
+	0x0b02c, /* GCC_CAMERA_XO_CLK */
+	0x0b028, /* GCC_VIDEO_XO_CLK */
+	0x0b030, /* GCC_DISP_XO_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+};
+
+static void gcc_sm7150_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/* Disable the GPLL0 active input to MM blocks, NPU and GPU via MISC registers. */
+	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
+	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
+}
+
+static const struct qcom_cc_driver_data gcc_sm7150_driver_data = {
+	.clk_cbcrs = gcc_sm7150_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm7150_critical_cbcrs),
+	.dfs_rcgs = gcc_sm7150_dfs_desc,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_sm7150_dfs_desc),
+	.clk_regs_configure = gcc_sm7150_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm7150_desc = {
+	.driver_data = &gcc_sm7150_driver_data,
 	.config = &gcc_sm7150_regmap_config,
 	.clk_hws = gcc_sm7150_hws,
 	.num_clk_hws = ARRAY_SIZE(gcc_sm7150_hws),
@@ -2986,37 +3014,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm7150_match_table);
 
 static int gcc_sm7150_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm7150_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/*
-	 * Disable the GPLL0 active input to MM blocks, NPU
-	 * and GPU via MISC registers.
-	 */
-	regmap_update_bits(regmap, 0x09ffc, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x48004); /* GCC_CPUSS_GNOC_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b008); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b00c); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b02c); /* GCC_CAMERA_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b028); /* GCC_VIDEO_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b030); /* GCC_DISP_XO_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_sm7150_dfs_desc,
-					ARRAY_SIZE(gcc_sm7150_dfs_desc));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm7150_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm7150_desc);
 }
 
 static struct platform_driver gcc_sm7150_driver = {

-- 
2.54.0

