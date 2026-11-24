Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541560;
	b=GaGKrIphObEP1nO3sa90YdxGEdHOKZFrMljXtHV+PhP+2dAkeIGki0/DPiO7LSln8daI
	 zM9xe+MQlTde+wfLAiUJi5rpKJC4Yyzo3N6XevxnOwkOGCFa3zCRkFXrOLXGRC9D5hpwR
	 lm/wXRQKNBOE0YEdVQ3XLGbHPM+p0Gg5a5Qai54unsOZPJDPOBBazUDS6p0cOeQ3/xMLk
	 80rJP3se8EfmB1CWSCO3bHn+3v5Z6/oTi4xuDcuAnJYxk2nkDMfFZft5W+AxIzOKDSAVi
	 /nVCHrUb7Vjk91nzVwb9uueNn/C+4OKjxvcv5w0h6h/1216ZerSxzO9zPjmTTOMsi+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541560;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=aGnxrE9p9zHRNsEciXyE5jXeXqOzlxMaO7gUWGze/Mk=;
	b=s5R12OLgcz0DKghAC+qOFPd6D/hxMiPqvhwXtbgHm+tzrfVq+hmLzpMFd24RSq1OPWUM
	 TbxlTCWmIyOwkBfmAZCIQF9IHWveE6x53zJSibj9KLffOLSd0jVz7GsOLAYgml3ddMTx4
	 ReDTK2FZOJRbkKnF2Y9XOJB+/ZEfmV8D0sXTDBy2zFLpSutWl84CQAsLfVqMfxEuEyKEd
	 yRIyNSzotTGsCuV1xlMjRPtjBW+FtZZfWaDA+CJTaEGmMzvV1NNuSdZ1bgEMZhxhHt72+
	 3dSDSu/xU/ZbHOI1/sBjeX/bKmJWrFCoiX1CSafN6PYSBK79w/NzTP8QX2jzRYKN4zg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MkY39iiw;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4855606A68D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:32:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4855606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MkY39iiw
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so3028363f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:32:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541557; x=1796146357; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGnxrE9p9zHRNsEciXyE5jXeXqOzlxMaO7gUWGze/Mk=;
        b=MkY39iiwV1cr4k4iONAPcT86nVYaRcmTicW4sWKh2feM8v+PJ90pK3fM+7wyoTaDDd
         e8paW1DK2LjWmLFnx/WvPQrUNLJvTSM2QVLeBcBDFS214tQVb5yxvG0WTMN/9+isS7c8
         YvJr1J6mAJ0m9NlmFDoZ+X/rNViXMlxEXvqtNJ7KrsCDSu/vDQw9NdRCY0xqvi4Ocr04
         Y8PhMEEltxo9oeGplPzV9+q6B8HaB633NyN+kRQS/RDDYNFng0+y5DYxBjX7D+EaRPD6
         i3OsBbyH4ZdfgkaGLRclml6/VULm3IjhT8Y23NtN8R75W1qRAflHkTzVRvz+Y1DCeHAi
         dOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541557; x=1796146357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGnxrE9p9zHRNsEciXyE5jXeXqOzlxMaO7gUWGze/Mk=;
        b=v0gpOUpw73bddiNw2K3Wp1M7WR5afYkxei0RrK56I9OH/RCF1cGd2lQ/RR7hldERJZ
         7tY0yd/vTamVa9q10K0AzBDx9nwLq0KzEtv3gXi59VcqnTJXtnJfvmh0LgYiz7LB6qdL
         Q1sWPHYzYpCCBPphJ13pQhD0dIW0OkjnHxlQWLddsUcw3bLL6Mby/3jBsug0pT/YY0As
         YNutpN0JInX0PbL9yXow74crYN2dEVMRbZV7dfvT5/1L51OZZ6rNC9TR750rVIwAkj5S
         jYmSmcRjFw6hepYAClRLNFAspks7mZdQa63mvWd2tpQnBXulJFvdjL9xsac1VG0y5KVa
         Pogg==
