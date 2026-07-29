Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FEB8385D72
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292849; cv=none; b=G/iu3pGb+TDFqpbdGwduRyQurjJRdQaxjbmoRyNlVq+5Sh33j/qoGnd9GTwd5DeSurl1PPzSnETYuOpPWYPBgk0wOONgoIePXnG31hxKNKb68z0fxyf3urBtxqsIGw+8Tj5peuRzuywIiuooL+Ewxk1lASoGHnvvNcjOq+Da0HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292849; c=relaxed/simple;
	bh=jZRQuBJFgH3dMCgZK+oQgCKyJeHLuZB2H4ExRaw+5Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MZzDWOrPo3x1iWUk2DgoFHif6aqOor5JWYMML3rV6Xqu9MxapFwzlEwhXqXOlkinlffXK3jWBgZUcGvJXhEXxrc/HDBAGw4872wQwArsfakhbNX2T+p0ZPEkcgWT/hXIDDQ/8HYlgBlLuoSbJuBnlCzs+BJXps/28NQman2cqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WsjFqgJY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PycUipiy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsjFqgJY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PycUipiy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66T1Hqh44025937
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D5TpYVMvpCAoUbl15g3r+9NzTsSj5tqT5A0tuokNfL8=; b=WsjFqgJYqmBvNiej
	WIKDBa3hCeIUuB/O98rqo02SgeqB7QVVaOE7lraWzHlON6DJIgxb9ZgFeXdolIez
	w0qJfuyB4xcVcIqO78aMATr4dUIZrm4oAbIw5xJ6uZO/jWaFLxC3lQwcwA8mhuNs
	GZYhVEdfJ0/Yiaoo2MQxaYGqV5M2WL3od3PtgxYcflgL+4onQV6JwPPuRug8Cuo2
	tpc4LGptUPlh4DXJvwvYETWGF9qfRPTGIzItYLuktImOLYzxVOERfJIngQ4O1grJ
	U8aiLgf0sPuSkTkr/JMi/oeTDpJT43FKhmhy9pHeNASa+d/xpqLTXpOZCBtnFSUL
	8uV2NA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fq0q0hu5g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 02:40:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccbdbeffb9so837175ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 19:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785292847; x=1785897647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D5TpYVMvpCAoUbl15g3r+9NzTsSj5tqT5A0tuokNfL8=;
        b=PycUipiyQeXfqqjFsFfXnIkpxChl2b8Ncb6J8tu7dxw4ta9f5vwO3JNpVuUlaiMZSC
         rnWZoA2yEf7nJmr0VNTjj9pYbqWRE9Aea2P2n2WXh5dUUNSdMNn9SbiaGDiq/x0+vsK/
         A6sXcz9je5vMlCEgD1nj2b/Y5uzw4UDgl4j23piTBWHohz0jFwx0VW5zxyKSkRhGma9n
         VGbpzwgLSyLMgT3KD1iY8hvwW4ynSojgP7CR67q5lZFUVSaPDUx91sLsNBF1AFIoF5BE
         59NAqJdEXq9wsIhU3dLtUADV7FD7sBif1U+HbjJ0DLOxpDSgabZnrNR7qUwRS+EvaTK9
         BMRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785292847; x=1785897647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D5TpYVMvpCAoUbl15g3r+9NzTsSj5tqT5A0tuokNfL8=;
        b=Fg8eXy3H2bnTmyhD5LdaN3w//bWq1MIRIuECk5+SrtDGDek43V2fUn614fXbtcM0tk
         8Js/OZMDbUpLV1fdyXbIqa4EK0N0PK1fh3MY94FGrRLGOToH6fc9PNqPgd0gDWrD2I1e
         GCLVWRM8IMfrws9ZhPkdBvAuTyP4KGBJ+z/yLDwuLq2FzIrofVbfNQMRTnILBZLW3IrX
         JbXeD/eb2SJdj+gblVfLF0QKsY/M27g3XskrGkG4QS0ssY1znHR1EJeg+2y+zebky0Lu
         jfKaNp1m+3kfVBcClol6N/2s+2Y8PMXPR6HxE1+sF+FNy1q7MiPQO64vOrYZiKLxAL2A
         kJPw==
