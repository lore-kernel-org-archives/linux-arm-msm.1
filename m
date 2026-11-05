Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869669;
	b=mqdxV9dFoaIjH8cPqaBrAG2hEg2Co+5M9H4Lz7/dCyPGqtmiAger+vX9jmagqPlHQ73K
	 2Tl3fW4Wj28A7Gs7yMNumLsCPNFdUqDBj1WVEaf2xfboti4iNyDorig1KbXgeVvuz5l+h
	 VgVioTSiI5ilGRyqHTTsQ+MfrC0MtljN0AaYBh/TX+kSPl6IBsRGX3nWqskR8TcQfCpJ7
	 JDrvIJsd2Hd8Ezd13HoJ4UEYOy06hAmO7gWsnNUFvddhnFJrnTGi6Q3nQuqAk10sVUHp9
	 QQsqgu6dK0Qc6JZruGCHS+nB4vG6pTC4PU8hQzoufg1g0rwWRxtHnqt/5HnZwRUG/0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869669;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LsV440wqUVdiZdYoeXwTYZWm3AKrhNqQvELUvOIoVLY=;
	b=JU/VtM05imL5CpMIe1VYLkzrjP0SWHp6ep9a+HzuzdqR5LKREGSR//JwueU6eOqBHugd
	 worK6j9CP+aDNOlLFDooh14v/aSPL9H9bQxJIdUNs/BYkAEhuG+ujOUkOXo3mXY3e52KR
	 Vqe77KZjhK/muvBN3nHgNgEBo/db1VVkWDY6BcISfQdv0o0a+QX0WBZo/FI78NfwRWXSb
	 P6uTZ6aKglmzuxD/ZLeoD1IxQep/XVLI3Nb+rqGkg8YpJ8Iy1jEoN5KwFelzaALaXGSeI
	 FQi/u/9JX7o8v4BqyF5JGiJiWHXShH8Oe95DggMq9q1Kwxa2YOIlhEO1XGYULz7gIRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=faRp1wfs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZS9bO+c1;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CC7606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 09:07:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59CC7606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=faRp1wfs;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZS9bO+c1
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A56U6nC4169637
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 09:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LsV440wqUVdiZdYoeXwTYZ
	Wm3AKrhNqQvELUvOIoVLY=; b=faRp1wfsgn8FUEXvl1m1aBBHowGakxDz1tY8X6
	zf+IXor4iT6kc0BpF+HDF29ox++N4VUB40vRVEb7xW0CCCKSaGnKboLTOCvLzmVj
	eVcsMXL2G4URreAIKEjbemC4DPZChRV/KyGS5MgY3FFvjuCAffD9Sf7urN6sNqaQ
	8y2wzkhu1elY/f+qUPugNj6y7f3nbP4FjR9CK6bbn9hQrbNAf2D2WsRNID0MaK7Y
	PIkuOcHB2j/rIk3uVgv9jDxmq1HbQcj5O9sN5PSY6vlz+fxTTIllxmqkdRgSqDSc
	mVYebgk3f1ij52F4CG4zHocqh0MNq6zrZy2I7GNMQVg7+8Aw==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrmcd8n92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 09:07:48 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dc57e2a3f2so2536304b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 01:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793869668; x=1794474468; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LsV440wqUVdiZdYoeXwTYZWm3AKrhNqQvELUvOIoVLY=;
        b=ZS9bO+c1YO9/qE0CdrfV6anj5vyJ0usaSy2VtT+kkhnfYjaRFKv8sHLcTfO0VH5h9K
         cvtP54zjYxSHpAtI6307PAhjx+YLSI5g3JSuxXFxb2qsr0yH6ykD4gT/ZbFaNHD3XZ1y
         Yztn8D/sIAfZnHFuW4zThm3AdgKCwX5yqrtylOSxGRfWfh7nGa2+ohJAVsEC+MEHRmli
         bRDgoAF21ngj8sgkQqEVDkvK2NfqgIxfj8NzHqt0inD9mc1m3w8TXFiUKk/g3m+WQybO
         DDlR6CHV4h4QcmtH06u4fc3QMqidg1Lc/9wzdP53NBZSZnfJeUFKrq7AMZQnEkvKFsH1
         cpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793869668; x=1794474468;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LsV440wqUVdiZdYoeXwTYZWm3AKrhNqQvELUvOIoVLY=;
        b=C1vapQ4dAroI/EwR5CoIVc7GUy5Cg5x2qzWQVg/YW/6wWtVXzB3nzib3h04Rstqy+i
         arzbcqc3HGp2SMdRX/nioOpfLCJ35/QXFYVk5eRNCPZAc0xGM0+Iw3j/zSjNpi7hqJny
         tuLHhkBnjqyCFFx4au6HIZfqjtm9U5aPw3GxhF2891U1RTVlhQrsnnfortGAjtMl4F0j
         503rkas3zouB9c0zrPXjnC+KjGUJ+i6M/cadYZZ/+6U9n4e6/Ms6eed5AADcJU/ssh6c
         TImIaPX06AcE97d43koJxGoVr6SDKrGLAKgnIrRM4U8FBFOcBzaMdasUVoq5EDJE/qA1
         UddA==
