Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC47357D0F
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474843; cv=none; b=OKh+suskCqi/ifUIxlveoDw6XObyO4jcW5bXiFn2a9qTiOMVp5yWmyy6CLdhbHeFoKTY8CRRWJTEZT2lZL1t3A1yeMsl+iv+/hrtor076fcpuzyFWRFLf+pyGyhHfVlNxLrNR6fdqnsgVtyqEeW8wGmjYIDT9OQygHe0roYWtrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474843; c=relaxed/simple;
	bh=MsC3j2tem4FZcoQZTIFpAAXfCmNseQgByW8DJZvce2A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ateRuUQ/K7vrEX6el72ya2CoMiXXOF6HOiAlRE7wYNiauEnnRJA76Z/+/8EYXjRV+iOrv/eLLDVqRfrLqgsAjqDfRWoq5b+5P7MDH8Z9GdVpzSxPoEqsH2qloDXWaOMVWDOwptUBXaNOwNcU67kJ4IvGUaOiir8qE3fktNuQg4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQpo6Q0z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H38eZpe3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQpo6Q0z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H38eZpe3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V4unos3146326
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:14:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wuVZHmfYv92aZUJ3qm7BsMpBhwigJN89pTIY/+akmmc=; b=AQpo6Q0zdB50h/Wa
	pcD7ok0Jt1wn1iz9MzbeHvNq8k6b/E2dEEXusGbJbheyXt2oLYG4mNI5UaxgO5uz
	7wo/vy/PPrpVPxii9PBV2IeP/5WX1Y+xL6m1sXObw6z/9gxHLnUqNoWH2nd/IzJd
	l0xfliMO9OOEmac9MhakusEQ/wagIrI6+XNFSc93/l+3moCPF6Ise8g0RAgbzoKW
	zGfm//3XES9xMYVz76Ri57pUoqBVvLfOEUxmcr7LW3FSusMJthZrDbpiioJflYe7
	/ef0TwgCpTfc996zKfwaUysqS7A9tbSNNg0hYjVOZw2imLwcGtbNTjSQGs5fgDtS
	STTMLg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frn0e02b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:13:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so738403a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 22:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785474839; x=1786079639; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wuVZHmfYv92aZUJ3qm7BsMpBhwigJN89pTIY/+akmmc=;
        b=H38eZpe3nELbHctDT6Y07DiksbuRLYCRm0GTxCqMIOhV/fTjl3QgnHO9RE/FU1/IxC
         +F6BSTJ6VB4Ct/toV4cojlN3MZ+vauBO98HVLx4cFo9FqbHE9+ufRaOmwGRUZFKTYy7q
         W4CTFh5Q2RQzLeLF84mkIg61LT5hfmPd5arnjqInfc9ILo6U2byyXINydbIBQDrJmFRC
         o9PqoCD32pD3L144AKD7QrwqoOoNQ3nIpVTCKt274uP4izaFpmB/R6pMQ4yxNlShSVLo
         2p8RV8ZD8F1Hes5UKPXPMn5+mAG1hrZqvzTJ7VjWQIj5M29zTWkpg4qvUXnEc3AwEcAy
         e1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785474839; x=1786079639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wuVZHmfYv92aZUJ3qm7BsMpBhwigJN89pTIY/+akmmc=;
        b=cPSqeTGEKbzACtOWfFsS669iXCVeaHLdfgtz55SKI2Qg0AzbUoptvVsvWtlYe3chl9
         Ytac1zi4kbMLkj6gmD7g61ecjV1XE8WDapPY3ss+SVbaoY2fJD1wrfBUAYzA42bKTdTz
         gbz/OX/Iq3w/30zklCrY/bpMH5PyGTT0xdyhjvEmYx41aKDADGr1yQareIabQwNU3mLY
         u3N+ztM7hLD2Z3NoSG9qMIHcco78AVWnmgPzMYaFWKRZOrjurEQe+Cf+Qo1UXLMWrEvV
         xv+dSGy0jU69Fn7gjPBUubxHvcv8mnH7L3zBTE9JmgzM16x30dHQp8RBDL4CBkEsTEzp
         Vqhg==
X-Forwarded-Encrypted: i=1; AHgh+RpoXzOvnaPBAa5rVbwbZ07nE2g8Jq4OfU50vUA6P0iFzKKpQC9uK53b6JPgsjZN3hpUDMOGhiQe/s0yfhny@vger.kernel.org
X-Gm-Message-State: AOJu0YwYiDJ+wK4YVPQKLka2w24QwEE5PZuemkcWO16dHH9TaNsi/DGv
	U3hDRgQzbi6lr3WML1ivmgCirnnbcAqIibaMRHcX+j9BB4/PuYMHIjrZMpDAh9IooYWnkxDN4QZ
	wdGnoLs/pM4KQKfdr0f/4aRjzI4tclF/e1vmW5Xd4WJIiBXMn+7CruBJc6kJOPRLnJzkn
