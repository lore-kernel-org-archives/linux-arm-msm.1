Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4DB518129
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792061579; cv=none; b=meS0OkcujYJqr95vBMmgu5niNKsWxcm8Cv4Q4BHxj/pPz7pEhCRdZgPo+SRyQLmIdWLbd549EaM+IghQxkF4FBUwEBbd6h3iFj3cn6uaTY6u1EDt8tPkoUTjYcjf9QXMJrenjwN7h/GNxdQILtzQqfcXEc7QwLzsyoji8WXbf1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792061579; c=relaxed/simple;
	bh=IFYJFv/BVGKeNkstw3qZT7Nr2PwNdhpO42sK5UPt5u4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r+cmuoNSLY0yshtO9PmQ6x0rVCshNug11Vm7um4qC3Svxm4oEMfOwzISRhSsPQHLJtUaCDhYDv+cyCA6C7INN2tYRto2ZzsmlZ7KzUtTAn+1HY+WLD4lKuRaZs1mvrBNqVVlWAdxrd3nSuX5zOQe1/q5Je34pDNxjonkDV+jSe0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OUZX+ulH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AAZFK2gz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OUZX+ulH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AAZFK2gz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAQO5Z1597262
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	31+p/gT2WzggyyNQ+FcFlFemDslH2J5Ks/352HC2d/A=; b=OUZX+ulHRo+3a9SE
	a0OVkHRMKs/wVVuYbWpTV1MxXv/gJzeNOag1y01ZltPz+ht9qR30iLSBH8iezLpz
	Gqy5KkdOgfRMRbTbAjaY1nBQRxZeUqPknardRBpkF8GSlJ91kfMWyq5m8b4muVzk
	Dzuj354/yOF90Na01sSRtlDk30HR5Lp7affnhH0QW72VBJDomNn7KPtx+BKriOkA
	nJQEHlOaGry7TDgHH8G3Y3qs3Mfk7Vs7+fnZMMz9Y9rclS1CoSmDNjSlaK/MBjlB
	+/NXx/4yj9L5iQ8ihM90afkz1xYXzc5PdYxQRd+N3/ZqIfy7qyVUr9zD64kAftVV
	X34EFw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v833g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:52:49 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e8e16d22d8so29382475ad.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792061569; x=1792666369; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=31+p/gT2WzggyyNQ+FcFlFemDslH2J5Ks/352HC2d/A=;
        b=AAZFK2gzpnav4X58RZmePcBreM7LIoSbrlqxziDUkspMkoEvOzw5NtK0/30kbPUpMI
         J7k5ksXwDtx1o88NLFjSoQN03Hsm8PU5LBUTZGsoYOzEh4EQw3EgjEIXbrd7WvvZyH4E
         U1UNAZKW7ArMWM3VaPz1HUrLoDE4Xz+W1FURjMsujnT77GHXZ2dJHLeJRPciQkFaukVa
         V8ToFcGeqh3fDhLUrqYgD72znaLc6/jVwmrdULj5mCC/gUsiqTiPbH0FyKXXDoTIL2zA
         Z5Vi3u6evn3kDZ7MoyfiITs3aE1SgTbfjUeHonjUyVzbVW7d4MtkSZooSwwAULNPRKMo
         jxvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792061569; x=1792666369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=31+p/gT2WzggyyNQ+FcFlFemDslH2J5Ks/352HC2d/A=;
        b=0FePlgQfHJWtLpin7VPc3zVleIjyG/wVqlZdkso8LF9nn0KfNC9+tWLJx2l9lgkU3d
         6AUZfGOA0YFwyF5Av923FX2Zj1VPs2HgOM+VP0oXRs3KR+HZXsWXHjKRLRRQlYrfOCsU
         ekWWGIWmcICN/CBAEMdUX4e1SA4Vdp6Rd988zzBuLDu/9XeBr8roerPnU9kGbA6281TZ
         FHarB0jqU0hR3YmD9N0J3xay0X04S/kguyvhDdS0C8EGJNYI2EULAih9xtgvVP8p+M9e
         8rcMNMpSaQRk0OVxkeDs8xxg7UWRazQEy5/4f6pDAyPjPhs2sjzxhL9qVIr6WFwbp+QY
         V6HA==
