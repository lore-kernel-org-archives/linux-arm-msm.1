Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2880241A4EC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 08:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785228816; cv=none; b=GTBKTAMF+GJOhGbXsR1Zl5+gECR3CMw6UVwUS+XkMEKjURy65nzUoX2eix9wvk09gsQvphkb5GZyPwXVC4d5P4cVtJz5iT4Xh/tw74qo8zckJI0cKKv8jmKvQAUfwGEqpvW+JB+fk/ZMDswSem7UK5jmm/53naZhfQGPanaiMrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785228816; c=relaxed/simple;
	bh=thAVIjUTr6gy4GL2DNZb8kVZUmYJLjise2JoBCdv7Qw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gplthAtUvCC/8GHPEqUOKV/GEmotyucBcGNZCr08KTl652iNeQmuiiTaks388BmVPmDeqgNhONtuekKz11x2rw4vJ156ehklutMs5twiZ5egSMBkc/LIPX+hdi24SJJYNXG36yM2P8PhoRaE5Zdck7Q1N6UE6nvyV/6zMyOYS/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cw67oAKT; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cw67oAKT"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-47f7872abb6so2008737f8f.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jul 2026 01:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785228813; x=1785833613; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vqARil5JwoZhqpQak0QqG4jpvc1BBJw7Vkzt9P96kpw=;
        b=cw67oAKTMBgIgXgXuaL2Lj8VSVO+oqmdmcxJThqd5moLfQwD0s22l53vU1xr7qQXps
         9B5/TMml2hL0LhEnryn4V42LH8w2wdsiF96HlV25M6bkNwhDRivgh/moTa6yr7mfLe9H
         LmJE1a5yHBUXEa1I3JsB5HaCJ06SSU9KIR/bMy3NvSxpz7WNG1Yxl7QHxkco9wcqqlb6
         8yq6wA4u3u2wXxZpbdvbDE0SCUwm7Hf5iMumRfQ0in/C7CECY7aYlXD46aHHPUoNKevq
         /CGiY4BuGEQ/E98rkmlbwjjZpPk/MGqIbdxC/+67c2JDdUUgp1c112b4folvY6AbGazN
         23qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785228813; x=1785833613;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vqARil5JwoZhqpQak0QqG4jpvc1BBJw7Vkzt9P96kpw=;
        b=ncVqobwl2t3Uo3SkofWFXFp0wg+3ljbQNZrHSB810QXSDsE11AkVk1sjWgV2n651Eq
         iP6QDzYZt6EwmFmRrH/gRgV+fEyWT6v2wySQdK3y9O5nJkMbfFstP14pU5+mJlhA3uh7
         17UV2aae+zasMljpV+R5cyU5xq2FAQCtP4XD+Bpov6GXAuZFZNIc1+uTsQIZYW4dleSn
         NuERCS2xS03zMdhynVe6az48ndN7Jh+1xbdFHDs2nymZlKXdYisVMXZpewpewD5htQI3
         yhd+Fl9WZbWNil85szPzjxQIEw6Gwyo48w7lzdsRPxQhnZBIVZZ3SKXi6dycPFQlMskp
         iCLA==
X-Forwarded-Encrypted: i=1; AHgh+RqLTGDfUjMxzjzhJNtEm0MAGxPJxhrllrgB+WdyGR4oAc8PIgZbySv6E6n5spmkg24UICy+YhFW0xO0jOsX@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+QCC7u0JkC9rwEecSSC4I1mB4ARrYTFA7jtqzdDiY1c8Cs+qB
	rvPqIPr3fs4zEtdKEp5Mfbzm6QiFN+31kz21SV19vPmqtnA32AV/N8eIYNy/7rJvy3s=
X-Gm-Gg: AR+sD11CqQE0YzcQ9L/ZccNwdb0MoWMi2qBNO4ev69jzknXKtxvJSjCgxKNLKZOBt5y
	y/PIse0V8E+e+XdE8xCBuhxe8jZg3MdBGWUr4i1oQU5ki9X+BHTU02q6pf7DBY4J4+sRdMmvbuv
	e3js3JVr7TUiiHOwn0bAFfOwFWZ1XnqnhzP0r1h4chSll2k8cb98T+oaB7/mSMvo2oExSFgjM5f
	cFmaduT00pHk62sy+HTnqnHn31TjT6pkm8Ylh0BnLUH5aOoAXmuCQXQU2K7L6GtQTXl9OLbIFFD
	T/ju2LlULhpryFP9ugnWQvj1mgdFCgjIAf+1EjpXBClRdarhib23fb0wG6XbK7ZVehA+ldcymrf
	NLdPU8KRwGLIaaK/mg/6ZcMGE7z60kaa5TFILbVb2Cdak5LoaJE3wgMy3e+5pImow9lmWGDljcR
	QGUxJ1aUdZ8wWfWvsOw/ZJ/ak=
