Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9024C10CA
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790766956; cv=none; b=rH0vMtQcuCpJxllpsh4lSQ+ESr5kBMjdq/XqeiVbhSfJrNo0rud8Ia3pmlHsDrOlKaIwSr+hji8UdRZ90blA2OBOUvPEl6SB7SFULnuagdR8ETrmW++RffNYU0geo7W8mHqf99h2xMY6LJT3+8Q6bM+WCUGaOfYCRBtTlrsiX6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790766956; c=relaxed/simple;
	bh=x8IEnQl485EogjcmyDG7U6n+sy9pYcoHothjXs4F5Nc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iOXrCKh7kTqe4GJIhGxBP1AInPimzlRR/zXkxe9/NADU5ImJyxdpnhFNOnUNv9mZq8KV5cVVcEU9Y54aErifUkdnRFVzYnGWYn9wx9XcXTHZlx1OdrEhfj21ieYIlT+s4AGKhgzuWEtHkITdsTedNKV45++JznEGzxXWbaWa6M4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmPRiNWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IHN69w+h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmPRiNWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IHN69w+h"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7ObP2019471
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	12A7q0L32pVII7SZL99NVfbFOmX/lvOwPvysaSrL+QI=; b=LmPRiNWZ5aURHu+R
	i1cpDcKs8Y+rPMuRU9eLC56fU0u4AsnK05M5oY5YdB2bYz9u7XZk6AmdgcwHbR5j
	pjcFhrKfXQUkb1wT7kAbG9R4XHMwzmy8sxkW1e1rDtu7MshI+Cn2vn5xjDg/yp/p
	kTb9RyYQhfnJ/4gDSsUeobTmpLw1FIGQ1crsLAABRnSWEh3ggCD9nl0/LHUBenSx
	2Rr73SY7+LjRbPIu84ZSltcjXQWGwuNMyTn9m6GtgL5vt9L1gAof/STx1YAT7feU
	5iwXlvAnUwb99TQNVRtLyfKMjfmvrmO0+N6X8Lh30hokh94OLiPK7DJm/hj7cwix
	bum+5A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x1c0yr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:15:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2df7bc60df6so41459935ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790766953; x=1791371753; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12A7q0L32pVII7SZL99NVfbFOmX/lvOwPvysaSrL+QI=;
        b=IHN69w+htC4r6U7N3BPwRA1E4t0SUaIJ9TP86yQjcKezCkk3U/nN5fsyqxREj7+1/1
         X9mjZKziRiG3xEWkM8H1lW/wycY5kDaUqzsRlp8pzILsMePVATC4z9J3HOFOXu93lBvW
         9/t4nQh/yGWMfGHyl2p92vaZZ9F9zAhfGK8+6HqYq6Zon7vZXwsKRK4wAIByH5u5nNdj
         q39IxChClB4nUeDi46ViPHs9vlVCoy7a7UiYls3L9hgpg5qYqsHP1k9WWXTlYrVrNGoy
         mgw6ALtozzv8CRgEUmdarl53gbzhLF2zHuTBHSbSZlWmV9SRfupRtmMcsD6OVrOX3WTo
         xYCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790766953; x=1791371753;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12A7q0L32pVII7SZL99NVfbFOmX/lvOwPvysaSrL+QI=;
        b=PlLFSfCNLQgYXoTojb6LHXiAq1T3GLyvugDnYmqWvVfhl4MoSgMtqDyiErYpAA5Xo7
         3vDSaff69lUeLEKyDOKTcoHD3p3FXBUndC8Dh4CgIHU6HHP7jsdFjfMRE/nnk8VFp0nj
         zHjFRHmAHK6WaxbmqJV6ZNCfhniHnVzLmEayOdFN/Sgi5lU8AljYZEnuhNihwZLuBv/O
         CV7kpctw6QaE1wX9r6klFcitlrlLDYTPKjs4ucv0FXMBa1Y3Xo87IaVY2UeSdWtDIhBS
         OXTEWzad93gmbiWDRupHUmkL4QQb7v0aql10g912QtNDc7pp0eD8czB1gH/KgsD/oxYv
         rIhQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMTtuoRgvceWw+CZgj7YZMFvdEpt+BbELGt3Vsq2QfoPUZxkbskFYhwwG5CP+ydOjvFBieL+Wd5131UcVw@vger.kernel.org
X-Gm-Message-State: AFq9FYID13iOrMUFwU+JvCYwDXHQH6N2FDSn+aSjYdvAhmXRFEPbJ1hZ
	jNLJTRXChnNaOSgB2JFU+Re9Bh0u1dWO1apXA5e9GD+dHa7HrxY8gO9U3eUzwlyVlsnMTNH/xjf
	ZkmM917Bgocwrh6HaZrJTK88JIPc6NIuQk0jSS57LiGx62v8p8To4+bvaGlkzZs2lec3q
