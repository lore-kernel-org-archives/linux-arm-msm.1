Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E7C563FA3
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791998409; cv=none; b=bB7ZYEquOlmJmL8j/SjGZUxHAr/SxBj+DkAQQLmReGWzMqEA8ZTv3n+ZiE5wVXh/e51bkxuT+j+zV/FK6tH2TmFFLUxxk/cic/y5rgV3Lyxg5mSaST04tlLNr58Ks2X+VyfBy0dvIvD45oaPcLeP3I/8UgZiPgIcSVMI6HXzvUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791998409; c=relaxed/simple;
	bh=5Se8VnfknYJq6Mh+kMHP1p3VIF9Hh2Heg9U9bTgy7Yg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=p93f5OIfGH6dbtYS+/aV8qKh47fAh1BOmxipcduwNGyRsr1AtRb7D9OPfA0noYoDcywnlB6AvRm4MCKHWZZHgWV00Cl+8szcKHz/WxZoUuKX7i+jFFnm/Zdb3J3ByoViEG0esCA7vIZXZ8tm4msJjxuKBcKcmSGgJ24Q32AL+jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bd2J7ccW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Iukh8PD1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bd2J7ccW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Iukh8PD1"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbF20301195
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:20:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cZBLU4TkxRsRv3/pM7ayYDtoN569l8qdzuLTX1OE3rc=; b=Bd2J7ccWkh9K5EJY
	oB/iWEhfDwvRjRDDAlqf+9d7gyS6ZSLn5PK55MpjrNXadRXLcTavOPLLfm2oZ/vS
	T83lt7+2qx8gmZNMZ82fbPNzk2v6WczBoq8V3YobGVRY3bXD8J4TWKHQpjBxbEgk
	0eSMGtiQxtImO1a2Grgbwje8mFEJS9AlKfWquAQMZwfgskHUtjvOFIEkqix9dN6b
	MNFLTd7KbCXKxtV2xYdYCY+hkqAUJ3a/icb+udRk3XxeA41dabw0dHPiNw7dK2mD
	siJv7BtpQaVQsegDTNlFbyCBv+8scr8gbu9dSfgn9ksNcnszNPd+vBaGPDJNeaGF
	byFq+Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha4622r74-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 17:20:02 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-359b81ad4e8so1806643eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Oct 2026 10:20:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791998402; x=1792603202; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cZBLU4TkxRsRv3/pM7ayYDtoN569l8qdzuLTX1OE3rc=;
        b=Iukh8PD1O6O+hU9Z3Sr6lTeadzkH/4JNlBtJ1l4uhA9THFq/DLpJfhHEAIULuJcgZj
         ENuKjVp66gWLJ3Qa6PdDI1xpZqKpgOeaG1ycQRDRBBDTSKmjndNUiMTUhVjNhgQq0RC6
         uLmdW4FoakPrPr/ALsVQq79jGdRW3Fw9MDKFlqJ++ZO28OjadT0qt5fHrBFUPXKpiCcn
         HoNGnIV8HrPtMm9X+zwo7Rr0fsa+dF22AzoI3row6GDo2ByV9qeMKsT7Fp3z9174nwnv
         W+hmEoVLHkzeFbQyeBcjgcK8KSC6OtzKtcO1xXL+r2zuOkru5bi5b6Xjzc3b+LB1KiEU
         13LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791998402; x=1792603202;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cZBLU4TkxRsRv3/pM7ayYDtoN569l8qdzuLTX1OE3rc=;
        b=Uxamov5c83Fs8Hv2n8Swd+b9V18uG8kozyTD6f9isJGm6EPXmADWZorlXo7TKSdoJ7
         I3+9dccnU1UoIdYzRApiPPJpy8ds8QW86IAhUkHSkeuCIGyooOM+1f0pWCt5DvrvIg70
         Fv+FMHZ+USfYFCQsKwEtXLSziLUTQv1bJg7k0ryQlkn4+Lqr8BoPFEta9pvFqN3QkeZj
         TDLBETIxAM2nFiZcmFSummN0OXirZ5nY7k7Xv1925xHJ4/Lj8Zx2SZSlZhOLZom3j6/Q
         +W1mjwHf4QNlCpZB6VMtw2u8gitLuZDnwXKB5IsLJbwwiO0/KPjE9Vvw+z/8BJ5RII74
         Zr3A==
