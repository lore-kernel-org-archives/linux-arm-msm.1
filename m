Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A65F3ACF0B
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787889067; cv=none; b=OvszXnH1WylObKz6jEY1yHIWukfkawXKWahv4leeP6TOeLFdq94c9AggL8FmaCQekHZC/pzlitZDxHzj0UwBGmNxJEA64mG1KxLg/YbqdpFaSqetq7qCnlm7EWAYHJfJJlbDK19oquARq4edHlX+I4oJr2Vln+ZzkOdDcFpT9JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787889067; c=relaxed/simple;
	bh=Z4z5fKFl6RgkdY4UK3MsK8CgkpI2A/IXfHSxNjbFO3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJcachdQRek/rG0aRUmYZsp73M6Zcxk/tsWvoxQz2KErCKj6Oscmy8WULABFbzho/u1kokt7C4OVhHMT3SFhaYp0vBI40nRlKok20kdmicTeJmxJAG1doWhihq5GORcV9dyQftbBTQgEdKgRncTeGSmbixFXTLwPYQStorv6zIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=leV6/+1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jaBgP/J6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="leV6/+1o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jaBgP/J6"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S3K2rr1572410
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bQp3zee51kf
	Us/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=; b=leV6/+1oxpMpIWpntqk6DVxmWGU
	SgsVM16qXhGLMtHj8eBZhv4hJQU2IX4otOcejWhlAKKg94f+IBruJchWjgl9PDqG
	ZTzbKGI7eHUNxXrU5CswYu1lW9GsZ3x5cBMJBrt1nvoZ7hZrL7yCCJCtT0g417zV
	Uu0nd5ynUKKYJu+fevzHHJKS7rnuh6HDVzFo4edac46HYHFPLp06t4RxUYC+4Ulk
	V0RyffiRlAA7Kt1kCqt/m0BKTBpTZU3HKchw7lbqRnqnnKAhRFJyr7ZC/h2S6AtW
	RIixcmz2k5QOYPGC4DSMX/XYrOLOk+8TFE+DlaPm4Nl6ItPM5AimV/Ucp/A==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gak563wum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Aug 2026 03:51:00 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cc7e86e7c5so7572585ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Aug 2026 20:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787889059; x=1788493859; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQp3zee51kfUs/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=;
        b=jaBgP/J6RYfCicwYSWEVDxsr06i+7/kOoROgqJaVi87JDqGUqa8n6w/oRDJ7jXup6H
         zN0iVuJGCqO993pW0ltvo680DfUOfETWwTykxbUW5kdEov2yfyYaIvgwQxjx/WJ9uTfH
         1smLSeCP6qeBLS1yISKU/eX4SwqKoAg8Iohk1H2SAnMV65Qet8Yu4tbWTrmAmYL/Ho/f
         HHn8Io92Lr/eTaabk2QiQ8q6pGCT6lPKzZA/k/Qvuf0oECZo5RZX2nD1YPQhJXCAtsrd
         ZsAgBnF0c/2WMyz40PPG/PwMMF6GgqmiGAb6aShmmtg6L7HPzL+g/4H4Z1p9gQaKj81V
         N//g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787889059; x=1788493859;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQp3zee51kfUs/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=;
        b=bfYBxKuY1SK+1kAbeMpbadZrGUoQ+puLfjdGKOKJNL9+Q1CUWVnykccwsA/sJjhuha
         6Zw+37pENZO396c2O+Znsx8tPiYd6RjqGMltMbRDJfECipVvSc4HiXB1SgcYml81XvRr
         5reXSt+oHtep+Y8mFk5IF/lBI4R1SisM5CyonH7ra2midWs32ySU66S/jh9iHQdigm1x
         trJQnjV3htBIwi80NOxFVSbQmfk46h+2vggHm4H6eWA8/igElGawI4O2syH/PU4jeSBh
         nsPnnQU/KXY4OHY0pE6w8yXbsUsHqBGF3PWO18vksJV4G80KBDqkUCg5159gwU6z7WKQ
         wRLA==
