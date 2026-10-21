Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572030;
	b=NeLbuDT4Lox2Ik6O580i4Hp3sWvrBrJdHKlZZGY6YwTidkYrwWJJPV3Wp8sIu0EUpEY6
	 eE91kaxuaoZ+RCI9CR1dkvlwA3EfGmuVJgKxcK8X/oX2zWT047ZWhZgCVkILJqMNCiNWb
	 MHdmEK55LY3Bqnnc9dPSdllFc7KcXaSgOyMT0BKBvIUn87mhbuA6HPSBbbOiZQi6IMrBY
	 jWjCk4CmSq3WweK8poAvdKE/F/Uj6Q5fXUTFgzHyKPQb0BTD76UQ0VcvWpzOIqEw3flCk
	 dEKhCXiFzIitv+KObVXXEKgDd2Y9zFtHJSNbHIKWr7ykatTT9YoDqapr0gmQkaMDs5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Kpoys/1kxKqn4AHu1v2G/H664oi65sLNEFT40K6LcKU=;
	b=lgy4g7oej2q84GcnOazERzn+yYa0ZPAGBk5vLBYkH7UdMPk1M7GTix3wQ2moIOvjiHAB
	 TzBErsSYnIUwfFvXAd3fxkHDj/13wC4uzSh3Y6DseCmdzp65pq+HH148aZJc/IUFF+09r
	 fgGj399hDXTPSIrv5+1av4pXXESGLmmiJ3RWTCI2MP1efqgJg859LfzqSs/aQttmFOmDz
	 kBPpxwHqaXJwV2v8CdLhTXEax3BL3MCCaiCkYc/Rf7rz/CAuHP+r0NDAosIO2zfRsPG6D
	 z9o3m5UeZcIwoiL5zLgBYZfwi8UhflrYwCYUSS2PRqDOjRiC08567mtSNe2A3yYxu9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CjYxi8nj;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Emo40QNp;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE66160A6F71
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CE66160A6F71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CjYxi8nj;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Emo40QNp
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jMrw2848656
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kpoys/1kxKqn4AHu1v2G/H664oi65sLNEFT40K6LcKU=; b=CjYxi8njMzWuUsIf
	P+qmKKyvQPvo53I6G4lnQMuJrJejY9WR1VnV/XrTOkezdFaYPo40gv0TPZuz2fHb
	cMOk5aWqZ7gqroeQLLKOEQ/2unqAFyRXeWZh+llp4XpN+Ql3/mTkj3t5nvRxdSzS
	4y4KVJWSQGhx3a3cxbl7isSSVRTa71ehkW4BORaAwqB7FFqTsnMvAiElIP3k0JZ3
	0Xt6bk2M0NGBv0GJ8vCH36mAadljju2MIOSncloxTuMM7tTtqFLGbC8tywg4gPHO
	OSO9UNunCrBlqR6k7ceL7TWYgHUI9XOAQHYjibSzBPI7m1rkVhq9S6D3WO4rptYD
	cYyIww==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9ar3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:40:23 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91795e52969so1716966d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:40:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572023; x=1793176823; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kpoys/1kxKqn4AHu1v2G/H664oi65sLNEFT40K6LcKU=;
        b=Emo40QNpNfIdTE8zrKxUPCtotBJknDvUlQgmuFDZktvErDRMLhoPzwBn2rq7/oYrnb
         271QCqHRDdqrjZRc352lSSjuq8Owo+KdsFsLMhwdnI0JRAq6pwNsUkJeWWcVAZI0WXCe
         lQk5JQuafoXstgdQThsJ2kmn2hvd5GkXKBEfvbxaoIA7OGItPBmPPd0IItwghU4tr/C+
         AJDpDuFqJJxH3znAlx1bTr2OvKCOs4Pctfa4iUZ26X+CrkowKlhzq417NdKEDEYudfSX
         riOr+TIMJrMJRLwMRE4BFDvbkw3DPoefH35Zf3R3FWdyRwTrXoE3DkUivVXmVeQOHHIE
         cxBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572023; x=1793176823;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Kpoys/1kxKqn4AHu1v2G/H664oi65sLNEFT40K6LcKU=;
        b=YNUgQpn7+IQpCXtSMLOzgwac4Vs0PxQV0Rknai+89NGsgboCDfzmMIPLPF//fk0bCb
         DS0nJx8SGiKBS3cVFkV/ECELn8bPenjdtVGfrSfp1Kri2BlUjPrWBTu2fPYqYB71nqlD
         2waY77a8TT3yRA2mf87Yzcad+SsZ/uNzCy6zo1tItYWLKu+8CXuBQjrl9VKmnjWygmAX
         f9hxLL0SBgiHRkLeNhMDDLkvXQ5v4zpIlVnYnjp/b8iRDktcuPKh+mCaZd1jN9Yj9uxg
         rwXI3KMGrMUAK/BNZIKuTDtkF6sYXfTzxpdMoWJfvorQMVvLeURjx69ZujXtAoWMbTcE
         zCpA==
