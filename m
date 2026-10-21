Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792592531;
	b=hPHUdnGoKw8u7VMsX3MZI74rpCIwkUcAqJRmHPTFlBWKi6uLO5QHb6738XvjWoMrAP4o
	 5OOgFPHqE3sS0cV1jZAeLgNiF2X/+iXkRCdfc5NX7inmmGY94vo08pt2cCtSbGtbPcud8
	 No7lM0JMgF+llQvuqwHrGbYK2j6JNLjUGwYZ96Q/1c8XtNvoCfs+XHyOgHmI5mxYlnRjd
	 M0jEaW1cbJRWRTOW0PkHD09OtJZFOYV6YosYkRPa866IvI+kvBwQQcOpN4omCYLnuMDg3
	 ZQYLZBplU8KXJsIfekFjtDAGoKI7n5N+OzQiYzGYj099Lm/SPD/Y1ugvYr7jtE4ol1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792592531;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
	b=iOa10JUSq1SZlPvHCnSWbX2Sb2jS/xpHcwRVebWlQ3TDwSljVei0NusOjWtCzH8Wq5b7
	 kYJ19p6XF/cwVDlrxoiq9E7y/D0Td3llQX08w1JUAjZI+xzlgJjSiL5ouABB3FdjmtNvF
	 4JGBC/HXgp+bLWHt6GF0NCCW1gG7e49QOgL1895veLtwDeCD45Vn2wRZR0gpr3oe3Hhba
	 38xtVnCHoIaptHFF+7ekrbhHjXCgxLkEugEXCN7wWMmXzanaq9/5fxpBrrd5x4W69gk7H
	 ZjxnsfHi9mTjcBLpy+QJiEimZkcTwEw3YcYsOANZoEGOnrfmGcINS7xnLP1iiZuRVyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzZVXZtl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="V//zCz1P";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7DE606A31B
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B7DE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzZVXZtl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=V//zCz1P
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEGiYh3997240
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=; b=PzZVXZtl04DVgplZ
	kUqg5vamYY66wvnO9Br3zhrGL8JBMeOq1xXkW5fapBtOdLlmN2jS0RYLJRMcLFAc
	gihwnwVsWAX8mRlr/GkmxMvfzgBcvZYK9Gxggt3a/oOIci0gDcx6nyHHXJZAVqGV
	lMy56M5f6cpza4eYLl2rsD7oqBzEe8tk+KyRmw02iqbv+4DdKhoCPLyIc4jPbNjg
	eJMtZAoh9v48OdA8X7abIrvAiZz7+Gz9YLfBsjLRAJlYSC4W18G7apHC4TG2nRaI
	x5DO9pYU7GLRBNbvv4MprNE7+VaN5P+RyLHwJIzGdQuUNGbSggkilIT1Mee75M3l
	9JE4GA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q88k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 14:22:09 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35dca90dea9so58923eec.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 07:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792592528; x=1793197328; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
        b=V//zCz1PwVMo67ZDCPJFRiO8pN1/1edMhCrGseoPs+ZCA9Jrhk3+wx9bVKGi76Mekd
         9SSxgnhM0twtpPyfEoNkcU6y7icWpaqMdE9+ETVNlXQYGmpfsRACAUez8ligX5lUDtZB
         L/UoQmFOR3nq+LcfGjW7FHl0b2bno0uYIS5z3gVDus5UTq9nBRVdCmjaKrRqnDWPZE8a
         sne4qyYzUhzdnbUoTmosOwgr9zaRH/WK1Ons1IPRIal9LBhe2e19Vm2ilkXtCeppBqBK
         Ii5bU/6GLmi5NMgWT+vgPb7S5IOXfMJNeLxVwFbhRYkSv5SFGEy+pnjujT7/j9XI/Ica
         dYQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792592528; x=1793197328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7CSk10V/GbrMlagTMhQtfoa6CLwoZTMUc27+IP4BEsU=;
        b=LnhPwgtUFexpvjzY/dkDlSIyIfmlQlY6gjFCdvc6g1N8TqKL0sFeuXLTaCx/5pVGut
         Nok6U2mBFSTDWwQW5vRK2/p0g49AtLPe3HXzxXPgxbz9uBjlpHf4R4mpC9vxDVbCGvb+
         zGcP+TNs7ofSVWpt8e08oROe3xTD9cLVV6OUne7/C42VCxQ4Y9luBCZ9/oRPlN6bbg/d
         9SIxLWrjI/zFV93mp3sqMtRFWJrDWGakFMVxOsG82Ics/nzapomTSTqOZlumSCtX+PCn
         FCFXSmFza4yS/30Dz+QpjMs0isk4KNpYIXm+/3acNSOq6rVccYeZHKCy21cbDky0jst0
         7VVA==
