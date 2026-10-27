Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793090807;
	b=nMxTwGVKzIcytGgfVOQrIqTapPskxYdA0ayAXJvznvILiycn+MzO5JG4qdsMaol/qPQ9
	 lav0gJAK9ZfvUlES0K3DipvfJoh2ubslQyRInsUrDVcVDnqTzLqdpqDweH4e4a2aLWkCC
	 YUX4PocAKNurWmPWFGBcQnVgBpZH7mVSICt5pmDF4zjeeROkugrxpYTlsqq26lVel75NQ
	 Mt4xVRl18DXPlC+9KLO+qT+QWOln+Qa8gOa6jeNGeLwyMq39RTfJL3sI+xKksszsw+4QM
	 5JfDwLOITGZ9FpyCQSznA6NTk30NyKY+5IQDGVD+axPEnbKwskNJgKw2uaGeWCu6jVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793090807;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=;
	b=yxEgz+XNsxsMEjFvWRih3gcrpi3a+OE99RR21ZrQdKZnURiBqDCKaES9CnYbN/W29kVH
	 +VYDn7ff/Iq80W2+wjTcSHLGvBVfmReuN1Dtoq3zRnDVfhckr5Bw1XEc7yM+FteM1Y2UB
	 H6VDu2iYsfuRTOBzC/yjiiERxI77Lp3n3tHHqZmUT4IYhlFlZqUy8lNEzoIgwaLmHp9DU
	 5hslb9bax/pGiHFEZ/sO4eRfND3xpzAbR2UqwVXQ3MoO3EXlbALzYWPQiKg+ybGWqFnvG
	 JBEHjl7bGJpEgUnSETI7Gg7gyzyb5aVmDs+YjRo8L4s1r5mJKlyOrlmgrd0n05jsiXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTdhWAjt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0OjA57I;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895B9606A31A
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:46:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895B9606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KTdhWAjt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0OjA57I
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R8gRk3168797
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:46:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=; b=KTdhWAjt5rkg4prv
	4SfvThM8b7bcb4GpC7SEFdioLLTO4J+0qVaNZ0+oIo4JAshlHyRDAjX4OPaMIJqL
	ggEOxJIVB7E5aZpcHjVAFj+bdb/rCpBZ+36HkLuR099m5id0pgfR06BNcAWTslL+
	sdkk1feYqlv7e216X9PVM4Sv2aezzxnPkyDEjGuk1sXJePEF1R6wfTakMoWchKhZ
	PvqQVJGtdWFLIfh9/LMGp4ZPkkQgURZxqJrUuNa0aVLJyGsSitZKCPR3/P+DcHJn
	mDRGaH6zeIWqUzX9T66gldRC0nesnkDTFLjFVbagjzWuuj4zgASp84AU9VxpndTk
	bxzppg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjb54jwyr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 08:46:45 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aca98f01c1so3796418a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 01:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793090805; x=1793695605; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=;
        b=a0OjA57ICx4pRQJNOLTfymaINATwDTSwuJ/m0RuwXUt6PdfurrAI0tAw1Ndectyhnt
         MY1ix/xsZZQffMt6FC/ZqZal+wJvcoCjqj6sIKMi99Gm2AacGWCLqQC/W7mtNBjDy+7n
         b12cDKSpE95MpfDQCRqp1SvXVYpWEtNriiSEslAMBaO9gQfODmDVtGxzkH5poVKBqVnz
         Xd64icvYCXPKqRMDTyaFIffzV66/Px3EW+617f/s0dqvVF9+dpKJ2IWyNyMnchyEbQ3/
         ZhXgYve0855BzNkNI1tfwtb32xkdoLw01lBTUe+QKikcPS4N+qE6M3tbWGdnlYiW8Hjc
         uX+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793090805; x=1793695605;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ypDb7Fx0jCCgb71eZZNRxztqQABOHADboWn0F4UJcmI=;
        b=GdjTNWFWp24PYkuLHBqddS/cY8pXWY/Wuo3oeDZ50nDtQP+Gy2kBBCCn/yGQQMOdAp
         BHcOmg7xkBcmxU9LLqbVa2/zPzjwDGgevJ2NSnW2wY4ePubZ6oqMiXzfBN22XrRbtnbz
         H84nXIIJSI8AAFU7m6ZDy5yPiWWjAP+CTrDQmaCudoKhBVl1+6IOnk1LRhmw49YF8izv
         gNWyLBKeHlgwnokZ6p2a1hVkv8rMRHTRaDsseOLtiFrUr7LX37uDtXfKlg0aWs0Cx4X/
         owr1KKfh/CBpFz3M7H4b3UW4xGZiEQMa1t92c+b0xBDXXwjCU97PBPKWVGDeQXdaDwz0
         qgAg==
