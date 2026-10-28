Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793182924;
	b=jOwA/+PDAeMV/0sp3/zxMBrpMUStftGD2a0J0nj4TXGcpjl9szzPibbQ3+xU3zjvMzTY
	 qr4+3Y/sunZghFxHonw/5ks8WA9CoNx/Ijng3vs+zMH9xaMx5JmjasXNqDO7dyF0sEd5V
	 esz/PJOuuy+oGk8EX4RXCrsvtsqZ1lgwyAQj6l9kc/lAg+gIyzlFc5PlIFUZ4iVLl8Kbv
	 QuQxcQqbHGenWvnW6e0zfxsiATOJ/bScnmHNnQ2zSWY4DAgUPBKU0sI03vQaZmRSiJhjn
	 D9gnf/fihlg9UCQCnQwk6VbYKr1RAvIa9K/ttPDCLq0ByXjj5qiMAUajhOnsS0mAMIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793182924;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fB+844XfQIYl5+SEECufGoMX1n1a++vVUgwHs31aKaU=;
	b=B/fk+SB2jomq1ATfRFcFeBecGOiYvaSlz2V23w1ZzDvtaGaIc7JQfZlIFiq3F/ecT+Un
	 GKdBP0OzDbZXccO15EQzuA6HyMPpfBe2cwMaw/5DodXjocMjGFt5hU/BfYcJraYW7jJJ1
	 9Z1Zhp0YluEGLh1GDP6vzptPTfaEmNY5SuqWXf3xoM158DBWj/4ubgUAaDXZmPk794+Sw
	 CTK5mfQk7aYbD0PR+c3WcXGeGLzfMS1/3a5obRt0taOQZp/o1nxmQKDmJC0U06wEz7U58
	 uoLxqHwxOaNwn2stjszHC+5sD2N8KRan1nz+sX592QrodDnxvM4ijJ/EhytT8T1RJ7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGZdpLIa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="hDY/B/fk";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5315E606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:22:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5315E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fGZdpLIa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hDY/B/fk
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S8K9JJ253421
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:22:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB+844XfQIYl5+SEECufGoMX1n1a++vVUgwHs31aKaU=; b=fGZdpLIa/VlrNvbN
	7Rq32kkNW66ldkQAejOdCs7iuZ+OG8+j/hjP0NPWQ735Cyv/yueTy/s2X3IjflPX
	Je3R1070kGTwyX8ZdpPKOPhDLW81gEUc7o6tyIgc68P6kU0MsvgdQXmPjLfuEqSs
	7Qj2+DUr5GQ2lv0CYaACSa3jvlQIY5DVIeXAjpTcUBf7w5on4IrxX3gyflpCuUom
	IXDsHCUSx7W/FeNayyoIKQfXrr2ywe+xy88p4mYgJs3hvuCLmIxmMUgpJJSzbKpm
	nGERntRCVWuCrl3ZEFS37H8z4/fqJ5guGi4eRkG73CKW5EKqpE9Jyd1qaRVssgDU
	x251jA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6be1yja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 10:22:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so155591485a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Oct 2026 03:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793182921; x=1793787721; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fB+844XfQIYl5+SEECufGoMX1n1a++vVUgwHs31aKaU=;
        b=hDY/B/fk188q3nZQoM+wn86ThzOTmQeVESqlksbK85DFh0woSEzN2MjvQx5kEFST5W
         JuYxLtEuEkrjgJxVKqu264Vm+haXYox75FSysl/VHSUKNitt/8X8LuK9S86szqcTajHM
         ksw2GOoeWHOpstMJcpf/pyrQZInolUeZNaL6BmZe3KZx39HywWUhj/mxKu/J4UsdUxk3
         4MPYCEcg4YaipQKbv++jONUuAWONAkd2hnVHhG/3crfcS819z08B3GFgpF0+DWik0PIi
         AP2GZz/rC0ntU5DcO46gSNiYn7K0FVNHGsY9BEvFCGlQk6wd9C6UXkysiZFU4MG2NIse
         9VYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793182921; x=1793787721;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fB+844XfQIYl5+SEECufGoMX1n1a++vVUgwHs31aKaU=;
        b=2OIM4061y7JdvZFUo+hBQvNnOhGSbydeyirsC3fKyeGjRerCaOHBEDpxsz2MiHaBe1
         EtY7sWzhA3GeXfZH7O85GbxR19eLH6XT/R+91NUPtgdBgG2KQZaxGJsygLxGuy4LGh2y
         4zWXU2TtFEsiX1N1LEIYsE6ABKycj/lSDqbZe/zcacwIijs5sCx1KfLVzuMOwi7BddRk
         1cVwMHBeWZVJntwbok5YCaE1VBV7r2BRy82hdQ/nFYNgk3fI9N2078cQt1wG2pnfRftY
         OQXd73uWcbKWgcseP0E5276PM4q4xvNCGYAYUbwe1RBO6E5tXDhunEVV+BmJy5pbHHwx
         I+3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxUqJv1zTWvTlYnmezaspWCHKbT1xMX1Q7vGOkyoBORQEdgJciZTwdAzP/fk/MMxiy8A5g8OLdBPE4r/ION@vger.kernel.org