X-Gm-Message-State: APuU4Z8Y59jf6p7VdqJ07PmOce2rvOlMtJ+QXOAOrzqqGoWSNuRvUsCr
	ROv7wlq99X7KvJvDeWIdAkjcnZ7n+7hQFUADZL+aj5xWPfJT0R8lapDHW35Drc8EqfouEN7GB3U
	YJKlOuVLFTJ6FYAilViFNJC8qwfWbq1menehATJlKuZjVzkJXLEsUAF4Exo70isRPiegb
X-Gm-Gg: AYBFou0+lMC1kABUydNtPbZfBpiyQKp6s1hvhHkLwuBzug6RlMq8vMgip8AzXCw9IJr
	2DHpsnMqzlcqdh2ZhxBMBRWMQrV5qK0e66ZFcKy4IPfZhP7DDbySpOAnSXTWCR0vfqSWUdWpXKO
	EzcpPCj3UgSFemTxmjZgvU3lAPqZFm3+4I/CTlpo21or7FASz+Yb/Hd6zzamQhCCoHwiq1IETxh
	jTDb7rwTg1daGjgG0N52+JGVRJjf8Un06m5I42vKgbpwu6Y1gu4uj1MPeNhNwma8mJAoJVYOBAQ
	tXmaXR9boIVi+ZXWilrn/rpLeo6sL3x/4PZZu5jwLSwLdpw74ilAgEWpAPvyEF5xEknVa5/zPT7
	C8BHx56Zhp9E9/3ZSLlFLhILEJRhBYbyiLFW16Fdp1T1lELMSbLnlFGH1csl8dL+1ywiELujLCj
	+iDIoJTzIqiLi2eYeTwQI=
X-Received: by 2002:a05:6808:148c:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5640dddd764mr13110656b6e.36.1793869667546;
        Thu, 05 Nov 2026 01:07:47 -0800 (PST)
X-Received: by 2002:a05:6808:148c:b0:4b9:e65b:8c36 with SMTP id 5614622812f47-5640dddd764mr13110637b6e.36.1793869667088;
        Thu, 05 Nov 2026 01:07:47 -0800 (PST)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9ef6e3bsm3729636b6e.5.2026.11.05.01.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 01:07:46 -0800 (PST)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 01:07:45 -0800
Subject: [PATCH] arm64: dts: qcom: glymur-qcb: Add PCIe3a support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-pcie3a_x8_1105-v1-1-d09aa0601186@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAGBH7GoC/yXMzQpAQBSG4VvRWVNm5PdWJHF8OBZoBim5d4Pls
 3jfiyyMwFLhXWRwiJVldlC+Rzw284BAOmfSoU6UCuNgZUHU1GdWf0x1m3PWsQIictFq0Mv5Dcv
 qt93bCby9F7rvByFx6elyAAAA
