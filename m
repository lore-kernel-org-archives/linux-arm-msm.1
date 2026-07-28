Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF1DB4302F8
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785240043; cv=none; b=hq7FTgDVODE/Sf50iwQ88S7ULErHtUKxIEoHNbgh+7dwu86A4kFyVwVYKWeLWkDe9jBRTY1nhPsWrMUQDql9mNswktjnAVoy4BOj2hlXGgyQV9Cldt9ZWGtZ+iDIY7ntzPKy5PwUwmnt1RnVEuDaOS5XtsAmov/55XJx2i0XqsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785240043; c=relaxed/simple;
	bh=6Aw1+WVUAI+DwvYgJIhS2tW7UksriX+yE64VtlPavBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rsJb818TmrdZhYDyGS/ZkdJAOCBsiYBb/2v4Y6BXwDpOFcd3y2JraTRGck2VdTjW5bSMVKrZ1j2ypZtoSxFAsxDoByPp/IGfKwY1Ro0Idzu/sUX7Td+VUHqgU/G/D3hs73vI1xQYp+Ds86KesX65nsxkYW7r+6WYkeTPhkwRMRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SnTFySzu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GmsNCA2x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SnTFySzu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GmsNCA2x"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SBI0Wv2734825
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UwhjDu23om1aeisOByNZTGIDNH2y0MHYqk2a/K2tqjo=; b=SnTFySzu+XFNERM6
	nzQ//iQvosJBi7/O3bGdwXZkufyUtrurt00j2SQ3xBi72SloYocGMbdXYszCYWgY
	2ts8H9P4MFrUbf4REB5tSsx9XHf7aqy2LJj6Ai5hO+nz9yuMGf1o7K3dQHIeQnup
	yIKkDWrts7lj/l8qs/z+3X6/KX9etEp4Qs9PGN5WG/X6RVLfwmqx3Ct2eOjuDeTb
	lvmwL2uDmrf73vHXJM3Gq9RaHJLNPJL08pN27ZNXegTM/r/KidAB+Td3zcsMYJh6
	yBnAcgwYgJpS71dMAk3/FxTH5SpKBzAtAr/puCxDS2Uda8c1Q2Xn7bs/qN/Xm1lq
	zSJfqw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fpbrsv33m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 12:00:40 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccbb61893fso80875245ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785240040; x=1785844840; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UwhjDu23om1aeisOByNZTGIDNH2y0MHYqk2a/K2tqjo=;
        b=GmsNCA2x82G+umkTlZcCC/REfJN7d/6Jtupq1grdLwdQ+WbWWWb9n5MxcJLQ2q6xlx
         wvIDrlIjxHkbMx+AfkNXJEs9AuypKo56tGb2sJ2uD7wCQclP5ENhGvKkexsZnBLfBSxJ
         msZc3GvwAm/pWbz49G/BvDYw/Cdjc+VDVfxDdV9iEBQuezVJbzFIfQxbHtRf7XejVRYQ
         FbjdOVb5BdrF9f9Ujq5NHyp53fXJcpdcH1X/Xb5L1i7sy7g35n8g3RMe1iWAsEXlwwhc
         bt7Ebo71UrxC4AgCr6/9koipes28zmQ/sTrBpPFmcqwy3mAHLZPVSIZsooZVq7b0zMuT
         lmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240040; x=1785844840;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UwhjDu23om1aeisOByNZTGIDNH2y0MHYqk2a/K2tqjo=;
        b=CVBIczhHY43V2uJbxiE93ZxS1MlXCiCRe+UFv+utRpEeorPuNLa2tUMQPGMpz319zM
         Dr80a93uwtLGv8KQWCndwAxHoB+9qWmgYf9IQShNm8rgxJGWp3boRNWmuuYZKHMrdXAH
         HK3aTytwexMEesA++UxdU0qcV0EA4v6yZ65vsJyzHFNpoScPlboTsVqq9SB6c7F3CMg1
         1hqKkpwxfsWfNw5Ik/kLOPlD6NGLyLmnPWQ9+3CYKF8r5OZZxiDdNJsKJ3W+YmZRyYp/
         ckGt8VkDkeZyIOPRSvKOFBe+YHDfZDYtePBQgbDWDjiDs63xrMcqdJWGaijTKpzQcx3a
         SmTQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq4W9qHjQNV9AanHHHeM4IuIyqNlFYiKQwjFObl5SXhJY1MYftbCKFBrtwtRdpfj0w8UpRVzZE8A8qKEmfu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/rvWe2vHPb976wm+9qGY9pCTLWnK62NJ9PDRtxamScDf6H2bz
	QrqfODYk5e//WfGvg/dbY7KoHB+u9jRJDEVBParX5MxwupjkbQDsgaUzqaWJxxULLYGlpr75EHD
	lhEwmwckc/q8rW96dvMHJXa/Pp88Eed9sR8GY0eM+Smp/PcaNfyBT73hKhMfS+QaFrYbp
X-Gm-Gg: AR+sD11nbLwQk+wsOl2AiQZfFkmdJHAH1RJuQNFapwKpEuewR86rmbHJwj23Dp2yKiK
	9Es7WGhzotPbqLdrug7N+hUICCUoy8Hl/M3Lvnnxkqq1upHS0TF5/BGpAY1qkPh7VG9eVrML/d9
	90hzpjQeUzyztthMJ+YUG9FhWEFYtPNSFcaOsyWtZ+bCanHUbk3jzp3Zp5oksnahW34kHAQyG6G
	YN+zzQxcZwSqtVCFbpOzzjG61iOqiJKpdzFRQcxY+uNztUD4099RZ0ZGxhTrc9P9qWj4iRiQiUa
	d01wVxkLWvappI2DsLFbrmNz1cCJ+RdBum7eeGTSoCQhSc004zSG42Vk27ffC5gO1HLmW8cws4g
	ijJT++AgJlyWoCYYu6zRMECHJlw==
