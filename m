Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22EC14C6EF3
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787321093; cv=none; b=i4X0GiElLuvTYlnkodMC0ua5QxAS4bZGQedwI4/03vr52gZ+OGqODf2DnnVMlXJEj78ga1CwH3z193Y+JyoepG/iS4uYdfyRG0V3qX3x82eOGawRN5altRCRVtBZDUGL6AkiE30wMbSO7vxRkFy4G6KKaxCYm4Powgn05CPlL30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787321093; c=relaxed/simple;
	bh=p5ms3ettnsZUkMaMVpgaQ1dF7NvICnT7m59e4toR5Yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aXkxd4AeBQvMt0Y7ySBUe6/KtFpsz24E2fP6av+RrBnp6ff/LPfsBHQU+/PU4vC47XuAxVfXJp+8Wl76fiq7zPd61zk+sPx3LuP24xwY/ws9QVwyy3Uzhs0dyduvZAhsf0AlgmOCrlnzu+n6AH286CPlgGOFhlorrbO2PyPMtII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6A93P90; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FLVrR6UZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6A93P90";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FLVrR6UZ"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LCoWl51486233
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 14:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=; b=X6A93P90A1+gXmS4
	sQ924F9ZEelFEAAlsvB4FCYrHYhG0NuGkK3eEsWfX+keqmu3/7czdEeLWn8Y1wFe
	q9GZE4sQGQm8pJ1Ffh3HutYRt6vqIDttCM4hi4LnwIou4j9ZsN1xwfyrcTZqrap4
	UN41YUSI+I+eaqkXZCDgE9oLR+A6mnTeS4OlTIZMwfWx99BHGgamkVzEdSGJ35WK
	YQFc8xiw7skv3h9dHeYiExDPHM8NMYEM1fMCAMgH5O8pYkE2hAx1p66LA05jDBrU
	AK3ApYHkVlcCZFN3I8suAmVEwn+8iln3MvtOuMs5cjs/gEq29xr9pfZpXfAXKMgy
	SzMMHg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6gde9vmp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 14:04:51 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so1880125a91.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787321091; x=1787925891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=;
        b=FLVrR6UZ3p/S/Zm52aiTRoUHFNApN3loZXRfCM4aIcSluznG3rj90jW4oJc58Ss0UH
         BHUc8j48QZ547+vZPlExejp6l7NWJO+mXf2zf2WR+LV1FRrtx1BSBaf0WbpZh3cxb2gF
         c8Z+e7O3PZp++uA8XDqMsIzG1RYgWop5yh9eAQ1E7dJOqpsUzJ93MsltfSl/IP9g2Kp8
         o8cJCpxBhyqmvVc2ByhOabq3f55zgmfjn3rs9vLa2Zrls7pOmccXesus2MkagkO6y82h
         J9q5sYzgacklNOsmmMd7jYrjeTx/u26ApZCgD46J9xyMqTVzromsrrCXDS6btuPH/Krx
         jKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787321091; x=1787925891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHxd2nhjsoPjXsrENyRfnR3wWpIKcv2XiaMwrKt9YmA=;
        b=DwAGUf/x+MpjKzzGsKS2vF3iWhtNJj/4nJaeQzKx4wavRwerUuKqmI6YpRrzFB3H6Q
         DZFkx+dDbFF0ekIowZbSiiMBNTsZTtU/ghY2MIPXC38Vd9kGfNM566ItDwXYkuii96Ta
         UimXLF9mAF9DJgJ8STKnVYqVsu470n3fX3jCykLM4JOsHz0ev5CPXAJuiktZv9ohyB5g
         XtOKf5a7+gk43+o5hE8woeISpqrdY12yBvk7fvRp7dZT2WWZzw4HTCCxlmLPAr1qHX1u
         VmimCayAtIaE4bc3kSGyiwgmZ8vOnE+8V709lquAaa69oUzjDxtqqQLkzlKNjBwk7WIt
         4sPw==
