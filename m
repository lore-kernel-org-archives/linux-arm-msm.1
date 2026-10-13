Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059A40A929
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886638; cv=none; b=OeT2m15jXgsWhgmyPSWqowVeDOR6T7xpkfCxsWUCxEB3Et3fKu9afKt8lmQ4G1KoF4fnm8oti7Dae8X7/9MoODcK4oMBRj+Rxx+Y4ZhcJC0UYcG6e1dzrcONH0wCVN0Tf9dK4peikZrUMlsy1F1/M91431vq+2TlpuZhNCRp/Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886638; c=relaxed/simple;
	bh=Nc/7L25ppw473cMZLDfSHTkAdQ61YYv4xbHO2l7mNJU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FhU3NhqeOWVb3rSpAivSL6SHWTX++zcyQgt3ii0iDi5hKY2bFXimFVRfSz62nZjuZZkOQ801zcgP78tKj/22o6txze0hQEcDTsr6+UWKZslFCWE3en6lMGMQORc6mzVg2H5YVTGrTaiv11TtGabERW8nEwrYM4Udo1hJ9mafrUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fKnf5Pyz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFZcBgfI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fKnf5Pyz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FFZcBgfI"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6YrP03208361
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0Oz2dYBmsXZrEzu3Z+NF+l80IiagmDpRDshu2vMAG6U=; b=fKnf5PyzQIitLqHk
	/w4QuRiSVo6GKqod1N2AuvuOF5L6nDflGy8lY/xk4rORieCQfGa6Zm95fsEbzCug
	x7cqrv3m/XrM4C7nvaaJ4k/Io9VL4tidR67oGxA3n/Ey5TzJBBqntThflDd4e7vy
	EwRnw3RfyjhwWft5GBqfPoxL7ca7WPpQCkXieoLXV1cTb9WE6vbqf/VW8G3vFnDR
	tnEUCM/UeA7DQIlsGk2EySEMzHpY0KLAAwvbuH+W4dLgdFzErtl/lgiNAmPRL4nI
	egULl3PhrcnUHBTK8xTL3USlXFCmq+JfOHehffxKs0deRdszkyxFFIadIfcvujZO
	+pD4XQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjgwnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 10:17:15 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cd0b795aa8cso2884120a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 03:17:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886635; x=1792491435; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Oz2dYBmsXZrEzu3Z+NF+l80IiagmDpRDshu2vMAG6U=;
        b=FFZcBgfIZ1mU05f3kXDGzaNq1B0+NceTnUsJiObwEjwt5lWFP0+3ygwxZiXk6+akAE
         cInWfcUi2JQ0zempHpVje9b1khdU/QoqznVegZ1LTBVBp+P6udPJ9lIuUnbUG5h32u1N
         BLU2NCSfJl69kP+KIkrfDHVVVf7jVh8+T4kyw3yvrlO8tBw2fXAMBe8SFcqgFsnHnI4p
         SpNQrxknZU48HC4ZtztXzwt38PCldfsRccJB3g5MNksPT1f4UNCbnAvjFUAILQni5h8A
         /rGOlC5HepC0Rl8dUrpin0o6J9Y9pw6T3mHgPiehS6VS6Xt+3R7xfzuvlIF6SPQIZUBH
         vL2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886635; x=1792491435;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Oz2dYBmsXZrEzu3Z+NF+l80IiagmDpRDshu2vMAG6U=;
        b=l3rHKjk0lXQtM1B2gY3/JNDxpPxZtoG0rHCS4vATAEleGxTDkpWnJcATMjNehvF9QV
         3fQMqzOcpG2unGz19wdO6J5Blm789PIEOEUcjU1kuJWgPFNz6Ej359Pi29tfzsMglgIa
         pQCzErSbOwTHiusYLExybF9a4GqarNy2lhnGMM44indjx+0+vs1hgWNnEs3euXJ5JPlp
         +dSsItCVxc/ElZ3EfEe1m03pLqnFoMHkOSUivoXZoBlYryLoCUunj+4S4G7EPmYVK/wu
         DHUaWj+fO1n0VGVqmD1cDgeYt5bL0x1+L8P64GTCNjk/G+RRPO/Fu2fnMFJztWl7NUCt
         OKKg==
