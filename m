Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792660625;
	b=gfIeIvGOeZ9PPTj5Mcu2BLVG08kmUOY91C/VyKJiufMycUjAx0w4kVn9uvoMe7WY6kQV
	 esgIRUEldkxUnrcIcFLn/snGH/CyXhExMz0hW2Bv81OxNr6W+qm2AUSInlyLiMeNKWGec
	 HYqcBjC1RSxe1Km3w8mU5Whb7dNiPXFF6lGjByGd3EwL88oVtbHUCSxe0wygiiLUs49j+
	 OOKoVaRaten0zeV58FkbkYR8iGje1iMeU0EbCjIkIpmdmiwSdp2Bf+BAShBPsu9dBCz8D
	 eCEn3t5LSaOJdJSek8rWwJ8VxFALlpUuoOJ4d8ijmAtIJACSNUivqmXf5quUJjP7bQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792660625;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=vjePZ3KcHWXs+qk5QCRexSDBoMhnc1wvO9A9xrKXj48=;
	b=OPkWzTDbxaoua+ce9RwVom6sTZVxVo3keNYo5Mf4z4D6O+DA4hGLZCJra+4D9tNBQ+Nd
	 THygZttdX4JSbacV+VgE1KPEhcBLB0jSmFdE0OAtrnfRUE0Nk8hm8QI328Yk4mvSd0bNg
	 9UAXGBTtel3QiQsqMfcUGg2tiG0Pz1n7cguxJ988XLrc0zT98x1YJCvIPkjkcVrIXU6qc
	 4r+E4TxfN0lADpqtDZBPjMv9FYJxo1c6d39sljyEgZkV2aojbTK3lmLEHBC/I2Jj5i1l3
	 TfGF1ljfUKlyGlYtweD8vtd6gyHxYVVfE5MaP1R+Q07et+m5Sk1lhCBWWgTU7bc0SbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="pECmXt/T";
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9828260A2602
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 09:17:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9828260A2602
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pECmXt/T
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48bbb06e746so968400f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 02:17:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792660623; x=1793265423; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vjePZ3KcHWXs+qk5QCRexSDBoMhnc1wvO9A9xrKXj48=;
        b=pECmXt/TOeoFXWvg2xRv/sUvNdpe2HxN+wQggaLIl2zdPmLhQGCQUZoJVVQBlBkXPR
         voAfA05ATZNOrjBFwN4K85YmrY2VWe16bzXggb6iK9M4rVzdhz7yv5c7ibp3FYmLmnRx
         qHaYD1GY6eBbcwbDLK6VS6LpIM0L/UnnfttvVXY5tYzaRkcQmSo1wBBOkOrmXxYvxkK5
         H5cEyp9E05HoyEpmCF44vSO2SSMfyXzdYCFbrncCgEK0uNNQT+xHMNyq/KmWr7scR5Dl
         YWVNlfrZECqKh8CCmoM5ME61MyIPUWG58lgGFWBwU83Sw7zdW30PjJBBWre6qLKqpA/T
         vuIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792660623; x=1793265423;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vjePZ3KcHWXs+qk5QCRexSDBoMhnc1wvO9A9xrKXj48=;
        b=RToBQUKUxSosdaTdtyBEUDD0hpl7P7k7dkQT+jpQhmS7F7DZXdCR6qgkWvNwzPJpHF
         /FeOrV5lGtca/rMXvk6ch4lDJw9Im/U1vlx6PccSUGZV94akMAhL/d/4ieYDVy/88o10
         aZ4RgGDumGIA/gT++0kPx6H7BdeXdfjwQrR/nR7R7TB3nlTSpbL4dcW2Xq4dwDBIlh/2
         qVLJlpf3qfKxggKDM6xv/+/Gjd53GcO8wSTKdYUMgO56FYLNgtRzLth+NIxyj0lk5P5g
         I+CcZVmBEGCxFR4maUquIC3P0oIcfNEQBjcBv5h+Cs4DIleEFvGP+CyZL3QSymXj/ynA
         DyPw==
X-Gm-Message-State: AFq9FYJJGxNM2epNBt5Occ0YfnPNihE93pYScDA3ejzmmBadC0iyLyCQ
	dp6o8st67AvFydfGjBIoHT9P07nRA1CTk7XMQ9xjNoWjAXTfSY0j45T/bOOtxxdk8FM=
