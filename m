Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0EB82BD0B
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791785922; cv=none; b=Xibz02WWiMqFfxhzdilopzOT0CriRpXnf8rgwHvzcjoTXF/1a/iVBHM7uJsqEeHRQfvYuXbJOW9X9W8BX00NuiRsP1zXZzNg3R7jAS4lN5LPtN1A2d9uRHLIezbO12oYnbDXKIcpe+Hj/fEaWE8YTiUw17C8WXO8O0LqUP1LsSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791785922; c=relaxed/simple;
	bh=VF1vrOXjDwUFWOcoVC41AZp8SxZqlzs7+l7buexvvxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=odPHWi9DhneYS7esoxGCw0bdgPCz7CGLwt14jNE4+oGkp4ZTOyvx7cNWlRiey84F3KXPMYKyzEBHi8F7QNcMjL4XehWZFAeR54p3cALKmgk3XXfy10Vnwxh+qsgmBf6BlH+8MzQZ7QfjcT5N5o8WkKwaeH8Q2e6DSoSkj/mZoLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lM6errTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hHhs4rPX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lM6errTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hHhs4rPX"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C55oW21339374
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:18:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jpKGhxV2U6/k2hH55xfHmfB9z/ibmAvg9cQSC3I9wEU=; b=lM6errTR4LNMs0+Y
	SVRJTJg+XybfajaDLhtoFs6kswcLvPqbn6nukAFL9l1Y1sk7xbMM2cM0e8JsCoJz
	j4XCHexXW5bLmpdOOOeP2x71FIrIYYSbk4xReHTJhH3UlM4q9Yn/tkSRpGbg1CSB
	Xph32GFlZkSAeKtL7YZjSWca0y00oshh8XCliw+Aeng9pjO+VLFD2dne4xjJ7T66
	QEQFZ8IPv9UT879G7ZHf1dnxPQR3xrrhnHKhktDkLNNAlTNLAoWOQYafG53FhxqO
	w/DNc16lYSN9oYF+iz7ornM3g1Q8aKSi1WFYlFtx0HMH1TEUZUABCXtPeMgUxPcG
	Y5momw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk2512y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 06:18:38 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd5fd34fee0so350978a12.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 11 Oct 2026 23:18:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791785918; x=1792390718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpKGhxV2U6/k2hH55xfHmfB9z/ibmAvg9cQSC3I9wEU=;
        b=hHhs4rPX+V+W3haNm6nYI2h6aTAd8ZyVIX3fwDqu8ZTIpAhLhStmw+xsoXXMXkYET9
         q/04po6X+WnCG4SaVWl/4kSjsjiM7EnzTJBWSzElJueecECLdC7ATB5NLzWQhbsjDbgO
         lg7GTHs0DDgtynzjqLBfrEh5uGR3OV782dMuiEugDsgt7N9uFQ2vfUolUswRlmHca2Lj
         rHqdMvDlXAssL8HkBKmkbmQPi7DfxHJDoP4lJ3mH7t7LKbNVF3FohKeWtzeDee9MkLce
         IQtKSa3fiQaiQXOpkH2vF+KJZXC2U48XkO9DGxWkpyDm9mai5FcDKeYoHPIZ3v4aBNJA
         nRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791785918; x=1792390718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jpKGhxV2U6/k2hH55xfHmfB9z/ibmAvg9cQSC3I9wEU=;
        b=KzYNLJ0uoCKV1cNhvcaftt7woPy1/lBNbTVk91xnd2w9VFn1mUoYO2p8Bjs9YkCPDM
         xT9yetC6HL2FhlEXcX/l5iq8txZdTHm93u7aI0QG158zxW5ygCRalxOb2PAxHsbBZb6u
         fPpS5/sTv86Z/zc3aL1uZ0kmU496px53BkOWVpIgHbfrXETyYXIoBTErwvuHgpbozeMf
         8F4KKaHyBf/beN8qbW+JMJxqT19kV0534Jn7EX8ThrFE7bMF9md+1IES5oxJ4RWvSy/x
         65jUENRW5IR/hpZuNw91lBMSCDu19tJc8ALPgRgKBZ0LkZm+JordzxzHz4Hp30sTllbQ
         WTiA==
X-Gm-Message-State: AFq9FYI7MLhzJ0+5LyopsLvxDBNi5nUXm64e4Wyl4iTYzYoyQrJgNgDj
	2Dn3cI9XZu6ybpN7AC+Lkth5eqWb5krGyt1aStLSuSuNMZCLbNYIe33IcBt8XIfAwVXhjgP1QKo
	E3xecGuZ7eRLt6P4VVj4wJpqP0Zs2xDqdCA23jGGIVrxy1xDnHIPXyIk9iDY4KOtxEC6o1ERO1K
	Yt
