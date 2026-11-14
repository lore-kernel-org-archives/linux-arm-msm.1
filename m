Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794675145;
	b=XRm3QgJf/1p7Kdu6y1l0taxb70cs3jFayUF8I96xBzjqG+WypYWDsoxWwsVD49IGUvJo
	 peB6L6M7773LKO+Ll+X76x6gTi5HIRJbhKw89jBbsiFznOun37vgJUHEA1aNX0NU1LAp4
	 ARyET80ucGo9GzCMVXzE71c7IspaTRxY8dTOgiu/tJzB5emqKPctcAamgu85vGKg4h8U3
	 FMYcV7MST3Wh5BI1S4XK3S7QaVwK3XQygmoBiujkO5lIlcOR7CesTcrSJNLZAyAapOgj6
	 TyEszO6G9hVBINk4gVJ7lUuYs2gM/LOBfV9oDmKeDo98fIpzJZby9WOJASoO2WSp+Qw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794675145;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xQ/h2xJmHfHF1kr2P2KfFjzjewHnVPr88Pq0nhSFTMg=;
	b=OGmr88X9wCYuoNwYHeQf1WnEa0Vu1gAlOJQ89wqydMDh6958pcgJAMZ+niVu1E2R+36j
	 Ue6Ipsazfn1BEtnzMRsTrK5zKxuix00oZDVbLmGcBgYKACaM2j5XaHpBUS+mVkJp6xmP1
	 98PamYtzhx6jzzyqS1SQuad2QUftuYVHKi5z6AvB5GUw7YlnjnvUEaeJ1uJhS5kk2w4oi
	 9PhYxc+7KTbhsT6AHFppoh9IxttMED5HW4Sfg/a63kQUp/iqx1Z/s45SC0TSF0xyDaT8A
	 B2LPHP0G/9k2kMFAnY+ArzgldLgMd1sbohgte1bk18Mwo+Y2PWi22QEEvy62wNfdQiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Tdr/SSph";
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FCC606A327
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 16:52:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1FCC606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tdr/SSph
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5363c8de563so31237611cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Nov 2026 08:52:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675144; x=1795279944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xQ/h2xJmHfHF1kr2P2KfFjzjewHnVPr88Pq0nhSFTMg=;
        b=Tdr/SSph4bL3uPoPNTAiRt39kpSkq3axC8GHbRy/sVm6783VsM9QjvdkO9U9lx9p33
         j7ABSqraFUxV01ofQfM/5QnuGJucaLcpnxSGJM9mNsjFXPtDL+nyIRhDKs2Y/+8K4wE7
         n6lAuwc9tcMJZ3PUA/r0r/bq585EO1qnbROUv+BQI9QI8FvlAo1ouSD25tJCV3lQwqch
         dHYnmv1luoRdERcx3e9zuaUv1p8yrluWRDZTYpLh6s3wDULEGPscFl7KdXMjQtN3eUsx
         z36ceq5+TBEpDr6TTmVWs263cCOEOyiqw7tslymuppTTTe3uCb8vt7umurRZ5q6DnJB4
         rVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675144; x=1795279944;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xQ/h2xJmHfHF1kr2P2KfFjzjewHnVPr88Pq0nhSFTMg=;
        b=cUkAgXlDCe3sgXA1ak+/jc9yVa5RD0PWnIWxy3cvMMF0HK8+fr0q828GNHm9P9I1lM
         DkoHpURKS+TK5ZxYC042Ar9QcAGqNLmR5+ev4YjS08S86JCJxfZqPodlOF+eJB9J7ArE
         rv2jv9gntEaN0CWGibC12W3vtW5etoLhnYyQXyEi2CiRw5H/+hOgCT+2RG102qYy/Wk6
         P6NZEG5uOKAAJn1y7IKH5m5LKaLO67hEcJ5OXf8aWhlnIiV2TpkBUHnD2Kxf0hifF6X6
         ujmS4w82hI6jGrlmY0wtxxmy/RQjYeAz7hIPVDisH3cZzY4DnOe631z1e3B48uMUK6BG
         t6fQ==
X-Forwarded-Encrypted: i=1; AL+hErFkFhElYB2QAJ1LmVNjxQ8FoPCGOWUam1RB8t66NDE3zirs5Ks8HAaoUlXHeNpnxHq8vCI639M8RZnTXRKa@vger.kernel.org
X-Gm-Message-State: APuU4Z+UdcLObt60i+2ZWXYBwpjHLvWnjjdUMQFpb5p0qv6jdiiwN14j
	pqnUyr2XQlPDgnSNeYdTLtkBj2qrnzvOjFcwP/0md9AwbCgTSw68n7Mo
