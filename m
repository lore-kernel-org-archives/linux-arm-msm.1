Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A9638F633
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 06:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788848655; cv=none; b=XSczOzpHIwuzGgZZH5tqoNwQvnE2eNr9SWFiiZMVyYp+fnHkD9RuH3ZQDVEUXgGzhQ5FP+1+U4BhlPE84LWCduX8H0PrwM5Sg3sQJWAicXhS6XlZQkCFel8LkIyC29C0IIDQvaL+Y9Z883cGer52x5QeXFNjjS0106MC2+5SfBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788848655; c=relaxed/simple;
	bh=rKBOVS8K4d6NNRfUn2QCK+/TakDRTcHEIVPw0Qn4WeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ma4Dlj5TIR0Pck8QIbuXsQ6y1lN2NpGROSK23Zv8oXaXTVVmfdFQXd4vdTaVJ/Qep2fC2CHux6hBcxygfQ92Su7oJAiq9q9kFSy7U8xE6UQ/cmTy6SJI/SVS25Tox1FUxhKWY6gLwGMevAy1mac6rHTz/uFWSvvggJzFFLsvpuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YYAAfFZS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kNVCSBZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YYAAfFZS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kNVCSBZR"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6886LfOD1477277
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 06:24:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p2ZW+4eVaSCNBd/FOP0rUMTentlBgUhlQKPGR5tOFU8=; b=YYAAfFZSZBRbFOQm
	TBmggfshnAI6cHMouKvRQZQnb+Y1pzlSE1L6460QWM3y/79hvRFVpS6IfzqaO/GM
	LwnuokVK+F5gevoAPHt7TRJjWvdh7/AldvuUx32Cqn77AyaQa2/E2aeQFgQSLMSZ
	Ns7aCnJKZztAWON7FKIxkboJXWUubW/sNu6y4AjhYSSH8t2wmmlzHrQGJBDx2+Hx
	3t+425nNdw3lUtu5zwtpTjL2cpe3aWL1cs4p4NmtvURwn1u3WyfMesmgQUXh0zeF
	l0PfTkB8O1hEQd775BPAVoOx7Qm3xvE/pMknP/LCArY1AMBvOT/X3qd2y7iQRoWV
	dsFRMA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjatjgfr4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:24:12 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-39906175917so4516914a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 23:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788848652; x=1789453452; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p2ZW+4eVaSCNBd/FOP0rUMTentlBgUhlQKPGR5tOFU8=;
        b=kNVCSBZRGnxDEqvUmKgVS/zqAoBWywFNKk3LnnFrpHfZHhZKnzfzK0OxCd2sIoKnmy
         WWNCt/8mEHJMUUrn/H/qKfPxTRD6yvyX/vw5/YrCNB/EtezJx2E35RqrslhwWxNOAAfs
         2SiAPC2FRTZU0drRLtv30VB8OHBJ/ZHyME/LFqfT7KVHc44RSE9TdGf8gB89P07BtQiv
         EKbfiplSzlhwbws+FnNme5scoOjDgg4NNmKDNMqm6mNORoukYxL1B2paNrOIJGfJzXWE
         dCVN7f16l6lFg6+s1jGk6kFMY7NjTQxoPYeLuX5LOmX2N+G1k/vO5U3ePxVxZpzcAo6r
         fUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788848652; x=1789453452;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p2ZW+4eVaSCNBd/FOP0rUMTentlBgUhlQKPGR5tOFU8=;
        b=NItMKaivxAgSFcByhAsz8iEe+p5hrmp/1GZB6zCUrG1y2hCB/anu5BaewrsQH9s7cB
         ObvapwcSzynHweBBmYjBW1HBZp5xkjsn14r6DX9EJAnOgWXOu4luvbWq0FBI/ekCIEuS
         ATwKbKa7QX2nn/qnAqY1fIVJ5ZUbg1c2tThPQEFk/tCOsZ9gZI2wltPfbBug61a9yJim
         6GjvIP4HjrMw2aEALDgINGDPwYiwRKw1+EjSR4ptIYg0XHTUqUk0qa8w8pm4c5O9Eoj7
         2jZckWJAOvNfx2zJr1prFcgmZvP8h3GrX7cKrP6S27qkjDX9R3jfjNUlQDNkbGWDgXWK
         oIGQ==
