Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452279;
	b=flQOfgfQNsJpM2cmCKUpGJdGI5XuV0F1SEYvQCIzqqGCbpuRRv4dN/BN8SPsxpO533O/
	 7tLSZ/SOYMKd7dB2z50bDcRiMFXaOpdYgsKPXv5umthyidAzuZu9MMVIeqlPEV+3d9MnY
	 ZbS4xWm1SCyyNo0JZzNYgIRBlZeumepxs+mUDlRXcaPRDVk55ty1z06yR8wsf2tCl/Mo0
	 zfuviI9Ytpd4rdoDyJZYQwyAhAvfHUyctPpmvsUa9NXWLmrXOLxRE66srkqLEBhj+YyVO
	 T4kivGgcSPURZ+ZwijlCBZ5AOs4NDV3R6ShIimIxwT76bLBkTuUOCdtzwbWtGuQ7utA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452279;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WWgW/g4YO7586v7SAbI7xaWfELdoMfth43jpoeeiAQQ=;
	b=pIVJb1gP8TkIutA+e3kPGZMVUDxPnvgVKQTKliywHiW2X9abkqKyY+TnUv363Iej9J7W
	 7OwH+VB/w+xmcMYQgqmOUydP/DTR8x9XQcBZyyjJxINWilnqY/itmNKvcoti3h+6CVgS8
	 xI1hFYRERn/2jkzKG1U5LJ0cC2RDA4+zLhH6BtUTiuRzachaJvpRno3CHGkAghuR3FCA8
	 Wst3Xnt2yHuoFi1aBwcDiBJ/I4F51m9q+QRzq24upbOGbNEhvSe3ywF/N3UN/fMs6vKJw
	 AnINTYVJdrV9BUG9KQMrkVBBFlEzQ+oFn1w2Hj1mZO9uwCyATi8DpoJBeCq3Sk0EYYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJycIeZZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VOqQ6Z1j;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563A360A262E
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:11:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 563A360A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UJycIeZZ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VOqQ6Z1j
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0DE51125690
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:11:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WWgW/g4YO75
	86v7SAbI7xaWfELdoMfth43jpoeeiAQQ=; b=UJycIeZZOVEJM23TomL5BqvlIvl
	CRAa9LGX+7B01T6CzVsSaicjM1IPbumDR52UvIbWpTzbzOgplUzJ1vEyYw4mXOE4
	6aG0W3IuQxsk8xbiu/f3EWd2NB+DwLbJt0JRmm9niFhpdJ1BAps1sFCK19Rkvvcs
	Q9RdYDjE0AVQWCP2AaicJmXny65KzDroEZLbq2/gjhrrT2OusZ8PjJRs6lZXv26/
	qqS81/+hhYgazlQnqjsDPN/9d8Z9FdzuBmVvnOprZglotOd241VHuUBisBVaDyN1
	8ENfKDAvxCzaam2AJZIjkV4FaXa2u8ILq+LoAVMZMfnGfylk21Q1i8vNPAQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn8q7s3wh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 13:11:18 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so521114c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Oct 2026 06:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452277; x=1794057077; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WWgW/g4YO7586v7SAbI7xaWfELdoMfth43jpoeeiAQQ=;
        b=VOqQ6Z1j/geTkmPgSXEfIOVxI+KszftaQ6ti6vJZYloop+wDMN1rXAAHx3TB9PQCso
         iFy6ZMMKLR0cJ8UJtEReHxYnBypRjyc7PMdOsuVi4Rd1tm6oS/mWwyLwuWdsZpQZe+4T
         dzkGyAcqYWN80ToAHcmsnkdn/uZsSzdGwVOu/t/tjdbyvGjFqQP9MGty/hOaLLjyHBLE
         1WrhxODSIWx9c2pOiGTPDsFclENt2SZqSfovOG/F8zhXUk68a4cBe4noONqDhdyzKrej
         2MhEL1O9Q5RHRnfBw05OM76gB6VHvJYWommAmKvhAZet1Uw4SNY+7xHD08906xAuxVjE
         St/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452277; x=1794057077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WWgW/g4YO7586v7SAbI7xaWfELdoMfth43jpoeeiAQQ=;
        b=SwL/edz7rqZPj6bJ/9f2cfLiJYiHd5SYLTZCE9vcOCN7xYtEhcbIv2jeCfBQhf5XF2
         hW4HySVUUE782+C+zajqpMW84miLnBkX0pWig34MXgdgiVcoF4y2+arg/a8xXc9juX2J
         nXIfK2bnawLxmr0Sr6a8J8WeqpMPgYqDOkZZeqmF1ziHlGymWCrWzCxUhnZ8Akl9uW+F
         aCnPZyldWcLajk7RVdMyE6kkvT+N9RQkJGTJlfn8GV/U2mDHFSJ2opM+lC4ISVqSVQjq
         ZnkrtWzsDXyHFwQZNIKdjnLV/zl1oeQf16NVyybSFtBZPuaaJg6dNnWO+xxCAqDj93CA
         QuKg==
