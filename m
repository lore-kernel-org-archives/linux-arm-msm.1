Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792995579;
	b=zOa15TOLsCB5SmzPMOdCwbzKIgSeTZOWqebOLlH+E0nXXEIc0K+E4zJywei50V6NffWS
	 Gnei97ELAmhLbkfb5ooDPynjR0uiifs5qSl7f6oVHaXWKcZT13VeH4MnmLHlh9kUJpfLP
	 Oo/cRmoyL/7JJD5b5YGBi448PE8SVmYyoqcyMMwFI9FhUxnu/C0J0q3vOike0PR7YRAFO
	 lLEJv/IymB2EZDgj9SmZC4Q2hOaQxn8E6ZMMiV09vF5anmvuen6krPVmhlqS80fNvt+Ub
	 HUko2JsIV+//zCYsyh6crrPoEmT5gNXD4/ZhBuzJ5IxGHav4PwkJ6ftaZvrVMyQAvMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792995579;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=;
	b=fOicsS7PV+z7TUb9I+mEw7SBzNME8TsYaBATrWxq+8VxmUMhZXhJNCJoJOmoXmTIIpX8
	 2HYS7s1RPWagIPxDiO4Fmq4gDUKGXJdO2jqQoomJA2e49cxFDw437fHuKOfbYGzqRcZqC
	 1kUTkxlKYLHC1nvpWsLYbyYqNl2LvkxaD7QmWo5GeBFAMiRtD/a02kZsPZG1wTCgCSz6U
	 ILFLw4JNxte4suVPbwqGD2nlTwtbjNV/P/W0UPes3Qb3/xOzErzkiQibiEglB7gO/+WUq
	 5pi/zUmWUVYs7fsWRkeiJGwNFJGQsU8FLQr15NefJQiIZMOTC4g94bpay3dzVpzamBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZOVpBaQG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fHvn2QyZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BE6606A31D
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:19:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82BE6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZOVpBaQG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fHvn2QyZ
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b2up2806372
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:19:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=; b=ZOVpBaQG3lHZACQt
	k2AEhAHWHF+RCP/KHzisSwnkMwidWXGSTuvKMLUdHjjkdKEWUz/LCez58/+8pdpF
	HFIeL27TB2Y7UYHaeobbMWLdgvTaPGxp1uJawsItekSBDj9UE06l2GNayaVxDQV6
	2vBy9k0I4YuzKsxDk4+e6WpU4Tn2dTOywwhIix0FZStOsYzpU5r5/TNpTJHbuKqr
	fX16RR1xE1T4ZeoJX0/nuFeSTF3t1Gi7uK6c03kyVCjefqLA4OL5QyA4O9RDvYja
	NwFozqxFJ6P/SssQlleWF1B55UeSn37eeEiy7erE0O1ELNNbDTtOtGgYAJNXzOEf
	w6NGmg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xn3qd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 06:19:37 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36637676140so4665134eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Oct 2026 23:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792995576; x=1793600376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=;
        b=fHvn2QyZkTr7d/2p8SwxYpT5h/S8FNjZYpi7iOgmkpKOPNCjStqRB1xGI2LoOpsStz
         eWsKUtQQaU7Arkxz9Ofan6K2Rzzt9CEOPAs0rCeZpymyi31sD6tuUhFRi73wknyCl6f7
         WedR1+n54tR7SpZONJ0lEbtL6aqBJGsAlZ3IctYvOrtLqQ+gpLxAg1UppI7wiZPHNC59
         AsCKI2o6c8kJtnPGjWyKC3LRbmfEuGhynDFKpYbIJr/vOSztpRhSXFTgD/Kz8iR8677F
         DuxNVqOSU++HOdu2i232+4rF0oWsNujLX3bFKldL17GeCRWygsuCVLr03IAdH9shpzsB
         8d2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792995576; x=1793600376;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wPQWKP+qPP8aJ13vBCzCbVovXHwFOu7J1CBcKioSk9Q=;
        b=hQ9LvUaxc34bnT1RXwUnl65ArGjpS7Qs3O1Tda+Qz++EvqgiGflctopG/UXO4rmrui
         bHvSLgSLcmEiBMIwaW5g8Ith4u7/twkGCViMkqQcM8m+D+AhMII7aO3qB6ezWf0fQAjs
         v5IkGH8qLX3Jp0QARKzldv+s73W+zU8OoZrwkbQnAUc98/UHZKzFTCO01f3qO0JQEu4T
         rr8hRFTLdc094dQ9S/Ofk2pgByerdc/1U0/8Hub8sFyg0/ymB2F+08AdkbRosUGw4lhq
         kjSgq1m+hi0xvtftwQiqNNj6+HY1CD7/sUWwp7/z+05VxzKDOsT8nJJmvnGlDagU5obg
         v3zQ==
