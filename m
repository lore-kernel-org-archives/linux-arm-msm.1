Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438948;
	b=MEc0KWIe1WbkBiI4TBKeAut1bDrcV9S5Y9DDMgkt1yp2z2O4Q3D/kEbYqA6DU1RG2jWG
	 R5nJM7jQvX2CPpd/+zusRmpLYY1pUIje5tZvj32EcQZg/GBgN8XjkHReLORzppeXOkYTx
	 ggd7oLWjclbEbOeIR86IUOkXrqRNh9+7s3ib//WpB7FN5GOIWpn0qdMvLchaiSoYndsww
	 i/MHWRAXujCD/iB8/4jFqYWLvtb0L+E0v0L6hSxatLgBQdoD362uMUQFflEHKT3pt+UzQ
	 mUMnBqAnIu3E0iGu6s8pEDdFLZqEgSX0P7xXnfgN3wR2u9Uw5DvWEWAEZ9gWbCrNJPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438948;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=cKQuTWajHqDgBUzh5m680n1boH4vOLK3j00Iq2JfKIk=;
	b=pxMFG654c0YWero2vgJjjKseC4wnmptSowPyrmaMxJTcFXb51VzWdqB8Z5K5gX1U8fEf
	 4NsRMICWB/+lwkGAWbXUulqXrOtpn2vz3cGqK3u6tj9pKdI6RmFuuMIxobYIIxtD8sAdV
	 ZWAAFDYIMAu50BIxI/llYBV1B52lFnPKwL3AGShwlhdqANcFWTRmxYFcbc3D08ZqeKHXz
	 SPL0ps8uvwuJM0TWC8ROlkHbLfjZK6V8AD1fi1jjMK1fZVME7EVf089JElXmajsTuH4pl
	 xjjYTv3opw25PBKASGzvvhIxc4OADpNB4yS5s/awDr4F8qsu30beuFAW/mgzqYSndrQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+93h+Nj;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E65E606A31E
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 13:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E65E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I+93h+Nj
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c5127c7abd5so517670366b.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Nov 2026 05:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795438946; x=1796043746; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cKQuTWajHqDgBUzh5m680n1boH4vOLK3j00Iq2JfKIk=;
        b=I+93h+NjMVPVj9yGSCa9Yr9/aLoxakDF33sxW0hA4Me2ZHmBigmgD3nvRHdVyy6Czf
         TA/CH/xVRgsZgVksQ6GlXxKXQMyND+oozcSLvV7DsUdVi2By+27y/9qKXG+i+00JbPRH
         2+KHo13vwZdmzbaFnGRiyzihcwP27TD3RrfomFbXAZorz6bUacz43tU99G3ycQ0LAORs
         T60Xd0qBHSzRgz5ln+D3CnLdPNMxPAqcmxpmoswe1W2kkMfVhTW3bEmWuelr475lx/Cd
         SwZybLGNsQNPoVMmgOulEj9ahnKNw9Jy0lOnJOUQ5mE9UAHbofILR8xJYb6M7RFc5kXY
         0THw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795438946; x=1796043746;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cKQuTWajHqDgBUzh5m680n1boH4vOLK3j00Iq2JfKIk=;
        b=C5KqYNREiJgL9/bvqYqqB/OGPTeeYCQyFX8KrKTch2BFZMDRF/6VwtEQ4uYmV126oc
         aa7oHVxHkbjac8vagJnYCLWKcmvt+rLLeo6CoVIXijsgMYmuF/GEdvzcNn3OSso4WQGY
         SmFipEwIOEg61CFeeGGpsSXVYrCLmTv01K2nueta/hlykbDAyb2+Ij/7kwbWlAKpZ3hw
         nGnKeyYDGAOOKt7ARlxn2uCiNG/c9FJ7ayFJKo/Q15dnUiXWxi4VDHIheRklrpDOn92J
         dGRDMAMZVXYY5F79UYjHTxY9vXdBkXnHQt3kFPfP0ADSHR1Y6A66BiUFN2cGZNzzszh1
         FNyQ==
X-Gm-Message-State: APuU4Z9IsvRKEiO+9fngG64NCUWhjKxuurUqlsof8Clq8xAp36Uar38z
	CCjp5OHMD27uA67JfQeeE9IwSzht0d7u1eXCPlwDhwHthTeiv0gsfdX4
X-Gm-Gg: AZFdTZevrLyTTKNWokEC4ZRtYatIzyIRTWBaMhew15bm7k8roEVPAaQ3CHl/jkWS5Z/
	XfKxbqjPkVL/kWu4sDmQV/FZbLFllLVXaQt6F7bCtp7g7WOpn0zbBsr++jZaU9xzROOAQSU9wtG
	d+WVmeVQodNkMvg58us2vihUyZYU3xYyZarGkW31GdHzhmbNsCJ3oT5HUlj8OU2wDVdRTHflVnL
	LRfftQzrxf0xesKPxDpeRjCwTpliKtPmeKpjjx3DCL5TFWZLlGj875+JnlmUCcDFTT6xaq4UvgZ
	SFtisCQciLUL6Yf52bS3L6jU7Rl4/U25+xjQqyspyYBdP3rSU4RKFi6sESCyr6aqt6GKzOPKqai
	WSD+tD/9BTyx7xRDKmFx8pLukHa/myOK0bxdilsr5jFF03uaYEzdokqK6xliKMaiJe2s7ik2kI4
	Ap9BrhN24IQ0CyrtQxz7/0hbKn31pyEI/R6V0uDEHNhlcGcoJZqF1b5BwaOHVDt8G/Djr685CYS
	JPD4IQtBJdBipjoy38peNSoubGAFs7O1hwVFDITkRkgYQ297bkBNPyTz+8tVqzQDnHh5ffc+0GG
	0xXRkNTZTE6WTvlyLeUj3ocRYVJ1WzYn3DxS75H+0gQw