X-Forwarded-Encrypted: i=1; AKwUvBxIr5Y88sHlAt36KlsclMdnTizvOE+H6iGepw30ZyqTmP9E0d5H0SWKNiDR4jEO6VfAhAEc53azUi2Euuph@vger.kernel.org
X-Gm-Message-State: AFq9FYJYFV+IGMSPEbWpZ4Oojqlb5ii+nWlZaR1Bc/WymauWyuNgbHzj
	5E2+h8iCuxUVw+NgEFSNGFBVvKhRt8kZXMvrHS1WJ42X7cxUk24xY3ltLjHEENfuRMbv0FY8WiC
	VV2XG3r9mHZ9IXqShM9uP0BYu9xNFSX/8IaiGobZ/lrqbRcDxEP4V4ltDZgBQ7IOXkKvx
X-Gm-Gg: AYBFou3OLM3g3j3eaUPxHyf97eapm/PiKT2VY/wpDwRbuKl+t4E+Ma2fMcTu8YqF/95
	AX9wpUN03fygzE0hBzyMVAvFZpW6QtoG3ubwTIuLxKkqrMC8VC8jpBmqy8iZBsAuhB4HLBlvZ82
	275EN3PJowXSY1mXd4rL1fAdnqqYsbADKQnPRn191jY3l/MDy2JUUgJv0uU7Uen4S7YUD2Zi6Tq
	VUIi2K/ZcRDV6NF7sSL7udxuxQKR5qiVnHttfGV9WU/0NEo2ZUjh8wbeYS+NashqingdvmQxdVP
	vIT22qg1z04+kLKJCoIFHffT1flNsREV1sf8q6mqOExUNGMAw029sJtB78mPYVDgMWQQ8X0jCBf
	c0yQuIM1bof9XP2h5XpeS64S70k4vawTS/Zl0PFkU6QlMEaAEf0McW+QUoclOkHRtapYzchxeT3
	IpzKYYY8a768rvrDEVKvi8WWyx6AVwLtVc
X-Received: by 2002:a05:701b:458c:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1ac56c9fe8amr6039027c88.2.1793452276888;
        Sat, 31 Oct 2026 06:11:16 -0700 (PDT)
X-Received: by 2002:a05:701b:458c:b0:18d:9eec:e0be with SMTP id a92af1059eb24-1ac56c9fe8amr6038983c88.2.1793452276036;
        Sat, 31 Oct 2026 06:11:16 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:11:15 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 6/6] arm64: dts: qcom: lemans: Enable lemans-sa8255p-ride board support
Date: Sat, 31 Oct 2026 21:10:42 +0800
Message-ID: <20261031131042.1200862-7-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: xubazenyjby70OfyRGVmbs4MTGmGxQVW
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX+pJoRqjqo1Lz
 3fLMfNzuyOOWc91BU0UgPkNy9kS/kOqNvylstQ5Ur2p+mciSaauctYdvQ+zaz7N8Mqiu1I3nLHQ
 WUPEoGS3YLFnVSDOFVnI37a2njt/Kwc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX35ZLZw56j+IT
 IisTlyY8Aqko6LmNTbwfNyqEfiCTrOeUtXXt1lGD3DlPEjiTxUKZmdV5nO/YgRL8ElkaFbe+fhW
 uZXkJxkwvCGIE0siwoOFtaJkahxTXwVJ/sVC5L+GwXKsmE2esGlNBh27gDqrBqYZk6gXS86oblR
 Wabp1OX5v7pjYz8BYtTG8mco2dvP/TMqNcJdKKCP4aFjWx7zDdzG06nmzlp8f2FrMF1T1clLYao
 IncLKSduMZ3A1fnT0IoiqoE38UImloPHv45UvE/0YZn6b9yPRmmXzAHsLnCenhbZBTKXiwZ3DJc
 GMz4H6vkCt602rKoQlnnq0DA5yxsNufZtvgycgoxqWOMMaITv1iqAkJ8uk7a/2a+urtd5uURnCM
 cKAZjBb0Z3mYIq1/qjZm634c3QumCkHrNy+hneW2kq2kF9vjpFVIS42L3HgwvZAhdJiTsDgzlGf
 fOKVuijBrZ9FEEnAH4w==
