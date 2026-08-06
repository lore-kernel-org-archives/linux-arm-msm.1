Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9493E5A32
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Aug 2026 09:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786009534; cv=none; b=mkIOOskqkdyFodVBJx2eGvMfhv1l75jXqvNMFKTFOOpnTzOEwiAApETfCS0v7rE8/MCJIdzBvWJnorcNiqVHjukCqTrO6xJQJMCsHrwxthVajOWgYutlQOLiNo5midgvSQ8siXCKiWylOmboZKQCnDFd9P7gi4l95/mUt+nUj/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786009534; c=relaxed/simple;
	bh=c+W8myewj7pyfR23u5QXtDPVGAira3P9g+5WwHrZVF8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RBZUj7eM9RhowBVk3VtB9rhmKC2iMwboxzU9sPXeIIPOFhDgC+ig2g6dzjb3EHmou7EG3gO2GEtIMAylQtMpyVwL0VOK2OtR2eRU/VKx0xgnMT+VeRjfdEyMLCmWjVcXibokhLsXieCdFAj9Qh2bNDdpH94hrtnKIv6l9epLY/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KMh/jazf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ch04px0O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KMh/jazf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ch04px0O"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769eonV1558508
	for <linux-arm-msm@vger.kernel.org>; Thu, 6 Aug 2026 09:45:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qasgy5G3Yr9QcYiLTFAQm4J5GvF01WXjDrxJH2y8vNA=; b=KMh/jazfMU90C3Wp
	HUdeqcHwpdZNOnopSb+nza73UQaQkbxzBM5PWvvkBLiJYlLmoo4Uf39cN6q6vhgR
	KXbRSBNtwvFXkcmBWoFc0/+lmgronPG7VhKVh4A34sKZ7saOLMIOUEwRFgiDqAZM
	ar3U6rSPlqy4/gk88bbjnEzPD0RC+SDlwPCq7h88KMI6gbI3Xpu3NeF+n/9bUnq1
	XXdrwcdK6iaZGdlXogqG9ZVUg++gVa2s3MKznuAvn6AlkhsruqtbF1eXjaj6EYTN
	wBmEbZ9ulrnFdAuGU9roQJ0x/Jf7jU31dKv9V3uVUynH5QtKjhod5FPvd+moX6Ay
	O9snFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvju8hcas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 09:45:31 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92efd2ca21aso348163985a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Aug 2026 02:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786009531; x=1786614331; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qasgy5G3Yr9QcYiLTFAQm4J5GvF01WXjDrxJH2y8vNA=;
        b=Ch04px0O1BvqfdatVFXcTHLZia0FaZ7XCKU+h/LsJOVxxnjYe5XR0hnRJaSW4ZilRV
         q0SyFiLyvtKWsM4l2lbeUS6jIiD48Iew8k8xaTU3gvmLtLqrLvCHPEvPTHRblsNXtBcb
         RWcky7lQrxVtOk9s4FudGAL6u4BNYUEmBpoD++vr9sqsb4WXhkzxPWUatKPDsP3d6tKR
         hBfjwO2iqYBhtWHNwnCWEAfeYmSkhteoW3qXxuedEOv9akaG05eiwl6C2V4y4fMfYehR
         JAUfSFtGQceLUO9rb9+9D7fWV9/rIQasA1A4yMq0MqoqxeJU+WgNGJW6Ak5mwqbFa+AO
         0Nfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786009531; x=1786614331;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qasgy5G3Yr9QcYiLTFAQm4J5GvF01WXjDrxJH2y8vNA=;
        b=tS6HavdQ+XbMC+Y00hPNqFqy0lBCdDGr6vDDpPPq5qIFZ4z5hPC2+nZqCsWx3CRkK4
         NCyE/8N7UH9baNEpgIk6ZW+B7keijuCUnZTEO3nNTQ0rNQfv4P7urZvSJattBY9ALLyX
         yINLu+KQfhcWZ7Ud6ci1mrWmJaPWIejQEZOB3qTrK69rOd8eW61d2MIvENT7FTc9ePbJ
         yu91ZqZdyOgKUTA/U3CZ/UYBixZiNiMqGg6kVhx2UK6NNVuNOlOvNWpX8q9RoW9BC0JS
         sNl6yWMPX/KriYNNaEU1jfS9tD+7vgArZCU2QTQR2Mkvgh3txfOXX+jrEcEu7Zqfbiyb
         /nZA==
