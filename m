Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5061F36F90A
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Aug 2026 03:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785726950; cv=none; b=IW43UqQhI1BH9NVZEpSaITojfEM4HIiOa9SfrUzC8ASl9GfE8Dt8jdtWpv/pLjWxx2eks3JU94AbMJ0eDqd0t0Ro3EfF7zRRCG3ICUsAtRrVJyKJMZpPfeveIML9hpXI/L9nE486+og2DBMeSaSmPTlDAiccOnnByjcme+JyJJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785726950; c=relaxed/simple;
	bh=VCGrUCv7IOkUq2MZxdjNlkV2FpeOYj3YUXeRs42czTs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GN4mxyNg9EA/2EBpmC4w40yHDT4B/oG4atxMIuwgvwzC6SLs6B/TSKZBqzIJN7HCXb5XoeJCwSkxBPOZLzdSDZVPauohuyZV6z8jm90u1lZ6trc1VfthP2EY/zb4htkHgPFGgKl4MsMi9+SjJFOuWVUI9VXO4hO7UB/BJOgYzMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iz/OQuO9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cYUO5/KH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iz/OQuO9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cYUO5/KH"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672LW2FM2210772
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Aug 2026 03:15:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uYWo7IWRIzy
	0S9p8K3Ch8+Id4p9MfiNkgtvi0y7Rir4=; b=Iz/OQuO9c5kKacIjMLXe2rISFig
	VOMIzS2mT0NkziT7njYUtHdV4Cp7oVjMr0ZJPvKJ6OFbfBUeEDuWll3mWNcDWWga
	mIv0TwBX6fhHEIfwWxky2RFyGvfBH+7cxmuNtqWncL0Oh+lu5m9+/HnhwJoyjfr/
	QI8LJfTy49izLz5K/uRIBWZfTgIUUmkLQjqgmhs7aDGxSEkC8YqyacyaDvFZKeMI
	nUtk8Zoylw/jnilICge131qIg96I1CDDAxYddxAORllNGToWgTTAWjt828G+/0V2
	QTWFqB0FhKxs2m+zHnzn6Z8sJ8JdsUM/kQd5s8QxeOZpyXQZKN2qqoLBtEQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ftdmx8mmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Aug 2026 03:15:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cee894b3d8so59393015ad.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 20:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785726946; x=1786331746; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uYWo7IWRIzy0S9p8K3Ch8+Id4p9MfiNkgtvi0y7Rir4=;
        b=cYUO5/KH0dewTP6RfuyS1R2FqK/lHlVd/KEt5atIS0Ib02HjvlxT7Wgn8c4xfYTRhS
         CC3912/9Rxa4jJQ11HwIfchtFir8aOfrixPnH8K5D0U7jitgJvRxbl+p53b8ESP6cRHF
         003QkT7uRLpc6dEQxuVnO/bKW/Qw/TIzX4lp9zc0NmrO2ul+2lXCiM/3RhLEyWPgHTwo
         SPAW+WfYwTbx4XSzunabMTQc7V+nDIX2Eayf6Tr/Xb7nDhl8kIIL9vm7l3iSx+u4vkyF
         39dYDVDrYt5URduqaBU//80B2QRX4yW4m+a6qFA5s83kU8uCSJy2Ai4L7lht1WpmOxiE
         WLrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785726946; x=1786331746;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uYWo7IWRIzy0S9p8K3Ch8+Id4p9MfiNkgtvi0y7Rir4=;
        b=HwewNcF3A6vPBlKqHvoq4B4YhHGOUbchaEIhSpNQyw7sX6J0RKCV5EjmnMPKXzQlIO
         r1L3BVakFnXHgKGkA6KIPD1lnAb5doCLUMT9YA+GLw4/GQxa4Xb9MmsklUdXsUXn9FBP
         MWKqgotBPzkb1oWX+JtYtc4CaTf0675aCopKx1Ex7dVFML9qYIGcNwYOb1tfMoXVRDhV
         rjT+hBP2REofIKRImTvTPm5eGLRwJLVr1j/HoX7mL9+Z3SzMVGYpow0o0T8HbsKKl9fS
         JBbgZgVGdn4GwPt8T1A/W+4WctE9MqaevuImDELMiWsGssYC1axS0jbAlaPpKkEEj0G1
         4p4g==
