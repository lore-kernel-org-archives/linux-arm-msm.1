Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C602836C0D6
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245980; cv=none; b=A39oZJl83WfAegVf9aHKwImcBaYDaidW9Q/X/Aea5KVdoMSbfayieRS15hU1DesGSP8+sdIfzq/PJfbbooQvCzULEShWMposs8PS/6ONB6lHPXk7XNa/LHGhHuwu0dx2DOXkdphVbHHSo4x1LtOP5A/ERM9VCkAV7gvgk6kJe+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245980; c=relaxed/simple;
	bh=7zwTmehAKssK3FDdkKixE6p0T3SMJhlXr4OxhLaCzT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LjMeG20A0AmAU2V/mxuv7Rd44hCaC6CVCn1sMAiufQEsDqCq7tpGadodSVb3tMZ3nGwYxAZQTd8QAQk4v2UtuL90UF3R925PLfoSHWmqqD/3nRpKNOLAsoypSDBLPKIjPVPVo5boDvGg7/JMk1yn3hxCpdnWQ1M2P6izettOjSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VkxisI+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VNzXJFl4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VkxisI+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VNzXJFl4"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68O9PAOX1923777
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:32:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WXg6dqUWJExGXR8prNtrYiyQGTXd5oj5ngmptCv+11A=; b=VkxisI+YzShJEnnF
	ow4m60Uh0zvZE6FuBB2KnVj8dhkhItWm8D/XxGnFt4cP5lf+AEC8TK9lvb+Dyl2g
	+l52UE32hRvbXffzjrqK9Ey/zhHrhrKyKjdLLrz7XLRGmNhUpDnjFfNSf0uOkJOt
	rpLfFyEnBWwL0zg7fGLm9ArHD5bQWxzrtHXiC8OXXXKVmTLFsYhyapnvGgY9tri9
	fNcgiZGNfWNcPijpzVdfxa/nzNdvUclw+wlqXwn+C2hqTkpg6C3ieFTxtViEnbxA
	L7VeO1WKgkF86wc8BguxbsqUux7jGMWOK6IbnRexRMjOkqbhshvPC7ghVRFWnXlR
	sJHnfg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvx8ah4n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 10:32:57 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1438492fb40so2974914c88.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Sep 2026 03:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790245977; x=1790850777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXg6dqUWJExGXR8prNtrYiyQGTXd5oj5ngmptCv+11A=;
        b=VNzXJFl4SdX9cH80sEqorvFG38lRdwljEj9FPuvY/2diCpkSi6yD/inRwpDRxUAdRN
         VEzWw1b588VtwKPgXOOd9vutJveN9VGCQ66tzeJtJ4gfNZwkqSq5x3ztuI9veksj9k3D
         qQUyVu/ufBa94yOkyfV8DzRpB8vVvjYMhyMroeQ78zHm7Jod4Myku+D4FB8MeZfbjcia
         DpbYXWfOc40P81XYjl0V3coxAfYSZcL0t3eYl8KZ7EFVyEQyEkBBSPxieglYiS0ZjLbQ
         2Oq0e6FzNkHdyECtg2bTi3bwXMwlyBvg49/7yuXxGNV+tClAfZHm39hKtl9C1bjHlVpK
         IBMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790245977; x=1790850777;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WXg6dqUWJExGXR8prNtrYiyQGTXd5oj5ngmptCv+11A=;
        b=XOLvFxOZucYfd28kd0zkbsOAGuxORsSqvH8RRtIGRrqQFCRLZ2MANJhIu3cmcDHIcL
         Hf+3LJPBi1tEGsj5z1rMD5dHzUtugCDhd+xdP5FhlrLT/DfauWhNeP3xBKV8QVrTPWIi
         ve2e8ztUDtjSwxcJWH+U/O5eUk19HGcQb9j04qcaiA/PoCmlfPsBtDbz8Muu8uVmQg3n
         Dpuw8xlu8CV/YuZpFQIO67i0+YsG3RTGrl0Unk+YNigD3fCs/sT2T2Hcux8QiNCv+2lJ
         sZX7IKqmzgGfg9c5vdXkM8F5Hni6LD9Iu8tYY4FgUWsOLRhNnTRzlRoBPYsMomW94RhQ
         0Obw==
