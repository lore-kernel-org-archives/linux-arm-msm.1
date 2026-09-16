Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD1D4EA361
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789554671; cv=none; b=threL+pC207rw0sWraus3aZJn7+MYirztSLkw42wWsY3IpRPVBulGp6Dc5tQ7tk+/zeeS+7crQCZhC3t1tHwAOqkO5hRNiHiAHa7/zDRicdCz2X2gaJaAiXOcAVSYGMh0bZUpmKoauV/gYJkFMXi6BeTCJp9RvnQD4pfKlu61QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789554671; c=relaxed/simple;
	bh=YjM7ZKJiyjuCW7sDpZ8xDtZxtp1hd2L+vcbDmTf29FE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDU2NMYq1qFCyhSUhm9Mi/CL/fi1d2T1BwrbgeQjlwUrZXARGyAScKGKRtTIZffYIBy2HY/47GOTRtvxxbvvFRQPk07yvXqKefVhWsmPQQZCffkQTR/xdXR8eymh82576DfyUCgu8z2/6HyB/Lrepfj/+/4coik6Utz8aqCA6v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z94fFudr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KVb3xYyi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z94fFudr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KVb3xYyi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92pvM978298
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6qBjpCKiA2EPrjgUsDuc3+hQCoJfL0LBOHGblx+hp5A=; b=Z94fFudrWKyXpDaZ
	D9dhDBRv5uWLaahlGrLxrg5C36val7iXyaDAv/BDf30lkzgiM2G2enuF5yQK/q9X
	wH8jftJO5kf63uIcX3UJNtgyi04r8XA+BWLJ/GGDEHLjOjOMbCW5XFYnlWIBptn2
	RmkLqs9x6FZ7kG8d0wl1Q4pZxrZ8uC5KH2UZQkVhrL2MwZPMxTVPaEPgC4+1mf0W
	WYL+E66Le+0fKRdoHa+CkYWVezE824vqAbcmuvKUHcckGpJYj9UleVcSt/rK8y1g
	eBCMpI4XzeNTJN13sHXDpBG3HXFMTFUPY5iJXuxJ0/m2mKs9nJfgx4KBrRvwzI9P
	oC4IIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3rfx0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 10:30:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-530d206e2b4so115239011cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 03:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789554639; x=1790159439; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6qBjpCKiA2EPrjgUsDuc3+hQCoJfL0LBOHGblx+hp5A=;
        b=KVb3xYyiOKTgvcV0kNPUFHFuwH2CSduMtuxTshe+inUx5o/QfCsxuruUjLtn1KLLtQ
         5q4FA8rFJoZNi1ch+S0SnnxFavWDQbiQrdHPOx18v2P3miHvz1L9hEQCfuOo2rdC/C4I
         VNZoT1cyWFHKyx+FIxCeVA9/mQ7uK4SOI+nXEGhXNp+9ViX01WWbgfgOlJR0PMDbkaYj
         HA1r5XMKGScEIB/FIwittY4uHlrbvFzC53oz6rLY1LY9f9TlVpsrVq9MbmrhHAq2dK3y
         EoOSae0Rln3p08U9xWbcs6RMi5s2xq44No8QPY1Ngh+BtmCOYTHTnARtnCClrbuv67KQ
         HmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789554639; x=1790159439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6qBjpCKiA2EPrjgUsDuc3+hQCoJfL0LBOHGblx+hp5A=;
        b=W1WryctBNIQ7keJkTOgQRGSrNpR6jDN9RjfhW1affOKIFD/4j95NqHPpunSk0tZAPx
         s4zAuDVw9XPwXT/zi/uHPmUeeJZihbbSriHKCwn1SGokUle+7yJiQPAzs+JFfFFIejMl
         YwVi1k3301cbo+NxL5hxOY2QRF1LwDHh84trLNrTRJKu7HowCO68aliB6StxYex6B5Ob
         Hi4jP3BKJW7rmp/JzGI3MOHmi7LhfrOH1YdDOsiSFdawMcR9+3LYOYIc+41JaubD7Kbh
         5qMhw/YSLl0HMKtU8QRJN2BDPoRPK8MOqXmy2ZacAXMqaLPDm4fVlDinymLm138EdvGa
         N1Nw==