X-Forwarded-Encrypted: i=1; AKwUvBxvpQjxK5+4pvSZU1oTXJTAtfM5d49cpjirOBvafQwOF9ZWojPgUypHUuZ2ZnDat6xoyksGgPYWyfaJ0/sM@vger.kernel.org
X-Gm-Message-State: AFuF++kvEMF1SBL6+AzrHNMh5KF8o9XmMASUI1mRbrtU6GtJLeiiP8OA
	DpR1DOLS16/wnneoYq1Ljs8j/T01Upb7h9Vf7hqm4klE9SnQRwVVUdN1YzSloSzFB46/jR3s/bi
	JVYsjkEwSYcZwAn2AOTrwcrrXFV8esg3niDziwuFUi+KZLlYOs0SSmSDhNZ/CyRpPKrEV
X-Gm-Gg: AYBFou0dA1UVoM5gbsuL2k3pUaTtURGMyKoXwYseOl5CCSxXwFEhnBweyeROZ4GbZTJ
	QeUShWTxzwFklIpmrnTjF07IWEtQw+/XPvdpKUeIre4fNXSii5IYQmJI3gevqKkmfbMOfX3vyef
	v/okzi07QIjQtawnayvljaM3QzxPLetw3/N2uxqwEURrXzKbwVNYRxaxszhVlR0f8BRexWBreby
	um1IAsnrvUdo/nxTdP+AFhs6XXax+zZqX4Vht9KJbRKjhfrA6NB4YCrLE1Kvuln5jIZBGWrfMl/
	oc431ij96wuQGHmHYfrWWmnCVcTtvYl6CGBVv1ZG0Oq0Wukz/ETAip2icveMLp2xfV5466cxaat
	usQaflXqcqeE12RpIh+S0cu+Zky3maw==
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr42311084a91.17.1788848651982;
        Mon, 07 Sep 2026 23:24:11 -0700 (PDT)
X-Received: by 2002:a17:90b:5807:b0:398:9be9:ab8c with SMTP id 98e67ed59e1d1-39b26229bd7mr42311020a91.17.1788848651372;
        Mon, 07 Sep 2026 23:24:11 -0700 (PDT)
Received: from hu-mohdayaa-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm26266297c88.8.2026.09.07.23.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 23:24:11 -0700 (PDT)
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 11:53:34 +0530
Subject: [PATCH PRELIMINARY 5/5] arm64: dts: qcom: shikra-iqs-evk: enable
 both Ethernet ports
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-shikra_ethernet_dts-v1-5-69c0c5c7c124@oss.qualcomm.com>
References: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
In-Reply-To: <20260908-shikra_ethernet_dts-v1-0-69c0c5c7c124@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Anurag Pateriya <apateriy@qti.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788848616; l=2973;
 i=mohd.anwar@oss.qualcomm.com; s=20250907; h=from:subject:message-id;
 bh=rKBOVS8K4d6NNRfUn2QCK+/TakDRTcHEIVPw0Qn4WeQ=;
 b=er3SpFfeyBi7YAc3e+soamAoXZ1veXk/nzvg67aA6Ofv4NjwGnh16fgyhx5Gs10NqnaF+WP0g
 TKQhWsxfrJlD3py0DSGMzfNy+Qp9KGW1+mxlVeZnqX16eq8H6xM5YPV
