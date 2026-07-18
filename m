Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45A38388391
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379442; cv=none; b=Gko80SgONeQcY7fDqrPhV88kWLcHdRxlJ9TxPPFM94YFIWWmjXUwpaATzemc2I/3CgHhtu4UG8YVjUc9dyqGGx7dE34NpsRqJDxTC7PbPMpWa3JvAJLAiYXcr1wyNpjsQvcwh9Pa3sLlkbg00lCtcZ+aNoMAaJdqP/t4unCkT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379442; c=relaxed/simple;
	bh=ZWJ95M6B1VCiPvJgQ9SGRpljn8Sw8iTIOMV7PBjmKKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvJavmUiJ9evSnnyBDMq/vsFdCLf1+JYPn/1QGAm/prZremgYULUgu5r1BqxIAl2TR0HrnSdl6AwrpQ7gHk6l9nMtcH0NnlxD1kyMWVdmHl5l4CbcROaXx2jF9QONjYGFlkDLrXKw3XeBXRrcDkGiXqftPdqTWRl+RyUv4NSyH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YMqauaXw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IzFd7Mey; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YMqauaXw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IzFd7Mey"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHYAl027092
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gaYOA7qW/i37mH8yvBPps0hB4BrYN0dKcClw0K2ECg=; b=YMqauaXw44/yu4B2
	rxV1v1TMo8Q2GjzWALxTkDYn+tL0wDoxvAFr6sntQYRoMGgHJHyQJC5nk1xfmOP8
	lOsuK6qNTO+4MnQV1Bdr6DzHn+OowNvNNAq4qQFKjPK+Crlan4/FupKlH7qFHlDH
	VLjC0eWDG+eqrEtlOhR10/8fCNnSofyvtNyn6W3I0EkHAWXFbfSqLjUNsck8Rt9u
	Nj6P2g5B2+jSvBX0NRiLspl0v0NUQ3z2XHpH1p7UHq+a7iOCbEOdDV+I+a5lZrQe
	iqDWNTRe82L1/dR3gvWNjohZ62q9k9e+Yo3PDfinAjAPl6amgLvzCzzLu0JT3IoK
	m/Byvg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2nhgqsh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38869800848so13242157a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379440; x=1784984240; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gaYOA7qW/i37mH8yvBPps0hB4BrYN0dKcClw0K2ECg=;
        b=IzFd7Mey/Wr7+jlPPARiL+mc9SvuWHcj9Hg1Utjri3Yzf2eUxiKhzpm8lZefFwFvS+
         ebepNR6A2sgnGdoGHMJeeOKXnQLDVGkdYWMIPxxxz9oNgy3AeQZhP0WerKe13ToZroyk
         MeHVnV5lHYFh3zahIG+1GB1n1mVDjH9t6m/k48yMywTexPCxh6pA3qjgDMLSLXiUgHFP
         74Kt+S8QOpyEjj/+EZPKXrajsbjrs1n/B7nwzwjSQFmEySV6CfOJ4Hqr+4PI17tB15jo
         3xNQLYVM0UPvnmtOhbAT5BzbtyIkNnVz4ZqspBE89OxezWrap4uyMLtkyHtFD9uHZXHN
         o4sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379440; x=1784984240;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gaYOA7qW/i37mH8yvBPps0hB4BrYN0dKcClw0K2ECg=;
        b=nwZCKlUfZV1FDuHUnyk++z8mL6nLX2/LQbjMuVNkWHNu3n5ISMihoJGmpX+R0cI+la
         fRGN2WVG4s6mMyTCp+wKgojqmbUH2X56IcJ6sJkcuLtREoLi8T6+F+nYlyUCENzEL4Ko
         8n7O98DVEdGkVf1Eo0ltTgraJtc89nYS5K+jnNqbXauDNyBYBrM6CAvPswn1lOKg6e4O
         2zAqfyjkEteqb7qEic2WRRDBR9Ptne0lN+JbizTa7E7tbJbLkLWRe3jbi/3ULgyyHWgE
         C/ZligBLZT1FfOzmYnqVnvPeMsjfjuOvHjspYm5+BLQOmaz+E7MLQklo6eexFUGlym3z
         k00w==
