Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B0146F4B4
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787308045; cv=none; b=j0pAZa8M1aILREyvRTOUtzIEVyPww94qzV5m2Rx2lT4Z0HmerTqnfALF2CyVImu36VTmUdiSh86hwP+zbuTP60ir2s466oaagLhXbZEV/xBbAhh5hXp/SqKsh1S0CJ3E4d7Xmwkct9XtClowvGLjfctZ8DxP4xiOOffbs6IP9i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787308045; c=relaxed/simple;
	bh=p5ms3ettnsZUkMaMVpgaQ1dF7NvICnT7m59e4toR5Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QcZJEJWLIdW36t64t2dUsT5Izd7gjOp+BcOnlkPTGxhd7nPJM5Uuqr1LEXVW4/PWoMfQKPbbBd8LlbNeVVOvZEcrHH7o+s2YcmfqzZxSGp+5KcXSK6L3+BpwAUKg9Lf/ETBpdGZ50HBB54e/EqquiaCX3GR3qi2hyvFPblrz/nA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pwkdOgaJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cFqvR1cy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pwkdOgaJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cFqvR1cy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L9LkW21983100
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=; b=pwkdOgaJmZq3OfU6
	/Y5ih8Q9yCvhIBnGm0Jr1Rf9Qd4gEaCeery+gdoan/a06coDqxmNItufhxLBt3C/
	h4r9P/YkL3M77XA5kF+9hxD6kFHMoNmRmxmiKnMIFfxZO/fZJYHHT+z1zZO7FF7J
	Up2cS2pL7Ujdas73tNvdOsyDjsD/wrdrjzwZ/oxzFlzi+M1MCGi1c2eN74AUHShE
	nC4ZV4wDeUUGGiaqF83Y7GZ9LYskkOYtEX9fy6akBYevEgJMErvv/qGR6cXhUneG
	5pjPWqBNcwJHrWiKbukp/v8ye3zy+N7CwekuphvC71Yel5kFDJQB8HPoP8BgxT+5
	QxxvBw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdshuuv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 10:27:12 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cbb92868263so671673a12.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 03:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787308032; x=1787912832; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=;
        b=cFqvR1cydNxIVWjQu267/wr6fG3pONtKtJ/vz8FRodaL8UAi4lR4911j6dKDEmQAz8
         4dGcxYEpap5q0DXZkfgGw1meLZMqyCVsPsQDW/8vclbJ2DNUnopYrtoP0M9Wc2eK+A/a
         7SgENC2CY+9feDUdYpkFCsRV0b54ak5iS/nDgqqXsbtbkJ2OaPIuX4R3KQrz76jcKG9K
         kuLuAOKg3pL+WoRN73o9dFjw+d0Bdief8nf5/84o9U/AIK1iiWeyjaiqTXm0NWiAtHNt
         cuRFtmn2vQi73qxlN7CFuA9QyQpMrgV2EsTgzwkV10RjfyJzZjORXWBWRvwve6aZbwxz
         rURw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787308032; x=1787912832;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=;
        b=TC531j2UcWJkdmqtQyEIDgTxJPWRQkaoLYwm5jd3QeWVnQqlqtyLwc/zHbR8izDo4Y
         ypNt4AxRq1O4OuI5Sm/XhIzkmGHRBKITv2RsCYSMhbpwaT2/xvJQKtm/iDEUMVu6s+ae
         9mPKp0R0BOZhg9/mL8GJJlQZuydZSi7iv82PvS/wrFQLkb51zy8ai6ejNuoJbld1D1ta
         jIw+pRJgkXLgBp+fmsIkIGUNRdTUREwSLSy7oRs72hyW/OEjwkn4XpByMPKzN25P+Vua
         Ltjf1eyX8Br4eyEiYx+pA2trzKoqMrLRYCMnssd9iGGdixPnCEC2kjjNCcF1AL5mfrWA
         yLDg==
X-Forwarded-Encrypted: i=1; AHgh+RrafPMiu5+gE+9SZsO4kJmm4ibvNQAEnt+QjUFS8sxpGu1xiwAw+kc4aXWdc8N0FJEtvlENYUDPXqR/ixPB@vger.kernel.org
X-Gm-Message-State: AOJu0YxEYf4GX2K8ZZGAhHi/te+gleDnTkV+98zcAta5pvklii+K7UdO
	IViLIi5kbCkt3PSsKKsC6GAAVjFCxNcyW2e0HCsR/ogW1S7Xa/QtQHiRfIzIXLa7N5soROhzd/6
	z3enz2rJRqGjSCUPU/ijUblYDQ3+0j9lElA9JdbfiumQ/Eq87z7gcm7iCn1p/Gc+XdEc2