X-Gm-Gg: AYBFou3HI9PaH2yKe2rwfeFj8B0hQhN/kSF3TafXm/pv27cY0pgnMMWq5LCNpVrWhO6
	6NvIZqKgonEkfhNTuOkiJf1MQsCEwPpYvi0/nYjPkMccFVE/QjObiE4Et9ocRphJ9PoCTYdszBR
	HMN5YdKWCZ5ZuvPrjHpw6ga1jJ4S3BVpCpP5yRYyUXFaNaQdDXRov1PXHr5pjqVVn8ozD5OFN4A
	iqD94ZN7fInco3/mVo1MHhNJj0c187Tu5bRw7TGQy3jW4X0RkrPwpDPyBSGcg1Cl8OFs/QF411D
	WcDWC8HeSlYwVHkQ6en9ByugOwmCiHnOA7CkUrXZOK4lzRorRUStxDtXFamEX3UEVOKGfnaOm7/
	NmTj/FwGa/PwCcOJPwPkq33O7Lv0ji8Eg0RPd2gQCbErkEPxuLSJjrbllIpv+GmeF7E9DjzhRuj
	o3ISsVM98xyIvCzv/ZpfxwSjtu4jcCL5Bd5Uk6ZPD05O+8/kgt5l0VwRZ+7L0Q7y8QztV+BlLyb
	BGT6hiv2A7eb85TUWgj7QDHJTniwkd0yfUykMsw+V7i+x5gUKu+6NCbkiKXea0LAysArpc=
X-Received: by 2002:a5d:6f0c:0:b0:48c:7d67:8ee5 with SMTP id ffacd0b85a97d-48e26502d63mr9238022f8f.43.1792660622726;
        Thu, 22 Oct 2026 02:17:02 -0700 (PDT)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e258213cesm11293672f8f.11.2026.10.22.02.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 02:17:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Thu, 22 Oct 2026 11:16:58 +0200
Subject: [PATCH v5 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
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
Message-Id: <20261022-topic-sm8x50-next-hdk-i2s-v5-2-aa1030a75e46@linaro.org>
References: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
In-Reply-To: <20261022-topic-sm8x50-next-hdk-i2s-v5-0-aa1030a75e46@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3705;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=r6Z+LXWHvxqT5hoHO7hUBwBYfLTFDlZtlR7bW+NUuqo=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq2dSL4nXHbHjiiFYIQ7qpRa0a6cTAK0S0GvEhfYsr
 racfVniJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCatnUiwAKCRB33NvayMhJ0VoOD/
 wOrtSpFlKnOhTBHVT7tkdawPjaExC1z3CqH50rDgt8SspPFQeCm4KcXcEMn6u5o+8A2xTkJie9J2Ey
 NlBeOaUJpj41eMYI5vO/RFuxmut4vUMcFKI5KIclR9za3phHTz+862pzMSZ54KwuVNiXNTbfGmpoA0
 tQsO+uMMKyOIxv3XEMg8xgodQVgy6UyFlaoo+qOsC1FejT2EOVdpo2WPYRmvLLZI9M1alrknpRNn8O
 B1m2PVrIUL1agGREK0DSwT+eIzLKaHHZTnWZaOxpiUtqXZoLlKIHvAEN8zFeG0HQLWe+rRCxZuP4kB
 blfBhX8FXgy/rS50zE2Be7CqI3t1KDMw/PdWZzXRLx7hI1M7lUqyg9zDjno9X5y9An/WfXkTFaEn3n
 RCYgC1txAKxNqgrv+gYP0dNQaqEWWj5k9Vecs7TxanX1078TdjGz6QzXTDlXJ9nJLvfrfTVOv0V7Yv
 6T3KqyG0DGg+sbBuJduLeHvC6p4cHDBC/LPqtboVr72NKflk8mAhYXq7we4TFJoOIRotsHgjGf8GjB
 tIK4peCpVr3nF112mJbLbSon5zTs5vNrR8Dv8vJMBW4jUnTQUzQp6x98ad/PuvDpDZu7N/Qy57uED3
 +W5ssocKFEfPBqQ7swWG2P99luDmLy/qVq2w/8Ir9ACzA/2fQepBWDFYp9dg==
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
index e75e3b878e89..6c09816983a2 100644
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

