Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C7543BE627
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784608846; cv=none; b=NJ1NIpxDw1BSIutFK4zr9/+DV+mALmshIOR/x76e9vdBGNHMKr0sBsLCX6XVoJnFmzky2EECMV7VvOVkfrDuJsHkmZ/uEMpKaaZgi4+GXA1P4g93u4UgAmZ9eePomsqGpRjuEUe4pt0wE+NcFOGUAEg1bvUxr/u32YHJsnVxkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784608846; c=relaxed/simple;
	bh=L1m5nia9DXJ28o5OdFdYMNXCX4GSjdaprqoruP0tcU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fI0bEylhG1AWApzAPoYg8KinYHBuqZ52jnpkiymjjk2leYgqKSNb/ZdhMRsICep0D7fviZJu/feuMhhNRIclI72DkRHR51rZ2/xVQAm4jcOCsLK9F9Ni0k2AgQCxaqVgugyusNA8FCsMuIPTG1m9DGvt+QYu3wSBAp/GDFAPSBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjohUfpT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AKg30LV3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjohUfpT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AKg30LV3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L447AL534581
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:40:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OLIAXWfCpmH
	FUwa8nw4Mj+/QbM8l/OZNREotv8y2c6g=; b=TjohUfpTTHsmdPAre25USQI2bwS
	85c7UoyjsqTYRWMuOK6R54nKXIGezFTiWgLczUXCKKK5NEWkBIzj1mqSzc7wIxF2
	BYfDR/xzrdKjEikvhBIUI477ohHycak679oyMal3OCZnm4E91aoB8LFzyj7u6ijE
	ATFAWItTx0HNNG+y2g2ckEQXYTu4N4niLAXa9rWD5m53uSz8hl9Fpt1EKEPIt2bB
	aZ6dldZn9vsNIhgHjbBCDw2gNKPyvOdwAAcRd+h9KZ9woE2T2V3n6MEr3upG25cH
	sdf07a7ITHnYg36qlKp6r7NrCi+fKaYPZeMgmEwAHhNb2yv63V+0G1xQi2A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj1dug3nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:40:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cec4226c70so172633235ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 21:40:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784608842; x=1785213642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OLIAXWfCpmHFUwa8nw4Mj+/QbM8l/OZNREotv8y2c6g=;
        b=AKg30LV3xCr4Px1nYmVw8JMBOGH+DSugEFIuJwUugrtnngrIz23Gg1BMhaDFI97RdM
         cfx6P5OwQmcOwYRvo75LOyOPkWWOmUU72tVJCdWV8pZ0b1wRBHlqTL8EfLVOk2GV0Nsi
         WbHq91r/M51+aXgH3YmR5WZlBASlKg6KRqw045cxy8V70rB71rq3j0KSXlJn+jjy05PU
         F6Xh5FQL9d2g6tItEEHIBFmixLvbg4PTar/j+GTNdS/szANmOJLhdzT6ibrq31HFbLf3
         gVBTkEOZDa79hyt/INpT0zO1VpsOQRqcZXI9IAQ86JLybU0wvxLFkaclI1rQ5MS1mh3N
         l5pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784608842; x=1785213642;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OLIAXWfCpmHFUwa8nw4Mj+/QbM8l/OZNREotv8y2c6g=;
        b=G86OuV4+q336A4PEx//8hpPSAZwrAEttLfsrwJKj4MOGCGmyRrsIZrOpGOVgx0qMQi
         vAdX2fSwBFvLAR2qbwu5QnFSs4RoAAI/QtFbYDbRMLY0bmjPhbH56MZTppEAcibGJtAv
         7ZDZ9IO1rsnWgw5KO/BUc35zByIGLExu/JfovJmjsprkU+998uch8YdWkCWHWd8L4Ma3
         QfL5jurlWDAuoOP4XF6pk3TTMhFQLh+WDuPm0+0N/Hoe38PC6vWKU4L7yd+rVkKYtS9H
         dmyrK0P+XcQ+sUbtY1TqHoeHMgqzvXAT7YU71JIkb8UyJATOkZkegpY1fIbq1D688Tri
         iMkw==
X-Forwarded-Encrypted: i=1; AHgh+RoC7/LbIUaLApcwVrtpyWHlIQtEFmgWH08WRRehr+sF/h0ZcmBBoaiDZYvdTh5wG9SnZVCUOT8AVCcd+IpY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7UZgfBauyrq625A1FEuVLtT8tofRP8s13H9nn3zIv3+VBqG5B
	VHOQVco+e4MnEDH2EfM3b5DeYcsj9ntOZjmmI4vqG+kz4evhZ6j1bftyV6SB28iMjKVweXRGZVc
	orlCdBc2wkqIuBIJEwPZqVJ58INX1fKI2OucG6WHMWpQ6xWyr9K9Plsx4XwW1iZt4a7lH
