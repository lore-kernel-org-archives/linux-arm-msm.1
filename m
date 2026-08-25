Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 683AF2C1586
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:40:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787629243; cv=none; b=V+Gd/g4xdYq2dPSdRx4vzbszjkZHLZhW2ZgMaU8LGTJ1qFiBIn2oSzCBwHzHacCYG/efn+QTieHYGx2tyHfWxuMXLb4y977IGmBxaydBft1azDSyyBtHE1yb5x45+UbET6waEQIZONPd3CBUJKWEJ8sk1BTfLQU84rfZ/H24L2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787629243; c=relaxed/simple;
	bh=c1AkoG+yGdvMCYRE5518ulkUS8DbNzuZSsPxijMQoqw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IidwnYDLZrDpFC7+isN7jd6Tnfp1V9//6NeqtZa62+AL/J6Ocit8lxxSZ9ICsfq9H1zEW4nr9Ed8XvrmF3XPQYZxEENX/KNP2ekYja8717uYIHXL4sUoOGoUcH1pMhLQytULYUIDKxXzkZvXbPNfTgb1dTLgsL3t3O1whqkdCco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UVfXzchp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqGXs1iS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UVfXzchp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqGXs1iS"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P2R58g125742
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AaMnaORW7GlecpR+g6Vv4sRfExKGCr9eXcEspf1Lv5w=; b=UVfXzchpTM0PqcjW
	jIQ3S73jmCkv+Ez70+F/b1YKXeIrCU/LQ9TaWNrejgajGR9mzbuxxlLB76d6kV25
	fqKO/T9Pv7UmEckhHGgy7yfc4Vqr6eVZQGG2s4vcpTDXiMuwb/GHP2BkzgTMJm33
	oxVyzyGPy7gyJ0Zf4ZyqJSei4eZTRdYdYX5vTqDEUgiD13QvTQhdOcduqyujJ0Es
	ELNAHc3aKKGp7usG3FWVClhap00Z8Is4feP1QPujawhqKB4UB2i45JQ3fYygAaHC
	o4BVyrOMyY5yDhkbgxSc6bAD4hZLTVVvff+DItL0JSZoKZ09nx2hbXP/Q6IICZsa
	/UbVJQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8rqujcfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:40:41 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e7ff7b375so6419985a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 20:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787629241; x=1788234041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AaMnaORW7GlecpR+g6Vv4sRfExKGCr9eXcEspf1Lv5w=;
        b=JqGXs1iSodhznCp0kxcSCQr6hBU1TM9efcBwXBJ0MajM0thJq+C0P5Yd3PgvHvxB53
         GpnqFICyvoVGgNT35gVcbLk4jD5lY7Q2gRSIQbWDwFffKtufq+n719jhJPl3/4H+chzG
         KkKaXytLDOFRWnepiv6QalFnLtx4+9gxFsPC4kHEz0UC9DumynNLiSrRrn8KVGTfUdvQ
         Ad6RdaefumoK+VS9D0CzzyKx4msSxm93TNIJqoFzb64s9IUGNKsV9sVYUeRLC7WJnn9U
         756TCvdDJJp6+pIrzde3SjpK7M7N3+xTpbLyH8ulJwxfkh2X/vKmN7UziC5wdvhWI+pY
         BR8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787629241; x=1788234041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AaMnaORW7GlecpR+g6Vv4sRfExKGCr9eXcEspf1Lv5w=;
        b=ECzmvcLmv/iKtAL6/9lGNA+iofQ7sg8tNEPez2V0ujJoCjTDZWHZuetRZxyHxCi70d
         BXrddxt7c/E8nd/ZpFWLu5b9hiDJE4RN3sGDW9Yp4LyEWitrxNiu2QVSt7SrGD2+AkBR
         fu0x1M8NiyTd3H2vEoF6li1/9GSpZ9m4zM5oQ3jLYMSv7NcdTdEJ17h7WSW1FtI0pOOF
         rVGwfLWqG+Fi80Zy/ZeNJtqJ3C3NLpxKzJkaViaW4WmPfl9m3orvX8Q1pCUkM7Vr0duV
         HldgrhsmZVHTqeFLxdvkinfiD/HJFp0A3enilCDUcC2cCDxjKgsR0KEZjBGoxrkQ9CmU
         UE0Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro0wDXaRZSrmxJjj9NyTFy4PxdRNKQW3yKGKVBp6Uk1+xVsICAkgfajGWY/Ft4jHhUT5/zCmgAkJ1nfeiKj@vger.kernel.org
