Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763493E557B
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916119; cv=none; b=pQ4M03xd72ZeqFRikpnOPhHRGAJhRU3yHZmO9uEpb4Xqj8Sc9umg3vGN5LmQNU/QO175uQd46HilB8KUvnWRY+OIp85QYSmmljZnsCstrEbXFEQXEcGYWpDZG7IJyMw5cPq/q0VYyTV/VbkCLWsDuAHWvi2jXiiiBvS2i167TAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916119; c=relaxed/simple;
	bh=B0oj7IPoAVGBz94ymMG4pfIBjforEv3Dw7BYzs6RVjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rYLVVNKQDpjgSj0tQZzb5FGnnpWCxYN7lHWSxY8gbjJnBpDnaWvoo1xWazRReNaM/Emkzkenv3kGT+/Hfvib0ou3d+HRBdF6nk1PXuejehpiH5rZiu4ZrOfKf5OmwqzrMRMTLB1lqJ8L+jNiiUT5U9yNQSTzcHWsIIvop+7W6lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P6gt6iXx; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P6gt6iXx"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fe377a217so400540f8f.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 00:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785916116; x=1786520916; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aM2OHbywSp8bjqWqp3v7VngVX1T/uRrxOCcio59Wb74=;
        b=P6gt6iXxB5lujd9DB6tEfRblrtQWG5gG/j/XAnDaIqxikF7YUGUmoVos2CQtxPSJhk
         FVFsPzw1RQx8QVSB/19QNpPCOzq74roxHhHiX7G6SDloPXrNb/IKyrddHIJ3tuZJjeB9
         BRPEzmkNEjSvuiX/FApAWQw/chpnbuRNC9fF3Tk4Nd4y0Cw1/IaVfbrWd6qP+H3HHRE5
         +MOqB3V0lhz5f1mQz/HyJVwY+Qp5kiFsujy0iyhXlep6/97+Jm+EvroAITBkR/tLDNOJ
         +H+nFZhDmfkg19Z9KSsPBFy9Ca50873oHnmdK0y+BnkQ8lajDHQObjIoK1LtUr4ezWTs
         aXHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916116; x=1786520916;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aM2OHbywSp8bjqWqp3v7VngVX1T/uRrxOCcio59Wb74=;
        b=cWcB/E67ufdIFJmJxXP90ypAHt/nrbvlKxBUT47ALf1bjxH6kW1pRFueVj8XYU0vt9
         5QRoFhvYDFlliaKL7ecmLIs8+D6WO89AYSxrPGQ7XLtDXI3PKzCqwB3z0U4KsIiNz7H1
         8QT5JSW9PtbZgPOBye+KGsMKeau9WWeeId61zAEYHg/5VN7DFzm4EFozOHUku+w9Dhcp
         jum05e4AuzwkFtJHe7Ep/rmiWPHy/VQA1K+tcBa548engeobHjxS9rOcHJfXXYnIBAp7
         jJ0rtl3+KAzK7tgQtg3QEyiddgkTXGvdvyPZf6Oz+FlieBlCFZ9SWnCE6wgMuJNvQ9d5
         zpjA==
X-Gm-Message-State: AOJu0Ywh44ToxxVOsVxswn3wqXFr69vchQXaUYR5UXghU6paheUdmteN
	GoyEA/uG6cHeGSGlpNLpdCnBPGdnbLDPVvZcH6wSDmzkE20oJCj4/HciJJwbZskfP0w=
X-Gm-Gg: AR+sD114VdS87jE8T1yIzR+HLxpskl+hQSqJebn3JkX89BUhn4osbyrpR6ELsLPavQ+
	NaCs1PQgT3tyDQumutISuFz3AxeFPuDb9CTkqpWDxC2geqWw/NwKIwrsbV5mFLzebVIHvNhJ9ti
	vKde0Cx0D1FReXbYGO7oF/3jumoCkFRQNO+qoJLdgLkHAM5EMsf2GS7ToiRmlCO250vI3LdkKJZ
	2ElIBNyV+fpZXO21QGwqCG5MIjFpjC+5IY8B0fd3nJaRndv6N+ZcizrNzjeU7B7O2Wqx3XpSqP0
	ZcZweO1qM+SsY3iaV96wg5ZIZ2yj+UucswQDADZ/aIwyVTQ/tGVEpTdePjHJQpLi5RXTBSp/9am
	j0zcz5rlKJs2Wi+cq3jmqZ0X4XsjGb66Ws8HgQ3o4xnQdLuWK0dOqA5HdhlsDVX733XPvTg/Kp+
	9OPIN6Q9G7SUWOs5HACCIL+3nqTB7mhFAe3SW/1lIaWE+HN5OfNae/J5ml9uTk+5bNaAZHC5sDl
	4ch3A39Pg==
