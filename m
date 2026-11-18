Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794972851;
	b=AxIqYbg43S2aew2Z3bZefWafWfq/K9EyKEYf9ehn522j4PpKqjoJsoU38K76ZWEg5ROv
	 U+CUQDZCap3FGxiM7Q5UHP3JrR/9EQ86CuBrRnfiVU76mA9+xzympa3NPm5Fu2w+/HAZg
	 PGXjRrLDy9t0EKAhxjigVL8VB1pwIMAGeyMs0aCxCKjxF65bt8Rd8nOTJUU4rN9lYDhi7
	 WkqM/kdjbvUIXSFnCJhueVbz6A5J7tbTWzuxs0j5lna5Kq/AajPGaOKsIkJdpoN1BMXQd
	 Q1sow6/i7Z7DDZsvpRSfIutuNJQhIvSowktls4Dhi/w3IoEDX3RzFIQg/2tcGrlIw7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794972851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=exqKt8gxDD6WLEhjFrwAovJS3yYp9YQiZqbI4jKzyLw=;
	b=aCDVyeMywqhrvec/5maENh7WU0MDZg1sq/MpLwXaGmodgnqd6PHKYlo/ENOeOtPvd5Tg
	 RyKQfiASgHCpW4tbLtY7/NnqvzhccjPXqe59EoPtIC4WJuEwJDulWUoVGZClkg35sF70Y
	 PZSebBhFmSjbv8lYHrWVJH/zttKhCTzol8QOcJVde8EXjIHHvgNzxg0hkBzbcbFDq74F1
	 sfiSfFbgiBlq1cNDIu4hg42oMHQkK46I5k4oPCtfcc+N9opbtQkgCMComQYVwGoJhwWSP
	 Jkm2gOBnDhF3j5Y0Ehc2234ZiAmaDN5uCHDYkFqc3IcEIWQg5JUWlr6MfT+PaEjJm+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0WSWoOZ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YX0OHOM2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7FB606A31C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:34:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E7FB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=E0WSWoOZ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YX0OHOM2
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI3KisI2097894
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:34:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	exqKt8gxDD6WLEhjFrwAovJS3yYp9YQiZqbI4jKzyLw=; b=E0WSWoOZiDdU2oHo
	zmguQ30j7hS1+N9upFxm1T5cPMW4eiGWmbeWL8dnwsXUmDcE3IggVa2WW5ZsoOpy
	7QdzFbJ0wtlp4WirDevPc0pmBMJk5XTFRKhDAIdNYUjRgYCXCg0gK5RvKybXNqdb
	yZzTrysTGSlzv6YCn0G8hwDbSmXnT0kX+6m6mfAHjnXUI1+PKM3otBSOLSBgh2jE
	8ilh7FsHeWnDFdF72yG9XmcU6ctF6JpPtskBSkAnMl0zx1BpfUw0NMvT2kQeJEB7
	hkYufFBg5OI0J3NNjpoGZLdOoJYommwM9nDawW/0AlMo1P3fdqzFHYt6HH0VT0Os
	OZIExA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv8h0kq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 03:34:08 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-89f84753b43so440518b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 19:34:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794972847; x=1795577647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=exqKt8gxDD6WLEhjFrwAovJS3yYp9YQiZqbI4jKzyLw=;
        b=YX0OHOM2pSW3cPxWKOHMEA7rGJPULK2CjaHRvAJZFL0PFKSu3WjuRlBWp/bjRH25zY
         2N6XlP7ByrESJYDLIBQjeZb69zLzE2fXGQtEGbmBjQHe5Eau9xtELAtWJQJj9ZypXUPu
         eecvkwlfE0FxGyc3x2QuGjS8u3IUrXpUcU24fqKcbEx4XKlNbnNJx8tLTuY+ZL4Ktt05
         zUsqXUPiI6yzB7fwkymby1LO6DIJePWV74SBUpyVOhbFeB7IEBsQnOgCeoV197g0YoUw
         2xLCTO/w6v1y4IeF6aR5ytgWA0nf3COtYK2Hq3gx76l/zFfdz/u01zBKZra0qYF7OptO
         5UMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794972847; x=1795577647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=exqKt8gxDD6WLEhjFrwAovJS3yYp9YQiZqbI4jKzyLw=;
        b=bQ6ipKWnEYe6VhsL/MTX/KPtqukBEMc6uEifm/0CF90VwgrWgT3lPhFcKOhTZXMRlf
         070/ZBSXelqhedAmMJgUMtv8jONScgNV1nUcn+0DKhrqnDffGAp2oS915HO4j/tMeN2Q
         AikMWtnN2W0zqGOWTBJgLC8TgyMMlCWRQWoJoZhuUoNiCGzW5fjyWbQ8ZqEBXx5v+0Du
         rdx9dQMhuB8s6SbRgitzMYdx3HI+cJ+SR/Lc2Ym9UdfKioVPcGHVanCnmumx7fU2iSI8
         j52dZbNWYds2AlUYLA7ZASKB6IsTQaA29CyEQf/agZQU7cQ88MpI6soWtvrQzYNOrfW2
         X7Lg==
