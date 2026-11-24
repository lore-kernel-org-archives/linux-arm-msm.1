Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795541553;
	b=k/irOv2Bii55lWGH885dotHEmMe2yvJ6KH+b3e6Oqonxt6ZGSnGXfRZY+yS1U7UM5AX4
	 qIriX2Jxcw+7kKGLNrzFVUuicafcdQrOpVZ1SIWhPAjIJgJ0Q6UjrRvN+MkR6y4boQm+c
	 TOz0uMtwn6y9YtnOnfO3fiJROVX0jqvayh7l77pgm1gX1CRj78OVPXdKn4wnNyWBWucif
	 9LdScNSTyOdntKp3wi7cdMrGqjps8LEfAU2JdmUaZyAMNjpxsKm0mBHvsc9SlcMccCiwb
	 STa03r7ggppKPGxhDRZ152dZtHO0y++3vRKWy6YY1mkKpr7uVpZPBeSAiGPe12aPL2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795541553;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=4Oh1DyqKmA18yB2cPepTMnYsZR1J1eTBbARcXdSV43M=;
	b=zNYgImp6XDe5niFDtwsLGAAEwD5KAJU0q8jYPIHh/i52wv7CxHxsdcNKdS8IMnd48lVL
	 MqQqkSepULn5Z8pXSL97HnCDmRmU5X9hO62TH3kQmhgFyLFalPR4MdrjI6TgKM63qNGNU
	 J6tVkWTuLgE8qU/BXJuISkTawsjKTppCGzxo/9PdQakbIXfuRPeK2y8BCnKqc3kW6QgUG
	 +HN410evWMj6JTyoo9Q+2R/HUkmbQq/A3hLKIfcAvVWcPRWDDT+1ZLSiXmbrFkyBoIcmO
	 J0/qswRUGhaEfPNYX+QsrHQjtnhMtAXDzX1WJWwYgGa6o3BkUJsNk9WUZxLhLpoItUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S4PStDRK;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D76A560A5BDC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 17:32:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D76A560A5BDC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=S4PStDRK
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso4290661f8f.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 09:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795541551; x=1796146351; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Oh1DyqKmA18yB2cPepTMnYsZR1J1eTBbARcXdSV43M=;
        b=S4PStDRK8rBYc+sFN/fx0kfnBtNfu5JphZh0meOjySoLDRGj6hzwbYEUjtzTQYLygL
         MId+1dusvvP22bUGVMQTBCgFCenYaa986Ntdg5N21sAiHuiLU0upVg180436iLmjSSos
         hVzKovoQD12GT1asJVUnA+vSUx8p0X1LHUTUz+gOeRKqvkxxTNO40w+3p4p6XZpehcrQ
         P0eecfIixhyK26Z5NRNfW2Uldarf43VBEcg9xpKSjaqHDHoMCVGlq9jpfl2wghxWfEo6
         WLTXv4SRYXxZzhNldlHbvrf+UXloKoyY4zbasWcH4b4laQ7RHSojSPaRh8r26pFdvXS8
         JSCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541551; x=1796146351;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4Oh1DyqKmA18yB2cPepTMnYsZR1J1eTBbARcXdSV43M=;
        b=gPhG0Rxnu32M0Fl9Jn5O8Sa6tHVdJ52poBwP/s2R16gn4hZg3cAjX9Ls0pitqxWSeU
         oCBa/xOFTf0DbDmmSA0YyBPVMH5D7/Jmgy7G3j0mmBBSwvt34VS5soweatlYdezwI9V/
         hipObeI/RDxTQdzHCPAcgXrISHmCccAM5o+Uytg0UN4rY0pbdM312YV619XFj6tOtbJ4
         fdENNAw/jejexV40NIO0hSWNQbvv4h0RgrGh0t6LdyCxpHC3RTHpkfs+CNxqmRYL0fXR
         +F7CpNJ5+UdLBtJlDwHke/blTr5LFbdfTIHD29JXC0HK5Vs9rZDJ9tlRikKkalAYNNmp
         +JCQ==
X-Forwarded-Encrypted: i=1; AL+hErGkjox2IF7gnK6RMP0v7ntpFm1VBEUI170IOpuvfgTZ1RA/Ns4IigI5BNzjoewX4kEKuJ3US242lnJ0xglE@vger.kernel.org
X-Gm-Message-State: APuU4Z9h7mwS1W3NbZESwM7c+gzaowyS39iu/8fAVBAjEHDwHekS4Nn1
	5ZLHlRpWyDzEYOeqMCv/qN/SfKDuH4JnOK775gujUkRPg7dkzkCzYm76kdEjStnqwLs=
