Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0931828033B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773834; cv=none; b=ZxzZZSjCUtUG+QrnY3FvPTSMNGl28U657TFVPiuRaAUUoKHfv7mG3s2SIh89s/RvbRSfXdtB1+rZujChv08i0jEAxitxJldEqYDbHSacz2eBolWOKx3T6Z/ZQOHtxJpo1jnwfwxHRr49U/x4xL1OEp7UtC+ariKrGTJaRlLZ6Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773834; c=relaxed/simple;
	bh=+WhStuQ5tWT2R9/i8ZwGe8d3oZmxPuE4Vr+OUYOmmso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rZs1cXcW9fFXiJO2M8fOV0K378IeOYPuXLu82m7LAqTsVJlZcTMkybK3ALJ4/Km5cqG17WJ3DQjwlsubKSHukiWK0ZMxhbuAguFTe+fBcdqw69zGprfdrv0Y5Cdfj3BnhEQKg1nIJhkPISSQES0Lwoa0CfDaY9bRL03MEptMdYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ms89n2rd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bzVAZa2k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ms89n2rd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bzVAZa2k"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0XUch2521148
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:30:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gg+QryruY/7NPTM87J9rF7S09woVaBLgs3RtEBjtwlw=; b=ms89n2rdNeuQNbgZ
	IQfe8k5SEs3SZf9vZC3HiVcNUgG6SNm1p8Of6ly8+uCxzFSh9SQVWE89btH2gjTU
	LmtcT+jwZVqfACaQaTYdi3aSpSg5wna9uW+5jMECojZWmYmVXpvzlKQYp52zX5kM
	UrtkVmrvjbryUCocThlAAmUqgFpbTy9IbD2Qz6cwGQ3WPLQkg1I0/15CaT6uD8ZQ
	aYFVJI5taA6PuWMDbnE5u/SNcVny72vMjA04q0E/0FWEdhbPhDZh2ssGTGgb8M1D
	9C6JbSGlaI/ztiUq3DVt+piiTFl+B/Dm2zmNFOOdDporjltRBGeftq7YLjDRpaH1
	MQpzUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk6c7gpuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:30:28 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso163103a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 19:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784773828; x=1785378628; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg+QryruY/7NPTM87J9rF7S09woVaBLgs3RtEBjtwlw=;
        b=bzVAZa2k6eRscdWin+pSFeU5kmviXILU4gVQAm5JKd8xvNsBG3xxLpISjEZk1/73on
         GnvUsMrSuXWz3xjMmKH3CR4oB3upyXVvp/UFy8paz2MGf42LFSixmMfDG3NkTJ4jtJD5
         XJvUDmpR9ANw99V/+qM8D5z8GBmV91hlRTPspiUMaKZkkV3XedzaewoAbRNNmlg1jUBb
         oEvvkdziGCHhFbYJRNHD1hbj+afVlUzRDQj7FgYXziOVvy6svJ3qIdNnkkJGTYyBqgHM
         jNz128TpWFTiZtwDOi3toLRchMsc9Op7X5kaOm0W1sln5VT+6QrhgSYNZqOkpFDK24eT
         zLmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773828; x=1785378628;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gg+QryruY/7NPTM87J9rF7S09woVaBLgs3RtEBjtwlw=;
        b=amwutlMQui8XcuW+skkaliXo07sc08T0d+WcbCq5Gyn8p3ZgdozjrpM1/RVcEe+AQ8
         slz/CmLjWwdz/QEO1QsKr0HtJRL8b3NW4ZWv28AxTvYBevB8HkVxyc5Vc3X3nAwB4MlS
         ooRvHc9B3qn+/VIPvunV9FiedDDWnALIVFCvMgWU/Sh4Ddj6RJmYUDbB8L948Zn/wqgy
         D95aUKDiw8XXj+gL0BFG8uCiErzL7uVYOt4BbH258eGkuPiz9oYUYru0TkYJHYtIXmHc
         ry/YoQM5oSyjTdKlXWFDDSWxfvv71Yb9rNYqR0f6UtegsqSz4mSpe5ZlqiJVZiNHqOFH
         MelQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqvt1H8dSR8ZEMPR3WxTYulRo6CLqDj8jKPVyx9zhZbMLdJpyHhu3OIzXsrYE7OR6rp3C9rQ9V7+t87gBYR@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9gKtKLACE+ckQ3dBumU2nkM7HpE/rJShsWuoiQu12+B/Gft2Z
	/Kc7CZki9UASOL9yqbSlVqGUvaxwbXdOgdnzqqn6cYb2wJCqaVg12KmQdAErm5PWW66KZaN1ZuI
	gUD1xNoEQq06F7NNNV2os4UEU7dr5VsyQjOzrhLT+6lxun6DxT24ct13ZFtGJcIL+cQu2
