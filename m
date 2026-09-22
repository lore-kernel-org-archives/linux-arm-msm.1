Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7381937F8D7
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 01:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.204
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790042310; cv=none; b=D/yqJOX5tNEV6XgRwnWIihdOoYj/jhl0d4FtiVyZhTm3u+RaXK/QKtIWg2m1LV86vN8wycG+njeaLzYo/0+Ly+bR9I+sbp+QelEK6fszQCY/hxyKX2XP9XQc0V58SaLUQKpKhyBeivYYWxHrh9EunYjYf3KfWdigQCqkiuINdbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790042310; c=relaxed/simple;
	bh=+IUGOTMt18Ytjl84nvO2b6EVaLrVHd0MwQO0xj44f7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ja0/hlhEgDfyLkgDIkT7o6QBE5HOeAhx8ZrSLVr5F0xgFfqEMrtMsfj7ML7MfsN3P8TGLld5zGMNCPFCGKropgBHgMrus41vywE4gG0iRa+4xe33y3+ULICXvlSzBonMQql6uF7Ho5jkgw83oLrusCxbUerql8cHb6/CkNIzdRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZRs6Tbe+; arc=none smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZRs6Tbe+"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53122c5bbb4so2174281cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 18:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790042307; x=1790647107; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aTKGnGjGTLoIF5pV7l0YX7XUZ3Vt2zTfbQePoXlfjvk=;
        b=ZRs6Tbe+LVxEAcmUHXEDwlulDQDzwxCdBcIarFyKFoOQ4L6mAKXGf6juWlTgWLH4Ff
         0h4g+s+xWHmSiWh6y6nPMZBO6Srj2jCfdEvskFzwRBu+brMvpFlI5kIzIkhCsy/4dppW
         lrU9eK1P+Dbltlrv7hrxkVsN9QbAKnReMP8zTP7TcP2emG8tZBrZv+JOYPagskzaZFNr
         LNaQKvS1GGXgsuzAHNNuPYv971xx4GR9zw1h+vUBdqYBd8X+YPKgIoZK9nGVoboADIZf
         kLcc9TtgDeHZzeS8upGbTav0v+GSoDf5qDPFi4dHa9rbvcffl8Kmfezxyqqw9gz9usAY
         RjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790042307; x=1790647107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aTKGnGjGTLoIF5pV7l0YX7XUZ3Vt2zTfbQePoXlfjvk=;
        b=jnqaUbHhLVc6bVTdFQNI1D1x/ew8WpwcBPpt5dif3q8bcd59UK3wRa1m7qn9dZqDS1
         nfShp2mRK0n3Zhn54e3C1qo8y5yrFiQiQ75FU8pPEo4Vziwp/JP9LgIN1SWcFWUvFQ00
         YOrfA9GWJ8dVIp6ltU64AsxsVeHoO5UC7jtjGnHpl/wvCJYZtm+y0V4EVjzjEdShv177
         I9Op9yJeAqxy0B7T87UiNyvo8AHbmBtvxTSfhILHtrIIWQ5G8LhVjqJzD2CmRpw4DoVH
         FWY5hyvqddDHLTvLFJCfL9dmJCbLAZsdWWrgTYdIZ0ohvuKvRzy1hEfA1x25H0LiOYvz
         Emng==
X-Forwarded-Encrypted: i=1; AKwUvBx+yoRyVq4zNH6Ty9urbB8YuwpYpq9Zzf5g/gQ88Q8+epviKrJD/UnZUzMh4gg8+mUpM6SH6Oc1DaCLlllJ@vger.kernel.org
X-Gm-Message-State: AFuF++nFPHQMfSA7BR3LGm9ZBeKUx8aklkyau5mm+4L47IgZLphjw0sZ
	vocTElaDCMoH8/9NcyrsM1/ePWJ7wNnumctJK84rqH7DPFgkIDyv5gNt
X-Gm-Gg: AYBFou0+AJv6pFyZzzspoDq2RBaGr15AxB8JXmpI6dNEeJkI+34h5Z+8WiklSQlJ6+6
	Jw3WKBhPmPIUHTgJhlBx0ScYx092/B+wfZna401okiH9SCdbsRVP/OZv/fJ2cfcbuQc01MLdxO3
	hCG6IQ6Sdh/6Q5qpVZCcPYELmINTElI21jnR/WVOERphW+8iTVWXVJ569sYaY54jcfbnzAWmVC+
	eWn0z+jZSQX+alUsZzj/qa0RGWVm6ck118oFnmw/hE36CILjwRZLODbfkp9ok9of3XkmMgyu4FT
	J+oTiCBY8d9G1YcCUK7XBITDmVK3jlJEt78sScln7fNYnAHrkRyWMb0lVq9GkdQY/4hIYT/7DH8
	L9Ck22+x+tryyxqRGNOigmfskh4Cl8irs9vfcbmS/eRJ0JVDAx69muRH73O43p/TMLVg+C45aWS
	D6lrdvEJmURMLn1b5ur1w5yYMiioNURGqGlD2qcBaEZAufNqMe4sWP9bGj905MwgWD5qz8++w/Q
	w==
