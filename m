Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919200;
	b=chO60p/3zcS/HA2cuac/7m6j7Aw4FlPfx6IMwutTenhjIp5CNjKwIlyJz+HQwa6STVmT
	 RGpnZA8+hN0DWU9EsepDwEtJhV0LSPJIum3whpw6MNPEDtF/OUTMXJG3X/caDRCtIMeF9
	 4Sl3ZmM3gtO7A0OZ18mqWY3F6JmJdaH4AvbjzA3kGuv7NtllxAtrzncX1FfAnQJKkZw90
	 UzzVjBszqSR4Dn30vdo07LZWgDD2ESsYtxPlWxJKh4k0t7eTrFnKZuzk8NRbOi1f9Deqc
	 umZTyDSG6Vkr+fYRy08+NQljPuqBLQ9XNpOrJgPBUpFAOC6Yzuui1eXgj/hGZ6dq8cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=qFNx2PFwju3GpZX8sb85V+O1VlouegAUrn4ULDGVae0=;
	b=EumueANw8OgT22/POdfB4YRb/THrCyZzQWunt+lurOCaQ89f20ScP63I4pwb8wnWi7by
	 ORyZP+/43WGPfl5n0QuJUb1YGoVZzEWMjiWNUIJ51dx8eqo3fFzz6+1ybrrDGi1/mZn+J
	 dQSzFZMWW5Rrs92eR7CszPv9M2CaeoqtQ9QdaaIsgTdf0a2ir1To1AmN97APmUF5jWYba
	 R90FRPMkI3WQ53AryxYoyiYMHBJRnWl+v9iqz8ZjdO4dtbqGIU06XJBrSy+f8ycJ45P/Y
	 mJ7J4KRk0HHT1z0d4yGk5L1h+5Fqo88P7T6ANNvBmxH8qqEhLC6h/17x6ZyR4HkIe0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="V/lyBsh6";
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01DAE606A32C
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:39:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01DAE606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=V/lyBsh6
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a210470b49so38103875e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:39:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919198; x=1795523998; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qFNx2PFwju3GpZX8sb85V+O1VlouegAUrn4ULDGVae0=;
        b=V/lyBsh6gxkoHD6nVXKA0TPVLKWRTocRRXjqbnr2UjPo3cTBWHTO1g+x2t0GJeWYtf
         OU6mnapdKuQQkEYZXdAa480Ab04nrv2nsuotmGGR/B8AaB1BF3P0Tvuwvf1I/bmAkAQ5
         knX0u9WEflKM814SXPtCWZ2DIYNtcp696loqmMdM4PwxMnhhneNpIFF/1ZO24hEtBmWh
         BxQ5oBDjpZihX2IPVo/C+sdINcMhL8oFFagr9WxGoMB2Pzlz0En+6QEp/TGmpR7Tu35n
         JwAzYpk0Au5oKmDb607M7ruAzarlKLI0jrfnU4ljGPXNcGpB3phlNdF9y/OkaGEEGfw2
         eP0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919198; x=1795523998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qFNx2PFwju3GpZX8sb85V+O1VlouegAUrn4ULDGVae0=;
        b=M+dI1KLxfgzyq0Jd9S7ADQ7zZlgy8XmUVz1KSF0oJ7QLEL2jMIZQ85dTizpvcicsSH
         xOlVDGeFY8xGUJ8mEyfVcGU8q74HCkUfO8FlX4uVYvuQ7HwHPmbQxDFpRpjDTmsjTpex
         1H8hB/IUvgbCeH5GSqFXMA+a1bdiLzeqbhvQ0qzlzgOPHZmiNMdNY5kpxosrTBy/2IVj
         77X/pe0SRVs4ZwGMc9zI8zTRA/0EcUjWBJ5dLstby+ADAo73P2vdyvdy7pUb3+mHqey9
         POb33AfE2DjZm50fcEkVKoSOlJKH9qQihGtDlIfiiqfGHQPAPyWSt7Qi0lLHD80A2nXr
         GE8A==
