Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795590795;
	b=SI/4xmJd1+gsYEqOdKR8rxNKRqsxIAcZgIBzw/AL+MZuxlAGgrY38GFcwbuRqejt6Y5Z
	 6CqJ6Lx6cGMEP2TNRUXd/kwH0Giyr8LxmS8p3ffE+t2Ei7svCgfawt26eetgCRQ3tJBaS
	 Sazr/EiBkBFLgqPi779WTjtUjhI6s0jywvuOgMdL48x6IUbE72DvtRzpGcc1pfwZP8gqc
	 EhzuAEjmUEAX+V+i9fnfuINdW+PKSC3RAi8v+5fbCcwwEU1b3/HiTSK2HVQFjmtcPr6QK
	 OlDrztohwvLnepChR/C2XaKPdWWAMaWlaD79Hrm8W7qtZFk0DwOcl0HgoOFDNWxnslQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795590795;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=;
	b=3h3ueMouxefL1y3MqXWCVSlpwcbTMHdSTDURuUQh3yeqFRnoA9SbkCnO7htO3PjD5/LP
	 VjuURM6Cjst6YQNi+kgFDhE056EsjBvfkx0zr3bWW9YE82eh9+jFeYa3cODJf5LMaX59N
	 8ErBscebHL7fwoWEF1N+W9hdDNclQxX/nSKNJFynED3WXS1y763Zvl2IBVvw7je+v2lBd
	 AYvw5Kocpb3dzoChsXZlcj5hTZZJH2QH5n6cSBuKExQqBxjC6t13wiwO+jdhzLKb3ZLd1
	 bPMVG8hYz7+abAfuxhGn8to4kVI2t4zKAZA4KRrtQ6cYQ7FrK9lR6LX3I7tlLfZJ29g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PztFO77K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zh4LbYWp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F33C606A6BA
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F33C606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PztFO77K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zh4LbYWp
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP69s511006327
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:13:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=; b=PztFO77K9tDUsde0
	rwlFKkoHdvhYL8Mad+G5RB0JDvuLva6fYqOcgnUOOnCuJAwCh52LHFtVHRziD4mw
	cpCqWOAc+AsWakXkcL0crMaClkCiGEwTe8eS1xHCmDsrPetfBIdpaNdQ6Bd6LgYy
	KQrPzy41iSO4fbUp2mgvI79BTv23hyXR5P75tfq3w2E7mhjjtEfXk8SZNjOehuZs
	6Galr/xximmPfQ0c8Hd/6ZD1+5RreNMZ900oXBBkzIw4txs9S8AWf6qErjGVgA9p
	8NeGQEucbR+qa+GAsPU/2GvyPbe2u/Ym0Bu+wZ0tpLauAeLt88xtKHO0hOKDEbNN
	R+M1sg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa28u6m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 07:13:04 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cdd77f53db5so2851371a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 23:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795590783; x=1796195583; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=;
        b=Zh4LbYWp/1I7F3YgNHsJVLiWjLGpMolb1MMyozibwpVnac0RMy/kUwMGuPzSMDsxHn
         AsF0jWngBqsCqh8XglhC/fdTqYVSFQVb6V4R2h408y2heYBDLSmUEPRMyFMeHsQD91bD
         d6k/NzCWq1ftrGbpbzYLPiQu2TfPeWu0ulfhHwQNtXEoJ+otH15HZ8egbDWVGJUI3VC8
         0/z17tGdOPtgZjdeZvDfXMrzwGB1JjhEOJDATJWTOayZ7uxNiPUwAnSsFSYSL/7tL4ZU
         CoiuCrOcgXuQBjsoHNjxS9APte743mTSqbEzWqaTfgsfF+Lb2fYYgWlJUXNnQQI4kjNc
         E6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795590783; x=1796195583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z187NNFVs++duTwL2d9zlzyyvZbXrRdA0stePHS1Wb4=;
        b=RZnVWNAu2CC3WMscF+pNuXaik281r/FK4sEkfwidtEtzjWHRLz7LkmxgHi1PSkaY8K
         hnME0gfq69B6fHIss50VESK+5k7l9meD3VLGSxsF3H61oyD5h81uAfbFa9CcYr6Y3QXu
         HPMZx9QYYv9H+D8OCSzFLUoledTaP/pWhVWw26IoN6k/TZNnW7AmzlHGPr2TnLCA7cz3
         jIDMsYeB2nMsXK5Idpzio/6gCIsRq1Li3EZU8ujGV+av0aDwCCeww2yySLW9mnpMDlsX
         2sGBCa/r1xPxlDrQOX64xRhr/vu+0zz7M3vs46vBACANucnbcchEjQNYv0BuCevOEbve
         yZJA==
