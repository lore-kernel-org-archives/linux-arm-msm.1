Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795411411;
	b=4C26SxNcrkM4JFsDF5eNSp6MUGKAFWLZEM+rJiBS/MuJ6LHTr4I9+00chxtByuRvr/UZ
	 NdQ7b7k+RWFYeI7hVEas3Oya3Te/yisD8Z2HdmaNWikIqDXFbbKKy82SSbEDMeQ7cNQxx
	 EqYnfx2hn8w1ocDvGUW03zILRXDL1IhDsOVtYxU2Jk9jc9dIhEYmOXubRWu5RuuSYx9Tw
	 7pSHvOvVJ6oDJ6r8Q1Gdd7kxs/KBIX9/nNp/OHWBl1UrkQGJv4c9zdwBnxMdbaEyi8qxh
	 Wx1n7tc7xP9Xz/7Y5VcVYFvgVZCDwLoivyoabmmZJBHI2dzz7SwudiOvOtefEnoRNSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795411411;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=9w0kS6xH+7QM2gGLDTZwoAlJkPaDu+LTByXnQi6L+R0=;
	b=PZn4yt0R2e08FqSk7IHjAIxlEslmrW2FbdITbqkjHz9qLmFaITLiL94E+H6G69s58M9w
	 kX26KFFwHMHj/EXfK2mngiVcS8CK34H5b/iYBo0HVZwVxWZX+CFEAOlZql1uP6ok/ND/b
	 WvlsI6RcUAXKePxBqNmLpihDSoEu64rsJPmDTQli6PkOD+6TKuSCMlescjalGZpIebJrz
	 4D/oP1aA2wm/vPIXbPF+XoSdjcGR/Ei60A1lj2/AeL0xVO8dWZY3MpuZcaE7RsAvFkzn1
	 JhVl2em/QxCzpGAkZh9qdBPN9ncpNcR/Z2VxoAUgJajp9LTN7KNe5iDm5ztbWbt4vpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YS40pk6U;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtTDn0Y+;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A997606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:23:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A997606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YS40pk6U;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jtTDn0Y+
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN51Jes3780917
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:23:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9w0kS6xH+7QM2gGLDTZwoA
	lJkPaDu+LTByXnQi6L+R0=; b=YS40pk6Uh73JBHIBwFcjH05ybkb/IZVv2AuuIo
	KvrkqGb7CO+zqW16k68S6KZMg4nQ0RbUQ04+funhF/FyvYTzfP3zo3lssfe/sppO
	BWGqzf32ZiIBebcx45G8Gacdoht9JkLeQLFmZ9Z/wnBTunJOI+y2QiSM8V5m3SgX
	hQpwze3uhJlHfF0ivxdao/qiIzu38cD+UlaND25+c8jeDXK1SQdapH+LjpW2zHHO
	kuTXSe8HUjApk52t9RpO3SVh8Kr/raSwzDqx9UosK2dBXIhS/yYl9p3TgeKMtqxu
	zUlM4QWlPsVVHKUGk7npJiGJqEAlY2Tm/PaINybGb63YOpPA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j34fk54cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:23:30 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8b5e3b5daffso3199668b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Nov 2026 21:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795411410; x=1796016210; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=9w0kS6xH+7QM2gGLDTZwoAlJkPaDu+LTByXnQi6L+R0=;
        b=jtTDn0Y+CgUh+L2u8lSIpKGYpHOxI2yWHg+wjyfqJRdX0CLMZvl3u3HMBD4fHyMUG2
         JY1UfznrROZOp/n8C45xeNAimRmQQhi1hJA/heAguNHwIa7UsTtFJoWxxGalumAVgskm
         9Iw3/xgkGI2VVHPQP3AZHtJXHoplkaaiWMjWZB4PFBTJRrJ/QcineuLQDaQKs5YRCdp/
         oXHKDFTpxah92Hxxke+DoMcF5SBy/2+8ge5EPSgbXkPScJJ11rBkkGTZeT05a/wUaQ9T
         fHcWSmCn8kCXxeYVsufPSWK+hZIkwWT+fMzwKNM+Hg3hiy6QGFP83HqAV1rhzZDIgTeI
         A+8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795411410; x=1796016210;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=9w0kS6xH+7QM2gGLDTZwoAlJkPaDu+LTByXnQi6L+R0=;
        b=lfH5NSvu2u0Tv91QD0XX0O7hb2O1xmEgEQVQB9RM+OBgSblCK2wXOoQFUtL6UpHUro
         QkibpssEMDifwJ+RUhtsDLxfW2HpdObHOMJcUkcsIKcN12ledPubltNTfSsOTguCUVR2
         iny/g8pdJvo3eYjGYpu1gH7ZBuBIKvIwLwVqO7x3E224tbQfsTuAMwWBA6iStuFqLeuX
         6NnqShglERnE/cECwsLE25Nb09uD4ub2dCueM7wnxVhiM+9BJBr4ZEA5aabOkUnwTnpd
         Tm8jU4M8PIyGuBp4O3qFs3ilj2RK1Ftl0y8kXmY8uGkiZXoc8c112wPeYhCG1hfOmbJS
         KIhA==
