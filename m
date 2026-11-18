Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003646;
	b=DFBLTQMMXnbyYwB3gCtUJ6Hs1nlnlZeVmgy2LpQzSbSTIiPg+I0V5VoI5zB141UlgJSm
	 aTH7ruwpDHfwa1xsFRGayICz6nBSV8G+JOHZoF0nniYcK62D+QYPvLpMcob2AC+BINlsV
	 /iJ8wWoDMl5THF7iTTZb5dvtIFZD417ni64aCRid1PO9KoAmzBLRsMQD8mSvUm18qJb3J
	 fKMu/Mk6FEKuuff2W4sJNw5T126LodMs+pRaD2nPtkbvIH1jy8xr53knWCSKo2xhniXSJ
	 kG9WtXmWFTMJSxeE5/c4oDjC4xfR/MKR+nlsefSshq9GM3RsG7qeUaJAs8H5sD84Gfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
	b=yqM4nojdtiGreHs5vDMM0iLipHNXSSBFOM5o+5QckqC80ZvpseDkfJKG1kZOWFHHxxY+
	 R1+APGvOOmADOVN2161hEmD2Yn9OMfmr+vQjOnUkAgw9PUQCqJYXviH2KfiCy/xeOTk4o
	 ZWlx6w4FE42sINd9GCFv8WxP7MzZt2WPf/I3rbdU1AEfPA0LZedXveFjo3uyP4vbeyHlU
	 ct2kuwm6CXozKNmkwYZ55aTp797/zx1n++7fIg+FODuVBKgz4oerZCwnW5HuxJ3cIVwfl
	 zjKdQ63LwX30+HFZlIhyE4HowDxtr7JZSGecVDR3+tcPvrye+3ypqMVePvtzC9xjdXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="fjBWl/Oi";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C3D60A5BD7
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:07:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8C3D60A5BD7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fjBWl/Oi
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so9151825e9.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 04:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003644; x=1795608444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
        b=fjBWl/Oi0VKXCaXt0gJoCoC+8oLAfwByWw3J4b/IF0xfbjhWrRnVrP9YO7cQFxn6Zx
         /O9tL82nFc7U70oE0uGKHUk0JZKSwaBoGthVZp2RSXE/iNvC7I+9gZ6mp4Rn6bKtAJ2M
         LEp6AFxdYoxF7BYKrjrYj3pRmjemV+DeeLgAbTFuH/zymhi7LYt3zXc2AhS1ZNuz4kBM
         T8wQhx5EhhECRFJpshxJyI/oLbyGX4CK4kr2hjy9UrUGbjgF1KUTR7faAvbwLMcYdBQC
         I4Qvzoyy/jgnIjrFw9gI36mbD8ooCFPOIKJ+0J2CrCWDUEWXzJpLPe8bQKNu6piLEFF4
         bjkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003644; x=1795608444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vs9tJb/h6LJRO+aSwhkp7pdT6zxOETm4VTGXKNC7Dbs=;
        b=OC0U5Uu/O86tnbylNdetMAC60W6Kaagm2Y5M7rAAoUWRmgXGRbfwyi5cJlCcsh8OMt
         v7kT+/y+XKubTBtYd09rHHUqXgREDE428/clk6grGvhxItZPjG9tcDZNYGaSSjvWiRkD
         EYLAw8UiMInZ6B2pxGxffa0WztFReJrfta0gtqriZv8Z6zbSoY1gm5gY1/WncWBxLPjR
         HjMMMfuu7D5hOyPvDe7S5r0WhCoIRB2YRG1ZLzZ1qla/kzTPyWd1/W8D1jIgYf8YVNyR
         0qeoukip2lm8m1kngY7e1FnRggWdsjmVhCTmz0/57sMfthtIdmQt8DtwnSANh4tIUEJp
         7Ypg==
X-Gm-Message-State: APuU4Z/ZUTzdXhPuP6QC/JmVdi0LyWm+TG6u4DJFI9chIo5MXgusDarc
	nDbhHhqzjpzb0uHFVP1EFh1d2uuH5ADN7WOfOaQjlNaQoEAcLlh288Vfy3iFdlqsOO4DoTf0
X-Gm-Gg: AYBFou0XOGXAN/T9/l9oGys4tGriNwnWv2lymSZTBfYnv0Q7qe8yfj3AfgDx+bm7unt
	kuH49BXcQOAxGZi6r3mtDoGovrqU93YPHib8MFEO2O3ZbITBeIGDbI7/5duL0lDXtsslUDCRKHx
	1cyg+wjSq2p1/pOgLvMOfprhnL+SGWH73FNZ3kSTKGAhGur6wF+FiCKVz+0WU+0BL7L2eYMj5rg
	wg0WFDsTIh5FZbck9btNFY7d4qNvE7rNS0nYXD1BlIo+ryJBhDiY0TX+845V143199iAh//M4xG
	zPfyhKxru6gTGJn6LYq3UvTFJm2OAhh98EHVodXEUHH1YlMqeJ+Nq2EtYjzj6ffGUC9QlPNMhnx
	zxXVJ8SZlKTApSZLXgfvGjM/bSruvdI1EjGNClgHeMPmGAVmDl+ykdQOmAtirfEndhIg7T1M7hU
	+Yh/gx9rmrP6jDPEhRQ7QH3w1VwvT4ewPZyk8JUwPgEZ7I0y97VPeJ7J7wKg35jCvoUvcAG2WDQ
	LBNe9IgEIJ5NOEQIHvh/3bxeFIE10AFb80TwG9ZpQy1eeEZcprD9Q546cpihbGHiY1UD22eltcZ
	Inqhqsk1SW2w9YC73UsSyJIaOtRT8ZTk34aztYESSrOYS3CgpfDd1/imi7/7ISH27HzG6HSdeGg
	=
X-Received: by 2002:a05:600c:1911:b0:4a7:7f3f:6f8e with SMTP id 5b1f17b1804b1-4bb7d57bc33mr43616545e9.0.1795003644117;
        Wed, 18 Nov 2026 04:07:24 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:23 -0800 (PST)
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
Subject: [PATCH v2 07/10] arm64: dts: qcom: sm8250-lg-timelm: enable SW43103 panel
Date: Wed, 18 Nov 2026 13:07:11 +0100
Message-Id: <20261118120714.31505-8-rofikcoga@gmail.com>
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

Enable MDSS, DSI0, and its PHY. Attach the SW43103 panel with its power
rails, enable and reset GPIOs, and four-lane DSI link.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index 1b2b67486fee7..d307a52cd0e62 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -8,6 +8,7 @@
 
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
@@ -460,6 +461,42 @@ zap-shader {
 	};
 };
 
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
+
+		reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
+		enable-gpios = <&pm8150l_gpios 4 GPIO_ACTIVE_HIGH>;
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
+	remote-endpoint = <&panel_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a_0p88>;
+	status = "okay";
+};
+
 &pm8150_gpios {
 	google_assist_state: google-assist-state {
 		pins = "gpio1";
-- 
2.39.5