X-Received: by 2002:a5d:624a:0:b0:47f:9750:26cc with SMTP id ffacd0b85a97d-47fec630b5cmr5845000f8f.23.1785916115597;
        Wed, 05 Aug 2026 00:48:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febf7e5bdsm6470840f8f.0.2026.08.05.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:48:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Aug 2026 09:48:31 +0200
Subject: [PATCH v3 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-topic-sm8x50-next-hdk-i2s-v3-3-07a6483c430f@linaro.org>
References: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
In-Reply-To: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3243;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=B0oj7IPoAVGBz94ymMG4pfIBjforEv3Dw7BYzs6RVjc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqcurQuGZA6V8HJ+8Ju19GIwi4Njtlkpy5R/yHK7Jq
 cnsyoOuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCanLq0AAKCRB33NvayMhJ0a84D/
 98IUCjGoGenLnrN1gRQEjkasPc/4Ju1xg5WmjwCWDvjvLbBW/94aKAtmmTTIE8eGoig1eEmj/pbc3O
 6hmjpw/JSnkY0RyuJpYqFEQh13lUQSArJtEFTgjGxQUT8rUTkAjuhTrx5vYZhD5mQ3slQe8XLZ56G8
 sPNmi/1RJDV/od9szLOVTW5v0TZY5ehuE8tfqXIVjPOkXxKaeAsAebXF+OW51Ua2ibCvq4cWQMbeKi
 fqms7PHQOjqtRUJmgGBzoJL8u40DlJ2PWRjY07tWp3k4E0XeHA8QzNe8WcD6T5CkqmC19mLXCxjyPy
 3gzZUKP5/kzwTFrbd74BwgmFZjI59fYNRpLDX2vxsAZ1BbRBqMP+GnR5SxkYlps0BqKN+jQMpvU6fn
 lhwuA5wyF+ye8k0XUCVLnK9K2LUg0374DFkjZtyiUU8qC6pJBZiRmHriRQpNP+xM8Pdlw3058iHk9g
 LTex+4lTP01wlqnK3Cx0kTxUOlp239WMKEklZTkJK5ZLSgdKxEypBUA9IQA/jVvj+e8ytK9Y9ApdTM
 XlRi+t5Y7XMVf534R0xj96NpN0B2aRqgld3BcbDm3xgdtu0WyemnqOUpS6o1vc87EBMVsIOb0gShyc
 svDjO9wbU4QqRJYl40EVEwB4gckqo+z59Ld5wpAbyPbJjo9y+ZhhYIPSQM4Q==
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
index eabc828c05b4..5930eb242a61 100644
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
 
 	vph_pwr: regulator-vph-pwr {
@@ -853,6 +869,7 @@ &i2c6 {
 	lt9611_codec: hdmi-bridge@2b {
 		compatible = "lontium,lt9611uxc";
 		reg = <0x2b>;
+		#sound-dai-cells = <1>;
 
 		interrupts-extended = <&tlmm 85 IRQ_TYPE_EDGE_FALLING>;
 
@@ -861,7 +878,10 @@ lt9611_codec: hdmi-bridge@2b {
 		vdd-supply = <&lt9611_1v2>;
 		vcc-supply = <&lt9611_3v3>;
 
-		pinctrl-0 = <&lt9611_irq_pin>, <&lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
 		pinctrl-names = "default";
 
 		ports {
@@ -1072,6 +1092,19 @@ &pon_resin {
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
index 160ead25ecf7..c1beda2442c9 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -6540,6 +6540,46 @@ wake-pins {
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

