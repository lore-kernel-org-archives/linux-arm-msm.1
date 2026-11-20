Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795160051;
	b=XZn2x+vgFcpB28B8eMKq/wRzDymLHknGKj6p+jXHDQRPQPajiY5DtKtRV/W3MBDxEeUa
	 zggBvdYX3Rux36IpQ9ms66VrUofCaQesRHJCyBO9LSxAktveWqnmCRWnbSiwMFyTMd3Lm
	 E6SApHF4Ii7fc51V/LeeQ+DbxGz74Ym5eKfX+hxnELAWo65JNXkiZXjoF6dclh+eZv9Cy
	 FjdMQeWQhCofYqSVg4pIqcRuYNRGMCyC0eNdSO2AH0+T7FivaHdk9/GXO/l6m4y1Ec5rD
	 1J0VU0Gc+mmlIIcdWxyCmBOrbzHoWTlUbKPsxy+d5yB3uf1mdy3BNTrVPnLFIxbhV8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795160051;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
	b=hh0oA/RMwEIUGqtNdCBBNcNj56LHHXXfYpGT0LQycqJVG85h25VNKCbC3bxyYpVK23IS
	 4/2IKSPqYlyDY8ArtfMjtVVwkwKF9epquh1mlK0a4I/0bF+qlYbN2TEtRjEUqrGzIdClH
	 9ccRrnvqoejuuoP6QUbdG29dELJpKSsZecxfmFQZt5/ClOocmfj2qlGQRPQn5vcPHNFXx
	 1LaBus0iLFY8yvXIWhRbvwe+m5Xz0PvATF4lEHqMkJe9FZ4wLh0BkZZUD7CqIWIFIxz/Q
	 srn7/W3LtrZi3oFPaBvydfqN95zcXlQXtZsOWL6aO2JCNBxo+91gwJE9rA/Znun25Zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM4EwaUG;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A130260A5BC4
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Nov 2026 07:34:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A130260A5BC4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=uM4EwaUG
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so5014445e9.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 23:34:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795160049; x=1795764849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
        b=uM4EwaUGJ3db/pFbwtIa1AwHXGzh7FRaXsI3Exn9B+X7Y+75sVIT5aImQsYlqQAktP
         DgaBTApC542QL9npLpxxeTVf74R7zjkF0/m3xwM7xwescjyqHBWPycRakWxowLsZb6pX
         cGrY63UXSZ2H2NfsxAY4yq/X+S/iYRF3tiEce/necRond/IuTh8tOFzJDbtLj6fzPK1U
         MAKzBfqdFT2WqL8jMV4JsznILSHyDzkawPS8nssGskfTjuT9GGB1tNE4y1fIaSqBcyk9
         SX9S2XOPB7yHp8jDZF2G4cOaKS8o12dwoejRkN2VyyrPktVoqeYV8KlFIkSASm0WmVT6
         aKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795160049; x=1795764849;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zaM+gH/dN44KPfMZjWOtQikePy6isicudqZk6D3g/BU=;
        b=l3bsafGKOM3qeXi1dNFVRz4MvzU3+F5MIsAbW3Nx/z6xQ4oAN66SPVlSsOjMNsJb0M
         84Awu82v5vEz2Wj/zqoFZvxv3AcoLNHU45xkeAlezVnL0Zwbf6pN4JWZhs9DVnpUuSTF
         /05C1YmFX4zUd5tyhuPPwK7yfGaOmI/wAQtCqXpQQPMZCUDLS0s/WPWjmqTLTkJ9J7tN
         3TJdBmkY7236ZhTSUpiv8LNhC4lb/uWDvy/QTusxK7sye0ARBQS0n8+yFxyt9eMUxFf3
         znSIhCb92cu8Lg40XxlULwi+xXVV9l5dMgVlpeP9JCRZjXV358C6AAPTZmsUAHinUDS7
         SwIw==
