Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AB8D330666
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785479999; cv=none; b=d4e0U88LWEnWPGCthff9WBIbY5m7FI8vEDAQTYRBwi9PyscAxtSzkEJKheKX/54qAL5kwpfB//teR3k9rhfE2EuJ4fy33ydRkAY9yP6zFH8unNxa2SH4URbo6YOPVR7G34CP14STCV7jqE2jLm320cpiBaa3WkxqRBKigg9pR9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785479999; c=relaxed/simple;
	bh=dzXPuigJKDq05vtZ6kmB6aNM71ADmAHU+SfKcGsdBS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ocVw5GQkRZilfC+JrLbrVCQjLIKnXeNOUWq+S8T/5Vh9GRPb+16KtqSqwZYu0sKmBtY2NjfXrNuZJat7zyeW2NXkx74LZXSgxh+RMzkHG31hfhnam0jfJ3GFPKF4FskXkC0K21fGWtehCS4G6N0ZxTmG7BgSeOBGs2e6BBFOCq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VVAe25SX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bf5Xd7Wz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VVAe25SX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bf5Xd7Wz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V68j0l3064599
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uXeqp7Fs4lSWqrJZAhIc8E6VRew/LQY1P+vEekrjqfM=; b=VVAe25SX7C+EqKvy
	YfRCAKLbkk3ENsM8KkwjNGBA6KIb0xabL/GJf3Nw+RcJTbvNxiv6wBcK9iqSqQn5
	Fl+jAv/ZZxucMpYIyLgFAfKztDsssKfK5a2PDVnIZfhss2RZUYgJso/1d559rWYf
	csMQXnRYqMhYIz5dWy6r886+xCVyW8KBkp+/VGIeIXBftVGEhnGmmCrPIR4txSPY
	UUp+VmcuJWHjUYbXbqzM4nXcP5bdK0h4YDFgfGq7dN8BzTIl0TAMnx4Mrfnjwzcd
	TdbVxFByZwofvaaX3d1ROsrk/08ObzSYRAmolBJ53Z4v3+UQnhkf65rSHX8wwayd
	5dDY3w==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frp6983s2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 06:39:54 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52b4f6ac06aso1508511cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 23:39:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785479951; x=1786084751; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXeqp7Fs4lSWqrJZAhIc8E6VRew/LQY1P+vEekrjqfM=;
        b=Bf5Xd7Wz8MExErMw60JpPZrbKyWRIC6QvgUo4akpiOhY+AeOBzZhxiS9cg+mA+Z0Le
         +fjd9H0faKCr3LMuctUvYT5gdRDgRXz3AmEYXRhz3dpC0K2lIKJv4lHUWLNS0miUMApH
         9tY01fLQCAfu7RZpBYKqOe2ZAwxmiCp9iMDWGZT2Ww04TS/3c8MkfmKlJoG9ouxs2p8N
         GED+k7wgAMMcD3ldVJBs2f3Gj/IJOapBx+s8KDgKCg72n8xovgFNztTHZtfjTf33Q8A9
         rHthhoJf79PiNr6qoDn4l97LVaHaOZ+wolk2tNhzB+2xbN8Icnv0R14uAjyZFaati7RQ
         Ejiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785479951; x=1786084751;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXeqp7Fs4lSWqrJZAhIc8E6VRew/LQY1P+vEekrjqfM=;
        b=n9jW1JuO2SxTek7+4kZ6gz5S3uJdJMwEFEsKEokYl/I4oZGE8lqBx0QURACAEsoGeL
         XREdjXMWyQJ850CjsVihev4dzZuLIhUg9xSVW/6cBSr9R4cfgDzz2Y+paDJgVzP5OWaU
         DVgQbnuZgy317ZUiqAgv+XQXnQOauDg1NIEEBQVSkvfs1BV4nOn5ZmGkQbokihbeYK6g
         zMrLZ/WzVgXDpVceBipTtkhbAaI2j3QimWDn3+hiGurEKabX6oIus3KCAW4JhbBq/nHE
         dn44PV44b+a5wiuzMGDya0p8jMU/zr53oOnIscBeeAARwwhZhN3JwtzxpwT2uKsRt0js
         Zepw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8lT6FWT9N1r1xX6QNKN+UuO2CxS/4q9apwFwuXGk//LkJHdM+y13ebmzhew62EIQRpqWHZwB0/jx06L2J@vger.kernel.org
X-Gm-Message-State: AOJu0YzFwIvZ72Ui7lPlYDY0lUlDYdhCRAg94VcaX30XCKcaMuwXKEnT
	XQfBOMgDXFsvaL9K1mXMb0tAOsbsBSa7XI2ZkrtJD4MuIxvFarKM6vxiFaPzuJJoNMVcPALMmRD
	M5KGzxkXxGpd1xRHnbdp/5iha7XVOPUFqsPOE+U4iHYgJtSMTC4bBRGKiCw6m/Xf7brs5
