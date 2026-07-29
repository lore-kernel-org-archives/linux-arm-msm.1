Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00603FBB5E
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785366714; cv=none; b=fEsyCNigoX4qSvo9YocWbCs75tHkD5yuT5VSLG0WXvZpkFJEaDFwxcznEPLwBvU0rXpFYQgup83FZKQRkhBKicZeUp+zWqaDQ99fKI+zsU6c4RdL3z2OKpSu5vLJM1HXz863a2LC8Dzgx1oG6x1ZVNcmFZzhex8urdkXXGuu0S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785366714; c=relaxed/simple;
	bh=mX+uXiXqmR3+strMhFm04SU2uyDc7C91wtsmT25MVT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ki71p6zt3Bm9y46fWQf5wwrnAfr0/d4BS0c9W2gDOax3C1obr+jitXg0/tNBPCXYuNK17dieC8/UaNdo3vxKclEERbPopWrh9wBWGSBbE594xJGMCPcblDl+ZtGl8o+oV0NBYOsxUuUISrPbO21N0lAJhJWw4NByEqgFQc2WPLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J9l+b2Ao; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O1fn1Zbi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J9l+b2Ao";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O1fn1Zbi"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TN9S2N3134252
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8Wa4zOrWIiejtu6vYmYh+QujFwCPkBq+i8oI0dFrBAg=; b=J9l+b2AoygGm2gwY
	OZncAuAapuZSzxSi03eA3UGAp0FQp01EeYiCgLoR0vSPXmqXmiJNxf5QL9692E8f
	xlJdKkLNl+T5FRYnz8yGC6lxR5pzsyEqSbThJXSl4bjVgDSTmuux1Z/4DFKrgoSC
	ytuGxGe5/Nqv+lvQOqsecDP52drH6ICIaTPLwpag79zmPo31O9pPhQIA0+c5NS8G
	ofjTRQ7rtskyflXtqC66ETzpSLSNnyjrNJKJbP+VchbhQbVyg299Q0gcbapLZW6x
	6qy5ArEyqjrziPZCwow3CUa1/fOnsvqEDLjbqO0ygC1Nv1tPTb6OciWKaNP7yp/A
	w4Ojww==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqtxq808m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 23:11:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c20762d21so18964341cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 16:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785366710; x=1785971510; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Wa4zOrWIiejtu6vYmYh+QujFwCPkBq+i8oI0dFrBAg=;
        b=O1fn1ZbiuANgWVgennbbQ4rR3inAWlMqoojv0IYOPPD3PtOdQaL2RoYuiZXHOsR8fr
         VzRBQZGsecA3G34MJR3MvFTfLjLOIuvb+Nd7OiSsgtdpoSjyI6cVmTvkZuSo2YpnwU0Z
         Gc0Wn+CDslhPSndkvfCuBAeVK03ORw+7AY/DfPyG+KfVRBVIS6kWA0dj4sNERm1uwFPn
         k7z8DSwYJL9/M5HgfKIVdsFPZOlytolKt13Vy3F6J5wU52UyMzo16bt8YeNBfNgnxmio
         +udG9tpmod0rEwLIMxMT8KMt1kucOsV609hYqvdaGkfgCnxrQ8G/R3ZOWc5KYv+8yTEN
         ltgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785366710; x=1785971510;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8Wa4zOrWIiejtu6vYmYh+QujFwCPkBq+i8oI0dFrBAg=;
        b=XcjW4Qm65dRyCnY7za/wMV7IHGCxMWSGCS0OI3DssoAwICEJAPs4Nq/9fsocZ9j1Ux
         F2CKx2BjQUcktT4VjHTkvOzZOHAzYiKwHYO7HaOyR38YQnID8dfDUgs4lXbBi/zosCsG
         Oz5HyqlwiaLYGvJENt7FCCmzOjLqGJ4kl/ho/s9hFUBinPX/mZN5W7ko6wknQcoj3HgE
         PFyy2CyIcIDujwixqbFL0O/x8XGeZBKuXoOK47XCA2Z+0w8pBr/zweKjuH9jvue/Fiv6
         4qY6XRAYq6WF7qnl9niBo4ng7Qxiua1RU+FszR0czftQIDx9rIq5zjwqoQUvvdkJGBDZ
         3EiQ==
X-Gm-Message-State: AOJu0YxuoHbLUho3xvzKmit4T3WH/JWLCN9J0psQBBvcv2roDjrKveJi
	w8ySDzy3uze8S4KS3mEOBykN4tpTkAYDzWAEV5ZB6PSlaX4D5B6t8eoZ01mekItVaI2IUSi8A2I
	PND7kXkKy9UTdZfeLtxxwUUt2A1dMtHYJMcj3TvbqgLYtU7OIYogU7v8Kjzq2P0tOzRsJ
X-Gm-Gg: AR+sD114lXYvwrKv9ZLMS7r38VIiMnk5wuFM8f9389SzV9M3JsKHhyX4K3NktEsOBxd
	6qlREuAwGykNfIgk8ikZHhttmbWdgiCz5NuoCkzERBYUzb4giJfAwpdlAt+CBklkoMm6MGxVWSR
	5kVzl14soiZa8iOO42fW6TYbNMm/79q9kJZkqFU7FoJvhBWYVw898p/tPNCokERLoTYckJhwSTd
	zM2z4rCD/MlfgWvMzz64+FJyIepZYT/UVfSbjJZOTHWT+xHO8zg3UQXQQrg1D1g8e6KbeaezdEx
	hROQB+Go2i2NzWs6YjoDlo1YhBiXXR033/ZXf8kXFPfBEjoCJD3H8vkWMqX3WmwH1Zb2wSlLVuY
	74+FjmhXmklG/ldzb7lLEoh/4hIU=
