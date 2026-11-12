Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794458226;
	b=jLAQdZKxhBX+Tx8t5cmdYMyl4H7qRC46X5x5P1OtrYzlecP8NJyEIEsGiFQb4MUhjOve
	 fPavCwQUGtQNeryz9kR+dwqfOSwcP9K729vIWHiDyv/BrPhFQXRVm11Umu8OtZjixMFBQ
	 wFHR8BD6tt43NasGznO4qzfoG4JOlLqV95bc6FF4WfS57uamrqxu/wCwdEiH78AdelPbq
	 tk7UOidqmhZ19YeKb/z6XU/YrCWy4nQA4K6Ni5yUZRgGU3pQNC1smPtpvNqmFK4UYCRW6
	 2qTCDUry4EVzN83ZeLgCVLvp89Lgb+kLCV7b/PtW4sfls4rXNlWOhp1VZSgVruE+HKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794458226;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=;
	b=uUaRU4WpxuCkfBABQTXFnrYEajR9yeVN+R4FhkDjHJr8ZGys6cTHxZWZGHUMHn2aQKnk
	 qethams4WIhW2Qohs/kfUZ6eGfYz+1FQk0TEXrSamm24ETAnM2XQupwsA6mcgATzlAdiX
	 GSyOuOA3xBknhTcTzk1F1IszV9j20tLpliuaQ1/QLLnXMrKyDILGo3dx7OaaH+ZbF6gcW
	 FQjw9LoHG7EyH4ZcA1e9NVs2JnWbwPDuVFV6XK3WdZc8l0R41O/CGVNFu8gD6uJ0U+rn6
	 Ck7drmx/fjXnpPv0iEjooMrODmq1Mqqm+LbwHnbikd65OKcJGz+16RPvm6ovEvjq9gg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A8KTScis;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aNyiYJKK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF9F606B9C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDF9F606B9C3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=A8KTScis;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=aNyiYJKK
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC2Zdg8022578
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=; b=A8KTScisN04F/Dfr
	uvXgyFAAbbkKyyL7ESWlywj5IF1Sl80FCjCsU6XGms0/8XuNw3gVB/Ek6vD8awbi
	vMZ+z8fDIrUdaaswGrjDu+QzaJnv8QVK6L3tGTA+ptXSezPzPFPMkDMAwmVa/OSa
	uE8rdANa3NphI3mvdFwGJ91Nxkark/0IELIJKwMFDy67Vlr/PTuwEpEq0iCCwFj+
	SKgli9MDmtTKjPMnNK1gxlXpCLfLakssVaShi2r9iWXmytMw8E0RtnbE8kW/V+X1
	Ic31UG1RrTgSx0wNfSxlniBrpJToUlNv9UXT5dqjOqqvS4SROzYy4p2SW0LrbRKl
	ybdysw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvgjdna03-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 04:37:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36efb506f29so906005eec.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 20:37:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794458224; x=1795063024; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=;
        b=aNyiYJKKsf7mD275PQQ7ctMgE7tNoDfLpOUefIwITNjz95z+QH+RblBKbp0pBzqUIa
         DRPXjV2jy8T3muXVMePI48BJsDe51Nw0qf4KdoPTpxjWjHRYv5neVOMJnveuVDaAekv3
         dtqfjmr9JGd6TcfwpqDeXFuRHYtwY4tVNbm/2ZE39ZDid9wUVLdXDc7Y5BF1+iZCu90B
         pya2O5+2HbzvtMF06yHfgAByBfAc3zkOXjsf810BBzuSmceFq0ENW4Kc5Q5gsKxTvkTs
         zHumKU+7X+OGDoR07G0VxaJ2s8gUquViu9H55qF5QbQt2RiR3TWCFhUsXVbhdVu8F4/X
         t1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794458224; x=1795063024;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BD1bMMn/KbDXYJsti3UXRldjQuPHnp5No/CK67tDB+E=;
        b=v0cvmkJj4hWCzkCZ/jSLFIBdHOciQ7F+cuBG01plMdxEbdU2yZLF/jIkVbFxBZ7N2Z
         Owe9de/NCOT11NHfsjSgS02qLmpBkCSpi4AFSiXDgANJRWOvRGWpLVe37EGPSPmb5PCP
         vY0KgkuNfphLbjnxhyXDHOCCruVp2D7KeodZafB5aM9RBKLhW1lUfk+dglO3FHKFNMec
         whtPJVAq4/w4+ZGcRPr2VZyN5CciPovi7FDkIOCVj0WocVKYxaCxvs5hwNKzrdmppble
         RyDb4i9tg0GEtoKbHOVWhGxGKi/KhsJhhfAqXHJ5Emkh4IXPcsnw+4ltLXlEhGOUsnDF
         DWVQ==
X-Gm-Message-State: APuU4Z+52JIZmSggCGR7NE2Rzjj6M0Y2nHuHBJ/T+Vz6zsBIMkyzkTS6
	P2kYuHCC7SsfZstKn8qpSL8Q2wt38td7fvWF+m6ABdcrTwERCclMzRXJB8aN35OW8SZcaYy84wA
	UvWLqKFUS7Fk9ub52gFo3uYtLZyneRCELAt2BKj+YY5B3HdyXuNDnZemxDuRFsMqygHd32FnyZp
	vi
