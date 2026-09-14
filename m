Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F04446E1
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789386115; cv=none; b=cVBGXWPjjl2JzLgWVbaY9moXgJUOiTMCW1fL9clusaYE11QRZz+xOGGS28TzXpzrb6tOZYTARo5D6unN5x3nhcfPfVcPp6LxoKAdTTV0QvSl29FN48tckLoIfm1FY0JTfP4xGsCpmn/aHK66cuTqcgpCe3+qvzDKpzBd8RrSzWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789386115; c=relaxed/simple;
	bh=fJK3LG1t3WCTDNicjclS7oxSu1jmD+A04ytN7DJcTPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vE7K+eXXiwtPaVZpKLhODiV88UbhADlKuhmaAKIt4t5L4h//wjZ2b0b3nPl/RRN70aLIkzb74eEphb+1bgIfyFE4o0f+IFWDeqcjb2A1JbvIXFnCZ22qMGnKfQ9XLnf6qfU03yZELhgP+QDNqSrek1QVmuVA5lklKdAYje4o1Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OWj8XHq9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d+tOsb1g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OWj8XHq9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d+tOsb1g"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68EAlwNi3860379
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:41:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Q9yvh3UV8onzYbSNebfzLntMGp4qNHqagnT/EH78fvg=; b=OWj8XHq9yMc1ofTa
	4LSOEdXY4fMbOQ8PcYb5nrR1N4Uu9A8rbJN8tXlzf74WZpK/7xId/Mjmo3yAWum/
	weliRFKYb4b7Hm2OVRZz2WVfMzKg+pQVoPU+oAuq8UOHie6d6jN+ewT13BB6Dosx
	UfBIkCAvWRFFbeZzevGWusOPD8P1t1ZUNZnnhLE8lFTXqAOXhyLY4JH+9nkRgaJ/
	OG3l6xXz+FyHwl/J7pDEItZBG9MDRlzE5taEXwGmJVKR+7G1dmUxEkd1dq0yd9dE
	FCdbVZ8oZWW4HTFNFvdLsZdfm3QJu7qD6rNBVFXFPqZ3NKe33pF5u+OWlygCt2jL
	sflp+A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0te5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 11:41:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-934963b2bc0so661864085a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 04:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789386111; x=1789990911; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q9yvh3UV8onzYbSNebfzLntMGp4qNHqagnT/EH78fvg=;
        b=d+tOsb1gdF/Iktt96WL68bM4UbnfxnQh2VNeKme/EYY+tq+Mr4a5Dds2Vez1ZLbmzJ
         8s/Kdrk+xJvSEYcSs80NifqRlTmcm/toK7uqsENAsg5LJFtq8ZZxuWeXEiPHQD8tonO1
         TpvmwfjlDtU3/H+jpoXnKUd2VbwG/2QSg0m7KCFvQJB7tbKCPjPNYWo6fdvi9owo/DrY
         ZmpxDJhpngvtWO/nbBqYIWi5+FWUPAMh2tMJjuFDAKCyDq1LLDth5dQUt0yO6jwUUTNC
         MdgS+T9vNR9K1SQ9XMDAi5FvsatAfELtJNOMEUebhPF+4BhVnyN2LbZzjCWyKJv7HbXf
         idvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789386111; x=1789990911;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q9yvh3UV8onzYbSNebfzLntMGp4qNHqagnT/EH78fvg=;
        b=kDXuGkbuYSFLvS6QHNnr+07vqsM8ENKOLEW2eteO0v1PMMVr7hLUuCJdWLBx5p0Z+a
         ySR2k1ImyhJHaQAotAY75mw6l3cv5KS11XnkSg1r1s6zrHkmGbpVuCOZ9bpOzAMQeRZi
         u36LuutE1nIGvs/P8+BvkI/ew3Q0AeuAX/rdJQwTMqxOWvkP8wQKdPmZtwHHRg9u7mD9
         uVWgQ3mxVHHDA/xlkwFADNR5sxmuYE0gC/vfd7pTpNWvKh4nGqwl6S3o2duoWLk3dM3b
         Q16P+TXQ6eshfGpuYfwAeyOygzf3zYef1NTx0DZ7htuvK55uWy37lpHLwZmPHB9AtZwZ
         lelw==