X-Gm-Message-State: AOJu0Yy/8sBJsSJ3q5EnFmG5JFVSixqoIfJkbQi6fTb1daLGKyFjIe78
	+KPEo/bPLe7JeMyoUzgMNS2Rr7o2j1uOrATHFJpV4rO/iLnaa51dD8kuCT1fxHaKeZVx8HhYK/B
	f1DiyH4NmUwuu6qN9iivk+Q89ZWJLttdGICtlHs3X6Jw0PqAJweAl07R0Q6k0y/Q1Mksb
X-Gm-Gg: AR+sD13YtoJrpJB8PSO8LKeANvFv3iUBbCGbaRpRMGAbb3HG44LS+YORrMXxlFrF5qn
	UgpGFgcODVuDRJXgCnpx7Doc+404bkkW+nT68PknKHAuReBFHTZCYJb5VpBSx167Cx1eQVkphBY
	litfcyntYCiSJ3f/9ad6gMtflSAFA0FrjbVYF0keq9upB1Q7B5PsllfZQeFqpNZoQXjb2y0Ayn6
	7Ig8LwQsAo1B/1YnT2Yn9sUFrMJfBKDFb5FIleCN3mB/xL3B7CCVA9eqcn+ail0IuNBWFh+Xxky
	PZZfm4oc2h1rRLYEpBbGNWD4g6+C9ADUdPVxHsEefOvNVqxFoRR2y2jhYsrilZujr5tgHxPBpwR
	6CGW6Rc1woVAtl2ipJq+QLPItg5IFZykQL0iJ5WFCuQfA8TaJ7kvzUw==
X-Received: by 2002:a17:903:350d:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d05219b9d8mr83778815ad.6.1785726946377;
        Sun, 02 Aug 2026 20:15:46 -0700 (PDT)
X-Received: by 2002:a17:903:350d:b0:2c9:ff29:3f91 with SMTP id d9443c01a7336-2d05219b9d8mr83778445ad.6.1785726945860;
        Sun, 02 Aug 2026 20:15:45 -0700 (PDT)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9c93dsm32585113eec.8.2026.08.02.20.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 20:15:45 -0700 (PDT)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Peter Chen <peter.chen@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 9/9] arm64: dts: qcom: Map USB connector to EUD on Kodiak boards
Date: Sun,  2 Aug 2026 20:15:34 -0700
Message-Id: <20260803031534.2942628-10-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
References: <20260803031534.2942628-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PA-qOSWgqa8DjeDSfYpTmj9cYYzEjcpP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX9GWjpyAFSk0A
 axS2dbe+0u3gJe1DiSLldaDUGNF9cs+sMFMBzcyCVqaUxiQ55ZxzJkYwao83JAhdqfHuzs9lPVN
 PIGkooWssY1eXN8QVvVGXKLVjWztW/DKDEbT9rnux2iQAkdUSH/k13pVMppo0Jmxo6/m/XvqyeB
 gh1odGwh+3PNt1fn3iCm1hIr+Gtu4b0SR3iHOHhyw72De7e3bvQjYEcPJ4GHr2X5Z3so7h+i7Qy
 Be+kIW3ir2+ZfvtOgqvisk4JxtGg6j8nAd9mEBRFgXgRZANuInfAgs2OzFXx7dPu+Dl3bNRsuVq
 ZG371crcAHJ/Ii3JbHyJxNscMhNHa68T9UViUpwITD/ZLA+YEAD3OqM0T7UMi8ovxc5Btozo3/V
 GSHLAa7F7ovRcqjH/EuL9wYPMGgDxUxfaiHhg/NrWJ2PngltVOIBwFyKc+agrl60XIjiHdcF5N5
 N1eyLErg4GN/rxXHtIA==