X-Forwarded-Encrypted: i=1; AKwUvBwrWrPIzvOJ/LSLsERXlfYRpMvZDdB+Kw2VhH6aZI9+H9B2ixi5Uja6dDnyoUPDr6kTCiTDOOoE2wX6Ve2L@vger.kernel.org
X-Gm-Message-State: AFq9FYJHE9t6sit94AHAwWySw5Tg50lVBvbllJr+efxTovUPLs9p3ylk
	Lf7hzl1gC5gRsNNuiTTkoyo/7uQSQ3m5JVpatAHx4mCJrl4MxsCAkrvjLg1BDnw5rz2BujV5qkh
	auffev6UQG0CzebNJ52/xwifIqFfqrQVonYRB5DZB/Voni04RfHBrDNMxAmpyc+TTPS/u
X-Gm-Gg: AYBFou2SNFlu+cwAa3IyHgY3ynvvrKBzsYwKI8K4hHJo78bmPqJTtk4foQQPcrYvH0p
	W2pSkth9a4FzOu25dQCEgcV1IQ9gkiZJUzjVVGOir8CDdUJILsTkA7AjArcdceD7K5paIJimJFg
	OExPkWIyoOBo+/1gwXZq1slXOxe8MhbW1aym1s+76slPjarwcVEEaqoYIyWMA8r7MCNioMT2e1+
	2iklqPFFkliFNKOyZyiBrXZQUe0NqT5p0adPbH0aXPwGmZYUd6/XT5ah3+1ulUznwlcD1Snhlpy
	t1vyzyZkLTgoMlYlLNLf1bnXZu7v77jlf+kuJ+TjFq50Yt4iK1FNo+cs5rzrgIRmO2ynB5WlD5u
	dCkTFRaSK/Kc0Va74r++fCH7Pn/lh40HbUMfy
X-Received: by 2002:a05:7300:d085:b0:369:f9da:a70f with SMTP id 5a478bee46e88-369f9daa873mr4931976eec.17.1792995576274;
        Sun, 25 Oct 2026 23:19:36 -0700 (PDT)
X-Received: by 2002:a05:7300:d085:b0:369:f9da:a70f with SMTP id 5a478bee46e88-369f9daa873mr4931949eec.17.1792995575594;
        Sun, 25 Oct 2026 23:19:35 -0700 (PDT)
Received: from [192.168.0.104] ([124.123.198.113])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm41844315eec.23.2026.10.25.23.19.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Oct 2026 23:19:34 -0700 (PDT)
Message-ID: <cfad7934-2311-4f90-84f6-1f4f0fe585ac@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 11:49:29 +0530
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
Subject: Re: [PATCH] ASoC: qcom: audioreach: support multichannel PCM formats
To: Zhangfei Gao <zhangfei.gao@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        shengchao.guo@oss.qualcomm.com, mohammad.rafi.shaik@oss.qualcomm.com,
        bartosz.golaszewski@oss.qualcomm.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com>
