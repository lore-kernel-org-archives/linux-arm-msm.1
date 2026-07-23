Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C78353A83
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784773842; cv=none; b=M+Unw76cdj5BZOb4Xdz/3PwJCsNARh97fixc7F6zA7irJU7EyAXcyiWZ19VsZNllwj3QQJqgg+lBNJ1QrRbTiJJf2jC5v5FS+wuyrUPRcXLWpzh0mOZ0E9Ri7a6k3+ubJLdfjUWnSmfbjBoYWVRvIuVJiElVJ2KP5Rb97e6vqVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784773842; c=relaxed/simple;
	bh=X/OJrcxF0NvsS0kMFTEztosA6t5zY1MBw7n2lTxh6BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dN8h2bx8yB3HPOVDgrqp89EgFQPnwavN3M7B2+18F6UAuSqoYZEvEyuH6kc1mTO9JCk+dxdt00smn7aNPZ4SK+d89Mytqv9tumnQ17xQ8pMr9DBqddWiu9cNSQx1pvsHCTHb2u72kj4edy80UsSXpLJbzE83e4R0k/q7jlcXCcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCEtFhfH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PE2O3WLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCEtFhfH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PE2O3WLl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N0Wmns2657608
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gdi19UFzDjF4fKg8Tt5mxer0+svC1+wk4/8Ph5sdlFg=; b=dCEtFhfHG+FPzvf5
	wRMui2FNE11uIalrwqxkrnos7xsKcpCNDFYk3VQvuWj1RcdUDV0aUv/Ga4cdlEXd
	XMwEyYPUFb7mA2vqiciuJuqakUWsExkHzWn+2bJTggpGuyIxjexuZugKMXXYB+Kj
	Bafovg8FmAcmrQOKrRmK+MTKsPc/lKkYPViL16dCoVoqGHF7TI0H5ilAvy0HWV90
	2OietoEmctB7Z0/8P2sHF5KyMQZOehiUOmc31jpemkwJ6Nf1OWgtK+Ka+ndfSqmh
	jMM6Pd+ZvWzf+Z9oAQ85BU+5gfN8Q/A/tone+vnd5XJ+bzCaypLKnB3PQX9T7vZy
	n1Umyw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk7b50gce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Jul 2026 02:30:33 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso163208a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Jul 2026 19:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784773833; x=1785378633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdi19UFzDjF4fKg8Tt5mxer0+svC1+wk4/8Ph5sdlFg=;
        b=PE2O3WLljQ5c3dsdo+yuF6s0+VfEA6O5Evzlvu6y0ERo7uIz6HY8vigCXU4e66qaB2
         9wyy8GXoIXe8MXmFvSxumbavu4VMjHPyK1hdFCGgfua8JdGYWPLRNKZZjeROXGseMV+j
         i8x5m/DM5CSBBLaBjDphYStjxUtyZld+SKTxexdBBxYCm8WY3l5OUbPhOBr0MZh1snki
         BAYj6HRedZoPfxZkINhNLswuCkN8FmSwbV5A1m28nWMfDqJUkwqt7BX8iZNQ/YAD/slb
         pIlsPTYEE/GJyNbsCDcvX++AcJ98pAO6UxmkUssk0fw3gWfGhGj2LM15mr0r2QiRife4
         6u0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784773833; x=1785378633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdi19UFzDjF4fKg8Tt5mxer0+svC1+wk4/8Ph5sdlFg=;
        b=P279e+VhI1c09pvYKlNkX6ywn9EVuXtnDZIU777ogFJvWp7xSk7gPJWfH2/TExu+5L
         OXXma48ZGu4kT4RUNRjp1JJsKayuxzSFqXxOg1Qi7KLGb56ltfYldSZ5+YsACKM6JiNE
         3yzII/hFgeOjjK6C/yKB7K7DlXQsIDU83rVEJX+okNBbMGDS9PXwQj2pMiCI5EPaFAT1
         E1bsREtc6IcyxFPmTB7IAOnzCWKPJVRFO1DSnGQG6aylnJZjCCN01QxkyMOllv9W4AjL
         /2d5/XThvOuGEE3p6tHXzPbRrO09hZx7Aq5DW6XG0QnqJ9IyI0v/Gf22mn6WYUddyntx
         O2Uw==
