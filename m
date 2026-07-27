Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458EA377EBF
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785161809; cv=none; b=H0aduUvQQQkHmGd1w+r4Z/XL7QqS/KzfYyJwX+YIlg4nMQC/vovwuh3k+sEQd72VEm5G7lSUTs9j3BFq9igc29UebkOit4vpLoQa747RnlEAfLrhOYwtbPW4e3answQbNqm9u0jHhliO3UMa7LgDR22lk4NMv5i1L09JezfGGIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785161809; c=relaxed/simple;
	bh=Lm+Qs1/X1Ne1KTmH6QMc94z6sOw3xqZlEpcMmC9HJw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VxB0hfudc4omuA/12koLBU1Q8/l4tTMszm3yZqhVf2KGtkzxRUJMsLILVICe5joAOnbQAMm7E38WTcxjAzFnlAK0/uzgIe9DjAE8K/8MRNC96gqVx1WWW3HD5sSLw4qHukmw/NpQ4swO+yRnYMIto4nV+5pvwyAngraAqVImG3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JjWCznj/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EAmGe/66; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JjWCznj/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EAmGe/66"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RDlYW23895534
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QNyArashviEcjlmFfDJjnSFH2n/LYzGtQkjXdqsLow=; b=JjWCznj///pKlF3M
	RYMQLHLlXsKWdzv5lvfbYb+HZbIbJ9Xpb16AT8XFCUKiS1APR2S0WhZmzYRL5+DC
	cPdMy2++V74aavu5aUgL7FI/NjMQua8FTBAyuOYN2k6me6ZB0bKejtZBh7pHIhyb
	5GTT+6IRuct7+vraFy6g9NYs6kBjz7mpu6CsvpOKoqOjPUM8Uezpv6DhBcoRJIfb
	gE3sODERATGEYtM9bg64EQJVB5OBoD2yQEZfo+F9iAsNyzvv50eUnl+QJaUXnCXX
	cQrH7yg3fhqHPnVbiVyAOBnLT6yG8/kWOAstW+nC7ZfQXTG3F+z2IucOOGbw2s84
	6gCvdQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fnsxs2y8t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 14:16:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8d1600b3so909250a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jul 2026 07:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785161804; x=1785766604; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1QNyArashviEcjlmFfDJjnSFH2n/LYzGtQkjXdqsLow=;
        b=EAmGe/66enhvH3zYzUcgzmquq/Y7J+XIjXVE5c7jVM1R8WWfglooEDkHoj7RCQqzyV
         EX37rpOU4fvwkDjCjDLm+sjlRft4HkgvjTCmxX+oNPR8zWeMH9xT7EM20lgtDCq+ATve
         uSXHoOGxQD8mo+CMdkiOwBKfklJlaldD2ytwDHk0ESmuvaYoRezx3gJs580zR2E5SaUX
         gxIr6qVgmb197Xjxvb5JNAEsY5xMW0yvHostduX2Ndl+ebH/dEgpnRn+WgvuhRCh94iW
         iIwobKRulKDBU0Z+ly/h935trCCDAeEntFI3YhhHKnyqcndRcgvu+wr0OKHVgTZjsigj
         mK2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785161804; x=1785766604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1QNyArashviEcjlmFfDJjnSFH2n/LYzGtQkjXdqsLow=;
        b=eJUg8DIDPLUPZOjidxGCnpZa6sd6+ql5KgabxaG73/Tw8FrKG8tiGxI06rJyN4rMJW
         v6/gayx/3aq6cJ2msx3IQ6CdbWV6Of1VZzvKPYokQVeU5l3R+BTxLXDwtilYJn+CCI0b
         ygpCycm023nhTuWVy9xJPBhQvFy2Oxwlnf4Oxv5fO/qV1bDLXNVLf9RfVnuOEtR6Cgeg
         zcUY1PeKYdzpkFHhD5JV1tkVPc5v/k0/RqPgaJ1Rc10cOM5LNAi1sbYCpb30aPP0wZBQ
         DId8fgrwCeWoM1gUJW3Hf3L3R2oeVe20FmHEim5b7Xdf4D2Nw9skh9PFJFAOugdqOiWr
         aSyA==
X-Forwarded-Encrypted: i=1; AHgh+Rp2M1wAftbLpRbv63uvnzhkeivds86EH0vKgxk+dnI8R7nFUwTQXhT3uOP9yEODN/5yeNBSVD5ypIUyNhgz@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfy5HXn2z3LiSeqs/ghT+DqqhplAUK3yZ0ZJrxBv9LX6iT2v43
	uCAtr97+hI8WTw6rAcPhtxd6kSBXbyoNfB6nfp77GryC2z0rzUr/9Y69IQdyS5KpDq56973uoH/
	gKeZAPA0gIcBTng8jc3//qSAd4BVSaTnnVFljOmhK6bk2+COnR2H+WL1l01dTwROAzO5C
