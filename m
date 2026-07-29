Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E368A27AC4D
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785286869; cv=none; b=mZ6pBkyr239t9cxVYwIHcKZf3NlMOI2pSQytv44vEuYRPYJOSRiGDA1KhwKpJGgZrhPBnAyKfjEXduLXEIY1kTUW1xX1ZftSc/28NkvM2EFUa88oFBomMuHfdkT/EcSDZVL05+c5CzsyDtT+OHYkzwK+vKtQtZgPxXUfchQlVR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785286869; c=relaxed/simple;
	bh=uGSEZKT7Y6NasT5SOPTd6McBUVb63VIxP3j0MEEhQAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dcit4KMrNDAt6dE1sUlMqvYJtYvP2NtVaW1pfftEXplviah0Ib/unElg1nQsKN5n2ETaXQZ7GYS9Njm0KBE3OZLso57xNAmzAC81JG3txcxdsqP9JngO6oCMhmzVcbbQcgcYRy3QpWOMYe0hS+wvJLabge4u4wn1QsA57VnncF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SaWx612f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur07o/wp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SaWx612f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur07o/wp"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SL39th143085
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:01:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=D7RnimT9W69
	CRgzam7YBVMCG445pC1Ok7sMkhY57SXE=; b=SaWx612fO40lFqg0ruCT9dDESuT
	2rbv3+JYHelgu6hz8l4gg83qr/CWbTEYI9MG0KTCDTSLLnhqEr5EIsF9hNEoSI1/
	bcYTnBw3pzcLErPFj3hk5QSDhcE+nLd/r1dd5nbz6PHIhV0o4HuFIskpgWiXSzEO
	GchHa1yuX+S1qjhaXGiPEFIg4t4NP1jUx815VcNNbNF0Kd/WCmYU1KqJ1eCPlh4q
	BjCcppNhMbjpqpYHI3TOmPTIJKiJ8bT+jMPps5ydC0lhznW0r8yErH3t3zBpbvFj
	caECeM1iDpyHPmj0MNb6R8K8PTH6byJsV0WcdIMtfp0nhZv3zWvGqdlRnuA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq108sf75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 01:01:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89704da8c7so480885a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 18:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785286865; x=1785891665; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D7RnimT9W69CRgzam7YBVMCG445pC1Ok7sMkhY57SXE=;
        b=Ur07o/wpb66oMwe4QMm47S6js26kyXZMzTuDpCfgFGwuGevoAv/f6etaU0Gdevdb9S
         MIZrxeQMQRSGwl9XxF8Aqyp9FVU7/ymJkcbfsEsiLVMnvHRc35MLxES5O/yRstA7rsQp
         dJn4GjeJc/ESwoh0UFDlpWJU6MQ7YUeIv+Cczei5r/XdKoeI06YUXcnoX3sctFJdhXy+
         V1U7gPTuA02LRhGxkvor0NZ5HMjoqa8hgzWWwjYpAqnfuEUAg/E7wgopAyNVcb8abbCs
         H8UL0NWjQmhJDTMIfueY6V3oa2Ww9vA7lkca4jEubG+sJD95G+1EUQVNdfydX/H+90q3
         21ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785286865; x=1785891665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D7RnimT9W69CRgzam7YBVMCG445pC1Ok7sMkhY57SXE=;
        b=TO91WBi55DvgjEMH4ENGTZzL2mqrLnahDAa/1BGAnpONp2vB5RN5pfhex/DokNMpDu
         3I/AvsBkA15fXlfvG9PPUwybdhkx3WFcb7l6BA7ky1RC5BTcKjdnSUX8xq2AujnFFdcg
         1EG+R0K0zGjPyHO3+FgnpXo6ctxevKvAhH3j2IuOrgsusLs7Lkmg/i3/gp1/ecw5IiNp
         C1mt831xGLkAiJBdbx19bSD84Lg/O9q0XiwNhAqBOfWcZROnwLkaKxUb4OHEQEBLE8ud
         ZZ0/s0vzJHuuHaXFEndAEOlKKGl6JMx9dH3q1X9nWA2GkUQLUy2xPmlZwg+cGKRJXDHc
         1EzQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr05t+0lgwUFc5sx6m3ijx+qfcEM8+SyF03u+dxCo2Nk/r9H/Y9P52me2/TWAikV/XBuEh3OpVzek9OFLHs@vger.kernel.org
X-Gm-Message-State: AOJu0YyYDv9oaJnMLaHBklNcm5Uq5fQM2CKYMGaJTxf+wtyFDLl5tCHT
	VYrbn3xHPgrgC0mV/zXV3WHfbbWmK1t24+YN2j9pCd/inMmqyDuFKD2mNLI6FFB/7sOYdxVlDSq
	YEcZ9t2mVj0ujIAxF3OeR5fPsLbvOpSqQ8kFaMOYjkBblfIdyVqQqH37QXM+m1PIUxekz