X-Forwarded-Encrypted: i=1; AHgh+RquW4558vIvCpg2f4UPVT+HNKmS7ZKyrzzzuZTJJrFTbChgrRJWT6jtq0vAoPQlGvDbsu++Z+DkRlmLPtVR@vger.kernel.org
X-Gm-Message-State: AOJu0YwP7d/kYwhh2Fc01vDqMucU93TtrHbx3T1tUQcVtBrL6x8Xy/JQ
	OHH7sEbOkmCpE6ze1u1kESeoa3BOBE8JM1z2SFqf3VJsgyLqdiHxHMZDNu8p8dp0pIROkjzMiAC
	Ys1GAUgvdmtootmtp7tDys0ytCNRCPNuRA2lY/JbM3mLiAnOmhEqvzxdiEgYFOAEDjtbl
X-Gm-Gg: AR+sD121Sq20GyaZrwexDX+XAp+MFKnwnvhxghTeCSVcDsutUXTPvRnnhFJ/Hn+tml4
	x+gCpt7M2ENx20U8N3eV7b/S4n7FWzvkfj4b7H7+o41vExsXpF4lLO0UKt7zPGhZicaxNfr9pgO
	waG7OLAZTyOdyLwx32T8f8NzoMilTZY9NqJrympRC+ciHY8qK+IriO5Yk7pGmVQvFJExAcG5sAq
	9t677uIf+P5yxHR/3+mjx5nmijUjCFJvaSeNBX+ebPb/XSL/A2wJEl0whmEXyDLtSCb7Mn27jgg
	r0aBc51c9/0BsowPzJUmzjHN4KK9fiiEQg4UOUlm7rGwpL9i9HnlKzXHSpPNopG8q9cI/AgdBzi
	uyBBLfLfy8D2uBvtr65F6GzY03iBugczvGyfmGBbRgMzaNpw=
X-Received: by 2002:a05:6a20:7345:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3c44b01447cmr1221189637.26.1784773832870;
        Wed, 22 Jul 2026 19:30:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:7345:b0:3c3:93ce:663 with SMTP id adf61e73a8af0-3c44b01447cmr1221139637.26.1784773832389;
        Wed, 22 Jul 2026 19:30:32 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147d47960dsm13463980eec.0.2026.07.22.19.30.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 19:30:31 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Wed, 22 Jul 2026 19:30:22 -0700
Subject: [PATCH v6 5/6] arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy
 with dedicated pcie3b_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-glymur_linkmode_0722-v6-5-bba8156b8cbb@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784773825; l=4308;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=X/OJrcxF0NvsS0kMFTEztosA6t5zY1MBw7n2lTxh6BY=;
 b=FxmFHdzF+1pJ4SJWlrhi03mt/3qSS6Zvb0k1UMZ0NKTec4sCrwknTo3cJ3bbF5wKOwf2A3rYl
 NDN5u90eO40AHDga2EiC9Lz3UiCGZ819655V0/b3Ll2Hs/Q9JUOehgB
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfXz+ykBsX6plcU
 zUfl5+3hkPgU7LMEm75evxKf0/ZASJThjUPiA/ghsrrRdgsSDih81EzuBE7FTQx388USxjEFXFV
 lsrsw1nNM40HDm1gU31hKJ8GVDsOC5dtCd0VCa/1LIHldw9b8GHjM/PaIuRp1jRHQ7+8Dx/ohQA
 8X2JINW6kHSDFHb3jFwva5oq4466i8pZqsSk39XGLKLaK6A0J7lXBYvdcj0DcLs13Aw+oHVQMPn
 2jQyj7Q85OFXi84HKQdm4eKhwgQYbSbREwk+NR2utUMjVR4vPB48bSYesjijlbyz1ijxh0+yuLf
 sP96cbwyE0yNxo1CgQ/fs9tiS3EDXxj8OpVI3h6mdkkg8Ake1nbCMbag9ZFwNgofie2zfUZpZir
 3v6BvoHo2pOF3pjXX0RNc3dnLokSylmnqPreKlKN1pH/jmzcW7LvSf3lHMgIiQc5pWtfgpTssgZ
 KGheICMEAutY1InCdIA==
