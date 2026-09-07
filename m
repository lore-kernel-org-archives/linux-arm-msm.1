Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1217645FFB1
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 10:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775697; cv=none; b=oq8G6265yVJj3x4tfA1yrhTSyDXyQwCze/38tbdzeiJ6aXapVUG1NtIBJY7AL/nn/g3qDDYlL5MIvmKVKxDflM/HGu3kxfoGaJsTSXGVADonZuxhDGtsPkBDnfkfWqN+x3FSf3Q5jqiYwbvHdLVWhdHz4DMTrpeQfVofKqzmSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775697; c=relaxed/simple;
	bh=ONk8ORpuDxsy7eZ/zdhchscAUgGd53Hb+8JZrESknE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zs2m5HWnlBKFnhJ3/Tdva6/p5wzBkMGAj1IHjMaKIG16yBGkP3LtxgCKkpxgPm13tOGKaZnPefBoNywGBaSv0/Kb5uBi97GXhkwLOLWV02tXZKtiCQl8L5cmp100b3IuECHMfSGEyP05NKubW3BDM201FhqXbOyFxjbXpxhiU94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PrOskTnz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PA7b9kLl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PrOskTnz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PA7b9kLl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6879bXPm319016
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 10:08:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	c0hmHfxWXS5P698ha8xUMVL/9pnNf6u7RgQbUvi9yTw=; b=PrOskTnzRFwjzB1x
	wItIU2ywHy7Imk+c6p0vLlWD1oAC8LLdvxsa1wSigSb6n0YVeE2IPvl9Zl0RGvKm
	F1NjwXKipYlgRarqpDdzFokzGMLnJ1huwu/rfJyBeWtYn0EBi6qmLFrScn8YK3KN
	ILYjWD6dxn+56dA++ggZvNBIJszmHo1IOyNX8xJG9hCE85vhThcWnPIKXqQnQJF4
	zLIQw7g94AHT+Q1eF4ht5VRoRb60GMwj1o1S27jvEJAaZCeg+2xzJIFdLWuG9ttY
	Qh6w3ZYeZTtOtThzmh83fISxk6Y+3dxK6NWhtRWb42EzeyPGD/3SZ/31nhcsANmL
	D2H9Nw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghfwjj64c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 10:08:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d7443e0f0bso51021365ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 03:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788775694; x=1789380494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0hmHfxWXS5P698ha8xUMVL/9pnNf6u7RgQbUvi9yTw=;
        b=PA7b9kLldKfdFNst96gOAOtlCNhfwrx/+j+gbFjYUINtk+Ye+LJBWC49Xwynhgg39x
         DCNXyasoGZT12vWk+8UA8FrWrgwRgrL5CjQg7s5XbavurfbPoo1Xt6AtnkWXkpNvWt3Y
         5R9fW0KrXCU0R8fwf40HZx+nfSOkmcenZcesH91MWXdXyk5uclsDkdxXFoNXCw3boQ9G
         9DTOToGT9vG5sYCscpmZF3RXymCVMElB7dzYM5fH2NdXTutMf9eXYOxCfRMZHCf8bTvu
         0z8ZrLO4tvebqtH+dajwjyEhHQxy9GbHvQKQZhVadCsTf1dkbzuZ5Fpw8Px6CdBERiYx
         uMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788775695; x=1789380495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c0hmHfxWXS5P698ha8xUMVL/9pnNf6u7RgQbUvi9yTw=;
        b=SJH3gi+qVxu6MZmguOkx8tl9ZZn+2pc6LG/68S6jY28i35HgMBNm3hHZyzOnc8wIIF
         bfThvIryufEE4YbZ7AzvOYLX+OPfFCwtkFmDRdOqY223QMKN9h9+ivf6uYMBAxwKCcG9
         yOdcY4Qw/TJAIIGKOxBUCEcsTQr12cgTrMjCxIn8vb8BXcI8jwQdHAw9MEBYp5UME2Tc
         zKyHH2xvL7uxKAC55Ex02YILsnL7D1pSdPLZhFsCsFAUSoIw+UF4hB+J1SMSR6ILDMpz
         SCcqIihjbbgy7OSo0vgemUMScmxyE50kXlBtkIj44eUE+eAyNj+Gbaz2ffy1kD8szpYT
         ExDg==
X-Gm-Message-State: AFuF++luXY0pDvMueheqJVUhuMaTWlUD2+IceumW9nSrDm7RnOS/s+wC
	FB/TbQzSDSFOe57IlXIhzakKBswx3NqfXuVqLMQWuiqZHrEtvvkC9QgZZMtzJPO3iRhPZRONB45
	TIF2AwkxHnaSK6kVa2lUqxum1QU/4BSjjovblrChzGWdDABaQnXOLRdOeCADMFGsL8o4H
X-Gm-Gg: AYBFou1aA8W1OoYSbjnLLx8ad086Aml3o580V3sm0eN2k1LgnmjBtgQoHldX5CkXUAO
	RNazoM0lDpm8xSGJf0Xy3uCpwowfC70sC4BAdbG+SUIFVel49DhARZCWvkTtA5X0HnYnEgWwWa/
	NOth9bsxWEMM6pqdQ4YvGysXTn0jL5aYyzVx0UkOTPVgfCX0ukfVN/Uw+7X+d0q4e210Ymk0FO/
	5dJV1cnDcS8SkYuAn0+FQyQiyXmWMj5ubH/nGLfzoJ98AUZx0uQm31BFLSk/+JgdCP5prG5b288
	2O9hD5k8nzY8rH4WCjoI4y2C2VV+VrPTpYe+12E4X2dk7FefM0Mlqu6Uv9faTu7Hl59+E1UXREN
	u63eN2Fnnr4SN8E3Aafn56tAOTgez1dA=
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6747110a91.16.1788775694590;
        Mon, 07 Sep 2026 03:08:14 -0700 (PDT)