X-Forwarded-Encrypted: i=1; AHgh+Rq38znVYLD5rYYL3ZgugRSof56rgUGzvUUgiDwgegnWYR4UPMYvFfrO9Vv+92RMja6qwAIUqRsNkBKxNMn8@vger.kernel.org
X-Gm-Message-State: AOJu0YzzkVWHsCX7FrCQkIt9PFXk/lV6fQ7LE8fbA3YxeXX8ARDzWKpq
	IaNkll9Y7ZpogGjughLYDOq/jzPoUd7XYVjmLFndmtQiB73HQQKm63qs/R3CGMa6C5uyvh2wrUa
	u+vhiXNXHVDib0iPM5/4ZrLaPI6V8pGazX+wlPkR77HYiZRHCKwxDJHE68GaOdWI/PyXk
X-Gm-Gg: AR+sD11Cl/Tj1AxzFxK66eeZcAsDuBFsEC+xIF8jlwW71E54aYrMb65bjiYZrhLmJTG
	NfeHq+gYBm6pTtk7xowsHSLp4oq2Q4muU3HA8NnHwglYzBV47TjsFxXoAStNYvVCx5emp/uSUkl
	QBMpFc6hIV6nA4rT8vXo4drrIOq8tezF7qSvloa0EYo1ja1zNnpwhQEYVBI+YVwq7f7qpMjB5J4
	l7ywWINrTEOA8crWcS2cDxu33uDPXF5GQdWvKrmf/DfYRsQQyo6Zq9wm9lGCBBTX8RKm8iSBK4q
	TA8zisIBmvGVawFLrtYHaFUyuCck/8P/nuv4bALjfSJwFWgpJOdcSWIqP9pANxnrnKgQEfoUEL5
	91ACA3FzIJunaf4qo5dXr8DPfZJBN9B7/Id63urKG9mYGyU6nl7E=
X-Received: by 2002:a17:903:1b03:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2d015a0ed80mr46375595ad.2.1785292846711;
        Tue, 28 Jul 2026 19:40:46 -0700 (PDT)
X-Received: by 2002:a17:903:1b03:b0:2ca:ecf6:9115 with SMTP id d9443c01a7336-2d015a0ed80mr46375385ad.2.1785292846294;
        Tue, 28 Jul 2026 19:40:46 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc64c2sm4052694eec.19.2026.07.28.19.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 19:40:45 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 08:10:31 +0530
Subject: [PATCH v2 3/3] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-b4-monaco-evk-m2-v1-v2-3-0548e1dab760@oss.qualcomm.com>
References: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
In-Reply-To: <20260729-b4-monaco-evk-m2-v1-v2-0-0548e1dab760@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: quic_chezhou@quicinc.com, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Wei Deng <wei.deng@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX14qzFqs6YQnM
 jv9pVzoL7idNpa549kS+8c5khmTxIj+tsA6/ss9hATsojZb755Hcz4s0oHRx6H0qkW5OF5N1CwT
 MPaTcP4hdhaBut+BvrAhGphF3VaVnmYaZGHmLJJy4iyOzkEigfp8/V7b8GEzgL8VVcLoiIiq2b+
 7w4qKLBuowwoWmbCKnGD5asvLrgoI3bDNixDIWBxjkD9Yxc4u/r4wIMWr1A6sUuViwNzRITkB87
 hAMDUen9i3AfQxrLZisrfmath+dGvhRvHaLd1vfd8So3TcwpmXEBOeVNc1WNtSrEm5RBKGAuozQ
 ZW4VPZqoHYqfM/Ohfdz89r8jq+ihHUCLTMIZjRaXr3LOAAKwKGNnXo7iKRbCr1O4x31irSsTRfz
 OUr6czzlJ2rCeFPL1GeTTyAx2DfWQhi6fD7/HuOt9S7KGR+t3IJqn8srwo4CM3w1oRlDZGeXS97
 nps9UhdRWV9MtfmVMPA==