X-Gm-Message-State: AFq9FYJSEc9L9B5LFdCh3n+JZUEU+muyqG0YzoJGpnKrtrHYDyU35MVP
	5gp5XbkfsKGODqFHSv9+6EoMwwYnb2/6ftlrYyo/f1MXGty1Mx+8NrNcsZVdItxW94adt4GdwUT
	0rSnU//E3JPbL4XcSe5fO8HZK7QWZh774wGPFs5sgyFzGkRohGEuRB4RYbGYSa+0mKtY0Re9GdL
	M+
X-Gm-Gg: AYBFou3DYISEHrVNgC9WjS6U0XMZST61bN6Q8o8pxlzoodTcmrHXv1Zp1IDMnYDBX67
	nQicpZQ3kves2mjpYk/fV6rtI8tUleltUi724AcDkWzcxw2/tu+wl51OYP9mtLYaokoZmz2vzNb
	XavfW5s/c/OaRnLCCVv6dESbbeWOWIaKAqmt7QzekQbgnThSfwsjc0ambe3Z3C7jWALdYfkVF1V
	FaE/zLW3stbMaSiafnQ9mAOdweNcOt9lSE++6QYN1h+YWVDY++aPQDg41DmYuAivoNw+3gzCiam
	B3llgaR6XBizXLPbMxlPGT3z41xd2k+cZiMcdkUrapW2ia0zD0deWTHoJB21/OpNd6jT89WzGCp
	gQkmgFjzN6dOubCJz7cUvcn4gpkL3yAxF8aVhP+35D5Z0XnXW0T7Ea9ttAVxNX565v858WBmhSm
	nubhb2dFRXlQLx8snrUqUcMy8Ngiou8bPiTVCJTYw4Avwtsl2+t4c=
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id 5a478bee46e88-367473c9a92mr4748593eec.0.1792592527510;
        Wed, 21 Oct 2026 07:22:07 -0700 (PDT)
X-Received: by 2002:a05:7301:1a18:b0:351:7883:bf47 with SMTP id 5a478bee46e88-367473c9a92mr4748548eec.0.1792592526795;
        Wed, 21 Oct 2026 07:22:06 -0700 (PDT)
Received: from hu-vishsain-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36740cc88b5sm8074818eec.10.2026.10.21.07.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 07:22:06 -0700 (PDT)
From: vishnu.saini@oss.qualcomm.com
Date: Wed, 21 Oct 2026 19:51:44 +0530
Subject: [PATCH 1/7] arm64: dts: qcom: shikra-cqm-evk, shikra-cqs-evk: Add
 HDMI overlay
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
Message-Id: <20261021-shikra_display_overlays-v1-1-adaea735999f@oss.qualcomm.com>
References: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
In-Reply-To: <20261021-shikra_display_overlays-v1-0-adaea735999f@oss.qualcomm.com>
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
        Vishnu Saini <vishnu.saini@oss.qualcomm.com>,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Mohit Dsor <mohit.dsor@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792592515; l=3537;
 i=vishnu.saini@oss.qualcomm.com; s=20251113; h=from:subject:message-id;
 bh=/cz9M5Mfy75zJF1P+GNbj7Mi9SYwOuHONvPOWhiMRBE=;
 b=kwifF9WcjORAuMnoI9aoon6ipo8Iz1mgElJsn6gltsHFBKq1IQQpnKarDVFKjV7aqjIPiK01m
 T3LfXaU9EAeD/HbXA3oBnHSJGOae+cZ6wnqpUWFpsVgYmLR7l3qKguj
