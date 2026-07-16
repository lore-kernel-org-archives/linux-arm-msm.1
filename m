Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0AD42F70B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212023; cv=none; b=rYqf9++H6dZZd7VILos312sTw+x7Lt64SEusvruSLKJ5A4zogB5IcB8V74D7ovZedpEfTv3OPIPdc2Rqmh8Ns/UASCa5JFzj8RRpRcHzbYjwftCEtvamTmHj6DH0QuLuPdm99fes1/gtJq6Qfro/E4573Vw8k1x64pxT/TS8OGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212023; c=relaxed/simple;
	bh=9lCpy4yMuQiIVMbLILXh8MsESNAKQDZrfg9EpLCWzV0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kueEbFnOHbxpwI4EwiTYw8UmSoyU/8X6SrU88lgE2jjScMc9SgUgL+dZ3UkSMF/jFWzJSkm7445SNU9iPL6UXREFr/sQID62uCIa9ITrsta1Oul/tBaRaVKgqICu6TQW6irTxSWRjEgiG34AXIPXKLXu7j8MXs2cE5aQXxCxmjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vj/FQHPD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SvdA70No; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vj/FQHPD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SvdA70No"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GDJm7w2837973
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KMAGdgkc01v
	lnEx5rd8EGP1TUmnd1PB3iZ5H1xmsYY8=; b=Vj/FQHPDHj3DJ+WuK+Ejy0ok6Qm
	jn5ywXUTwPs3ntDqlTWKxY/Du6DdHf+9E6VtvMQKmrHL9eJDb0SDqzzoYl5wQRq4
	/Cf5SzJoB1btpEHdzJiaBLNsWeta53X/splNUGcfSqwvXlYbCFRvFGYuBbkDQhVt
	DewSQcSRkBLJ2wsfK1tTAzuU6Cg71hOvVbNJB9w4uAmCnYHhrxtbM8nRAjaVNC8B
	jz1cl/viGSU6+xWx1TznAvbN4fUppZUb6ymAYVrUKGRoKLaf1LbIpNp7ka0FoDGG
	uojQswLvsrBAGMQLR7meHpDojkVbOyYaWMU6SXgnFEMYPSaFGv/jdFLbjPw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feefqmc87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 14:27:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so85011021cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 07:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784212020; x=1784816820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KMAGdgkc01vlnEx5rd8EGP1TUmnd1PB3iZ5H1xmsYY8=;
        b=SvdA70NovaDBqMJYhDWj73DXuspsFvuaE9sEKjS/ETCdZMXkIF6JzZBFQZhyMRczWd
         mLg2KFw2i8iR8AMvkF9AhFnfAGDp8Nik0ZMgI/XH+Hq6VneMlr/HsfTr3XdO6d4MHvdy
         4g/tW0eTSu1Dahtf0L7C9rLJaXNtPo/aKs20Vd3DE3GYlobfVFSSq0y68MSw8S9g4tui
         LBM+MbDAito5ZkFNJJvVfr7DEsl0SoaHAr3DGl5ChbGPwFj2vm0JpIaFGXpCuZhmACEV
         dAq/c6kullLCzRwD5SNmmzD4nmicgGOULvcFoducKH5Mbk5X09/QuJp8s4ez34jHEGod
         dRVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212020; x=1784816820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KMAGdgkc01vlnEx5rd8EGP1TUmnd1PB3iZ5H1xmsYY8=;
        b=Qm9D9SnaTdtOY6gzaWNzPrAu+s8r74/U7/rPFxwvAQAB0PmeJQqjUEzNMJJ84+wTh8
         o7Gs/607nZJG3bLrLrVmipRGHA9/qMixoXwWnyshB2EqvrkANttLRBmklmdsEn9A3dcZ
         TR9RT9GqdIrtGMm+HxvRRq4EKsV+mOMx2EumnqkZQ0T9D0Zs7DzW4cJXPbVqWlDrgj6Q
         XpGptQ67JD6EyLqImdBzUB+T08CtJJNCrSbWM3Izey0TK7bxLNZXxINlM5IqsTrK1Ef5
         ZRmzFQl23rWvTu6LpcLHrD10JwKxceyHYEfTg674BK8KZ44r4qZDh/iSUp2WDVMByC2/
         bTOQ==
