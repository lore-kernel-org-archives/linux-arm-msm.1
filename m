Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA74949B1ED
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790251753; cv=none; b=M/Y5uGqlmQQWsbaC6T2ctcNRtnI4K8FXh1ghaPDuezP29rdjSW0kRJmHYGDp15fL05KstBs8GZM02BLbgm0ytpxzGjuyk6KquG3/6lUCn6AVNObzsJIH1u9nHaIOR29w47RafSwtOHobu4w5DUi2P6b7tJXbO7x/eF3d5kCx7h4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790251753; c=relaxed/simple;
	bh=ZlV0ToIKIheLrRQzvesxiJyF6G0753SHmic9A9RRTjk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hWixAr4Iuo6JpndXqkteQfL1fHJcYKFdMyfVWF9ECJ6CgezKoA4XEjehInrOOBEdI/izTH3bQsdHvwp5S1ZDS5r5xmSJY24XDF09wYnPz7ogFlejmOVrDRiasfVvW4xLRcVhxmJGNMKMjMwuJaSPnysbvzX9XbIm9YPR2KLd0bA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUqzIZ3a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RnTG/4nx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUqzIZ3a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RnTG/4nx"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68OC4blm2133912
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OMuGpuatFPZ3Bg+0hqcyf/x4nQdJJ6oYxUDjpEqSRyU=; b=mUqzIZ3aCF2zmXoA
	R/d9nEsH/v/jX4PF+zZ00vnjFbQvA85ZtDpBjQ2HPJdaD5OQsmt9KnRdZLUn+XAR
	hys83ZGwJAJKwaDtKZeUhWXMvSIVs9lAoQ9JVrcGDI5pleWpTgBid7/BmhmUkukJ
	e19dXRAmlLUJD1N84FaAvZmg4ngcJEuNZuYNQPD1PDgu8X9NbzuZz8CyM9dRWyTl
	pNDzNRX5R/phf0/dzB6JVkvseCQqaFNqfJFzsggTPRJaziQEHkinRZaQtNZpXeOr
	IVdpWAkQqVKAKmPmHiEpyeTK7uFaSxTRm74jQ0ziuNl997/BudVxkFv02L/VH2wj
	cWhjAw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvhsb4bx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 12:09:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7a9378b844dso600167137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 05:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790251750; x=1790856550; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OMuGpuatFPZ3Bg+0hqcyf/x4nQdJJ6oYxUDjpEqSRyU=;
        b=RnTG/4nx4x3XVv6Cq67ifDPc8aJYLRkboyMF28pLF0rNSyLwZTPFVSkwEnYF1Q1+tz
         0wbHG4ezxyCHPy5IF6X9nxQjHc2N1f3a0sXW+AeifVKJ2aIw5cJE7TfxN2le/6e0ouhT
         uWfwQIy5rGG+R4EPvR7Kx8rqnpBu63jBZnAuYO5GjSNL8vWuwml8LIOLUfMad2zt9OFx
         S3Y8QNedngviHUC4BGR9AN+isAciCKKpu2knidCq17B2IeehhUDygYQpssIawLILZt10
         zZqzOKSy2mGd9DgG0aRukslTiFLUYPRq9uEp0a2kuYMMEkEXJOeZXEL3DPn5Edb9RkMk
         fLnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790251750; x=1790856550;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OMuGpuatFPZ3Bg+0hqcyf/x4nQdJJ6oYxUDjpEqSRyU=;
        b=MUSZKBeA9juDsQA6A31vbiV3blxAhW/wXR7CFEQASCxaKQ8kxVIM1w62cyX+zbuFl7
         lhoIytGStoljcf4eLAzZ/WvmhzcGmJ8xTNJgd59AE7/Lgren54uKd55YMa9tHOJdLuaW
         9xHNc9WhNCL+hikb9Mef01HHenTZZSabgWd+QdcBv7CFrt9BKMW2C7SA5VB/Y4e1kDRf
         KHCbLW1rbdqLLmPc6ThxeyeSPvaHg2AzIp0hFMuAYT22u4ob3tf+8ece55v8HcshvWTS
         8qxCTSbmVDHz2CACQn7sqBh8fBYQObtLHVtTVrlypNzDvG16jdTxn/evWO/El2As2G9g
         Rsjg==