X-Proofpoint-GUID: xubazenyjby70OfyRGVmbs4MTGmGxQVW
X-Authority-Analysis: v=2.4 cv=PucG/AM3 c=1 sm=1 tr=0 ts=6ae5e8f6 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=MNDMu2h6GyehcEZcpm4A:9 a=Fk4IpSoW4aLDllm1B1p-:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

From: Nikunj Kela <quic_nkela@quicinc.com>

Add initial device tree support for the Lemans SA8255P Ride board. Enable
UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
zones for PMM8654AU sensors, and SCMI protocol nodes.

Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/lemans-sa8255p-ride.dts     | 222 ++++++++++++++++++
 2 files changed, 223 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88230c4e00ea..c2d2dc1019c8 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -63,6 +63,7 @@ lemans-evk-el2-dtbs := lemans-evk.dtb lemans-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-el2.dtb
 lemans-evk-ifp-mezzanine-dtbs	:= lemans-evk.dtb lemans-evk-ifp-mezzanine.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= lemans-evk-ifp-mezzanine.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= lemans-sa8255p-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= mahua-lenovo-thinkpad-t14s-gen7-lcd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= milos-fairphone-fp6.dtb
diff --git a/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
new file mode 100644
index 000000000000..6f19064997a4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-sa8255p-ride.dts
@@ -0,0 +1,222 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+#include "lemans-gearvm.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. SA8255P Ride";
+	compatible = "qcom,sa8255p-ride", "qcom,sa8255p";
+
+	aliases {
+		serial0 = &uart10;
+		serial1 = &uart4;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	thermal-zones {
+		pmm8654au_0_thermal: pm8255-0-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 0>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_1_thermal: pm8255-1-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 1>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_2_thermal: pm8255-2-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 2>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+
+		pmm8654au_3_thermal: pm8255-3-thermal {
+			polling-delay-passive = <100>;
+			thermal-sensors = <&scmi23_sensor 3>;
+
+			trips {
+				trip0 {
+					temperature = <105000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <125000>;
+					hysteresis = <0>;
+					type = "critical";
+				};
+			};
+		};
+	};
+};
+
+&gpll0_board_clk {
+	clock-frequency = <300000000>;
+};
+
+&pcie0_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
+		    &pcie0_ep_wake_default>;
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
+};
+
+&pcie1_ep {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie1_ep_clkreq_default &pcie1_ep_perst_default
+		    &pcie1_ep_wake_default>;
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&scmi3 {
+	status = "okay";
+};
+
+&scmi4 {
+	status = "okay";
+};
+
+&scmi5 {
+	status = "okay";
+};
+
+&scmi6 {
+	status = "okay";
+};
+
+&scmi11 {
+	status = "okay";
+};
+
+&scmi15 {
+	status = "okay";
+};
+
+&scmi23 {
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32000>;
+};
+
+&tlmm {
+	pcie0_ep_clkreq_default: pcie0-ep-clkreq-default-state {
+		pins = "gpio1";
+		function = "pcie0_clkreq";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie0_ep_perst_default: pcie0-ep-perst-default-state {
+		pins = "gpio2";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-pull-down;
+	};
+
+	pcie0_ep_wake_default: pcie0-ep-wake-default-state {
+		pins = "gpio0";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_ep_clkreq_default: pcie1-ep-clkreq-default-state {
+		pins = "gpio3";
+		function = "pcie1_clkreq";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	pcie1_ep_perst_default: pcie1-ep-perst-default-state {
+		pins = "gpio4";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
+	pcie1_ep_wake_default: pcie1-ep-wake-default-state {
+		pins = "gpio5";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart4 {
+	status = "okay";
+};
+
+&uart10 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+};
+
+&xo_board_clk {
+	clock-frequency = <38400000>;
+};
-- 
2.43.0

