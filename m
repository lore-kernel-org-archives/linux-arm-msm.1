Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46023451CF
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:14:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789355700; cv=none; b=ed5xPCK7jEiS+pOHRwMNHF5PhL5mdR1ZN21og+pon2Qh54DkdEop4YfoLK2msMAMtTJV7grxtkwdukuwt9a3Du2v1SCHJMfJdsvW3FZ2iZnESYyY3diV2ZNbUvID+DWytbOUGO5lQWSZPTMIEVCaBXuDaNFZav3IEkSRWVBXwxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789355700; c=relaxed/simple;
	bh=WRGcjaRZYS9OoWgf49R5ngkI4jnm1va5arqFOgxQXSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oQfMtuD0Cxb9F3PjRnuSFNCJnyqDZN0sj+Dc7JZF5YmxZQJmKlqTmjsAu9HFcehzLFlRjhE61vjKM86BblIyOKiy9GoDysKWvyxnbTRrJfGQCnafyclLivaLU75W93w1fhhCyLw+B/CIhpHAZDUdOT6CSHyK1RMrdKeXxFCZvqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QB0Xg4Vg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UFZyS4dX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QB0Xg4Vg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UFZyS4dX"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E2efUh2241394
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:14:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gD0SZqaHIpj
	MyWHLSquSM/8YirH+boG8QSwXHsg/hIc=; b=QB0Xg4VgR7g7dOVSKbY/gCGZ8Nj
	B4ugs/eC/tax+5rZUbV0jMMBJhuLK1zwNBC8lkVTKCmezv/cQulNYdbV7Ti/5j4p
	kXvHfy4UkpWKKlHny6dIlE5fK+/mnfS68YAKc3CINNdfo13IODpkYc3vXLbWSSNJ
	+aM+plqLWBjN92e5sFtEHNpJE788ovQvn0A+7/vD1BhaNMuR/pHjxFgXuNOTU0rp
	fM2Ov6CBE0bZ/l6gjXjXBSJqxIagqAw14TJ4VGIku3KEB5wqLba4b8UY03Crd71X
	guXkWydVrGzHpdUm0QlVlP9NiCjgJ0gtT2o32Lwr6sgakAiTXJRg9CRnVmA==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmywh4p72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:14:49 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso4657813a12.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 20:14:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789355689; x=1789960489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gD0SZqaHIpjMyWHLSquSM/8YirH+boG8QSwXHsg/hIc=;
        b=UFZyS4dXLXeZXs6Gy31rwSTEeGnODEslEZEGAdIvSnaufPjv4NyxoUx3zjAbma+EJO
         Ydim0+HFwXUj3DCzwD0cRvRLjL4Tm+/mEeyCmwZfXhOUy+0gCfWM3064rUn12zdBFzNl
         LVaDsA8gyKW+IRHIJv21qxSqVe+I6VAgb88I4FWwjNh7fS4DdfiQxCk1PPsmhxEpS1ik
         0tZKNBHqYiGWt/N4PTYbPbt/9MkjE3zdQPS2bRhOv+0DdOl0JbO2bNTHpM7xKUOwI287
         d7LoZHMZlkNdvJ4Vf+eT96SsHbNUe/BZTZe1fHGdY3L8rlARYSDCXp+Zg6NyCZj90d4i
         1ZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355689; x=1789960489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gD0SZqaHIpjMyWHLSquSM/8YirH+boG8QSwXHsg/hIc=;
        b=gVCGUCXYxoloD2QIyfFYCrWOUBwd12LK/9LxGC4ov5AEA3uZGFgbIcGt9WKuC9kb6s
         UxFNSlrccCHpkf7HMnBcGR78UoX3FKBUPqhof3zomP6a6EkGIjGzj64DGZ3obpTP79em
         IYoOPpNDmjf15Jp1SOonahzVgV2F5NFEkifzpOV5D8/kg4pVp9Biibqgw0qL0xb5mG5p
         /CEsbG3ssTcr+Ehkt3KMmMUG5wdpd+SgiO3aTI3r+AK5IrSDk9YYmZLi3z9dXnoOv+hh
         mWV11PU79jQ5+9bsc53tF/4y+ITzbX4YT7q1zigPkdKbv+oLBU90E+yg41HQHUvOJWnP
         rqZA==
