Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12467569F12
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 19:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790191332; cv=none; b=PmXLTjx7cNXGY1pkdEKBfz/dhtSXW6VtWqztitwNSL+oUzgsHVc2Th7/d6owybXJ+9lmO4FWx0UJeLgM7h3nALWYAL2kNXJAbXmy0oeOvE+Iq4slht7AOquZpLFuxJRKPTvOCnVVTdHdGB0/kK8ULp9Vstgzc4R2JRl7UajCFoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790191332; c=relaxed/simple;
	bh=sX+E+Anyu8CFs2952xi4vwpxNCngY7cIPMCPNrSrZqY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gbEsr2VgOWgRiKYfR+avD2OCctbjKT/Z0W9q+fWknbZQALFpAP+A0hSTnDB+AO6sLJ9PXHUpBw80OLovhjMt2K/9MbK70xmjA2bBjR6qI35vnaTP3yqdAXkjHdEODryCn7zr8pVqPRZJ+zBxQCPEKPqygpI1BGcBp7iqlddHS2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IFrgp7BH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hri+UY0i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IFrgp7BH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hri+UY0i"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NGTqoR741302
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 19:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcvKdqD2Z99ZaO0jUIMo/vHNRZMwTcapU92eW9YWlJU=; b=IFrgp7BHSVZCRsR2
	ein3thYHgBG6N4JyBPjE5YmwhkankKZ1MuOUlU7IDnbsPCztaZvBRHUO5H30knwR
	veLpntXhJscufnP2+DaRPgA+CtICquYrIkD1Lw3Pf8T+sWoj67j1BBN16Q8h7u+7
	G21yEL83UQdMg0JHW9AjRrus6Fc1TWwGe3JSkxkYqG5fdVH34SV2aEOHKzPH3B1Z
	l6qLcgkTRGgwYp5tOUT7ktLZEe3UGqCitT+KiRe1bzOBvV4tiizVzZnABqdlFbf+
	TEscMynH6OtLnSkh94GWuwxEPMw2HFCzJTOrVPVeROC9UoCR7gHy9aOoX20TE+B0
	CqO0ag==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfjshn5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 19:22:02 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3286d2bac04so1495199eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2026 12:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790191321; x=1790796121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EcvKdqD2Z99ZaO0jUIMo/vHNRZMwTcapU92eW9YWlJU=;
        b=hri+UY0iwMeaA0cxOM9S6siUIwKiH/ruoUc52SVIgPeDYx9y3V/MzwJUduFC4EYiDd
         IDUyTuMuCefTjJ7oKSeXIEsuiKbxtHXy//8kWa9NTWaqv4dYjKvViC5X2l/2lx2XSpNc
         TJSJHqmsm1yFoaTkAkKBbk3SEyIwcJtquQFKsP43CcxnTZ61YHoxp6ELXKgX6yz1zsBE
         jrp6CBTVswX0PDr5r6QQY1sscQop2KkBUQxRwPohCXw9N5twb77nsLryaUbizYcUvMt0
         hQM9l3k3R115aQOLabTSrLSpUjpC0nyynHmVvvS8Jc9MRGWvWZOJeViMUEOizHJhxhf5
         uniA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790191321; x=1790796121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EcvKdqD2Z99ZaO0jUIMo/vHNRZMwTcapU92eW9YWlJU=;
        b=bBE10XBlVPfMTLp57ecLj9qi29E7bpVhZBx2bH7zvZidb4ODqUTG3YrvrzjQ04q7mn
         Rpyn2ttmGGM3aM6G4BV4K8U4wP2nBU4hnM4w0Wyp+kX6Zq9/LGnW7XRwP2OGzxD6fKG8
         LyYunNyT5HbaXER6HKAnkLttMTIMXAGpvFUsL+qIBeuLKdwPgQ4AlAxguGzvunqY1OOs
         E8C0iPbIFbp/8RZqkgjVPvYf7SpcemqwRv+58luIMD5TSNeXq+VUbE/RHe2k+e292fCQ
         NS7tiI2JmeHU1XEpKagfC7szE3xFqXGpjnSXub2uS5QTy36vRU81O/PbNJpPvUAKWxjE
         uUqQ==
X-Forwarded-Encrypted: i=1; AKwUvBxLlqfhcZ1ECeFkwsSaYbo8vtPBJEWC7Tk/BUFOwd/ZKcO9ef8bJYfy0NiGZm8pTWCLQYxDL2LhkQ3pTyWy@vger.kernel.org
X-Gm-Message-State: AFuF++kxxANVElLM9s4bvBtBdf/bZNtrKGeeyJon/TxrDDcLK0bC/vYY
	YYhiNmEkk23LsG8tI53qw/bYH4ccE34HfoNUl8uGFGTkqguwx1zdEmPm0SRFlhNXJOORvfb5iU2
	I0MhiIdJf+UwMjwcJAA2dH0643mkM1T1AhGKbXWZArBb9b5eZw8JZt8p9dRQeRTmH9/BU
X-Gm-Gg: AYBFou3OPS5rz+Dkt5W7kpznhYwkQqi0U+wuzAvW1OEvopGIbC50iKaCU0j34swHxBo
	j7NKRqN/SzE2gItNmnTegwxZlkoY2mqiDGWL5hUFGi6+8m0zf2o4FqZG8tCsvkMEzvnZp9lnxab
	iQwpM7ac99l8xZGnhbzUodja0Ym5vP9D1G/RmuURhPM4DrxHI2rBqs2660uDzzF0/eOK8DfdekG
	/oLcCfQFCtB774jExuBf8E+yUo863zhsEy5g706ZJ60AnfVjhfGTYGHy09/KZ6nmsVptfFTn9Tm
	fEeJ9f0Vppjy6H4AysqUOvYosjMS02vUKnoioej8OXxgYQ0E5TUyPWC7dlOQ1lo/eYK//zFUEXP
	EfQmGX8E56otVher/h/UfS5g=
X-Received: by 2002:a05:693c:66cd:20b0:33b:d8b2:8fba with SMTP id 5a478bee46e88-34002be4d40mr106585eec.7.1790191321120;
        Wed, 23 Sep 2026 12:22:01 -0700 (PDT)
X-Received: by 2002:a05:693c:66cd:20b0:33b:d8b2:8fba with SMTP id 5a478bee46e88-34002be4d40mr106561eec.7.1790191320319;
        Wed, 23 Sep 2026 12:22:00 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33e9684d643sm17609309eec.18.2026.09.23.12.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2026 12:22:00 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 00:51:33 +0530
Subject: [PATCH v2 3/3] clk: qcom: dprxcc: Add Nord DPRX clock controller
 support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-nords_dprx-v2-3-fa4364e087ef@oss.qualcomm.com>
References: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
In-Reply-To: <20260924-nords_dprx-v2-0-fa4364e087ef@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX2qe9+nxcHkhW
 19Ou7WTAdtq50+ylht1KitLtWsj4dFL1xz97TaFgNTJEery7fPJ+GqjEplpshu//dby4CYZkJ48
 l1vTHdDGXCrvzFC/3CRWg/u5f27FFPTs12LNsoSOU7h5MXtHLcK1HVVaCbxMbWA5TEuGD8PmRmo
 4u0GkA+FZj+LfNxT/l9XRBkailjdMOIRS+vIPmVCmZOBuY1cCQ+z6kaTIRDFPkm0LpM8maVZP3S
 dpK4LXwpJXRIEqKIyXo3WGuASYUL9qOHiMahH1Wozmp7EypwBd2QI/vGlPrdlzbKADwcAlRG86W
 J5sSXsO1yu69d6tSO++z7e6wcD3CXUlC+NZXMOz04N50IKILnEB30QG/KE5/gVvaQFeqn0tRfSL
 r8kYDtJO2WUOrKC5wMObnjS/4s9dgNEkXM9QtYMc3/Bn1rS7AadGzPT31cYXlNYcgQb9IBV3PAD
 NcuD092Uq1Zki36N3CA==
X-Proofpoint-GUID: h4IVXyTMpiePHamNKBJZPKe9sQUeu9Kh
X-Proofpoint-ORIG-GUID: h4IVXyTMpiePHamNKBJZPKe9sQUeu9Kh
X-Authority-Analysis: v=2.4 cv=K4+3jCWI c=1 sm=1 tr=0 ts=6ab426da cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=0-BBk2c4bgoaTx3pdGQA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA3NyBTYWx0ZWRfX/F3Y2UVCt2QT
 gq+ZVNvrqO1HdvrH1nvfzfyl14gmLuiTnckIgPz/QfsHyiAvaONTqyzv2zK6zclmIKZjbBn2jil
 EZ6S2RrgtVLFK7qbVcDUhuMneGOWiB8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_06,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230077

Add support for the DisplayPort Receiver (DPRX) clock controllers on
Nord devices. There are two identical DPRX clock controller
instances (DPRX0 and DPRX1), each providing clocks for the DPRX core,
audio, AHB and video memory paths, along with core PLLs.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig        |  11 +
 drivers/clk/qcom/Makefile       |   1 +
 drivers/clk/qcom/dprxcc0-nord.c | 434 ++++++++++++++++++++++++++++++++++++++++
 drivers/clk/qcom/dprxcc1-nord.c | 433 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 879 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 3bf39a2c54c85ee7d0c59608ad71b8ec6c899020..0fd6f5642db23599be8f0365e73faec5451e6411 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -255,6 +255,17 @@ config CLK_NORD_CAMCC
 	  Say Y if you want to support camera devices and functionality such as
 	  capturing pictures.
 
+config CLK_NORD_DPRXCC
+	tristate "Nord DPRX Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_NORD_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the Display Port Receiver (DPRX) clock controller on
+	  Nord devices. The DPRX clock controller provides clocks for the
+	  DPRX core, audio, AHB and video memory paths.
+	  Say Y if you want to support DPRX functionality.
+
 config CLK_NORD_GCC
 	tristate "Nord Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index bd70e18a7118126fa20427b3366956075cecb00f..f5294bb67e9a8387c40e629c2ec150e4dd4848b2 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -50,6 +50,7 @@ obj-$(CONFIG_CLK_KUNO_GCC) += gcc-kuno.o
 obj-$(CONFIG_CLK_MAILI_VIDEOCC) += videocc-maili.o
 obj-$(CONFIG_CLK_NORD_CAMCC) += camcc-nord.o
 obj-$(CONFIG_CLK_NORD_DISPCC) += dispcc0-nord.o dispcc1-nord.o
+obj-$(CONFIG_CLK_NORD_DPRXCC) += dprxcc0-nord.o dprxcc1-nord.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_GPUCC) += gpucc-nord.o gpu2cc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
diff --git a/drivers/clk/qcom/dprxcc0-nord.c b/drivers/clk/qcom/dprxcc0-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..d17b9338f33bf4864d8a5968ada3806a921fe68e
--- /dev/null
+++ b/drivers/clk/qcom/dprxcc0-nord.c
@@ -0,0 +1,434 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-dprxcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_EVEN,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN,
+	P_DPRX_0_DPRX_CC_PLL0_OUT_ODD,
+	P_DPRX_0_DPRX_CC_PLL1_OUT_EVEN,
+	P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco zonda_ole_vco[] = {
+	{ 700000000, 3600000000, 0 },
+};
+
+/* 550.0 MHz Configuration */
+static const struct alpha_pll_config dprx_0_dprx_cc_pll0_config = {
+	.l = 0x1c,
+	.alpha = 0xa555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll dprx_0_dprx_cc_pll0 = {
+	.offset = 0x0,
+	.config = &dprx_0_dprx_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1080.0 MHz Configuration */
+static const struct alpha_pll_config dprx_0_dprx_cc_pll1_config = {
+	.l = 0x38,
+	.alpha = 0x4000000,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x02000080,
+};
+
+static struct clk_alpha_pll dprx_0_dprx_cc_pll1 = {
+	.offset = 0x1000,
+	.alpha_width = 28,
+	.config = &dprx_0_dprx_cc_pll1_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map dprx_cc_0_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_EVEN, 1 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_ODD, 2 },
+	{ P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 4 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data dprx_cc_0_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_0_dprx_cc_pll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map dprx_cc_0_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_0_DPRX_CC_PLL1_OUT_EVEN, 3 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data dprx_cc_0_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_0_dprx_cc_pll1.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &dprx_0_dprx_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_audio_clk_src[] = {
+	F(216000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(360000000, P_DPRX_0_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_audio_clk_src = {
+	.cmd_rcgr = 0x80c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_1,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_audio_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_audio_clk_src",
+		.parent_data = dprx_cc_0_parent_data_1,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg0_clk_src[] = {
+	F(220000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(440000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg0_clk_src = {
+	.cmd_rcgr = 0x8004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg0_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg2_clk_src[] = {
+	F(275000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(440000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(550000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg2_clk_src = {
+	.cmd_rcgr = 0x8068,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg2_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_0_dprx_cc_core_rcg3_clk_src[] = {
+	F(275000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(550000000, P_DPRX_0_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_0_dprx_cc_core_rcg3_clk_src = {
+	.cmd_rcgr = 0x8098,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_0_parent_map_0,
+	.freq_tbl = ftbl_dprx_0_dprx_cc_core_rcg3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_rcg3_clk_src",
+		.parent_data = dprx_cc_0_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_0_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_0_dprx_cc_core_ahb_div_clk_src = {
+	.reg = 0x80b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_0_dprx_cc_core_rcg3_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_0_dprx_cc_core_aud_div_clk_src = {
+	.reg = 0x80d0,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_0_dprx_cc_core_aud_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_0_dprx_cc_audio_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_ahb_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_aud_clk = {
+	.halt_reg = 0x80d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_aud_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_aud_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_mdp_mem_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8088,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_mdp_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_rcg2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_mmcx_xo_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_mmcx_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_0_dprx_cc_vid_mem_clk = {
+	.halt_reg = 0x8028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_0_dprx_cc_vid_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_0_dprx_cc_core_rcg0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *dprx_cc_0_nord_clocks[] = {
+	[DPRX_CC_AHB_CLK] = &dprx_0_dprx_cc_ahb_clk.clkr,
+	[DPRX_CC_AUD_CLK] = &dprx_0_dprx_cc_aud_clk.clkr,
+	[DPRX_CC_AUDIO_CLK_SRC] = &dprx_0_dprx_cc_audio_clk_src.clkr,
+	[DPRX_CC_CORE_AHB_DIV_CLK_SRC] = &dprx_0_dprx_cc_core_ahb_div_clk_src.clkr,
+	[DPRX_CC_CORE_AUD_DIV_CLK_SRC] = &dprx_0_dprx_cc_core_aud_div_clk_src.clkr,
+	[DPRX_CC_CORE_RCG0_CLK_SRC] = &dprx_0_dprx_cc_core_rcg0_clk_src.clkr,
+	[DPRX_CC_CORE_RCG2_CLK_SRC] = &dprx_0_dprx_cc_core_rcg2_clk_src.clkr,
+	[DPRX_CC_CORE_RCG3_CLK_SRC] = &dprx_0_dprx_cc_core_rcg3_clk_src.clkr,
+
+	[DPRX_CC_MDP_MEM_CLK] = &dprx_0_dprx_cc_mdp_mem_clk.clkr,
+	[DPRX_CC_MMCX_XO_CLK] = &dprx_0_dprx_cc_mmcx_xo_clk.clkr,
+	[DPRX_CC_PLL0] = &dprx_0_dprx_cc_pll0.clkr,
+	[DPRX_CC_PLL1] = &dprx_0_dprx_cc_pll1.clkr,
+	[DPRX_CC_VID_MEM_CLK] = &dprx_0_dprx_cc_vid_mem_clk.clkr,
+};
+
+static const struct qcom_reset_map dprx_cc_0_nord_resets[] = {
+	[DPRX_CC_DPRX_BLK_BCR] = { 0x8000 },
+};
+
+static struct clk_alpha_pll *dprx_cc_0_nord_plls[] = {
+	&dprx_0_dprx_cc_pll0,
+	&dprx_0_dprx_cc_pll1,
+};
+
+static const struct regmap_config dprx_cc_0_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8104,
+	.fast_io = true,
+};
+
+static void dprx_cc_0_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
+	 */
+	regmap_write(regmap, dprx_0_dprx_cc_core_aud_div_clk_src.reg, 0x13);
+	regmap_write(regmap, dprx_0_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
+}
+
+static const struct qcom_cc_driver_data dprx_cc_0_nord_driver_data = {
+	.alpha_plls = dprx_cc_0_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(dprx_cc_0_nord_plls),
+	.clk_regs_configure = dprx_cc_0_nord_regs_configure,
+};
+
+static const struct qcom_cc_desc dprx_cc_0_nord_desc = {
+	.config = &dprx_cc_0_nord_regmap_config,
+	.clks = dprx_cc_0_nord_clocks,
+	.num_clks = ARRAY_SIZE(dprx_cc_0_nord_clocks),
+	.resets = dprx_cc_0_nord_resets,
+	.num_resets = ARRAY_SIZE(dprx_cc_0_nord_resets),
+	.driver_data = &dprx_cc_0_nord_driver_data,
+};
+
+static const struct of_device_id dprx_cc_0_nord_match_table[] = {
+	{ .compatible = "qcom,nord-dprxcc0" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dprx_cc_0_nord_match_table);
+
+static int dprx_cc_0_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &dprx_cc_0_nord_desc);
+}
+
+static struct platform_driver dprx_cc_0_nord_driver = {
+	.probe = dprx_cc_0_nord_probe,
+	.driver = {
+		.name = "dprxcc0-nord",
+		.of_match_table = dprx_cc_0_nord_match_table,
+	},
+};
+
+module_platform_driver(dprx_cc_0_nord_driver);
+
+MODULE_DESCRIPTION("QTI DPRXCC0 NORD Driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/clk/qcom/dprxcc1-nord.c b/drivers/clk/qcom/dprxcc1-nord.c
new file mode 100644
index 0000000000000000000000000000000000000000..851a97c196c0ae3c022858bb18f62bf295199d68
--- /dev/null
+++ b/drivers/clk/qcom/dprxcc1-nord.c
@@ -0,0 +1,433 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,nord-dprxcc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_AHB_CLK,
+	DT_SLEEP_CLK,
+};
+
+enum {
+	P_BI_TCXO,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_EVEN,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN,
+	P_DPRX_1_DPRX_CC_PLL0_OUT_ODD,
+	P_DPRX_1_DPRX_CC_PLL1_OUT_EVEN,
+	P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco lucid_ole_vco[] = {
+	{ 249600000, 2300000000, 0 },
+};
+
+static const struct pll_vco zonda_ole_vco[] = {
+	{ 700000000, 3600000000, 0 },
+};
+
+/* 550.0 MHz Configuration */
+static const struct alpha_pll_config dprx_1_dprx_cc_pll0_config = {
+	.l = 0x1c,
+	.alpha = 0xa555,
+	.config_ctl_val = 0x20485699,
+	.config_ctl_hi_val = 0x00182261,
+	.config_ctl_hi1_val = 0x82aa299c,
+	.test_ctl_val = 0x00000000,
+	.test_ctl_hi_val = 0x00000003,
+	.test_ctl_hi1_val = 0x00009000,
+	.test_ctl_hi2_val = 0x00000034,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x00400005,
+};
+
+static struct clk_alpha_pll dprx_1_dprx_cc_pll0 = {
+	.offset = 0x0,
+	.config = &dprx_1_dprx_cc_pll0_config,
+	.vco_table = lucid_ole_vco,
+	.num_vco = ARRAY_SIZE(lucid_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_LUCID_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_pll0",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_lucid_evo_ops,
+		},
+	},
+};
+
+/* 1080.0 MHz Configuration */
+static const struct alpha_pll_config dprx_1_dprx_cc_pll1_config = {
+	.l = 0x38,
+	.alpha = 0x4000000,
+	.config_ctl_val = 0x08240800,
+	.config_ctl_hi_val = 0x05008001,
+	.config_ctl_hi1_val = 0x00000000,
+	.config_ctl_hi2_val = 0x00000000,
+	.user_ctl_val = 0x00000000,
+	.user_ctl_hi_val = 0x02000080,
+};
+
+static struct clk_alpha_pll dprx_1_dprx_cc_pll1 = {
+	.offset = 0x1000,
+	.alpha_width = 28,
+	.config = &dprx_1_dprx_cc_pll1_config,
+	.vco_table = zonda_ole_vco,
+	.num_vco = ARRAY_SIZE(zonda_ole_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_ZONDA_OLE],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_pll1",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_zonda_ole_ops,
+		},
+	},
+};
+
+static const struct parent_map dprx_cc_1_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_EVEN, 1 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_ODD, 2 },
+	{ P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 4 },
+	{ P_SLEEP_CLK, 5 },
+};
+
+static const struct clk_parent_data dprx_cc_1_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .hw = &dprx_1_dprx_cc_pll0.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+};
+
+static const struct parent_map dprx_cc_1_parent_map_1[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_DPRX_1_DPRX_CC_PLL1_OUT_EVEN, 3 },
+	{ P_SLEEP_CLK, 5 },
+	{ P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 6 },
+};
+
+static const struct clk_parent_data dprx_cc_1_parent_data_1[] = {
+	{ .index = DT_BI_TCXO },
+	{ .hw = &dprx_1_dprx_cc_pll1.clkr.hw },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &dprx_1_dprx_cc_pll1.clkr.hw },
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_audio_clk_src[] = {
+	F(216000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(300000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	F(360000000, P_DPRX_1_DPRX_CC_PLL1_OUT_MAIN, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_audio_clk_src = {
+	.cmd_rcgr = 0x80c8,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_1,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_audio_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_audio_clk_src",
+		.parent_data = dprx_cc_1_parent_data_1,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_1),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg0_clk_src[] = {
+	F(220000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(440000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg0_clk_src = {
+	.cmd_rcgr = 0x8004,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg0_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg2_clk_src[] = {
+	F(275000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(440000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2.5, 0, 0),
+	F(550000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg2_clk_src = {
+	.cmd_rcgr = 0x8068,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg2_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg2_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_dprx_1_dprx_cc_core_rcg3_clk_src[] = {
+	F(275000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	F(550000000, P_DPRX_1_DPRX_CC_PLL0_OUT_MAIN, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 dprx_1_dprx_cc_core_rcg3_clk_src = {
+	.cmd_rcgr = 0x8098,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = dprx_cc_1_parent_map_0,
+	.freq_tbl = ftbl_dprx_1_dprx_cc_core_rcg3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_rcg3_clk_src",
+		.parent_data = dprx_cc_1_parent_data_0,
+		.num_parents = ARRAY_SIZE(dprx_cc_1_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_1_dprx_cc_core_ahb_div_clk_src = {
+	.reg = 0x80b0,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_ahb_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_1_dprx_cc_core_rcg3_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_regmap_div dprx_1_dprx_cc_core_aud_div_clk_src = {
+	.reg = 0x80d0,
+	.shift = 0,
+	.width = 9,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "dprx_1_dprx_cc_core_aud_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&dprx_1_dprx_cc_audio_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_ahb_clk = {
+	.halt_reg = 0x80b4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80b4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80b4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_ahb_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_ahb_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_aud_clk = {
+	.halt_reg = 0x80d4,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d4,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_aud_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_aud_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_mdp_mem_clk = {
+	.halt_reg = 0x8088,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8088,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8088,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_mdp_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_rcg2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_mmcx_xo_clk = {
+	.halt_reg = 0x80d8,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x80d8,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x80d8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_mmcx_xo_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch dprx_1_dprx_cc_vid_mem_clk = {
+	.halt_reg = 0x8028,
+	.halt_check = BRANCH_HALT_VOTED,
+	.hwcg_reg = 0x8028,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x8028,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "dprx_1_dprx_cc_vid_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&dprx_1_dprx_cc_core_rcg0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_regmap *dprx_cc_1_nord_clocks[] = {
+	[DPRX_CC_AHB_CLK] = &dprx_1_dprx_cc_ahb_clk.clkr,
+	[DPRX_CC_AUD_CLK] = &dprx_1_dprx_cc_aud_clk.clkr,
+	[DPRX_CC_AUDIO_CLK_SRC] = &dprx_1_dprx_cc_audio_clk_src.clkr,
+	[DPRX_CC_CORE_AHB_DIV_CLK_SRC] = &dprx_1_dprx_cc_core_ahb_div_clk_src.clkr,
+	[DPRX_CC_CORE_AUD_DIV_CLK_SRC] = &dprx_1_dprx_cc_core_aud_div_clk_src.clkr,
+	[DPRX_CC_CORE_RCG0_CLK_SRC] = &dprx_1_dprx_cc_core_rcg0_clk_src.clkr,
+	[DPRX_CC_CORE_RCG2_CLK_SRC] = &dprx_1_dprx_cc_core_rcg2_clk_src.clkr,
+	[DPRX_CC_CORE_RCG3_CLK_SRC] = &dprx_1_dprx_cc_core_rcg3_clk_src.clkr,
+	[DPRX_CC_MDP_MEM_CLK] = &dprx_1_dprx_cc_mdp_mem_clk.clkr,
+	[DPRX_CC_MMCX_XO_CLK] = &dprx_1_dprx_cc_mmcx_xo_clk.clkr,
+	[DPRX_CC_PLL0] = &dprx_1_dprx_cc_pll0.clkr,
+	[DPRX_CC_PLL1] = &dprx_1_dprx_cc_pll1.clkr,
+	[DPRX_CC_VID_MEM_CLK] = &dprx_1_dprx_cc_vid_mem_clk.clkr,
+};
+
+static const struct qcom_reset_map dprx_cc_1_nord_resets[] = {
+	[DPRX_CC_DPRX_BLK_BCR] = { 0x8000 },
+};
+
+static struct clk_alpha_pll *dprx_cc_1_nord_plls[] = {
+	&dprx_1_dprx_cc_pll0,
+	&dprx_1_dprx_cc_pll1,
+};
+
+static const struct regmap_config dprx_cc_1_nord_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x8104,
+	.fast_io = true,
+};
+
+static void dprx_cc_1_nord_regs_configure(struct device *dev, struct regmap *regmap)
+{
+	/*
+	 * Configure cdiv 20 for core aud and 11 for core ahb clks of DPRX CC
+	 */
+	regmap_write(regmap, dprx_1_dprx_cc_core_aud_div_clk_src.reg, 0x13);
+	regmap_write(regmap, dprx_1_dprx_cc_core_ahb_div_clk_src.reg, 0x0A);
+}
+
+static const struct qcom_cc_driver_data dprx_cc_1_nord_driver_data = {
+	.alpha_plls = dprx_cc_1_nord_plls,
+	.num_alpha_plls = ARRAY_SIZE(dprx_cc_1_nord_plls),
+	.clk_regs_configure = dprx_cc_1_nord_regs_configure,
+};
+
+static const struct qcom_cc_desc dprx_cc_1_nord_desc = {
+	.config = &dprx_cc_1_nord_regmap_config,
+	.clks = dprx_cc_1_nord_clocks,
+	.num_clks = ARRAY_SIZE(dprx_cc_1_nord_clocks),
+	.resets = dprx_cc_1_nord_resets,
+	.num_resets = ARRAY_SIZE(dprx_cc_1_nord_resets),
+	.driver_data = &dprx_cc_1_nord_driver_data,
+};
+
+static const struct of_device_id dprx_cc_1_nord_match_table[] = {
+	{ .compatible = "qcom,nord-dprxcc1" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, dprx_cc_1_nord_match_table);
+
+static int dprx_cc_1_nord_probe(struct platform_device *pdev)
+{
+	return qcom_cc_probe(pdev, &dprx_cc_1_nord_desc);
+}
+
+static struct platform_driver dprx_cc_1_nord_driver = {
+	.probe = dprx_cc_1_nord_probe,
+	.driver = {
+		.name = "dprxcc1-nord",
+		.of_match_table = dprx_cc_1_nord_match_table,
+	},
+};
+
+module_platform_driver(dprx_cc_1_nord_driver);
+
+MODULE_DESCRIPTION("QTI DPRXCC1 NORD Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

