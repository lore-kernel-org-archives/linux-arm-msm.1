Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793008242;
	b=Zf/B3u5EXLrUDvfHZ4I/KBoqXw6xAdaLiqBQ/jZaovamxMw5fwc2qH4DKxfqKEQO3OeH
	 EmfBazuBbI/8C6EH+I2KbF2Ioh/zS2AV5JcpLaYwBLuKq2XPIS04INf9WSmMUJcabMa9x
	 DpI4j4AE03oni/HvVd/TQW+ZdCJypqfbkGK1rO+Le99pTmD+v8UFepykjiccdLwX9vHYW
	 UwLY9v5gQbmdFmOmswG7cNQgANZob+1C68Dah6G1uKe4+CMVomi4Xb/MfVdeLW+RTKHon
	 PCZIFKRNzM8kABCotEfCMWxxUkJiWodPNrTCO64OBbt0YDk0GUBNp757VFZIi+7JAeA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793008242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=pvITkFA0tDAs04HNoeIz9fnMIorfsEQRti2vNfTU6X8=;
	b=eTqfP0v5ioBQKMUBLcFzm+J+cWnI0FRH2WTmLugCl1gFbAC2l72w45s6Oc/ZNcsYEoEt
	 NwK3OFwFlyDZR5yV0O78VpVRmGvq2O7k4jugFa3t2f1AIXIRsntKOmO3bwTYFpOnCM3Ss
	 qztoXgzboaBA2YSfI1rJhGEp6FoIsW8B98r3YDunUqGBiBwPrisodDjFJqZ4UWDQs3HFo
	 Yb5Q+flRjl6BJuvRSLANtatt6g8O8BnFIQ6e2GJkryq2EpTZKp+TUWkPG2YBdVpF5YFh+
	 tzv3EBCvfsvP8/Z129X3l27g2c+CSyCXQqah6y7ZuxkoWI8fDDCTXn4oP+YBQLbvm+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HPeZCDne;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 282B1606A322
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 09:50:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 282B1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=HPeZCDne
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48441a2ba1bso1687516f8f.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 02:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793008240; x=1793613040; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pvITkFA0tDAs04HNoeIz9fnMIorfsEQRti2vNfTU6X8=;
        b=HPeZCDneylJ5oPzRXjU9LATMFc8nYDHGz9Os515UcLE3WnYQUeWQyu9l2N5fMZB/37
         b0ftI5G+Uz1FNYmz0h8vdofXVXl1sghBER9FWlbPacU16VVBwuxd0wN8dd/GzvaIOXHy
         j59iG6zXghpJlZDxOulO9xhzyn75nNIEjmqyAVI6lJcQbL4g3+nkdsoOb9/2pWxlyjQ6
         nr4bk0faTUiICZV3ZHje/V25BIzs6/wtonEL6xcWH/vmDRLdXQvIw5O2trzAvIp/FUBb
         Imei8yiYfgoXuS7jVaAsD3TO4kiaegOZzWQOmlrMmUeEWCrJ3o/AoqeTXyc+T+/PNHn6
         CCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008240; x=1793613040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pvITkFA0tDAs04HNoeIz9fnMIorfsEQRti2vNfTU6X8=;
        b=qIJq3sQ0CFaT1f8u0aJaAPWHfBJda0djc9vYgezrdZvVyfip9EJOlmcRd42UwMSYrw
         w2n57EdqB6929+RdX1OCAaYdYPQgt4lf6YABC/b4YcCliGKiBCnIIJwUiULyXdQ7lTOz
         I3m+13ySXodcP/xnEwedNKYFyEoWGWdZytXSHkhvasps9cFdz7852448+JqavzdbXP9X
         mBGkC1x+ZXRq/5NFThzhMR98mOkFCtHq06Y5Dal5ywr7D+MhUFkJq/tcTq7jkxBA6VLw
         hMPVHYy243Tw4378YsiquTjOx2JTAtlfQsE1yOqTZAXCLSGhQXtMXAwdF7FbKb1IXxFS
         /v1g==
X-Gm-Message-State: AFq9FYJBRc6BwzPXmbd5cQw/JLwZr3NujpUkG0uCQYEV9J5FHuLB8QWz
	Rnmj4WKYRPed/UJo4tC8BmUO/4MAnh4UI/gjR80gfmL5pXKvXxA7A7P+w09ZuoAtV2A=
