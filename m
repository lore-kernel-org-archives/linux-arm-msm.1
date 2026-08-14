Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E2A41F5C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692781; cv=none; b=uNYlf9GEJKHewo70XOWcjaoIAa362u8OUEoKWx4ARDlTffkeHAnXEw11NVizayZ4KtnequLWyNHZcDu/aqawNRGv3cUoQuzUIKgdWW5Q6+7pXst3h7LZF7PdmxpAGRGJz53gDP3/UhFKn031cqTznlKD9GrFnL9+sr/NGoOMh6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692781; c=relaxed/simple;
	bh=jFRWsP9ISRPrclLZb7Xm99XFKDmAoPy99ddr/r8mkjM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MWgMtkyzOgdE0ypbOzN7WTGEMCKmZ3sr26Fw6HxCHY1YGDzli/Y2UuomLAj0E482KEpVutYH9lKVgA3upFzx9/s4ipOiGogErU/6MRHLGaXRLvq9lJoawblYr22Oi7aX1pimUejTGAUgKNbr6LrEOKrMX1XgvDxy+ZibMiiDgDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WIcfgo/7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kJzN6qcm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WIcfgo/7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kJzN6qcm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QXwe979808
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpeiabKTD0jeAQh1gSJUWOUbLOHro//2dly8tKNUA1Q=; b=WIcfgo/7KEGV64C0
	J7AKr8WAnY7tgbXIQFTJwndXFAGNINJElsybvR2zepfh1H20VZLK/dejAt7aTwPR
	cp5AxQcqPee9AlvHuiW2RJEomHptjqIeWv8nVUwl65Qk73/ZIbUhn+v5tg7yu4x3
	AxRyAKhskmNzjUrj/aoit9+bSNTrkKUHc+PSvrr2GV0fkaN5n/GUZjPVy9DnvruV
	Yl6ZSJAMw9XZ7Z6+jvPloNOaChrHwmKniqbz40ygAsx48wHCwI36N/ArozgUvqxj
	W9Y4lLvsypZMZowQMlA6FXEH4MguajPvpqzb0rp1frbBWFVi46XNdrH0G2rtYagI
	SiKIhA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1pea1qmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 07:32:53 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab048cdb3eso746226a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Aug 2026 00:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692773; x=1787297573; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpeiabKTD0jeAQh1gSJUWOUbLOHro//2dly8tKNUA1Q=;
        b=kJzN6qcmsfZtZ0mhtAGEjuedHuiKNan0y0xkRXuBt81I4k8l5Gj7BCZOQllZQw7wZT
         SxgP6QQC/y+vMtwLD+RxbMgUL4PSS4ypz/3lzAlz5K8K8EYWWCcQsP8tVzOfi0Um2jkZ
         vDh98B5U+7dGxwAXQO4DHm7W4dCvOVnfpl5EHsPKFJURLgXPaHLiuCPTaFv8Q2FrOkAm
         zKJ6SscZbt/nbGMvHrEiFZfd/RIJIuXHYhl5NhuWejlwAujj1OJwc75VC6XFh4+vebz8
         em9IxbUkLVfMjUL7dY79+zp8R0RJmX1AmqVfth33gS5ub68xENPTjqvjCnOjnvW3SpIf
         5WGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692773; x=1787297573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpeiabKTD0jeAQh1gSJUWOUbLOHro//2dly8tKNUA1Q=;
        b=TcuG7jxAt6BiUbt/tvhy5VGh/yrBb1T2zmVZ8CU2WDwbwvcv/3sVTQ9eBltfaWgDHM
         80WLNd2Sa0IViNKKWPE2/tnt488+Vh2yWwYcpCwNGAqtNXfuF5veqK0bQvvqm+5CwmrU
         BenBY/EnoPOU0m15gbvIVd7NlEPoj6BRbBg2POwe1lzC3yvzf0JYVludHWT1wMUvhTBN
         h/329H90S9GRluB3qWQWTfQsA7BPh/ysDvH9/jeQFmWxrZrEyh6I6x+DiB9E3FKgpMon
         oH8E9AmsfsSgaATbjw/Fo7/WePqXNqa3kjRxgiI92CNlk8owxq7bI1VXfHrXzSfbHHHl
         rgxA==
