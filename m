Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101DD40B0FE
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 13:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785763682; cv=none; b=tCh8MLBVxiKX3JWhaP6FNhh2QfJT5fDl93uaun6ntDnJme9FsKnR8qBJbkTQKo7iX65hZkT06Xf1BH8x//tJTkNv0FC9PNJyzQuX76w6BI4LCxtppRwFztltAb5cU9o8qDOeN8s8n0fXn4Y3COZQTwPQX3E7r6ACW+RtO7H69H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785763682; c=relaxed/simple;
	bh=yCBoC7BHVElBvtf50HxFBrlW0nr9DDZpIz6Dih/OBHc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Gohj9JTT/wdmlKc1s0HNqTcWdbh2orX5sgYYKLDwJB0Fxw7T9e0lLiXeTeJvh1Ys8Jyp3DbD/OwAlgrAD1XorjzRAoZ4Wh0viSl0yMo/i81ofmka1i5A35XCM2UC6uOyNCOHnT31DgF1pIQxE9zkCia2OSV0MN8H73TU00rjtDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A94e8Ccr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AiN2x77q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A94e8Ccr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AiN2x77q"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 673DRWjn1910691
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 13:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Xf1cd4ocud1VtJ89eIHqhsx/lFHjRi+JfKS
	LseOT2qc=; b=A94e8CcrWd7TAlkwi/3AZjQn0PCzC48dZXADOwO00kGx15BXYhk
	elHzizgs2qhL+iksK/6reuVN5GHSOW0kIpkPHujl0txMz7iPr9kSzpomPlQqba6R
	DvCizW7vx4a72YFBIb2tBwgGDwNg9uqhks8fKXGMv89XEspkVjs2TVmebkGu94gB
	2yXVF8Pw7Vdc1pOdi1SdFCppZjqEod6L0NDRoc3RV4FneVuvCOhOLGI4vZ9rM8uc
	63D6G8GR8LfhnTuavjsqXDTTDxKicaX9q95LzdTY70T2a+9BYCjivdOAQ2Pdr8q8
	o8Yd4cA8eFBeXxKs5CKjTpfnHy79tMXw/4Q==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ft9fakcbh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 13:27:57 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so4341713a12.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 06:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785763676; x=1786368476; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xf1cd4ocud1VtJ89eIHqhsx/lFHjRi+JfKSLseOT2qc=;
        b=AiN2x77qbbx4AGPxNCXC05lvZnf/pzzMKDfkmb1BfeBursrr6KdecUBPy1KlNRNByB
         OufbR4r2VYfU4v5s8PdVPQ/nii4dsH8ylpiIV5VYbEyYoEl3b3nnRgJ/5S6Ptj/MC4Ey
         FlHRy4jluv3LbjCE1HcyHnQkgy1VmQArSTlEChhgeIiWiybbj0S8zjVt0w/g2WMHuo95
         FaxNSUfFPZ8r7SN2utCPyS/kZzarbr0DA4W80naVsJ8XqcentR7Ro0MMsG5FCMTXkVtM
         Xb9i50D1Cj+wt1XP6bR+/dP3W6NBzGXSkLN84GXXpGWTA28enx2U2iza5f54KtUVefU0
         hxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785763676; x=1786368476;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xf1cd4ocud1VtJ89eIHqhsx/lFHjRi+JfKSLseOT2qc=;
        b=awcyvb9K1grPbO1VqT+j0VsrKEj5AFg9s4+lJgCY1z3udc/5KVYvsACWNO5agvCX0S
         5JY68qCeI7KWLuN7eTh2tp+9bgk40ufgnzlt7RNwgF/T6G4NY2qTitCUNBWk4pJhDB1v
         O0VGHK4BYKPeo17/HqEbzoPVI/AFrm1yswTgPgqmEq1EZs8tMD/jodTc6ImdDRkTXkao
         8U6L5R2U02qCNIGKl97E7tQg0qrRTwTs4R0jl22dmsPXe2ioRUTidu+Cm7J5AogJdgYj
         flbVT/8fgUFgPhvR2HrxTr1SnnA865KQcykRUL9HCLN4OZ6plirCH4hyXvM+YsQ4NtNa
         o6qg==
X-Gm-Message-State: AOJu0Yz6cU9W6dzBbn8hL0dwHy1yIicMsEc2PyRIQtw0AAs/AXryBU89
	AS5N+GbwB5KN77DsGHaxCOye6Qn9T6OM0L1Y5kgTrGoSfjgTdWrMLz6G62P6j7SUSuXT4cC4knr
	PneKyMxq0h+S/lzk0Xhfqd+oKlepi+2ydHzAkY8/y/NlvoKHZlglb7YThXp67QMmy8ZW0
