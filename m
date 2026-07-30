Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9531F3672AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785386969; cv=none; b=Tn+kMi51XYqjaWmggEeVGQXZ6bMZVqt20C2AEHSrLsA73np6LLLzp9+dQKAX2HqjnGC5WGIbFtHa1soMCARF3AqG9Mci5lPhW8ZHBc5nfyYw7LdcvZURwZiaIoXv070LnXSyqCgP0SHf8RMr31O60ha2ehJv4nP9Dw2YOKtHNlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785386969; c=relaxed/simple;
	bh=xRvX4C1MLDNeabWWOraVYq1lOeHEO2kDMcvyddoS6Mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XHL4+azRTFF1m2xjR/f/Ir29V2l9wrBulUA/davw60Q+PvFQgqD2TLouCDkJqsrjIE3SMqd8SGOepMyKPH7X0TY/19oWmJHgI4z1ZFaYbOIWnaC6hA2vagvfZ0V08CLLQQo6UcHVpvr/j0+aMaNISaWAaFYW2sES1nFYBwOe/M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hX6pj2sN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W35CIr2g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hX6pj2sN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W35CIr2g"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U4Zago4087727
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P3Z3wys6yl1RdfpZu+o6Am4NfC2qD7iJbwimZM6YAyo=; b=hX6pj2sNe5NFkUE7
	q1xPicelvFLYLykWPcxozb6+Oc846166aBR7a9XsEII/NTNxlrgLecsxbiwrUkTN
	oLGjIJ7xK0+Gc1Xtkx0oSZTfSwl3oIHcsGfpUIW+IdnMh6UUADfIg6IWdnxOdcCz
	T6f3Gk6O3KdKg8buKy2Akd/hou9OeaBdDoZSzO3OMeyYjEldn989N5uMXDeiIZXU
	nUbtdQ6ljlGvHtFwcDCNJXuZARF/XqVNo0uFDo0E1n6ISXMzNUbCJIBDVOtqlH8y
	srYjHHI0Ax5c7dOdGfLhwBvXTJHhsScyiVRA2VgH7qXKlE9D6Uer/0xLoQQ1B3Vm
	1z70fA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqyqkr1mu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 04:49:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e22137fb3so2623519a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 21:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785386964; x=1785991764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3Z3wys6yl1RdfpZu+o6Am4NfC2qD7iJbwimZM6YAyo=;
        b=W35CIr2g3NN4LflyP7CUSPS4D3GKx0V4VMoy1MTqnLFuwTS0tTO88fF2lHIMt/6+n6
         Akqa70v8FpbOpgG7kLBw/tPyW4FkY2/IEhPdN4h4l6yptVfgCd5n/mjntT3N2nT3hXII
         hSN7+12Tj6dItNFt1iiV0ZSvmlKokW12VslUA2gyHWGqjiRTirSQqRZH0LclYVyjm5m9
         cqCE9xDsX8P/z4s+27GF/6Xnw2bh1Dt5YKVQ1I8lAlknyxGy8f+DsXf1LtwmvYegSSVD
         r9F5/Vt12SHsg7fFarU8vWS+AnKnM5tfaTGNKP2yFxBk+FAHV2TpTwKg9lw0Dwm2Uab/
         3vzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785386964; x=1785991764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3Z3wys6yl1RdfpZu+o6Am4NfC2qD7iJbwimZM6YAyo=;
        b=fl6JxauAUm8V3QJitBng6mn2tEsWqVP7aH1av3zpcR3j+zz1YA5zu/gwbSnfnLTzVZ
         yFZ9IOwWE0vFcZTRLaPQkWkOrJaPpobQHe6buQr7S9/KtXgi0NX58O/5CONZ8cFDrAVI
         TfAxc9VM2Sl1pupTwGhyIwji5fn8YVJJpdsrbFHuOusPSuJMRM61eg8R/WlMatPjdOTV
         D6uO/exP9sO44QDB/Vy1iCYOc1zPGIIthCn4Ac5EoG8kHRIvYeH0q8oZ3PVwFSIw3sTm
         sLy35sbVQM9mvxALzPOB4W8RSDyLKlD2U1Zd5Zrfgj9ZUrgKHLegb+Fs1FDkjqZg/MH+
         DbPQ==
