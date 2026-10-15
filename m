Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 542DB4B95C7
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792054705; cv=none; b=uERBQJKxexh/9k1xOdkf8oWPHWe4kSuAJ8R92jqzLigmNlTaWx52aHRAAm3XueysM+JuNwjrLWEyDJaMPrSY7l+QllNjrPEkqVLTVaAPmAhVxJvHcxFnxtVM04jfFXMWAsGBHxkv40l9awwXxS2qQG/auuYz6JEeuHibBAr/Zkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792054705; c=relaxed/simple;
	bh=7/nbnKW2nnSc1ficaU3jxNOx9sR8BYEaxPIvZsMJXS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e7svBjURIGz0gUAK8a7bXtSjUYOQtFrXptfnJ1vZ9KinTkZ29pbkq0LKiCgsXKTxChxpGf3+mvBzdEYDRP4L++vdOPAkdQzMUqLYd6IzVqariH9QaWhXI577tErl6Mo2EAagGZPxsbqhOv31noeSD+XKd8p0jIzbOSr9LNm/3as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EhHaThTG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ggf/v8Yj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EhHaThTG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ggf/v8Yj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F3wb4f1889513
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:58:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xzOVLDhYNiCkQyabQc2njLlkkws8G7Pe3EA53/TYwAE=; b=EhHaThTGShAQNBVp
	DJYfPNHjEN4GPhS/1KePXbs69A8LhyZRyAALD2YuXjw4V1yYRQAHrWLLTlZh1HAz
	ZyerWizZH/8tVmmaoSFh48lEJtwtXG7134jOShVAt9Pr0mvPZTXhfM74Y0OurP9s
	L/uVyhSctgeG/SM/8TaTaHMl1DrqnUDQXxtRJfUDjjI7KmbkmlmcpbvmAHa5R3S5
	wGOvXYSPDKtQw/ezh0nhDe2lR81wCmwpjld6QE79qqfifSGoQ3CD/nCyrEskazQn
	ue7hqM0GwY8neJlsNsxtzNDvQcSU1bunfbkCNv3OQAprQOP+mbpyuS8HIwmEo6dC
	SoExNg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqda14uw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 08:58:20 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-917a7fffbe0so113560786d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 01:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792054700; x=1792659500; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xzOVLDhYNiCkQyabQc2njLlkkws8G7Pe3EA53/TYwAE=;
        b=ggf/v8YjqjWPSRyESbucep/QDMeiZwDotnlUHYjw1tfLfYzlAdBP0r5dJu96f0uEw5
         NfmRhIUN2GPejuBry/+S/Rd3wZUgVktTqaBlS6j85qmnxz7ALgl821rnSINYf9nDw9n7
         DYo6mHqgb/iJms41P0mb86RfCDcwLIRtERPUo8kDFqh3kkxPH86CoWbLV12ALqE68uCs
         P+mUVtMFPq7wWc9mhJhUEWl/emfC8D+yPzyjMI8ZbgCBiduIRmGERizXO5UCdS9RtIVL
         XiVpD/2/3BvOJDiro2bVnK3RVY8sDYXjkgDSmYawWEh3w4O5CJHFouGxqt9JUu3Cq3ia
         iHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792054700; x=1792659500;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xzOVLDhYNiCkQyabQc2njLlkkws8G7Pe3EA53/TYwAE=;
        b=hTNKNAuHzRlufRVKzw18u+gw5z10YlTR+dkQB4Lk7w//+zeE4YHpm1iz2a5m/8igxX
         C+Ckovokecab6AyfZNZWqXtLkWShFp1yZd2DQUfgepqbvapT/Le4QS/z+rT9HibVtVSa
         MtCKBDJNQns2P+PVoXlBGUWEB4PcNQ8plG73t6iuZKSaAHTwrYkGdabmidpK+YCY8OZt
         b7MMAFiEP4ewq70NxJzM04mzXsyQWu8BvPZGoaJQlkz2jxb2l1Sbf3Nv3wet1VZJ57Az
         bLBTYJkHDkTdknnj4eusAcbbsxznZVahrNHe7DaFNJUX3RqhwPu5EJnEhBZRdOsvxFH2
         9eMg==
