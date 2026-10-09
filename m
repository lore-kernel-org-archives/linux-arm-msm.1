Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEDA54C8C68
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Oct 2026 11:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791545121; cv=none; b=beRhFUkMapFe5dfqVN76poYooBbaJD2c5DX+jFqbWN5aGFLHwFg6Ix7/HtohxCQ+e9uIx2/0tNbCqYiI2BKR7hErzO9PPlEaIGsKnbkOHnKTU9p7p4BbchCqC3QGWrdSuMX7Ho8H4nYJ4NfOab6oVRmKPFepTf08QCfuZ0dQXIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791545121; c=relaxed/simple;
	bh=K/UuwAdCDzSNTdbtCp/oiK4VjRQqMyDj/QIu8/Tze7s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gghidi+ztCc4xvH1SpCX2OeHvS6pqC7gIDYdmgh88tpud6Lm11tWrklcz8cIhy/gxqzeD+ZOtMsP/VBkheH7BbcvlPufnyIr2Gfw1tqxLiW6XFx7inuEYW6fw0a2Cts8RZtQax1rgk7Lk5SgBYOhTBgvqpOAkePKU2tDmWKfBQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=EHdwTzMi; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="EHdwTzMi"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b16824c0fcso2039908a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Oct 2026 04:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1791545110; x=1792149910; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=365rpWbQTI8r+XdiFb+KF1sTOX5DYF/iothdwDHKaSc=;
        b=EHdwTzMiTjdZbLMA/h1lqRsfXHXfVAfO4QghI2VWYjNb/tf0toHzR495NlzuxRbG2k
         4AdtS9MML6liWkfK5pJzr5XAyX9ZKw5llpvd9i1Tj46GRIbpZUOHNPmzt6tMtNEO3w2b
         GpE4ai882MtPjH9zPmpq/SGX37SamqUPcP4SR1j1TL6yaTgx1NRCzYqdXHmvruE+pbYE
         U7/WXTC4z/4EWSZ2IssKuOnqOG0WjQSbiESwpzT7f4EcJ3NH2u8db5YJ7jWbyJaTRAPz
         VGgcAIimbCY/o/ZqAElE2e5nGSztD6BCRRF0P/PAc5IFYdEMY1Kdv1jATchy52W25eQP
         HrgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791545110; x=1792149910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=365rpWbQTI8r+XdiFb+KF1sTOX5DYF/iothdwDHKaSc=;
        b=BhzSYspMYkOTOGMtZI9AJqXGv+M7Z18U/CdCj7XyEf35iVzRptz8TG8QWRT3MD3aI7
         00xG6fvpEfyt16bEYo+JJBuC3yrgBU6EAZkXFetwUycD3XKTfmAePCgP+3IWLbA7y7GD
         c63bxQE8WmxMrDz81B68zCv+l8nlwHmT3ya3mKMrc1ckZDXyY2DPUNdqfm8o9Zl5uUrE
         knaaBZxTuDN91rxNRQK7FYyGFcmMJN3zydAfRuZhkv/ocWziYQ7hewx42JJ6H4b9N7ae
         jaBk8e0W8WReMbmYiSIXOpooIwYShplmUM0ybqHmWoHrBBF2QAvqq6KGb2gi263n1Mdb
         iRzg==
X-Forwarded-Encrypted: i=1; AKwUvByGPQGoxc8hLkEO2muIaHsvTzz7BWx3pCpffe33QbGFOLWAQz593YDSMw5GWFwJJ0XoFtNvRtLgy1MNlZ37@vger.kernel.org
X-Gm-Message-State: AFq9FYIFgaGKMKwsQB4Gud5f8L1y2BG3otyVtzMObGM90tJKP4ExkMTn
	xakNZZexDp4Xc2p2GhtK5v17j+allzXRLYFkjvCAjXnS3QnVZCXyCQrRTeXwVbupZ6I=
