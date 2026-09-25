Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B7844AB83
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790324581; cv=none; b=oI7isGHg5Y8TWBE3vHrfrzWbL7aeiWMCI3CJfEC9EH0O569Ta9kldzQ1RmZlEQanhH+cLJflyhaRdg2INHEvm2ZeWfyipHSYKZFtgSwKXXhViD42nJNtOQRiYfUqO19dUD+Qj4WOD4saIknqL2kPlNscF4EIlhd9rfUn47x9qiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790324581; c=relaxed/simple;
	bh=I/fv3RGnze7s+N5FxFvRXiB+6C/5+ZaAufwlU5W7NRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ylq3uqsccAfF6j6HGJKmVVGkrBtmiIlbC1wrZ0lcwqIwpyVQwBH1k4hKdMwfg1Yq3d6MX9sITUEwKpYXUVgFjg9C7+vkRc6xALmOOBvLGJkut1BValNCReFKVwn+w4N+ma7mCutlvB54LQqNzSIdFzQX8ic9ocmRBomt5D1Niqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nRAPVPHT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDZidfdt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nRAPVPHT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDZidfdt"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68P4YomL1194081
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:22:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=; b=nRAPVPHTcorj6cMq
	U2oLcplr9EuNFl8IICoQr+bhsIFWpbeG1gGLNj0KvzUOZ1M6VutX4MTp6RVEfgYY
	u/BEmpItk0yqDxab/KvpdIkSwaw7pSaWCSPXThuSGlNmuS1IHHrI1D1nlOlR8wxc
	cVwDDJeGrNG697LAxJLGvoxZkwbO2IRveT/TX0GAwN54aR5hUSXMWVmZrYJm0tY/
	P9tiYsvBo6zksLWWvNA8/VvjPtqwLSC2MAF+4gEPQL3ivDFe/sLvx6t+9SwzBfrM
	H2TyVAVdK+6dsOQFbdbQguEBhbJY8rSsn87r1XSA22JZncBCRQVFf8Fzg7W+8Vto
	jq/UVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gw874jmyf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 08:22:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a0c7126e7so118025585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Sep 2026 01:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790324578; x=1790929378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=;
        b=dDZidfdtD5IFI4CqSLAQ6xTv1NYbx+Wa6mm8u0KVI5lfRzx6jyM9ddMTn1GuMvxhhm
         lFKeq/5rKcTO6DVpg3hPuvNtvR+afjBHJRcWDegYS6u+298JzonTow+rIee1qxUCsc+9
         xRWm3zGFrqUB7/RCAcwPuS/4Eq56hxenZRUjeWfxRdGR31AUuuLJ+c/3XtApuiNwhWYj
         35h+73epziJbVFuIN0BuSgxFxzyfTpUh6fzWqfx8NvHJOTaouNSkxxbaKxQZHoIDP7QH
         iRCR3mPPKQO5nfOmsPZVN9ujpD68d9/V/EbICi3HivqPXfIgorVcC5Ea3EowCTQnVkCS
         J8nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790324578; x=1790929378;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J3AR7UZUtXFX7XXd5Wd1G6E2yQBULteMUT2atsZ3wtY=;
        b=pCrTqTkqz5yx8/yZfbZWzFaRfUB6kSfMj6OJKl3WctZ0bWJ5H9xwYjhbIxMUtfAjC+
         qaoC6O0e8iCoIjAPQXAIO2a6otbbb001HYSl0IOEF3iPWsw+1Q/uByXKI+I4gTHFxpBl
         6+Cq2ahm0oFAy04DniRS+VsRvzlBeueYSPcKGjKihqCQC3X5U0IBFsxbxy6bwFnaZkFE
         q6JAWyASCl86P3UZ3NT+GFiwKrjOdPyC0HkbwOnnNJSI5lMtVQPz4JuaeaAm1tBnG/bo
         nUpGPOubX9cxknEYz6s7ZdqZQQD2XgPeji+g3U+V/S4EDzRZ3cvfYoSdCuro1YVQcLMl
         JDrw==
X-Forwarded-Encrypted: i=1; AKwUvBylFJAO6r6xQ9cs9n3ITIvskrIu2vPz+a7hMZ0kbCA5hhIx/T52FBeuP+wZMDfWuHa0NBWy8UpSpF7tIISb@vger.kernel.org
X-Gm-Message-State: AFuF++miReBijhTR858fu/WWJs5skTvg44Gyn25AgIuiBb/VZ2k9VZrA
	tQRHh6lwItvWs6hYjrNG1uZZ9PsVE9T7JpDFh0bAfWpY/YjK+7ASiGKQz1wdPai5CJVg4KwPiAg
	LPxOxDeXfDlyP4qVlE4ZUaa6pAGPs+FCZ9PICQcgcqzL91AGrRUCJOtcNm9z5tuI1KAPL