X-Gm-Message-State: AFq9FYJVJ6xwhhBjgU3Guv8Dq+WIdC+tkn3N3PGczDzgG0+Vsf9h/YiI
	28ZsK2+fskpPfRWyZ6WhlXpocyN+pw3PCPO5kP/sg3FX923RlyV0j/7AMP6fWOd2p1ckJM/v6ct
	OpfYEEoE3miEx5XjfPxkTZN0HHdRZ2btV2ojVAxf2/E4DfqnYup35Ci9sy7lM/Mgr3UYyEptPeK
	eK
X-Gm-Gg: AYBFou3B6357CKvoG7SKRYkh280+bmLsVJcAEpuI2Y7yl9mGHQlFGyGzoh4K3XI9x94
	7w3pu+/jc5TzfXhgFjCHQQFiJVCzJv23YQrQOJXaOjpOxOsI/SfGb9mENm9budkhojve6ZdxL4c
	I3a6nUHuZMxCU/KV8GKUWGoANDopsw8Jxjl9l9aNGip+VVnCw0gXxU3GJtlMuTdmIZWW+1Ic84j
	kikizAl7OiX9uBhyO6ctoBtSAaUHgIFpGXjgvshxdoiTbQo+dCe6ypCVtr25hiv9zM3AnIlsAJK
	9V/jbYQULl6JGwqTmovXEjILhSIeUWDBZNX6zv8c545rE9cI5IFzndtlpukdchkYztx1ar6FCJF
	80BydUrz6l1wjpuHPZ/Hy/Bq9ZyQUSc9Jao8Kcf02Uvog+qI4XKKJ+7pkjNfBeNkG5jDTc5LFzR
	o=
X-Received: by 2002:a05:620a:63c6:b0:93c:8544:6adb with SMTP id af79cd13be357-94408a5f81dmr245900685a.22.1793182921127;
        Wed, 28 Oct 2026 03:22:01 -0700 (PDT)
X-Received: by 2002:a05:620a:63c6:b0:93c:8544:6adb with SMTP id af79cd13be357-94408a5f81dmr245899185a.22.1793182920585;
        Wed, 28 Oct 2026 03:22:00 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a9797e98a7sm32949905e9.15.2026.10.28.03.21.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Oct 2026 03:21:59 -0700 (PDT)
Message-ID: <6c423837-b665-4635-9984-a3efc28a7922@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 10:21:58 +0000
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
Subject: Re: [PATCH] ASoC: qcom: qdsp6: clear stale channel_map entries
To: Fabian Renn-Giles <fabian@fielding.dev>, srini@kernel.org,
        broonie@kernel.org
Cc: lgirdwood@gmail.com, neil.armstrong@linaro.org,
        krzysztof.kozlowski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261028100708.6808-1-fabian@fielding.dev>
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261028100708.6808-1-fabian@fielding.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6qgROXRQM27iPIzMAL2hvQrFZrA5MN9L
X-Authority-Analysis: v=2.4 cv=HeuB3SE8 c=1 sm=1 tr=0 ts=6ae1ccc9 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=gWL0RvtfYAzCyNj8DMQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfXyJLn5Pm6krtA
 Umq/5GfwZ9bpe906kq5BlAsRU0QTc1jcviPVx3LApz80Uc1kS8ueD2m0ZxjIN3TFtPQF3mx48nD
 gKkneaVbxZFo9B9uWvNGJcqFpJ+58xo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA0MSBTYWx0ZWRfXwFy61PI90yR2
 eOk5UylbDCobFKWsBgyjsOEOToZQSS/hvzt8PFc6YotgZtQWxbD/G6IIgJABz3EXsUlY5wa0RH8
 RzAiSSEX3FQSqoHVJZ0JI44JpFdfkTAfRsni4xwhfQyNBlnh5wDxsflAWhP+qn22j8unzMlk0CM
 3hXbq868RVEeWivf1o8wrRNyggZHjMCKXa+WLogADHrfu6Z9PC3HeXQtd2g7qulAeaPmrwKBowk
 7k/mQ7tf0mBKQAuq0Ee4d1fz81RotR5KGreFQUSkLL8Qn6b98pBrXW+P3eztDHVCjZ7qWlgfUvf
 a/pLtL6DpU2bxVa7C3qOJJ7bUip30kyLe+S+JDX+OomRCOcLW7MS9Pwh8lhGEIZQi4fDzLFtW0J
 PK0zLA0u8FgsuJsqsaBQCtlMmah6YkfGLOHtlnqgBwMx3CRPJepbwlb+7nxDzeNtbQFrHP/VugM
 7t50hVZj55S/z4Cs3BQ==
