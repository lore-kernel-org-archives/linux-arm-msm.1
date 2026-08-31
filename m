Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF643D9691
	for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 09:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788167612; cv=none; b=dDHhPT8TePjo2GBfvuqHBvI/iAY9Cu+mshfaFCfXIpVw3c5UpGtfle3bKCSM/sSxu+zo7/Kq+6X1wkvQarSXKhH5GU4k4Q4+w8OxavLTOjUO/QBl69PvanQQdHdp+FSRgK/7AUlxrlrxD4DWWX62cbEJAodh7yZHfI4iiducJiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788167612; c=relaxed/simple;
	bh=elsfmydAeLCDRgOO5nquh0l2DXQ7E3Hmrqv9WIK3IIw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=W/WA89QNclgNmYnIhwYLXz52xk+m0MMpjYsf2NOXiXSvw2e7UA0hgtbXwLEAvSvlH3Hmymxu0TFUjfIToEunXq64L/B6q4zkaTUE0Kmbdx4BRxW8btEI3B1c/vQR+00YSybDqGN/Co34YWcISSxcNBMdD0ynweFMNmlGduoAohE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PgmBVnre; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PgmBVnre"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4980fe6b3beso26077305e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 31 Aug 2026 02:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1788167608; x=1788772408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=scy2XmnUdN+qFaYAQJ21P2+vWG/ZmWQxx4vYkEHW7pg=;
        b=PgmBVnreRtEsp6S0ePFGkO/wZk1wmqemUVeO9txZLnxAVoebhH672ewIdM+dcedSiT
         L/Z4rQZIW2fx8OiRmHLe2Zi/LVFFO+/466+sxl+1GbRmFXbs4QCGyUMPLP3a4blBOQzT
         iiEmhkqdrJCmJF/7ngJXFCPM5eAoi6/NPdabVXhuBD8cNvrS2nyRuo+363Rc4pYK7gBA
         oCmU2//srWiVg1L/cXTfBETEH6YHQpySvWT4Mg7m17x7y15IF/2FDgqexm/S5e9xWicW
         s6b2YgQ2cmH+eCV88yODasuntnjrvaWbpr7PaQYEnaTG1GVFj7tikIFQBLYfUBUkj7d0
         sogA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788167608; x=1788772408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=scy2XmnUdN+qFaYAQJ21P2+vWG/ZmWQxx4vYkEHW7pg=;
        b=MvUmI8Rtdh7cZmay0z0MXBvVpC/lGHprztYGufK6bTg+0S2Fpugyc+tV3Uqhx2+ULA
         qYRGTkwK17PTvceeC2Kndq4H4qmTnbEFzprV4wfu6Zs/6uc/OuiJx39Ioy4zYCg1HSF/
         r0KEgDIJqFqAXdVUptLOUgoua5eXswtM5yvHWm/TCPyL/SuNSRCkcGmRxXlQLKLqzFpc
         S6f+KIbVTGkYllYmrjmV7G85lUbirMxyM3AIec+fpIv79MtYdm32r3YVWQUXryJtNCqb
         2uueDDNd2qq/fgH+bYj1+EdbzBr/4zzGRk/1iOaZTQOZdDy7ewCo7leMSYXyHbrsg0hA
         PZMA==
X-Gm-Message-State: AFuF++nnN8lmwEasuCAF/0Qs2k7PI5XuFxEEv9rkp8MKep6w8Jw8mrTM
	962hM+EwgrN6vOgfsb50jjN2slcufivE2OFtru7bpd5FB1KvK15yywzY0apzDgz5lM4=
