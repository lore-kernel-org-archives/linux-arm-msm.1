Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794864300;
	b=S+c7rn15+v4ydvqnLIq1fyVEnaYqkHwU2gyCuDGQF97uCN6mOlbOEQ6VcKUIghegaRPE
	 EpY4iJG9BjRg5qCCdJubqkxRgZTPIIOVKVeCbfWxbNG5Ik1VWOdDKHiWen0ddWNi7SgQT
	 zhDTPjzj0WlVtx3+QimILkqjWObjzAqT9lRO/vwQEaI8KK3QeUGNfptyaqaQ8g8FomgdQ
	 MDq3vOB3wLJTct6OeGRAeT8C+5e/eKDCzzoKxq1/MymH1GmqqSbt8sgbfOxJx/TzRrMAd
	 GI0tfL5Tcm/lUBC39M28q81VBwz+HgNOUQJ5eDggaKKcA2sFINHm1QPxs/FYONUgYFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794864300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=k4ABT3aCjOFmqJb09qUSoyD91Am5eBWq5yne7kljDPQ=;
	b=gbj+sf7ecczcnadq0aVDv7rtl4Aw9ARJ6r5lVBLE0KM6RwYJDq1cdLvvP84884hilis2
	 +JR7vBOwlPh5tof6ktuQzizkLBUhEeJu1xhzWb8EXpmepnkiDoCddYNZAjrT5OMK5KAuc
	 GFcZzyzP3lj+pcQP43pvcFHM6PGHmZI6eYbXWXk+KBqeLLWU/EbxxnKtkzVscc0R+affy
	 AiYetbxSf51RG52jnx45CLyOAh1pr+AHClUo5UblTbNMv3uXlBICEH2kUFCyo3UzlarCi
	 vskGHjghmju8dLG7vcqZxQj3VPMYd46kDnRIiSqd1mw88eS6XMAaUFzthGgsMT2lY1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="j/+qzraZ";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0921606A333
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 21:24:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0921606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=j/+qzraZ
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb6c7b6dbdso21044885e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 13:24:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794864298; x=1795469098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k4ABT3aCjOFmqJb09qUSoyD91Am5eBWq5yne7kljDPQ=;
        b=j/+qzraZRv4jnqiE41DbGLpyohUiTa4H0/CbgToAvAeb9NPHgzqPAG5RGO3pdSV0tn
         M0jYWrPUnuVRZSmUup4CkHpS0lXhg4G19bjO3dwmE4bc5XbfgUDVDvzUWRyEEbsrRbNE
         IGyJ+WdglbHrOAlfCBGzG/Np4mpDXpfGha65gIThXejBNyhOaqrLuOuVZeJIggSFq3xO
         xiaw8DzbRq/oPVJPhpskl2cQlQfJaxlIOqh1P7zPMKIwwpD3lSC9SExpRLsbAMGMpFXT
         5+pv8IEPeZq3E2ZIb2KZRm4+GQ10MqGDeyobCD03W+Rrgz+geXmQtXnae/oQ4bzJde8J
         Xl+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794864298; x=1795469098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k4ABT3aCjOFmqJb09qUSoyD91Am5eBWq5yne7kljDPQ=;
        b=IDqGEJQm5/UQt2v7q7EPGk0oGAlRTRqdMuJh9DxYn5hCMBBmrBzAmj2aoVUYchoz2w
         OjRF3AJ0mzegCPqXdOXbrkHtPo8T9WiV4vv5TfM0BIgLgcWM8xuRn/FEKudBL0MbDwU1
         3UHMgxnsitmnuvT6oOzHPsKuiJAw7mHS1vqwZCbwRDXzLs5y41HQXTFzl2b7/MJdvtIs
         F+0cPJt084oI6oaA6ZNlUY7BDewUubZMMoLF68OlQCDZkzArFGq6R1lJr2WTeZT98v63
         cJkJJpdNZsiYtJcn+U2tweeMxHzIIpSL5XkMWao4+s/5khwQpOYphgM4raCmzPw7SMIX
         ASPA==
