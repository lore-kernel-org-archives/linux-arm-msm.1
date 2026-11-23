Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411041;
	b=Wb3EjD6N6B1lToIfNBALNCf3Z5NhKukyOJAilCE0Yn8nqk8wlXJB3czbv4i+tLyoWsVO
	 50c6bCmaLyhfGxZM0GG6Fifb9IIcalSEiC9eUHAVHtyd8tU/5ggC81ZIt/gadpbxDuIel
	 1/RalZ5CybqnUYcAnl69ETXaFQ7dVTFDi9uCLvorv+CBKZsO6Z8QH3tDdO90sITFSZbP+
	 lZhpdv82qbpYHOPoThhhxQQUiAegurg/HPPZq0AMWSwP81nfOGDCLHal6C3xBWHvVXiJj
	 D4Z/LwQle7w9sTl/WYmtFRLGB9bdAPk2EWBU/PdFKKgOLQQFn5pVHp2QVxaG/3dCQLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:X-Google-Original-From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PZJd9GAX26K2WgxidRbnNogEe1hHvVxBXT9pvp779Zs=;
	b=WeciNNZRbMBX7zrEq8bKOr7W2G7/AkhU5pGFgZTy482x8LHmTlfFxVZdVenNxmJGp0qe
	 YCxJaerTdgi4j8d7Nnh4Kpc0nL7Nxz0TLf8RhUYQscqedpUvw/xONyzELgkE74dy1jQQm
	 iX2qxgdWodaQ7kezFrlmAP6RLKuuB4KBqwjDgjJ4nQThyDOow9VsyzP5pnO5HV/cSCxZK
	 yiwK9LB0hmIvFuc8YazU+KdSpmTtTsNKG/B4F4+UruOdJVNZuDy9vd3iTUSudTTW61jyY
	 g708wyCJNtTN6IrvijHkZJLO3hre+gqXuhOZ4kZXj+IBIf3FDKmiY8Z4ewtjlDFftBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RMyUVp9z;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZq8Dnar;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394B9606A31F
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 394B9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RMyUVp9z;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KZq8Dnar
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN52ADB2925393
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PZJd9GAX26K2WgxidRbnNo
	gEe1hHvVxBXT9pvp779Zs=; b=RMyUVp9zhhoGEJTPSYcsIP/JIycEl7UOU7eSp7
	bTzIs915gTSOqD9uMA0KvRqaJgQFxY/Dd3NB0YvE2J3AlvaUdx0spfla3c5NRCTv
	BMVxEwbttPrEUnzOh7ctXTXAeSdb6rTNyXyej48ekVuVfRxQa8maPtI19Z2ulIpp
	ja9wo0I1Oqi/v7ALz77ohMs5BqiSYdlNuBUyDORS2nBaWhF8Qlk4qeyDExBIdRsQ
	IvU+RfpwL9oMfnZgll0QFhlvgdlgu8ixdfdnWptxCaFqUoK4KwDSsUDrzA5JRj5V
	OVDbqVfmEzAJNtwg373PUo0IC5uoMu2RY7UUxyEPO1AyPHag==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4evsg1wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:17:20 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cde6bb2c56dso1623635a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 21:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795411039; x=1796015839; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=PZJd9GAX26K2WgxidRbnNogEe1hHvVxBXT9pvp779Zs=;
        b=KZq8Dnarh9XtSoDaH8/d3SO5l5eeO7/89rIw6vV6dPPcYKhkbZdR3vkjMNMpDiOpRZ
         p2QXzbY97M1J2VN0Wi+qhfS/t4Yy1gNrEzcjQ+wDjX3zFcnVdejQpbayeb6UMEgpr/OX
         92cZMIzUHkaPC+FKv0noz5qta9w1bf3zjG61FS6/Y+YK8KlE0mFp32Ke5NLzybM/kLD/
         vXTBMgQU4FuFael+ZvnmYdXAd7HL7q8wvCC/J2VnmyGNt7tqUbVSTZ5zjZM6jUyLJRpY
         emaFUlrQoFMZxHkqDiAZap5vT7JT1VLuuC1Li68NIvrJ2TWZp8N3TQHTybtSA3UuSdn7
         Q24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411039; x=1796015839;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PZJd9GAX26K2WgxidRbnNogEe1hHvVxBXT9pvp779Zs=;
        b=G2PKT2IO6cJ4iNcgOzlcTAj/Se/MO1CZfG8+rwTlzQRKDGdEbYdq104bc57zvA+/z+
         9n8eADdspa6diHunQf4Efe0dtyFovgdv5V8cxYEGuIGGtU3jlw3srxJB0TIRegF4upN5
         FHwdEwuQX4rC6jA3tLjq12e3tZOiEN9Y0lt3hK5pqjsiGncW8mgcIvn6OZk5hroWiW8i
         gks0Y80OrrAhN9+wTfjdQtZBYGySbvbFrEqWXQU+9l+Q84uvIYfv72NtqhsNY/RX1FDa
         i0W7ug/PfZEG9MzBjsgNe+ba4HRe0jxx1hQXQ4OV/KNW86pRuQlQFP3B1ddcFUbC1ST5
         MNNw==
