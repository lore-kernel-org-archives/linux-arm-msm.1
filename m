Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 258F748B368
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791808197; cv=none; b=VsEPPGgvGcGrs80yNWmPK5dFz5A60zNTdkrM0RCGrBqTe2K8zrpJ4xOpp5VOVxk54q0gB55SLXXVqe5tKi0+tzTLbSCaxrsnpOn9wuWzQDwkumfO40cH2Nw/ipmT9EpYFdzYgJgr6PY6ZeTCZS79Gf8TpW7hLM4SEk7jawL+jMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791808197; c=relaxed/simple;
	bh=+hii5+Dl7zlOwgKn2KfFJIJ2jZ1j/vWBvRpoEY5SuxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQBc97wnVSzgWN+ao2yWSH8PGHLpxZZ8P62Ok5sbM9PnCkxNqGP90cJlHQNpo2djoPEhtZS9M9o8O1t07TP5XBcx7sp5C8j6tej8CiV1UOwix29I7sLznbEXgIcGOczzE7SpW8a+6+3g9U5vahC7bGgFo4OwiA8BQIN7DfAmnOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPFLSRYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I0ambRMO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPFLSRYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I0ambRMO"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0BOf2275899
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9pJICCJ1jf++M2QDSH+MG+d1zO5Y83scFcB
	BZmIu3a0=; b=CPFLSRYrDRpoOhDMB2JZ9hI4UdjpLCMnmXNyEZliuZHeUR8vGun
	H0CZjMr7M5GbBSsiWfM9T6cCJgOPY6kiw/N4HEnQ9HfT4K9SbxLsXqqqESfq09YM
	+y6Z5/vzeFZe4Kf3FdhpHrxd5QYBv0E2r1JejzhahASv0AMRLxEeaEkaZsUPp6Di
	xJD4Ja7gdRvKl4GxHSILMeJz8MoaGYp/OkYDPpCcS0wMF4GSXJX2kHef8yt17h/w
	tjcSe1/l8o583jRnqb2tao3Y87nrjY1EcbSlA+dXJdYdxty+mY3CQjOQM+JWQ7af
	TBibMaEyVV5vzt7jSw0t3034VXsfIk5yejA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8udq1a4r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 12:29:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e848cd27beso6404865ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 05:29:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791808184; x=1792412984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9pJICCJ1jf++M2QDSH+MG+d1zO5Y83scFcBBZmIu3a0=;
        b=I0ambRMOXUhUhGoYZnYkUHyE8gNJU3u7jsHsF3FGACMwozNsTzoq6+t/z0rx0Jrkdb
         GFRNaYb0hIe+h4NONglADzhJEX5MkN7KNpkHYKmVmp348KpQqhPAaKYO6JTgM81Ccenc
         e4CLT/V1eAyvmrdPwqFlphAZEZC29c0RKRBxWJBBpKHJWK5vrXeK6qUaQC/lgJQhqo8i
         aMPXuk4YkGdgLVTLqGI5DKhQK/tYIPY+lXNpn5YTxvQ1NJSUzgGhCjo5NZH9833borhb
         lan83KrOzl2f30S1Xb1JraMrgXXxLA3mWl8p146D8lf5S5ZhIUYa0UasrTcpoP1Q5W2i
         HokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791808184; x=1792412984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9pJICCJ1jf++M2QDSH+MG+d1zO5Y83scFcBBZmIu3a0=;
        b=ii/yqLyc0SNcP1oSuoP32gMYvX6rV9DWl2sHkquBjjGxH6h22yoipo/QGDIGO/8+bl
         8mx3wDGEsaIEEwWUUi5jNphrkrSXwkIgngeb91Br3iIVdLZFOcIEVn0fO6skSvWU3agR
         7m/PVtqu4Cp4UIRyXm5FmEkkTK6Tm/cMpa2dpw212vZ+Wi/v2Y73N3o4MJTSrMTTsPi+
         iH/ipNMV2KIs7HHaJuTFTzIiuz9cJR3wbJReF6BtMNATpnyya/AIxhCY+A2MtxGjEsqJ
         SAlLsyJ97G2UUNH5SXtlHBPBn/qVQbm254YGlbn1SS1TZPOg8FxJvtFNnUMHl3a/2y1P
         ra5A==
