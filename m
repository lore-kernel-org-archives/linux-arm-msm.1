Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353222;
	b=1b0Euxkvkme9W3v0FkpKIUUnNh3B/n734lAuqeJE30B0KQIeo3hY2qMVj6Nn528J34bo
	 YuX+ZzQ/0GyEw+abYeesofIw6k0R9DFCwhxtKR3nLzJC6FX5KnXVJMM5plroVBU1ynY8y
	 9VFDE1Owe90+FhTGZQKVoRGO1P5t4NipPWTdH9oZ7yaXLc+Eryri+FaH1IWkQQiYcAdv6
	 PD5KEvE1+o3vrI5wQSr2W7pppLDRcyHVLxXBx1zPJRVkhdqvszSkzqeA6pX+mMjEY+h8d
	 NKU8PkFgfkoSyHqtkdZvxEL+u9IuWrZzm6PNfav/NxUu0FezazG9dZfz1l5Gl5PNGLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353222;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
	b=yY2WUTPmaqdFcyNIqxXrvSvLmfiNhX5YhWxhny5qsdkdcL98+S9pVWtnEV2MxwhXwtbG
	 m31tCwaXlTZ4ThgWBivN1EyZC0itC4xU71u+KtXn0R+ebrUPu6S7RFTCgYjZVkNLueNRj
	 xcaxqOp5LHGQd3OsQPav9qHll9v34zNIRjJP4Pk+eWCbY8yB7NnQ8SS/DBEnKt2opmt3n
	 L7zk86PWLDI78GzkqiK9TxU8KMJ4jGRhAZGxLWhmbOxioapbJX+bFPkwB1C/Kz3tsIQyd
	 aCsrQ5goFe+bCzjXV0gnw7qvexkojiDTka7mAvwW2RGiRRFpbe2UDy2zypIlmarR8mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moD8h8Tp;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NSV8YMPD;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7360A260C
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AA7360A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=moD8h8Tp;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NSV8YMPD
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FA1o3709464
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=; b=moD8h8TpD3TQxju8
	t0/NdMyCXjS269zF8q7cAPEVOTitV7YmjuqFbm/i6w8lGxOSf0mg5nyGTz+o5Lir
	lW7zcY43NirFfRjFOOJIwi5cKas2IXdvRaDA9Ko/EZ0fNr3qgYXGsq2pNqFCGPfU
	fixSIdIqlgo/qekekjfGynaX2BOV39/h8nV2HLZhwtfMJFL/hgx8QlAPgm8uxn83
	mVy/4BYS8h/Fd/sz9Li3QW7R6UgI9J1N6cT7DUKcIZeCXiaV87YfzljR37oA6NSB
	ZG9Mp64b2Fq+HvpvP4MhA3rUNqEwxTQPzFLH/UmsEv86w14+Vvs8c+LDt4rUTKDl
	emgfug==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6rjb7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 09:40:21 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-139b62317d0so1639693c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Oct 2026 02:40:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353221; x=1793958021; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
        b=NSV8YMPD8r+9ZF9CrOZOmnqik9khtV5XcPm3ihNxJqQJdI+idaT5SXfZXySDMwcCnD
         4x+hGV85bm86HvAIAS060xeyO8imUQZzpPPhx6x1YFidcsFPl/nH7c/bM5rWXeqpW6og
         dCVkQINI7PERNTaypU2OxJGsHMVBZb/eO/PWGy8aSjTGMFioqTUIUtOoDj/YZGGqPp0F
         rZk6bIWInOfAq716eOp+hRHAFp2CvRxZ1SUEa4OpORo0dEDXaFEtV5rJG6HaKado3uYU
         xWXFGnds+OXtk7nxSE6bPav8U5w/VMKGLAkPRDOeNZOlQvPOoNpLvy1r/uvp1OcinDja
         a62Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353221; x=1793958021;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GcXqbPEHJFGrGJfbAknS9hjSRjQJhsi3SXUnT5jLmBA=;
        b=rp9dTCzyowcdrQjNzngIjn60b0BJCvhnv3RSCTZfe6fbWfSZ7jFD89qxRZxg5M2RWB
         x6AU+x+gsNVogVnEL/FZpQYC891r+aP7yjOYROVV33j9JCdJuNU7bs0I8er/3RqqEv4S
         isU2y7LzBSO4Brc/lPPZi1e0LmSti1r7jre8BMkLc/WNgwPlNdkUMmTLTrEcRJHlN4km
         GR+SKzIgIIrQrc5uLHeoy9XXSWWTZyonBgJqbpSZazjaSy71X3TN8JPJuHw/26WWlY54
         ti1ChMBSNBzrGk1Zr7scC83N4wQCD5sN1ZcwfcyeQB/uJWDx3qovFZiLR+x4lVEv2U67
         SfJg==
X-Gm-Message-State: AFq9FYIfQDZLB0FYyfmIeSxn/xsUMwbkFUASOjJXg8To/3S5TZ9TJfx9
	l9MIdoeVoppZ0zL9KV3dWNebtWxZpLKLV1pMCSMBCidxpKLMW96UVb7VkrGLlbRIQSL5LzNI8p6
	iBCiPw+kx5n7ar4nZNnIxyojg1w6XQMyDDw6L8+VR39IwUQ35csUQtLKaVtuJFGqZCl29
