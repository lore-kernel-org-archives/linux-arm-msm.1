Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845FF4B2042
	for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2026 14:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788444476; cv=none; b=stXN3/srs235I+fKl4Gft3k5v8yE01f5PAJ1fA54OzDr6xdmd7iUDqV5E0vQ3uvhXHdbtt9SiBbN9KsyOWsvFxzhjnsVmZVEFgGemgR1aI6hUJqnp43HQvmlOwB9V1xjOvs1DSWACOBJdRMe3CWssuyahDZymGsBLdXLcWQvTpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788444476; c=relaxed/simple;
	bh=irQo3icUiia52VMaX/Rf+vvFkeel82rEo8nIJdwP4hI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OoHJ0dTjbKzoZ1faXQAYzk0IBJ8F9mLihnueXFfNvweiXZi5BPi2H74mq8nPBziFjqUYdqqCw0nIxW2fWJGC05B4fzw3wOSEq0EZwjiUJMKv4xinZiKn2T6+Uk2Zs0PZPPdJjbxUalocaY7jCpR+py8hM2OROq0UUkR29cAS0w0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gAoduQ1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hmIo4wMC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gAoduQ1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hmIo4wMC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683DALEd4093601
	for <linux-arm-msm@vger.kernel.org>; Thu, 3 Sep 2026 14:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EZM+TFCkrxk
	33iVEdleTA4Oed2R+EN8/tz4eEc8QWcs=; b=gAoduQ1J9/mHcNCNK7RO9Q3PeYZ
	CWS+YSnZymXEKaz3IEa+O4yvHnm5BnPkoXYwiSefNBw09M87wXVSrCf3oIe7WAq/
	iBplD1whLDIz0bn8Xnu+YCtdOhzRDkJWH8LDnv8BTKfpvLDJx/JDvF9eEnaHjxBx
	fT/AxPY+8m9XqWAOOPW87OwmEF1ztYWQMo0Jn01x/FPlGtuhikB6mb2UVroYJUQM
	YDbkz69vtrmVEBcLZUVsnCIWICXYBBwT1F28k8c5MjmNG0PFFuRP9P2CVZlFUU65
	3zOCkLhBJqG+qJ9GjnIJSved5NJa7IBIxki2Bw95WGRAkRM+o45Oe6VxJrA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf0gjtfd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 14:07:36 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-398dc3d8f0fso1266379a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2026 07:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788444456; x=1789049256; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZM+TFCkrxk33iVEdleTA4Oed2R+EN8/tz4eEc8QWcs=;
        b=hmIo4wMCMDi9dvUrWv3EUSPdMx3/gf5fkML2ggt69rRUuVSf7PUrCNREb4p7ZODQRR
         7FVcbqx/oMuuQ2kgR+KPtigKOAXHcEjMWcRbUA0bhbANAV3xWCDwrLWB6oSfS0Dk9Jh1
         OHyR6VdKOKmUmVGz8aSE/vPkz7rZb6EUmBhXzAjCFI7dLnEJXxMl1pm0zXOHop+/xfy1
         0JkufyApbhjxlkOQMKavoRt9iPt6lfCzu6QSoyqrVFoHXdhT0KqmwUmrXApB2G4YT3c9
         r782wdECkz17yEXY8G4L/ZRe53l1l4hzEEnq3e/MOzgUGrUITUzzu8Rc4NNZwDTmF5TA
         WYZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788444456; x=1789049256;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EZM+TFCkrxk33iVEdleTA4Oed2R+EN8/tz4eEc8QWcs=;
        b=l1OLyQbtFStkCCUzXLdA3b8vCrKPxKhCDLjilroks6gahVLGujo68ykOplCGHjTDxc
         INz/zZ1rbjAIPTpOdbHF5aYnKdzanFx34ZcniC4d4ZwJGVQAhmJC9c1ykJucVDfA35+8
         QEKrwTCdOLIrIXJQe+jx7We3ebKE635faIHw/oYfHh52UkI+H6FucQ0k+HWy1uR95bcd
         rINN6gTZw5+bYEa5hn0mbeDue1LKs6sfIF+ioR95JJt8AKK+Equ7HMvZ8z5d/wLI5zvy
         AtIQiuOCKDsoe1em+etxj0ysuUA6kXVcJ/VZRyIW34lt8elZC+76xdskCkbl21WCpkVS
         4kYA==
X-Forwarded-Encrypted: i=1; AKwUvByF2Y//Nq7LTDIlsfpV0h05NId6F08r11Rhl419MCzsaVViVsIHyw2ipdXeYmNeAKUyeWwpDoWJK21s3O/L@vger.kernel.org
X-Gm-Message-State: AFuF++kwLyjsB12ku/ehKwVTTXU5nHLZofC4XXdoq65iMJSkyOos7qel
	q2AGczygn1afWVEMSy7ue13nTZFfL0AU+yhX0Q13M/ZZStXLX6vG1VXKb0Yt+dOk3eFsOasiq+q
	eWZobJ0Wz/iyKjl8eLxrd+BuOECsJ1T0wAg3wxQRZgMAxIf4QHmbmbNRH98zfyvuxrgt2