X-Gm-Gg: AR+sD1384uJGHDTLei7mrwhUv5yk+VwStd4tCK/Vemu56Ja8pluar40nKGowgoLE4YM
	jMIiJTOYqwHU6b21KWg+ECqJcAxl5+mjwJGJYEZRbuioJtHanwKsTYzTu6gmNjJlo8B2KvU4HGN
	n45Fx1TLGykB07KDG17MA+YOg6psvagcvbo682CfqUIMcXZz97CUMxB4LEGALfkN/U6d7091MHf
	cAyCg3ReggHrFaafK3NIozJpvN9kZPqQ1M2aQ0xuS/1Ss3KlG3Wo3/oGwTFuTkX1iEFiSOqq7oi
	BHuCjzStZdRJCF5mWHhfGybhQKv8oUTczpJiTghbbeqKhZiNQDSJzzC2Qj5T8lipS7FRZShxJSA
	OvHEr/T4bfgYT9CAebHD5wh+jsjZ8HpstYe8z+PC8GeVgi1+Id+NCO73jrgFT9RMF2ebsybtKjM
	by+oI7L350YwhFetW7XFVBVxfVoPtkTKN67dRG7lQd5G1qULgqGqcP+Exwn+/7zGZrgCr5Gd/Z+
	Tb66ZjCqQ==
X-Received: by 2002:a05:600c:6216:b0:49c:a2f3:fe9a with SMTP id 5b1f17b1804b1-49cd53bf560mr115052965e9.7.1788167607513;
        Mon, 31 Aug 2026 02:13:27 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0e:1007:7be3:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b4dfdf00csm320935205e9.14.2026.08.31.02.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 02:13:26 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 31 Aug 2026 11:13:20 +0200
Subject: [PATCH v4 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-topic-sm8x50-next-hdk-i2s-v4-2-a224aa073f9d@linaro.org>
References: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
In-Reply-To: <20260831-topic-sm8x50-next-hdk-i2s-v4-0-a224aa073f9d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3705;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=elsfmydAeLCDRgOO5nquh0l2DXQ7E3Hmrqv9WIK3IIw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqlUWymzGKVly04BJILDTEZcm6uVFAeRQGWPF/IiB4
 UwWrK56JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCapVFsgAKCRB33NvayMhJ0YUyD/
 9CT/kI0yQmXYOxb0SMMmTzAAFNOIBlyZav8eaY5sOWv9IjFRumzxmm3eqTiKyM728f1OldA/kB/dlm
 dynzIzW8aBy3G7Q8bqsCqsysWYaaAnQGuzScJhdEIqw6ijPIoEldUZblijl6DcWVfK525gA6QBJtjm
 QNclxAljJS4csCwDdcxcekJbKECUFsN6FxKBlU2x2MU+hXgmC1vPlqgyuBC24z1I1d+dSX7lO4LwiJ
 CbKfBdzrzi9YdKol+WasgXwsKh67eCro/Iq+5+Q7RwcgsW04TKsZJbAHrtauq0qzg6yIxnppXeY9Zq
 ZK4aclZ8R5jky8GBHoJlh1fAs3bOn8PboXuwz0i6YhKZuL8aD50DRV0ShhvFlIPmGnHzDoacXw+RRE
 NNOvzQupNAvOHA0xrw/C9KmpeI7dEVRqiMYDMGZxQkTMWt2a66R1A9E+q4ilYaDIOpEnEzzNzJ/qrD
 4yRg1sleFdMJHTaBoHxMDl1crNozGcQcFpKIAWJpFno5qngtUiUCI/0/5fqUUvPIXgzZCzbs+VlkVN
 m4BBr51zrcI4M6I+jAkd4uh+PIlDYCMLdSAW86NVIEkstP7LdqgnfSb7sYvNoXHuIk3sa62YWHDy7+
 TE0JI/TvUcdLUb9ivwgOLafQph+Ke6dgKby2LiunjDWUC6bcml5QE3YyDmuA==
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
index 82fb10ed6b6b..88a256499c55 100644
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
@@ -1419,6 +1440,19 @@ pmk8550_sleep_clk: sleep-clk-state {
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
index 0e701e709235..94420ed440c5 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -5541,6 +5541,79 @@ data-pins {
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

