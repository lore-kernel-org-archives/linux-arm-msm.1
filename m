Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8B048BD35
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331782; cv=none; b=bh9UHc7OtApjzSo7vpCHYGuaIxB9WdwA+7pw0mLXx5KJg7UnAOG95q/crPPFJb+OAn8pK3zoWYL+7WLDvE+5W4qYkjOekePoui7FkjPUKJ5cCh/+wPUGiiejrCcZLeCHFgszcrkXml6zcc7X3BsFCvsAwwQyNt0GZdcyBWZJVYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331782; c=relaxed/simple;
	bh=1cmzu38BZTVImyIqdtTjj0k7aNrM8I7PU5Q9+EG6ptI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BwjKuRI45sS7U3uYPZyDfifGMyeayqnSBgi0lQvyHw1uCoIhoW4TSdW95NAJ3G2fy0dHS94KvIs6G4SIjUW+pRlVrjpkB+MqBqaG/j8/lWi/bD0ibUu4o6LlqfMHbNCtClfiCrOzTzv8n6Gd+J+QavPkvdhOmGWsw15qSXxQStI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=agib69Rm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kFGzy4qY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="agib69Rm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kFGzy4qY"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4Yaku208432
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jwu3NcQ+CW5et/xwH4aeftAa2eLuWNrGQO7E6h/ovWc=; b=agib69Rm35i7GJMX
	I9LgZGOPvjRbA7C2UNUs+xYo88+KdFN49okAjALVWC35/WAUsa2bsILGbg+k08uu
	pFk9SKZlyQkT3IxV/bVlCSkiF9vTq+F7IQTaSfzuqfe95/yqJHtLRol1gOHE+3K0
	MHghrg3WQLGV4QrSQW040oRhqnBm+cTc2OVH1+WowaAglni/NIamsuoMWhdne+eK
	oaj8ML0EMKPeKxjQUWAR9nMflfu9aj5bU4amxqaM8BcnuZqyLokRUgtv6K1/B6Np
	fx5mEb6QF2NID41Ph+WMnd+slu+S5SBFzJ9iCorev4B1jkJnMXBZ5Omrdke0GBx9
	IgAc4w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw898u324-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 10:23:00 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-331b2ec616fso2814565eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 03:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790331780; x=1790936580; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jwu3NcQ+CW5et/xwH4aeftAa2eLuWNrGQO7E6h/ovWc=;
        b=kFGzy4qYQXIjePAZdS6uB1VM1tf3fwt8TE9CKHPIelsUXLThFb+z7cb0g3UH6JGkM1
         I1anGvpEGDCzBq6DFCBHzZLD8U2MTw8E5aL7riOp6cLE1YzKmz+aQHN3qW2zHs6BH/HW
         8mhYMbG2ge3+i3n/DJ/OcElZXR98/u6fR2EvJ7LxflykyZ/ce24V90L50LIFL8SehraP
         xqhJOiCyPjtiYIgP7X+3g0bU1RM4EOZWnb9+q6RoKM4OwdGAJ+uWOwycQtJd7W+tZW6Q
         BRGjm1LrfoPASs5zkmnJqbA/+CORlCW2XFs5s1QqljFj61fOVPVQcepZFvapjIizRf9t
         Cu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790331780; x=1790936580;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jwu3NcQ+CW5et/xwH4aeftAa2eLuWNrGQO7E6h/ovWc=;
        b=VmTn0KLDYlX+fBu3HVQXinkcQSijwOrWpcQSizB1M8AYuBQji3DzX1wqVu/2gpO8h6
         QyDTKCMmRIgFHuwyteV/6hpIvHujB2DAErdYVXJ+pqe+ymUsgMunNXiAiS+w3200ZvxK
         HW8sT9droa8OcAzaEBi7mmHNOei31358zothpAWvNVMYVpoUhRPZ8QrpXBgL6Wqo0swn
         T07pXkMMRZRPBElQBQGwkmV42hOvNe/Ph84J42kh3Sgday8EG3SMbR0lzN7gwIupNN+K
         Zt4SMdN3xL7hTyErlUkyR2kNV6MJ0IWKLkWsU8AKIqgfh/6ppqOHgnLaNoep/AnJXufW
         HJ3g==
X-Forwarded-Encrypted: i=1; AKwUvBzv4tB+ncY+5dXRVoA7/zFDql4MkRQfwmYM+k0Q1j/+pxYuc5W2V4FchGqgmYpkVlUJutLXH0qpLnBaqQDF@vger.kernel.org
X-Gm-Message-State: AFuF++mt8nY3JvPOyLrVTZ1biH+GwQQgWQteOOUWdJBlhVQ4+a5C7urI
	Cml9pr7DzC/pJEdfb0sFY4IgwAlGreb3UOs82NWkdqh2TpzUZNq5ihiATnj+rN6ATcQe8E9GrRq
	Nm4rinC30xNPr8NQjWP0UilSVGRfC8//FpPFPPs8zgUl/K2HeCRHoHLZDYhTKNd7wUue/
