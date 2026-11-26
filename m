Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695115;
	b=14h2UePOnl2SToXFpJX7TQE9QGn005p3nwrbcF02mce9fwCXKHcAJzlGgfSiAxxvJR9l
	 UGFxyyyMQSOrzjCr8kiQVSPSIQ0YSvywG47ruXzRVkGfwJxiZtyRROpchxUeAqhM/ufjV
	 dteq9w9e1qsfFFojQrmsAUWIyzyK6509x0gBb6STOpHmc9IImRc3wTzlg3qOF+LdZX+6J
	 2zuZSk5vJwhk+QPSsq+tjsOq90Bbj4+LJjrGxFtudjkgMPEewcJ1/SKi4KHlP2YHfZFHD
	 HnlEDJY7uoD+MFDE1yeee8cPom3Q9Ug7iQ9ZLW/5z6uPbCsXeKXRQp65SLliXAjb1vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695115;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0ZGbNTlnuESZhYgot/UdfNh+dFpS9FLgU6tMHPcOxq8=;
	b=XsdidxIdaOLh+XO0Wn5i2s1oef+FVzq5McqK8iMf1e418AQdFPVKQIYfcUf8XIzzQ3oA
	 aEanYOxDAFKwm1ZNQO32BN29WuprauePvbtYPCSDCLw5qxcNpfHfUVFNHxlLmqwl4+koV
	 LNLvxyeqCQpRgCiiqZv/HiRpnmk9eI4zFqL/tK+rG+71tkfoyJBLtLjDOYvKyZIXfvhqD
	 NqpR9/wKy4XGQ+59/pOhxhXIIBve9i/ngF+nlfMCBP9ptuDBmiIgBk5+6+66O5YuRMvf+
	 6YpYO2pjRexI9BkkKriFiutQIkAI8ugaexzqxT64m0efKeer0e8kAHUFM0ZGeqJIGkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TVnwCm3B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqaldHDg;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77C4606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B77C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TVnwCm3B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqaldHDg
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQBVO9L3177375
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0ZGbNTlnuESZhYgot/UdfNh+dFpS9FLgU6tMHPcOxq8=; b=TVnwCm3BFhST469q
	W3Q6ybS7ehK5CMZ1UQUCWNkbr5efhFUJcEBbH99aCRPKmgBLHMxQrHzBnCOQal6M
	cER09U1khLDmWMXOROkL8xguz30ugpeyYy3cDOiKwVe53xN18lxE3z6w9s3/rEcS
	eahNbd5w7BS4XN//mDixTtX4qiJDLTFrEKfiJBlSfHsK/GW5Kt5sZ8HQ1e0Iu7YD
	8AX9QjhDGgqG4KgsuGmoHXzwkhP/9zAR3JZe2HyZTEKCSxCwGJIGlJSGA3/JG1y4
	uua0yi2795S1JBaj/oHlk0YNk0QSyisykhBJAJXoTmF2lvBj3dQQa8IEoPRff7K4
	6G5hWA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662sb291-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 12:11:54 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso8704955eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 04:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795695113; x=1796299913; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0ZGbNTlnuESZhYgot/UdfNh+dFpS9FLgU6tMHPcOxq8=;
        b=RqaldHDgYBRSEXoYsnYtqNVnsBtOQyzm0eGiYEcCZO3vzVtJCjdHrtvq480ECl1rux
         xop5FL4RwrZch25G6RaFFHXr1MdCp/NAbUDOH/Gu/IS1DWZRw3jBFpmKP285CnFDMvJs
         OPTSICMdjsllaJsPn+7UqqJo89JWASxWx2kxHxFlGlCSx9QMnK8O5JSK8ShSnGpBcTiD
         N1/1Wfzs3NTFVaXV9jNQbr1V9y1lIG0BxN3iaoICu35wT3nsRPjN5oBsAfYQulr2M1zF
         JlclStqQZSZ7viTgJC0EIfOLZ3Jtuk5iQrX4KogmujLJ7p8Ls6tD9b5B6PSlYF8wuL7f
         56nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795695113; x=1796299913;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0ZGbNTlnuESZhYgot/UdfNh+dFpS9FLgU6tMHPcOxq8=;
        b=ApYNZw4A2fHmf1eMecp2XKOz5CLYShCLDTAlCA7F/q4O8UodIxJDBVvkdOjwvcxtjG
         hl722a7Lb2W0zeDYHRi9F2fxNzZsvo6EgpOjQSRpRSDfqyd1AlR5mu3F8SM4YF+QLmyU
         0k0/2wkhK8ZYCRiPvwVA7gbajjceKcZrab/vX7CRTVTD3yJ4sCb3+pKdhDjC0vwTAvzQ
         O0JsLk83SYH8t7Dg419eZ5UWu9Zc6MV+tSOO4205PF0uM5cUoyRfy3rPIJzWYwGzsszM
         dmEwTWTCUldq1Ebe+G1qQeokI0mlDM82aC+5ZwPYX+v0LYMIupTfM46ekNU/wnPpsGTu
         8U2A==
