Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008243;
	b=Fd6f+5q2rHaI2vAXPnJ4618TLaqCxUdxhRIE835pgEGKhm6vi699J+XaWnKZ+sSQDd97
	 rOtaEncpvtzSMEU3h9ERNnveb5E1iWN/mEIZxC+4XzcnlpPZtfbP+N2CZm3fwZQVMcEym
	 uhsTRhIO2+MWmdZtEeLzwQ7z6eNOhjUD0KxEI3J0//M55RAvJlZcWHzj+XdhDtzl70g1n
	 uIKQKAkTsMyx9hIw5iVO8YkuY+ZbFF46EqFoE5RuPxdOAroS0yRvYuEGjuW+Dr+jvhvSQ
	 y4abSy9lPKel0Nm+Qlupua2KNORgyw8loheEJaHQcuUaV6oGFtIUbZkvRJsaNF6n8qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008243;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=iTlMlESfL4rLPAvmNwppCO760YIWvCUQc6OUkFEHau4=;
	b=OJwyFFTeCXfL1cEn8iz6sVb6pBcxqv/cwlyPJC8kd2YxFX9Txf9234PW0zlEH4FchNEV
	 RgNqajCnPQhFQ4iencN4hSVKVIUOia8H+ryY0CZNpb+4QSqXXqYPhUCUwy+YhDO9jlsmc
	 iXA2hmDJtp1Hdbr2D10TRfJmlvVdiPPIb4bZNpXruRQaD4lU8HRKyFZm6hCW3t7QR4MvE
	 05Qhn8yxogJLiUScQ3466LazfqsihBBE+vcDpxKYIFLdOtTkWs2mbB3TTjTb9qkl7z3Mo
	 d1i4Mat5/RiR92S6RatwE3sLm/mkea1uD9bA3JpHS8pJauy9YmvMTRhLaqFahGja9wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F7is+5K2;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE99B606A32F
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE99B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=F7is+5K2
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48df8fe8513so2600590f8f.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008241; x=1793613041; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iTlMlESfL4rLPAvmNwppCO760YIWvCUQc6OUkFEHau4=;
        b=F7is+5K2ucn5Lux3FzvFkjnN7KM0e1gwApOITHa28xMpicli6m8qtzxrDrJv2sIsjE
         P+iUw8JVmg5tbRQlxBsWnb0+PtTcii3rIl7edeuXMhTfSWtVnPyLgLfUOeDL4v3Juo4o
         1JcnR0/OUPa5Jr2Hk1dVqK2Nh8iGtrRj8VP+U5zW1oLmYqOvxHTWL2Zh5dNdKu1NmjQh
         T97sRjEx04uETyrArKf/e/MTmrvLuKAbPv7rTCuC/JAaMxqZK/FwJrSBHJ7W4gEWUJjg
         2zWVWgm+EhVMnyhoV7Je69wsvTcmGeuqgsIAdDHiPzw6eZvVRvr6J7qTlxMLkG6i5nPf
         a71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008241; x=1793613041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iTlMlESfL4rLPAvmNwppCO760YIWvCUQc6OUkFEHau4=;
        b=FL1IdJf+WYov1slSRhT3i8VdEkNCy1K99C9f4pCyT3jTqbmBPu6doQwf+RP358sTBQ
         HjfndHyxd1yBEhp0QaF1KN/+1kogMPCVY6HV04goDm5mEehhqB7VHd9HSUq6SVVPTj9T
         tofhfttyV3RktDvNbNicLTVZFb7a0aaMMXWlQjOgPfUfJ8rs8z4gQikROnmG5LkYkD25
         nxlLOKSsBpseZur/7QzFeEXZX0sQbRUH/qelayOPjK6k/ipN3mgTwaJDL2D0C9yyHr5G
         nzG+p/TAbSD2Pm5ktvUUL4R5p2V8vISZuCoAeYxjtWWTIzpjsXswsvvCO9lIwG28junr
         mgoQ==
X-Gm-Message-State: AFq9FYLBO5DFrCDkNBYW2fasucJy9cX25FxLycyXG5YvefouJhniS8d5
	O+NydzoIw1S77pIQ5+Q4ufjEizwjLQRcUaqjLPSqv3yZ6ar3P5DaY78Y+VZeQR/lVZw=
X-Gm-Gg: AYBFou2AnYgBNPuSjzCyB8BM2oe81mvtAKm98DTQM+znuzMKow7vHnt8un0ZLff78Zu
	5+E0QoSFEYlzK1Y+K/fgBBK0x2OVyUvlDVslQp7Bl8fSUuW8Y0klYEVkKUv67NXG8R+GbCc1zMa
	0QdUnB8885eo7flaezykS8x55Mq5txT15t3aI0/5eIgIoQrRMnnn3s7s9JwakEd0LkrcgIE1g+9
	N0y38PXtNnkhbtaz0yiCaK9E4ALR/9bsa5/ZEl09S/wLTJ0Y6cT4WhRJLdTD5BzxNDq515umbd+
	VVdpVKOwcGN+huHSBi+SE4i0hjExQk1GrM9I7pOJkeCAFiad8UlETtQhvduLKPwkeJ9qRScq/Za
	7VoVJ0zPWzbpRAOKkva9wf3Gq+tj92xQLkE/VF+qKMRQYOqBKWQhQlkGY+8b4xqkwrwGxpm9TIm
	RmUG/IjPvLbsOAGUjvVurdvaKE+ESRhVUShtFS1ipPBWk71uSeE4lAF8s5slewhBKxTPbY97L5k
	NFOZssmcxR9aWzZUbnMbhk/+cLYvQitG4jOgMFf9mY+LlQsLmw05AuSCb4lkC2gRW1Uw3XuOAAc
	8et2ab+G26AAdVXLl8FgQEo=
