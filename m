Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCCC344BC90
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Oct 2026 12:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791377492; cv=none; b=XcCVlf8lDoIXyUA9ZdGN4irukoFh52tCpjvNTaAK//wYBZ5dniQMSiReN2KmYnqg0o8JFEEWFHOanP4xO21ieEmh66IpfjRCJmGfa4HNetIqkTnYjTtU0O2+Tv5gwPgDVAS4MW+R/GpV6TI6M9tf08TnO8cIrm7A/l05gfTKB9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791377492; c=relaxed/simple;
	bh=w8s2+jwZCldmMKf5kr4Gkug5jm4WLxr/4uF9DbQ5NDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EW2+MuKFzTDiotO6dyHidK2DNOioWsC3ptQb5OfGTMCP57LuAbGozh0lDNCDyJdlkHYdP51To/c5+4ncgsEQtvhXIm0eqBUKE766T9C7jcDKsFJGf9TD67tVsFFwR8YyNNXEqPBm+f1mV9WRbYNbtYNX5JhyuTS7nDvRy3jTgYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oHS5W1pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QjPAVy9Y; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oHS5W1pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QjPAVy9Y"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 697BVCP43198253
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Oct 2026 12:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1FuLwnH71QH2KhF3jgLD+4m0KIwfYrSL4u9dV4MeGCQ=; b=oHS5W1pnsSZoSIgZ
	jiZTY3IioqqCnq0sbUmH+nCPkEoSOPj92h3z4grC9s0xuqLSFELmKUsnxMvVwU/3
	RAUotPhnNF413X/wDs73sje+ctO1p3KxLv0EW1/J3fSiHN0w9KlDPthgsg3genkt
	4pbLQUBnCHjUyp/Ais2gJsahHLHVO95arioCADmaVX8GwM3ormrez+56IAFBG0qD
	lYYVvZLEb2Y4LMFh6ABLPjVhKlSVrm5M70NNUjkKfFq+dggVc1u5H0M13wJmIV4I
	9vP6iQf3AX4benzb3KpnsYGVKCqxjFgWVmecFOecvDGtLAJ3JeG9C33ux/KMdsTq
	uO2hHw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5c1s25kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 12:51:20 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso2822671a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Oct 2026 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791377479; x=1791982279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1FuLwnH71QH2KhF3jgLD+4m0KIwfYrSL4u9dV4MeGCQ=;
        b=QjPAVy9YOch06veMkp39FnA7kyCOfjf7CAWJVMXx0NTSySRQmdoMUdMSt2rT6wt4Zp
         tDTxJe11+K5nacnjN/a/cb6IXScE9CfQEcUCfIyhnbF1syhwNK0PS/OGnSeuGhJdLjQF
         RbDuyxyQWUKuFnyBQ3GOwE9t7Q//zL+h/S2bj2gaz9FIapNtt94FOaJiCAUBtj4B7AgP
         7iXhvzK3BSHhuVrSa0qKZ+YYAmoylzhL8ua6DW2dPt72qMDBo5pzICArun1JPpPkSdof
         2hKZYtxNsVEhavueXm3y5nxKzFkOolmvuP+Ugoo8UaT7guEVixd0rsBCXh89extdOces
         n1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791377479; x=1791982279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1FuLwnH71QH2KhF3jgLD+4m0KIwfYrSL4u9dV4MeGCQ=;
        b=vpxXn+p3HGK0gVCMeEwnJG5dR/ZCrtxkt3vn1FShQKzKp9PUOpdcMV+9dWd4FHhXLd
         JP3V1zCL60VAuyEu2koBwWpZryp0tZyDP1IeQyQ1vRhaDoXZUTo14FvYMjtvXvuOkyOi
         9LoqFwUG86++PrrLO12IM0xJJSVS6j1GQIj721IAPGp61TLpgR7YWqQlKWpodEU7nX+s
         GnCug1W15DdnW63q1Gra0Ve9mtulgQV30A4EgcCzoRvTqxx3Hljs9ztrX9e6dPpYUe+w
         dU5NX3rm2bAtkQfBllA6gB7jwGUjpDG5cG4xbyyDwU5+kYuvg4wFnwR5tkAv7dea8GmH
         kPfQ==
X-Gm-Message-State: AFq9FYJ3DvhniQSL1MuOmkRr/hvYD09PLRy0GVuDZ5cxdwz27l9tQpWh
	zqUL3OClczzQglBldai6jsfpEAgdOYUITUtVfjYCagQRhjNtiAQUHreUy+Jis5YYVoSiVKcVanH
	qUOtv2FFhqWhUwsHh1y7AUAJ7nZ6N8GLb9vsVZI1kytWft1wIz7guRRLsVvsvqHVFDjoK
X-Gm-Gg: AYBFou2FSPm1LL5iqN/PYf7wipq4c3FuPxIZXsadVdB1lXsqR9g07sSfhqNfkoTd3j6
	u21iUihigxlKR8ixInn+kPYyKrvx1z5kVQaSqGqK9KVsEsacsEr89FSVrpDFcOMiKizSFNE7Kfp
	5PEpIVgB+6T6PWuY9sFVGUQ8d0zqNFDqL2NKbXKkel5FcrLglKlxRQS5PaAqMAOYRYm9t3milEE
	dVINYT67fYkiBC4sV5J4bn0cRJFMskaIaDEjr2SwQSvpd5/PSqfOsoZKgDdhc2q/twopcGVxu4s
	gJJGlLhY4PYCcgWCLpkS9w4ojCZ8Vgn0td5M797ognuRB/n6s1I5XmarQ7bB4sklHrzX1tSMxDi
	ZZsoAo9Z64v927wq1bLzLsB4iEA==
