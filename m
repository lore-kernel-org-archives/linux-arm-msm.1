Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8C1381B07
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785366080; cv=none; b=OT1PUdhgTa30HBi7o0VNvO2D9Vtuvc3ScQIxltCHuuewNUughkPAOee9NJ4AgKuETjwfK19kUF56ApIF7G8YVhnLuBJsdCF3yxMlIlXVZ2NWM14wulM3JddA0CUJQm8P+Fp5HD4elbRfx9Pw1277LGkV2qV/A2/15rNgCzjRfpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785366080; c=relaxed/simple;
	bh=/W0iqw3/M3QMft51dUEfHEqF1II07ZJ2eNmA+BdjdY4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DiWwYvb91b3cIUWRnlrn94eeWi1jIosWUOlOIlOazv89LkeZzaxuR5RLYGYwCEWWVSjUSytKVuH8ckGEUglMm1GIKaueXq+bcVRjU02LDpXWc8UYc0TvwU+iNIl3co1w2+3DcmWfBogagcfKRZyMXIKCAq73AC5wZ2mG4yqIvCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W10SSzvi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Eapamsn+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W10SSzvi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Eapamsn+"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TMnegS3091002
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cWecXQ61KpPhmr8++6nEPYsLAmLfDOY8W1ybUmald0U=; b=W10SSzvinYOb7lM9
	cu4na5C9vRXmzJynwtXj6CiAbx596yBSKvnl/uRb855OpNRwm7zozpUK51NeqSTL
	0Y4cNEtXRV1De0d3iOZFLWCRiCY02ylGkLFKpim3sgfnFaVbG9WRnmBfcHNVeV6m
	938gLqqfMh43NhCFfp+znmY00/sX8x/wKPPPq83lJE9QqPiXovKuO22wyGiZyPSj
	rtbyTv9f8wvodZQ0Iea4DTYC+rNzxfqzNnP5sY/kd3/+y6qWawSW6Knb/awrneAk
	OvLZKL50FLGjxfdB9XmECbxPWSRDqk6kfoVvguuE1TPS2RQrwf5+eA/UEhAuWU02
	mOdpvw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqtna811u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:01:16 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1b4d961dso1808231cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 16:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785366075; x=1785970875; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cWecXQ61KpPhmr8++6nEPYsLAmLfDOY8W1ybUmald0U=;
        b=Eapamsn+BiYvY9/WaLeQgWOKE3VBjWfhHXkodANgHugZZ6VRm27K1E7O6z567jBYif
         hsyl/d1+2KlXF3y3DPJtOY/8NwAteFM++Uf8/Z3W1QfpPQXp0ypA7UOzXsrYgkP9744i
         yNSUtKY1jCNz4FhrBjJp9Y0cBt27bPyNC8utntNsgJPflP0j8Ygzca9u2T/aQ74GU72E
         ElzLIdrYAMFcNBVWDqQUuGbD56PkazCkO1/hCtzkhSgZ1RI6decBSNn0nWukvVK3LFH1
         /ApdKVCyPBa5LPCTthdMqrW3+kkaqKdnFR95SNgYh4BYrx4SUPdSm40ERpfPi3CK9Jwk
         55WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785366075; x=1785970875;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWecXQ61KpPhmr8++6nEPYsLAmLfDOY8W1ybUmald0U=;
        b=VqD9MrxaNyPqIv6S4o0H+GTWBLj1s36bKE+/i67Qrj2TtfnTJvltqOGijoXWXtPt/G
         13ClAhaQ5aA/HYwCMpy4bv1m88xDbBkEq/4LCmpBkQKPXyOSC1nKwD9cdo/4b1b0rQTh
         i/fLBz10Bm98I2XB++Mhsu6Kg0dVsHawJh7Q54IG417sPhUIHZ4RdunEt3JokTE6ZaYo
         biLjucGFJ8m9YCADlgU8XE5hXnaViwJkTJ2ulJBgiZJp9AY9Rth8YMz3WIwIXWMjeZNy
         cYL/uFvIZZ75ORH7fqVmPz0vyhkuksIjmczLJg64VbvQ7iZucvFvFB8V3DClSe5xnLaZ
         CJgQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro/8gAy8PYT5Lq2n/pt9cNgO4ltd490xs/ydqynj7/ovZ7SWRoIWxXormmlqCz2GPobXy3odvuTbS8Q0da8@vger.kernel.org
X-Gm-Message-State: AOJu0YxAal+UuM1387HCT8TN6/lGwruBvxTOhAwQvM3bnc5eUZzSfdAh
	duMPkppNzL8YP7lTwRbWFijrjgpepzW/1548+xXG5zhh/W2GYiKyKl99W25Pj2v7jXaNsn68DSB
	wvZE2OCP4jFhYRMZbq2xRt8VEYaTqteXEqmwm6+NTwB0DM/kh+zCBoj0hFcQyYoI3A4PPC3s9NY
	mg
X-Gm-Gg: AR+sD10DEj8YloQVPIrc/Q/EjpS82HeyQPxl0DzGpNFWKrXT8/Ajafmgm/zrRzlaL70
	HGMzug7brNusrT302Hyxh07bO1+jd73jGUma1GMpGieT5EbWBlTEqRW4tOqPQhopEPFVYf99aMn
	A+nB86SAzW41i/g1O46Llb34USuXgY0hsCJEeDxVK0J/oBCEpfi+7udQWmGh2iYBXU0m3kqBKZq
	1vjbpih4CQFBUJbkJSm+aDTVFdQEc0L/fE7FY7tERx85ycS946xL15cpDC/zzXX+uISCZIbJ/bA
	+AKPswmyJEagoZbk9hS46WkP4oIE3eqTrBBPv7zPWZaWlsQdFxvV8gaAdzz6+tW6+2qd10Ph6RN
	oYP92O8njkp1I+/e645wDOmM7gt8=
