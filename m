Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1B743E49D1
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Aug 2026 07:48:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785916118; cv=none; b=XJAd8KhQiRlKxjNMRlbqbybesBS9Yxpqhsyas0HHzIHtiAtra2m2LyMlFq+VWdLIFcQOStxFVavXYAvVrPgvop/l4qi9xoA9SP7a3xKgH7a9ZQc5gxGzB07mIbBobtfL9yQkjNOdEBLLTsT1eziiDIGRBGppCJGx+gvh0fFLBLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785916118; c=relaxed/simple;
	bh=M6qIODsCdMC/k36UYMJff866rnazmYTgUJRHTsGaUq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uFUL1sU+eIqEWzFAivGJgB+P1fwEJmcxwT+s2W/6GQ68nuRTrZxK5P7k8IFekAPIex1XDlF0xfqmKrCwPQSPgOezx4/DndcY7k+kfuQdC7PHb/lUCwzfPJZswsgUQtQDzDacym+6yjyJoZBSphA6dq5zDZIYzAy9CujFOvivApg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vBWdneqY; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vBWdneqY"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49554ebb87dso5733095e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Aug 2026 00:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785916115; x=1786520915; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j4XImYDJtvSt2cZdM216OvZCpFsyCeXFx2e8snSQLBg=;
        b=vBWdneqYB583EnCSkkmPpq9rDQfqSpnRO46xc8xYMTBpvxEm89j/ucTvYiAZMa4V8B
         o6QXDzAEaVd17PEZxPTk21g7eck+ItbLCbmGwYHoZD8TwmyMTsfqZC09qn9M+gmdIRCr
         mqkZPSr4dVytOXkdVOoDVNS4v6P+6n4U9CLyPbX8A6wV5ZrGd5aBqKqd8RR2xTCmb3fs
         8DtVwVtUhmMwei4eahpI+meKbQoS2RDSDlcvmUFkwqt1aVFjLA2FBLR0guk7DfcrIYWU
         LiWRv2FLJ1dWLrFLQnTzkaHG2XQxsBsfjXkhVCmPX95dyMShaVzHxrSde23V5ppXJp+T
         FPgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785916115; x=1786520915;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j4XImYDJtvSt2cZdM216OvZCpFsyCeXFx2e8snSQLBg=;
        b=McMZj9MzG7KS0C7jdtb15TVrO4uJmb5MWjak7isomVCyIQGlDP4EgqrRE5ft0qMr9n
         jO7vIkkw75zThgNr8A4e9pvrp/+wB3P+pgc/+J6/J+igWKJwjIFeYL3XE/DU3SnsL7Fq
         Wfg5Q4EvyWfvRH0UPFCd5MkOA+G2Bow/KRw+TAdioCOHKQDgKclgYq/QUqlwBy+BgYGP
         Ne8B4SGDA91YxT9LaSYh3QGYHNsW7pBGz4Qm2bFxTA49wY263rccKopvFxSpoafayJ2t
         JMZv3xAMa2t2SJedbE4Qn0iJ/IPOCZoBBp+/8JuHhCvgOYZ16EQQ0Tv5a/puzQufEurn
         MfHw==
X-Gm-Message-State: AOJu0Yy4rdUbrv/T7MeGvXmbN5LJdMU61lSCURVqrhgbMfo/xcmqpCY3
	a7rtNyRK6f2waqwYjD82R+KW8wXEXdBRW+87KJkNuS7adnbMADvsCmv9cWr4v01/9t4=
X-Gm-Gg: AR+sD11Wbw4exFo+9IqBUea85B3FkEhl71lXRPp2vhsbcW5DPSmxdQEtJkQKUPdCeps
	7h0X78eLEJCLp6Tz9iWpqjDbcpG1k0PbgXzIFGbcyG81zhcacIWqp9x468Xg8LK8z8ummhzATw5
	QxXS/YGhgsSqwCbBEPou/NrBX9zhGIjwS4CvQw5Tumwe0dyQaRuzTPUbXRjM6NRMPqdX8h6t6mg
	2ocyCqUrISomCflZRs07129aDrgkei1YLe07sl3PWBO0xj9OGoyDd1GuZetPOWUTpvfp5vOx6Bv
	tPBRc40/H/8sp4X/3ys+8N3xekjWNRaJBzq7WHd8Yd8DpA0ej8yL1t23WG66Ca+sx+MQaY25A+1
	IHlyQPVGs/x9g7/63eL19HwGBv7M/B1tVMvujduyFhMX557wohEXL2qc7JynHM1AT9pOnthRHzl
	Gy2N8FdgB8f9Wb1Z+wrarkV301OoW2j4liu80esymE6jLxremPTT+YA/npwUsSdQMjwn+JfPwIB
	zDG86yv7Q==
X-Received: by 2002:a05:600d:8489:10b0:495:4749:16a7 with SMTP id 5b1f17b1804b1-4994e7c5e9bmr43271275e9.14.1785916114954;
        Wed, 05 Aug 2026 00:48:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47febf7e5bdsm6470840f8f.0.2026.08.05.00.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 00:48:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Wed, 05 Aug 2026 09:48:30 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: sm8550-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260805-topic-sm8x50-next-hdk-i2s-v3-2-07a6483c430f@linaro.org>
References: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
In-Reply-To: <20260805-topic-sm8x50-next-hdk-i2s-v3-0-07a6483c430f@linaro.org>
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
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqcurPLx2UN6UxZQ5YEXu8y1FmrtKuWhgncG+qPgs6
 ZySUUiCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCanLqzwAKCRB33NvayMhJ0QdPD/
 4kU/i5APP3Ci/pNgJos4TbRS7SYoC+0Dk0Ou2NC2kODS6x85DBy/0zKSlpaHY84/IsZrpe+I/PcKTq
 0d2zmD8r2oVkCRt+b0O/POLWjeOiLodp/jbHWXfVwY9a0IbeZHtkKuFlCgnPK8OtE/PpGGv+ievB2l
 pq7SXT8NvEluo9upgUSVpl+tWNWbgvYVC4yvDSIrawnUZG+vr1jTLposjRWpjOrP6SqsojiI3pAxj0
 lo5zxtb0R8UiaInx2PWA5dVmay7q+av0PO3SAGBW2uVji6Z9GQRkOd8+9ltw7EboJOhKwepL8+0fOp
 F+6aTlSCUpeW9/TaFxnlYR9K38l9F70eX+BmuaWRxQeJO9dzktU9m4yXA/sXJTBeAlXgeKKQHS83e5
 a0BdzV/ANS+MUS/i7RVq0b3u2hY/exrCM+kQJeQyhVaaMzRpJ/GD/7o8ROdDb4jOB0ExvB1ScHhJoP
 McGJ9MbndnlPyBR6uKc8TJG7NDaXJ2QIV/rdNOKZpPydrFYSP+hxHAlxTl2+8dDcccQWb+IlS2SvfB
 UsAR6yzb37Jr3ER3rZn3XrG6aLWpcupQGKyN0GLQv9e66nOHJrcQADe+f7r2nkl1S8mmpZLPGVBOZV
 PEiMBg8CQ2abAOLTbL9uUZOKExvwDVngANgysjMjukdAB0zQbLjOkEtrL9pQ==
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

