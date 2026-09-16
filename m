Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984C44A3F18
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549928; cv=none; b=pKK1nWXPrsiEvlxVWtOfoBFAM6gh3KTVAHU/5lntmjJpx7/Osqiw9m+tlPFHIV0GVpz/XPDW1+d9J0YHcj5H3+SVfazhaG4U5SfbDbKbextvIqa4gUgFCCHXjF2E0mcF2Wj8VcutYVf0Rzjsr5/TxnUwzy+3HbeGE7PfYmH5Ee0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549928; c=relaxed/simple;
	bh=ALrRuZDDpwCzwcagXTaukDr+HDrgl7+P6tkOTlDyBuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IuLxJaRJ+7GMK2ZCtYOQk3XiyMAf95tI3qoQ52nL3Xa7NxCgNnpz97xIyMbmB+zZh3szT+0NXw2Kgnldr/LdKQeHfMPdtWfTwJ0GKBQoCt3TxuP9O9CyqtIvAADqhq1ANf5n0ZrxUktnGQdyE3TOyGhiWYKFW91gEjlWe5Mz26Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M9lSFM0v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSazAt1q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M9lSFM0v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSazAt1q"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G92am43169030
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pM5734dXlM5CqB9dDjz+qvpUih4UdES4eeishXP82+Q=; b=M9lSFM0vLVoV4I77
	2gNQd6dZ/ocSmsSWFYn55AD/4mI0Cf+/2kIO430zWzMCUvPSPY0qauWxFM3Cre9m
	7NEXrbF+EJbGHkcyKEuHcHZucvM1HpAmVW4DQQpgNa2I4lA+ZgaxQcMmN/RHzDT5
	8+EBWfjyRxsjKh38HFfZxCQtTFwo2VIaWN1cXcH9/sbe6B4byD8maPSieDFgOyw7
	sN7WZWaMCOaf4+nRNe9cFazX+Fflo1Kp/V0pjRfNFomGoeIiBOd0EuLW9VBBqXlx
	wi2fmYqHwkPV+ILTTjmpSsFO5WbgbwNngIMAmcIlV4S6cUPpSc5ZZBIjuE45nKRR
	iBx7ow==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqpu2rcan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:11:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39533bb224cso7409127a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549895; x=1790154695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pM5734dXlM5CqB9dDjz+qvpUih4UdES4eeishXP82+Q=;
        b=XSazAt1q8QKzTpMQ+72gJZ9vdMLPOWljXFZJ0eyquv48WuvR2gug8lGwVoBrVKSjqD
         qOtKLwi6G6JUjxyGJfyfVR9AnIESwAmGyhhIKXg7shxBasE+ntfwDf53JH6uJhf6JM2o
         QnKvHuXZDjMepziu/ScvO9Bau21NfWmhme2vjjGp9sq9U96yI6t7LKqAlrU+CzIBJLpC
         voFvBWxZI7LBaoflE/gunm3VPXxHQGe+fZWdZy34rQT3NqaEeR8mxPCSpdiue1hXXpIE
         rr/zJ1X6QQ4BuYNr88hw/ykJgv/uJgU9mwmrWTO4JFQNOWWGvx4F8h2viBjEoWc7dciN
         Eo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549895; x=1790154695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pM5734dXlM5CqB9dDjz+qvpUih4UdES4eeishXP82+Q=;
        b=NWOSqmVc+x7Z3JjL+QagqYsljSEOpGR22nl3LQZ06FYBKL54C+bqG9hRwi1u+mGTD4
         Owhy1T713UfSZ/Cm+4ZDoxl4vM6O7gTp7snxr3DxpQV59rCQcfVa6Z48HnBjN/vsTYe6
         mptYOzJDrV/5Wq83UjDTrNXOa7ShshH0QAUl2gvLe+hmIfCOgy/GsicMCMrtdJcmm5XW
         Bz1BhzpRPQr2O+0/VnEPvUn8/vUARx+uqQBCv10mtohFeqVRV6Qf8iiLgpSZwoo7unkE
         GZ+jwgJ0RyCVpdMyRL/fN0Ex62AnvAcWH9qkl6msLJaxRMsa/6Cn0Ci13qnFgx0Sqhnp
         FQrw==
X-Forwarded-Encrypted: i=1; AKwUvBw0uZNuF4NPF6WNVhS374bekaDWWg0SQ0PjGdQozdm38fk29cv4IKDoHYU5Ub5JqfUnX/FUgL9NG5B/TJ0d@vger.kernel.org
X-Gm-Message-State: AFuF++kKsmjKWOQgOXghnES98goZqWBe1Fx5vqcmFnTv5wjxsm6Tf5Fh
	9jtlMpiIRtOzqXcwM97s8RtQlso91HsLs4urQYC76/rqPym3IOFFg2wgUNZS7IIc6jCM04KlXXX
	1xFDtbuiU4TTNouvVG3PIfkweYeeh+/qqy0LAmeTD/DCI4H/zDyP/reivUSeWtSuR1viu
