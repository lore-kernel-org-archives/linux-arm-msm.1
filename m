Received: from mail-ed2-f35.google.com (mail-ed2-f35.google.com [74.125.228.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A8D30B53E
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 07:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789716605; cv=none; b=Sc8WXg4+j2dRQIKmJkszmdhlly3DnB5gfQc2e2UgV98aR99Q942OMnY1P9A6xzX3fSd9BvtqMRVqCR+2DxHNhjgRrjZ6BJKwRRCqBcR7ueUDZbVhbOke4rDDqxJST9by2IeVcEM2zwrQPQGqGAk4y9kiXAuRQBb4rv/lkURZVKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789716605; c=relaxed/simple;
	bh=tKqz8WaA5fCf8zqxAuhb+KSHy9L2ioB7dBm28PChNnM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qqFZqwYAOfiTwwX7B1oszf4qcyFCE2aJ9NM3yHRm6sHdkXuu/Vz7DjMokIBwDCKaS+aRkLLZPZ9HCNx7MSexH8q3BJ3mVT8n/DkfCTZltVEasDmfwpVbSfofCLK3JWP1rQMe279tn+UDYtLJlAOZgnb9IvZ8lAdOpqwsqQYZa4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=p7w9+/kk; arc=none smtp.client-ip=74.125.228.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="p7w9+/kk"
Received: by mail-ed2-f35.google.com with SMTP id 4fb4d7f45d1cf-6a9ab2a135dso535977a12.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Sep 2026 00:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1789716598; x=1790321398; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=T0+EbfIJEQi9Km2o4RWY1Oe967wA79enaext7ctyUJE=;
        b=p7w9+/kkhj5DvJ/KbvXEHJ+2s7Zm49sC4kRnUrDGS/7HDkoHK8RLEeIYIT4kMasctp
         VKXtB7vgwdWoDiwZn0TwMKFvsMujtsKW4IZmwgNUPsa0uqa5PZPiG+tU7mZvDoiERGWS
         ogxviEKXNdCdl9SzjKkNSI8nPc+DkJBEHhsDYWYropnTwITbtO3CH/S3QhmDgTxSGqkJ
         4+02P7zfWOKHFyskO2NTlMdn50EwWqI2DL4vSY5kUSQMCQs/7aM+D+HDeRmEjEi5J6/T
         JR6U5lvv+yiJZFzd3dYWeNge6MCVzBem8kHyLY35w+alRmR6VaCDWfn2paKVA+MpfcAF
         Nk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789716598; x=1790321398;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0+EbfIJEQi9Km2o4RWY1Oe967wA79enaext7ctyUJE=;
        b=LQceW6jEhCEbZtBkKvOXFegQlBHIUt0tbnU3YWrk32tNi/W5HlZaT47EZY9/8w8sWK
         MNQ6qMT7+GFb5l5efiHM7NRYdE2evi2zwF+b3PquCcl+mDuEm4/ju0Kul2HEFUKhhXA3
         iHscZFkq8zEvHdunifk6nvMikvO6k+gWQBumIlskLD78f2slTII1EHn9ZQjVINjkH2kh
         /sAi7iaf5DHvHpYaQ1Nhrsp5ouC05ShAnc2d80nFkAb2GeL0e6vRQuoYtdaNQu0xsRTv
         3eUuo0YaFsBOzmVcbX8n6Y4xs0QxeZM3Rl+sIjLg3IyuyGZnknNa4UzBoJFpgnZ1s7aj
         g+nw==
X-Forwarded-Encrypted: i=1; AKwUvBzve/NyzSeICY6fCMrETaA5ip9WYY+mmIwvWJsbhbTr3UIoJXtWRsFzixLvcVhdKgd/NgS2muC/15XDoNwZ@vger.kernel.org
X-Gm-Message-State: AFuF++m2ST9iXDlMIFMNYyCAz/3Wg4hvZ43zlIFhxD9yrBGoJ5mdCqpF
	p5MPXlgkLKM1DK1r+NwR9apFhcaY72KXQJYT8DwYLp4OdeHckZO62A01hevgu+WG6CQUr+lyGYR
	iggHA
X-Gm-Gg: AYBFou1m+3ZaBF7MaQbzAQLR5xWSQlUYQU6PYg5FncFePUX7B58YyN4dQ/+db1SaZQG
	4vNLO5aE2WgPNgOXckQnZK8k0krweslnfE0vOUGRFS5xBcp9yvX7hr3i2iDUu57g5H1x1T06FmC
	jOM/rPJA0Lplez6JrNNI7Shq72LxKj8DTStRZx8ahmYMYr/QovSy038xn1jK1ng7TEABf7jhadr
	F0AytfAMco7VLnKo5Gt1NO9WxFzRwxkjkEN9Ltp4fqWRAdvU3hjbsD2rhN14B3ldEE6RowRnpgV
	bBsphW1WdocWWuDZ1+xxdI0FoidUmCw6LX4Cj0tDLun92SNG1TnSCTONkeLsKOAqm27tc7rjueF
	qxYvEoRfj2OVEQMf23GCV2QMz/gGMuXTw9TSw8vf51YVzo60f/sWCJZaGjSH9qsbo8TAIyt8tsx
	zMTklRg8ILACk+ZmEx2ek39LEVYu/+6gkwmcwMhXuIMFNG9ZcB9IJuX4Xa6nDc+wJ/RPu7s1tVF
	fGyzKp9CknZ8/wO9/IUygK6X2P2f/IMOTLsjz4jFwW6n13/WxNRuKGB3WSphF4=
X-Received: by 2002:a05:6402:4406:b0:6a7:f505:ef3a with SMTP id 4fb4d7f45d1cf-6aa548a74c0mr564874a12.35.1789716598550;
        Fri, 18 Sep 2026 00:29:58 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aa58d55cd3sm462048a12.2.2026.09.18.00.29.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 00:29:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 18 Sep 2026 09:29:54 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 touchscreen
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260918-eswin-eph8621-v3-3-514eb1f622c0@fairphone.com>
References: <20260918-eswin-eph8621-v3-0-514eb1f622c0@fairphone.com>
In-Reply-To: <20260918-eswin-eph8621-v3-0-514eb1f622c0@fairphone.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789716594; l=1602;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=tKqz8WaA5fCf8zqxAuhb+KSHy9L2ioB7dBm28PChNnM=;
 b=FSUkC8Dg+KYzQ1EbVyPSln4RuJEUYkt0GCi4zrHCKl6m1CNeYmsTytFydVGIhLVu7WZEc283N
 JHQdxsdjJ/SALm7EsjPehZ2veC95aM6/MbRmVii4aLXrmNkQCsjglDK
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a node for the ESWIN EPH8621 touchscreen connected via SPI and the
pinctrl state for the two GPIOs connected to the touchscreen.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 29 +++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4b7ae87270ac..498fde3d3d18 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -983,7 +983,27 @@ &sdhc_2 {
 };
 
 &spi0 {
-	/* Eswin EPH8621 touchscreen @ 0 */
+	status = "okay";
+
+	touchscreen@0 {
+		compatible = "eswin,eph8621";
+		reg = <0>;
+
+		avdd-supply = <&vreg_l22b>;
+		vddio-supply = <&vreg_l9b>;
+
+		interrupts-extended = <&tlmm 19 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 20 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+
+		spi-max-frequency = <2000000>;
+
+		touchscreen-size-x = <1116>;
+		touchscreen-size-y = <2484>;
+		touchscreen-inverted-x;
+	};
 };
 
 &tlmm {
@@ -991,6 +1011,13 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	touchscreen_default: touchscreen-default-state {
+		pins = "gpio19", "gpio20";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";

-- 
2.55.0

