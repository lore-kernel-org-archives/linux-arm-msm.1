Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D2B942EEB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619719; cv=none; b=hA2Vr/zgaU6l0N55HsQdZksKLE7wzymyp71vHaMdnB1wSwfH4PSNw4w5PNBitxMWhQ4mRctqU1MVsaibjBTYopJKcxYCjtNdpSmshOXGWASk0ceH4Z1FW3unuxwR75RvJa6usuug1CGKF7EVV6ArSsx4Vsh8KrM4NHuge5+R1Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619719; c=relaxed/simple;
	bh=dqVCKovlPVMOUQrRAIE3fQUegn/9eZb8fKXu+uKd09A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T0bnbqbLiq3nDOAxtWvRWSjddygpA+28rlqpZVFupnmgXuG/8qocyiOcvRusqFMkPa7VZhkB/R+43fn0IUhb0LqXMNawZvo+++FXvI7+7zqVNbBVLui7KLH1VUAmLuqlhcQo4OQRxf4vwlhT9B/XxyVBlFHY3f3NR2J8hYVspA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J1C0fXtn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WL1p9eyj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J1C0fXtn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WL1p9eyj"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L6VUgH3884869
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:41:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=FqyT9hkYh9BseSUnO8JBPpnLnAOEaESZBM0
	FsbmDf+M=; b=J1C0fXtne26IsSkhahkVreyTAaKUjyYSaUcVuetcFJjZSxteqxJ
	RxieMN1gNz4x2Vu0idez+G6sBNx0H+4qCVSmrHlOQd/Dki++YXZIaKK+dDZ2PMbC
	icRvj8B85GatbgL16FCQ5MgX/c0/u651HovrhUPeIEjKaWpJLTCqzBgt4g0ACHkP
	PuC13uoumKdGEUouWBMYZaysgGGSG6uXIvJcv49ks+vS9DIX4hYojw18S0fQFfzw
	10iPfUkSFE95e7U9YhMwQAroYKGpbtKSy5/eq17Vsz+ecu5pQm65T6FmBkTHCXPb
	9bVMgmsTYvD0eiOOLhkDMVkRdkXK96MJz6g==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhqvcb1y7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 07:41:57 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84240683a82so4474920b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 00:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784619716; x=1785224516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FqyT9hkYh9BseSUnO8JBPpnLnAOEaESZBM0FsbmDf+M=;
        b=WL1p9eyjMo51Bf449B38kykvqRMC9PpU7n9NdUu1Lo0q4eF4yYuJrA3IJ2pwBXTLv7
         XrEQi3fEyzR1Sdm3OmgXnowIDZiXD1b3N+C5RVDQQ5ROwmcOxW+v5i1U9uQWVk1zQ2JL
         xGXw8PraK7RAidrcFg0pKEXKtkgweZFKgf0GLWtEzLXkCIHoL4HIzSxrebOIIj3lHOg4
         A2TXDCQsWMb6gW+ZsvDxMIpxnSrRABH1alJgo+Rd/v3jHpiEbxjbgZGLa5zWbv2NVzLT
         IETY+c5nJ2IhX+gkoQyOLImIwZOPrA/tDb8KjMSLvCfjTkqio5M8A1GgjrTVQWvJ1xW2
         nR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784619716; x=1785224516;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FqyT9hkYh9BseSUnO8JBPpnLnAOEaESZBM0FsbmDf+M=;
        b=XLB6uiRkKL/d73hhE+KI5dKa1QZ0pjUPJgWk1Tc9FaPMVF+kn9d3iInwxSPNFkfN1p
         yb/tzC6n8f29kkzWT1gag6d29Yg95w2gLboNnZmVQa0G82C1pRwYUSdipb2GSX22kycV
         4nOjqSjcBAW2koTVULqw2vUUq6lQAsBzX7WWlsjKTQ30vLcqYLa5zJjHFaZ1lC1UHenK
         vPFXaoFmNhPQwtqDnI48r29gPnfZpvcDAump//8HxRrohV4tVXjZoXfKKgpqj2u4HrXD
         j+iTEIFwH0jGlc05kIzddXV88e76rp08ZxqtEQ4y/20EtnMaPohrAl7IwIImMAkHREzc
         pZNQ==
X-Gm-Message-State: AOJu0Yx27R/lTP+MzS5BDosiAZyQqizpqQ3r0Bk4bRmSOYrlQIXt/OT4
	68znHKslg+EFEZ21R8Cu7BuDf3ZaPPrK27Z0ktIrSJTc68fDOfd9Iu2ccLMoVqfsn0wX4+3Ikbd
	TAabyRRPD+5I/qhnR6+iz+X3UCGJDxCSp3GCXz9fm53N4KtxTS2urMkiMG//te1rm7wKM
