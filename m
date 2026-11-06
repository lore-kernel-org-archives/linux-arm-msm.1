Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793956908;
	b=oymnyiSwDcFunGrpzBEAAssyXIyx+inX2u9PrWNaXhKWNs/X0hMZvicy00u0iMgMM0d+
	 oYxUuBwKrUKGanx2J+T2NdZB740w0AMtPzzVGfUxYKFLMdcR7NynEohKhY/gFsRpppAHY
	 X/o48sVmYnGpgsEltZ9voZ4lR0JEYnjSThyCrTfoFw/3YWcB+ng+0JkbYujxRWNMCDjVO
	 ZQU6WdLzkguOwRn9A31FK1U0tZIrQPtTphy0N2b5Q3sNbWPn82LxahS5la+k52K0YwGCf
	 txHSROucLUqZIb5XTis/t6Chq+e8LH4lrbvDcMA6A38RvkCjrTBbDh8LTBVDbHMhGaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793956908;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=;
	b=lnx0fiCoSijSunfssM57xtOHl/H++O4+8naUf3aqaqIV6KqSW2jOjDUlKxGS7uCTP4F1
	 iQcD4S3pzT07QNxmvJzcYssc+qwksDfstVpaYmjts7+3qkfJcEo1eQ9vTTji3nhck7C8J
	 GstAYd9ryLElaAwxQowyAgvnkFDq8W2AyNchHC15A5ad7D5sJCHTHGaUid+PyQuiF//Rd
	 co53gbv8tdsqHgYxuXivfuc20O5nyTCLM2O6l0B4mNSvWoGR+lNqFv0Vei4jS+zHv8h4E
	 04mhoARm+zlKrzjyL4Pb9OK8/2Q772S3Iprd8gvTb+H1OUf/6BcOzahy771gcXoik1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Qzsi/72D";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYZ8YJ2H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C0AB606D807
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 09:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C0AB606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qzsi/72D;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iYZ8YJ2H
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67R3UV128952
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 09:21:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=; b=Qzsi/72DOJQ13oqI
	mXu0jlLkGfUFwwgjMZ8Yryu7Vd+HNv5eIzTngLVRCUC/9n05iNdYPF400lD4ddrk
	gXf/yTUA8NByV2T6ZgHJmjzXUppwgHjW5R/On1+LboaLEBrXcDOwi5aDgHi5zzvT
	yUCmyfcJtLDFizw8qTn44JsCBcvH1H7+qTV3evTQ0s1Y9eOjPkfIewA2FDPtDxku
	KBc5is6OgcyYTVtF+hbJp08B0eCB+OxkXJsoOakYQXAC/DlkQP2cvQ90ZQL/K0Pz
	s6rRN/jvTa1MeRnnZR6R80OwaYfpw4XfVA7DttMUHA8jcg4ByZMoV9CnRyrsI1da
	Jbt3bw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9t3gk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 09:21:47 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36d1353fdcdso1784086eec.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 01:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793956907; x=1794561707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=;
        b=iYZ8YJ2HGyFH5qCB3AHIwltBaUFxpuhuxwbhbH48RKmKPfcJCfjWJLdv4yZu/0Tini
         kZE/6nKMwPlk+YOeTXQbIM7AfAvogDlFz0LWUaH8pOaErc7gEfZQ16y+oAtNlq9VfGRD
         dbOzEpkxWBrowIomW9kea1t+6yKvSKIL7Ue2Ra+O2D8wpzF37IIrk1q4AOhiEJOPUd+7
         /R3m74zU0zVfba1FCkZnzl982cbAqfxL7LugffoQzgKuxJvcJgD7MwEqFFYFKhE4IE/4
         M+HxHSQk814YLnONrnBEYTYOePovLe1glJ6E7sKFDCn9kS1QKr6+VjaFbS63616Ztsqe
         KfaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793956907; x=1794561707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CODTdSes43w3lAuRS584NjHkqfoAMyJNgyiz2jFtuD8=;
        b=1ew+L7S76XEvL7snTCMPSqdYmsQecPE5Qg+a/JYSiOd6wrG1Mx6XU63pWOt0IwC9H0
         auIipGi/eSBwC1U0zQEmpnLggNXZqyTAUFQmqemn3Z4ru+ltDkmZmDRrGo9QhfAOgWR6
         f1HKrG0he0poG+5T9v+tk4pol9SezxqLhZnLsCZdNWtPjXvjk96fqx1owX7IZmQa1nJI
         +a33cKs+SR1mkwwgK9rHZ61C4Iu0+UP9r3y7jW0TVeTZiaBBq2aV5tqdAmSNy+M9sUDw
         FCX2sYIfedRVwEh8K+W68MJ9kpLz1/TEa24aXqIxQ6HyJ83C+8McCfy5jFVk3OSByUyg
         OGLQ==
