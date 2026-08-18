Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E27C5449B37
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 09:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787045793; cv=none; b=C3v68Sh1JIFk22Ic3eRZk2sKtI8GdL3wQDRFZbZM6Cc9pwJTDBak2reWKJysmw/xulTSjxs2+mJq45/uMbeEwGAzoiZ/fKRYoExNwszRIxMxKcv7LiMjhZhPGV34/qBPqdf+/TB8bF77e55GunaejJqUDyU+9CfUyo9/Su36XV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787045793; c=relaxed/simple;
	bh=I1KPaqMs78J2sbEkqmymRdi3WswtlK6Wev9mjHLn+Ks=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lYwe2JXOimKAVkWN2vxxiLyiFfIQD1AH5A/h3c+J6ZxtbmPVvRv3bV1oYM2HM3nr6Bd+TYBqhGnW05q9dsC4L6hztYy+uAuRWMXA1MusICA/Gbzb98Hsa84p+MGSznVFt6sRNTrCjxjztahu2q8pUr9DJTw/0kK7OjDtKu1fssg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z82/mSeL; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z82/mSeL"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cf27856f9cso41243095ad.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787045791; x=1787650591; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4bW+u8gDMwvHxBUeD4bI9Mzx2r4/StZ+jS9I2kadzPI=;
        b=Z82/mSeLrvc+hj+cYC8tJnS7FvF/y1csmzqQg3cBTSC/pGqGSmuSFWinwVWceUG3HF
         033WZFiDou0a/AtFrdvi0G4CHuWYTtDwWuF0MDOVL7L/uAOicLwkg/xhoNLiMly1jAvK
         gNccmaAW6MfCz1WtzrHr3qqZ6gJ3xL8lwlMJu6rdQJHijbOE1RGNxrJeo+czhOlIg0/B
         DvEdYdoTr7Pfx0pFJwQ1ipXeTJPHTkTq2AvvCEnn0kx/ysUt0H26OPSdCKNMb9mQrZKK
         vsBpH0WpPkk6fjk6yvfcm5vV6TRTCqGYYLNLgIaUAhwsmNrd3u/qPCV1abj5zpCqG2mz
         9nlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787045791; x=1787650591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4bW+u8gDMwvHxBUeD4bI9Mzx2r4/StZ+jS9I2kadzPI=;
        b=tFRH7QdSxOykuGe05r+9ollAFNNpIGnjFF1e3cU4Mh9ON2Cfi47rY4XktCqCtlWBGt
         +bAECmxc3HXa7xbE3N7RRxsVh/aKvIC8lpJ+okZJmajDeHmZpL/Y30++uPXRSplzgIHV
         cgwV0rKOuXCTK3N9pqaKrW7C5irCwyHk+hSjKAiqpl/ZDZZckJQE/axKajGDKpFVTe5I
         rVoRPAWbcs7AcOfHpCn4fGx4BtNDc4Em22gCS1+5y46ReW7kKgv0jrMFTK+idl7z+cTp
         yW0MrZaf0NY2DkdnPIxgN3kQiJXGWQIxgxtKylWyqNZSbYZ0P+l1DKWDHAnMYKPg4PcY
         zp/w==
X-Gm-Message-State: AOJu0YwPlTpkOTB/Bq59e+0k0I4w/+a55QBb+tElDGeetUrp6mOr8wAT
	OnjfaqzMWUKDXSyHN3/zeN4kRl/AAyyS1UjhnXcj89Eh2F9AYABwq1OM
X-Gm-Gg: AR+sD11TKOiiDyjvPc6EY3msLfQ9dOaJBFMxHXEzWlHb/gSkg2k0MGWM9EsnP7gx2rD
	Xmpw4wBEp5m5xiLSekakqhJ99HEm7PoTaqy8jKyQXt8HTzIsqoUlVBm7/V/Hfxv+y4/3toPcvl6
	+r80kM4wb6eFkjV4Qcn5AbZ197+BmyLaOZoLuNtooWfH98t/TBd7zcMSdNIazrkeWw14dQI3mW5
	8vpkgKDjiJBmVRcQ6OMU9/xPklQgjhBKXgCzuZBxvNMfRLwnOcL3GF1CWjHvDWzZnBXmLqUpGJA
	baNIucQ6vJxlXfpZ0+GY6QtJC/Vh4qLpFJaSkAXltH7xedPKX6cnWwsRAhzi7i85HvgRPTSjLUy
	qZT3159yluxFLfqPPaYNvlzhSGBRH3MyvfXP/579cDCkO/hpmZp2h9iBsaIZ/bCFxZ7aKa0Fsyj
	wWybSxN96YqpGSKXpKI1WdT97b+TrxSp8I9ZKW8GwvlAGKcqFAAELICXroU/Q=
X-Received: by 2002:a17:902:c40f:b0:2cc:9179:32e with SMTP id d9443c01a7336-2d5c4f3df00mr83767745ad.10.1787045791314;
        Tue, 18 Aug 2026 02:36:31 -0700 (PDT)
Received: from thefoxflat ([125.165.209.166])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5bb51e0e5sm15171535ad.32.2026.08.18.02.36.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:36:30 -0700 (PDT)
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
Subject: [PATCH v3 3/3] arm64: dts: qcom: Add notification LED support for Xiaomi Redmi 5A (riva)
Date: Tue, 18 Aug 2026 16:35:49 +0700
Message-ID: <20260818093548.27803-5-imkyufie@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818093548.27803-2-imkyufie@gmail.com>
References: <20260818093548.27803-2-imkyufie@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Reza Kurniawan <imkyufie@gmail.com>
---
 .../boot/dts/qcom/msm8917-xiaomi-riva.dts     | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index a066d9d7a..3f63c2d03 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "msm8917-xiaomi-wingtech.dtsi"
 
 / {
@@ -35,6 +36,28 @@ vibrator {
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
 &blsp1_uart2 {
 	status = "okay";
 };
-- 
2.55.0

