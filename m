Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DC5343890
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787717615; cv=none; b=oyKOo9Bfolam/049ZKgFrg6xro7C+OFzFHW8X0XOXyd6iyhpbaMV/vJGkMr9KhUfZy5ZlzhSFjmyP5BUgXu2VCIHzPwb1lstElsRFls1wAj1T36Fxbfz2dOJsGWMj/c9zg84mz1QhnuD8XBnpXHCy/wj5qybiL5b2pAwl2IthgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787717615; c=relaxed/simple;
	bh=Z4z5fKFl6RgkdY4UK3MsK8CgkpI2A/IXfHSxNjbFO3g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GFmr7fLuCFkFmMEX8rMDGi8TUs8+pVHJXUsumi0iKVAJsn6SjFU4y+x75K/l0zb+CGTPE88Gs+ypvbX9fFhVXQfV8vLM2413j7PgEWfo4rkD74ZKw3b8hvTV4o4FO9+MLuvg/T9nOTK7XSdbKBEMpfnl6Wp1MTLsLPldaguDj94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SWvOIVLc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MhRfXoX9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SWvOIVLc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MhRfXoX9"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q3HTed3381376
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:13:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bQp3zee51kf
	Us/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=; b=SWvOIVLcJnccx63uSHusHnDjGOm
	8gfXVMN9wwFYNnuFgQMX1rATZlIPBip0cdo1zWhHXjj+5EDHtKWIgCpZEXf69quF
	Gut3bK4hx10dslV3i1ywkpmXg9X3fnaWX+CU/OF9zQHdzlRS2mEiBg0Bw4M+SKIl
	mGMtuq6bGvsjB0+MalS38bKK2TkT9jddwmcrVmJoQkF9cLxwup7lie5qDXGnFYMV
	kc6AHck7tI2n7zhcsgVRZPSMz7jrKj8LqsVWcsNZq+Apbm/s5pqAKQgFsewaRRgA
	iKGDbV8jVnVhlmPtOvWtuxxWXoU5DUxKXRHN8/E5Ww/lNTBnId4W1iJEKGg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g98hp3wab-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 04:13:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38fa7b09921so492249a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 21:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787717612; x=1788322412; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQp3zee51kfUs/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=;
        b=MhRfXoX9LPsOddFpKbx9oDQGXPffZEwS2D/fdxNeH+d0c4XCGQYU8fvm5hdyumHb/O
         NyrP8+uYG/x6Y2zn9KVHgiXm7a1XrG78s2tH1uLvkszDPFy99jgji/kArLIJecGMTZgl
         2KJ7+qRXiWbAbSeJ0ll7081KczjJBFBHmoXhRB9uTptxjiTaWIpnfBNAodtBm6cB9Guo
         i3wczHGES8AK7UdVKimbaOmcO89i1SWsxiKbPk2bfGZkuwPGOmsjqcIXIm0DcJ5i6whv
         1B332xByhafCdFhQg6HlmewZdiN2oPsCu2u6aEwN2febkSplSCsGh3ZxbWqsnveawATe
         ni/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787717612; x=1788322412;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQp3zee51kfUs/Bzcd8eP2AnCxjvpw9huHgum+GY1q8=;
        b=Ej+PhDci1PDe7o/xw9UINpis+FsD9Cbdu/uAn/Mza7iY3W2f7ALJHY5SF65EMmGTmF
         rgWvMDFacVIM1B0edeawAlHTbaNRtfuNsU3eIsj12D0g7PIryu/qUzOqiPMoJgsT1hUB
         GykXkx+eCyqlwksQdSNrmMavceQB+8wtPMZT6waXIbhfpkQrki+Jn0/Bd2xQosVDxcAO
         NxnANuzdeOWSwGJvipLaCwZU2e2Vj1jNjxSGssyonPBMO/H4yfMq0lkQs58ljJN9OvsF
         Jsob1mR4o8+p3JUN4AMW1fUJXs1UZIvYIFP+g71baPQ3L/l47QdBKsJVZub8uB2QhnuU
         EUpQ==