X-Forwarded-Encrypted: i=1; AHgh+RozKu4ZSOKfP0R42EG0lSKDdxz4SF8pt2Qtw85PwLqxHbKFE8CEKsE00TsWtgVXfFwhmYoV56pYGR8p/Wqa@vger.kernel.org
X-Gm-Message-State: AFuF++mK1a7uDxxQcW0pHk0wmQ4TQcQ2Ee101BuUWfbt4umYkXAxfjPP
	Of3C5oL7eUwp/mmI8w2v/UA4nG012ZgAFluSOayZM+chw5wRUvXsGRB7ifgEjrPN6ZCPNGC2yRJ
	yRRreTj7LbCppcwi0ZGEjpQC6LkFC+aXZPuXlGRnL6uKPMCzfa6liEJwzT2wVh3LgvP7E
X-Gm-Gg: AR+sD10p+DfTKfTYQtPjpRMa+M4dwTMs1299OEbAKpbCvfSM6VxPVIKpjzWpX2s5adq
	TcVl6agWS9NkOibIPaxHMVvhWpZm+lmppxfO7qOUoBfhiPCjWAJvlMg7Fy1q85TO+cEBX00djq0
	xZnILDKt1PRq5ctS9hSrFVX7Cdo+3G938hmgxuATm3/Wy2p0p6wyjEA2lnQX4/WKvNCExQ3fDIR
	3+7xPYNX1BIXZIBepwcQpN4zqCTNzSfaSwLyTZ6xShffN1sv0szLTN4TLE5xFqPN+7U1Sxwy2Vf
	Xs2Wcj3zZNuUHo+irft2RkWjscJE8W4Moo81RWeDHe9QJuAFCORJnSc+JsvhZxEI5XP7uIbBNle
	tZzSR6pyhx7Q0eA0dZp/F81CheM6x
X-Received: by 2002:a17:90b:384d:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-395c37130eamr10641004a91.11.1787321090593;
        Fri, 21 Aug 2026 07:04:50 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:38e:7f1b:efa with SMTP id 98e67ed59e1d1-395c37130eamr10640910a91.11.1787321090030;
        Fri, 21 Aug 2026 07:04:50 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395c45530absm3331680a91.4.2026.08.21.07.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 07:04:49 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 19:34:33 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: shikra: Wire up usb-role-switch
 for USB Type-C ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-shikra-usb-dt-v7-apply-v2-3-628885fc1d0e@oss.qualcomm.com>
References: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
In-Reply-To: <20260821-shikra-usb-dt-v7-apply-v2-0-628885fc1d0e@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Akash Kumar <akash.kumar@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=BcroFLt2 c=1 sm=1 tr=0 ts=6a885b03 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=OKfUiDEiIDe3Zo9lHMoA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: aAj5eCkTipXaMlwN49pkAUUPo1C-UVAY
X-Proofpoint-ORIG-GUID: aAj5eCkTipXaMlwN49pkAUUPo1C-UVAY
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfX/kMpjeqH/KO9
 DsYBUwKeyZcOF1+bitxOxjeb34Jeb0K7vxR/X+Oj/yRq1zOkvKwQCbrh/w0doFAfq1OlLOm6xMp
 rk4hoVdfJlU+nGb8u8VE9E7lUZTE88I=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEwOCBTYWx0ZWRfX/HrmlZFnu4pT
 YOmD0p8kl+CRAOaUWMgw2AXnoHlsRpLppWfV3ByshI2fxBkWr4/+uc4Q8pfhThFOaKz2gjf+yl4
 7SVc9U3ezJFNZeSCtzf5DcVMlU8nVKZuc+UXDd6x4PhKSuWt0WM9QHxWRFKw8IQoWUfDeoG81WG
 z64rJ9NpkONa6OwC0ZiYAAbz8qQ/Tw0mxG2ZDg4YYdw/4GlLlWyXNhNQ1no2eph7SJ2U5Zrvxp0
 Vrmrlt0zkxXUaYHMokFHqr1yBsQevYstSLWAynd6UjKDMmZtuoesWxjlxw1Ph9bNd2nveZBeo7L
 fXl/1gYyHqibkNot86UgV7DbAAerMhp1BNwO6b/oexjlauggvcVs1acAKV4kBpxmouo7ltXyibj
 0odx/Q5gqy0F5HSzB1n/XsGOjWf5s4MlrN/5xaBLf+Erfukslc0X/7SIGTNXOaBUf9jRDba23ef
 9aD8T6CSxSdA2H1QEVg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_04,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210108

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