X-Gm-Message-State: AFuF++mNUD+FoEeBih2gNoiQvMO9I5v1z9RhnvIQ3gM/KbEivNAIiDEC
	TMyDHqHOgt6q4nnNSpmEbeSL86JdF8cVsTwwHTS+jdlkB5xsfabbBrYdnMUv0zgFTK/M7xrWS1I
	DhSvWyAGjxRUktYAHbz38nRk742jn79OvEKkGsDgpx4+ISr6B5TkdXuyQsStLAKOpL+Yi
X-Gm-Gg: AYBFou3zn0ynVAl8YXcqS4TX8kMeFOlzwqInT9B3Ma/cLxVNyuxbnmYFkRzh5L7tPyf
	t089ypDnHKa+54fMTBnbr5hphiHKdmYwss1kJBYNtHj3B3G5DpQNKRS4F9n5FWrYFnDkW+CysSg
	Ec5dg363wOL5HXWk2I8t0oVmXTJw5z/en5bmB07PniLd5H5dcqAi/heHeL4wXKF1ipzFYnvFV3F
	sAA6PCcQgy8Y19T5rUh8K9jrAUWRmupVDoe1ZKz8tWUdv4J2y/c9g31HLfDPpfmoy3AhBnaBO2I
	oYPdMEvB5xC3f1rt1iOrLQCKgj2hl5mIKD6wMptinzj2DXOnxuiN2vAvMeV+PfbuB2ToODgjf9S
	wTVSdOlfV
X-Received: by 2002:a05:6102:160f:b0:7a7:196a:84ec with SMTP id ada2fe7eead31-7af1f1fe5b5mr1088066137.36.1790251749675;
        Thu, 24 Sep 2026 05:09:09 -0700 (PDT)
X-Received: by 2002:a05:6102:160f:b0:7a7:196a:84ec with SMTP id ada2fe7eead31-7af1f1fe5b5mr1088048137.36.1790251749022;
        Thu, 24 Sep 2026 05:09:09 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe667ae2fsm61376605e9.13.2026.09.24.05.09.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 05:09:07 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 15:06:52 +0300
Subject: [PATCH v2 40/48] clk: qcom: gpucc-sm8550: Use common probe
 handling for always-on clocks
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-40-1479443ee016@oss.qualcomm.com>
References: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
In-Reply-To: <20260924-clk-qcom-rework-legacy-always-on-clocks-v2-0-1479443ee016@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZlV0ToIKIheLrRQzvesxiJyF6G0753SHmic9A9RRTjk=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqtRJoSpH0HQzLkTM5wfxmpv+jplK4B0u0n2GVE
 BVN2j8HSVeJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCarUSaAAKCRAbX0TJAJUV
 VuF1D/9Ml5SbMGeNznrPvr1sEeBSW593eGrbFmF4x+U/PEaC44X0SBXJeX9X2Q82TLY8OAvrcaH
 KBT5+LOC4nwgQK9lc8xxOxgVpRQHLsAeOiI+1xVWZn8/Pk1WkAaIF/HBdSa9PauAIX7psNmWgJ7
 4pbIT83iiD/8GgJ5cBlE/lyfUvkomGJZGS25BOhcF1pOWZzn5U86ogqpJzwVtSiHPU31xK+zwdm
 EtCxFhqFymxH9ry6beajozCFvKOb7BMz+D48EDw5GlsEImSYNrYhgh/lhe7pnzJNbKNvwL5LeFV
 N3w15rL9ntQVlz4fCgHhu83py0m9Rf0ShTrqo9rP87aPraHwlPL1FGcsB1NT2iTjUXvF+3KhZWb
 tNy1TWtVPNCpozQfe5t+g9XMQ5wVXCWqg8h6qqxwcliaFUDOAHEetdObtEJuoA1dghrjzvH2uNs
 X6YVNIljxThsKi+SexNSbWcR1qj1fp4UBhIBxKHfmLbsQOhiIbdd4V9s+1XJAQTZoPzuePe8BkO
 L4b9pOIYmv50aym6PccXoYgmrBXaLbnX0I+ZzXIBgcEP7yJYIs/hzd3ll1KTh/sbFEAb8NISqCh
 DFUfE3YoDHui5e/PhEwclW0HyK2P430fyWTo1bwSP/ojMGC8fKjPuqVRV2/CC92MnBKEaA+as8D
 nDv29ftSrxxxP2A==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-GUID: 5XY3SwCRo5aBBTCdItsWEfzl4Jy4tusP