X-Forwarded-Encrypted: i=1; AL+hErHyJTiz07bMVYUVPaBDcFV4lz0NlvLoTHTe5Rags7xXU9qB9HmqNj0LU4Qi9MumvlcNKygniUorAqfLdifK@vger.kernel.org
X-Gm-Message-State: APuU4Z/+Z2l/SffV4QymSwivBnKqhlmsMKW1OYbKImNmejF2Wt5K56G/
	kqhlIU74Ki1Kdl1R+dWuL0aOHA4rnNn2ex+Jy0+4ZE17td3x/UgD/x50v2yrn0fH4jeFkaU51mT
	XkjZsRKwtfSg9dN6eRiFg7d6ndGvG3MaPGubXv6DiksqS+hEpOrI0cbirBNJGhg8fecnM
X-Gm-Gg: AZFdTZc0sUh4+cmCCTDQotsWl0dfD7X7sQAExsv2ok7irL5Tkg7gFiix+Ey99jSdxoi
	hnZAiNvY9FNxkflE6+V93IQKHVv6DC23z5m+cTndip9T/7dKn76lsEOgf0G8fLa1qi6xLIjByRb
	nLtF/i5EUCCHkQCcgLCTP0T6ZaE9EnjpgprTM6HrTlP2pX6bnVFKU0o9N2RLi+aHng1d+JHZzIA
	kvyty6gIEEHbmpTGTMBjtbBfqPhV9z7/rEk611EjGyxYuMCe4HMGgFW8Zl46UfDIqV2vS7jeqVe
	fe/+69Sc3QmMvrmQ2JwXdMHfzMGdKAXRsdV62c7lmMQo9g2o6tX6y74uiTH6aDXtq8T+tk1bjhQ
	8UDC5noGgB3Qc5y4q93igypzHh+dMBSm2A/eRw+EyfzDS6+pifNtKFY7kgJYTVsadmIjakwtPBd
	nXUw==
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr20747691eec.20.1795695113247;
        Thu, 26 Nov 2026 04:11:53 -0800 (PST)
X-Received: by 2002:a05:7301:c089:b0:372:14fb:2573 with SMTP id 5a478bee46e88-3856fd5bf76mr20747674eec.20.1795695112716;
        Thu, 26 Nov 2026 04:11:52 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm58457549eec.13.2026.11.26.04.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:11:52 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 2/2] arm64: dts: qcom: talos-lyra-evk: Wire up CYPD6129 USB Type-C ports
Date: Thu, 26 Nov 2026 17:41:40 +0530
Message-ID: <20261126121140.1716190-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261126121140.1716190-1-akash.kumar@oss.qualcomm.com>
References: <20261126121140.1716190-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=B54sQ+tM c=1 sm=1 tr=0 ts=6b08220a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=fMFum6Eq_5t3XPXbPEkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: 3qDE4Oz_EqbCZ6SQxQIs9dQfF3BW8xsQ
X-Proofpoint-ORIG-GUID: 3qDE4Oz_EqbCZ6SQxQIs9dQfF3BW8xsQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX0QhAKl+TKX/p
 /JH19q6DmcbgJMbzcSc+dKTo2UdYEDGMsYPbtN69TTbQbsRSlBQiZ2knMWplxJO+3IKWJ6umqQG
 Cc2YW2pH9sXf08MLHAyfpldh3vNYB6Ebe3H2RBE2rNOMgT4jtdMj2xQLW+3ANByanZ0m8UlT5tl
 ZaUB8Bz7zJAHKpLhMSlQvqRkvnwweXqX9xj3BJ+Zay8U04WLS1VeLId3TQ7W4cg8P7gNPuPV8xd
 2+I68DZYlbiKP8Kne3neeYh26a0NKxl7Yl2SOMnOQPaiOzmKgdR5MuInFeF0fzd8ngYlsmX+mfo
 einBCOQwdd6mrx5W7+bbT55C0iLrPwDS/9uA/VIsFa2YpG4ixaOEVZ1w6u/ZiZKzYOzNQMSC8xn
 V2hi742Hg8LYOc0M1PR5bYLbPfLTTldFQmUyRx1OTlxd0S1vuAhp4MV5Qw2lBJPe6mtKnhVUaqj
 Q3b9mKn90dmEum+lhAw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0NyBTYWx0ZWRfX+zdL5V51e7QG
 C55+ZodCRS8wFjqKheeV/2YuiYuh5p24MakmjEBpJyXqUvHATkw9YTn4EDHrYtcPOHriUCFnBnI
 EVBMc8uuIEBfb4Xv5A4ODdvn4dJ0P2Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 malwarescore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260047