X-Gm-Gg: AYBFou2L7hMv9zPuZK4a2O/3/y9VcDPCcB1JwGDMBTjmZ0E+eJNIqwtCuaezByUu38x
	NH27onu8cFJQUvjUP0h1d9eiDkV8Lgd/+JSxtcGrePX39GoNOH24lbS9CBko97Vsc8DwQBzgX0Y
	90JcoY1DavrF5hZY/ZPSo1dCpN+vGxINLVQorfwHxwvTo1Hh6Ccq9i16YI1TaSoWqNzIKbPQ/EB
	66efSak06HrDlC67v0dr4Z8+tjjKrewtPd3nFnhxeMsCjcAc2lIM/40Hn8O5WnYlArv0ogzv/7f
	L1bO4kFvkEtlzey/DBlXg427DOQ73qS97BuNVQEeb6Q2TVXwRfa7haMUolZijw+eUzXI9fYyOsS
	kL+5DlXDuVL+xZ+/WqCP/gW6Y8p0=
X-Received: by 2002:a17:903:2b04:b0:2dd:2b8:7198 with SMTP id d9443c01a7336-2e2e49962aemr9452515ad.6.1790766953430;
        Wed, 30 Sep 2026 04:15:53 -0700 (PDT)
X-Received: by 2002:a17:903:2b04:b0:2dd:2b8:7198 with SMTP id d9443c01a7336-2e2e49962aemr9452315ad.6.1790766952973;
        Wed, 30 Sep 2026 04:15:52 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e2e5c1b136sm5505465ad.71.2026.09.30.04.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 04:15:45 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 16:45:12 +0530
Subject: [PATCH v5 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260930-shikra-dt-changes-v5-2-8eaf658a0e38@oss.qualcomm.com>
References: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
In-Reply-To: <20260930-shikra-dt-changes-v5-0-8eaf658a0e38@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790766920; l=3209;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=bbXmK13aKPaq6iFS3DzUTlaOBfnJxVDmlcIoL7Ekra8=;
 b=O9+WOcdWLRVX4XZodTNdSVJ0xgBEm8CTVEHlv/tRw1G3Qd9S3hP6LUVU/m278zH9nRtImnPIz
 SutKLpfLqdGC0msbLDQ8npgqEnkCNvPNZNY7duowYbge5ot8MeH65nE
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX9Kb9mkDM+waE
 Z8Ri8zxmZicg1dTQMYA6gzxw9vNk1a1yeOGVihcqB3e7hhqzxyAREXDZS+xjntiAnOBzt2Isa3E
 knYDM5r3k+6ZfRcI8DEGqOWoZdZMwNs=
X-Proofpoint-ORIG-GUID: HoDc-AR86KjYPgXqIPd3B-5hbhTaCA-K
X-Authority-Analysis: v=2.4 cv=VrC2kO2n c=1 sm=1 tr=0 ts=6abcef6a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=yejcvWCcBpXp99Qhm6kA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: HoDc-AR86KjYPgXqIPd3B-5hbhTaCA-K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX9ZvBXJL2UsRk
 aCNhBK+4OPzbWKyIhjJ7LGI36So2MgM3oGdx8gcCvA0RU8ONzdcNH4ijUuA6Hg5cg0VBLlRP+Qd
 gT1p814BqvcWKMjaGFacPcy2xdkc55di2n0/JVFmX4DLddWuBrpiA8MF+7f5REzbuFs3auQ7j7q
 17Se0rwJl0OpQLNeogmLNCT1W4oWY7apvZgDJdy+n+H6OnxsE6a+rWIs8Vo/KOUiTsh5xrPPpE1
 stzfyNlyKAm83P8xd6GHnI6EhbtxITxInMS7RyyFifXpHFHaaEH6c3oblvUfcePw4TnbdBhtwii
 oWyEYTAWLUfrq8AY22sABqBy9C3SwotqL7IrbfTjlatDmYlmwMrP6gFCHcEGDNb12ImhmFSLmwK
 LszVtKF2zTYdPXBvxOumzOI9Q5SSXDNm89hRLutvI7LosYvll71OvsGv42+EsBz0OYa2g8Fkoyk
 ZJlw/kcFf/8tJUoH26w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 110 ++++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 7a2f3e1518fd..5e49a5c71a77 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -23,6 +23,86 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	lcd_bias: regulator-lcd-bias {
+		compatible = "regulator-fixed";
+		regulator-name = "lcd_bias";
+		gpio = <&tlmm 151 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_disp_n: regulator-vreg-disp-n {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_n";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_disp_p: regulator-vreg-disp-p {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_p";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		vin-supply = <&lcd_bias>;
+	};
+
+	vreg_wled: regulator-wled {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_wled";
+		gpio = <&tlmm 91 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm4125_l5>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "dlc,dlc0697", "ilitek,ili7807s";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 3 GPIO_ACTIVE_LOW>;
+
+		vddi-supply = <&pm4125_l15>;
+		avdd-supply = <&vreg_disp_p>;
+		avee-supply = <&vreg_disp_n>;
+		wled-supply = <&vreg_wled>;
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin>;
+		pinctrl-1 = <&panel_rst_n_suspend>;
+		pinctrl-names = "default", "sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm4125_l5 {
+	/* DSI VDDA - must be at NOM voltage for PHY PLL lock */
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -89,3 +169,33 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&tlmm {
+	panel_rst_n: panel-rst-n-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	panel_rst_n_suspend: panel-rst-n-suspend-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	panel_te_pin: panel-te-pin-state {
+		pins = "gpio86";
+		function = "mdp_vsync_p";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio151";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