X-Gm-Gg: AYBFou3p1R/P7feBsAkhyb8uolsbPF7dQQzlYv+ZsonkZ6StB26OfVJhxguB1y5LUuU
	kWVs3TvVWlTrXVIT8x0FRXwg2YRqJYbBC61Gd8s66y1OUokSAmGNhhHG3qNplOsE82z3SWLDfAn
	sg4mcmVmmWEx9rG3+IlJKQbWFaQy6s3f4PtEk9LbUbynT6Io6hkmYrNVZL3b0Q5708svhTN1DNA
	JGgEP2L9nlhrwK/nX94FnfZ1SAnlQ6k4Xv03CKqUWbADg2gur4aL9paMojBPWUzCtvVlBuSHnX9
	umcCWpztyNPQseeR2RQPzthp+11weU3SO0b3yFtdMj8F9TO55usYthMaIK6skkAobEp1wRuOjeH
	vIucpKywqIlnZLxzwAhlHJoRdzk0UfSMFJ0HFY73omqk8U//8J4Y39UPneokc2g8EmyB6+aemlE
	xeoiC6Rok8HJNvQHPc8W+9VDi8e2NEXGiZdF6j3CHgaKlR6GWSO7NnaplJ3OLkLESoOcyZu8HAk
	lOGF8U=
X-Received: by 2002:a05:693c:66cb:10b0:36c:b138:651e with SMTP id 5a478bee46e88-3768675fba8mr5070344eec.22.1794458224217;
        Wed, 11 Nov 2026 20:37:04 -0800 (PST)
X-Received: by 2002:a05:693c:66cb:10b0:36c:b138:651e with SMTP id 5a478bee46e88-3768675fba8mr5070310eec.22.1794458223534;
        Wed, 11 Nov 2026 20:37:03 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe2ff5dsm21856793eec.5.2026.11.11.20.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 20:37:03 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 10:06:28 +0530
Subject: [PATCH v9 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
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
Message-Id: <20261112-08-dts-v9-9-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
In-Reply-To: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=E7tYNqdl c=1 sm=1 tr=0 ts=6af54271 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GVWKzDYot3hTMZ8E5o4A:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: MAK4X1faLEF0I5Qogu8C8U12i9ayvBt6
X-Proofpoint-GUID: MAK4X1faLEF0I5Qogu8C8U12i9ayvBt6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX7IXppi0zkljO
 tcVAIQgAuGJSz6JGG8PfRXW6xLGUbJU46afZTUdNyrlXptalQIB2mZFEY9Kd5pIXS4iQrEcyu/0
 tVS0OlvUwyngr3DGMUbuWASjiw2VLQdm+1a+hQfe2cuHTjozXekLpzQmTCzw2D0mdzya2KghKJ9
 ynB19w8wlhSKECRlah/FpfpUwsg7gOGjxMmRHjn3ekVO+q31cRzo53VU4SARioBXTLLD8rBfZ5R
 tgrHJXWqVIA3Sbbl/yqUcWt34YlHz2BsKhBqGibip77dEgTPg9S0WzSra+ZprhdWneho7Xj3a1o
 9YPvxG8XvxyvzR10WnrwwhqRG+UKr1u+/tpxB5rWosQmqPYDfUup5v7VXyzD5rTjGNllvn/kZA+
 yzDOZ6N++TwudWjJJ4ZuKkTv+nD7lnsoCBRdP5TlinqgT/gllynLKgFah5L5w1Y0JRdqc/dVKqO
 SaGCc9RdMhaDOl2bpZg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAxOCBTYWx0ZWRfX6z1GXm9lU/sp
 5cwwJ0g5JIEjtdhCA/dMkmXbcEaWaqjRRVjhskgMpl+XSCGs3zRjRgLUADWIjxV+VKynvPV4wPn
 rZlaK3KI+pL+bmi02p66EdgEwc9g7nw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120018

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 47 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 87a7e625a2a4..7cbdcf58d946 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
@@ -59,6 +59,13 @@ vreg_misc_0p925: regulator-usb-0p925 {
 	};
 };
 
+&i2c0 {
+	pinctrl-0 = <&qup_i2c0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
 &pcie0 {
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
@@ -202,6 +209,15 @@ clock-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-default-state {
+		qup-i2c0-pins {
+			pins = "gpio20", "gpio21";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+	};
+
 	qup_uart1_default_state: qup-uart1-default-state {
 		pins = "gpio38", "gpio39";
 		function = "qup_se1";
diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
index 4cb9f399d480..36f874e57b42 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -173,6 +173,14 @@ opp-300000000 {
 		};
 	};
 
+	i2c_opp_table_32mhz: opp-table-qup32mhz {
+		compatible = "operating-points-v2";
+
+		opp-32000000 {
+			opp-hz = /bits/ 64 <32000000>;
+		};
+	};
+
 	pmu {
 		compatible = "arm,cortex-a53-pmu";
 		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
@@ -460,6 +468,45 @@ uart1: serial@1a84000 {
 
 				status = "disabled";
 			};
+
+			i2c0: i2c@1a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a88000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c1: i2c@1a8c000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a8c000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
+
+			i2c2: i2c@1a94000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0x0 0x01a94000 0x0 0x4000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				clock-names = "se";
+				clock-frequency = <400000>;
+				interrupts = <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
+				operating-points-v2 = <&i2c_opp_table_32mhz>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {

-- 
2.34.1

