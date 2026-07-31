Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E16735AC01
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474842; cv=none; b=HBkuW7ffxMM2cX+KV/hZl1EHdE7oDpeQKRNCOHiPHr+icM8vdAVpOuN78FTxSEYqVSIG/hPseXTlv1HcoIKocjaOEBKBCAYYh4ywaCih2WIJlv4X289dR9ZoJngrqRgrgJWqFZ7qmSuJ4+ur021x+vGbEAamDigUDeLYk6VDFd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474842; c=relaxed/simple;
	bh=nIE4RP1nvH/I5OfmQipfmCYyZB98Vyj5V9Dk8bDSL7I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dy7ybYqGJnz4SMlGaT5brOocF8Ht6HkwjU8tA6HbqwPnUi0Ur5NZ83B1E3SL5lyU1NqGvB/bPBe1IxOJ7AlADVjrxRiEEfI3PZwOTB4Kcd9Vd+tHlAUxd7QelQTO8ijqx2+UnYBNtJZLwjm9Cuo1K+dpUVbElKDa4vC4qOZDs+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=K3dbrLzq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mxt8clzP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="K3dbrLzq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mxt8clzP"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4upJn3277870
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3UayVYRACTp8s22CaHRScRzGLGgoOZltMnnxTkGRkSc=; b=K3dbrLzqiOEaSshd
	PIKJ6LdKJapaNkq1NoSalnvESf3rUC8rkZlHfRg1QV//hF2SVYfgLYbJPBQ4VJq+
	SpzJXi6XIQ91fkqBJcMA2rzkwuJvkDknCcXa8qdR1JJ5TH104j/IOHPA8aDsgJMV
	5fDt0rBtHEe2p0Y9Gb5HA82Y1nNz+jQEZ0CTydmTzqsccDgymGf9fpmH8wckQXUL
	QdSB0viCzm3mNsZ2LsWjcHgpz79v3jFzDgXLhoKxr40KgvhYFKcmMuVLHiqgPjVt
	a0V6Qld+T7hkwXSBaeXTNcfPcN+DQw+TOTWLetEJg65mv+Lz6bxb3MxKwDEa0lRD
	YFdVGQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0f829f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:13:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so749884a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 22:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785474837; x=1786079637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3UayVYRACTp8s22CaHRScRzGLGgoOZltMnnxTkGRkSc=;
        b=Mxt8clzPDb4Be2MsWoWvGbiW5tQJb1Kd8whjVFXdWHaruljrq04qkEy7voVDi1ALbG
         bxPv7dADYvIIYwiDQd7BPVBmBGkBJlq6Gx3Hb6oeE22OgOxGA4sKLL2XxTTR6IWHfKMR
         MUoUZogRi4TaCZFg5K4+iMuQES27p/nzMpTtGpRo2kbkImLCrr95Ur9T14Js8+yI1yfH
         Gt3k3O/QXwub2eyOplib0d01RWJKKwAbbm7vaYv28Iq0zIsE4J3XfNL4jNcls5OLHj2U
         qTsDxkmNnJJzsuTwzPuqG4y57V6or+M1uHwaW0o9lFLGdiuVWQTjOlHlQNl4JB5ycdwy
         swDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785474837; x=1786079637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3UayVYRACTp8s22CaHRScRzGLGgoOZltMnnxTkGRkSc=;
        b=fAkKD9OVUMkHlJnBymLh69AtkiNwonZbieMSim7Mp5zJ7UPfZPJTrJ9+eafvyi+kzZ
         6r3YUMPJX71xrYnBvdLvXlKXDVDw6PRfuMM9Ljth4N8e1TlUkPUEGVvDBx71oY6+T4pY
         lN9GR0tst9xOQWB88w0+NV9QgHUV9YyKmojJoyvF9JzzX/UWIzBq+iaUHXtbMhTgLKvV
         GdhoCnIvjoFK1kLz3h9ksrDx0oGsQYxeBttb2is1jYdZxYEITYWT39rHHmTtrMmU4V8P
         0w8pQJPFXJNXKkSNmpq3u9zCptN7GTqnUgoy+bv0gpFZfkNBQIqkcFUALYUZRAr0Gm/Z
         W8AA==
