Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFC7E3E7BAF
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784282330; cv=none; b=HRokkYJbi1gsLPpfhi0N8+INQSklq9xHAvpbkj4CmJUm8iwpqUytPi0AMzVN59vp3d76XABzjgioXza8eN9FgfKRG6rViHBos+W99pIThLINN3AxmB1ak/HczclIq4WTXvltDk+TgEKRlqUkfajAM+IXDfL4AmWp5Go/73DmzcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784282330; c=relaxed/simple;
	bh=m4HovyWy/veIkkYmi9SC6EFbB2VJ3EZARceVbS+ZD4E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ELwzZfLQr6nq0kf7u1KFBJTsVn7aFnB8a0Vo6kFuAVXg+h1yiaZ1Cc990XiVxMsejcrwqdDwEA/soC5l5RZJ01Zhv5z1+zeCZ2P93XW81lSb7sFjJf+Uc6qIwkdHU1wvIt27z2QXzfcdYuG8B9iWOVHvU7h8FqeaefVf9j+9HZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QwOymOkg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aVDBpO9p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QwOymOkg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aVDBpO9p"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H6cGis1160828
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PPJVjnyQDhn0JypEbQRGL0icNioWZCkFKhWku4ucmng=; b=QwOymOkgC12iRr0l
	fj0exbUy9HCqL8n6nrU6YDOqjrflT+R1lXYK+OEGD2OXcuEpqTE506OFvKNKsEcx
	wtZ8ay65910xu6X/XWGGzRIiuKfHox4lGtPH7Ft4Ez1048ypyMSYGsAWdI5bx86p
	WkHQPRjLzKP5wgeu0KONfjO8xZHIlAI2nLMRgt3PrybVhGqqodRSItHM7Eb/bS/j
	wN5Twne6YjQtMiob/8+y4AIJaC0ldSEE3s1RYbV7PMzKV9IUVr5DsM5R8jgbAA2T
	Ph8X/Ffek0hWXpah/DyJp2YYN7WfeWUDHEL2uHNAR2WZtR/Dk03znqlKHZwANaIA
	iEpbtA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffd3as851-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 09:58:45 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-381ed6616f7so11658244a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 02:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784282325; x=1784887125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PPJVjnyQDhn0JypEbQRGL0icNioWZCkFKhWku4ucmng=;
        b=aVDBpO9pIVPhaKoR3zOh5TL5sdoIipM0DOfMf68+sy/O0WrVeuxuCYLkshC+xY+srQ
         ALpfrljAYKl2G6dNjbKY9NykdUjyhPNQKpzixgmVLYLOBWNI8XPbmHPR19wkh9W81ivx
         eAZSWeqRzIHWVbZUkOOVeOszukbTWKpcEN1j1VJndueh5AJRWuHLOybF9alTlpnGk+5m
         dWMI6eF0+XfAFDucwnKJzYTJgv5ga6DVF7ny9U+Ad1JareCfrFHTbRFhl4ThEdzZ1Bpm
         jSSVwZWesatok/2knf0KsK1wYSv10y7z4Ay5L1cqu9ikU5ywKQW5kfiy28sJTy2fN+Ac
         weGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784282325; x=1784887125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PPJVjnyQDhn0JypEbQRGL0icNioWZCkFKhWku4ucmng=;
        b=IB6Ha1nuujPT1zYa2olFQw1orbyW5j+oXfnDp9kUWq8oOkNpTqcs0PTROPQ6xJxgVz
         VvEQnn2aU9tT20a1XFYBculYDsAgvioiekaFXTvPQ0cVTiZX4K5vyB22IvPF5yjshLuk
         KQTCgzdnlYWYtArWnEEUuZig0JIBJ1Uvko84GZu1tx1lmeskMoggjebcGC4EgMc78VMB
         7GmYrpc9VFJJrGDb7mi/R75wYQsSFR4VxnhYVfv36Rp8jo3P+9ez8KVIBse2WCCjwaql
         rIZFfTYNk3WdeNTZbcCIltf5mj4ZKa6l7XZsAhbCs/7F0IFNDFO2s48S2lDAs1i1HCUR
         U/hw==
