Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074E0443C02
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791789828; cv=none; b=Xbte3v7coVR54+NFw+XI5mRI6pQ44A3KFYXzy1wpXhHmVkO0DnXcXvvRiKXAadRe1/kknlrWRvOYUWxn1J3qpAnpBhDzE93VfMcDivp5vaPIRg65z603EdLGQznEN8LRPwdHJ/ZjgVPtKXsROFwuy7WG9c4eELeWpJitppKrz1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791789828; c=relaxed/simple;
	bh=v2T6gvacBJI99Sl7lbDCd3sFv8MxJaBB57LxUNv4onI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qODu4jwF0buOZmgMZnZJxARsDZ4V/TcAPx9XOVz2xNvoCL/QVlUWvavV3SvBOgt1nMPJtOQzUSNVywzKl4og91hA20w0RXUpfgBuz+06Zck45VQztOwx2sWXN8mZeUqQ9fxlyMjg02D1aP0pEHYF+8RvsIQfvlaXebViX5LbktQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TQpf/HwP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IGWQZBaj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TQpf/HwP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IGWQZBaj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55oAL1339375
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QkjgMFJSavqOxyonzfGWpya15HfrGohi2M5TXn1I7C0=; b=TQpf/HwP4JQGRDsX
	CoKB+ZaJjs3TNCKbN6Y76niiAdxSodme8WTnF190iVn/lphI3z+g2Wk+y/PmB2nf
	p0jM2xIE3b4BgrPTXzGdIiWWIjE6gF3WROhrlK2ZPSqyU2JSH36FgEefuPF/Qr/P
	fJcaDjcxG60H4Ox8MTjlQ+SwtIsK6asd7jZZcf0tDpPjuo7uZ37s3YElGpdYKlLX
	EohzAg1DQQqTnMezm0ZA2yM1vt+zu/Ym8gFC2hqe4UAq7ms5HERNAvgdeum6NpOx
	mOnzmp5IWPuAW/dUV6q2uOKwbzKZ+zAgb9BE7h80s9+MKwsksOEjNlBgNCheZ/fr
	SDWmjQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk25bv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:23:46 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3515266f6eeso3149474eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 00:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791789825; x=1792394625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QkjgMFJSavqOxyonzfGWpya15HfrGohi2M5TXn1I7C0=;
        b=IGWQZBajGCk186ChcJ9QgwTeqWZpva5tvTIWqQxzEHcciS8f4Rx6aTbYn6zyQHYNw9
         ClBAfJHn0Ar5FMrUJ4O4mosslfpYf13vUC6h3PktnXFN00uTLHkEUxptkX7dwj74jScL
         eSxausGHFnnuK6P4ZRxDTROuL1nG5yEbu5Jq73ij4B1amIQXVrG/FmmlFzD+Thffzx1n
         IlPtQhsF+koYcwCbVOTdLLGb+8gHl+T1uE4kkFgcjty71cjGAPojLpUnCBoFn8iiFc+4
         CAmRZ3C+VZ6VwCPdBDkStuJ5RDXOYTKO5QYzoPm50dZ871oELGk3fuaWbCMV07JN0K9a
         FaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791789825; x=1792394625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QkjgMFJSavqOxyonzfGWpya15HfrGohi2M5TXn1I7C0=;
        b=UCc9qDXPOMChclM5RuhY9IFW2aU9w59bUONkMG1t4x8kFXm2kjVYR+bibNKQyrvjCp
         3VzwYY2p2Gv9RNbIisKvw8ex4zOl1cXQAqTSaPcryUH8OHmnd8Ys3lv49OyWMMRZFZzo
         gWkLBeiGbXQRaokivM/q5Mh/3TtnegXCni7SYAUO2fwIv0eEjEJG0Agfnjf+sdDUaX52
         j2Oo3gHfCKzn0ey/YsafMLcbEZ2+HwsY9y0EJFx28FKysUJqWQDHs+A/dOvZTjp+Hy0G
         fLd1FdKwa811EVyYi9HPYMFbXcG4yZviHf9qd05n+WbszJlsewaX9w1+FwbyqfKn7dPY
         hXsA==
X-Gm-Message-State: AFq9FYKtAv/Jh1vQWbtjCBkaOmO5noRGTeCUn9kTeO5VFGhf4BIAdzwc
	kFI8mjjEtODVq1W3rP3kLSbKBm0zc6VdGNLZHG3dwl3OTjJaZLDfGQ6gJNlZUZhpDXP3++HOi98
	J7KapBgnfhmF+bDtMvaYxzoNS+mPHAjKhSPP529lqHirk5YpxOLqyjqvYkzAxcua9eHNK