X-Gm-Gg: AYBFou0z3o8AiR5rkaqsbcyvEekJRivhNfnS7kx6615ZNuPOX+hdpAY6EwC4TbjZOW5
	aU8571KR9vGqKdkvyEbiCnzOlg2z8/UVeIEFLBrJf/99A3MSEch8nTNzlRacP4VZlfZL44OtqyU
	8IMOXU5nuB0RDnhsuzdfmDlSetIjdGOsuHl/hNFZGT9rJiKkPXNH1AfzFrO3Av8HLFHoUdPcF34
	/gForSiRcbHT4D8A4MTrGHkR5xE0POkpSXoMpql7RW7QpiNI6px7hWiQspdaHDLDnGw1nKadMu8
	v6cIriKXV9sO59Y4HtmvZZSdkWSs8taW7ABNmpPa6jG1gev0qzUx0hd3G2Ahbf0YOCkbjIuXlsc
	kIKC4e95/10/nC9DEQ0fxTugkpFzJTlFwBzsBF1xnxbfiYJR/XqFUGXMzfVWrWyIuIkRJB5emYO
	4HX6Bk
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr2448097c88.38.1793353220792;
        Fri, 30 Oct 2026 02:40:20 -0700 (PDT)
X-Received: by 2002:a05:701b:4244:10b0:188:ed6d:ebc9 with SMTP id a92af1059eb24-1ac5e6f5225mr2448041c88.38.1793353220039;
        Fri, 30 Oct 2026 02:40:20 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac193b8179sm6723418c88.11.2026.10.30.02.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:40:19 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Fri, 30 Oct 2026 15:10:05 +0530
Subject: [PATCH v2 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD
 HDMI bridge support
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
Message-Id: <20261030-lyra-display-upstream-post-v2-1-906302159392@oss.qualcomm.com>
References: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
In-Reply-To: <20261030-lyra-display-upstream-post-v2-0-906302159392@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org,
        Anand Tiwari <anand.tiwari@oss.qualcomm.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793353209; l=3487;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=smMOiJGRXLe6vyzF3EXDVDCQHvPs18b0QYgi9/GYlL0=;
 b=NsXFVb5awnoQh4919cBqRkuvUzwXyUh7/DiD9hpttwt/QucRhVzzxzqb9/MFQvxT3gNhYtSIR
 r9B4uaQT7ClDVFBTwK3N5P1RMDGc+HDqM33y6HT7eIWZ31xs5l98VIZ
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-ORIG-GUID: pJNlg_DhX1wiGPCxQn59T2B0D5ENsl5l
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX9RzfJJUo7auo
 Xpk0Gv3qHYe2JzEs5uKhtHiIt0CCxzxG++U7OWkK8SjB2jBQxiFnORMk8hXGAraY3lMrNKhDSkN
 RTTxCZ4xHCiImJhVTKH/SbSQ4XJ3y0s=
X-Authority-Analysis: v=2.4 cv=PIqaavqC c=1 sm=1 tr=0 ts=6ae46605 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=OCdZN1uXOpAY9Qk72D0A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX//tlfSSm65lJ
 Y3uvf/h+ioPdCysT6pXxXazhB+5R0/l05Xvm20n8d2XH0HuId4cRmO1hf/CosL30rdQgLqFXToP
 ND4w95DLxGT41Rgme5WFB7xn+QSbd0W0XkF8jJY49dQCp88WbulH94/ZFg6aGxcXNfp2qDWL0UD
 rCiF3LqDnpDwsAxEiCzPFEW7URaEnaierc73vGcyQZX6BGaWg55TpBIq2YvuH6ZO02AN4+tPFmg
 u/AVgi2iPaO+kgvpO3YFrnDt/J1BWXdBO/VrhiY3NmnzG8GcLyGsoNFSZwW/5JbMW3JkOrJlF+K
 z/WUKHdXHztX4S7eRnw8xGVZElHbTH99fzHvUx3VPkYoGX1dxz3ok57k/RxW85JuKcUDHwX88PM
 1/OQOPJ6tWKfRQCeTY2r7FGb7p7Xz07FT9Evm9IH4naM8wbg7QZFrz3zpYJ1o1KSSfwj6NIR6u6
 585ZjG10d5pmwQ7w3Iw==
X-Proofpoint-GUID: pJNlg_DhX1wiGPCxQn59T2B0D5ENsl5l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
default on the Talos Lyra EVK base board DT, to provide HDMI output
on the DSI0_B2B connector on the carrier card.

LT9611UXD is connected through I2C2, with reset and interrupt
connected to TLMM GPIO61 and GPIO60 respectively.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index d4468e609911..eeb8e903b03b 100644
--- a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -4,6 +4,8 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
 #include "talos-lyra-evk-som.dtsi"
 
 / {
@@ -11,6 +13,10 @@ / {
 	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
 	chassis-type = "embedded";
 
+	aliases {
+		i2c2 = &i2c2;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -22,6 +28,65 @@ dp0_connector_in: endpoint {
 			};
 		};
 	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&tlmm 3 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c2 {
+	status = "okay";
+
+	hdmi_bridge: hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 60 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&vreg_s4a>;
+
+		pinctrl-0 = <&bridge_irq_pin &bridge_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				hdmi_bridge_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				hdmi_bridge_out: endpoint {
+					remote-endpoint = <&hdmi_connector_out>;
+				};
+			};
+		};
+	};
 };
 
 &i2c5 {
@@ -74,6 +139,23 @@ &mdss_dp0_out {
 	remote-endpoint = <&dp0_connector_in>;
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l11a>;
+
+	status = "okay";
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -113,3 +195,26 @@ &usb_2 {
 
 	status = "okay";
 };
+
+&tlmm {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio60";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio61";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};

-- 
2.55.0