X-Gm-Gg: AYBFou1FvE5FPhow9pBYdkKKtXno+XnHI/hC6MqGor9wzXNFltEzU8sFBAI3QFqye0d
	GVoVI2AUNOrMjCGty7JdG85Qb3Ai5jvuBr8yTooPBa+668RTBzwfNCgLNC9XNa8iot28O2RY6sL
	Yi5eYYdRUqEzDJ91tqCSmfrg+jkqWgTx/63I7procz5vVCWDCCteisggDVyb+KgFDw4zDCu0UHQ
	VR0UUs7tvA4QXhYLUv+pQTJHcnQjq0DledIMHgK8XzH9tU+5iPyWarJVJZ5UVKdAKBSVLiCvOC8
	mnwGhZptGwTQlcm4Z7rseWP3+xZd1depowpCcwGunzKHDEW6soZpjoo+tyWr7tXCd7G/Ncu65c5
	QbtJvbJZ0QcoPZzoyQjqTaJ8mqdpB
X-Received: by 2002:a05:693c:829b:10b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-3400439b178mr5535506eec.40.1790331780087;
        Fri, 25 Sep 2026 03:23:00 -0700 (PDT)
X-Received: by 2002:a05:693c:829b:10b0:33b:e21e:4a3a with SMTP id 5a478bee46e88-3400439b178mr5535274eec.40.1790331774685;
        Fri, 25 Sep 2026 03:22:54 -0700 (PDT)