X-Gm-Gg: AR+sD13KTqSwzCUwCu5A4FvEoExAMt91cLrFFeO0EFvAjc/udWvs9SShWZFXKBw5eKl
	Pzrrhdz8l5HvzzitONSgBsEooymT/bOW3GgmqyJQPw5zZEfU+S0031ie34iHpVPJXziuECB4vQi
	++mZoDMPrhErsgsxq6Pn0nMBX4Z82axCJyhudcDH4WkuRinr83oHo0OE101/qgkU/j5RnmPECF1
	s9DBdJj0od8rHW74/9ThFgk8y8DA2uEapoVPaNfUp/eYJwKJtRo17fZbXIR9wGEFwbTpeWRdsgp
	T1xRVeHo5hxk6DouR/5caIKp1JrgjLzJYtTERXlYB6pkpxVrgby0fbw+r4ZWDQe8oYZBBgKmR2Y
	rn7fOHtkYwoGhR7eyCdhX+OFFmAfoImf8ssGQh/04u0Heyg==
X-Received: by 2002:a05:6a21:9985:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3c92a517628mr9857784637.2.1785763676381;
        Mon, 03 Aug 2026 06:27:56 -0700 (PDT)
X-Received: by 2002:a05:6a21:9985:b0:3c4:46ca:3347 with SMTP id adf61e73a8af0-3c92a517628mr9857760637.2.1785763675948;
        Mon, 03 Aug 2026 06:27:55 -0700 (PDT)
Received: from hu-liuxin-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab050d8csm51766483c88.0.2026.08.03.06.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 06:27:55 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH v2] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830 retimer
Date: Mon,  3 Aug 2026 06:27:47 -0700
Message-ID: <20260803132753.994619-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=PZPPQChd c=1 sm=1 tr=0 ts=6a70975d cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8LwbUeallTqhS2w2LGoA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: 2LnOrIKQSCUYJQc5dfkflKp1YK89lAf1
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDEyMSBTYWx0ZWRfXzvvCrVSmDy53
 4A+kLOtFzoTgg9dZXBQK/Tt9Zuf69GD8okIYZuLEfGLWJOYr0TME/SQCh5Mu2bPncAXaum+E/d0
 ggCZyE25QHzHv0VBAef/lSBMNcY/yns=
X-Proofpoint-ORIG-GUID: 2LnOrIKQSCUYJQc5dfkflKp1YK89lAf1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDEyMSBTYWx0ZWRfX1a42hMsWAGTA
 v8CQFg3ONsWjUvhnsg8EXj/nPxwVhh30gvZKtS++N9Jom7by12lp3vEESsu/nxYqFL/7XSADrIp
 tFGAjoHDfp+pzLWLaK19IWuaXEL5FU9oF6I8g6w2yP3906cNznydvTjV466IXl7adJ8OhvY9P4E
 KlRZpeE827zNtfvm5IfKAuBe3eZX2wk1m8lkIJtxOwa7MNxUZP9qqMNJ8+c8vgYyGW/3oiOjHmE
 9/rfPj/AjHWDul+9xfGeNJnOC9ZTHmIRQGYDGRJvnpBCkds42dwVtsFJZ+xWj9WGl1Cvct3dkt1
 PDpgCkzZNnkxsQ0IvunHFF5UGEskULI7VSKyQVOkVmCTZKXgF7Mu7b9/XYITUPn9TeTuHyE3VQZ
 jRsmO+6Ag1b6bR4jMtHYrIDZmX0R7xlWP+etOoUKZ3UUr5kpsvMjWjLLzDp80ufzZy4RDnn8hWi
 UjsNcZmuXym3xfD6PhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-03_03,2026-08-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 adultscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608030121

The Hamoa IoT EVK hardware design uses a Parade PS8830 retimer on
I2C3 for USB Type-C port 0. Describe the retimer and route typec0
through it to enable USB 3.0 SuperSpeed and DisplayPort Alt Mode.

Supply the PS8830 from the existing vreg_rtmr0_* rails and remove
their stale "Left unused" annotation.

The FSUSB42 SBU mux chip is present on the PCB but with all signal
lines unconnected (NC), so remove the fsusb42 node and its pinctrl
group.

Tested on the Hamoa IoT EVK:

USB 3.0 SuperSpeed at 5 Gbps on typec0
DisplayPort Alt Mode on typec0

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
Changes in v2:
 - Clarify that FSUSB42 is present on PCB but with all signal lines
   unconnected (NC), rather than "won't be populated"
 - Add test results (USB 3.0 SuperSpeed and DisplayPort Alt Mode on typec0)

Link: https://lore.kernel.org/all/20260721074145.1534100-1-xin.liu@oss.qualcomm.com/

 arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 108 ++++++++++++---------
 1 file changed, 60 insertions(+), 48 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
index 9fa86bb6438e..a3ca22f9c3e8 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
@@ -126,15 +126,15 @@ port@1 {
 					reg = <1>;
 
 					pmic_glink_ss0_ss_in: endpoint {
-						remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+						remote-endpoint = <&retimer_ss0_ss_out>;
 					};
 				};
 
 				port@2 {
 					reg = <2>;
 
-					pmic_glink_ss0_sbu: endpoint {
-						remote-endpoint = <&usb_1_ss0_sbu_mux>;
+					pmic_glink_ss0_con_sbu_in: endpoint {
+						remote-endpoint = <&retimer_ss0_con_sbu_out>;
 					};
 				};
 			};
@@ -303,7 +303,6 @@ vreg_pcie_3v3_aux: regulator-pcie-3v3-aux {
 		pinctrl-names = "default";
 	};
 
-	/* Left unused as the retimer is not used on this board. */
 	vreg_rtmr0_1p15: regulator-rtmr0-1p15 {
 		compatible = "regulator-fixed";
 
@@ -658,25 +657,6 @@ platform {
 		};
 	};
 
-	usb-1-ss0-sbu-mux {
-		compatible = "onnn,fsusb42", "gpio-sbu-mux";
-
-		enable-gpios = <&tlmm 168 GPIO_ACTIVE_LOW>;
-		select-gpios = <&tlmm 167 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&usb_1_ss0_sbu_default>;
-		pinctrl-names = "default";
-
-		mode-switch;
-		orientation-switch;
-
-		port {
-			usb_1_ss0_sbu_mux: endpoint {
-				remote-endpoint = <&pmic_glink_ss0_sbu>;
-			};
-		};
-	};
-
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -793,6 +773,62 @@ retimer_ss2_con_sbu_out: endpoint {
 	};
 };
 
+&i2c3 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	typec-mux@8 {
+		compatible = "parade,ps8830";
+		reg = <0x08>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK4>;
+
+		vdd-supply = <&vreg_rtmr0_1p15>;
+		vdd33-supply = <&vreg_rtmr0_3p3>;
+		vdd33-cap-supply = <&vreg_rtmr0_3p3>;
+		vddar-supply = <&vreg_rtmr0_1p15>;
+		vddat-supply = <&vreg_rtmr0_1p15>;
+		vddio-supply = <&vreg_rtmr0_1p8>;
+
+		reset-gpios = <&pm8550_gpios 10 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&rtmr0_default>;
+		pinctrl-names = "default";
+
+		orientation-switch;
+		retimer-switch;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				retimer_ss0_ss_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_ss_in>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				retimer_ss0_ss_in: endpoint {
+					remote-endpoint = <&usb_1_ss0_qmpphy_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				retimer_ss0_con_sbu_out: endpoint {
+					remote-endpoint = <&pmic_glink_ss0_con_sbu_in>;
+				};
+			};
+		};
+	};
+};
+
 &i2c5 {
 	clock-frequency = <400000>;
 
@@ -1458,30 +1494,6 @@ usb2_pwr_3p3_reg_en: usb2-pwr-3p3-reg-en-state {
 		bias-disable;
 	};
 
-	usb_1_ss0_sbu_default: usb-1-ss0-sbu-state {
-		mode-pins {
-			pins = "gpio166";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-			output-high;
-		};
-
-		oe-n-pins {
-			pins = "gpio168";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-		};
-
-		sel-pins {
-			pins = "gpio167";
-			function = "gpio";
-			bias-disable;
-			drive-strength = <2>;
-		};
-	};
-
 	wcd_default: wcd-reset-n-active-state {
 		pins = "gpio191";
 		function = "gpio";
@@ -1578,7 +1590,7 @@ &usb_1_ss0_hsphy {
 };
 
 &usb_1_ss0_qmpphy_out {
-	remote-endpoint = <&pmic_glink_ss0_ss_in>;
+	remote-endpoint = <&retimer_ss0_ss_in>;
 };
 
 &usb_1_ss1_dwc3_hs {
-- 
2.43.0