X-Forwarded-Encrypted: i=1; AL+hErEE++F1MZ2mWHHvy8orBLHjrSR6CmevvODftMuc5SNkL1xVnuYiE5lCSM44vOT+vzrxfEhsucIsAVNe2SLF@vger.kernel.org
X-Gm-Message-State: APuU4Z+htS+FJD4JwsxKTNflPDkEsJ0UlWW40RsIs0avaBxKGHUxX14V
	qdCWIgTbolcxF641JJswGRl5PnYzNWH0NT4HfQE1IIj+OSwYazBOoBpJ
X-Gm-Gg: AYBFou1o2UTgftiOqCIw+m73PKGIZyV69nxOw/GmvqQmS6HZCvoEploE94RuWe8M9G0
	j3cghEiMGHTQLTeV0t86fZ5S2SyqXMW+wYacW2iM9PATDTrXItlS/ZW9HeOKu9vLBTUnEXq3Um2
	qfHwnCO0BCuGVHenvaWU4o2G2PxBUzCfubkoPbA3urQdpoYddkziIbcYjmEjJMKsTu3d3ZQRxvi
	GRT1vVYkk/GGWyYlFET9a3LAFeSEcfsPENjArkYoooiVOI/Ywu8EGhxNZfLRNHp8YtbBkpi0IMI
	3ChyOLOFsRjy+s3h6ZpgV5xbudGS4pNoqT1uB+sbLbHNqBWD/4wW5ijWnMJiPSyGEJeJ4zuyFao
	mwb9PkrIw8bWTreQDzAnIFl3+gdEwksqcMNVX5EtF8EV9JsH7HB0Ur+uFAzGtXmL28Z1J57K7eT
	XWIVJc1AYcnOg/qy8sOIrN6y9cqYM1AHiv80PJ5xrluNWL5M4w+2b5O+mHHngUJVlkvn++ka2ge
	mFqatUyV1/VdQBAJNW5O76omYI4T6GEld4CHmj+nAyKoBf9odxXs5WIyFrQhGvA/RQIL3VoVExv
	+OHromPrfIZd6GEAj4lY/TbEO6NqOg6qDayymsiJxRk1thDICVWE3nVSp+a4jw==
X-Received: by 2002:a05:600c:3ba2:b0:4bb:7757:fe6d with SMTP id 5b1f17b1804b1-4bb7758002fmr41245925e9.11.1794864298139;
        Mon, 16 Nov 2026 13:24:58 -0800 (PST)
Received: from [192.168.10.105] ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb734b9f44sm61928305e9.1.2026.11.16.13.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 13:24:57 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Date: Mon, 16 Nov 2026 21:24:50 +0000
Subject: [PATCH v2 1/3] dt-bindings: interconnect: document the RPMh
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
Message-Id: <20261116-halliday-icc-v2-1-6df8fc0e0620@gmail.com>
References: <20261116-halliday-icc-v2-0-6df8fc0e0620@gmail.com>
In-Reply-To: <20261116-halliday-icc-v2-0-6df8fc0e0620@gmail.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Stanislav Aleksandrov <lightofmysoul@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794864293; l=8878;
 i=lightofmysoul@gmail.com; s=20261108; h=from:subject:message-id;
 bh=xF60/A7hjYDqDJ9/az3c1Q+UR4EVU83CDQSjdNWW368=;
 b=StthY+WeqH05nuecIwXP2UA+VZJmP1vVTTV6cTJqtzTNxyU5n/Yxc5tv/DsW5OEWHJYW0/8ZH
 N3rDjdVBUPxA1QN2rOMUH8YX/8pYBztBXOKGrA2Gp+LG1rpANWeGOa2
X-Developer-Key: i=lightofmysoul@gmail.com; a=ed25519;
 pk=jeRUlfmkhE53CJPoeIIXgu7rTE0ybDRH0HQrEwbydzg=

Document the RPMh Network-On-Chip interconnect on the Qualcomm Halliday
SoC (SXR2250P).

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

