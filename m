Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794184203;
	b=QY+oBWWSDv1WO8uKX0Vh/HSq6NXXvnW8LZsnjYDdAOHp2CEUMO71idQZ0qVHH0sTnHz8
	 aOE0G83BG5pGl5cuDBgvhaH/fWnIN4yaYUh8vGprcc+i20YuVu6PSrc4VRY79luqaA05U
	 1eZLME8RtWrZELBcx+vqwgED5YslZ8JW4at6yiokVXi7Y+slQFUs1MROYdQCDSRfeZT6e
	 XEu9ZmTfsrkuO8vu92g6ZUl8+3KPq0KGC/y12oODL9DAczU4QLa8yPomdIGflTpr9FgVL
	 lnMRgop1nhPaDe6bBDUXaiNJTYzh9JvgV+Ni+mvucPnmLErgnr8+7gbebBgmpUGNaAw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794184203;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=voGU7Tv7fR6KB00DVUkpHf7HMBXoJCHAbHEv6SU5X8E=;
	b=be97JQFUSlSUgudEZczE3KzaIaccq69RydIaWLueJ2VVuDMVT2Y5fnfT4hNeD1B7UC4+
	 Y1V96ZNntylMVdQpcHWISr0KVYNv5msVD8JdgpuogBDHZ7AtlCIkR3bbRkH1UJATLWEtB
	 M/T5rVcJvlDjM75qKXJVC4l07skRlPXlME/2wefOvRGef3MfQg4+z3WBh/pr3xSLhuP43
	 krWBvar7v6xLOdnpvMzXUqW97CBWFrjyubpA86MzYRRnnTPEvWqS4xrQgRnNdSKdSVR+m
	 DYvgnkR/fpSbrUOtl487PR58dIDKJLk6IQn5yR5lMjuZcm+CEE0U5U2I5YTXalkyTBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IyB5Esnh;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C1D606A320
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Nov 2026 00:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61C1D606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IyB5Esnh
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4b4571ff080so3921935e9.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 16:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794184202; x=1794789002; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voGU7Tv7fR6KB00DVUkpHf7HMBXoJCHAbHEv6SU5X8E=;
        b=IyB5EsnhYiE/glJxhXv/ZYU/Tr+InZrrbQcyWNm96kjBbOs9cymBzNewAyCQ4r2Sme
         xKeGI24iZtrumCfnnVFlK+dKfQTYVx88F3IZdzunhKNN3cSddKNNihOV9g3XJuXIVYwI
         TzOcYXCfsZ3zf7tOnCe+vbZBtA4eLagLAMvtL4Un4Z2Mq8t/SGYfvgjKQ9ezMDTxTmxG
         2y8bMymP+gktaLMhbQZtjg77JGjZHNpnAbuiEShqTBzcPdXs8JoKt63Oe+G7RrSLvuJ5
         RxEDMu/i6NsKXPtrcOEZx5zeIbyKrgKwsSl5bOubyCpbjunreb17vyQd3fmpvXxxqxaj
         vvJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794184202; x=1794789002;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voGU7Tv7fR6KB00DVUkpHf7HMBXoJCHAbHEv6SU5X8E=;
        b=Wb8iht1yh1cntUQk0HnFUOH/ecixGzmU0LcMZgUn8H9eyB3lK/xpcjrhpV71t0L0fX
         S9EJ9RVbWXcfHCna/HXHWDGDZEvyrFAhyIeNjmLWFV7K+65iXw72Y6xUtR4BPcN/F0XY
         9JpWUl6MVH45W0FPsPj9zQEiuWkHbf0N3LiqhjzFRjwk6qMNfZ56MRY6dO5b9RdSOkBL
         iGi0SEvZzPYJYxouqelNa93bvm2u/A5vktWwByaIsDygYVZtbOM4yspU7wt4oA5+KzDw
         h10foH3kapAXmraMVK5qWhvSdnsJIwcqyT4V6CZIdOTOSH74+lvPKa7HMbk+jcOOWe4M
         A/sQ==
X-Forwarded-Encrypted: i=1; AL+hErE4HhUZbY9dknMMG2t/ojBcUTv42wlDiAlQzNuDBHOuipyoImfz4CoDVD5Q+8OeTa9PrgDkNMidQnhqg/KK@vger.kernel.org
X-Gm-Message-State: APuU4Z9pYjFzkGKMSg6AkTP5hBA6XT8vmHTzoPt54eaB+0LXWlv+vJpP
	aoE728QXoBkbXtF7QVaULYmac7f9uJWCOAUfel9aV6fW49NvtWR6E1Wc
