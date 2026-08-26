Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C18D3A963E
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 23:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787787512; cv=none; b=FqyZWXzEaN4imoBys+Lk4EDINgWEdf7IyifLEBXQaFJuFfy3dPvhTj07E06rTYQEzBp08vT11KJj6u5OEQY85s7HfTrzj+oGMYkvWQkVYUNljA6LaYksmp4Fc6s+/s8HeTVSSyFunwviC/l7LXPhr27o3o8c6INiZJP0ca8nH/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787787512; c=relaxed/simple;
	bh=Ks97iZYDefkxuuXZdEEEwMFqACfSJ7anPx9rAcG522s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E+xj8LvMn+FM+a0C+QlvXohBIDb7TN6XR2334/fLbrDxGETJLkhEJLwU048lGNZqNtwtxoavhtUhwagkTpTmH7Ky/jrh62acyLXIhXaAT01RMJ+PIIGjZH/taJPNrW7rhffcTI07yaqxI1hLqvjCrc74p/7DFPqz/e6TP4g9EqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aMbd5GS6; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aMbd5GS6"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aeb98460c6so1716833e87.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 16:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787787509; x=1788392309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pn5cuibYSV1eGH20SoQ75z6FLNMGEndFYPOvwFpT6w4=;
        b=aMbd5GS6znl027MTkpR9BsaCElgxZNisqvUwdWkAk8orLyOkJPsuVciMP70Bx2c453
         +AihopAuglpwsX4wIZybx5IhND+we58KYClYTBV9zNrSBn+BF04V/BpUS/kU66SQtah9
         eLvNC3AJ0kIYRxTSeGNPd6L+BzXCeXxl2krlbxfz04AR2p6/hwW69CJ2ayWg2oWW+uH7
         6lW2WTbkDdjD2pDJyJMfih/JVaaSpOcHK2Bs1oljN1Oh1hYplOyphHkL2++4ogp11O9k
         OKkSkvOLL/xRNGJGBnVwS7XWrhGSYqgHstHrhwvP/5HaWjmfwLje0Aa6EjxP9ngEctEV
         BK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787787509; x=1788392309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pn5cuibYSV1eGH20SoQ75z6FLNMGEndFYPOvwFpT6w4=;
        b=WTRTJXiVvrmQNIwhB/xUFl6y0Z8GrsfMEDSzaHlVS8pugQ/IPje/GqbDQlS9Mt6bz3
         Z/w7Aky/c3NgZ53oz+g4il90Zuzuo7p38eejuSEQxG0npM9nSXbwCPigp6cumjgR0XAG
         kOIMmZYxOMdBwX/6hBKHHQZa71kRF0xqeKKYM1W2tAE13O/z3po777ilYAjj19T0R/h+
         tISW1UhOaZm3zdK4XlnLdG6bKkwCEtwDpijfK+xIF+2AAqhNrNKWOSd/ynkRWkzq6xEC
         s8KMdAMWCCMXs3m+rJ6bBMIjN+hEJ4U8nbu1vW0uDQIwVAYqsW15vHvLNFFeNZ0GDxfm
         YgUA==
X-Forwarded-Encrypted: i=1; AHgh+Rqw2npYBt/NPA0HFR6c2SK3qXjJxNFkObxVOX5zrNBSkRLArQcKTrAO798uOS1Ojc4H3LybKv8rfXrjGhhu@vger.kernel.org
X-Gm-Message-State: AFuF++mZcNxOpxUNpYFdZbcpu38ton42i9tPzLjwRc/5YXYE9kUzG4kG
	jKyFk8mpgGJsTOe5LkPae3D0XLIO0OeHHEvzqaFtw1krPviN0EC6vExK
X-Gm-Gg: AR+sD126Azkai7hiCydZgMNS0XyQMzbgX76wtvuQyP539xJYa/TmoAJiC7IkXIv8Cyx
	6k4X2lSikJ/yYAB+r9hGAb5ucAfz0QtkdSohpv1ElAl3fZyrPUVkpX00BI2nRtVrxwNmdEXQBaK
	Nb7fz8ihhXbz4eClYP9ZTdlk+QjPihtxIHVbR2WI/IB1L5NyRVVWebCCm/2UmIrZownmMBQEkg2
	mBt2abV3ksef4avocYBtX729bC3AeRn6bWajT6B8Q+LaW9Rn2aglv10xk4R/McHLAC9qXr3RWiE
	aFBPKEpK4be/pfqS+poDRFEoCl6pZDthtOBuUsg2LkiJGFNz/33DrMukAfMZ8g4Gn29jyOalchf
	nxr9ub6YMkVo6NCX1OOcknGPEuSmp+RRIEQmqsFfT0IXY1I7F4C8kOv9X/30ocqCOwSUSunmDSD
	LPVs+9YMhChDrfXr73SMm1NAU1OZCQcJWIe2vLtJEVpiJRAHiFsdKGLiEoGYsFgP8cpoa1qo+mb
	KvUT1EafvgljcFvoZpzM7jBMEw2VtQHfdOdssOJ
X-Received: by 2002:a05:6512:3b83:b0:5b4:74ca:b5c4 with SMTP id 2adb3069b0e04-5b4a909b296mr3384719e87.17.1787787508779;
        Wed, 26 Aug 2026 16:38:28 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4a41ae602sm873550e87.56.2026.08.26.16.38.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 16:38:28 -0700 (PDT)
From: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb Connolly <caleb@connolly.tech>,
	Frederic Laing <dev@fredfunk.tech>,
	Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
Subject: [PATCH] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge compatible
Date: Thu, 27 Aug 2026 02:38:18 +0300
Message-ID: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fuel gauge at I2C address 0x55 on OnePlus 6T (fajita) reports
DeviceType 0x0541, identifying it as a TI bq27541 rather than bq27411.

Binding it as bq27411 selects the wrong register map and produces
invalid voltage, state-of-charge, and temperature readings. Use the
bq27541 compatible and rename the shared label along with its fajita
and enchilada consumers.

Tested on OnePlus 6T (fajita): queried DeviceType directly over I2C,
built the DTB, booted it once with fastboot boot, then installed a
locally built postmarketOS kernel package. Before the change, readings
included about 65 V, over 10000% SOC, and -273.1 C. Afterward, the
bq27xxx driver bound as ti,bq27541 and reported 3.835 V, 42% SOC, and
33.3 C.

Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge")
Closes: https://gitlab.com/sdm845-mainline/linux/-/issues/36
Link: https://gitlab.com/sdm845-mainline/linux/-/merge_requests/148
Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 948a0dd18..0c6203fa8 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -790,8 +790,8 @@ &i2c10 {
 	status = "okay";
 	clock-frequency = <100000>;
 
-	bq27441_fg: bq27441-battery@55 {
-		compatible = "ti,bq27411";
+	bq27541_fg: bq27541-battery@55 {
+		compatible = "ti,bq27541";
 		status = "okay";
 		reg = <0x55>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 5f01115e2..21ebd3f67 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
@@ -44,7 +44,7 @@ main_cam_ois: main-cam-ois-regulator {
 	};
 };
 
-&bq27441_fg {
+&bq27541_fg {
 	monitored-battery = <&battery>;
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
index 7ffcad24d..d640b38b5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
@@ -67,7 +67,7 @@ tfa9894_codec: tfa9894@34 {
 
 };
 
-&bq27441_fg {
+&bq27541_fg {
 	monitored-battery = <&battery>;
 };
 
-- 
2.55.0
