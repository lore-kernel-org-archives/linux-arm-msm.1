Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE5378D7D
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790565633; cv=none; b=dNnUK9rCnpRQnS9HKuWWC2HBlZPE/yMs+MWUaYW2o2V/iHhgwCI4Hu7Vq1JzvF4ihsjKlyqXkSL4V2Uy08qGOkju2ZN4wFCo6vhj6In5YOjzVdPwEjjkENF4jL5JCxxjQOXS8f7YD+GPHiv5D47V3JO6pt4+cPu6SJIsRKka6Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790565633; c=relaxed/simple;
	bh=hC8FzslIGd72yLG0IEQV2VM9sWQTLpOjDDdY3z1PLo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JE3Zsjc3X/wuEeInNuxoTLwsRPN/ValZMmoechGynMidlZJwt+/my20SqbWMa7Un7Zvw1f/SzrQ+6V7H+3YjTOjA+IuvcHAt4CbRgAYhIhgr+qJlg3uE4rS5+d7CaXFapa633jB6GFnt0RqOpRg0cMYZbrelz3C5hHs4tTVimDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mg3vf8UR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z33VsUXZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mg3vf8UR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z33VsUXZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68S2cAKO1979297
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:20:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jxT1cOjfExoe4PpbLc3S9sWrF3y7yxA29DZ3xY68yiI=; b=mg3vf8URyZ7uuuYw
	tPXXNGkPN1yNeOTG5JJUOEFpxFALmIsmJ13Nh+d2ysltwZuRC6tWYzjJbQzuk3OU
	z79NoTnY5m0D7Dzpv5B0zjjg8tU/8me1YpOZ6exX2uRzKOU5Lc/ZOIgFu30+hTNj
	NuOGodUH3++GpvHNgJVoslgLdCAvqnkQ4yo/dHNKsVumeTN4jXx2F9KTkdHP42JA
	JrOzxAjVnNqvb2ysPTd6HGbwSGtOGcxNchLTlv41kyTjaSQHEij+yw2Wu3Qd8sWs
	SDU5RDPen2al18PsAEc2jLXdS/d5QdvXjPhc3R/S0cNpUfjYn7rHGRni5dUHF2gl
	Vhrc7A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx693cda3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Sep 2026 03:20:31 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1438492fb40so3745053c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 27 Sep 2026 20:20:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790565631; x=1791170431; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jxT1cOjfExoe4PpbLc3S9sWrF3y7yxA29DZ3xY68yiI=;
        b=Z33VsUXZNwHHxjyHj4TT5M7dAVqJ4fm7zFVA/6lX4wC9GPT8cCjOVdpXn3j+mNeHmp
         +KJyO4FjnVMjYj4SyQCGkIEHIAWTvhLt+fj5y6wyV6+Ls0RgffFkuOUD+pBH6JC2dvWA
         Gp+yg/v3zImwRa1JPgQrem1667dINS36TMLRGz2ol08AFy/lbTr9TPpp7e7uAXhEiJmN
         oLUgA5/cDJRQD9g2osAOK4ZJuSjLJdItqFBoI6Cf8YpxQ1D+peyGFete0HD/L7TWiIA2
         kLPfjGIk6fNmaOazgxNDxVuhFtiyEwsGtzrkwtIJOglc3hKID9/GJHP8qOpVy4fB/7eK
         0+gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790565631; x=1791170431;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jxT1cOjfExoe4PpbLc3S9sWrF3y7yxA29DZ3xY68yiI=;
        b=bO98qMEUTbptDFH4gJ+PuTpFgOqj4E3sKJDGQQsZpyhPv8kbiIsJtUi2e3RlFn5Qt5
         4ds4r6F1jCKMhGFoPDtDbaGqIyFrwtjjzS8N+Nvk8lbhIuIQ5SU9aPkogJzN2nBduLpH
         el0rJk7iPphoTTCelpjud8qaMYLcRfhLiyAUzV4VSdGJdR+Qqr+ZU0ETXk0v9qjlKfd8
         414uIQO6QwUGBO6w2cVPTrReSX6ZkWFvCvob2i+DUFksrbrHJSSliuigO1rAuyvdwENV
         A39P9eE0vGo/wpe0d9XQWgfOAH526IJWWkCHaicpeLPgN0C/hnboUsDa6I7FVu2uAeLN
         nEbw==
X-Gm-Message-State: AFuF++nAY4b2PFRgaFVp3oVxI+ByQTPE6daXYhLMvgZiPv4y6S7sbu5k
	lqlt4BM44utvKu38yBIuYIEr0p3tHss4Pf0PweKwThWVYxWqqayE3qKRdcPLh4x3HbRoESEOeCf
	o0/Amc4Bletq97Emb6y9MmnEGsg7V0BF56Hxe6Jc+Tk0siitxAoqSnA5twYkiSBJSHAai
