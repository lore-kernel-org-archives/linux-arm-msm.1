Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793191515;
	b=C6ZP3vCJDsFOgTpGHNawNTWkswgN7RdJR2oka1CQeFl+GieG5+PhEPXxPv4pFnXZBgqh
	 xEGjmZ0rMMrCO2qPXvZsVF3xg0uLRPhoPKodW4rxZFJn253k582eserJDwpFR+PZNRrQL
	 2WT6q/WQdq6aNEIuqrArxLqv9Jo285YBJNG80C/WiWgWnI9jsX1I1FH54pPSiTib90xiK
	 E8HviHKLWZqWN3zURuyPLi8XPbq9GCv2oPKrBjybK7GVfhiuoB3mdToOUCsXU3e8c2U8j
	 +Mvmhi6SJpL87qXkrrafftUAeg4a7iEcpsz5emuvuKRYtBEPn/M+pOtsZYcNXzx6l0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793191515;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=;
	b=O2V8UBbzgqjgn2osfwZGqa786j3TF0/k/nDSGbj1jZUxxsb3i7P8TnhxSbCrWSpmzSAB
	 DVjB6UoshJsDlCnv/lFAaVAvVzLiuRqqVV/Z00zr/ia6BoISbJ1hzp7NAz6fjm5Z81g/L
	 xV/gXR5bdywK47KhocXDQALcxSz/Az4UotDsRBU6vK4SoGLbsPgcgxLf32Dp/mBAeRY8x
	 ttKFZyW/nfV0vxv3OWlvBG124xi5lGXHmlVqPOcULx6ypaLjpTp+uBbRTijynpV+X8sDZ
	 ROQtnjSa7fYpdsdB3QWmGUzlZbpUxUWwaexJFyjLnw9H1ivE8CNycy+TSBEIW8hrZFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I44WwHAm;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfKPZVyu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47726606A31F
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:45:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47726606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I44WwHAm;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gfKPZVyu
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2gc505313
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=; b=I44WwHAm/HLXf4JB
	acZzXtlzC8FLWO1unDttC4szXJESyC1+HmHFlL7YVwzPx0Ag0hCwCgPj4APu6nHh
	BgER+kq3w+iwcSyxMx39ox2lMIFtn/p0AHLbosPkVycMa59y1x/+5UM8xr/Mycb3
	/PUbTf33jTnuAbaUzrhHMPVE1z5BYMiWkFflzS2JvJDbD/ewmwjffhTthAScgooc
	SIUTSZkXZ6ZPsfq6mIeDl1WZlM7Bvrncq5Qs+tEtkscTYTy1n5cKo30V9KhPDlxW
	buJZDjYLsyutXkH69rhU2lwmay9GxvzykqzZR56r8/7UoAxyu40f3FlF44qQWyMJ
	o9KI9g==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy6g4477-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 12:45:14 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36a223755e4so2990848eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 05:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793191514; x=1793796314; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=;
        b=gfKPZVyuum0r/qncMkIvmoa2kVw8ZnhkQz5T73XosjQNPfHIR2zbsez8sH9qRoOuUE
         9ao0MFGspvb7tOqtIMTWXGJnSxyxIo2MfYX/l7xxVY9waG87FlZZMgDiRTYKly7GzsyB
         0867373ClCSsaQfKbUUIqTOfVgfLKJDMH64cTv8yOBmWs5D5KSg6elK5X6hKq1dAt5RJ
         wMEb4ezOS7cmhSvMdvQsJ0p+Czr/+0l1IQHoRzL2IxFmLY71Jyq7nRXweOyZP9OVMPny
         8eeAGa9no/cL5CZsP4qHBsTqsVoGc3n6u2kWN7T4ErvY6XoTUxcZb5jmZFEQp0Vovvro
         IqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793191514; x=1793796314;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5KmPEv9BbYq9ivb9/xdVcH9aF3UwmKIrOH5Phn5qMjw=;
        b=PME2Oi5sGz8MGaF9tnzD1iUhahyas6ZNEjo3S97UEvdqS9RayXOhjBwgoD4TZaLvpB
         +QYMXReZeI77ovAooWyFsXN6idYklJY5EIPd6LvPyuQFnXiO7Nhp7AQpqi/Z7uBWfY4n
         Uwy7B6O6sHcdwX0oEoWgXYGhjrFOYwTV77j2m2VI80MzgB3wEtHm17LHg+zaakMkx4w2
         QwVN2h/TtPXuS6ZDl6W8YV2kRSODWhFoUJky3FXX98vLd511GJ2/v5ig8MDD6XKTwUaR
         D0ljUK3OmuXvMpeh48ss0LSfRInFro60jddl9/zFZHz6uQUjNbTj5dvlwFUgF0z/SVyA
         7wYg==
