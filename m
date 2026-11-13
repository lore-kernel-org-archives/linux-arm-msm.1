Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794595143;
	b=LIn6PeYHM1ajO3E8MnwhhS4RTaZi524an7sI3Whm6AKTRTSVBGO+uJyDDXzeWCWDyQXk
	 EzM4sxe5J4MCMqpui0tP9KGQBl7XjLxs7C3CNQ5ovfFTfx9y3gvYuPFJ2DiiOizArIEgV
	 hf5yG9uD93clHMNEpqii2E3BVSAcLdykvBJ/SwY4m8bwD9y99jT6bbL1pAm6zo2vcJtUy
	 HjIiDwXhtbrHJ558xqc+1sLscOTm6FNKYCAU+G3Ry1N8mHogOdJtFjrakbTtp07sUslSG
	 KYysemUEyvk3P37eYosrD+gmkbKx5Mu1aeud64K7msXDeFQbFMptoO+XnOFUfb5RBzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794595143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
	b=AruBLoCJebPd1jBL2bzKGYiiXbN4AMayTnPrJF+6CAaao/EwHAhdBokrGgbDrtBHvbkv
	 cWaOLOJzInRdIEKwpOliR6wjLN0loo4b/xPAQmEfDRWALD2uoBZVUk0CbfKi+/Ds56D5A
	 0pFjEyCxJKznC2olN6K8d+jHlXK/eC5WQHkner2y6d9t2HzoROOEqC/PAuGGBRDA4zmnj
	 iB/COuCSEJkZeysPf8Rp6sDH5IgWS2I56gipx8VgMXh4DffKAaigj1/EVO64geXZJOTGv
	 xm55w46fpZIsSd6RowGZoVbEdFfA4Xwt+W+KdPeC1vx1kGcnpUyFla+Q5+v6qxMR+og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nGXC2mr8;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249B36077DB2
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 18:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 249B36077DB2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=nGXC2mr8
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48e3b22e971so640445f8f.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:39:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794595142; x=1795199942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
        b=nGXC2mr8jDEFHh8X7rT1WEuyQyAOtyoVaJp5hD24VULt5Dm7tn5F4rQogcz1AKkt8B
         GbsQRDgwSeNRHydCV8O1Hf2dk9YPkq8TTOacvrvqNUcKJhd0pmpYNxAhee9OAn3Q3CBb
         ZrLDMEXjtXAByco6PMvyEc4Xctx+kkdofg5qfcfru3MRhroRs5e8pFa7aQn0UfFZsG5M
         IawcxBBflPCVPeX9BBMQ76gpLVA7LVYCgcNqtEAO7pfK5UbS4qgGZFXxWtBsDRRjMzcE
         xmBeK91uK9gZwr+1rZrafLNgqEXXbHruS92N+aVKjk5Mm+T2BzzvS4ELissMU9eRY1Yp
         90Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794595142; x=1795199942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aohr4CdhF4N1r2Y2HSLshvRZaHbmXDknX6LvcOsHqZI=;
        b=T19BQk6Yj/tV/W2gG9gjJJixdjwtMoeixpqaSe5VRmEIar7GatMFhdR7RX6D1E2WVw
         WKM8Ahpj3MzzOP1fYDCWDycEIgeTySDE9JuzOH1VNh57o/qck7uFWy+6qGJ7K1eSNGa6
         X9k6AWQ+mkO0OVgZRvLnuQQxtMHxyGuOebf7wmQKlpd0ogvTdVfB6jXDYqoCxHQjuohP
         GCcu1k2EsoKudvH3GKcFM0NxvGepvbbER3NKQN6wR6i3tfnnQKU9ihWZ51CWvDLvroB7
         Jl09+/Fo7H7WYAJ9ULmc7oHeMGVq7lT5dJhdJF486lFkDMdBtFOyQXZ7KLGKjbXVgs/l
         DtQw==
X-Gm-Message-State: APuU4Z/GApKSwrR3sISm8ifA7HOxdWE3lZiHB02PoRXWJqcqLZR9rCpS
	j4pp0hezyLOueLUrqI83PrzmLqEIYt3FxcdZmsPUEDnNT49xAxSmsh29LFDyxuglvA0=
X-Gm-Gg: AYBFou22dpHB2pvpW5A1b9PSW38L3WCtHE7zvQ3xLXPjA0IZCQjxVFfmupjjwKUyjUR
	jOwOr0A6zO52bWSCNDbwnyWLJO6MaVo/NvslmiOaYWNe4+hxTnNMcP3Nm1Iwoos8xbZXLS3h+Hb
	vuDAUXs69g6vo0vJVDnOOpKDV/XgQvwlCejrbKTeBTDCDO3wWXhzI01dcoFGeVQ2nuy58XYQVQe
	GBOHU9x76U4NBvlsQJJiShR96pxvwEMQpAE8Fe4ZGzbbhYkaQ1s1yMI6RKuz6caDQPmdayJnUUw
	b6XsXfcK9qUFEqMYTI8gvkviue+bT0G/Eh/L6HfxXLl44DsoDlwNvzhSO8Zche6AMlKUuiJNlfz
	AwmNtNo7kFl72Bd1IEukK4QxGcd9MqkW6KFXZ+WD8jgMU14C9/48RfzxPO4KkXdZ+ocWFxoNjBp
	T9DgXEocSrZyDAtQyM639Agd1msyx755V0zyDrjVMG4lPTrG/PABqVJx+rdiDwhkmrWqwv6aPNl
	L4vXYj5fwXM8BjdRa8+8LNtUBmFjz34Y2E7Oj6cnAr+t2Wh84NX93sAQsaxLycTj/26gVvmHzcS
	pC3cFFosYuToFibYR96kJa9I76PGVe4KH8qIhu+F99U=