X-Gm-Message-State: APuU4Z+v1ipl0zMj9rAJzH0rOgmoIF+Lmnq9btRkYc3sbhCJjvBVHPwc
	Na+hNCY1qWG6d71xjj/d6n6JJHcPLZHxpREC6nvzRnSIzZqF7MwY8sG997fWhkS8M/8B3SPjCi/
	RIa2jvofxSWhvgnGiY+caV+dJk7FWXTzlN5MWLJmGR7kU7W9Tfzy0KG2G87gBh8g8ujhkFnvsz9
	kX
X-Gm-Gg: AZFdTZfuyS+UpWbXoYICdHnNN6nq1By2D7C1I6tGwyhxE5+vCz61ehSesxYPnSAjHJP
	My+IWi5JXZAtsQqj9ZFRuTNeHPpgimZQ69F4plnGfpPQdlCIZ95R55bJI8NdWv6fGDhAEO4iH5R
	QkC9pDU+P6zsjnSeHxW09y6fkCjsoP4/qpL1frhg2Vk9Zip1+T//Ieh6EKr6X8g+pk6uYa+fVMy
	WvXopSyhNMDjVkUfSYf2XYrljIXsR7BICbslmv20pkMVPeqpyjJ14bzC0dAbeaSav9J6JM+D2sQ
	Yh+28X6OBckMAyhtD8pwudkD5liNa8L43NvFkYslB0ibwKh9Z6XcWAgMS4M7Xx3QNMCHE/j+bgX
	Ke4E7ZkZL6m9iwIayt/rjGffZqnwiDEHUq/W8eHCM1rz/VfjNley8v2Q79/KyeFi85xsNUG7a/S
	oo0JlzL9EhEPVzY3VKJD0ThxE7jFc1Sb7NM5V7/nda6w==
X-Received: by 2002:a17:90b:4fd1:b0:3b3:c00e:56a7 with SMTP id 98e67ed59e1d1-3b41caecd5fmr8600857a91.42.1795411038928;
        Sun, 22 Nov 2026 21:17:18 -0800 (PST)
X-Received: by 2002:a17:90b:4fd1:b0:3b3:c00e:56a7 with SMTP id 98e67ed59e1d1-3b41caecd5fmr8600837a91.42.1795411038392;
        Sun, 22 Nov 2026 21:17:18 -0800 (PST)
Received: from hu-praspras-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm17662143a91.3.2026.11.22.21.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:17:18 -0800 (PST)
From: prashanth.baddam@oss.qualcomm.com
X-Google-Original-From: "Prashanth reddy Baddam prashanth.baddam"@oss.qualcomm.com
Date: Mon, 23 Nov 2026 10:46:52 +0530
Subject: [PATCH v2] arm64: dts: qcom: monza: add Automation HAT overlay
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
Message-Id: <20261123-automation-hat-v2-1-bdef1a18b858@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAEPMA2sC/yXM2wpAQBSF4VfRvjZlNk14FbkYY2Mrh+YgJe9uc
 PnVWv8FjiyTgzq5wNLBjrc1AtMEzKTXkQT30YAZKillJXTw26J9nIlJe2EwJyVVVWBfQjztlgY
 +v2DT/nahm8n4twL3/QD4YL4+cgAAAA==
X-Change-ID: 20261119-automation-hat-c23e616942d8
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795411035; l=2901;
 i=praspras@qti.qualcomm.com; s=20261120; h=from:subject:message-id;
 bh=sVf/TDuuWWItJqSedpjDcUvQopCwcgGVYxXyeE+Sqtw=;
 b=V7KfCTemPr3/b7642eaadIvgpZM5Fx0uSjKU0I1IJ0fY3GQiPp5U0szEKMDEBeWsWU66VqJqE
 wRBFu7pVWzVBZEz/XCRcQ19CoPti1fi8VI/VDjkguJvd96LyD8TI/zj