Received: from [192.168.1.25] ([122.183.173.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3413fc2413dsm5474040eec.0.2026.09.25.03.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 03:22:54 -0700 (PDT)
Message-ID: <2c37b9fa-9810-482d-8ca3-67072a0f9072@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 15:52:45 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/8] ASoC: qcom: lpass-tx-macro: Add support for Bolero
 v4.0
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>,
        Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>,
        ajay.nandam@oss.qualcomm.com
References: <20260922-add_shikra_support-v1-0-6c6cb6444caf@oss.qualcomm.com>
 <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260922-add_shikra_support-v1-7-6c6cb6444caf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX5AjQPQV3ixz+
 UO+tKMohfmnimJGS7vnrN0JSHxWdh9n/ei5alJ+ep1H163za6DNiU2d0uxqRQvKwHCOJAqvfrji
 h2CgKoB+NpuaXSxgPGD9JBcsP5LjaMJ47gWZxS2gnQoFGm/tnbRl5ON1VPzYK4O2FuVgpX87zrD
 E/lNBT7nZtpHmykK4YiSgpwgaVS7/dOqvYe3zGWcS+YnwgGaep9Dqj9RgQ8yeoYdgCkiMvXsMGR
 QV4gIf6R8WheBBAghBbuSDfQ0wkgyU8+/D/AaCqWPkwweckUsZc7RCLZKH3WTdJWcaxk46P9u/v
 20IZj29m53FUqWEFY/TgHGy2ZaT1M7ZWgSln4RfOgC1yq6Yl2bdv5Qszg0tRCqvSMywJIghSQ8w
 j1GzUWS63uritdC1wV6STqdF5IqxARf7pSmfwimP2mBuM5dftK0vTmRBEr9pmGzUAmJJ8hTLGEO
 oLp9+cy/YEnFxzO52gQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDA0MSBTYWx0ZWRfX+QIpirkTbDdv
 XGp9z1d5Vsc7XFWApXFQo9z0ZeuaCOuyNfM8Ue5DfanWMsKymrjpxKEdsa63oL3wIzON00eCJJ0
 sW+JwQZS89JIo55uyC5ZZP3i0k59Ruc=
X-Proofpoint-GUID: LuF8NdY7tW9RJQ8-_T_JgATvTJicCqJo
X-Proofpoint-ORIG-GUID: LuF8NdY7tW9RJQ8-_T_JgATvTJicCqJo
X-Authority-Analysis: v=2.4 cv=EJWTQFZC c=1 sm=1 tr=0 ts=6ab64b84 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=uk8ae9/F1LYL5lfeGCaUoA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=NHDDfAIwdS3HBU7MvnUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609250041



On 9/22/2026 3:12 PM, Mohammad Rafi Shaik wrote:
> From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> 
> Hawi integrates the Bolero v4.0 TX macro, which extends the v9.x TX
> macro with a port-select stage in the SWR microphone input path and an
> adaptive filter (ADPT) block.
> 
> Add the additional CFG2 mux registers and per-path CFG2 registers to the
> register map, extend the maximum register offset to cover the new ADPT
> control register, and describe the new v4.0 decimator, SWR microphone,
> WSA and port-select mux widgets and their routes.
> 
> The ADPT block has to be disabled before a decimator is enabled. This
> register only exists on v4.0, so gate the write on a has_adpt flag set
> from the match data rather than issuing it unconditionally.
> 
> Add the "qcom,hawi-lpass-tx-macro" compatible and its match data to
> select the new widgets and routes.
> 
> Co-developed-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   sound/soc/codecs/lpass-macro-common.h |   1 +
>   sound/soc/codecs/lpass-tx-macro.c     | 442 +++++++++++++++++++++++++++++++++-
>   2 files changed, 442 insertions(+), 1 deletion(-)
> 
> diff --git a/sound/soc/codecs/lpass-macro-common.h b/sound/soc/codecs/lpass-macro-common.h
> index b52665b11e35..707b22a6bda6 100644
> --- a/sound/soc/codecs/lpass-macro-common.h
> +++ b/sound/soc/codecs/lpass-macro-common.h
> @@ -16,6 +16,7 @@ enum lpass_version {
>   	LPASS_VER_9_2_0,
>   	LPASS_VER_10_0_0,
>   	LPASS_VER_11_0_0,
> +	LPASS_VER_15_0_0,
>   };
>   
>   enum lpass_codec_version {
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index 6deaaabe43af..b1eee16e968c 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -67,6 +67,14 @@
>   #define CDC_TX_INP_MUX_ADC_MUX6_CFG1	(0x0134)
>   #define CDC_TX_INP_MUX_ADC_MUX7_CFG0	(0x0138)
>   #define CDC_TX_INP_MUX_ADC_MUX7_CFG1	(0x013C)
> +#define CDC_TX_INP_MUX_ADC_MUX0_CFG2	(0x0140)
> +#define CDC_TX_INP_MUX_ADC_MUX1_CFG2	(0x0144)
> +#define CDC_TX_INP_MUX_ADC_MUX2_CFG2	(0x0148)
> +#define CDC_TX_INP_MUX_ADC_MUX3_CFG2	(0x014C)
> +#define CDC_TX_INP_MUX_ADC_MUX4_CFG2	(0x0150)
> +#define CDC_TX_INP_MUX_ADC_MUX5_CFG2	(0x0154)
> +#define CDC_TX_INP_MUX_ADC_MUX6_CFG2	(0x0158)
> +#define CDC_TX_INP_MUX_ADC_MUX7_CFG2	(0x015C)
>   #define CDC_TX_ANC0_CLK_RESET_CTL	(0x0200)
>   #define CDC_TX_ANC0_MODE_1_CTL		(0x0204)
>   #define CDC_TX_ANC0_MODE_2_CTL		(0x0208)
> @@ -108,6 +116,16 @@
>   #define CDC_TX0_TX_PATH_SEC5		(0x0424)
>   #define CDC_TX0_TX_PATH_SEC6		(0x0428)
>   #define CDC_TX0_TX_PATH_SEC7		(0x042C)
> +#define CDC_TX0_TX_PATH_CFG2		(0x0430)
> +#define CDC_TX1_TX_PATH_CFG2		(0x04B0)
> +#define CDC_TX2_TX_PATH_CFG2		(0x0530)
> +#define CDC_TX3_TX_PATH_CFG2		(0x05B0)
> +#define CDC_TX4_TX_PATH_CFG2		(0x0630)
> +#define CDC_TX5_TX_PATH_CFG2		(0x06B0)
> +#define CDC_TX6_TX_PATH_CFG2		(0x0730)
> +#define CDC_TX7_TX_PATH_CFG2		(0x07B0)
> +#define CDC_ADPT0_ADPT_CTRL		(0x0800)
> +
>   #define CDC_TX0_MBHC_CTL_EN_MASK	BIT(6)
>   #define CDC_TX1_TX_PATH_CTL		(0x0480)
>   #define CDC_TX1_TX_PATH_CFG0		(0x0484)
> @@ -186,7 +204,7 @@
>   #define CDC_TX7_TX_PATH_SEC4		(0x07A0)
>   #define CDC_TX7_TX_PATH_SEC5		(0x07A4)
>   #define CDC_TX7_TX_PATH_SEC6		(0x07A8)
> -#define TX_MAX_OFFSET			(0x07A8)
> +#define TX_MAX_OFFSET			(CDC_ADPT0_ADPT_CTRL)
>   

These registers look v4.0-specific from the commit message, but 
TX_MAX_OFFSET, tx_defaults[] and tx_is_rw_register() are updated in the 
shared regmap configuration used by all TX macro variants.

The explicit CDC_ADPT0_ADPT_CTRL write is gated with has_adpt, but 
regcache_sync() can still sync the new default registers on older 
non-v4.0 hardware because the regmap config/default table is shared.

Should this use a v4.0-specific regmap_config/default table, similar to 
the VA macro, or are the CFG2/ADPT registers guaranteed to be 
harmless/present on all TX macro variants?

>   #define TX_MACRO_RATES (SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |\
