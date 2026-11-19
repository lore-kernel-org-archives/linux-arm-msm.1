Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795112047;
	b=zUR3jm/mj50QTROabLnIk4LyCLclNbyt0UePrdsmm96qlyWK1dJbvmYCF57OKY2mD12i
	 ZDCFkHI9dqCNi3U/cKXkrDW+GpxlX6CXOxxlZFhGK7cpbJ8W0NYcZ+iyrBUMCyBQW0+Oj
	 qSbjRkrcZ9Dv1WPdjuB5ksBjz8TND2jVj0nxWVWhyhB2mvDsSzZPFaKBAnoARrqdGUbEa
	 jYdJB5tQ2LQv9N+r4ihIuCuEdGyA6hOyi0z7FfC5be2vpQrMu5yJgQAe5Vqq038+GOYMr
	 44oTd3mfJCLdqKS/Lo5dsgrWFY5hj6NSOjaMdbw0LAGYbudNefVACKHlipOjEbdA9CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795112047;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=RDf5fdxVFMmXXR9kDYGrHbNYwMq/wZELirJuHE5RruE=;
	b=Ida8YlzKBEIgeWdKIXO4kH5OF9CZklsVRz3aIktwWzcJ8ZFBqm5WNvif/0pwmvuyQJsS
	 +epjqY99pog4qyLP5NYqk8r2rzodS2B9TPnOGKVqinIUjfxBvbvUQrGXQIyHgEgkA2DqZ
	 tT9gUyub1mLYtd4Al6JVyp0R367pCjCGxuQkmdCJ7t4/KoM8p6LtwMkULr4HJ3Gt/b8Vb
	 pjHprKoMWM8UsgbHuROblK5giGhFpL53zQbdSR8OvEJoDgGrtRakog3ua4MSoq9yYDpyD
	 yYdb+W/cu4AGZVcUIDFQVZZF2VeQOEketal6z1hdvaXfhKE5gOq5n84kr1TiAVOjTsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YhV7AfcL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QexxX7yF;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D7160A261C
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 18:14:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9D7160A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YhV7AfcL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QexxX7yF
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJHobTn3032926
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 18:14:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RDf5fdxVFMm
	XXR9kDYGrHbNYwMq/wZELirJuHE5RruE=; b=YhV7AfcLvYe7MNffEXW+q448bAt
	ac3SkrsEGtk/t/0njuriT1rm0QqqpoxD2XRHwPv2jaZJQS76VmrvGNvWE4YfdAvW
	sOlMnd3jdbn0kEUdGeMSsdWNVnwjw6ylG+V6+Ga8VyvK3G5AGc10RDHhFdLOg2KU
	6KE62pYgM/EOlyvC+UBRaZbPAB3jM0VzebP3YU+x9HuO6dbnRbfG1iLGgi+pNu2n
	WB9Zgp2X5UabEC9wucXLJsCdz3jcCL+Z8lyVoYTJKTBkP/TM8VhuSogdB/rnfD0N
	4kV6yOJiWweudav/vjZE784N0icrrigpqfjNWHKeex3qtsF1GEJnR9qQtRA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1uuxb799-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 18:14:04 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3b5b49cabso29486c88.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 10:14:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795112044; x=1795716844; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RDf5fdxVFMmXXR9kDYGrHbNYwMq/wZELirJuHE5RruE=;
        b=QexxX7yFk13bEyVVOjrN36D7U8zWKLbSWVBbkIUuslzaLsIp61bbooSMH7Kgm3oWiy
         qXk5D0C+id7iia4kCpIkpfxZshcq8uKhM6gZ0BBNtvpDHjuP1C13bgLNOvWVHRNJ5ZD5
         fYer2jpc9OIO8FIg2sS12/y8PJQvnCVrDCuC2QtttHFYOVYIP8Miji5eWCflxxqfpx4b
         U2eTJ9G63djhGeqWpNBLJe16W4FnCq90/+OQJJI2R2V5RjmkIT/82SkkPK57XVE1v6v0
         Zv5WEPKWvCaluGCYweRo4x1AzkeyvJnLOCNxTtm5Ze18/eTDbaLjYyNIbIdkMWHsoaXx
         FR6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795112044; x=1795716844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RDf5fdxVFMmXXR9kDYGrHbNYwMq/wZELirJuHE5RruE=;
        b=QINUfdqRNQNO1svMKCseG5ifdNtKRa7JoANPf26qeMp8vTI9oRFoOm4cBMbfBIDInO
         OeXXUePTbb4NBhUF3YNEgyKgYwVnApbivr/8ig7rZqHEgfWYSMXzp6TKyPkya752AOF+
         dq5Fmuh9uuwTHf7xc90WpDkuGm8Ti3C2h+TMYw8jImxQSIC7nmQactSQfIaD7qUp5DfY
         h1Flk02GsYMb+pLCkYLJmyL04+8rlzcBYnTto2UxHNUqnLkSe8gcaXPmSCMdNIL3/8t8
         WPJBk6DsUdmFitB3z1NHVRTxy0OV6ckVllq/QXuKi0szyUimmwzDvZ9qLJhAGJ7eC7Su
         KCIQ==