X-Proofpoint-ORIG-GUID: 5XY3SwCRo5aBBTCdItsWEfzl4Jy4tusP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfXz+NkQZ46QXtO
 pgDdWONik/FntGgw8Uaw0+t9PiF8xec4OQZQwU2Oe38F26jbhOpycZlfH8l12Sn/JmDMzZ91e9Z
 rnQN6Lrv7w5XW/7sdDDplXR7DlI0vNBZKMYqJqFs00ns86Xi0CSTesZwnMjBcG/i8fa/SsLnupo
 QJxsjochghBHB5VZ2gkPTr4l4S528AU4KIwVW2s3mBcr9r1VrilmWkq/Q1TrsKW+eMucq06k7yd
 DEZfrLQph569pEZCnTglQdOiKm6/vwaExaYrIgg9+x7dQyovHpGLNDmgj/Kj6vcW6b1M9auZZDE
 wS2EcsurmrYgsX7eBFqlrpYHou71YnYYZDAbv1A6Mx2xv078u5NMbymVauhzkjizY3o9OPkYjDY
 pwekuQtarVq5pAqwMjqjByjTgguOPj9x8ftX8zh7QKDoO2qJPGW9m7dfQNRfwUzrnqc0XTfwReY
 ylVzvx39YNRTFXrLmJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA1MCBTYWx0ZWRfX/6skPmcTqvGt
 qTXOosVc78JBe8b3+7l657GxcjP2aC/ZpSh1ZCMURftCbz7ARxj3DGYVen0umRlFwhds+cHdQXs
 1HmTx81eZrGNvsCQ6QXPZhpJ/qcwjV0=
X-Authority-Analysis: v=2.4 cv=f7vdl+yM c=1 sm=1 tr=0 ts=6ab512e6 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=ED4nYY0oUM9iKWp7kXQA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609240050

Describe the always-on branches in a critical_cbcrs array and reference
it through qcom_cc_driver_data. Let qcom_cc_really_probe() enable these
branches instead of programming them directly in the driver's probe.

Assisted-by: LLM
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-sm8550.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sm8550.c b/drivers/clk/qcom/gpucc-sm8550.c
index 53614e980b26..f8dd1727c080 100644
--- a/drivers/clk/qcom/gpucc-sm8550.c
+++ b/drivers/clk/qcom/gpucc-sm8550.c
@@ -547,7 +547,18 @@ static const struct regmap_config gpu_cc_sm8550_regmap_config = {
 	.fast_io = true,
 };
 
+static const u32 gpu_cc_sm8550_critical_cbcrs[] = {
+	0x9004, /* GPU_CC_CXO_AON_CLK */
+	0x900c, /* GPU_CC_DEMET_CLK */
+};
+
+static const struct qcom_cc_driver_data gpu_cc_sm8550_driver_data = {
+	.clk_cbcrs = gpu_cc_sm8550_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_sm8550_critical_cbcrs),
+};
+
 static const struct qcom_cc_desc gpu_cc_sm8550_desc = {
+	.driver_data = &gpu_cc_sm8550_driver_data,
 	.config = &gpu_cc_sm8550_regmap_config,
 	.clks = gpu_cc_sm8550_clocks,
 	.num_clks = ARRAY_SIZE(gpu_cc_sm8550_clocks),
@@ -574,10 +585,6 @@ static int gpu_cc_sm8550_probe(struct platform_device *pdev)
 	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
 	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
 
-	/* Keep some clocks always-on */
-	qcom_branch_set_clk_en(regmap, 0x9004); /* GPU_CC_CXO_AON_CLK */
-	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
-
 	return qcom_cc_really_probe(&pdev->dev, &gpu_cc_sm8550_desc, regmap);
 }
 

-- 
2.54.0