X-Developer-Key: i=vishnu.saini@oss.qualcomm.com; a=ed25519;
 pk=8hlXlF8j/3GeOaDK3w2LYhkv9FanCQru0c7kRH/It7k=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX/MY8kfDk5tOA
 eATpxo1AfRsNz3odG2b+SlgotCLmeDyrrJlNDJCVXVZT+86zA7JTlAsyQBJSIO0QMKomH7htQHM
 S3TnL7lhz7sdiUmJYX2S0umNFD6P8r8=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8ca91 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=U5hq_iVO10ORy946Z-kA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: IyX4QDt1T7J5nmf0FO9mzKhDc4iWJQij
X-Proofpoint-ORIG-GUID: IyX4QDt1T7J5nmf0FO9mzKhDc4iWJQij
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX00W7Lph1smaB
 sgwZ6udp27HhQV1Nm8swGcHd9L13q44vjNDYvo2IVgGQS4+hZN/0PNVu7xvXFInpUrF5M7v7M8F
 wqsh3yqAwlmixjxTouUlogx6Ys4PITTnEqJI46+DZ5FivTphnlxLvre8N7e5WlX0YAAhALhb1kY
 2DcTboXZoYBaVaICRPPScW3SzdCCocMeS0O1GnkCE9ZTlvj01aRL8Dn6iQCPS/fKoBZgRZZjH2z
 nu4Z3kF8dER2RBiXPKVJp5mB9RKvpkZ7G2QvyowZhXCQ4PhV8kZX8D4znmzt5iIgRV8LEkJcey6
 wda6toJomC5FBsRE4OZeIYum4QgDEQRSO3T/4QumzB0qMZEjD1LNV4AOR4NXjBYNGi2aSDoYS6r
 t6K7g46khEU1NjlobZ2A206HxygE6aXIM3oOAvAZoCdbnU9D6czeZ4pQFQzdhAfOwMwmPX9JR/H
 7dIzUsYIW3LYI5369+g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>

Add a DT overlay for CQM and CQS, to enable HDMI output when LT9611UXD
DSI-to-HDMI daughter card connected to PDISP1 DSI0 on carrier card.
LT9611UXD is connected through I2C4, with reset and interrupt connected
to tlmm GPIO76 and GPIO85.

Disable the default DSI0 panel dt nodes and enable LT9611UXD
bridge for HDMI output.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Signed-off-by: Vishnu Saini <vishnu.saini@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  6 ++
 .../boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso     | 90 ++++++++++++++++++++++
 2 files changed, 96 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4e714251d5e6..c8907e77c893 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -377,6 +377,12 @@ shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-ca
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
+
+shikra-cqm-evk-hdmi-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+shikra-cqs-evk-hdmi-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-cqs-evk-hdmi.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-hdmi.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-hdmi.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso
new file mode 100644
index 000000000000..a7b77114061a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-cqs-evk-hdmi.dtso
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	model = "Qualcomm Technologies, Inc. Shikra CQM/S EVK HDMI";
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector_out: endpoint {
+				remote-endpoint = <&hdmi_bridge_out>;
+			};
+		};
+	};
+};
+
+&i2c4 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	hdmi-bridge@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&lcd_bias>;
+		vdd-supply = <&pm4125_l15>;
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
+};
+
+&mdss_dsi0 {
+	panel@0 {
+		status = "disabled";
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&hdmi_bridge_in>;
+};
+
+&tlmm {
+	bridge_rst_pin: bridge-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	bridge_irq_pin: bridge-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.34.1

