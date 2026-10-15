Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E664E511203
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061586; cv=none; b=ETcVDP7n2ic3iz7fW89OiXuOnkuyHx0CXcLLygE7MBrEXMxFnqYxdUZg9EpVHiubUt9XKpWjmMtK3Zu1ydMJ3U4SrIJOhN9yWxkgyeb9GX60q4XBMYMmnWmBc3rzGDmXje/NFXmV5OQ9YveN6yXwWC+QElrt6/h6pxKmh1J6mCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061586; c=relaxed/simple;
	bh=PRXZhZhetP11AR/VKn5pVd09u4QzQ1Ak9Le9/TdMQw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZJvZp/AdGxSAugxQ5of6swSUPnvsMxNkn5boS8wc9d5LW4oQi9GJTlJC0nWU3uMpGHE/SYZ6THjP12XH1V6iOWZQw9OrUL4cGmphKuxvCHWo5HUgjpjTEFg8l2cfghiSpt/B/2DFWaGJMZ1VcLHqjqgK0hvn5DNt7afxXOgYGWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ohYyVbJM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gR+MQUl3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ohYyVbJM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gR+MQUl3"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9kEmS2999154
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:53:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jO5T2BMHicLn10maEYHb7Cw3OB4nEGCakbMU7T8qKIU=; b=ohYyVbJMmdJ1ND2B
	f5+K8ZnTqKDoJ1oEfvBQXCpDz2ZQk5+wLEAd2ya02S8E9Jt6d8rZ1+5KmE/A30Xo
	ALH/tyyh97U2ivrrxOh5xzakLObaAbiGTs8EppvWyT2zGvBnCajwrRJOMmA2qIuZ
	jXvTRg7qIaAK007qK5mpk1ACRrmsPZXaSBcyNXzO6H0JKG2QvWv/Y+77sXhKa5d1
	utU4jDt6i1pWInrBSrpO+G+BdOXvHsACbl9251UvC0g04L/GiDTOQWfC2dt/pUP/
	0JJy7hwPxgjohXyM568T37v17/8vVYWtbs17Ojro7ClEqeP5Rk/M+l4WGSR3adlp
	Vs+Fgw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hausm0hg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:52:59 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2e5d759038aso16980315ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061579; x=1792666379; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jO5T2BMHicLn10maEYHb7Cw3OB4nEGCakbMU7T8qKIU=;
        b=gR+MQUl3i8aK09CSJQIBt+XkwK69R5lurb29a/7bKFxyrydBNR1AxXq83uu8TFHAl7
         Z0TrQhIfVio4gllLTJVz9YJIy0xXLsROFIMe2t8FhzgIE0LuyMzooayIVWdyIq+xthm6
         eyEQz3OsELiZCWJb/pUbHt7Yio7kGi6znhF0zYTbTqPTZF3CHQcQEoUnMUQJmwTVnZzZ
         R1Xlu57gSIa8HYUzyafmDynBEjBsKGytu/TZETyMv+xKUkEIPeLxsxwH3t9JIUmqLf9W
         KXL+sEiFPHnKLc1oIhgj8fYcu1MqRaMik1GaAfQiOsH/ay7zbvkr5J2y0OKc1Hro95fD
         oQmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061579; x=1792666379;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jO5T2BMHicLn10maEYHb7Cw3OB4nEGCakbMU7T8qKIU=;
        b=z0BA9TGh8kpPWTxqO4fLYmLu7TOUyAqBxQnf2yQDAW18Edz3hPNe5xD0Ril5RH/aRQ
         kSoUkoeaeGeolvdS9DvcTUL5u3dQwlAgL4oWLdWSuDKffBybGjUTUI2phXALDrb4OVgz
         9bPCeoZr/bU8231ZJXK4PMWRmJ89X4pvx7t20sSlv3ngUywq7OUOXJS7FgIrQCOdGNOM
         BTEZfDTJcbHT3JNtAG4Uif1BpqCzy8X9jgJCoiSpa52b3jDciLlJrRmFzTJczVvIYNFd
         XmmGOKxrFD9OB1pON8FX8PHMATIrvsd8mGFbDVFrqM0GCzOgxDXWt9RB4uGL19DTKynW
         /7rA==
X-Gm-Message-State: AFq9FYJMwl9bOgLpungj9Jlg/cHtM45znkBeFSVsBeFGQez1Q/jGASZK
	ODNM4X7sAcsLaSRF/Z/HCPdVi4Ndk5afumHRNEfvajVPbVpWqr4L+Wy9wcA1o54cB0hh5to2GLR
	lhH+pyBKy69aq0kD14yWHsg5kuWpBEt5RSNsCc57goWw9AVakUlIHsUCnl1NsHn99CPe+
