Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795165191;
	b=BFbSM9gOatlY7E3s2xxeRrkfrt4txoRwTMMiXxBry66fCQhCrQZKDa+817PCltWgmLBe
	 GhsP4buDuXzjSMWNU2QGNrpyFrU7ptQB6erAqhMFQ8Flx8bibqLyDAEdfcCT2k2jgU1jU
	 woKNReE5xJGzoFewdgFzdSB4XYdgzta0Mm00fyulQpJjdoI/F2gpbRKYkw98DOeo3keie
	 9pQA1vQH0z7SrGlbZThSv/e9Rd69+N1lv53vHiPleuc1+au4bqQsrDdALuqh1n6r13/fH
	 NPxficit/D/66HRt17ScNzVPu5AjQzK2LMWlsIPerZKYBauuXyztbWFIgvMVlayfVFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165191;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=;
	b=zv4UxA3JfGsy+tTlgD42gA1Z9WLX1vXsHbNPhvspWDgnya3cylb5I/rugydXW/8QOFDx
	 huEkM7K3pP8TDxwu9O9xTq5Jk73RBHxGRaZi/0+Z/ttx5quuDTHgYzOnowuvNIOGBJFPA
	 x4+zAEEnB2J/jY32MCqmjjncJT9xgbfW2XiXOQl/MRwG8vYfsTbuJxpFRJq23WRTGlph8
	 FT4YiOH+O6KxrcoxNPpQo05yEiOUKGc4j2tvRHgDvyepYeF5mzQ+HynrWdMsmngq3Z17t
	 ++AsFsVT6K4M9gKZBslFnOvDo/SBJJCliw576FcTIugNzM3Ocj6qJxvNJx7T708gp1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="Mx1/h9ZW";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESiwEdb4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDAAA60A3827
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:59:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDAAA60A3827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Mx1/h9ZW;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ESiwEdb4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK8jrCj792310
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:59:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=; b=Mx1/h9ZWLe2XfjWf
	xfKdJj8YwiZbBc0W6qfOZe0q0ez5WDTvwbHHglOaAlRoerPVnLVz3F1Thd+wPhrJ
	PTzBY0Bb5C9ncOm5ZCx7bX3JvoRFB17p9h25oqiaNSLCWBtGZ3dNihgfowmPBrBx
	yiOMA1jeC2zKsbBT373AzW2a2Fq9ITeplauBWWKKitG98IV81AWhTrc4p1hUly6l
	dIbQvLw7wFfKtUIr6BBCw4ddfMy/CcekTXf5pQsimG0UxBEoZ2S7qJuLsMPZvKFh
	Xn2L5qNqYQDH+bbf8wtB0fL8yjo0CX925qp9BZrzcjzKdMDSM/8Fd41It0jO/ZgC
	QNuDmQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27fyjt7d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 08:59:35 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3b45597c7so1578011c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 00:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795165174; x=1795769974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=;
        b=ESiwEdb44iytkewt3rgTyCeRIdxSnSb84NaSnNH2y+b3umQunV7qsNU2cX/hIlorSy
         N3lVtHMYVFSFIsEUwSm7pweecVHoIlsK5drQGONEX7dBM8XTMJx0wCQRxrjU06wNDCwN
         7gTYlrZOsh7tz85/fTKts+ywCCpI2uNsIYUy9R/VxgxOSCEMQEmlnbbFNcDtljRolblo
         Uokhc+7G/N4owXXNaz5P+EwJma8e5wCcXsKed1tqPI3aWyc8gIWNukh7t4lKA19pbJGJ
         KpB/SlPwVUthodKpdCB5qlzPsEe7Q0ehW/qUVZhx1Auo2Pws3xZO5Dhkzvc60TjWVp3N
         9Waw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795165174; x=1795769974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ax09deECwGRX4LEojS16L2+vzlGqOOmaPwTOIojdcJk=;
        b=dJBqW708PyxTlh8lIWxkkgyQKE777GURRF0gKp5W7DboQJ9nQfpLSlS5LbAGxMSi9p
         urn72wEHIlgr6GGIGZq52iFHLtO5PF4srPtEu0AWT4iqS9n9PyPWXL6/lEjH6F3aVQoQ
         YTIJxxJYbsTrf0IAcyyU7EPpFpVCBMLSW7JZQNkDgXyrCY+/qcugLGp9G9X7he1lV3Sz
         kfYrfjwIhYwsSxsaLFgMwH+qjESeL42Mw/b/IA0lbdKnMhPa330jWnZZhkiyvrXR437J
         I7ADiDNT5WIzqOPWj9TGqRZY8jBybbWw8kzshOJxZSR0blMmC6uKudZ8uzQCiFjdy7n5
         bsyg==
X-Gm-Message-State: APuU4Z/2wkScO1I1WEi7a3z/ZghDsscUkZ50jFYcfMaek778xlrPg4nI
	nX35566B1KBLNJHUTuyUPphPR2PNC3ga/XqfjpIRF8Xdq+h0aP7swE5D0bQbTVdnrUPDztp/jQh
	hnV5nvThseFl+Y2n8JTilqDrkS04iXhHbZQDtahWBT79vHAjvmtoA/VGR+erPNdKCdUJQ