X-Gm-Message-State: AFq9FYJpxyW3eTMx7M5l4WPPqROIESWjbJD2nxNV6RQlc98TT9J8+ckX
	ZIdYJLap+bGU8UuQa/13aoA1CwS1SBkOt7wpaI4gp+SvCKR5jZ6w+on+Wv9XD2TluO30UE10PFb
	dRr+GJbdWIR4qlN/F3dSsZ3XbWb+Yk2EMaHJhX3iNA3PzI6bv4cSNTDnvS2Uo34nzrGE2
X-Gm-Gg: AYBFou05ctZNH4XEBWkfR1vw4e+5vBolj8AKZ9qr/EWbybJfQ0czPZ0DOjo315Oceet
	HX9e22RLH1Hkwn4Ndd6c7ADCaws8kVLr61c/zpx7rNtjb81F+Xx5X1zwY2FxWt4SH87bwtSZtq4
	Hey2Otqxa1Q/NP5ODbLV04bFjIGmswGDQVK/1m1jAZfQKRMXKCfhafJj7C0azSWnrnrvHyBFv8W
	yv3NT+hR6huKlaaUywwlD37oL4ZH8Zy1WHX73HuSBYgNoldmVJHYdynv5pUP7MvxZzb4TK6qc2E
	sd4hFJZ2f7VtJ/VBJJOp6ubNVmCGD5EQ8+8C7Dc8GP5oa+1IjSlPoKRSozZ7ZRyGCWhxCpWsHDj
	hiuXtNQYlPKjcI8t5qoqavOA4sktEQQ==
X-Received: by 2002:a17:903:1205:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2e95b4ed9acmr15403135ad.51.1792061568903;
        Thu, 15 Oct 2026 03:52:48 -0700 (PDT)
X-Received: by 2002:a17:903:1205:b0:2e9:5b4e:b8a7 with SMTP id d9443c01a7336-2e95b4ed9acmr15402975ad.51.1792061568456;
        Thu, 15 Oct 2026 03:52:48 -0700 (PDT)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e95013dafdsm12770465ad.42.2026.10.15.03.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 03:52:46 -0700 (PDT)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:22:27 +0530
Subject: [PATCH v2 2/6] arm64: dts: qcom: glymur: Add CCI definitions for
 Glymur
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-glymur_camss_dts-v2-2-e7b1f403146f@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792061550; l=5464;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=IFYJFv/BVGKeNkstw3qZT7Nr2PwNdhpO42sK5UPt5u4=;
 b=zX/3bBWSdGzEYnyf620J3D78ZxK0L8RtCzil7OAEL8wMFJboP8r5kcjgBaiC8MkbO2qodRs0R
 81vzB1xTRi5BxR/c+xMfgwiOehxslQ79I56+k1B8Fa/ylmfzhxcwemf
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX+4gyQCWo32ZK
 ZHOTQ/OIaQ/NuT4TAuAMsjAObHWLNJ1+6BAqKz70d7gOQtmzBIEhaPOCGVTjlyi43+PgUwMdo8L
 4wrtK48jktpdp4EGzr5sqjb/SpxhAqqI4/sdLEkjOuUpjm3wRBwRtclGxWmaLP8NeNlHV/EdNc0
 w0RZhv4GZz6XGXdzLHNFVGFj+wEv6RBZEAI+W+5XbTq142k1W0Ct795euSNhKUrTv7vjhOyXbdu
 ynj7/5EdOdqBl2E5QkbPPdOR/LllDZzlGe0t6zawnSiBaNtrB6UmrUCv3oMCGQrE7c7GrMPrEKC
 5y+kyza9JDsOegOoGZKIjfxYguS3LPqIhZxPfMsDHSCl4T1e4rEYCjB9r1ljz9AJ+5av4HqHGij
 RycvX4ReSp1eNEZhaYUG28Ow2risCSGO1Jg5AGAe7uOcE801t4DHvVzryz9VIRbdtIGf2r6vkkt
 2Tguj66NQ4GgpzphNiQ==
