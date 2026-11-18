Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795003648;
	b=f24RPBPcTNSgHSmGIYNK9Hdxz7WS+5P4hIu0S547yAHg7oUoU68EzR5KBoOw4wycycep
	 BrI2yfulmoOTb/Slj6CJRclTVTthdpFSLb3ifzOHz729wa3P1QyBIUbA2V+IyGzPct82i
	 1qaD7QcAjFhSf97OaAQWTtXJRRc7JpbPx16kurqTXiNzAY/LCMdx/ME94RuakZBDDUOm7
	 LlLaSGuUQKw1QhmJaqY2Z0Eqe22tXc9xgMo9hqxKLqQiwT3c1rDKqdwZHywhNoZSC+sfk
	 IK2FXUZkvxe67BZsJJ3PlRqF3xiPte4GXpWzrNYrLiUn+1Lo3b0oQMYb1mI2SwFIZGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
	b=zTS/SGZxFhdCVbvlcTjeIVABw7uZMnDK6gX+S3nkD2UH9MoSvhpNgRJiRF3UdC22cv+4
	 +g1SoTN6blV0N0SnW5uiTiA+Ij07qTFw/leN6SXzyJJVD8hwS15FzjCd9/n6z1ER8P7VI
	 N6EJmtx/i2riegmpWnf/jv3r3Z14OfNuypcjKif1YF7IsWCA/Kt0Eyppgglb8KAIEJc6m
	 LfKzeO4tWjpYlnIA6Ywpiyqo02uEZnJn3UGivfXtmZk4u0JikiV73i30veUMChwFizvJd
	 EbeFsFtPSUUUwjXhC+i0u5dUq72Do1yyfkVEtEdHrHZ85c6xNpyM2SQQk/kfLNqXcEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpCybyBE;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E251A60A6F5B
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 12:07:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E251A60A6F5B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UpCybyBE
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so557297f8f.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 04:07:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795003646; x=1795608446; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
        b=UpCybyBEXExg7fNyUzYHBW3rjcRsRXehyFFmfjaYvHLSQ90D5OFnveZgTMARiksJNJ
         uEo1gYGyFBz5M/L1biwqZDQpqSuBmv3z9cXIRbLCZCWB2YGoBTB5aNbXgwYOJxRmwMQy
         L5sJ5TsbCibNGc4ossOWkSSNPuTaSHaHEdNCf7qpeEonP8siaY2D3g6Nfvhwl8uvq7MK
         VQuZEzjtfY2J+R265c6K2fB5CRwrOFUpXNvB2V8Cj45FFnLMsxqOYMqoVfrw9Bt0UQDT
         DY5/T/+uKCoxo3cf2CGgoKDFlnirJjwoffAbXmcXRBC6bwGN9V/b7E0jYizr9J/2YsJs
         WGxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795003646; x=1795608446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=167OHAGXM6J7PJAqZ3MLk9kxvb+fEinCgbUkehm0fFo=;
        b=zv1ZlC2fj4+e11foZbO9rsD6BjRMOLGqAa41R7/nQYoTpVHhh7mCCy84G6oUg3ztQB
         QemP/mZ9usFLAvOwAnVGpCZNUoN6cmN54/Vi8uJ/Zja2b2PcCNGFfrzFuoloY0kGUNx0
         hOyiNGDyG7UpDsoNJcPeMInXNyDeIBegtaQLtMPerjOGPyU2Fj2eZN/t9sc6k96DhSJD
         KDq0HqGH3gEWxAp8c+9oLdYacNwHxFveCaWKMzZnOAZJkN3Y1rmG6e9Jpm4WFiwEv9gr
         /5yHjBmTGYz0yzXHadrB/ejLs5/+MQF6ljPeLN/0q22UZqffR6QxNg5t7FR1EwM9TpU+
         doqw==
X-Gm-Message-State: APuU4Z9/7+pcWpvy5xMHII7GieSYRv5jE25cE6P4Rx2yfvvDykuYRGiG
	G5qn+pb7hPX1o3XlXMdJG3jCOeiIHW51Vx6hqRe3g9jB38g1reLWI3QxCvTDKnmuIltRJ9Ii
