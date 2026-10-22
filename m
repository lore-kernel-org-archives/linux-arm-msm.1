Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660625;
	b=UGQTPQs5aaYu+8sm3z36hScjSy+9sQ/fT5R3VDi0I1FSKgu89IzO4I1nqNjoZ29sIKvY
	 FtLMeVYjuNZUJ139YcJ34E2EGG8f6nxsdD4HQ4hueAJZBnVujEoBhXZFxnIGLdFeF5mUn
	 +jBFaZn61I2i1Wdu+T+NLOEH7KtbJl/+Ciy4qsSJ8wP1b4dgSAd0GTE0s+BPA/aDwFdjx
	 OWEoO+iVdsv3A+SEM+SrsDapWSlbFJ0wsNeDyClzim0EG8BBycB29Exrmrop2kQHydCOh
	 54UqVmJIjVHXP/1+QoDX5uugxv2UXMnsTsmUVGjWty9nK1Q9FmW1rY8GH/xZ1hIPlFg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=mpx/tiDuJT1NyAq0YaraspAfvXRk3zMqc4lMQ7S1vNQ=;
	b=gmoswPP3+1ms+v6YWlIXjpkx91KH66Oy0FOZbPAZnl/lsAGKlJj+E997hYw9D1j75pOs
	 AsyLBXokuAvxllsfeVJr5J7nT8XWIUMEWHZh5Nmx6xC9m8rxXOXMA0T5CZqHLE3RHJxJc
	 tovp4t3rqiT6ScIFCQgOK7eYr7QmvrB3ZgeRoCsk7BSRnWhFCRpSFOaVpHDG2PM2kp5vH
	 eIjwqyAnKrA7AHhWR/8qAdD5SEjrs3HuXEjsr60p0uBRaBEN23Rc/fmr3/8TjQKWQxnSX
	 EwuUDngc8lcxupx1ZQEf2HPLewMeKkPX2CErW1+8yCrgEW63n1aMEHxtNijhn2bAcgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cf6auOfF;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E8B60A2610
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:17:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55E8B60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Cf6auOfF
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a1fe9efc0eso18466115e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792660624; x=1793265424; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mpx/tiDuJT1NyAq0YaraspAfvXRk3zMqc4lMQ7S1vNQ=;
        b=Cf6auOfFAWmlccKl7br9Gwc77SIPB4BQsbiyKpDWzZqfdSugvK/fN1E6kg61LHAkRC
         QHaZKW4v0ZZDN0wvtv3kTmJ77Bf72Mm11m7ldtmG+lgEPccLMFEAqs+8kf7cFeYyRYm6
         RWHzj6scVWtYKI8X5OtyU6fcGntQAeUh2e+nqaMp0cKLietRQgfKlfY6iCPXfmuBgZmg
         GUkGM79iB9Zw90zVvTdA2TowUpfpEnCSE5CRAiIWtLIcSbqdIZZH7UtnBtevX5K7mJuG
         Zct67ICaLgTtL5gcoUmkKZJDu8Uc8FcMYqLWrlm39q3QCojq7D0KsGJ+BCA40Lydd7dD
         nJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660624; x=1793265424;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mpx/tiDuJT1NyAq0YaraspAfvXRk3zMqc4lMQ7S1vNQ=;
        b=F2xHv/LKMSooJg8oMsR3n6eE476KCyQs9sBDHp9SOHfSOmbt8ck2Zz8cp3MdrysMd1
         NjYAj3kCaC0iS2mPxE2jZKU3aM48sUZNQuiXXxyQFXS0jBs38LPEv+odlKPWPzV3jFK/
         FSXwIVUGJEz8dy65Oseoyiz43h18lwYJYVwVxIJxfH36NoetNtTzKnKEEL+uDIhfVfxX
         QLicX6VS13wWDIeUgbL8TnD3KUiLpin7ZrLrTzOGKW6+3dMtz1pt8oUutWFGNiQgkH1j
         blEuyMsHOUY2Yc2s7ixL1ppkGCw8wb0dIeRCfSvzd/euz6s/wOdq2wkLfmISW9pciUs7
         A4kA==
X-Gm-Message-State: AFq9FYLXeKKmsSAZZL+gnPz/98P5qEGGBIaH6jzI2EznPDLDayslVU87
	e9AjAEF7LWEXbCMMmHuy6cedRCEJtB2CcZ2QUBtDpypoyqz4WPCtNpBj9yrXUMmVQ2U=
