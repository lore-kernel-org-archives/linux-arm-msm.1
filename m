Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792595864;
	b=0rZTWFzhPb8zlMDEXTBsep9hu/DG/PP0ZJ8SeZD+rjIKKxxHzpt56J/pk1a9jV99bSuJ
	 nw389q4Xt5n5gL58InTvJkLH7meMMfzGWchdhZHukDnkBuoE3P4qIhjpiFvS3Eao9buXx
	 3eBvfDA7jNGyiahuK+cwPlen2EcWehJUbCOMF/po7/pRF37XF931+j/GpiVaQnjrQicgi
	 LM0rhCf6v6M/5J+vYwcK9D+0BLaPt519O8gMcuYGY7utWEN1wOTUomSFrQPGwSiqleZdq
	 sP5MbjMD1DjUMtEtflhNdSsmYN4Ovo6qJdj5syEtNUu20PEeEb11bu/Xo9JAHYEkWfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792595864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
	b=w+qEwNVIvViMDqDaf/BX5Snzm0quTGQvZHG/DivyPoR9Zwk3VD1lsUnPzIK0ISKkuFdW
	 brchvHxTMj85Bbd8rpvt7T5Ek5t7XUaC0O63DwU037yHkwrHzFjeMg6hVsuw/YSBn2WBU
	 8K1q3lL/VDN4SaUTWotziTBYm6UC69q6MdXd8nkA/pKU4EaJxJBwnXjpDoqQufRjEPn4c
	 Bu4Zmq6loKfHpIHtu6UJonbmTsgkhwX1utyP/auKKau8wciszxYL9NJAHiXeiVYAC4Cba
	 Ia/s+at21wrK82ERKZwZxpIlwTwRWOx6xNniLEqeyEhmy8rDxysN9d54odOoUElz4RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6T02ydL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIxIrNvu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0865E606A330
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0865E606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=j6T02ydL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LIxIrNvu
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEF5Bh3558071
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:17:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=; b=j6T02ydL//Q8S078
	kUngjU4oZAzoRfXAYuzFVRh1i5xj5apfsUtC8t9nwK4JaQhhV3wbegcpR9jvUFDP
	2ZKXfh1HFjTdxw1LHmH3B2EGDfIAyAFs/MCdFvm/+/iPoTENLAOxJEbxXBRsrc+z
	3PcSSv5C4Gxxeu60p3Z0h33znQfhtXqrzH/gEb6m7hwYzxXKoPxOJQU96z/wAlTo
	v4muCzfWi+AlIbawFD9tX3Co6Z7P07aXx0ofnPO88TsyfCm3SrrZ/N94aJ7hjLKW
	9InweytC+M7Cxs7jL+MkDrJkEcYFDcmPg/G4VUplOvtGFOh6jIiwKJRBzBsFdUw5
	HspCwA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hesy79rjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 15:17:43 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so2160969eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792595862; x=1793200662; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
        b=LIxIrNvu6UL/k9AZQ3I5t32tg/oHgSlMS5a+BaC2C5qIbA6vhhfkeeHI5o2MmVsJL2
         9je6dHMwFoMOQkNE4yJ9USqJ3WCIrp23ECMGeV8uu5IG6zIdNhbi9jFzbXld+924ghIL
         Q00XQT9PbwIErqGJgwUVeIcfQTzPkBb8RJMha5uC/eyKOVek8aW9SoG3baNaR+Eos75a
         eeZEb1XtxOTZa0deasFBGve+gVwEaeA4Bqr/cV6A4Luh5gnwE8GZRPyLiyjEqT3Rvgxo
         FmWkZ7L4mw3pOt2Rlyr3YxjT65igjJpX7CnF1ivIbeuQEY6/l58BxwJmynauaGC1HQX3
         U54A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792595862; x=1793200662;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsNPFcVHAGUVN0e2Hq2ckPVw9HP9Dj29QyVKGoAqQNE=;
        b=u7HyKhKiaQ+FGH+Qtc3hZhQARIomtuMg053Jy4bQ23KMEXDkO52Dpb7E7s7eyLpIO7
         lWMVyvzKEyxOjVr68UABYKNNGA+N4xo6dmU5fyZEMgNuoxscgHlegcAA9TSz8mtJgT7t
         hDhnf3fFhMNz8c5D2yG+JWZDjbTKATxP4eUQwMLoScLo9oAT0HU6MWes3yR3hvYcmL4V
         gBCEG1K+1eja3p/UGarnFBuCQbBbYuT+LVxiUZrdWXyz9x7VXlgAEmhpckk2GNeHbHc9
         YGdkdgNCLhL4WJTT8q+QDeCXeDw+FyEQUEcB2O2edGteGQrhntER0wmAqUw1dwcj34Ag
         a5PQ==
X-Gm-Message-State: AFq9FYJsv6wYBlkFzSkTx4htq1w47eFt+pOPTK331Kl3DFs9LVC4VMPZ
	+f7dD4xNsTASC1NXDQiFzRSxQLZ9sXLBv5ip5yMRxilO+atIpdrsWwifdJz7MJb60qkmCPr5GnV
	H5g3HV3uD2M8bjW8dczswjD7oDs5pYpoFzSrtDA/73OzotlovI4DOtG5ss+cW/69ZA7Es