X-Change-ID: 20261105-pcie3a_x8_1105-72b9c8dc1ee3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793869666; l=3904;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=1HO7Y0XlCTOoiqkB5LsRHtHbJ2y5S2S3Yf2vpPHMePs=;
 b=QbUw7H1ATXvDbwNVD7NJjseHpU5aQlQudedBNm7cOOsDFn5E0PzL2oNYpI5ofI0AR2t0CnPk2
 f6kLosFNGYDB330l0vCQfo9X0Li048aPH5Vooeil9HYmbVLW/oyqA7i
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Authority-Analysis: v=2.4 cv=EOGTQFZC c=1 sm=1 tr=0 ts=6aec4764 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=yYecYAONF6xWfZrvDxYA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: BO5iMZzxJWoNXJOwLUqTSynAxdXO6uUT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfX7Xov0wre7aKR
 hRdozjctZAu5jG6JTR5C/Ywdxxiiu4s/tsCWOkq1VUSKkkVbaodwgd+LvxX3gehmIlPRppKSmi6
 lmqCC2V2ra0EnjmN6V7eHHJlEW4+0Qw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDAzNiBTYWx0ZWRfXxSX69Aa5PBaq
 bxKyQX3j5/BNCxdAXnCccJBXf+KDz/5dx23PIbjx+zU1C4/uwKBtLYbIaPWXPTfOL6PjXvAI1bT
 s/hJ3sWJTKA4AyqfVCbRfSEe0Miihu7fXbAZUfrrbvuTCjXUscIlSLdTOT/FoTFvRRAEv4iB6RG
 TLhv3gIyA3RprBob7FGqHF2WxiGvUby2emDBrfUuNXvDRQcm3CmaIEUdXOm0+GgjIStpSLx4CTz
 LzUSmyCKJ3cvFqIbK1y5C+pF+7A7HlNGZQ3tDxTZ+jdmsLgLTLBpLEXX74/bf7/NVGYZ+tRxAlz
 TUNBfSCS7rcwpyysQx2kdr7qvvzc32jSkz0TPCO6zaOlrhDa0rKKS3wbtt5k8L493nD0bf4CVWG
 4Sq8FDL4NLuKmPsri/K1NCio8X6uSwHrtc/kjfbFgElUYdzH+jDaCn7FKVl3b7CjYV0pRKdjr9Y
 z7pL++/eQy5Ux9nc1kA==
X-Proofpoint-ORIG-GUID: BO5iMZzxJWoNXJOwLUqTSynAxdXO6uUT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050036

Add support for the PCIe3a x8 slot on the Glymur QCB board, wiring up its
regulators, pinctrl states, and PHY/port power supplies.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-qcb.dts | 117 ++++++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..741a24454e80 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -78,6 +78,48 @@ vreg_nvme: regulator-nvme {
 		regulator-boot-on;
 	};
 
+	vreg_pcie_12v: regulator-pcie-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		gpio = <&tlmm 26 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pcie_x8_12v>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3: regulator-pcie-3v3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 135 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_main_3p3_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_PCIE_3P3_AUX";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 136 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&pm_aux_3p3_en>;
+		pinctrl-names = "default";
+	};
+
 	vreg_wcn_0p95: regulator-wcn-0p95 {
 		compatible = "regulator-fixed";
 
@@ -438,6 +480,31 @@ embedded-controller@76 {
 	};
 };
 
+&pcie3a {
+	pinctrl-0 = <&pcie3a_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
+	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
+
+	status = "okay";
+};
+
+&pcie3a_port0 {
+	vpcie12v-supply = <&vreg_pcie_12v>;
+	vpcie3v3-supply = <&vreg_pcie_3v3>;
+	vpcie3v3aux-supply = <&vreg_pcie_3v3_aux>;
+
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
 &pcie4 {
 	pinctrl-0 = <&pcie4_default>;
 	pinctrl-names = "default";
@@ -590,6 +657,29 @@ ec_int_n_default: ec-int-n-state {
 		bias-disable;
 	};
 
+	pcie3a_default: pcie3a-default-state {
+		clkreq-n-pins {
+			pins = "gpio144";
+			function = "pcie3a_clk";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio143";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+
+		wake-n-pins {
+			pins = "gpio145";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-pull-up;
+		};
+	};
+
 	pcie4_default: pcie4-default-state {
 		clkreq-n-pins {
 			pins = "gpio147";
@@ -659,6 +749,33 @@ wake-n-pins {
 		};
 	};
 
+	pcie_x8_12v: pcie-12v-default-state {
+		pins = "gpio26";
+		function = "gpio";
+		output-enable;
+		output-high;
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	pm_aux_3p3_en: pcie-aux-3p3-default-state {
+		pins = "gpio136";
+		function = "gpio";
+		output-enable;
+		output-high;
+		drive-strength = <16>;
+		bias-disable;
+	};
+
+	pm_main_3p3_en: pcie-main-3p3-default-state {
+		pins = "gpio135";
+		function = "gpio";
+		output-enable;
+		output-high;
+		drive-strength = <16>;
+		bias-disable;
+	};
+
 	wcn_wlan_bt_en: wcn-wlan-bt-en-state {
 		pins = "gpio116", "gpio117";
 		function = "gpio";

---
base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
change-id: 20261105-pcie3a_x8_1105-72b9c8dc1ee3

Best regards,
--  
Qiang Yu <qiang.yu@oss.qualcomm.com>