X-Gm-Gg: AfdE7cnjY32NyxLTotchu38pMNEebkpaP7l76Ytd/GmteuE0Jp5OD1cmSE1I981ON1O
	ScOosrkTP0J/nzPmnLTZnEG1p3QT+wAzpZr03ceJBPCL6A/BQnimDZWNRP65hGfA8fh+PNzJ5/g
	5VEREW1dXfUeHsrupX+MvmoPDOSDyCkwkeDPRhe0Kq9k9x7qmnF5MN8lycr7MTcaZCTUA+kheVP
	6TrmC7Z6qAo1VS0GKplcx5InDJO+OVlLTBJR4ZaIc3327kbotGqm5w0OAxANWQ6qEufO/CegiAw
	5DHkFaR6m0dk3mtu3HYous/ABtHJG1PskNEpnlfOH+zWqR3SY+vSxZ/7XfRRJ5gbXnETzwQKhra
	QlkY+NmOxnhjf1kbxCYRAYIKBA0dnWo4+gTNeNCv5Mo1kNh6mUudLCOZI4hvK
X-Received: by 2002:a05:6a21:6e8f:b0:3c3:7019:64ad with SMTP id adf61e73a8af0-3c3ad99751fmr18411655637.66.1784608842446;
        Mon, 20 Jul 2026 21:40:42 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8f:b0:3c3:7019:64ad with SMTP id adf61e73a8af0-3c3ad99751fmr18411630637.66.1784608842003;
        Mon, 20 Jul 2026 21:40:42 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce29ffb13sm36532895c88.6.2026.07.20.21.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:40:41 -0700 (PDT)
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
Subject: [PATCH v7 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Tue, 21 Jul 2026 12:40:04 +0800
Message-ID: <20260721044005.2882803-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
References: <20260721044005.2882803-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: bwQi9Gkc6Ofu4ocVNhozgme5Gvgv4vmN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NSBTYWx0ZWRfX9undBMJTm9CZ
 a3EITANWZPqiPoh7mvrWHpVylLhoZUzI3/PEe4BbfeVaPjWdRiIjNqIu3IEmassj1IN6JY/6tLO
 3yFNU0nbOwQIkHjWCqaMJSd80I85rbG4kmhbO2wO0H0KA389vPm+67kXziJOGLR5D3hHMC6ZTq4
 SlVaXLW5thzWikxPrfdq4TRsFO8N5qtwyzmXD4V/pWl9tDFda9la66//1YHwK3DEmBarNNbxx6b
 jhhhdoMat9x8UAbBxhjRC1SwjzoPR4nW4sf3lQCQwMb6/SVhueRxiz4xIxvuFQHeFa9Lt2nVwVy
 etnJWfJeNjnRHD0uIF/Uz78f8e4JzbUcpjfjsvKenb9CYYmUlz9xwpGtwfDsRWg/SKojCLag+n9
 Sl0YdbmYiMM5x07F6A645up3fc+fnrVBBqwGsH5hLkgt8lXtiqjHy9b2CotgBvPWTW6NM9f5HIx
 rV4F7nqJ7ALIkyZ1lyg==
X-Authority-Analysis: v=2.4 cv=I9JVgtgg c=1 sm=1 tr=0 ts=6a5ef84b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mTzsPlHQ6iguFW8dCWoA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: bwQi9Gkc6Ofu4ocVNhozgme5Gvgv4vmN
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NSBTYWx0ZWRfX+HOLxnPUOTU8
 sDSj+eWuFKBCPhj93sClhh4fiXFy2a1XE+UV/tPqgwxK25ZBIVHliMjGdjm9DdomAwa61gzxMni
 dXsuTq9rdEazLgdLZAkeyJIdCbDve2Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607210045

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board,
which is built on Nord GearVM variant.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Enable UFS storage support
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/nord-ride.dts | 236 +++++++++++++++++++++++++
 2 files changed, 237 insertions(+)
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
index 000000000000..4a762e4ce62a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride.dts
@@ -0,0 +1,236 @@
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
+
+&ufs_mem_hc {
+	status = "okay";
+};
-- 
2.43.0