X-Forwarded-Encrypted: i=1; AKwUvByXpj2VUDAd1Q5ZQOT/3v4L+c/uNNmo46J7TBlOEcrOntUxivhWUUkt4llccu1CGUNo7Omex9cyMwJO5FcH@vger.kernel.org
X-Gm-Message-State: AFq9FYKGRl8DfK5Q6k608/I+kGmrn2ksNxYrG40/LnVXAwLYHtZO5FvG
	MRWGSn6c5O8fGkHpVIvxrSm9NkPgw0+SMYdQkD1wHo/R4P8ieM+c+Rcym2KLjo5NT1sQ6igPJMR
	WHg928tOy/xwgXBRCBcgMbwck6EY42dpq+ON22v8plvBlpugSXEBfv9VDvBFsBb9wXmbh
X-Gm-Gg: AYBFou2JOuScAm+omP6AzOr2tbxFIkUlBehkx0YEyCD3BHCHpIFxy71dj163y5cMh8z
	V/OFzGlfwJMsbt9SPhg1oPm1oxzdXQGSjq1a7Gl4tYXuTTed5KKI+4U88HvFTlQjEkQStyLHlnS
	uQIc/v2oG+XftQqF7azrBCXfk4AjzgwkLAwbmNvRNJHuwwmtRK6MTijMsKGoRId9mRNg2XJJ9qt
	4TgIa7QGqjUK1KHAt+deqgwtwNN5m77mBJJF+7sm2+jkIOpMxXz81QSFxQiqaYsbW3k1dmvot62
	Ikgxoeqe5lEK6pZIX5K7p+aM4XIapstdVQPoTVTq7LIpcnsGYTyX2dMI0Vjq5f1xSSExK32vLzW
	YuokFhJvWmvAdOkNDfy9NYHOR3g==
X-Received: by 2002:a05:620a:7106:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93ebd0c08c4mr2959767385a.4.1792054700173;
        Thu, 15 Oct 2026 01:58:20 -0700 (PDT)
X-Received: by 2002:a05:620a:7106:b0:93e:95ce:53c7 with SMTP id af79cd13be357-93ebd0c08c4mr2959765385a.4.1792054699680;
        Thu, 15 Oct 2026 01:58:19 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a1bd68144fsm40551475e9.4.2026.10.15.01.58.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 01:58:18 -0700 (PDT)
Message-ID: <690b96e2-af53-41ed-aefb-0475f9b48abf@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 09:58:17 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/10] ASoC: soc-core: Add snd_soc_of_xlate_dai_name()
 generic helper
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        Kumar Anurag Singh <kumar.singh@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
References: <20261013-b4-qaif-shikra-audio-v9-0-f3022e28f2fd@oss.qualcomm.com>
 <20261013-b4-qaif-shikra-audio-v9-5-f3022e28f2fd@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20261013-b4-qaif-shikra-audio-v9-5-f3022e28f2fd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX/kINezmalVUy
 ZDVKFOiAoqiYFcnTjqrD/3ealXkMaA+Vi4JZwEYhgxLB3rH19wFL7v94gswlBoGRfW7xsYPbxxl
 4jC8GWa9l+vqB+OZAeWQTV7C9FZFPfA=