X-Received: by 2002:a17:903:22c9:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d015a315f5mr25456005ad.5.1785240039403;
        Tue, 28 Jul 2026 05:00:39 -0700 (PDT)
X-Received: by 2002:a17:903:22c9:b0:2ca:9d5a:8b6c with SMTP id d9443c01a7336-2d015a315f5mr25455435ad.5.1785240038881;
        Tue, 28 Jul 2026 05:00:38 -0700 (PDT)
Received: from hu-mdsor-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbe01sm51764895ad.48.2026.07.28.05.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:00:38 -0700 (PDT)
From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 17:30:16 +0530
Subject: [PATCH v3 1/2] arm64: dts: qcom: shikra-iqs-evk: Add LT9611UXD
 HDMI bridge support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-shikra-work-v3-1-e08c322596ac@oss.qualcomm.com>
References: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
In-Reply-To: <20260728-shikra-work-v3-0-e08c322596ac@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Mohit Dsor <mohit.dsor@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        venkata.valluru@oss.qualcomm.com,
        Jessica Zhang <jesszhan0024@gmail.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfXwgWu4gv0vR4h
 hOxJYaV3RX3v5R2Ntb4/SynKKWmRjqWXjRCrVNjYyUVNQ9t9hYHTKTdbQsltlvdIdNGirnAk6bs
 59MyEfx8eTcsVvP6IPj71KPU/xkVfApTMH/OuL9PE0Ye4CvyGWW5bUn7dRQ5wzOJxA6jt+T+tM6
 n7YmJzZhebH6ktd72Brm2lsHW+JLGDwGBVKVw6oWIwU0qUR3PYMl4chldHzd3kCcVAwUrshE9fk
 InXqgoU8y7wmI8caQPic+cGl8BFGAv7Zai4XPDuTK8Pk0W8wVrKDXHhTr1GJRyAMa5dEWqttQae
 sTigUA6MTqJs7pvrpfWcZx4PCTvgcZjMZf1NA7JBA8Q7dXUrKc1grkZNv5NVInBzYvEJueTYRlq
 WjDtyx5cjKz0MY3oDJuYFYFsaAG+vzkbQKy5Pl5Y6Tp82QMpU6/NsqlitfNDKglFypgLP4GvZ7v
 Kc71x4cmTdgSLPw14SQ==
X-Proofpoint-ORIG-GUID: humZsNkj1Nxb8qpjS5SeEBSMrwhR-uCT
X-Proofpoint-GUID: humZsNkj1Nxb8qpjS5SeEBSMrwhR-uCT
X-Authority-Analysis: v=2.4 cv=ALkdLnG8 c=1 sm=1 tr=0 ts=6a6899e8 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Dh2IlRrSrxxA8ivr3KQA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEwNSBTYWx0ZWRfX0U/gm4y5/uY+
 1ILWiJ12qmUBCd3tE83yX8TeT4HwPRuEKhNhmYbSYAv7PqPcD7DVGszoFfJ2SGnGBH5/5m9GaXg
 2pFojhkIBq3/PItnU1Fq/3yrXnM0l1w=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607280105

Enable the Shikra MDSS display subsystem on the Qualcomm Shikra IQS
EVK board and add the Lontium LT9611UXD DSI-to-HDMI bridge node.

The LT9611UXD is connected via I2C (bus 4, address 0x41), powered by
a GPIO-controlled 3.3V regulator (PM8150 GPIO4) and an always-on 1.8V
rail. Reset is on GPIO76 and interrupt on GPIO85.

The bridge receives DSI output from MDSS and drives an HDMI-A
connector, with the link wired as: DPU -> DSI0 -> LT9611UXD -> HDMI.

Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 117 ++++++++++++++++++++++++++++
 1 file changed, 117 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 3a6962388dfd..27c4caf55193 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -7,6 +7,8 @@
 
 #include "shikra-iqs-som.dtsi"
 #include "shikra-evk.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "Qualcomm Technologies, Inc. Shikra IQS EVK";
@@ -21,6 +23,106 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
+	vreg_lt9611_vcc: regulator-lt9611-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "lt9611_vcc";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&hdmi_reg_en>;
+		pinctrl-names = "default";
+	};
+
+	vreg_lt9611_vdd: regulator-lt9611-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "lt9611_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+	};
+};
+
+&i2c4 {
+	status = "okay";
+
+	lt9611uxd: lt9611uxd@41 {
+		compatible = "lontium,lt9611uxd";
+		reg = <0x41>;
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&vreg_lt9611_vcc>;
+		vdd-supply = <&vreg_lt9611_vdd>;
+
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+		pinctrl-names = "default";
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&pm8150_l11>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	status = "okay";
+};
+
+&pm8150_gpios {
+	hdmi_reg_en: hdmi-reg-en-state {
+		pins = "gpio4";
+		function = PMIC_GPIO_FUNC_NORMAL;
+		bias-disable;
+	};
+};
+
+&pm8150_l11 {
+	regulator-min-microvolt = <1232000>;
+	regulator-max-microvolt = <1232000>;
+	regulator-allow-set-load;
 };
 
 &remoteproc_cdsp {
@@ -64,4 +166,19 @@ &tlmm {
 			       <30 2>, /* NFC SPI */
 			       <138 1>, /* NFC Secure IO */
 			       <155 11>; /* eMMC Boot */
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio76";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
 };
+

-- 
2.34.1

