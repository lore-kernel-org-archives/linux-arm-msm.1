Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722528;
	b=ni55uK7rHFErKwGalwwhX/TR9PMPk9avJrdvfA4gvkG6p3LSs0nZxIM2TE+Wq6Z+guI8
	 4uixaJ2jggn2ZJ5G3IiNYS9UCnrYf/K0htlVTNhrT7yeFAJJZaoyb27/aVDG9AR1mevXQ
	 dLCPuj/dkRxRXpjRad40UzAwK94Wyqwv3Si60H3/j7JjT76z3A/g8G21Qz6JW2QeRsR2F
	 mMET933ivyNcvYh1xgS54VsSdA+6rPdPKZ/q7ZXOW0S5quy0MbO6N0yMABcHrXbzdvfpx
	 ROcxPuRxlh5ftSHy7ZJw9WBEpFVRVm9c9HqwvLnsqKgoXW2MsTkOlavKHmfpFGB+KTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722528;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cb4cbrx5kZY+Yme6rnhcpB882HS6oqTOJ86HCQTYrak=;
	b=S9WLqHkWIQBoQUHgd9KYaKA4DbupOD1JRaZ7ooj35yJahKRstEK10tkj9IGWD4AFSTvM
	 OfK16fm49rWbucGgFodpytiGuDLSKX66fqra1ZSH3i1szCjkXox4UmCZ1+PplwKHPDLmV
	 l+swg1P7Nf5EZvA15mk3jzMzVV+5JUGaghQOwTcfn9Bg6OdE3ON2BZExjeGP6O0lHLPn8
	 GN8UXeflnCjGlTXF8WKeVfml1g1wK5FcIdXN/CGXFH+XbVSXK1o4bTg07IApaIKeVb69A
	 IqX+4YFAg8Rl/9uzcMgJgguZIRMzp2O8dvx4MiydjnFDuLjGSMC4l8EeKBuzjQ18Nww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YkzDBpou;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ebZ7ZVIe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D76C606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:48:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D76C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YkzDBpou;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ebZ7ZVIe
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQH3BvP3470830
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cb4cbrx5kZY+Yme6rnhcpB882HS6oqTOJ86HCQTYrak=; b=YkzDBpouGmTgUZwV
	n3FFqPM8RqNM690b8Ns3q+tXhs2VHZxIKF5NaMs+H7tiElze7GGHZlPx8Ka0NhGd
	st7mMLPt3WaqxSOU4vbK8LIFqF0XNXzBrEz0sLEApjptSE4r1LNk9xv4Dr6FUkCZ
	5IBsVgWANUgvWUeyW7+ECfG1xdtkgLwuNXJJOwyDTs325a98MYBc5JOSMBj3lKFQ
	OnA6M20tkqB1HYXQbWkvTwGP89nmyLJ48557p51OQbQzUjnSSaZXTYt4T4AP7IO3
	j04qTFYWWFEPOP61ymxNHOlzgdhBvRbpR2U7Gj80AR2i4dkd4h/NG4k1f5UIiUXm
	t+89qg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru38cm3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:48:47 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386177b0516so18383104eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795722527; x=1796327327; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cb4cbrx5kZY+Yme6rnhcpB882HS6oqTOJ86HCQTYrak=;
        b=ebZ7ZVIepTLb62zudL/CKkdjnQO4H75HVpUX2kUNQrokyXiaRvW7z46G6GZTUnh5ky
         ecsC0RCG+XZNcaQPnwkjrckit19+fsV/otnbhplJ+y8gaa6KAvqE20NwRPCZVs04aSzi
         xBwfj2CcRJW5pygvtuZNKgDpv50uf/OsizZcYneQ/Ah7pjVHbW3zncVm4V7RGve6f5KA
         xIdqoqNOpRxq6LemNSfKJOwGGsG+VYFRzt82Gu3GP0NrwENmeVcf7Uo68JWlerLKPc5x
         rBOu/JtB2pJxbw5Bkp8mI2GRd1vhP4gWpFveX35crsBkYhFgrZM9jiDpmITIxCXukPYb
         JmSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722527; x=1796327327;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cb4cbrx5kZY+Yme6rnhcpB882HS6oqTOJ86HCQTYrak=;
        b=S4YUvwnDXVUtzPNQTb9druHAY0tFITs7eS33y7SnwGR4swbbiSZOF7MDM5sPDEN/iW
         gz36hWz2WW8BP6R5AbCHh5+79GaGp3n8lrVsjX14H7nDWFKaNtAFyez4nfYphLOXNfP0
         wxd17z/7A5l4FlMnFpdvBYqbfj3SoAR5FbHFwy2oarAeZ6BNdK3HOKwoYaa3IEfVYVIt
         kUE+Flow1YKr7bSoKn2egD+7flAXn9QrCZJAvyDfWu6pf1UB9T45c5fhKy2vH6uOEE2w
         zvIXKCAS39SDyPUcAFWo0ojPBmf0NnX057zBa/gQ1wEPCuvTV7s7fBnHh4xXu/CgvCP6
         H0bA==
X-Gm-Message-State: APuU4Z8k5WNsxQm6b6K/OZT9AxhoSUuDScSPfqPMnfqQfMqwwsj1a9zW
	6MzXMFPoLgoyIpcspZ7mRBnVVlB7jCf4XaQnSxlYHj3hB6HCfPoDdqYB482Us63PNy6V9lqMGoT
	vHUHSbE3lfJOZ/9MFTGlaqIqwAlef+yXQpGIdaouz+K6Moz99amvzKlWzRh2YraU21eO5