X-Forwarded-Encrypted: i=1; AKwUvBwQgPWEh7Vu0E6IiJIq2s7W57CXAMTaJ51eo59cvJN3rmalCGibOEPkpI6140kKmY1Q52ChYNjg+0rRi0yu@vger.kernel.org
X-Gm-Message-State: AFuF++nhz2ucm0+DMQXLmZ9wDEMUXZv6+efy6twwMRmXVJdbWe8IT+oe
	IF14BAojlEMJuzg2v9zJG6JL4QblX6CXefKQm1S5oW0fn1PCth2HAgx4b43q6MZW5AbHYF8Q6QA
	8h+PhktywAhn4I7xtjXksv9OnvULmVlQarzD8uXP6HjbFwDhHlcj21EIXAd2Si4DO0xWD
X-Gm-Gg: AYBFou3slBkYGAmw3zM3GfPqRmHR/s68xGADMXDSfsq7CfTNKR2JI563ewGzPpHPFO1
	5ysaAT9p/V40TU9cs58MeXQcNo6Goh1Dwhf3ttJjf1FYXjoITJnA8jPTzqLrXP12jVlsDy5tG3a
	dtDsRMOcgSRZW6+rWHqBQAdXfRuE+JQRiqGkfVIzx5p3Rkzx/kHeK1ubvNbWnJtZp/HqLaAQ3lZ
	hhYkrWzMQzUu6sLIHD7BMYmvYej2TWEbxeO/Z01rxyd6YY706P7VZR3hRtz+j0Pfn7ZukMw0a6Y
	MP/VkD6uFs7V6H/PLNDoCI9Gmb++zxxNa4AsUGRLFOXvhvBM7vJuoiZ8sGfNTaJ9O68R97IU8iE
	QtDozmlmy2YYysyoJCkifk6Bqu7c=
X-Received: by 2002:a05:7022:e80d:b0:143:2719:566d with SMTP id a92af1059eb24-145040d4075mr1964991c88.41.1790245976842;
        Thu, 24 Sep 2026 03:32:56 -0700 (PDT)
X-Received: by 2002:a05:7022:e80d:b0:143:2719:566d with SMTP id a92af1059eb24-145040d4075mr1964960c88.41.1790245976229;
        Thu, 24 Sep 2026 03:32:56 -0700 (PDT)
Received: from [10.218.18.193] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f9877462sm12068303c88.10.2026.09.24.03.32.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Sep 2026 03:32:55 -0700 (PDT)
Message-ID: <3752b72e-82a7-4fc2-be1b-5a5954062bee@oss.qualcomm.com>
Date: Thu, 24 Sep 2026 16:02:40 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 06/10] ASoC: qcom: Switch lpass-cpu and qaif-cpu to
 snd_soc_of_xlate_dai_name()
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
References: <20260923-b4-qaif-shikra-audio-v7-0-d5b6f056568e@oss.qualcomm.com>
 <20260923-b4-qaif-shikra-audio-v7-6-d5b6f056568e@oss.qualcomm.com>
Content-Language: en-US
From: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
In-Reply-To: <20260923-b4-qaif-shikra-audio-v7-6-d5b6f056568e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI0MDA0MyBTYWx0ZWRfX29P2l2PNfsGQ
 2px99T+Hf/pfqoESwu0QIH2aPOIwXWe4xlU3hiwVd9P45l1gGWP/DDD6A+iHK5XYoSMlQXcz8Fu
 eq/ShSudVOE/wHvn89FBgOgnnw8q7EA=