X-Gm-Message-State: AFuF++kTD83CsYC5VXwllG4fh7p+6J/fxOp4WFIo19j8G8rihNt2IizN
	Nvn0voTtlkMtITgAhv+q5y7WWqTJ77WG/32G9k6WsXtbSmPHv4lz8oiLUSv+vWW4jHKKHSR+Sp+
	NJ5/NY6ffafH2hvjPS6Qpl3b/9ssmaxI+TOeK/SGEOJ1wsLMXRLhqCBlFRznsKdcKJ3nJ
X-Gm-Gg: AR+sD11xO+Ln5Wc806wSZdvOfY6SwPUfsfCS/DJSGvZnDpI5PrdFNJI49DolryZcT0N
	0Y4zDRpa/pbKLSkhuWfvXlUN3noGdvzSmKRLilprG251L1lyIippYcm8TwyvAAFrJxkirGzrCR0
	1jJePqXlbU+HeWCKYyrXne93NMqTA/0DfmC6/Hp3vcGF6lsED+8RXjWVpuJjlfnOEIBElInePmD
	ebkwA2k5eXk7u0bXlXOtb9uNNG0mbjSH41q3NVLdJviuvGlAOBK3QtGGbIhq0GRhLXBINzAQQRQ
	PZgxszHpm+VK50HwXaotKYkcdMIkUeDkAGKcZco21Lqgb357neq5twCT8Bzdt2uwp1lgExkQfJv
	G6GKCJy38fFpDaMqiGi88h4c4qNL++AWJKqM=
X-Received: by 2002:a17:90b:582e:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-3964652c610mr6937288a91.13.1787629240964;
        Mon, 24 Aug 2026 20:40:40 -0700 (PDT)
X-Received: by 2002:a17:90b:582e:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-3964652c610mr6937225a91.13.1787629240466;
        Mon, 24 Aug 2026 20:40:40 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f91d36f9sm46440083eec.16.2026.08.24.20.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 20:40:40 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 09:10:22 +0530
Subject: [PATCH 1/4] dt-bindings: phy: qcom: add Nord QMP PCIe PHY binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260825-nord-v1-1-7c02f2b8765a@oss.qualcomm.com>
References: <20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com>
In-Reply-To: <20260825-nord-v1-0-7c02f2b8765a@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787629229; l=9968;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=c1AkoG+yGdvMCYRE5518ulkUS8DbNzuZSsPxijMQoqw=;
 b=XF+s+nyZlYFSHwv1AbIzPCAwdfChuLmJdPcudEfY+RqGtpTT7xV38oILbZAjTsiLVjYPj2C0Z
 K2slUaxR/p7BOkda31zI8FNMcffILPN0j+bbByf3zlkjyiP2cFbt93r
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-ORIG-GUID: EDbqAO1Xha-yljEXlBjoppH3jIaQArzE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfX2uBoCsR2yBYS
 MIFG5hUtNaGrwQYfWtADIcEAwKswdEeQ1uYCSaAcoROAlEgdQhg3J0Awrje+rbJB2amzKA59zC2
 ttbTR5EvvfQ3dSEQvBG9P4y25xBHBjE=
X-Authority-Analysis: v=2.4 cv=CbQ4Irrl c=1 sm=1 tr=0 ts=6a8d0eb9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=m1JAq1APDOtiVc4_LWMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: EDbqAO1Xha-yljEXlBjoppH3jIaQArzE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDAyOCBTYWx0ZWRfXzV1PNSUI/Vsf
 CoyCrzY5nuOFXKbDFBmciwX0YUEfQNf+ukpCz3Nao79dW6eIVaOI6fsbqf6hNvBxSfrRAH+/pKP
 bqoRA1TdKPDBt/y80EI0O4aeettqPaW2O4VbWNmfOUuqunYe8bKxPrlcDecr+Sm9DlR8usFG6qX
 YajLejdiV8c/w4oGcsdDgipjXfZO2sMoQBcj92INf8ZVG3KDcWTgb2uESQN8pfwvSqKUjyC0502
 10d/IvSnjN9MT7d6Nbs6u/L5x78KXxoiV8Tv+WmxcFKIY4cS8cwAcKEx5e+sdThgdBeuO28jwXB
 4D3sKSiU4SGpRcukkdApI9qC+O3aVzkCWrqVt86pe7UucxqCQS/BxpCm7pnOyOrW9W+UV73a2BT
 YqRGFM+gjqk0EMXbbukEJMzPgQYuUqt4oPDdJ3Tm4sN8l3uVX58+wIKSHn0s6BBsKLqHm/5jNpl
 3u9pBqgn75EQ/1pbUZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250028

Document the PCIe PHY found on the Qualcomm Nord platform.

Nord has a Gen5-capable QMP PCIe PHY that can operate in multiple
lane configurations using four PHY segments (A/B/C/D). The active
topology is selected by firmware through a TCSR configuration
register and may be configured as x16, x8+x8, x8+x4+x4, or
x8+x4+x2+x2.