X-Gm-Message-State: AFq9FYLFUqfviyqbdi91kfzvYLCgByoYeCLgQSTSBx4Nt4+1H9Ekmqa2
	EkVOBr8qvFDL2njZu/NHnsUDiF4pDnKTZwf0nXJbCcubiAvNvH7Dg3LgKmQSddBckuMlEg7aIMQ
	d854We1cuNv6s+ktIlCNoCUY01ceDpA8vJVvysE/tzcsILegIQWgHB5to1yKRekcj3mOnoOjGte
	Vs
X-Gm-Gg: AYBFou0jicSr2s2KDAyX4br0vj1qN1X3F6x0ul7DwdlmPMGZKxdC+eJdGtwF+aarxRW
	CcEI0ErgEsXW+yAp3vwGiOa8AW3pyeMjiU3IQhbAsNbwB7y0zbCM5ZiOK9YQZaWgWDFGxWOzIwO
	z3t9Awo7lCvKbj2RVjthbeeLsV/z/mINuRsoU9SqsBuV5DoAlazlq3qzuWP1iTuGVw4WMZkJ0QA
	yWlrl7MWeW4VRLiYdjreyr98eny5ALfTlyY+Jj/gnrL5V5JmqcrvjOxaYggyAp6RfIK9sgwBoKt
	eHPlYJ667RAddoRgNr7qPL7Z6sVXQicIx49cO1J7tJMtNb4chPBvVtbe74xmesTyvaS+WIToFpy
	RJemQxnsrMnEIWD9ZOaq+2NQyLL/IE60LaADMK+m1pF0jPOU=
X-Received: by 2002:a05:6300:8811:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3e16baa4b6cmr6890585637.1.1791886634929;
        Tue, 13 Oct 2026 03:17:14 -0700 (PDT)
X-Received: by 2002:a05:6300:8811:b0:3de:71c4:a22b with SMTP id adf61e73a8af0-3e16baa4b6cmr6890566637.1.1791886634372;
        Tue, 13 Oct 2026 03:17:14 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd5dadd0986sm4186777a12.18.2026.10.13.03.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 03:17:13 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 03:16:47 -0700
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add refgen supplies for PCIe PHY
 on Glymur and Mahua boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-phy_refgen_1012-v3-3-f28305289499@oss.qualcomm.com>
References: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
In-Reply-To: <20261013-phy_refgen_1012-v3-0-f28305289499@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791886628; l=7612;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=Nc/7L25ppw473cMZLDfSHTkAdQ61YYv4xbHO2l7mNJU=;
 b=UIBsEVC0DuFMJuHxAN8ATaQoJ1+XYaeksu+ymMRI3qcSULz22rHRgH+2Lar8Xrkq7AzAhoLwO
 cl7TgMxFys0D+6dNqBZuPRitAeXxybEyY+QB9ItflUR5ctXd64ikh4p
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-GUID: 9m9ejEN-hjhKh0dRa-PlYvaZARfEHzqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX5ADpMQVYroW/
 eVMcPadaYieAlib/UQtolsbW+UL9fzDB+fUKCHmCr1JvAQQ+H1L3riurslw+SM2Icbw7Rcc9sbO
 vkjN7htmmrhjST6ffAFWNA7hGy7MQVrUGiyWsgdHMA45T4w7aW97ghilkXIm6kevebgJWWmL6vB
 7QIaSQb818iCabVk+1c+4vOCNeTehDYZqg3+4T11gKf9fTl+exj/xdd376LFYVohz6GutzOtGV4
 HLOTtfRi3S6XZ0oMmKxEvf1NaY14zGJjuWiiUZtl8XLnAEg9qSYtfApkTutrDnx6HjQpWoRyuWg
 MAKqPWqS8OW3Wyt0eOjTKtzfLrgxEjsMJottJunRWrskxD1MFc5f05lGYOhI+1ob+T9ObUgBor4
 HtPLFG2WKSLiC4WwXlKN0KYAgQ0ADRcZLuAY4ak2ztKDHYDgdP6DMsyvbWqlNM8TAi6pGEknUjN
 UmZhgoXYqZgCAXPhrKQ==
