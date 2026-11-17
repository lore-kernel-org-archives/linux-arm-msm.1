Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794919199;
	b=ow4I0HeLlvwP6Dx0sFqoTi5l9Z8QzsvuKcVQOvRD6jIlrRwiR6RFIzeLjlAOhXHz3lQM
	 QcgWiREJhUcSOknQYQmuXbdLjsYDuXK5wvsFgNA9aVydCoXTbFL9qU14cyplR8jqLUrlk
	 KlsP5tOPnRh2RU2Vne3dE4dikp00m/CiQudWZtzIZ+p0nu6iMlJQt819c19WXfNajWJHS
	 /fokL/sMuWwhGBIOJzwWjGXRyYFMwE0cEtEwwxNFmIuDFpQK1CkCasU/CQ1Y/bM4BPgG7
	 qpMH9uY62y+Ni6/wSiLKDt6Mv/fuuFTY9Wtj6oRPf1FHOZAMdabnf2BmEkvtQY8WMNA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794919199;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=/HMGwwhGC6wtM16fz47LMMhy0kaE1LvMkOQV7+Ogndc=;
	b=B8agtg1duE0uzi0Q+f0AC4o4dXqqq4HG/aLTGrn4R79hrGNn3gQMAgB/n4ROLr1ukknJ
	 E+5avclWtHR2c1K8sZB8KKy3A8IFGwrLwIOsSjt5PgYvAkbpsbgqtTFEf54GI0SrgqTfT
	 2A8DT7v3/+2S0TknRek+Qd5of38CKj7RgnqyTqA/amI1/de/3vc2fypcaD3uRaj6kjk3Z
	 UgnmO8qFciiGzirNOa/lEBtb0xgVV4iP3sANNSflE/rv/6L/5CQpqXE8Q0cfso2QpxU3i
	 w+qe9FJ96W/GFWo/X6UJA5WIWvV6+KZJRNvHAX60T988vsXgzOB7cRmZG+MT6rJIG6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYvJk5UD;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1B360A5BC8
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 12:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF1B360A5BC8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mYvJk5UD
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso47378085e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 04:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794919197; x=1795523997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/HMGwwhGC6wtM16fz47LMMhy0kaE1LvMkOQV7+Ogndc=;
        b=mYvJk5UDb5fY1RAaiAbz1ZaR7v4hnh+Nf3dD2aEUknU7gJH+VMHD4pmvofPyt/7iZj
         c3YlOgiC2zKp/KFrRsgtPLolPLB3NBgB92GVn8ZJrwalll7AjrLdDslnMVXqyIpwSgME
         P7K3LvBrX+gC2C0UwdgkfyrrHkzSz0toEZq+kFu+4k0MEru+y1OFbhxFnQHZYbfCHR4j
         iEhtzr5ClE4SzLx1u4gAyG0Xmy0pWQtbzIy4BO/W+fRxMeviEY1MWGwx7TI30t9oQLv9
         oSI6sK/rUwLLvO2OEYNN0fWpaqEFqoS6bWRg0toUmL6VXaahvbx7xOa1VFK9gWumkcQZ
         baHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794919197; x=1795523997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/HMGwwhGC6wtM16fz47LMMhy0kaE1LvMkOQV7+Ogndc=;
        b=0HagHXiNVXFz1m4oseqt0o1Oakro1kcUMswNiyRj4Hx2sUzdXPFURXuPCpzbNRlJwY
         6nTT0JJ17whl11BLTqT3AMeAi7QWNDPdPF0BgOojzyLGDMWqHvWq2JAxyLQbycmfF8Da
         GZQ0m/lXXCNaJbjBej5fvv79rqJVBT4HstT8m+IJs9Zkq6p51C69tXrI8F6yne8IFyHy
         iNhKgOw6ZL3PSKwmWlbVKeacsIgcroWz6rU9kAXfFkyvOMcfeWIAvmiVAv+MDO3XdA/G
         mcAcFI1DKp4pT6k5yhEg0+rEMxQ8wFT5UDjT1e53p2uoJPcmEGbxvvdjuzUPyxWKc3i+
         BjQA==