X-Gm-Message-State: APuU4Z9Z3icxdMhTzI+LcVsxI7AjEM6rRfkm1FuGNTsn1YV3aZpxxNGl
	5WuON/TUALI1+LOboy1hS6XLtuvu6+a8/UMxp41fn5RB6KimG2kWiXYOgS9iIRQtcVkRp1mWSoR
	L/+CT1u3M1qlSAV7/2FQUonQEAjv/ns2CZ1xWv55fITQPhqaJBU/9T1FCYKswIq3/svCt
X-Gm-Gg: AZFdTZeduo1WVRFk+JqniTpw4MSCz750Ct3njJ8MRJtXbJ6h7fFKdTJEX494Jblb/or
	owilxrT04tufU9BK7VuVFh5JMfq8JE25m+DtBL/4J5Tkd/EwVMcLJxqiH52ZuYcCR9jVUvInpuU
	Qe+ZaT6FxYwWjl7TDjn7aTuOPw0PqfB/l+/UNgfNf5P5fhjMhE3Ia0vOHPpmLjITrV2zIR+E8NM
	JEktKW3nsp8nbLctvCBEN4veRkkTY54PpyznaKptHR2Fy7JiP9hG5c4CJVUkEyDGqJWsYaF/D9H
	uY0nOIfSgVGweu6+IygsiDD4jexqlniPujj0En5qfMcafd4Fg3VwJjwqQ8OOtWQFU8PM3aPjPGK
	k9vtziH2PMyMVjAmHCu4FRbFavppzJb4WMJz40B6RcqO8Uq0Yx58bU6hM0VMYCMFdPnBYcmE=
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr15976521a91.6.1795590783354;
        Tue, 24 Nov 2026 23:13:03 -0800 (PST)
X-Received: by 2002:a17:90b:4a48:b0:3b4:1884:984c with SMTP id 98e67ed59e1d1-3b41c7b573amr15976488a91.6.1795590782804;
        Tue, 24 Nov 2026 23:13:02 -0800 (PST)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d0575d9sm8224496a12.25.2026.11.24.23.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:13:02 -0800 (PST)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 12:42:43 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: talos: Add Talos Lyra EVK board
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
Message-Id: <20261125-talos-lyra-evk-v2-v4-3-73d768714a5a@oss.qualcomm.com>
References: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
In-Reply-To: <20261125-talos-lyra-evk-v2-v4-0-73d768714a5a@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: CZhUTU5iCarplxHue1ILzv-YsTI1j1GR
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX3CGc8N8RzA8f
 Rq4rBJEdAQm2hmaa8u59myVin+cvL8CmeFmahvQSVelZ7aeSl34y98b6ZIR3WhpADoTVQ08d3A0
 QlsJFhjVToAuxV0KfnAS/wwjXpODt5U=
X-Proofpoint-GUID: CZhUTU5iCarplxHue1ILzv-YsTI1j1GR
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b068a80 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=X4tYYTE4NjiRS8MdoAwA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAyOCBTYWx0ZWRfX5RuAdai9zMJZ
 gNAvvII7jsJcPnAZULRO80I2pPIxBC2bqTGoCr8o9epw4AnAypaU9GD5CSWP+6fbWJwqV55VmK4
 HGoBNyVIGUNiKszI+PoMPsmg37mTir+eMpJWYhvUSsIRVH/KkCvVqvUDcbUyJvhs3NCOWbWsoUv
 9NE9otMbnK1EXYYmVmsTBu9WJRz7bL5dV/kSK5Ggl1b/z5n4kKboUN9Q966EoPtkrC1VuWJwnCr
 +Jt8WyxEv7aih1Mt+NKqVV5kFjsL3pduN22mTG2WPr3CfE0Xgh0or7xQvUHeiDzgOIF8PG8STF5
 7oz1IuvTu/XIfPweWm/snQTloN6/gIwMNvHAPZQseNw5aQX45JoUy4vv3RDKeI4mGlz7zn6pWME
 hvhjD1wldLRh26ErB3iq2DomLltj7VxWfFyUa7cFbYrMIzPapihpEfcj805VUp+1H0jnf4ASr0k
 EiUM0KsW04I5RBlT9VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250028

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
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 111 ++++++++++++++++++++++++++++
 2 files changed, 116 insertions(+)

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
index 000000000000..bd9980b9259b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -0,0 +1,111 @@
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

