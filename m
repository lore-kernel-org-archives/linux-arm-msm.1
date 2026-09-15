Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BBD436342
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476647; cv=none; b=ULdi7S2LZZxoVIyUj3blpsrziZ2uHjQCXCF8vpDXfSWohOzTs5RPzzlVZvVhwzEMUq5SVlJkdkPhPk5RJo6/XlBRJOJ45EZb8GIHFckDoJr5S7PP7Jbuue+FvonLPYr/30msT+hRsIbzfiXcx5ucgXzcBfNT+jhrlivZGolJs9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476647; c=relaxed/simple;
	bh=xbo00gOxGqqAUQxgPGO9vMIMMUz7Osk333IDwlJ3L5s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FCrP0unsBtcWvV5vQc5TWwaCr+w138bneyIDiw9/s1YNP2Bu/qIXaXCFQBNTxKIGpj0nuLzrqDnJQPGLGAAmDEtMsls24SkJkj34SjPJu/SVybkrYSYSeF4erZglDKoNk4P3OPFVc6PA4jU1kQVEbpH+N3BnC16kmrOa/sm1uGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2az10Eq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mr6hC3iG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2az10Eq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mr6hC3iG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9h4983317453
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hn033UI+u93eN0s7E1KhlfLlzklk26Hwma/EHj+HEo4=; b=j2az10EqKZ5WcnpB
	wDaRkjpswh0LAAluJxB1tx47NCs1JYEMLI/+pPW/1sAMBYeyBCLMlKZ8C8eWNBa9
	5LfF7gkn+tAvfK2BcbB0iPxRgh5sYj+KeZmG1hONqnWIlnvZWHA72S9wdcxhrE0S
	upjuNV9zKpJrrgsduCRVLva4th7Hz7Qq/9oP7R66POAYnzxEUoKiKqxoxhXbOWOB
	g2KiUZbP4DyFnyI0SXVc9FXPJXIu2uMNsREyjXRbrwpFEu7GKsYWpiFzlyc6SUyR
	2btgnkMoGHufkLfMJdAjOTlyKZwqJiTKppntM7/4fn1IaCqSdFmCMny0HbT2bqlE
	lr0v7g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq38e0v6b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 12:50:45 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ff59f2c47so21235211cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Sep 2026 05:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789476644; x=1790081444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hn033UI+u93eN0s7E1KhlfLlzklk26Hwma/EHj+HEo4=;
        b=Mr6hC3iGjleaLV5fvTnGbp25jLKV0QFiDNs1W676r2c5u9LajwoMRUP957Q/o/KiKi
         mOlnJJsNbgRTpqGGybNBeyDVWlLDTHUrlX+H5APcC+XlJtX60PQgHZ7I8Lk8B+ZL4/xs
         +0axuxDrUS6nz9BTAJNdogug+N/xaVqBAp0VfKcTb6+jBYEHedswj+VyI/65IKADTZAn
         /XbaF92u6IxiRlfGQ+Hws/kXBkE0QlmVFanpsNE45YDvCisEGsAQ6VOSB+XCVBd1KQk/
         Y2FCg0kOyJ7s9xWy5UA9eDX6EiEE/vxabb1ASFDBmzSE33Po+/hS/kolNeQSJ/cYzl8l
         GiXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476644; x=1790081444;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hn033UI+u93eN0s7E1KhlfLlzklk26Hwma/EHj+HEo4=;
        b=xljH/gQcklnM/xkSghVaEA66lGY1uG88t7sPSxMd2MablELSZCaTHu1T3WSUkL+j6B
         QFwiR0HXHx3hp/9NV7fMUAOislJl0rf7kzpeY3LSOVfhEZKzZKWMF8VL1wclcFWNK3mR
         +Fv0yo6i0Sy4BzouRnnYYc6ZsKUpb/uYGzAGSo4DlF6m826FI8fuRonHNysQnvxAH5BF
         tkMVCg0EKpsHfaoRdQoRTb/8iwTJWLEy9i3rjrwvP9XXfafZ6fVrvp+mgdmSoe4bzQ+T
         02NFk7BzeGOMvMrr57DsP0uRxuLNF6i06IzalT0yaQq2l4TWwLA+Zs7KD58UdsmlQGzy
         JHiw==
