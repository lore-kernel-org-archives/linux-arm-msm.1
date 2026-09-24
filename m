Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7CC491587
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251723; cv=none; b=LPWjiYMTslU1SICxKzSOgnn0BygsSF3CCgbSM/tVBq+CbBSXmfAq6lFZELN4LITPr/tedWsOxFJ547ghCZoEYAtRnpikFqr9S0A+viZAZ+5fcX4Qvg/qNx/f5gWaYc80Yfcvu+ebCNc6aNDry8rDoo/3grg46aySoeERWX0FyVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251723; c=relaxed/simple;
	bh=84OKeBrl3IKjvgDlfAkMLCAYo5otzVQbeGYjLU1sscI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MXWeo55c318566HpK9RExj3j6+SXsXCHwChOB4DQyK427dbEfxZdLsky/kwQbCLT8aP7poXHhqNTFVWMaAh5YPSH6Xh5+uMw/ADeFdx+PVhTSE+KeMuc8XpFSLtinHSOPsBCCUzcJXc+sN8xLscSjBBPDlPzYPqTd4V7DMN9308=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVfu6Va0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RgW7CGN9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVfu6Va0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RgW7CGN9"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4m2u2285773
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWFUUAsjl5pE8emDfliUkXbUsV2Ad/7MODHAHrTzKFA=; b=UVfu6Va0qsfxiTRZ
	k65zqf9wk7JX9BlL45pe3+pcFWxTg0ML7qV5+Om1LP8zIcT5TaUnwh+t85gkFd9u
	kHfbkspw9MoORmzXR4ejI2mVJDEi5/GQxn1KF39hlF18/ftcxwfwUTlmxYMogfki
	soIIUfMH7Oih+dEXqMX36T86CWoeDynIBGvSYRhV07QksaKN5qQyZGP/cB0DcXR3
	hndLxJI8rqrfdDa2ZOO2/KuCvQlqBbd+GzVm+6iK+3uBptpwdFKKxhb093L4LZr6
	3IQvhoag78h7qrV/3GPgmXzs788QEISYnQu+47F+A5osswHPdrnO326/0wRzhUJ/
	rVHQrQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ahgss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:08:41 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7866c4ed349so1637033137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251720; x=1790856520; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qWFUUAsjl5pE8emDfliUkXbUsV2Ad/7MODHAHrTzKFA=;
        b=RgW7CGN94PoKGWnKR6bKUllvA9ST8F0KJzAuFQGf/LfyTF9tW0mS0OXvI/zOh0qKZO
         dRjQEGWyePjkD4fbDgf2KD05pl5BhgVtFRWCv4tTT0CuV0GjcCXIoaxVamrN7jAwKtMT
         UMsoWDsD31DBDLZClydASqTftnedSoK6pz95BvLMwvHNPof1LNMBa2P4tv2LhP2y7SPb
         ojLcCSEFCJT/K2PQsefuTBBkBjBBSOLjR/6sIDw3U2NsA0NuSZQZu/YKmJZmBJYkgTp+
         BNsE4m1XP7FQwV2o+40xVZvK5ubCWYj+y7NrQdXgBMQqAIfcZ/wEsncHlwVNMB1TmWYG
         xOzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251720; x=1790856520;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qWFUUAsjl5pE8emDfliUkXbUsV2Ad/7MODHAHrTzKFA=;
        b=R5sW8OI+o3hhbcpBh0Pdw4W6sJWj5zTHpk83z+70LnwAaA1g1wBWEVjzko7nUlv9lo
         r/V9TvEnTu+jeAL8YRIHLheHUB239S9x111g9eNoNa+NkAbYG5eI+UF7CHw9jlOgY0Ye
         w2GCmyiRm9rY9+Sv1c+hgOLJNvmUBfjvriem/4CeOtARFzuCOHjjdx2UVFcAgv8+7yTp
         VQ6oEfmC5QpmkE0t9iLb4BhYWpd/HoZ5D0EZzi/bAycFKkLIJYMXxXGbnsk174bSL7rS
         qF+FZCBcyVc42SJqmQtqkXharohN6bvhml9PP5IfRmFuRtNCL84KB/NZTY4JGH4F4+mZ
         FXAA==
X-Gm-Message-State: AFuF++kihO6CHN6aZFD3v8oq1bN3VmQjUheRcQ6tzrgRNQS5EC27zLa9
	L9OXp1VoQNLpWY/MQdb32G0e9IDERUA30B/jqBRPYnfMpKh8p7YGbmW28CQVNPLaWvu1wKbpVQh
	/0dXCFbmqOMYoknyG7cn/PoEtq2JUPl42FCpc1ddORsXAbOsgEKJ3xlARrp1GYtC8Fuj+
