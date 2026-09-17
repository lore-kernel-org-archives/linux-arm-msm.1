Received: from mail-ej2-f20.google.com (mail-ej2-f20.google.com [74.125.228.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7651043231D
	for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 08:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789633551; cv=none; b=tbgXiepNi/g8VysEghzysP0ryeLj8A6Oa2cvZ+TR1AvKrShkDZYrPkpWBAIkkY1SLL46GzuGPNZ9SaqqEPuif55EjhcrDxH6BHbC9Mhr7bLE6mNQ3C2YD0sTIPXcBfLPJlO6qdMtzvj+eV88vvRpordFZXysSWV0/KPNSM7rtjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789633551; c=relaxed/simple;
	bh=tKqz8WaA5fCf8zqxAuhb+KSHy9L2ioB7dBm28PChNnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nrnLZH/dS38cigQuvNnr8X1xjwzwojbj+whDMa616+ghFFhYoLj9PmvsAgBjc08QyuVbNzGX1HjCbBDfbxEWh/vLfjA5lB6Eh1Gjmi/FSH4LXa+6BCHg1oZhrjZXen8rXrrzx1rbXAk0vc6A8ZzVYjv+z812c4HU/+ewUMbM5jM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=IDVJg5Aq; arc=none smtp.client-ip=74.125.228.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="IDVJg5Aq"
Received: by mail-ej2-f20.google.com with SMTP id a640c23a62f3a-c293c683202so87392766b.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Sep 2026 01:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789633529; x=1790238329; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0+EbfIJEQi9Km2o4RWY1Oe967wA79enaext7ctyUJE=;
        b=IDVJg5AqZ5Y8c7H7zSYinlG5tIi5AwD653xe1nqKmyj7tZsrPP9eDHFCoxu5+v78XZ
         z7r//+jXaK1ItG7a4lVzO7wNdC8OvvPBW9rwzaghfbZRGCpL9OTTXT+bcu6z5nLUYjdJ
         yCOwUOpys8DQEkxk8s5PQcVfCbou9UeEz85BbUOsCx864wVz6ta7gT4ZNFL96mTKSDUi
         eRchZgctIDCvFsKTcHyJZdQSHo4jymsw3XwHlA5L29oFrH6slArNj5p73/AN3O3I+QYI
         1HhU7ixTJPSeHDAq8b2G57TiwRcAe+fmO95w8JTMSxTzivHi8kmnrlTAYQHLZU/jDnAy
         dzqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789633529; x=1790238329;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0+EbfIJEQi9Km2o4RWY1Oe967wA79enaext7ctyUJE=;
        b=2i106wtnzAEh0ZUaDNdxcysGOsJZ+/D+Qfg1UH8ch+4+kIgRG+/rhi/xHFg9CzRvsp
         V8nt/bZ5TuEgVLyXpWpk+W4RTiK0WsHIEGxdzgpRF+0g/swg0MyoZYwB9+vUecDslzdk
         2o814ly5W8KcB94768SBj/5EZOjC01weSOkCfeDnft+HdMkiLWV3mqm5a7pgHgkpQ8Fe
         BTcD1MscLU/DX/ZdJEMcP5XkQw4SRCcu17Y/EccdKalFgxW4qVgL2hmbZ081Ik58IWnG
         w8kG1Xg+rvk08fTgdfMYyLPQ2CJA4B8hM+v5UxLUZ5ZuVRaFRfdh35X2fDRkde3eLzPu
         uC2Q==
X-Forwarded-Encrypted: i=1; AKwUvBwXEnbQ9dY8AbeqM5YZkajBfqDHhPl0dy82Du1fjSEaim80PjK/IJr1Qfc7Lc4+Il58oZpFGkjBo4X0Z9X4@vger.kernel.org
X-Gm-Message-State: AFuF++lDc5Ijb48qHFsRxy1jadrm6id6I6VhegaGVYAlTEsHintFYO21
	3QtO0Pi1CCxfWPxZ9wJ6ocSzNp3xs1zd/DrMvks8UBretzR24Ygt0MV3SAF+Ei31IwY=
X-Gm-Gg: AYBFou3ZXmFT8cirLORdFe7UE/f7IQVGJ6LI4DI2trxsdy9J0eNPIVU6y9P9IS8fz8n
	iz08WTguDEFY5FNWK+zdjPPiKNtmLaH/Wf3VBkNvs7pMhp5xh+dEQLiPlr1xy2EqcX0mq3ZPwM5
	mZ167Gc7Is+lqxLdcHB0DkBOPIwH0bBpxSyldLLd1Ua7R7/yPmsdEPtaNXcMoMzAnJjo8ePAaP7
	hL+bMsbrcdxwiW9NWHnS7Ej6r8KcF8frLU3Qih9AQ/ZD6h6gV8fneRRSaXhtFzu004ypdFmV0Me
	k1b331w9qux4w7LIviqPiX6IM8QeLIE3bYIT2easJ05K58HeRGF0PAdC+8gjK22q4KRtYBsLcSR
	unjfimR2IA5CA+egPTRmgKDUVydrXt8ciS+3rQwCbWMYtqhmRU2CI0jz3qlV6BcJimGn0A8ni9l
	PLPPDUR1EFX0Yq5sqwzbHCYR/fGz66MA31P/nPzuUsmjB7wtR9nvBRr0QB2Lw1ZIdL7vYc4LFnb
	d8Nu/I/B6wZQYDT8NQ3WerjBZZK8yBDFGwziMTce15RLHKkxsevn8tRa2iuT5Q=
X-Received: by 2002:a17:907:7205:b0:c29:59ea:5bf9 with SMTP id a640c23a62f3a-c29e52085bamr405665266b.14.1789633529521;
        Thu, 17 Sep 2026 01:25:29 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c29de0851ebsm242943966b.4.2026.09.17.01.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 01:25:29 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Thu, 17 Sep 2026 10:25:25 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260917-eswin-eph8621-v2-3-f534080a6338@fairphone.com>
References: <20260917-eswin-eph8621-v2-0-f534080a6338@fairphone.com>
In-Reply-To: <20260917-eswin-eph8621-v2-0-f534080a6338@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789633524; l=1602;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tKqz8WaA5fCf8zqxAuhb+KSHy9L2ioB7dBm28PChNnM=;
 b=UXnL3U0l+wxPa6dEX/B0T61AEQAmzOv/3SA2eDzB+9GPdURRWB1b9TGmZdmBpcE0PZyPxTwsc
 j0/hz+WM++LBcUzDuhnIkvW3795KB3LK3CwcFy3Zl97BxeSBbPLw6ph
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
pinctrl state for the two GPIOs connected to the touchscreen.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 29 +++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4b7ae87270ac..498fde3d3d18 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -983,7 +983,27 @@ &sdhc_2 {
 };
 
 &spi0 {
-	/* Eswin EPH8621 touchscreen @ 0 */
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "eswin,eph8621";
+		reg = <0>;
+
+		avdd-supply = <&vreg_l22b>;
+		vddio-supply = <&vreg_l9b>;
+
+		interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+
+		spi-max-frequency = <2000000>;
+
+		touchscreen-size-x = <1116>;
+		touchscreen-size-y = <2484>;
+		touchscreen-inverted-x;
+	};
 };
 
 &tlmm {
@@ -991,6 +1011,13 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	touchscreen_default: touchscreen-default-state {
+		pins = "gpio19", "gpio20";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";

-- 
2.55.0

