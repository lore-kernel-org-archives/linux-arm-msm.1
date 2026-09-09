Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3132A33E355
	for <linux-arm-msm@vger.kernel.org>; Wed,  9 Sep 2026 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788944791; cv=none; b=hCpRDOooQ9hfx2aaWodt2GTj2C4Czq/+TjlJodovVLNcxUckibDnAxa8gn4NcMSle0FmughySdMz6Pe4I57/VyC0OX3S7Gi3rmvCCsBIpX6UjGRy/efyDt7ji4ccJQnvRiaamYFgZcDu1tMHtd21vWIGVpdwMXekefAIy+XiilA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788944791; c=relaxed/simple;
	bh=BY9a+ZadOL45ZPY8IaR2ogPLW9G41+UC5MKC1/JBri8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZdBpn7wNdMqZwbaL0lKI7yYTJNzGEqSeVrdCt/DT5vCMSdlUk8rpsMviQWOuVYPNigx6HEN2imf5u6b3CW5RsQnkFuJYKGly9qCHXwkOGT4xA+36j3YUUhLtOWK/Y1t6w+BnPbKW4vHFcLBmd1YzVISWXOgl0ZvSAUhzUBF9RfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5MkzCNf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IAcXK+Gz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5MkzCNf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IAcXK+Gz"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6896VnST3817303
	for <linux-arm-msm@vger.kernel.org>; Wed, 9 Sep 2026 09:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oLPtpvb5yV7GW2CVT7bLRhge7vNl77o0SOVL4Mkt9ak=; b=R5MkzCNfXOLTy4zr
	njn+glFqrnLbIc84z1tp7TRk1KEjGyV2AYNg/OMx3LV5ZnTDf6mL4XcNiBXkbB+S
	nie37pqqzLE7wBPNgDete+WZJwcEdpe6r5BIVBU4W4SbC+5g3JCPj+gBNZXA1+ci
	zFxtJtkGkJVZ4LI98OZZopq++yMYUFB1dRXmIPEwjMi/SNW6OdvtfcXkPDVyDAxW
	f1menFYcbVEpxf8dGacC6RpfYUXzan46UNq2TcdntElKtICAE/hrcesOvlp3WDwv
	vF/GOWSzbHziz+lGz9M3Q5qHjHztm3C69OHUPQyzXmHBUeMf+mJ5EQ7zlbzmBE95
	qLkAyQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjstuae21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 09:06:28 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90cd9fe6336so14801406d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Sep 2026 02:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788944787; x=1789549587; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLPtpvb5yV7GW2CVT7bLRhge7vNl77o0SOVL4Mkt9ak=;
        b=IAcXK+GziZ3nEzpNV+EtQ7NTWW0oO+jAiC5g/gnGaZsa0egHGOLddmyIvptwXTowWS
         nar7iF/QQ2IZzjmBZu5krLKdTY+luV+Y/23cwUwdlh5/MG1QrIUbTMVSfQQ6NjjPlcFW
         z4m+aYHA0fNQkQ5n0euF363D5Z2hHSDwn+zhwzwvgkCToFZxLV6QwH3eP0YFnbjFqSIN
         nSG15g7UP/8e//YT7kfP8bSiPGc10LRIdVn/z7dag84OimNwoeMMxXtsuk/ZyjDQp92q
         IdZ/mCvg/ftg02GCvD5wcZG24qpwOSYYHMqzosTMfj0lHxsODj+QVR+aejPlG+kq3VU/
         DwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788944787; x=1789549587;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oLPtpvb5yV7GW2CVT7bLRhge7vNl77o0SOVL4Mkt9ak=;
        b=lVXDppBjbyF6fcB68GmQcRL0VI5XIRAqHQUaWUJFWXT/sZuPf+reaN4XgSPpB/L6G/
         1ttGmOdU4oAe9MkQgw0nWq6ddtBDF/PhS5KBtaAcBnyNtfj0sab9I5soyeXAr5VxqucL
         fJlwvAYpouP3bCe9g0bRznmttSAEI3NpoOCbv9mEO5CIb3k0Y7lh6KiGNLwTzl9DDV0c
         sO46gClAo9s3vBtBMmUOxtyXisqjqG9CnoqAt/LPhxUys4yXXCluLqRn3sKeEbQY/K8W
         m2Je06+DjVur8cOCQsAdP0JqNP3g+s2sfFYliC/9AL6YrRthkWpLpC/qfQGTpabkgaCk
         pmKg==
X-Gm-Message-State: AFuF++nK05G1fxwzz/QJltvSMtuVRZu8Dw7OQ43YQO3Sc5vAW2+Vgf36
	NrAyG9fmhXcS33Ps8jEiAWwRgKoEPRqSVLCzxG2tiySsUQfwBE6ZM6jy5So0bvdtx+RtPRdjHdh
	SnQtLLnb1dukD9hlEbO6vVKhOT1dZPDk4excWCf68qWpI+T/5ER5qnd75BSqEdlHwgMyO