X-Forwarded-Encrypted: i=1; AHgh+RoyrW248xtXFp80x1S8/4u/soTsLF6SqD7sjueHuwTO25JKJxdEYQ7YdCPN1v7yIxcE4zyGxUFlsuHdr6hG@vger.kernel.org
X-Gm-Message-State: AFuF++lxluxwJ1Q1lkps9i7Z4P/fG3kHbFU7OoPFod1uvcCzR/KvDwh4
	pnbHHC3Eg1+4TZhnu2apJ2jpqrSMyKorYGBDb5jPpl2TVztHX4vmv4NmqGrvzdj+PXVS2w59hh3
	QejTbrr/oMe84j17Xk5n8oX4kyFevvx8jkjF0rhM2/iHDokvPHcmkpKN3zYkkcgTN3Jac
X-Gm-Gg: AR+sD11b1i+90D3XB6SavXc4JEkvFi3LsP0WG8LxS1U3cSLCZf1yof6caG+0USRCZ6i
	Hfpnaix4WwYl5OB+YHwJ8CcxSqcjwP0il9m4fvJURgzA8pkeK7dIbGEcqTHQbiVKEIy1teqhp/3
	A0gPCvl8+pJs7V8XFnZfSbrWV4QfhAvOgC0xj/VH0R3vXfxSGEjKDaty94vgKd11wpwKDVi3iZM
	lREc1zOlEEe0TBig/B4Vou5VK9IukQBYcb18idPsrX5qH9XkPw9ZDQfs1yfApgtBO32fldiA2xR
	J1V8oTyr7aEC9hGlokX+EbYNaOY9GhX/SGUTqx91GHaxaF37jhY9OzmfXdx6wmvfRTHWFagOfiN
	byT3tnU0UZvkbJrC+2E4JiSSIq+JDQtTLpS61BxwvQg7d/5HgF0mXwxiCvCbT
X-Received: by 2002:a17:903:1b68:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2d74dc2e8f5mr79396565ad.6.1787889059333;
        Thu, 27 Aug 2026 20:50:59 -0700 (PDT)
X-Received: by 2002:a17:903:1b68:b0:2d6:e074:9cad with SMTP id d9443c01a7336-2d74dc2e8f5mr79394675ad.6.1787889058540;
        Thu, 27 Aug 2026 20:50:58 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f995e60sm1133357eec.22.2026.08.27.20.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 20:50:58 -0700 (PDT)
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
Subject: [PATCH v13 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Fri, 28 Aug 2026 11:49:57 +0800
Message-ID: <20260828034958.3165-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
References: <20260828034958.3165-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfXx3uww0fHysWq
 l0O8VD4vLJ1bL9S4VD5KEa29WTAWrj1kTcO3l83LvIqVypujvkIKUoKCbC7uLZNQIHPvO6yoZY9
 hDjRNSUKhCeyCbepyrOhZnNiqs2vW0c=
X-Proofpoint-ORIG-GUID: 00z_KWBaaHes3Or8shz2gxemyIwU-Oh_
X-Proofpoint-GUID: 00z_KWBaaHes3Or8shz2gxemyIwU-Oh_
X-Authority-Analysis: v=2.4 cv=G+Ms1dk5 c=1 sm=1 tr=0 ts=6a9105a4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2Hjw6vQzkyH4OD-tzjAA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAyOSBTYWx0ZWRfX2oxHAOYpcbfC
 d0iuD7VFovS6/6ZloJIFsZEKN2THpylU9DqZ6NFXsQZ6IuSt7Z4py42xzh7mqZN+mrYcwuiagnz
 m5eUanPPE6jYjq2zCUQ1JZJZBCqiJk33vEsSLdMkToDEpSY6RT8RFDsplAHt411xJQLSNQLl5ZL
 Gup1AyP4+LrduBWEu8NbV45jJG5XR81VPEakmrR2oQfJLWTYp6l2AeJT7ScorJjR03jl5GwVwqv
 XJ4+zs5ENvyjBwxdFTZWK85rdI9ZCH+r3DZdjLfId09NuMt0WJ1TPRGFqXt6toEcL2NTMQ9pgwK
 9h5gTLVrYLeAzh0J7UufAiLwXgKcV1uOsNvrdipEFQ9kLxTpX6UL6ifkkgmf5KhqO9wNDUNv0SD
 pUTlv/UzZOd+UX7CnifPLS+10OKi0C/zNjOj5KczGZwXQn5KoeHxGtGMsgxrY8LcX9ny3+/y2C7
 hGDs8Whqpb3IUTDnPYA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280029

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

