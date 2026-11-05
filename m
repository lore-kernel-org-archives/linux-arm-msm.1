Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793916033;
	b=VCj7SBuZ1+onH6gaB1VHlExjHptWSg40udkw3S9otMQ37ZLN0XOIo6a6YMq8h3kwqxKB
	 BUOfyTikEB/o+9eZS73KmzlC1oy9+EaoLPA0dy85SzLF1YsPpU6GRKjek9YpfCgVRNjV8
	 UNEL22Skr7zphQq77/GKaeqRIbjrd+cmBPlu3mOWP3kU+CrIlKDu2w/MafYwkm9eeHbqQ
	 k92pYykv62ppehUSRas9t94epKYOoBsgjMAnyxoqwC6gLqa22rXvpUIybZ9jiCmW+IUZH
	 BgaTtDK1hbvuNW2G5q/BYrv1zcootJ7yKBTJguAsAogi84xMNRcMxww3HJuW2KTyoPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793916033;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=wJNjolyzsnHuSD33r/49z8gm5UN8Kafker5qeL2G2gE=;
	b=lBvuNIlmWm7SUT1ZRscFiIxxcSeRHot9oiQqshDrhcGu6aqB5BhaOrXupVSlYr1pDEGU
	 hmrKFvTk3UHEciI2zpz+jjWjkdZNztSSOSnaSiOvMn3WvRC3QVjmDX04kTpLqzOuHGr1u
	 MM8knIdXaGg0HZw5r5VTq9hYO1E753a89lNoqj3HmnwQ72H9Q3CSqmByJFFW2T+oG7wSb
	 gTgKrShMmhg+vyQL04WV8j+VfUV2VzmWGFo1Fmg4DWzy/J3SlcNdW1+ulHxKzJatf4+ib
	 XhPCqZn3Xq01xI3cEL9CIj1I7rNjUDAWm3eL2VamyD0rjK5C/tiKPuvgoSZPDvMOZ1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o1zEJvrx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N02lYoxI;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0B4606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 22:00:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0B4606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=o1zEJvrx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=N02lYoxI
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L68TB1585903
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 22:00:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wJNjolyzsnHuSD33r/49z8gm5UN8Kafker5qeL2G2gE=; b=o1zEJvrxo8+XDtIJ
	SKR8dJMwThbORfM7FgEsXENMjHoWqWDpZdT06TU146orNq9f93qbPxognVIxT1JA
	KWEeXRYtn+AIDnVfxhS+/BfaOSLSXFKPJVvShpTlhCpnvnRQQf6KrTOy5rLj0DMe
	w0yzznj3jfwZbCU5HxvNBcfZEjArwRuqec0B8OTB55rel54ZfmRuHhEy1l3CJZLv
	Yr45Xcp1+LZvvbcaMz35Hxa3dQIKKyujWIBikv3dkWNxWfy76JJGsCff0LXDT+E3
	SpA8cQmKjaNMJJka1+Rh62hgLYN1PyXzH6ygmlgCoenmjYI9VV5DcHyGZyWz+4YR
	ToZBBw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs0wg8apa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 22:00:31 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1cdfb337eso1095a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 14:00:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793916031; x=1794520831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJNjolyzsnHuSD33r/49z8gm5UN8Kafker5qeL2G2gE=;
        b=N02lYoxIN0y6xGdqUJZ4iSNkRi7WPzj0S5tdLVUC6NKPjB0F9C1TSDlRrcrMe85wV1
         lI0UU54ufIG0y7pF2nn8W8eXt2FYKa69jhmfUqi/OxOP+XLahkh0yz1nf4f+zCNdApLO
         zFv0cIDqc+UZHapVL7SaxoXPONGwJM7QHxvyMSP4u3Njb/s6zEfAjx6MWrm11rf9EcxD
         yFtxN7nvVvYf8dMCE8PlYMlQsaUrnVH8ly58XRLGUF0VL8QN+PijT9u4bxWRIZLVxAVw
         WckWGBmztsIiRhVd9izstyziJdb6EzyILHrA8P1ttzrgzFHrtwyGW5/uGFm+WZk4RZOP
         /U4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793916031; x=1794520831;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wJNjolyzsnHuSD33r/49z8gm5UN8Kafker5qeL2G2gE=;
        b=qi2fuNin+m4j8v8YTbqtR0s0a6GN23qRZOegobDxHXH7EoEwLFwP9gjZGydejX4PCi
         bg7ikODTeP7AdMqN+dOYeH42qWYY9eWk6s1l8Wf9b14ESbXgIe3WqfV9QlzpXKYTIFZJ
         KqnZe82IxLe2FsaY8WvW2NtD7HGTHGMTXEnJxOmHKxIT9WqgZNU599HjPCsBiM3KllSY
         evStdT3EG4HjgSbagY4j8mCDbqCbNEYyO/R1XsuTpWArDLG45ToAATKgEHHERxyF3HNF
         0zfX7e416joIwptoGr87zHzzby8sYCLyN3b4qgMZG+ZCg83WQy6E7uL+hbIqL3qRNXko
         E51g==