X-Gm-Gg: AYBFou1xOuFMY0AQ9sEaHQBeZtyz7Mm4+IE4eqp2FMOyjYguUR/2dqtPsfYFaiK0gEH
	z5f5IH60yhhzWFfFeELFEzTcKwnVwGahr1AbXPIb4J5bvRY1FjbL+45TrIdycYV9QKwhzacVGxp
	TN6aJCavQfr296Yy1aKMYwQJ4GCryBUS2MtmZ1dSLAGtJCbEgiRo0wIiJhklN/iGa2RYcz/4YID
	1poTh4SPAtdT/mJ17OlfI9eIGgIV9O74H5Te5yvllleYJi498FPAbxSAsqXQiNIiZTSSdyuuotr
	eQnE2JCA62Z3hg4/QodhkBSfOQ3QjGPh6BSZVq2w29MlHI5f9KFrRqLS76fiS8TosXfTTylXafh
	34nDTSLpK
X-Received: by 2002:a05:6102:6a91:b0:7a1:f951:664b with SMTP id ada2fe7eead31-7af1e4f29c8mr1102724137.18.1790251720416;
        Thu, 24 Sep 2026 05:08:40 -0700 (PDT)
X-Received: by 2002:a05:6102:6a91:b0:7a1:f951:664b with SMTP id ada2fe7eead31-7af1e4f29c8mr1102707137.18.1790251719853;
        Thu, 24 Sep 2026 05:08:39 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:08:38 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:41 +0300
Subject: [PATCH v2 29/48] clk: qcom: gcc-sm8250: Use common clock
 controller probe data
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-29-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=3702;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=84OKeBrl3IKjvgDlfAkMLCAYo5otzVQbeGYjLU1sscI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJdiZ4JZw6hkus9b6St/w9UqB8+37EHfB0mK
 RGhP0IriTCJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSXQAKCRAbX0TJAJUV
 Vt5gD/0Thh+OvJ2xvWin7MMA3ulAj61Ey+b32ZlHNq7DmO5Gc3+8M2z3O5utFjZ7s8mh0xxs7/g
 czhvKyuihdoeWWvv+aJ70VH6KTUMZ3DeZYk+bkrYPOkkRlwbK2BhF2F7lzaa+2+DKpKXvlFjZTJ
 L3A6D1icu7xnPbKYxPylP4absR3L+YvD3hhM7CUpp3opgRP3RslGQNGCw1pyHkAzXBYlaipG4U7
 qpxMNyO+dAmkwhQO+9uJ0pAgQMVU+Q0D81k5Cel1dUm20qjk/so2goaL/Z3/KD34s7rRN5UWrdi
 EGmJAnqBT3cQsnVEQLGZuUmzMst5uV2p5AEv00a1aec5sPKFBNvkrfCgHkGF/qWsliY8crJVSNI
 s+9MRjMAcmxryIJ/2C2IuAwShOOYnCahAGwNfCBBhMJxkFNqTsMOnNgxpKakDo0GxuljkA58Tne
 pUX1YSmatFNDZ+Ih6QwAK+CEmREz5flR76Z5VgGrErzhOHYYTleDbsgO9OqSOvjKJeRtjoUavKY
 FPGYD9spUV/cNJXlkaEIwEfJOYXuhooo154kKHExd/kXdIyhm5uiDXczVdc64EVVqWMNWEHb8Jx
 h49RDFzgycyrRrk/JLtRJMGOgi6nGfqyBv22UqdFDHahWJI0Bg+kIErJYTV5QqI3Ugwy9pnd/fZ
 EDiM/Rc4p9D+kLw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX3bzj+xSO/1N3
 6PFB7O7f12yQxEB57z6o0g0Rz2cMvyooWeFabGt6WVxEiAf5ODT4V/ktUznHtJ4HnLrrL4mo+cv
 C4arQPXDCu5lq43gYzNXs9NlwsoqGJo=
X-Proofpoint-ORIG-GUID: GJSELH3Wlif-iCbEL2jNURs_Hy9bweBE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX1knzw/onqEd1
 Db9TK+JwnT32B84API7QosHR6pz+/Ww2ovqT31mnk9IDEFOyvIpDu1lafOystW36rlaNmK5Bq6Q
 IpZItWWhRXyWTsek5ALzuCJxL5hGx7wx/qKliDQ7bhaN1r/ApoDC8KHnYFJWuXGu4VGCQwKZAFk
 jk/FIvfWbBEH51JdUE1s2OFcXVdaNsDi87RsGnGeH1zp2Yd35jDQKVRKHOUxYKlbg8/+KQm5r8U
 anKGr5gW4pIkuLRx2IVtzRQAWoJT+t5/kQC+AMngafdSIfH+3DaCCfdvz5FMBuGqL413pt7fKpd
 bCqkcoLZPIsAtrlrErl9K3Rcxe7OoCu+eBqxfr0TcP7cPNT3EJ2OAvSV4rcinUfNksMdPrhKHmd
 SZ4B3+pmF9UPrW3tHcCQizysPljWvAKLTp9mTLYXuQzc6ZB+2ObK4srAmLVfjaogJTH7GXIplWs
 TY9JwNGAW5nIp0S2AhA==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab512c9 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3W-9O9G7v02zwTbmxhoA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: GJSELH3Wlif-iCbEL2jNURs_Hy9bweBE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240050