X-Received: by 2002:a17:907:9584:b0:c34:e9fe:82ed with SMTP id a640c23a62f3a-c513a88223amr879508266b.28.1795438945419;
        Mon, 23 Nov 2026 05:02:25 -0800 (PST)
Received: from crispy-cucumber.local ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae688f8sm412660366b.25.2026.11.23.05.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:02:24 -0800 (PST)
From: Erikas Bitovtas <erikas99876@gmail.com>
Date: Mon, 23 Nov 2026 15:02:12 +0200
Subject: [PATCH] arm64: dts: qcom: sm7125-samsung: add fuel gauge
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
Message-Id: <20261123-sm7125-samsung-fuelgauge-v1-1-edcdef00a6ef@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0WOQQqDMBBFryJZd8CxmFSvUlzEcUxTGm0TI4J49
 8YqdPnhzXuzisDechB1tgrPsw12HNLASybooQfDYLu0RZEXErFACE5hUULQLsTBQB/5ZXRMnC4
 VSZ1ThZJEOn977u3yU9+bY4fYPpmm3XcSnj8xNacD+yfr7AhiCpLCWw7mbaFzGrRSlbx2FSNRP
 ePuaXVgoNE5O9XZwMsE57e5aLbtC13hJprjAAAA
X-Change-ID: 20261121-sm7125-samsung-fuelgauge-a57c6a0c916c
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Erikas Bitovtas <erikas99876@gmail.com>
X-Mailer: b4 0.15.2

Samsung Galaxy A52 and A72 use Silicon Mitus SM5714 interface PMIC,
which includes a fuel gauge as one of its features. Enable GPI DMA and
I2C controllers, add battery bindings and enable the interface PMIC fuel
gauge.

Signed-off-by: Erikas Bitovtas <erikas99876@gmail.com>
---
Samsung Galaxy A52 and A72 use Silicon Mitus SM5714 interface PMIC which
includes a fuel gauge to measure battery state of charge. Add device
tree bindings for their lithium-ion 4,500 and 5,000 mAh batteries
respectfully, enable GPI DMA and I2C controllers and enable the SM5714
fuel gauge.

Tested on Samsung Galaxy A72. The driver reports the same SoC and energy
as on Android.

This patch depends on a currently unmerged series for SC7180 GPI DMA:
https://lore.kernel.org/all/20261112-sc7180-gpi-dma-v1-0-2a8eceb49563@gmail.com/
---
 arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts   |  4 +++
 arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts   |  4 +++
 .../arm64/boot/dts/qcom/sm7125-samsung-common.dtsi | 38 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
index ecba5be8164e..cd58f1449290 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a52q.dts
@@ -15,6 +15,10 @@ / {
 	qcom,board-id = <0x22 0x6>;
 };
 
+&battery {
+	charge-full-design-microamp-hours = <4500000>;
+};
+
 &rmtfs_mem {
 	reg = <0x0 0xf4f00000 0x0 0x202000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts b/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
index f18d03de1585..73a1c3b7facc 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-a72q.dts
@@ -15,6 +15,10 @@ / {
 	qcom,board-id = <0x22 0x5>;
 };
 
+&battery {
+	charge-full-design-microamp-hours = <5000000>;
+};
+
 &rmtfs_mem {
 	reg = <0x0 0xf3700000 0x0 0x202000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
index 59ef4921f31e..5d854a76bb21 100644
--- a/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm7125-samsung-common.dtsi
@@ -22,6 +22,11 @@ / {
 
 	qcom,msm-id = <QCOM_ID_SM7125 0x0>;
 
+	battery: battery {
+		compatible = "simple-battery";
+		device-chemistry = "lithium-ion";
+	};
+
 	chosen {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -379,6 +384,25 @@ &dispcc {
 	status = "disabled";
 };
 
+&gpi_dma0 {
+	status = "okay";
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+
+	fuel-gauge@71 {
+		compatible = "siliconmitus,sm5714-fuel-gauge";
+		reg = <0x71>;
+
+		monitored-battery = <&battery>;
+	};
+};
+
 &pm6150l_gpios {
 	key_vol_up_default: key-vol-up-default-state {
 		pins = "gpio8";
@@ -421,6 +445,20 @@ &qfprom {
 	vcc-supply = <&vreg_l11a_1p8>;
 };
 
+/* External pull-up */
+&qup_i2c4_default {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &sdhc_2 {
 	vmmc-supply = <&vreg_l9c_2p95>;
 	vqmmc-supply = <&vreg_l6c_3p0>;

---
base-commit: 2c0da72bad5631bda9c70dcfbe3497a0ebd9f936
change-id: 20261121-sm7125-samsung-fuelgauge-a57c6a0c916c
prerequisite-change-id: 20261111-sc7180-gpi-dma-a77963d9e1cc:v1
prerequisite-patch-id: 70dc64e33232cae6744eeb11e8f53e099eb49c1f
prerequisite-patch-id: 1ba00e1d0ffd80fa49f64e8b627ab07ce9478e74

Best regards,
--  
Erikas Bitovtas <erikas99876@gmail.com>