X-Gm-Message-State: AOJu0Yx1Xi501Ulb/zqeku23mWY/9NWsTKOoRUzjMHxwP+A4PcNVX7XR
	xKcUxzF8XRuC68s4p6t5Xd3uBxqnRcv9UeUuAmJ0wXXw+qHBqJzi3QTabHF/LQb/F5X+NkqqR+k
	kf4lOXxfxp60ZfEmPlYC3PQwrtPbEsZebhP/XDm78v80wwBVm3UJXTxr3a/8IpE/0yaJm
X-Gm-Gg: AR+sD126u9ONrGSIU5ggaAkNObt4odXCwzdCWjUS9J977wVACN+v6dLq3JQq9Sdlgtm
	MlYgM6342Q8gcF+fc2jVEGLkUD8B2pw0IPf54xQ2ujns6hUvkuohFa7l32k18oMXKdQXpQ+AKJo
	WgNQsOu5YxKNx2S9MZOB9MoO7LRiYG3WFx3CGTf6kzqgk1agTtbJFp6aG1vUceiTFuucBOxddMj
	gog/rcSGXbpbtfXPeHZn2NSXIJ7l6+y7kptsySaBsl99+TuAWOxaO0+R545WTHNMST9d+eMAS6n
	shYeMosEk7/vl7jDV/wJ6fjI0sIPnhTpLGHH0DCA+FGMrRupC9RG4Gga58S4mkyfDu+OisuIF6F
	AGAfBNfSOAJCt4ckul4+4bqh7SOuOs372xyXyMzxxlC06qWWMCwsP2JJ+gpOGcVrGiRAfAdUlmQ
	67vwtsOL+apYIpe9v5+Rxcpps=
X-Received: by 2002:a05:6a20:12d2:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cc71de3b8dmr4123519637.28.1786692772859;
        Fri, 14 Aug 2026 00:32:52 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d2:b0:3c3:a024:1360 with SMTP id adf61e73a8af0-3cc71de3b8dmr4123472637.28.1786692772425;
        Fri, 14 Aug 2026 00:32:52 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:32:51 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:37 +0530
Subject: [PATCH v2 06/15] dt-bindings: interconnect: Add Qualcomm Kuno NoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-6-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692713; l=5865;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=jFRWsP9ISRPrclLZb7Xm99XFKDmAoPy99ddr/r8mkjM=;
 b=7b2Un2s/M9mSVl4PcO5B7+YBwe8pYT85+NxWU5VAq9nRbWwFhkwfruk2XYApzqPIJwzEU/NBQ
 dxyxR/9bwCpBtxHwy7PehIbzLXwNKJ1HkURps7UyuuYOa1mjc1QsHpF
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=TbGmcxQh c=1 sm=1 tr=0 ts=6a7ec4a5 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UOSSyZSmw6qQ1N8pRZUA:9
 a=_XYWEmbmkuNYmnV3:21 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: qagYPDnthOIH6rgrdz4OzxiJvmDtYYiI