X-Authority-Analysis: v=2.4 cv=K9u3jCWI c=1 sm=1 tr=0 ts=6ad095ac cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=sFjlhk_xisyrceGg6AoA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: i1x5uD6jFPEpMRfnhtK-joFTQnZhNOnw
X-Proofpoint-ORIG-GUID: i1x5uD6jFPEpMRfnhtK-joFTQnZhNOnw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzNSBTYWx0ZWRfX6dTeysbhuivx
 BAqzEGVx3LzIv+zjj+o86ewjJ+AWnPbO2l1aNAmQQY5RtwbBv34UWZCLjtrz2/PDvl7Eie/rH3z
 mWRjniZFH080d+G+Tbhm9QsNul57J0r9B763F7DlB8qkLa2NbcuKKHyW27P7yZ+cycrj4tjB8Rd
 7VJoE0VRQ7bUEMnuiG8WZs+2oWfeISVyxP0LYeGAWO9hYBoXPNw38zm8bbAcM4cGNZyeg+cna/r
 2lUt/6EmX9VVzJ+Kqjkb41u2U2UhdjPxuAfK4EyD6cd38CH7t9Y4CQvRNqQ/l79siGxk3eigMNg
 ++3j4Axvml0R3CfMIVtIA92MG58UaZnq7OjCQg5u2cT0qMAiMQTv8FPCyn6LT8MFuvV0jwi5qsm
 jaW7LbpGn6r3yP18Muo5HKeXrT8Wc3ztTeCOuzZAsPOlqK30L4NxqHUWM4nWXxNUHn/klZasmGZ
 G7cO4xsXeRGSrQcFpWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150035

On 10/13/26 6:51 AM, Harendra Gautam wrote:
> Some ASoC CPU DAI drivers need to resolve a sound-dai phandle argument
> to a DAI name by matching the argument against the component's DAI IDs.
> lpass-cpu carries a local implementation of this lookup.
> 
> Add snd_soc_of_xlate_dai_name() to soc-core.c as a generic helper
> that can be assigned directly to the .of_xlate_dai_name component
> driver callback. It iterates the component's DAI list using
> for_each_component_dais() and matches by DAI ID.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---
>  include/sound/soc.h  |  3 +++
>  sound/soc/soc-core.c | 33 +++++++++++++++++++++++++++++++++
>  2 files changed, 36 insertions(+)
> 
> diff --git a/include/sound/soc.h b/include/sound/soc.h
> index 553bb7e2be98..6f15086f7313 100644
> --- a/include/sound/soc.h
> +++ b/include/sound/soc.h
> @@ -1329,6 +1329,9 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
>  			      unsigned int *rx_mask,
>  			      unsigned int *slots,
>  			      unsigned int *slot_width);
> +int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
> +			      const struct of_phandle_args *args,
> +			      const char **dai_name);
>  void snd_soc_of_parse_node_prefix(struct device_node *np,
>  				   struct snd_soc_codec_conf *codec_conf,
>  				   struct device_node *of_node,
> diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
> index 06167a198591..609706733bf1 100644
> --- a/sound/soc/soc-core.c
> +++ b/sound/soc/soc-core.c
> @@ -2906,6 +2906,39 @@ int snd_soc_of_parse_tdm_slot(struct device_node *np,
>  }
>  EXPORT_SYMBOL_GPL(snd_soc_of_parse_tdm_slot);
>  
> +/**
> + * snd_soc_of_xlate_dai_name - Resolve a sound-dai phandle argument to a
> + *                             DAI name by searching the component DAI list.
> + * @component: ASoC component to search.
> + * @args:      Phandle arguments from the sound-dai property; args[0] is the
> + *             DAI ID.
> + * @dai_name:  Output pointer set to the matched DAI name on success.
> + *
> + * Return: 0 on success, -EINVAL if args_count != 1 or no match is found.
> + */
> +int snd_soc_of_xlate_dai_name(struct snd_soc_component *component,
> +			      const struct of_phandle_args *args,
> +			      const char **dai_name)
> +{
> +	struct snd_soc_dai *dai;
> +	int id;
> +
> +	if (args->args_count != 1)
This only works with sound-dai-cells == 1, the api itself does not
reflect that fact nor the kernel doc.


> +		return -EINVAL;
> +
> +	id = args->args[0];
> +
> +	for_each_component_dais(component, dai) {
> +		if (dai->driver->id == id) {
> +			*dai_name = snd_soc_dai_name(dai);
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(snd_soc_of_xlate_dai_name);
> +
>  void snd_soc_dlc_use_cpu_as_platform(struct snd_soc_dai_link_component *platforms,
>  				     struct snd_soc_dai_link_component *cpus)
>  {
> 

