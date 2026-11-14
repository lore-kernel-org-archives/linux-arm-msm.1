Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794670770;
	b=bQ/6kujsw3K5UydANbn0/oVK+MQRwz2rOJFLJQT+kwcMkwPgCcx5YvzSJiQWMwU5elkt
	 rbxsVtIDzYKRzf7DyAd+NndGD2+V0zpRlA3AqimxIfpd8ss5pVbXPbDYk/3TAtPeEMhjE
	 h/6uDASSrxKQQAH27ML4iU74MS+oJPpHb2xvvw8q6MZyHbBgmLE98Ciu1XF9OzPHoYX3g
	 bfkVAQUgo3n+p3FJJB8pDmWeZ18AuypW2FkDS9iH4YEEoRy133AR21gHcImlZm5UBK5Et
	 1A8lNaVmX6QpPcPBN6TB4Wi2Uhvz0qkiWNKuDDsp4aIwGksTWddaMHjRStr835VJfdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794670770;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=;
	b=V0iFTf5Be42caavsSEZm+0HCZmVvzcvMtDQ3d0cD+xQQC8GwtkxfGtHoYIzplYT8GK2x
	 eqKJZ15HDBAWAuA/48UPovFFmoBr9s3jZighnpDmsUpZYXpjbWxDHbdbAZrnX62KHpsK8
	 OHJrTWA46MSfUZZLNUa/SQikfaf8DDIlexk6wAqzwfqAdbGalU39YzYvM5W50B/mDeH8C
	 wBsHrUtWHMWts1sb/KEHBZ2egEgJWpmQ2e7aOppf/LZq/xSWz8jjz/Pto+i6a7l+UnAqP
	 GCN7p6LinzQEEROM/2ZGpopw5FduYJKSJJBcVSXor5hoAoS8vNXSYCJIrVhq4ng8zKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTP3ivf6;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zdhatu1Q;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C11606A8BE
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:39:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 14C11606A8BE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cTP3ivf6;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zdhatu1Q
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AEDjv2T3173369
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=; b=cTP3ivf6ECAC8YBw
	9xu4fuEKf2DVcmFkoxNpWJ6pwlOo53wu8N9R4HF9xBGmeDnIujobt4euOZIkoM4p
	9w8XNbByZ2Gz3QaVzfgo714omKWb9vOVQgFVZTbrwEsdfF5EjgQOBh/nOeOPSLl4
	uLxQzFB/UMotjUYj5LTrquyTYcT74OU7Fwps3OgK4ymuvtR7n3fhnVQClAI9Kady
	c9M/XDJrEGlqQTnINeq0PAis4eVSIvxKuImDi8tNmJJhTjmj9zymCHVrZJxC3RoS
	AnX6QrTZavTqveeCUKj5bp2EFrpRT5TrKPi94vyjmR0YyqYMip2JqFpOa9nol5W7
	m/He/A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhmhh3f3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 15:39:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91eee6fa56bso21921936d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 07:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794670768; x=1795275568; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=;
        b=Zdhatu1QQuNCElVdnBkUVeY3ZU/Y92N9Fii4qI299Y90NiNp7GOlY7Gc9HEWrDhroA
         D2nJgTcJkhd6gdD7wBTOFuedCveh+2g68ZIwvFWxtQB7QEj7xmZErCkNt8l5g7L848e7
         umEGeIsVZkrZpq5PbQ2BZCwDMcMC0sUrtmHVawa7d1h8i4HtD565wagZltGohLHh31ws
         3Igbuv/hJzzytg4G6cqG7+nd2UDWCUkeWv+ibxGAFlwghkmhVl+q8tNfV11eSsogIRoH
         ALrJKeKEgqAzK9InN0xu01rWZQMwgWbb4UdSRnZTxYsLiUvTOlq7zRNBQ4RepbPnXCBe
         l/BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794670768; x=1795275568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AJwCpIiUvPfpqcaTQvtJcrEnZheHjwbUexZ98D7cO9A=;
        b=vAEkgb4H5ifci2JnxwvIxkbaMCq2KmfphWCWidoSmtmXLrC2tNSkFaTCtyEA4MCDjg
         4wARsLLR2Dd8t2Qp95hFbK6TGGIEEOQ+ioVu6YVZRZ7YPqHVSm7PvVFDj3WwU6aNvap/
         2ZagnFp20mqZ5u5IZuGFoIwUKZV9ukrEni7K2Ieezub00y86zOpiLKNF9F48XXFyp9k7
         OG3zRDSlJh5LGaKMRrNnK8fJNYSNuE025taIvHDnhQt61HbhJp8oZp5DWiHvKfMRDHOh
         432sSKcFOB8Yp4RmKnKeibsz1KelhvdHXOvHdndAMOByOWkJQQ9IIj7q707/gCw7yzkc
         TTHg==
X-Gm-Message-State: APuU4Z8Dk9p8iCvPtIT98NmqPGqDhAOn/8/rHx+n1hg0MeFGUQN40YkU
	miMvbJdDEGID8phXJDsd+Q64kXT4BUrkPMy9aRW/F0OczGhzsrWe4A3253tcgcJopBfM9vvQYJu
	1v9ST4mo8Aqzos1H5NUtre+SqEnpT/s1yyxtQVNTL6VRT0MkxOS39LES+LbQR/ym1J5bd