X-Proofpoint-ORIG-GUID: qagYPDnthOIH6rgrdz4OzxiJvmDtYYiI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX0/qqx5DpvU2L
 F/JslSE14NxOBqtD6UnFEyhPUwA3RhzwhJA4GCzFMzE+e6hdGZ+0GFbrlQRb0FLg8Oo25Lp9HXi
 4Vj8/oYvrOJPERjD++DqXi7UVmXFN2Ni632XOCFD/7adzdbMcRzm6SMwcojuSMm2XMHFdIKvVV7
 iNCkxrb50HEwrRA8uJH8bX5yk1PBtVvYlrcd7gx02PFq5Dy3acnMri90BE6+wcQxIqmRkrsLxwp
 0aehUaSPGKGqbDtO76vxxBSodTOoE43CjkQZLYkbPjcdEuHL3XIYQsyAJ0Ja9MHA3TGZqz/9GIs
 RzWu8p5PazSgVzZ7ABhfUX+343vEom9etjX1f92mwAdhNQIk6ovWU/XIAmCNIyJVAsmu+ZRBJWw
 vTb4MNDY5MVv/cVvE4348COg8SbpcUEdrkUWK/YXXGgKQakR8G1OPqNxjdu3N9xchiYFYJwPf6X
 fjGIiL7Y5Ysqbam8d+A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX21pVdqhGUJJj
 2Q7zhTMmR47ovFPqDxQjPUxiR6+sQmBBwfHI/+0MBGhASA5TNnLNHfobX2bmydLyYBRVDTwUiGD
 fdkcBOuP1Ed3r/PgWvs8kCUbER8cbXE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058

Document the RPMh-based Network-on-Chip interconnect providers and
associated node-ID definitions for the Qualcomm Kuno SoC.

Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/interconnect/qcom,kuno-rpmh.yaml      | 82 ++++++++++++++++++++
 include/dt-bindings/interconnect/qcom,kuno.h       | 89 ++++++++++++++++++++++
 2 files changed, 171 insertions(+)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
