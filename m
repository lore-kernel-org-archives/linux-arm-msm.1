Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795096492;
	b=Dla6o9yk1/P2115LdHN2TmrZdghLn5BD5UP1OtnqHIKCfegtmpp0qpQtqmQNTINp2fWn
	 v+boZ3X3EaSxUaQ+w2Tfl33WGFZwejoeRjVZYVcLulmKFM3qyVrT9D6IxoIUiunoMMr4g
	 CX7MrRfo4PpDCnm0SkjVWy3uLdotCqpBc3Z3LhX5lp9AhrszGPkjrVS8HKRJtw7zAdhdr
	 XxgmGpU+IeGMpolWBNDUwTUC4eYE4jFVM7ua88IzBMwdf2X4yUhPwW+kPV41iSdDyZee0
	 DV7AIMeHS0jzISHAfsPFLNwRkuBbxp/BlaRApssOmCC8CRNR9U1NZV25VPl8Gd4mU3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795096492;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
	b=I6q8aac6wVAZc9UVbdCS7vh2gmYRbTga0UHWYvMiJrRewhjbK/dUFdcEDvVlSQzyh+DE
	 qIMzcrfQXkVwi1m+bV5mC1xRQjtwhojZ3LV9m+tmaPG+4B6FCocJcRARgINALiVnsxlPN
	 VwNNmvxRHAbggvGFHqK/l2dwD2Vp7mKODFW8pAcqE/wN7/z5XKkhNnsPUuoRbhp+8f0Yd
	 Dkt1zrp+CYdRbhUi9U7llO1z2DBWbZ/90WKEulL0OsYyYlGTS4+W2N2gSSXHxpeYbUEd+
	 vGGs9HMn9uUtNXoTVwcoybuX6krhflKidLcIxdbhqDobyqab0ak7cwDbR4fJGNpurHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=fairphone.com;
	spf=pass smtp.mailfrom=fairphone.com;
	dkim=pass header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=iStJuBRZ;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99123606A33A
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 13:54:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99123606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.a=rsa-sha256 header.s=fair header.b=iStJuBRZ
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so345618966b.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 05:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1795096490; x=1795701290; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=iStJuBRZyeko+ck0h2qcp8lblF7jAeJsgGPT171M9fozU1T1YQpeMqvm+yDjdYymjb
         zRRiwjQLu1Yf5ot541+CH0yGBFp+H4KYqVAjNRAF1mZxWSMCVuBN5v52XJ7SyVXH4DjU
         eS11FINq/kc3d9V/bqwxLViXts7mx4ytpoGlJRQPZpctVpWQ+64i0qQH9CpdgMWGnwBo
         HfS4ld5gt8/0FrkxPVRpoVmk6feXZz59G9/bqWNkcJorJ36huAWvC1Xv41G5SN8u9C7o
         ZQ4bX7cTIZHqTmjJeW3DzYIvpZr751R3qU2DgewhZ6Hx/dD3BykZAZhp8NXik+SD/2DA
         Vuyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795096490; x=1795701290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hAMNTPK/AYw6mgKrLcGhVsFn803cpE4k/KbZ4nEtqy8=;
        b=oyLDcB65RjGXMvecjt7Pt4gY1tZtSsYtH0dbI8uGszyF24bAJXrxTR/QKmaiQ6fr36
         s2ymev4rSABepLIefGotn5T9FXmAu3ZTBJ18HCiHSnr6CSHzDmQPivXsSW1OlxwYQ6zs
         SFLApuJy2zO1BMFRKEflUrlAWqZhXqmkRuQiLIO47ii7/upakddcjz1RWAFmlnLuj3ZM
         qDGn/cHaj/Wjyppufsc0YxVTUGEUWenRNmSR+EVTy6vIUQYCH19OOCXWWXVJrdTXjDx1
         hGrq4K5QZ6/Wla+5b/xWipQR+TDo+LyrZS9uQX8iHY8JcMWGoeHVQ0+eFXZH8VqMwOHx
         AI0A==