X-Gm-Message-State: APuU4Z9YIsRkgYBW+gh2C7tgdLV3V/df/EaAx3rKpYMWEEE1Ubu2RW3n
	ZHb41+imTXSYO5SSvijIt0PrS1xKnRgmqtQ7n3kJXgnUpAnPl6/qo2VCd4OQCrDyBd6KdoijRBq
	rX3c4n9S3TVasSSb/0KNzCOmGuE6g3QcrfOCb1FBl6zTdJbh3e4rHLF9N4+aCzvRf+SSZ
X-Gm-Gg: AYBFou3i4f43Ezytdjy0bW9oWmRgrfxub6O5anMS6KxWjoklTFRuD8UbjhwF0gVcgev
	P2xOm1iMkofJAJirN0AfNPD+0JZwWPWTMI9YSixmTF7bVyaE7oR4iSfEF5QdrHXKEJuDaIEk7Xy
	I8kUuLsD5qL2aGn2z4GHnVDfCJnU+bDAac5zaMQLkDzsB8HJwek+/Ldd0iLY4Zq62cHUbXBq+/p
	vu5nIfdoGFB1lon7EHS5yVdFqT2vZz04DeXWed1ZI1V9dk3uPKA0aWyzFLyj/bS28y0zPP8obmd
	FvhON/U0kTY42bZmzyvSxPKYVi3FQL82WKMRkI4O5DoRp/zcO76+9m9nC/vLRO4aFI5Vwem6jGj
	7ONvdHTmj4ZZ54YR7VzVPl1fE8bETkg/xNDFtMJicfHocyfaEOl3opfgyur2HzpvKaUP1Oq8PRd
	ZslIr93fv907SayXADhQ1u/jjlNmyhPgFnQV1CPCI2Xg==
X-Received: by 2002:a05:6300:8047:b0:3f9:cc40:dcb with SMTP id adf61e73a8af0-3fe976e289emr1143373637.33.1794972847540;
        Tue, 17 Nov 2026 19:34:07 -0800 (PST)
X-Received: by 2002:a05:6300:8047:b0:3f9:cc40:dcb with SMTP id adf61e73a8af0-3fe976e289emr1143360637.33.1794972847086;
        Tue, 17 Nov 2026 19:34:07 -0800 (PST)
Received: from yijiyang-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5c5327088sm431644b3a.0.2026.11.17.19.34.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 19:34:06 -0800 (PST)
From: Yijie Yang <yijie.yang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 11:33:13 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: maili-mtp: Add WCN7850 WLAN support
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-wlan-bt-v1-1-18bb1b059a17@oss.qualcomm.com>
References: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
In-Reply-To: <20261118-wlan-bt-v1-0-18bb1b059a17@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Yijie Yang <yijie.yang@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794972840; l=3154;
 i=yijie.yang@oss.qualcomm.com; s=20240408; h=from:subject:message-id;
 bh=F7C8yp4JXV4KgVwupVwrdLaOcWGGIIXBIwTgj3wUJsg=;
 b=gPdqGaiQp8jwTt4Lk7qnT7YhfGr6ahCIhFyYKVJibkPcPIq4ovglwu89UZzuY1TV44tRxqwPo
 wSTJ7Gpj7vGAiWdDhoKBcMXFo00tCFhp397G1ZSZfXOBJ8Ktc8JFXG3
