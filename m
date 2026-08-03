Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98366403EAD
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 11:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785756466; cv=none; b=QCyenJtCVW2uuKc19tcjXT1KZmc7MiGI72sNCKPGtWQgnykIy+Dzu7heT9HHZQFFk5tbEQ+rYTRhL6PxZH457cvt67IfrUau8f8087ZbvuQin3LWIiVZXYL5ZRk+ZxUD7XE2T2C4SP+gMw34tIAcxu3exLdep6nuGpptjiq0du4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785756466; c=relaxed/simple;
	bh=CunTSypJtWlyW28U7WXVoqOPrB/+X5MUi3tMnwngJmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TJspPtSqZp6yxGRrUXhSU2LLrX+99x7IWrbG0QhqTNl+DUDSNvmynRZfOVp0IxFCoGODHC7+sMIX7TM2KljLqnheS3wvPdeLKAquiPBgjRfu24T3nFkJrpnXP8bBW2FcPd2WpdRTz88LRFWHHhFuWPy2v39EcvGnPpAOzH0DP70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QT/Pxlhs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NarKMaqb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QT/Pxlhs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NarKMaqb"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673AQdw53956927
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 11:27:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dzzH2CnGNr/JtNcizsYzqX0tKbpUEyxmDzScPNkmqKw=; b=QT/PxlhsbnTE8d6+
	HPZmIwqWpIs29chHeIMiVDB3BTP0aY7n7X0qHpjjqtoyuLMxCWq62RhWodXkoW4S
	rQMHNr8SMKBHSYLCGevvHf+xR12dycXFhmNaSF4KFGe4Q8Q2hr6gu3ZwPwtoA+o7
	148fPjuB6w5DBLUKu6k3PxPl2C4VWija/3DRQpQQkKgV8XGjv++TeBDOIiVdZNGt
	bgnXh8CjC12zvlW62/OEaQKairvg3506u7pNMVIcpxhPbbdbkW8hBb/YzJkVvxRH
	Kw2AszpPQ4VZI5QgJT80qJOb0+3JWgOa+sMITpY7VIovdhz+qxm7sTKZl84Eozqj
	rCdWkQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftnvnh845-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 11:27:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso4698275a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 04:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785756462; x=1786361262; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dzzH2CnGNr/JtNcizsYzqX0tKbpUEyxmDzScPNkmqKw=;
        b=NarKMaqb24wPxR12OdtM08OPpd3aFUDW9dHiYKrUPwk9JktrUImzyEgN7OttTr1nIh
         7E9eJCDrDeCsJQShjOjLzHEMbP8WcFNBvg11QEUGCwmWeq42P2Dsl/JLnUw44GLVEN8v
         Sd0u1bYwV7IjBVgYJgMNBsZKyQV5TIA/cGbb4ZjQ0BnP6FlWfTrFVPA4pTzzmaJzL6Me
         rBPK1nTLY9dNOyivL2knJpJh0qJA7Ap2Gp1c+hU/El9Mq58f330f2CPYcMcQvlrpEISC
         7rU1wtHgavQtern+mF0zHnldxGKpFdg3eVtTWOgubN3L7cG4qjbpHHJFlp6gNcfPKsZr
         gXjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785756462; x=1786361262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzzH2CnGNr/JtNcizsYzqX0tKbpUEyxmDzScPNkmqKw=;
        b=khQcq9qtIHF47IyTAjx8bHZw3kPtNAty4fOKmVDq3zOwPjCDClGx7AHm949SlPpSAC
         b8piJHDDex1FtCZOdH+kSv/a0xhl9n+PA4GShO8ItZ4B+kR9rHcgT+08hsDh0u9lCUww
         A3Py5kt9AvBWJ6PuK3Ls41F6Y9R4sNAhHdTnynUSYjqZlggecAMlPP2Jq1dboqzdG3Ig
         URcTW4bzpKqcnAYtGxH1FLJoqVVi84VZSIakbzxjEbjtvONiFezaWVIlVHQ+r4SK1IZ+
         c5WunPjIHnhnvx6NUjwNp7j/7kIfJqHybxccKrPEsuR7/SlQDELuargmxnXlC10Onp+s
         fiEw==