X-Forwarded-Encrypted: i=1; AHgh+RrmZIF2PAK4YvaNTe1/sTtRjeSyyNB3ctY1qv4AjpXwM7EMtxJZqynxJPAPzReQdFnQweTECvuZHm8VEVwQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzecj4CLtWvQhn67+CHkk0YdpsqvnVZi6uekZXRCcwpmk73Wi2z
	kGgkLTrmbvvgDoFCBxc1UZbeKW1Ws9TDAFOoz9LHmo8Wj0HNwT92w2wRAvhf5gU5tIpgaLc2I5L
	nUoW0qgbIc85SJHA5WHZwHSdEOxqQNVeqkBWjI2t8+2ztDIj9kBY0kgks0kcOgigm3y3B
X-Gm-Gg: AR+sD13oFPA4qEq9vhRVLswfDtzD7vejVAqFqPaARSWuFbxKdMUhQbTAp6XbzsIlBeD
	cHVinlGKKPany1RpYBmEDIWg5jt6H9jolMUmfJ6lJxquZcjtvSuGeNL6eCWxGxvEdHhD5/0UNV8
	s4GGdt2WoDiWJhZyMCvzhM+a5AyJpQXg9Qf+9CMFMlvJXXP+g9HPv3CDznGDGOouV925KGOoL5m
	GFlnC31X5oYEW9pqsKWINd99fsR2YPybAUm7LhWetsecYSFqtsVnf82MHw/FNY/wAzqSoIhUQl+
	/XISi50ZEubqlHeks+PSREpXNl26Kgn74OaBMh6c0aAyf5S7Rk4Mxa0Onjc/IHRDFc0B3JGb87K
	7Yw5SrX5JFUSEA8rXDn+0GiH63uEF1OkwlyN3yb11BCkxKGg=
X-Received: by 2002:a05:6a21:7703:b0:3c3:875d:705e with SMTP id adf61e73a8af0-3c91b111246mr478561637.19.1785474836857;
        Thu, 30 Jul 2026 22:13:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:7703:b0:3c3:875d:705e with SMTP id adf61e73a8af0-3c91b111246mr478548637.19.1785474836383;
        Thu, 30 Jul 2026 22:13:56 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm976435eec.20.2026.07.30.22.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:13:55 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:13:52 -0700
Subject: [PATCH v8 3/6] arm64: dts: qcom: glymur: Add PCIe3 PHY and PCIe3a
 controller nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-glymur_linkmode_0731-v8-3-a455265ad8bf@oss.qualcomm.com>
References: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
In-Reply-To: <20260730-glymur_linkmode_0731-v8-0-a455265ad8bf@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474832; l=11145;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=nIE4RP1nvH/I5OfmQipfmCYyZB98Vyj5V9Dk8bDSL7I=;
 b=Q3nAjp6AggH1SXsOtzRS9/oftqR6239GLDlfkgHtllWpdR/CLzoziIkQWwemH1LWqfuS6DS3f
 Srw8Rs/y+wsDhGpmzcg0R98QRBcHUN9EBWkd+4KdIXf8Xh8+VbiHJIH
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfX0FmXjqk5IUSa
 D3gfPtDdnLLeXFA4fedCaBHaa7RqsQaYBo/ERlNCKq8rdWSNlYmV9SQ44u64p301bS3cCj7VaX3
 eORwHUQDPNWfJs9oXTSor5FjQ1na93c=
