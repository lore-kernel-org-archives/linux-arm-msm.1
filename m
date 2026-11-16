Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830800;
	b=yGr+0msII32tG/Jd7XVctqI2eYwf+oTkdMEI57K1BdUOzjd2K1Jz/c25aUm82SMSIg1w
	 7rGd7ua/DXQPtzUB5H+Lb6DfPNbuOUT68HnGl+C9P4OFKeY44d1xvPT0Y/4gsyWS+9EVb
	 46+/4SuLjR0jpsub9CMNOuF7MG9DxYpyZJnDsARg7Ik8M1ZHMJtYpQrie2SIQk6vhT5vS
	 nSLzof3iHBWDDQCoObrkvrRVnIn/S2PCmH4spzBCqO92OGOzYo8D5tofe0+mT0wmxr+4k
	 MlZO1tXTuqMcZ1C4RCmc0IxwJoLp1orDaj/mJ5CW37PqnqyOZoX/B0zRLUb3+X081og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830800;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
	b=z5tVrUrc2cf/nTOHv5jQKF6Q/dBtYh/VN9/S5OugrnICXn3xgarRvMtEboYjoEAnbFTC
	 Vfw0Zv8537Q3ehAile9D70XW7w/0WgooC2IDgg1VsYgIn9DDkobGbcghEdhTijfI8gG9L
	 w1P8qfPQmE6r7gDrGN2lg4yfmr41/icLNA86TFhHnsGiWSjWlgV/ElUVtKEsO3Kv/bGbE
	 6TMWp74uJkBK2kthQKZ+6oTkJxlH8xAjrVscLudeBNdD4EIUiwL81nzIR2KRF8Y5lVY1s
	 lNLMvwES2H8v+tI3C90mk4aPwfWHp9BbgNOCvt+EH5fiuSykaLRB8Zx+tke24QA6MkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DEbobxGC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gqOF2EXL;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA01B606A333
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA01B606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DEbobxGC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gqOF2EXL
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AGC109e536333
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:06:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ibqxhW40RmB
	jwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=; b=DEbobxGCOkZPluIAsqaon59Dm76
	pWtR7jWWe4usdOdXYgMda3SHHSMYKfff76hvjWq/vT0Tzv7PfA85dfi02SmFyaF8
	zjvlwXdEWRC8tzUTbYRxTJeII8yL5OdtOZPs2dFPXVndnnyQSzj7nkNjiFpZW90d
	UAwtM5vBr1WgqPgHRax4CQfgTIL/nsUhfVRGdJBICKjtzwLXhmINZEouPSa5ctUl
	JGL+xT1CxFko0rlOYAb1zeKz/oIta1yi2gnSxxk5Bii6tSgaw2GvLigXVCN0kSM3
	tYk+HcuW+hvOx0FF2oTDQo4tn4J2EalqZVJ2SafZ7gSZwM91JHTlO5Los2g==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hyyqgge59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 12:06:38 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b25d977b91so213008c88.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Nov 2026 04:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794830798; x=1795435598; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=gqOF2EXLeivKZ9KInLuWojugS6GDiAtMWcuibs8xc2YEwCkQtrwDVlq2qdazjgVfM6
         rbiLOC9Zq26upobVz9JoAhIkHwWIgx7wFWQJdzdjoT5NrQeGCH5A7GQJGrAtW6dWFlxZ
         B448pdU7iTtPqjk4b4uT+MDdO/ESYmp9k693tBlMfY3MUHrQfyAnIT7ef5yRHsXOUKY5
         zjcyF7tcjtMCHidgiAm1hYpV4OKm+cGIOJ/W0KF71fDqqhMwD6gLMJ5+g5Uiatl5uuUv
         r1tEwzZCLYX6UZLjo8mWWq2OVJAxThq5ovJnJBTTatdwbbpgbcOXxDYYQH1mVxsTu19A
         F6wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830798; x=1795435598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibqxhW40RmBjwpc8i50dBPwS/b2wJRBsVzM6V99AbQ8=;
        b=AU2FeueAXZn0R0dfaKgGqkehOM4PTXuD2bOQEo4HbhNvijOZUTL5H6qZg8NDBDlUtc
         aNzEwKcQjxVYIGR7Nd1MSw2puGg4vUCMxyzQPVUCpCUuh/lxvxjmba06fIRNk5HJHgsL
         lc98gJpYMUW6aspIpsUHti0uuCR2vfWLWvBEba6zGBkRfJyO9FJMu3oCyz10iIOpIeT9
         JpBwr4bW55kdr9NV7jHIA2OePJXc6B3m7VDvH73E/Osyje/vbohplQR7l3QkPHvWscRJ
         6YNb7YTJ5WvtvdOsd6orY/FfMiojApbD8vnTtIwmLMrLObf28yhoxhAMNjvFjCj+T5TV
         0+WQ==