X-Gm-Message-State: APuU4Z9V9+IN45xVA2U32civzcEF+6QfeXsVW4eZUIllzhFFKmgjdtjB
	AHEUykRQ1mRHsSBrrUXQdH0vXQArNMH3QveH/uLOGSAcf0IdSeyI98etInWSDxCaxsV4BQ==
X-Gm-Gg: AYBFou1c/IDtpDloodusE+ETJiFIYAdgbxqR1MNAH/6rPV8hIW+PVp8JFsvcaMOFADy
	zK/fCUFrxIg0DLxU/vZrbP+Mnb+jhrT+qHiu2mpwqRKL2WP7lQbE40693WaKI2trhj+LVFm0dQY
	gzyiLlfG+IlGW99GyWRVTFoXtZ/PAVOxSxqkiFos/SP3tKWw+IkRpkAoHhkqfKp+Oh10ACdUsvO
	LFLqKn4WL5awQAGPWlO3WrECEw+L06Ha7aHOfxgJGKY1kByW/YuvXkm3lk9NZ9CIBX/GirohN0C
	iI0hKYbh7M4kDWJD7myYd7UtAgEnRRt7oP63Tpq6l08oV/V6EGem/tNvywLTbsxt1+hBWym6w2G
	tdJ8N9VdnWvwY+M720qGBQEjrAAln14JDcCCkiFdWjF/CWxqpIjJMYXPYAbo3BHPpGbOcuPepVu
	0w3tBmAKxh2RnRliNrMUBPrdL1WLj1FyRUnnxFlK3F1eIp5FB59P2pDsHcciCuFtRaOefR9V1Uf
	APsw0THv4VA8zmJCQN6AQcjeOwGBF95WUg3VcAV3enJaRv8Awd7tyy5fzk4+kwK4bjTkPxNbapv
	cnzHOC8YwG3OMyGK5yWBOvVGkRUPFO26qjv8CN8kKebaN5oBEmR9k4DrX4RF+wAxVylg5g==
X-Received: by 2002:a05:600c:670b:b0:4bb:7987:fbbc with SMTP id 5b1f17b1804b1-4bb7987fdc3mr32412055e9.1.1794919197198;
        Tue, 17 Nov 2026 04:39:57 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (94-21-223-203.pool.digikabel.hu. [94.21.223.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783f8154sm71474905e9.4.2026.11.17.04.39.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 04:39:56 -0800 (PST)
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
Subject: [PATCH v1 08/11] arm64: dts: qcom: sm8250-lge-timelm: enable SW43103 panel
Date: Tue, 17 Nov 2026 13:39:43 +0100
Message-Id: <20261117123946.668557-9-rofikcoga@gmail.com>
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

Enable DISPCC, MDSS, DSI0, and its PHY. Attach the SW43103 panel with
its power rails, reset GPIO, and four-lane DSI link.

Signed-off-by: rofikkerneldev <rofikcoga@gmail.com>
---
 .../arm64/boot/dts/qcom/sm8250-lge-timelm.dts | 39 +++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
index ecbff27976fc2..fca48472f5dfe 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lge-timelm.dts
@@ -557,3 +557,42 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l9a_1p2>;
 	vdda-pll-supply = <&vreg_l18a_0p9>;
 };
+
+&dispcc {
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l9a_1p2>;
+	status = "okay";
+
+	panel@0 {
+		compatible = "lg,sw43103";
+		reg = <0>;
+
+		vddi-supply = <&vreg_l14a_1p8>;
+		vpnl-supply = <&vreg_l11c_3p0>;
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+
+		port {
+			panel_in_0: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in_0>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	phy-type = <PHY_TYPE_DPHY>;
+	status = "okay";
+};
-- 
2.39.5