X-Proofpoint-ORIG-GUID: kkxhiDhiC8WLlPjJ95vgP7TkdNdnNu30
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI0MDA0MyBTYWx0ZWRfXzZuoL+hRcW2i
 K1Gpe+7xn1jQnoTZGG1Sya1iYjkGBykTAs4eZb8LI/B8mYMhxtxN2itZSMhT6qq04/N137RQHMT
 CFO7xUsFs3nqMpUmt9pZ3lhafzNrnzF6eR13Jj42cTfjgNE0M3fpJbVMtO8p8gWgPJ7lIx5QLzO
 NjeGhUqYyhkPpEH0ZtEr5oOJwL0wPBbCeKBhRMnloi1Ma3vCmSF35Tg4vkSVyfA/8mmNMu+ie8K
 rJtwy4tjP7U4kDJ7QsNFpx1JNvBmMVe7QLurVU58OTzhmkIcXj0ZqOdSxtHUSaQb8Q7hjHhaem7
 fkuqbcgRuw/E3qxSqFi1vDbI6Zt5nBkt5+UkIVlthxxLsdPoFPlStPLGSu+kv/Z4dc4SIBD0r4A
 IQ3aW3727hnEX74R+y02y0VqPUWSBQ9/wh1YaUXBzJ6ttKnYfXq39eBkER/4kSbkC5mBek/oHqC
 mETvcwo4IIt/XHVBJ+w==
X-Authority-Analysis: v=2.4 cv=a6SlZkSF c=1 sm=1 tr=0 ts=6ab4fc59 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=kcWvErFG8IZCALGPlGoA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: kkxhiDhiC8WLlPjJ95vgP7TkdNdnNu30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-24_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609240043



On 9/23/2026 12:18 PM, Harendra Gautam wrote:
> Use the new generic snd_soc_of_xlate_dai_name() helper in lpass-cpu.c
> and qaif-cpu.c, and remove the local lpass implementation.
> 
> Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
> ---

LGTM

Reviewed-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>

>   sound/soc/qcom/lpass-cpu.c | 23 +----------------------
>   sound/soc/qcom/qaif-cpu.c  |  1 +
>   2 files changed, 2 insertions(+), 22 deletions(-)
> 
> diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
> index 242bc16da36d..61efa45376cd 100644
> --- a/sound/soc/qcom/lpass-cpu.c
> +++ b/sound/soc/qcom/lpass-cpu.c
> @@ -458,30 +458,9 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops2 = {
>   };
>   EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops2);
>   
> -static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
> -				   const struct of_phandle_args *args,
> -				   const char **dai_name)
> -{
> -	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
> -	const struct lpass_variant *variant = drvdata->variant;
> -	int id = args->args[0];
> -	int ret = -EINVAL;
> -	int i;
> -
> -	for (i = 0; i  < variant->num_dai; i++) {
> -		if (variant->dai_driver[i].id == id) {
> -			*dai_name = variant->dai_driver[i].name;
> -			ret = 0;
> -			break;
> -		}
> -	}
> -
> -	return ret;
> -}
> -
>   static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
>   	.name = "lpass-cpu",
> -	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
> +	.of_xlate_dai_name = snd_soc_of_xlate_dai_name,
>   	.legacy_dai_naming = 1,
>   };
>   
> diff --git a/sound/soc/qcom/qaif-cpu.c b/sound/soc/qcom/qaif-cpu.c
> index e1868dc95cf4..c096ef5133bb 100644
> --- a/sound/soc/qcom/qaif-cpu.c
> +++ b/sound/soc/qcom/qaif-cpu.c
> @@ -594,6 +594,7 @@ EXPORT_SYMBOL_GPL(asoc_qcom_qaif_aif_cpu_dai_ops);
>   
>   static const struct snd_soc_component_driver qaif_cpu_comp_driver = {
>   	.name = "qaif-cpu",
> +	.of_xlate_dai_name = snd_soc_of_xlate_dai_name,
>   };
>   
>   static const struct regmap_config audio_qaif_regmap_config = {
> 

