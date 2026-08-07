Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD224364942
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 09:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096285; cv=none; b=TdTx0xz+dyuD9XcyvYeo8QEed+441MLbzx1uE8O06p6yUdRpoqcJYm+GYUMPXNuD0ZPJbWGJKmUu2vVXX/8y6VFx0p3yWZ4CZWTVS/y+63LJFpgx5YcIrvvxn8UD5OyB4FkJmz/YUQSgzVAnxBIHOYzupSKjgah/m/5TGGI+v5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096285; c=relaxed/simple;
	bh=jxxfUzpwxpcsF507GMs4HufzpqaCXog14p6kapOUu1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYfWchtUFTkX3YxSH7fC5U6uwTqfxN8DE7cbTblw8unryWZzK+8aZQwJwk5xBSQYRx43f0/Pk4CAWpJDmt4ZSyYAWCs4kqfpsoukN8ssPCmK8fwikHHA0BiPlY9fntHEs0KrJW1TkwQwp0VyBqPXnLBURFZ5sguZsUPQu7qmCRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PoV25cY3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GIGleD41; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PoV25cY3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GIGleD41"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777NdW73564240
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 09:51:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=; b=PoV25cY37jscBNbc
	hrIm+0L7fDaH5fmKvWw1CixAq4oxwu/krvi1bADwogxKbkTD1AA3YJODzVNMfrUS
	PuRwlk8NHcNz5y6XisgejZX8jWYD+xO6nwLbkvGG214BHTaGvN0snI/KHjGvuU2m
	GjRkPKZDP569dphNjkKnLqxJrd631z+mPu9p7qHr+MP5rJ3NhottHaQTBWezqd0/
	gybkDlylFB3+Dbm6R/NJdLvosN6cYjOkzvDIs/q96aSt+qbzHkTyMkDe/ZI3Rsbt
	9pQ/8SsJxEKZ7Dhc7yMJWhgwtmNLQ0BxuwrEiIAxAuPQAlT0T6x2Wwsw2pM8fPjr
	JD1cuQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6ju7n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 09:51:22 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-84e4ef486c7so1771895b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 02:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786096282; x=1786701082; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=;
        b=GIGleD41K+gd2gx6S3JBaBs8HT3IaXSrGOcpfq9O7m9eBbCiwYG3MHKGe/MwP/ZVTM
         ShrGFosKMVcAGD8EUUwI4yrgJChb6KQIZ4nELZMXBh5YJB/JWMfBBitpBjGhjOrmttf/
         PEyK9D3ZBe/hrq8hncyQ2M2VUsy3jllA8nI0zYvzDRkLGimvbc5Cgpc04+L7MwA8QT8k
         vtxvKAIC60p3d+E+abA/bLODlZVvq2378T6BCVg/us8P2bHd0f+qfMCF5u5REgWlE/Tw
         NDMSxQhowOhSe7zpeNLlyHR0R4q04496DrgViodeBL5CQFsEG9MhVEYz4OouSqOUhyqV
         BBFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786096282; x=1786701082;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aaxlFtNjKh+DqkL1yvWnJp/JonNPzRvAbqtW8DOElmE=;
        b=emTbwzlAaAqUS+uAmDb5B88/l+LGHVlhOCyMTN7/NkSvGO0Gi0mPAoPk5ey0UStuSE
         5TgibG18u7mFpLt8lzQeendrLMm/Mk6UHBJ8/Ye8TZriOgnFAWgWJiZxf88u1KZO7tKi
         OCAzVJeaVo7LK5TBRtb8oY0xW/HmR9hUZpdJ+OPwaR3U5FhnYD3kM/6aJRxBFPj82LB8
         pJqE5z8eHU8ADI//BCKnzKdDi67RDXQk+Gc1eKkEX2z8y+VD2tOmJMj0inVeKNvMt7Jx
         B8u+1U4ZKZHLZdjRBdo0ri/3PiPyb8oYwyr+tbBlf0hu8iHKdj3s6oqGWpyz44dDf+xm
         19EA==
X-Forwarded-Encrypted: i=1; AHgh+Rp6nnXXcX5V57yZ2r/vJtWdi/hBYebU+wMtW870/pEeh7Puc5hQKfVXiVavRAoPl7PGtR8CxNlq6qkZyzVF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+rY6LRO99p389Tzm6/b20ChsziAhh7cPrI53zKnpLR2QLuKc+
	sf6u6QAU0RdhDPILvmWDnklNl3dbsqiXOgCXsB+pyUJicFERfmDdDQRo1w+77FQr467NkIaKbYW
	DN9fYGSmJGyQRvL6e0skiOTq/ybd6PTlRxZ1ZRJyfwkx3M/3MGU9RaWkCTpWe3zCUZNPX
