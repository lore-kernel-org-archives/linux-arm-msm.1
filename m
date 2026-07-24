Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA0D3C10AE
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887308; cv=none; b=hbKRbwqWjTn34itux6emE+ue17oHlk8FNbuOFmBv8ZvsBtnZoQBwz9IVIk3E2M+0dy2mLrRs5A/1JpfbvPsUiOu/Pm3z8xKe23xKomX38Mqs6UaMEStF4iH5JKfXs1Tp57Ze+GLyrXGh+g++wTkBYv6GHNOIzKJiRPo7mxBzrOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887308; c=relaxed/simple;
	bh=jxxfUzpwxpcsF507GMs4HufzpqaCXog14p6kapOUu1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qHBtZnx96NV/YJLJXJ4m+fSl7s4Wyid3ZaFYQvVM8IGgb3xUlBTr0/5ZwSRv7S2Ps4usrwauSnONzxcl7J+5Tg7RVSKrcbHvhKL0mjGZwhSVXNZHoOQStVFerVNcHf/f3fc6PvsApDQpvV96aPNbtv9RGev0HIiQYLVtMlgaV1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aeW2twjZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=beHsTDde; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aeW2twjZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="beHsTDde"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lH1J1992171
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=; b=aeW2twjZGy3ArxpA
	xUnvOqnnSfbjYw693pcZe9M7TIE5eMf8RjuezcTT4oMAenx7Shd/mQiPNIY+GFRn
	OXNtzDqFO+R7E13NfCYHmI/GpuGajZEvowewA0jzXJRPOvL2ahnkLqFqaFRGi0/0
	wX0EtykAXffRCXjZjWI5Kxi7rFk4czDa3dvsg9CvoDbJx8E4lkPliZA2Fi3RILGp
	JfCejATywYeRdEjV5oGAtDC+fhmwL5eto7o2kQEfBPwDccn/hChIt84U8Ht0atyC
	FtQU9fafQWrh+3dFgSrKSOawGHzkzmbzXnD3KqwnTDj9Oy8ahZivwT6GdwpumEhT
	tFe1fA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0p5180r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8486c3411c8so308855b3a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:01:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887304; x=1785492104; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=;
        b=beHsTDdecGIsUEmHRlohvHXO5MDvg9DTOCMwd5Zd9XEGaL8iYt4gsxXiiPHQZsox36
         EYlxu23rgD8V6fHCt4X9zx+G+InOa1VoFmscJiZkAQ7wFzyqwI55Jx+ieD8SPeeV6lWx
         iL+AtBL1OypnnmukkddiljvK2XyApMoiZMgLQwsnlTsUepzvQU1dQpHq7Ym2V/Hc+dkf
         gyN/+5n1xpQteGEus0ALt4FRj3hBVIfzQwbhM03GAJ/y5TbcnfCrcIVv7LRKr62gRFEG
         DglivNzdOJuKeLr2Bc5WqPZ9NDYQ9AoEyDj1WN6+coJUdN9/sWk/li+7L8N3UWOuf9Fd
         rSXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887304; x=1785492104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=;
        b=Kdv0AZlxzapR4ota/tmXO2BWDI4KZQSo2GzCe4st0dw3vBh3C5RI5q3otKMb1BFYxj
         FxbLwylcR4icT2DtAvWVnrGSX8+x8RrTJqb0rF6OukPrBrINq4Z7zQMwMb36KnaXyxj2
         34qoRJFoDnCpD6MJWZTgjn9ref8TUPE5dw1UcOLO7/kPRGi4TkwGW1OtjJ3FM/7EJREJ
         Lg577PYIzIgdn7MFKDCPPzYHqpiN8/84vQV+FFMJ2BMXML5yRSe9Uh1nfvvSdynxTWbf
         QPperVhcn9jgJrbaD5vIvzOhEsaP7fVSesR5oQe6k7jmj2ifNTBfUvEwDy2zBKz7KEWg
         hsgg==
X-Forwarded-Encrypted: i=1; AHgh+RqxSl/dwevd8z2jKdpp/2EYy+SEq2+o3ppicPwOhTCDo0sqClb6RxVf2MaK0kxHzbIXdOV9J4g/jxs6gMge@vger.kernel.org
X-Gm-Message-State: AOJu0YyAh3qVDVIrE7pNxidZsgeyNXnyDufZNvP3/JmjJPNH0du4PIKN
	wRw/YdAeUfQW07czTPaFjJTLVM14OoH/DRQlJdPu6hl/w0/isEpwJu0ulE4+qodAl5Xy0tXRy8+
	s24UemJpfsea5tkSsvV1JmmV01869GRIqXELVYRDBpbG0c8uGkM5D73XB36KhEqSTSCv7
