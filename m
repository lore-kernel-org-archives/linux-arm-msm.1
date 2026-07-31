Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1363BB130
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485160; cv=none; b=gYMFD9hXwiH4XK4uXoIUxnnpSPVzlh/OPcEPhmJ5gRMRFqSTKTLIcsYYGcM0BQoHWRzWnkpJt5uNmMZlC3cwMUy+lv5ioEszGct5lgnei0gefjP06zySwneJFB1gxY8rqs5Jmk29eEWalCV61wL6NjE0WZV5fB9/DAJ4k9ZPAq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485160; c=relaxed/simple;
	bh=M6qIODsCdMC/k36UYMJff866rnazmYTgUJRHTsGaUq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dQwUVYrJUJzb4Hx6/vrsjL4hpmdG0W9MDkR8ERvXJQAwks2b94GF1f/Hiv8Exr/GIUYLgYXzJrEKipnx3623xv67HMCckwieQjYHUtmR+n1LsWW2SIsjn0IAFXSGGO+DUqezL7bj/+neXJ2E2/yTxmgaGGe7juh+FIPczCgcQWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjoqCVOi; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjoqCVOi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47de0093c42so622870f8f.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785485156; x=1786089956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4XImYDJtvSt2cZdM216OvZCpFsyCeXFx2e8snSQLBg=;
        b=HjoqCVOiTZFYbsb1856P0nnjAWvTLEKg4vLfce4IitcsB9F1t4/liuojfACP33fb8X
         6dd7xI34w91SJHzQPcyBbsRYBkd1qY3zFqxBSJar+qHScWhrWRbkUFONqSr4EB/QaaxW
         aJBX+k0Bgw0FLziTZBQEQxzz7gZW6vNEv3IRNzbZpnP3UuqO+9OB+FyYCEdkgswT98qJ
         hyxNzHE34WCimrwUFMdSbHyWPsqm51nTRQhN+64VPKgN2rg9buXICY9lwSDncCkfI0Ea
         nKgOAVc3j3ouSVxwoeDZUGDCL8jusZ+h/olkvxKGwwTzXJjE6zH3/ccXu+/nx7a05iGj
         0aKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485156; x=1786089956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4XImYDJtvSt2cZdM216OvZCpFsyCeXFx2e8snSQLBg=;
        b=VHJTrBuNbDI+eue/9q5orWMT9CHNRco2u28/vzlC8FtyHFv8aGx/PL/tswXCVIBUL3
         Ug1unS2NTlhnziNPhNYjRSNLZUj6a4u3B5A7OZ9jLX50KTps+b3+mDgXmpi3QrYZYHp5
         +NjfqdgwG9BQbv6e8Z832XkdOM7IOzl6wfJELTmHcGItHxXsGpYUPDiWfboKkKJGk7Ox
         BimgKu/Lvl6od73SzghAoVQdnTJ3KDirE+E8OXJGiHr9XdJFffXxv6LdosGFc9BrNh/c
         3A6pfAYR3qdkOp2k44LNH1/DfOamv5Xj6QQlOGDihuZfOB1ocWxHJXkNqQq+2LH8iFGy
         9fXQ==
X-Gm-Message-State: AOJu0YzV9kc4jzS0J1dhLfar+i81IIJl/1ZuJJe8Na/9Ptb6nG8xg22Q
	+RJi5wJtBorTGus1RfaBrATXHHgf7MQeAHbeHjHuJf0WH6uxOKQPHxo9m75W8z80opo=
