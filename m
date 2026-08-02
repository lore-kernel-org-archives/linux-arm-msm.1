Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CEA3AE1B1
	for <linux-arm-msm@vger.kernel.org>; Sun,  2 Aug 2026 13:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785676124; cv=none; b=WKTbL5GT4caSIeBJVwwT4mM1jCq1NSE77MFM5KbcXSg8gjF4oD5NOga6qSLaA1o+3s7mseSXHX8HkY0AFpzYXKq1YdlcSG6F6dQIPTmmf+qnxIf69KBQoGyS4hYUHOwLJbZJ7Ui1LI+zacTRVNMyt0KFdGZpxES3gw2gTd/e/Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785676124; c=relaxed/simple;
	bh=Zjr/GgkfQN8HSlBsnDUe5c06WaWL49Nm33OUy/WRiT8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gp6ANPZ/CgA1IqFznXbzv0O6nOUCHJvCtJOes6Z0SVtFiKM6K7etIW2oSauJ28CECMIyDJJ/U3FvLYh85U3nUVGbUyQfKATb9z7w9ZRwC/4GGjjj2VoQXa7asgg4UL4AXim/12ZJDocCv09chf0RsH3gB54A/YlsPxrEr9bg/5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=msWveZee; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VkvMHkWI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="msWveZee";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VkvMHkWI"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 672B6hJC1352547
	for <linux-arm-msm@vger.kernel.org>; Sun, 2 Aug 2026 13:08:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tzTlSswQ+tryVfPWA7dtL2qCpFKJCmXOg6f/dfXV+1U=; b=msWveZeeBOmevEEl
	3Qxgw9QqSsnoiPZYLFrAHsscSg8Y2oNOqCrfEpoamkM7s/YRIouQc4PQ17SQDQvU
	FtBFsX27tCD3hmfHEAkwCxKFUU2ikf1kS0T5yythTfKNf2PYKrDxnEWiDkoMbWRe
	hPUZn8JopYtuCSt7peBqsZn0L8UK8UMTVHO019GeTnN/aoSHoCuWYALoWjLJcJhU
	jGLSmF+BdYdSEfvsdiOH9TNsH86F7LW7dT4raBQOYz1pyPF1wjKvcNVxLshWpngp
	f36vx84ysR1Sl72bbEbzRfVAQJ+Ido0vARdYQdKI4dcnZqEYq43kGoojvsXG+qn6
	pQOZ1A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fs9jftq6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 13:08:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52827090cc5so26208401cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 02 Aug 2026 06:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785676121; x=1786280921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tzTlSswQ+tryVfPWA7dtL2qCpFKJCmXOg6f/dfXV+1U=;
        b=VkvMHkWI+Gw33HRuOyHYtimn4Tffq5hm15SF8rfxGHBMRNvh6lUyiGEWcjTARKfpyH
         RW0etXmOet5pAokw5VqV/9n3wpnnmWePDnX2BHF89XLpOhGn1BBXsxc4EFSzwF4J5Zzi
         8rBcMfDgk/ZTTZ+7QeT70b1OmRBoRGO9aYDsEsGae4cqqiw2No0AiWjjMcYJO0ZJLP/A
         qMIMo6VqjTr0YgkqFsN+aPVh5tJ5Cj3WwJu+4VSf3WtgeJ+pKnHDoYUuz/ZrkqUFn3RA
         YX2A0VpAI82nvq8bAua4vdQl0n4Pfxsp/H+W0P8ve+9slu0fPtFjfRD2g21tcZ9kc51U
         oMWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785676121; x=1786280921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tzTlSswQ+tryVfPWA7dtL2qCpFKJCmXOg6f/dfXV+1U=;
        b=KQ2RM6jpw2L9l8teG2G28a5PmYSiqdlRK2fCRrGUXlcBl6OCHbuy9sRU2cO7z435Gu
         QW1mQ4/RkxmlsQYOQUVDD4HqNYjg47LNaKsBUNY3JHZZ1GhEuFYe3TCrd4vdAaWURGQI
         FgYT3Q+tV7Gk4AE36bfGsvqiavqEY92XGBaq3otMCaEbMJKpbJbatUXbcnahMw3orzi4
         Y5ek6BsUcEJvhCBuYn090jzdBDG09/F58w0/2H/5Y/nuHNJnbbI5mkhZf4lCzb8BXxcj
         6QK+OGOASxZSWh9YNbA5gXEgly/zNU2cLsrddreU33U1tl+T3rROP053okXCOVhjgMW6
         9F8w==
