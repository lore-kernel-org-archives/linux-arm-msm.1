Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B2B39A4B3
	for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 20:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788036790; cv=none; b=q2zx21GD63UfxZtnUBmTLBUcCA/C6EuaZyg7i3fsLSnDYkE+ps/+ZLtlpnpN+07App9fF8wcycsOEYG+o3gSooXn0uvBsiH+08x5MpXQIcBAxVM5sV6FBVotN6mtJCyQ+oe6e/vCMD4/9DC5fRUYnc70DBJsuZWUjQ7fd86HGso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788036790; c=relaxed/simple;
	bh=pT8Ko0/c4eySlc9+PwI5/4NMBjgQS+yfWqpd40NW6pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IU3eWbpX/WHviYaOo+T2lSERfWb2VshZgfAUlLLj6qBzxbJkK0Ai3MloY9LQeOyBGSaBvivXtphXSlgQrtDD63fOzCuNTB8FqsifCOLYcc7SNEHehYZTly3d25Ifyi+7ZlK1wEGcZWBa+kjQbpHnnbd/5kugjjK3spMt+fT+GVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LpXBkmQo; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LpXBkmQo"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-3a2015bbfceso25947681fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Aug 2026 13:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788036787; x=1788641587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k3Uy0TOuIul9efNHzUpq/ykIN1z+3xgY/HMWCteDfWM=;
        b=LpXBkmQokLfMedkHYLtRsh3n4rwFznM7DpwARevOdjTpF8VLWsGnNiSXv2hWkI5cL9
         635ViI0g5XkPCmmkI3LCCNZmwe7GwwR0PuRRSbOvqjYUKx7egC+iMuTw+RppXlIrrsn9
         c2G+RLmYwrmc8zRMK/irs5KqU++foe4ruEGkwPiqdI2f7HEKrT2OHdttJqDBznJgV3c2
         9IYuUJH3v2BGsbBf9RGL9SwUzcKYv1G+i2355BariXTjJYkrobwt5Ez+blhE9Oj+wJkl
         2Pwq6Wjkqti4wBANnXgVVzwin8VjYbS7bHIwdcgXpVfwsWjgOIVmHEPdmlvMNuMBPhQT
         3JCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788036787; x=1788641587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k3Uy0TOuIul9efNHzUpq/ykIN1z+3xgY/HMWCteDfWM=;
        b=JNtCzIxSbYZEf1l/p1dDwhrealu6XYLNMOG9vnBc5SgEJ4wa6tcR+FgeQklmlldkDM
         7zWD0dFZXynxEa8qI8kHqVtEfnGT1KsMnOB+uJKxVl06g5CgKYtMtXrnH1J6Vaj47b+U
         QirKWB0TYteb1MoyW/UugLOgvkRcU8xMeAcYYruQ9P9DTGlxqz3QwHhX3FnJ+yndTLO6
         YQ4NDJnrgVJXE00V4b2tUtKP6Aund/lfanDp0ZDwusFWgDKPDtUaGSRH1RUwghMLqjw8
         F17U92UsEc11WB9Q6h6PMCbEjzjfJYBZXn9FVzUaP5ky+B1hdm15HmBO8crKuJNqszAf
         fiCQ==
X-Forwarded-Encrypted: i=1; AKwUvByQbfMyZljKG8dlBnVt0PXqxRYY3uSSEG2buIhDlmwb3gtCh7l/QqZjhXvaCs3Iis2R3vLxDcB977vQoFpU@vger.kernel.org
X-Gm-Message-State: AFuF++khY9XT2H3QlDyHClOJbG5/1zJjI+KzmE1/jbi+jwIQaDYTBBFa
	qE+fB6n8/yterbkCwfY72l0fBqEXtVPaZNzOD/xA2ZNPRly3uDg95zGY5qBbFhoHQ2A=
X-Gm-Gg: AYBFou11H140Frc4f00dm9fTfkFKZJf2WD/KDzYFqIzEoWfPh2QpAuLpfqQ4V1PZD8K
	2w1+y8UMp34HYl/qpUXIZvqbed0aNzgSHftT90KGauqIzAogJNhnotNxlrL0TkFftjr+vmb3HOE
	za8GRKGogO1/ZESYQys8p8m+1ifIiHsHnJdu/z9jzXavAMjV6FZ2PkvvCuhklXMnK9sXrM51cmD
	krKQbbqlw4/+9S15jFc7yXYBLM0ZlfChhGfn/nYVcfggr/ouI2KbsZoXSXOw6pt+JyU9Ke0lHJg
	jgWwQf0jt0pGeRk27FiU7AP1VQlZkdJF5Ju/KghWW1a5B6IJLq3/Rs5iTvPBkYK566+X4b0hdxe
	j/BT9Ojki6yLvKYrm4sq/s/Sw8WrGW6FcBOniWoxEoIIItpLopwKTIbqlL8s4NUV6ygFxtr4cMS
	Armtce/aydhSmBfsmvpDzhMSoMVKbeoWordlQL9BRjkb7v7tjEcZ0RQPfInDB9DAbTbReBIMAHx
	Zo/8yGMiY6fOIUIxnrZUhbMHiuPHA==
X-Received: by 2002:a05:6512:1093:b0:5b0:113e:9c77 with SMTP id 2adb3069b0e04-5b5edba4c66mr2026170e87.4.1788036786257;
        Sat, 29 Aug 2026 13:53:06 -0700 (PDT)
Received: from notebook ([93.189.200.242])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b5e8a0f52dsm1192510e87.64.2026.08.29.13.53.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Aug 2026 13:53:05 -0700 (PDT)
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
Subject: [PATCH v2] arm64: dts: qcom: sdm845-oneplus: fix fuel gauge compatible
Date: Sat, 29 Aug 2026 23:52:58 +0300
Message-ID: <20260829205258.26955-1-rinat.muhamedgaliev@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
References: <20260826233818.124278-1-rinat.muhamedgaliev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The fuel gauge at I2C address 0x55 on OnePlus 6T (fajita) reports DeviceType 0x0541, identifying it as a TI bq27541 rather than bq27411.

Binding it as bq27411 selects the wrong register map and produces invalid voltage, state-of-charge, and temperature readings. Use the bq27541 compatible and rename the shared label along with its fajita and enchilada consumers.

Tested on OnePlus 6T (fajita): queried DeviceType directly over I2C, built the DTB, booted it once with fastboot boot, then installed a locally built postmarketOS kernel package. Before the change, readings included about 65 V, over 10000% SOC, and -273.1 C. Afterward, the bq27xxx driver bound as ti,bq27541 and reported 3.835 V, 42% SOC, and 33.3 C.

Fixes: 12dfb002ca01 ("arm64: dts: qcom: sdm845-oneplus-*: add fuel gauge")
Closes: https://gitlab.com/sdm845-mainline/linux/-/issues/36
Signed-off-by: Rinat Muhamedgaliev <rinat.muhamedgaliev@gmail.com>
---
 arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi   | 4 ++--
 arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts | 2 +-
 arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts    | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
index 948a0dd18d13..f3459226bf7b 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
@@ -790,8 +790,8 @@ &i2c10 {
 	status = "okay";
 	clock-frequency = <100000>;
 
-	bq27441_fg: bq27441-battery@55 {
-		compatible = "ti,bq27411";
+	bq27541_fg: fuel-gauge@55 {
+		compatible = "ti,bq27541";
 		status = "okay";
 		reg = <0x55>;
 	};
diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
index 5f01115e2322..21ebd3f67155 100644
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
index 7ffcad24d505..d640b38b53f4 100644
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

