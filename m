Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793100739;
	b=dMYLvpJ/b40z0AUcL0Rkdnb2rYUXD0LeCM4pwY04AFEceB9yO/gSCVZGmrZzxHasHyKb
	 80VwaPxIcyU+U5bOV/EG3qAuJ96waV8Lg37yJnS5AhI9Mj/m489o4zWeDQLLzhWArFn4y
	 cXpOmB9fVaTff0OO+yuIrQzz75ix3M86gEqmVwWNd6ycuVgfvjfSXW51XpRLKJs92YaCf
	 wyKYKajcg00kX9ECDcfGHRg4sNBswAP/2GCY2l0y6gemHAsu46UyJAt0XAriiXEsrfXDP
	 9HRPu643QCUWLvRqL6sCE0KlM3ad7QzoZtwp1v/ZeM8HJX1PezGemh5NuMyxDIC5QDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793100739;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oMONoXfaSSQfMUnHoFC6kxsPf6RvJpcNVKypalH/Ysk=;
	b=H/JWDsanJmIRBhOHMcx7qh9i/IsGNw10pTML9xGC65csfayhvTWCKIHmgWjDVHTgKN8C
	 u3iPP6xico6g3J5heNY4jvrcOKbSOeim7skTgxKET8WS9VSiSXyjoKdTinE6a3B53yfAj
	 SFDlQkIplT014oHs7+pGfEeQet4HOhQKUYGfQt9apngPYVb7B5ejrSUnrKuP5rsE2Y48o
	 uPZDS9sa9jIcHsnEkqWvkHY08ll8yeZ95gl6lbZcB4tGN6mBqkciHS8PfulW2RsDFcKmn
	 iglygbBxrVgnyjIMFKZF03jVk0jBNtvhbRmffKLEjo8+6PFj5zejHKKcqMqGml2Tq7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iomVvhQg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QJ86Ntib;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA36606A331
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEA36606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iomVvhQg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QJ86Ntib
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeC213026388
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oMONoXfaSSQfMUnHoFC6kxsPf6RvJpcNVKypalH/Ysk=; b=iomVvhQgT8kt/dMU
	sdhsRBwwb7dgwri6KAKISsyebCjyTSzVQtdxCXvyk+6ZD3btwNa7IWCFB+59ptvg
	uOtF7kMQC3U7IaQ60y4oVk11wA+xwalsn/FBBAg0BLeI/3EhWfDo2PaU6fTn+/jx
	9QafIlycX4YsOQgcZ4rnZJucCy6J7IggEh/K6DZ0Bsmw1lBSNopYhXDPB/S8R+nK
	55V3+ToEnqyki2jaqmk1PLyTO+iZ8cDlfXc5Ilvu5c2trB00s5IS2xeDQIDdhXpg
	k6d0S2oCsifQq2IHGv8PYcTzr5odONcoUKcKYyKIB2mZz2QC0a6sJs3mhbd3pQpM
	2Li6yw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjh91a7vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:32:17 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8a06da65d92so2533285b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793100737; x=1793705537; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oMONoXfaSSQfMUnHoFC6kxsPf6RvJpcNVKypalH/Ysk=;
        b=QJ86NtibTXiZuaIn/N4jP4pa9rz6zcDrN1JXUkVm9p72bPhrDMGoAgFEiCC+5mKzf9
         2tpOuiZHtDDW/ntZ2FgcoMUhnTLVhjZ7Sjj77HFyP4KyP40yuawrzJRztbJFZjc7Ah65
         BJJrzZTzPn+rUbpdZgvT8upvZjMbKhDqfcoSpxIZn25Dtg/wAVd74xRIxzZ8h3NlD+tF
         oU4yn1v9EOlIK6jKI6wrVlS5dAIWIJHJxp/DXo24O7PbzFwdq6G57YoSmk7mpHZ1Yqj8
         FAaNEM75s6vA2pyfS2/B7W+NwNLo4yFohisezxKGRUAoFkApyjxgbN4klcDbTxoziYte
         ZkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793100737; x=1793705537;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oMONoXfaSSQfMUnHoFC6kxsPf6RvJpcNVKypalH/Ysk=;
        b=UUvKuH+CYtyDuO+0B5N6Mn//+sScxABYD6xkLU1QIj3UqzSvGL9u16HJr4Af303D70
         YC/XzOAK9vlJcCZISr8hrjnxQcOpr1faMVVk1/32Ui2K1Bk0BBVuAdfyTBJ/DjaH7z22
         nWi3oFlR/e2JqFVQJdfJ8iWjdTPoTsJSpm3uh+PUyyWMdGH1WvfFHzopE5CD6OWa6eIb
         yIHKdF3O+HvMPRD5Ue7V/lXzTSLehWAtKA7VdJnbamabR4RIvf7OIdZzeB9UZvJoc7Cm
         JKMbvSK2pH9qThDErgUxE+O5ji4bafgYoBDsrTJthmRysOedAQv9Opdzly+aYoO6PYlP
         Ya5w==
