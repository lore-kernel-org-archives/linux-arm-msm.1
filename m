Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800213F3260
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 06:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788762856; cv=none; b=Y7TzNRKfrJziX3/e/qTJ4+k11PchgC1pljKHrss7WygDLBb+3PKF1E+Q+fKy/yVPXmLoKu1mxNTCjCDK8rM7MIdgvKCPTY2KNAU6hpQBSsam3+UQwzcPt1pLvVjrpbLUNpk1nDEsO+WQm8sOBFKBk7O44+Jl/cP/yrYYMgYIrH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788762856; c=relaxed/simple;
	bh=8N7TY4Wx00YA/qc/Yzv+tudh7jh85F9onYb97CA49Wg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sShUfiA7KDx+vLbxtZcFo03Kq4tIpJbOOGSq9T86n8LD0LTjx2dPFnPRyhQXG4NsDfcdr1JdORvCKtWo6rQSRRXxGJ4dQqd58UUaoafrCwCnjoWTqg3QHiUIHkKh32w7rECpeeLm4SuvpawPBnncysBAOJEGQBfo43AhkoxquvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T0M99GLf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W3+phLI7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T0M99GLf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W3+phLI7"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873lNll2917212
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 06:34:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=; b=T0M99GLf/XfQe6LT
	GBWp39Ka4yPQ8snHcuE8oVAitfCAaCzVhuxtcT3dylkbl0eaf8VQ1BOGohLVI3oq
	XJH4i26uxQPfN2zZ8ekMc0jrQ1yAfmbir9gasHQnXWJ+M29xNQ5MmptMVnIwjgfx
	GjWLMKDYzzswvmyKSHM3ccoNmN3+U7jbvncrxvhNq7I2RuNwOytclKPY8hqjiNeK
	e5IrSgkdy+C8L2MpOZvpq+1BfouCQZKVIrudYKtM9WW1wGUJ5Gz58AfrqI+HFhrt
	frUzbc+DGFcCvriREK1R0RfunUO8gq5euBxq3eXQL4DguWvyL73gAsdkGtpM8aZU
	Iq6lRA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghnmj0gu8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:34:12 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38ec0f510a9so6106339a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Sep 2026 23:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788762851; x=1789367651; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=;
        b=W3+phLI7KNLFhZ4PPoCS588wr5ERXx9RH6d5XaaaO3ZcQruxKrU2XbfabNplmx9NIj
         TBx2M3xUtBaPa6CJ2D8iGf7FkxDAcHOf3Pccj30Dzwfe4UQt1pMyyp0jP6ER2YhWGOxZ
         tlmXHpiUReYPmBRTKQ04XfstXs/l/h2nqh3QeUVCgFY2VpznPfHL8Kr0bJvqIB8n7sFA
         BVB5aIFLrNq2pE9Mn57GWVIxoa25BiF3g5XWgU1Cp9XFQbPYLla67UA/Z9yvXXFJpReA
         qUgTocW3XwxXpWXbk4Mc0+FUt/mBgYTkszrYjCsushhi5YWn6NmO+mhXBTIWKCQRqi5X
         8YVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788762851; x=1789367651;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WASUx8wqkzAjaBL+GRpEgQ7y32IiKrNjX6OK4Rklm50=;
        b=WyJ6vfV8Ahe1Je/YI7liITOIo20uynLz3EZcQZw5Os52ZCuHwUBg99415Z3ZIR3frH
         a0uHUkLWGcPX14nwq2Vy+j+fhpvn1DXsiBTqT/pPuUi+rinC15tbvCFVYZnkBDrsQqHl
         yc2ageUlZos+H5L9fwBA/OuG/CI//HF28PcB6BWRfZpLJoAWzqsd7yxh1/nxaFOqzChd
         wvIs4ZNhQBHwu6KHhyeK5I0Ozxhly32Yx2dtYtffGdXtFEu8v3NNNcs9iTu/T1UXc18s
         yt7No10KHlxklUIxeL9RwvsDzBgLFrRrqnfGUgpEOPXrDdGqqMXiOyLeofccMUt++cCH
         8EIg==
X-Gm-Message-State: AFuF++maaouHUFrjKvShw9t/uSAx87xJZvVtcmZZQskpbpbXACIbh/YQ
	dDlsXyunsxmw2B6kYLbFkKvrG9ieEnuOWz8iiuzEnYwVEDy0iZqv8mlHhAJMHUyaIC7mejVsOu8
	xfG44RE/B6yqAKel3iGaCwh4xUXQCOMxhHEr9R3oUqfEcfP8WAj+VG6czGILjSji34MCr
X-Gm-Gg: AYBFou05GNrV7MVZmCgOKLS7Ol42wU2SQMICGjeYi4msZHbjs60/A+igYqEwZayvBG5
	Gz8sGx7BQyo372fhWjh0hSniuGVl0Hz0KmX5vqZM9dhJU/TRaN+5nBynPz1KhHxr6IgZIc07ARC
	m5t+9qGMXska5qf+B+NvIXGsjuqcb3XhGWwIhQhFjwRRzra4O/jSSPG+9bQKtMC5yCgEDbnr6ZU
	7j3HjFIaK7jxDZuVr3roVy1Od/1JOlwMf2eCzYGfqgu+Gemft/jEYnFf6YMz0vBrZS27HAnt6Os
	7njBdvwiLRMSOUGV/0D6e2ixwhtzLWa/DDJpbfCQiAQ6VJTppZOrqr0uPbAC4BswCBACH1rT6or
	0dJU6QxJVQmSEdMexXs4VljwhEma6oNCET1V8
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39b84cce5a8mr368788a91.14.1788762851491;
        Sun, 06 Sep 2026 23:34:11 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:396:4cbf:45a2 with SMTP id 98e67ed59e1d1-39b84cce5a8mr368708a91.14.1788762851034;
        Sun, 06 Sep 2026 23:34:11 -0700 (PDT)