X-Gm-Gg: AZFdTZdKO0xoZ+S520/8yqTmej17D/NwX1FxVDW0CM9pjRtw1jUAXn7w+mj0RgZ/Vhe
	Q5YNQd19Y8IgqiBht+KJ5/SMpl5armsPAcxCLd8hCD2JzZvCgw/dSHUfM381GU5Gd+9Qll4qOoE
	s56lIdCTxDtXTA+4VFKUCiFs/MddqFZ1plxDFmm9L/pMx0NK+W7GajWFaIEv6TsUJocgPk0kX1i
	nJrg1FW0+AZUgQfIplREv36FJrR1wJdp29/rJzqTLFWofc9moQvr/kzvKFApfAt9IxV9roP8AvK
	SWmApfJvu5/m1WzveVb/koCM2EEOX4i5SeRQxE4qce8BnynyoUbRcYvBPFZz85UJH8qhWBDNvMA
	9RPBMixv8wgT4+b4R+2Hon54WvHIaPZvXRlOy+Qd595I7kkzrCqVSUiSS+os7VC7jfnwACEzNi7
	HxnZtUkWLoaYIglQbAIgVbjoG86fs5pRDAvIurS4+XV5KGCCl5J0bc34p4Oi9wA/ZUIt4owmC6V
	Ajy71luej1IbtGfQA96Y+Onr0P7u7EfoBwCK+WXBLG0ts+o/MzGPxc+Yifn9rVEOln9k8Z4Ok59
	Dqrn4s7dYr/khAIIjrEsDsszflEEjDYNQqhYeB21NFdQ60L9BQ==
X-Received: by 2002:a05:6000:2583:b0:4b3:e605:163c with SMTP id ffacd0b85a97d-4b5f5a34f32mr8050530f8f.42.1795541551137;
        Tue, 24 Nov 2026 09:32:31 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b9add26sm29560057f8f.44.2026.11.24.09.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:32:30 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:32:19 +0100
Subject: [PATCH v2 12/19] ASoC: qcom: lpass: add support for MI2S_SENARY &
 MI2S_SEPTENARY
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
Message-Id: <20261124-topic-sm8650-el2-v2-12-174e159f0f69@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4946;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=a/a/+f0uzfUCnVpje9Y+IYySPZ1t1Jorb7IHF/ZPQx0=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcog0Ns7v+uwIc5u+U0AO5gB9YvfldNatPBq3SLJ
 Yx/+rD2JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXKIAAKCRB33NvayMhJ0SK6D/
 9gbxuhmj5WT54sT/ZAX0xYVwXizDfQ2+wDT06C5ZLbfV1f5ztq10bdLgrzaOHGuIaCT+O3eN5X2RIh
 ZJwPDhfDeTyxlSBJpF0lvXiLaSbt7VIlDEH5sp8WabRqvPvpMt7KuB5EjNEN3uHJ/h8ZOGgQMxcFWG
 ei+lL/sZyIGmbCJtBxO4EO+F6gvcgqQgdx+Wg43g0pqafs3ti476kmXv2bq3pe+k6vOVY44WgP23sE
 /HUQuEaTOTsV4Rpy339e6IO/1FnAJQUS4ppZ0/ll0lS1r/m9V2hvYl12kLDkQ4ym0QgnePenoinLnt
 uKKeVS5BPXYKf0Gs/FVTwu+SFiun6pcwitBbZJDkZStrIhHzVPAWoj3V578rLC8vWRWRF+yzksycvi
 xjOEs7GFzXd0pISZkQ075uNhmb+htYrPsKo0oHNvnz/ZB8sh3FK/L35N2Ufk7qFjZZymwBBThKrTx9
 ITiuqeraLvNDGgFRHtHVrOBJ3pPtZPTaL3Xg0EgMxxuna6551J1MXZoo1zH2dLgdhbTSNLZ6zjLAfD
 YGsTJXqcl2CwmN9+XYr3CpHyI2kqNJPCqx2Yp3wOj32L+OmgTOgynsA5kn8nk0PB49Hrmosnre7YWO
 Aq4snKhdb9T1qjS+JDGe3KDErXzRnTDmnCMj3AdgifaZ0ELAkYXL4JxYjlyw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

