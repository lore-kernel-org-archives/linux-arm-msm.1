Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418BB4AB1AB
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047092; cv=none; b=HP2uQ849utp5SJZ6fAObW/qBCn8eeBLiFOJjStvH/glh1YWxxe/Y424jXH099+bPUmc5xP8usfEnSVDCYCehycSLqTlz/t1lOQEfRpqujNnMsgeR5ZKRYgGQivJzgjbD1imk/1kKeJ2Py2O2/ucPw0fVUMnRy/5UDj4yF2MXelY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047092; c=relaxed/simple;
	bh=mfVfQspIwvVEROL7FidIXXcTzJw8GqiIIALDje8vYZA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PLMmQnV5jInqb3aJNeLNYhR0zQACIKUGXw/ig0avqdKSLCvSmV09u4TEBVzGA9R1pFtK8w36YD0dPjyskoTS9fqmYLMXpz2Ehnk7DuqknwdNvocWExrgHtfgNlhAdv2qGqxu9mMXLnX06SYJZtmnPPtgfSjZ1keHqEoh9mq73Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nJ+V3ucq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=APuqCC3V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nJ+V3ucq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="APuqCC3V"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7V113893012
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gAag7BBKEEyCroQRSVad40+GMYxEM1aPjJiEmOtAIH8=; b=nJ+V3ucqurt9L0xN
	HnFNqJgDDhPUkj6F7pdYyhU4MeFvXpwNS5tRUBqsmKtNCQOZCxoyXlc4vU1XnYFX
	75+c0F/3Tr4cwJkYQ7r5RDVNoiNrVWTiFUWJnpM29Wz/dl8d++JOkP/0r5qxsTXP
	Y8P0kIeFeHFBZnEsA+p8ezz2y7QUq+/WcRhHuA90rKL0mDu/zjg4Xp3cTrwWiMsO
	Dno7QUnsW1WFxnrqcvLmhiOdvenRjyUTpMVzuS8SZHvtR6hra7nn5A1Emiw4OJlG
	7pBPweBb+1oGyZW5j69vMkG9AD+HiW/apsizjeDKFJw1WWH/lg6HqhekrLUZc5Ii
	tslQyw==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gksh8s21u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:31:30 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-46ac13882ccso6734761fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789047090; x=1789651890; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gAag7BBKEEyCroQRSVad40+GMYxEM1aPjJiEmOtAIH8=;
        b=APuqCC3V0PDC4f0zfnjZUF6uMfr9k+F0Zyr2NQdrfJ3PDLbCGmcSoF3ZG6M3Z5AoKY
         3nTeCqDeR1ytikcXF4aCzIjhaEg/T/oSJcjys4xGs/VWsBGCh4hFROoKSO9SseN3bU1i
         zofZK+wRDW1AzuTY9ziFgEIYj3GSF5eBJZYwhwASWYbqKzIgfVGsZfoprVOBUFXMGH+i
         HnqEEr+O3jWzDrICHOZ1L6Jc1CEq/miNw/ZuxXyRm9K0sEOiDeQFrMiEaNcxil0JZgCM
         FMT2QhuIFhTS3oodCwjawgfSCI/66evASF6ODfKVIzMAMZ0xWF+ipU0Sxq2IOa9Z6NzP
         FV9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789047090; x=1789651890;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gAag7BBKEEyCroQRSVad40+GMYxEM1aPjJiEmOtAIH8=;
        b=F/xvH7a+bGm5vFy8nyDjbE5bxJMODBTxTB7PJlTp7V5jd7DiEfaZoEOYOD2Ps3hju3
         8k4K6gGDjrSAH1alMkRePGaZwI0XBIHmjvx4ALR6BO0QoJvcWufrspiJSEBcAZKuBB1b
         I6QhX1poQt2dDJI/b0bGbnCCiUpEEEBuKFlwF9tu+qGBz7wnum2RvX6qIPK8K/9SalmP
         bFWDrSBNutwnHGqgDt9jNNAR9wMqDaNSd/2O1Z0A9tiThMaenn+3yduKUhB+AX3toRi8
         jyDNrGInCylJ63aSoTNZSZFRvTERC+sbFmAiTnSrgUrF5paCDviThtJng5+mgwi5SUrL
         7dKA==
