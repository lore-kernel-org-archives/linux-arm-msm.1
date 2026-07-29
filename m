Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A5F3D566F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785366131; cv=none; b=Q85fy1GBYg65svjSwxBZOFr5FtZ/WjE8HMw83vf7GeY+Aejz0i/55Pu51JOg8uBIJFoofwDjRgRQbOXWVmkm7bDS8fzH4RT1NQwjFQL6yuHgcxzYa3sxE9pUHCoATNhA5XeqavNhJI5t3iBgn/DKOiqySWLjI4RbINqqL6jcqps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785366131; c=relaxed/simple;
	bh=BrEvI1zwzB7Ptq+Vlrj6FhFSru4RlM2jJ4WVrQjMYKE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UqXN84ttj1tgbEjXdRTzVyFmpCETwEn2sabf+avTYFWxWSBcG/iAKrPL8x6PzRBPk1bOUS9w4f2UAuhHrR+1Yq2Om4FWKMC/uHfV9C2GTw/G3KViFaxRKXBRt1dUklZuDE4y+D6s9F3KI0U2mdfjAVo7wK6ut1Sp7U4x28azsCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ed2gkkWZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jCVeOzSM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ed2gkkWZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jCVeOzSM"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TMnc853090990
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PB1ac6uzEAO3h+Zzhmz7/ZBVfd0Yc1MPeEFZHK2O/MY=; b=ed2gkkWZ36NVWa5y
	FeBLRGYO+UY3GnbbnWnYSqnV7zgprIi9/rI1RVcC90rDnmR1alMT8R4ZYX6cIS7l
	ibJlx8TZnO8mMaguI1PXYAu6/rJABBmCamd7VbFWbugdV98jIIoSi53/LaESTUiv
	OKrDj7EpCO/OjnhbIlq/kBe7LQs7MJj+6J0uk2ehBd8NGXUhkSc6ESXstu2kfCOT
	47WOhS1ozvFnoZK3hZYsSOvFlcdMAoeZYJ2qKBHDUWx4Vu8iGwlenVQIMVyxNS6f
	MN/JSYNbva2PQXrD6HVgxaaYkKZ+T0AujbsIyO1DA4dYWLnbmDN6YKzP+/mO6xeD
	SFQCfA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqtna813x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:02:09 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9743f0a939fso266987241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 16:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785366128; x=1785970928; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PB1ac6uzEAO3h+Zzhmz7/ZBVfd0Yc1MPeEFZHK2O/MY=;
        b=jCVeOzSM2AQRbQNqWloE5N3DASTTCyl3q4HJUTIWnJPAkyDZhORUFp+HPT89PfKINB
         tGlKhbqPphSr0OTP5MIfIOgQLuxJNhKsoBuBx7vKgI+ya88ZejvVH/t6l4pG4ufR9I64
         m4eiN5jlDvj7BWP5cLRPZIFpekeqhrjh/7A7OFNX089z3mMXAJMaeTL4rZDwMtOLP/rt
         gfP1SXM5+PbeGezuBq/AtYGaJvv4O5wYOTRY4pyiDNkbQhet4PPx83x9qp0VnmvF/I8q
         0K8pKXmbOWU0Yqy9BEI5Km3QXh/z1TnemEZcYDUsCeP9QS86JDS2QycSjg/qEhEBQQZL
         wdkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785366128; x=1785970928;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PB1ac6uzEAO3h+Zzhmz7/ZBVfd0Yc1MPeEFZHK2O/MY=;
        b=R5uGCIRBSgI45ViOlGS9rqEv/jQ2G9NuEC1x0xkFhXBrZjSkCVWwiGgveNhKLwQ18E
         kWVmtIK1Ceaqdsc941T45bf9QSMVnK42EEIWxZnOEE6TTs/8t246pig70qJZK4Ql2lBS
         C13wO/XkhTv6zOYCrLv27DkoGQ3hdYb0kWrsFFC59hITb0AKK/orCcrwTGtoe/YbCykc
         7AmpAmJQ7I0iT0pui8Z8APJu+fUdIYdGC6SaY3pp1B9Vj2e+DZfrWx6a+66cg7tKrDhD
         +7RRq3HopjtQCZ4rQj9tMs0U4uOmDuc1bxRv8XZIF7rJDV/krpGsubAFyuD37dBxzG/u
         Hrkg==