X-Forwarded-Encrypted: i=1; AKwUvByohfCOi/IttJUzh1/MAbOsLgPlhGAbvcAciDs0tYUirPbVJUYTWBH+WwHHKCOhienGXlaEZf/HiVUQPrNj@vger.kernel.org
X-Gm-Message-State: AFq9FYJ6Tx/w13YgXKStzaHcpErn0rSxXp1/73ySd+l4+Gg1v8P7Xpdd
	z8XanozemcHs6M4yq2bDK+k6lOM+bBj1ijFniTOQGSNY8SGW7QrifRpUBmgexnizIZxZZJQnXzT
	MEAICCDC+Tafzj2zhOaSqyYBXvRLKR/y/RPqILzwNcThANJwNbFwtUGzaoIjsSSpDqL3e
X-Gm-Gg: AYBFou0uZKj7FfuCPxy2dFXuKyoXfzGJp7ox3gIp6DbBgb5lq8/wy0bisn56EKxqB31
	1E+AzuAo5uZ5lGisxs/6w3CyawJ1MMczsu/1pmRTUcjiLcoVvAw14UTx4j8IiO0AgidrCtWN2AT
	WFcXt5qHg3aGmdTc2vlvlaVeRhRqRbJFCKpcn2h2YMBWGMpTop5iQT6xJwIp584rdFGfxXxLZBl
	SQffINgvvnkrdAsNl71pxQnxhnzKS6sOsSZjqSHITrkgrCFcuNE+AyT2kJir13n8UjMZcFNo8sQ
	3EwK0sU5EBn39gsjCeyL+yWaQ8Cjtod3dhQVLNDy2t7+e4jNfApcWkA/tQpnEdrTOJqAWrEfz7g
	ocUwgnJP9H3TVAgfa6qc9gfcAMJu0/7SKttPHcIo=
X-Received: by 2002:a05:693c:6393:20b0:35c:ceb0:8c11 with SMTP id 5a478bee46e88-35cceb08fb0mr6186470eec.14.1791998401670;
        Wed, 14 Oct 2026 10:20:01 -0700 (PDT)
X-Received: by 2002:a05:693c:6393:20b0:35c:ceb0:8c11 with SMTP id 5a478bee46e88-35cceb08fb0mr6186421eec.14.1791998400885;
        Wed, 14 Oct 2026 10:20:00 -0700 (PDT)
Received: from [192.168.1.5] ([223.230.101.206])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353810403e9sm55949961eec.2.2026.10.14.10.19.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 10:20:00 -0700 (PDT)
Message-ID: <b2ba86cd-5eb2-40e6-af37-d6d44d244675@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 22:49:53 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 7/7] ASoC: qcom: sc8280xp: Add Nord sound card support
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
        Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20261009-nord-asoc-driver-support-v3-v3-0-0c1897f21ccf@oss.qualcomm.com>
 <20261009-nord-asoc-driver-support-v3-v3-7-0c1897f21ccf@oss.qualcomm.com>
 <65a55d4c-4a88-4cc0-8c5b-57fc8aecbc8d@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <65a55d4c-4a88-4cc0-8c5b-57fc8aecbc8d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: eIlUKhAzeAmNxK_MztakgkuIFDtLtju0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfX9qlaISd/NCtf
 R6qCwoLBcofWFfa97RLNcEPuvN2wtTJySM5j/+v5tUN+5lRKOMFIS4Oo/K4CsGCIl5g3M0HoxxT
 SwdiSxevCBlRkc58kqAvHpJz1SgWkoJ4plI4fMpDGvaoORapxt0yH0H4INlegNhortDIPaYayIe
 Pw4MhU8y99jg1c1W33xj6lxe4fwcel+ezBsC8vTJzd0/OT0tZduSanKwkneGBLFlmIm373KC1B3
 S6L2sd5zNOPU0NS9DPX8jy/Y8mcDPN1nRwym62rvQxo7v1t3igx66TeI1e12k0JEfTPEeYMiulY
 O/Tlxm+MiQvUpI7SFN7fU6K0qlw4LQ4Ea3Q8GySEphyUBEhVZwKZ2WlIonLcIwb7wB5Yfqy9n0d
 f4MeBSL4sWb4JsGO7o7QqHZWFG1cuYBfXCeF7oxqY5jtGXMSKKTukZrCLLNd1DA/n+c/I9F4H2y
 JLujNCkRxH5srcT8hGQ==
X-Authority-Analysis: v=2.4 cv=ErZHPicA c=1 sm=1 tr=0 ts=6acfb9c2 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=89gBhgtN2V0NwPD6rb2Hew==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=gevaTKCoh1dS3kc47SIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2OSBTYWx0ZWRfX54SODLLhy+Gc
 Z1nJdZ//LbJ+Yq3FWO4Lt7+wRF3YOwLO8qC9/qEFcD2HqBiGz6ziP1jdk8vDuA98hHKIW33Wyf2
 ypEZ9Rv+i5WJRHKH1tHRHqhhNBMTAdU=
