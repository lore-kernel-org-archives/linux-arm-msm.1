Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426B03B47DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887313; cv=none; b=R3r+gyrrHqgqX6e+Pz31O0GpR8zkHOMisDuR2zsrl2Ipo8NKZrttIXqEnU24n99+J7KEs9M2A/OWAiDFQtT0ESFk14EqGhmlyIFLib7TAGVsrTemnN7wiCz6wPdLJ7W4v7fEigfyerJfDBmmL3PcJoBzlN+PY7jh5/02E9t422U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887313; c=relaxed/simple;
	bh=X/OJrcxF0NvsS0kMFTEztosA6t5zY1MBw7n2lTxh6BY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Nn4GZAzDDIIVlvc7yIeuRcdEiDINacnqxOSkO3N5mSlhiz4UjxG6TgKQi7GH4R36qmycU47M0ikgmfjHICubn2Vi40U6GMqGDz79CyH+2Iqb+h1qE3lr3m3onBF3qFhY1LX77Aftpirt+NoAuDHoyGqEOUx/61ysSQidl7J0yTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5dG92LY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F2OhOr8y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j5dG92LY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F2OhOr8y"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4m5as2099930
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gdi19UFzDjF4fKg8Tt5mxer0+svC1+wk4/8Ph5sdlFg=; b=j5dG92LYV2RX2VaY
	Dbp+tZ50In7fzwfdnE2PN5NTlCu+n1hPoru7G0rQy+OLwcU0cvAenl4W8pRYSY9X
	OtoWWA8QV6eD+4gK8Weu/YBji9Y0xfpx4fJ/HsQ4/fACxL81Qjcq6pU+KQCwQ041
	yejLLAFd4U6kvwIyA9GmZEZPLdCOEqBw+W97Wwg3njZS+LWPWbDqV+b8ZYDRz/EC
	qPAq7KvgfYukZUPGrsAxLvJPd19n00rFgu969zGsnLg1rz6ksoFi0bQ2oEvfHuCf
	wGhTH5b5I4kB5gdtThVDZXME+iaHQyacEV3ps48I96jMgLKu7rhTrit5IiOCItru
	BSd4Xg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fktahte31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:01:48 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb5cc1e13f8so345379a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784887308; x=1785492108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gdi19UFzDjF4fKg8Tt5mxer0+svC1+wk4/8Ph5sdlFg=;
        b=F2OhOr8yrntV0abLhNZIQ3ng5XQQ4a5hKykmZhteQ/MUtiQSu3dRm66vys0yw+hslJ
         uiPnlSnPUrgFW4Usgi0NdRJQZy9xGR9VyciKd8C98gLlfp9eLE0Ahah97QPvMNwPqe6V
         poICyjlWl/NOFH3qsx/DCJwWj2Rz5SsGVg6NAU8ZMxhVsP4hwPwqcGBXHirRjri130S3
         IpO/o7aYMgsT1iTHoJFJ66NyLfeSxEH0K7NlE/H4m/QUDCR04ZqidN2eBqvPw+Q4tyMj
         dxu80cRsYHitImoIYZOC5V8B9vM17WpQU1DF5LQejQTyI9kGzxu3XwTH97OdCZu1XwOA
         vY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784887308; x=1785492108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gdi19UFzDjF4fKg8Tt5mxer0+svC1+wk4/8Ph5sdlFg=;
        b=j9Rhm79ROzYpcs5GE7shHjxMACXXOnFDUtVGiGaE2acddL8VNusoFraIOfQZzv9q85
         asDiwlnYMO50xQ7/BMzGhNpF4IKcjrSKyDnEQmA3v0A2aAwA9N1xEYPQRaw9ASdK8CWR
         IDTQ5u+Py+YBw4dcj8eL1CWpPpd4sR4OT7S0R+krFr06afEyk25dH77+CL4rH/+naJ6q
         MsFMejt47dG3uT5Y6l3duX1R1ve74VGV9hLrNE7JyssFuB5Tr/sZX7CI0yT0EexWcN4I
         ki2r0IffnwPULeaRlJG5Sy1CKj0PbUH+6x/PC67zm7z/BicT2e+CPSgxgRovu0PJsfvY
         FcHg==
X-Forwarded-Encrypted: i=1; AHgh+RrBNUypiuWTuAl0qAXZtf0oduzh2FbFa/syyK5bYJQHAzGPoHuzvKrjRYNYHy9pAGHYZnnamPEMJ1blDiNU@vger.kernel.org
X-Gm-Message-State: AOJu0YzzY9pfora0YCHT7iyeCZv7VjdpJAGMehjJ7znsWt3J8D5FnZAD
	TorD4Q99aGgkaJeAJQrTGQWel8A74f0TOLJ/JvVijEWdri++lqWnS7X/XbPyyHfRad38Z7sVWC6
	S1oG9HcmHh7bkoZFhn/3zs87fSOfG2Bo5hHgVJ6SIG/jWaqFswa5OceU2nZr1OtBg82vY