X-Gm-Gg: AYBFou0An1zjlc7Tp3VgYglW/y+a0j4hsCytvceNoFPIyNAJxYHGai1D5yNxIUkEB6d
	FFQYpQcFrWGGWfc2Gs11JE/FtrvBFhmyFG2hJe3wGajUvPpIVdPtKWqCM1MitBYHcFf32M+l1gq
	DkaGDujo8a74M1RUYlTAMDozjY2ScIUdBEk43GNjEmhbGwebG3KFi1cJGZdEjlKCdzPMDW1vG2s
	+B5XH8rp9qA9KT7zjuxAqjzJgKWT2gtULs0g/2mOvDJ9LbgwvJL2/6pHnV41nFxMCxkhslKvaQu
	HmfWgi3Z7V16Xb1wsOy7361Zkl66FUGUIF02g5d75lWjd2cJWRbPYkjRhIVPRwgus+UbTxWQiZa
	Dk9iYKGfCYRWdcN0Da/GmTpzGVIvIptQFRruQd0xdqqr4HzJbU6BLqcayQQ3mj4MzRkQg1r5Jj8
	qrOmruUSilOOgQCwzrmWY5A4B2fKbRjke0VyWsD6Xm6OigG7reeyMQ74x95N5AmgDISiAYIE0YO
	zuBTaCy99HIKW3F3c3ofD/qih6HqL9TTPXInKbTvHeaMy5Wwapf
X-Received: by 2002:a05:6402:190f:b0:6ab:6e:a8e4 with SMTP id 4fb4d7f45d1cf-6b17c2919a2mr1279444a12.44.1791545109895;
        Fri, 09 Oct 2026 04:25:09 -0700 (PDT)
Received: from [172.16.220.101] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b179dd3597sm985764a12.14.2026.10.09.04.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 04:25:09 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 09 Oct 2026 13:25:03 +0200
Subject: [PATCH v4 4/4] arm64: dts: qcom: milos-fairphone-fp6: Enable
 display
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-fp6-panel-v4-4-7c3819664778@fairphone.com>
References: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
In-Reply-To: <20261009-fp6-panel-v4-0-7c3819664778@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791545105; l=2284;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=K/UuwAdCDzSNTdbtCp/oiK4VjRQqMyDj/QIu8/Tze7s=;
 b=+RENV5BTwuJZenkB/tqi4Ledclqeb7XKWAMWUX+RVt0JGWYi6hJZJFY91iUXFwZmz89TsCRE7
 /oHOtl9hGpoA3+AJesVeUI7yU+ifKJovTWzz+fN4xrzyAidTMUrrqNm
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Configure the MDSS nodes for the phone and add the panel node.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 64 ++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
index 4e8777162b53..11015c3fa331 100644
--- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
+++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
@@ -709,6 +709,49 @@ &ipa {
 	status = "okay";
 };
 
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l4b>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "boe,bj631jhm-t71-d900";
+		reg = <0>;
+
+		reset-gpios = <&tlmm 12 GPIO_ACTIVE_LOW>;
+
+		vci-supply = <&vreg_l19b>;
+		vddio-supply = <&vreg_l9b>;
+		dvdd-supply = <&vreg_oled_dvdd_1p2>;
+
+		pinctrl-0 = <&disp_reset_n_active>, <&mdp_vsync>;
+		pinctrl-1 = <&disp_reset_n_suspend>, <&mdp_vsync>;
+		pinctrl-names = "default",
+				"sleep";
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&mdss_dsi0_out>;
+			};
+		};
+	};
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&panel_in>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l2b>;
+
+	status = "okay";
+};
+
 &pm8550vs_c {
 	status = "okay";
 };
@@ -872,6 +915,20 @@ &tlmm {
 			       <13 1>, /* NC */
 			       <63 2>; /* WLAN UART */
 
+	disp_reset_n_active: disp-reset-n-active-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+	};
+
+	disp_reset_n_suspend: disp-reset-n-suspend-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
+
 	sdc2_card_det_n: sdc2-card-det-state {
 		pins = "gpio65";
 		function = "gpio";
@@ -906,6 +963,13 @@ pm8008_int_default: pm8008-int-default-state {
 		drive-strength = <2>;
 		bias-disable;
 	};
+
+	mdp_vsync: mdp-vsync-state {
+		pins = "gpio129";
+		function = "mdp_vsync";
+		drive-strength = <2>;
+		bias-pull-down;
+	};
 };
 
 &uart5 {

-- 
2.56.0