X-Gm-Gg: AR+sD101OCSvnXAcPZXBTxeenbHCp3ImkdZ7lhYVB8mX3va+orXVMagtgpVaY0Vzrpz
	6gGnSQYldOGFa2DpKaHTBySxpVQ/MGDsoAKV+GQNCLGl+iH+TGFH80PzvelIq5NkPYsnU0uMgRy
	WhSD681xOYz7UqxgHGux33YNINGmhKiOdknwpJaD0IneVSQu5xpsVCeHHmM1iQ1zhJvFkprvOGX
	uO1qMks8Fx3Aw97pAsBTteXrPfgGMHmlQTqJ7x0kGVj9pvHbGx1OkMKbAvxZPauVsZ/xov7b2+G
	rixUXzi+O1n0vEQ6OQAfZEepWI5Lh3KUbU/5m86dxGN5wPZlZqb/DCg16BazDIepjq2g2PUzhbR
	pfMBNuoJovqT04ajiyst93mMmNRNW
X-Received: by 2002:a05:6a20:12d3:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3cd2fdd1cd6mr8378477637.3.1787308032033;
        Fri, 21 Aug 2026 03:27:12 -0700 (PDT)
X-Received: by 2002:a05:6a20:12d3:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3cd2fdd1cd6mr8378385637.3.1787308031544;
        Fri, 21 Aug 2026 03:27:11 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bf15ff5dsm25859682eec.25.2026.08.21.03.27.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 03:27:11 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: shikra: Wire up usb-role-switch for USB Type-C ports
Date: Fri, 21 Aug 2026 15:56:52 +0530
Message-ID: <20260821-shikra-usb-dt-v7-apply-v2-3-030647f06285@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
References: <20260820145036.2035641-1-akash.kumar@oss.qualcomm.com>
 <20260821-shikra-usb-dt-v7-apply-v2-0-030647f06285@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XofMKp0bUeIe_GJgZ6Sq8RRG43pGOCw3
X-Proofpoint-GUID: XofMKp0bUeIe_GJgZ6Sq8RRG43pGOCw3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfXwEVOahqr0J3z
 lQ8vqL75boOXDEoaAhDR3l+odY37KZ5nY1ztjLGv7y3mENSTlVWCgMF2MMpySe5wTUR0A4RyjNi
 oKLEe5t739r7sspO6ywBppJW9CLRm6g=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a882800 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OKfUiDEiIDe3Zo9lHMoA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA3OCBTYWx0ZWRfXwwL9BOSQtA78
 4vDFxTXAC4KRzXXDm59aEanDIutlk+PFr0UZfzNYzvWYlrUPrLj696cRGPwYsIwFbuj2jr5Mv9U
 vEyK7375RU3QIdZh85L2zL+IIrkH9P7VlY1vhHG09t69gV1ewHJEFoAppY2UdLmDXQsMySM/xHF
 K+/sfeNxxLyfmXY3cQAUVHm/+hbd/nYf++cuTtIdJPTQ+MbmVtXLQEClUdd+5s8wBuP/v39hzRH
 Ff/DN8kH3j6tEDAMnfeyf6HUqzcwXQPgr5Uon6+OKISu+u+Vxkxfde4ogyQUwzEO0n5TOUp9c0e
 3XJaVBEKtVLD27iItNK3iCZ3gBDjbedGnL2Gl3Q2KUDYy6nKsRZoawvmyFHXT2r7kUr5mcT9LwD
 KxtT29VGUPUQJzAToTdVumIhFqDH9eNTX25PYPKhYgUi60d21eMZwiZRAmqQSPxcYw3c2GTRT/q
 CWe27yj5478pkxczKkw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_03,2026-08-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210078

On Shikra CQS/CQM platforms, usb-role-switch is handled by PM4125 on
the primary Type-C port and Cypress PD controller CYPD6129 on the
second Type-C port. On Shikra IQS platform, usb-role-switch is
handled by Cypress PD controller CYPD6129 on both Type-C ports.