X-Gm-Gg: AYBFou3RFRnEwdCMlshj91K1bW4q5208CiqYp8KYPceEvQzpscCsBRiPuSv3p87MZGt
	QZXQIAk+0oo/jMP+sfQc2FyGlXPGC523cn3YqeSOsLJnvIspy5P+cSljGDtP7tfQegydJzqZmsa
	wZM70wyLbZUB2A7LvqE+zzsz0/kK04RxnI5ztCvYiYz3YwOt/W4oQ/yX45exJtGAqTGHMx+VvnT
	tFvlsEjk3nCjEDh4O5B3qMJKkxObg0jF8BCKPUpGAFtuxKUwrzj4GEN1+InXDOK9nqIw44L/Ld/
	JLbkr965rSBcnWfU4AxYJCz09ZjQdcbZyG902HQa45FWUbwP5veIvUblR5z/tcg/Py+YklzLl+n
	wpgJrpipGAGj6BymMPObsWh9ucLhVVXdCfe32JVKnFUvu1A5RHaM7TeYS6s9z0PhtCI4F1y/UTi
	G2clLYoVNHrP1u
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr926688885a.16.1794670768407;
        Sat, 14 Nov 2026 07:39:28 -0800 (PST)
X-Received: by 2002:a05:620a:1a09:b0:93d:23b3:5088 with SMTP id af79cd13be357-9494bb88e1emr926686685a.16.1794670767914;
        Sat, 14 Nov 2026 07:39:27 -0800 (PST)
Received: from [127.0.1.1] (93-159-22-70.cgnat.inetia.pl. [93.159.22.70])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c50a6c826bcsm167268366b.11.2026.11.14.07.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 07:39:26 -0800 (PST)
From: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 16:39:06 +0100
Subject: [PATCH 3/4] arm64: dts: qcom: agatti: add the Embedded USB
 Debugger
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
Message-Id: <20261114-qcm2290-eud-v1-3-b6157b817377@oss.qualcomm.com>
References: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
In-Reply-To: <20261114-qcm2290-eud-v1-0-b6157b817377@oss.qualcomm.com>
To: Souradeep Chowdhury <quic_schowdhu@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-GUID: -4G9oCrGmkdKsW_BjRjpGskeFP3N87i7
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX5Vs2yNSWaJzd
 EDnyJMQK89C8t+craHExBaANHY8fXwDImN3Tehyiio7t/+4TOEmM8FyEWgNB32HxmMZlBsS4U9k
 UF8GAOtz8i7J1VNr98R/690SHi+kQEI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA2MiBTYWx0ZWRfX2F8dMgvKvcbv
 NNTN0E6GMErJtX2xJY69gIog6evjCFMAXwkQitdkhSXpJuDNvkoMCRyVk+9Zh6UiZEj71e3nDXM
 2Z3kKdMaRq2jLA+S3jWmCejxRt8TyS+WL6IYF7pxoq/b8J/BLQyGiKhdqQ+kObBXosDx1zcYHYK
 APGzfnAnAa9lL18Ijtd+hra+izqqvDCzBkjr4DzKfAuE0pf2c2KTitqgFuUP2CUGbPw45VsJpyY
 AqY7LWTzF7LVnoWCUbyZ7yG07Crqb6dQ4RPRPP3kF074FVOqZ7OJMq6QNkBpYhvaMENVpzouwYD
 ALEEwzNc2k/EKdb9Xpa7lc2vA71cCHLyGFVa1aPVtN5vpNf6nmspK3Q8BpTrU7UserUgEqPsk4R
 Cm4OHvUmYz3k7QF86yh4pUtRiJq6Hn2bKZFAYXkP8yhaqBOZuDrvhjPewU9vm/Rw6t6DPKWZUua
 M7EDtd3B3gpOiG/07Aw==
X-Authority-Analysis: v=2.4 cv=e/2T2qp/ c=1 sm=1 tr=0 ts=6af880b1 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ySe+0nHqNG5yihRO1pIWsw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=aKcbli_B80hdjCVHfU8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: -4G9oCrGmkdKsW_BjRjpGskeFP3N87i7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611140062

Describe the EUD: its CSRs at 0x1610000, the mode manager register at
0x1612000 and TCSR_APSS_SPARE_REG1 at 0x3e5018, which the secure world
writes on behalf of the driver, and its interrupt (eud_int[1], GIC SPI
189). Hook its port to a second endpoint of the dwc3 high-speed port so
the driver finds the role switch, while the board keeps the first
endpoint for its connector.

Signed-off-by: Igor Opaniuk <igor.opaniuk@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index ea9b39b1ed43..a77a5bf87838 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -826,6 +826,29 @@ gcc: clock-controller@1400000 {
 			#power-domain-cells = <1>;
 		};
 
+		eud: eud@1610000 {
+			compatible = "qcom,qcm2290-eud", "qcom,eud";
+			reg = <0x0 0x01610000 0x0 0x2000>,
+			      <0x0 0x01612000 0x0 0x1000>,
+			      <0x0 0x003e5018 0x0 0x4>;
+			interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
+
+			status = "disabled";
+
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				port@0 {
+					reg = <0>;
+
+					eud_ep: endpoint {
+						remote-endpoint = <&usb_dwc3_hs_eud>;
+					};
+				};
+			};
+		};
+
 		usb_hsphy: phy@1613000 {
 			compatible = "qcom,qcm2290-qusb2-phy";
 			reg = <0x0 0x01613000 0x0 0x180>;
@@ -1680,8 +1703,16 @@ ports {
 
 				port@0 {
 					reg = <0>;
+					#address-cells = <1>;
+					#size-cells = <0>;
 
-					usb_dwc3_hs: endpoint {
+					usb_dwc3_hs: endpoint@0 {
+						reg = <0>;
+					};
+
+					usb_dwc3_hs_eud: endpoint@1 {
+						reg = <1>;
+						remote-endpoint = <&eud_ep>;
 					};
 				};
 

-- 
2.53.0