X-Received: by 2002:ac8:594d:0:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52b38497620mr5750661cf.33.1785366710549;
        Wed, 29 Jul 2026 16:11:50 -0700 (PDT)
X-Received: by 2002:ac8:594d:0:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52b38497620mr5750301cf.33.1785366709984;
        Wed, 29 Jul 2026 16:11:49 -0700 (PDT)
Received: from [192.168.68.105] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm184393f8f.22.2026.07.29.16.11.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 16:11:49 -0700 (PDT)
Message-ID: <667133b5-10c9-4007-b5db-27e553dd5034@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 00:11:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] ASoC: qcom: sc8280xp: Add support for SM8475
To: esteuwu@proton.me, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
References: <20260729-sm8475-asoc-v1-0-3edad8aa7628@proton.me>
 <20260729-sm8475-asoc-v1-2-3edad8aa7628@proton.me>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260729-sm8475-asoc-v1-2-3edad8aa7628@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5t5KTvx9KVkKQiGqxR4bybne5liBj8XY
X-Authority-Analysis: v=2.4 cv=Ou1/DS/t c=1 sm=1 tr=0 ts=6a6a88b7 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KGg2J5DcaUvRLS7BGUYA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3MyBTYWx0ZWRfX9qGApGZQ0VTa
 KDNO3rO5/kPMbViYbrR2nBSeu5lGdcOZxeEUFCqscDItZ0DwEMmJNO/hNmRcWd7M4laLQ4ZYmAk
 Asl4SiICEEV2OIDNed55tgwacnsef7s=
X-Proofpoint-ORIG-GUID: 5t5KTvx9KVkKQiGqxR4bybne5liBj8XY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3MyBTYWx0ZWRfX7wplam0jVeyx
 UnivWuz0mrQ0XdfYfzwxCSCi55qJyGf+hhdjZw3QBiMe5f62VO/yELuKNa7uSmOehD7tedNCDKG
 JkyKnhUkLiE4QRiCnf7mv2FEvBrdn7O/6GCNs6Tx5Fs7EzW+3NtAryhapvyI+KOEuTWLBNh5wgS
 0qYwZtvjsSjWheoM8hrNYtzT0eXq0rhItVFg0CyBoBHAjH1a5IQRVifpGYG0Bmoq9MQOzFHNnvQ
 aMsnHgK6b24LJvJsQnqNmUkwLMIg6emSt7oUiTG1JHK5QlIIKIx27ohOKII7jRkD2cjQbTiIXE+
 sQ2x4Psl4hTgBoJ+/5hPhWvnzOyIGPIsn9jyCEWmn8fiTmQTCMFiQxT4vhndhcxNimX5wwUuNAN
 QI8FBubkG8Rdww48SwqpvfXf8jsxp53X/S5wX0mCL314N5Q/mxION4yKjr7UzoN2N/2K6RTcwLx
 3viPH7IF8lXd/PkmtCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 bulkscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290173

On 7/29/26 8:31 PM, Esteban Urrutia via B4 Relay wrote:
> From: Esteban Urrutia <esteuwu@proton.me>
> 
> With this, SM8475 topologies can have their own firmware folder.

Patch itself looks sane to me, but the commit log needs bit more love.
Its too short and does not explain what this is platform is supporting.


Once fixed.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> 
> Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
> ---
>  sound/soc/qcom/sc8280xp.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
> index a9304784d41e..f0f3cd8fca38 100644
> --- a/sound/soc/qcom/sc8280xp.c
> +++ b/sound/soc/qcom/sc8280xp.c
> @@ -362,6 +362,13 @@ static const struct snd_soc_common sm8450_priv_data = {
>  	.wcd_jack = true,
>  };
>  
> +static const struct snd_soc_common sm8475_priv_data = {
> +	.driver_name = "sm8475",
> +	.dapm_widgets = sc8280xp_dapm_widgets,
> +	.num_dapm_widgets = ARRAY_SIZE(sc8280xp_dapm_widgets),
> +	.wcd_jack = true,
> +};
> +
>  static const struct snd_soc_common sm8550_priv_data = {
>  	.driver_name = "sm8550",
>  	.dapm_widgets = sc8280xp_dapm_widgets,
> @@ -395,6 +402,7 @@ static const struct of_device_id snd_sc8280xp_dt_match[] = {
>  	{ .compatible = "qcom,qcs9100-sndcard", .data = &qcs9100_priv_data },
>  	{ .compatible = "qcom,sc8280xp-sndcard", .data = &sc8280xp_priv_data },
>  	{ .compatible = "qcom,sm8450-sndcard", .data = &sm8450_priv_data },
> +	{ .compatible = "qcom,sm8475-sndcard", .data = &sm8475_priv_data },
>  	{ .compatible = "qcom,sm8550-sndcard", .data = &sm8550_priv_data },
>  	{ .compatible = "qcom,sm8650-sndcard", .data = &sm8650_priv_data },
>  	{ .compatible = "qcom,sm8750-sndcard", .data = &sm8750_priv_data },
> 