X-Proofpoint-GUID: bd_WqsT1BtrQoaxpTZsmGCSFU4nMdPwY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDAyMiBTYWx0ZWRfXw8W9kcYzvanP
 uqqICYg1Bkglo/91HSeknUzl87jubA5rPjqpG2cJC0QLjUHZhSle0At8hbcxJmKR0D02l3LZqmh
 i/o6OwUDs4vUopQZpkViQ5bAiTJFOf0=
X-Authority-Analysis: v=2.4 cv=btx8wkai c=1 sm=1 tr=0 ts=6a617cc9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZTTPuMnDdfme7OPWMlMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: bd_WqsT1BtrQoaxpTZsmGCSFU4nMdPwY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230022

Unlike Glymur, Mahua only has PCIe3b wired up; there is no PCIe3a
controller and no shared Gen5x8 PHY block. Delete the inherited pcie3a
and pcie3_phy nodes, and add a dedicated pcie3b_phy using the existing
qcom,glymur-qmp-gen5x4-pcie-phy compatible.

Point pcie3b_port0's phys and the GCC pipe clock parent array at
&pcie3b_phy instead of the deleted &pcie3_phy.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 89 +++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index 22822b6b2e8b..3280eb96d61c 100644
--- a/arch/arm64/boot/dts/qcom/mahua.dtsi
+++ b/arch/arm64/boot/dts/qcom/mahua.dtsi
@@ -22,6 +22,8 @@
 /delete-node/ &cpu_pd16;
 /delete-node/ &cpu_pd17;
 /delete-node/ &cti_wpss;
+/delete-node/ &pcie3_phy;
+/delete-node/ &pcie3a;
 /delete-node/ &thermal_aoss_6;
 /delete-node/ &thermal_aoss_7;
 /delete-node/ &thermal_cpu_2_0_0;
@@ -79,6 +81,52 @@ &config_noc {
 	compatible = "qcom,mahua-cnoc-cfg";
 };
 