X-Forwarded-Encrypted: i=1; AL+hErHr7gbqKCytR5DxYkH2pUVtfYQIT8AorEj2M/1Izj2Gg/l6MLXCiVcWZnC9+QoUz77SpQhNErfmlFjbD/Tu@vger.kernel.org
X-Gm-Message-State: APuU4Z9b+74HnN6xrqcZOxLkJGYslQ+y/RdrAiai2EQHqW1v8wLKC6fS
	7rdy3nD0RXIO45ce/NNY+bOcp2H5oI0FFzpr016b/cn9B0TZAaeXk9n0xcbkALEPbtI=
X-Gm-Gg: AZFdTZclNaicggYbljZb0lV0HjPgXLdoT9S+c6u3sLExFK2qEe2J9jvi9tQQW8he1VN
	rmX7Y+B21osNzKdhOsvNicuCxU6LRMDstuWkDqpWKWozjSVwKhTwWmzKGgeHpf4AhEqGvfuLELX
	zy+wR3rxzzrJHRYdRGOnaPQriI3Q9zFSfye7NYMIgTDVF0m3Ep6vKWXHM7WxkJ74q9bzmnLuyEx
	a9VC4jCFv5CaqEuqHUQZ+udn8OIvqzwgDuG+ToIpE+4Y++v1K1IIPbO+LIb2HXyX/fVoiZFLrEA
	BsSYMjGjN8JoKyhF/lW0zzsGdwlEdpVzN+DJdMYoeQju7Fj9aDKGbV7XMp13bec7gulH7PdpwR7
	CGuzILDb5Keer3KCPeq03UT9SO3Di23yFxihG+PgTf5r5UxviPOLaQ0rhTafJUFu6mt14NfBB7q
	NL4s53jIJAPiXxkqzD9iKhehfcX6Vho+E/H2tt11lE78yDQTocWNQYjnEsR2nwBsmZcLzmstoVm
	Z8JrMbRlt2eXKg1U9A1Zo5Np5WL7ktUyqCZtGRuquhonCQrkVt9HUHrVJyOTCYcWY7YnEnayJFT
	eS3ecV4Ah4SD6FpyiIvRS3iELg5k8AH2vYh67opLK3vQSzUwqQ==
X-Received: by 2002:adf:e014:0:20b0:4a6:b87:d77f with SMTP id ffacd0b85a97d-4abb0f3b5a5mr23020018f8f.12.1795541556971;
        Tue, 24 Nov 2026 09:32:36 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:36 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:26 +0100
Subject: [PATCH v2 19/19] ASoC: qcom: sc8280xp: allow using the sc8280xp
 card with lpass-cpu
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
Message-Id: <20261124-topic-sm8650-el2-v2-19-174e159f0f69@linaro.org>
References: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-v2-0-174e159f0f69@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>, 
 Venkata Prasad Potturu <quic_potturu@quicinc.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Rohit kumar <quic_rohkumar@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6410;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=6KOjMX1wUY70p+TGT4KMTCpDJ5tl7/ySb9BcH/nsQ4U=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcoj7RB3F2HyuJE0Mv65D3VmbKTIEFpkOranB++6
 gTK5bhmJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIwAKCRB33NvayMhJ0QcWEA
 CwIgTuDCa6XHOyFrf1uRIIx0q8nDuYS3SftAW8vG9CsuWeuzEdD29umb1iQ7cHCqyODqQ8AV0GkdQE
 HvJNKb2Nb3f7bumzzg0d2FPMIPKsP2liMHoyKREnkAQnSAFlrLaJ/lKs94z/IOCcmJgfUyx3P4Qsdq
 awSW9XSNTeYdVpgLYv+xV60Q0nOa4cPzA7WbZefdK1KKsgmieNhDa8QYAtSkHj2n7wWo4oO0VwOw1t
 0y7WfUIQALmVUt6W1bujh4Fwp2mZ0TVu6ApXqodnCuQ3VoNuUyOE2dNqRUs6GEdIC4nWBjaKrwX4YW
 vwOfcsRpH4cfcoaPx4fAro7psr87oSduHUKJdHL7ZemTrhJ0Gvti/Z7GO2/7KTAAlumaZbi7beRywV
 YbnG1Xl1EZAV8xitxSI1XAkcwzXXyzGuI/TdUW7KFom0zIdb3T1b9Kbdw5xnkbHmoOmgRVRcrweGdL
 rYmgQK/XNqc/xx1/E8+pu9npu6bfZz6ewz/8MDennI3WZJ1SZgVRomxcn9HELwamSLQIyySLqsQfjd
 3+oRqXv2ReFpF4pEWS16va/9Qq6YIZJcOClKO3nj6vy/aQSz6tMPHtWnAZrqYswQGOgJAKXVBhlx5a
 M+GwfpAU6Em8BWLs4KkROXY5efQ5ihSGtoPOf0M0c/MQMAq1wwQww29M7XwQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When the ADSP is not used, the sound card links use the LPASS CPU dais