X-Gm-Message-State: AFq9FYJcvjhInj5Lnfljai3ahC5ITMZS4bwqKgofvrAtmqMmtv9SZBMe
	uM4VGK26zV4eC9LuyIWmhppN119xe7tSkvG11XtHRpKEOiFFVm6LEopJU9LgzZXX4Z3FlEf0wT5
	lEWcjxgp600ac6OYTbepZxrGzt3v+oScIV26oqze9dOJbuV5h+QzIzub9LJ4qccKrp+6v
X-Gm-Gg: AYBFou1Bu9fOJGNJbZYbAZJ6njTYCnFNoILQuAu2xuK23XRVCEFEYfpi5iwdEfb+csT
	ecHOUciq8lyFS/Sxht8LPrlfYDOLOU+WOLoysX9AOhs9Mnw9hQrPhTQi+WDGyR3ucb5n3Vc73uU
	3dkRAXRw3moZIkSv4j8kJxI/X1ADfvTSFwzLjxTlOjgPUGsnI2J6mUCexw4hgItszsgsDiLhTvo
	XaRqkEWy+nf9zxkDQbQqQQgnHjMD2jIO2BFBtWssgl/Cg2e1OmjjFzgumpbGTJtTdNPWJnVSF73
	QuhdBfpYXmuPOZ0SMKXRBtGSXVTQNk0w93xMlMyvbD5OSgaN8VYIvPSCrR+JeedN8mpura6JgWG
	A12HdKhwHwC8pFerBMgHNcA==
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr356219885a.0.1792572023200;
        Wed, 21 Oct 2026 01:40:23 -0700 (PDT)
X-Received: by 2002:a05:620a:4511:b0:93f:977:5d9 with SMTP id af79cd13be357-93f57dbe348mr356217185a.0.1792572022767;
        Wed, 21 Oct 2026 01:40:22 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b403130691sm613327a12.23.2026.10.21.01.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:40:21 -0700 (PDT)
Message-ID: <daed5a07-7d4c-4597-bec9-7a537d0af4a9@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:40:18 +0200
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
Subject: Re: [PATCH 06/12] drm/msm/adreno: Fix PROTECT span length
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-7-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204728.28844-7-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX8ZH9M1xhzTJi
 hI52yNfN/eeh30X672z5Z3nUL2F9eAwgbikNERza89K3KwgE11tijZKmsinBASKRQUifqJa0UuV
 u3T3Qia6pnX+5bLJSDsYIgi1twijbtc=
X-Proofpoint-GUID: KMIjDoemCGo-_mKqSU3gvh5v-PurLId3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX/TVU7mZlu2rd
 U3/7z1ZrqdLcS4x5rDn2cL98qkoMVBjpeFGUr1jNAt3tTGY6T6yJfFl0MZ1msACNB4c91BPvJlt
 HzeH/k7iBjzZUbEsdv+6Nsx3yGXoDAH82o6TVKe9qS90qjo8R4kqXHyGYRP4vHLzt3Mf120jqkp
 QYsl2BFMH+0bpINyNauzzvDtgYLZuwEKSd8BOfKmG7N2TPgQIa9g2CPRKIcCPc9GhZwhOuEej+d
 LqDtRdRRWgmYIp+8XCFwFQdnetj3PsK69y75FJTOEY7HT8IEtzvOFB9WTTQDlQenJO8C0WXP36P
 jLpnyjB0TbppqdA+sBZ0k03bMSV8dq92/owUGvT/H05ePuoZHwqlOtj5cAJsflegQaDtGwrW8NQ
 MaIV+zxqZ28+fFMTOCyZAF6AQnSXT2RM5TvEPDSpcEkBxq4GVdOq/ya9eTz6UMQrLuSSg4W+M+t
 F734xDONAVVjVocjwIA==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87a77 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=swWRwoZvoC88mqOtqHgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: KMIjDoemCGo-_mKqSU3gvh5v-PurLId3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/20/26 10:46 PM, Rob Clark wrote:
> Don't let the length bleed into b31.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index d60cbfaa0d8e..5e1f35c83d63 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -244,7 +244,7 @@ struct a7xx_cp_smmu_info {
>   */
>  #define A6XX_PROTECT_NORDWR(_reg, _len) \
>  	((1 << 31) | \
> -	(((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
> +	(((_len) & 0x1FFF) << 18) | ((_reg) & 0x3FFFF))

Time for FIELD_PREP()?

Konrad

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