X-Forwarded-Encrypted: i=1; AKwUvBya2mm3HM693Q45Vjb6QzwNN8yylPetjVjPRhr/29prI0QQdOn/BPGVI4H6G0BywvTYFlQb6rBL+tXJnkb4@vger.kernel.org
X-Gm-Message-State: AFuF++lkjUY6iA68x6QSk0/kxQr/8ptiPKPeMr3y6yOFU4oBKDry72T7
	27cuylMCDmWEc0jTOaLM1hoCcviMft2ARgGrRUPSC6KJ3NLNgMDACMcd+78knJWIJLmBfkUyll3
	d+cFDpkjPyZZvgDWEJOPpyMyKQuDVYv7K7zS9HjWePCHhmaysKdsZDApEp11UBzG3HFYF
X-Gm-Gg: AYBFou0AconKfqLKEsRDLm689WeBhHP84aBKAi2TX1Bn56+GKdbuvW0CmqEwkOtskL4
	WZf17549jD44Ecu/Y1d2ErJsyQBnaQO5a7/8BQqHno+a9YgEdRreR/lZbbtsi8IwR3z8lBFyi5M
	zl5iLJyvrKhmb2SokCOzNosc5kxMS7Rmx+B16a5nBKl4kibjQwg9dhFMtkQYZT/aoTiVa6cxwmL
	jegVtEMWnLc0DGEFd4LvGeEUe/7+UmR302vmqa36lBTY1cknHdnHi9rjKYJKIP3mn6opvSQvkhi
	ojjQzRZ11/pRfkxNxkE2ysNwhU9As3TvJ6H8XnIo1KyHAuuwiJafeGsWmYZ+RG5ZkYae8KL+hzc
	mQNJhOKmXIviHJP4T21lYgEV40kc=
X-Received: by 2002:a05:620a:90d0:10b0:93a:2d2b:a5ed with SMTP id af79cd13be357-93a2d2bb71dmr152229485a.47.1789386111566;
        Mon, 14 Sep 2026 04:41:51 -0700 (PDT)
X-Received: by 2002:a05:620a:90d0:10b0:93a:2d2b:a5ed with SMTP id af79cd13be357-93a2d2bb71dmr152226985a.47.1789386111133;
        Mon, 14 Sep 2026 04:41:51 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm662678745e9.6.2026.09.14.04.41.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 04:41:50 -0700 (PDT)
Message-ID: <16850fda-e68f-4ef4-bdd5-9ad77ac51195@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 12:41:49 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260910-add_shikra_support-v2-0-fdd2129c696c@oss.qualcomm.com>
 <20260910-add_shikra_support-v2-4-fdd2129c696c@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260910-add_shikra_support-v2-4-fdd2129c696c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: rfBJ8SETVDtZeR7xBt28PuW7qU638Lzx
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfXyyhs9e7r64eA
 gOkMk75Y1o1oLGrXR7xNJI+1NjTUOnqBxiNzaJhdIX/4jDQAcGZgnL28o/tkZyI9BJSz1kEuVu5
 o3Ius7nzy1D4p9wXrvaP9GI0REWlNts=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE2NiBTYWx0ZWRfX1K5L7JD/x6Qn
 9/z3TvXIbQj63wkS9HSn3CPEQjkueFc6Xc3r8z6QGdWJlwfhm0GbcqVJtxLm5/xxK1cTGWsXQ1F
 PPoo5PZlz/URd1Rck7yK5zhbMdY0Ps5WFgy6rZhLuu3s1l7nsP6uKSo1v2HNdO0j0IAaqA74Cn0
 6GJenPWBKMuMyPUbP4rZWc8Pu1SDWceb6eBOfvyYGUMZrWNTaKLvVwb2dmZBwPAiMgEW2jNcWKZ
 ibnOi9VI2NzcE1NjYaiktlxK+BQP0oBjAc2zwnP6aYrnjf79ChqzPJg5pEGQEkrba3L4MY+iMj4
 m5FCAaga2Ng24Plf02EFnvVw0+bHxQiJ0WVzuVdGxwYbfoBRU4Ffw5C5OPWzwlyLYRFmF9CVsAK
 xyf3oQgIeiX/P8QDJ8zPOO3W2B6v6hnIJFEDX/nXs2rX4mnGp6tuvT8XsS44spad2rJFShi4FmC
 Bje3fRMO9nqCA+QoQmQ==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7dd80 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=licpy54JkTNpb-QbogMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: rfBJ8SETVDtZeR7xBt28PuW7qU638Lzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140166