X-Forwarded-Encrypted: i=1; AL+hErGJ1rpMKnAhHutU0HDIdkNO58dBzYzJqpSJM0K3OiFOT12PGS8rqK1xkrWigvJw/MNNyvm/OhOFJPM8+kpy@vger.kernel.org
X-Gm-Message-State: APuU4Z9DPbddQJQxbaTjvz4ofF1jNOakXsJ+aaBBL4BuAxKSx4EbgOjU
	wqJbo9T+glfbyPQ642NRE8icymrS2Ijsgeyx8dJXQkSRfgyf4oBus2yFszy2X2NrA4IEvahIL0T
	5JEOg7ygyNlPNCMkS5g2FG3Tf2tm2Vd+xdKk7aQUnZ+sW1d44QIkkuf1L2EO6OPt/Of1z
X-Gm-Gg: AYBFou3xMYnmDU8gs9KhkIx47zrsAgcFyE694sDgDXlCpMv8ZJhLsZ4Jl5AlYC5gilc
	OsydFixPdGRwg0lIx2dJ/jctXRt/RyO7nyX/hUpmGzhlIOM0+9e2KLvaaQrIdhJrkfPTNiJY7vw
	qfn0bKx0Xp57dx62xoOxRuWCN2jGAQIGbnDgJElsgqhWumWOto+haXtL3tbFWnU2By45kjMvdSp
	0EBeKHvzInbqCiGsb9cxRNMyFSgjKjYDUDsHthZLbXqogNp5u3GpGOi5BeojPlSPg7qfO9as5K0
	kI7wXGTNJNkM3iQ6tAIF5kj3edz+PFN8g6pfc5iMhxxpnZVzyALgssP2i7RMe7tcLXeii1nSAmR
	uGEP43a7Tks7Gik4xvvTHJmTSc13tnsYSJmXG7clTE7J5TcRTWPx7AgpCpnC1r1XRKyj1l/ud12
	IM9w==
X-Received: by 2002:a05:7022:3f07:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b55693c483mr353332c88.39.1795112043331;
        Thu, 19 Nov 2026 10:14:03 -0800 (PST)
X-Received: by 2002:a05:7022:3f07:b0:1a9:cad6:5b58 with SMTP id a92af1059eb24-1b55693c483mr353313c88.39.1795112042713;
        Thu, 19 Nov 2026 10:14:02 -0800 (PST)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567e2bd1sm793548c88.3.2026.11.19.10.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 10:14:02 -0800 (PST)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: qcom: lemans-draco-evk: Wire up CYPD6129 USB Type-C ports
Date: Thu, 19 Nov 2026 23:43:49 +0530
Message-ID: <20261119181349.2017404-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
References: <20261119181349.2017404-1-akash.kumar@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: n6nVVbrahmyTVq3hU8zlk9XqqiTrJxGl
X-Proofpoint-GUID: n6nVVbrahmyTVq3hU8zlk9XqqiTrJxGl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX3c1PYZ12hUwM
 XXoh/g4VtV4NSKlXns7wNGPrRUjGXEmzuXysh74PdurSmscUJXG66MbaYge31ATUZqgRNhe5fC2
 Db+YL1dfZ0UpsWWwWUXmSJr++yHxgUE=
