Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F033644CA
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Aug 2026 06:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786343214; cv=none; b=lU1K8YCSvvB3vsUopBzsgQ7+KoOQjfHaHDTweICUvwYCYpjPAU4x3oHzjP8or6xrRwKj6pA3jODOIAqL4aKjs3kDYIB7gEsK+mCRw0BbWH6dhXTGUwXvM/znL47fGnNmK7FSbuGzi0N46wmxQJVqO33l7OvlGV5hYH+MSJmeBgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786343214; c=relaxed/simple;
	bh=kRrtrrpvePVbIOrdQv/XCZUG1O7W4sPdKWhYuBPfgDA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dlox5WPFx2mh+L5DeF5QvN339e82SlsfTRORZsLpZbONhGJJYpM1lV2AdaibuAQWqZB/19yxsHc+kiJOzsMR6+yzJkpRvdLOIO5VEtILsCqvlYqIlMAx2ZUKJx9VIosIlbBrvpU/jNMJTUw8u5C/lrqxAHBJ9Im3y0Gb+0uyOZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HwtJ8JoL; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HwtJ8JoL"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-38d489b6b71so1273628a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Aug 2026 23:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786343213; x=1786948013; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XW7zVNksQuGLw3m1ipcozoM64brr/gJX+tqNumdacU=;
        b=HwtJ8JoLyynZH7K3lmtYpM68O9lFG0bgZnsC9sFdMlYMSLE0BBofyB96MJsT+bVKal
         Zy3KAMJdkKWEPiaDsK0peKUh5c8vpteB3IxKBLf/Bvt8L0uSHYeehtY/IJthMOv1+eWk
         zNudrnzc20JZPJ9qUW7HE8snTNtQGlSF3fH8oxtfLnics9Ksh5wZYp5RXQI/tSYtL95H
         V3WtUDo46KCDOXhVbkKAYomc2J2x8egUYTygqp6Y3B2XxCFhfbHhxNoa4wEr+u/LD/x8
         6SIo8Kq2Br92uTekGcrYP2t8TrDv2ySHNsDls0CHWltfRw8mtIiLYMIpnMQyyyPTaRBb
         ALHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786343213; x=1786948013;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XW7zVNksQuGLw3m1ipcozoM64brr/gJX+tqNumdacU=;
        b=gkHi4ham6jjAhWpftl6kUfz7em8Bu+3fLGBWxIkn2MVEh0Hvi9bwXh7XlVPsqNDoMJ
         /a4wcHY3J+YtSRfticYx91ZU9xyUH+dbj8XjdauYMI5ZQDaZ3z8WQRA3NWT9jF8jmGIt
         mR2Pz6DC8GaiwBOQUQ8OPA7pn6x5vVojPSk6nr2AE6ojUs2IQ8e5Yl9ugaV5DkVTdEV1
         E4UX75NNr/EEWa/da+RD4sQG9xpfGOyYRLYEky0V+Lv0ExRzSDqAGnDqPNu5I7UkzfZr
         Jt1BXIBNyfz5cGSOZGz0W8uE+a2nXQ/3/OaeGqXNdNCuIlRYti4uEWIBpccqInuPtq+C
         xqAA==
X-Gm-Message-State: AOJu0YyzRG+DO6HvTVron8YrqhXQcMutkbbCIAtnMwKT+1fWlTGgqmP0
	Xpdi7eU2BV1GlSHOjrdGizvBHBe2cnpnJRhDiyfHuQyVGd0Vs/btd8qm
X-Gm-Gg: AR+sD10Ay1aHYBJ5c1X+zmEluOKTS/S6JQfzoDpL6KYhLihzh+1H2TUcKj4wO20HehF
	my6VS7H8V2nXch7v/E25Mw9A6Pp7Wg0KHZx8G5xfdxbIqGmmysYvtWaJupK2Gt/MPClRCjS09iF
	nWe8gDrxIWPgZo4wsQHTpIg7t9GMWoUs9zyAJuYso8VGwPVEcfRxlaHdRpz0dyKqyJ7wGJ/ePE7
	j9xKJu/HYAABq3utwqI/48FCkNHAFu9XuJGTWwc2QGeWtk8sqzXaKAqNoWshJfTsw0uuBnkTKoa
	1zJDX+aNe0KiGQl8uOBfyIy+3dLq5LbIzbxjZ52SyfcvD08pwpbAdIj6+SEoO7KZgQar3drPoWg
	v/kNVYwrb9cIuDX3Eu1T0tY5g2Wp8Bq1usxp0pCGVSFJWi0eQzjI3O8w8KOg8cOqteBJq7G/95k
	nVpNyw8cNXfeEIe1uXebM7BcKsOLZmb4x7CdYNM6GvfMKqx9/zKtm1EMgmtTCP
X-Received: by 2002:a17:90b:1808:b0:38d:e658:5959 with SMTP id 98e67ed59e1d1-3903c545edamr36471872a91.5.1786343213083;
        Sun, 09 Aug 2026 23:26:53 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7028:5cc2:3516:bc05:bd3c:bdb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3925fa4fc7fsm11138390a91.0.2026.08.09.23.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 23:26:52 -0700 (PDT)
From: kyufie <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kyufie <imkyufie@gmail.com>
Subject: [PATCH] arm64: dts: qcom: Add notification LED, vibrator, and UART support for Xiaomi Redmi 5A (riva)
Date: Mon, 10 Aug 2026 13:26:12 +0700
Message-ID: <20260810062611.735673-2-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for:
- Controlling the notification LED.
- Controlling the haptic vibrator.
- Communicating through serial port exposed as test points at the front and
  rear side of the phone's PCB.

Signed-off-by: kyufie <imkyufie@gmail.com>
---
 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 4ea4fbdb5..e74433f89 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "msm8917-xiaomi-wingtech.dtsi"
 
 / {
@@ -13,6 +14,10 @@ / {
 
 	qcom,board-id = <0x1000b 1>, <0x1000b 2>;
 
+	chosen {
+		stdout-path = &blsp1_uart2;
+	};
+
 	battery: battery {
 		compatible = "simple-battery";
 		charge-full-design-microamp-hours = <3000000>;
@@ -23,6 +28,37 @@ battery: battery {
 		charge-term-current-microamp = <60000>;
 		voltage-min-design-microvolt = <3400000>;
 	};
+
+	vibrator {
+		compatible = "gpio-vibrator";
+		enable-gpios = <&tlmm 97 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&blsp1_i2c2 {
+	status = "okay";
+
+	led-controller@45 {
+		compatible = "awinic,aw2013";
+		reg = <0x45>;
+		vcc-supply = <&pm8937_l10>;
+		vio-supply = <&pm8937_l5>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		status = "okay";
+
+		led@0 {
+			reg = <0>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+		};
+	};
+};
+
+&blsp1_uart2 {
+	status = "okay";
 };
 
 &blsp2_i2c1 {

base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
-- 
2.55.0

