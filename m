Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2835941930F
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 11:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787223859; cv=none; b=s857ag7ER5y68Z47SCRMlgZL8QjZhWBJUAuRuN/SeT4Eda+ZlHzhVSXpX+QDDCGx/uzzG9gyU8+GIDLuHC0dqV8TWWQH5Y+de2PeayayHPpitTU3uykWqC9QaInBJLuHCWcXtxw1NhslN0uRiVc/Nssm/4bDtQ2xpNjuey5dM/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787223859; c=relaxed/simple;
	bh=07zJek12zGtd4CLu847sOJ6nk7YwbaD9zP8Alz31hhY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oHfYg72o/LQQCuEJifvRf3DM9JBTmuXx1GZg/sVtR1xppVGcMBGoE1/7iPTiAkM1Xbg6Vn+AHMTVijlg2eMJLpYC7JY3RXPhA6NJ+NarjnG23F8nMOHkeOcQ7gaMgn+0WBGHpFKawuHQxst7scaMvL2XXl8gjvmiYftd1KmXxDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J77rqAv8; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J77rqAv8"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-39266382df6so1539570a91.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Aug 2026 04:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787223854; x=1787828654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mkXxwlrpsmhjssCMZQzBcBPG5hO7oiW1VIf9dPISCWc=;
        b=J77rqAv8jYVEHKsueiRep8d+HPwRj/JDb0H+7VZtM5vsnoxeY6Y6TYPnpE0sxw5oro
         CSSJnSlOTv0xRbVTUb5k4zNupGoSpQnraITGW2sDT/QZrq2FUvDqlPEx5ePddnRXZCOp
         o/T1qHrCHyWP6SMsGymLRvVXaQvnkx5fnasCc7Pfutlaokm58sD7ltl05olPbIfR2FEH
         hvYV7x3+ukU2OyznaxrRMoEd2YbC7qSg85ejZFRj2hkP5f/ujHzWGoFRuB5PVjEFJanW
         k4rjpQS9LjJS3ZihoEkXsGD7Es33L/R7D5GxO47MKVl0BYJWk6VMRKfJDGT8sVvkSght
         mhNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787223854; x=1787828654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mkXxwlrpsmhjssCMZQzBcBPG5hO7oiW1VIf9dPISCWc=;
        b=TSzkFroN4ye1d8F9vrU+aeNzTUiMxOQO+TV0V71FEliDbIlWTIGjWjLvXp553W5U49
         OCWviS+WSjK1Zguf+m+LHn98b6p1Xr/UmRf1OEgr/JAt0FEwv9I/zVtcSMWWVgPggsMk
         etntOyX64eRKcJ6NJNAXeoqPJi2t6QYLaqPGZEDdq2Jwl/xEaMr55ygWkQA6j2s8PtAa
         mVqRhAynwwXktVK0mLKIdSmFe1lmI2O1ORR/2Hq0ENwbqbh/pkAouKH+11rHhUv8abO6
         owY8MF60uF9xHF4VtiMC8ekLcNDriufvj0QoY1YNV/zikx5aZI0d4bBlGZ7qlHPfwvbO
         aReA==
X-Gm-Message-State: AFuF++lsFNV+4El8Q0u8SzOX+d+pCque2eGN0DvneUaGtuly3SN89ut6
	4PaqA2HdaMtY5snqWCR3p47zwzTLpVcXFgmqVrz6flsV98jy2yKWsu6g
X-Gm-Gg: AR+sD11NnBY8gQKm87cP16D6uUoeZCkd7j6Y5edK50wVAiGiWaXapIQhTdQNRQwgHRw
	0PDWUTwNQtkZ36eThD62HEVcwnzi8kqC8RMT44e1+qr8hUNlDfXtsYtvrt217cBGfjIJ0jHY8n6
	eV/lge3OCyUVPxWu814ymlU3nwScqnuhwMLFduw8KKxgQ1i5WXgFrg8JsSPKeK6OMMJGvt1NrKp
	UGqIT1FXd1fGXtBKASShrATddhRtGhSLd4g8Hvj72zRvYCl0yAZqSqlWDIJC4csTRqM5YX/Ypu0
	JH2SI8Z864s7teCsU49T/tzg7ON63RP7wbV5iBWg47Rdnj+lMd7unYvxv3NjhrkrlKBsgGEkjRP
	LTuSjVKHGnRxhkz84phKpQFUXT3wNXgwBG/R4enJMpjNksLn8T7Vp/lJjSK9/96Dm1p8RfRlyG3
	p9Yro0GxutQGuomO93MsuZgdSKHPg5NULeX5ZpsHxxAwk6HsMTRdhj0slqhKhtaw==
X-Received: by 2002:a17:90b:5624:b0:38e:e9b:ffa4 with SMTP id 98e67ed59e1d1-39580a7c3dbmr23921881a91.6.1787223853734;
        Thu, 20 Aug 2026 04:04:13 -0700 (PDT)
Received: from thefoxflat ([2404:c0:7015:a156:d857:47e6:8c8a:886f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3957fb12145sm6200668a91.4.2026.08.20.04.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 04:04:13 -0700 (PDT)
From: Reza Kurniawan <imkyufie@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Reza Kurniawan <imkyufie@gmail.com>
Subject: [PATCH v4 3/3] arm64: dts: qcom: msm8917-xiaomi-riva: Add notification LED support
Date: Thu, 20 Aug 2026 18:03:47 +0700
Message-ID: <20260820110347.98068-4-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820110347.98068-1-imkyufie@gmail.com>
References: <20260820110347.98068-1-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the aw2013 led-controller node for controlling the notification LED.
Since it communicates through I2C, also enable the blsp1_i2c2 node.

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
v4:
- Simplify commit title
- Add commit description
- Drop redundant status propery in LED node

 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index a066d9d7a..7c323214a 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "msm8917-xiaomi-wingtech.dtsi"
 
 / {
@@ -35,6 +36,26 @@ vibrator {
 	};
 };
 
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
+		led@0 {
+			reg = <0>;
+			led-max-microamp = <5000>;
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+		};
+	};
+};
+
 &blsp1_uart2 {
 	status = "okay";
 };
-- 
2.55.0

