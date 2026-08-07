Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8F0841835F
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Aug 2026 10:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786097160; cv=none; b=tRKd6wicjdcj98xeiTRktqIfxDPOaVQIq9DIsYunmLcYeLxDmyykx0cgGzzBjmdrdys16dIHN2NR7gC6plmZZGqoWnzRCK586oAbdjJeTItgVnj3Td94ohPDphiu/CsfBilG9QJS7bufbkqYk7uHkT5g0o0DmB+xPpqyQjjdOkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786097160; c=relaxed/simple;
	bh=KgwvKXAeU1tKqTZ/b4GkpamsRcLVPSzaar6BWABYhfk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nAAYKmsBcHi3yhl1ApCrxdfDA0Ax6j6wASfh9kHPckJU6+FKtjCt65eNQx3c69ejZA1DBx1o4lycD/atzs48jBnXZg+K/9N+UF+FFILzGi3z+qzjJQHSwhAEiuVN5iXxNkJEpeHCBfxOP1Qb25Hh5qpeRB2cZsgSuBIPZDvpyMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pSAYHczW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnE9TNDZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pSAYHczW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnE9TNDZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777iQpS3533333
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Aug 2026 10:05:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	q8nuOJzW+TPseumqr2G9zfr4l4ZosAXff19ht42hACc=; b=pSAYHczWQiBr/bdu
	Mbefu9AD8fgqQK89Ye6eknqaftr+Ouh4XxSZlDXIGLczdLiXaJXK92QNwxLNSkk8
	/ZL3yKaEE3bqGzZCyX1tf2CRZzV6NMdawBlHaVQNcNKm4fVR8V4Pz9NWAZOEBC3O
	SNYVzStLgiyHttdETNqegcH9rhKtGVt41N7Zfnnfxi4QR2y5IWbUx3wrKHMhyMFZ
	QINceboykyG0zKk6268qdPNXvQNn9qw5DPUc8EkZWVUTThlAwXkN83LQfzYA5yYT
	P0PHZD9M7PSH9Yyb5zahu5a9/vEkNhjVH7rfRcsPJ6/H+bZE3nBjVTcA25G3Ql+p
	Vm/7zQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6fufth-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 10:05:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cf6acd760cso38485175ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Aug 2026 03:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786097157; x=1786701957; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q8nuOJzW+TPseumqr2G9zfr4l4ZosAXff19ht42hACc=;
        b=gnE9TNDZpIKHM+kZgWYXVVqb//nKMjl7WyfK3EP2eaeIMLNOBACCMQSgN9EUC9my3r
         G1mfvei481xYSBNuCbG2E9KGackRN1B8gk8X1HGAcygsDPHSl+5nThhaYGlRVoleuD3t
         BtPUSOiYZtb90aQPzX7eId8xLdLDP/RwocSrHquTyyXHSUCbz3ih1nt3vSxWtIbpYeqO
         l6BSyPVJoEDOlCuSnez8y8zHFf88496V875OdvRXCusYWuwO+kRK5pcVvyRRNQJN9tPf
         6t0fQ3OaZLwQkHbp5cI1acXaCBzjxSE6Pv6xJ6NXjdIdaRZ9PYA3eF5tO4U8eMxytxBJ
         xNRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786097157; x=1786701957;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=q8nuOJzW+TPseumqr2G9zfr4l4ZosAXff19ht42hACc=;
        b=YTJ70eGZv9bv7/5vUYYu1BzOmWBSEfTzxtUgJmvnVc1HDJrJy/XYwF7r8b9N5akDCL
         fGU4Ftfd0YPdarFTOrki+uryPqp33sMia+V39dIGfIDHFLrsoIO3VN8H2mO2Ke0iKpnY
         wnM3L+BiVB6cfL/M0BEv7kzBT48Uue8Bj8AyQtDM5HzX6EAdv7sQOEF3HPRr77sGIHZ0
         yQzdrLZRfne7i8efRq3naWEl51VZHuGdEPJUI4U33IoGitkpB8e1qw4GKAyi2hqF2xYA
         CrKtZiqdk9pTkfe4lVSNEW7CoFyktl7GqrMX5bk3cwkTQwCcVMq6ci2dNY7yC5TzEabV
         8IcA==
X-Forwarded-Encrypted: i=1; AHgh+RqhlboD8zSE3MnfDvIc/Bjkw+A34e+QUT7ZLrNvogWm5doOpiBgWaNquHeOjNjJj1eR7LH37cKj4xhhwqbP@vger.kernel.org
X-Gm-Message-State: AOJu0YwUKhM1/zdBuRZrrqDdOIDGjkSf1qlpjTf2AqzEU8daXQPZGj3o
	6HvR2/4rDVEze8RQ+8YtaZj6Zw9NmMmBtcv5TpxCvtS+M4u0R1QfxQfyuk5tQIVePUFl3QEK/aI
	rVsasMHGlO5mcizaYM8u0d3j1dKJyikCbKIgccC+45yzu4KyWoHaCCA/Mpx+DcR/7aT4W