X-Gm-Gg: AYBFou1Ntx6zw+ivjaMmwqgKEkXJAP3udJSS8Z9529vp7fQVIrZvaTpE0GdNEwD8lP6
	5Dos6DQHMSiuBN6zYSxSaYjJxL+yFCz+HXJDokHr8a6Yc1KegP0DZGa5CN42bCnWu29zNkbdINH
	cCCX0Mm9dGOvfzCvq7s6LKu2DMjwUOyc1eJHXxxrMVo/vhOcX1hW9fX4imKUQ4wm/Cnj3rQ3lOn
	l+Fp31wp6PHQf7rIBMMyAJdjZWedebpbkx4/DtaCogPHNa2Uheq0Ayjwv0EJcw2c7ogLMsRnkvY
	wfjchOQkwMHhCF0WAoMNMM/reiDKcpAW4UEDbg6rdNkqUfooPyNAMmf+yTQD7JIl1ad3Mqx2I7/
	Q0jsm+AXLcxgaCaWNIe1W1altG3Os1PUy
X-Received: by 2002:a05:693c:8942:10b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3674e3571bamr3403396eec.27.1792595862236;
        Wed, 21 Oct 2026 08:17:42 -0700 (PDT)
X-Received: by 2002:a05:693c:8942:10b0:34d:96cb:d75e with SMTP id 5a478bee46e88-3674e3571bamr3403342eec.27.1792595861379;
        Wed, 21 Oct 2026 08:17:41 -0700 (PDT)
Received: from hu-anantiwa-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc8c6dsm9142117eec.12.2026.10.21.08.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 08:17:41 -0700 (PDT)
From: anand.tiwari@oss.qualcomm.com
Date: Wed, 21 Oct 2026 20:47:25 +0530
Subject: [PATCH 1/6] arm64: dts: qcom: talos-lyra-evk: Add LT9611UXD HDMI
 bridge support
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
Message-Id: <20261021-lyra-display-upstream-post-v1-1-585caa39cd7c@oss.qualcomm.com>
References: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
In-Reply-To: <20261021-lyra-display-upstream-post-v1-0-585caa39cd7c@oss.qualcomm.com>
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
        venkata.valluru@oss.qualcomm.com,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792595849; l=3427;
 i=anand.tiwari@oss.qualcomm.com; s=20260717; h=from:subject:message-id;
 bh=ZxgrAd6nafolyG+/7GE/vBa/duxEvCqREClsUHxUoec=;
 b=kKaVoiWy9u76Iu3oh5yB6hy5Toxfkqe7KfqzADnMEQkwgLwX8J/n75fSu8ezTkeNBsWxBQ4sz
 kfD8BvytvZCDQMg9niDMfamu6MRqNExRW0hGmaK3Zbvjf18292hO2+O
X-Developer-Key: i=anand.tiwari@oss.qualcomm.com; a=ed25519;
 pk=ygURjl6LxwG8EhgPNHYYgCZLsaXFgWZZoHRRyud5B40=
X-Proofpoint-GUID: aYv_LYi0sJ-PbpZH5nOS2f3x0r63AJi5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX2+0iY3i8shZj
 uKP7Gdi2ekiWYaEZS4Oy+f9UZKjLSudoh2us54d4YwajbtAOOiUYamUrpYh1ZkqdD1S4GyJwgSx
 ADgXNIMjsPFmNNXcm+3q3cBIbGuaUyqTYF+VC3EiYHu5a2n8QzH1mom6OQnXmlkLRkdSj1nTMVt
 6t9YBJuepyJM9Q5MYOPsK/e2XPdPap3DfzD7v7LBut+hyl3uwWe6LWXd8f5ULAzkssAE4sliFVL
 gTGz6UREZhKJv+7dnB/2hPixv2Qsi+/BTnMHu/F9Q/EP3QG/s/ST0SkOypn2EQ3Mz0FFEcIJzyf
 GLPzqK9fTDlCyZgdiMnOVlfS3F89v8IF1V53uUi15uvSgz+wh8Uo90R+sBrp67f2t6gZ5IZHMIH
 vdH//9hbok9QF5SbRnj/BuAADcqslRSi+MhMpthhypDKVGdVKyl+hj5xJXNbiWMA0EzoI3Hnf3k
 w4JEpF4WkXfNXfkDwIQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2MCBTYWx0ZWRfX16LmTO8Kexqs
 KTYBxS24ASq3YZuwaHYjxAJZjwuDdEbvb+nZE9BcHMGfoHN7XZMKiLe1A/dsiGOFgdtem9lP64p
 CV/dbKmESbATadtwWDbWupcx7idCXFo=
X-Proofpoint-ORIG-GUID: aYv_LYi0sJ-PbpZH5nOS2f3x0r63AJi5
X-Authority-Analysis: v=2.4 cv=IPaXmQvG c=1 sm=1 tr=0 ts=6ad8d797 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=ggSE_kt-BB5Ld93xFnEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210060

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add support for the Lontium LT9611UXD DSI-to-HDMI bridge, enabled by
default on the Talos Lyra EVK base board DT, to provide HDMI output
on the DSI0_B2B connector on the carrier card.

LT9611UXD is connected through I2C2, with reset and interrupt
connected to TLMM GPIO61 and GPIO60 respectively.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Anand Tiwari <anand.tiwari@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 105 ++++++++++++++++++++++++++++
 1 file changed, 105 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
index cfb563658fe0..ec5c10a40521 100644
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
@@ -25,6 +31,65 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+			remote-endpoint = <&hdmi_bridge_out>;
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
+
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
@@ -135,3 +217,26 @@ &usb_qmpphy_2 {
 
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