X-Gm-Gg: AYBFou3YhWYZsiKVNHev6QVWJ1cO+8v+CLAhXX6F/RS7SoalNea/2xdDF2Sp1Pj5qmM
	Dw1pxI/I7EBxLBciPYSXlXr/kQ10z9MryLJc1fqreemWsufvrxdBsZr4vC1f3XnZdMemRCO41+3
	MXbSJeb5/Pc7z/QAFjes9tVkj/lcpPdfugOJlHqLLGBSKWhiP8Y5LfmzTf/jIms2W4lbW2TCU1g
	nN83KOMH6FjYOw/E3lYx2aiJAuzO9wUqS/VBRsJlNiB/PAqD6XDJQK//rNk4OGVmVdSC+Uteybr
	M0J6IFcANU4nVw75VSoGGELaSY9+Db4h0J+4BpDWA8j4uZcz8p96X+e8BwV0NG9cZKZ6w1bozxc
	ikxpAbu6KPc4SWe9ryoEfrPGJSLRO4Yp+hhc3yVfFP+Y8vCDVdzq7mAXX66kSanrjNJlmzCegmx
	0Yr5b9H32gFW9yO2hvm64JzW+JmrNEeF6WmR8yBhzXqYbpYX/+y7MwJDS2Tcq9TC/3B31aNq3z9
	Anv3/mnt82c/bTNp+7R5qqb6Tn5X7Q5OcvlpwUKU9GebRgTwTfGZd10eXBAAw1/+poDZ9wHENVU
	Z+V2I92zWNeVRJKZm156BSByKMYe1wtRv2Y88IcS/tAdZIp54ebVG3zExEqVbYEDsH6ywU0963H
	G9x0z2AnUOMHbmZNH9RcC5PzJnOAPqn4yzTul6ZvEssC+TlHB18UWa54rIV2lAUzXJy3xkalr1j
	/WYIU+fOnFrlaof/5ZCxvAC8Eah4AzX3hn8JUlLQ80v9ll+dgzSmh1JzffRGS9Fun5lppXFvbI2
	apazrm69dXsxYB2VAqlELG2fZoR1sINWmhc4RNAca1phA==
X-Received: by 2002:a05:622a:1ba1:b0:533:3868:1f6d with SMTP id d75a77b69052e-55ac8b998b7mr99136571cf.59.1794675143733;
        Sat, 14 Nov 2026 08:52:23 -0800 (PST)
Received: from LRMS.tailf8556c.ts.net ([2600:4041:5024:4b00:7961:9008:8b93:d491])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d2df66cb7sm2635421cf.21.2026.11.14.08.52.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Nov 2026 08:52:22 -0800 (PST)
From: Jesse Casco <jesse.casco@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [RFC PATCH] arm64: dts: qcom: glymur-asus-zenbook-a16: Describe BOB1 and the IR emitter
Date: Sat, 14 Nov 2026 11:52:21 -0500
Message-ID: <20261114165221.70310-1-jesse.casco@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PMH0101 BOB1 feeds the PM8010 camera LDOs and the PMH0101 flash module.
Describe it, and wire the IR illuminator: flash channels 1 and 4 ganged,
350 mA torch, 700 mA flash, attached to the HM1092 via flash-leds.

Values:
- channels 1+4, 350 mA torch, 700 mA flash, 1280 ms timeout: Windows
  LEDFLASH configuration (FlashLED_1)
- BOB1 3.384-3.512 V: within the AOP OTP limits for B1B_E0
  (3.296-3.520 V); BOB2 is not populated

Signed-off-by: Jesse Casco <jesse.casco@gmail.com>
---
Konrad, this goes on top of your A16 PM8010 and IR camera commits in
qcom-laptops; feel free to fold it in. Tested on a 7.3 kernel with the
same DT: ir:flash probes with no faults and lights the HM1092 scene.

 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 29 +++++++++++++++++--
 1 file changed, 27 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
index c2ecabb3..75018ccc 100644
--- a/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
+++ b/arch/arm64/boot/dts/qcom/glymur-asus-zenbook-a16-ux3607oa.dts
@@ -379,6 +379,17 @@
 		compatible = "qcom,pmh0101-rpmh-regulators";
 		qcom,pmic-id = "B_E0";
 
+		vdd-l6-l7-supply = <&vreg_bob1_e0>;
+		vdd-l8-l9-supply = <&vreg_bob1_e0>;
+
+		/* B2B_E0 (BOB2) is not populated on this board */
+		vreg_bob1_e0: bob1 {
+			regulator-name = "vreg_bob1_e0";
+			regulator-min-microvolt = <3384000>;
+			regulator-max-microvolt = <3512000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+		};
+
 		vreg_l1b_e0: ldo1 {
 			regulator-name = "vreg_l1b_e0";
 			regulator-min-microvolt = <1800000>;
@@ -624,6 +635,7 @@
 
 		reset-gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
 
+		flash-leds = <&ir_led>;
 		leds = <&privacy_led>;
 		led-names = "privacy";
 
@@ -751,10 +763,10 @@
 
 		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
 
-		// vdd-l3-l4-supply = <&vreg_bob>;
+		vdd-l3-l4-supply = <&vreg_bob1_e0>;
 		// vdd-l5-supply = <&vreg_bob>;
 		// vdd-l6-supply = <&vreg_bob>;
-		// vdd-l7-supply = <&vreg_bob>;
+		vdd-l7-supply = <&vreg_bob1_e0>;
 
 		gpio-controller;
 		#gpio-cells = <2>;
@@ -1037,6 +1049,19 @@
 	wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
 };
 
+&pmh0101_flash {
+	status = "okay";
+
+	ir_led: led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_IR>;
+		led-sources = <1>, <4>;
+		led-max-microamp = <350000>;
+		flash-max-microamp = <700000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &pmh0101_gpios {
 	nvme_reg_en: nvme-reg-en-state {
 		pins = "gpio14";

base-commit: 2010e0d9557fe1d37d04f13e539adf24cbb785f6
-- 
2.56.0