X-Forwarded-Encrypted: i=1; AKwUvBxrRIV2fqbIEjzDCfi29g4GUfVCFdF5t4rfLtlumU5n2tPywuXTeWSiiMcNUkIUqy//J2dc2TmgyftnN9hx@vger.kernel.org
X-Gm-Message-State: AFq9FYKNvnHaznigqImCLs4vmCDId+UvYZazpzsTBpYfE3bJoFyvIENX
	QKbsDWuDq+IZMk6ebgyMLlA4KvyvRny0M6yAHsV0B/6NEW2L8KsJlg8sOOt7yUfuD17LT6j7UpT
	SdyDps0lRbjW8+tJVd3rpM/zCyJvnJeB+4ldjgc+hzz/q7JNjpiQgAa7uAGbT2NqrmH6I
X-Gm-Gg: AYBFou2WwQyPRfw9Ca6/JkuFoGtJd97CI44knVtLvf/Dg/kZJJuocBquzIhJLPZwI6B
	mIEADTJIE47bNv7AAh0Ele5YsTBZm65S080+0LEaemgbZfWahNT+ncupEueIdNUJB+eLRugZYMp
	s2t226E0+WO2IZLLfEU1nZ4iVB01vPaY+ZxxhIbDrmTdnTJ5Q2FNX+2sQ/9ydY3qczx4fAQoSey
	tT4eIwcZlOeZ38g+QSyHzW7FLYqJVW5OGxlStIU7JtUQKSRWAehy+/7mzv6XXMWk3JYbDuyoN+K
	B4xXNMugbB/fbO0U6MIfH9O34y8JXLdBz/no52QB5H6dSxNL07n7ESPxQK5sw4OGKfzCmQyGsra
	7ZZYwkQVqPJ8inmM9Y+0aYQd3W6E54qwC
X-Received: by 2002:a17:90b:4a84:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3adeb15557amr7792380a91.67.1793090804784;
        Tue, 27 Oct 2026 01:46:44 -0700 (PDT)
X-Received: by 2002:a17:90b:4a84:b0:3ac:ad90:7090 with SMTP id 98e67ed59e1d1-3adeb15557amr7792353a91.67.1793090804116;
        Tue, 27 Oct 2026 01:46:44 -0700 (PDT)
Received: from [10.219.49.187] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae404429a8sm2824282a91.8.2026.10.27.01.46.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 01:46:43 -0700 (PDT)
Message-ID: <2936b4ec-3203-4137-9d29-7f95f22186d8@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 14:16:37 +0530
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: support multichannel PCM
 formats
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261026082534.986449-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfX5g6pETmaSELN
 Wr/BV3IwMaUjZMz2cWY2QRXsMxzMM8uRIaLG0iRncJPF32Lhyn6beptqykKr6SorEiFvWaV66yT
 4GZpecGM1rNit+CQd5M5FQg+/n3bc+E=