X-Gm-Gg: AR+sD13dJrkgeaB4i956E1BQfLAKN+f4/+T4dEGKZ4ULs76UiwipTAOIS+tSSwzBDMN
	17DYHM/9I7I837pLF+ai+e5d2DfhVLMMeJkrwf5Nngbr7uy+fTS5SARhJqp7ErUUwtlMhRSsc53
	nYSouD7gR43/iPl9f+q4fwisvq8lDzB/NNINMZDV9+X2bsa+Bu7Is+ArXw9UxRodoEZoHhLEMhQ
	cMSmM4gJJCL9Yi3bZgZiAc7JruQC/qxD1pf/ksMvJ+wYL+bwQho+IlFJECEgfwVApYt6nz8KLiM
	W447KL1ztG/TwYShY0P5kuc+wIksk+p2ALhDSYLlZmGTEE1k5+mIx/PUVSEbmoZeMxCdFW7N4In
	7HwGV63wktLARt/EHFuRd
X-Received: by 2002:a05:6a00:28c5:b0:847:9d6c:a56d with SMTP id d2e1a72fcca58-84c2858e4c5mr16254184b3a.12.1784619716092;
        Tue, 21 Jul 2026 00:41:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:28c5:b0:847:9d6c:a56d with SMTP id d2e1a72fcca58-84c2858e4c5mr16254153b3a.12.1784619715654;
        Tue, 21 Jul 2026 00:41:55 -0700 (PDT)
Received: from cse-cd02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e3f6sm6933380b3a.44.2026.07.21.00.41.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 00:41:55 -0700 (PDT)
From: Xin Liu <xin.liu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, xin.liu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, jie.gan@oss.qualcomm.com,
        Guodong Xu <guodong.xu@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: hamoa-iot-evk: switch typec0 to PS8830 retimer
Date: Tue, 21 Jul 2026 15:41:33 +0800
Message-ID: <20260721074145.1534100-1-xin.liu@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA3OSBTYWx0ZWRfX8SNyKWlwIV3r
 WZe4Rzewuwr+VQ8uz1rUB+lJFqXr9S0efkD0lrjV9kRI+zcx8lo9ZTnT0q6fE6pFL+czDn5lPny
 JQ5OXVeqbGwItMvuv+24JUuaZp7BuT0=
X-Proofpoint-GUID: hsQzW13vburw0viN1p4pohLi2Osp3qey
X-Authority-Analysis: v=2.4 cv=OMYXGyaB c=1 sm=1 tr=0 ts=6a5f22c5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=ADNupvSaaZfLlJLRRLQA:9 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: hsQzW13vburw0viN1p4pohLi2Osp3qey
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA3OSBTYWx0ZWRfX9wgSTbzUmkyJ
 EfEtDoinzPSvKEC2euTncSBRANniOJVd6Cphl78s4rDnC66C0W36gBJb1khx5Ik2nWKWrfm+Qfw
 FnZSTqDZSw/XpL2mYVeRpL30VQ8rDUQ62fZ6cN2MUoHv4Mh/i5gmzluDDOwP+Zzhjmg7bVm7fvW
 6SWXlqXc52ahLat07lXzHTFgeKNhigjfXMMgHY8bE6ia/Bfm4R0uy9/QWtbIxfvnX4vEKooLKeJ
 YrMksMkbYkf1zv3GV4GUpS1G/e33kYq3+7lb4Rk06ZQLTZ+eTxvRf5PTH+ZH727MNe3ztsdkwGp
 06zTV2LY0DZV0iGhkpTFlvbV4aFjdK5zttEDEa49bM3sNJVVFYJvjj1hsQNi0Ff69XoHdB6UAjO
 lrbmsf3864eXh4yxAtqVfmjCYnI4lG6oT0lpWnJabxwUMsv2Fwe/2jfJfby3x0SJ9XTCUAog8kw
 IYqV/IsMvc/u2fneA3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 bulkscore=0 malwarescore=0 clxscore=1011 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210079

The Hamoa IoT EVK populates a Parade PS8830 retimer on I2C3 for the
TypeC 0 port to support USB3.0 and SBU muxing. Describe the PS8830 and
route typec0 through it.

The vreg_rtmr0_* rails provisioned for a retimer were already defined
but previously wired to nowhere. They are now consumed by the PS8830,
so drop the "Left unused" comment.

The FSUSB42 SBU mux chip won't be populated on the final EVK
board, so remove the fsusb42 node and its pinctrl group.

Signed-off-by: Guodong Xu <guodong.xu@oss.qualcomm.com>
Signed-off-by: Xin Liu <xin.liu@oss.qualcomm.com>
---
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