X-Received: by 2002:a05:622a:5c12:b0:51c:291:82eb with SMTP id d75a77b69052e-52b391d004emr2670571cf.14.1785366075258;
        Wed, 29 Jul 2026 16:01:15 -0700 (PDT)
X-Received: by 2002:a05:622a:5c12:b0:51c:291:82eb with SMTP id d75a77b69052e-52b391d004emr2668761cf.14.1785366073670;
        Wed, 29 Jul 2026 16:01:13 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fc8934ba3sm98045f8f.27.2026.07.29.16.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 16:01:12 -0700 (PDT)
Message-ID: <e30d907e-19ee-486e-823b-df86587bb724@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 00:01:11 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: codecs: lpass-wsa-macro: Fix enum kcontrol
 accesses
To: me@dawidwrobel.com, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260729-worktree-lpass-tx-macro-enum-fix-v1-0-0cf02c681332@dawidwrobel.com>
 <20260729-worktree-lpass-tx-macro-enum-fix-v1-2-0cf02c681332@dawidwrobel.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260729-worktree-lpass-tx-macro-enum-fix-v1-2-0cf02c681332@dawidwrobel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3MiBTYWx0ZWRfX1eKt6+mG2xu8
 VmEaQL+rMwSf4GSyCqMwCnXSDPEFOU/gFa+l/EWBl5M1rGNPTSs4ZRIm8Bdr4/wPlIHmlH7Nz3X
 bZohCWSmhc+Xg4zhpAqcAV8U0C4L6Y9sJLl1qTkrE7NUAUfiOXkdmRXfkeNpbwpwLJLjroj+bbx
 gW+kr57O52T7BkrB+R3LFLErbkYTOHUtCyO7t9f3fEnLSfdoyfkonpy/LgZhiHeDjAkRwwxLT0K
 pP4w1oU08mYkPDi2t6sUUIzz12ndo9cs8VY+056FWQE1e4JXBLFZOMoF8zqxHzorAVCTWqc321R
 qRhNlg0r8gVJhOACZipnrkxyJKe5Qg9LgIOnDH/3tq7yHUY31clO00z4M8cEUfB5N8ZD5VNCL7u
 gsIatRqBqBj1erZEe62JL81iYNXkq8ehha65N9HO4BdQgq/jE55chkk9AxsIwMZl3xJa8lohkY8
 SI3lyJIna/nHhDtA/mA==
X-Authority-Analysis: v=2.4 cv=BI6DalQG c=1 sm=1 tr=0 ts=6a6a863c cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=br21HGidAAAA:8 a=YbeYtx8zbnnq41e-qZAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=rq5_1Q1BYlbxkLLkNd_B:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3MiBTYWx0ZWRfX1XvB2zE9lcni
 DoU3CcM6pS7i68NIBDeov1WLeMvd1kLFIyeEaNdHlSkfRzwTDRXzA7d7fiMu4kuRr+oBOlXSx1M
 ryEhbtelO+Q3kTwfSrR/uIo2bdTHzWk=
X-Proofpoint-ORIG-GUID: OX7gyXIeunTuvEAa9NKCIJoflPAsUCGj
X-Proofpoint-GUID: OX7gyXIeunTuvEAa9NKCIJoflPAsUCGj
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
> The "EAR SPKR PA Gain" control is enumerated, but
> wsa_macro_ear_spkr_pa_gain_get() and _put() access its value
> through ucontrol->value.integer.value[0] (a long) instead of
> ucontrol->value.enumerated.item[0] (an unsigned int).
> 
> This same pattern was fixed in the sibling drivers by
> commit bcfe5f76cc40 ("ASoC: codecs: rx-macro: fix accessing array
> out of bounds for enum type") and
> commit 0ea5eff7c606 ("ASoC: codecs: va-macro: fix accessing array
> out of bounds for enum type"), but wsa-macro was missed.
> 
> On 64-bit kernels built with CONFIG_SND_CTL_DEBUG, the elem value
> sanity check catches the 4 bytes written past the enumerated item
> and every read of this control fails with -EINVAL (access overflow).
> 
> Fixes: 809bcbcecebf ("ASoC: codecs: lpass-wsa-macro: Add support to WSA Macro")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Dawid Wróbel <me@dawidwrobel.com>
> ---
>  sound/soc/codecs/lpass-wsa-macro.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Thanks for fixing these,

while you are at it , can you also fix wsa_macro_rx_mux_put too, it
seems to suffer the same issue.

Also can you add CC Stable.

--srini

> diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
> index 5ad0448af649..c88d13c0770b 100644
> --- a/sound/soc/codecs/lpass-wsa-macro.c
> +++ b/sound/soc/codecs/lpass-wsa-macro.c
> @@ -2064,7 +2064,7 @@ static int wsa_macro_ear_spkr_pa_gain_get(struct snd_kcontrol *kcontrol,
>  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
>  
> -	ucontrol->value.integer.value[0] = wsa->ear_spkr_gain;
> +	ucontrol->value.enumerated.item[0] = wsa->ear_spkr_gain;
>  
>  	return 0;
>  }
> @@ -2075,7 +2075,7 @@ static int wsa_macro_ear_spkr_pa_gain_put(struct snd_kcontrol *kcontrol,
>  	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>  	struct wsa_macro *wsa = snd_soc_component_get_drvdata(component);
>  
> -	wsa->ear_spkr_gain =  ucontrol->value.integer.value[0];
> +	wsa->ear_spkr_gain =  ucontrol->value.enumerated.item[0];
>  
>  	return 0;
>  }
> 