X-Forwarded-Encrypted: i=1; AKwUvBysZDVwabiWnJ/b+kF8U1IUjCZeMZPdx4BGknDlxi9UaRwBNrNDXL4uw7Mcr5bU/4IAZxopQ+Z8AYOJlOWl@vger.kernel.org
X-Gm-Message-State: AFuF++klg/F1VhGKWTYWpW+KkpcX7nn5UvXE6vgvD/lOD7d1tBvFHpM4
	2aW/sLzzw2ua3NI+xgZUMmITP05ghD4536zGlT/27U6A41VwjUQnBKk/Enis8gwiNwuPQWDXLsr
	VAJSZtABXg7lqCj8ytEx5pjSYA5er9tkOk8GC7+aCSVU+x2SxszIJG+FofbHsWvXbQfNn
X-Gm-Gg: AYBFou3F4rGJhtOKSy6aZ05SnLXmt/ubqoFnPeDGKkKslwrPlGlFqN0fb8+w39olUrV
	+e9UM2tCwiuQK6sjTuTRSA0+SFeEcI3yDMnQIkMeyUGhZMTqbtQUHXwMtyZJe+fUNaxdlNIvjGS
	myNWCKOF4WxSQwoQyslTNeA7Km29msg4nG3fMzy8begG1pqaYMszO8i6zCDDpm6RmLwH32TD8TJ
	tE9lc4ufRrY32JtGrsdffXNtgRkwezXntWOFRye47CTUnZ2/JDpvJzplbBSEXaRX67xlIbE4Cvd
	LywzLlGAPgH11ndD8XcMC6qQd1ilCKqCp5KTfBZMH0cTnBTsmoX1uOMwcCdbGal2vqoHof8W9+L
	7CuPqlq/+MlB03SoYKC35nAXzLXRAOX5fcqufRm0=
X-Received: by 2002:a05:622a:64a:b0:530:a450:4eb5 with SMTP id d75a77b69052e-53119e77372mr46820881cf.21.1789476644354;
        Tue, 15 Sep 2026 05:50:44 -0700 (PDT)
X-Received: by 2002:a05:622a:64a:b0:530:a450:4eb5 with SMTP id d75a77b69052e-53119e77372mr46820431cf.21.1789476643936;
        Tue, 15 Sep 2026 05:50:43 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530ca309989sm127737471cf.4.2026.09.15.05.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2026 05:50:43 -0700 (PDT)
Message-ID: <ff0a3782-b116-4db2-8dfe-16cecab0625a@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 18:20:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/6] ASoC: qcom: lpass-rx-macro: Add shikra compatible
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
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
 <16850fda-e68f-4ef4-bdd5-9ad77ac51195@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <16850fda-e68f-4ef4-bdd5-9ad77ac51195@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: vCubRgQxGMxV7Cz3YmgfgwsAutkngvWS
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfX3uPdqdyzOJ/M
 bcuyXWdV8IPks1DdB9j3XFOiL3kxPyxn3Gd1qHBNZDNuFDj+A5UO3aJJcqhmYpixE2Fldd2mctZ
 rJsyJ0R0R1avHS4o39uIeu4/sSBiB44=
X-Proofpoint-ORIG-GUID: vCubRgQxGMxV7Cz3YmgfgwsAutkngvWS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE4NiBTYWx0ZWRfXwcE9y3Wg9R/f
 bWAfjwXSqe8n5ZSNBnN56P8rS6eY72K2jHM2lG4KEo3iLNmovP9KzAbDh8riVBDVPFQz1qS+fid
 uKRWO7Useerz9/jbAqrA0r2uyaklusVS62Bt2f2iz6Bg/P21wakdbKTKmCdN5eV4fH50wh50lXH
 LbHJcVCu13OxcD+quhP+hTIqf49BqYVPHssvCPzmHfNnf/0cHoow1RfAI4PwcXOBRUyat3kuuSZ
 Rj7z41PfGWr+f1bMbK8A4twcuQ47R0xj2wYhKWuETKLEej+fXegmP/gXfFVfAKpI4R6amW+SOUs
 IHnhVAlqtk4TdOZaRIp5ttCoe52QWo/fEq5qyAUbOJF/oiMeWGiCeuprqMu6ytI2QPQwaFJjEJD
 nbw5gwxJhi8TpMIKa5Qpk+zzgdcOm3AKdrPCCdXaQkHaBgu0hnt06Y83D9rQFvjNTf5GkH/M2S/
 0rIsjaftqQT/wnhrQew==
X-Authority-Analysis: v=2.4 cv=BswIUoX5 c=1 sm=1 tr=0 ts=6aa93f25 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=iI-3DXn3oscrbdy4KD8A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 spamscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150186