X-Gm-Message-State: AFuF++ngFT9Uh5N+0hkzbdO+cM2CNLsExOuc1aLGinYxkwj8QuoF7hnD
	d9qcuaF3ZX6y1OSXdhnNayQS4JQsU6pt+LhUQJHx1yJOr4RWWmE5MXphZ6JbQQzu3KRlQoB3rUg
	UnXEnSj6IzLYBrAspGSkfH86EyGEgoH0K/b+H1retmAbsqvCkCmQxcU9lR3uLzc7AEJOu
X-Gm-Gg: AYBFou2mFlswhtSKA2TTCGFufnKR0OkIS9o9FIWY9/G9/yYuWGmBCy+IX8/q/TQkuOS
	GDN64DF2Urqba0ZM75dDWWaKhpcRWbpngJ3jM6MrrP7nDlUTuClxsYV20y4TBkf48ilAATO+jGH
	xukv/Ial2huRlE/H/ykNKK+y3pN5vr8eHJzV2iFP6IZ1HgCTykTUY1TFogUpgxbFTOGeDH2gzRT
	qnBZ9pkj4icga93kXNnKanBLvHUqQVhd/VoaLyghhl7mJfsPM6DD3JhKwHi8qGRpT+QlN69t6fg
	iBsAXwsyO97hzkwbvDQlDvAZ7FtGWe44GmACqWDyX2U19OrcqAgwAWWFMHVSGojz+7kGjaUbrNV
	O8Yz3ZHA=
X-Received: by 2002:a05:620a:1707:b0:939:d78c:eb0c with SMTP id af79cd13be357-93bb770858emr308915085a.11.1789554639221;
        Wed, 16 Sep 2026 03:30:39 -0700 (PDT)
X-Received: by 2002:a05:620a:1707:b0:939:d78c:eb0c with SMTP id af79cd13be357-93bb770858emr308906885a.11.1789554638677;
        Wed, 16 Sep 2026 03:30:38 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83dbb0c1sm71633805e9.14.2026.09.16.03.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 03:30:37 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 13:28:55 +0300
Subject: [PATCH 39/48] clk: qcom: gpucc-sm4450: Use common probe handling
 for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-39-25a24e50f82a@oss.qualcomm.com>