X-Forwarded-Encrypted: i=1; AKwUvBwlL7cluGFUHcdH9XO+bfiwsCwrtU+ZSW19LktiSW7wWuB7pM4n9r9rvTZtvYsvP4Kc1sTTzLMjmS3OaLdu@vger.kernel.org
X-Gm-Message-State: AFuF++kM937rWvI/K5oejdfbXRI2/CxNAyXYmnYZlofcAGVUt8Pcg2Kk
	F1ED5QZdH8Eik/qYJDAhq7Oqtqiz02pDcv3DFZ4DSdanTdlFVJs+s3JpWwVHhMc1fwZzx8BWmKp
	I7WZMdgwMNYBK9aGfPwIu+dSX2JaIuzHUbCa+kDecwU/6rZQMJKQ3pxCVIuf7mUka6xAL
X-Gm-Gg: AYBFou3QNdAKdsMUivsV5OOKSYXq533BM5i2RvUZHIgRhZ85kooOlJlcSIDyeA/N8aE
	pgd++p3XjD+Dr3c/09E46WXA8Mu8lQ48AtAQaZS6GuXSFjy9FvBLNofMfUzuXNWQg2kzY1GFb0S
	w9aFqTeMuscq5BjgO+7f61+v/pjrbmsJMh0ju9DLFKzzRd9P1skXmbR1qQFz6j4cCwdTErSJBoh
	3LB3OxBT/B2mfc+iP+uD9PS2M6ydqeL4qIsC1ErzUPJbNioM6MKp0FFYMu+gxsu+jX7xIks30e1
	9rhX1FrcLxSik2ejj3G8j4jflTIanRYwlEQ4t2gIvFgBU/WfXHBxauAA2DB7ywwFIgOcTbINwrR
	mtSKMHGNJ2IsbjXPX8hfxDDEaGjDgIs+DHPo=
X-Received: by 2002:a05:6820:c3c7:b0:6bd:dede:11c7 with SMTP id 006d021491bc7-6bddede236emr4621020eaf.26.1789047089724;
        Thu, 10 Sep 2026 06:31:29 -0700 (PDT)
X-Received: by 2002:a05:6820:c3c7:b0:6bd:dede:11c7 with SMTP id 006d021491bc7-6bddede236emr4620988eaf.26.1789047089133;
        Thu, 10 Sep 2026 06:31:29 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-338f7bad290sm21568614eec.14.2026.09.10.06.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:31:28 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 18:59:22 +0530
Subject: [PATCH 33/34] arm64: dts: qcom: lemans: Move PCIe phy and GPIOs to
 root port node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-root_port-v1-33-90a252ddbbfa@oss.qualcomm.com>
References: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
In-Reply-To: <20260910-root_port-v1-0-90a252ddbbfa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, konrad.dybcio@oss.qualcomm.com,
        mani@kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789046944; l=4367;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=mfVfQspIwvVEROL7FidIXXcTzJw8GqiIIALDje8vYZA=;
 b=yffo2BaI5jMpu2a8ZH+QcYUH1JRjwsiw2YRYdC9opmFeDi49Ev1/Htjl8YXBohDOx142wYYmN
 eIJmD6GTIEgAEXm7oon6g7po1N/FPvfnOVbIs3t5bHvsDqREZW3F+zj
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: gTgZbqAPWPv4fwfEcSmmPLuKRXVWWFE_
X-Proofpoint-ORIG-GUID: gTgZbqAPWPv4fwfEcSmmPLuKRXVWWFE_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXyZ3XBHP8G+kB
 nk9i8Ogx+tWywkcnSlVEQ3QACaul3s8LsjFc5VYzVDObwpDUTwChbUM8493WEe3002zQlQXD28b
 dDJky/yfWUr84yfZL7i12LKoaBnGgCC0DY+01Jf2NSwNxWgyNDJM0dpWP7c5VjDUXFm9chmCz+A
 SNKOda4L7ut0D3rl2UAyIFwm/iUJ9n34ub9L+6FM2J7N9M6SwxRJ1EpwEJfStMmuWzxu8bfrYhl
 jSLwHJkNjSMKiqSpOw8OFVjaiOWzJz9eEZWkHvVISEQblxvsl+Ou3LEIRRochyDd6OxPE1clBfb
 Cwz2gOqFUa39XLra+dYFpgpiReI99opYHpeNN2vYGHdxlwVYWEXde1PsbNRlIeVHN15z9EsytYk
 UK9FZ263a9eaqDuhyYqtmxQ3laOg4+vwaLk+CatQGsaDCk11Mrnt4s0lNfcQ+06i7oy4jgGRLze
 cciTOZt3rlbwB2v2IGA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE2MSBTYWx0ZWRfXy8f+FD5XjRqP
 2wqnM+8zROj8qm2Hq/KivI83eoQ4QeUvs1Xe9KD4bnnEqAosobBYBrsoprmLjS2uN2c+2ncDlW2
 TZUwgml+D31rGHfS3bS4woRx0KGiuQQ=
