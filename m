Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654044908AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789549906; cv=none; b=aip+bWp5bAbomr3s2Tny0k4fG0Jn8Nx0ai6KzFYoeZSzeaf7NBtHxXm9fjQQBCL6in1qp/72pk2VKmbM5/nl1EzKns2DpBoQhSD3txztfTdXNmbzV925Dz8JMXSruOLrYJBT5wQVmdbdq2eQ0PHUMp+8vOPC+f1FvxvNCa8vHjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789549906; c=relaxed/simple;
	bh=xMYMnPMU5Yw+jEdo/0Y00w8qs10Os7yQTKA1yZKoEZU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jD6YVK6AXe/6vKXSSGQ049a8Mo+CeCIog+CBWHFkzC1UdIGzjyihr/nT+zh3U2ZbuvQoSExhmRxYhlFOxP4C32nruba9oJpvyaeyoQP9lYmv2iPhw76i957MBcMA9/IGrgSfUo682fiFlVdFicovdnc1FZQIyhlMtC1ZWsZC0m8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lG0vRO/N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TW2OnS8q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lG0vRO/N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TW2OnS8q"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68G93035978476
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:11:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	maUhafwnGNdMU/H+9VwTFo7vojOCmS6PQ+MYvi+vlFo=; b=lG0vRO/NSZbs/qI6
	ZEgMMmwzg1uibheKtGdXFTdCuIlhwO7GimRGGjwjou6OZFuTnGHKoU4U5sV9vp9W
	279PI25Tt5S+0ghQGm3Qs/4yZgFIDM3Jtv2vln9YMQAfGUHJTRHKQaku2TDNJhFg
	LF0hILaBQx6XlnTDbO4RGnTgTv/h2C0KKSQQ8oTdLJ/WhLtG/nWqTRDGK82YlxMS
	MjxL0x4MduES9Wq8EqA1LFvcGBEN71hiRpKR5PtC096SY9YCQGy6wy8AxHTxsH+y
	C8Q1S3BeIq3FMsHGPqKy6YQSUtPMBk+tjT7zoQ4l5XRg1++setLGDl8k1OxO/oZa
	v7Jh6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gqqp3r5a8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 09:11:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so9325666a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Sep 2026 02:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789549899; x=1790154699; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=maUhafwnGNdMU/H+9VwTFo7vojOCmS6PQ+MYvi+vlFo=;
        b=TW2OnS8qivtgVDbYWhP242EHv9tBSGjfgiPhIKgt3BCmRVNikRh0AFHEsn3IsRqpmn
         ++Kyl/H0RkWi/8sspYIKvmCHMPcrYURO7eJb/TMao1nIzL6xvq4Nrdom1+QyT1NMlv7U
         IOt/7EalhNU5311zo09L4DaE6gaxsO2WpaDEyJQ9r199fKzFJBerU26oKV1cvAiJMgtS
         tTH4sfCq8fEAmWOFFHAUqdc8D5D+lWd0aztiX7RN6GjbILl54pe3yD7iPoDtevpJIwT8
         +wcaxD5M80lZ+Yvp3M+U0JcyRuQoq+tWQD1fhQV72OZ7P1KldLx7FxgjYC7zwWjvCh7m
         EpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789549899; x=1790154699;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=maUhafwnGNdMU/H+9VwTFo7vojOCmS6PQ+MYvi+vlFo=;
        b=HBmHxgpRttUAbrFyO3vKmxmxC0Nq3ohI910DnvtsoWtQ2+XYGch2oRc9K7bPrpwape
         iIRNbj9p4vB0KBNIh8Ib8jLXfPw/b3skOYLv151QX1sOfxHJOwzP/TiSK3TWiAOiuksH
         L1kjmPfZllw2bQjooi7WNLLyC5SztHwYApOF98l8dqBpLaYkjQHAnncc9SN1qMEjDteD
         OF8JouD6ZvBN4P/30bJtEeqRJCyhIAihJGMJVEwJboRgUDM+Ch2upBlOAqHR4S5erJce
         H1iVE487QffwCu82O3wd7tauRWH0XKDGFyk+qFmlNX7iYe9sUM4n1RWp9bQFjDHyQTMo
         Ntug==
X-Forwarded-Encrypted: i=1; AKwUvBzuDU3K+LLD5bt/BwLbUZE2fjLeYOF64CwbHUDraPA8Tcw5N9BdwoMUwRfesh1D4rx/WQbLZK/AQeCF5XBk@vger.kernel.org
X-Gm-Message-State: AFuF++koY92EmDI9HAJb9DsW2AlzpnRSQOAHjHSBKN0KhIAwAkVEgf/i
	URtib/iv6kWtQ9XxkgZjyz4z3V3kWkHus8wzk30XlvsvuXyl+WEBX6WCU+uMoDUi0INWI7+fPGf
	DTxIFhafUn9xrIY+sqfdxVUhvISFMnLsN5IJa2upPigA9KKNpMLdsByDP4RNTpYk5ILmd