X-Gm-Gg: AR+sD135cYjz36XeHRKbSD31X5xh9wvjWmCt59xY6eMw7kOzmokeo9CJjsBvdS4d1/U
	wT/Ir3QaX/nXbhMwvB2XjgEuVwoEv+08Fv/ATUM+ZCLKGpheTGp32h/jFaCAjqZPaFnzovfcuWj
	FbzLFzpo+sviwBbbigwypCbU9mPTiTFEMXl7babayYIK83xlDeNefBpXEJsMBlFdIjV258mhv17
	NzG6U3+Q2zkZLoo/4TEAzIOPZjVDNuCLIV+Cn1J73ySQ5JJx+Vl9QCxhwi1dFusUWaHEmeBoAn3
	AsXW8+PcdCiF8v7Tug/UVo0UyjsokpbBYs+ZzKvMqS4jLFhQZ9vKY26icFg1q/NCK759RAQYaAO
	teE+mxTViO8/HOJcLudTApxIG3JhZEYLB4OKV6msZtt6RLWg=
X-Received: by 2002:a05:6a21:1f87:b0:3c3:7edc:3103 with SMTP id adf61e73a8af0-3c44b238816mr7656910637.62.1784887303796;
        Fri, 24 Jul 2026 03:01:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f87:b0:3c3:7edc:3103 with SMTP id adf61e73a8af0-3c44b238816mr7656873637.62.1784887303257;
        Fri, 24 Jul 2026 03:01:43 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm29515427eec.29.2026.07.24.03.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:01:42 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 03:01:19 -0700
Subject: [PATCH v7 1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-glymur_linkmode_0724-v7-1-65c8469c6b65@oss.qualcomm.com>
References: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
In-Reply-To: <20260724-glymur_linkmode_0724-v7-0-65c8469c6b65@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784887301; l=6637;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=jxxfUzpwxpcsF507GMs4HufzpqaCXog14p6kapOUu1k=;
 b=FYAs/GBK9/6SqbN0tIIsaQUye90Hp+0whshJs5jcLtkfispwFpJjbfbXnwevtZ9zPVaLE5+mS
 IpeenqvuZR/BnROXVnk9bMpC46W/2lDxfO9IxMYBPOv5SMwBjBF6O+a
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Pq6jqQM3 c=1 sm=1 tr=0 ts=6a633808 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TIvzfnD_jG5d2KfScrEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 20rUdzICQjLz6I_mSGzyRlX5QLWSmvaw
X-Proofpoint-ORIG-GUID: 20rUdzICQjLz6I_mSGzyRlX5QLWSmvaw
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX9qfu8vvdYVor
 /ZtMDa9ODFQA3Xolh1Za6v49wbNyjG3jf5P2tH8wA7C4mxjxWyP0SBIGNzRgQtRagiPhoZIUaQj
 DHhxXz2wlgBl9a1BtZppd7/0MyfIBK0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX+VGeYTy2a8bV
 +a3AbXB93dj3mIQkXZsdF4u53E2hX9QbgctTaQ/VkZjJxK1rHrui7DVlG+jYgLy0xrq9hfDNS7W
 cSBMFuDsaw1u1sstvdiwd7WhL8n+5MSzeUgsFGtKyOkaQ8FQhkCY5TPL+vgfhR6Rv49mj6bcyON
 U7npOkgL1KZ4ERdLEjOsCIpxExU6ixw/snRYRNohvIvyGHrZCXB+Qou+mzkCIARwn8L3bC/Efut
 h2ujq/6KI+Vunv2Z8h9b8DKrUCLyYckQjIZ9pHUkG7LiRPFaWIYl18UkLZKiq7ppV2SpUgNm+Hw
 KFnWfeepIYw0Kt6Q0WL6DPSMFJ6d4afErSIbItdfqGtpLvdTj069/M1FJh0cdEWJliCLtl2mKk1
 wN3FA4ubECkUKbIWiY/eg3P78C9kxNJ59jfIkB1Tm3R/Tamrhii6ZMW1KN/qJzK9ECWcB57fmw3
 /tG8P2l+CyJdfcJmxow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240091

Add qcom,glymur-qmp-gen5x8-pcie-phy.yaml as a standalone binding for the
Glymur Gen5 PCIe PHY hardware block. This block supports two link modes,
selected at runtime via a TCSR syscon register:

1. x8 - a single 8-lane PHY instance is exposed
2. x4+x4 - two independent 4-lane PHY instances are exposed

Keep this as a separate schema from qcom,sc8280xp-qmp-pcie-phy.yaml rather
than folding it into the shared compatible list there, since the two PHY
instances active in x8 mode require twice as many clocks, resets, and
power-domains as any other entry in that file, and adding Glymur-specific
properties like qcom,link-mode and reg-names there would only apply to
this one compatible.

Document the required clocks, resets, and power-domains for both PHY
instances, and use #phy-cells = <1>, where the cell value is the PHY
index within the active link mode.

Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