Add the CYPD6129 typec node under i2c3, wire its connector endpoints
to the corresponding DWC3 controller ports via remote-endpoint
phandles, and switch the associated USB controllers to OTG mode so
role switching can take effect.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts  |  84 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi |  45 +++++++++++
 arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts  |  84 ++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts  | 107 ++++++++++++++++++++++++++-
 4 files changed, 309 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
index 3866ab8b0faa..41290b562fa3 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk.dts
@@ -42,6 +42,51 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -58,6 +103,23 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	/delete-property/ dr_mode;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -66,11 +128,14 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l8>;
-	vdda-pll-supply = <&pm4125_l13>;
+&usb_2 {
+	/delete-property/ dr_mode;
 
-	status = "okay";
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port>;
+		};
+	};
 };
 
 &usb_2_hsphy {
@@ -80,3 +145,14 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index 8ac42ff625a0..e4dd793c882b 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -85,6 +85,51 @@ &pm4125_resin {
 	status = "okay";
 };
 
+&pm4125_typec {
+	status = "okay";
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "dual";
+		data-role = "dual";
+		self-powered;
+
+		typec-power-opmode = "default";
+		pd-disable;
+
+		vbus-supply = <&pm4125_vbus>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm4125_hs_in: endpoint {
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm4125_ss_in: endpoint {
+				};
+			};
+		};
+	};
+};
+
+&pm4125_vbus {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+	regulator-min-microamp = <500000>;
+	regulator-max-microamp = <500000>;
+
+	status = "okay";
+};
+
 &pm8005_regulators {
 	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
index 34568f1c7b63..36514a31d66e 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-cqs-evk.dts
@@ -42,6 +42,51 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 136 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm4125_hs_in {
+	remote-endpoint = <&usb_1_dwc3_hs>;
+};
+
+&pm4125_ss_in {
+	remote-endpoint = <&usb_qmpphy_out>;
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm4125_l20>;
 	vqmmc-supply = <&pm4125_l14>;
@@ -58,6 +103,23 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio136";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	/delete-property/ dr_mode;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&pm4125_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm4125_l12>;
 	vdda-pll-supply = <&pm4125_l13>;
@@ -66,11 +128,14 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm4125_l8>;
-	vdda-pll-supply = <&pm4125_l13>;
+&usb_2 {
+	/delete-property/ dr_mode;
 
-	status = "okay";
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port>;
+		};
+	};
 };
 
 &usb_2_hsphy {
@@ -80,3 +145,14 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&pm4125_ss_in>;
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm4125_l8>;
+	vdda-pll-supply = <&pm4125_l13>;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 543d769125ef..ee0b55b2c462 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -42,6 +42,72 @@ &remoteproc_mpss {
 	status = "okay";
 };
 
+&i2c3 {
+	status = "okay";
+
+	typec@40 {
+		compatible = "cypress,cypd6229", "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 50 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ccg_typec_con0: connector@0 {
+			compatible = "usb-c-connector";
+			reg = <0>;
+			label = "USB2-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		ccg_typec_con1: connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
+			label = "USB3-Type-C";
+			data-role = "dual";
+			power-role = "dual";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ucsi_ccg_port_1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
 &sdhc_1 {
 	vmmc-supply = <&pm8150_l17>;
 	vqmmc-supply = <&pm8150_s4>;
@@ -58,6 +124,25 @@ &sdhc_1 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio50";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb_1 {
+	/delete-property/ dr_mode;
+
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;
@@ -66,11 +151,16 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
-&usb_qmpphy {
-	vdda-phy-supply = <&pm8150_l6>;
-	vdda-pll-supply = <&pm8150_l12>;
+&usb_2 {
+	/delete-property/ dr_mode;
 
 	status = "okay";
+
+	port {
+		usb_2_dwc3_hs: endpoint {
+			remote-endpoint = <&ucsi_ccg_port0_hs>;
+		};
+	};
 };
 
 &usb_2_hsphy {
@@ -80,3 +170,14 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&usb_qmpphy {
+	vdda-phy-supply = <&pm8150_l6>;
+	vdda-pll-supply = <&pm8150_l12>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ucsi_ccg_port_1_ss>;
+};

-- 
2.43.0