X-Gm-Gg: AYBFou3ekD2fCuZWEGz1qSeOJYxfqc/qsrKV0bYQrpg1mUaCGv2n7mzmH+AYldv0ET5
	JBSKLJ7822r7dlSe3Ln2t+rngzs34gBfkxOlyk5YDagnPI6EDIh3eHsXdCw6WHm/P9AfssQM5IV
	FsZWwamInBE7aC1eB+r4VpeoO45xMg4Jihic8ToYJlO9G3UCORwH7nfd/+v9xO04kUfY5bYv6rK
	s4McduJARbxCrYopfQXmA+kuwi6wfEfqhtMlssPmU/h3T0n4NsQt0feOtmIsD7atQYoKDtTA+XF
	hi32QLXw61a4SeeZ2IViFMQ2nh+Rwc0k48H74deWhBA5pexa85o5r0DzOH7yksoPoWDk+5i3dhb
	yD+B2evb9QJKYEL52xp9pSUsOm4QZioJ7hfQHO/QTrqNq85AHXBQFKBay9VNePOYlG58m/EbHOY
	2SeToyBTFfPmll0W0yDn4n138JWK4nqZ4y2STnsDHLI7Pt4beG0aqGlDLNNcOY0n7fYSa03SlG/
	GtLUnHUvNWuRAnKvv8eyeH+bD/sSeDZ+NkBS72yJl+6YVPibMTkRby+uQNhF9we0a8BCao=
X-Received: by 2002:a05:6000:4381:b0:48e:389:d2d5 with SMTP id ffacd0b85a97d-48e264dfe0dmr10396247f8f.51.1792660623447;
        Thu, 22 Oct 2026 02:17:03 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm11293672f8f.11.2026.10.22.02.17.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:03 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:16:59 +0200
Subject: [PATCH v5 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
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
Message-Id: <20261022-topic-sm8x50-next-hdk-i2s-v5-3-aa1030a75e46@linaro.org>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3230;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=mSEhch/t/0QkSDJ2mhCmqms/U7I2YKfexi0NQ86USzY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dSLrJAVjztrWE82gcgctFtpO4XEaHtphcE3EigF
 xFCdrg+JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnUiwAKCRB33NvayMhJ0Ur4EA
 CM7l3zTUnF6cNi4UTfOHKTZS5zLxE55mSpRwj109t/sZZWeEdfSBXL+mndutHgGwYl2hxwZ9zV134t
 N86U6G6ZnTqrjrHw2t4jh9g4AIaQMk6YEn3WLEvmRD1kpiJPexiw3OeQiMU6yyBKAgV9s56rZ8YnOf
 iWD/PmaBx0JQiNxRXr5u4vMcAxnVJ1/ryBPu/sz0YyHo+nCEgKYnFryc1Nh+Om1Db/ar4YQlh7rjrk
 WjURNouErU6pNZ0buTLeHiFoC8jIamxagLCP53IPAANm08XPbHYvaWsEa4cAKgNi0TjUFpOWL+dBMm
 4FruUfNzW7bjim4nvsMAkFF0bNzFiRjHCV7UIJ4E8IU5mi59+5m8BtCdl0QxJyL3nlOJveX/lrYTgW
 4FGuDp+owTWIC37svmfwmQ98nDXchNv9H9Ira3k9NPHoCgWMrTpuvSeGVMkpjyhHLxFEWOMz/5NKWc
 geD2sqBsXNjzymUpLeEq0/xqhTz49XLrJtxKCBZI20+RYoV5mqkDL6uMQLHJABfHk4WB9G/w2hfddg
 Uk9kajeY2dY1pQ+LTN1U0Fo3SdGlmE6cpleZ7izoWnO5+1YtGDPm7JAxzFkaGyhc1tFlcIxffWjNnu
 AXEU5H31CBRcLyxtOS+/Gm9lEJ07TBVHNbLwwKJKluLjhTfKYvVIfn46qLyg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-hdk.dts | 35 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
index 6cb0dc089b17..eba989e6766b 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-hdk.dts
@@ -218,6 +218,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		pri-mi2s-dai-link {
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
@@ -939,6 +955,7 @@ &i2c6 {
 	lt9611_codec: hdmi-bridge@2b {
 		compatible = "lontium,lt9611uxc";
 		reg = <0x2b>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
 
@@ -947,7 +964,10 @@ lt9611_codec: hdmi-bridge@2b {
 		vdd-supply = <&lt9611_1v2>;
 		vcc-supply = <&lt9611_3v3>;
 
-		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
 		pinctrl-names = "default";
 
 		ports {
@@ -1350,6 +1370,19 @@ &pon_resin {
 	status = "okay";
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
 &qup_i2c3_data_clk {
 	/* Use internal I2C pull-up */
 	bias-pull-up = <2200>;
diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86fbb0fd6472..922868e2889c 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6607,6 +6607,46 @@ wake-pins {
 				};
 			};
 
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
 			qup_i2c0_data_clk: qup-i2c0-data-clk-state {
 				/* SDA, SCL */
 				pins = "gpio32", "gpio33";

-- 
2.34.1