X-Gm-Gg: AR+sD12TaicVIHsbsQOdLwv8TqV6JDiUVmc/acLhBapez1cqNm+qAZkbY2paMGbFGI/
	0A6c+zE9k8IrxOAr3IA9Nq1Q0iSmRDiFAq2aTz2V/bUncrwzNbZcnxTa/Vz97YFbeouQvND+xO1
	jqdeRwdZOrlEsoI5qIIUuTeAAmsoOqfQhjD8F+qgXlNvyamSbnykIEuNAXWdXnHoXIcKjPCnbeh
	nkeGe+EEZx5ekYMn5COl4/HX4+V05am+U8McmgbI0MkjOenwrwfody0RoRyr+LYu4f9YlwkyWxS
	/bt933tH0e5wlAnyn3qoVRr6GmxXz4fwCbacGrYhlGZHWO/p2oSJXrbT8WPQlLhM7/utSQkUxkK
	Oumi/x17HDle2y9hR301tmDtrXdRzez7zYTkrXwg=
X-Received: by 2002:a17:902:ea01:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d0ca712ed0mr225824575ad.3.1786097156580;
        Fri, 07 Aug 2026 03:05:56 -0700 (PDT)
X-Received: by 2002:a17:902:ea01:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d0ca712ed0mr225824045ad.3.1786097156142;
        Fri, 07 Aug 2026 03:05:56 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d14d57fc23sm6650515ad.31.2026.08.07.03.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Aug 2026 03:05:55 -0700 (PDT)
Message-ID: <07f94571-ecd1-40a2-b47c-a732cd439b54@oss.qualcomm.com>
Date: Fri, 7 Aug 2026 15:35:51 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ASoC: qcom: sc8280xp: configure codec sysclk for QCS615
To: Le Qi <le.qi@oss.qualcomm.com>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com
References: <20260807012450.1038180-1-le.qi@oss.qualcomm.com>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260807012450.1038180-1-le.qi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA3NiBTYWx0ZWRfX4Y+h+Mpf/kh8
 VOTEhR6SO2LviJD2e+OyEZ5tpX7UCwmYuZWS/qwA9ze0xNOGLS0CiDuOM7AhI6/sShSQqJnSO6U
 eRxOEWjn1GjuLt272RySJSognvqlB9hnUroh4p4hrgjedYDQP/8Q9Nnw6BsJdErh9rsEvkUmyBl
 Mfmo0w4u9wAA9OB0m1tkdOsF8yhXlGbJsqK8AiLG1L4XMZFMVygIOQoWUIqqZnALRDMQdV2arbM
 eKkZmcQWREcpZUvPf2iXn6U9ygJlFZVIKZE70EwJopmzttZ6RLkvatm1zU1+o+vBKWXhVEJgbia
 xPGYdLo4One0Stq+49xXPNAxfYy91tUStgVgBZ6iMr5kxzlHbBLktyoWFqCh2SH+Tl1po8f0vaY
 WK8ylczkMNm6sY3QeEMTwem/UMVWjnf9PM0DUezqzNWG+3godtyLx2b0gZvKff4MVpw1HFtzc+m
 e/0iwu6bb5lMgRsksLA==
X-Authority-Analysis: v=2.4 cv=DvhmPm/+ c=1 sm=1 tr=0 ts=6a75ae05 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lATBp56xj2U5aXaEndAA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: mJAQhNjnJkutXglp-P9V9wvJR_knhtyV
X-Proofpoint-GUID: mJAQhNjnJkutXglp-P9V9wvJR_knhtyV
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA3NiBTYWx0ZWRfX35bBjVLlGxS9
 RTPCRYniZoZZMxcO1oBHLpDEGsep7WfSTp9GDzthCE2Hge+gMLZ4IvKF5+cSaz+l3D8bIQ/pk+S
 cehaRTvAG7bNfGtz+f4CrGzoPlaA8Hk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 suspectscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070076



On 8/7/2026 6:54 AM, Le Qi wrote:
> Continuous high-amplitude noise could occur in the DA7213 microphone
> capture path after a Bluetooth out-of-range/reset event followed by
> reconnection. The noise was present in both the raw ALSA capture and
> PipeWire input, confirming that it originated before Bluetooth
> encoding.
> 
> The codec already obtains and enables MCLK through its DT clock and
> bias-level handling. However, the machine driver did not explicitly
> configure the codec sysclk during hw_params(). Enable
> codec_sysclk_set for QCS615 so that the DA7213 clock source and rate
> are configured before the codec power-up sequence.
> 
> Verified on QCS615 Talos with repeated Bluetooth disconnect and
> reconnect cycles. The noise was no longer reproducible.
> 
> Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
> ---
> This patch depends on:
> 
> ASoC: qcom: sc8280xp: enhance machine driver for board-specific config
> 
> Link: https://lore.kernel.org/r/20260727151230.408122-4-mohammad.rafi.shaik@oss.qualcomm.com/
> 
> The prerequisite patch introduces qcs615_priv_data and the
> codec_sysclk_set field used by this change. It has not yet been merged
> into linux-next.


Drop this dependency flag, as the change has already been applied.

Thanks & Regards,
Rafi.

> 
>   sound/soc/qcom/sc8280xp.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index cf272d0612fe..8d949e4dec5b 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -306,6 +306,7 @@ static const struct snd_soc_common qcs615_priv_data = {
>   	.driver_name = "qcs615",
>   	.dapm_widgets = sc8280xp_dapm_widgets,
>   	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.codec_sysclk_set = true,
>   };
>   
>   static const struct snd_soc_common qcm6490_priv_data = {