X-Received: by 2002:a17:90a:1189:b0:39b:61f1:8032 with SMTP id 98e67ed59e1d1-39b61f18060mr6747058a91.16.1788775694073;
        Mon, 07 Sep 2026 03:08:14 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339aa37dbdsm22891332eec.11.2026.09.07.03.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 03:08:13 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:37:47 +0530
Subject: [PATCH 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-glymur_camss_dts-v1-4-6c2ced5ea5f9@oss.qualcomm.com>
References: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
In-Reply-To: <20260907-glymur_camss_dts-v1-0-6c2ced5ea5f9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775671; l=2527;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=cI0ALWv/LigAcGVjK0elBRZg7Mq6Gatypt7/q7zaAkI=;
 b=/E2HLTAwFQBPdLx9kvz9gbsxKnsDFT2r1RQfu8/wJ/w4/mZQWxIuwMoqwwFEBe0JIFOz3fxb3
 77OEMduIi/+CEgl/1zdTksQFhWdNkQfQ8q09UjCZERLObqAf4N3/cKR
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX1yQ+sjLJUbVy
 5tSiWWr3U4AVu7QpRRkjoxPvve0nT00IuG+62FMPYzVOP65oaJYIeNHVUoKJUG3EdkmIr8OjhL7
 w05Nb1uGJqDDkT9eZYFBPMJvF5NG2yI=
X-Authority-Analysis: v=2.4 cv=NanWEWD4 c=1 sm=1 tr=0 ts=6a9e8d0f cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=o7Fm7CHYE8stcAh43noA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: O4k3qU6kRm_MNZjq48A1F6kUL6JLR0Gj
X-Proofpoint-ORIG-GUID: O4k3qU6kRm_MNZjq48A1F6kUL6JLR0Gj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDExMCBTYWx0ZWRfX0fEIC3RPoJpN
 Qwt43YJH405rOVNScJ4UfhGsECIV7NIjdwbZ+J2M8HNHM+ZPiYg6tWwiJRIFb3HKiHqF6W6h1uQ
 sptPkJ+koaXEHrP5p0e8nkotAZMgQv8a3jzCGaeeaFiV9pUgoNqlxAjP9rKt5yE9eBz21GXLHdb
 VCxIoezoLYRgb9i8O+WHopfWBdGVoGj4lom0hT1NYNjf5CyUVChwjkbJKMWjZxzW0ib6UGwLgQt
 u2m8wD94183qgp+the2ctQ3H/vXDAEeUeKkJ5zq+Vyf+WbiqA96qR7QGJzvEM8izvOB2bfKACCM
 5UEjCvnnq0eRaDu+s+9Oq8T7vezjz57rE6GAnZtPsfqDFl0w0eCMqf2hpqhsz7U+Xfu8DxIElkZ
 B/SqkEKuRELlBmG4MN4KlWUDDj796KS0TcABHKYV25wjlREOQwnCeCDHwdRAW/2MVmkzXR+Y2h6
 qvGYB4hMMdZYypkjqdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609070110

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add the PM8010 PMIC node with seven LDO regulators and pinctrl states.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 69 ++++++++++++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 4df3ccfee106a49ef8ff018f22b5724db0b76813..68a191890b7d875564080d9fccf85ae9451cf0d0 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -671,6 +671,66 @@ ptn3222_1: redriver@47 {
 
 		#phy-cells = <0>;
 	};
+
+	pm8010: pmic@8 {
+		compatible = "qcom,pm8010-i2c";
+		reg = <0x8>;
+
+		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+
+		vdd-l1-l2-supply = <&vreg_l6p>;
+		vdd-l3-l4-supply = <&vreg_bob1_e0>;
+		vdd-l5-supply = <&vreg_bob1_e0>;
+		vdd-l6-supply = <&vreg_bob1_e0>;
+		vdd-l7-supply = <&vreg_bob1_e0>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pm8010_default>;
+
+		regulators {
+			vreg_l1p: ldo1 {
+				regulator-name = "vreg_l1p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l2p: ldo2 {
+				regulator-name = "vreg_l2p";
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+			};
+
+			vreg_l3p: ldo3 {
+				regulator-name = "vreg_l3p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l4p: ldo4 {
+				regulator-name = "vreg_l4p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l5p: ldo5 {
+				regulator-name = "vreg_l5p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+
+			vreg_l6p: ldo6 {
+				regulator-name = "vreg_l6p";
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+			};
+
+			vreg_l7p: ldo7 {
+				regulator-name = "vreg_l7p";
+				regulator-min-microvolt = <2800000>;
+				regulator-max-microvolt = <2800000>;
+			};
+		};
+	};
 };
 
 &i2c8 {
@@ -1090,6 +1150,15 @@ wake-n-pins {
 		};
 	};
 
+	pm8010_default: pm8010-default-state {
+		reset-n-pins {
+			pins = "gpio106";
+			function = "gpio";
+			drive-strength = <2>;
+			bias-disable;
+		};
+	};
+
 	tpad_default: tpad-default-state {
 		pins = "gpio3";
 		function = "gpio";

-- 
2.34.1