X-Gm-Message-State: AFq9FYLXDGArhJshswneKqAo2XXyKVouCimmhr4RNaxbfw0s5EvZaKlr
	VIBlWBMlb2m3bjr1vJqynwRa8pgizaHytns3IpeVo+SAi4a3P8+9/oHMdMu9IUZVTTL9OuLNlOO
	5fSbEPbKGi+E8jb+2vJluxX5pE324vEjEguMa3oJkuJvFBKIswbpWEdaukAG32ubqsUzD
X-Gm-Gg: AYBFou1nNK08fzc1EbcMsRlDzLeWN26VZ3Q0pUa0+8Y9qAJ1Ar5jyGjzYTCMSFJng73
	apaSEtGHdXtglYKXVfaO+5zTsMzQcbRsnq+PGZVcBzkLwjAkEqxGeyBRyEaLXsEzlIhZrBmuVM/
	6zzoVGWCZBOW+advG50xMeyi2ZQTW49zj3dxtGT1Me3G2Hygi7xycOQFuc8CReZ/ku5r+iVMxWr
	6TQJ486Qa3MrX3xiOC2PqlMeoBSmTlfaUTENwKWlrs7iXdjDAk3CrtEBVpYYEHtNK7mt3vpY4Jy
	7L3YteRxP3uDnwTAlzYimAjW7l+AxjvMT9AFirzEmkAzqS1IbyXoP0dXNgqzLzvdOK+FIBSGj9m
	Uw0RqbXke8Dkh6ASkJK+6VgkuJd1kProFVdECwZVSEPOV9S6SZG+v8TsHNXF21epzFcc1cb7bY5
	JtQkxistE/
X-Received: by 2002:a05:7301:1448:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36a20443a72mr3591404eec.36.1793191513450;
        Wed, 28 Oct 2026 05:45:13 -0700 (PDT)
X-Received: by 2002:a05:7301:1448:b0:369:f97f:72c1 with SMTP id 5a478bee46e88-36a20443a72mr3591342eec.36.1793191512698;
        Wed, 28 Oct 2026 05:45:12 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a239644efsm10179800eec.23.2026.10.28.05.45.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 05:45:12 -0700 (PDT)
Message-ID: <dd81646e-a30b-46a9-84a1-bc39d71ec748@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 18:15:04 +0530
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
Subject: Re: [PATCH v2 2/5] ASoC: qcom: sc8280xp: Extend hw_params for QAIF
 backends
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20260910-shikra-machine-v2-v2-0-9bf6bad589d8@oss.qualcomm.com>
 <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20260910-shikra-machine-v2-v2-2-9bf6bad589d8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX8gYlchB3IARb
 ee8kBr535LodqKN+aHUZ+VLez0nnvltsbD/r6EQlIOEtwTO7fqrKoszyj4M3rnuC9vLBmW718iy
 L6/5oJ6TgbHVYHq8U6fNoJhwUyfyD7zxBIsCOLD/K2iG3eGFZ6rHu+Jugb0QQHBVth2LqfU0JB2
 7Hspt+RgmkFnqzHaEpDur3/rrwhbrx5tKE2PiGdPxhFe+cijfF99FGsffi0N3UUhUaV5wvR53Jh
 DWKMXKr4QjdiXewoGYK0/XiixveN3y7mDV/6UHOOQmJfDPy7Kux7Ilk8D2Su1yYYY0dZS8wVKTk
 Wt8wtyaH9C5X1lVbnAEuSdSezotC+RD5Gq+JiFiZKXmp5Gbe641WnXtCzX4iTdPYkp/bPa1lzwJ
 6UAm53OKc4cCqf5PavUONAzOJrN1j6TiaxviREodBIiDM/qgMfjna09M8neU1mgbHly55KFxQQs
 V9vKznhmKqfDbLPlp6A==
