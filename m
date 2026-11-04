Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778391;
	b=zfXarorPJ844FRuJAW8ceASstxe5r1Iyy+mazWm3dXnTPJxl0P8c15fEK61PzjDLJ91M
	 hf2JnAUNf04dXErhJvaGQ3BlgCxtKNu65IIT+ENltnJDE0psdnD44SYSLBZBJtWZ0wET3
	 gapBzZADXftEe5EOoT/Ir5Q8/3NnxEvu3ta1SEGa+aUlJd953T/EZ7CNhf6wglAGNw4Nr
	 Aoj2cpIyt9ITpr8tl7B42zLjnyJPV0CQ9rGc5y1WauRAq8xMh+h5GApN8Sxdtpo8xvq5q
	 yBkG0KlG9z6//+70tWlmDJe0vUEx06ufrXo2mcgbnmdjc82tpuZaFIw+s1f1F1JTrwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778391;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=m52jieKKqnBv5GroLvKWf1SFv6SUy0rMYAbEKd7OWTU=;
	b=qApC8mHj3sXafNM2vFzH3XbCOx/O9LKZr7PBPgeTYCXlMHhoAKNDejfdeszeCtqs0ch3
	 UJKaWOa2x4PYpdpTY6Fk0+L/qPybP8RJQkLCNG0fR2rgyMK3l14XoBrxrjMHy6Z2eKhOY
	 5h4wxfs791pxmANO94HOHAvdFeeKxyPsypi/7WoOINkwO8tSh6Xs0kKS/x17PiIAk5RBw
	 A85QITlxGI/F6/RGZQ9SQ6oi8W782SFWthubjNChbgfdzIFAllCqCnSp7ty0i6WSHbuzd
	 pHN8dm4sNqdg1ajLvpfFUyPg1DlQ7/tUOxnq4W+1kn58WVPvKgTgqzGrHUB7R1Y5OBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqNlpjnW;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B93C606D80D
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Nov 2026 07:46:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7B93C606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hqNlpjnW
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-369f33df08eso675678eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 23:46:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793778391; x=1794383191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m52jieKKqnBv5GroLvKWf1SFv6SUy0rMYAbEKd7OWTU=;
        b=hqNlpjnW+B94JnDPH1Mm+SThPOCO4RIwGSc7I4zusesbXNTNQM2h80tD3ZBje6znFZ
         yVtSJHvAqnRVpZaQJjWBiJd+qZ3hRmNsjpi2sThVFcGoa7K2IeIF48+i+UHj2M7O6/T4
         E39YIGBeYkJ4rlEXTxhBQ7U6suJuJMMYC+w19o9XmSFOSW4cb9xWBeLgjEPhtfVV+J96
         UqywfsXQI/2p3CLjpkApbSqTCraVP3PO7gjKdy4KUeAx5YLxsu5q4f131+I/XFHgGJmM
         /libhKTQxKz3pLOqk+O5PXV/Q9pSWJL3oLf12rxlK9JeGI2NfsWhzTyRMN9YfF91+BMN
         3/fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793778391; x=1794383191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m52jieKKqnBv5GroLvKWf1SFv6SUy0rMYAbEKd7OWTU=;
        b=xMMOlj96HZ93xVlrYKPTUoKWJ+jhoE+OiKyb7C1qXg/UmqC7P3qNbjpKBd0QBGvBs9
         3anGn5xubYnh/wBvKvi12imLPLP/CXjr5f2oN7Ptcan6rfbmP4OoxYedlBRTkv2eg1f0
         jQhywZuPd7Uw4sfqMqhQm0ItjmrgwOdSj2Qnl8yR0mwo/d/jTnLS/IU/OgZfNUteTcxc
         UJMDM8IO4V4FD4wQ7qfniQWpAPkZCsCnvKBtLbIg53AOJhcESXXtTlHNHtacI8+dAOAw
         B5CBQB2cBNoY1iIRprN9BX0Js+8B3xOuGqag1uo9p/EWsoU+Xo9RvOxFJriw2sWg/erN
         0E1g==
X-Gm-Message-State: APuU4Z/SCQPtLgke39i614qJJJ6g2pGvRLq1QVZ+s/zYVmF218hCjQQG
	lSbx9Jae7A0A+0E+Az2m7kcyPMzi46p292iuukaEFyiAYUjvcfybYGrw