X-Developer-Key: i=yijie.yang@oss.qualcomm.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-Proofpoint-GUID: c1C_mWap9tuFdQDHDDBZX1S5FhY8asi0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX8W1uuGmYaDmO
 YZy52FfbzGszLsyF0qRUd9kzIKaoOVTLafZZw3V3gBwmFZYg0z3WAeizknmVROLM1Pm6aVlnFc3
 lXPyJCviou8cWJaJXvtWI/57sKeD3t8=
X-Authority-Analysis: v=2.4 cv=c60+0h9l c=1 sm=1 tr=0 ts=6afd1cb0 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Bcg_z5J1CQXIQLTfTnsA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAxMyBTYWx0ZWRfX3x7y1NSgcsFo
 qRpLY/Kl8mhxksW7Uz2+PYm8gVpjxVGr228Vc/g7FP+V4nBalPNz8Udo9KUKmCtytTfjFAkKclb
 t0XROxJdDeTd8iHCoR8kDTC8YgqRk43amIGmJD4Q7vXK6l+HZNCz8si/aem1imGYCUZ7ypEIKl3
 HlkLhmCq4/RgWFq0/6YQVhxdTNjXwGnEck50y5ksKL5v/OndxARsrp4tTZA2sQHmRir09J0zLt4
 wAgEUmqhzQqb58qvbpUmnbNu3T+8QGXWeBgim1uG3UKMzR8kwP2FOyvkMJ9uDQRAnyF4ikKzTsg
 GSpeQZxpbnc8XUw6IhxpBLaANHDYCtdz8qsUNeeuFb/k7qrJTAOZzGhEjNL1Zn1kmjXwC1ESKhr
 VQtFP8piR5dmzob3wDFgdABnLdugpg9wgmRTMZY1tFBqCPwwKWwgq9CQl2SN85vH+bLt2O6M8aU
 PetntNfRaKQPFzB6zQA==
X-Proofpoint-ORIG-GUID: c1C_mWap9tuFdQDHDDBZX1S5FhY8asi0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180013

Enable WCN785x Wi-Fi on Maili MTP board.

Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 88 ++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 5409d0a7ec2e0..a3c2016eb9053 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -142,6 +142,63 @@ sdcard_vdd_3p0: sdcard-vdd-3p0 {
 
 		vin-supply = <&vreg_bob1>;
 	};
+
+	wcn7850-pmu {
+		compatible = "qcom,wcn7850-pmu";
+
+		pinctrl-0 = <&wlan_en>, <&sw_ctrl_default>;
+		pinctrl-names = "default";
+
+		wlan-enable-gpios = <&pmh0104_c_e0_gpios 7 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&vreg_s1j_0p8>;
+		vddio-supply = <&vreg_l2d_1p8>;
+		vddio1p2-supply = <&vreg_l4g_1p2>;
+		vddaon-supply = <&vreg_s9d_1p0>;
+		vdddig-supply = <&vreg_s3c_1p2>;
+		vddrfa1p2-supply = <&vreg_s9d_1p0>;
+		vddrfa1p8-supply = <&vreg_s7g_1p2>;
+
+		clocks = <&rpmhcc RPMH_RF_CLK1>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -757,6 +814,21 @@ &pcie0_phy {
 &pcie_port0 {
 	wake-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
 	reset-gpios = <&tlmm 102 GPIO_ACTIVE_LOW>;
+
+	wifi@0 {
+		compatible = "pci17cb,1107";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+	};
 };
 
 &pcie1 {
@@ -800,6 +872,16 @@ led-1 {
 };
 
 &pmh0104_c_e0_gpios {
+	wlan_en: wlan-en-state {
+		pins = "gpio7";
+		function = "normal";
+		input-disable;
+		output-enable;
+		output-low;
+		bias-disable;
+		power-source = <1>;
+	};
+
 	sd_card_eldo_en: sd-card-eldo-en-state {
 		pins = "gpio5";
 		function = "normal";
@@ -906,6 +988,12 @@ &tlmm {
 			       <119 2>,	/* SoCCP */
 			       <144 2>,	/* CXM UART */
 			       <211 1>; /* NFC Secure IO */
+
+	sw_ctrl_default: sw-ctrl-default-state {
+		pins = "gpio18";
+		function = "gpio";
+		bias-pull-down;
+	};
 };
 
 &uart7 {

-- 
2.34.1