X-Gm-Gg: AR+sD13wkTjz4eOKv6EfJK3uWsQMcTXlOq000NZcshPFjWQkLbGnmAS4hoWxcz9l+t8
	duafrkfpf/Om2j7Exq59d4AtMsr4TQCP0+KmXgERLSKpL5+Sa8iIGep7tyTTLLulB3hMUMos+MF
	v1OfShuELx1uxm3rrzXninEsLHFgt/PvwXfeQE5LxH+8PMpvTW/vhCN/+MrXjv+CovH2jceKoz1
	qZ3KzY4OIAdEv0RcoR8Ez1+a3YbpyUJM73DOkCfdB9eEybKrr2UnRTwk+MLtv7veS/Q8oxCtPRt
	VOdHdZWNZGvXlSTTJrumw6/LNQAeYONw0Sm6FDOCHdq/7p6VLr6RqF9QuQBfhEAmx2WmSYdtORB
	Lt5nejFZrSOOsb6zozLxNJv11XQPNwJLF9QJSG0Car1sf/e4=
X-Received: by 2002:a05:6a20:b68a:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3c44b051f78mr7464830637.30.1784887307727;
        Fri, 24 Jul 2026 03:01:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:b68a:b0:3c4:3b16:2979 with SMTP id adf61e73a8af0-3c44b051f78mr7464771637.30.1784887307175;
        Fri, 24 Jul 2026 03:01:47 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1c9289sm29515427eec.29.2026.07.24.03.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:01:46 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 03:01:23 -0700
Subject: [PATCH v7 5/6] arm64: dts: qcom: mahua: Replace pcie3a/pcie3_phy
 with dedicated pcie3b_phy
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-glymur_linkmode_0724-v7-5-65c8469c6b65@oss.qualcomm.com>
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
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784887301; l=4308;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=X/OJrcxF0NvsS0kMFTEztosA6t5zY1MBw7n2lTxh6BY=;
 b=J0dW9JcahCqLRLyo3XcMMdA1IrXhnnUc8Q3lHNfTGcyzs2edhrWXC2unTkiYDSH5UkL0Of5EZ
 7zmR6JuhYR8A2desLv/WuKfoRlDmaw8evdxL5glGbf9N+2d42DkUQHE
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfX8HSoIL37/Edu
 VkwrwhdDR2bDiE1O+PdoNPPW5cfCpTy2wqvO2npwPJa/Ku7iXExp0QfgZ5HfOEiv2zVHzz9cL3P
 2M6CiJ/KxJp6gSAiQE10YuhlK7W+Xyg=
X-Authority-Analysis: v=2.4 cv=TvrWQjXh c=1 sm=1 tr=0 ts=6a63380c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZTTPuMnDdfme7OPWMlMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: DWymP-Bk2PnLndR6-OyWlpXlmxdFdmWv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5MSBTYWx0ZWRfXzGUJP+/vlH3j
 qlKDheB1tOMHDZ2r1ATx4vOTHXIJe0BpG6+K6XG2q0Y2FL71IGLh4JGlfxgk7qnO/CG93ZV5ABd
 cNPw6+X6WC3lMHjo6buOg1Jn+yCi9thUXCbdhX0mo7Sz2Vw2XD2Mb7ZAmpvcjXHMdosh5eWrBIV
 eEGqjaWZodeIIr2llScJr0Oc3bNnkBhLKDyUBXyu8Am6m0U8iu8rNsboDK7GkTu/WmBs6eFxIKi
 dUHTaPpWN5Y+NSDbmD2XGl9KF6YIUl+2N4FelW8NlGm1Plnd4ZIW5sMy5aA41lc+5z4KevQNIno
 5rUc726aGI7RBTQC7NGkdmwEdH8/58PSJsF3T4ZKDwnlHlYFxkJIPmblKAFNexuUK6Y5VvKh41N
 ujxDf1N0s40GQxyRWUHWcFbxuoFp1AZm++z8SqRujaMF1ol5hSjA0haTS5OmNUAHRBVd/e0trJK
 InUjHJyAOK5AjbzENHw==
X-Proofpoint-ORIG-GUID: DWymP-Bk2PnLndR6-OyWlpXlmxdFdmWv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240091

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