directly, those links are neither DPCM frontends nor backends.

The LPASS CPU dai ids from qcom,lpass.h overlap with the DSP dai ids
from qcom,q6dsp-lpass-ports.h, so add separate init and ops callbacks
for those DSP Bypass links and keep the DSP backends handling unchanged,
allowing the sm8650 sound card bindings to work with either the
Audioreach or the lpass-cpu interfaces.

Also attach the WCD jack to the LPASS CPU TX codec DMA dais on the
DSP Bypass links in qcom_snd_wcd_jack_setup().

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/common.c   | 43 ++++++++++++++---------
 sound/soc/qcom/sc8280xp.c | 88 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 115 insertions(+), 16 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index af5cacddf67d..65f0db493642 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -2,6 +2,7 @@
 // Copyright (c) 2018, Linaro Limited.
 // Copyright (c) 2018, The Linux Foundation. All rights reserved.
 
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <sound/jack.h>
@@ -420,25 +421,35 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 	if (rval)
 		return rval;
 
-	switch (cpu_dai->id) {
-	case LPI_MI2S_RX_0:
-	case TX_CODEC_DMA_TX_0:
-	case TX_CODEC_DMA_TX_1:
-	case TX_CODEC_DMA_TX_2:
-	case TX_CODEC_DMA_TX_3:
-		for_each_rtd_codec_dais(rtd, i, codec_dai) {
-			rval = snd_soc_component_set_jack(codec_dai->component,
-							  jack, NULL);
-			if (rval != 0 && rval != -ENOTSUPP) {
-				dev_warn(card->dev, "Failed to set jack: %d\n", rval);
-				return rval;
-			}
+	if (qcom_snd_is_dsp_bypass_link(rtd)) {
+		switch (cpu_dai->id) {
+		case LPASS_CDC_DMA_TX0 ... LPASS_CDC_DMA_TX3:
+			break;
+		default:
+			return 0;
+		}
+	} else {
+		switch (cpu_dai->id) {
+		case LPI_MI2S_RX_0:
+		case TX_CODEC_DMA_TX_0:
+		case TX_CODEC_DMA_TX_1:
+		case TX_CODEC_DMA_TX_2:
+		case TX_CODEC_DMA_TX_3:
+			break;
+		default:
+			return 0;
 		}
+	}
 
-		break;
-	default:
-		break;
+	for_each_rtd_codec_dais(rtd, i, codec_dai) {
+		rval = snd_soc_component_set_jack(codec_dai->component,
+						  jack, NULL);
+		if (rval != 0 && rval != -ENOTSUPP) {
+			dev_warn(card->dev, "Failed to set jack: %d\n", rval);
+			return rval;
+		}
 	}
+
 	return 0;
 }
 EXPORT_SYMBOL_GPL(qcom_snd_wcd_jack_setup);
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index ac4dfb2c2182..4fcccf7ec496 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2022, Linaro Limited
 
+#include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
@@ -377,6 +378,37 @@ static int nord_snd_init(struct snd_soc_pcm_runtime *rtd)
 	return 0;
 }
 