X-Authority-Analysis: v=2.4 cv=bsnZl0ai c=1 sm=1 tr=0 ts=6ae064f5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=npAxPzOB_l-6x8PHPlgA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: o35P6J1V4_dmk6qJvdI1Kvkyc6X01R5t
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAzNCBTYWx0ZWRfXyohDz35G186X
 Wn9rNin93PO8qEfWb+w3c+A87Ynu/Ex9DIO/w7qwoWsYA1ZKZfSAtw4ToesPp8oVDSSlZ9GoxdE
 3clzXLIDanTp7QKglSAo7CAWmGmuMuOiScCUYojJsvUtEf+aA/RZFPd2z0wL5xRg/oP9sI3AviJ
 trneD5G38IA7pCvcqosW/ESxb/Il8FTb3I/GM7wMAxzAQx+D8kE95afOE27SeD+EjAB94NJ9Zzz
 Iq5Plo7P4hjAVOycgc8UP8rXipjzpWfI35o4qOmKH1A9hmHxaA06B72H8qlmDSXbynn9PpA4CKb
 uE53YdW+SIHwX/l/6bXUnrSSQl1ZWZHKJ1V3uYNxe+2f6MOa4K025PcUL1js94sOIaE/6rG5F4K
 VVDT4henmHunKA3Gag2CSgZksP+qdAfgNl27Km9WeGsMO7/3qGKa9LU8M53GozC6XjuX8CAfg8J
 ybMu5HKwVvmM+V6Zw7Q==
X-Proofpoint-GUID: o35P6J1V4_dmk6qJvdI1Kvkyc6X01R5t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270034

>   #define DRV_NAME "q6apm-dai"
>   #define POS_BUFFER_BYTES	4096
> @@ -344,7 +345,10 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
>   	cfg.num_channels = runtime->channels;
>   	cfg.bit_width = prtd->bits_per_sample;
>   	cfg.fmt = SND_AUDIOCODEC_PCM;
> -	audioreach_set_default_channel_mapping(cfg.channel_map, runtime->channels);
> +	ret = q6dsp_map_channels(cfg.channel_map, runtime->channels);
> +	if (ret)
> +		return ret;
> +
>   	if (prtd->state) {
>   		/* clear the previous setup if any  */
>   		q6apm_graph_stop(prtd->graph);
> @@ -1007,8 +1011,10 @@ static int q6apm_dai_compr_set_params(struct snd_soc_component *component,
>   		cfg.num_channels = 2;
>   		cfg.bit_width = prtd->bits_per_sample;
>   		cfg.fmt = codec->id;
> -		audioreach_set_default_channel_mapping(cfg.channel_map,
> -						       cfg.num_channels);
> +		ret = q6dsp_map_channels(cfg.channel_map, cfg.num_channels);
|
|
|q6dsp_map_channels()| changes the mono mapping from |PCM_CHANNEL_FL| to 
|PCM_CHANNEL_FC| and does not handle 7 channels. Have these cases been 
checked and confirmed to be supported as expected for AudioReach ?

Thanks,
Prasad

> +		if (ret)
> +			return ret;
> +
>   		memcpy(&cfg.codec, codec, sizeof(*codec));
>   
>   		ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 83f2711bceea..fcc0267d3657 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -147,7 +147,9 @@ static int q6hdmi_hw_params(struct snd_pcm_substream *substream,
>   	cfg->bit_width = params_width(params);
>   	cfg->sample_rate = params_rate(params);
>   	cfg->num_channels = channels;
> -	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
> +	ret = q6dsp_map_channels(cfg->channel_map, channels);
> +	if (ret)
> +		return ret;
>   
>   	switch (dai->id) {
>   	case DISPLAY_PORT_RX_0:
> @@ -173,11 +175,14 @@ static int q6dma_hw_params(struct snd_pcm_substream *substream,
>   	struct q6apm_lpass_dai_data *dai_data = dev_get_drvdata(dai->dev);
>   	struct audioreach_module_config *cfg = &dai_data->module_config[dai->id];
>   	int channels = hw_param_interval_c(params, SNDRV_PCM_HW_PARAM_CHANNELS)->max;
> +	int ret;
>   
>   	cfg->bit_width = params_width(params);
>   	cfg->sample_rate = params_rate(params);
>   	cfg->num_channels = channels;
> -	audioreach_set_default_channel_mapping(cfg->channel_map, channels);
> +	ret = q6dsp_map_channels(cfg->channel_map, channels);
> +	if (ret)
> +		return ret;
>   
>   	return 0;
>   }