X-Gm-Message-State: APuU4Z+e3tTYa+YD4pS1sYKFOu/9OdB2e2R4IAIKRursF2xZ7gusZ0AF
	lsBI3ICHxWI9x/15QuaE7EpChrew6twsVx6+8hlc2wzglC0UiVxWCODgJa/rRmAWA7l+pRDEwIe
	aUhvVJoObcsZJ8jsdoxo0nBshhI6AIL31BYpD0qcBrs2cjJITrcoFt9qE2POSps0ktz3JsNEvyx
	qp
X-Gm-Gg: AZFdTZcvi2Oh5tDCkZ82wm4+4lEssoYc8KXe1JUwE2o6h+/vGjiNs3aW9RG1VmJN+tk
	aCXTeHtqyVoilXd6chM8eb2AXEu036xA/6KnXW11oZ4sgSbjXYZuaxbHfa2+/+7hODfZEIZyinc
	Jh7pHLlnRA2azQJSWGdCN/MJZQx0InKLAKzPSID7nRaQXHY/LU7Gj8gvS1Bke2PvNLgm0/wQt44
	ZqzIzPkoSS57XitY9xcslB1rwQ6YquU22IJtGMCw/TzSZvxTidHJGrwoJuumkiGSv9NO9HpK9O6
	ePwTt/mfkAemjT9IS8v4eN7eRPT1ma9UAntFiZpMvNKmYGILCXdxeWDvmM/mv9WIQoHeqRmoG4J
	bS6P1XYNwsyQ0564OvAWOohSizA19LEnAbVwevcE39vz4ZaE3996SC4h4mFyXCMiok4XARDxn2o
	Sw97GDBw0xB7Y=
X-Received: by 2002:a05:6372:a810:b0:3e0:c5c9:d55e with SMTP id adf61e73a8af0-4014e45acd4mr8410425637.63.1795411409642;
        Sun, 22 Nov 2026 21:23:29 -0800 (PST)
X-Received: by 2002:a05:6372:a810:b0:3e0:c5c9:d55e with SMTP id adf61e73a8af0-4014e45acd4mr8410411637.63.1795411409157;
        Sun, 22 Nov 2026 21:23:29 -0800 (PST)
Received: from hu-praspras-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0285c3sm4529722a12.20.2026.11.22.21.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:23:28 -0800 (PST)
From: Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:53:09 +0530
Subject: [PATCH v3] arm64: dts: qcom: monza: add Precision AD HAT overlay
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
Message-Id: <20261123-ventuno-q-precision-hat-v3-1-fb96fd6b7887@qti.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL3NA2sC/yWMSw6EIBAFr2J6bSciOn6uYmYB2KPtAhXQTGK8u
 6jLyntVB3hyTB7a5ABHO3uebQSZJmBGZQdC7iNDnuUfIUSNO9mw2RlXXByZ54+jCqgqoXVZFo2
 UBUQ7rj/+P+Xu+7Lf9EQm3Dk4zwsTf0ilewAAAA==
X-Change-ID: 20261118-ventuno-q-precision-hat-a71bb5549334
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795411405; l=2436;
 i=praspras@qti.qualcomm.com; h=from:subject:message-id;
 bh=kX5jXM8Wi8BGEcrpSf3GrKxJAMLU+T6byv8vV8CjzZc=;
 b=HS+Tx6C7ukcclAE8ELmUGgMa0uHqtIZgYfaO9sXEUELAoercDpCfQuQbIAvshAt8YCgMaQWjY
 /ogFhjO0gwLBhjW/FapfW3EhO/u6E/dcC2TcbJqF6EcF0SebuLllIFK