X-Forwarded-Encrypted: i=1; AHgh+RrMfe2F9MerHkOKsr2b3Ho9NDSakxmfmpMGir5ukMRk9Ot1uWW51vsX8s8tqDINDYtF3chXVW0RZXrZfSmU@vger.kernel.org
X-Gm-Message-State: AOJu0YysURDWCmadYczaaXwsdEPmbMYE8Q7dZdLY+Jn2FUkCygWbgC+i
	aHjqNQj3xsoydpTA4H2utOnZSAgx9taT4g1tgc9719flCd3FreWfpbbgEA6rNKezXK/RD+fgNh6
	39KJKWyjloy7+dx5Ag63aUCQnBt4ti1zio0uIXsJJaEZ+UPLrg16DGCrTK1nKiMs08hOC
X-Gm-Gg: AfdE7cmfQ9JCp5k9SBh7UYDSsNtS7Nac7oPCHGOp4H+SiHBJ438WZX5Bb07FCYVnD9c
	MxfnBD1idrigxSMdmns0yN0Xe8tEmtvFHrteBGjntYQJ3EuRFpfoVw2NJdK/u+9wD2liQfknjyr
	uVrJDgGv5fiszrKlxh/6nSh8JYR2MVGKswmuj6Tu8/C6iLcJLL4u6TioKF/0jW1ClhMmX0s+0m5
	whCpJduJ02k41alZmz99b+5KlujuYtEexvMHjNlg6NCzMitRPuwzd9VZdZ43VyYLV1XtbeVoElm
	0kjSspHjL09Po3R/n+2/hr9LrzMmyAl8QWiWfYIkGQF+lGQT4raGxhcJb4xNF5htmftICioOvnU
	NUV8fvDKiam5krX+2h8a1ZCT9Cj/Y3Bo=
X-Received: by 2002:a17:90a:d646:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-38e4b51be59mr7597120a91.27.1784379439838;
        Sat, 18 Jul 2026 05:57:19 -0700 (PDT)
X-Received: by 2002:a17:90a:d646:b0:381:50ab:1594 with SMTP id 98e67ed59e1d1-38e4b51be59mr7597070a91.27.1784379439343;
        Sat, 18 Jul 2026 05:57:19 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:18 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:16 +0530
Subject: [PATCH v6 09/16] clk: qcom: gpucc-qcm2290: Move to the latest
 common qcom_cc_probe() model
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-9-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=Le0MLDfi c=1 sm=1 tr=0 ts=6a5b7830 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=kfuAGOiE8AnRzSM1rcsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: AaZHQTee668NzfCNuSQMMbXuma4gU6Fy
X-Proofpoint-ORIG-GUID: AaZHQTee668NzfCNuSQMMbXuma4gU6Fy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX74ta7p8EsXc+
 k5X9AFW8jBF+2hOAdEXKa7+ABddwS6KkA+/8qpElfphJbOeycp+j3eMZdSeCmKV/fyvjHxyM/oX
 GZthh5ugcNhDTpQl8JO6ODE2HRi6ENNGFpnC7kd8so/cGr3au5GuYlL5Q2oPpHuG6Jwmc9yfIos
 SG/prtVROiztD0l80fXlDJ2BbwPBdVoOnlj+528gJpgzsiBxjh+jnZ0IsfcPCKip4MBhwKcwu1O
 RZbp9cafZmPBlkWJ8yMTUVKy+aw1vsPA7fERsw+/1uT8sNLfY+wTBICn/D+F7ADll3FnMDpSHIe
 fhUM08aPi6QQnF4NGJNDb71+wo9daUU6w7swt19p1yDUZTkXI/bNfAsOB4e//LaX3kY4Viu+eAt
 eKqivl4NutT9lKSVdNaGjbJvD5tVfKBOQsvNSicrbz178YyzMEMex8Ndke9NvbayVLqmoPD5dq2
 B38mXvrpEthNqdpFSrg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXwDm1qRz7j159
 znGCHSdJ9v3Amv+JwSFTJNapUImtrTe/fhfGxmAQuiHwqVg0YDh5vNeV0GtNyIV/4bU1YJZZPIf
 pappmsDV1JoorYo7COq7GVmnS5XPQ3s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