X-Gm-Gg: AYBFou036eQmS08PCjD2AjTG8hJm7HtblBbL9l0TaMtF5lieLdMvyHngOGddn0yOGCW
	NuvpT090QxEeRAlgW9ZN/+QlQfeLRJdktteK78QzS4L/3C+UlEldFxw7aWvzW1iNHpBg5EjwrOx
	fRWwu4iafrSiM7mggsN85Vain+LS3eAKSOvvTKrTHptP69qnszDGcLTqtoul08cAnd7MVmCV8nL
	a5hkEc/mTpM+z8EKON4bQKfVtanA3nKAu12+ksXr4TT0f7BowZPImC+0wNq6coMpvD11zU2jixK
	UcDiiJi/g2F0mHhX8NY3/2oAL2kYipPGRxdtH/RlANutcih9/cArhcTTcCiQWK8XIhcjThzLqfU
	pFXzpVuciFMjPLcuA4/iUfVB8kU3+V5xA6OeSe+/MaX8JnEMpI6nGkhxYNW8LCZomVH5cKEp5vX
	OvQwEBlefy8CrGTke3b06yEIxDi4a1L68TLF2pksBqZ/LN/4wFetuHf+6vi+5DB0/HOAJd52aOJ
	XoYBD0dIEqxv2ub3Sp0iWh2nUF/aITVKH/XBQcx3eu+H1bk/Q5VPsT35mGxODcFUgn0/37wM+kk
	DFz3Fn5w/A7HaH3x21NVlMhOHbxLYGZXSBYOSZoK
X-Received: by 2002:a05:6000:220b:b0:48e:4f1e:5e24 with SMTP id ffacd0b85a97d-4958a016028mr5255812f8f.14.1794184201825;
        Sun, 08 Nov 2026 16:30:01 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4967a70a35dsm3479742f8f.9.2026.11.08.16.29.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 16:30:00 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 09 Nov 2026 00:29:53 +0000
Subject: [PATCH 1/2] dt-bindings: interconnect: document the RPMh
 Network-On-Chip interconnect in Halliday SoC
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
Message-Id: <20261109-halliday-icc-v1-1-def7cf786f75@gmail.com>
References: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com>
In-Reply-To: <20261109-halliday-icc-v1-0-def7cf786f75@gmail.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794184195; l=8805;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=M86V6R814tMy3S6XEUAkpjxhyI75umVhUUot4udVZXU=;
 b=2qS493Riaiafgy8U1TXUJWeJJB3UCTQdaLMg6DCxxOFD8N0LjhaHDMNVm1s4SNSiyPDC7PRlz
 nqnZ7PQtAM6C0afY+3SxmWkOfyKkyWJE7mF6b3zDKeQBt8aaNFEUeJc
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Network-On-Chip interconnect on the Qualcomm Halliday
SoC (SXR2250P).

Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
---
 .../bindings/interconnect/qcom,halliday-rpmh.yaml  | 131 +++++++++++++++++
 .../dt-bindings/interconnect/qcom,halliday-rpmh.h  | 158 +++++++++++++++++++++
 2 files changed, 289 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,halliday-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,halliday-rpmh.yaml