X-Gm-Gg: AZFdTZdKOHbqKWdlPe3PTjg/wYJLZSJBVRLoLXljSM0lzB8bonVeiMimZqBmmuIk3+k
	Hs5NQ2u3Q5ETbyJRQ45m5vekmjnUgrCCjeeVjncaPIU+WQTlk6vOD+JUPpmrFosQ25RwCQEQPcY
	NNGremothXF3ymH2jixJpDE90xbyo8z2pvXTbxKEChY+YAbZzUJNxw6XUONXAW3jXvXwrsl0yx+
	VKQrbUyQcnjzlJLnI9GHg5jBRJhCKamfXmnlmIPUOTRe/w99T7RSrvCpYdKTTegsYj2xAgWPz7V
	Sy4MGAgHG3MGQjBdBbytm2Qds9CK/8APh3OivfbGHhJaE0SnNQ4kYeDGbYpSX8LD+KBY30x0hxR
	Db4sav8RtGAL4ldjprXLxiOIgYfM+zOAo2fDFADuBern3PprKxzjIEmm6pAHOK45L+blFZ/eUMQ
	==
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id 5a478bee46e88-386a1ae6d5fmr19047981eec.36.1795722526668;
        Thu, 26 Nov 2026 11:48:46 -0800 (PST)
X-Received: by 2002:a05:693c:414e:10b0:386:a1ae:6762 with SMTP id 5a478bee46e88-386a1ae6d5fmr19047950eec.36.1795722526108;
        Thu, 26 Nov 2026 11:48:46 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm74349135eec.26.2026.11.26.11.48.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:48:45 -0800 (PST)
Message-ID: <b95594e1-fb17-4058-abaa-e889eb6e952c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 01:18:40 +0530
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
Subject: Re: [PATCH] drm/msm/gpu: Unwind power and clocks on resume failure
To: Haoxiang Li <haoxiang_li2024@163.com>, robin.clark@oss.qualcomm.com,
        sean@poorly.run, konradybcio@kernel.org, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261119034718.2818183-1-haoxiang_li2024@163.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261119034718.2818183-1-haoxiang_li2024@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b088d1f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=9G38XQudUm-3WiMgdEYA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: GhapnZedSTGGIc5tcwQ2qBbIPpDUYZgn
X-Proofpoint-ORIG-GUID: GhapnZedSTGGIc5tcwQ2qBbIPpDUYZgn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NyBTYWx0ZWRfXyYBbRsenbZZt
 WgvT7ew6Y6e9awp085TXog5zEf4EKvmd5z2E2cBfCLyBSZG02i2YkvAkOne1EZ+ri/f8n1OIeht
 rfGejf8KJqbkeHuk0Sgm+y3XQOGselylT+FyW/Sr3e6xr5U8M/0cun89qEe+z1XmVbwnN/lCSXX
 MtQoO5Ta6VoeBVSxOx0NrCy/Bta9Mt58m5fuISZ0T5w3am4Qb92V6G55zM5Lrm84ZlITyQLy4eE
 Uu93GnHfTMCrxYrOhyuB+Rg6+m5WMDi4R0F6L4Xuf21WUoCCyi+2HIwYKf0d9UGciCokULVTKrL
 FqzMeI8xOllePXBvSHK7xhnxNkvCEqOqR95zb2BIN2yquQz+MREvgAqNz4gTB4bE9vn/0ejPcdd
 E7H+C8CiQHbQe/EJqYAloER88/LGWqS6lgLsMRfCQQo0t2VdSHAAB2akP7thVVL+xlIenKxM95W
 TfPcNyn5xhmZFGcgkig==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NyBTYWx0ZWRfX96RzzOQ+PPbo
 pjDJoXoghzxxYjOg8q2Z7ap08kFnW7k66wo2HTh7pJr3uCaAdp8U16BiIXx3PMKTZmzKUlU91QI
 jwIS5nAfiyOv2hfuN6Thw/PdohRCKYE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260077



On 11/19/2026 9:17 AM, Haoxiang Li wrote:
> msm_gpu_pm_resume() returns without disabling the power rails when
> enabling the GPU clocks fails. If enabling the AXI clock fails, both
> the GPU clocks and power rails remain enabled. In addition,
> enable_pwrrail() leaves gpu_reg enabled if enabling gpu_cx fails.
> 
> Disable gpu_reg when enabling gpu_cx fails, and unwind the completed
> power and clock stages in reverse order when resume fails.
> 
> Fixes: 7198e6b03155 ("drm/msm: add a3xx gpu support")
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 8319119041eb..5480abe1aba2 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -40,6 +40,8 @@ static int enable_pwrrail(struct msm_gpu *gpu)
>  		ret = regulator_enable(gpu->gpu_cx);
>  		if (ret) {
>  			DRM_DEV_ERROR(dev->dev, "failed to enable 'gpu_cx': %d\n", ret);
> +			if (gpu->gpu_reg)
> +				regulator_disable(gpu->gpu_reg);
>  			return ret;
>  		}
>  	}
> @@ -110,17 +112,24 @@ int msm_gpu_pm_resume(struct msm_gpu *gpu)
>  
>  	ret = enable_clk(gpu);
>  	if (ret)
> -		return ret;
> +		goto err_disable_pwrrail;
>  
>  	ret = enable_axi(gpu);
>  	if (ret)
> -		return ret;
> +		goto err_disable_clk;
>  
>  	msm_devfreq_resume(gpu);
>  
>  	gpu->needs_hw_init = true;
>  
>  	return 0;
> +
> +err_disable_clk:
> +	disable_clk(gpu);
> +
> +err_disable_pwrrail:
> +	disable_pwrrail(gpu);
> +	return ret;
>  }
>  
>  int msm_gpu_pm_suspend(struct msm_gpu *gpu)