X-Forwarded-Encrypted: i=1; AKwUvBxuwYFOJ4VyKl23T4O6B1aHebdhR7nAaDsMyLGO28vZpJGUVetLxMVYfHcJXCLrJ5BwtjVN3edFKuku4boG@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3qyLjPBBLehDOo+bpkYELXMzj1aTUupCMWOaW6cil7+KK2QCj
	TTZBX6PLUkdZLX1xS9g4PwguHXrpZWp1jD8s8xsU47vnLOMtTvP102MrxBuCk9eSwR9Hlpagujl
	xhyk9wbunJw4u5QUPxRN3+m6cognoLbar3K912sG1cOEQl6ot+Gucm9RyJ4EC0j7wXRBS
X-Gm-Gg: AYBFou3w2SZWTPVFqqr5yeZ7j/KzbwGP0Qua8RXFGUy3MKJFo/CqExb0cpeWEN/yEky
	nPUvleJAiHw5UrDSArRbeeH5wsj0IQaXw1xwc3CoYAkMRu9lbFnsAyNNq9HAGmXprQALaF39I7K
	lzY+GX9d95F76rz3d5u93q1t/5nt5buGUjOHFNps+yc5U0RiF/mUqEH9Vd6aQEbX1EFG6UwVPNx
	y8CH7CAIAOHxvp/y4BcpLFcdrVKP1fMyCoRl9u8jg+wIhNUG13z9pgvmPfvKVoGJMMs6r3qc+Zr
	RhKq6B1CJbfbN6VUZFmBb5Mj5PHlbYXD15u361K6gXXqwAZLUxW2KXMwURvwS2I7JYsMXKg4Ho8
	d+T6U5pEuDkKscVhmBf5TE0yB2Jux
X-Received: by 2002:a17:903:22ce:b0:2e5:e361:5560 with SMTP id d9443c01a7336-2e842719490mr127967655ad.0.1791808183614;
        Mon, 12 Oct 2026 05:29:43 -0700 (PDT)
X-Received: by 2002:a17:903:22ce:b0:2e5:e361:5560 with SMTP id d9443c01a7336-2e842719490mr127967295ad.0.1791808183110;
        Mon, 12 Oct 2026 05:29:43 -0700 (PDT)
Received: from sdciot-sh07-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422e1c89sm41761785ad.75.2026.10.12.05.29.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 05:29:42 -0700 (PDT)
From: Linghui Wu <linghui.wu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Hangtian Zhu <hangtian.zhu@oss.qualcomm.com>,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Linghui Wu <linghui.wu@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: shikra-iqs: add M.2 Wi-Fi and Bluetooth overlay
Date: Mon, 12 Oct 2026 20:29:34 +0800
Message-ID: <20261012122934.3240030-1-linghui.wu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=evJKXYpX c=1 sm=1 tr=0 ts=6accd2b8 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=HwT7i5cL4_BIIXZyjbQA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX6pY8UM4Qo77C
 H5tkBJz34D+ziUyJH1teVp25XukfI1g+FPyzOHflVzbmyQ8JAAwlNhMUmoaO37ZE7nvHrNFy3yy
 dVZ8B26SFh4AituzOhbOC1YgY9wNpTg=