X-Developer-Key: i=praspras@qti.qualcomm.com; a=ed25519;
 pk=/ijBZ6n56uOR5csC/Wwn44VzFw78aZoHlepuCmrOY2g=
X-Authority-Analysis: v=2.4 cv=AL9GXjHq c=1 sm=1 tr=0 ts=6b03cc60 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HU-5xPNkCUtSlFA4ZgkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: sEASRwkQjmLJE5IbQ21lE0oseEGZ6Nn7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfX0HgYuJYEO+Rr
 4kMzZfcl8exDlIDeCAoKfcw+IcppIti684/qXr0QS1B10F6+280dbhUhxHz9kY5jRG78F3QPov1
 hEiydiR6Rf+pRSlCTQHkCLbd2Zrt1OqeMNdohGPef7F/JABSjjdfoBJ2mO/KakzuSEdUNfWwGYe
 CcchX+SzN+91HTEtJn+cY1SVc6AXKuG7gdUH4I4KITQUDu51XOPv70xli4gMVcW0OwI4rbCLJZD
 cxVJORYhUQKvNST+fjE10HDnRklshhN6UzZEKmM/wY+/l4PrLrMNO2/dVa4zlUbhQkTNkTGONdL
 Jjk7AYGqEsrz+Q9hjyLz7lTbrCsNlhLfjoEtvCdvgpo3HTxvtrWpOl3zy7Y5nkxmaJxMZVdm0Ka
 8BtkDUBcOErm/sqo3Jb2IC3bCy3pZJ+TtnXulDdF31/pQoQF6SehQ2h5I7Tau81BdyPj8XFldJn
 o1CGIAzSsws+QpShGjw==
X-Proofpoint-GUID: sEASRwkQjmLJE5IbQ21lE0oseEGZ6Nn7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMCBTYWx0ZWRfX3ZhVEemVYCQa
 Jlx3qfFR6n0REo6j3idwE0zUhKPnyzn+9Nn2PzmGW0DoOY0L8GKE8ZMSa3Cre8tAbKUtVk0nDCM
 Hin6ZHhAN52odt3oDHXmsVbPOGzCaj4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230020

From: Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>

Add a device tree overlay for the Pimoroni Automation HAT
connected through the Monza 40-pin JHAT connector.

Configure the ADS1015 ADC and SN3218 LED controller on I2C0.

Add the overlay to the Makefile so the Automation HAT
DTB is built together with the Monza base DTB.

Signed-off-by: Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 ++
 .../qcom/monaco-arduino-monza-automation-hat.dtso  | 62 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..b60abdd392ea 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -96,6 +96,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
 
+monaco-arduino-monza-automation-hat-dtbs := monaco-arduino-monza.dtb monaco-arduino-monza-automation-hat.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-arduino-monza-automation-hat.dtb
+
 monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 
 monaco-ac-evk-ifp-mezzanine-dtbs	:= monaco-ac-evk.dtb monaco-evk-ifp-mezzanine.dtbo
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-automation-hat.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-automation-hat.dtso
new file mode 100644
index 000000000000..3c35b76f9c2f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-automation-hat.dtso
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Device tree overlay for the Pimoroni Automation HAT connected to the
+ * Monza 40-pin JHAT connector.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&i2c0 {
+	clock-frequency = <400000>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	automation_hat_adc: adc@48 {
+		compatible = "ti,ads1015";
+		reg = <0x48>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		channel@4 {
+			reg = <4>;
+			ti,gain = <1>;
+		};
+
+		channel@5 {
+			reg = <5>;
+			ti,gain = <1>;
+		};
+
+		channel@6 {
+			reg = <6>;
+			ti,gain = <1>;
+		};
+	};
+
+	automation_hat_leds: led-controller@54 {
+		compatible = "si-en,sn3218";
+		reg = <0x54>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		led@16 {
+			reg = <16>;
+			label = "automation-hat:red:warn";
+		};
+
+		led@17 {
+			reg = <17>;
+			label = "automation-hat:green:comms";
+		};
+
+		led@18 {
+			reg = <18>;
+			label = "automation-hat:blue:power";
+		};
+	};
+};

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261119-automation-hat-c23e616942d8

Best regards,
--  
Prashanth Reddy Baddam <praspras@qti.qualcomm.com>