X-Gm-Message-State: APuU4Z8wsYBJkHetVHIqI2MrjllSXsbxwvvm4B9ckjZjOZ/jQe9u0+0N
	Jk/FZHqe6NDfHI8F0dkFXuIK8z1ZqznBKiULCMf9WfCSTWu4ifDQfGSibI3AAIYnX1l9h0sCpnj
	Ew2a5r2rqeHjm0j9TXCZIjpHzAIYOz1CDgIoDsx6IZ+510zgpIR7wyEFl4+gI+imFVOxj
X-Gm-Gg: AYBFou1EEmgUJoCm0LY9hprmgrWkPA3FGLXEYca55um22uAfCx9q4lK66w74+CFRKRZ
	6hsoE8MEY1t8ZuAkh/uDDXBARIWmbXUsjbyd2sapvBNciWxDIw2AlBHGUJAl4Q2e7xeo8qB1pSO
	Bmtuhh3oQYG+MiFdy28gwp6pDBySTbqjn5mrcv+EPKHSn+/IUlUoVlftrnbeH65XUkf0TlKP73z
	PiEQPGbCAtWVIKTDS93WYi9sfl4PwwXgaCJOzW6qdoNQllimm6uGYwB6nCrSml49hXBwElDIUQk
	m65szSNHYRBsh1V0xgUb+r3qI6Kqn3aVPZtRLJ8R7Izzcd5KsDEfENapvLv7TAYj1mFuH99/Z5F
	yTts0U/rwRS16oCfOqYQSkxHLDB4tavsplDbHR+Yhkyrq/5VITX9BcMIQR3J8muxXTlvmTBU=
X-Received: by 2002:a17:90a:f945:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b0db6d7d8fmr311984a91.18.1793916030554;
        Thu, 05 Nov 2026 14:00:30 -0800 (PST)
X-Received: by 2002:a17:90a:f945:b0:3a8:c0cd:57f3 with SMTP id 98e67ed59e1d1-3b0db6d7d8fmr311958a91.18.1793916030062;
        Thu, 05 Nov 2026 14:00:30 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0d7c8a3d9sm888376a91.10.2026.11.05.14.00.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 14:00:29 -0800 (PST)
Message-ID: <7767e37e-ccfb-490d-b0d4-6fb5c6275618@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:30:20 +0530
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
Subject: Re: [PATCH v6 08/15] drm/msm/adreno: Fix PROTECT span length
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-9-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-9-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tv3QP-kqDGJei1Dj6BRk9P53b_iJNCJe
X-Authority-Analysis: v=2.4 cv=Ka9HIgYD c=1 sm=1 tr=0 ts=6aecfc7f cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YCRwkS1-XJqieDW-VhcA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NyBTYWx0ZWRfX6HFTX82Ly9HH
 MR6DraI8JQegU6MIfMUXtW/GXUbpGNns+EEUZ8voIj7UtpmSjIOI2zT+cv094JDQUM7AjG47IGg
 ifZYJqSMdL/QxYBwaspgckeoh1jM6ag2KbotdxCrvoGzkvZft+TziOokeLmevyPiBfCCC8WteEE
 bNJBIX6VP6yUEdvygdoqCnU1GVakmyl0mlfFbDu4puT6DOhGlzG+axwlPBmYYpTmCgiYu+mYpYm
 LzI5qcswj5hjuAR7BiVULMMtyK608dj1HXI+ByH2cdeiPoQooSWfC8FQkNM5R8rlUvUyiQ0Z7Pd
 NmaCVJeiWeDXljWWBs3c2ym3G/64ekPi6aU+LlSUoi4T4wJdAQVTTYh5Tsll7tTduHpmTtRfW8B
 rOknqsbgRhEgdTvu1QyyWG8VwYBJ6+Qnbzwuo0hytP9M0MXZDBVahx/MZZU+xDyRH33+ftoczCO
 FEx+QFNRqf5OfIkdk2A==
X-Proofpoint-GUID: tv3QP-kqDGJei1Dj6BRk9P53b_iJNCJe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NyBTYWx0ZWRfX9Yf1JnTjhYW+
 pPcwOHJkzbGIT9q1aKwxt4CG9oLvnN0pP3d7QnNE+c82Qva31p+85lR9+Vx/3cv3wAxMRIivyIY
 oi7fqrhTAkmhmmXVfn5Ruc+Zepk0q+o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050087



On 11/6/2026 1:59 AM, Rob Clark wrote:
> Don't let the length bleed into b31.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 4a3898e58aee..cfe7a3ed44c4 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
>   */
>  #define A6XX_PROTECT_NORDWR(_reg, _len) \
>  	((1 << 31) | \
> -	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> +	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
>  
>  /*
>   * Same as above, but allow reads over the range. For areas of mixed use (such
> @@ -252,7 +252,7 @@ struct a7xx_cp_smmu_info {
>   * single register
>   */
>  #define A6XX_PROTECT_RDONLY(_reg, _len) \
> -	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> +	((((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))
>  
>  extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
>  extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;