X-Authority-Analysis: v=2.4 cv=Q89HcI2a c=1 sm=1 tr=0 ts=6aff3c6c cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=N0a5BPbhDuVZEP_7cpEA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA3MiBTYWx0ZWRfX3a7gCkVaNMVm
 M+EJovvfJNwiRpxsPZHTCI80Mp/4LCXhepIbS+O7qkypG6YIB59pImrpN2XeRNbjk0hLHRHUt1m
 UFj3pf2/gSOpOIWg5DmEKWYQSinsZKrfCOHaEH10Xz7lk8LUzkmSr3625KjVLbZSmCi/4SUZxyK
 VJqRHf/GPRo/k1+7ugYXVgH6X+giRycWxiEDyjbWZSqfnwY1xIEFTDKMekXmu7p8TL0XVv8CWpJ
 0r44lhjGRxXioZVyjuadKSJ9mwzImPIzv3o3CH/m/GaSaMjUSzbtxVFWm8TP5S6JSqW9LH6k4AU
 aysvvyok9US9N/vnLR2HqC7OAA4OFOirvZYCWgkO/i8IC8KcnBgvdVWMD7MO54QWit9h1cZu74Z
 D1nrziuWuDrbUcy58LJNwXLUJhgcUREqzY/GDq7MvRL75aVxti0QpK9SVEMmrIxqOXpGapdb9+g
 btmwzrNmgsE94rOVYaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190072

Add the CYPD6129 UCSI PD controller, reached through a PCA9546 I2C
mux on i2c11, for the two USB Type-C connectors on the Draco EVK
carrier board. Hook up its OF graph connectors to the usb_1 HS/SS
endpoints to drive Type-C role switching and SuperSpeed/HS muxing.

Signed-off-by: Akash Kumar <akash.kumar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-draco-evk.dts | 110 ++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
index 7ac3a867d29a..fe7c676b8035 100644
--- a/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-draco-evk.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/pwm/pwm.h>
 #include "lemans-draco-som.dtsi"
 
@@ -351,6 +352,89 @@ queue3 {
 	};
 };
 
+&i2c11 {
+	status = "okay";
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9546";
+		reg = <0x70>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@3 {
+			reg = <3>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			typec@40 {
+				compatible = "cypress,cypd6229", "cypress,cypd6129";
+				reg = <0x40>;
+				interrupts-extended = <&pmm8654au_2_gpios 5 IRQ_TYPE_LEVEL_LOW>;
+				pinctrl-0 = <&usb0_intr_state>;
+				pinctrl-names = "default";
+				wakeup-source;
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				connector@0 {
+					compatible = "usb-c-connector";
+					reg = <0>;
+					label = "USB0-Type-C";
+					data-role = "dual";
+					power-role = "dual";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							ucsi_ccg_port0_hs: endpoint {
+								remote-endpoint = <&usb_0_dwc3_hs>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+							ucsi_ccg_port0_ss: endpoint {
+								remote-endpoint = <&usb_0_dwc3_ss>;
+							};
+						};
+					};
+				};
+
+				connector@1 {
+					compatible = "usb-c-connector";
+					reg = <1>;
+					label = "USB1-Type-C";
+					data-role = "dual";
+					power-role = "dual";
+
+					ports {
+						#address-cells = <1>;
+						#size-cells = <0>;
+
+						port@0 {
+							reg = <0>;
+							ucsi_ccg_port1_hs: endpoint {
+								remote-endpoint = <&usb_1_dwc3_hs>;
+							};
+						};
+
+						port@1 {
+							reg = <1>;
+							ucsi_ccg_port1_ss: endpoint {
+								remote-endpoint = <&usb_1_dwc3_ss>;
+							};
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
 &i2c18 {
 	status = "okay";
 
@@ -636,6 +720,16 @@ pcie@0,1 {
 	};
 };
 
+&pmm8654au_2_gpios {
+	usb0_intr_state: usb0-intr-state {
+		pins = "gpio5";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		power-source = <0>;
+	};
+};
+
 &qup_i2c4_default {
 	drive-strength = <6>;
 	bias-pull-up;
@@ -776,3 +870,19 @@ uart17_ep: endpoint {
 		};
 	};
 };
+
+&usb_0_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port0_hs>;
+};
+
+&usb_0_dwc3_ss {
+	remote-endpoint = <&ucsi_ccg_port0_ss>;
+};
+
+&usb_1_dwc3_hs {
+	remote-endpoint = <&ucsi_ccg_port1_hs>;
+};
+
+&usb_1_dwc3_ss {
+	remote-endpoint = <&ucsi_ccg_port1_ss>;
+};
-- 
2.43.0