X-Authority-Analysis: v=2.4 cv=HJTz0Itv c=1 sm=1 tr=0 ts=6a6c2f15 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=zsmDXcllmZpmxbIW-i4A:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: XWJPRtTIOIeinkaBzhgUmz7KeGGWeysQ
X-Proofpoint-GUID: XWJPRtTIOIeinkaBzhgUmz7KeGGWeysQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfXz0RhhkDvplKK
 Y/FB/GQHnvLcLLpTeHLJGr5nfJ4MtBWBbz4yGSNC1G+dsrTZtZ2AUWCu9xZ7GZCWe9QwWv2xtTZ
 yCBDZ1cMFTcRqmZ956laK2S+woRl4y9Vbi2WTnE4tqegWlLA+5p1UdpPLvj6ts7wFqpIQxj4sbN
 m0gKUcpCRjyf942GrR96XZSTsxTzwrN3AWjLPWBDeZOxztDFAwzWgv5chPjti7fP0nKgDKe22E4
 JbGdv/gw2kxx9GSOcg4KSe3/K/FsGhIvN1TZ5efNfw/whZ5AZP2aOZaFEeH7Q3juwiDzDOkd+kG
 mx2SERg2nkyRorqsEh1CAZQ8m1GOtYLVvlJwBXerj62bEDPOCOYu3cwc+YbbCsewsA/xYRf6F0O
 mNuCSCLwOiCjFYBYjn7Rf0r5tYs07JSVIYmTsZ2JMbVk9F2YHkWEBW3qwdkqzbAmT4wqO2Xc8XH
 E7Z1JyJcWcu7/rxyBcA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0 clxscore=1015
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310032

Add the PCIe3 PHY and the PCIe3a controller nodes. PCIe3a and PCIe3b share
a single Gen5x8 QMP PHY that can be configured either as one x8 link or as
two independent x4 links (bifurcated).

The shared PHY is modelled as a single pcie3_phy provider; each controller
selects its sub-PHY through &pcie3_phy (index 0 for PCIe3a, index 1 for
PCIe3b). Update the GCC pipe clock parent array to reference the new PHY's
clock outputs instead of the placeholders.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 336 ++++++++++++++++++++++++++++++++++-
 1 file changed, 334 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 4be7edf894b5..013d1dc9737b 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -801,8 +801,8 @@ gcc: clock-controller@100000 {
 				 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
 				 <0>,				/* USB 2 Phy PIPEGMUX */
 				 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
-				 <0>,				/* PCIe 3a */
-				 <0>,				/* PCIe 3b */
+				 <&pcie3_phy 0>,		/* PCIe 3a pipe */
+				 <&pcie3_phy 1>,		/* PCIe 3b pipe */
 				 <&pcie4_phy>,			/* PCIe 4 */
 				 <&pcie5_phy>,			/* PCIe 5 */
 				 <&pcie6_phy>,			/* PCIe 6 */
@@ -2374,6 +2374,62 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 			};
 		};
 
+		pcie3_phy: phy@f00000 {
+			compatible = "qcom,glymur-qmp-gen5x8-pcie-phy";
+			reg = <0x0 0x00f00000 0x0 0x10000>,
+			      <0x0 0x00f10000 0x0 0x10000>;
+			reg-names = "port_a",
+				    "port_b";
+
+			clocks = <&gcc GCC_PCIE_PHY_3A_AUX_CLK>,
+				 <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
+				 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
+				 <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_3A_PIPE_CLK>,
+				 <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
+				 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
+				 <&gcc GCC_PCIE_3B_PIPE_CLK>,
+				 <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
+			clock-names = "aux",
+				      "cfg_ahb",
+				      "ref",
+				      "rchng",
+				      "pipe",
+				      "phy_b_aux",
+				      "cfg_ahb_b",
+				      "rchng_b",
+				      "pipe_b",
+				      "pipediv2_b";
+
+			resets = <&gcc GCC_PCIE_3A_PHY_BCR>,
+				 <&gcc GCC_PCIE_3A_NOCSR_COM_PHY_BCR>,
+				 <&gcc GCC_PCIE_3B_PHY_BCR>,
+				 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
+			reset-names = "port_a",
+				      "port_a_nocsr",
+				      "port_b",
+				      "port_b_nocsr";
+
+			assigned-clocks = <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
+					  <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>, <100000000>;
+
+			power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
+					<&gcc GCC_PCIE_3B_PHY_GDSC>;
+			power-domain-names = "port_a", "port_b";
+
+			qcom,link-mode = <&tcsr 0x5000>;
+
+			#clock-cells = <1>;
+			clock-output-names = "pcie3a_pipe_clk",
+					     "pcie3b_pipe_clk";
+
+			#phy-cells = <1>;
+
+			status = "disabled";
+		};
+
 		usb_hs_phy: phy@fa0000 {
 			compatible = "qcom,glymur-m31-eusb2-phy",
 				     "qcom,sm8750-m31-eusb2-phy";
@@ -3755,6 +3811,8 @@ pcie3b_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3_phy 1>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -3766,6 +3824,280 @@ pcie3b_port0_ep: endpoint {
 			};
 		};
 