Content-Language: en-US
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
In-Reply-To: <20261021102549.411456-1-zhangfei.gao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: yF-Esn1OxR3e6XIBvUZ9L-xHX8PZliV0
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6adef0f9 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=YdEwHcodOreUj24YWHnpAA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=nP5ThTwYepZGQzjsTqgA:9 a=QEXdDO2ut3YA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyNCBTYWx0ZWRfXxRN3E0gqbSa6
 xOChXs+FV8f7dICDetwhTx4wdRl+jD6dcFSRIgbj2dgzAVIPjWgxe0oRlFo2mcau+kTRnjDFS2e
 /CJoA7CnA22m5UN9b+hfqtLXtWe7tck=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyNCBTYWx0ZWRfX8mZyfDO4SfqF
 a6yH2R0U32mTwl50Hp1KJrMoZsrbjM6Xih1xg7DnhfTj7MehGajTiTmpkrLi6npxIm3Te0J9ECl
 W0DG5SKkANQ8ehB8lKBI1tFsFgUVgRm0lJ4cgf2CspXXm1rNzyMJBAL7u/dGb8xlclL9+7HzQQo
 W/mWiAEMubki5yKfFs6juufkKhv5VTaZk+CzfbbMme/PvRwg6KGmPgOZYHPDGBxnD3HrtIGyAZ+
 iHhKiClIKr/vJx3NmDXQU+rLN/Ed4SIgZ8AAUL2kFhOIhGcjGSi9yCSQQTUKujhmBMnOvm7j7y3
 IEeLwia7P3iylMYTZqwFAIQt19HUCDHQiQvl1AJ+sP2zAe1V2dvH0n+qddt6JZd0ChGWz1ffuG6
 ADkMmG/W/V6KAm7vTVRs04qiXBOjmubCWNRl9aZYS4t2ndQuCXdWiXHXbWJBGElprtqvx+mB2t9
 +PkT4OK+nm93VCjUj9w==
X-Proofpoint-ORIG-GUID: yF-Esn1OxR3e6XIBvUZ9L-xHX8PZliV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260024

>   void audioreach_set_default_channel_mapping(u8 *ch_map, int num_channels)
>   {
> -	if (num_channels == 1) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -	} else if (num_channels == 2) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -		ch_map[1] =  PCM_CHANNEL_FR;
> -	} else if (num_channels == 4) {
> -		ch_map[0] =  PCM_CHANNEL_FL;
> -		ch_map[1] =  PCM_CHANNEL_FR;
> -		ch_map[2] =  PCM_CHANNEL_LS;
> -		ch_map[3] =  PCM_CHANNEL_RS;
> +	memset(ch_map, 0, AR_PCM_MAX_NUM_CHANNEL);
> +
> +	switch (num_channels) {
> +	case 1:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		break;
> +	case 2:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		break;
> +	case 3:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_FC;
> +		break;
> +	case 4:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LS;
> +		ch_map[3] = PCM_CHANNEL_RS;
> +		break;
> +	case 5:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_FC;
> +		ch_map[3] = PCM_CHANNEL_LS;
> +		ch_map[4] = PCM_CHANNEL_RS;
> +		break;
> +	case 6:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LFE;
> +		ch_map[3] = PCM_CHANNEL_FC;
> +		ch_map[4] = PCM_CHANNEL_LS;
> +		ch_map[5] = PCM_CHANNEL_RS;
> +		break;
> +	case 7:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LFE;
> +		ch_map[3] = PCM_CHANNEL_FC;
> +		ch_map[4] = PCM_CHANNEL_LS;
> +		ch_map[5] = PCM_CHANNEL_RS;
> +		ch_map[6] = PCM_CHANNEL_CS;
> +		break;
> +	case 8:
> +		ch_map[0] = PCM_CHANNEL_FL;
> +		ch_map[1] = PCM_CHANNEL_FR;
> +		ch_map[2] = PCM_CHANNEL_LFE;
> +		ch_map[3] = PCM_CHANNEL_FC;
> +		ch_map[4] = PCM_CHANNEL_LS;
> +		ch_map[5] = PCM_CHANNEL_RS;
> +		ch_map[6] = PCM_CHANNEL_LB;
> +		ch_map[7] = PCM_CHANNEL_RB;
> +		break;
>   	}
>   }
>   EXPORT_SYMBOL_GPL(audioreach_set_default_channel_mapping);

audioreach_set_default_channel_mapping() silently leaves an all-zero channel map for unsupported channel counts.
Since this helper is exported and callers such as q6apm_dai_prepare/q6dma_hw_params/q6hdmi_hw_params() don't validate the range.

would it make sense to return -EINVAL for unsupported values and have callers propagate the error?

Thanks,
Prasad

>