X-Proofpoint-ORIG-GUID: 9m9ejEN-hjhKh0dRa-PlYvaZARfEHzqY
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace052c cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=hooUR3UheFJlRPkIXLkA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX1xETmrdxKywy
 wQ+ugLvt3SRntbRLv63mVy+fXl7/AzrI74TPr3ZwKRisA4s4dMQvrjhpVQsM9fGFflRqIir7TWw
 nhFoXtWXFy01FluX9lUdAEmoXQZInTA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040

The PCIe PHYs on Glymur and Mahua require a reference voltage provided by
REFGEN, which in turn is powered by two LDOs.

Since there is no devicetree node for REFGEN, add the vdda-refgen0p9 and
vdda-refgen1p2 supplies for each PCIe PHY node.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts    | 2 ++
 arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts    | 4 ++++
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi                         | 6 ++++++
 arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts           | 4 ++++
 arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts           | 6 ++++++
 arch/arm64/boot/dts/qcom/glymur-qcb.dts                          | 6 ++++++
 arch/arm64/boot/dts/qcom/mahua-crd.dts                           | 2 ++
 arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts | 6 ++++++
 8 files changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
index e96e65a0c5b4..d1746845a609 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a14-ux3407na.dts
@@ -735,6 +735,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c1>;
 	vdda-pll-supply = <&vreg_l4f1>;
+	vdda-refgen0p9-supply = <&vreg_l1c1>;
+	vdda-refgen1p2-supply = <&vreg_l4f1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index 95da35125d75..bf3c828c8a0b 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -818,6 +818,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
@@ -843,6 +845,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0>;
 	vdda-pll-supply = <&vreg_l4c_e0>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0>;
+	vdda-refgen1p2-supply = <&vreg_l4c_e0>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe29..b3f876956e7e 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -764,6 +764,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
@@ -800,6 +802,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -821,6 +825,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
index 096d40e49210..7f79470ec004 100644
--- a/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-hp-elitebook-x-g2q.dts
@@ -545,6 +545,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p91>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p91>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };
@@ -581,6 +583,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p94>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
index 769f195c99d9..130946ba9785 100644
--- a/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-lenovo-yoga-slim7x.dts
@@ -743,6 +743,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
@@ -779,6 +781,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0>;
 	vdda-pll-supply = <&vreg_l4h_e0>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0>;
 
 	status = "okay";
 };
@@ -800,6 +804,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1>;
 	vdda-pll-supply = <&vreg_l4f_e1>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/glymur-qcb.dts b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
index 17d8ff3aed23..f26bdc1cd84a 100644
--- a/arch/arm64/boot/dts/qcom/glymur-qcb.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-qcb.dts
@@ -448,6 +448,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
@@ -484,6 +486,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p82>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -505,6 +509,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p08>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/mahua-crd.dts b/arch/arm64/boot/dts/qcom/mahua-crd.dts
index 17e40f2a6259..45c95543fff8 100644
--- a/arch/arm64/boot/dts/qcom/mahua-crd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-crd.dts
@@ -23,6 +23,8 @@ / {
 &pcie3b_phy {
 	vdda-phy-supply = <&vreg_l3c_e1_0p89>;
 	vdda-pll-supply = <&vreg_l2c_e1_1p14>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p08>;
 };
 
 &tcsr {
diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..ac7e1382166d 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -813,6 +813,8 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };
@@ -850,6 +852,8 @@ &pcie5 {
 &pcie5_phy {
 	vdda-phy-supply = <&vreg_l2f_e0_0p94>;
 	vdda-pll-supply = <&vreg_l4h_e0_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l2f_e0_0p94>;
+	vdda-refgen1p2-supply = <&vreg_l4h_e0_1p2>;
 
 	status = "okay";
 };
@@ -872,6 +876,8 @@ &pcie6 {
 &pcie6_phy {
 	vdda-phy-supply = <&vreg_l1c_e1_0p82>;
 	vdda-pll-supply = <&vreg_l4f_e1_1p2>;
+	vdda-refgen0p9-supply = <&vreg_l1c_e1_0p82>;
+	vdda-refgen1p2-supply = <&vreg_l4f_e1_1p2>;
 
 	status = "okay";
 };

-- 
2.34.1