X-Gm-Gg: AR+sD12yijWPBiIWEaWlDF5QEHoZkoLsZa+FWyEgzl4XkBn+PJWia2y9c30hXcbJZOt
	CxadFsWJ1nDNkFXmFFtWKweBTMrFZ5UpSfR54VbNKd10TAYAEMu3N4SUWD5ltGcT/dkLzf41oxi
	NZIqAMkHA0hTkZ0rkqxAh97SLw0DsgFZuUctJ9pWXNRed8tXFGauH71pbMXb3pdkQyAyMFurK49
	eBkbCpVpFvFW2b+d1n3QZ8REqW/mR7AEeGTsJu4NijARxNaS4um/1GL9fhDzkYZQ/+npND05ZlF
	6ox2mFf8e0nbrbDGlytIB28uEkY1SSRKX79913gXxuaBdubXfUAtT2ebf+aAeohcYCxS3nZWyVX
	1wJqg1oBvEV/2Aki4gzexIy8l2+Q=
X-Received: by 2002:a05:622a:14d:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-52b4afd3c8bmr9146441cf.36.1785479951432;
        Thu, 30 Jul 2026 23:39:11 -0700 (PDT)
X-Received: by 2002:a05:622a:14d:b0:51c:1fd1:e755 with SMTP id d75a77b69052e-52b4afd3c8bmr9146141cf.36.1785479951008;
        Thu, 30 Jul 2026 23:39:11 -0700 (PDT)
Received: from [192.168.68.104] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-c1fd44ebf2esm29163866b.44.2026.07.30.23.39.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 23:39:09 -0700 (PDT)
Message-ID: <e3b71718-e671-4762-b9df-58edb73d6184@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 07:39:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/15] ASoC: qdsp6: common: support headphone jacks
 connected to lpi mi2s
To: Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Konrad Dybcio <konradybcio@kernel.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc: Nickolay Goppen <setotau@mainlining.org>,
        Adam Skladowski <a39.skl@gmail.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Johan Hovold <johan@kernel.org>, Kees Cook <kees@kernel.org>,
        Charles Keepax <ckeepax@opensource.cirrus.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
References: <20260730174353.108023-1-mailingradian@gmail.com>
 <20260730174353.108023-11-mailingradian@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260730174353.108023-11-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 5eWA8mzFvzRS_FgYhBAyP6ymN_4zsfQ8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfXxZAADIk1hrJ6
 L/uvXqqMPj1FWr0sgX6ujTjyTeRIc/GUrMNaEndpgfkHl7ou1pIMuDBju3QcrksyJmSgHksvk6n
 yiarLAHNjG0MVHJHJnXYLVy610hC8K4zjRDemegyh/obfUhPZP6xK39T46QenxzRICOsTqZIoAF
 tqoIyr1fJjyVG4a2RP30pdPHazXWDIxIe0Zv4nckXlDGGpORuM7LyeDKWgoWpEr39F/lZep3edr
 BKjopWm44Y6zgIUzvxYTVpZxxN+ypyGAARN8Fzm4r30ctZVjNffLaWfybiWL/OZ4fbg4eTqHATZ
 qEA43fT+gF49WhlvojFOphvX7BRbr9DLzbo5Lr6vbg8rmTOEBsTsD+OwS0ovj+/Dzq8zJkW2OGj
 s72B+5X/HWBiWt6Fbjn030CYuqOInJVKdUKxwQnWr0exdbSAsRBhjZlxpqrXukiDKJB8DFG1t1K
 2w5AwsTqnXJAp3pj3KQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA0NSBTYWx0ZWRfX04KlncXHQVFa
 4QQE6LLwpMpV70yrz4YJKthNzQrdb2T8o7cQg28wHnbnvaYSxMmoK+uTi4FC0oqV14LJhpixZ5i
 rsSzdcJ+OlEtgWnm0c6B5Pn0/3l/SgM=
X-Authority-Analysis: v=2.4 cv=Q/7iJY2a c=1 sm=1 tr=0 ts=6a6c433b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dOMXe4oPGlYktJp97LwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: 5eWA8mzFvzRS_FgYhBAyP6ymN_4zsfQ8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310045



On 7/30/26 6:43 PM, Richard Acayan wrote:
> On SDM660, LPI MI2S ports can be connected to a WCD codec which may
> support headphones. Register the headphone jack on codecs connected to
> the playback port, LPI_MI2S_RX_0.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


--srini
>  sound/soc/qcom/common.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
> index edc4611691f7..b570d81583f2 100644
> --- a/sound/soc/qcom/common.c
> +++ b/sound/soc/qcom/common.c
> @@ -215,6 +215,7 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
>  	}
>  
>  	switch (cpu_dai->id) {
> +	case LPI_MI2S_RX_0:
>  	case TX_CODEC_DMA_TX_0:
>  	case TX_CODEC_DMA_TX_1:
>  	case TX_CODEC_DMA_TX_2:

