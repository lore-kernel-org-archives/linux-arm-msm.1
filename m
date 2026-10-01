Received: from mail-ej2-f43.google.com (mail-ej2-f43.google.com [74.125.228.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3681A48FF87
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 12:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790858339; cv=none; b=bXdkmdCjbvYPc1xfKSoZLWmg8GxjrFjbD3EiOGVnO7JsM5MeovKbs4rwJnJ/Td2o+L0AyCqAlXWGd4GxevJZt8rzGiH02M0sSRnlIukjL8z/ODtRptVsHwFrJc4H4meTWtKDfJp1/hGSpodduoUkuydu45qHJ197jdHCkRfG7Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790858339; c=relaxed/simple;
	bh=GXOYxPE9XXaE9L39k0v7w8/im8syCyaHdylXW1ErmQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CuKkCU+OBXTGvxZZ6dgDa62/Se3so+4AQog8icUun/FfL+OHCxfljKyt/FpkfEsrYCnQp61fzpjv2xSAEp+iC2XcKUCE8zLVc1L8zanG0rVw3MZZQEA3ENC2aLHrYkF3C7K8q7+St+zVwRjqxYtsqogqXU0W8wDiVmgDcFsUJwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=pgUNVcY6; arc=none smtp.client-ip=74.125.228.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="pgUNVcY6"
Received: by mail-ej2-f43.google.com with SMTP id a640c23a62f3a-c2e23be09baso227094166b.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790858334; x=1791463134; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nuQBqaIdpaHRaY1eM3V9NNuElvXPNqabRIxzcvtovpw=;
        b=pgUNVcY6EgxdfljhCmOi0dXDsH/PJZNRQ6WqUldIJJiRA0A9L+XE60n8jFxhgoIMoL
         DxlqqwTk25ialNHD1DcteIGkOJy/+iLP32edJ/mjpX6CuzMcDm7zdUzN3F/rPOutSsmm
         VTMUzG0fvBcEh+Z+EKiK18D7hal2KIPN9xpoxpNvc25WPxapIVOIeYesPjuN9e8o4FHo
         IUtveQIUZ28kPdvMfRogekVA4iHzJxI6zuWFhqTiuEbbYqVDrl8uKqifg+TAiwddzBvr
         OUUxB7fFiREH0miMtjpFk0yH64fegdIibIs6BXmpawAjkVksJIoxZBFUK5PgktNOfChY
         7UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790858334; x=1791463134;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nuQBqaIdpaHRaY1eM3V9NNuElvXPNqabRIxzcvtovpw=;
        b=KHYSgwhxHwrowTbr5FA5t0IdVPbrbV0KbAy7YnycH4NfCIScelFHehggZ3SPvJJ/LC
         aiuuzysy1hdJZ/WpnbXscLXLSLIj/0zAHpdohf7/Lv7tqrRPu3haU6pQelD14HL2fPle
         ZUP0LZuGiCVXhv/ypN9NwvkiUreFo3WvBA5lBflBHf4dXfzxpDM88Kp8jMWy8c9IuZQ7
         7vrGXwrx9MxyYxKwvjw4FV6DQI03KyaSN4pXjDjP4sJTUJo0Nvd+iRQUbeMnJcj3ksf6
         Y4s6yczAbciaPYEkZIv3hNWhN4FJmjOUagJlbCJ2feQjh0uqK2gSULlfAMXDvTODR9kt
         mTcQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMnjdq3+P0SwHXKnDyVypo/EiqO/yrKvcob3t0iaB9NPehD6MNDUQ5Xd9DJQlJwCMxTidneVtrm6K8vb9m@vger.kernel.org
X-Gm-Message-State: AFuF++mK6MkmXnAv57MTf7T3phgbVtQwEioTov9xQfmrVhiRy1URCIV2
	ShcDkdZPzjxtBX62IYCiDV1KV/kpFEadbUhDD9m5XrYGXY0pfVbmiO042uvS244S0cA=
X-Gm-Gg: AYBFou2Pxxh2j+e9buK2pXFNJ3i3uUERPvoh+M1cnxM00hI6YZSSID8MZsWnY4GpeUv
	Fwf2Im3+YJFwAG82FfabpvQvwaZJ/tnqtFcdnbWDPEPWscJi9b4yrfVlrgsm9BFkdIutXw0C75M
	teoihcz4okb4MJl4pDFoD9xEYGiJomlBP2gWhNhYu8ZsEMvj0WB2rWQszqu1H+fkPjXHbKUO/6v
	ey9ZOdysZWPvchfVBmaTgm4475GbVwWEfakK7YNC5/hWlcaxSs/p14B4hRtnj4ySvremfB+4Jie
	pwDgqUVfRnebn3vlZcS5uAQ8IxEs7Znm8PcoeNxSOC22RhOFAevSketYFh/JGZOc3e/Aj7sYKS5
	yteA0synnL0dtwn3Hh6X68hZAHVRPtx9sGUDq7CCek8X1OrHfUDMMpLBfgKMertU8dkxWnbw255
	BpRJfCS+gN+y/ot1MXW1GCVfY9XFblIgGNxocue1d+FMRWzZvtJfKDdot4XuykU7ZsCR8tF7O0X
	F1DgVBZxcTgMWBACuMVMJ9TFZDlZrSwkbHuvt+eyw8tP1N4vce6TugB
X-Received: by 2002:a17:907:968a:b0:c2e:4627:285c with SMTP id a640c23a62f3a-c2e4627314dmr31323266b.21.1790858334147;
        Thu, 01 Oct 2026 05:38:54 -0700 (PDT)
Received: from [172.16.220.225] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31c8ee1fsm150346766b.24.2026.10.01.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 05:38:53 -0700 (PDT)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 01 Oct 2026 14:38:52 +0200
Subject: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261001-aw8695_haptic_fp4_driver-v2-3-1bd38b1943de@fairphone.com>
References: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
In-Reply-To: <20261001-aw8695_haptic_fp4_driver-v2-0-1bd38b1943de@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790858331; l=1536;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=b5rlY0cdWEJkU2yE1vtZWFHGPbhwBJVbfVHUI5HT2BA=;
 b=aYHs1DJgnp5UR/+kzBPSMZmenFtc2+3y1LUW4RShilhYzElpRGcr0049a2+yF51i6JOIFaUdG
 Gs5y2N8nKaGCcEhwdfiFYTWyvUbAU8X2zfdKFxFpNel5yFg2M4ntgTv
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

From: Luca Weiss <luca.weiss@fairphone.com>

Add a node for the haptics driver found on the phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts | 26 ++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
index 23f950067a08b5ac4f7f9f61cbe060fa00b9f485..76184027221402e57a569d74749350c1482f5afa 100644
--- a/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
+++ b/arch/arm64/boot/dts/qcom/sm7225-fairphone-fp4.dts
@@ -707,7 +707,17 @@ vreg_l7p: ldo7 {
 
 	/* PX8618 @ 26 */
 	/* SMB1395 PMIC @ 34 */
-	/* awinic,aw8695 @ 5a */
+
+	haptics@5a {
+		compatible = "awinic,aw8695";
+		reg = <0x5a>;
+
+		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&tlmm 90 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&aw8695_int_default>, <&aw8695_reset_default>;
+		pinctrl-names = "default";
+	};
 };
 
 &ipa {
@@ -1178,6 +1188,20 @@ reset-n-pins {
 			bias-disable;
 		};
 	};
+
+	aw8695_int_default: aw8695-int-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	aw8695_reset_default: aw8695-reset-default-state {
+		pins = "gpio90";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
 };
 
 &uart1 {

-- 
2.43.0