X-Forwarded-Encrypted: i=1; AHgh+RoEaVvJHO7npMFI2N/DFVZNwPJYAe0XfeGFujrU9dYtM8bPL7DYhWooCj3WKzWqvT8Lp1K95rH3peMKWkBz@vger.kernel.org
X-Gm-Message-State: AFuF++mtmh4vtDHKMSKO6HWNRVeg2w8BwYB9H4NTd2AaCx/EoHrGlQPh
	yORbS921gtitEYW9sdlMZEaSENttOnAMLugh25+kCaQXQDsZ87ZiGYRdMl9WIX591X6/bnayLom
	hiqxO9KOnpU5J8V61ZZDHadoUscRnYdMnpnVOXbzCb+jR/Axciz9o2KQkXc+5ZP1F9UZl
X-Gm-Gg: AR+sD10mqvl+4+sK/fWHj/CGoNPcZblghbWjxcwEXpDPOf1GMxmqm65a3hNg6K8wk4A
	HhFNTH4AuWqjnqyXFje3T2okBO3WSNbXTTQFixYn7f+tq/bGZkeMUB0TLomfSOxufMS96jFir2n
	3577hYxrRR2EPPg1vadxiJWI0UgfoYBgYm2at4jefDdouYZi3ioMV7O+JBlYN7i6tjfttXrSgen
	wBzJ0YVxUXavVdKGrAEipni+3k1UO4OzNhreR4fV/9Av2HUov2+MDTIiz48h6DyjHNoLXALNMNO
	FJ6E7+kTfzMcfQoC7vgLOrSfxeU0wnifPH13RP1AHHvXGC1hpw5zMtZR6mdKGn9k0dmHsofJ0Rv
	Q/JIjiW27N7tXpfXU6+tMUpEakNqc8yZnrVREh67FigFxVL7VwfPvBMuUwaU+
X-Received: by 2002:a17:90b:51d2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3966d21833dmr8513612a91.6.1787717611677;
        Tue, 25 Aug 2026 21:13:31 -0700 (PDT)
X-Received: by 2002:a17:90b:51d2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3966d21833dmr8513524a91.6.1787717611199;
        Tue, 25 Aug 2026 21:13:31 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141a905cf38sm5979471c88.12.2026.08.25.21.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 21:13:30 -0700 (PDT)
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
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v12 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Wed, 26 Aug 2026 12:11:59 +0800
Message-ID: <20260826041200.528588-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
References: <20260826041200.528588-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: WgpTdDrXat89tktRqFMdEE--94-octiq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDAzMiBTYWx0ZWRfX/zYFgu7AUtn5
 SKGvK+E3AAx72K9hKprJtBda/ktP+M004o9aUmHYIJ4OA1rOrKmMETpwp8LncGAokOMt8tzObyu
 IcP+W6yqhT0ROMoDX7OERFhGT7MrDTJK48h6qlFctYzzHeRawVZkwICiI/ewFpvahbMe+AEKEzu
 SsiFu5h/z5MVfHsIQAA6+4K0Ho1X5HSfIDSeqlqzrvxZ5LfIegb6666xF896H6/sVPshxHhZ2Hx
 tb/kmffbSMvUJ/9VsF+NomQCaOvGpT9jSM7broMYe6kMMTh+H4NDC2S9udTaamH3n340j+KLdoe
 WkTJ5fxxhb2GaHzltdweoD5aBNQuS9soE3HvvXTZP5HqU1XI+Qkm9jm4c3/JHWeNliYXUl5XnUX
 F/iiiF4nWSWNhbUHv562PpAWp/LYyGlnEJIzyLIr+4N7yyY4tUQzXLUfWAMYybJ2M5oA4geUoEB
 JBqkqUu2B1fw6ze0n5g==
X-Authority-Analysis: v=2.4 cv=B7CJFutM c=1 sm=1 tr=0 ts=6a8e67ec cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=2Hjw6vQzkyH4OD-tzjAA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: WgpTdDrXat89tktRqFMdEE--94-octiq
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDAzMiBTYWx0ZWRfX1T41DPBmT01I
 xNQD4fffuhe43+HeEBuCGUB2BzC1TBa5Y2jmV4zhB1IpgLfWDQpDPk6cU8FVJLU78KCciJY9KTL
 oncTlJQ/Vi67Ag0HvFQusVjmcoIAjo8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_01,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608260032

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