X-Gm-Gg: AYBFou2c/v95dSDcXywg+kc9kGFO8pT31elgJ8meo6XQvhwivNNcLF3EcpAAzRKSLdU
	UQwh5ZIZwXo758OOkQ5DPSWFn+zoOuRdG7drEseGJFPuNlnonr5X1twjgq46bhGl4/T7G4SR2NQ
	gTi/MG567MmDiumNUHdvKCQfFgwjNEdwNfTrCbSwoH6Kgy6afO0n7x2o8nZnqNiKgocWhMJYfuE
	+LfmdbvhrVto/xW5BQAaLBKY8fbE9YYzBi5vk2jbLfGJVyasVA2N9+JSs/qTvu/PxpbwaM0fH+s
	GqN36etSYsCtggGoAz2zBolId/NVRqqFiZlpkQuIvP+zqrMDXGuOMHtldP4HLhOHFqk4SxR5CCf
	iVnUC2S61ljaMM+k5nE8xjeFSv5ZaFCTS9AQVGmQ7eBzOvCxFanDjP8GzSSB7Dn6Bb7i8k6qOH4
	D6XJncH8P5UmuoVqwW+N/1OIM61wOU1jMXhaN+veqt5nuU0mF5SyqYjZavD8YWwgbiGj+fJV6Qq
	RUiqSdWYztDT6D4HsBzADgV/IGYujFCnY6Qpt+DAfI6J1D279oqJGqAFxJYxG4x1TFMOrkSblO4
	5A==
X-Received: by 2002:a05:6000:29d3:b0:48d:f14a:917d with SMTP id ffacd0b85a97d-48e3eb7e556mr6572541f8f.16.1793008240271;
        Mon, 26 Oct 2026 02:50:40 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebc3cfasm15524019f8f.17.2026.10.26.02.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:50:39 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 26 Oct 2026 10:50:36 +0100
Subject: [PATCH v6 1/3] arm64: dts: qcom: sm8450-hdk: Enable I2S for HDMI
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
Message-Id: <20261026-topic-sm8x50-next-hdk-i2s-v6-1-0bd654b8388d@linaro.org>
References: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
In-Reply-To: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3163;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=KvzsKBCxPESL95d7gQx79Tk8wHNFRTEJXSke/TEadwE=;
 b=owEBbAKT/ZANAwAKAXfc29rIyEnRAcsmYgBq3yJtthWX8vx1EWm6ba4ZMgBMvU2o2/Bt031gnpo5
 HhNJVW2JAjIEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCat8ibQAKCRB33NvayMhJ0fgsD/
 duP2av/sV8H1QKz8ovvuvWnKBCfzigOVzJoT40elmNVSqIrFPpkVrb9neWSYNQKO4KwN6ug2scUlg9
 EdGrWnRL06j0wR9qicpMs8H8ETLZtkB3rPVq/a/v3yTlTNZEy+AniX655BTGfPibRfXxEGJG8F8eVp
 YntxXNFhmLT59AxvaLkKVQpZ02W4w6WPTb/OlydninxHMDwhrWpJvBYDnpquUfE+5GGplxVLHfauVq
 7i1BfktsOaw9Gagk0S+s/l9ZohYUrouKy/Zbr1pN0pTE6xA8l2/kuwve6SN16UVWBYkZNh9xRhpMYc
 OS+ni/SYVUyw5Q2c9ZyX9EK/XoX74UWHE0DFYmOqkLpDnNumKi9LQV4Vp9GMSlwXQdhE/xus01QG76
 WLfB/H59zrzLKhgb57BqkiRPVUBjDymYWGzoFMOASqLvUPII7vTDVBhuCKIoUqwe2i8QPrOts/Tejv
 ykhD2JHKGMKlsa9osHzPKbnNKczHITiV7e6pmdGSQq94gLtQFcrRY1QUF4bRfi2SESrTCQBts+PIga
 +yjB7ZKxtuSJ0K68H+DogfnmiQ9BmL+HZdE9Q2VyKFj6G1fcJJi8CZlG5urBoWYTbe+3WxWhnSUjsC
 qO2X7h/1Gk5LSOgcsWYlxSn6LwMt26rrP0aDY51bSUNeuFQRL4ZuGuYYeg
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Add the necessary nodes to configure the right I2S interface
to output audio via the DSI HDMI bridge.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450-hdk.dts | 36 ++++++++++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi    | 40 +++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
index 4ade28f40cae..9b55d17869b4 100644
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
index 05417cb5c4e5..cf25e16b2f68 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -4296,6 +4296,46 @@ qup_uart20_default: qup-uart20-default-state {
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

