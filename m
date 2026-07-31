Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5C23A48F6
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 08:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785485160; cv=none; b=lMM7OObpfgk587yX7u+tiAbSLRZR1lXtr7NGkV2KCGkoXQBadYtyZdGrwaKeYw3HV6ySwvt1tNQxCcruF/fRGTQpzpJMc3iibuya4nhjkOF14/uyOsYSCdakB1m7FrxDhHqp406ZhIzLiSgJAPJ3l4KVDRySbYWhhk9KE03ZIIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785485160; c=relaxed/simple;
	bh=qbZbC6iN2xScnUMl9ShTs1ZTJEW5e4muOO3gnwdSZt8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sMgbx+3oHZ9C6Wu5BIUPFoDzlQwpnyNmAafikpf+yTGstGbA6GzasQnYMOXDlFdxS0EM6bncyySClq8FQJoFT1yBN11J8wdusvJ0AZXvD9IrpKiU1ZJb+Jux5aCjKt9prQF8eRMjPeLISY/kxp8ab3JlDfUdktX2FSehBMdSQoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LcUzFgv4; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LcUzFgv4"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c1600d040e4so83081266b.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 01:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785485156; x=1786089956; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGS+rdt+zk7IC0Xa+OYHuqAWlqaAUvS4QDXqrSUqFcE=;
        b=LcUzFgv4Q27benqT/MT+A7sOsygChvdOlhmxO5JuAe3xSt/kcl1rOvVrpHjFno8llN
         8Qd7vtKr3zyBrcORp6mzC4+TPeNougnp1k5Mhfj3p0tq4Oh/FaD+Jur1QpDi4oJmiuvO
         16rC9Hla0aLs8lQgz4CUDw690nwf29W1CxcjrksKJeOA3JHFTqn4xbAY3K66Q8HRdtMY
         1C/Cx/6IMnXYaYKU9YauV5z71+Yxo4LzU8rZS4RyZn1feJysDx/6KjjVyi4QSlqZVb1/
         01OmEy8Sf0+4eKoszmpugPMz5vEL/o6Y7hLIieudPMkLoX01FcvnbTBoJHa7CP/CvZkz
         E3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785485156; x=1786089956;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGS+rdt+zk7IC0Xa+OYHuqAWlqaAUvS4QDXqrSUqFcE=;
        b=saT6wQvPfcAtmXImmZJXjaWqiuvkFTehKA3X2iIzH7k54znE36P+Tu+wtAQJE/Ado/
         eG7IdSGsG3xTraU3QvvimOMleT/fDH1j6lFgkEsV3urlrpb5QVP7cCHKcuVoKEayz98U
         LJjXy3rd3pKeIZJXtalQILLsjtP1JOdvNMZOfb3Sjt0r1eQ7uNBkIjumgQcDFraSlS2H
         5BPYvGy8F2AVqN+yXlVeNt7yS28tTUBk4MPSBGClTnwyS0QADYP1UwkA3k1BuJLV4Y7f
         hRlhK+4Ampi6oFxCSbMZbPpLt7yuuY2feARWTGbX7xnjzjjBi4zhPyDUTWk02pGEGJQY
         Gl4Q==
X-Gm-Message-State: AOJu0YzJGpx+AQZih0Ay5QLZSAWGWa/phDAjqgR6+ou5T/HlymvBOuVd
	wkFhoSu0JZD56wMliUviIFhP5IdDRKRqQI5UE+Nv6gu5Z6tSWrWjFLNg18P6p1eb1lU=
X-Gm-Gg: AR+sD11gqyXcGUDjl2MNuDd93P4RP9emGumELLByRjK6iczOFgp/dZYTJX42BIo6Gxb
	8mk1afDbIn+eXhSrQ6wE+ocHgi7ioyq5ACxryLug3EBiB/N1R6KNDUkWQh71qIice9evTS+qaDG
	sTqz6hQrev1wAXi/wjZbvfsymCaq+vOUiEfTJDVoa55JcoeJ01XAfftou3x1vr17kb1pkRcWVRb
	1uCwC/N9+BUKU8TZOZ7a2DEKYeCVIcqHxpsObvcoidNp6oW4U299yDnT/hCCGpwtaShKtvpM1rL
	mM6vcunoCW3W1MPaqoXz8xYI4rdFK3QxKQHy9nkEEemvwMxfH7C+D6qZCsjlLbW8p5HTLl4phPC
	3mzokF4pd3cbq8f2wJ43El+mwGPAX0J46WDvlTTONF1M9ksh0WzceJHPDiYLcEUGUlAg7M2iDwM
	rcL/hR0hOPV4aOvE2+eFJivoPV6R/NSKpGzgD5drn0mJN2J2H2l5m79BNnJJRIQzHlGEtNvUVNk
	dKw4sPrvQ==
X-Received: by 2002:a17:907:9288:b0:c16:acff:51a8 with SMTP id a640c23a62f3a-c1fd35fc779mr56075066b.17.1785485155266;
        Fri, 31 Jul 2026 01:05:55 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a1abfsm1689589f8f.37.2026.07.31.01.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:05:55 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 31 Jul 2026 10:05:50 +0200
Subject: [PATCH v2 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-topic-sm8x50-next-hdk-i2s-v2-1-42c1acee5a2d@linaro.org>
References: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
In-Reply-To: <20260731-topic-sm8x50-next-hdk-i2s-v2-0-42c1acee5a2d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3043;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=qbZbC6iN2xScnUMl9ShTs1ZTJEW5e4muOO3gnwdSZt8=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqbFdgDqCuiZJXsXPBoh+s1I3+AJyWo0B+9emQ9b6M
 ZunH1UuJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamxXYAAKCRB33NvayMhJ0dS/D/
 9oMWKZ44+Aic4VD6MD/JPKS7KQiGI9PfqaifB6FXj25uWnC3xvWkSt2FoCmGrl5z6HpY/nXd19bQPA
 Elst5x7mziUtXssyOzkzfyXz0PWqeHajlAmMIowcLmFoMxTuErfKtuWTxXNExz0Wns7vK0nZxSkQyg
 bn/qZJBNt0G0ZnBqWrace6BZZEe4GEAf/STXra7kS5VRBXv2vjtIpw1PV+r/qPxuPvazUXnUnvU7tV
 m7Vkvc3WycMJLVCD5ZDxl6WQZ7JOLLsSayf5OFyN1Mhkdg3FXx/B+Ri/CIBunTAMjGFrf3oqtxJMB/
 7yz4mb5rHy9/0NVFCikou8EFtt4lxHFDsqcXq5TysL5tNdLZxwPGNLnH+yTwpIQTLcm08+34FPeb20
 6gyOk1L1wR7qQrRH/ghpzVz26/9+ACGfbkwYThWaA9KbdLxp0+n4Q0G/NYRlKy/Tb8ZMVOlaYVDSBB
 Q2eCG5NVXzySlveETMlMScW69gXf0gy9IEVLxYsozB7qpVTqMRtlBkilLGgeAd+CkT95l/p/JIIjI7
 Qqf7ZHxSRNw2CyNHLq3OloU1wEkoEgGNasHH/WqptNr0fy+/dBea/mnCosOHu3OlX4j0cqmmWON10M
 iavoOmf+j35o/X6WtLHUFgYAb4VEGiZDSkxM6PES2PW+m+CTvGQyoT5rHQ6w==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index b37998cd9a2c..6bc2e8630dc3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
+++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
@@ -665,7 +665,12 @@ lt9611_codec: hdmi-bridge@2b {
 		vcc-supply = <&lt9611_3v3>;
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+		pinctrl-0 = <&lt9611_irq_pin>,
+			    <&lt9611_rst_pin>,
+			    <&i2s0_default_state>,
+			    <&audio_mclk0_default_state>;
+
+		#sound-dai-cells = <1>;
 
 		ports {
 			#address-cells = <1>;
@@ -947,6 +952,19 @@ channel@44b {
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
 &remoteproc_adsp {
 	status = "okay";
 	firmware-name = "qcom/sm8450/adsp.mbn";
@@ -1079,6 +1097,22 @@ platform {
 			sound-dai = <&q6apm>;
 		};
 	};
+
+	prim-mi2s-dai-link {
+		link-name = "HDMI Playback";
+
+		cpu {
+			sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+		};
+
+		codec {
+			sound-dai = <&lt9611_codec 0>;
+		};
+
+		platform {
+			sound-dai = <&q6apm>;
+		};
+	};
 };
 
 &swr0 {
diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 56cb6e959e4e..879019d48063 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4313,6 +4313,46 @@ qup_uart20_default: qup-uart20-default-state {
 				pins = "gpio76", "gpio77", "gpio78", "gpio79";
 				function = "qup20";
 			};
+
+			audio_mclk0_default_state: audio-mclk0-default-state {
+				pins = "gpio125";
+				function = "pri_mi2s";
+				drive-strength = <8>;
+				bias-disable;
+				output-high;
+			};
+
+			i2s0_default_state: i2s0-default-state {
+				sck-pins {
+					pins = "gpio126";
+					function = "mi2s0_sck";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+
+				data0-pins {
+					pins = "gpio127";
+					function = "mi2s0_data0";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				data1-pins {
+					pins = "gpio128";
+					function = "mi2s0_data1";
+					drive-strength = <8>;
+					bias-disable;
+				};
+
+				ws-pins {
+					pins = "gpio129";
+					function = "mi2s0_ws";
+					drive-strength = <8>;
+					bias-disable;
+					output-high;
+				};
+			};
 		};
 
 		lpass_tlmm: pinctrl@3440000 {

-- 
2.34.1