X-Forwarded-Encrypted: i=1; AHgh+RrmuVvU4DoXnzgvmhbn00hkmvJbmABJTrXkcoz70shnpVNoIFa1xin0LFz1NfPBXm/EYn6QFd6giXCgfJ4G@vger.kernel.org
X-Gm-Message-State: AOJu0Yxe3aaQJKKW9YPtIAmCpJqJJsGn5GM1WRql8OyQBF2J77SQTNBj
	TzbYLZi0FgG1i8V6hFYOJ+wlaCpw1hPSvvx0xejVDOxsoRK20HpMXSPoHhwjqrQvH6M8vh/HjuB
	Mqpdoc2ctqJ0q8lV/3/wFfcAAzq10eiEPZhbEgVGE94jtivdhPxLmG8YajStur2hgV5YpklsQyj
	uz
X-Gm-Gg: AfdE7cm3AWwdF5KQjY8P3MpiA5e7hXNjVNped5KDrvS5wGcRBoAxT8TXiKAX5Q7Oftd
	kNp0c7KBIcV50055GZuBcFgat4Jfwm9p0KPr16ohD4Lf89ggqyDeaxTFGBjdPURMelcLVAM9lj6
	eHAr+1UY1STa4kExuinBIIPrHC0WxjHc/b478S2AUccAFfxY8Je6ofN3mFdt2K805Bgi1xqyZgq
	qL0kUDf4QE60CCpQsbbmem3BA+9YRVvYtnW7MS/ZTex4WJgsG1bbk+83qV9cagjvaj2q5HKHXsy
	lx+KvHhj/sOdCQuMgybmOaDgQZVyGznjJx795nmlmR5jSIlQd1KYjfoQSyd7ECCPBCKmTEBjIU6
	zqTOFpULWkxxGqX+nvQLBYMdpzY27eGsp6xwBkh5/H1DB5ks=
X-Received: by 2002:a17:90b:4ac3:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-38e4b5b4f9cmr1534538a91.43.1784282324390;
        Fri, 17 Jul 2026 02:58:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4ac3:b0:387:e0db:3d90 with SMTP id 98e67ed59e1d1-38e4b5b4f9cmr1534521a91.43.1784282323865;
        Fri, 17 Jul 2026 02:58:43 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a02b7f2sm5586375eec.13.2026.07.17.02.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:58:42 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 02:58:35 -0700
Subject: [PATCH v5 3/3] arm64: dts: qcom: glymur: Wire PCIe3a/3b to shared
 Gen5x8 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-glymur_linkmode_0717-v5-3-4f9e87a61463@oss.qualcomm.com>
References: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
In-Reply-To: <20260717-glymur_linkmode_0717-v5-0-4f9e87a61463@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784282318; l=11640;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=m4HovyWy/veIkkYmi9SC6EFbB2VJ3EZARceVbS+ZD4E=;
 b=HD0UVGjRsek1PVoI2sorzgNbtRuN54rynBGLy0XDzSOjhgV1tcyU1to2TqqnVDsiGW5XF25h6
 vMoSlHgS5GpBgk2K1E41CWsOeO90+C29R6BCmpVRK2i1N684YwHtm2d
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX25+ySWHkfwoU
 URUEMXfdG4NN88B/eYbRYwNGai8vKWI/CycHA9wmYmXCIOCvEWIVkf9dYFzXaz28RGV2qpsLT9b
 1zhBGLO9UP0z8B8/aI30aPt0QLo2GG0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDA5OSBTYWx0ZWRfX+fB9bQlIprlO
 bT7pkGWfKydync6oNzk4mTN6hgg0/pL7jT/Mioj/2niieyQbbu9Paxxhvj+spS1Ft89pDwYStV/
 xTH6AjVFrO5juo3IFHoh7eU3UB8hHQa/b+ozNs3nJzllmz8XtY643y6qkA9YgENeiRUsOYgStI1
 DqAeTQuNOgETeiWNemSEkL+mTakP/uVzH7YZzYyOtKsfwgEFZByLwqKodY971ySHlYStXBXQorW
 cCPA+84exy/zmjpt7QiWzF8+kTEOYg4bva3z5h07QckKUebqBizERfxcZ6YVqun7PZk5gTOW+RC
 ByHa2tBAygmnXD/hsHMF+6/PvqqjsFT3yhP7xenwG2bIEYbUX+YURdb6BpSCg+00cEa4v63qVc4
 JcpVf7t59jpvagoKka7SwqlGlUlPquF8zv6vi0rmD6/8lqV/CB0pKrrV10+WeZ07xBeUJbdbJKQ
 asuP9Ry9i+ZvOdGB2zA==