X-Gm-Gg: AYBFou2OqvvWir+Q/j/b75OOjYFiXXLC5P1qCX5uxBNarO4KYcmIXC/c8gXkKTdpDSK
	gEK/lQ2UG15YEDbNoaaFPGc11zLRNy5Ay8I4oDdf3XO9w1TLqsc6yNrTU9B2XKX5V6aR0Oh7VmH
	vmLsweZiAKSD4z4BbrYHUAG2VDGFMI1cpWFM4l0xwk1ZlOkKsglpCqTZ8FlWNAklK/YQQSbAIhz
	RL7F6mWT/X0AoWurhf37la+wegh1FONltGaHEylt5NALabDiejthszoiMUvAOG7VoNGiqPHc0+6
	ohlm1RB5XA8Duj+T3rFUm6hmdWgdbKFL0NvoxddEAdrya5i6I5AhXLdH6Sfuk6oVvMrb21nUN8H
	Lwnl5dp2FiMeIzKTpeiqDppRTOSQ=
X-Received: by 2002:a17:90b:3b41:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39e1e48a416mr4112790a91.15.1789549894872;
        Wed, 16 Sep 2026 02:11:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3b41:b0:38c:a59b:5189 with SMTP id 98e67ed59e1d1-39e1e48a416mr4112744a91.15.1789549894427;
        Wed, 16 Sep 2026 02:11:34 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm4779492c88.9.2026.09.16.02.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:11:34 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:41:19 +0530
Subject: [PATCH v4 2/4] arm64: dts: qcom: shikra-cqs-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-shikra-dt-changes-v4-2-d5d5c3ffe070@oss.qualcomm.com>
References: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
In-Reply-To: <20260916-shikra-dt-changes-v4-0-d5d5c3ffe070@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: Arpit Saini <arpit.saini@oss.qualcomm.com>,
        Nabige Aala <nabige.aala@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549881; l=3349;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=wt3Zyiq02vRNq4N1d4uIoj8xYdjOU5QkSNX7spz+uVk=;
 b=BtvwYx4GPk9NxVEvosTBLTouuINHozjuTU4DbZ/NpwWnjK0iBp2dY5UVAx0njToAxx6WxQ84j
 fUa4wP+VDuODHUtz9bLtz+W8xqfCCNi5L30NDJUsvGqO8wMG42YHhtf
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-ORIG-GUID: hvcY01dcGhG_JTNF8mqbpq5qviz14EAx
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aaa5d4f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=gJpjwWOAGh2g_eRG5xwA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: hvcY01dcGhG_JTNF8mqbpq5qviz14EAx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX7UoMPBMnXfmu
 7xBYM3/Q3F+5ulNKX+ewg6lPevuq5dqLTMSzZnls8Fst5OZRgPU0PND8L7WMHzOSelqu+63BRjt
 YmGGzfXnlyU6gbeQxDOCFrSSMxicOm+s841g9Dkz4xWL2C9K6hH5fNRj3D2Qv23VJcdqhWrRoGu
 3rfPVn+zOQNiams304vGC2pLUiiFDzre46265N8DYEZaRMGmLF67n4QEbSzWxxpI5aeTIWmUUjl
 S+29cWguni9mIfIAMmKSx2NH+66ETYLhaRjVAxljPOSlbKvwVEN7mD8Ua99t3DZxdeXpmFpcRUx
 s/bUoED8nlq/8uKcpXATj6uGAg3JWMEftLbYTklj+gBwGT1c3qKOfC/6stWa1vL5pqFzPaKKV0u
 Y167MchF4g8d3dJADhqIGX8f9Q2NhwDvm2mJreGuMC4MKVDJvXqsn8cZkCzDukG/Epa5r/WBYAc
 Ot7rQdK7gWn09BiBUwA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX75vDTe79BYlc
 c+LZz9mvQCILwCxNCQAEnJXlnWub5n9XL5e0tv93H9LH//+BiMDfU7eEW6V91oNpWsp88AboxKZ
 UxkkDazdL4R7zS3Wlqrm9xfCtDJ1Ano=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra CQS EVK
board and add the DLC0697 MIPI DSI display panel node.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts | 118 ++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index e62ba5aef71f..a9067b710a22 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -21,6 +21,78 @@ aliases {
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
+
+		pinctrl-0 = <&panel_rst_n &panel_te_pin &panel_bl_en>;
+		pinctrl-1 = <&panel_rst_n_suspend &panel_bl_en_suspend>;
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
@@ -57,3 +129,49 @@ &sdhc_1 {
 
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
+	panel_bl_en: panel-bl-en-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	panel_bl_en_suspend: panel-bl-en-suspend-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+		output-low;
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