X-Proofpoint-ORIG-GUID: PA-qOSWgqa8DjeDSfYpTmj9cYYzEjcpP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAzMDAyNCBTYWx0ZWRfX6KFKjJB+/ylQ
 c4fRL/2BqSbUaYqdEMaH9YEyD/zmS0VBrt0wEg/GoMdVTlIFhNYyZXaNE6+UnaHT44Na/iVwWy8
 MMNFdklpyH+cFubdhFCyVPQSsdGnNSM=
X-Authority-Analysis: v=2.4 cv=L7MtheT8 c=1 sm=1 tr=0 ts=6a7007e3 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2A7QdZd8yE5LlEUtRoYA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608030024

On Kodiak-based boards, the primary USB connector is connected through
the EUD on the High-Speed path. Update the board-level descriptions to
map the USB connector endpoint to EUD, reflecting the intended hardware
topology.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts     | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts  | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts       | 10 +++++-----
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts           | 10 +++++-----
 .../boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts |  4 ++--
 .../boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 10 +++++-----
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts     |  4 ++--
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts   | 10 +++++-----
 8 files changed, 34 insertions(+), 34 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..c213e06a4428 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1478,10 +1478,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -1521,3 +1517,7 @@ &wifi {
 	qcom,calibration-variant = "Fairphone_5";
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..e9c0463daa53 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -74,7 +74,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -826,10 +826,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -862,3 +858,7 @@ &usb_2_hsphy {
 &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 797f37596bf1..650c4fbc1606 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -84,7 +84,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -952,10 +952,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c>;
 	vdda18-supply = <&vreg_l1c>;
@@ -986,6 +982,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &venus {
 	firmware-name = "qcom/qcm6490/SHIFT/otter/venus.mbn";
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 37a3b51323ce..514d6d7fedb5 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -211,7 +211,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1402,14 +1402,14 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_dwc3_ss {
 	remote-endpoint = <&usb_dp_qmpphy_usb_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..1d992dcc89ed 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -77,7 +77,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1046,7 +1046,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..387c38aa87d2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -93,7 +93,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1090,10 +1090,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vreg_l10c_0p88>;
 	vdda33-supply = <&vreg_l2b_3p072>;
@@ -1127,6 +1123,10 @@ &usb_dp_qmpphy_out {
 	remote-endpoint = <&pmic_glink_ss_in>;
 };
 
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
+
 &ufs_mem_hc {
 	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
 	vcc-supply = <&vreg_l7b_2p952>;
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
index 3c836e196b19..99913ba41d55 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
@@ -98,7 +98,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1431,7 +1431,7 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
+&eud_con {
 	remote-endpoint = <&pmic_glink_hs_in>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index cb59c122f6f6..a2e160f3f46e 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -99,7 +99,7 @@ port@0 {
 					reg = <0>;
 
 					pmic_glink_hs_in: endpoint {
-						remote-endpoint = <&usb_1_dwc3_hs>;
+						remote-endpoint = <&eud_con>;
 					};
 				};
 
@@ -1440,10 +1440,6 @@ &usb_1 {
 	status = "okay";
 };
 
-&usb_1_dwc3_hs {
-	remote-endpoint = <&pmic_glink_hs_in>;
-};
-
 &usb_1_hsphy {
 	vdda-pll-supply = <&vdd_a_usbhs_core>;
 	vdda18-supply = <&vdd_a_usbhs_1p8>;
@@ -1459,3 +1455,7 @@ &venus {
 &wifi {
 	status = "okay";
 };
+
+&eud_con {
+	remote-endpoint = <&pmic_glink_hs_in>;
+};
-- 
2.34.1