X-Gm-Gg: AR+sD12Bu0uSlec2H6Keu2txuStkk4iFfLadmZnHeyL4y8iSN50qI7pvRJI7w4TUGKx
	PEJ4t0039kOoyY1cB6Fbw02pTRky+RipnTxvTjhsEutXStxERLJK02jnfk0vVHeEMrPSA9+I4r+
	m/8/ImJqd8B46R3oYddb2zBi0rWbqrPJXefLHXtrGPFQZAuFgkKqxPGNzCDBbB6oZune7p75Ed/
	hxAoh0TgHkSX2wMrK7KgppzL5QR2aHJNCJPYHH2Rf6GtIYzWa0d8Vv1g2UWg9f8TcHX4QS9mA5m
	0n8owCD+loEY06P8Dq4UJjRmWNNWfl5DfZdIIjJGhUkxhQp8BLn7GrwkeVIEotUcDI2cLSSPs7D
	vu0/hc6XXdyse+cJ4jAbLvYd4Pvoy1MeHm6mlFWud4SLvMkE=
X-Received: by 2002:a05:6a00:2d16:b0:84c:241e:9070 with SMTP id d2e1a72fcca58-84f47ff528bmr11222615b3a.17.1786096281974;
        Fri, 07 Aug 2026 02:51:21 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d16:b0:84c:241e:9070 with SMTP id d2e1a72fcca58-84f47ff528bmr11222568b3a.17.1786096281534;
        Fri, 07 Aug 2026 02:51:21 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3cad9dsm743785b3a.23.2026.08.07.02.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 02:51:21 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 02:51:10 -0700
Subject: [PATCH v9 1/6] dt-bindings: phy: qcom: Add Glymur QMP PCIe
 multiple link-mode PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-glymur_linkmode_0807-v9-1-dd1c7e236e29@oss.qualcomm.com>
References: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
In-Reply-To: <20260807-glymur_linkmode_0807-v9-0-dd1c7e236e29@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786096278; l=6637;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=jxxfUzpwxpcsF507GMs4HufzpqaCXog14p6kapOUu1k=;
 b=E8dY8N5uWjW+uPlM643rXPJ0bF28E3PgyBrktmNAwKSXJRAiFRHD9EfphZMBIvPqnsKTdUQFF
 cve1PZeI2yzAOCh4o0xmtPs572G998MQoPyOrPvy7RKH5xemeU8NK7X
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=Rt/16imK c=1 sm=1 tr=0 ts=6a75aa9a cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=TIvzfnD_jG5d2KfScrEA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX0dARxtZQ6xN0
 osgwNgcmNGwysPE+TLNTpFOj+5EGH5aflJS6HYsMvIGsi7ZSnOxYh3ryMTgSHoVdqsRBRY6WEgl
 zJuWAStPBfbQ2i85b6RX5O5G9jhh4oRo3xBc8EoUpkhGo0HzAdXgT+59u+07MEo7o5la61O1om4
 gBo8YHQ6Rv5mz0GFrnao1xw1EXlDhDyRdq3jbYxmppI72MCMhIamgVpqG4PMcFP/EHFHBnLKkTi
 ABTJ5d5auc9IHFZ7egWltQMA9Tw00ZEdiiBWqXF49/54E+PRAHdarqFzWS0/58738SLzmfEGok3
 2/jinXPe6POCNA84M8c+ttYd8KnXuiQ3juolrAiWtCK39A4nKwZj6SAKH6IYNzXahlr2Lxr4VvP
 jHEHhodYhNJX2qHDtsxJL+Rmf2LVBiKDobM6RVqrwld3xxIIKyla+Q+R0QEOiaUUMVa0J4S3n7Y
 hPymQ6eqJYjKsYlS+Rg==
X-Proofpoint-GUID: j1PTuQplHCaDTf5ClXh6D3TXv7fcpVlR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NCBTYWx0ZWRfX+vzx25Yvvaj+
 rp3YR8KOMxpIvA15MT7jTwPrL71oyNGN75xNXjMSbvsPmSp1mLBuJpwf23fTn9W9K9gPey2O138
 y4QItJffHikVwsJJCYkcU1F4SWw9rXg=
X-Proofpoint-ORIG-GUID: j1PTuQplHCaDTf5ClXh6D3TXv7fcpVlR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070074

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