X-Gm-Message-State: AOJu0Yw1K1pAKI8eqzL+OoLsfkUb5hQZYs5QJOJgXANpWLu9vJNYvNhN
	OVKq7ZzHwu4h6OZAdUCJC1P2UgVjjGg2zWRJa8EFfZzoj4RiYD8m9KRxhE0z7vAYrSV75jUzmGM
	k79Nunh3j97aj4qLMsYOL1zOrHzidL/F454cmhmWWMEBgWjr8GDkiGokwXBsf4EoE2jXw
X-Gm-Gg: AR+sD11H1n8Ctu5npSvtRbljK/xo8nrks/VtnZoa0r6VkJsBDKTYWXWMOT2XS+MWtr7
	Uby2X1LpJK5sVKKuuNFAUEjh1m2skLANNUssH0gAsamdgehM7zp+i/AJf6Q6Zz3if4Yt6lhRtsx
	P6SjKzJMnZFVu7ueBJkuUDjGvKWqxZj8WAuK2rcfKyoOUWbdYsPwuRbT/9EZZL9nfa4YOijlakg
	Q7U1+uW1ngnU6P5ek75jSCg9meSjrThDODd/ZOyYi2BQ4uIaqBj2j0RhpT8kpk+gon7csesLhHd
	e3oUTiXCcJkN/Mh3p2WWjJe7Edidfh6LMUtUaD56Mo8njyIswA6KXMtUNq8z3oKAdBMP1MV0Lgk
	FukpIHqPiURynZt+oAv28vNf/PGU=
X-Received: by 2002:ac8:5cc3:0:b0:51c:291:82eb with SMTP id d75a77b69052e-52b4c5877a4mr155031601cf.14.1785676120905;
        Sun, 02 Aug 2026 06:08:40 -0700 (PDT)
X-Received: by 2002:ac8:5cc3:0:b0:51c:291:82eb with SMTP id d75a77b69052e-52b4c5877a4mr155030951cf.14.1785676120464;
        Sun, 02 Aug 2026 06:08:40 -0700 (PDT)
Received: from [192.168.68.104] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49807b9441csm132440315e9.4.2026.08.02.06.08.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 06:08:38 -0700 (PDT)
Message-ID: <192088d6-a50f-4eaa-9aeb-41db6d2a2126@oss.qualcomm.com>
Date: Sun, 2 Aug 2026 14:08:37 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/7] ASoC: qcom: q6apm-lpass-dais: add TDM DAI
 operations
To: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260801054610.4047089-1-prasad.kumpatla@oss.qualcomm.com>
 <20260801054610.4047089-3-prasad.kumpatla@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260801054610.4047089-3-prasad.kumpatla@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: hw9c_js-5kvBxIcbAx72ZFKLpgXIZ_kA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODAyMDExNSBTYWx0ZWRfX8lVK42E9321y
 Mh4aWYZV6TUkLwbsQTtVvaV0CkHS+ZwTKcrpR3o0sTbfycI8TdGO5qJ/hg84m01ULjQSbeH6NQp
 Jc4mVs2qQN5RMshPXO0Et152qdY/gFeWvSrewUrmuIiG2qO1mkhNcPqtCCBtVHZSCujjaWlVdni
 JKvUiqV4TgzCwBUqOx/I3gBbYmg7UoPtDkTC7CuMqwQs5mXtwJYPLAT+isK11YutXj93v7hZFa1
 OpRKLY9ajpP4Vvh+LdA+S1yJw7Fagh3bveoH5PJVPAT1Oq+oGeR/ChRNGVxN4zMct6JdPO4H5Iz
 YFuBRRC9YBRcOTT6/kXXjPutQcBX1macrrdq2hmuo1+Od/QYMie4nDGjBWg9QntyyTMxfBesLyb
 FD/XeUycmKRrynpqIbiS7hEhKc1jBVtLjI8WyiM/T/7YjhapezEODIgLXQXaoxQ8bwDb1gsZQYL
 pF8RvvYe59sdXCxv5Kg==
X-Authority-Analysis: v=2.4 cv=TYSmcxQh c=1 sm=1 tr=0 ts=6a6f4159 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=VHJlbi77fKg4ZXaQ5xoA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: hw9c_js-5kvBxIcbAx72ZFKLpgXIZ_kA
X-Proofpoint-Spam-Info: AW1haW4tMjYwODAyMDExNSBTYWx0ZWRfXwQprVhE1l5uF
 bfs055hcKfpCazISMXLLhQt6wwxwD6QwRZ1av0VBNOPIZsk5EFoY/gpVMMvpC+eEctz0lyXp2hY
 JYacKZZAR/E20Hus1jfDppLEicxpXVQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-02_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608020115

