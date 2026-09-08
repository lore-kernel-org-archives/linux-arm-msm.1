Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422D9383993
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 06:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848643; cv=none; b=kzE7q+8hM0HqtBluVQBUxF+fCtswbv1LksbwBxfdIEpC4Cb6iNmIM2vxEWaLYvgsLWVPdNS8rSC4OtlEwaIOWfmR+LXWeB2gB/BukF5v7vWmqOtraJVO0Iv1aF60/U53gzsUbXB1K+iMPOj4LN0OB62NpDcNJvtWK0vOdoMySpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848643; c=relaxed/simple;
	bh=G1rsUCTb2kVkIrtKwz3Wqew9fkm8AHuzMTxKRAESr+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LtuJTisSFO3AkbblIEvoWu12MDAhJM8dxGZFMZBW5TxPXHj6xvPBpoiaSPL/XOjBEt+NpNoLqQ1sF2MGOAIMxXZWs8ry8tAU3WLuKpBPuS5vLlHc1Ifo0XSF5eOMdF4pXwpwx9tw1aU7BRJRszGtcpFEWkuLTYGD/V9ykQA+KTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lo4th495; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JopYAIq1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lo4th495";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JopYAIq1"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LnEg2172672
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 06:24:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZhQWhtOsXMDKxSZQqMbmTezUJhEM+NsGpJ7/2m6Rqo=; b=lo4th4954PL8kk2E
	WesSLHHwB2myrn5VgJI8P24FE/sVzuAKnwYIp/SUiFxrvy4z+qI9+l3xbfpywKuN
	I0v6Aa8/tRjLW8qYdMuqMNtgIsgLVgRopeeDJ0oOc8H8+947E6Nf1//3i1ApDs1I
	dztnRCDyEN/MDib6dWh0z8zfHFS/002Qu7ZCrYRTTqV4ujVLcAF+s5dgjEHK3HQJ
	McUwGX9gqQ2cBPrnU83pINzOB0Um4v1VDTH8BufyWsgQlXJvCuF87A6zmVZ6MSQY
	NhGUdl4NL1BpWkc2R3uNnnhtNcMYNL7RB7cdqJ8oOW2C+fzOdLuQVcrEZA/Th0Oz
	ux0FEw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rrhypq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:24:01 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39906175917so4516608a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 23:24:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788848640; x=1789453440; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nZhQWhtOsXMDKxSZQqMbmTezUJhEM+NsGpJ7/2m6Rqo=;
        b=JopYAIq1nhyz1ijJja4pxcoNCgUC00b4xNNMh1geK34CZ3evdWS95etBYb11DzTLUr
         ZmmTD/d01SfVLGgihRXNK56WkH/WVr+/ojtMjE7+T+NoP5VUUEs/+o/k8BHPfOb7mVUD
         X4taDiCRKzrK9rMdVglUw4sRgjpIhxv8ltHSYnCOEjpr4IZTgFsNIq50Lblcd+vxj5wc
         BHP/n9FVH2MYMNyZmpCJnSiw6ermILUe2x3ZT/W6KPQZ5pYK/AArVY3/kPfAHsbSq0uf
         HOW1KsvP55rqCnfGyhs2u3YeSenXJtBJxWuWEgl0yCTzU2oowpyayVEIp5khqAarcS/d
         H0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848640; x=1789453440;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nZhQWhtOsXMDKxSZQqMbmTezUJhEM+NsGpJ7/2m6Rqo=;
        b=puBEOmoMxGQu6mxIXV2uPlaLT13iFq26CqzMaS218XFsOFxqjZ1dc/93gcmXktfrrY
         ZbaQ8bSrmrnzMobqjWrOHmDSuyiBMZth4mxc7tHz2p1gHnXB9MR+T8NQSyF9TIWgNZzE
         i4pYix7pg89yM15ApWUZfl2FiMpS++RL/G7Jp2R0rjoW7Y14va2LqTWZQC5B1EDDxqE5
         Ow8DvA2HhGY4oq/o7JysOObSHur0qdCWKa9JI++UqtAidd7mRtA7TWQIk3YrByD0W/np
         JhAMCSwPrfaq8bG8z0kEh4hhGPViEBYZivw6j7wKynAXUVsjNmyKN0tCMrCO1m4O5f1I
         Wm2A==
X-Forwarded-Encrypted: i=1; AKwUvBxpWPDt2bz0zEio5+9nqepCo9FW2cVwLHJnZGeElclYZ/oFo4Wut0CEFOMEO9Mak+M0hoqODaRQOfZ1CVmR@vger.kernel.org
X-Gm-Message-State: AFuF++lSxoARy5DJXhwA9Y5Ufapnmbxv8HGgWwiB8EF7g5YJOop4bY3c
	BBf82ITnPBSGik8U0Zk58wJCBsfqsLO2sZkYPyXD6zKniEVo3BA3eAyv1t0atWbUg7/yXTuYhHh
	2ruuWE7++WQj6B6dg96B/abWPIlRnczl2wHmDCUZpgTv7d3zsGHDkZEuiv6ckSH4vUfGX