X-Proofpoint-GUID: 6qgROXRQM27iPIzMAL2hvQrFZrA5MN9L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280041



On 10/28/26 10:07 AM, Fabian Renn-Giles wrote:
> Since commit c663014e452d ("ASoC: qcom: audioreach: compute active
> channel maps from channel_map"), the codec DMA active_channels_mask is
> built from the non-zero entries of the channel_map instead of from
> num_channels.
> 
> audioreach_set_default_channel_mapping() only writes the first
> num_channels entries, and q6dma_set_channel_map() only the first
> tx_num/rx_num entries. The per-DAI module_config in q6apm-lpass-dais is
> persistent, so entries written by an earlier, wider configuration
> survive a later narrower one. E.g. after a 4 channel setup, a 2 channel
> capture on VA_CODEC_DMA_TX_0 keeps the map 01 02 04 05 and sends
> active_channels_mask = 0xf with num_channels = 2. The DSP rejects the
> graph start:
> 
>   qcom-apm gprsvc:service:2:1: DSP returned error[1001002] 1
>   q6apm-lpass-dais ...: Failed to start APM port 110
>   MultiMedia4 Capture: ASoC error (-22): at dpcm_be_dai_trigger()
> 
> which breaks the built-in DMIC capture on the Lenovo Yoga Slim 7x
> (X1E80100).
> 
> Clear the whole channel_map before filling it in both places.
> 
> Note: this is my very first contribution to the linux kernel so I
> may be new to some of the processes. I apologize in advance.

Thanks for sending the patch and Welcome.
You can move this comment after --- as it does not make sense to be in
the commit log.

> 
> Fixes: c663014e452d ("ASoC: qcom: audioreach: compute active channel maps from channel_map")
> Signed-off-by: Fabian Renn-Giles <fabian@fielding.dev>
> Assisted-by: Claude:claude-sonnet-5-5
> ---
> Tested on a Lenovo Yoga Slim 7x (X1E80100): built-in DMIC capture on
> VA_CODEC_DMA_TX_0 (MultiMedia4 Capture) failed with the DSP error above;
> with this patch repeated arecord runs work. Based on broonie/sound.git
> for-next (d34a818a331f).
> 
>  sound/soc/qcom/qdsp6/audioreach.c       | 6 ++++++
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 ++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index d2dc5d37bccf..4ac65d9b5543 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -308,6 +308,12 @@ EXPORT_SYMBOL_GPL(audioreach_alloc_apm_cmd_pkt);
>  
>  void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)

there is patch on the list to remove this function, could you please
take a look at
https://lore.kernel.org/all/20261028024720.981971-1-zhangfei.gao@oss.qualcomm.com/


q6dsp_map_channels() already does the memset,  pl recheck with that patch.

If your patch might be still relevant, please send patch against it.

--srini
>  {
> +	/*
> +	 * The active channel mask is derived from the non-zero entries, so
> +	 * stale entries from a previous, wider configuration must not survive.
> +	 */
> +	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
> +
>  	if (num_channels == 1) {
>  		ch_map[0] =  PCM_CHANNEL_FL;
>  	} else if (num_channels == 2) {
> diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> index 83f2711bceea..12f139af8ca0 100644
> --- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> +++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
> @@ -99,6 +99,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
>  				tx_num);
>  			return -EINVAL;
>  		}
> +		memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
>  		for (i = 0; i < tx_num; i++)
>  			cfg->channel_map[i] = tx_ch_mask[i];
>  
> @@ -123,6 +124,7 @@ static int q6dma_set_channel_map(struct snd_soc_dai *dai,
>  				rx_num);
>  			return -EINVAL;
>  		}
> +		memset(cfg->channel_map, 0, sizeof(cfg->channel_map));
>  		for (i = 0; i < rx_num; i++)
>  			cfg->channel_map[i] = rx_ch_mask[i];
>  
> 
> base-commit: d34a818a331f7e270fa9dc3db3d96f6a0d4fa7ab