X-Proofpoint-ORIG-GUID: sETVrV0vxXVvLpyTVTlMebFYxLrr9-mc
X-Proofpoint-GUID: sETVrV0vxXVvLpyTVTlMebFYxLrr9-mc
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0b081 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=IhPOVdJj7MU1JEBa9wsA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MyBTYWx0ZWRfX6r0TvdHYlol7
 rexGOBUYngLuCfV8CNBHNjjpYl34XWUN5KyX/leg8SV85RwIC9eg5QppNuw7CIQ+N7TRNv9mQFW
 6eNgdxF5cRB007wrzljHWd/1xYWUYCY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150043

Qualcomm Glymur SoC has two Camera Control Interface (CCI)
controllers. Each controller contains two I2C hosts.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/glymur.dtsi | 202 +++++++++++++++++++++++++++++++++++
 1 file changed, 202 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/glymur.dtsi b/arch/arm64/boot/dts/qcom/glymur.dtsi
index 7609c15ba8a51b8c9b6e06a48410df1128316358..fce3651c47f403e01ffc2a44d6d04a4abba1f310 100644
--- a/arch/arm64/boot/dts/qcom/glymur.dtsi
+++ b/arch/arm64/boot/dts/qcom/glymur.dtsi
@@ -5408,6 +5408,80 @@ &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
 			status = "disabled";
 		};
 
+		cci0: cci@ac15000 {
+			compatible = "qcom,glymur-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac15000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 456 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_0_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci0_0_default>, <&cci0_1_default>;
+			pinctrl-1 = <&cci0_0_sleep>, <&cci0_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci0_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci0_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
+		cci1: cci@ac16000 {
+			compatible = "qcom,glymur-cci", "qcom,msm8996-cci";
+			reg = <0x0 0x0ac16000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 859 IRQ_TYPE_EDGE_RISING>;
+
+			clocks = <&camcc CAM_CC_CPAS_AHB_CLK>,
+				 <&camcc CAM_CC_CCI_1_CLK>;
+			clock-names = "ahb",
+				      "cci";
+
+			power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
+
+			pinctrl-0 = <&cci1_0_default>, <&cci1_1_default>;
+			pinctrl-1 = <&cci1_0_sleep>, <&cci1_1_sleep>;
+			pinctrl-names = "default", "sleep";
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			status = "disabled";
+
+			cci1_i2c0: i2c-bus@0 {
+				reg = <0>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+
+			cci1_i2c1: i2c-bus@1 {
+				reg = <1>;
+				clock-frequency = <400000>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
+		};
+
 		camss: isp@acb6000 {
 			compatible = "qcom,glymur-camss";
 
@@ -7074,6 +7148,134 @@ rx-pins {
 				};
 			};
 
+			cci0_0_default: cci0-0-default-state {
+				sda-pins {
+					pins = "gpio101";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio102";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_0_sleep: cci0-0-sleep-state {
+				sda-pins {
+					pins = "gpio101";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio102";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci0_1_default: cci0-1-default-state {
+				sda-pins {
+					pins = "gpio103";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio104";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci0_1_sleep: cci0-1-sleep-state {
+				sda-pins {
+					pins = "gpio103";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio104";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_0_default: cci1-0-default-state {
+				sda-pins {
+					pins = "gpio105";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio106";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_0_sleep: cci1-0-sleep-state {
+				sda-pins {
+					pins = "gpio105";
+					function = "cci_i2c_sda";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio106";
+					function = "cci_i2c_scl";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
+			cci1_1_default: cci1-1-default-state {
+				sda-pins {
+					pins = "gpio235";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+
+				scl-pins {
+					pins = "gpio236";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-up = <2200>;
+				};
+			};
+
+			cci1_1_sleep: cci1-1-sleep-state {
+				sda-pins {
+					pins = "gpio235";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				scl-pins {
+					pins = "gpio236";
+					function = "asc_cci";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+			};
+
 			sdc2_default_state: sdc2-default-state {
 				clk-pins {
 					pins = "sdc2_clk";

-- 
2.34.1