X-Forwarded-Encrypted: i=1; AL+hErFGaLv/DxSF8WgfJuqXoR6yRsTZj7EQWuNp6wSkqovSt4z3apY/Rn/pdai/S3qupZAwcIjhrUsNSh69Nv0O@vger.kernel.org
X-Gm-Message-State: APuU4Z/RYikrTUFGd6UJvITqdLY5xmGDgG3D4oJ+hJ75FK3cFPJNMIro
	rvwPRuOFes0F4EbxTJUAdJOWKozGFFAXsbhSUy9t3q5qwZgLGwkmR/Zw9Wwhcp2ST60=
X-Gm-Gg: AYBFou0iPOOac2+cqJng9LxTQ7bTbHFDYdfQfy0KDM2gGxXAUDVYwLszmoB697Bc2lw
	D5CCpmag1k8G8mJrnYL4PkvhIjqVot3c/gkU4KEd2xeH0KIhHelst9wLQWCRWnVq/oHEiSDBN/y
	Bf/UPr0lQPx7lIiN5OUeqQMLQCDXk+DrR0we0IcFjRUernC6gJw3uQxsIKlJwxYyVuhRS21CgoO
	X55x5Pt1xoM4KKoivSzt1I2YPcYPA+yC+z002Zfz59n5lGupeAvXiTZcvvL9bft7IOjNY2m6Dam
	A0lQXRwlPpCw0Byv3FnGsvNl4RY+zYczdgBJU30l6FT6PPfh3sr89cBaYmoKOnlXQ17f/LaSAqa
	X/9HRuyBX8tUxuBJffX+DakG0ZIdAYQYyxqWAXJFwe03rebC9NAgkjnqFrUkbnjhDuB1yN6Tw+6
	Hk2XDePNI4aoaq4qvF1ivUdmbfh0MrOhR4tNzWUc/CcWZp8LKsNMhvEuZIVO8XE0zg0/T6K7GXK
	oV8PuL5Jc8bOaizzKdEhkzApRX9x48IZmLrIs/2r5sn06oSAWOg8jC437OyCmifqgvJSHUnKXBN
	PdQClGFayoBTVKYSgnqoKlqfr596XOD0xBg1i3ENnI7oc4ZFBYTRZCBkCoz2X2fTmi2PJFwknDF
	+yoMSlMQG9ovi
X-Received: by 2002:a17:906:ee85:b0:c50:ea07:80ed with SMTP id a640c23a62f3a-c510e547d86mr560202566b.39.1795096490106;
        Thu, 19 Nov 2026 05:54:50 -0800 (PST)
Received: from [172.16.220.224] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c51233c4d02sm106820266b.21.2026.11.19.05.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:54:49 -0800 (PST)
From: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Date: Thu, 19 Nov 2026 14:54:47 +0100
Subject: [PATCH v4 3/4] arm64: dts: qcom: sm7225-fairphone-fp4: Add AW8695
 haptics
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
Message-Id: <20261119-aw8695_haptic_fp4_driver-v4-3-9d107334bdb2@fairphone.com>
References: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
In-Reply-To: <20261119-aw8695_haptic_fp4_driver-v4-0-9d107334bdb2@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin.kroah@fairphone.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795096488; l=1650;
 i=griffin.kroah@fairphone.com; s=20250804; h=from:subject:message-id;
 bh=aA+iGNmAXb9ktbwAU0KbUX7yr+F4w/IPZJ4vFwuykl4=;
 b=r1uAQNYUas2/uOCdwJ/uUDtwQzglg/TNjUIZyy7Tlkl1iSfbdZ6m8DH7MxwWkifuJuXBxpIwr
 HacaBfJyVDmDZ4v5kDX5zKr9vuattUfT8WkjmHynS2j3pd+xDJp3rp8
X-Developer-Key: i=griffin.kroah@fairphone.com; a=ed25519;
 pk=drSBvqKFiR+xucmLWONHSq/wGrW+YvcVtBXFYnYzn8U=

From: Luca Weiss <luca.weiss@fairphone.com>

Add a node for the haptics driver found on the phone.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
Co-developed-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
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