X-Gm-Message-State: AFq9FYKO4LJgu1UYff4xUN8I5Xhfxk2ZK4RWKZGGpU6xPp8h/19vBfar
	fQfGOw8X2E5OEBN8b01WYwCvfRa0lyv67jGJYXinNqJGR/qrIDcMV5QgVhGEYVmwDR/H0IZH0sO
	5BlunVIKVX+u2Bx4yQyXyF1j9bSXwCuGh3I2eQvsSLmu1oA88GohFw/GVOFDn98adqGqa
X-Gm-Gg: AYBFou17ahsD5qqFtP3ONCmqMfPYvIdT1HzEhnPaf2XzyTMl+9S+fW5yDklRcAQD9ij
	w/RZ+CWZ9S9J3dsF52UQSgnPmLzOKyLEXQLNJk+z7E/aFNXV0AoS4P9AzNgEyO8xO4koJP+wvDy
	optVSdsf9z+laXiIefwAuM8rNa5I6wBXn1kwgjCsdiEJdnfXO0Ol5SxmhCox9M9SWxF13Zah/Qi
	gAfbIWXE4BWGQS99bkgwQuf+zAkxujceoYWxCZjV2Ee3tgr7W+sRMhHWQgA6RvEp05LdyNNvkBd
	+2OeaYN5rjMxrD2NgIYmYX4vCxbuKye/OtGL+Kzzc/0MmVIaWDsRijesBtW0pGCs3T7D09KrNmw
	+zon+8ocqKpYvGhn17DUPAhLl5KK8qJR6qwbbAhMmDlQl28CTrmm6PT8N3iy1xU5nR9mc/Q==
X-Received: by 2002:a05:6a00:1898:b0:8a0:6905:248 with SMTP id d2e1a72fcca58-8a364f5a322mr8507392b3a.3.1793100737168;
        Tue, 27 Oct 2026 04:32:17 -0700 (PDT)
X-Received: by 2002:a05:6a00:1898:b0:8a0:6905:248 with SMTP id d2e1a72fcca58-8a364f5a322mr8507370b3a.3.1793100736643;
        Tue, 27 Oct 2026 04:32:16 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a36c0fefa3sm2143836b3a.51.2026.10.27.04.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:32:16 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:01:57 +0530
Subject: [PATCH v3 3/3] arm64: dts: qcom: talos: Add Talos Lyra EVK board
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
Message-Id: <20261027-talos-lyra-evk-v2-v3-3-658fd5a7ec99@oss.qualcomm.com>
References: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
In-Reply-To: <20261027-talos-lyra-evk-v2-v3-0-658fd5a7ec99@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>,
        Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>,
        Akash Kumar <akakum@qti.qualcomm.com>,
        Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>,
        Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>,
        Vishnu Saini <vishsain@qti.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: VBAKTWNf7b1L3ujcKQdMpnutRWsVeuAu
