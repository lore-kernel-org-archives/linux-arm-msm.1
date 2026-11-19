Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795107274;
	b=dDEE5nJb/QE/oHJbYONDOBJnX4QQH+xBfyGl2+dTEyaOnYlv39EyWnHZW2ueTQi2YSec
	 6on8ive6fXgf58OOo92F4dxGrhcqJr6jOEab9l4B59F/tpE9DOGqHhA5HNKrTZlVa/oLw
	 bIVnHSwS/c/NrevN59Z8tbsNWV6LPKQxVuygtaycnQf0hLCuzQkM/5qEy2ty5X5nymmEv
	 jR1HrJ58WqBVmD4eBr2PWTNSF2Mz4HMZ6eTsKmfF6qH0JzenaBajarWxlPv2/0ndZTUjm
	 gsrkFlhhohJVGDNqimRcAQD/ym12Z33eMZTZEQg57BmA95hbHMWefcmND5JrXNGlGWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795107274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
	b=K5B+TZ+8l+E1kT1Vxy6ZSoqAgwhvivlbBw1CowyiQef5RvvehH7pL53NdJI7h7rnlhPF
	 weAFw3KdgUYdCRcPD2zUwqDdwObe5jKK3BgP8mOxDgqh38omR+8BvuUSsogYT6V6nZQO8
	 z9qHUZdLwsC25qSmgTCWsfAZuZJlzaRZQeCIooLFJZP7WndyjUSHJAnT9snvpQc8Tamd9
	 klwPSJAaFxQOjxYp9tnnHgarQu0Xdopum2q/5aZzvPL5yGN/FNd619N2ZhgdPzT+naIvW
	 ir2mIHp5yjcH09fVqHhd0bW/EgEJRGjo38ygiZzSsOh7k9Bw/nahREL29nr0GoMks9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juhEOwGF;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DA260A6F41
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 16:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4DA260A6F41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=juhEOwGF
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4bb5b8ef642so23649785e9.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 08:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795107272; x=1795712072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
        b=juhEOwGF2GOjxoXtmjs2wXb9+vc1RddKdvLf/LxnA0U+tZF2dd0cGF0s07L5ffEOWJ
         h4LKn62uiKSoqVEeqMnvaD+aMjk40J3zn0ctuFQISREnxJV0NphasYOXXvBl35yMvtey
         mwHSYKhcUkiHIIGinJfvjQuMHKufDYa8tpA/QGGslQhw/IaeX+ZzQUTPn9ICizxOENbf
         oPA8kDxf0gZqOt0n18v8pvMKVxK7TpJKlFNPOYjOfxWlrp0ngsZCoYs/cdgXK7uKEklF
         WiflhUjEAc83kAny5N5Y9O5ZfB1i5Z9B1GgXYh5RP0Ho9VQpIi7+POg/jvs3ZMpdWNfI
         49Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795107272; x=1795712072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=F0J2OIIkJQaAc8JC0X1XpyF+PM+4498+YyFt2tkAI9I=;
        b=MtmVpSo+wVg6NzTGwaHvf/kUAltsStAeUr/S3IWGKEPdY/0CKj4Zgi+5dki8juu4Ud
         du4DtSSel9wPP8MrG7by9rQxyhRDJg3jPAcomxt+tLDvzAgYolbXlAhx0YHHA3SwxSZP
         0mI1m8xDYlb6aMDd5ozpMbdbC2HYKAMEvLCIDv4b7gmExpX8Tj7R2kGuna+yxX0zdoh7
         AdfznvQmnfTQrfFhpIMVjerXSn/PrDFK4X6RAH6NSvonOwzsE8KXbsMszLvZz7njK0BR
         s0B9CdimWxBfl9zMTn42M83TZcNOgPSrM+LwvUivHXMjrp5EURrnZvT36oCuas77Ow35
         c5Cw==
X-Gm-Message-State: APuU4Z9QbCc3wzTuRskVgHsPcAk7b29g4vNyz+kIEgAny53BEGzDr+kY
	hkHOsFLOs72TNubTkcKQhacjK4apeq6R7TnWyfbRcKnRWA5sypD9tHWOou1BtZRd9/E=
X-Gm-Gg: AYBFou3V3O+TQ7faTtF0pwwlRnGPIXujHw0cU2Tm7UBZH0Ds0yvAWrRGtFj4GbRkETA
	i7Cqx7cGdgufODOPuUfvWm1+89nPOlTDzw+uZBCukgwfkcaa/l4ZwdNB56GJaB/ru7/Fa4jaqlw
	ZRpqDTyO8o+GQoseMVBxFVII4TnT45fSAYZAb4DS+3JqqfXBMkqEWR+Ts6E74P6W/nFoPJwY9Na
	D7qg0fWHbdPbMcIlr7bL1+jAPs9zW4KzP6LSs1d7QhVrp7NRgaJhtGJi0MxOcI+fPnKliTfvzxv
	IwG9L3yHs0c5YwukyobJeTdY4bZX+TVx5DbIkhy1Zm0UMa+L4DwMRuEahxxncORXbgapmXVd+m4
	7gmp6MfOzBhX0BrUmG47DFsUUxQoZ4lrIcuJ/sCfcmjKAOh5yGscHen0uI/LbBM0BnjW+Qzct8c
	CSTOTp5X/o4l2YHjqG5lI73Xn5mqDCefBCRgDjo+i8ybHBfCPRcbB97g7Qhf2sEFryT7j3nytGE
	gyrGJlOhHQshGuG+CsujQx0pYf0EivfJYHkk0R/ZckPMauWn+shBwYe4670LMHiiV7ZQpPNyUfz
	rBqilhSp76roQDzC4cffxw3PdbsSmISfwbqLGPCGKfQEQP4IYLj1pafTAvru/qjCFCpLo4wRwfg
	=
X-Received: by 2002:a05:600c:5303:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb8880767amr1755525e9.9.1795107271789;
        Thu, 19 Nov 2026 08:54:31 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb88402ce9sm9894555e9.0.2026.11.19.08.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:54:31 -0800 (PST)
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
	Ivon Argel <ivonargel13@gmail.com>,
	Abdur Rofik <rofikcoga@gmail.com>
Subject: [PATCH v3 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Thu, 19 Nov 2026 17:54:18 +0100
Message-Id: <20261119165420.24466-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261119165420.24466-1-rofikcoga@gmail.com>
References: <20261119165420.24466-1-rofikcoga@gmail.com>
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
index 59d6c1518a469..160b6f4c98b17 100644
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