X-Gm-Gg: AYBFou1KBdIv7u5wu+CpmBTCS9oOgpuVdJlLtc7o4mKOzN18Pq6aFGms1uXmO2l/F8d
	JSMwK12gndihdIkBU/TFHjeqQxKisAA3JZRE3tSEZ7t+C+xzD4PGI+TgQsUPpBBgaBWHYduBqk8
	odh1g2068CM26VDkd1nIOJxvOJXnZ8gBcA2KIREO/Iqm06a5n3wbt8tb/Lxou1sCWQ0lXnE/6oA
	+jKkX9P6Ko59wgmrgdbEFJGOZ2uGhG2wVpCWxrtPTattdlUg8SuXu63G+J9Hp6y2Ic7224uiE6m
	zxFJ6bLn4rQQIRvy49Vvjo3vm8GoNkvdDH6l8kU9vT8NGVQlrRd7kEZ5hgi4ji/dJ4wYTKFCAkE
	tmx9iVLKocSPYra2sF5nHnxBAwYlDTFOlls9Ns3yXrGx1Od4hJVRbeROIEV0u5ET5bayBjheI4K
	NtPGeZ9V4tOCAmyHLyWfCxDv4zgVvmCqAGrEVjGlHq0jKYb6MOcXO0/dZc8ooumrqHBQGA7fxsH
	n+3kvw3s+Q=
X-Received: by 2002:a05:7023:a41:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b556894f1fmr2412825c88.16.1795165174181;
        Fri, 20 Nov 2026 00:59:34 -0800 (PST)
X-Received: by 2002:a05:7023:a41:b0:184:5f2e:aa52 with SMTP id a92af1059eb24-1b556894f1fmr2412798c88.16.1795165173655;
        Fri, 20 Nov 2026 00:59:33 -0800 (PST)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556829d31sm9490658c88.9.2026.11.20.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:59:33 -0800 (PST)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 14:29:07 +0530
Subject: [PATCH 2/4] arm64: dts: qcom: ipq9650: add RDP488 common DT file
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
Message-Id: <20261120-ipq9650_various_devices-v1-2-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
In-Reply-To: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfXw5RXY+pce1PA
 mNR5NiRuqKZZUYJZPktPddBa2si8z3jJVWzsti6kjIvqJM5YsQNo/q2i5HLOt8Yho3h+nDkJe0B
 UNGbTR8mskJaArO0NfD9gI4M4cjrRfQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDAzNSBTYWx0ZWRfXy5Uuhy9wZLdW
 H6hog7+KnabOVjm29D9t1WHnN5wFD+dcbf1vkV4pNqH9xcn4mzPpqxwJIRY4a1qKjR+qaW1v71j
 ohGO9gPk09MkABKrQGIuX8KRPH/lUharUa0IliM8feS1m2cIrNoaUjwgZGi+AbGfs35RR79QUtG
 7RdEq5k1UzvtJJGj32iU23Ymi1Q8gmF+FCCTZWWYGUaA2B1/V4xQKLeyD7ZRps8QBgcYms/2AgZ
 1dAXOdt991T8n6sNmIcHbDzUjj4agHSP4F5N/2nX3N6S+ny48XHSVAcGIsbxriixUjqT1j+DLfn
 dpnxI1Q7sDmOXKYMVhBsAUcEOfvFuvCS5ZwDvEyyKtV8Xg0lyaOSXVp1vNO0P2FVdbrtGK0KG5L
 31IY/Iu7syDYfE2Gbdhke+XMLc2luUPPDR6B94sTXRxlxk8oA0YJ24fKL2rpkf+BQIUpT/wekyz
 x5e62UTpOaJCnppPbtg==
X-Authority-Analysis: v=2.4 cv=GZKCDgXL c=1 sm=1 tr=0 ts=6b000bf7 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=0v5-D9jr3w84b_CrZXgA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-ORIG-GUID: eMdwbc-GMSU8toZl38QAUcu-2kuBZ2ms
X-Proofpoint-GUID: eMdwbc-GMSU8toZl38QAUcu-2kuBZ2ms
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611200035

Add a common DT file for RDP488 to share the common definitions
between the eMMC and NAND boards.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi | 190 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts        | 185 +-------------------
 2 files changed, 192 insertions(+), 183 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