X-Gm-Message-State: AOJu0Yyjsu/WfWPDZSq2ou7eQjZY+1kD59NQ6Lgit6j5DyNWaLQ8ENO6
	cnVjr7tqhglNtkK2pznGknWnxy7WgyiFq1rYqiHuUNjV7FY52h0SbwkSsyPlzWU9wvqAM29rC31
	eKGF/PVqwskee6wO2CJmDXdXjKIyR163cTtzVpuMi6on5JFB/j39jbmQkW1TFqAA2YaC4
X-Gm-Gg: AR+sD118gKAqZDOpjWY1JVekPtJKZGkziH89WOHzAy40f14M4+AVnScu97L/FXeY9oP
	nq60Pxua9DykJkD/L9wE1S92L5xB5GeiTqwNBUbUYAvc6Y5503HTip6PBfeOqFY/FnBtdFWojUF
	kc736YmPrMcdBmSmmnOQDEPHILQvCxsg9gAX9VKK5YWv1DEQD6tqVsrDrMSjENHW3+L7BEUiDGT
	gOxz2u08QDerO64QNBBKWJ3ni7yqiAkAUWJfb/L3u+R2RaLFeW87ATs4UF/XCs/DPYnOeNzoNcn
	thDxoR+Sq7Rr8c4Pg6FKU3xFWG6ZApQB9BtZqq4xQCAapKtic6HbRX3NUCPlJGg/CmV7VMXovVo
	NbV17diPn9M5k2TWAZk2Hr5ojLEdZRNfPonE=
X-Received: by 2002:a17:90b:4487:b0:387:e0cb:c8da with SMTP id 98e67ed59e1d1-38f9c05e928mr842175a91.35.1785386964430;
        Wed, 29 Jul 2026 21:49:24 -0700 (PDT)
X-Received: by 2002:a17:90b:4487:b0:387:e0cb:c8da with SMTP id 98e67ed59e1d1-38f9c05e928mr842150a91.35.1785386963954;
        Wed, 29 Jul 2026 21:49:23 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504cc9dffsm17740241eec.14.2026.07.29.21.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 21:49:23 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 10:18:55 +0530
Subject: [PATCH v6 3/3] arm64: dts: qcom: eliza-evk: Add PCIe1 with TC9563
 PCIe switch
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-eliza_evk-v6-3-40ece2d33114@oss.qualcomm.com>
References: <20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com>
In-Reply-To: <20260730-eliza_evk-v6-0-40ece2d33114@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785386943; l=3929;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=xRvX4C1MLDNeabWWOraVYq1lOeHEO2kDMcvyddoS6Mc=;
 b=ZXdfrRJ1qSVHT54S1wu6IW0qgZORh00leh/BRLSc6+nRRn89zk0rYmVzD3qywqSvRyRmaLKKL
 Gy76euuD/sHAjZPo2IyN4X1rkeCGijHbSDc25Tmk6L0D56szlRJcWxc
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: E-cuBM-2B249t69v9RKKRJGLjCPTI4Ck
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDAyOSBTYWx0ZWRfX8IGp69uPP4hw
 vxzXM0j3dGe47IJAy42PuiGeR6Axn599aa3/dlm/HixRgoOpvv3sn7cTz1FOfYcxtvSu7UjZTlr
 TjJgl34eHSylI8dTipkuCPCWSemNjj+6eN/ZwNtyE9h///Q0GdNXKWSnxuL9edXOOLg30QlkdfC
 PhccwNbRuOFjgpO5ClRStqj1OvwK3frVgv8msR83Zy6JgzAboGme2hZ7hKC5Zxs5Mj5FEnAinwK
 kA0OQXBZ/AOiAKRkogBuokQjNn2oZEIs03fnkjy+qz+VYO7dpXIpWg11ga+9k41VXPgsVkC2bvW
 uv0K2S755rgKXzds0dddkkx6TDa/O23nU8yni581rEq8JDvR6w68w2d+AKFJELG+PbeuhEyV5EE
 Zh4iz0hAN1OqnzVBECiCqsgatUxgiTbTcm5EPEfqk95SQXxzOyCEV2nJgFPY9VDZRtJn2KcodMf
 YcF2xNXtgtITDhlfIJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDAyOSBTYWx0ZWRfXz9Z8eQfXGPeP
 HkNl8XN98QTHMecdB9SRxTx8Bepalr6ataq3yNjxLhDsf5UnEax8y8OpYKlyX9AH39OjSpDqkPr
 PGtP2eSQ11eaFw2UgyMOG9CT9FuW4nU=