On 8/1/26 6:46 AM, Prasad Kumpatla wrote:
> Add TDM DAI operations to q6apm-lpass-dais so AudioReach TDM
> backends can be configured through the normal ASoC hw_params and DAI
> setup flow.
> 
> The TDM set_tdm_slot() callback validates the supported slot width and
> slot count, stores the active slot mask in the AudioReach module
> configuration, and leaves existing DMA, I2S and HDMI paths unchanged.
> 
> Reuse the existing LPASS child-clock handling for TDM nodes as well as
> MI2S nodes, since TDM backends also request optional backend clocks
> through the machine driver set_sysclk() path.
> 
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> ---
lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 60 +++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index e68e8b000e07..e204fd59e512 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -358,6 +358,53 @@ static int q6i2s_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
>  	return 0;
>  }
>  
> +static int q6tdm_set_tdm_slot(struct snd_soc_dai *dai,
> +			      unsigned int tx_mask,
> +			      unsigned int rx_mask,
> +			      int slots, int slot_width)
> +{
> +	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
> +	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
> +	unsigned int cap_mask, slot_mask;
> +
> +	if (slot_width != 16 && slot_width != 32) {
> +		dev_err(dai->dev, "%s: invalid slot_width %d\n", __func__, slot_width);
> +		return -EINVAL;
> +	}
> +
> +	switch (slots) {
> +	case 2:
> +	case 4:
> +	case 8:
> +	case 16:
> +		cap_mask = GENMASK(slots - 1, 0);
> +		break;
> +	default:
> +		dev_err(dai->dev, "%s: invalid slots %d\n", __func__, slots);
> +		return -EINVAL;
> +	}
> +
> +	switch (dai->id) {
> +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +		slot_mask = (dai->id & 0x1) ? tx_mask : rx_mask;
> +		if (slot_mask & ~cap_mask) {
> +			dev_err(dai->dev, "%s: invalid slot mask 0x%x for %d slots\n",
> +				__func__, slot_mask, slots);
> +			return -EINVAL;
> +		}
> +
> +		cfg->nslots_per_frame = slots;
> +		cfg->slot_width = slot_width;
> +		cfg->slot_mask = slot_mask;
> +		break;
> +	default:
> +		dev_err(dai->dev, "%s: invalid dai id 0x%x\n", __func__, dai->id);
> +		return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct snd_soc_dai_ops q6dma_ops = {
>  	.prepare	= q6apm_lpass_dai_prepare,
>  	.startup	= q6apm_lpass_dai_startup,
> @@ -387,6 +434,17 @@ static const struct snd_soc_dai_ops q6hdmi_ops = {
>  	.trigger	= q6apm_lpass_dai_trigger,
>  };
>  
> +static const struct snd_soc_dai_ops q6tdm_ops = {
> +	.prepare	= q6apm_lpass_dai_prepare,
> +	.startup	= q6apm_lpass_dai_startup,
> +	.shutdown	= q6i2s_lpass_dai_shutdown,
> +	.set_tdm_slot	= q6tdm_set_tdm_slot,
> +	.hw_params	= q6dma_hw_params,
> +	.set_fmt	= q6i2s_set_fmt,
> +	.set_sysclk	= q6i2s_set_sysclk,
> +	.trigger	= q6apm_lpass_dai_trigger,
> +};
> +
>  static const struct snd_soc_component_driver q6apm_lpass_dai_component = {
>  	.name = "q6apm-be-dai-component",
>  	.of_xlate_dai_name = q6dsp_audio_ports_of_xlate_dai_name,
> @@ -415,6 +473,7 @@ static int of_q6apm_parse_dai_data(struct device *dev,
>  		case PRIMARY_MI2S_RX ... QUATERNARY_MI2S_TX:
>  		case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>  		case SENARY_MI2S_RX ... SENARY_MI2S_TX:
> +		case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
>  			priv = &data->priv[id];
>  			priv->mclk = of_clk_get_by_name(node, "mclk");
>  			if (IS_ERR(priv->mclk)) {
> @@ -479,6 +538,7 @@ static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
>  	cfg.q6i2s_ops = &q6i2s_ops;
>  	cfg.q6dma_ops = &q6dma_ops;
>  	cfg.q6hdmi_ops = &q6hdmi_ops;
> +	cfg.q6tdm_ops = &q6tdm_ops;
>  	dais = q6dsp_audio_ports_set_config(dev, &cfg, &num_dais);
>  
>  	return devm_snd_soc_register_component(dev, &q6apm_lpass_dai_component, dais, num_dais);