Received: from hu-ssmaurya-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33808be8fb2sm2440549eec.14.2026.09.06.23.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:34:10 -0700 (PDT)
From: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 12:03:53 +0530
Subject: [PATCH v2 1/2] arm64: dts: qcom: monaco-evk: Add Raspberry Pi
 7-inch DSI panel overlay
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-rpi_dts_overlay-v2-1-a4989322ce00@oss.qualcomm.com>
References: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
In-Reply-To: <20260907-rpi_dts_overlay-v2-0-a4989322ce00@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Shashank Maurya <shashank.maurya@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788762840; l=3148;
 i=shashank.maurya@oss.qualcomm.com; s=20260828; h=from:subject:message-id;
 bh=8N7TY4Wx00YA/qc/Yzv+tudh7jh85F9onYb97CA49Wg=;
 b=G7W8n/gqGUYM6VYeoFH5gl8G9XCPhuP8IzLkJj543T04lV4BW2rrUIVQdyBAfSkG8Q7WLGnY0
 Bi4dMbeXCxEBr1zkZg2WLV65vntK2SOczXvRxl84nbjQ5O8ptlpo6l5
X-Developer-Key: i=shashank.maurya@oss.qualcomm.com; a=ed25519;
 pk=xld72d+QYBwDMDcn3+QLCb5AUsj/D0j8klGIuxWd860=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX+SEdRD2SAiyF
 KS2WlGzaM37SD/qug5xDsQrS2vHomSg5yglmV0CeGlXFtbJOSSErz3fIqV1YsTzuOlHM7afE4zW
 bVh93rr6bmWfkcxSYX+18CLR4TRUnPu0saVNPgSTlu2ACTmMVO0EIvbPxhgpFl+TAk+wekiGT2r
 YB6o5ZmG2jQ7kT78NClSQ/7GSrYyUr7kI8B833kb6Wq0ub/9MdRAhcg2r8qRDoiNKQmSsMM3S/N
 trRn16HsyrCi062bqspLCkkE3c8cNYPgFXaz7j7wIJ1HJQxKJR8R1I9zXSXUTagj0+8B0cYPsHz
 X5GHVFsnWLA02BUEr4qS68m8JNwOm5P0Ab/u4NGc3IiNStLFz1rFzbiWU9QjLwzkjtfI6dQ40xs
 ZSxSY0JN6NQRMCNyl3HGxfGWzoZ4ABCXgCwKJ6hX/MwNix3zSBMibSeSx1hXTaCdTt8K2mhSRc1
 cKLs3XLTYkvvttlB11A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2OCBTYWx0ZWRfX4swMt8A3cLuY
 obLZyLT0o1waIshTtEO9ZSb8kJyS32Yx3uR0ONmemPr/Xrn355kK2LJCoEHCAtrjUThcF5UGd/+
 1zREIUsjBfePSEDBiw0mi9tlVP8LuJg=
X-Proofpoint-ORIG-GUID: HCGdqXT2ENqbxO6kzB80QuL1cZqsTVjB
X-Proofpoint-GUID: HCGdqXT2ENqbxO6kzB80QuL1cZqsTVjB
X-Authority-Analysis: v=2.4 cv=LZYMLDfi c=1 sm=1 tr=0 ts=6a9e5ae4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=eOe13yjVLI-PHPVp4M4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070068

Add a DT overlay for the Raspberry Pi 7" DSI touchscreen panel on
Monaco EVK, using mdss_dsi0 with 2 data lanes and the panel MCU on
I2C8.

Signed-off-by: Shashank Maurya <shashank.maurya@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso | 82 ++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..38554195fc98 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -71,6 +71,8 @@ monaco-evk-el2-dtbs := monaco-evk.dtb monaco-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-el2.dtb
 monaco-evk-ifp-mezzanine-dtbs	:= monaco-evk.dtb monaco-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-ifp-mezzanine.dtb
+monaco-evk-raspberrypi-dsi-7inch-dtbs	:= monaco-evk.dtb monaco-evk-raspberrypi-dsi-7inch.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-raspberrypi-dsi-7inch.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8216-samsung-fortuna3g.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-acer-a1-724.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8916-alcatel-idol347.dtb
diff --git a/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso b/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso
new file mode 100644
index 000000000000..f27b5a4a6093
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-evk-raspberrypi-dsi-7inch.dtso
@@ -0,0 +1,82 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	display_bl: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&reg_dsi_touch>;
+		pwms = <&reg_backlight 0 50000 0>;
+	};
+
+	reg_dsi_touch: regulator-touch {
+		compatible = "regulator-fixed";
+		regulator-name = "rpi-touch";
+		regulator-min-microvolt = <5500000>;
+		regulator-max-microvolt = <5500000>;
+		gpio = <&expander3 5 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+};
+
+&i2c8 {
+	qcom,load-firmware;
+	qcom,xfer-mode = <1>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	reg_backlight: reg_backlight@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+
+		vcc-supply = <&reg_dsi_touch>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+	};
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l1c>;
+
+	status = "okay";
+
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch";
+		reg = <0>;
+
+		reset-gpios = <&reg_backlight 0 GPIO_ACTIVE_LOW>;
+		power-supply = <&reg_dsi_touch>;
+		iovcc-supply = <&reg_dsi_touch>;
+		backlight = <&display_bl>;
+
+		port {
+			panel0_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&panel0_in>;
+	data-lanes = <0 1>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};

-- 
2.34.1