X-Proofpoint-GUID: EkW4bCWqQW9SB9hJDkAb-GUbTsGygxib
X-Proofpoint-ORIG-GUID: EkW4bCWqQW9SB9hJDkAb-GUbTsGygxib
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MCBTYWx0ZWRfX1QIdevgDPR1W
 Y3vHy8uvSyoulfjc99VkC6DqrTMUq0xjHu2f614IMEp5OVcUUVpxdH/WBQVvOtEo0CaQD8f5Xqe
 GVyw4uC08qdiHe7T3Q4zV3ijfkB0pVE=
X-Authority-Analysis: v=2.4 cv=dKgzC+Zb c=1 sm=1 tr=0 ts=6ae1ee5a cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=fOOVHHMWt1wa0l6bWdMA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280050

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 4d48e1012cd4..452296a9e67d 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -67,6 +67,7 @@ struct qcom_snd_soc_common {
>   	const struct snd_kcontrol_new *controls;
>   	int num_controls;
>   	unsigned int codec_dai_fmt;
> +	unsigned int cpu_dai_fmt;
>   	bool codec_sysclk_set;
>   	bool mi2s_mclk_enable;
>   	bool mi2s_bclk_enable;
> @@ -126,9 +127,15 @@ static int sc8280xp_tdm_hw_params(struct snd_pcm_substream *substream,
>   	if (!cpu_cfg.slots)
>   		return 0;
>   
> -	ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> -	if (ret && ret != -ENOTSUPP)
> -		return ret;
> +	if (data->priv->cpu_dai_fmt) {

Could this be simplified by selecting the format first and keeping a single call and error path?
Same in sc8280xp_snd_hw_params().

fmt = data->priv->cpu_dai_fmt ?: SND_SOC_DAIFMT_BP_FP;
ret = snd_soc_dai_set_fmt(cpu_dai, fmt);
	if (ret && ret != -ENOTSUPP)
		return ret;

> +		ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
> +		if (ret && ret != -ENOTSUPP)
> +			return ret;
> +	} else {
> +		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +		if (ret && ret != -ENOTSUPP)
> +			return ret;
> +	}
>   
>   	if (data->priv->codec_dai_fmt) {
>   		for_each_rtd_codec_dais(rtd, i, codec_dai) {
> @@ -234,6 +241,7 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   	case TX_CODEC_DMA_TX_1:
>   	case TX_CODEC_DMA_TX_2:
>   	case TX_CODEC_DMA_TX_3:
> +	case VA_CODEC_DMA_TX_1:
>   		channels->min = 1;
>   		break;
>   	default:
> @@ -260,9 +268,16 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>   	case QUINARY_MI2S_RX ... QUINARY_MI2S_TX:
>   	case SENARY_MI2S_RX ... SENARY_MI2S_TX:
>   	case LPI_MI2S_RX_0 ... LPI_MI2S_TX_4:
> -		ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> -		if (ret && ret != -ENOTSUPP)
> -			return ret;
> +	case AIF_MI2S_RX_0 ... AIF_MI2S_TX_12:
> +		if (data->priv->cpu_dai_fmt) {
> +			ret = snd_soc_dai_set_fmt(cpu_dai, data->priv->cpu_dai_fmt);
> +			if (ret && ret != -ENOTSUPP)
> +				return ret;
> +		} else {
> +			ret = snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
> +			if (ret && ret != -ENOTSUPP)
> +				return ret;
> +		}
>   
>   		if (data->priv->codec_dai_fmt) {
>   			ret = snd_soc_dai_set_fmt(codec_dai,
> @@ -296,6 +311,7 @@ static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>   		}
>   		break;
>   	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12:
>   		return sc8280xp_tdm_hw_params(substream, params);
>   	default:
>   		break;
> @@ -382,7 +398,7 @@ static void sc8280xp_add_be_ops(struct snd_soc_card *card)
>   	int i;
>   
>   	for_each_card_prelinks(card, i, link) {
> -		if (link->no_pcm == 1) {
> +		if (link->no_pcm == 1 || link->num_codecs > 0) {

Can num_codecs > 0 also match DPCM frontends using the dummy codec?
If so, would this unintentionally apply the BE ops/fixup to existing frontend links?

Thanks,
Prasad