X-Gm-Gg: AYBFou0OvAAfZ7JodnDfcKFS9ptaTQszzFnQlZP0UqQylyw5jnerir4vOyQAIHwuwFO
	+sZ48eh9K3oWwijPOkmU1pO41mkrw77DT6K+hnhKQLt3yfw49I7uPEVqyYbGElu7f7JtTYwk321
	d3VNbqu2i9ZyODTanJf4Fya65CYGExWS2TD+x0Q7WyumODiLjVGB851Gigw6vbvlVR7N/pvu144
	Bdi52YgeDdiD1u3btS/ljNHRD81GSrEO2ujDQ4Sbk5TNadzFqVmXW1VFBec4wHITC5PZx9e58fI
	uI8l/WgyZl6H5dyxD98v8XhJNRkWOWtmZrhCCRuJrdQUWUixkF4KO8e+gkeZZClXRLsEPDiVOnn
	7uJfHNRT0ngaTMw1f+sWs
X-Received: by 2002:a05:6a20:6a0b:b0:3e1:348d:b477 with SMTP id adf61e73a8af0-3e16bf7e317mr7850144637.20.1791785918170;
        Sun, 11 Oct 2026 23:18:38 -0700 (PDT)
X-Received: by 2002:a05:6a20:6a0b:b0:3e1:348d:b477 with SMTP id adf61e73a8af0-3e16bf7e317mr7850131637.20.1791785917711;
        Sun, 11 Oct 2026 23:18:37 -0700 (PDT)
Received: from [10.213.104.249] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd3d9e07329sm3770481a12.5.2026.10.11.23.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 23:18:37 -0700 (PDT)
From: Ruchira Revdekar <ruchira.revdekar@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 11:46:28 +0530
Subject: [PATCH v2 3/4] arm64: dts: qcom: talos: Add Talos Lyra EVK board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-talos-lyra-evk-v2-v2-3-dcc9316ebb59@oss.qualcomm.com>
References: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
In-Reply-To: <20261012-talos-lyra-evk-v2-v2-0-dcc9316ebb59@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: YVoa2eea_ACOqWTJfGHQx_f_nnfkF6SD
X-Proofpoint-GUID: YVoa2eea_ACOqWTJfGHQx_f_nnfkF6SD
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acc7bbe cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=dSjqtUHhm-0m3M1yROkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX/Wi2AzVEzooU
 RYoEhRKIlo30JF2ncED1ANKlYYpBR0BprO0HsXy0lY62bjaiivs50+ZlSL/WELDwEzbq5gUh8ce
 tCWVlwr3nwg2EczdKTfQqjtjFO99sde7GA//XhEiUyOyV9sipYlT+Y5SMZYIJ1eGjmScEZLTN75
 D8DGvq9CA7RH2jKdkfjhxfG4QbDfUScSD5P666EQJgGA9Rl3PFv7uGoTBLXSWTrux6T3QJq8zsc
 ion0oy4BAdSdN+jbvnu2coKyfCpSf0cyYdflrQ8PMYyFO5GfuLC/JntXXJF5lSBXnJGpKP6ipai
 tnVlNv+gZrtJSQU0P8I5GLwLExP6bbOt76YdXGXqQnyWTFKhG6CebpZA7s5JjTYkjqoCrRLUP4n
 nlPy8ZQ9KXb2wF4Z20FkJE7eLbSb1Y20WXA4e2mzEENzLJj+vUixsPYZZH6vY7pBKKuE2WZWfKq
 7sb1Wsl7DPG65Xm/yvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAyNCBTYWx0ZWRfX+PWx8u7N26uN
 idGSSVfRmdNwLtgYawN8Slauq9WTLYgQf4SYNvg/LFjweBptcvokeh2mOYcrfoit+HPJNTV5cWJ
 VmrE2OlMJOn9cPipePWwCUN8GBhiG34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_02,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120024

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
 arch/arm64/boot/dts/qcom/Makefile           |   1 +
 arch/arm64/boot/dts/qcom/talos-lyra-evk.dts | 137 ++++++++++++++++++++++++++++
 2 files changed, 138 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..2f25575e6efe 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -456,6 +456,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-valve-deckard.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= talos-lyra-evk.dtb
 
 talos-evk-el2-dtbs	:= talos-evk.dtb talos-el2.dtbo
 
diff --git a/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
new file mode 100644
index 000000000000..cfb563658fe0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/talos-lyra-evk.dts
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+/dts-v1/;
+
+#include "talos-lyra-evk-som.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS615 Talos lyra EVK";
+	compatible = "qcom,talos-lyra-evk", "qcom,qcs615", "qcom,sm6150";
+	chassis-type = "embedded";
+
+	dp0-connector {
+		compatible = "dp-connector";
+		label = "DP0";
+		type = "full-size";
+
+		hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
+
+		port {
+			dp0_connector_in: endpoint {
+				remote-endpoint = <&mdss_dp0_out>;
+			};
+		};
+	};
+
+};
+
+&i2c5 {
+	clock-frequency = <100000>;
+
+	status = "okay";
+
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
+&usb_1 {
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	dr_mode = "host";
+
+	status = "okay";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};
+
+&usb_qmpphy_2 {
+	vdda-phy-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+
+	status = "okay";
+};

-- 
2.43.0

