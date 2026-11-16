Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794829766;
	b=tDa/71k78XS+5mXM2NuS4rL0Zg8T2Z6zQWNa5XpTdyPn1cYGWgv/L9WVAYqsHFJxeL28
	 ENg3XAi39SUzo7QEPapMpsrTA25FZhEeufHLwSkzbzpHEraSOVTTGnt657HFTGflBTNEq
	 cVZJkTkL5UBDmTmfZJaI0LyvTQJO/WMZrcQMUaVex8GLha3eYdA4gSK2yyycCappcSWEb
	 +V+GAEqaHDJYAu4aXvFKAEiZHEGkw73t6tngtepHTSA/6v2ClR2gVt3B217OtUbpFaLt8
	 hoHFpHfJ0giJimQiHSiQPsZRVA9PuE2l57nRKR2AKJAGjBSdhIdqjpJ/AqiDG4kF+vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794829766;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
	b=Cfk4IUdglUFGkMOYaatYRNZH/lBq97n6BE8D94Pu2jsVZyxZlQtGKejWddK5W8ZbNmDJ
	 uhn4bzFH28cxM1PBtB7Q2INp7Nf7Z1PctIdyuwW4zv6coMPhPlgsPHND8Azm4rhfPZt4M
	 s6v8QBuBrtd70HoqZVDagITTqVKeEAUqTR2Qt6SWjJhRZ1Xw009LPMlXFMEB4cuOqpUQI
	 YSXuiKnWMQpZiDzp/fS2mXTcwPtsSWjbqdmmswwNOsbumZoIa/87yLDllhEkQus41DAIA
	 nC0nhw5ge8JaS3lLLvFXGM8/Nlkp2RWJKckeaJM4ncNwXvvB4XmPbDVeU5/aH9fU1dw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jFaLEiLM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReeRdIxW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5923A606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5923A606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jFaLEiLM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ReeRdIxW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGBLj7v1129693
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ibqxhW40RmB
	jwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=; b=jFaLEiLMC8vWMriw71pNEsMdwI6
	cYqSJLISN+Y0TLPvXJ7vQElyBXrGyBX34tyHaEb8J3GPnTD3WmX+j5byxT9thTMP
	KV/K4T7RW/YNL1gAIwRTEKPNmiT5GCMvLZtFInoqjRFWc8JuXx4VxnY/hcsfCeTU
	d/ZxtYpwjc4VjBx3uDBvZWgvps+f9DRJIT+WUzZjtEIagsEQKE+0TMTIrxELYT3b
	X+z28Y0EpbOJpjjWkYZtb/Z+xKDO4vYGal4FtH0w+sWPL6vHOrwc8r1G9XeHrBok
	khpIjW7xTZGdcRGcIz07n8aNW/vjBagdD1Kg2Tvd9N75UD51cAOuTK63xLA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqy8bve-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 11:49:24 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36ecd5db581so3609693eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 03:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794829763; x=1795434563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=ReeRdIxWWwvADvkNtdIOLMoL3SIwzEga0Kzxl7+C5Svl5RN2+LRuZR/m4bLek5zYQs
         snMMtpz2XWRbxQ3nxFemg6qhZQIfZ3t/+txX8wLsWkasXYUHID7+C0lBL+cOYh8xXrx7
         skIPVqO34V+KR2CE6sBx357LYfUj0ojNjDYThIzAOBXF3jQQP4Q8LWAIMAkK+GCfxEAK
         43hiQxPnlqnhuE38KJKofFdu5FXmpuB3A7evn6+tZbte9CL8ONfOYqbtW7UGBl8jZPSK
         vRVq0G5fCc3fpNF7YxnPYZJoHan8yXzYHKosAnvq/YHEGVLTA/jP/cErfMdhGdi5owlN
         bVaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794829763; x=1795434563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=DbUQvdzPzWrNaktgw5EW3nuvay6xm02K8By7eVm8UgHabezxuUqCU9M4Ruwa8gn35d
         R3JTEZHpk7JowSYulsVMLKTNA//jsy7uGc5OVSdkoqk5G4NxWM2HWpbCCRaAYa5HZwSx
         wdqWl8lzXfe7T5oC1mC8SlP4dTjEStETN3iZJiHGsNCSmf7/AYGtDa7DmXGVmDIgSxms
         hvGPZENyLgypqDBh2poJNIZi2SB01s32ILCWqTtTVKSzKlzVR9PdxvqJ9PzUi7h9Rsse
         R3aWsOZd+OyvdyC1aphuKopO1mWkvjtTvB+eQfrAD+AxDAZVeL89dHrCXMJSEkKqnEXL
         Lqnw==
