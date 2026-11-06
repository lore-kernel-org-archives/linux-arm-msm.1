Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794002546;
	b=EP9bAjp9RZZl26SDURrYBwkalBJvbGaRh9Wrdz/o2zLxWJnEYd2je1W6A6d6atbLjgsy
	 JMD9ekLpaz6N4l+7xVQLET1UhE8vFcF8bfGMKNaVV4dKspWuTO2jlJCgDkhBsoeDE26jR
	 rrVS8HtbPbpwMKKr2iROoYWWVmc30nrfUrfnQTCr5gLIU4EMk9AbtLi1PFtZvm+hrE2kU
	 /4lkTzCeLKG1kMmB8LStXE0IoGRRvD9G7TB7OF0grYh6FsmHZkZYFvrnt3G7BTht2Ukry
	 uCly7jsF6DFh5hEruZ8zDxA/qrc5yibnZwJIStO+/OS7qIyYsewT1R7STvig0Lq05Bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794002546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
	b=gfz3lbnHNENXg5EHCpB27zg2fAbL1SY06L4IWHr+105DmGL4k9cmBz2i8ZciEtEyefJj
	 01tH0rUGn+WtELuSCJi+ytCjOPqXQcmBgZwbj98HO2x9RQ/oM/XEHfpn/R+rOD2aNexbE
	 3E7IymgDQlky2G7vnBrRbjui+fvsl5p3ZqQ5q+9UqDFPokzSXHvlMqopbrvv+0iRmaw77
	 ebHhr1r3rl1AvnWXlO4KMH3oG1JRpJthADQVFenXkp8hnrkEm6MeGHy9VoeJnX0GPSTrW
	 OqjJetvIdAgv8BflaR6yHhbJ6SSazluHZUfe1iRAROfw3yzcpfIcsUChkN+KVq1xPsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRXORdhC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEu6U1YV;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43DC606D81B
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2026 22:02:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A43DC606D81B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gRXORdhC;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TEu6U1YV
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6JLYbb1263338
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Nov 2026 22:02:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=; b=gRXORdhCts2i1YgX
	BQtNGID5Igg5gTtvX0XVrKRZQIRmVeLDKv0M7ra1pfag+ZrhU08+7rXvqeAAfpt+
	jrYjOJZlu+ioAUoMNxZXKFDnapmb4wPq8TuNeIyR87NDEaHdo8Yjbru1BuMM2cQa
	yhsdZX4REdlqlYRemVFVqvgJr5I2x5+YirfaBJ08vW5AN5DB025am4yJvkbvhQh1
	/ENs/w8ZYW/4s7/BpmCw+m2gdamyjpxAW8+9bNGoKJF2wBKOlbV0yaqsVKIS0QTG
	GQEsJpkqmX1R/zZSTFUXMPIHrC/nt+v0G8kp4h1q3vNt/J5TXMVyIsjtXYeDlhtV
	BOVjyQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsmywrgmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 22:02:10 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bf3a0a498fso96805137.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2026 14:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794002530; x=1794607330; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
        b=TEu6U1YVFk7yFI0dOUjee7vBODW05BBZ5uwESeE3cqmOo1G6VqpRCo3nHslaPHVSzu
         Lc6Woa1Mk8QmWVbjEtcYylwWJEOTAY29L4Q6qhaCbT9W3xZt8x7SBk5oMXysz8zvnzTD
         HyLke0Ky7gGp7jswGUbAEVn6T4AZcda9mBUxj+gZG5K2cPDFmSaFYnGk/UPEZtfcCHle
         szsPaNnpOhIO7khWxstHubyGDltQbnHiMLYKNt/KwTtC1/BJ2ok+1BZ0ylOfTIOCDs0J
         IbN+5OYk/m1ojM5UT2xnC1W5g57GolRugQgpiVWedrCiqZvcnorBhCSjc7eTyPAblhah
         de0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794002530; x=1794607330;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O75GwW5quoXl0BcSIlhNX8tci/2VLQQ/unasvEdGNxA=;
        b=EhsONQKEgU17DxLxH0Z4qug1Kck//6qATrYh21/fv9/OT+3jqGLHV3HrX0eEuziSHN
         xnhGxwoiaxedakEujAbVbbGYUefcs4J9ki13Vefb9Fm6bMF2iRBd0Op/wv07x6JfN9m+
         G8RlNWJkhyu4ClKCcx38beZDCSvb6u7v5+IKGqbUBl4m9nJlCqp888e9JaCWJrRyQLd8
         sYOgpd3a167SfWvAR1G383ayMpCtbAssvfGn5f42gsorPZJF3onm+zyGJ8ol2cwoKWpm
         cyNxBUX/afcwA0MQLjrwmkx8z9ejT1KHzVKhR5Y+yAUntDUFnMKLTMWCw80VZDXNPPB+
         vCRg==