X-Proofpoint-GUID: VBAKTWNf7b1L3ujcKQdMpnutRWsVeuAu
X-Authority-Analysis: v=2.4 cv=TuxzFzXh c=1 sm=1 tr=0 ts=6ae08bc1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=X4tYYTE4NjiRS8MdoAwA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX6NxRUgiiFm6n
 9IzsFH2AXfSerLnOFKx1dFoQJ8tgljWJ9ZUr435DXLxaxxJsurpFf6uG+2T/3F4mVEYfzVqK1YJ
 pLJ4S32oLy/fJgihbdOTysPyy6V/r2qR8Ybp0rN68NH8bNuFvRCeuUSev7TltjgbsgU1Q7d9VMI
 uSx+SmYMYsHrjJgllUUmhn6F2ixDJ6+j8WRa+JJBt39halv8PkY4Q29Xpr1YTABxgwGZ+Qxem+b
 ciu/r11GxBnWCqDzPnlQ97fpxxYc6hoxQ6Y3oyB/JkdEItojU9ZCWnIe052jooGB/eNw3rPI07o
 008BSBPha27mK/Wo8jyNLj4I1Vk4C3ymyqfu+FgU6tpbSIxwg10mrmmOh2qq3GBKJL3j9YIUI0g
 WqxVLmLtCdXfdxkQOCzVJKXlhl/XH5HO4r1Vf8EPaYFXMO2nrX6Vt/mUh/j3lum7iFDQULCoyWD
 MA6xdMRFT3TVDFp6COg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NSBTYWx0ZWRfX9vOOJ7zqDyK2
 PxDfwLemRSw1blG/9vvvKxyoCVZA9T2O31nhtFuOrCqZW7ZfHON+BU5rvV4EtL7FkJl+9PEXCpF
 6zsQTYFkeP62KBfnVP9xxbyAFQuRoI8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270045

From: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>

Add the device tree for the Talos Lyra EVK platform which combines
the Talos Lyra EVK SoM and Lyra carrier board.

This device tree adds board-specific peripheral configuration on top
of the SoM, including:

- Native DisplayPort output
- GPIO expanders on i2c5
- SPI-attached TPM (ST33)
- USB host and peripheral controllers
- Power and reset keys

Also adds a talos-lyra-evk-el2 composite DTB combining
talos-lyra-evk.dtb with the talos-el2 overlay for hypervisor-enabled
configurations.

Co-developed-by: Akash Kumar <akakum@qti.qualcomm.com>
Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
Co-developed-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Signed-off-by: Khalid Faisal Ansari <khalid.ansari@oss.qualcomm.com>
Co-developed-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Signed-off-by: Vishnu Santhosh <vishnu.santhosh@oss.qualcomm.com>
Co-developed-by: Vishnu Saini <vishsain@qti.qualcomm.com>
Signed-off-by: Vishnu Saini <vishsain@qti.qualcomm.com>
Tested-by: Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
Signed-off-by: Avaneesh Kumar Dwivedi <avaneesh.dwivedi@oss.qualcomm.com>
Signed-off-by: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile           |   5 ++
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 115 ++++++++++++++++++++++++++++
 2 files changed, 120 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..243231692866 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -471,6 +471,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds-auo,g133han01.dtb
 talos-evk-rpi-display-2-5in-dtbs	:= \
 	talos-evk.dtb talos-evk-rpi-display-2-5in.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-rpi-display-2-5in.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
+
+talos-lyra-evk-el2-dtbs	:= talos-lyra-evk.dtb talos-el2.dtbo
+
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk-el2.dtb
 x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
 x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
new file mode 100644
index 000000000000..d4468e609911
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -0,0 +1,115 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "talos-lyra-evk-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS615 Talos Lyra EVK";
+	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
+	chassis-type = "embedded";
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+};
+
+&i2c5 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
+	expander0: gpio@20 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander1: gpio@21 {
+		compatible = "kinetic,kts1622", "ti,tcal6416";
+		reg = <0x21>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander2: gpio@38 {
+		compatible = "ti,tca9538";
+		reg = <0x38>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+
+	expander3: gpio@3c {
+		compatible = "ti,tca9538";
+		reg = <0x3c>;
+		#gpio-cells = <2>;
+		gpio-controller;
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dp0 {
+	pinctrl-0 = <&dp_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss_dp0_out {
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+	remote-endpoint = <&dp0_connector_in>;
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&spi6 {
+	status = "okay";
+
+	tpm@0 {
+		compatible = "st,st33htpm-spi", "tcg,tpm_tis-spi";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+	};
+};
+
+&tlmm {
+	dp_hot_plug_det: dp-hot-plug-det-state {
+		pins = "gpio104";
+		function = "dp_hot";
+		bias-disable;
+	};
+};
+
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};

-- 
2.43.0