X-Gm-Gg: AR+sD10GSN0+cnPf0I5Xj1OIYzwW9Dqnwpdf/HnV09Mde+GEVzn+yfMu3cqFeu8Fhbk
	jNm2vdftlDub0vk7nhkK+Nd/wa0o8TNE9MR4j2MiQp9HlQMrgtg1OqwN4AUu2Tb+RFV9UdRIdfM
	+DFILALV5coizlRQGsGGPS4U3CN6oSZxYPuNnxV4GwHNTwsTFXGBvacPHLw9zPSXdVzd3jrzN13
	41bPz/I57QpH2ms0y9WOjkb8IZ/RIpCtOY2huRPZ8Fz90r2JE8fm/0nqA+8wvOVHDdRvoekaTYb
	3GHvo02JoG1UUQADPQzyA5Y1FmvS8Dh4t2WLLGj4pddvNzEOVTu5Hq06aU6M8ML/rRYgIHFZWcB
	6Q4Gl4xEvsQwP9UA0s1JS8KPn/CaXgmktE8Wd6LfFtYmFQHHf4wQ=
X-Received: by 2002:a17:90b:3b87:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-38f62843ecbmr284551a91.3.1785161804093;
        Mon, 27 Jul 2026 07:16:44 -0700 (PDT)
X-Received: by 2002:a17:90b:3b87:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-38f62843ecbmr284536a91.3.1785161803598;
        Mon, 27 Jul 2026 07:16:43 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm88012281c88.15.2026.07.27.07.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:16:43 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
Date: Mon, 27 Jul 2026 19:46:32 +0530
Subject: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2
 Key E connector
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-b4-monaco-evk-m2-v1-v1-2-5429cce68599@oss.qualcomm.com>
References: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
In-Reply-To: <20260727-b4-monaco-evk-m2-v1-v1-0-5429cce68599@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX7u8DtWnoN8/8
 IaSzE2rM7ND7G2Bu/Q3RFm+86LkSoKMr26stuxCz0nheR0TjGuZRYFmavjIkHr1DR9Pm3TXP1N4
 YPthtdEqalIzHJRYErNIYh30Ni3/+MgHi7BlrALvpbtdZ4FO1SbzUpmt8xBqdG1kwLz1uIIiOdS
 iYhoZCfCnXhxexUyJcy5xgy9c4VG1eYlKZ/kuYmOlL8bZmI1abFKBcMX3r6DhJ9Eec37OahTV2M
 5mGnQFZ6Ild8DAVYTeHP82SdJ3NdyabbsOSRL/Yflr6cUOaYHgfvPKOxavHyw10uYVrBgoqFOZr
 H5l3pGFVWD2A91piZeD+5a/C309HLk8bN0jj9nCBPOP6EeWYy7KMDVSEUFL//RstjxgSvHTozYT
 w0SEagYovZ59MTkPXOVRlodxkggrO9Mt0qzvuqsOnFQ3NjIZj+9Vc9Vb/C6q02thL6lrQsClBCG
 JoHi5W35h9lVwTWETWQ==
X-Authority-Analysis: v=2.4 cv=EYr4hvmC c=1 sm=1 tr=0 ts=6a67684d cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=9xWqd1REYw3mqEFhcE4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: tUKDK_Rxa0B5PKBu4GKjKw65OpzpUn7T
X-Proofpoint-GUID: tUKDK_Rxa0B5PKBu4GKjKw65OpzpUn7T
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDEzNSBTYWx0ZWRfX2w6+JjbRt34L
 oeUWz/EXArEdFklk9ZN9fE6zadoLfm+H5rXzmJTLlThaRFqNd5Mu7/a6z5v83U64rayeXS//7eV
 Yk+G9SSmqf/5ER4/QzMvqui+diJA8+0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_04,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270135

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

Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco-evk.dts | 73 +++++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco-evk.dts b/arch/arm64/boot/dts/qcom/monaco-evk.dts
index 9d17ef7d2caf..87ec0be89ccf 100644
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
@@ -644,6 +701,12 @@ &pcie1_phy {
 &pcieport0 {
 	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+
+	port {
+		pcieport0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
 };
 
 &pcieport1 {
@@ -923,3 +986,13 @@ &usb_2_hsphy {
 
 	status = "okay";
 };
+
+&uart2 {
+	status = "okay";
+
+	port {
+		uart2_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};

-- 
2.34.1