X-Forwarded-Encrypted: i=1; AHgh+Ro4f66+ClC8Kc6ctS0ZCIpU8vV8Pto3kW16umJyKcWa9zOoy71UMeuZPl45vgt8uXfaNBk+zhglPS1fSkCA@vger.kernel.org
X-Gm-Message-State: AOJu0YwnmcXlPgqyHyyPP4ZPNGeSFn9PA2zvAkHkjvnDc6NH2QTtl3BL
	FEnkyJae+A4mm2EdkMnplvqIkJerbCpgxXggz7b8cv8ivCMoNOiIWfiu0GbhwVVb+XxileVE73G
	2eidLe8XH0fI5YyquRTk/Wk/xSepoaPboM3a42ziplYDDv2dVch0L7+IbcsN3UayEtIC3
X-Gm-Gg: AR+sD12oABRDmcQx+JAdeDXOL7Qd5n0qbyqel6LNYtC6XqnnCIG4FbQ+oZC6vGaWEvF
	07gLThywN0MBNrIvSe3N5WPBiNLRQC7RfVvU9UZDL2gVhyxUtIgyGOy1krNS+385pdwxUNlgA+x
	HMLdyiPyRurHYV/Rxu0+6PUT1TuczKSun+FS2C6S1dVlToqH49FidAYKTK2Mfe/URToFIhOq/cU
	PelA1+eccLjKeLFxQY7byvYdYykdGYpTrA98vCcBf92wv/SmW1cPqO/LbOmGMr+DRX2xEI7eWBF
	KA59KPdCJSsyLaSUhqaKkpfVJIHp9lMgiKkQd0GqZ6yo3jE5H+/dKGOJ6i3Cc8v1KXDZQi8BnOq
	IYz5NbUg9n8SjCoOhP5OGLjL2WNQ=
X-Received: by 2002:a05:6122:3118:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c365ee550bmr46273e0c.3.1785366128414;
        Wed, 29 Jul 2026 16:02:08 -0700 (PDT)
X-Received: by 2002:a05:6122:3118:b0:5bf:a181:d46d with SMTP id 71dfb90a1353d-5c365ee550bmr46229e0c.3.1785366127936;
        Wed, 29 Jul 2026 16:02:07 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fc88e3c73sm177380f8f.10.2026.07.29.16.02.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 16:02:07 -0700 (PDT)
Message-ID: <8a60aef6-018f-475e-af0b-4553bc89f86e@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 00:02:06 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: codecs: lpass-tx-macro: Fix enum kcontrol
 accesses
To: me@dawidwrobel.com, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-worktree-lpass-tx-macro-enum-fix-v1-0-0cf02c681332@dawidwrobel.com>
 <20260729-worktree-lpass-tx-macro-enum-fix-v1-1-0cf02c681332@dawidwrobel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260729-worktree-lpass-tx-macro-enum-fix-v1-1-0cf02c681332@dawidwrobel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3MiBTYWx0ZWRfX0ztVrMOA0Gli
 GazBGbwe9to8UlyqUJqsY6lsLjW6QR+CaCTG12vEYNXApNTY0NaMMZi6p0zWUBVB9Pq2v6uVAuF
 7o50YN25RZM602Ql6i4qnrIXrnoAkFfVmZBokpPOBnYmum/4Pl78RLFJMhg+dY88Yse2WZ72bXd
 IHw3gLOzDCzmvb2Upv225+wblfoAEatJbSnz5uXdwWaiVXHSFwNrkVsMrjaqptgTg0iM1EbZlew
 thiT9OFLouwdTN2UXR9X939x1evG4QE5/qpLBUtcENCQkVTrTnjUbKyxMcHbrCn2GWHpk0GdJ/f
 NsZV0zETGabATWayygRtLCJeUsWtwxIhhxt9ZDvWkytjKSDniImHx44aT3qhTqpaBtsWz8fRbGy
 pHI7R89GLyjZ6zGA5q8HKK9DjnbJ05DMYpPD/NVmLKjEHeoCWea1UFuaXsw3dbr+qpsnnLgmJTx
 UlksHP2zQCpF18dyayQ==