X-Gm-Message-State: AOJu0YzpDBvS5AyMQJoPuTAjtqTw6YqIvtLi4bu67bzRpwSs7Tm2a6I2
	cZqUFL5yG1fM1cFV9iG9t+KpM6KrWNKIhPyilKLUZe+d2A+pccyVJAbFcX1bbr7MczwzNDa8ccC
	qop/0PPQ7G+26X60+sV3EuXWr1k+ZufX54sv5/vR9+e0rHDw8ZXKWQcHS/JMuerwGxemUFOPOsS
	u8
X-Gm-Gg: AR+sD138v1kZjZq5udooN+dkU0krYfddcgYzfsKNUuy+bMMP7OAvvo5rgVD9jMn8Gk2
	ayt1dsLuvnby6+etKP5GMrBF+X8IJKv1A5vldWIDZbcpp0Ly4caJpYJK4DIHInKHHdPfCe6XOls
	75txKEV4inpXpWQo0PldLURh65NfaS2+ci1eb5Bnt63KH45xF0p87e4TudEQIzJfz7VmGmBJLEx
	njYiN4HF6B3EeKa37wtx3yAIn0PjCNPv6BzURCiWyJBysTKG+z6Xwz+FV5RYK3Y0SnXl2SWIafD
	pKG9uOzsKfBRdobRDnpeoLxM2uW6bLcRrgQHHZ66E84qhEZAaCuKR0IzdeAJ2lhDIslftIrdm8J
	Nfrr3/E+8gxVSu4l540i+zYv5G813yQmOb5Ich+eAqW8VMC+iTSxlt7uOSAY=
X-Received: by 2002:a05:620a:2255:20b0:92e:5554:a80e with SMTP id af79cd13be357-936491f5d43mr1030756385a.39.1786009530410;
        Thu, 06 Aug 2026 02:45:30 -0700 (PDT)
X-Received: by 2002:a05:620a:2255:20b0:92e:5554:a80e with SMTP id af79cd13be357-936491f5d43mr1030754385a.39.1786009530031;
        Thu, 06 Aug 2026 02:45:30 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9364a570fa9sm358566085a.38.2026.08.06.02.45.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:45:28 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, yijie.yang@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com,
        krzysztof.kozlowski@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: Add Advantech SOM-DB5830
Date: Thu,  6 Aug 2026 17:44:47 +0800
Message-ID: <20260806-hamoa-come-v4-v4-2-706021d4bc8c@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
References: <20260806-hamoa-come-v4-v4-0-706021d4bc8c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: xJfgN--PGECSBnNAJ-w-jvkk_9aXzbd2
X-Proofpoint-ORIG-GUID: xJfgN--PGECSBnNAJ-w-jvkk_9aXzbd2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX9BvbCEiHNRzh
 WEfeD6jcLtXv+QxPKDwnVrwupCt8EqTHPW7HC92VAvmB3kWSOQA3kkITIB+0sd2f6nung/DSqVT
 Nrv+U5Al9kd7+A83zL+tNtQeC9STMI5iVsLZdVnLQSkoChSNEp9ixBCGW1vXzMD8b3hXzKvvzvE
 H3OQ43r/xItoCRQf8IcsKNZ+KCUTp2ULR/YF0VNoqizdUF3pQKcdlkxgAranSJgZDm/yGtcXmDc
 Ch3Xo8ujjSPJEmC+ELcBtcuZgptl73E+YsSdwB37MTPc/7tTVO86bVfqmtUWGvM2LyYSzCR157H
 sUoCAB3boQWQqgLCKzVu3C0Ws4Y6B5oGK3CLKueqMdD2WJEdDmRNQm0iQ4llkOpt0WSHGvmXz7O
 Vz8DtS61uuoUiMm+sXhEh8V9T5+ix5nkhhFfuPEz/q/bQPzn+DLPcB5vTGe1tMgKalOvXQOF9HU
 qin8QTy2ppEwebsbOaA==