X-Gm-Message-State: APuU4Z8A/AceuiiBC5N7ebX5SVCFwzaJpm9AkPi8zGaucpxRddeLW/6m
	c3zZw+yWRp0kFEYd1mQZqkEsbtFkizU6TNVoBF3vG+veJAoiRZJObjlFDHNi6g8/OlzwAVDMr1c
	prtg/7fpfnmgfssBDmZKwnQjGHVA7oJqzutgP7HOxllW7nx3Qh6ZmSJl/eGvEhYkLOguT
X-Gm-Gg: AYBFou0FUnNuFYqVWKp8+zKXX+tRAztQTWh/BzMlpxObtdSFapgxNmlRKFxRPrmEaKt
	XYhbRYDdmmisD4sv/RQfTsvF/SkjYYwIOtQHCL+wkosF0LSKDXgXnWH2R43zy4a68AUiQ67CKxr
	xL0yGhmvNeRFLegOXBHGrW29oUy7sDsZ41QJRpJANCFjyRfNd4hQ3IdSGLFlS7NDjoD+tOPiJix
	slSgCpfKsNg3pbzwgQ+fpdYDX4uCxUMlp+eLwyglt9y3O4REB9zNd6hWTn5BM0RKldiOHy7OxMe
	gZRMwmVpxjtkG8j6Wyqzug01dqmRPZq/eve3/ULvWe2ywhDDgkO3nboTun9BWcIv5yjrk3tfmge
	IPgXMFLVJF9dwoWV6H20V0vme1MhdmyshexF4QXl6FvLqme5Ffy3wELb6LyPqh0a7l7dvjRBpIv
	eAc2Xun7f6F6c4Kq+RWAzTW1qrSMOhDMSxHR2AEqaG92YjFdLA1BH4y/TEcjo/9SJVSTp9UvQ2G
	oNA4A==
X-Received: by 2002:a05:7301:dc2:b0:368:2548:c08b with SMTP id 5a478bee46e88-36f76023a8bmr2886619eec.21.1793956906813;
        Fri, 06 Nov 2026 01:21:46 -0800 (PST)
X-Received: by 2002:a05:7301:dc2:b0:368:2548:c08b with SMTP id 5a478bee46e88-36f76023a8bmr2886579eec.21.1793956906180;
        Fri, 06 Nov 2026 01:21:46 -0800 (PST)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36fa96fe226sm4903912eec.12.2026.11.06.01.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 01:21:45 -0800 (PST)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:50:58 +0530
Subject: [PATCH v8 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
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
Message-Id: <20261106-08-dts-v8-9-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
In-Reply-To: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfXy2OZOOIujEil
 AovRxuH86X+b1w7g2Q+9zWCAsST6OSiC859dhbLrMHA5frtZ/qH0XKtxuxepe0LMe395trMK+Ij
 dO/M9vSrf5m9c+57PPU36B5j9ETI1tQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNyBTYWx0ZWRfX7m9uDkMVzABO
 UMZODjD0M9Nqj3ni5nXQ0a9tB0pf0J3QI2ucPHjlPG9I4LL0hbms0PsP8cfZY/YmeCjukv+2FWX
 msY7tM3fMqL2Jr0x6l64xs2WCPs/oQBnxNieAayyh4ZUSIEvNR5sUtD73SI6p7DZRNDn5CctBOs
 26T1gN7laQT0eXySsqBonvvqwjh/8O51tDowY0GaR8NPXz/yZ6nvtDfyYu8Knixu1DudKMSNtCa
 EwBH197Xhp8UkUjNWa8pePyxyHTZpqNmobZ0tWRa8GumgIfV6rk0wLMgc/mUlUVAf61f9Pmbg0g
 T4LOkTmAemzMHXJ7YQT6y56+GQ7Et8WJwy8vMlD74x44RzfDa4ErHfAvjsTXZlFo+nFobs+601E
 gw67hK7Xlk95rMkmN49c6UT+/F6OqjlLL7WQIrcBfvV4aUpOdo8HyhzLDkYFi0iWgg9HnoBL35T
 p1yFeFnZb548/fXFT5Q==
X-Proofpoint-ORIG-GUID: 8ucIDQz4igJ7Cw_Gl5Ci3eZ_jgXpmsel
X-Authority-Analysis: v=2.4 cv=f6Pdl+yM c=1 sm=1 tr=0 ts=6aed9c2b cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=GVWKzDYot3hTMZ8E5o4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: 8ucIDQz4igJ7Cw_Gl5Ci3eZ_jgXpmsel
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 phishscore=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060037

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 47 ++++++++++++++++++++++
 2 files changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index b32daa7c1559..8068dd0d2119 100644
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
@@ -191,6 +198,15 @@ clock-pins {
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
index e4a696a65e55..35cd55881969 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -160,6 +160,14 @@ opp-300000000 {
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
@@ -435,6 +443,45 @@ uart1: serial@1a84000 {
 
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