X-Forwarded-Encrypted: i=1; AL+hErF0Mn1OoJy86ZnWbyEALeNzcrQeTfJ1iNjKx7lOOvc0wZfZCR7BEJvBG4WlchwXX2X8DqboNiDNy7YoBbPd@vger.kernel.org
X-Gm-Message-State: APuU4Z+IOxkSCeXH3XfmDt5kgvRbi1Ccp7TSH/84J5lvKDXePvI2eGj2
	mAFdLEOcpLKB7iSpYou2PogrDRXKK/MpkEZN2zTS9dnVfw5RObIDPnuSq2L3aRax0lq/dLS2nrj
	ZSWJZ0TW+oJYincJo1ZeAke/x69giqeKx33uZ/WtSYIlZ9mCsBVSc3Sktd4/dfhBxFQaW
X-Gm-Gg: AYBFou0CDIeHJkJUaHxkbBWbpsQurMB+X6uwiAXEJjiEElfgjPTEVxIPpUp52sKHRRx
	eEMtUD0+JUHFXVySfiD3vdsPIGyn1NUnmxgnthg5kWZ/HwgF2VBeN5VMuX00DimmbovNxJGRTkG
	vgtyFY0WqI32wttRygU5RTbzWYtjZ9ULf+nObDenoYSmslHoV2UefGHg8/eDTHTUjUyoZ8zjfZa
	SrIwe/AVvx6KA3lSOGH2G1CRKG8HEXLJ6UXGzwgqgwNeTDiuCkjDHslsNW8ewvkNZhsh08aHKsA
	wJcXA66wAp1dTqeL9CZ6i0L9kISMkPJ2mBexWy0eW0boWTKr377E0IOHW0BqdWrld7rq4M7Nc7h
	FfsxIsdvPq+gzNMnU5GudpSZ2BLqkmORmU1AtP8aXJO0am6sA2OxzZ+HNLA==
X-Received: by 2002:a67:e710:0:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7d2bd9eabb1mr67595137.45.1794002529835;
        Fri, 06 Nov 2026 14:02:09 -0800 (PST)