X-Received: by 2002:a05:6000:4697:b0:492:c53e:2ea8 with SMTP id ffacd0b85a97d-49c7458620emr5628794f8f.49.1794595141531;
        Fri, 13 Nov 2026 10:39:01 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6865870f8f.23.2026.11.13.10.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 10:39:01 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 13 Nov 2026 19:38:36 +0100
Subject: [PATCH RFC 22/23] arm64: dts: qcom: sm8650-valve-deckard: enable
 audio
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
Message-Id: <20261113-topic-sm8650-el2-v1-22-5183f6aab9fc@linaro.org>
References: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
In-Reply-To: <20261113-topic-sm8650-el2-v1-0-5183f6aab9fc@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Srinivas Kandagatla <srini@kernel.org>, 
 Rohit kumar <quic_rohkumar@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-gpio@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2284;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=V5W1xkU5JSLg+slKk1AfIWeDvtlCZVv2u4mE0vZ1GEw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq91koLJdzmuJYexHUXqCwf/rguGD0uVlz2GY/nKi3
 xzdtgDCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCavdZKAAKCRB33NvayMhJ0bV8EA
 CP6h7TdIv30wzog9Ph/7TaDUOU9Q0KoVpgAYqjAzcf+icYGmJ2kONvsVh8/7PH4note+jLzG4tDvTg
 nzrwuAj4KUDPAlz6PsQ0XHZ29zJ75rEWfDIcEdF7vdhPYIovfSgs6QqLDpS1desaMEODAJoS795EuR
 iEfrJWyLP5ef/bcOxxWzXNzoSsZ8A/Bt5LvYXk1HHAUA+tFPJhz/gcwCBydcEOTB1yo4qRJayeiKVJ
 Rcu1DJoYfimFMS66fRmnsNY6R5eAQZ1B8TESR7wnoyE+HFaY7XEe2rWXyhtMp9D39ig0ofzVxfvBfX
 xClL2KpG9LTBkZ+JVJyZ0ZGlzjrbxZ57KV9KGfbgr/ifMSJ/eBIUb8zKdUnuqKwQG/0xmOgGYXvoaQ
 oUkbQeo4YfP7z7bTQ/6Nx7byp2lGcbrehRCaO08sxRUtNvRMx0txP92TmhKIVG0+kRyH056YcHvSfl
 uFXPOGWBL0r5Hbvb0nq80KI4A0cCyrHZ5L7hEzBaIZY0mL/EEWfx31q7RHb8acgQTvlh+WLJBIuuKi
 SHdv3y0nTLm8aCpLij24hLvJwvowGkLPsz0Nqz3L7r9XD7eBVkTeWrfOzngpRAPTHBq7P3NEAWHkft
 L83kztdj+ctg8j8LHeuyGltN3XftbP1L7HKNTQojJmNX5Zlac2vC7lPbC0rg==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Deckard boots Linux at EL2 without the ADSP audio firmware, its speakers
and DMICs need to be driven through lpass-cpu.

Include sm8650-lpass-cpu.dtsi and add the SM8650 sound card with the
speakers amplifiers on Senary MI2S and the DMICs on the VA macro.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts | 64 +++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
index a365caa28cee..723f7911fc54 100644
--- a/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
+++ b/arch/arm64/boot/dts/qcom/sm8650-valve-deckard.dts
@@ -16,6 +16,7 @@
 #include "pm8550ve.dtsi"
 #include "pm8550vs.dtsi"
 #include "pmk8550.dtsi"
+#include "sm8650-lpass-cpu.dtsi"
 
 / {
 	model = "Valve Deckard";
@@ -160,6 +161,37 @@ framebuffer_mem: framebuffer-region@af400000 {
 		};
 	};
 
+	sound: sound {
+		compatible = "qcom,sm8650-sndcard", "qcom,sm8450-sndcard";
+		model = "VALVE-DECKARD";
+
+		audio-routing = "VA DMIC0", "vdd-micb";
+
+		speaker-dai-link {
+			link-name = "SPKR Playback";
+
+			cpu {
+				sound-dai = <&lpass_cpu MI2S_SENARY>;
+			};
+
+			codec {
+				sound-dai = <&left_spkr_i2s>, <&right_spkr_i2s>;
+			};
+		};
+
+		va-dai-link {
+			link-name = "VA Capture";
+
+			cpu {
+				sound-dai = <&lpass_cpu LPASS_CDC_DMA_VA_TX0>;
+			};
+
+			codec {
+				sound-dai = <&lpass_vamacro 0>;
+			};
+		};
+	};
+
 	wcn7850-pmu {
 		compatible = "qcom,wcn7850-pmu";
 
@@ -776,6 +808,38 @@ eeprom@50 {
 	};
 };
 
+&lpass_cpu {
+	status = "okay";
+
+	pinctrl-0 = <&i2s2_active>;
+	pinctrl-names = "default";
+
+	dai-link@22 {
+		reg = <MI2S_SENARY>;
+		qcom,playback-sd-lines = <0>;
+	};
+
+	dai-link@19 {
+		reg = <LPASS_CDC_DMA_VA_TX0>;
+	};
+
+};
+
+&lpass_rxmacro {
+	status = "okay";
+};
+
+&lpass_txmacro {
+	status = "okay";
+};
+
+&lpass_vamacro {
+	pinctrl-0 = <&dmic01_default>;
+	pinctrl-names = "default";
+	vdd-micb-supply = <&vreg_l10b_1p8>;
+	qcom,dmic-sample-rate = <2400000>;
+};
+
 &pcie0 {
 	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
 	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;

-- 
2.34.1