X-Gm-Message-State: AOJu0YyKFgXvbRHKA/1iSqdpmghz/R8pO/5Opebkns9Y4RKjePcIcM3t
	/yFZJE4R6IpuOHNV5j1WCZeDLCBUnkKN2DokslqwsUpfdVrbZqhSLjKfCWWGgIHIt2yutbxAO/k
	x9Iu90yN72MM9aNfnDNELN55nAL8xR0u4yupIpb12E9Kjtq+uraSHGaGZVvsJqydDYGNa
X-Gm-Gg: AR+sD13UuEgBZZhr1Pmli5F8fuUh19kEDVtHRZNX0nq9fExNfwcxbJQys+KQO/ftF5J
	WmfU4d09aFuCErN7/pv2K4QtOgX/NR4mdgQUvVo59D35CRN/cp/pdhLN9GlybuutxY0vCT86MXp
	EA16FlCbGUzEQ2hNppPfEjJqe6Ei/w3jiSlWMS5+3nMd8HMgDUuHHztkO5peRzjZGiP4VLldDDv
	sUKwrtNRdtrXctxBLyenxHr8HOgtiTkfghvqvbe8wAPAECEggqRqfWM97n9G8Gr4Jw3iEqPVl5Y
	o/P5aK4SVAAoxUfYXc7Iv3dTMQv5eCe1H2ITal2To0YMRY9xCMC0J01T1gumIucilmeUd8DyFi7
	W75TsGHwOu0H4iSE=
X-Received: by 2002:a17:90b:564f:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38fbc53c3e3mr9013884a91.34.1785756462228;
        Mon, 03 Aug 2026 04:27:42 -0700 (PDT)
X-Received: by 2002:a17:90b:564f:b0:387:e0cb:7ee with SMTP id 98e67ed59e1d1-38fbc53c3e3mr9013843a91.34.1785756461807;
        Mon, 03 Aug 2026 04:27:41 -0700 (PDT)
Received: from [10.213.101.118] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab132cc4sm29967043c88.2.2026.08.03.04.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 04:27:40 -0700 (PDT)
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
Date: Mon, 03 Aug 2026 16:56:38 +0530
Subject: [PATCH RESEND v7 09/10] arm64: dts: qcom: shikra: Enable WiFi/BT
 on SoMs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-shikra-dt-m1-v7-9-7fec8e777076@oss.qualcomm.com>
References: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
In-Reply-To: <20260803-shikra-dt-m1-v7-0-7fec8e777076@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785756396; l=5005;
 i=komal.bajaj@oss.qualcomm.com; s=20250710; h=from:subject:message-id;
 bh=CunTSypJtWlyW28U7WXVoqOPrB/+X5MUi3tMnwngJmA=;
 b=It/GTH/EKVzIUP4fnGsDWO6heucVI5qpmOMRu+Ni2KtdeleNk+mSPYKtMF11zOG1+DfLyBX8M
 VEgdR9HdazZDFZ72Kh2bx7tx4jN6v/miM3lEs9dET2kSi1Vdft+ayvq
X-Developer-Key: i=komal.bajaj@oss.qualcomm.com; a=ed25519;
 pk=wKh8mgDh+ePUZ4IIvpBhQOqf16/KvuQHvSvHK20LXNU=
X-Authority-Analysis: v=2.4 cv=aoaCzyZV c=1 sm=1 tr=0 ts=6a707b2f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=4qNR6o1dbhOseOkXa0AA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: zzHEZnxlTyfeuhov9s-_-L0PbNb2rZ0_
X-Proofpoint-ORIG-GUID: zzHEZnxlTyfeuhov9s-_-L0PbNb2rZ0_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfXxG6xKd99O6mL
 6XrfycfdABgQZQll5rW3rJtXlq9pjNQ4U9fWZzAQYASP9PbVlbehYgN6/GQeQzdGWNpml51laAo
 KAhmaD1PXUSApofOgCMiNHXT9Hk0kTCVGgIdweG/lQEabdX7wIRdhWtyZblzehgbhSmz1wo0Wc2
 crUGCnCeOEzZihsNcmVjbnNbMmT2rIs5eTY3qXMSlA2SIiiWjzBZbvaqd3LsDTgRFiECt7JqvOi
 ehXx8LbzUqChEw9mygUwJT0VuatnRWsRPyUL8mtlgOLj8Mzv5+GM2kTR+EEx21SMIs9oz43tDSl
 GsUX25LbDqauF+dwLVvi+ynWfQQHXS3OuXChH4gnMb/7iguEARGAM9ZepA+PwE03T9Aiycq98XB
 Sf00BK8DiYLdz8fvlnoPwDgTohtI3bq2cX4AATJhpGrQU6tCjt7SmYB6Zl+By7/JkcwEH6v0Xlo
 O298qXkWLhI4SAOZMdw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEwMiBTYWx0ZWRfXwUTXXWDvahWV
 Mn7TValOHa8JRr5bsT/E6GDo60nMt/wB765FleC7olsiRSZJWO6n/bUJ2OnlN4N5Yms+iHIfT8b
 sFnIKYEC7N3z+P3IW+tkbl0k93lNepk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030102