X-Gm-Gg: AR+sD10LNcYFskgPcKsLEus2MzG13F36xhrhnmcbu6e5LfTCP5jtIZzBcU+9ZB90JYc
	YorOkOSUaEa67yaXv/8++TVfd3c2QFhiKrgF3cI+nNBHjilYvCbrOYUjNb0yfgopK0WEHi7TytY
	bR0c+S1tYXSN6d7tLHPZmCn4EqNfHdubFob7c3ddd2D+u4zsPxq9x2ZEi1J++xaprG85QaZAWgh
	uleqrFg/webTGkG0XuhVrfztmAWvsmwmp9K+abHpH3AUxvJEU1gE8tI4SqygLIZab8Sg1Pf2fpi
	bnaujzOSO4F9wRRJlvUT5zd2rhp88D655zuZ8O2LPFuSxLEsi0407pcGm2ptkrZFaNOfCDHyq/l
	N2L/x55Gp1N/iWwYnQGkHJZeKRS5gyaesI6c3gPf2a3j4Qs0=
X-Received: by 2002:a05:6a20:cf8f:b0:3c3:9dc1:f4f8 with SMTP id adf61e73a8af0-3c91b535c8cmr489208637.76.1785474838822;
        Thu, 30 Jul 2026 22:13:58 -0700 (PDT)
X-Received: by 2002:a05:6a20:cf8f:b0:3c3:9dc1:f4f8 with SMTP id adf61e73a8af0-3c91b535c8cmr489188637.76.1785474838325;
        Thu, 30 Jul 2026 22:13:58 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e06f88fsm976435eec.20.2026.07.30.22.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 22:13:57 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 22:13:54 -0700
Subject: [PATCH v8 5/6] arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy
 with dedicated pcie3b_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-glymur_linkmode_0731-v8-5-a455265ad8bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474832; l=4363;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=MsC3j2tem4FZcoQZTIFpAAXfCmNseQgByW8DJZvce2A=;
 b=elcQLXDJpx/4Wqz0EbGv19rOxwV4hvmNq+Damu84rmhbxoX4pKEItXjYgmJ27pBs3Quid1vdL
 PDpWy8oSrSMA5XJjRHEiX05arz5exA7cfQCut/Ol9KwrDe/PfQkntnn
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfX9zzzyUETQ+V8
 48MWd1de4Kz4m3PHquverr2zXVp5kcJOFPV18zxpjwyB2cFLfCr0iWazjEjrapws8GtldtZNAkW
 qZ/EtW4QsQJFfnYrebEtXnFP+HY418VWsMZAg9BNFiZRVV9RMv1SKTxe1rlqVZif7hQhNsvUVZZ
 r5qdOhHNj6TlUhzWiwXZU2HBlqZ3mu+Q/jHFnTawwjYpSra4tmsI4AzbytUr0swfo4KM7+CC+CY
 ReB2+hjoktd92qhz1pyiZoUr1IAOPqfNaNDbr4vaTI0ck00A0nfZ1/2zQPPpfQLpNDwQa9tpFGd
 fu7XI2UFi/6AkUD7WGrne+f9ZZKUQafTN9LZDnXAbEtq+oJXlVATDiSsHG6CC9FYKqLu1Lg0t93
 +YDwRlzMQmbNmalQGkqPiiN5iAyWuTuuVV+NKAFqPI8zvNul3t1D9rSQR1na/Ux+mEgzW6xj6wb
 miwBaIn57XeaNoGqe7g==
X-Authority-Analysis: v=2.4 cv=MNtQXsZl c=1 sm=1 tr=0 ts=6a6c2f17 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZTTPuMnDdfme7OPWMlMA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: BT-WWB7uOUv2aO7TCgdNBeSz5TupI3Yn
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzMiBTYWx0ZWRfX8HT0gKb9kSrP
 DBJ3Q8ZxX/vjuX5wpLiFeYu7179oeX5gzsfjRDtcYsYhlTnACnkPv7miKbnvox2Ncof8Evq0URe
 IQTz0oYPr8UinNJX6j59A7+g+61o2ms=
X-Proofpoint-GUID: BT-WWB7uOUv2aO7TCgdNBeSz5TupI3Yn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 impostorscore=0 malwarescore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607310032

Unlike Glymur, Mahua only has PCIe3b wired up; there is no PCIe3a
controller and no shared Gen5x8 PHY block. Delete the inherited pcie3a
and pcie3_phy nodes, and add a dedicated pcie3b_phy using the existing
qcom,glymur-qmp-gen5x4-pcie-phy compatible.

Point pcie3b_port0's phys and the GCC pipe clock parent array at
&pcie3b_phy instead of the deleted &pcie3_phy.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/mahua.dtsi | 89 +++++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua.dtsi b/arch/arm64/boot/dts/qcom/mahua.dtsi
index e6c059708912..a59c5ed7b48e 100644
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
 &pcie5_phy {
 	clocks = <&gcc GCC_PCIE_PHY_5_AUX_CLK>,
 		 <&gcc GCC_PCIE_5_CFG_AHB_CLK>,
@@ -143,6 +195,43 @@ &pcie_west_slv_noc {
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