X-Gm-Gg: AYBFou1v/9V8YPJ9K2oN3oU1ofoAiIhYsxdeyw2uZVWz515hQXI5gkHpajMOeL85H7Y
	XZRQtMC3MUjR3sdigZIhJC2du8lQPnYNBnI4EDOmsSvULCzQeoINYb8smgm6+GiHNb98Ixp7yx1
	UrbqULjyqLbPrN9DrHt6gKK3tK7hMcPPD5mJdFSlRCuQwwkwblkTiHPKUUpe/T63yHuPyvPKmnn
	cXEmqHnMJFwggEjOpSaN3oiej8wEo6a5+lQ9ka6HXBBUDO0Tiey6yc7xfBGrPBvY7asD0FbfgSL
	ti0lYSX/v7+mRK0/oaYWdKdJmgRJGn+Ro0uPCqYJpPYXI8X2koufxS0zfvlTqi5B6El6naCklgM
	sfsjAbOvdC4n5OUPblxXuvZf003cdwdcEFTn0Wsb6yPCa/G9ml9BbiU9T0/wtIlJ5P0ncwFQkxZ
	87YC/rY+QqNMa+r7j1ja5TvPMmnxgX
X-Received: by 2002:a05:7022:5f13:b0:14d:38f1:b51a with SMTP id a92af1059eb24-16a5f7c75a7mr11830665c88.19.1791789825478;
        Mon, 12 Oct 2026 00:23:45 -0700 (PDT)
X-Received: by 2002:a05:7022:5f13:b0:14d:38f1:b51a with SMTP id a92af1059eb24-16a5f7c75a7mr11830634c88.19.1791789824917;
        Mon, 12 Oct 2026 00:23:44 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a1becf08sm29748733c88.5.2026.10.12.00.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 00:23:43 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 12:53:09 +0530
Subject: [PATCH v7 09/11] arm64: dts: qcom: ipq5210: Add I2C nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-08-dts-v7-9-77bd3d68d850@oss.qualcomm.com>
References: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
In-Reply-To: <20261012-08-dts-v7-0-77bd3d68d850@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: QL9rmSGK-ab85DGU9r8UC_fEM811DGuU
X-Proofpoint-GUID: QL9rmSGK-ab85DGU9r8UC_fEM811DGuU
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc8b02 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GftUwNuSPIKaBOPN2qUA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX977+RtQn04MK
 jH3JLwRe5go5dzlHZICORIvoLVhn0kPmJuqzzl6QGRe0r5847ohWQOThKE5l++VWFOBtyKHNjIE
 i2jZlrT0WaWUMvhXqB88Q4Wph1GZhDKTsGhcNkJiffjLm45oiHTP/bqaXNnss9tfCz8VxlKlxqy
 pazWxzu9fXvmnLF2cQv/X5NUnWZuggtRFMR4DO4pdOdjKqVawSBYapeWNAYzUEw8DlhNIv4RluP
 ZVcGLzODy00vh0QQdrq1qZ2vGu/KL+O8CeGqjn19yHn7DL28AmJQbA2UUFtG7udv2YCZo6/ImLc
 AgpGLwdux1CDGwIoId2TDz1A2uU5Nx8egDiX7ZtVp/IsRlgHXbeRcVLvoN5Hu3QRUXbL2VgHMRC
 MuMFZswKXePYZ3irX0R/fKjSo12AkWzZojWavnvbZUB4llSlnjPLkrHiJQK2EFw1P0XLOhwBwqv
 lldIinSTEiCFN1VU4Ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyOSBTYWx0ZWRfX7LF4MUU26vj9
 H7kjng8yaO5Vc1vs9LId9Q/OTZtQRFbDHCgTrRxJXxBszSMx4DmSo6geVvcky3EIS0HxaNzULbv
 P9rbSDxv6lueOf4z5aK3VknSsBcJOXQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120029

Add the QUPv3 I2C controller nodes for IPQ5210 and enable I2C0 with
the required pin configuration on RDP504.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi | 23 ++++++++++++
 arch/arm64/boot/dts/qcom/ipq5210.dtsi              | 42 ++++++++++++++++++++++
 2 files changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi b/arch/arm64/boot/dts/qcom/ipq5210-rdp504-common.dtsi
index 0f7a8f2d886b..0fd85b78e5b7 100644
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
@@ -197,6 +204,22 @@ clock-pins {
 		};
 	};
 
+	qup_i2c0_default: qup-i2c0-default-state {
+		qup-i2c0-scl-pins {
+			pins = "gpio20";
+			function = "qup_se2";
+			drive-strength = <6>;
+			bias-pull-up;
+		};
+
+		qup-i2c0-sda-pins {
+			pins = "gpio21";
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
index 22ab99ca0903..fdfeedcf5618 100644
--- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi
@@ -427,6 +427,48 @@ uart1: serial@1a84000 {
 
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
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE2_CLK>;
+				assigned-clock-rates = <32000000>;
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
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE3_CLK>;
+				assigned-clock-rates = <32000000>;
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
+				assigned-clocks = <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
+				assigned-clock-rates = <32000000>;
+				status = "disabled";
+			};
 		};
 
 		sdhc: mmc@7804000 {

-- 
2.34.1