X-Gm-Message-State: APuU4Z/h7VAah/ptqYKHkulSTuPaBtbNFKBoni2h+q6RneZa90kPi7OX
	4nlvgFOFxlld3uhcT/fKvNX9oNKjv1NqQcVGAHZ4jeEvKG0Bt/AooZWup4pFbMS4LbB0OA==
X-Gm-Gg: AYBFou0G23hVR+qwOTc2UEtWcOtikFuBOGM/k2/RtC/zmR1EsZpbuwnLHZxwJQo5iaY
	lj5etnGUTtotiFfWdels1GB5xIXLExa75R5queaE49JrBV500xULMENLYsVfZcwrSnIluxB/sml
	y6xWcPtKGvnRrcn+a1/9wQcW/twgj6xBRiuAVlQk1XhPn945vH7c2QpxBUM4FEGtran3ffNZGoj
	bg5bkrtOjQHItHYW9LYjdCMEH92PQWYWsHnRxFj16P2iSjVF0L72YRYLYXt1FUSLrv6E37begtL
	NIdlUu3IeFPqydYsOmt22WHXfj/xT1wDbFZTp82ne92lgYio2iuD+qkfE1v96ScWG0e79xlMmCr
	k2H5SJyTQNY2P+EdgjpyWM0T2hMgS62Id3CmUepO1yfIYSZfag+/fJYNIV6/EUuUZmIbfkxozea
	9oHWGZNBOG/SZF/IZ2QaSeMhy90aX8Ryaq147yZ8yvTOI9Dx+4gpD7nxNapMuYYdy07vs++fZiK
	Tt6zUTEgWkQG3u6Ceiz/Tj4IIWxzu/9O7/q0gcoxx0EtSsGPrmnlhdjm/ZpgCuh9fTnHO+DXGon
	d87CNhRLex0KrBQECTZHkD1Nf8HvnJztEot61jBA/KkuVkb5+CxRafvJjRM//eqaN5kqvw==
X-Received: by 2002:a05:600c:354a:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4bb55abaedcmr286510265e9.25.1794919198290;
        Tue, 17 Nov 2026 04:39:58 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:57 -0800 (PST)
From: rofikkerneldev <rofikcoga@gmail.com>
To: linux-arm-msm@vger.kernel.org
Cc: devicetree@vger.kernel.org,
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
	rofikkerneldev <rofikcoga@gmail.com>
Subject: [PATCH v1 09/11] arm64: dts: qcom: sm8250-lge-timelm: add SW42902 touchscreen
Date: Tue, 17 Nov 2026 13:39:44 +0100
Message-Id: <20261117123946.668557-10-rofikcoga@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261117123946.668557-1-rofikcoga@gmail.com>
References: <20261117123946.668557-1-rofikcoga@gmail.com>
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

Describe the SW42902 on GENI I2C13 with its interrupt, reset,
power-enable GPIOs, pinctrl, and native 1080x2460 touch area.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index fca48472f5dfe..a094aa81ad225 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -596,3 +596,39 @@ &mdss_dsi0_phy {
 	phy-type = <PHY_TYPE_DPHY>;
 	status = "okay";
 };
+
+&i2c13 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	touchscreen@28 {
+		compatible = "lg,sw42902";
+		reg = <0x28>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&touch_reset_default &touch_irq_default>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <39 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 38 GPIO_ACTIVE_LOW>;
+		vcl-gpios = <&tlmm 67 GPIO_ACTIVE_HIGH>;
+		vdd-gpios = <&tlmm 68 GPIO_ACTIVE_HIGH>;
+		touchscreen-size-x = <1080>;
+		touchscreen-size-y = <2460>;
+	};
+};
+
+&tlmm {
+	touch_reset_default: touch-reset-default-state {
+		pins = "gpio38";
+		function = "gpio";
+		drive-strength = <6>;
+		bias-pull-up;
+	};
+
+	touch_irq_default: touch-irq-default-state {
+		pins = "gpio39";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
-- 
2.39.5