X-Authority-Analysis: v=2.4 cv=DcgnbPtW c=1 sm=1 tr=0 ts=6a6ad7d5 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=qQkGquXN9PvF_GGjQ98A:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: E-cuBM-2B249t69v9RKKRJGLjCPTI4Ck
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_01,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300029

The Eliza EVK board connects PCIe1 (8GT/s x2) to a Toshiba TC9563
PCIe switch. Enable PCIe1 and its QMP PHY nodes.

TC9563 uses I2C (at address 0x77 on I2C4) for its management interface.

Override the base iommu-map with the expanded set covering all the
switch's downstream ports (0x1400-0x1408 SID range).

The TC9563 RESX# and PERST# are OR-ed internally to assert reset on the
switch. Use TC9563 RESX# pin via a TLMM GPIO and skip wiring PERST#
from the PCIe controller.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza-evk.dtsi | 113 ++++++++++++++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
index b35fffb50976..419e737c54e6 100644
--- a/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza-evk.dtsi
@@ -12,6 +12,26 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vreg_0p9: regulator-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_0P9";
+
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	vreg_pcie_m_3p3: regulator-3p3 {
 		compatible = "regulator-fixed";
 
@@ -99,6 +119,99 @@ pcieport0_ep: endpoint {
 	};
 };
 
+&pcie1 {
+	iommu-map = <0x0 &apps_smmu 0x1400 0x1>,
+		    <0x100 &apps_smmu 0x1401 0x1>,
+		    <0x208 &apps_smmu 0x1402 0x1>,
+		    <0x210 &apps_smmu 0x1403 0x1>,
+		    <0x218 &apps_smmu 0x1404 0x1>,
+		    <0x300 &apps_smmu 0x1405 0x1>,
+		    <0x400 &apps_smmu 0x1406 0x1>,
+		    <0x500 &apps_smmu 0x1407 0x1>,
+		    <0x501 &apps_smmu 0x1408 0x1>;
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l1k>;
+	vdda-pll-supply = <&vreg_l3k>;
+
+	status = "okay";
+};
+
+&pcie1_port0 {
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+	/* Same GPIO is used for both PERST# and resx-gpio */
+
+	tc9563: pcie@0,0 {
+		compatible = "pci1179,0623";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+
+		device_type = "pci";
+		ranges;
+		bus-range = <0x2 0xff>;
+
+		vddc-supply = <&vreg_0p9>;
+		vdd18-supply = <&vreg_1p8>;
+		vdd09-supply = <&vreg_0p9>;
+		vddio1-supply = <&vreg_1p8>;
+		vddio2-supply = <&vreg_1p8>;
+		vddio18-supply = <&vreg_1p8>;
+
+		i2c-parent = <&i2c4 0x77>;
+
+		resx-gpios = <&tlmm 54 GPIO_ACTIVE_LOW>;
+
+		pcie@1,0 {
+			reg = <0x20800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x3 0xff>;
+		};
+
+		pcie@2,0 {
+			reg = <0x21000 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+
+			device_type = "pci";
+			ranges;
+			bus-range = <0x4 0xff>;
+		};
+
+		pcie@3,0 {
+			reg = <0x21800 0x0 0x0 0x0 0x0>;
+			#address-cells = <3>;
+			#size-cells = <2>;
+			device_type = "pci";
+			ranges;
+			bus-range = <0x5 0xff>;
+
+			pcie@0,0 {
+				reg = <0x50000 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+
+			pcie@0,1 {
+				reg = <0x50100 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				device_type = "pci";
+				ranges;
+			};
+		};
+	};
+};
+
 &uart13 {
 	compatible = "qcom,geni-debug-uart";
 

-- 
2.34.1