X-Developer-Key: i=praspras@qti.qualcomm.com; a=ed25519;
 pk=/ijBZ6n56uOR5csC/Wwn44VzFw78aZoHlepuCmrOY2g=
X-Proofpoint-ORIG-GUID: K5eFLNAewfeatBZchzAMRhFC-iQoJXk4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAyMSBTYWx0ZWRfXzHHl30UkAw6I
 J0bt5uAC37+r+wppa10FHuorVFaXXinQIMODV9Njmahsu4St6msu2zqeiJymX3kJh7viGaBKbm1
 R7S8HX8+L4cfgU+/c0XDMjIcCWzFExFZFS7R+AyN+YbAJ8x0uHG7oNF9Mr9g77Xs0WgVpHXiVyk
 JIrFGZ+zEAF+IyTlHaI5Ct0cPSB2AW++0Gxm74V+dH8OnuqW1tkcTIvg9Y5Lsv3d7Q657bLti4u
 EOe/Mik2ZeQksX18dU2s5WafvlKuvrB5NefVcWrou6Fc4woZxhvY2fDlLgNfHBRHouj3zVGQvdV
 9Fze5eNgPFPH1numFzvjE0b6KXLY28oLzvlG93gVvBZFzGghJRGUH2WRGt4yhRrObJYjX1/8HNT
 AvaIwLG4vYt/NKUftJhK10FWkk9HwzkVq0Hu9as6d8aLG4/KX/2MoZJgm0OGc75kIsH5sSvMMsH
 NSAzE0a763XRx1IRGQA==
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6b03cdd2 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=txfNvoKIHXZbme2c1SsA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAyMSBTYWx0ZWRfX0BXA1v92Mvyq
 n/QDnZqIiMGNpWHR1NTcoSNML7hdcrGap0WyJo4J7UNocaIv7lma34tj+RF9y9hLTXfEU9RefK3
 C0dR6yBg1lVc0HRVkK571YxAWKBy5yM=
X-Proofpoint-GUID: K5eFLNAewfeatBZchzAMRhFC-iQoJXk4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_01,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230021

Add a device tree overlay for the Waveshare High-Precision AD HAT,
based on the ADS1263, connected to the Monza 40-pin JHAT connector.

Configure SPI3 chip select 0 with TLMM GPIO90 as an active-low chip
select. Set the maximum SPI clock frequency to 8 MHz and select SPI
mode 1 for communication with the HAT through spidev.

Signed-off-by: Prashanth Reddy Baddam <prashanth.baddam@oss.qualcomm.com>
---
- Added overlay build entry and base DTB bundle in arch/arm64/boot/dts/qcom/Makefile.
---
 arch/arm64/boot/dts/qcom/Makefile                  |  3 +++
 .../qcom/monaco-arduino-monza-precision-hat.dtso   | 24 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 19310879349d..bdc455cfb388 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -93,6 +93,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= monaco-arduino-monza-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-ac-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk.dtb
 
+monaco-arduino-monza-precision-hat-dtbs := monaco-arduino-monza.dtb monaco-arduino-monza-precision-hat.dtbo
+dtb-$(CONFIG_ARCH_QCOM) += monaco-arduino-monza-precision-hat.dtb
+
 monaco-evk-camera-imx577-dtbs	:= monaco-evk.dtb monaco-evk-camera-imx577.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= monaco-evk-camera-imx577.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso
new file mode 100644
index 000000000000..e50b0c956057
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-precision-hat.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * Device tree overlay for the Waveshare High-Precision AD HAT (ADS1263)
+ * connected to the Monza 40-pin JHAT connector.
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&spi3 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+	spidev@0 {
+		compatible = "rohm,dh2228fv";
+		reg = <0>;
+		spi-max-frequency = <8000000>;
+		spi-cpha;
+	};
+};

---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-ventuno-q-precision-hat-a71bb5549334

Best regards,
--  
Prashanth Reddy Baddam <praspras@qti.qualcomm.com>