X-Forwarded-Encrypted: i=1; AL+hErErduBrsPC/GX9veOpSiu3PucLOXfJfGHRwPfyoE0xttnCDGqDsRa0olZb9TsGGD07cgCq1LJNhJ4REI++J@vger.kernel.org
X-Gm-Message-State: APuU4Z+rzPgVOn506nDY0YK9GFkXmNYoDmgEfNLkE5Pfx2mlA5zMntW+
	tqTEgOUcIZcsO8L8yeP+w0ORDNMbcCrzFZlnxJubvbeXFuT4aF7L9mrIb/2hBnjHZ8bXvLnvfKQ
	WdDiVzho6WRDNUTINCT6evDOdhUmTXhAH+Bg1m0R4dJ1+DlJelWgBW6X5dbaG0FAn7xD/
X-Gm-Gg: AZFdTZefoMgo9D1daBxjhfWfnx/fiA4uIh9NHz1QX9M5bSz4WyohZmBjo8CPzlPqGOl
	E6y3LcOtPVf5lOFcs0VYwXJ9YVZ4a3uiT6Y+Ot4qmVpkfhnggiKUWeCq4kAPasEaAfO2pTOEzXy
	jYzAT88NDroIAUQ/rsyZQTjdpyBH9CjSgF/K06HMpLXs/d7tppFMex04RObwhrTK34l/OpCRl2m
	OweplPDaDeAC08S2dw2iqWvQ1Chv397zRZvP9Sf+V5vcUSaTwqBZ66IKCDpMcePmk6DKXtrRzu9
	1ZFBa2dWtGMzQpZw4dMg/gWUaKzaK2uVlzI10vYZAtfWWTpSmq7OqhIY3q/8kS7omxNnglvZOqt
	WUoGkFGu5uyJ6iqzbn0cpv7fqWBgD8HMtBRAPkGA0UnLZVhN+wIFZwjgCYJzp85oOqNHghj0dCr
	Sz
X-Received: by 2002:a05:693c:2804:b0:37b:7bba:8199 with SMTP id 5a478bee46e88-37b7bba83dbmr5244734eec.6.1794829763153;
        Mon, 16 Nov 2026 03:49:23 -0800 (PST)
X-Received: by 2002:a05:693c:2804:b0:37b:7bba:8199 with SMTP id 5a478bee46e88-37b7bba83dbmr5244704eec.6.1794829762580;
        Mon, 16 Nov 2026 03:49:22 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm33802844eec.10.2026.11.16.03.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 03:49:22 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:16:41 +0530
Message-ID: <20261116114908.1701258-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
References: <20261116114908.1701258-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfXynMWwOck4cC2
 NKdrHhVCbzVnjui5AIvY6qnuD/e/fyjew1c+8e979hrNX5pVJA3BPrNlNI1LDFkel7hBRle63M2
 byEu+vsJGkHFd5jY9VqDCvfCuhcYrEU=
X-Proofpoint-GUID: NdjPI7FDRj0IQipHyNxmMz2CIBoDPKME
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0NiBTYWx0ZWRfXwXJz6/P7B8g+
 O0qgCfboF4zOrP26cs0B8TIsOvHIILJngxN2tpkbQI89L9y9ClasBCm/aZovZ3zpHpBEbRYEJbr
 V+QHWaB/f/JejhFD4VHngcRVFvgYSMnDViDfU9vO332ayvYQ/NtxfkwHRKgcP5Wc2d9A9+ZaYXq
 M1+K4o6+SD5nlUXKuNlxDbw3T52KF2wHmAYA/Upkk2SqZPi/Tbc4jKP7k/LImlnNYIVFGDEWved
 IFgIvcVDNTTs1t8M7tVVfIMx8vu5YmwwdS9UUSKDd7y5KWj2MrXXyZ4Y2253VBi0EhEQeoeeG87
 h1n2+atV43RPzCwPO21sqvbQaftD2FV5gZuvgBBfLmQhzpM8eR4tGBUTlB02CuVlilhhSb0uGIK
 NWyHMf++pkMZaOcEpHci+nJUeWsqNcv3c79rbpMp6s0l6tXi4znl8qbM5pzfLJaZqsBK77Oaref
 DQfnfyWncmLMpPuPeRA==