X-Gm-Gg: AYBFou3JBJzF2OP0WnFFhVG+D8/Zyryk64DvZQZCeX5Fkbp7fQJQTJXBxmT3O2r1vCq
	WlVE3dPYudeP3YoGdTGaBGzY4htqkirsrWYaEedTXf2UUhsVpgIvR9MTBcm7GTBx8nn4qG/6WNb
	R98ILxMwQTwgIPqsuPjaX0kThznhXishjohwEHnc+R/SvCZrbhSeEc5WNNI79oYMIIDgjdWS9Vx
	owvpP/XqXsY1bnsAzGkgn6OyLSKhFs00HOqx1W/QS/CxCTl8/yM3ZlzaNG7rZIi0RAaoXsjUGP8
	OxesFwFfjpp61vJJY9g79rr/KZH2lP52ClH6Y/qnQz+u7DrABcPJ5aOdqCtorvoE2hEmtVjP6gm
	Tdhfy9D2iaCDBXU1y1Y6yyB3m9/xKz7caZpQSp5tgM+0NuF5rEzly
X-Received: by 2002:a05:701b:4245:20b0:130:7246:10aa with SMTP id a92af1059eb24-146ce4915ffmr8009765c88.12.1790565630032;
        Sun, 27 Sep 2026 20:20:30 -0700 (PDT)
X-Received: by 2002:a05:701b:4245:20b0:130:7246:10aa with SMTP id a92af1059eb24-146ce4915ffmr8009716c88.12.1790565628775;
        Sun, 27 Sep 2026 20:20:28 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145ac67c0ccsm21235372c88.4.2026.09.27.20.20.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 20:20:28 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, abelvesa@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Ziyue zhang <ziyue.zhang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH v5 2/2] arm64: dts: qcom: Add Advantech SOM-DB5830
Date: Mon, 28 Sep 2026 11:18:49 +0800
Message-ID: <20260928-b4-hamoa-come-v5-v5-2-05940cdca85b@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
References: <20260928-b4-hamoa-come-v5-v5-0-05940cdca85b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX5Z2QOCcDDcyK
 bsiDwyUPIBaVvhoEzffn/oQ7GnRjvzpCp/JyPf9aS4qqxNsUxXgm6IK+Zh204TAcnhgTX6A18h3
 stT61n0q7aaMugaOVBw5G4+n9Zpnxxs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDAxMyBTYWx0ZWRfX7X58s2keEphJ
 pm0jd0LmexDQwpRxYF5zPhEm9RdU3AKs9PTq6i7cmUez2p2Ed29wgGUMUJdu0eHa+bK5lc32kZv
 zoTbbl9xHkkFMhB7uJG/L7wh9aoin0+rW3Vv8w9MtSbaNf6mNRzDNYKAqwX/JJE+CwYoTgsfOHx
 IHoyqdBuvY949Zq8mEZNgKn9Pd2Z/3DpRbANdvMe04rerhN2THJYEzZ0T4TA5gu8ruK7c9YGpFU
 4j/7LG/mIJhZfjktF/tXwLv0At0pUAACMdJ4wG/28VQ37/vOq6XsRnCB3asx9rfKpZVSYTJU4mm
 wouMM++UXEPnnRhfEcKQCQ3tnwIYXwL5Zs2tlZVl2oYkntdtrpGjMdGUrRUZRWUCdfkXq3W3bwI
 SEozQ8NqRS05+kRp4UOl+5y+9yKO7k7MwUWLjLqS4+9SKqo7jHC1WzQiVXWaUl1wlIJo44DpXAm
 9EBDfGISfWhtwiNDC2Q==
X-Proofpoint-GUID: syIO1WUQAafM4VgEeqao8nPP-9lQVEmp
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6ab9dcff cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=TJUqZQk6AAAA:8 a=EUspDBNiAAAA:8 a=8c9qzvNhB2lAFPWjGvoA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=Q0W1slMkcave-rSCEGgY:22
X-Proofpoint-ORIG-GUID: syIO1WUQAafM4VgEeqao8nPP-9lQVEmp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609280013

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
index daf9e3f895b8..281cbe6c402b 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -27,6 +27,7 @@ hamoa-iot-evk-el2-dtbs	:= hamoa-iot-evk.dtb x1-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-iot-evk-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-lenovo-ideacentre-mini-01q8x10.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= hamoa-som-db5830.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= hawi-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-rdp432-c2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= ipq5018-tplink-archer-ax55-v1.dtb
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