X-Gm-Gg: AYBFou0Zxe6rhWmi6TOKrp3G1cn8i4Dq9EOuig5IgPRbS77kd5P74L6wOGRNEWQin29
	Tw0tfOWVxDzEacyxC9QtWXfulk3/75/XGqG6dejz5xPPfYvF/ixqrAH0L7rIqS4O47FWwYyANjh
	fZo6025H+cA120G0dfWtj4z++HgajdYiKW4HMRN872lbDtlg+CDUQdHombh+UW6EmY9xxS02JF1
	09LOJjHJuwlchsVua0ytR+7tzqfkyN/SAT5/GZzE6S5ju3lfxAFmzeevdlL5nSnwLO6ukblPyTF
	3dfUnnkAnlbMSHeD+5DsUFhCoRLJvsliFLIXiBFUXZ8fyR5cVXdG/oR0+onkYm0INCDDurXvXG/
	5MJ+mOjRelWR7Qih62LgFtuuKizuW4Q==
X-Received: by 2002:a17:903:234c:b0:2e9:3f6b:346 with SMTP id d9443c01a7336-2e93f6b06femr35906985ad.41.1792061579259;
        Thu, 15 Oct 2026 03:52:59 -0700 (PDT)
X-Received: by 2002:a17:903:234c:b0:2e9:3f6b:346 with SMTP id d9443c01a7336-2e93f6b06femr35906765ad.41.1792061578744;
        Thu, 15 Oct 2026 03:52:58 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:58 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:29 +0530
Subject: [PATCH v2 4/6] arm64: dts: qcom: glymur-crd: Add PM8010 camera
 PMIC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-4-e7b1f403146f@oss.qualcomm.com>
References: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
In-Reply-To: <20261015-glymur_camss_dts-v2-0-e7b1f403146f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061551; l=2747;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=SCwcqJ++OalJ7mck/seksWRQmzlUuQbt81toEFYLzQ0=;
 b=VtEo7dDNimRS4Im3wrw/lKJ4xYDiSnlGr6RdJ/s83yrgXlphCYjWpCY4wbznDb0PmmZNPKm/8
 P7JGyuvNuHzDPMwIh7T13GaEr+ZfIWyNIzxc6yrx8Kj8pmOLCzzJOAY
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-GUID: s65ynb0LhNL6OSHeAuhO30aXnVHahUul
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX6LNLnzIp2CIL
 39o6L7BkfMEZUaNZ8Np2c6zFkN4SHDLaA3AyfA96YORjgxhatj8SN3YLlXyAqvY/id6hGBhQnJu
 NHy55yretkwFmQp5N7NiTK1DfoC7DMKLNySckyLLNuzyG/hSS4KKVbVoEPn/XfJpbFA+gr2BJmN
 eM75KZWpmlM1ncxruc50LwDnNUK0pK/jmvzMLHu+jflhQ5u4z6sijTFe7kzuVryuS3R4Oj+Wd8P
 sKigKu7WZ1gf5IzEmDJ1e5o1gnI/uscTOr/qxzhzuN2VHtKTlzft067mRcTC2ht0D7oJC9nZ/pY
 qlwqEjKc+0dxtO5iK5YVj3D9fh5lJIVmcIg6B/kvoPjNEqprOlB2b1aKq3alDayo4IjomNaoGhQ
 +8bEktldQbV8HxEQuDj1Zk9BmjjTwqDRqIp/GWNO5yWK7Xcono6JyuacWr7msjx0+bg3OQjKp5w
 0D22UVRlVxC6VMlokKw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX0jj1gz6vgDdw
 iWvOBjVsA44ORrqiXddq25XqsgNlptTsNGAprHf92Q3jAGoPnQMlh62kYTWSZ8y2nAxOPApjMZk
 0/rckT76RtvyBcNkjlFRiIqQD0fW/OY=
X-Authority-Analysis: v=2.4 cv=Eb5d0/mC c=1 sm=1 tr=0 ts=6ad0b08b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=R0PpLEuAhYnv2Y3507gA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: s65ynb0LhNL6OSHeAuhO30aXnVHahUul
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>

Add the PM8010 PMIC node with seven LDO regulators and pinctrl
configuration for reset pin. The LDOs are needed to power the
camera sensors and associated hardware.

Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi | 75 ++++++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
index 58158b51fe295fd111f3a3d7778ca531467e900a..ebc8da58a79ed6a77916c70c7fd93ab06e185644 100644
--- a/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur-crd.dtsi
@@ -671,6 +671,72 @@ ptn3222_1: redriver@47 {
 
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
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-ranges = <&pm8010 0 0 2>;
+
+		#thermal-sensor-cells = <0>;
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
@@ -1106,6 +1172,15 @@ wake-n-pins {
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
 	sdc2_card_det_n: sd-card-det-n-state {
 		pins = "gpio221";
 		function = "gpio";

-- 
2.34.1