new file mode 100644
index 000000000000..e51d75bb9576
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include "ipq9650.dtsi"
+
+/ {
+	aliases {
+		serial0 = &uart1;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&pcie1 {
+	pinctrl-0 = <&pcie1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	status = "okay";
+};
+
+&pcie1_port0 {
+	reset-gpios = <&tlmm 28 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
+};
+
+&pcie2 {
+	pinctrl-0 = <&pcie2_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie2_phy {
+	status = "okay";
+};
+
+&pcie2_port0 {
+	reset-gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
+};
+
+&pcie3 {
+	pinctrl-0 = <&pcie3_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie3_phy {
+	status = "okay";
+};
+
+&pcie3_port0 {
+	reset-gpios = <&tlmm 41 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
+};
+
+&sdhc {
+	max-frequency = <192000000>;
+	bus-width = <4>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	pinctrl-0 = <&sdhc_default_state>;
+	pinctrl-names = "default";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	pcie1_default_state: pcie1-default-state {
+		clkreq-n-pins {
+			pins = "gpio27";
+			function = "pcie1_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio28";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio29";
+			function = "pcie1_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	pcie2_default_state: pcie2-default-state {
+		clkreq-n-pins {
+			pins = "gpio51";
+			function = "pcie2_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio52";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio53";
+			function = "pcie2_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	pcie3_default_state: pcie3-default-state {
+		clkreq-n-pins {
+			pins = "gpio40";
+			function = "pcie3_clk_req_n";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		perst-n-pins {
+			pins = "gpio41";
+			function = "gpio";
+			drive-strength = <8>;
+			bias-pull-down;
+		};
+
+		wake-n-pins {
+			pins = "gpio42";
+			function = "pcie3_wake";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+
+	qup_uart1_default_state: qup-uart1-default-state {
+		pins = "gpio43", "gpio44";
+		function = "qup_se6";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	sdhc_default_state: sdhc-default-state {
+		clk-pins {
+			pins = "gpio5";
+			function = "sdc_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "gpio4";
+			function = "sdc_cmd";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2", "gpio3";
+			function = "sdc_data";
+			drive-strength = <8>;
+			bias-pull-up;
+		};
+	};
+};
+
+&uart1 {
+	pinctrl-0 = <&qup_uart1_default_state>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <24000000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
index f6411a55c81e..1ec4c5b91780 100644
--- a/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488.dts
@@ -5,194 +5,13 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
-
-#include "ipq9650.dtsi"
+#include "ipq9650-rdp488-common.dtsi"
 
 / {
-	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488";
+	model = "Qualcomm Technologies, Inc. IPQ9650 RDP488 (eMMC)";
 	compatible = "qcom,ipq9650-rdp488", "qcom,ipq9650";
-
-	aliases {
-		serial0 = &uart1;
-	};
-
-	chosen {
-		stdout-path = "serial0";
-	};
-};
-
-&pcie1 {
-	pinctrl-0 = <&pcie1_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie1_phy {
-	status = "okay";
-};
-
-&pcie1_port0 {
-	reset-gpios = <&tlmm 28 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 29 GPIO_ACTIVE_LOW>;
-};
-
-&pcie2 {
-	pinctrl-0 = <&pcie2_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie2_phy {
-	status = "okay";
-};
-
-&pcie2_port0 {
-	reset-gpios = <&tlmm 52 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 53 GPIO_ACTIVE_LOW>;
-};
-
-&pcie3 {
-	pinctrl-0 = <&pcie3_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pcie3_phy {
-	status = "okay";
-};
-
-&pcie3_port0 {
-	reset-gpios = <&tlmm 41 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 42 GPIO_ACTIVE_LOW>;
 };
 
 &sdhc {
-	max-frequency = <192000000>;
-	bus-width = <4>;
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	pinctrl-0 = <&sdhc_default_state>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&sleep_clk {
-	clock-frequency = <32000>;
-};
-
-&tlmm {
-	pcie1_default_state: pcie1-default-state {
-		clkreq-n-pins {
-			pins = "gpio27";
-			function = "pcie1_clk_req_n";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio28";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-
-		wake-n-pins {
-			pins = "gpio29";
-			function = "pcie1_wake";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	pcie2_default_state: pcie2-default-state {
-		clkreq-n-pins {
-			pins = "gpio51";
-			function = "pcie2_clk_req_n";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio52";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-
-		wake-n-pins {
-			pins = "gpio53";
-			function = "pcie2_wake";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	pcie3_default_state: pcie3-default-state {
-		clkreq-n-pins {
-			pins = "gpio40";
-			function = "pcie3_clk_req_n";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		perst-n-pins {
-			pins = "gpio41";
-			function = "gpio";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
-
-		wake-n-pins {
-			pins = "gpio42";
-			function = "pcie3_wake";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-
-	qup_uart1_default_state: qup-uart1-default-state {
-		pins = "gpio43", "gpio44";
-		function = "qup_se6";
-		drive-strength = <8>;
-		bias-pull-down;
-	};
-
-	sdhc_default_state: sdhc-default-state {
-		clk-pins {
-			pins = "gpio5";
-			function = "sdc_clk";
-			drive-strength = <8>;
-			bias-disable;
-		};
-
-		cmd-pins {
-			pins = "gpio4";
-			function = "sdc_cmd";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-
-		data-pins {
-			pins = "gpio0", "gpio1", "gpio2", "gpio3";
-			function = "sdc_data";
-			drive-strength = <8>;
-			bias-pull-up;
-		};
-	};
-};
-
-&uart1 {
-	pinctrl-0 = <&qup_uart1_default_state>;
-	pinctrl-names = "default";
-
 	status = "okay";
 };
-
-&xo_board {
-	clock-frequency = <24000000>;
-};

-- 
2.34.1