On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
> Add shikra RX macro compatible data and hook it into the existing
> LPASS codec v4.1 flow.
> 
> The RX macro register layout of LPASS codec v4.1 matches the v2.5+
> layout, so reuse the existing v2.5 register access helpers, controls
> and widgets for it.
> 
> v4.1 additionally requires the FS counter to be bypassed before it is
> enabled during MCLK enable. This is a property of the codec version and
> not of the board, so key it off the version detected by the VA macro
> rather than off match data.
> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>  sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
> index 2e74ec1a5..83372123c 100644
> --- a/sound/soc/codecs/lpass-rx-macro.c
> +++ b/sound/soc/codecs/lpass-rx-macro.c
> @@ -60,6 +60,7 @@
>  #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
>  #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
>  #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
> +#define CDC_RX_FS_CNT_BYPASS		BIT(7)
>  #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
>  #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
>  #define CDC_RX_SWR_RESET_MASK		BIT(1)
> @@ -1613,6 +1614,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>  	case LPASS_CODEC_VERSION_2_6:
>  	case LPASS_CODEC_VERSION_2_7:
>  	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>  		return rx_2_5_is_rw_register(dev, reg);
>  	default:
>  		break;
> @@ -2045,6 +2047,16 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
>  					   CDC_RX_CLK_MCLK2_ENABLE);
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
> +
> +			/*
> +			 * From LPASS codec v4.1 onwards the FS counter has to be
> +			 * bypassed before it is enabled, otherwise the fsgen
> +			 * output does not come up.
> +			 */
> +			if (rx->codec_version >= LPASS_CODEC_VERSION_4_1)
this pattern match is fragile,

> +				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
> +						CDC_RX_FS_CNT_BYPASS);

Please use this as a flag.
> +
>  			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>  					   CDC_RX_FS_MCLK_CNT_EN_MASK,
>  					   CDC_RX_FS_MCLK_CNT_ENABLE);
> @@ -3652,6 +3664,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>  	case LPASS_CODEC_VERSION_2_6:
>  	case LPASS_CODEC_VERSION_2_7:
>  	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>  		controls = rx_macro_2_5_snd_controls;
>  		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
>  		widgets = rx_macro_2_5_dapm_widgets;
> @@ -3837,6 +3850,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>  	case LPASS_CODEC_VERSION_2_6:
>  	case LPASS_CODEC_VERSION_2_7:
>  	case LPASS_CODEC_VERSION_2_8:
> +	case LPASS_CODEC_VERSION_4_1:
>  		rx->rxn_reg_stride = 0xc0;
>  		rx->rxn_reg_stride2 = 0x0;
>  		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
> @@ -3949,6 +3963,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
>  	}, {
>  		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>  		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
> +	}, {
> +		.compatible = "qcom,shikra-lpass-rx-macro",
> +		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>  	},
>  	{ }
>  };
> 