X-Gm-Gg: AYBFou2iyxzGCDNYAPTdq44aLftYsnVyNRoco+EC7q7tjdE1adN2HftVT/uYk7crLty
	fwk8j0rwkJyx88z9RWjqSN2HoKXrU77J0qStmEbNX2iVba8aAwIsmv0KISWN3628CV/gUtK2Qez
	4EUARUFxH4U1kNVDxsubBd/i+HudArRkow0zGpEfCa1s5tAuBQdnZVutHuIyZIsweZYUgoNQbXY
	OmHFkISZqQLzFKY7t1fgl012XxZXZxxbxc3MLvZndGX6AO8PGMyV1Lk1ZLITQv4mvBsQ+75AK4J
	Qs1WGunCx5qCPNqH4YvMe3awUVJxkU8KawRWyZE0JOgIx5FI7pufHEE4Zro/1GPtSRTHewplZZ/
	TNCFhOUZsixu/i56K6pL5a93xUpzIEj3GsDOU6H9X4aI3mnMErxMxhuyS5/mpbY0E8jTo1/pjkM
	BdsddtXfP6YZHnnYfMRXfevebn10vUewizJSgCPWtu1U3LlflozbMTzR1OuJj7p0xELCticDKuz
	U9TYRWtcjjos+ccl93rOHMtPMx5/XqfYtauz4BwrS4ytpKsDS+Bfq2cd5mHW8qJECmb5nJuLBpN
	H4tyPvhQQBUsJZmNmw/VgUZmJaHr3X4oh1dQP2d217Npa2HJNVYo6Lis6va8qoFkErHKtlyIATu
	8AH3sqg==
X-Received: by 2002:a05:7300:e9d3:20b0:369:fe81:a575 with SMTP id 5a478bee46e88-36a4243ab94mr27130200eec.35.1793778390558;
        Tue, 03 Nov 2026 23:46:30 -0800 (PST)
Received: from Sobhana.localdomain ([157.51.204.42])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca38a67edsm4566016eec.8.2026.11.03.23.46.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:46:30 -0800 (PST)
From: Sreeshankar K <sreeshankar0910@gmail.com>
Date: Wed, 04 Nov 2026 07:46:04 +0000
Subject: [PATCH v12 1/6] dt-bindings: clock: Add SM7250 global clock
 controller
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-master-v12-1-57fbe9eef978@gmail.com>
References: <20261104-master-v12-0-57fbe9eef978@gmail.com>
In-Reply-To: <20261104-master-v12-0-57fbe9eef978@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Robert Marko <robimarko@gmail.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Viresh Kumar <viresh.kumar@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Thara Gopinath <thara.gopinath@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, Sreeshankar K <sreeshankar0910@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793778372; l=7988;
 i=sreeshankar0910@gmail.com; s=20261029; h=from:subject:message-id;
 bh=4JR89GKnTTmAoxNgD7NPPZnHUc2FC6CQYNElhDfzy4M=;
 b=NAW4QjvOTSDH0MsrJv9iTeRvOQCUEec+g/b/eTNPmQYQ0qEWsoUCP1JavpZmBrfZ5Sz6r7wfj
 T26D95mS2zrD+eUN1bztBxnJtDnTztZujgRchz8CGsvg0xkDco9E/69
X-Developer-Key: i=sreeshankar0910@gmail.com; a=ed25519;
 pk=CGSHduvtn2hwLCNRXRc9s/fh6X8PH/zNdp08zC8hOuQ=

Add device tree bindings for global clock controller on SM7250 SoC.

Signed-off-by: Sreeshankar K <sreeshankar0910@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/clock/qcom,gcc-sm8250.yaml |  13 +-
 include/dt-bindings/clock/qcom,gcc-sm7250.h        | 163 +++++++++++++++++++++
 2 files changed, 172 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index 5f9aae728..f62aa0c59 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -4,21 +4,26 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller on SM8250
+title: Qualcomm Global Clock & Reset Controller on SM7250 and SM8250
 
 maintainers:
   - Stephen Boyd <sboyd@kernel.org>
   - Taniya Das <quic_tdas@quicinc.com>
+  - Sreeshankar K <sreeshankar0910@gmail.com>
 
 description: |
   Qualcomm global clock control module provides the clocks, resets and power
-  domains on SM8250.
+  domains on SM7250 and SM8250.
 
-  See also: include/dt-bindings/clock/qcom,gcc-sm8250.h
+  See also:
+    - include/dt-bindings/clock/qcom,gcc-sm7250.h
+    - include/dt-bindings/clock/qcom,gcc-sm8250.h
 
 properties:
   compatible:
-    const: qcom,gcc-sm8250
+    enum:
+      - qcom,gcc-sm7250
+      - qcom,gcc-sm8250
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,gcc-sm7250.h b/include/dt-bindings/clock/qcom,gcc-sm7250.h
new file mode 100644
index 000000000..765fdc38f
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gcc-sm7250.h
@@ -0,0 +1,163 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2026, Sreeshankar K <sreeshankar0910@gmail.com>
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GCC_SM7250_H
+#define _DT_BINDINGS_CLK_QCOM_GCC_SM7250_H
+
+/* GCC clocks */
+#define GPLL0							0
+#define GPLL0_OUT_EVEN						1
+#define GPLL6							2
+#define GPLL9							3
+#define GCC_AGGRE_UFS_PHY_AXI_CLK				4
+#define GCC_AGGRE_USB3_PRIM_AXI_CLK				5
+#define GCC_BOOT_ROM_AHB_CLK					6
+#define GCC_CAMERA_AHB_CLK					7
+#define GCC_CAMERA_HF_AXI_CLK					8
+#define GCC_CAMERA_SF_AXI_CLK					9
+#define GCC_CAMERA_XO_CLK					10
+#define GCC_CFG_NOC_USB3_PRIM_AXI_CLK				11
+#define GCC_CPUSS_AHB_CLK					12
+#define GCC_CPUSS_AHB_CLK_SRC					13
+#define GCC_CPUSS_GNOC_CLK					14
+#define GCC_CPUSS_RBCPR_CLK					15
+#define GCC_DDRSS_GPU_AXI_CLK					16
+#define GCC_DISP_GPLL0_CLK_SRC					17
+#define GCC_DISP_AHB_CLK					18
+#define GCC_DISP_HF_AXI_CLK					19
+#define GCC_DISP_SF_AXI_CLK					20
+#define GCC_DISP_XO_CLK						21
+#define GCC_GP1_CLK						22
+#define GCC_GP1_CLK_SRC						23
+#define GCC_GP2_CLK						24
+#define GCC_GP2_CLK_SRC						25
+#define GCC_GP3_CLK						26
+#define GCC_GP3_CLK_SRC						27
+#define GCC_GPU_CFG_AHB_CLK					28
+#define GCC_GPU_GPLL0_CLK_SRC					29
+#define GCC_GPU_GPLL0_DIV_CLK_SRC				30
+#define GCC_GPU_IREF_CLK					31
+#define GCC_GPU_MEMNOC_GFX_CLK					32
+#define GCC_GPU_SNOC_DVM_GFX_CLK				33
+#define GCC_NPU_AXI_CLK						34
+#define GCC_NPU_BWMON2_AXI_CLK					35
+#define GCC_NPU_BWMON_AXI_CLK					36
+#define GCC_NPU_BWMON_CFG_AHB_CLK				37
+#define GCC_NPU_CFG_AHB_CLK					38
+#define GCC_NPU_DMA_CLK						39
+#define GCC_NPU_GPLL0_CLK_SRC					40
+#define GCC_NPU_GPLL0_DIV_CLK_SRC				41
+#define GCC_PDM2_CLK						42
+#define GCC_PDM2_CLK_SRC					43
+#define GCC_PDM_AHB_CLK						44
+#define GCC_PDM_XO4_CLK						45
+#define GCC_PRNG_AHB_CLK					46
+#define GCC_QMIP_CAMERA_NRT_AHB_CLK				47
+#define GCC_QMIP_CAMERA_RT_AHB_CLK				48
+#define GCC_QMIP_DISP_AHB_CLK					49
+#define GCC_QMIP_RT_DISP_AHB_CLK				50
+#define GCC_QMIP_VIDEO_CVP_AHB_CLK				51
+#define GCC_QMIP_VIDEO_VCODEC_AHB_CLK				52
+#define GCC_QUPV3_WRAP0_CORE_2X_CLK				53
+#define GCC_QUPV3_WRAP0_CORE_CLK				54
+#define GCC_QUPV3_WRAP0_S0_CLK					55
+#define GCC_QUPV3_WRAP0_S0_CLK_SRC				56
+#define GCC_QUPV3_WRAP0_S1_CLK					57
+#define GCC_QUPV3_WRAP0_S1_CLK_SRC				58
+#define GCC_QUPV3_WRAP0_S2_CLK					59
+#define GCC_QUPV3_WRAP0_S2_CLK_SRC				60
+#define GCC_QUPV3_WRAP0_S3_CLK					61
+#define GCC_QUPV3_WRAP0_S3_CLK_SRC				62
+#define GCC_QUPV3_WRAP0_S4_CLK					63
+#define GCC_QUPV3_WRAP0_S4_CLK_SRC				64
+#define GCC_QUPV3_WRAP0_S5_CLK					65
+#define GCC_QUPV3_WRAP0_S5_CLK_SRC				66
+#define GCC_QUPV3_WRAP1_CORE_2X_CLK				67
+#define GCC_QUPV3_WRAP1_CORE_CLK				68
+#define GCC_QUPV3_WRAP1_S0_CLK					69
+#define GCC_QUPV3_WRAP1_S0_CLK_SRC				70
+#define GCC_QUPV3_WRAP1_S1_CLK					71
+#define GCC_QUPV3_WRAP1_S1_CLK_SRC				72
+#define GCC_QUPV3_WRAP1_S2_CLK					73
+#define GCC_QUPV3_WRAP1_S2_CLK_SRC				74
+#define GCC_QUPV3_WRAP1_S3_CLK					75
+#define GCC_QUPV3_WRAP1_S3_CLK_SRC				76
+#define GCC_QUPV3_WRAP1_S4_CLK					77
+#define GCC_QUPV3_WRAP1_S4_CLK_SRC				78
+#define GCC_QUPV3_WRAP1_S5_CLK					79
+#define GCC_QUPV3_WRAP1_S5_CLK_SRC				80
+#define GCC_QUPV3_WRAP_0_M_AHB_CLK				81
+#define GCC_QUPV3_WRAP_0_S_AHB_CLK				82
+#define GCC_QUPV3_WRAP_1_M_AHB_CLK				83
+#define GCC_QUPV3_WRAP_1_S_AHB_CLK				84
+#define GCC_SDCC1_AHB_CLK					85
+#define GCC_SDCC1_APPS_CLK					86
+#define GCC_SDCC1_APPS_CLK_SRC					87
+#define GCC_SDCC1_ICE_CORE_CLK					88
+#define GCC_SDCC1_ICE_CORE_CLK_SRC				89
+#define GCC_SDCC2_AHB_CLK					90
+#define GCC_SDCC2_APPS_CLK					91
+#define GCC_SDCC2_APPS_CLK_SRC					92
+#define GCC_SDCC4_AHB_CLK					93
+#define GCC_SDCC4_APPS_CLK					94
+#define GCC_SDCC4_APPS_CLK_SRC					95
+#define GCC_SYS_NOC_CPUSS_AHB_CLK				96
+#define GCC_UFS_1X_CLKREF_CLK					97
+#define GCC_UFS_PHY_AHB_CLK					98
+#define GCC_UFS_PHY_AXI_CLK					99
+#define GCC_UFS_PHY_AXI_CLK_SRC					100
+#define GCC_UFS_PHY_ICE_CORE_CLK				101
+#define GCC_UFS_PHY_ICE_CORE_CLK_SRC				102
+#define GCC_UFS_PHY_PHY_AUX_CLK					103
+#define GCC_UFS_PHY_PHY_AUX_CLK_SRC				104
+#define GCC_UFS_PHY_RX_SYMBOL_0_CLK				105
+#define GCC_UFS_PHY_RX_SYMBOL_1_CLK				106
+#define GCC_UFS_PHY_TX_SYMBOL_0_CLK				107
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK				108
+#define GCC_UFS_PHY_UNIPRO_CORE_CLK_SRC				109
+#define GCC_USB30_PRIM_MASTER_CLK				110
+#define GCC_USB30_PRIM_MASTER_CLK_SRC				111
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK				112
+#define GCC_USB30_PRIM_MOCK_UTMI_CLK_SRC			113
+#define GCC_USB30_PRIM_SLEEP_CLK				114
+#define GCC_USB3_PRIM_CLKREF_CLK				115
+#define GCC_USB3_PRIM_PHY_AUX_CLK				116
+#define GCC_USB3_PRIM_PHY_AUX_CLK_SRC				117
+#define GCC_USB3_PRIM_PHY_COM_AUX_CLK				118
+#define GCC_USB3_PRIM_PHY_PIPE_CLK				119
+#define GCC_VIDEO_AHB_CLK					120
+#define GCC_VIDEO_AXI_CLK					121
+#define GCC_VIDEO_XO_CLK					122
+
+/* GCC resets */
+#define GCC_DPM_BCR						0
+#define GCC_GPU_BCR						1
+#define GCC_MMSS_BCR						2
+#define GCC_NPU_BWMON_BCR					3
+#define GCC_NPU_BCR						4
+#define GCC_PDM_BCR						5
+#define GCC_PRNG_BCR						6
+#define GCC_QUPV3_WRAPPER_0_BCR					7
+#define GCC_QUPV3_WRAPPER_1_BCR					8
+#define GCC_QUSB2PHY_PRIM_BCR					9
+#define GCC_SDCC1_BCR						10
+#define GCC_SDCC2_BCR						11
+#define GCC_SDCC4_BCR						12
+#define GCC_UFS_PHY_BCR						13
+#define GCC_USB30_PRIM_BCR					14
+#define GCC_USB3_DP_PHY_PRIM_BCR				15
+#define GCC_USB3_PHY_PRIM_BCR					16
+#define GCC_USB3PHY_PHY_PRIM_BCR				17
+#define GCC_USB_PHY_CFG_AHB2PHY_BCR				18
+
+/* GCC power domains */
+#define UFS_PHY_GDSC						0
+#define USB30_PRIM_GDSC						1
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF0_GDSC			2
+#define HLOS1_VOTE_MMNOC_MMU_TBU_HF1_GDSC			3
+#define HLOS1_VOTE_MMNOC_MMU_TBU_SF0_GDSC			4
+
+#endif

-- 
2.43.0

