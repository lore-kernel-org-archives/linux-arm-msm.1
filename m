Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793294975;
	b=f/JKyFENMp/oFdJDsKAax+7rjrYaOVh3+Rg4fwyh/pfGN/wO5RDI2Q8xhhd4oWp42tiW
	 xnA6tw8pHCZMLiBaD6N0fZxHLarwZvgjSB1++TzKmiEeuSBLnKT7aOrtSsQbUXI0PwaaA
	 Eje2uqWhmDJJ8CzTJuu+T2eAxjGpyGDxpfxvH53WFhHHd+ONwZXwIhPVQdcXD7e50883N
	 s+SlvXU7jha7yFdZfv2/6LVzGwDeYJZQysr758iwg+dQFR4iq6kkdI4PTeSSJ5jRWV0sY
	 1bTP9yBRRLPT/efr6czmKpaq1jxdpMDsXWjUZ49dAt6gLv+63dJAJvx8mIdn8Mli9KQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793294975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=;
	b=vMCEcH5EDk2/2M2dl/JfpjoFgHcOsYJbt5rrrLgqOuDDk4YSs2EWV0nUppLM8lbQTBiQ
	 KO+yLYyOqSCAHpVGikWI9APTxjxEWMKJ3Eg9afMZOuehTuPEWk03sf8mt3vDcBE+kLtGD
	 N4B1LEPVAsCeZUhFuWKrpkWuSrsFGmGRet88NxT1T9iF3NBB5qbAUH3ti33Yhvsco6eu7
	 BkGr0YbcNzHlLypuVIV0E36yfHiClBCiaMwMCQ41QcE3Rog4P11ivqMf5rH9hpr3xmF/W
	 9EsJTnL3FqTs54D2chf9jJaJLGy9hzmKkzDIfu5VMxHXvoQTLKqctOPZsi8x8HfAqVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfdJGf3K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="UyzzEDp/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6F8B606A321
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 17:29:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6F8B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZfdJGf3K;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UyzzEDp/
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGD0iD535210
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 17:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=; b=ZfdJGf3KiMt+tNis
	GFHP/jceO7rWXyXSjC6YBKZZh7yO2wARMFUJki5uYrIEIefxQvLc1/LdrmSsRZRw
	lrLmkoOLc0+m44rJ+CcizXxXrcdVm+/5NDrdR9GP0Y8U1ogA9lRVscOitejxOqje
	mnOIFf7b8bXNNkXM0HwYCaVNZsl8ZiElKHEpqiVDH1mKpMBdJ9eWIStvn1JVmYBi
	vla9XtCQPfMZJusOjGDh+QqKQNNn8lzvHXtN9puTrDmCqGmMwxRZ5Q9ukQbjoEyl
	lBwyP+RqZnaG4JtPcg0jRkGcncj6k1M9gy3f4rMD6/ITpxzEqZwfwb78t4rbTOCA
	e/Y1xA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm8k4h3j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 17:29:33 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4227281eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 10:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793294973; x=1793899773; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=;
        b=UyzzEDp/760D3NykvygpAoESDrkFN8YtTduncyNgA6kKtqj1LqB9yYGd5657ynJVOa
         APzXSdJKm6Ob1RIHPzCMjSFSM3CQEcrMSFtbXyIJl3F0nf00ZQDeuxOw4RB61QQTORvi
         ZcJdS0YSjouGc8SCY479dvOkPkFE13v5SbdQJ6CLqbk7M0mOG2fgl5tWJC3bQp8fW8Ey
         aXc31tzClAlz80gBJoKEYRJCBTdYtxYEflX5Bw4SWf6hms3yT2FVA7NWRrp1kT1JqqSd
         eVAoon5e4LYRClrfjMem11OgyJ7NFt7u5jVTMZKedkiQeNspgF+s+JmSZW6nO8rgdGKd
         w1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294973; x=1793899773;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hxmzuO9OtgbaXD0ktYtWzy0CyK8952jBK6ZqziabIvg=;
        b=foXlaoPrH7zfbPUhF7RWnKU8CQnWKSjgDQztiHxQjAPDu/MeBmHr47o5vgaxQIyJN5
         pJIONDhChkVmVwW9yNhB9OJFxTPq4ZN7ikekaj9ILtHm76qahUUOiCrp0nuikrLN/3X8
         Qnll+EXEz8WRRQPHZpv+ElZyuPKuV/SruRdyIbvYrh111kq2j9hgV95WtTi7YrEIhMg/
         v1hnw/2ZqBOP+FoyjUucIKxQjNZUIDyoTA+Bj9KgONvDIaDLILUMJLOL3aSJG5JHsszX
         j24CunSyIgPEg5MDkCbWlb1w+bKVNaf5x0ScksdgUcJ6wWdBnNCIL8rjs7S6AF1AYL0J
         maLA==
X-Forwarded-Encrypted: i=1; AKwUvBxdygbDa8emlSpIu8f6qAd0ZWqm278JJAbWAQ2ZA4nsit3yXhDluU6fcobol3CN+jjskL2x/Xt+cJRg8hQS@vger.kernel.org
X-Gm-Message-State: AFq9FYLe/8P43NVxA0S/R0KNFe6U0SHeOc2CNv6qvbV1l3TnTH8/14kl
	wPuCLKbIXgguulk3kmCO10gCgfteNRC8vJLirE0fSgSJlcfJTnG7fEqU0ayUu+FOn/Pdm6Kj47H
	kKgsxeIJftv2FYXVmSA+Wstov0lKoLPGyaoubECqk8XBuchzEsibqNm2SW9y2mxnH9lrN