X-Gm-Gg: AR+sD13floBApEzi/TVx4AxMiBH/b4c5X26Q7gd7uPxeJObJGQqwSPy679MtxZGxs4p
	jqfWXioHXg/JZZ4LLnQHAZOMuJi9EaH5DYcbzwxjzttQ/a+XR817up+hZJ60j+OmIHtPGouJYlh
	H0fp8r63QV49jQh5eDsULSznDj7sG272RL1d1Fwk/+89hCb08wmt228PG+oEPLtXwdE9fS8sKPQ
	waGiEbzVmKXDc7sf60228WOTGTv6h9zQC8wGYRLN8xT2FIRe00spjnnIyM0atr1Rxei7ab2Ugmj
	X8WHM9D7GlNG+b+qlNRgyxREw+8izbdMNCpisWs2f2ua2TPyQYZ/nfflMV6EnHAQ7rewzLoXL+X
	quFXCzV8r0KrsTnsikrJjNq+GlFt9sKV+x8DMjiIW3c6OJjw=
X-Received: by 2002:a05:6a20:d508:b0:3c0:9c19:65a3 with SMTP id adf61e73a8af0-3c44b2b6a31mr1190836637.75.1784773828143;
        Wed, 22 Jul 2026 19:30:28 -0700 (PDT)
X-Received: by 2002:a05:6a20:d508:b0:3c0:9c19:65a3 with SMTP id adf61e73a8af0-3c44b2b6a31mr1190787637.75.1784773827627;
        Wed, 22 Jul 2026 19:30:27 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm13463980eec.0.2026.07.22.19.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:30:27 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:30:18 -0700