Move the always-on branch register offsets into a critical_cbcrs array,
describe the DFS RCGs through qcom_cc_driver_data and move the register
programming into the clk_regs_configure callback.

Use qcom_cc_probe() to perform the common initialization instead of
open-coding it in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gcc-sm8250.c | 57 ++++++++++++++++++++++---------------------
 1 file changed, 29 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
index 93c1beacee01..7ed7876577d1 100644
--- a/drivers/clk/qcom/gcc-sm8250.c
+++ b/drivers/clk/qcom/gcc-sm8250.c
@@ -3603,6 +3603,15 @@ static const struct clk_rcg_dfs_data gcc_dfs_clocks[] = {
 	DEFINE_RCG_DFS(gcc_qupv3_wrap2_s5_clk_src),
 };
 
+static const u32 gcc_sm8250_critical_cbcrs[] = {
+	0x0b004, /* GCC_VIDEO_AHB_CLK */
+	0x0b008, /* GCC_CAMERA_AHB_CLK */
+	0x0b00c, /* GCC_DISP_AHB_CLK */
+	0x4818c, /* GCC_CPUSS_DVM_BUS_CLK */
+	0x71004, /* GCC_GPU_CFG_AHB_CLK */
+	0x52000, /* GCC_SYS_NOC_CPUSS_AHB_CLK */
+};
+
 static const struct regmap_config gcc_sm8250_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -3611,6 +3620,24 @@ static const struct regmap_config gcc_sm8250_regmap_config = {
 	.fast_io = true,
 };
 
+static void gcc_sm8250_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Disable the GPLL0 active input to NPU and GPU
+	 * via MISC registers.
+	 */
+	regmap_set_bits(regmap, 0x4d110, 0x3);
+	regmap_set_bits(regmap, 0x71028, 0x3);
+}
+
+static const struct qcom_cc_driver_data gcc_sm8250_driver_data = {
+	.clk_cbcrs = gcc_sm8250_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gcc_sm8250_critical_cbcrs),
+	.dfs_rcgs = gcc_dfs_clocks,
+	.num_dfs_rcgs = ARRAY_SIZE(gcc_dfs_clocks),
+	.clk_regs_configure = gcc_sm8250_regs_configure,
+};
+
 static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.config = &gcc_sm8250_regmap_config,
 	.clks = gcc_sm8250_clocks,
@@ -3619,6 +3646,7 @@ static const struct qcom_cc_desc gcc_sm8250_desc = {
 	.num_resets = ARRAY_SIZE(gcc_sm8250_resets),
 	.gdscs = gcc_sm8250_gdscs,
 	.num_gdscs = ARRAY_SIZE(gcc_sm8250_gdscs),
+	.driver_data = &gcc_sm8250_driver_data,
 };
 
 static const struct of_device_id gcc_sm8250_match_table[] = {
@@ -3629,34 +3657,7 @@ MODULE_DEVICE_TABLE(of, gcc_sm8250_match_table);
 
 static int gcc_sm8250_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gcc_sm8250_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	/*
-	 * Disable the GPLL0 active input to NPU and GPU
-	 * via MISC registers.
-	 */
-	regmap_update_bits(regmap, 0x4d110, 0x3, 0x3);
-	regmap_update_bits(regmap, 0x71028, 0x3, 0x3);
-
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x0b004); /* GCC_VIDEO_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b008); /* GCC_CAMERA_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x0b00c); /* GCC_DISP_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x4818c); /* GCC_CPUSS_DVM_BUS_CLK */
-	qcom_branch_set_clk_en(regmap, 0x71004); /* GCC_GPU_CFG_AHB_CLK */
-	qcom_branch_set_clk_en(regmap, 0x52000); /* GCC_SYS_NOC_CPUSS_AHB_CLK */
-
-	ret = qcom_cc_register_rcg_dfs(regmap, gcc_dfs_clocks,
-				       ARRAY_SIZE(gcc_dfs_clocks));
-	if (ret)
-		return ret;
-
-	return qcom_cc_really_probe(&pdev->dev, &gcc_sm8250_desc, regmap);
+	return qcom_cc_probe(pdev, &gcc_sm8250_desc);
 }
 
 static struct platform_driver gcc_sm8250_driver = {

-- 
2.54.0