X-Gm-Gg: AZFdTZccxBK9XxuUdCgD0xzq6E5LFUyJ77371ueqC9nQ7jWFR4jyqmIp8eUXPhgm67V
	rNR6vJgb6iLvOpQqxVwblKYBX3Da4BIfy6oehBGgfcb6e+xRtXc0I0EKxYoVMKED9imf2cRVDns
	YwC1FE02QC+qK/qgg9Gpgp9W09TGUsiGum7Rb3QaiVN4gJKzzz/Ds0pmNJHKBuBBQ8GgoMHJ3T7
	Ox13wQY8dLtoft50QFOymYdFj0E32waxl7cLE4Ob+lSKaTB/oUVfgEqnT2zNgOcxalrob5Izht/
	wU2RHYDdw8jUVYXbRut7rTGys5et7BnLXflP8r7z3nlJTrM1EoUy5FBX5CXuKRmNIoK04PyiI8k
	VirPmpnWM+BWn3iCK5KJIDA7uYEhe/rtQ1n9wKwnCNlDSvhMm5KZW7ar5+tm3uz6Tc5preOeZ3s
	4H9e5JCK/Ru9BL7o/rdfHTX2xabitUM5g5dNHQnXjqG0f50t3gWCNy5wpCDnS0xAKUtWKC+6K36
	leWqEGhHvx1Eu6IbxrtVW1bbKThMvpD/LddvOolj3zTzsBG5LGzGKFW1twQnn+u98S8SG82rjBW
	4wYYmH7vRRFJ14R8XUQnE7XTzeB8SCq3YQma+Mxpq40NwTm63OlR9/bLXiqh/Cg7M53nYSzTs1q
	VEIpjEzXTxmOp6YK43DWI
X-Received: by 2002:a05:6000:1606:b0:48e:6f84:2e8e with SMTP id ffacd0b85a97d-4a63e6f1a49mr3049066f8f.39.1795003646222;
        Wed, 18 Nov 2026 04:07:26 -0800 (PST)
Received: from DESKTOP-BJ3EVC4.lan (178-164-182-185.pool.digikabel.hu. [178.164.182.185])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c37fsm4382583f8f.18.2026.11.18.04.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:07:25 -0800 (PST)
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
Subject: [PATCH v2 09/10] arm64: dts: qcom: sm8250-lg-timelm: enable USB Type-C
Date: Wed, 18 Nov 2026 13:07:13 +0100
Message-Id: <20261118120714.31505-10-rofikcoga@gmail.com>
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

Enable the PM8150B Type-C controller in sink mode with PDO_VAR up to
9V/3A, and connect the OF graph endpoints for USB DWC3 and SuperSpeed
QMP PHY orientation switching.

Signed-off-by: Abdur Rofik <rofikcoga@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
index be5b894b677bb..12ca5ea921fff 100644
--- a/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
+++ b/arch/arm64/boot/dts/qcom/sm8250-lg-timelm.dts
@@ -10,6 +10,7 @@
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/phy/phy.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/usb/pd.h>
 #include "sm8250.dtsi"
 #include "pm8150.dtsi"
 #include "pm8150b.dtsi"
@@ -556,6 +557,45 @@ volume_down_state: volume-down-state {
 	};
 };
 
+&pm8150b_typec {
+	status = "okay";
+
+	vdd-pdphy-supply = <&vreg_l2a_3p1>;
+
+	connector {
+		compatible = "usb-c-connector";
+
+		power-role = "sink";
+		data-role = "device";
+		self-powered;
+
+		op-sink-microwatt = <15000000>;
+		sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
+			     PDO_VAR(5000, 9000, 3000)>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				pm8150b_hs_in: endpoint {
+					remote-endpoint = <&usb_1_dwc3_hs_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				pm8150b_typec_mux: endpoint {
+					remote-endpoint = <&usb_1_qmpphy_out>;
+				};
+			};
+		};
+	};
+};
+
 &pon {
 	status = "okay";
 };
@@ -684,6 +724,10 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_1_dwc3_hs_out {
+	remote-endpoint = <&pm8150b_hs_in>;
+};
+
 &usb_1_hsphy {
 	status = "okay";
 
@@ -698,3 +742,7 @@ &usb_1_qmpphy {
 	vdda-phy-supply = <&vreg_l18a_0p9>;
 	vdda-pll-supply = <&vreg_l9a_1p2>;
 };
+
+&usb_1_qmpphy_out {
+	remote-endpoint = <&pm8150b_typec_mux>;
+};
-- 
2.39.5