The binding describes the register regions, clocks, resets, power
domains, regulators, PHY provider interface, clock provider interface,
and the qcom,link-mode property used by the driver to discover the
active lane configuration programmed by firmware.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 .../bindings/phy/qcom,nord-qmp-pcie-phy.yaml       | 276 +++++++++++++++++++++
 1 file changed, 276 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,nord-qmp-pcie-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-pcie-phy.yaml
new file mode 100644
index 000000000000..3575e99dadfd
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,nord-qmp-pcie-phy.yaml
@@ -0,0 +1,276 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,nord-qmp-pcie-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Nord QMP Bifurcated PCIe PHY
+
+maintainers:
+  - Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
+
+description: |
+  The Qualcomm Nord PCIe PHY is a Gen5-capable QMP PCIe PHY composed
+  of four PHY ports (A/B/C/D). The ports can be combined to support
+  multiple lane topologies, including x16, x8+x8, x8+x4+x4 and
+  x8+x4+x2+x2 configurations.
+
+  The selected topology is determined by the PCIe link configuration mode
+  programmed in TCSR registers. Depending on the selected mode, PHY ports
+  may operate independently or be grouped together to form wider PCIe links.
+
+  Each port provides dedicated register space, clocks, resets and power
+  resources required for PHY operation.
+
+properties:
+  compatible:
+    enum:
+      - qcom,nord-qmp-gen5x16-pcie-phy
+
+  reg:
+    minItems: 4
+    maxItems: 4
+
+  reg-names:
+    items:
+      - const: port_a
+      - const: port_b
+      - const: port_c
+      - const: port_d
+
+  clocks:
+    minItems: 17
+    maxItems: 17
+
+  clock-names:
+    items:
+      - const: aux_a
+      - const: cfg_ahb_a
+      - const: rchng_a
+      - const: pipe_a
+      - const: aux_b
+      - const: cfg_ahb_b
+      - const: rchng_b
+      - const: pipe_b
+      - const: aux_c
+      - const: cfg_ahb_c
+      - const: rchng_c
+      - const: pipe_c
+      - const: aux_d
+      - const: cfg_ahb_d
+      - const: rchng_d
+      - const: pipe_d
+      - const: ref
+
+  power-domains:
+    minItems: 4
+    maxItems: 4
+
+  power-domain-names:
+    items:
+      - const: port_a
+      - const: port_b
+      - const: port_c
+      - const: port_d
+
+  resets:
+    minItems: 8
+    maxItems: 8
+
+  reset-names:
+    items:
+      - const: port_a
+      - const: port_a_nocsr
+      - const: port_b
+      - const: port_b_nocsr
+      - const: port_c
+      - const: port_c_nocsr
+      - const: port_d
+      - const: port_d_nocsr
+
+  vdda-phy-a-supply: true
+
+  vdda-phy-b-supply: true
+
+  vdda-phy-c-supply: true
+
+  vdda-phy-d-supply: true
+
+  vdda-pll-a-supply: true
+
+  vdda-pll-b-supply: true
+
+  vdda-pll-c-supply: true
+
+  vdda-pll-d-supply: true
+
+  qcom,link-mode:
+    description: |
+      Reference to the TCSR syscon and the offset of the
+      TCSR_PCIE_LINK_CONFIG_MODE register.
+        0 (QMP_PCIE_NORD_MODE_X16)        — all ports ganged as x16
+        1 (QMP_PCIE_NORD_MODE_X8_X8)      — x8 (port A) + x8 (port B+C+D)
+        2 (QMP_PCIE_NORD_MODE_X8_X4_X4)   — x8 (A) + x4 (B) + x4 (C+D)
+        3 (QMP_PCIE_NORD_MODE_X8_X4_X2_X2)— x8 (A) + x4 (B) + x2 (C) + x2 (D)
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle of the TCSR syscon
+          - description: Offset of TCSR_PCIE_LINK_CONFIG_MODE register
+
+  "#clock-cells":
+    const: 1
+    description: |
+      Selects the pipe clock output by port index (0=A, 1=B, 2=C, 3=D).
+      GCC pipe-clock mux parents reference this provider.
+
+  clock-output-names:
+    minItems: 1
+    maxItems: 4
+    description: Names for each port pipe clock output.
+
+  "#phy-cells":
+    const: 1
+    description: |
+      Selects the PHY instance by index:
+        0 — port A (up to Gen4 x8; anchor in x16 mode)
+        1 — port B (up to Gen4 x4)
+        2 — port C (up to Gen2 x2)
+        3 — port D (up to Gen2 x2)
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
+  - vdda-phy-a-supply
+  - vdda-phy-b-supply
+  - vdda-phy-c-supply
+  - vdda-phy-d-supply
+  - vdda-pll-a-supply
+  - vdda-pll-b-supply
+  - vdda-pll-c-supply
+  - vdda-pll-d-supply
+  - qcom,link-mode
+  - "#clock-cells"
+  - clock-output-names
+  - "#phy-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,nord-gcc.h>
+    #include <dt-bindings/clock/qcom,nord-tcsrcc.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        phy@1b00000 {
+            compatible = "qcom,nord-qmp-gen5x16-pcie-phy";
+
+            reg = <0x0 0x01b00000 0x0 0x10000>,
+                  <0x0 0x01b10000 0x0 0x10000>,
+                  <0x0 0x01b20000 0x0 0x10000>,
+                  <0x0 0x01b30000 0x0 0x10000>;
+            reg-names = "port_a",
+                        "port_b",
+                        "port_c",
+                        "port_d";
+
+            clocks = <&gcc GCC_PCIE_A_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_A_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_A_PIPE_CLK>,
+                     <&gcc GCC_PCIE_B_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_B_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_B_PIPE_CLK>,
+                     <&gcc GCC_PCIE_C_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_C_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_C_PIPE_CLK>,
+                     <&gcc GCC_PCIE_D_PHY_AUX_CLK>,
+                     <&gcc GCC_PCIE_D_CFG_AHB_CLK>,
+                     <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>,
+                     <&gcc GCC_PCIE_D_PIPE_CLK>,
+                     <&tcsrcc TCSR_PCIE_CLKREF_EN>;
+            clock-names = "aux_a",
+                          "cfg_ahb_a",
+                          "rchng_a",
+                          "pipe_a",
+                          "aux_b",
+                          "cfg_ahb_b",
+                          "rchng_b",
+                          "pipe_b",
+                          "aux_c",
+                          "cfg_ahb_c",
+                          "rchng_c",
+                          "pipe_c",
+                          "aux_d",
+                          "cfg_ahb_d",
+                          "rchng_d",
+                          "pipe_d",
+                          "ref";
+
+            assigned-clocks = <&gcc GCC_PCIE_A_PHY_RCHNG_CLK>,
+                              <&gcc GCC_PCIE_B_PHY_RCHNG_CLK>,
+                              <&gcc GCC_PCIE_C_PHY_RCHNG_CLK>,
+                              <&gcc GCC_PCIE_D_PHY_RCHNG_CLK>;
+            assigned-clock-rates = <100000000>, <100000000>,
+                                   <100000000>, <100000000>;
+
+            power-domains = <&gcc GCC_PCIE_A_PHY_GDSC>,
+                            <&gcc GCC_PCIE_B_PHY_GDSC>,
+                            <&gcc GCC_PCIE_C_PHY_GDSC>,
+                            <&gcc GCC_PCIE_D_PHY_GDSC>;
+            power-domain-names = "port_a",
+                                 "port_b",
+                                 "port_c",
+                                 "port_d";
+
+            resets = <&gcc GCC_PCIE_A_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_A_NOCSR_COM_PHY_BCR>,
+                     <&gcc GCC_PCIE_B_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_B_NOCSR_COM_PHY_BCR>,
+                     <&gcc GCC_PCIE_C_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_C_NOCSR_COM_PHY_BCR>,
+                     <&gcc GCC_PCIE_D_PHY_COM_BCR>,
+                     <&gcc GCC_PCIE_D_NOCSR_COM_PHY_BCR>;
+            reset-names = "port_a",
+                          "port_a_nocsr",
+                          "port_b",
+                          "port_b_nocsr",
+                          "port_c",
+                          "port_c_nocsr",
+                          "port_d",
+                          "port_d_nocsr";
+
+            vdda-phy-a-supply = <&vreg_l6a_1p2>;
+            vdda-phy-b-supply = <&vreg_l4a_1p2>;
+            vdda-phy-c-supply = <&vreg_l4a_1p2>;
+            vdda-phy-d-supply = <&vreg_l4a_1p2>;
+            vdda-pll-a-supply = <&vreg_l1e_0p9>;
+            vdda-pll-b-supply = <&vreg_l1e_0p9>;
+            vdda-pll-c-supply = <&vreg_l1e_0p9>;
+            vdda-pll-d-supply = <&vreg_l1e_0p9>;
+
+            qcom,link-mode = <&tcsr 0x71050>;
+
+            #clock-cells = <1>;
+            clock-output-names = "pcie_a_pipe_clk",
+                                 "pcie_b_pipe_clk",
+                                 "pcie_c_pipe_clk",
+                                 "pcie_d_pipe_clk";
+
+            #phy-cells = <1>;
+            status = "disabled";
+        };
+    };

-- 
2.34.1