Shikra SoM cards include WCN3988 WiFi/Bluetooth chip, with supplies
provided by on-card PMICs. Enable both interfaces and provide the
required supply and calibration data.

Co-developed-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Signed-off-by: Yepuri Siddu <yepuri.siddu@oss.qualcomm.com>
Co-developed-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Signed-off-by: Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi | 74 +++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi | 82 ++++++++++++++++++++++++++++
 2 files changed, 156 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
index dc3861489f64..2fff5fe9f6d2 100644
--- a/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-cqm-som.dtsi
@@ -11,6 +11,10 @@
 #include "pm8005.dtsi"
 
 / {
+	aliases {
+		serial1 = &uart8;
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
@@ -27,6 +31,42 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	wcn3988-pmu {
+		compatible = "qcom,wcn3988-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&pm4125_l7>;
+		vddxo-supply = <&pm4125_l13>;
+		vddrf-supply = <&pm4125_l10>;
+		vddch0-supply = <&pm4125_l22>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &pm4125_gpios {
@@ -154,3 +194,37 @@ pm4125_l22: l22 {
 		};
 	};
 };
+
+&tlmm {
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio88";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3988-bt";
+		max-speed = <3200000>;
+
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm4125_l7>;
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "shikra";
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
index 73945bf42112..657a14ca9606 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-som.dtsi
@@ -10,6 +10,10 @@
 #include "pm8150.dtsi"
 
 / {
+	aliases {
+		serial1 = &uart8;
+	};
+
 	gpio-key {
 		compatible = "gpio-keys";
 		label = "gpio-keys";
@@ -26,6 +30,50 @@ key-volume-up {
 			linux,can-disable;
 		};
 	};
+
+	vreg_wcn_3p3: regulator-wcn-3p3 {
+		compatible = "regulator-fixed";
+		regulator-name = "wcn_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+	};
+
+	wcn3988-pmu {
+		compatible = "qcom,wcn3988-pmu";
+
+		pinctrl-0 = <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		swctrl-gpios = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+
+		vddio-supply = <&pm8150_s4>;
+		vddxo-supply = <&pm8150_l12>;
+		vddrf-supply = <&pm8150_l8>;
+		vddch0-supply = <&vreg_wcn_3p3>;
+
+		regulators {
+			vreg_pmu_io: ldo0 {
+				regulator-name = "vreg_pmu_io";
+			};
+
+			vreg_pmu_xo: ldo1 {
+				regulator-name = "vreg_pmu_xo";
+			};
+
+			vreg_pmu_rf: ldo2 {
+				regulator-name = "vreg_pmu_rf";
+			};
+
+			vreg_pmu_ch0: ldo3 {
+				regulator-name = "vreg_pmu_ch0";
+			};
+
+			vreg_pmu_ch1: ldo4 {
+				regulator-name = "vreg_pmu_ch1";
+			};
+		};
+	};
 };
 
 &pm8150_gpios {
@@ -168,3 +216,37 @@ pm8150_l18: l18 {
 		};
 	};
 };
+
+&tlmm {
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio88";
+		function = "gpio";
+		bias-pull-down;
+	};
+};
+
+&uart8 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3988-bt";
+		max-speed = <3200000>;
+
+		vddio-supply = <&vreg_pmu_io>;
+		vddxo-supply = <&vreg_pmu_xo>;
+		vddrf-supply = <&vreg_pmu_rf>;
+		vddch0-supply = <&vreg_pmu_ch0>;
+	};
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&pm8150_s4>;
+	vdd-1.8-xo-supply = <&vreg_pmu_xo>;
+	vdd-1.3-rfa-supply = <&vreg_pmu_rf>;
+	vdd-3.3-ch0-supply = <&vreg_pmu_ch0>;
+
+	qcom,calibration-variant = "Shikra_EVK";
+	firmware-name = "shikra";
+
+	status = "okay";
+};

-- 
2.34.1