X-Received: by 2002:a5d:6802:0:b0:48e:43a:1d84 with SMTP id ffacd0b85a97d-48e3eb84b42mr7754270f8f.23.1793008241039;
        Mon, 26 Oct 2026 02:50:41 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm15524019f8f.17.2026.10.26.02.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:50:40 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 26 Oct 2026 10:50:37 +0100
Subject: [PATCH v6 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
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
Message-Id: <20261026-topic-sm8x50-next-hdk-i2s-v6-2-0bd654b8388d@linaro.org>
References: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
In-Reply-To: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4272;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=DBU6aEWpFeldJvEhVyNw5nM45lTjZPPDxXeQET9eaSs=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq3yJtopN+tQVQhUzwr+CbpPt9AHt/K8pNj3lS2r3o
 En0j92SJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCat8ibQAKCRB33NvayMhJ0R7YD/
 9AJJ705tbB6keTXNNds4Ta0MNzljSK4BxrGq7E23JWAjBlPeoq6Cgrudsnvc6gP+T90EGCDGVgAcoW
 VIo1fKkPZlY+6hrYGSMpMsC4RK3ixWrZxr7IEHD8LYntFt6wWcTt2c2rEa3aPxMgLd6qTH827dpvlO
 D9EgEQihrlvSn/gCEmF5RsnnTltniPGRGyUQVrXgHf3pkOOg5qxT4qPnk6KF9Y/iX1q38tpH9ajyEC
 E5fpxV3kVVUo7osJ9WdaDeT+xZJPHdlpcvq6QZmqNqm3955RdyKHgrUctxnZ/qAm4bff4C0wWcSHRo
 WS9b0zXoNL51A3Rn/rVN/K/MGI4G8eWnmocYQDfri1vAnkovg2o735vWBdRTTLq2Vj1PxBbO7CJV8h
 a6JLGcUqCdTdNT4mQ7flUrqfz/k0hiTcet35eoqm0Z2aKM6UCjjGHDRFyXZch1L9LpXrxQU03jICDD
 QOCOsR0EiERL4WPUTVNbYGgag0ffaJ+PZ/fLLWjWfG1+B098IlvrZQpcay9H8YJ+ppAWcPacvMGHF7
 8NRB+7Q+/aKTdbvIVCOhbHqIRpgf8KSKpZmovIW+G19Yc6OqqOKc+HqHwuDVrr4HqUxvWC6zd1qWT0
 tr0RoFkCWiAkNI00lvsKOoxW8K+SPmWG0uJxTeq4sOVOu7Rz+02Ud32p9oxg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 .../boot/dts/qcom/sm8550-hdk-display-card.dtso     |  4 ++
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts            | 36 ++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               | 73 ++++++++++++++++++++++
 3 files changed, 112 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso
index 7b54b084b8bd..8d139d3683be 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk-display-card.dtso
@@ -66,6 +66,10 @@ &mdss_dsi0_out {
 	remote-endpoint = <&panel0_in>;
 };
 
+&prim_mi2s_dai_link {
+	status = "disabled";
+};
+
 &spi4 {
 	#address-cells = <1>;
 	#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index e75e3b878e89..226717b128c8 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -278,6 +278,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		prim_mi2s_dai_link: prim-mi2s-dai-link {
+			link-name = "HDMI Playback";
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			codec {
+				sound-dai = <&lt9611_codec 0>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
 	};
 
 	thermal-zones {
@@ -974,9 +990,14 @@ lt9611_codec: hdmi-bridge@2b {
 		vdd-supply = <&lt9611_1v2>;
 		vcc-supply = <&lt9611_3v3>;
 
-		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
 		pinctrl-names = "default";
 
+		#sound-dai-cells = <1>;
+
 		ports {
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -1421,6 +1442,19 @@ pmk8550_sleep_clk: sleep-clk-state {
 	};
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@10 {
+		reg = <PRIMARY_MI2S_RX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_PRI_MI2S_IBIT LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
+			 <&q6prmcc LPASS_CLK_ID_MCLK_1 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "bclk",
+			      "mclk";
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 03f6d40edea7..2a78f8f89f1f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -5564,6 +5564,79 @@ data-pins {
 					drive-strength = <10>;
 				};
 			};
+
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "audio_ext_mclk0";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "i2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "i2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "i2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "i2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
+
+			audio_mclk1_default_state: audio-mclk1-default-state {
+				pins = "gpio124";
+				function = "audio_ext_mclk1";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s1_default_state: i2s1-default-state {
+				sck-pins {
+					pins = "gpio121";
+					function = "i2s1_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio122";
+					function = "i2s1_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio123";
+					function = "i2s1_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		sram@14680000 {

-- 
2.34.1