X-Proofpoint-GUID: LoMSsCFem4QIqJ3NTYgIaoXkOu1yzahV
X-Proofpoint-ORIG-GUID: LoMSsCFem4QIqJ3NTYgIaoXkOu1yzahV
X-Authority-Analysis: v=2.4 cv=e/M2j6p/ c=1 sm=1 tr=0 ts=6a59fcd5 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=YUm7fC5sK4fRCMULFa4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170099

Glymur's PCIe3a and PCIe3b controllers share a single Gen5x8 QMP PHY block
that can be bifurcated into two independent x4 links, rather than each
controller owning its own dedicated PHY.

Add a pcie3_phy node describing the shared PHY block, add the missing
PCIe3a controller node, and point both PCIe3a's and PCIe3b's port phys
at &pcie3_phy (index 0 and 1 respectively) so each controller picks up
its half of the bifurcated PHY. Update the GCC pipe clock parent array
to reference the new PHY's clock outputs instead of the placeholders.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi |   8 +
 arch/arm64/boot/dts/qcom/glymur.dtsi     | 336 ++++++++++++++++++++++++++++++-
 2 files changed, 342 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index c12808abbfe1..e8e81bf9a6a1 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -750,6 +750,14 @@ &pcie3b {
 	pinctrl-names = "default";
 };
 
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+};
+
 &pcie3b_port0 {
 	reset-gpios = <&tlmm 155 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 157 GPIO_ACTIVE_LOW>;
diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 6d058d591039..edd09b84b8b9 100644
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
@@ -2329,6 +2329,62 @@ &config_noc SLAVE_QUP_0 QCOM_ICC_TAG_ALWAYS>,
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
+			reset-names = "phy_a",
+				      "phy_a_nocsr",
+				      "phy_b",
+				      "phy_b_nocsr";
+
+			assigned-clocks = <&gcc GCC_PCIE_3A_PHY_RCHNG_CLK>,
+					  <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
+			assigned-clock-rates = <100000000>, <100000000>;
+
+			power-domains = <&gcc GCC_PCIE_3A_PHY_GDSC>,
+					<&gcc GCC_PCIE_3B_PHY_GDSC>;
+			power-domain-names = "phy_a_gdsc", "phy_b_gdsc";
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
@@ -3691,6 +3747,282 @@ pcie3b_port0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie3_phy 1>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
+		};
+
+		pcie3a: pci@1c10000 {
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
+				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
+				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
+				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
+
+			bus-range = <0 0xff>;
+
+			dma-coherent;
+
+			linux,pci-domain = <3>;
+			num-lanes = <8>;
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
+			interrupt-map = <0 0 0 1 &intc 0 0 0 848 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 2 &intc 0 0 0 849 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 3 &intc 0 0 0 850 IRQ_TYPE_LEVEL_HIGH>,
+					<0 0 0 4 &intc 0 0 0 851 IRQ_TYPE_LEVEL_HIGH>;
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
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				phys = <&pcie3_phy 0>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