new file mode 100644
index 000000000000..0bc27ace965d
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,halliday-rpmh.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,halliday-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Halliday
+
+maintainers:
+  - Stanislav Aleksandrov <lightofmysoul@gmail.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM).
+
+  See also: include/dt-bindings/interconnect/qcom,halliday-rpmh.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,halliday-aggre1-noc
+      - qcom,halliday-aggre2-noc
+      - qcom,halliday-clk-virt
+      - qcom,halliday-config-noc
+      - qcom,halliday-gem-noc
+      - qcom,halliday-lpass-ag-noc
+      - qcom,halliday-mc-virt
+      - qcom,halliday-mmss-noc
+      - qcom,halliday-nsp-noc
+      - qcom,halliday-pcie-anoc
+      - qcom,halliday-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,rpmh-common.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,halliday-clk-virt
+              - qcom,halliday-mc-virt
+    then:
+      properties:
+        reg: false
+    else:
+      required:
+        - reg
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,halliday-aggre1-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre UFS PHY AXI clock
+            - description: aggre USB3 PRIM AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,halliday-aggre2-noc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: RPMH CC IPA clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,halliday-pcie-anoc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: aggre-NOC PCIe AXI clock
+            - description: cfg-NOC PCIe a-NOC AHB clock
+            - description: aggre-NOC PCIe SF AXI clock
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,halliday-aggre1-noc
+              - qcom,halliday-aggre2-noc
+              - qcom,halliday-pcie-anoc
+    then:
+      required:
+        - clocks
+    else:
+      properties:
+        clocks: false
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    interconnect-0 {
+        compatible = "qcom,halliday-clk-virt";
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    interconnect@16c0000 {
+        compatible = "qcom,halliday-pcie-anoc";
+        reg = <0x016c0000 0xc080>;
+        clocks = <&aggre_noc_pcie_axi_clk>,
+                 <&cfg_noc_pcie_anoc_ahb_clk>,
+                 <&aggre_noc_pcie_sf_axi_clk>;
+        #interconnect-cells = <2>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
diff --git a/include/dt-bindings/interconnect/qcom,halliday-rpmh.h b/include/dt-bindings/interconnect/qcom,halliday-rpmh.h
new file mode 100644
index 000000000000..d60086489b38
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,halliday-rpmh.h
@@ -0,0 +1,158 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2026, Stanislav Aleksandrov <lightofmysoul@gmail.com>
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_HALLIDAY_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_HALLIDAY_H
+
+/* aggre1_noc */
+#define MASTER_QUP_1				0
+#define MASTER_A1NOC_CFG			1
+#define MASTER_UFS_MEM				2
+#define MASTER_USB3_0				3
+#define SLAVE_A1NOC_SNOC			4
+#define SLAVE_SERVICE_A1NOC			5
+
+/* aggre2_noc */
+#define MASTER_QDSS_BAM				0
+#define MASTER_QUP_0				1
+#define MASTER_A2NOC_CFG			2
+#define MASTER_CNOC_A2NOC			3
+#define MASTER_CRYPTO				4
+#define MASTER_IPA				5
+#define MASTER_SP				6
+#define MASTER_QDSS_ETR				7
+#define MASTER_QDSS_ETR_1			8
+#define MASTER_SDCC_2				9
+#define SLAVE_A2NOC_SNOC			10
+#define SLAVE_SERVICE_A2NOC			11
+
+/* clk_virt */
+#define MASTER_QUP_CORE_0			0
+#define MASTER_QUP_CORE_1			1
+#define SLAVE_QUP_CORE_0			2
+#define SLAVE_QUP_CORE_1			3
+
+/* config_noc */
+#define MASTER_GEM_NOC_CNOC			0
+#define MASTER_QDSS_DAP				1
+#define SLAVE_AHB2PHY_SOUTH			2
+#define SLAVE_AHB2PHY_NORTH			3
+#define SLAVE_AOSS				4
+#define SLAVE_CAMERA_CFG			5
+#define SLAVE_CLK_CTL				6
+#define SLAVE_CDSP_CFG				7
+#define SLAVE_RBCPR_CX_CFG			8
+#define SLAVE_RBCPR_MMCX_CFG			9
+#define SLAVE_RBCPR_MXA_CFG			10
+#define SLAVE_RBCPR_MXC_CFG			11
+#define SLAVE_CRYPTO_0_CFG			12
+#define SLAVE_CX_RDPM				13
+#define SLAVE_DISPLAY_CFG			14
+#define SLAVE_DISPLAY1_CFG			15
+#define SLAVE_GFX3D_CFG				16
+#define SLAVE_IMEM_CFG				17
+#define SLAVE_IPA_CFG				18
+#define SLAVE_IPC_ROUTER_CFG			19
+#define SLAVE_LPASS				20
+#define SLAVE_MX_RDPM				21
+#define SLAVE_PDM				22
+#define SLAVE_PRNG				23
+#define SLAVE_QDSS_CFG				24
+#define SLAVE_QUP_0				25
+#define SLAVE_QUP_1				26
+#define SLAVE_SDCC_2				27
+#define SLAVE_SPSS_CFG				28
+#define SLAVE_TCSR				29
+#define SLAVE_TLMM				30
+#define SLAVE_TME_CFG				31
+#define SLAVE_UFS_MEM_CFG			32
+#define SLAVE_USB3_0				33
+#define SLAVE_VENUS_CFG				34
+#define SLAVE_VSENSE_CTRL_CFG			35
+#define SLAVE_A1NOC_CFG				36
+#define SLAVE_A2NOC_CFG				37
+#define SLAVE_CNOC_A2NOC			38
+#define SLAVE_DDRSS_CFG				39
+#define SLAVE_CNOC_MNOC_CFG			40
+#define SLAVE_PCIE_ANOC_CFG			41
+#define SLAVE_SNOC_CFG				42
+#define SLAVE_IMEM				43
+#define SLAVE_SERVICE_CNOC			44
+#define SLAVE_QDSS_STM				45
+#define SLAVE_TCU				46
+
+/* gem_noc */
+#define MASTER_GPU_TCU				0
+#define MASTER_SYS_TCU				1
+#define MASTER_APPSS_PROC			2
+#define MASTER_GFX3D				3
+#define MASTER_MNOC_HF_MEM_NOC			4
+#define MASTER_MNOC_SF_MEM_NOC			5
+#define MASTER_COMPUTE_NOC			6
+#define MASTER_ANOC_PCIE_GEM_NOC		7
+#define MASTER_SNOC_GC_MEM_NOC			8
+#define MASTER_SNOC_SF_MEM_NOC			9
+#define SLAVE_GEM_NOC_CNOC			10
+#define SLAVE_LLCC				11
+
+/* lpass_ag_noc */
+#define MASTER_CNOC_LPASS_AG_NOC		0
+#define MASTER_LPASS_PROC			1
+#define SLAVE_LPASS_CORE_CFG			2
+#define SLAVE_LPASS_LPI_CFG			3
+#define SLAVE_LPASS_MPU_CFG			4
+#define SLAVE_LPASS_TOP_CFG			5
+#define SLAVE_LPASS_SNOC			6
+#define SLAVE_SERVICES_LPASS_AML_NOC		7
+#define SLAVE_SERVICE_LPASS_AG_NOC		8
+
+/* mc_virt */
+#define MASTER_LLCC				0
+#define SLAVE_EBI1				1
+#define MASTER_DDR_RT				2
+#define SLAVE_DDR_RT				3
+
+/* mmss_noc */
+#define MASTER_CAMNOC_HF			0
+#define MASTER_CAMNOC_ICP			1
+#define MASTER_CAMNOC_SF			2
+#define MASTER_MDP0				3
+#define MASTER_MDP1				4
+#define MASTER_CNOC_MNOC_CFG			5
+#define MASTER_CDSP_HCP				6
+#define MASTER_VIDEO				7
+#define MASTER_VIDEO_CV_PROC			8
+#define MASTER_VIDEO_PROC			9
+#define MASTER_VIDEO_V_PROC			10
+#define SLAVE_MNOC_HF_MEM_NOC			11
+#define SLAVE_MNOC_SF_MEM_NOC			12
+#define SLAVE_SERVICE_MNOC			13
+
+/* nsp_noc */
+#define MASTER_CDSP_NOC_CFG			0
+#define MASTER_CDSP_PROC			1
+#define SLAVE_CDSP_MEM_NOC			2
+#define SLAVE_SERVICE_NSP_NOC			3
+
+/* pcie_anoc */
+#define MASTER_PCIE_ANOC_CFG			0
+#define MASTER_PCIE_0				1
+#define MASTER_PCIE_1				2
+#define MASTER_PCIE_4				3
+#define SLAVE_ANOC_PCIE_GEM_NOC			4
+#define SLAVE_SERVICE_PCIE_ANOC			5
+
+/* system_noc */
+#define MASTER_GIC_AHB				0
+#define MASTER_A1NOC_SNOC			1
+#define MASTER_A2NOC_SNOC			2
+#define MASTER_LPASS_ANOC			3
+#define MASTER_SNOC_CFG				4
+#define MASTER_GIC				5
+#define SLAVE_SNOC_GEM_NOC_GC			6
+#define SLAVE_SNOC_GEM_NOC_SF			7
+#define SLAVE_SERVICE_SNOC			8
+
+#endif

-- 
2.55.0