new file mode 100644
index 000000000000..ffbf14356f12
--- /dev/null
+++ b/Documentation/devicetree/bindings/interconnect/qcom,kuno-rpmh.yaml
@@ -0,0 +1,82 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interconnect/qcom,kuno-rpmh.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm RPMh Network-On-Chip Interconnect on Kuno SoC
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description: |
+  RPMh interconnect providers support system bandwidth requirements through
+  RPMh hardware accelerators known as Bus Clock Manager (BCM). The provider is
+  able to communicate with the BCM through the Resource State Coordinator (RSC)
+  associated with each execution environment. Provider nodes must point to at
+  least one RPMh device child node pertaining to their RSC and each provider
+  can map to multiple RPMh resources.
+
+  See also: include/dt-bindings/interconnect/qcom,kuno.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,kuno-aggre-noc
+      - qcom,kuno-clk-virt
+      - qcom,kuno-cnoc-main
+      - qcom,kuno-dc-noc
+      - qcom,kuno-mc-virt
+      - qcom,kuno-mem-noc
+      - qcom,kuno-pcie-anoc
+      - qcom,kuno-system-noc
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    minItems: 1
+    maxItems: 4
+
+  clock-names:
+    minItems: 1
+    maxItems: 4
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
+              - qcom,kuno-clk-virt
+              - qcom,kuno-mc-virt
+    then:
+      properties:
+        reg: false
+        clocks: false
+        clock-names: false
+    else:
+      required:
+        - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    interconnect-clk-virt {
+        compatible = "qcom,kuno-clk-virt";
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+
+    interconnect@1640000 {
+        compatible = "qcom,kuno-aggre-noc";
+        reg = <0x01640000 0x33400>;
+        #interconnect-cells = <1>;
+        qcom,bcm-voters = <&apps_bcm_voter>;
+    };
+...
diff --git a/include/dt-bindings/interconnect/qcom,kuno.h b/include/dt-bindings/interconnect/qcom,kuno.h
new file mode 100644
index 000000000000..eacbae38f85d
--- /dev/null
+++ b/include/dt-bindings/interconnect/qcom,kuno.h
@@ -0,0 +1,89 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __DT_BINDINGS_INTERCONNECT_QCOM_KUNO_H
+#define __DT_BINDINGS_INTERCONNECT_QCOM_KUNO_H
+
+#define MASTER_SYS_TCU				0
+#define MASTER_LLCC				1
+#define MASTER_AUDIO				2
+#define MASTER_CPUCP				3
+#define MASTER_PCIE_RSCC				4
+#define MASTER_QDSS_BAM				5
+#define MASTER_QPIC				6
+#define MASTER_QUP_0				7
+#define MASTER_ANOC_SNOC				8
+#define MASTER_CNOC_DC_NOC				9
+#define MASTER_CNOC_SNOC				10
+#define MASTER_MSS_PROC				11
+#define MASTER_GEM_NOC_CFG				12
+#define MASTER_GEM_NOC_CNOC				13
+#define MASTER_GEM_NOC_PCIE_SNOC				14
+#define MASTER_ANOC_PCIE_GEM_NOC				15
+#define MASTER_SNOC_SF_MEM_NOC				16
+#define MASTER_QUP_CORE_0				17
+#define MASTER_CRYPTO				18
+#define MASTER_IPA				19
+#define MASTER_MSS_NAV				20
+#define MASTER_TME				21
+#define MASTER_APPSS_PROC				22
+#define MASTER_EMAC				23
+#define MASTER_IPA_PCIE				24
+#define MASTER_PCIE_0				25
+#define MASTER_QDSS_DAP				26
+#define MASTER_QDSS_ETR				27
+#define MASTER_QDSS_ETR_1				28
+#define MASTER_SDCC_4				29
+#define MASTER_USB3_0				30
+#define SLAVE_EBI1				31
+#define SLAVE_AHB2PHY				32
+#define SLAVE_AOSS				33
+#define SLAVE_APPSS				34
+#define SLAVE_AUDIO				35
+#define SLAVE_CLK_CTL				36
+#define SLAVE_RBCPR_CX_CFG				37
+#define SLAVE_RBCPR_MXA_CFG				38
+#define SLAVE_RBCPR_MXC_CFG				39
+#define SLAVE_CRYPTO_0_CFG				40
+#define SLAVE_EMAC_CFG				41
+#define SLAVE_IMEM_CFG				42
+#define SLAVE_IPA_CFG				43
+#define SLAVE_IPC_ROUTER_CFG				44
+#define SLAVE_LAGG_CFG				45
+#define SLAVE_MCCC_MASTER				46
+#define SLAVE_CNOC_MSS				47
+#define SLAVE_PCIE_0_CFG				48
+#define SLAVE_PCIE_RSC_CFG				49
+#define SLAVE_PDM				50
+#define SLAVE_PMU_WRAPPER_CFG				51
+#define SLAVE_PRNG				52
+#define SLAVE_QDSS_CFG				53
+#define SLAVE_QPIC				54
+#define SLAVE_QUP_0				55
+#define SLAVE_SDCC_4				56
+#define SLAVE_SPMI_VGI_COEX				57
+#define SLAVE_TCSR				58
+#define SLAVE_TLMM				59
+#define SLAVE_TME_CFG				60
+#define SLAVE_USB3				61
+#define SLAVE_VSENSE_CTRL_CFG				62
+#define SLAVE_A1NOC_CFG				63
+#define SLAVE_DDRSS_CFG				64
+#define SLAVE_LLCC				65
+#define SLAVE_GEM_NOC_CNOC				66
+#define SLAVE_SNOC_MEM_NOC_SF				67
+#define SLAVE_MEM_NOC_PCIE_SNOC				68
+#define SLAVE_ANOC_PCIE_GEM_NOC				69
+#define SLAVE_SNOC_CNOC				70
+#define SLAVE_ANOC_THROTTLE_CFG				71
+#define SLAVE_QUP_CORE_0				72
+#define SLAVE_BOOT_IMEM				73
+#define SLAVE_IMEM				74
+#define SLAVE_SERVICE_GEM_NOC				75
+#define SLAVE_PCIE_0				76
+#define SLAVE_QDSS_STM				77
+#define SLAVE_TCU				78
+
+#endif

-- 
2.43.0