X-Authority-Analysis: v=2.4 cv=K5cS2SWI c=1 sm=1 tr=0 ts=6a7457bb cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=TJUqZQk6AAAA:8 a=EUspDBNiAAAA:8 a=8c9qzvNhB2lAFPWjGvoA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=Q0W1slMkcave-rSCEGgY:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA3NSBTYWx0ZWRfX0D6Tgls1gK+e
 LIrRlJwLY53c1SEOi2EoJVbvQcd3B4Qey18YjPYe3Zr+J9WpGhOEfI3aWsvSE1z68VXCdDkJkpJ
 baHawVYUvSSlwi5O4NKifFJCJpI+U+A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060075

Add the initial device tree for the Advantech SOM-DB5830 platform based on
the Qualcomm X1E80100 SoC.

The platform consists of an Advantech SOM-6820 system-on-module (SoM)
mounted on an Advantech SOM-DB5830 carrier board. The SOM integrates an
IQ X7181 EVK SiP containing the Qualcomm X1E80100 SoC and its supporting
components.

Compared to the HAMOA IOT EVK, PCIe controllers 3, 5 and 6 are routed to
expansion slots, while PCIe controller 4 is connected to an ASM1164
SATA controller. The platform does not provide a USB Type-C connector.
The eUSB repeater (TUSB2E111YCGR) is configured through hardware strapping
pins and therefore requires no software control.

The initial device tree includes support for:
- UART
- Regulators
- USB
- PCIe
- Pinctrl
- ADSP, CDSP
- UFS
- Graphics
- Video

Regulators, pinctrl, graphics, video, ADSP and CDSP support are
inherited from the common hamoa-iot-som.dtsi description.

Co-developed-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Co-developed-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Signed-off-by: Ziyue zhang <ziyue.zhang@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi  |  54 ++++++++++++
 arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts | 119 ++++++++++++++++++++++++++
 3 files changed, 174 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..0b5909115c22 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -24,6 +24,7 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-som-db5830.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5210-rdp504.dtb
diff --git a/arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi b/arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi
new file mode 100644
index 000000000000..fec6c4d0b927
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-som-6820.dtsi
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SoM: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
+ */
+
+#include "hamoa-iot-som.dtsi"
+
+/ {
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l3i_0p8>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 238 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l2i_1p2>;
+	vccq-max-microamp = <1200000>;
+
+	status = "okay";
+};
+
+&usb_1_ss0 {
+	/delete-property/ usb-role-switch;
+	dr_mode = "peripheral";
+};
+
+&usb_1_ss1 {
+	/delete-property/ usb-role-switch;
+	dr_mode = "host";
+};
+
+&usb_1_ss2 {
+	/delete-property/ usb-role-switch;
+	dr_mode = "host";
+};
diff --git a/arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts b/arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts
new file mode 100644
index 000000000000..1697e908fc39
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/hamoa-som-db5830.dts
@@ -0,0 +1,119 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ *
+ * SoM: https://advdownload.advantech.com.cn/productfile/PIS/SOM-6820/file/SOM-6820_DS(052925)20250529110758.pdf
+ * carrier board: https://www.advantech.com.cn/zh-cn/products/1-fc23ff/som-db5830/mod_16b1a718-27d6-4a4c-8684-e8f2a8e9c57b
+ */
+
+/dts-v1/;
+
+#include "hamoa-som-6820.dtsi"
+
+/ {
+	model = "Advantech SOM-6820 on SOM-DB5830";
+	compatible = "advantech,som-db5830", "advantech,som-6820",
+		     "qcom,iq-x7181-evk-som", "qcom,x1e80100";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart21;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 143 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 145 GPIO_ACTIVE_LOW>;
+};
+
+&pcie4_port0 {
+	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
+};
+
+&pcie5_port0 {
+	reset-gpios = <&tlmm 149 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+};
+
+&pcie6a_port0 {
+	reset-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
+};
+
+&thermal_zones {
+	gpuss-0-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-1-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-2-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-3-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-4-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-5-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-6-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+
+	gpuss-7-thermal {
+		trips {
+			trip-point0 {
+				temperature = <105000>;
+			};
+		};
+	};
+};
+
+&uart21 {
+	compatible = "qcom,geni-debug-uart";
+
+	status = "okay";
+};

-- 
2.43.0