X-Received: by 2002:a67:e710:0:b0:7b4:9eba:69dd with SMTP id ada2fe7eead31-7d2bd9eabb1mr67580137.45.1794002529113;
        Fri, 06 Nov 2026 14:02:09 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7cc6162sm5812437f8f.47.2026.11.06.14.02.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 14:02:07 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sat, 07 Nov 2026 00:01:54 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: mahua-lenovo-thinkpad-t14s-gen7:
 Describe the Embedded Controller
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
Message-Id: <20261107-t14s-gen7-ec-v1-3-f4a8edaac447@oss.qualcomm.com>
References: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
In-Reply-To: <20261107-t14s-gen7-ec-v1-0-f4a8edaac447@oss.qualcomm.com>
To: Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1767;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=ZRuR8urqXbfjmra9eBgfstiezyG+KjQ2tGTK5mUoxrM=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq7k5XbGwrmbI6wXy3YshymRedfydChFZSrqa+O
 P3Of+nDj5uJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCau5OVwAKCRAbX0TJAJUV
 VhLaD/9rRE42Aw46TEo2LJbXjS8hQEuDsJvU3vGP0AKO/sLeAUmka11W8I6erRPVEu08NvT5XP9
 jpkulFzIFVDdW+65cOeLZAXuXrUaMt0Ihl4L1f5pQDEdaPx1v39it3OHz3fPjkBPxTQSsDR2HW2
 uw4ATXd1i0ab5jNfhZxWjAjzA57Fkl9H9m738j0mRenQCpPCHwRCOQ2B73dpSzkL2zSa9ftyBN4
 ydN5MP5BznIUX7TeCiYO+vruhy8W905D3TFwNbic2j+8AtBFixT3K+0bmRnn4v5Vm9pYIH8fviE
 vvzlzpJ/fjJknvuT9pLqDKJi2AienX2/GX8fb2QTAfBv0+94Ho3Z5RHftXBn5eM6G4sWgXBFv+g
 xyWLichrTYZEypvOwuXA2OLa4f6FZeyDtabRuK3dQoExFhQjKkAD4Muoyl8zjJJHpZ7PvJ7vNsw
 GoUvi/AdErciNIRqgTJ18FBmpFJmcAO9ma8b+xZjHae/U7azv2pkMdm1G1a7s+mVF6WFrfuiX63
 EfjnVlkz7i7z4YE5cNYsWshyz7cRPHmE32gtJ2r7Vny8D6xJJo2tLaGsTkD6aWfNSqN8O2AdDBV
 WnLn2Ti31CliaO5fr4G717TXzmMfm9fSb/Ht2b7xK3RcqFg5dTFcs/XS3hLZgHgWOtgBfkUwqkT
 j3bjyD9eeA9jDXg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=A6j5rKWG c=1 sm=1 tr=0 ts=6aee4e62 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=-ko0rdnKxUD0urDMsK4A:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX81kfa26nEazZ
 RO6lxssEjS4aiRAab2yTHE3uNwYi9MWetw6mlkbiv7fMLfwH8pSpr+dpuHFBkEDyEon8x9Ma0CO
 eULfZKjf1FYf+8MXCXSswLA+vjphLSgD7UyilGOxW313dlbUCJdd8ZW7QqIygb1QHtZ3MMEI9uQ
 lVzGnssBCFqZt2ANvkvWfYY5nwia6jOPP4jjI7kC3qe5XxdKFhiSsnFCckCjhdkQl0kE5UvBvXX
 cVCyiMLkv7kfnqk7h9/+fLZY5WOE6LwvK52QrAry6xM93IpX6XbWq3tQz7Nb096O4K0lRGYJ7uH
 sHAQZAAjjvXd5m9VvP/LmFsIEqOIUm8amCh+KnzZHXESir19SnYyQboA/KFosL3e6q1gozUJwQJ
 6Zesf1dGpE9lZIAGQdxu5XN5IXyT/TE1RoeQsTkgXvVgLUFQurIY/SovzXUZnPIHchvhuv1bhvR
 O8r2ywcDhVpRnqqfR2A==
X-Proofpoint-GUID: u0_SQk80gZom-ix5bnulTydJJfe1rlwB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA4NyBTYWx0ZWRfX7Wr+qTqAtcmL
 9CMO2pZ5SypLJtHReNrOJuQQyNY7idgAUT+eenBzJxvBY2j+CqKF85rZmfJ+5MkjmWlNH21yJnw
 iDW7c7piLqMbmh0Kt65qskqnSm2xGas=
X-Proofpoint-ORIG-GUID: u0_SQk80gZom-ix5bnulTydJJfe1rlwB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_06,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060087

The ThinkPad T14s Gen 7 has its embedded controller at 0x28 on QUP
i2c9 (ACPI \_SB.IC10). It uses a different command protocol than the
Gen 6 one, so describe it with the Gen 7 compatible. Its interrupt is
GPIO 66, as on the Gen 6, but the firmware describes it as edge
triggered, active low. Using a level trigger makes the handler fire
continuously while the EC holds the line low, with no event pending.

This provides the EC hotkeys, LEDs and keyboard backlight.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 .../qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
index 26d6d8285e04..05814dc8d905 100644
--- a/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
+++ b/arch/arm64/boot/dts/qcom/mahua-lenovo-thinkpad-t14s-gen7-lcd.dts
@@ -735,6 +735,24 @@ ptn3222_fpr: redriver@4f {
 	};
 };
 
+&i2c9 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	embedded-controller@28 {
+		compatible = "lenovo,thinkpad-t14s-gen7-ec";
+		reg = <0x28>;
+
+		interrupts-extended = <&tlmm 66 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ec_int_n_default>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
 &lpass_vamacro {
 	pinctrl-0 = <&dmic01_default>;
 	pinctrl-names = "default";
@@ -987,6 +1005,12 @@ &tlmm {
 			       <44 4>,  /* TPM */
 			       <139 1>; /* TZ trigger */
 
+	ec_int_n_default: ec-int-n-state {
+		pins = "gpio66";
+		function = "gpio";
+		bias-disable;
+	};
+
 	edp_bl_en: edp-bl-en-state {
 		pins = "gpio18";
 		function = "gpio";

-- 
2.54.0