X-Proofpoint-ORIG-GUID: NdjPI7FDRj0IQipHyNxmMz2CIBoDPKME
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6afaedc4 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=1-dFLm9VQVe0kl0r4fgA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160046

From: Akash Kumar <akakum@qti.qualcomm.com>

Add the CYPD6129 UCSI PD controller (typec@40) on i2c5 with its two
USB-C connectors, and route their HS/SS endpoints to usb_1/usb_2's
dwc3 controllers and the USB QMP PHY. The PD controller, its GPIO86
interrupt line, and the PM8150 GPIO10 VBUS-enable control are on the
SoC/SoM card, so they are added to talos-lyra-evk-som.dtsi.

connector@1 additionally routes its SBU lines through a GPIO-controlled
SBU mux (onnn,fsusb43l10x) selected by expander0, since connector@1's
physical Type-C port carries SuperSpeed and SBU while connector@0's
port is USB-HS-only by hardware design. The SBU mux and its GPIO
expanders live on the carrier board, so they are added to
talos-lyra-evk.dts along with the TLMM GPIO64 VBUS boost enable fixed
regulator that supplies the USB daughter-card connector's VBUS.

Switch usb_1/usb_2 to dr_mode = "otg" with usb-role-switch so role
switching is driven by the PD controller, and add the supporting
USB1_VBUS regulator and pinctrl entries needed by this routing.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     | 121 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   |  42 ++++--
 2 files changed, 152 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index 7d9a08471906..ed3a369dac02 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
@@ -31,6 +31,16 @@ xo_board_clk: xo-board-clk {
 			#clock-cells = <0>;
 		};
 	};
+
+	regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB1_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb1_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -179,6 +189,87 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs615/a612_zap.mbn";
 };
 
+&i2c5 {
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 86 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		connector@0 {
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
+					ucsi_ccg_port_0_hs: endpoint {
+						remote-endpoint = <&usb_2_dwc3_hs>;
+					};
+				};
+			};
+		};
+
+		connector@1 {
+			compatible = "usb-c-connector";
+			reg = <1>;
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
+					ucsi_ccg_port_1_hs: endpoint {
+						remote-endpoint = <&usb_1_dwc3_hs>;
+					};
+				};
+
+				port@1 {
+					reg = <1>;
+
+					ccg_typec_con1_ss: endpoint {
+						remote-endpoint = <&usb_qmpphy_out>;
+					};
+				};
+
+				port@2 {
+					reg = <2>;
+
+					ccg_typec_con1_sbu: endpoint {
+						remote-endpoint = <&sbu_mux_in>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&pm8150_gpios {
+	usb1_en: usb1-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -229,6 +320,15 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio86";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
@@ -250,6 +350,14 @@ &ufs_mem_phy {
 	status = "okay";
 };
 
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
@@ -258,6 +366,15 @@ &usb_1_hsphy {
 	status = "okay";
 };
 
+&usb_2 {
+	status = "okay";
+};
+
+/* HS only */
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_0_hs>;
+};
+
 &usb_2_hsphy {
 	vdd-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l12a>;
@@ -279,3 +396,7 @@ &usb_qmpphy_2 {
 
 	status = "okay";
 };
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ccg_typec_con1_ss>;
+};
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..020ce7db4241 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -22,6 +23,30 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	regulator-vbus-boost-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_vbus_boost_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vbus_boost_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sbu-mux {
+		compatible = "onnn,fsusb43l10x", "gpio-sbu-mux";
+		select-gpios = <&expander0 12 GPIO_ACTIVE_LOW>;
+		orientation-switch;
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&ccg_typec_con1_sbu>;
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -100,16 +125,11 @@ dp_hot_plug_det: dp-hot-plug-det-state {
 		function = "dp_hot";
 		bias-disable;
 	};
-};
 
-&usb_1 {
-	dr_mode = "peripheral";
-
-	status = "okay";
-};
-
-&usb_2 {
-	dr_mode = "host";
-
-	status = "okay";
+	vbus_boost_en: vbus-boost-en-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
-- 
2.43.0