X-Gm-Gg: AYBFou24e7e7+zesCeRU1GBD4pnUrebparPdywiLUjGsqNPHDqsBNl3GeEFgka14v7A
	XeL6XYH3p2kLdCTYN/BcO21tKUif1EQRDY4hDebMq4BJEpPBEzloIyhPf2HUlk0mIL+wd9+FVbS
	Netioroa7EvAYSl6K2/0MlTLoQewHPGMhK1fiH52t59qR/Zv9PYWss0Fg5oPiBwg2tCHOmK1EyK
	v0jgtsg2rRFjoEvByIMs6eMlWeHyNV5Pn4hiGqeS29xi6I6eWTe+RHbXp7PxzGuzQTfS6IaGJcw
	uzIoO46JHxMJIR0lJ0A5x1dFPSm2W3SySihOMAxFikiOZorONh6r9uCxeUAR2lJXIuznhzlap54
	P5CUAftWpnAMWMCzF31Dud40gfyNy+VU46mOKdCSNn0BafbxZ9Fhr/5swPDqUbH+FzL83s/XbNV
	XvxdXsJMRn
X-Received: by 2002:a05:7022:3a85:b0:191:17d6:ccdf with SMTP id a92af1059eb24-1a6cd499501mr8224225c88.8.1793294972532;
        Thu, 29 Oct 2026 10:29:32 -0700 (PDT)
X-Received: by 2002:a05:7022:3a85:b0:191:17d6:ccdf with SMTP id a92af1059eb24-1a6cd499501mr8224181c88.8.1793294971752;
        Thu, 29 Oct 2026 10:29:31 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.197.72])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac13ef1d4dsm136995c88.3.2026.10.29.10.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 10:29:31 -0700 (PDT)
Message-ID: <c28ddf94-9bfb-4ed2-977c-4b1731a03887@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 22:59:25 +0530
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
Subject: Re: [PATCH v2] ASoC: qcom: sc8280xp: Derive TDM channels from DT mask
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261029022340.591372-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX6oB9JDziwEZL
 6UfLOetRydX3GXPmbugdbrYq4S+/WVWSPdP4q3M40HFvC7B5DG9wwY49aowtT6mtXyq6OojlRyV
 kTDCBNi79JAN/kkA7X2MIohh6qDaS0yVKKmbE5HxG69fbkua6N2X+dYm7DWD/jok8TbbOhnxZGG
 pDGktcNrMy4GJ12VcY9dRAXSm8T/JrfS6n6TPI59PAB0W4dzegmsE5x220w9MGuELJxkZvkMrHG
 tC40g5rSvXhi8ULyprlZeJ8Ns+dA+Xs23AqyLk0mRtrRLuqf9U0PShKvFiqrVWvxie34yGSZ4Jc
 T9qxUwm+C9BRNRPl4YjUQIqOK9uheWXKeNyL7LU6VPrEj3i6InPIpVlMUKeNrA0tlKvFBsG0esb
 RQ3vpBRpMv6+DbRsr/L8a3zsCh7GAQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA2OCBTYWx0ZWRfX+C9BlK/tmSON
 zQDwGplnezb7wbDfwZmSuUhI6cyC8kfiRibJcmAzZMJsY4Kxdz8p/4QTdgxh2Hz007JQwQDBAw3
 hpNzU6zH4YsjUBcv8S3PGd0gUj0tc+g=
X-Authority-Analysis: v=2.4 cv=LuAHWXdc c=1 sm=1 tr=0 ts=6ae3827d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ud/Gc3SFmwde3Mv7YyqU3w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=tgxUJJewBViNwYeMPcMA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: -WNjXu6u_yymekBdcFmKnvw_O8G4a22t
X-Proofpoint-ORIG-GUID: -WNjXu6u_yymekBdcFmKnvw_O8G4a22t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610290068

> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index 9aae6aadd43d..f5b147962afa 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -303,6 +303,22 @@ static int sc8280xp_be_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
>   	channels->min = 2;
>   	channels->max = 2;
>   	switch (cpu_dai->id) {
> +	case PRIMARY_TDM_RX_0 ... QUINARY_TDM_TX_7:
> +	case AIF_TDM_RX_0 ... AIF_TDM_TX_12: {
> +		struct qcom_snd_tdm_slot_cfg cpu_cfg, codec_cfg;
> +		unsigned int mask;
> +
> +		if (qcom_snd_get_dai_tdm_slots(rtd, &cpu_cfg, &codec_cfg))


qcom_snd_get_dai_tdm_slots() errors are silently ignored here and the channel count falls back to 2.
Could we distinguish the no-TDM-slot case from an actual parsing/configuration error?
This would also make invalid TDM configurations easier to debug.

Thanks,
Prasad

> +			break;
> +
> +		/* Same slot mask selection as q6tdm_set_tdm_slot() */
> +		mask = (cpu_dai->id & 0x1) ? cpu_cfg.tx_mask : cpu_cfg.rx_mask;
> +		if (mask) {
> +			channels->min = hweight32(mask);
> +			channels->max = channels->min;
> +		}
> +		break;
> +	}
>   	case TX_CODEC_DMA_TX_0:
>   	case TX_CODEC_DMA_TX_1:
>   	case TX_CODEC_DMA_TX_2:
