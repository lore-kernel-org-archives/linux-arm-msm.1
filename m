Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A4A4F799F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821591; cv=none; b=poazGNM3w82P0DYWmKfw8DInPPRP+mMn8mixOM62uh0Eep/fzEoFt0O2vysrDsF6tux1DfuWFX/36jvsirMvyaf1rVY1spL4QZH6YE8Hbv+cuINT8vO2DEtnhZlXSDILN/vhAEc5XE8AXPuzANSngeAVNsi8VnZKycLvHjeT7hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821591; c=relaxed/simple;
	bh=j+2BHQVx5onlBhErVYUc5Q/Hf+TE+/1robKwC5jGzYA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sc3lyw2xGWTksJfsb6vHSaUtwiTOM2JQe8oqtI92ZlvSVsxzV563epuSgaYccyGuHZohA3mGKGzM5n94FhFzPs23DhI9JRteWRAnmPaUorhTvd5e7cvhoFdcV+FgZ48sp0z9+JU6Z6tCCIHmJaYx96y0j8zmBxyDFiQJJ5KH9Z8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nxLylC4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDT7TKxr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nxLylC4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDT7TKxr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66NF4Pmb1323756
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:46:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5MuiAkJ6z97LMD4V5PsvwODJ3hAoZDWzkVAx6z2aaTg=; b=nxLylC4vSMrBhRIQ
	w5eKJ0XiNLJFYmor42AUc8qbv8tHzN8T6o1mhA8wixp5uTi/c6B9F+3qC/KI0oPU
	1p61GNCwZYW/DXO1mt4gkn6uJ6DNC8dglpkP8oYxHqMSQEWAn2Cn6W+Mbxj8nboq
	4+5rUoNV4aqGmI7pb0bjGDyTOYUuBA/CJxzLVq6I5zbgiCpnlfpuBW6ELI9eQHgo
	8I7iBX/pGHDetaK49MXlurzmMSesaN+s1uBsvxCzNMgAinuW/UKJjZ2t2BkbYmg0
	vZ7u3MKGO5tAu+3iyIpLDBsSNK1AybJOvHziDG+567Rs1NX/Nye65bTazJCCMBAX
	LwE6JA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkn9a08uy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 15:46:24 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc88e22f92so19968355ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 08:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784821584; x=1785426384; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5MuiAkJ6z97LMD4V5PsvwODJ3hAoZDWzkVAx6z2aaTg=;
        b=TDT7TKxrnpf9Y2kUthjI4Ol4llqzhJ5f0vg5Jz6BGIOR4mLXpu8tC+Kxo0AlDZnYxi
         zCutUfJmozuHKqT8OcFpi4H6mVtjE7DstkPvOuSPw/O/FQWfRq4N/cCQX9EocemAynRT
         1pec+UEcbzGbu5TRXXFOM/fs1M1/nqcwDBg6vQwR10MyVhuvxL77cyEvttb87SgfypTo
         muhqittgWj/jK5s6ZntZaNE86kaYSnTCYw2rQ97n+WfqAn32BgFFKWKQX9c+jtarrd0A
         H+WSmPigXHaFUJVQzWKInXV+iH97yF2GsV2Ef9eu6g73kpst1HSV3tHXboUTw1NZukkh
         Dq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821584; x=1785426384;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5MuiAkJ6z97LMD4V5PsvwODJ3hAoZDWzkVAx6z2aaTg=;
        b=MW7ed/RvxP6Ar7R9uR06wAM9s2f6X+QzBq6IzJpoBJe9vXZ7QmtIPuiD6O3/5n6rj7
         KtnJ4EpVzLZ2bInsvHClVBbDAEai22lpHMtBwqajsEusEHsjA+QQRy+JO/gqVxKN+QLd
         nouoSWL2QgNW2z2FqHshb2r3GQjEd5eWi42b9Cb2WMca0ifBgI6GR2IwBrXOjv5WXpKH
         XCrk2nxaHcBQvRiGCrwavON4Weq98egjzq6RXMicmsxNq2a65FvbpRoR7Mxy5a9wl1+e
         34jZtUU5DVGOw3T3oWQCbgsZDCJ6hdRBqWFy594VuhcqnpYSDXacffjSLBZQ7wiLR8JU
         mVRA==
X-Forwarded-Encrypted: i=1; AHgh+RppeTK2D9EoscHPN/wAe8g+GdS4do71fK5RSP4A/iAutb/rn8wtlsFaAXT8LPSiXdQuSqeH9JovTwwlqKZT@vger.kernel.org
X-Gm-Message-State: AOJu0YyxTRFpi5+oy1UodPsUIauuRgEU6VCAzHFZBHuM3+Ne8eotlLpA
	IO3ZdlLDWYPc4qUZZxWzjq4MdF5tuB/nTJhqL9xHMUNShjWQ3cYGsDz4h8iTYiWMmUs7Q2YN/5b
	oS/AJ4l3k6RxTpHwFc3O11cc4vRMT6UnBAj3JClM2rF3Gwtv5CjFjFb7EVp06Lpdm+YHg
X-Gm-Gg: AR+sD10LxKoMmWaMfxmd2z1v/kpOsZEuiUB8nQA6Tb5/lltWJ0lfMlYuB5GVeLsULcF
	5Qg9d5K4m3Ijj6iIwRNWS+8vf5T7vUmvMZfgD7jTls873iWLbx5y7zL7nHcOGiau+qJbF1Kp43B
	6XrjyB5ChtzOlAmG17U1R+yb8fo0tbI4WmoafYhOz+Xuse3QZeArAFQk4zyxO66ysqbkv2kS1Vg
	tmGIHtaO6coTV+tE7afOaWcMihk2LLPxHstYVGBlC5rjhnJZ5xCoZ75EzG+HpvjRB4LOnznYlQe
	mCio7VovkXB4NQCB70YSU1v0HFK5XdQjiGukdDLpjH5XVjetnBCgj6qU9mODsfKyOvGLnHivnp3
	RO8v/fGGz+pchGaSL0dJlIoAQoECD/Oc=
X-Received: by 2002:a17:902:e54b:b0:2cf:7d44:e14f with SMTP id d9443c01a7336-2cfa748ceb0mr46534715ad.26.1784821583475;
        Thu, 23 Jul 2026 08:46:23 -0700 (PDT)
X-Received: by 2002:a17:902:e54b:b0:2cf:7d44:e14f with SMTP id d9443c01a7336-2cfa748ceb0mr46534045ad.26.1784821582827;
        Thu, 23 Jul 2026 08:46:22 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efd7157sm36242625ad.18.2026.07.23.08.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:46:22 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Thu, 23 Jul 2026 21:15:52 +0530
Subject: [PATCH v3 3/4] clk: qcom: Add Audio Core clock controller support
 on Qualcomm Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-shikra-audiocorecc-v3-3-90b878ae0d4e@oss.qualcomm.com>
References: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
In-Reply-To: <20260723-shikra-audiocorecc-v3-0-90b878ae0d4e@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX073NSLJk7pJf
 HlSG7KX+cHkn4/R8vuTtrRp244Wmo8UyFYm3CrqBZyRdx9NkcmbkbyNGH57exYROad9sAVGVeOE
 2jRZ8YFwZj9zC6Rp4uRmpk4RMcat9X+bDToGYPPkk/fLOzzoz77rME5EL48n69Bwbr8Jia8S1C9
 2PipKOC9IdkJx05HkdN/ZhVagnTxbmN8IFRgpxCIaXhicT2m2vWBPeZoIaNq1dDLjWUL+D3L0Nb
 dQBUQEVkcbfPdXj3X9aN52YOUyokmlUrbj1FS/vaHj2esq99B/GCIo3DQEnHRlUFR73BbYtELPr
 ni9vLuIz83MyXKiyLFctAXTjieCKnD5DG9+9qyHQKih11+DM8B/rbvgJthlff23NImXz+f7PlzY
 oDAwjXFwlFp+KG4w3jhzezYa7xlwUeSArnroBZvVdUg93AprwKMDI8Q/I95K5N4G0UCr8bxP3UB
 +am15fJi7am8kKTSAMg==
X-Proofpoint-ORIG-GUID: dRCsRHvo4hAGVynRPbzJaNi0mVxeD3AC
X-Proofpoint-GUID: dRCsRHvo4hAGVynRPbzJaNi0mVxeD3AC
X-Authority-Analysis: v=2.4 cv=WOdPmHsR c=1 sm=1 tr=0 ts=6a623750 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=F_syqbkkfc-CeLG8pkkA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDE1NSBTYWx0ZWRfX8SyrgLgae07x
 Q5GCBcz6ou5FhqcMx+mtmPlPTmcWzPNK4G++Hp2HFteg3U/g9QTPZ/5IQCtWfPo+JtRoDKolQgE
 A0hwbCR/XImNnH8hk0MA0+wO1fnoC7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230155

Add support for Audio Core Clock Controller (AUDIOCORECC) and Audio Core
CSR resets on Qualcomm Shikra SoC.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/Kconfig              |  10 +
 drivers/clk/qcom/Makefile             |   1 +
 drivers/clk/qcom/audiocorecc-shikra.c | 809 ++++++++++++++++++++++++++++++++++
 3 files changed, 820 insertions(+)

diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
index 63f271aff1771bea0885fb753dd28d02fd7d4ab6..29ae37ece3141438d6fb8162cc7ad3a361c5323c 100644
--- a/drivers/clk/qcom/Kconfig
+++ b/drivers/clk/qcom/Kconfig
@@ -192,6 +192,16 @@ config CLK_NORD_GCC
 	  SPI, I2C, USB, SD/UFS, PCIe etc. The clock controller is a combination
 	  of GCC, SE_GCC, NE_GCC and NW_GCC.
 
+config CLK_SHIKRA_AUDIOCORECC
+	tristate "Shikra Audio Core Clock Controller"
+	depends on ARM64 || COMPILE_TEST
+	select CLK_SHIKRA_GCC
+	default m if ARCH_QCOM
+	help
+	  Support for the Audio Core clock controller on Qualcomm Shikra devices.
+	  Say Y if you want to use AudioCoreCC clocks required to support audio
+	  devices and it's functionality.
+
 config CLK_SHIKRA_GCC
 	tristate "Shikra Global Clock Controller"
 	depends on ARM64 || COMPILE_TEST
diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
index db7689ee5dc63bc8b7d12b8222188bc1e1ff78ba..f26a79658bb88c957f990d76d295a5a9a09bb7ee 100644
--- a/drivers/clk/qcom/Makefile
+++ b/drivers/clk/qcom/Makefile
@@ -42,6 +42,7 @@ obj-$(CONFIG_CLK_KAANAPALI_TCSRCC) += tcsrcc-kaanapali.o
 obj-$(CONFIG_CLK_KAANAPALI_VIDEOCC) += videocc-kaanapali.o
 obj-$(CONFIG_CLK_NORD_GCC) += gcc-nord.o negcc-nord.o nwgcc-nord.o segcc-nord.o
 obj-$(CONFIG_CLK_NORD_TCSRCC) += tcsrcc-nord.o
+obj-$(CONFIG_CLK_SHIKRA_AUDIOCORECC) += audiocorecc-shikra.o
 obj-$(CONFIG_CLK_SHIKRA_GCC) += gcc-shikra.o
 obj-$(CONFIG_CLK_X1E80100_CAMCC) += camcc-x1e80100.o
 obj-$(CONFIG_CLK_X1E80100_DISPCC) += dispcc-x1e80100.o
diff --git a/drivers/clk/qcom/audiocorecc-shikra.c b/drivers/clk/qcom/audiocorecc-shikra.c
new file mode 100644
index 0000000000000000000000000000000000000000..76017240f7684da5e2fc5b8ab7ec2d3a3793da56
--- /dev/null
+++ b/drivers/clk/qcom/audiocorecc-shikra.c
@@ -0,0 +1,809 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/qcom,shikra-audiocorecc.h>
+
+#include "clk-alpha-pll.h"
+#include "clk-branch.h"
+#include "clk-pll.h"
+#include "clk-rcg.h"
+#include "clk-regmap.h"
+#include "clk-regmap-divider.h"
+#include "clk-regmap-mux.h"
+#include "common.h"
+#include "reset.h"
+
+enum {
+	DT_BI_TCXO,
+	DT_SLEEP_CLK,
+	DT_AUD_REF_CLK_SRC,
+};
+
+enum {
+	P_AUD_REF_CLK_SRC,
+	P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX,
+	P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2,
+	P_BI_TCXO,
+	P_SLEEP_CLK,
+};
+
+static const struct pll_vco spark_vco[] = {
+	{ 500000000, 1000000000, 2 },
+};
+
+/* 614.4 MHz Configuration */
+static const struct alpha_pll_config audio_core_cc_dig_pll_config = {
+	.l = 0x20,
+	.alpha = 0x0,
+	.vco_val = BIT(21),
+	.post_div_val = 0x28100,
+	.post_div_mask = GENMASK(17, 8),
+	.vco_mask = GENMASK(21, 20),
+	.main_output_mask = BIT(0),
+	.aux_output_mask = BIT(1),
+	.aux2_output_mask = BIT(2),
+	.config_ctl_val = 0x4001055b,
+	.test_ctl_hi_val = 0x1,
+	.test_ctl_hi_mask = 0x1,
+};
+
+static struct clk_alpha_pll audio_core_cc_dig_pll = {
+	.offset = 0x0,
+	.config = &audio_core_cc_dig_pll_config,
+	.vco_table = spark_vco,
+	.num_vco = ARRAY_SIZE(spark_vco),
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_dig_pll",
+			.parent_data = &(const struct clk_parent_data) {
+				.index = DT_BI_TCXO,
+			},
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_fixed_ops,
+		},
+	},
+};
+
+static struct clk_fixed_factor audio_core_cc_dig_pll_out_aux = {
+	.mult = 1,
+	.div = 5,
+	.hw.init = &(struct clk_init_data) {
+		.name = "audio_core_cc_dig_pll_out_aux",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &audio_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_fixed_factor audio_core_cc_dig_pll_out_aux2 = {
+	.mult = 1,
+	.div = 2,
+	.hw.init = &(struct clk_init_data) {
+		.name = "audio_core_cc_dig_pll_out_aux2",
+		.parent_data = &(const struct clk_parent_data) {
+			.hw = &audio_core_cc_dig_pll.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static const struct parent_map audio_core_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_AUD_REF_CLK_SRC, 1 },
+	{ P_SLEEP_CLK, 2 },
+	{ P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 4 },
+	{ P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 6 },
+};
+
+static const struct clk_parent_data audio_core_cc_parent_data_0[] = {
+	{ .index = DT_BI_TCXO },
+	{ .index = DT_AUD_REF_CLK_SRC },
+	{ .index = DT_SLEEP_CLK },
+	{ .hw = &audio_core_cc_dig_pll_out_aux.hw },
+	{ .hw = &audio_core_cc_dig_pll_out_aux2.hw },
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aif_if0_clk_src[] = {
+	F(240000, P_BI_TCXO, 10, 1, 8),
+	F(256000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 32),
+	F(512000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 16),
+	F(768000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 16),
+	F(1024000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 8),
+	F(1536000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 8),
+	F(2048000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 4),
+	F(3072000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 4),
+	F(4096000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 2),
+	F(6144000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 2),
+	F(8192000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(12288000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if0_clk_src = {
+	.cmd_rcgr = 0x104c,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if0_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if1_clk_src = {
+	.cmd_rcgr = 0x10b0,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if1_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if2_clk_src = {
+	.cmd_rcgr = 0x1114,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if2_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aif_if3_clk_src[] = {
+	F(240000, P_BI_TCXO, 10, 1, 8),
+	F(256000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 32),
+	F(512000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 16),
+	F(768000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 16),
+	F(1024000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 8),
+	F(1536000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 8),
+	F(2048000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 4),
+	F(3072000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 4),
+	F(4096000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 1, 2),
+	F(6144000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 1, 2),
+	F(8192000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 15, 0, 0),
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(12288000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 10, 0, 0),
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	F(49152000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 2.5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aif_if3_clk_src = {
+	.cmd_rcgr = 0x1178,
+	.mnd_width = 16,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if3_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aif_if3_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_aud_dma_clk_src[] = {
+	F(38400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 8, 0, 0),
+	F(102400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 3, 0, 0),
+	F(153600000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 2, 0, 0),
+	F(307200000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 1, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_aud_dma_clk_src = {
+	.cmd_rcgr = 0x1028,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aud_dma_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_aud_dma_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_bus_clk_src[] = {
+	F(38400000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 8, 0, 0),
+	F(76800000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX2, 4, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_bus_clk_src = {
+	.cmd_rcgr = 0x1008,
+	.mnd_width = 0,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_bus_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_bus_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_ext_mclka_clk_src = {
+	.cmd_rcgr = 0x123c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_ext_mclka_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_rcg2 audio_core_cc_ext_mclkb_clk_src = {
+	.cmd_rcgr = 0x125c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_aif_if0_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_ext_mclkb_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_lpaif_pcmoe_clk_src[] = {
+	F(9600000, P_BI_TCXO, 2, 0, 0),
+	F(15360000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 8, 0, 0),
+	F(30720000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 4, 0, 0),
+	F(61440000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 2, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_lpaif_pcmoe_clk_src = {
+	.cmd_rcgr = 0x12ac,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_lpaif_pcmoe_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_lpaif_pcmoe_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static const struct freq_tbl ftbl_audio_core_cc_tx_mclk_rcg_clk_src[] = {
+	F(19200000, P_BI_TCXO, 1, 0, 0),
+	F(24576000, P_AUDIO_CORE_CC_DIG_PLL_OUT_AUX, 5, 0, 0),
+	{ }
+};
+
+static struct clk_rcg2 audio_core_cc_tx_mclk_rcg_clk_src = {
+	.cmd_rcgr = 0x127c,
+	.mnd_width = 8,
+	.hid_width = 5,
+	.parent_map = audio_core_cc_parent_map_0,
+	.freq_tbl = ftbl_audio_core_cc_tx_mclk_rcg_clk_src,
+	.hw_clk_ctrl = true,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_tx_mclk_rcg_clk_src",
+		.parent_data = audio_core_cc_parent_data_0,
+		.num_parents = ARRAY_SIZE(audio_core_cc_parent_data_0),
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_rcg2_shared_ops,
+	},
+};
+
+static struct clk_regmap_div audio_core_cc_cdiv_tx_mclk_div_clk_src = {
+	.reg = 0x129c,
+	.shift = 0,
+	.width = 4,
+	.clkr.hw.init = &(const struct clk_init_data) {
+		.name = "audio_core_cc_cdiv_tx_mclk_div_clk_src",
+		.parent_hws = (const struct clk_hw*[]) {
+			&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+		},
+		.num_parents = 1,
+		.flags = CLK_SET_RATE_PARENT,
+		.ops = &clk_regmap_div_ro_ops,
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if0_ebit_clk = {
+	.halt_reg = 0x1068,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1068,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if0_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if0_ibit_clk = {
+	.halt_reg = 0x1064,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1064,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if0_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if0_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if1_ebit_clk = {
+	.halt_reg = 0x10cc,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x10cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if1_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if1_ibit_clk = {
+	.halt_reg = 0x10c8,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x10c8,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if1_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if1_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if2_ebit_clk = {
+	.halt_reg = 0x1130,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1130,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if2_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if2_ibit_clk = {
+	.halt_reg = 0x112c,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x112c,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if2_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if2_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if3_ebit_clk = {
+	.halt_reg = 0x1194,
+	.halt_check = BRANCH_HALT_DELAY,
+	.clkr = {
+		.enable_reg = 0x1194,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if3_ebit_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aif_if3_ibit_clk = {
+	.halt_reg = 0x1190,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1190,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aif_if3_ibit_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aif_if3_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aud_dma_clk = {
+	.halt_reg = 0x1040,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1040,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1040,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aud_dma_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aud_dma_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_aud_dma_mem_clk = {
+	.halt_reg = 0x1044,
+	.halt_check = BRANCH_HALT,
+	.hwcg_reg = 0x1044,
+	.hwcg_bit = 1,
+	.clkr = {
+		.enable_reg = 0x1044,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_aud_dma_mem_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_aud_dma_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_bus_clk = {
+	.halt_reg = 0x1020,
+	.halt_check = BRANCH_HALT_VOTED,
+	.clkr = {
+		.enable_reg = 0x1020,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_bus_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_bus_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_aon_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_ext_mclka_out_clk = {
+	.halt_reg = 0x1254,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1254,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_ext_mclka_out_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_ext_mclka_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_ext_mclkb_out_clk = {
+	.halt_reg = 0x1274,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1274,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_ext_mclkb_out_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_ext_mclkb_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_im_sleep_clk = {
+	.halt_reg = 0x12cc,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12cc,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_im_sleep_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_lpaif_pcmoe_clk = {
+	.halt_reg = 0x12c4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12c4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_lpaif_pcmoe_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_lpaif_pcmoe_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_rx_mclk_2x_clk = {
+	.halt_reg = 0x1298,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1298,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_rx_mclk_2x_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_rx_mclk_clk = {
+	.halt_reg = 0x12a4,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12a4,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_rx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_sampling_clk = {
+	.halt_reg = 0x1000,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1000,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_sampling_clk",
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_tx_mclk_2x_clk = {
+	.halt_reg = 0x1294,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x1294,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_tx_mclk_2x_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_tx_mclk_rcg_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_branch audio_core_cc_tx_mclk_clk = {
+	.halt_reg = 0x12a0,
+	.halt_check = BRANCH_HALT,
+	.clkr = {
+		.enable_reg = 0x12a0,
+		.enable_mask = BIT(0),
+		.hw.init = &(const struct clk_init_data) {
+			.name = "audio_core_cc_tx_mclk_clk",
+			.parent_hws = (const struct clk_hw*[]) {
+				&audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr.hw,
+			},
+			.num_parents = 1,
+			.flags = CLK_SET_RATE_PARENT,
+			.ops = &clk_branch2_ops,
+		},
+	},
+};
+
+static struct clk_hw *audio_core_cc_shikra_hws[] = {
+	[AUDIO_CORE_CC_DIG_PLL_OUT_AUX] = &audio_core_cc_dig_pll_out_aux.hw,
+	[AUDIO_CORE_CC_DIG_PLL_OUT_AUX2] = &audio_core_cc_dig_pll_out_aux2.hw,
+};
+
+static struct clk_regmap *audio_core_cc_shikra_clocks[] = {
+	[AUDIO_CORE_CC_AIF_IF0_CLK_SRC] = &audio_core_cc_aif_if0_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF0_EBIT_CLK] = &audio_core_cc_aif_if0_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF0_IBIT_CLK] = &audio_core_cc_aif_if0_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_CLK_SRC] = &audio_core_cc_aif_if1_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_EBIT_CLK] = &audio_core_cc_aif_if1_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF1_IBIT_CLK] = &audio_core_cc_aif_if1_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_CLK_SRC] = &audio_core_cc_aif_if2_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_EBIT_CLK] = &audio_core_cc_aif_if2_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF2_IBIT_CLK] = &audio_core_cc_aif_if2_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_CLK_SRC] = &audio_core_cc_aif_if3_clk_src.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_EBIT_CLK] = &audio_core_cc_aif_if3_ebit_clk.clkr,
+	[AUDIO_CORE_CC_AIF_IF3_IBIT_CLK] = &audio_core_cc_aif_if3_ibit_clk.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_CLK] = &audio_core_cc_aud_dma_clk.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_CLK_SRC] = &audio_core_cc_aud_dma_clk_src.clkr,
+	[AUDIO_CORE_CC_AUD_DMA_MEM_CLK] = &audio_core_cc_aud_dma_mem_clk.clkr,
+	[AUDIO_CORE_CC_BUS_CLK] = &audio_core_cc_bus_clk.clkr,
+	[AUDIO_CORE_CC_BUS_CLK_SRC] = &audio_core_cc_bus_clk_src.clkr,
+	[AUDIO_CORE_CC_CDIV_TX_MCLK_DIV_CLK_SRC] = &audio_core_cc_cdiv_tx_mclk_div_clk_src.clkr,
+	[AUDIO_CORE_CC_DIG_PLL] = &audio_core_cc_dig_pll.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKA_CLK_SRC] = &audio_core_cc_ext_mclka_clk_src.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKA_OUT_CLK] = &audio_core_cc_ext_mclka_out_clk.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKB_CLK_SRC] = &audio_core_cc_ext_mclkb_clk_src.clkr,
+	[AUDIO_CORE_CC_EXT_MCLKB_OUT_CLK] = &audio_core_cc_ext_mclkb_out_clk.clkr,
+	[AUDIO_CORE_CC_IM_SLEEP_CLK] = &audio_core_cc_im_sleep_clk.clkr,
+	[AUDIO_CORE_CC_LPAIF_PCMOE_CLK] = &audio_core_cc_lpaif_pcmoe_clk.clkr,
+	[AUDIO_CORE_CC_LPAIF_PCMOE_CLK_SRC] = &audio_core_cc_lpaif_pcmoe_clk_src.clkr,
+	[AUDIO_CORE_CC_RX_MCLK_2X_CLK] = &audio_core_cc_rx_mclk_2x_clk.clkr,
+	[AUDIO_CORE_CC_RX_MCLK_CLK] = &audio_core_cc_rx_mclk_clk.clkr,
+	[AUDIO_CORE_CC_SAMPLING_CLK] = &audio_core_cc_sampling_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_2X_CLK] = &audio_core_cc_tx_mclk_2x_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_CLK] = &audio_core_cc_tx_mclk_clk.clkr,
+	[AUDIO_CORE_CC_TX_MCLK_RCG_CLK_SRC] = &audio_core_cc_tx_mclk_rcg_clk_src.clkr,
+};
+
+static struct clk_alpha_pll *audio_core_cc_shikra_plls[] = {
+	&audio_core_cc_dig_pll,
+};
+
+static const struct qcom_cc_driver_data audio_core_cc_shikra_driver_data = {
+	.alpha_plls = audio_core_cc_shikra_plls,
+	.num_alpha_plls = ARRAY_SIZE(audio_core_cc_shikra_plls),
+};
+
+static const struct regmap_config audio_core_cc_shikra_regmap_config = {
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.max_register = 0x305c,
+	.fast_io = true,
+};
+
+static const struct qcom_reset_map audio_core_csr_shikra_resets[] = {
+	[AUDIO_CORE_CSR_RX_SWR_CGCR] = { 0x1c, 1 },
+	[AUDIO_CORE_CSR_TX_SWR_CGCR] = { 0x30, 1 },
+};
+
+static const struct regmap_config audio_core_csr_shikra_regmap_config = {
+	.name = "audio_core_cc_shikra_reset",
+	.reg_bits = 32,
+	.reg_stride = 4,
+	.val_bits = 32,
+	.fast_io = true,
+	.max_register = 0x34,
+};
+
+static const struct qcom_cc_desc audio_core_csr_shikra_desc = {
+	.config = &audio_core_csr_shikra_regmap_config,
+	.resets = audio_core_csr_shikra_resets,
+	.num_resets = ARRAY_SIZE(audio_core_csr_shikra_resets),
+};
+
+static const struct qcom_cc_desc audio_core_cc_shikra_desc = {
+	.config = &audio_core_cc_shikra_regmap_config,
+	.clk_hws = audio_core_cc_shikra_hws,
+	.num_clk_hws = ARRAY_SIZE(audio_core_cc_shikra_hws),
+	.clks = audio_core_cc_shikra_clocks,
+	.num_clks = ARRAY_SIZE(audio_core_cc_shikra_clocks),
+	.driver_data = &audio_core_cc_shikra_driver_data,
+};
+
+static const struct of_device_id audio_core_cc_shikra_match_table[] = {
+	{ .compatible = "qcom,shikra-audiocorecc", .data = &audio_core_cc_shikra_desc },
+	{ .compatible = "qcom,shikra-audiocore-csr", .data = &audio_core_csr_shikra_desc },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, audio_core_cc_shikra_match_table);
+
+static int audio_core_cc_shikra_probe(struct platform_device *pdev)
+{
+	const struct qcom_cc_desc *desc;
+
+	desc = device_get_match_data(&pdev->dev);
+
+	return qcom_cc_probe(pdev, desc);
+}
+
+static struct platform_driver audio_core_cc_shikra_driver = {
+	.probe = audio_core_cc_shikra_probe,
+	.driver = {
+		.name = "audiocorecc-shikra",
+		.of_match_table = audio_core_cc_shikra_match_table,
+	},
+};
+
+module_platform_driver(audio_core_cc_shikra_driver);
+
+MODULE_DESCRIPTION("QTI AUDIOCORECC Shikra Driver");
+MODULE_LICENSE("GPL");

-- 
2.34.1