X-Authority-Analysis: v=2.4 cv=BI6DalQG c=1 sm=1 tr=0 ts=6a6a8671 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=br21HGidAAAA:8 a=EUspDBNiAAAA:8 a=l_TLitfX6ivw0kWHOzAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3MiBTYWx0ZWRfX0n71r/AGT+Gk
 b1nN/cGc1wbEgOaEG8M1KTQEP5uUwdLpmB/eL0Riz8+kG6Ii11iHvaefOXaCdft5PA4/rKzNO6E
 JE3PADPQbqp4c6xSyXmOoCtxaY5JqMs=
X-Proofpoint-ORIG-GUID: l5DQ607tgIyRzD2F8U_Hz_js1pdY1nyl
X-Proofpoint-GUID: l5DQ607tgIyRzD2F8U_Hz_js1pdY1nyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290172

On 7/29/26 8:38 PM, Dawid Wróbel via B4 Relay wrote:
> From: Dawid Wróbel <me@dawidwrobel.com>
> 
> The "DEC0 MODE" to "DEC7 MODE" controls are enumerated, but
> tx_macro_dec_mode_get() and tx_macro_dec_mode_put() access their
> value through ucontrol->value.integer.value[0] (a long) instead of
> ucontrol->value.enumerated.item[0] (an unsigned int).
> 
> This same pattern was fixed in the sibling drivers by
> commit bcfe5f76cc40 ("ASoC: codecs: rx-macro: fix accessing array
> out of bounds for enum type") and
> commit 0ea5eff7c606 ("ASoC: codecs: va-macro: fix accessing array
> out of bounds for enum type"), but tx-macro was missed.
> 
> On 64-bit kernels built with CONFIG_SND_CTL_DEBUG, the elem value
> sanity check catches the 4 bytes written past the enumerated item
> and every read of these controls fails with -EINVAL:
> 
>   snd-sm8250 sound: control 2:0:0:DEC0 MODE:0: access overflow
> 
> Fixes: c39667ddcfc5 ("ASoC: codecs: lpass-tx-macro: add support for lpass tx macro")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>

CC Stable

Once added


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
>  sound/soc/codecs/lpass-tx-macro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
> index f7d168f557dd..0cbf50647ff5 100644
> --- a/sound/soc/codecs/lpass-tx-macro.c
> +++ b/sound/soc/codecs/lpass-tx-macro.c
> @@ -1075,7 +1075,7 @@ static int tx_macro_dec_mode_get(struct snd_kcontrol *kcontrol,
>  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>  	int path = e->shift_l;
>  
> -	ucontrol->value.integer.value[0] = tx->dec_mode[path];
> +	ucontrol->value.enumerated.item[0] = tx->dec_mode[path];
>  
>  	return 0;
>  }
> @@ -1084,7 +1084,7 @@ static int tx_macro_dec_mode_put(struct snd_kcontrol *kcontrol,
>  				 struct snd_ctl_elem_value *ucontrol)
>  {
>  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
> -	int value = ucontrol->value.integer.value[0];
> +	int value = ucontrol->value.enumerated.item[0];
>  	struct soc_enum *e = (struct soc_enum *)kcontrol->private_value;
>  	int path = e->shift_l;
>  	struct tx_macro *tx = snd_soc_component_get_drvdata(component);
> 