X-Gm-Gg: AYBFou2uD0wCOGc3FFcQY/cEaAbqR29x6T1XmeLsB0jmzy+vR8sWk28N8D6Zfdygin7
	LHuGyqTXEgirV2QNsaY0t48rillqoueQeBooOx5vvbNgv5nl5X1Q7ClGpGqCeLZa12CtUS+As0a
	GDIGQ/wNiohYsLetiiA2eVCUxk1Sj9kUMD4O2ygQZNoLcwJfD9CUEKVh03qocA8I/ajuOMsgyub
	CfIGsL5SC8pEwG/iXLBPNAuQEyhlMeM6cf32sgNJmsCNsQl8Jm9bEr0BJnLsi0cte7qjB++Q9os
	7jawRfdvuJIrCACuV7ziMxsnl4IVSap0Mey5xf9Vw10+KoTbsVZWwKlBsVgZX5qC1kRu3ru3j6b
	xGGeR7tHejs1vBnhrkxIOjBoKpQ==
X-Received: by 2002:a05:620a:2b8f:b0:914:afc1:c66d with SMTP id af79cd13be357-93c43b836dcmr301326485a.11.1790324578532;
        Fri, 25 Sep 2026 01:22:58 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8f:b0:914:afc1:c66d with SMTP id af79cd13be357-93c43b836dcmr301322885a.11.1790324577924;
        Fri, 25 Sep 2026 01:22:57 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c2ae757b50fsm77289566b.32.2026.09.25.01.22.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Sep 2026 01:22:57 -0700 (PDT)
Message-ID: <348b88f8-4708-4d6d-ac01-3af0f40c23f3@oss.qualcomm.com>
Date: Fri, 25 Sep 2026 09:22:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/8] ASoC: qcom: sdm845: use DSP_A format for TDM codec
 DAIs
To: david@ixit.cz, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        David Rhodes <drhodes@opensource.cirrus.com>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, patches@opensource.cirrus.com,
        devicetree@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260924-pixel3-audio-v4-0-85b5d133aa5e@ixit.cz>
 <20260924-pixel3-audio-v4-2-85b5d133aa5e@ixit.cz>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260924-pixel3-audio-v4-2-85b5d133aa5e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AY3x5prlfQpNiO1a-85YzU1I5JTW21U5
X-Authority-Analysis: v=2.4 cv=MI71C8Zl c=1 sm=1 tr=0 ts=6ab62f63 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=sm5W5dfhhG054gMKQQIA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX8HVocdICjvBq
 vDM9JmIxfxaof7tZeHDzs36TO5qvdsQ5XhMsI/7v2ATqxrVkHwzz3lJQk5vHi6/+Of3KJ55MpjD
 lxYm8gCguX7ZBsGeAHTwYie4Pva5fFj7m6f0Yw6BHGCujp2EczgpfieNDR6s/+CANfif5gIokZ5
 /WICwh1dQSBDe2JzLII9kJ0sYvXNNdh3oUv9dLZ+pCvEpwCtxDp3gCo82ugPDKIzmWHua0efC07
 /Grj9gwYTZ/nvtgEzuCrctxux2FsjFdd2pUqCRgcCj2H4ooHK9xCP2Dw0I7Ce3iOO3UNr3w7CFh
 brmVUUQacSfoIXMPVJS1eSVpcAiJj/hGRW60wMHdys2uaZ4Dsz4Kiyf3M52M9LwIdV+tek/GifT
 IzwD6OfjqGJrVCr9mubAmuj+Oo6qICfFdCkDcllFgONTFtnsZV7q9rK2kj3yLbKds6te2xUOyS0
 mu4MhQLneAnHEtAf6wQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI1MDAzMyBTYWx0ZWRfX1QA6qtI0DtYc
 oev+h8qd6WeHZcxWq94RB8Ft4X7rWtt+fbgl+DMOw0MrEOYaBx6yjAvX0MLUJZX8IECTz854TMO
 Sb/9htSSXduUK/e4QlrrniL8dgrIjCc=
X-Proofpoint-GUID: AY3x5prlfQpNiO1a-85YzU1I5JTW21U5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-25_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609250033

On 9/24/26 2:24 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Before the DSP_B only worked because the only close-to-mainline consumer
> cs35l36 codec was patched to map both DSP_A and DSP_B to the same
> hardware register value (asp_fmt = 0), which is inherently DSP_A timing.
> Use the right codec (DSP_A) which works as expected.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

>  sound/soc/qcom/sdm845.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
> index 0ce8265ab1c1f..d1cc825fc5cdc 100644
> --- a/sound/soc/qcom/sdm845.c
> +++ b/sound/soc/qcom/sdm845.c
> @@ -382,17 +382,17 @@ static int sdm845_snd_startup(struct snd_pcm_substream *substream)
>  	case QUATERNARY_TDM_RX_0:
>  	case QUATERNARY_TDM_TX_0:
>  		if (++(data->quat_tdm_clk_count) == 1) {
>  			snd_soc_dai_set_sysclk(cpu_dai,
>  				Q6AFE_LPASS_CLK_ID_QUAD_TDM_IBIT,
>  				TDM_BCLK_RATE, SNDRV_PCM_STREAM_PLAYBACK);
>  		}
>  
> -		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_B;
> +		codec_dai_fmt |= SND_SOC_DAIFMT_IB_NF | SND_SOC_DAIFMT_DSP_A;
>  
>  		for_each_rtd_codec_dais(rtd, j, codec_dai) {
>  
>  			if (!strcmp(codec_dai->component->name_prefix,
>  				    "Left")) {
>  				ret = snd_soc_dai_set_fmt(
>  						codec_dai, codec_dai_fmt);
>  				if (ret < 0) {
> 

