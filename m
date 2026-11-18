Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003647;
	b=LZEGDypKHOWAev1R+8A2GUsawG1fYROXsJ0MFBodTkQNuj1uxX+V1mhbEIKyZeP+sgZ1
	 aoHt59Y77NumoEpL14HMDt+/0ccH8gYgrqc08DeamYupZqSXCbX/sLF5cZnCT4/fJKvji
	 iRtzPY6nxyAiwjp8QnZIAtThalaH4OZTbGN7YI+31sWifITkeIH8mCrFw4Ygpbnfol0z5
	 t0uPOl8Y8o7t+ewTpRUogDuhCLzoYPFW1qNrPQ9vNGHOf39zu9gbgiUWqQ+YHx6Og77ZS
	 ZDsjglD8XZ6ov8DCpSRZRSy34eO+biYXlyizjAjblp0ttyC6jOv2FtpMpQ3/OwX27Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003647;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
	b=l8ljOwcPREPD/wK+dXPV1ZzXITYOIx5C2bvW8kAoRe786P7ldR1U877G6l7TtCcaxHwS
	 +eOROOUd+hXgiYbFbMOGK7XEjC8SVgkDRDz2eCoNGKxlFcSpUB41hphE/l/zHT51IxUV4
	 tX4UxA4/eewtFKdWj02XCgNs+74Umdp1Pd/5whz9Sjbb7NZFOvdUzOT2fQThAtKtrzJ+/
	 KDsu080S1gN0DbBhY1P9GNyoX42k3sJCYjuEkjI3PYuQrDUhSISFhJImj+DVS4c8UfdI8
	 MbQDcUcc+8HD0vYwlQRNzE5xbnzyYBHHDdBCCpNoskSKRMfWGFBFXQD6t6lGCqrfHyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCM3XXoA;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1AC60A2613
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EA1AC60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hCM3XXoA
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so557285f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 04:07:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003645; x=1795608445; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
        b=hCM3XXoABsifPCJHl+S9eIEkiniH8JknIKrQQ5Q4sOKVkcnlgSaYr4w7x6Lm6d08Ue
         TZ1dOmCDAbwd5+r03qljZcFpePl0kaycFVhaciEsPK8NYWUznZEYvVuDRQTNrJJ/cErB
         CwzXcoHVSixwu/iW9djD6fPOSrCq81FtTuYd9zHM5NR8oFkgkTUq/7+v86Kf6uK60RLw
         xIBruYyEb1eKcyjlwVe3KmMBsmia9hK3JkIWr966eDgD1FvzBi1elzbRLMkznNB2eTCZ
         KIcrOtAdznKdiLxM25GbEO+cUeIFZwIff93pzsBsPYmo8lt/MaygSGgz1sazwbOKgX+C
         g1qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003645; x=1795608445;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wOO7pl4T1V2FI+1ZhOhvGDpiZBHJDeIfIIIzY8CL3HM=;
        b=JkrfeaHmbVlVk5ecoUkGk+hZzC3LpoM1SSCCPo0z+QPihFRZsA2YHU9cvzF2sKnfGj
         lCToiAmq8vj+QZf0Oq/Zo7APIcyNCgepTjmcjFMKf5uExA2itOp1IsHvLEBbrYVdY7vB
         8Ue6wa2W71zXFDnE1P0wSwNRDMWy0dVZhPMPTzA3RL7AXWIejTBjXm3mWRo/kSS/Cqiq
         K47XKCVpGIQ6Z/FulfN69zpR9nqAwKTGEtl2JxD8HgCLaoDtU8WPX+TBpdjz1w8fhhWz
         zuz/JHrKZgkUHFHN+hPH7dxH4/wYNLcA2DlNAgeUCKZrE2s9r+E4aNl9W1lWKgZimu1z
         yxgA==
X-Gm-Message-State: APuU4Z8cgJC04MPN5Nvdsl2IXIdgUy6tXPqWEjQxvcFQLoWXPc2KMvfP
	YB0HtLhI1jyUNH1lvPBkayRtLKAtZAGPxcvqDR1O0UXN1vwN2jo12SJzA9MbyYsdzLixQGXx
X-Gm-Gg: AYBFou0r3NciHy1lp/WrKfDcyzZaGj7YKoDeeDE8t71yjRCrPpfcsupmbVS+2d/0myg
	9gMeO87OWvFzWTJI4xpE0knNaB8OXHwvdaGfAZT3eTbYSgIM1y7YqrG4Fi2xY0kZ+TnBf0DTI+L
	bqcIANSnc5psUdGDZia4JCDeYfd/dvVkUXUQvWxuVKGTzi7u6IZ+ypUvL0pQS3cxmzH4KCI/r1M
	tK80OoVngWoJrmQk/y7z881omdd8kH1aJllwFPPvvMpXGtGQ9Uj+0Yss8VmvSotNreEdJq6EEbR
	CG93KfJeYuIEmcgzjPc1ZR8wkyAoFRF0N7OIsPSltJ0yDRnZgKA+TaeQ47BvdwSjqrXl9tee6PY
	hUvydndQOqa55VAzHLoKa2OnYfrr7MhjbdYNxUcipdjOeVxxhkO12LCPf9aMV10QGa3ZEvrt/zG
	jaQT11fVXpAkUy12GKFbACEdIFdjTp34XmMpouPRb5+5jM4BvZG04tMOvm3IBB8qt2b0q4DdJC8
	Cqty92wmlfDfAa9ajn8vRU5oGnKOcHAwSVmvfPw+H3c0CPx5Yn3Xn/K9zWwhKK9QCyXZsFQ0LLT
	7+T50mhRw6f5JuL6YKa015oewYDX2imQf03SmGE6hrXj4Yesrie77nGTsDebpRqEoPo5SpOcLZQ
	=
X-Received: by 2002:a05:600c:4e93:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb7da12f06mr44646025e9.17.1795003645203;
        Wed, 18 Nov 2026 04:07:25 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:24 -0800 (PST)
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
Subject: [PATCH v2 08/10] arm64: dts: qcom: sm8250-lg-timelm: add SW42902 touchscreen
Date: Wed, 18 Nov 2026 13:07:12 +0100
Message-Id: <20261118120714.31505-9-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261118120714.31505-1-rofikcoga@gmail.com>
References: <20261118120714.31505-1-rofikcoga@gmail.com>
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
index d307a52cd0e62..be5b894b677bb 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -101,6 +101,24 @@ vph_pwr: vph-pwr-regulator {
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
@@ -461,6 +479,29 @@ zap-shader {
 	};
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
@@ -604,6 +645,13 @@ sdc2_card_det_n: sd-card-det-n-state {
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