+&gcc {
+	clocks = <&rpmhcc RPMH_CXO_CLK>,	/* Board XO source */
+		 <&rpmhcc RPMH_CXO_CLK_A>,	/* Board XO_A source */
+		 <&sleep_clk>,			/* Sleep */
+		 <0>,				/* USB 0 Phy DP0 GMUX */
+		 <0>,				/* USB 0 Phy DP1 GMUX */
+		 <0>,				/* USB 0 Phy PCIE PIPEGMUX */
+		 <0>,				/* USB 0 Phy PIPEGMUX */
+		 <0>,				/* USB 0 Phy SYS PCIE PIPEGMUX */
+		 <0>,				/* USB 1 Phy DP0 GMUX 2 */
+		 <0>,				/* USB 1 Phy DP1 GMUX 2 */
+		 <0>,				/* USB 1 Phy PCIE PIPEGMUX */
+		 <0>,				/* USB 1 Phy PIPEGMUX */
+		 <0>,				/* USB 1 Phy SYS PCIE PIPEGMUX */
+		 <0>,				/* USB 2 Phy DP0 GMUX 2 */
+		 <0>,				/* USB 2 Phy DP1 GMUX 2 */
+		 <0>,				/* USB 2 Phy PCIE PIPEGMUX */
+		 <0>,				/* USB 2 Phy PIPEGMUX */
+		 <0>,				/* USB 2 Phy SYS PCIE PIPEGMUX */
+		 <0>,				/* PCIe 3a pipe */
+		 <&pcie3b_phy>,			/* PCIe 3b pipe */
+		 <&pcie4_phy>,			/* PCIe 4 */
+		 <&pcie5_phy>,			/* PCIe 5 */
+		 <&pcie6_phy>,			/* PCIe 6 */
+		 <0>,				/* QUSB4 0 PHY RX 0 */
+		 <0>,				/* QUSB4 0 PHY RX 1 */
+		 <0>,				/* QUSB4 1 PHY RX 0 */
+		 <0>,				/* QUSB4 1 PHY RX 1 */
+		 <0>,				/* QUSB4 2 PHY RX 0 */
+		 <0>,				/* QUSB4 2 PHY RX 1 */
+		 <0>,				/* UFS PHY RX Symbol 0 */
+		 <0>,				/* UFS PHY RX Symbol 1 */
+		 <0>,				/* UFS PHY TX Symbol 0 */
+		 <&usb_0_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+		 <&usb_1_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+		 <&usb_2_qmpphy QMP_USB43DP_USB3_PIPE_CLK>,
+		 <&usb_mp_qmpphy0>,		/* USB3 UNI PHY pipe 0 */
+		 <&usb_mp_qmpphy1>,		/* USB3 UNI PHY pipe 1 */
+		 <0>,				/* USB4 PHY 0 pcie pipe */
+		 <0>,				/* USB4 PHY 0 Max pipe */
+		 <0>,				/* USB4 PHY 1 pcie pipe */
+		 <0>,				/* USB4 PHY 1 Max pipe */
+		 <0>,				/* USB4 PHY 2 pcie */
+		 <0>;				/* USB4 PHY 2 Max */
+};
+
 &hsc_noc {
 	compatible = "qcom,mahua-hscnoc";
 };
@@ -115,6 +163,10 @@ &oobm_ss_noc {
 	compatible = "qcom,mahua-oobm-ss-noc", "qcom,glymur-oobm-ss-noc";
 };
 
+&pcie3b_port0 {
+	phys = <&pcie3b_phy>;
+};
+
 &pcie_east_anoc {
 	compatible = "qcom,mahua-pcie-east-anoc", "qcom,glymur-pcie-east-anoc";
 };
@@ -134,6 +186,43 @@ &pcie_west_slv_noc {
 	compatible = "qcom,mahua-pcie-west-slv-noc";
 };
 
+&soc {
+	pcie3b_phy: phy@1b90000 {
+		compatible = "qcom,glymur-qmp-gen5x4-pcie-phy";
+		reg = <0x0 0x01b90000 0x0 0x10000>;
+
+		clocks = <&gcc GCC_PCIE_PHY_3B_AUX_CLK>,
+			 <&gcc GCC_PCIE_3B_CFG_AHB_CLK>,
+			 <&tcsr TCSR_PCIE_3_CLKREF_EN>,
+			 <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>,
+			 <&gcc GCC_PCIE_3B_PIPE_CLK>,
+			 <&gcc GCC_PCIE_3B_PIPE_DIV2_CLK>;
+		clock-names = "aux",
+			      "cfg_ahb",
+			      "ref",
+			      "rchng",
+			      "pipe",
+			      "pipediv2";
+
+		resets = <&gcc GCC_PCIE_3B_PHY_BCR>,
+			 <&gcc GCC_PCIE_3B_NOCSR_COM_PHY_BCR>;
+		reset-names = "phy",
+			      "phy_nocsr";
+
+		assigned-clocks = <&gcc GCC_PCIE_3B_PHY_RCHNG_CLK>;
+		assigned-clock-rates = <100000000>;
+
+		power-domains = <&gcc GCC_PCIE_3B_PHY_GDSC>;
+
+		#clock-cells = <0>;
+		clock-output-names = "pcie3b_pipe_clk";
+
+		#phy-cells = <0>;
+
+		status = "disabled";
+	};
+};
+
 &system_noc {
 	compatible = "qcom,mahua-system-noc", "qcom,glymur-system-noc";
 };

-- 
2.34.1