On 9/14/2026 5:11 PM, Srinivas Kandagatla wrote:
> On 9/10/26 10:46 AM, Mohammad Rafi Shaik wrote:
>> Add shikra RX macro compatible data and hook it into the existing
>> LPASS codec v4.1 flow.
>>
>> The RX macro register layout of LPASS codec v4.1 matches the v2.5+
>> layout, so reuse the existing v2.5 register access helpers, controls
>> and widgets for it.
>>
>> v4.1 additionally requires the FS counter to be bypassed before it is
>> enabled during MCLK enable. This is a property of the codec version and
>> not of the board, so key it off the version detected by the VA macro
>> rather than off match data.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
>>   sound/soc/codecs/lpass-rx-macro.c | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
>> index 2e74ec1a5..83372123c 100644
>> --- a/sound/soc/codecs/lpass-rx-macro.c
>> +++ b/sound/soc/codecs/lpass-rx-macro.c
>> @@ -60,6 +60,7 @@
>>   #define CDC_RX_FS_MCLK_CNT_ENABLE	BIT(0)
>>   #define CDC_RX_FS_MCLK_CNT_CLR_MASK	BIT(1)
>>   #define CDC_RX_FS_MCLK_CNT_CLR		BIT(1)
>> +#define CDC_RX_FS_CNT_BYPASS		BIT(7)
>>   #define CDC_RX_CLK_RST_CTRL_SWR_CONTROL	(0x0108)
>>   #define CDC_RX_SWR_CLK_EN_MASK		BIT(0)
>>   #define CDC_RX_SWR_RESET_MASK		BIT(1)
>> @@ -1613,6 +1614,7 @@ static bool rx_is_rw_register(struct device *dev, unsigned int reg)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_1:
>>   		return rx_2_5_is_rw_register(dev, reg);
>>   	default:
>>   		break;
>> @@ -2045,6 +2047,16 @@ static int rx_macro_mclk_enable(struct rx_macro *rx, bool mclk_enable)
>>   					   CDC_RX_CLK_MCLK2_ENABLE);
>>   			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>>   					   CDC_RX_FS_MCLK_CNT_CLR_MASK, 0x00);
>> +
>> +			/*
>> +			 * From LPASS codec v4.1 onwards the FS counter has to be
>> +			 * bypassed before it is enabled, otherwise the fsgen
>> +			 * output does not come up.
>> +			 */
>> +			if (rx->codec_version >= LPASS_CODEC_VERSION_4_1)
> this pattern match is fragile,
> 
>> +				regmap_set_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>> +						CDC_RX_FS_CNT_BYPASS);
> 
> Please use this as a flag.

Ack,

Will introduce a flag or switch-case mechanism to handle this configuration.

Best Regards,
Rafi.

>> +
>>   			regmap_update_bits(regmap, CDC_RX_CLK_RST_CTRL_FS_CNT_CONTROL,
>>   					   CDC_RX_FS_MCLK_CNT_EN_MASK,
>>   					   CDC_RX_FS_MCLK_CNT_ENABLE);
>> @@ -3652,6 +3664,7 @@ static int rx_macro_component_probe(struct snd_soc_component *component)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_1:
>>   		controls = rx_macro_2_5_snd_controls;
>>   		num_controls = ARRAY_SIZE(rx_macro_2_5_snd_controls);
>>   		widgets = rx_macro_2_5_dapm_widgets;
>> @@ -3837,6 +3850,7 @@ static int rx_macro_probe(struct platform_device *pdev)
>>   	case LPASS_CODEC_VERSION_2_6:
>>   	case LPASS_CODEC_VERSION_2_7:
>>   	case LPASS_CODEC_VERSION_2_8:
>> +	case LPASS_CODEC_VERSION_4_1:
>>   		rx->rxn_reg_stride = 0xc0;
>>   		rx->rxn_reg_stride2 = 0x0;
>>   		def_count = ARRAY_SIZE(rx_defaults) + ARRAY_SIZE(rx_2_5_defaults);
>> @@ -3949,6 +3963,9 @@ static const struct of_device_id rx_macro_dt_match[] = {
>>   	}, {
>>   		.compatible = "qcom,sc8280xp-lpass-rx-macro",
>>   		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>> +	}, {
>> +		.compatible = "qcom,shikra-lpass-rx-macro",
>> +		.data = (void *)LPASS_MACRO_FLAG_HAS_NPL_CLOCK,
>>   	},
>>   	{ }
>>   };
>>
> 