References: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
In-Reply-To: <20260916-clk-qcom-rework-legacy-always-on-clocks-v1-0-25a24e50f82a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=YjM7ZKJiyjuCW7sDpZ8xDtZxtp1hd2L+vcbDmTf29FE=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqqm9wkVAKoVHYZmpq3t/wGp5aKjqOSziJlLtgW
 7zIG2nwlqiJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqpvcAAKCRAbX0TJAJUV
 VuTkD/9qaxtejPTXFpC/YJPjkmfUczzLIcU7eSMMB5DfqAYafaGqIxjlZOVvykYhYEqhGuVVcn3
 IpFd2IqgL+AJ1F1SdYTDgiCJVWzDNksPnmH9E0tl8wqsmy3Vk0p1tcfm9zsd5EoHYgtXs5QYxAf
 d0HkyvVh68tBNZGqR7kj+f+Wcw1ZFfc4wQg88BfBk9Wai1gEs6P6SMp0lpeW/tz6DGcaBC76Ngp
 XpjMtB90afbUG1cgPpCXD7nlmtSDMGsMKpdf02XuAQ9YPapgOTHCEE8rwL4BAIxehtNWu4+hveq
 Q4ePhp2E/QMd7kj6dP+T/mV9YScz7Pq5EGGt/OmOug3xpVcuB1VSQLcK0niX/TD7/n+3WcIztdB
 Gy4O6MR/IbduJq3RC6eGenz68svI/oPqMNcpKKZ/AC86qglaQmNh3rW9w69vH0nHPL7A0En83Sx
 t562oSv1FN0QJm3TM8DEHeJ10LJXhnMOXMCfVf6owTpUrfTOXM2tsiRU/Cz5vUAajZbBE/MWGOW
 2LJUR+C5wwZjuIIRzlHdF8mcBkR6lOcbtriLnD65L/TgK1WkM+fp4GfYvqd3vESHA9LyiylOFBC
 dxLhCNOYYbcklRkcjRhuq0KG9/d1ohAZMfzHEjw2z1XYadpx5Wbsp9dmDZ49LDBgu5vqLZnhTll
 tMkG16A51X64Zcw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfXyPMmnX7I1Fqx
 iVMwng1edcYlIhW1VsPzIIe4ja/p3qauAK0IJUOqlI2vh9CiIyeecIKjUm3aWLdBcVwYVV6//7I
 UrO7BoEP1hZKhRnwaIff85g5Bx1sJFW2zSdmn+lNokYh21EkdNMF+BIs2nopBn7alfyQDYA3nrq
 p25chumje1q0JI80EjRP47OWBfbRTSqDyzkh7GlBz5hpxUcB3YVqgyMdDyQMGznSKwp/Y7mLMas
 mHQ+TY3Do0jZNbEwo0SYlqeLqq5jZVjmyo7peyX4MAUyiKaCUY1Qrcm3hTYw0DVak7wHDKa63lY
 JEm3KQaqJWVBLwG1KISwcU4YUSpXBSuZ850PrOHZtPtZJ6rEYoH4t7orBxbdD345uUuv2qEEbry
 DkbNtvAI8Lv+NodTCcC7M7Fa3LzzSqFf/rax5rSNggk5x2eA/nXRwp6p2M1aY1wDo2wS8CYsnEJ
 v6OJX/i35znwIacqWUQ==
X-Proofpoint-GUID: 4oLUiH_JsyKrmSrvuNuyoVboa6wahciI
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDEzNyBTYWx0ZWRfX6HilzdAQrphw
 VSfGiev1Ixz386DzzzvP+Dst+BXZY1guL091/bNtm6yAwo8lNzRQl8RRgaCg9BXK42rBbrWr+dL
 f0fdIdKEsipWM5vTy0wVQEH7GHnKKfI=
X-Proofpoint-ORIG-GUID: 4oLUiH_JsyKrmSrvuNuyoVboa6wahciI
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa6fd5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
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
 drivers/clk/qcom/gpucc-sm4450.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm4450.c b/drivers/clk/qcom/gpucc-sm4450.c
index 808b1eaa59d1..bd0f3fc2b726 100644
--- a/drivers/clk/qcom/gpucc-sm4450.c
+++ b/drivers/clk/qcom/gpucc-sm4450.c
@@ -754,7 +754,19 @@ static const struct regmap_config gpu_cc_sm4450_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sm4450_critical_cbcrs[] = {
+	0x93a4, /* GPU_CC_CB_CLK */
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sm4450_driver_data = {
+	.clk_cbcrs = gpu_cc_sm4450_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm4450_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sm4450_desc = {
+	.driver_data = &gpu_cc_sm4450_driver_data,
 	.config = &gpu_cc_sm4450_regmap_config,
 	.clks = gpu_cc_sm4450_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sm4450_clocks),
@@ -781,11 +793,6 @@ static int gpu_cc_sm4450_probe(struct platform_device *pdev)
 	clk_lucid_evo_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_evo_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always enabled */
-	qcom_branch_set_clk_en(regmap, 0x93a4); /* GPU_CC_CB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm4450_desc, regmap);
 }
 

-- 
2.54.0