Update the QCM2290 GPUCC driver to use the qcom_cc_probe() model by moving
the critical clocks handling and PLL configurations from probe to the
driver_data to align with the latest convention.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 50 ++++++++++++++++------------------------
 1 file changed, 20 insertions(+), 30 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index f14b4620090efea139316ad833e034536caa5199..b19e8910931d85ceda079c2745eba37e18112955 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -2,12 +2,12 @@
 /*
  * Copyright (c) 2020, The Linux Foundation. All rights reserved.
  * Copyright (c) 2024, Linaro Limited
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
 #include <linux/clk-provider.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
 #include <dt-bindings/clock/qcom,qcm2290-gpucc.h>
@@ -19,6 +19,7 @@
 #include "clk-regmap-divider.h"
 #include "clk-regmap-mux.h"
 #include "clk-regmap-phy-mux.h"
+#include "common.h"
 #include "gdsc.h"
 #include "reset.h"
 
@@ -55,6 +56,7 @@ static const struct alpha_pll_config gpu_cc_pll0_config = {
 
 static struct clk_alpha_pll gpu_cc_pll0 = {
 	.offset = 0x0,
+	.config = &gpu_cc_pll0_config,
 	.vco_table = huayra_vco,
 	.num_vco = ARRAY_SIZE(huayra_vco),
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_HUAYRA_2290],
@@ -346,6 +348,14 @@ static struct gdsc *gpu_cc_qcm2290_gdscs[] = {
 	[GPU_GX_GDSC] = &gpu_gx_gdsc,
 };
 
+static struct clk_alpha_pll *gpu_cc_qcm2290_plls[] = {
+	&gpu_cc_pll0,
+};
+
+static const u32 gpu_cc_qcm2290_critical_cbcrs[] = {
+	0x1060, /* GPU_CC_GX_CXO_CLK */
+};
+
 static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -354,6 +364,12 @@ static const struct regmap_config gpu_cc_qcm2290_regmap_config = {
 	.fast_io = true,
 };
 
+static const struct qcom_cc_driver_data gpu_cc_qcm2290_driver_data = {
+	.alpha_plls = gpu_cc_qcm2290_plls,
+	.num_alpha_plls = ARRAY_SIZE(gpu_cc_qcm2290_plls),
+	.clk_cbcrs = gpu_cc_qcm2290_critical_cbcrs,
+	.num_clk_cbcrs = ARRAY_SIZE(gpu_cc_qcm2290_critical_cbcrs),
+};
 
 static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.config = &gpu_cc_qcm2290_regmap_config,
@@ -363,6 +379,8 @@ static const struct qcom_cc_desc gpu_cc_qcm2290_desc = {
 	.num_resets = ARRAY_SIZE(gpu_cc_qcm2290_resets),
 	.gdscs = gpu_cc_qcm2290_gdscs,
 	.num_gdscs = ARRAY_SIZE(gpu_cc_qcm2290_gdscs),
+	.use_rpm = true,
+	.driver_data = &gpu_cc_qcm2290_driver_data,
 };
 
 static const struct of_device_id gpu_cc_qcm2290_match_table[] = {
@@ -373,35 +391,7 @@ MODULE_DEVICE_TABLE(of, gpu_cc_qcm2290_match_table);
 
 static int gpu_cc_qcm2290_probe(struct platform_device *pdev)
 {
-	struct regmap *regmap;
-	int ret;
-
-	regmap = qcom_cc_map(pdev, &gpu_cc_qcm2290_desc);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
-
-	ret = devm_pm_runtime_enable(&pdev->dev);
-	if (ret)
-		return ret;
-
-	ret = pm_runtime_resume_and_get(&pdev->dev);
-	if (ret)
-		return ret;
-
-	clk_huayra_2290_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
-
-	regmap_update_bits(regmap, 0x1060, BIT(0), BIT(0)); /* GPU_CC_GX_CXO_CLK */
-
-	ret = qcom_cc_really_probe(&pdev->dev, &gpu_cc_qcm2290_desc, regmap);
-	if (ret) {
-		dev_err(&pdev->dev, "Failed to register display clock controller\n");
-		goto out_pm_runtime_put;
-	}
-
-out_pm_runtime_put:
-	pm_runtime_put_sync(&pdev->dev);
-
-	return 0;
+	return qcom_cc_probe(pdev, &gpu_cc_qcm2290_desc);
 }
 
 static struct platform_driver gpu_cc_qcm2290_driver = {

-- 
2.34.1