X-Proofpoint-ORIG-GUID: YDz-ZbFLn5XdOvA305tlXNtb44QmFWzb
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDAxOSBTYWx0ZWRfX/v3anR6vCNH6
 R+fyGU3FFdx8hHs1yiuBby6pSCfKa8iE7kxSS7NOdf9YHow+RHntvm/S4eT4DaBwWVxObmuEYkn
 MXflQxAdubvfSSsQV+axsLQQT++SDpg=
X-Authority-Analysis: v=2.4 cv=VezH+lp9 c=1 sm=1 tr=0 ts=6a69682f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MLakmYnuSw9freleF3wA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: YDz-ZbFLn5XdOvA305tlXNtb44QmFWzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_01,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607290019

The monaco EVK has a PCIe M.2 Mechanical Key E connector to connect
wireless connectivity cards over PCIe and UART interfaces. Hence,
describe the connector node and link it with the PCIe 0 Root Port and
UART2 nodes through graph port/endpoint.

The M.2 Key E connector is powered by a 3.3V fixed regulator
(vreg_wcn_3p3) which is sourced from the board's 12V DC input rail
(vreg_dcin_12v). Both regulators are always-on and are required by the
pcie-m2-e-connector binding.

Also add the serial1 = &uart2 alias, which is required for the
Bluetooth serdev device to be enumerated on the UART2 interface.

The graph endpoint anchors (pcieport0_ep, uart2_ep) referenced here are
defined in monaco.dtsi (see "arm64: dts: qcom: monaco: Add graph
port/endpoint anchors to pcieport0 and uart2").

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 69 +++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..006290c2356d 100644
--- a/arch/arm64/boot/dts/qcom/monaco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/monaco-evk.dts
@@ -21,6 +21,7 @@ aliases {
 		ethernet0 = &ethernet0;
 		i2c1 = &i2c1;
 		serial0 = &uart7;
+		serial1 = &uart2;
 		serial2 = &uart6;
 	};
 
@@ -47,6 +48,38 @@ usb2_con_hs_ep: endpoint {
 		};
 	};
 
+	connector-3 {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&vreg_wcn_3p3>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_pcie_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&pcieport0_ep>;
+				};
+			};
+
+			port@3 {
+				reg = <3>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				m2_e_uart_ep: endpoint@0 {
+					reg = <0>;
+					remote-endpoint = <&uart2_ep>;
+				};
+			};
+		};
+	};
+
 	dmic: audio-codec-0 {
 		compatible = "dmic-codec";
 		#sound-dai-cells = <0>;
@@ -91,6 +124,30 @@ usb2_vbus: regulator-usb2-vbus {
 		enable-active-high;
 	};
 
+	vreg_dcin_12v: regulator-dcin-12v {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_DCIN_12V";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VREG_WCN_3P3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		vin-supply = <&vreg_dcin_12v>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	sound {
 		compatible = "qcom,qcs8275-sndcard";
 		model = "MONACO-EVK";
@@ -646,6 +703,10 @@ &pcieport0 {
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
 };
 
+&pcieport0_ep {
+	remote-endpoint = <&m2_e_pcie_ep>;
+};
+
 &pcieport1 {
 	reset-gpios = <&tlmm 23 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 21 GPIO_ACTIVE_HIGH>;
@@ -923,3 +984,11 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&uart2 {
+	status = "okay";
+};
+
+&uart2_ep {
+	remote-endpoint = <&m2_e_uart_ep>;
+};

-- 
2.34.1