X-Gm-Gg: AR+sD12Ze37oP+QvTeA1lQOQXFCG3401ApFDzucckiljrenQ+nwAizXXW5/zZog5B5W
	QPngYlq0MlKycUIFW6v8OhzeDCZ5kNwgdctdnzzB+YNz2tz3m74pUiCt84CH5+nydnkLX6skxys
	qAmqfcZ7vUj4eULNvrs34ZjUL0xh+6T8xD1IGcvOVzBK6DM1cxw3eOF9cDx5K1/HMnIaiY+TiHw
	7FMC+AmcQ68PXnk1jyBOumHpldj20SO8VUrbEUNNnuOHNj2j+qGXZaa29usR1Lz+YioWsvI8x/j
	8GynHDZCA/fwkJoQHxZvuTjoA+WD8DlGATUXYH4/xOMTrc5GkWskIYkOEShKq0J4qSIqajpaOXC
	Z/BtB7slQ98oHM5GstrsAZdYpC4dvIlKuMMCth3qu/0b4SS/07Ahfnc2+lM/OMkzLK8VTnMpwyl
	UrQe4ww3ZQD93ndlYf4q4yQ74bc0vDxv9eGCvLNHCspC1+lo1UiZr07fiwcqBIF3/NN9J02qova
	ISQakQKoY+ThDb2ElBPag==
X-Received: by 2002:a05:6000:41d8:b0:47e:1d9a:1123 with SMTP id ffacd0b85a97d-47fd2ac7b98mr2560206f8f.3.1785485155985;
        Fri, 31 Jul 2026 01:05:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm1689589f8f.37.2026.07.31.01.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:05:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Jul 2026 10:05:51 +0200
Subject: [PATCH v2 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-topic-sm8x50-next-hdk-i2s-v2-2-42c1acee5a2d@linaro.org>
References: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
In-Reply-To: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3703;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=M6qIODsCdMC/k36UYMJff866rnazmYTgUJRHTsGaUq0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqbFdhsg5RCBK2KB16W4LSaIOLfLr0miJcj2bOQZRo
 Cz/S6JOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamxXYQAKCRB33NvayMhJ0cJuD/
 91iVefSnEp+nA4MbsKHFXMbxJ0R9yRy/o59G+j7tpQjdV/bnerriouJryZnYdUhTNHpE/flRZR/0q+
 yALqQA+xT7r+x29bVIsEkZwQ8GS0vvUHS3KArGzKxyy61OfYKUfxnOeQul9drDq9eSFBlJU1/KyWTP
 LRHrQbJc4idHYkhbJfAcdHSgPndzCDQSObXehxfOznEoIef1wZOYnJrlZMYhK+Cb3LYHm6/x27UgGL
 oCr2do4MSwpFLRXcOLcM37/RE3YOaSMfiNNOSMxc+9CSh3He7w1eGByPTQKnaoREB3KDSo3S7GX8x9
 mLXQraDGtXhQHyjPDsg4sqKjmEjA+iB1WXY3Z362d7dxI1TbkozIyR/hjVYyumctVw2xGtm0GWFRNI
 vgHdbStAvKQ7s53n5alZ+T5yMUEgnk7c0PB5YCe2lxk6wAEizrhsJ1rkL+n02s0xOJ9HoGdQyAV4xO
 Gnk4Mvdfw4qeikPRsVTqoHsIVCan3oGHab0b//Ck2FkWp6tjCiGiuxaTuIvBL74rMDDU5a/+xR4aSg
 +yhmyavhQ9QZkA4ZQS50VnY0GAtxGfaBkbnHYc20MkuT2/SXQYhWrOPoOvUZTX6A0CvKl+ZhHSau52
 Jkl9W668wt0VE2jqTaGHxu0ISssQUI0HSAxs36z9B+Z1ycrhq2lHYAvwhJbw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 36 +++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8550.dtsi    | 73 +++++++++++++++++++++++++++++++++
 2 files changed, 108 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
index ee13e6136a82..ff3e74c8a1c6 100644
--- a/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8550-hdk.dts
@@ -278,6 +278,22 @@ platform {
 				sound-dai = <&q6apm>;
 			};
 		};
+
+		prim-mi2s-dai-link {
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
 
 	wcn7850-pmu {
@@ -888,9 +904,14 @@ lt9611_codec: hdmi-bridge@2b {
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
@@ -1144,6 +1165,19 @@ pmk8550_sleep_clk: sleep-clk-state {
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
index 396201905ef2..5a2f88614cbc 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -5526,6 +5526,79 @@ data-pins {
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