X-Forwarded-Encrypted: i=1; AKwUvBxG99g/vz5st7A95c6xnfRSZMRIbV90fNrUBcT5+yYV76dGaip0t3KGoTTaRFapLtDeINBUFKXlPBrexlWn@vger.kernel.org
X-Gm-Message-State: AFuF++mHY8ka1bSdHnZI0wptsfWmMBqZ3dlIpTXEJUARgGUniVIzOfsa
	Hkz3vi1b+WDeaYzfQWF3OTcGfi7W39WiV0JqvrQdxtc8QCHja/RuXlibi1ZZnPREFd9NZAHDgs+
	dh7FGMFsI4dRkBgncNjcF8/AtOWU+0TUiAYKpQ+p2n8hdmnAYXxU2T0aL2+Nv3k/yvka6
X-Gm-Gg: AYBFou0PZC+l9Wsusis8x+ozzMovFpRNRQVcAriScoMd+YA4mBYDSQY+bnpzZ0PHRxq
	ONOgWTBdpFGNCR+zM3mEvzTgy6TujT4Nqqh764Y12k+Zqv8cN364sS1g+BunOozAHLbn0b1lvZG
	55od4oducrPZ5di7ztITXjoTXcsLBoBfLB8m/no+DzetFdOqQrw+PBACo5CP69C58ooFBwtqqeY
	/x1qzN/MkG8Ly0FEMnyhgRKYhZVyOgoR44052Pnsr6GnuCqy3WEjmRHOhiugG7nkHyJItwdEEhc
	K9U+4T6VUd52TCAesNzWD485hqNOXqWXgJiakjs+WWvkigEunRTa6v3BZ/7iTYjiZvrH72Am7BQ
	dwZe+njDYviTUwbu6I7TSqWox8DIqiNDcx2qvfsumne6O7vMWRINQc9zKabuy
X-Received: by 2002:a05:6a20:2450:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3db40529a0dmr1180522637.14.1789355688356;
        Sun, 13 Sep 2026 20:14:48 -0700 (PDT)
X-Received: by 2002:a05:6a20:2450:b0:3d1:2f88:913f with SMTP id adf61e73a8af0-3db40529a0dmr1180483637.14.1789355687943;
        Sun, 13 Sep 2026 20:14:47 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4b1f409sm26714231eec.0.2026.09.13.20.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:14:47 -0700 (PDT)
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
Subject: [PATCH v15 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Mon, 14 Sep 2026 11:14:10 +0800
Message-ID: <20260914031412.140856-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
References: <20260914031412.140856-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KygAnL036Ao_5IRYLhZV-kROA5McyRid
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX970rp20U+6nW
 Rr0yU0PlaQ7Av4eyonMNdwOKjQJvXwPfB+iLAv4pDH6Yj2vybXaeeC2otAaSBZkomkPx3ff9B/G
 17FYBS4GQlTderpWzRaU6J/XxL14et8eTGEui4fSOfT+vAMuYJlpATXjkFthFuDSRefq8psPRf0
 tDJQsjWPf+w16OfdVVc3Es3V5KOa8s6hWU5Tbd48HUnh/BY4fR/DeWkHkiY71HoA5+0yHtU1gd2
 utOuGR00LOByVvzIV3MHj1Hqxhn7frKU6uspSqiODJHXZgoncX0bfCEUrm40ABcOM7JXTrOM4Xd
 8Am6L36ZKivMsgXa6KY5R5HdVajv6UtuhnjoEqKlDeZbqZhWjlICGPqNjFsjA8enkhGwh2Xl8ih
 kvFgb7pTwcqjpOYKrF7VF4BcE5EN6zk4hAOSJZauybEKrH8izjZGLCkXjboG+yIudno4g0+0LC6
 utaQyfkLD/P0JE7lK1w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDA0MyBTYWx0ZWRfX2Axv0JpnUE/U
 +0rrQ+0Zpx0pvPQVsxcHPjdVkb0ji1EPcLwXvp/kn/FHXTAGyjN9dIAhOoy2ipaKWR3fy1QcW3A
 n+Y/cTD8e2ClSpcGobeerHKAV0Iqa8M=
X-Proofpoint-ORIG-GUID: KygAnL036Ao_5IRYLhZV-kROA5McyRid
X-Authority-Analysis: v=2.4 cv=PsUG/AM3 c=1 sm=1 tr=0 ts=6aa766a9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=F1QlHIOeo1lq4PqRBw0A:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_01,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140043

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
index d6547fb18edf..a6b4f02bec6d 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -166,6 +166,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-sony-xperia-yoshino-lilac.dtb
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