Subject: [PATCH v6 1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-glymur_linkmode_0722-v6-1-bba8156b8cbb@oss.qualcomm.com>
References: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
In-Reply-To: <20260722-glymur_linkmode_0722-v6-0-bba8156b8cbb@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784773825; l=6511;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=+WhStuQ5tWT2R9/i8ZwGe8d3oZmxPuE4Vr+OUYOmmso=;
 b=xdCWBVyDqEd/3RgWIZpx81J37CyJQ/95TdL3VAtwr44gWkQ/bHeozbhZXkgVcRuF3gFG5qGK2
 XiNxjd5jSErCl9PL/L4dDahIRj7tbhkmuzoYT/XXMaia8YQwqvX0DFP
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: TQ5zIExp-zd1YAS516jOpdUiz9WsfKzk
X-Proofpoint-ORIG-GUID: TQ5zIExp-zd1YAS516jOpdUiz9WsfKzk
X-Authority-Analysis: v=2.4 cv=baZbluPB c=1 sm=1 tr=0 ts=6a617cc4 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=yAdxKSRqiqocnpK_7ewA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfXzmLLhNRtWCNd
 BIkq/wcop7vTsFgIrpctDknOekJRH/q9rL5OVJ1S3AJM+vgYt5rlEU8o2dUIYFj86V9ir+0xraF
 vm24UwveAswrWXFQbvlb9dHuk7nhMZQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfX0lrCDZh6hl/z
 QOQRgRa3w6tKljcnBWwqKa9kFFizRoR21fSMsD4NvS9Ef4O5ycYxtC9qPFThZrahnljDNm6jGpg
 UFGZ2BwzB22V3WhpvxeltUi6uRcvqvS08tM1UWhuF8+trFVXB2mdvJNIPMCxFRdRZLXfPvoOavQ
 ewbJwOtK7JcB9eDfkSrV8eIXKOiqej4C2T9T7ciJXPNqWOX8mX4VSGNcfto6uGhcgti6dtuWovv
 pD5pdZzEUy4BZY4z3GNO2l6RHHVZsgo1ZdvhYUDVs9wKY0X76RzRY8GeK+rmU8+hDrZ/f1hf4SZ
 qHPrYTUMvUrJt4BNaGWEOTTOcth7r8AL9AfzdphJg8UhSYBZWALJrwfHGmtUGDye25IFDqkUDhy
 K/uTh9UZ1aDmwrwTEZm8941Jo5gSpD3ioeguPG1+KKIilPJyNKPhKQjvitMi3FIPUr8/RmIXdyQ
 sBLH/tB8+wP76UQaTDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230022

Add qcom,glymur-qmp-pcie-multiphy.yaml as a standalone binding
for the Glymur Gen5 PCIe PHY hardware block. This block supports two
link modes, selected at runtime via a TCSR syscon register:

1. x8 - a single 8-lane PHY instance is exposed
2. x4+x4 - two independent 4-lane PHY instances are exposed

Keep this as a separate schema from qcom,sc8280xp-qmp-pcie-phy.yaml
rather than folding it into the shared compatible list there, since the
two PHY instances active in x8 mode require twice as many clocks,
resets, and power-domains as any other entry in that file, and adding
Glymur-specific properties like qcom,link-mode and reg-names there
would only apply to this one compatible.

Document the required clocks, resets, and power-domains for both PHY
instances, and use #phy-cells = <1>, where the cell value is the PHY
index within the active link mode.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml       | 177 +++++++++++++++++++++
 1 file changed, 177 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml
new file mode 100644
index 000000000000..759f7f979dc6
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml
@@ -0,0 +1,177 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,glymur-qmp-gen5x8-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QMP PCIe multiple link-mode PHY controller (PCIe, Glymur)
+
+maintainers:
+  - Qiang Yu <qiang.yu@oss.qualcomm.com>
+  - Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
+
+description: |
+  The Glymur SoC uses a single PCIe Gen5 PHY hardware block for the
+  PCIe3a/PCIe3b controllers. This block supports two link modes, selected
+  at runtime via a TCSR syscon register:
+
+  1. x8 - a single 8-lane PHY instance is exposed (PCIe3a only)
+  2. x4+x4 - two independent 4-lane PHY instances are exposed (PCIe3a and
+     PCIe3b)
+
+  The node always describes both PHY instances ("port a" and "port b"),
+  regardless of which link mode is active on the board.
+
+properties:
+  compatible:
+    enum:
+      - qcom,glymur-qmp-gen5x8-pcie-phy
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: port_a
+      - const: port_b
+
+  clocks:
+    maxItems: 10
+
+  clock-names:
+    items:
+      - const: aux
+      - const: cfg_ahb
+      - const: ref
+      - const: rchng
+      - const: pipe
+      - const: phy_b_aux
+      - const: cfg_ahb_b
+      - const: rchng_b
+      - const: pipe_b
+      - const: pipediv2_b
+
+  power-domains:
+    maxItems: 2
+
+  power-domain-names:
+    items:
+      - const: port_a
+      - const: port_b
+
+  resets:
+    maxItems: 4
+
+  reset-names:
+    items:
+      - const: port_a
+      - const: port_a_nocsr
+      - const: port_b
+      - const: port_b_nocsr
+
+  vdda-phy-supply: true
+
+  vdda-pll-supply: true
+
+  vdda-refgen0p9-supply: true
+
+  vdda-refgen1p2-supply: true
+
+  qcom,link-mode:
+    description:
+      Reference to a register in the TCSR syscon that reports the link
+      mode the PCIe PHY is currently configured for, either a single x8
+      link or two independent x4 links. The link mode is programmed by
+      firmware before Linux boots; this property is only used to read
+      the active link mode, specified as a phandle to the syscon and
+      the register offset.
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle of TCSR syscon
+          - description: offset of link mode register
+
+  "#clock-cells":
+    const: 1
+
+  clock-output-names:
+    items:
+      - description: Name of the PHY A pipe clock output.
+      - description: Name of the PHY B pipe clock output.
+
+  "#phy-cells":
+    const: 1
+    description:
+      The cell is the index of the sub-PHY within the active link
+      mode, e.g. on Glymur, 0 for "port a" and 1 for "port b" in
+      x4x4 mode, and only index 0 (the single wide PHY) is valid in
+      x8 mode.
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+  - power-domains
+  - power-domain-names
+  - resets
+  - reset-names
+  - vdda-phy-supply
+  - vdda-pll-supply
+  - vdda-refgen0p9-supply
+  - vdda-refgen1p2-supply
+  - qcom,link-mode
+  - "#clock-cells"
+  - clock-output-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,glymur-gcc.h>
+    #include <dt-bindings/clock/qcom,glymur-tcsr.h>
+
+    phy@f00000 {
+      compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
+      reg = <0x00f00000 0x10000>, <0x00f10000 0x10000>;
+      reg-names = "port_a", "port_b";
+
+      clocks = <&gcc GCC_PCIE_PHY_3A_AUX_CLK>,
+               <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
+               <&tcsr TCSR_PCIE_3_CLKREF_EN>,
+               <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
+               <&gcc GCC_PCIE_3A_PIPE_CLK>,
+               <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
+               <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
+               <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
+               <&gcc GCC_PCIE_3B_PIPE_CLK>,
+               <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
+      clock-names = "aux", "cfg_ahb", "ref", "rchng", "pipe",
+                    "phy_b_aux", "cfg_ahb_b", "rchng_b", "pipe_b",
+                    "pipediv2_b";
+
+      resets = <&gcc GCC_PCIE_3A_PHY_BCR>,
+               <&gcc GCC_PCIE_3A_NOCSR_COM_PHY_BCR>,
+               <&gcc GCC_PCIE_3B_PHY_BCR>,
+               <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
+      reset-names = "port_a", "port_a_nocsr", "port_b", "port_b_nocsr";
+
+      power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
+                      <&gcc GCC_PCIE_3B_PHY_GDSC>;
+      power-domain-names = "port_a", "port_b";
+
+      vdda-phy-supply = <&vreg_l3c>;
+      vdda-pll-supply = <&vreg_l2c>;
+
+      vdda-refgen0p9-supply = <&vreg_l3c>;
+      vdda-refgen1p2-supply = <&vreg_l2c>;
+
+      qcom,link-mode = <&tcsr 0x5000>;
+
+      #clock-cells = <1>;
+      clock-output-names = "pcie3a_pipe_clk", "pcie3b_pipe_clk";
+
+      #phy-cells = <1>;
+    };

-- 
2.34.1

