Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD5B49482C
	for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2026 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788353562; cv=none; b=bZyqO30tTA0mGzlbI5YydRfMMBfk0MbkSXVHFCdsKWyxEOilYC0O8KCYEatmljsb1ku3h4jxmazF+xoboMmplngSgZ2oJ1LSxRWqaEg4DaNy8B09Wa7oKSDEcfy1GaXlUU+dry+kceqna1xfNpLwbfjbw8CFhlbRML35tcCs7OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788353562; c=relaxed/simple;
	bh=P3B9n1ngSJPYECqzlUnSk21jaEUvILK91iJ3Q8IaZOI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=m9zYb6pFv5sz9NJJO/mNClI/uP/f7cTYlsDbxlqeeIAR2J4Wrm9nEeQ1XfSBu3BVUs9lCwPYrl8KfdF/7V+W3TOsfWrz/m/87NkVphjfo+JwmDOq4zOvAwWacdTmJ1wtqIDaWrH5yMCCVmKASKTtLCkjYeeaXZfj3LIet60GQR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeclux+C; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeclux+C"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47f96c5b722so740281f8f.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2026 05:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788353559; x=1788958359; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xdaO6fBuGjaq2cQRe9XXSfpY5l3FVnBSWeRbf2wTLJQ=;
        b=aeclux+CBPIKVw/lnVDOo0P0c4oVnuQGulcIQ19BqW+vresYMXSo0uTiZ1cSUrFLik
         8C7tKtTDt2fj5GwAaq5eSEwhzAipPzN8Zt14DoUSVcY1k4EfWDMxNV0U5y3prdRlnLA1
         ruXdHeORbAnl0ZZC5Zarga11OToRJlN9KyhADnJkqxLHwygEo/M4qXKnixY0TMim71a5
         5czPE1w4bHjx1RwxBXWOlrePTNYj0qhcf3Ifk+IsqM9uRht4PS/X8XyR7MZBSE70XLYc
         bSA8Tq0M8Ko3nW4tRShNRZJQlEo3QngBPDDuntPDn/QtMst+AfauRq959UCBoMyNqZhD
         1gwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788353559; x=1788958359;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xdaO6fBuGjaq2cQRe9XXSfpY5l3FVnBSWeRbf2wTLJQ=;
        b=gsNTQDmBQz31sltNW6+Jt/mRQal9hGmyOECJlJ3Hx7p9cBLP/8ZrNuKSurF7X5ynTn
         4MkJeGlN6WWKbhMPbx9hK9dlOwHeJX5kEEK5ndqP5SgtL4oFhJ/SWAZG5LNCNj5NadW+
         wAJJhV50sUz79jw85f9QF3pJjDxUqtfdS3TS0mSMEhKhsVNQc+ogKpUntmh+fLwBC4SR
         X2i+YQYY1QhENs1y+FCtn6NZGSQ2szeXo/U7r5lQ08PfgclztqySkOUgQoXCpxmAKMko
         BlyezoOrtJgvVsqnvsvF2v6FHsscPMiiT6sKJIprfxGzLoP8meMKq8YlN6D9Y/LSDmCZ
         0ehg==
X-Gm-Message-State: AFuF++mI8pwNhwg32Reym+W1Xfb5XBEFYkla98wrtNSvNO/L/Y3I+nYg
	+wVAN0L89rgWRkgekV3jWluUtIUpippWqhuDMWcZxIRQsrlFsL71jACB
X-Gm-Gg: AYBFou3kFqfXWeTlmAqx8+aI32oL9JvmVobN21nF0tIUxjxs9Xg/co/fKuDN0b7oqBF
	aPn26VDer66P3ipkTwBzFE5Q5ZEWAIOXnI1eDgmRJGPunEAHEkhmIGp2E4h9MxaR3mVAeevwCxH
	OCuhIoyJqS2qa+rfRP8CvLkCZz6fWSqpgVgK8H3QvS9rHQg2mODwDqpS6iP/lPXUfQj7hlIobEa
	u2KnFY73scj1N6uoTxAALakt3gpOunmDbcNoK8t4cHTkzUw1YR+fOpPIH2AfHKxl1On2mz/Ydk3
	NgLLrKgfP1YB0JUIU65wKWE3DFzVDm8KaftV9O60HpuEfCmmRXYYDuyJ9S0ghIUQIufbovzvXAd
	SekXa+eOwi1RDzxj497TLwfyQir6QEwrCqR1KnhzZVeyM0bqLjS5WnoyyZ6G2KA62JoMHgliO3e
	Hiuahpv6hMgLa3hRb0Y3wqyPGlPXY2/GURBo1Py6OlOS2NPODv+eQCEFqu+D/XG1qf3edVC548Q
	uVvMV0NTSbX1y6o3PeZaf/Ma7Pn
X-Received: by 2002:a05:6000:2482:b0:484:3d35:5706 with SMTP id ffacd0b85a97d-484914b7e20mr8950452f8f.22.1788353559085;
        Wed, 02 Sep 2026 05:52:39 -0700 (PDT)
Received: from [192.168.1.5] ([148.252.128.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48448ed3716sm6543253f8f.22.2026.09.02.05.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 05:52:38 -0700 (PDT)
From: Dale Whinham <daleyo@gmail.com>
Date: Wed, 02 Sep 2026 13:52:36 +0100
Subject: [PATCH v2] arm64: dts: qcom: x1-denali: Add volume up/down GPIO
 keys
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260902-surface-pro-11-volume-buttons-v2-1-1d893c7b5440@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OTQ6DIBSEr2JY9zWCP9Gueo/GBdCn0qgYHpA2x
 rsX7QW6/DKTb2ZjhM4gsVu2MYfRkLFLAnHJmB7lMiCYZ2ImclHnjWiBguulRlidBc4h2inMCCp
 4bxeCvlRljqLSqBVLjtVhb96n/9H9mIJ6ofaH9GiMhrx1n/NA5Efv363IgUOKq6YtykLWzX2Yp
 Zmu2s6s2/f9C/fpPPbcAAAA
X-Change-ID: 20260829-surface-pro-11-volume-buttons-f4b40e25cecb
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dale Whinham <daleyo@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788353557; l=2560;
 i=daleyo@gmail.com; s=20251214; h=from:subject:message-id;
 bh=P3B9n1ngSJPYECqzlUnSk21jaEUvILK91iJ3Q8IaZOI=;
 b=IaqaduQCaxmFfyKqat/Yx4CdX+AosmjnsVzKJdAcszI6FTzzNjK8qNsgOqqD7lxuRfMpnpwU8
 OusvjmzfxaGA7SSuaA8OSXY8qEipcr8cxUDig8XrvBMz2EJO8GskwIh
X-Developer-Key: i=daleyo@gmail.com; a=ed25519;
 pk=M4mvgx1TB2TniKaedTDsO3PbLKgFosJuegXRXPbn2Ds=

Configure gpio6 and gpio8 as volume up and volume down respectively, to
enable the volume rocker located at the top of the screen.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dale Whinham <daleyo@gmail.com>
---
Changes in v2:
- Sort the new pin configuration nodes by controller and GPIO number (Konrad)
- Link to v1: https://patch.msgid.link/20260829-surface-pro-11-volume-buttons-v1-1-ace589343a68@gmail.com

To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi | 36 ++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
index 7559557610ed..6ed7db0ad53f 100644
--- a/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-microsoft-denali.dtsi
@@ -20,9 +20,27 @@ aliases {
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		pinctrl-0 = <&hall_int_n_default>;
+		pinctrl-0 = <&vol_up_n>, <&vol_down_n>, <&hall_int_n_default>;
 		pinctrl-names = "default";
 
+		key-vol-up {
+			debounce-interval = <15>;
+			gpios = <&pm8550_gpios 6 GPIO_ACTIVE_LOW>;
+			label = "Volume Up";
+			linux,can-disable;
+			linux,code = <KEY_VOLUMEUP>;
+			wakeup-source;
+		};
+
+		key-vol-down {
+			debounce-interval = <15>;
+			gpios = <&pm8550_gpios 8 GPIO_ACTIVE_LOW>;
+			label = "Volume Down";
+			linux,can-disable;
+			linux,code = <KEY_VOLUMEDOWN>;
+			wakeup-source;
+		};
+
 		switch-lid {
 			gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
 			linux,input-type = <EV_SW>;
@@ -984,6 +1002,22 @@ &pcie6a_port0 {
 };
 
 &pm8550_gpios {
+	vol_up_n: vol-up-n-state {
+		bias-pull-up;
+		input-enable;
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+
+	vol_down_n: vol-down-n-state {
+		bias-pull-up;
+		input-enable;
+		pins = "gpio8";
+		function = "normal";
+		power-source = <1>; /* 1.8V */
+	};
+
 	rtmr0_default: rtmr0-reset-n-active-state {
 		pins = "gpio10";
 		function = "normal";

---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260829-surface-pro-11-volume-buttons-f4b40e25cecb

Best regards,
--  
Dale Whinham <daleyo@gmail.com>