X-Received: by 2002:a17:90b:384d:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3a8a1b26d3dmr1726952a91.33.1791377479323;
        Wed, 07 Oct 2026 05:51:19 -0700 (PDT)
X-Received: by 2002:a17:90b:384d:b0:3a7:db88:3491 with SMTP id 98e67ed59e1d1-3a8a1b26d3dmr1726935a91.33.1791377478818;
        Wed, 07 Oct 2026 05:51:18 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a89d718333sm1884954a91.1.2026.10.07.05.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 05:51:17 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Wed, 07 Oct 2026 18:21:06 +0530
Subject: [PATCH v4 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261007-master_lt9611uxd-v4-1-9986704e2a7b@oss.qualcomm.com>
References: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
In-Reply-To: <20261007-master_lt9611uxd-v4-0-9986704e2a7b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791377468; l=3599;
 i=mohit.dsor@oss.qualcomm.com; s=20260808; h=from:subject:message-id;
 bh=w8s2+jwZCldmMKf5kr4Gkug5jm4WLxr/4uF9DbQ5NDo=;
 b=HZ/+bOeUbAWFEtjrY2PBExM4IeiG3kJsGZVXKiidL1hFWzHDEefdMTPfuTbuE2j9BU02n74nE
 UB9FhK/m8npBT7AI97HtmJnwBMJuXaEVo/9zjKGFCoftgEw3LTKRfFe
X-Developer-Key: i=mohit.dsor@oss.qualcomm.com; a=ed25519;
 pk=outHVBN53JhozDw1xkj3G1qrqqE5scMBP7M4WL3aHQQ=
X-Proofpoint-ORIG-GUID: Tz42Wu9RNcn6Nz30DOTZD3Zr5cx_yoJG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX8reoEZRdLU+m
 8tTnPzZNfaXDXB36vFktHGB3EqtolRnl/oWTd5f+PScEbxRrP0ZkazwCpRB8dI0n/nR3pCSLB7n
 NfsOFr1FaFw8i0djO3nfVOhlko7aj5UPBEkoq8d1RIzbDqI8/P17SV19uSCfCYM9jc938LApw1Z
 dpGsVP5t5ABWCdiCVxlPDmHXWBnOkiomSRR3OXBLp/aQkqVIGPgX0N4KkSl3iKpiCGRWusGrzul
 l+ibE4l4OEKflAIa1DxBgZZPvXDDJhCJwxKzM8cqRdA1gZfXdyOG6mdT9z+MKmzxk5A0QDqSMI0
 08MxP/mIovEFUx9yKUnMheYOLpcVIpfBUmUBGgUBMA97u8oaXwe5MN2qEAD68E/YrfAX+LR9IWK
 /O0254d3E/kfVdykZ3fMN28How7T0V34XlfqFliKtPQyN8Ke96WQm6nimPvE8NmKM8bpEsTGAwi
 +wM1Cb9moHglP+N4h2A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDA1MSBTYWx0ZWRfX33ATWDG6/gJh
 ovOfHX74xlb20ewOKA7z+e/nSvt9ulOBjvjhnixFee8Cem84DjFmq5oKTd60z24Apuq2k6biYdz
 0IALH7dkNQT+2bjEOOkY4DRTB/xGSsk=
X-Proofpoint-GUID: Tz42Wu9RNcn6Nz30DOTZD3Zr5cx_yoJG
X-Authority-Analysis: v=2.4 cv=NatzRGD4 c=1 sm=1 tr=0 ts=6ac64048 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Dh2IlRrSrxxA8ivr3KQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_04,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070051

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.

The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
rail. Reset is on GPIO76 and interrupt on GPIO85.

The bridge receives DSI output from MDSS and drives an HDMI-A
connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.

Regulator and pinctrl labels use generic board-level names
(vreg_disp_3p3, bridge_irq_pin, bridge_rst_pin) to decouple them
from the bridge chip.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 109 ++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 5df30ad8211f..fee93410b2e4 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -8,6 +8,7 @@
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -23,6 +24,98 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	hdmi_connector: hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
+	vreg_disp_3p3: regulator-disp-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_disp_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&lcd_bias_en>;
+		pinctrl-names = "default";
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	lt9611uxd: lt9611uxd@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_disp_3p3>;
+		vdd-supply = <&pm8150_s4>;
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
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8150_l11>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm8150_gpios {
+	lcd_bias_en: lcd-bias-en-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+	};
+};
+
+&pm8150_l11 {
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -67,6 +160,22 @@ &sdhc_2 {
 	status = "okay";
 };
 
+&tlmm {
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+};
+
 &usb_1_hsphy {
 	vdd-supply = <&pm8150_l4>;
 	vdda-pll-supply = <&pm8150_l12>;

-- 
2.34.1