Now we use the helper to translate the DAI id into a proper
MI2S port index, we can add support for the MI2S_SENARY &
MI2S_SEPTENARY ports.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 sound/soc/qcom/lpass-platform.c | 14 +++++++++++++-
 sound/soc/qcom/lpass.h          |  3 +++
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index dc7007155e95..48d819356aea 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -274,6 +274,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		port_id = mi2s_port_id(dai_id);
 		map = drvdata->mi2s_lpaif[port_id]->map;
 		drvdata->mi2s_lpaif[port_id]->substream[dma_ch] = substream;
@@ -303,6 +304,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	data->dma_ch = dma_ch;
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 	case LPASS_DP_RX:
 		ret = regmap_write(map, LPAIF_DMACTL_REG(v, dma_ch, dir, data->i2s_port), 0);
 		if (ret) {
@@ -361,6 +363,7 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		port_id = mi2s_port_id(dai_id);
 		drvdata->mi2s_lpaif[port_id]->substream[data->dma_ch] = NULL;
 		break;
@@ -400,6 +403,7 @@ static struct lpaif_dmactl *__lpass_get_dmactl_handle(const struct snd_pcm_subst
 
 	switch (cpu_dai->driver->id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		port_id = mi2s_port_id(cpu_dai->driver->id);
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			dmactl = drvdata->mi2s_lpaif[port_id]->rd_dmactl;
@@ -442,6 +446,7 @@ static int __lpass_get_id(const struct snd_pcm_substream *substream,
 
 	switch (cpu_dai->driver->id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
 			id = pcm_data->dma_ch;
 		else
@@ -481,6 +486,7 @@ static struct regmap *__lpass_get_regmap_handle(const struct snd_pcm_substream *
 
 	switch (cpu_dai->driver->id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		port_id = mi2s_port_id(cpu_dai->driver->id);
 		map = drvdata->mi2s_lpaif[port_id]->map;
 		break;
@@ -518,6 +524,7 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	int id;
 	int bitwidth;
 	unsigned int dai_id = cpu_dai->driver->id;
+	unsigned int port_id;
 	int ret, dma_port;
 
 	dmactl = __lpass_get_dmactl_handle(substream, component);
@@ -568,7 +575,9 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	case MI2S_TERTIARY:
 	case MI2S_QUATERNARY:
 	case MI2S_QUINARY:
-		dma_port = drvdata->mi2s_intf[dai_id] + v->dmactl_audif_start;
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		port_id = mi2s_port_id(dai_id);
+		dma_port = drvdata->mi2s_intf[port_id] + v->dmactl_audif_start;
 		ret = regmap_fields_write(dmactl->intf, id,
 						LPAIF_DMACTL_AUDINTF(dma_port));
 		if (ret) {
@@ -811,6 +820,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 		case MI2S_TERTIARY:
 		case MI2S_QUATERNARY:
 		case MI2S_QUINARY:
+		case MI2S_SENARY ... MI2S_SEPTENARY:
 			reg_irqclr = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_irqclr = LPAIF_IRQ_ALL(ch);
 
@@ -910,6 +920,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 		case MI2S_TERTIARY:
 		case MI2S_QUATERNARY:
 		case MI2S_QUINARY:
+		case MI2S_SENARY ... MI2S_SEPTENARY:
 			reg_irqen = LPAIF_IRQEN_REG(v, LPAIF_IRQ_PORT_HOST);
 			val_mask = LPAIF_IRQ_ALL(ch);
 			val_irqen = 0;
@@ -1064,6 +1075,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 	case MI2S_TERTIARY:
 	case MI2S_QUATERNARY:
 	case MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		port_id = mi2s_port_id(dai_id);
 		map = drvdata->mi2s_lpaif[port_id]->map;
 		reg = LPAIF_IRQCLEAR_REG(v, LPAIF_IRQ_PORT_HOST);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index 78125048b064..4407996fb145 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -45,6 +45,7 @@ static inline bool is_mi2s_port_id(int dai_id)
 {
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
+	case MI2S_SENARY ... MI2S_SEPTENARY:
 		return true;
 	default:
 		return false;
@@ -56,6 +57,8 @@ static inline int mi2s_port_id(int dai_id)
 	switch (dai_id) {
 	case MI2S_PRIMARY ... MI2S_QUINARY:
 		return dai_id;
+	case MI2S_SENARY ... MI2S_SEPTENARY:
+		return MI2S_QUINARY + (dai_id - MI2S_SENARY) + 1;
 	default:
 		return 0;
 	}

-- 
2.34.1