X-Forwarded-Encrypted: i=1; AL+hErG7HVoI/YaQTZwLOtYDfCq8JYQKeNXGJEHn+FB56MiuwRAPAUs0ZN2xoRVDRQcAzvWh54NdKRECnlLbFTgV@vger.kernel.org
X-Gm-Message-State: APuU4Z/5S8beSoota5aSfDb3P+uFcnvWkKIpmp95QKvzSb++gbZnxxhv
	9gcoAfWSjtDUmyi5ayFil5CeeDcq0v6lf2yJv/k/0sgv/QFHhqMRJtuLr8gxeLum35i+CSDtjx/
	25zBGvq1m7ki+BkkyBEKWLEHvjmeZp4L9ho+34QgFM2IXEAB/4Ec2OyGb5nhw72yAndg9
X-Gm-Gg: AYBFou2RsdMxJ9g2bJMyPwGdmjdpYA+dbajDltWTDAdHSSaso8npxfCLjpoqFEUwsk4
	uS4/WGL5bcQpnuCfuvE/FfUf2AMB9X3NnLmD6HSZ6yurLWztCCiebkzdwCO07XoVhI34oEd4TLc
	Ipvz5hy6zq9HNbTVzBoutP1FFVdzWf80PANUkLB59m5I7whgcQbMmTrKzwfaVY7M3GU3vZAU3pY
	tR4KWH+I/Nbsg9QtC6SZJ4aEQSSsi3yKVMNz9LdVkPBphjDIa5zZd/WKgoH96y8LxJgIGeJt843
	3T4oaXypmwbyKopievD9YOSyE7SAQSn+MPymak7zYmdjLy2dnzH3dCLZ+Xe7bbxQDk+wxUFvrzN
	ODTi/1BMn9w0N5VBxw4cnQU6EPG7H7hJ8YErMxDpwxFII4LhwvorRVSFfrIPMMPtiR+UP6poY7I
	cdOA==
X-Received: by 2002:a05:7022:3c81:b0:187:c940:21b9 with SMTP id a92af1059eb24-1b5031217d2mr8629518c88.30.1794830798226;
        Mon, 16 Nov 2026 04:06:38 -0800 (PST)
X-Received: by 2002:a05:7022:3c81:b0:187:c940:21b9 with SMTP id a92af1059eb24-1b5031217d2mr8629483c88.30.1794830797574;
        Mon, 16 Nov 2026 04:06:37 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031468b7sm36961530c88.5.2026.11.16.04.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:06:37 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Mon, 16 Nov 2026 17:36:23 +0530
Message-ID: <20261116120623.1726089-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
References: <20261116120623.1726089-1-akash.kumar@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX5t6X363Yd9Jn
 t6GI1cgkpDTMxqmp6UdiI7HXkFMB2yit5nM5m+BYCKdUSALqN1fFWtJ3FUqB8+AvNdr34BI/xOJ
 aL6lmEkja/jGQ76z0h2DeRKm8stVV4o=
X-Authority-Analysis: v=2.4 cv=epRKXYpX c=1 sm=1 tr=0 ts=6afaf1cf cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1-dFLm9VQVe0kl0r4fgA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: xYj7XxeOHq4mqwCxNcDFfiCVqsDqforI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE2MDA0OCBTYWx0ZWRfX95CeFg0kxy5z
 piKflDzctZU0nx3svsqNFNX8pS6c8JJWBKlYcP9Ug/AUV7XxZQ61Kg6GmBled3SjxuzR7mTOmMr
 2M8j5Np30b+NeW2jaRliKQZnrRjVdU1Y8BIKmXUaon+pDWtrQAFtaJwH4aEMmYLZimcu0QTd5HY
 5YgTwX7rGNtHGPyTDmDAupXy+73DiTzm/9hbNhi0HSjR3p0xtQFYvHtpBM2hiMG5FL5vSb+yCmA
 2FJnqGvwQzBbimar6z2T71xy4Zx/uV5rQ0XOuX7IbEU1sbSLDIwgfGNpUWpZLf84wl27m4tJnWw
 ZKKWuc8sLDYDk3tkWyRF1O1P7fW/sN7XejVOWOUIiFp5wCtfeeTTYYbWRwP6Nil+YBGEV4l0M/d
 nt24U0LqtzN4Sq85JMGJs/S6kpBPpF+VHiBWeh0h3Q8aG35gtL98bFMNR16ofyKk+Ui1Vn++fqZ
 wLLWnca3YeyJaDfFReA==
X-Proofpoint-GUID: xYj7XxeOHq4mqwCxNcDFfiCVqsDqforI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-16_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611160048

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