+		pcie3a: pcie@1c10000 {
+			device_type = "pci";
+			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
+			reg = <0x0 0x01c10000 0x0 0x3000>,
+			      <0x0 0x70000000 0x0 0xf20>,
+			      <0x0 0x70000f40 0x0 0xa8>,
+			      <0x0 0x70001000 0x0 0x4000>,
+			      <0x0 0x70100000 0x0 0x100000>,
+			      <0x0 0x01c13000 0x0 0x1000>;
+			reg-names = "parf",
+				    "dbi",
+				    "elbi",
+				    "atu",
+				    "config",
+				    "mhi";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
+				 <0x02000000 0x0 0x70300000 0x0 0x70300000 0x0 0x3d00000>,
+				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
+				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
+
+			bus-range = <0x00 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <3>;
+
+			operating-points-v2 = <&pcie3a_opp_table>;
+
+			msi-map = <0x0 &gic_its 0xb0000 0x10000>;
+			iommu-map = <0x0 &pcie_smmu 0x30000 0x10000>;
+
+			interrupts = <GIC_SPI 948 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 949 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 844 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 845 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 846 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 847 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 942 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "msi0",
+					  "msi1",
+					  "msi2",
+					  "msi3",
+					  "msi4",
+					  "msi5",
+					  "msi6",
+					  "msi7",
+					  "global";
+
+			#interrupt-cells = <1>;
+			interrupt-map-mask = <0 0 0 0x7>;
+			interrupt-map = <0 0 0 1 &intc 0 0 GIC_SPI 848 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 GIC_SPI 849 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 GIC_SPI 850 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 GIC_SPI 851 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_PCIE_3A_AUX_CLK>,
+				 <&gcc GCC_PCIE_3A_CFG_AHB_CLK>,
+				 <&gcc GCC_PCIE_3A_MSTR_AXI_CLK>,
+				 <&gcc GCC_PCIE_3A_SLV_AXI_CLK>,
+				 <&gcc GCC_PCIE_3A_SLV_Q2A_AXI_CLK>,
+				 <&gcc GCC_AGGRE_NOC_PCIE_3A_WEST_SF_AXI_CLK>;
+			clock-names = "aux",
+				      "cfg",
+				      "bus_master",
+				      "bus_slave",
+				      "slave_q2a",
+				      "noc_aggr";
+
+			assigned-clocks = <&gcc GCC_PCIE_3A_AUX_CLK>;
+			assigned-clock-rates = <19200000>;
+
+			interconnects = <&pcie_west_anoc MASTER_PCIE_3A QCOM_ICC_TAG_ALWAYS
+					&mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&hsc_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					&pcie_west_slv_noc SLAVE_PCIE_3A QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "pcie-mem",
+					     "cpu-pcie";
+
+			resets = <&gcc GCC_PCIE_3A_BCR>,
+				 <&gcc GCC_PCIE_3A_LINK_DOWN_BCR>;
+			reset-names = "pci",
+				      "link_down";
+
+			power-domains = <&gcc GCC_PCIE_3A_GDSC>;
+
+			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555
+						     0x5555 0x5555 0x5555 0x5555>;
+			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55>;
+			eq-presets-32gts = /bits/ 8 <0x55 0x55 0x55 0x55 0x55 0x55 0x55 0x55>;
+
+			status = "disabled";
+
+			pcie3a_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				/* GEN 1 x1 */
+				opp-2500000-1 {
+					opp-hz = /bits/ 64 <2500000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <250000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 1 x2 */
+				opp-5000000-1 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 1 x4 */
+				opp-10000000-1 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 1 x8 */
+				opp-20000000-1 {
+					opp-hz = /bits/ 64 <20000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <2000000 1>;
+					opp-level = <1>;
+				};
+
+				/* GEN 2 x1 */
+				opp-5000000-2 {
+					opp-hz = /bits/ 64 <5000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <500000 1>;
+					opp-level = <2>;
+				};
+
+				/* GEN 2 x2 */
+				opp-10000000-2 {
+					opp-hz = /bits/ 64 <10000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1000000 1>;
+					opp-level = <2>;
+				};
+
+				/* GEN 2 x4 */
+				opp-20000000-2 {
+					opp-hz = /bits/ 64 <20000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <2000000 1>;
+					opp-level = <2>;
+				};
+
+				/* GEN 2 x8 */
+				opp-40000000-2 {
+					opp-hz = /bits/ 64 <40000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <4000000 1>;
+					opp-level = <2>;
+				};
+
+				/* GEN 3 x1 */
+				opp-8000000-3 {
+					opp-hz = /bits/ 64 <8000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <984500 1>;
+					opp-level = <3>;
+				};
+
+				/* GEN 3 x2 */
+				opp-16000000-3 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <3>;
+				};
+
+				/* GEN 3 x4 */
+				opp-32000000-3 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <3938000 1>;
+					opp-level = <3>;
+				};
+
+				/* GEN 3 x8 */
+				opp-64000000-3 {
+					opp-hz = /bits/ 64 <64000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+					opp-peak-kBps = <7876000 1>;
+					opp-level = <3>;
+				};
+
+				/* GEN 4 x1 */
+				opp-16000000-4 {
+					opp-hz = /bits/ 64 <16000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <1969000 1>;
+					opp-level = <4>;
+				};
+
+				/* GEN 4 x2 */
+				opp-32000000-4 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <3938000 1>;
+					opp-level = <4>;
+				};
+
+				/* GEN 4 x4 */
+				opp-64000000-4 {
+					opp-hz = /bits/ 64 <64000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <7876000 1>;
+					opp-level = <4>;
+				};
+
+				/* GEN 4 x8 */
+				opp-128000000-4 {
+					opp-hz = /bits/ 64 <128000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+					opp-peak-kBps = <15753000 1>;
+					opp-level = <4>;
+				};
+
+				/* GEN 5 x1 */
+				opp-32000000-5 {
+					opp-hz = /bits/ 64 <32000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <3938000 1>;
+					opp-level = <5>;
+				};
+
+				/* GEN 5 x2 */
+				opp-64000000-5 {
+					opp-hz = /bits/ 64 <64000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <7876000 1>;
+					opp-level = <5>;
+				};
+
+				/* GEN 5 x4 */
+				opp-128000000-5 {
+					opp-hz = /bits/ 64 <128000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <15753000 1>;
+					opp-level = <5>;
+				};
+
+				/* GEN 5 x8 */
+				opp-256000000-5 {
+					opp-hz = /bits/ 64 <256000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+					opp-peak-kBps = <31506000 1>;
+					opp-level = <5>;
+				};
+			};
+
+			pcie3a_port0: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie3_phy 0>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
 		rng: rng@10c3000 {
 			compatible = "qcom,glymur-trng", "qcom,trng";
 			reg = <0x0 0x010c3000 0x0 0x1000>;

-- 
2.34.1