X-Gm-Gg: AYBFou0kSlJhUQ9/ciZojRCiYV/q2ZI4rYsa8ugaBETnmlLE6T+zhR7adFtoLlYXONz
	+CgSwMnSR9vCyHovHuBO7sQdn1hYLxOLriylqwDA6UxgtqxWfRULWj11asvdQzOgMTyI7uS7Sxq
	FA6KptrnRePFe+yXqcEkaZtWSmpAMY+cbeV8ltZ92qsGotQdvYg/yLRRg8oFQuPpiG0b35tqJ0V
	WZ3euhVR1iBEnSE7z07tcBLLFcM/SU5E+ryBlgpM3l3W3KOoGMSY3+hZSkcVZp/IdMmTRf2WWTj
	YebDCP5EGBMMM1tf8fomqRG5oGrcoHVLKn6W4yrZST2fd1Y0IKNMOS5njeNUaPAiJb7bhL4MFZf
	HUxpDeUCgel7Eok0XGAoW4BoRwUrN+22H4Zt0iPpP/GmD/PIz77Xi485JhFko
X-Received: by 2002:a17:90b:3cc7:b0:398:b1b8:4719 with SMTP id 98e67ed59e1d1-39b0881dca0mr6763939a91.29.1788444454090;
        Thu, 03 Sep 2026 07:07:34 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc7:b0:398:b1b8:4719 with SMTP id 98e67ed59e1d1-39b0881dca0mr6763799a91.29.1788444453469;
        Thu, 03 Sep 2026 07:07:33 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1431994fdd7sm6809098c88.10.2026.09.03.07.07.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 07:07:33 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Yadu M G <yadu.mg@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v14 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Thu,  3 Sep 2026 22:06:16 +0800
Message-ID: <20260903140617.441111-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
References: <20260903140617.441111-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfXxmsrDPa3E5DI
 EwunlllXYzJgiiiHuKksDIgMEmZ38ZBY7LjuUn1lYPVV0hLs3JjGB0A7XhE0EpJigSxu9maliut
 6CjzsAusQ/vLtYS/9X5cZoftmZ9g8v9xv76cBb+o8uz0Eq0HrIHOYy1/aEJNuFRVMmT+cLZbLfA
 2qHnNLNyMNmVfXj/euTg8yO2olqGBOWZHNziK1MqK/GpV/uQHI3QT++ZgvnHKjEjcJMLpiuaGfk
 DMegLOdbVA1z1DJnsGRL5iGPqh0nVoxzrJRk5knNNV0k+P5oQwdx8q9g6lQg4l99LEe4Kdbn4qB
 DTRXfO3HIfHL1va9c8FIx4oFzBiDLrbyjI4+z46CqDdHJUOF1CMeQBo2uwHljDAZCc9aBOmzi6Q
 7OWMSvveW6I+wcm19C9zKS3yHKU54t2J5qM7/WZi0bUdab5uGTild2PyxDIzWOwHl8Zexozmulm
 qNDvaujoW4ehuM03/yA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDEyMyBTYWx0ZWRfX2cAnovfyXNme
 IFc6mXA9h5n8PV5FIIXE4m0LqlRLcIpJwrd25A8MoNwtBVlq3vVpwd8P7fSPTx86bClKUmdCUPu
 6y94jY8A0yqC2sH2YV97Ho095tUqb1M=
X-Proofpoint-GUID: bwO63g8nusd6fmem9VqzptGyaNOPXtlt
X-Proofpoint-ORIG-GUID: bwO63g8nusd6fmem9VqzptGyaNOPXtlt
X-Authority-Analysis: v=2.4 cv=LZ4MLDfi c=1 sm=1 tr=0 ts=6a997f28 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=F1QlHIOeo1lq4PqRBw0A:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_04,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030123

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Add initial device tree for the Qualcomm SA8797P Ride reference board,
which is built on Nord GearVM variant.

 - Configure UART15 as the primary console and UART4 as the secondary
   serial port
 - Enable UFS storage support
 - Define thermal zones for PMIC dies, UFS, and two SDRAM sensors,
   all sourced from SCMI sensor protocol on channel 23

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Yadu M G <yadu.mg@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile      |   1 +
 arch/arm64/boot/dts/qcom/nord-ride.dts | 254 +++++++++++++++++++++++++
 2 files changed, 255 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/nord-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..d05920a0d5eb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -160,6 +160,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-maple.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-poplar.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-xiaomi-sagit.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= nord-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= purwa-iot-evk.dtb
 
 purwa-iot-evk-el2-dtbs	:= purwa-iot-evk.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/nord-ride.dts b/arch/arm64/boot/dts/qcom/nord-ride.dts
new file mode 100644
index 000000000000..1af4117d24d7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride.dts
@@ -0,0 +1,254 @@
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
+		i2c18 = &i2c18;
+		serial0 = &uart15;
+		serial1 = &uart4;
+		spi16 = &spi16;
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
+&i2c18 {
+	status = "okay";
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi9 {
+	status = "okay";
+};
+
+&scmi10 {
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
+&spi16 {
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