X-Received: by 2002:a05:6000:1786:b0:47f:7154:9dfc with SMTP id ffacd0b85a97d-47fb1e82586mr1618601f8f.9.1785228813168;
        Tue, 28 Jul 2026 01:53:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85b9a5c4sm56430085f8f.8.2026.07.28.01.53.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 01:53:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 28 Jul 2026 10:53:28 +0200
Subject: [PATCH 1/4] ASoC: qcom: sc8280xp: allow setting m2is clocks for
 SM8[456]50 boards
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-topic-sm8x50-next-hdk-i2s-v1-1-2393a0fe4aa9@linaro.org>
References: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
In-Reply-To: <20260728-topic-sm8x50-next-hdk-i2s-v1-0-2393a0fe4aa9@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=thAVIjUTr6gy4GL2DNZb8kVZUmYJLjise2JoBCdv7Qw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBqaG4Jn4rFw7rTSS9IPpD97z7bupkZKHzQFu5h+Ry2
 vyOUHxSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCamhuCQAKCRB33NvayMhJ0aaxEA
 DI807KqUEcmMfgjAnZcDvCRv2JPP9BvN6R2pnOGxQgqsFba/Ev3AGVCcS5GJuWh2UOjZDske7NhvKy
 KZW7PyXsYOr+shSI5b4J9p3aUqqMiSf5XtfJwxmzkc2wsSkGG4g91ALZrwoLMrgeNfglAfnmQu228/
 9V3oupCCXvtDqjoii8lLo5vYfj2tymIoFMS4Ps7Cbj4i60r9m7EBPoicdsjGN29eF/kIi6EzSBIatE
 3HOUwqYuWpc0Ee9UFctkRAslXN3yK1UzXIkPfNl3VK2VWc4gpWVbyNZezrQzgVzh1HAdQtbWfCCMWL
 ok18jHqdmI/CHXcE/MJNK/TwN1eWJPsbTWewqtQ+WU8BdaZ3VVpMdjNDFeoelFgw0TCPxpK9OlvBZT
 kUQbhD5Rq51vYUmHEfs717RfHN1j8cITs66wHSTpt7BIhCTQetZ9VwrQ6At2uq4Q5LcxwnSS8YX4s/
 apx6PXAq+2/nhCfzOwWI36a/Xoenf5y9xDeW6KQLP2eytmQpRPIoZZAUFKnhVLN4fJovie7zaCtC51
 k7qf6ITi2UtiRnTQZuw2t893E7lp9ZljBVhAfzYl4UsSI7rv4HoIH7E0iw45M+pJGpqUODMkG5GX90
 tDCzlbckFbnDZROC8sZwHggR0KIBXD6SV1YUGRk/vNQFfxolngx04tmcoz5g==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Extend the sc8280xp card to add settings to setup I2S clock and line
properties.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/sc8280xp.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 4ccff32a413b..8904a6b59c73 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -416,6 +416,12 @@ static const struct snd_soc_common sm8450_priv_data = {
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
+	/* I2S Connected to HDMI */
+	.mi2s_mclk_enable = true,
+	.mi2s_bclk_enable = true,
+	.codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
 };
 
 static const struct snd_soc_common sm8550_priv_data = {
@@ -423,6 +429,12 @@ static const struct snd_soc_common sm8550_priv_data = {
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
+	/* I2S Connected to HDMI */
+	.mi2s_mclk_enable = true,
+	.mi2s_bclk_enable = true,
+	.codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
 };
 
 static const struct snd_soc_common sm8650_priv_data = {
@@ -430,6 +442,12 @@ static const struct snd_soc_common sm8650_priv_data = {
 	.dapm_widgets = sc8280xp_dapm_widgets,
 	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
 	.wcd_jack = true,
+	/* I2S Connected to HDMI */
+	.mi2s_mclk_enable = true,
+	.mi2s_bclk_enable = true,
+	.codec_dai_fmt = SND_SOC_DAIFMT_BC_FC |
+			 SND_SOC_DAIFMT_NB_NF |
+			 SND_SOC_DAIFMT_I2S,
 };
 
 static const struct snd_soc_common sm8750_priv_data = {

-- 
2.34.1