X-Gm-Gg: AYBFou2G65YKNJzNGYE823h+Tk420FrlJ7FqnDzRuNRRogEvD2zjn6iHlL5KieOF6dk
	Jb6+dwNlUJq4Tdueyc4YJqx+CeSm3BC9VEsZkKMnqNuRv1S7yZPC4YnLjbt+/NbF7Ni+yn1pgzr
	jHl9IBV4/+BqK+n7L+/QAgueWDVfCx/eNNmGLToipf1YLs5cUvMbdteSOtfkh3WDHhjuyy1p/Ht
	mr3jaE90vzOKPQBoHVzKtFZRIObZugvhYsRQVJ1T3sSJcFJkdKXkNFJgzLvhe4WNf1v732gI2UZ
	nQwK5QZCAuyBKnTqkdiM/71HgfFAgCNRO4O7HgdekEoK6k+zItCn4j8sGN9/1PbeubftDSFDmUJ
	kCg/BsUHiqI64Vp6SbUPgQQ==
X-Received: by 2002:ad4:596f:0:b0:90e:9952:82e4 with SMTP id 6a1803df08f44-9104795fc63mr261666606d6.4.1788944787082;
        Wed, 09 Sep 2026 02:06:27 -0700 (PDT)
X-Received: by 2002:ad4:596f:0:b0:90e:9952:82e4 with SMTP id 6a1803df08f44-9104795fc63mr261666156d6.4.1788944786500;
        Wed, 09 Sep 2026 02:06:26 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm648279666b.25.2026.09.09.02.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:06:24 -0700 (PDT)
Message-ID: <47f0399d-bb31-48bc-b69d-4abd445727b4@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 11:06:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/msm/a6xx: Use CX AO Counter register for
 timestamp on a750 GPUs
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-0-284880d6e68b@linaro.org>
 <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260908-topic-sm8650-gmu-a750-timestamp-reg-v1-2-284880d6e68b@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ItAutr/g c=1 sm=1 tr=0 ts=6aa12194 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=ubtBxe2QYwUAodWgXbcA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfX+8gXtr/v5XKT
 JdvT/Tcpr0EfqLhMe39haQRJIEhoKDyib2HAY4REznaFP7WCTnswHV/eqjYCVSZMhCxWjRRDJH7
 Nt1v2a//wDTyByPm4vpsYwYMZeAfFwg=
X-Proofpoint-ORIG-GUID: 9v781JPUoWA4ucA3M5L9dOmoknVTsKcQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwMSBTYWx0ZWRfXyeLQxiqf7A9k
 iNYyy+R4Kn9c5Oe77HAS7F2VnX7Ta/loyc8EuAcuN6yzfLrYwk/AOmyIJp3q0SXGBtVpZQpcu92
 cath1WxLpETD2kuGmyn8Z2y/zFKVwSYZWMmZZ9aO15wqaMRqXk3WNKNvcyJUIpaDCn+GYGz74sx
 uGIa4kI4VffCkmCPrqCWU5smsDPww9CwDDVOx0mVGhBTkkRWsGvjQnlcCnPWXKa+sNNubvuOx0d
 ilh6YMj2K8EizW3DGOrKEJp07GLaa0Ec6E5cl03d8RcZz6CZLfeBlIoYkvaxdIlNVjyTd+n6VDf
 NLM/GOVOA4npwDm4MtEJ2Eh9lCSGzh671MDA9Pujz8jjM9A35azMxGSgcmKBg7ViQkg1F08EfUq
 Qo6Eof8xv2F8kLRhftn18krG9r/AJ8yD7VdBtXdk7uD4311GwbG70x5DVhnr2XQuEZyrSoMelfF
 VAAOBzNE6lFYHx+cwtQ==
X-Proofpoint-GUID: 9v781JPUoWA4ucA3M5L9dOmoknVTsKcQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090101

On 9/8/26 3:24 PM, Neil Armstrong wrote:
> The a750 uses the CX AO Counters instead of the GMU_ALWAYS_ON_COUNTER
> register on A6xx and other A7xx GPUs, use it when running a A750 GPU.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index f9de9329dee3..081e79ea4652 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -23,9 +23,15 @@ static u64 a6xx_gmu_get_timestamp(struct msm_gpu *gpu)
>  	u64 count_hi, count_lo, temp;
>  
>  	do {
> -		count_hi = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> -		count_lo = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_L);
> -		temp = gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_ALWAYS_ON_COUNTER_H);
> +		if (adreno_is_a750_family(adreno_gpu)) {
> +			count_hi = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);
> +			count_lo = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_L);
> +			temp = gmu_read(&a6xx_gpu->gmu, REG_A7XX_GMU_CX_AO_COUNTER_H);

KGSL apparently *writes* the system time to these registers, is that
an idiosyncrasy regarding how the vendor userland drivers then use
this counter?

Konrad

P.S. looks like a8xx also has this counter