X-Gm-Gg: AYBFou3kqA5+vazOnGzSmjqu/DoO9E8RdzKEjHXrUwtfrFKoW21/tGuKZQUWnqtgCIi
	H168pNRr3vKUnow7GcbKA4b3+PPye3Lgxsnb3T/9GbvEn0J9L04mfnn1Aqdxb1hBDPvteBeBPbd
	REHzlHGu4s42uymTUnbqOilwCVOjvRuwNneP1gSeGjV8PygJe7NAZE9UHqOgY0T37jc3+M4fqRi
	L7yKTL8dZwsUvz8iqWjAd4c8hQMm5odR3YYME4KQfUzJ6r3Af+kuXO44NgodvgAQiU/gksGhvf3
	TD3dD4Loyc6+7T6pewG0EajlljsGHFrQPocIxc1C1Ejk4gCs9L33dYHTqps+ZTQuHbC46jEqx+4
	jM+dKOOCHKHr8+oKI2CTfcDmwG3M=
X-Received: by 2002:a17:90b:5785:b0:39d:ee20:1e2c with SMTP id 98e67ed59e1d1-39e1e5042famr4826771a91.18.1789549899062;
        Wed, 16 Sep 2026 02:11:39 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:ee20:1e2c with SMTP id 98e67ed59e1d1-39e1e5042famr4826726a91.18.1789549898671;
        Wed, 16 Sep 2026 02:11:38 -0700 (PDT)
Received: from hu-naala-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14395d3a31asm4779492c88.9.2026.09.16.02.11.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 02:11:38 -0700 (PDT)
From: Nabige Aala <nabige.aala@oss.qualcomm.com>
Date: Wed, 16 Sep 2026 14:41:20 +0530
Subject: [PATCH v4 3/4] arm64: dts: qcom: shikra-cqm-evk: Enable display
 and add ili7807s panel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-shikra-dt-changes-v4-3-d5d5c3ffe070@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789549881; l=3432;
 i=nabige.aala@oss.qualcomm.com; s=20260520; h=from:subject:message-id;
 bh=EAfEl51H9cFjDfmWgu5NdylSTE4vo+KiMbjbQIkrv9k=;
 b=FmJeSSCMVNN+GTwSdFNJXmIvj9cX3whfmQKXIN4uedtPZUtYzfPUdN2XIDDtnLhdZR+/jQsx1
 WN3unjMr9oDAgoe7mxZYwoZvFCNHfceUdSVZPSq68igQNJrnX6OV3An
X-Developer-Key: i=nabige.aala@oss.qualcomm.com; a=ed25519;
 pk=PYHJom8sPos1IGkrbCCsWiE7XTBQrQZd9jzAo051tgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX6AFRyNHLpfiT
 a/h/WmRpAv080spbHKtroD5K+F2MJoLWPKwsXF1N0MGT+Gz9y/C3iDDtZPLdOVzH4YkE6T5GrPe
 EP6kI3hJ7CqPphsSeflxRT7YUy6X1EZOUq+dRnmuDyAyi0sOoiATrcxtGXot11gWAj+wosW35uP
 k/ITzMk+KVd22kNGig83AK4LQGL3tVHMAe7jwAkXiwj6QuNJB/GNx5/dJ+Bp5KUHX8s5qZ/8jBp
 o8V6duacOn52ryMbV6K8urwDnwkBrDwsKZ0FXmFT7dQmHbos6r2wmXm7TPT/GkPWlUIBmevFQmb
 INnzFhoCyFC7/3RhG0T7eVzTpWRgzaTghwsLWSo4GTxZXludNCfl0bKm6jpG29XqP7aLLTg5EF1
 LChRByPmVojwGXqvyLZse7J/0FdJt2jORsKFTrzU9m3gxcb5F80lvnCEa+ktC8sayWTK8fDhALr
 Q/F1MPn4YCW8cPaGVPQ==
X-Proofpoint-GUID: Tl7cGqHFhld02qd_VskqaLwwwTzczHr3
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE2MDExOCBTYWx0ZWRfX4KxrmuTU0mOC
 XfYw3cPsupC31DltXOI3WcTxYJdDpGZwRvOl6U2GA6+7YWtENetWyJaZbMJa0+I4fMK06PKrUdY
 EIyRZr250wq7pAIYfzZKyL0+qliJrbw=
X-Proofpoint-ORIG-GUID: Tl7cGqHFhld02qd_VskqaLwwwTzczHr3
X-Authority-Analysis: v=2.4 cv=F/DC5ahN c=1 sm=1 tr=0 ts=6aaa5d4b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=gJpjwWOAGh2g_eRG5xwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609160118

From: Arpit Saini <arpit.saini@oss.qualcomm.com>

Enable the Shikra MDSS display subsystem on the Qualcomm
Shikra CQM EVK board and add the DLC0697 MIPI DSI display
panel node. Pin pm4125_l5 to 1.232V with regulator-allow-set-load
for DSI PHY PLL stability.

Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
Signed-off-by: Nabige Aala <nabige.aala@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts | 118 ++++++++++++++++++++++++++++
 1 file changed, 118 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index b112b21b1d79..d9a0f32ce8d3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
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