+static int sc8280xp_lpass_snd_init(struct snd_soc_pcm_runtime *rtd)
+{
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct snd_soc_card *card = rtd->card;
+
+	switch (cpu_dai->id) {
+	case LPASS_CDC_DMA_WSA_RX0:
+	case LPASS_CDC_DMA_WSA_RX1:
+		/*
+		 * Set limit of -3 dB on Digital Volume and 0 dB on PA Volume
+		 * to reduce the risk of speaker damage until we have active
+		 * speaker protection in place.
+		 */
+		snd_soc_limit_volume(card, "WSA_RX0 Digital Volume", 81);
+		snd_soc_limit_volume(card, "WSA_RX1 Digital Volume", 81);
+		snd_soc_limit_volume(card, "SpkrLeft PA Volume", 17);
+		snd_soc_limit_volume(card, "SpkrRight PA Volume", 17);
+		break;
+	case LPASS_DP_RX:
+		return qcom_snd_dp_jack_setup(rtd, &data->dp_jack[0], 0);
+	default:
+		break;
+	}
+
+	if (data->priv->wcd_jack)
+		return qcom_snd_wcd_jack_setup(rtd, &data->jack, &data->jack_setup);
+
+	return 0;
+}
+
 static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
 				  struct snd_pcm_hw_params *params)
 {
@@ -538,6 +570,58 @@ static const struct snd_soc_ops sc8280xp_be_ops = {
 	.prepare = sc8280xp_snd_prepare,
 };
 
+static int sc8280xp_lpass_snd_hw_params(struct snd_pcm_substream *substream,
+					struct snd_pcm_hw_params *params)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
+	struct sc8280xp_snd_data *data = snd_soc_card_get_drvdata(rtd->card);
+	int mclk_freq = sc8280xp_get_mclk_freq(params);
+	struct snd_soc_dai *codec_dai;
+	int ret, i;
+
+	switch (cpu_dai->id) {
+	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		for_each_rtd_codec_dais(rtd, i, codec_dai) {
+			if (data->priv->codec_dai_fmt) {
+				ret = snd_soc_dai_set_fmt(codec_dai,
+							  data->priv->codec_dai_fmt);
+				if (ret && ret != -ENOTSUPP)
+					return ret;
+			}
+
+			if (data->priv->codec_sysclk_set) {
+				ret = snd_soc_dai_set_sysclk(codec_dai, 0, mclk_freq,
+							     SND_SOC_CLOCK_IN);
+				if (ret && ret != -ENOTSUPP)
+					return ret;
+			}
+		}
+
+		/* The LPASS CPU dai sets its bit clock from the hw params */
+		if (data->priv->mi2s_mclk_enable) {
+			ret = snd_soc_dai_set_sysclk(cpu_dai, LPASS_MCLK0, mclk_freq,
+						     SND_SOC_CLOCK_OUT);
+			if (ret)
+				return ret;
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static const struct snd_soc_ops sc8280xp_lpass_ops = {
+	.startup = qcom_snd_sdw_startup,
+	.shutdown = qcom_snd_sdw_shutdown,
+	.hw_params = sc8280xp_lpass_snd_hw_params,
+	.hw_free = sc8280xp_snd_hw_free,
+	.prepare = sc8280xp_snd_prepare,
+};
+
 static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 {
 	struct snd_soc_dai_link *link;
@@ -549,6 +633,10 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
 			link->exit = sc8280xp_snd_exit;
 			link->be_hw_params_fixup = sc8280xp_be_hw_params_fixup;
 			link->ops = &sc8280xp_be_ops;
+		} else if (!link->dynamic) {
+			/* DSP Bypass link, neither a DPCM frontend nor a backend */
+			link->init = sc8280xp_lpass_snd_init;
+			link->ops = &sc8280xp_lpass_ops;
 		}
 	}
 }

-- 
2.34.1