X-Gm-Gg: AR+sD111n9NSGurYfSNb4Eljsdo9zJEa4fd7hu5UArigdKjoJ2GKUK21+C7RPCEvtsW
	V7rc7gQC3qCrNXg+Js57B4yg+mRQk2alOa3vXl++bZ7vaI03jKlxLysipheN5Jgp2Cc0kaujgbW
	15XOuawMce0G613H1jvMoQ/mX5rRauTXzAQzHB26Ao29gX1zPf/G4wkf4Bo5b/pf/dJ8tvoWnO4
	3gWvlVAsDmjcu3aa25TUXxwXk1YOT2hQMu5BPAqQKSHes8M9vYoOHYY5SrfaVH/83saAsyFgEVa
	aIryJpAHS/GlVOJCADp+PBiFE1/DJeHTZ8BDrD98phrAum3hqZohsL0ulPGlO1Oz1N3yMspq7Wp
	bqtpeKsAOewfpSg3bljYGFWx0i64Tf+RfpGYVOeLe8ZqIisJFg9fljhoZqhfV
X-Received: by 2002:a05:6a20:c90a:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3c8ba546272mr5437520637.42.1785286865208;
        Tue, 28 Jul 2026 18:01:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:c90a:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3c8ba546272mr5437480637.42.1785286864709;
        Tue, 28 Jul 2026 18:01:04 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b88e12sm3456696eec.11.2026.07.28.18.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 18:01:04 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v8 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Wed, 29 Jul 2026 09:00:21 +0800
Message-ID: <20260729010022.875799-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
References: <20260729010022.875799-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GfHHcEu0ZPjHXBSCemYTx14Duvrvnx7I
X-Authority-Analysis: v=2.4 cv=fufsol4f c=1 sm=1 tr=0 ts=6a6950d1 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=mTzsPlHQ6iguFW8dCWoA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: GfHHcEu0ZPjHXBSCemYTx14Duvrvnx7I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfXzfY1UdD7c17w
 jF4w7bQ3qCEVBo6q55ZauAw6tD80URHJdNBez/GtIPEI3RE567WRQo8j0HWUP2qXeMOshM0cxWL
 LI0A4b79dTLLFnhfCuGSezOQZFCI9FI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAwNSBTYWx0ZWRfX3rPPjohfbYiu
 QUNqbfNisWg72+eDxcFKl2ZN2pEMhf8bqCNCjEEaLVHdS9MzVRCM7HK+P+wA+AML+87Q+V9iStv
 9IduFtFQILF2fhHYj1o7wmUgo677osAui47E2BydIvjXYpbSYKyudhWWG2Z43D0E4uFRLjIBUQZ
 Ayon0VkR84Gt1s7C5fa11847kwxAw876SqQQ/4wnvSCrN3teHwuthM/nliacLmoZUDQoblDgUEG
 QJWQ9iNtwg5aq6UjKsIZZXEDiBzSl6rW2Qj6jOXcy2J7Ts0C5fMCpXIAdoUn0zne48rH5J2AhlW
 +0KJErFdXhGMNa+Ip80LEfF8MucWmcjWFhxjV2N4ZAncP3i8ZoGgtenD1SX9oxR3bzLr7MGxmdh
 95ZQvDPJjCTNKTDvI5QIc/KchCcRexfsv1clE+7793eMo7u1TF+NUaujz/9exAaIZbkRcoJX1p3
 bUEfnLkzJ3QwRdIdQ6g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_06,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290005

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board,
which is built on Nord GearVM variant.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/nord-ride.dts | 232 +++++++++++++++++++++++++
 2 files changed, 233 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index e05414290d8e..28bd17c1e2f2 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -159,6 +159,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/nord-ride.dts b/arch/arm64/boot/dts/qcom/nord-ride.dts
new file mode 100644
index 000000000000..1e9efe59c976
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride.dts
@@ -0,0 +1,232 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include "nord-gearvm.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8797P Ride";
+	compatible = "qcom,sa8797p-ride", "qcom,nord";
+
+	aliases {
+		serial0 = &uart15;
+		serial1 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	clocks {
+		xo_board_clk: xo-board-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <38400000>;
+			#clock-cells = <0>;
+		};
+
+		sleep_clk: sleep-clk {
+			compatible = "fixed-clock";
+			clock-frequency = <32000>;
+			#clock-cells = <0>;
+		};
+	};
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&thermal_zones {
+	pmic_kobra_thermal: pmic-a-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 3>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_0_thermal: pmic-e-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 4>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_1_thermal: pmic-f-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 5>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_2_thermal: pmic-g-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 6>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_3_thermal: pmic-h-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 7>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_4_thermal: pmic-i-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 8>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_5_thermal: pmic-j-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 9>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_6_thermal: pmic-k-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 10>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_7_thermal: pmic-l-die-thermal {
+		polling-delay-passive = <100>;
+		thermal-sensors = <&scmi23_sensor 11>;
+
+		trips {
+			trip0 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+		};
+	};
+
+	pmic_kai_ufs_thermal: ufs-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 0>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram0_thermal: sdram0-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 1>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+
+	pmic_kai_sdram1_thermal: sdram1-thermal {
+		polling-delay-passive = <0>;
+		thermal-sensors = <&scmi23_sensor 2>;
+
+		trips {
+			trip0 {
+				temperature = <105000>;
+				hysteresis = <5000>;
+				type = "passive";
+			};
+
+			trip1 {
+				temperature = <115000>;
+				hysteresis = <5000>;
+				type = "critical";
+			};
+		};
+	};
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart15 {
+	status = "okay";
+};
-- 
2.43.0