X-Gm-Message-State: APuU4Z/vXUuochtD2AlXQfeCXgFJBNoopJTuqQQB/luFrGd1vqYLbS95
	eQa0p9IoaatgRK8wghS+aD4dbLlHVwerlPuDGI89Jhk0pPXfLtC/zWWyh7vcG13+9kQ=
X-Gm-Gg: AYBFou2L1RRVza0k7VhakFXaDV+0NUjevOCfQseA1DOcJXyTap7hzRidb/vMTM72/lX
	kAIu4LQ2Ffv0MFV+nxx9IjP1nKMnGcZ88OFKQrV9KmdcEiM9FTz4ey+7A5LntnYRnmcW8f9yH57
	AAP01xulsZQGP5bm8GWrAMryguXPFc+reQkzsnVbD+Z+cDypKZff3o29ODi3/MrNgmb3P10jTG2
	0eaZbD3DqiGg3Bvjw3PazRQeqr4nNvMhvGMANIiAPC+c468srWwEtSX80e4fS7L4p3TmeAQX48J
	hrxhUzVhtsUrK6c1PdWOGX8/O8NgWvw0gZM3/ZzrT3nkBZkkhirJ71Kq2l3vbREg74HmmPYiYxa
	U1FsCaiB+rBCjsT8F1UvR53RZCNY07ldIdcLJDOrll7Mx/qFMcm4hnofKEEXoR2KafA2tO290r5
	c2eezhzypmiVDYQ8oSGdJUXwprvE7lxv9B7DxT5fwxB6hDBeckOvOyDHKRlRHGJ4UkhHiuJftZP
	MmR7FkKNNGJm0S4d2UWbJUlMkRiXn9/60OOI2EccYVfFyDw33pV5i9L63+bi/rLemKKsqHqjzJR
	MhPwsmErSDDtccoYwr8L3rqgloM0AQy4faqwLTugm3oscsNyJ6MrsC0RhaG3r3Qjj7fO1nqqAOg
	=
X-Received: by 2002:a05:600c:4515:b0:4bb:659c:b8db with SMTP id 5b1f17b1804b1-4bb88813b27mr44615435e9.12.1795160049029;
        Thu, 19 Nov 2026 23:34:09 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884a3a3dsm54154045e9.10.2026.11.19.23.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 23:34:08 -0800 (PST)
From: Abdur Rofik <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
	phone-devel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v4 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Fri, 20 Nov 2026 08:33:56 +0100
Message-Id: <20261120073358.10267-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261120073358.10267-1-rofikcoga@gmail.com>
References: <20261120073358.10267-1-rofikcoga@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the SW42902 touchscreen on GENI I2C13 with its interrupt,
reset, regulator supplies, pinctrl, and native 1080x2460 touch area.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 709cf9674e2d4..16014df9c087a 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -107,6 +107,24 @@ vph_pwr: vph-pwr-regulator {
 		regulator-always-on;
 		regulator-boot-on;
 	};
+
+	reg_ts_vcl: regulator-ts-vcl {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vcl";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&pm8150_gpios 8 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	reg_ts_vdd: regulator-ts-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "reg_ts_vdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&pm8150_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
 };
 
 &apps_rsc {
@@ -461,6 +479,29 @@ &gpu_zap_shader {
 	firmware-name = "qcom/sm8250/LG/timelm/a650_zap.mbn";
 };
 
+&i2c13 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	touchscreen@48 {
+		compatible = "lg,sw42902";
+		reg = <0x48>;
+
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&ts_int_default>;
+
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+		vcl-supply = <&reg_ts_vcl>;
+		vdd-supply = <&reg_ts_vdd>;
+
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2460>;
+	};
+};
+
 &mdss {
 	status = "okay";
 };
@@ -580,6 +621,13 @@ sdc2_card_det_n: sd-card-det-n-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
+
+	ts_int_default: ts-int-default-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
 };
 
 &uart12 {
-- 
2.39.5