X-Developer-Key: i=mohd.anwar@oss.qualcomm.com; a=ed25519;
 pk=7JNY72mz7r6hQstsamPYlUbLhQ5+W64pY4LgfSh9DJU=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX6OTm0Cii5MHe
 YoYVILJLSmrG+uVFGBVZ9wpKrGLj0wie5aajVHSa06lBbKkL37A9ZJNkRfskJRyStXEL6rxBX1O
 XrSuI5ewwZ1iHLNspu454vkQeeUctcw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDA2OCBTYWx0ZWRfX9D96GuCTp/dD
 i7dbKXV79P25BnWf9MIrrxN8geOihHW3h7NpukrmdHvnsQqM8KXzL9WqUoNFnGRGD5788KVa5AP
 4NDEObeML8vhAdJED0XpC6rLRLGzZeZKhm4EuWt72wFRCjonDkiH5zDNz1vcgexIi06MPVX9ekm
 IUXE3NuzKCCXItj3z3TDViiRbzLBNBetsO1iRggam0J/PH8NMTWine8ey804wVPQfLaUkgwC2bY
 7jkb56yIYmYPw0l39C3mvah4bsf3snzNKlV41XVGf01pFPSh4H+IRBnKznEI5imRosJYMUHFo4E
 kOae8bUV2YzmsqehhEuoX0lOdkKQewwrVQZP9mfwG2N99B4P8Bl0cKVHGneKFEy/QjhLyQcaxOk
 yPBmjZfWFn5dvYYBcgFxolZFjCyUygomlAt33DhB2xoejqIRDE5gYPPBNbikMeBn5EES+I6w9E4
 4R3WEBgwQ7CBlB4JgkA==
X-Proofpoint-ORIG-GUID: LCLoX3TH0mPdZgOljEGN57vx9XF4L91l
X-Authority-Analysis: v=2.4 cv=QrduG1yd c=1 sm=1 tr=0 ts=6a9faa0c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=VSssXiIeYCGYGItyeOAA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: LCLoX3TH0mPdZgOljEGN57vx9XF4L91l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_01,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080068

Enable ethernet0 and ethernet1 on the IQS EVK with their respective
TI DP83867 RGMII PHYs. Both PHYs are powered by GPIO-controlled 2.5V
regulators.

Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts | 90 +++++++++++++++++++++++++++++
 1 file changed, 90 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
index 727809430fd15fc45046daa2d1fbca110394c60d..049feb5b4d965177a67b7dbfb2d368ccfbdab7b9 100644
--- a/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
+++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk.dts
@@ -21,6 +21,78 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	rgmii_phy0_supply: regulator-rgmii-phy0 {
+		compatible = "regulator-fixed";
+		regulator-name = "rgmii-phy0-pwr";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		gpio = <&tlmm 66 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&rgmii_phy0_pwr_default>;
+		pinctrl-names = "default";
+	};
+
+	rgmii_phy1_supply: regulator-rgmii-phy1 {
+		compatible = "regulator-fixed";
+		regulator-name = "rgmii-phy1-pwr";
+		regulator-min-microvolt = <2500000>;
+		regulator-max-microvolt = <2500000>;
+		gpio = <&tlmm 53 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		pinctrl-0 = <&rgmii_phy1_pwr_default>;
+		pinctrl-names = "default";
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&rgmii_phy0>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rgmii_phy0: ethernet-phy@7 {
+			compatible = "ethernet-phy-id2000.a231";
+			reg = <0x7>;
+			reset-gpios = <&tlmm 135 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			vdda-2p5-supply = <&rgmii_phy0_supply>;
+		};
+	};
+};
+
+&ethernet1 {
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-id";
+
+	pinctrl-0 = <&ethernet1_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rgmii_phy1: ethernet-phy@7 {
+			compatible = "ethernet-phy-id2000.a231";
+			reg = <0x7>;
+			reset-gpios = <&tlmm 151 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <10000>;
+			reset-deassert-us = <50000>;
+			vdda-2p5-supply = <&rgmii_phy1_supply>;
+		};
+	};
 };
 
 &remoteproc_cdsp {
@@ -57,3 +129,21 @@ &sdhc_1 {
 
 	status = "okay";
 };
+
+&tlmm {
+	rgmii_phy0_pwr_default: rgmii-phy0-pwr-default-state {
+		pins = "gpio66";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+
+	rgmii_phy1_pwr_default: rgmii-phy1-pwr-default-state {
+		pins = "gpio53";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+};

-- 
2.34.1

