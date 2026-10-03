Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF58480DCD
	for <linux-arm-msm@vger.kernel.org>; Sat,  3 Oct 2026 17:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791050243; cv=none; b=stjxiyo++xzVs4VC76HLxH1wUIOZeEdBW9N6GxF2XqNTC3SEYiAtx3w8xkB0UteTUuQcNhNPuIR2M+bqkYDZDm3s72jtNnCdVvo99UZpFMI+rW/xSDJ1O5P1bp6RUzlGBH2kxBTNbfcDuLP7t6sqoJMNf99M4PGxF6uDm3yqK/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791050243; c=relaxed/simple;
	bh=IQlRCrETdBn/BAo4H0K+2Ac3sqanbcBO44Zjth/gkGc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cl6eotLYRe4LiYH3PQGd7pdkZn2nTPDkIvzrqMPLKV1dejlznyqA/WKbiTDy6qKLtnYdqu2GWDefaeoCtLLPu3/TptGPUoEO785nFJc3r2U6oXVHaj+i6g8vDvzvrI7ZpG47r9lUp6UthFt2S90P3c9GuWEkAk5Dg3uM7Q6vgdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NEhVOQGK; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NEhVOQGK"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5350c1b9e0dso9043341cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 03 Oct 2026 10:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791050240; x=1791655040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DCCcc/dLpfGUswu/y89g+4jPFylgT6A9lORmRIhA/RQ=;
        b=NEhVOQGK4NL/UWYO/U2oOwlMwjn9bi5lKQX98gOP/OsKV5VLDn9hU/RsmAGPwO8nMO
         rMOAwBey4s4jhWr1/eKjzMe72S7y9B8cYHUcWhASYDH5GKaNNM5xuN7ILbprtxmoytJG
         uEWUlkhToz/vconQeZ/t87NEAFOTbOfhIzswRHFXl84PjDniXpPlB644gr2BbsAoMEa/
         t0vlIRKyvh+DJZbfNLnLSttYSh7wEZaeyBkz8LGmgousKG/fWSYEh/GROjFX6D+Kk0rA
         XVkS3CLziFtVSZX+4a8kwHiqa0dFQVMfZkG3fYFanPy8C08KaWyvgedFbpSHn861hZc8
         pPXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791050240; x=1791655040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DCCcc/dLpfGUswu/y89g+4jPFylgT6A9lORmRIhA/RQ=;
        b=Y5tXmeMZ5keihcLYyAmJ5G33AWh+Y8ippvkeRn01HISduKHJcUaUbHfvA0pVOue/jf
         Wv0QqvQRU8q4t/Fi9jmpcaygB4p0AvQdd0vSKDL4pC9K7xVuRlWiidcANykz/R+S0AC7
         AokCbXJNkWzNL21qbBMjAEABEAwVY/k79bMXPhb0b1DJM2D0MjZO2BAKGhu6V1N4FpVw
         ZZ9woFXNgEozIuIqZLbwCLVg78eujohl2+AmlP13qtF0V2umYywz5FShsui+pf0rNho7
         2LTiZnOc/0c/ESgz+2qarqmURwN7g2kv8fOoYxZe8mEF8Zvws35mImd4DtC73owmRG7r
         rDXg==
X-Forwarded-Encrypted: i=1; AKwUvByEWQPlBqtgcEop+CXXY6FXZ9VMvBtcI9KFvNoIus/ycNL0f2f2ZQxpVbsDlyaLh6hYbfnkZtn9p0zdC8t5@vger.kernel.org
X-Gm-Message-State: AFuF++ksbr5pGa1omPvVyvlK43724NTsCfjSpYTDTo92v14mWW2sXrNt
	GYY37ZHkK61ReERz7+qL74bGwDIYcSGspngykb4GkSlCbsBvpF/+t605
X-Gm-Gg: AYBFou0A8x5bgjVjCpLRxYtMSLF1dvOUlS7NRgmje1Bv3vx+xR69Om1CxWPDRLgSsbu
	yVveHfsYxgrIMqG3nIRi5+Nr1T9vFJSjNINqkYAy/ArypoCcW0eWLeRPi141sypV0Gm0iCdYHy6
	8uUS9Ae+l6tYq0/NfFgKoY37QilaNxVBO5c1NWXsb5RBJ0KSVjuixHmPW7RSvNEPH8v3lbkcnri
	j27UiJv3xIjPdUHiMl9uXOpsfb/HKrZqUimZRex4lzhV3bKrxf3D4P6+Dhk5AP3eYhBqQJdits/
	FY0Euwp8NTB5N8tWBX4R8zit9sfJf1sqsw+u4Z6nVj8l+5kYU2SV9CLaKNxxE+nW9Fn5nloHkQI
	92DQUjcEfFLY5UXUCrlhQb2lHOwpObMyr5j4GBk8kJG0NnLKrz7OHwN7TeisnoJiM9lxNzwxiOq
	13H6C1WS/KZG5+SFA62SM/HrSrAWBjAhgbbDZBUt53CVjtGurXKlsQ0QINgsY7aaxcqyIqadBzk
	Q==
X-Received: by 2002:a05:622a:908:b0:533:97ab:dd45 with SMTP id d75a77b69052e-53511ed6b08mr55315521cf.36.1791050240016;
        Sat, 03 Oct 2026 10:57:20 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5339883630csm56833491cf.4.2026.10.03.10.57.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Oct 2026 10:57:19 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH v2 09/11] arm64: dts: qcom: pm660l: add analog audio codec
Date: Sat,  3 Oct 2026 13:56:57 -0400
Message-ID: <20261003175659.23536-10-mailingradian@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261003175659.23536-1-mailingradian@gmail.com>
References: <20261003175659.23536-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PM660L analog audio codec (PMIC revision 4) controls the headphone
jack, and optionally the earpiece and speaker, at the vendor's decision.
Add the analog audio codec.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 arch/arm64/boot/dts/qcom/pm660l.dtsi | 40 ++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm660l.dtsi b/arch/arm64/boot/dts/qcom/pm660l.dtsi
index 3f8b9eafe164..5b406b83043c 100644
--- a/arch/arm64/boot/dts/qcom/pm660l.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm660l.dtsi
@@ -87,6 +87,46 @@ pm660l_wled: leds@d800 {
 			status = "disabled";
 		};
 
+		pm660l_codec: audio-codec@f000 {
+			compatible = "qcom,pm660l-wcd-analog-codec",
+				     "qcom,pm8953-wcd-analog-codec";
+			reg = <0xf000>;
+			interrupts = <0x3 0xf0 0x0 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x1 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x2 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x3 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x4 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x5 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x6 IRQ_TYPE_NONE>,
+				     <0x3 0xf0 0x7 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x0 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x1 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x2 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x3 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x4 IRQ_TYPE_NONE>,
+				     <0x3 0xf1 0x5 IRQ_TYPE_NONE>;
+			interrupt-names = "cdc_spk_cnp_int",
+					  "cdc_spk_clip_int",
+					  "cdc_spk_ocp_int",
+					  "mbhc_ins_rem_det1",
+					  "mbhc_but_rel_det",
+					  "mbhc_but_press_det",
+					  "mbhc_ins_rem_det",
+					  "mbhc_switch_int",
+					  "cdc_ear_ocp_int",
+					  "cdc_hphr_ocp_int",
+					  "cdc_hphl_ocp_det",
+					  "cdc_ear_cnp_int",
+					  "cdc_hphr_cnp_int",
+					  "cdc_hphl_cnp_int";
+			qcom,hphl-jack-type-normally-open;
+			qcom,gnd-jack-type-normally-open;
+			qcom,micbias2-ext-cap;
+			sound-name-prefix = "Analog";
+			#sound-dai-cells = <1>;
+			status = "disabled";
+		};
+
 		pm660l_spmi_regulators: regulators {
 			compatible = "qcom,pm660l-regulators";
 		};
-- 
2.56.0