Add the CYPD6129 UCSI PD controller (typec@40) on i2c5, along with its
GPIO86 interrupt line and the PM8150 GPIO10 VBUS-enable control. The PD
controller chip is part of the SoC/SoM card, so it is added to
talos-lyra-evk-som.dtsi.

The two USB-C connectors themselves, and the endpoint wiring that
routes them to usb_1/usb_2's dwc3 controllers and the USB QMP PHY, are
carrier-board-specific — a different carrier board could wire the same
SoM differently — so connector@0/connector@1 and the related
usb_1/usb_1_dwc3_hs/usb_2/usb_2_dwc3_hs/usb_qmpphy_out endpoints are
added to talos-lyra-evk.dts, extending the som.dtsi's typec@40 node by
path.

connector@1 additionally routes its SBU lines through a GPIO-controlled
SBU mux (onnn,fsusb43l10x), since connector@1's physical Type-C port
carries SuperSpeed and SBU while connector@0's port is USB-HS-only by
hardware design. The SBU mux lives on the carrier board, so it is added
to talos-lyra-evk.dts along with the TLMM GPIO64 VBUS boost enable
fixed regulator that supplies the USB daughter-card connector's VBUS.

Add orientation-gpios to the typec@40 node so CC orientation can be
read for both connectors: connector@0 is USB-HS-only, so it gets the
<0> placeholder, while connector@1 reports orientation via TLMM
GPIO104. GPIO104 was already used for the carrier board's DP
hot-plug-detect pin, so move dp_hot_plug_det to GPIO80 to free it up.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 .../boot/dts/qcom/talos-lyra-evk-som.dtsi     |  41 +++++++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts   | 109 +++++++++++++++++-
 2 files changed, 145 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi b/arch/arm64/boot/dts/qcom/talos-lyra-evk-som.dtsi
index 94bf2e73889a..c4a8a79a82a2 100644
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
@@ -195,6 +205,28 @@ nvmem-layout {
 			#size-cells = <1>;
 		};
 	};
+
+	typec@40 {
+		compatible = "cypress,cypd6129";
+		reg = <0x40>;
+		interrupts-extended = <&tlmm 86 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-0 = <&usb0_intr_state>;
+		pinctrl-names = "default";
+		orientation-gpios = <0>, <&tlmm 104 GPIO_ACTIVE_HIGH>;
+		wakeup-source;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
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
 };
 
 &qspi {
@@ -259,6 +291,15 @@ &sdhc_2 {
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
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index bd9980b9259b..572b1e8c9a8a 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -22,6 +23,28 @@ dp0_connector_in: endpoint {
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
+
+		port {
+			sbu_mux_in: endpoint {
+				remote-endpoint = <&ccg_typec_con1_sbu>;
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -52,6 +75,66 @@ expander3: gpio@3c {
 		#gpio-cells = <2>;
 		gpio-controller;
 	};
+
+	typec@40 {
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
 };
 
 &mdss {
@@ -92,20 +175,36 @@ tpm@0 {
 
 &tlmm {
 	dp_hot_plug_det: dp-hot-plug-det-state {
-		pins = "gpio104";
+		pins = "gpio80";
 		function = "dp_hot";
 		bias-disable;
 	};
+
+	vbus_boost_en: vbus-boost-en-state {
+		pins = "gpio64";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
 };
 
 &usb_1 {
-	dr_mode = "peripheral";
-
 	status = "okay";
 };
 
-&usb_2 {
-	dr_mode = "host";
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_1_hs>;
+};
 
+&usb_2 {
 	status = "okay";
 };
+
+/* HS only */
+&usb_2_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port_0_hs>;
+};
+
+&usb_qmpphy_out {
+	remote-endpoint = <&ccg_typec_con1_ss>;
+};
-- 
2.43.0