X-Proofpoint-GUID: f-WRANPC5hSjg1l2P7GL-iOWp4riLNsh
X-Proofpoint-ORIG-GUID: f-WRANPC5hSjg1l2P7GL-iOWp4riLNsh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA0OSBTYWx0ZWRfX8WBi1EgUfq7p
 RMLBzvIvy/cMJxUjvAr4oGlxMcePvF1R5XU7YEOAGNBLjVRXshniARXEWcqKj7C9x5RRAHSG/6M
 FmK9Mg47r4XbXnq270RIkonX3EzSu6OTmuUH9BRiDNYCQEQ//X1G53wOHiR2US8hyU2EI/Jd8UF
 TYuHaNLMwLfcJi/G/sIeVWpnEZ4Rtw+HHyiQrsWKMVGO1SKhMkEaALJYmac5XOzBDJF8VII/Fne
 ZA/iyOR1wC0644xfcNar64fB/5RSZScVOwuhTzKGW/M2KjnlFX+lJ1lgf5evOL0cmx29xJEHfen
 OEhH5LB+gAH5jH01Ahbexaq8p7FgeddXJ3kVyJBwLdxC9r8U7tzawKMu+LP65PaD7W5JhGfFbxq
 Y7BSUBJdVehcl5vBKYZ1mewp4T+0EXqe91ssl6Y1ZzcB16Yx/TQ/7eXhYtz4it3snbQX8J+6DU3
 3uHkpb8kcrbbNLLeQ7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120049

Add an overlay for M.2 Key-E Wi-Fi and Bluetooth modules on Qualcomm
Shikra IQS EVK.

Describe the PCIe and UART connections through the M.2 connector, the
3.3 V supply, the W_DISABLE signals and the PCIe reset signal. Disable
the onboard Wi-Fi and Bluetooth nodes when the overlay is selected.

The Wi-Fi PCIe path was tested on a Shikra IQS EVK with a QCC2072
module. The overlay was applied, the link trained at Gen2 x1 and the
endpoint enumerated. Bluetooth UART and HCI runtime validation is
pending.

Co-developed-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
Signed-off-by: Linghui Wu <linghui.wu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso   | 107 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 1c86e7e98f55..799faa32e2d9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,6 +339,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-m2-wifi-bt.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
new file mode 100644
index 000000000000..3264c0add67b
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-m2-wifi-bt.dtso
@@ -0,0 +1,107 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	m2_keye_3p3: regulator-m2-keye-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P3_KEYE";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&qps_gpio_expander 6 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-boot-on;
+		startup-delay-us = <100000>;
+	};
+
+	wifi-bt-connector {
+		compatible = "pcie-m2-e-connector";
+		vpcie3v3-supply = <&m2_keye_3p3>;
+		w-disable1-gpios = <&tlmm 61 GPIO_ACTIVE_LOW>;
+		w-disable2-gpios = <&tlmm 60 GPIO_ACTIVE_LOW>;
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
+					remote-endpoint = <&pcie_port0_ep>;
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
+					remote-endpoint = <&uart8_ep>;
+				};
+			};
+		};
+	};
+};
+
+&{/wcn3988-pmu} {
+	status = "disabled";
+};
+
+&i2c3 {
+	qps_gpio_expander: gpio@3c {
+		compatible = "nxp,pca9534";
+		reg = <0x3c>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&pcie {
+	iommu-map = <0x0 &apps_smmu 0x0800 0x0 0x1>,
+		    <0x100 &apps_smmu 0x0801 0x0 0x1>;
+	vddpe-3v3-supply = <&m2_keye_3p3>;
+};
+
+&pcie_port0 {
+	compatible = "pciclass,0604";
+	reset-gpios = <&tlmm 118 GPIO_ACTIVE_LOW>;
+
+	port {
+		pcie_port0_ep: endpoint {
+			remote-endpoint = <&m2_e_pcie_ep>;
+		};
+	};
+};
+
+&tc9563 {
+	reg = <0x1ff00 0x0 0x0 0x0 0x0>;
+	status = "disabled";
+};
+
+&uart8 {
+	bluetooth {
+		status = "disabled";
+	};
+
+	port {
+		uart8_ep: endpoint {
+			remote-endpoint = <&m2_e_uart_ep>;
+		};
+	};
+};
+
+&wifi {
+	status = "disabled";
+};
-- 
2.43.0