X-Gm-Gg: AYBFou104xVjqfdiU/PqwT0lHDR+Zys8yttYf2kEDuoBxvTHYEHh2pKAwRGqQonnNRw
	kihy3XdFQYHc/pnNb225DUVj1zy+0P7U9qlNe+8qXFkR9Osgj8tjLUDrCmB3keonSjzTeibn+BN
	pTHvumTJ/wBllec7rE78utS4CxcP/1E709daW8NUNLHovtLUjNCxFnAsZmj8Ov0uf+pmXwI27sl
	Hn5zGGRo4XRZwE8+YpbkoDx6MRR8BUb607COvCJfmEQ+v+WlS39Hjh0kKBQiJ7du75+5ttKtzi2
	viAovWtyn5riUmBhoU21T+OHkq07AbrI6OxUM6h/eIuRWvZVfKduqbQhtI4zABqRFefJbqMMvro
	rZ8iTmD1DQyHvYET5zJB4FT9P0Dm8Dw==
X-Received: by 2002:a17:90b:384b:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39b261e79f1mr39328488a91.13.1788848640405;
        Mon, 07 Sep 2026 23:24:00 -0700 (PDT)
X-Received: by 2002:a17:90b:384b:b0:38e:524:8797 with SMTP id 98e67ed59e1d1-39b261e79f1mr39328422a91.13.1788848639850;
        Mon, 07 Sep 2026 23:23:59 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm26266297c88.8.2026.09.07.23.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:23:59 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 11:53:32 +0530
Subject: [PATCH PRELIMINARY 3/5] arm64: dts: qcom: shikra-cqm-evk: enable
 the first Ethernet port
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet_dts-v1-3-69c0c5c7c124@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848616; l=1888;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=G1rsUCTb2kVkIrtKwz3Wqew9fkm8AHuzMTxKRAESr+Y=;
 b=AquADnFdRn4cIs7/5NuPZcGBdq71X1YIYVfVH72+1AuyeRo/NoG+r98KzJ5GOpaVVy+SPCQrW
 lh6sqtDvmX2CkJl+ZPbWqCic9hGTQmorAg4J4WCn03quHFhbugWst9S
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX4Kxm49duz3fk
 SSjDQOUeBzQiqqfTyRA2ESpEVlMYHlHeZ6pCjFxbGe86vTOJSSxgfT/Q2FbByqJN2NOqMPbdhkD
 1xYPZsVhmHVHOWJE/oXYZhF+PeIkm+k=
X-Proofpoint-GUID: dIZXJeEtd7s7uidmrWc8qMQcsZnh6sFd
X-Authority-Analysis: v=2.4 cv=NsjhtcdJ c=1 sm=1 tr=0 ts=6a9faa01 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=V_3KSmX1rMCshHtbQ50A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX3W26v6l0M4Ok
 uiP7AuOgKh3koBHibya5j14vNL40+Dd1vVCD5/CBLc6FSOpc9Lkxe3rD7Te6o6V0uIuHprfehnB
 3TjNC8xwTX0wsA9bw/ZVFbxYkY+wRIRqW+dLsDp0F4g6cxydq5ZbSRr8I6m+pqFeIaAt1oBMnUu
 bdh8TsSoOALGD/L3TxXMgQr1x2Q0v8jvTsjN2mGTCGhjDVIG6NFC1eSI/GM3x4pPXq3cJbhh7Jm
 2YLHOeNWBvO9LTxn4tOmCSTXBdz+XNuz40hggMUCzFDG23SyMJbQij3geWY3JzKU2MLFZAJNz3i
 6ha0WgQSu14Dgt71dmuZpxpL9XJqwsmP731GAwhUcFNHQ9rzQrrnFzy85K0c+lbJWAut6EeLtyq
 o6kOauycl9VWXV1u2L4F0aygUUhJZYJQvYiC1eFu+PiAU3zuC9ABJW47XH9T2d8c4EuAlsagIOZ
 mBY+R70m9Ih/YZRRD8A==
X-Proofpoint-ORIG-GUID: dIZXJeEtd7s7uidmrWc8qMQcsZnh6sFd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080068

Enable ethernet0 for the Shikra CQM EVK board with its DP83867 RGMII
PHY. The PHY is powered on using a GPIO-controlled 2.5V regulator.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 46 +++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79b73563d17ae68d7c51460ddb1b22..d093b80034823fbc41fb59366d22fc84fbe8bcb0 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -21,6 +21,42 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	rgmii_phy_supply: regulator-rgmii-phy {
+		compatible = "regulator-fixed";
+		regulator-name = "rgmii-phy-pwr";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		gpio = <&tlmm 149 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&rgmii_phy_pwr_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rgmii_phy: ethernet-phy@7 {
+			compatible = "ethernet-phy-id2000.a231";
+			reg = <0x7>;
+			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			vdda-2p5-supply = <&rgmii_phy_supply>;
+		};
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +93,13 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&tlmm {
+	rgmii_phy_pwr_default: rgmii-phy-pwr-default-state {
+		pins = "gpio149";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+};

-- 
2.34.1