X-Proofpoint-GUID: eIlUKhAzeAmNxK_MztakgkuIFDtLtju0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610140069



On 10/13/2026 2:39 PM, Ajay Kumar Nandam wrote:
> 
> 
> On 10/9/2026 6:42 PM, Mohammad Rafi Shaik wrote:
>> Add support for the Nord Ride and RRD sound cards by introducing the
>> qcom,nord-sndcard compatible and associated platform-specific data.
>> Nord uses external codecs for its playback and capture paths and requires
>> board-specific DAI and clock configuration. Configure the codec DAI 
>> format
>> for DSP_A operation and enable MI2S bit clock handling for the platform.
>> Add a platform-specific sound card initialization callback to configure
>> the ADAU1979 capture codec to use LRCLK as its system clock source. This
>> configuration is done during DAI link initialization so that the codec
>> clock source and associated rate constraints are established before the
>> capture stream is opened.
>>
>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>> ---
> 
>> +static int nord_snd_init(struct snd_soc_pcm_runtime *rtd)
>> +{
>> +    struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
>> +    struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
>> +    int ret;
>> +
>> +    switch (cpu_dai->id) {
>> +    case AIF_TDM_TX_8:
>> +        /*
>> +         * adau1979 PLL clocked from LRCLK, no external MCLK. Selecting
>> +         * the source also installs the PLL rate constraint, which the
>> +         * codec applies from its startup() callback, so it has to be
>> +         * in place before the first stream is opened. The frequency is
>> +         * unused for an LRCLK-sourced PLL.
>> +         */
>> +        ret = snd_soc_component_set_sysclk(codec_dai->component,
>> +                           ADAU1977_SYSCLK,
>> +                           ADAU1977_SYSCLK_SRC_LRCLK,
>> +                           48000, SND_SOC_CLOCK_IN);
>> +        if (ret && ret != -ENOTSUPP)
>> +            return ret;
> 
> If this link is always connected to the ADAU1979, should we be ignoring 
> -ENOTSUPP here?
> 
> snd_soc_component_set_sysclk() returns -ENOTSUPP when the component does 
> not provide a .set_sysclk() callback. In that case we'd continue without 
> applying the LRCLK clock source configuration, while the commit message 
> states that this setup is required before startup.
> 
> Is there a case where AIF_TDM_TX_8 can be paired with a component that
> legitimately lacks .set_sysclk() support?
> 

Ack, will fix this in next revision.

Best Regards,
Rafi.

>> +        break;
>> +    default:
>> +        break;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int sc8280xp_snd_hw_params(struct snd_pcm_substream *substream,
>>                     struct snd_pcm_hw_params *params)
>>   {
>> @@ -552,6 +593,15 @@ static const struct qcom_snd_soc_common 
>> kaanapali_priv_data = {
>>       .wcd_jack = true,
>>   };
>> +static const struct qcom_snd_soc_common nord_priv_data = {
>> +    .driver_name = "nord",
>> +    .mi2s_bclk_enable = true,
>> +    .codec_dai_fmt = SND_SOC_DAIFMT_CBC_CFC |
>> +             SND_SOC_DAIFMT_NB_NF |
>> +             SND_SOC_DAIFMT_DSP_A,
>> +    .snd_init = nord_snd_init,
>> +};
>> +
>>   static const struct qcom_snd_soc_common qcs9100_priv_data = {
>>       .driver_name = "sa8775p",
>>       .dapm_widgets = sc8280xp_dapm_widgets,
>> @@ -677,6 +727,7 @@ static const struct of_device_id 
>> snd_sc8280xp_dt_match[] = {
>>       { .compatible = "qcom,hawi-sndcard", .data = &hawi_priv_data },
>>       { .compatible = "qcom,kaanapali-sndcard", .data = 
>> &kaanapali_priv_data },
>>       { .compatible = "qcom,maili-sndcard", .data = &hawi_priv_data },
>> +    { .compatible = "qcom,nord-sndcard", .data = &nord_priv_data },
>>       { .compatible = "qcom,qcm6490-idp-sndcard", .data = 
>> &qcm6490_priv_data },
>>       { .compatible = "qcom,qcs615-sndcard", .data = &qcs615_priv_data },
>>       { .compatible = "qcom,qcs6490-rb3gen2-sndcard", .data = 
>> &qcs6490_priv_data },
>>
> 