X-Received: by 2002:ac8:7f13:0:b0:531:131:9339 with SMTP id d75a77b69052e-532d8e34badmr36688781cf.34.1790042307257;
        Mon, 21 Sep 2026 18:58:27 -0700 (PDT)
Received: from localhost ([142.181.121.230])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914024c8020sm3987636d6.23.2026.09.21.18.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 18:58:26 -0700 (PDT)
From: Richard Acayan <mailingradian@gmail.com>
To: Jassi Brar <jassisinghbrar@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Cc: Richard Acayan <mailingradian@gmail.com>
Subject: [PATCH 11/11] arm64: dts: qcom: sdm670-google: configure analog and digital codecs
Date: Mon, 21 Sep 2026 21:58:01 -0400
Message-ID: <20260922015801.32373-12-mailingradian@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260922015801.32373-1-mailingradian@gmail.com>
References: <20260922015801.32373-1-mailingradian@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SDM660 digital and PM660L analog audio codecs control the headphone
jack on the Pixel 3a. Configure them for sound playback.

Signed-off-by: Richard Acayan <mailingradian@gmail.com>
---
 .../boot/dts/qcom/sdm670-google-common.dtsi   | 87 ++++++++++++++++++-
 1 file changed, 86 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
index 3abde2cbf746..48aea5d72092 100644
--- a/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670-google-common.dtsi
@@ -53,6 +53,14 @@ framebuffer: framebuffer@9c000000 {
 		};
 	};
 
+	clocks {
+		int_cdc_bclk: int-cdc-bclk {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <1536000>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		autorepeat;
@@ -133,7 +141,14 @@ sound {
 		model = "Google Pixel 3a";
 
 		pinctrl-names = "default";
-		pinctrl-0 = <&cdc_pdm_default>;
+		pinctrl-0 = <&cdc_pdm_default>,
+			    <&cdc_dmic_default>;
+
+		audio-routing = "Analog PDM_RX1", "Digital PDM_RX1",
+				"Analog PDM_RX2", "Digital PDM_RX2",
+				"Analog PDM_RX3", "Digital PDM_RX3",
+				"Digital LPASS_PDM_TX", "Analog PDM_TX",
+				"Analog AMIC2", "Analog MIC BIAS External2";
 
 		mm1-dai-link {
 			link-name = "MultiMedia1";
@@ -166,6 +181,40 @@ cpu {
 				sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
 			};
 		};
+
+		lpi-mi2s-rx-dai-link {
+			link-name = "LPI MI2S Playback";
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_RX_0>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pm660l_codec 0>,
+					    <&lpass_codec 0>;
+			};
+		};
+
+		lpi-mi2s-tx-dai-link {
+			link-name = "LPI MI2S Capture";
+
+			cpu {
+				sound-dai = <&q6afedai LPI_MI2S_TX_3>;
+			};
+
+			platform {
+				sound-dai = <&q6routing>;
+			};
+
+			codec {
+				sound-dai = <&pm660l_codec 1>,
+					    <&lpass_codec 1>;
+			};
+		};
 	};
 
 	/*
@@ -568,6 +617,17 @@ rmi4_f12: rmi4-f12@12 {
 	};
 };
 
+&lpass_codec {
+	clocks = <&int_cdc_bclk>,
+		 <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	clock-names = "ahbix-clk", "mclk";
+
+	assigned-clocks = <&q6afecc LPASS_CLK_ID_INT_MCLK_0 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+	assigned-clock-rates = <9600000>;
+
+	status = "okay";
+};
+
 &lpi_tlmm {
 	/* sensor gpios are protected */
 	gpio-reserved-ranges = <0 8>, <12 6>;
@@ -631,6 +691,19 @@ &pm660_rradc {
 	status = "okay";
 };
 
+&pm660l_codec {
+	vdd-cdc-io-supply = <&vreg_l10a_1p8>;
+	vdd-cdc-tx-rx-cx-supply = <&vreg_l1b_0p925>;
+	vdd-micbias-supply = <&vreg_l7b_3p125>;
+
+	qcom,mbhc-vthreshold-low = <75 150 237 437 437>;
+	qcom,mbhc-vthreshold-high = <75 150 237 437 437>;
+
+	qcom,micbias-lvl = <2500>;
+
+	status = "okay";
+};
+
 &pm660l_flash {
 	status = "okay";
 
@@ -673,6 +746,18 @@ &qupv3_id_1 {
 	status = "okay";
 };
 
+&q6afedai {
+	dai@89 {
+		reg = <LPI_MI2S_RX_0>;
+		qcom,sd-lines = <0 1>;
+	};
+
+	dai@90 {
+		reg = <LPI_MI2S_TX_3>;
+		qcom,sd-lines = <0 1>;
+	};
+};
+
 &q6asmdai {
 	dai@0 {
 		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
-- 
2.55.0