X-Forwarded-Encrypted: i=1; AHgh+RqHHN9GdEYKn5iT4fm3d/Jsp19macSy8lkhuphO8vZWVpvpHv9ZEqDsFHCQwgY3+2ZkBe3EEvgKejOgIVUW@vger.kernel.org
X-Gm-Message-State: AOJu0YyTMzsd0PusAzOi41WpcfVc8ntu+2hrxrUSJ4zsaVmlyTIarYjf
	W4bfgsfh3Kf2Shg0q9/PvF2Rit/FxjGCJaPIyRtDT2cue7QGD6pFZZj0UAPDyHDXZ/8EIoO5Cyq
	jmNYcMmwNqAYyM8XXj2llQh5axYI5iSkB5nuWSg7DC/WYlmLh50PWzSwofRM9jEyrfIHr
X-Gm-Gg: AfdE7cnIwhafjeN03SPlNB2Pi8R9uuWeMXh0eLTqShcuxYK/YNfi9ZfD6/nmZgwxMMO
	vvpMkXiMqnrPingocJke8iHYOg3gqntD/FqXfLsSGMDC2oYtbiiHLTCNYoAU67fKpWRIebrGICl
	xrcNhF47e1IBjSMhbjfyemffIEroRaz+z/8Afd4UuCavGRX6aZBv1pUlWIkjWh+fUkmRF0UKuTw
	dgG2xtQvjAGcd4f0+0qlUN+nfCR1UdL2GzcpxAlES/Ns/L7tezYNuUflH74lTd2Fe/vwHbyA4PJ
	HZUsO91fNmqWx1h0ptb00Wo/xD7JQeE1Xuc8hl+ghJOPKmDTucvqWTUQrk4anSkRdjX7KXYaiFE
	jR7WbvUdmMP4f+AfV/GsKHvSzq0+lCfz0+2wl2azt2I88CDgSuug1pPTde4ro
X-Received: by 2002:a05:622a:207:b0:51a:7d43:9392 with SMTP id d75a77b69052e-51cbf16f512mr229100071cf.8.1784212019599;
        Thu, 16 Jul 2026 07:26:59 -0700 (PDT)
X-Received: by 2002:a05:622a:207:b0:51a:7d43:9392 with SMTP id d75a77b69052e-51cbf16f512mr229099721cf.8.1784212019011;
        Thu, 16 Jul 2026 07:26:59 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caab6ed34sm152869121cf.4.2026.07.16.07.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 07:26:58 -0700 (PDT)
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
Subject: [PATCH v6 5/6] arm64: dts: qcom: Add device tree for Nord Ride board
Date: Thu, 16 Jul 2026 22:26:00 +0800
Message-ID: <20260716142605.2398433-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
References: <20260716142605.2398433-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=APNfGQ4N c=1 sm=1 tr=0 ts=6a58ea34 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=mTzsPlHQ6iguFW8dCWoA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX/dg9Nmw3wxlm
 zEzrR2d0KZJBZ9GAWuL7YCiDCD3i4HrHizuRQwVvYWbozMWsZUxybac4SlLwbrTBVhZosMn9Twd
 8uIsvplH9R22QdxjArBiNwmJwIALK50=
X-Proofpoint-ORIG-GUID: 1PGkREOOOS-XpatVoKa85sb40Es0Wp4-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDE0OCBTYWx0ZWRfX2k4d3cnmsvgB
 2a77smtyYJadT6aLeYhDsX/riyXhenFuFOoG9aqdy9bxpTRP6nNfA5Im0QELIJ0Etu/T/AaY1p2
 BRkgiAImdtgdDamBEZ0boOIU142xNMeuM9aWjFKQp2gpJ5rus9T3s2+BzLxt2DVa+advpjZnIRU
 EMZxDNS7FyobOhau8ymWhJ9hnXjlpGD1QeQFAEjApoIw5ztscXjKhpZzGhqSmQiBKHilnuz2e9r
 0lrl6gY3pAcsitka2ahiVfZ+/n03SnKVKGFarqo2x9BRYZqOZlGTtDFhNUMiOIXr/ylZpXYC8nX
 769l4B9sErHKSfZUaF7vsnJMIJhwMwtnFT8WjwsaID29kkzqCsyx/eMTJ3LZODPqFSrvkYXzPNN
 mLo6jOxs7Htc7l5AH6IZUz6VxD0zUYZjIU6VW3AoTDaMjNkzb7YJo9T9SFEb+YsjMHI3YBRgKe7
 moNKKWmd3My02WskE/g==
X-Proofpoint-GUID: 1PGkREOOOS-XpatVoKa85sb40Es0Wp4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_05,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160148

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
 arch/arm64/boot/dts/qcom/nord-ride.dts | 240 +++++++++++++++++++++++++
 2 files changed, 241 insertions(+)
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
index 000000000000..4ced77e3482e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/nord-ride.dts
@@ -0,0 +1,240 @@
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
+&scmi15 {
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