X-Authority-Analysis: v=2.4 cv=a56lZkSF c=1 sm=1 tr=0 ts=6aa2b132 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=xTuWgevKKEmUOcCBws0A:9 a=QEXdDO2ut3YA:10
 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 phishscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100161

The PCIe phy reference and the perst/wake GPIO properties are
per root port and belong in the root port node (pcie@0), not in the
RC controller node. Move phys from the controller to pcieport0 and
pcieport1. Add the missing pcieport1 label to the pcie1 root port
node to allow board-level overrides. Move perst-gpios/wake-gpios from
the &pcie0/&pcie1 controller overrides to the respective &pcieport0/
&pcieport1 nodes in the board files, renaming perst-gpios to reset-gpios
to match the binding used in the root port context.

Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans-evk.dts          | 13 +++++++------
 arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi | 13 +++++++------
 arch/arm64/boot/dts/qcom/lemans.dtsi             | 12 +++++-------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
index 194e114a12a0..6946d83cccd1 100644
--- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
+++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
@@ -839,9 +839,6 @@ &mdss0_dp1_phy {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie0_default_state>;
 	pinctrl-names = "default";
 
@@ -856,15 +853,17 @@ &pcie0_phy {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
-
 	pinctrl-0 = <&pcie1_default_state>;
 	pinctrl-names = "default";
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcie1_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
@@ -873,6 +872,8 @@ &pcie1_phy {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 	port {
 		pcieport0_ep: endpoint {
 			remote-endpoint = <&m2_e_pcie_ep>;
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 3ecf3d464dd7..a27bab7aba22 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -961,9 +961,6 @@ wake-pins {
 };
 
 &pcie0 {
-	perst-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie0_default_state>;
 
@@ -971,15 +968,17 @@ &pcie0 {
 };
 
 &pcie1 {
-	perst-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
-	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
-
 	pinctrl-names = "default";
 	pinctrl-0 = <&pcie1_default_state>;
 
 	status = "okay";
 };
 
+&pcie1_port0 {
+	reset-gpios = <&tlmm 4 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 5 GPIO_ACTIVE_LOW>;
+};
+
 &pcie0_phy {
 	vdda-phy-supply = <&vreg_l5a>;
 	vdda-pll-supply = <&vreg_l1c>;
@@ -995,6 +994,8 @@ &pcie1_phy {
 };
 
 &pcieport0 {
+	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
+	wake-gpios = <&tlmm 0 GPIO_ACTIVE_LOW>;
 	wifi@0 {
 		compatible = "pci17cb,1101";
 		reg = <0x10000 0x0 0x0 0x0 0x0>;
diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256..7ae08f29d974 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -2753,9 +2753,6 @@ pcie0: pcie@1c00000 {
 
 			power-domains = <&gcc PCIE_0_GDSC>;
 
-			phys = <&pcie0_phy>;
-			phy-names = "pciephy";
-
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55>;
 
@@ -2767,6 +2764,8 @@ pcieport0: pcie@0 {
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie0_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;
@@ -2927,19 +2926,18 @@ pcie1: pcie@1c10000 {
 
 			power-domains = <&gcc PCIE_1_GDSC>;
 
-			phys = <&pcie1_phy>;
-			phy-names = "pciephy";
-
 			eq-presets-8gts = /bits/ 16 <0x5555 0x5555 0x5555 0x5555>;
 			eq-presets-16gts = /bits/ 8 <0x55 0x55 0x55 0x55>;
 
 			status = "disabled";
 
-			pcie@0 {
+			pcie1_port0: pcie@0 {
 				device_type = "pci";
 				reg = <0x0 0x0 0x0 0x0 0x0>;
 				bus-range = <0x01 0xff>;
 
+				phys = <&pcie1_phy>;
+
 				#address-cells = <3>;
 				#size-cells = <2>;
 				ranges;

-- 
2.34.1

