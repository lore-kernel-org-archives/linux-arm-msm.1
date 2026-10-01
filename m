Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E87B36E466
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 01:53:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790819635; cv=none; b=hxZE2mIy4VNc3DY71pkdfgoqS3Ag05vQ424aIGIU9upNRE02fHnVqOXdtvc2XR49Adoc5LfZr7tFaARqu9Z+ngeGlrdjlvDNNjiIL2efYAwicjoN3/zuv2qw2L2ze2eGjs54WxgNf7rGiU6zolfgamVCldwX7JFa0pBKQGZ7r78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790819635; c=relaxed/simple;
	bh=H4WR/Tb2R5XoA2UKYO03JMtAMXstmG4XwkRDDHykt7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZLCHAYBDjFqAii+hksJfMyWs6dhYNq1y8zIhSqk8fDjUrZuMC3sU0ku1aDkMXyxa5wAZQkA7YZEwHnxmkGSR1zMCk5CyRSZx4/xVDOpgIva1ksFCNdArKMaqBPSgCmY4Hymlp/LL4OtFO7atKjQPKdeM12tqxIPDFJSCbrsbQ9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BFybK985; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZKffaTOD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BFybK985";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZKffaTOD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6910k6Df2013298
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 01:53:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ELY0MAexpJN5nAc7xQCugLeq
	mITlBQ49lgtYS6jx4WU=; b=BFybK985dnk2qMD2cqvw8uheP/PpAJzPE4KcvHIN
	9sXb3AE9HlVjsOpelNmfJWqhNtNE9lJ6unrSjlnqxB9z20yDLnnSBTaBbtdl/R7i
	h6BQIcnp/BSzHRt+a+SspPu9djzfRurnd/tch7qrDnNqt337Gc1+RStcUPIqTycG
	QhyAXvR0dplXjQiR3efluOVvIzK3qWh2h1D3QBYIxFt9gkaDqbChUymRaQBh+6R2
	mTgQXTH31LbdAKSi2dRu7NLQ7hC6GOir9xZGazg5SVWQYV5kAjAx3Sk5JAFFqunS
	racw7j9O811KmOyrB7ZdOatf7mJqYtnSRbuWY525WMMa9g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0yh83x4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 01:53:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93c5ab5c136so813868285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790819632; x=1791424432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ELY0MAexpJN5nAc7xQCugLeqmITlBQ49lgtYS6jx4WU=;
        b=ZKffaTODXdboCCou5wUAa1znPRvlwgIXaHgVLkOl+1eWt2kUNLwW8+fVO91hH50BiO
         8lq4uKnrx4ycA5rgE7l5fQa/aWw4WDXzEAEVMPYdPOQ4avwyfqQG7N9g/ac4gGHSvwVk
         yhh73h0a9Dt92xLBVQsfCSUwxv48IJypbJtokjwAOYMhM3aKGXaSOemAsgkxuKRfq7ev
         UxML0tOfBEPVd7ltp/U98hJH+KJwc8K4HOygFjKfEn65iLs8T6me+/bOk5UcuIBZp6b0
         ywfR7gVuHKxN9Lb6L8pkE3nuhUOIG/FzpA1DVAEXKMJiYi0IrPdC153ceKJ/STin78zl
         qJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790819632; x=1791424432;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ELY0MAexpJN5nAc7xQCugLeqmITlBQ49lgtYS6jx4WU=;
        b=B27x9xdzJ4jsSAMWEIDWPo/BicjnPupq0ggtuxSNZ/RvHfxALm5HNxAyuCMOBFJR6w
         91lUzOiFY12U0TOZsl5b9Mzos63+OYRT+qkcBabCwAQVxdTVzuaZ6vsBFW6/Iw2lOz2m
         OZ6QBhPd4GrOIWE/ztVXIU0af/z3MRQzZdRzOWzew2VdqoKWVM4yDoVsJcP/lpAV8bAL
         HDT/PFJyVoFT4xlapzkjWSV3Bkd/h8QWn5SrXdmFxJjvNIdK8bDxl5qCTRG96/tRScLi
         WFqmOGd4OWRyPcVae5EKbJfsmdt93jSO+dFarrMT3/cPUT0Ft9Mlb6M7Am+a96htXcK8
         A1kw==
X-Forwarded-Encrypted: i=1; AKwUvBwUHVErOMPLA/7nhPseaoaAeRYSiA0Dx+GOnEOLGpVWqjVEw7gONpg4iYUq9Ca6P/DtIztMAS9rTBzpDKFl@vger.kernel.org
X-Gm-Message-State: AFuF++m68ce7Pm7lT3Qj8cr6gNq9TnOw7Jz44N4U3dg0s3jlmrHYueBa
	/Ds/OSQHPRfLgrUmQEyP6w2BU7AjwheV6UsDKRDRcmPSBEhOPg6cY40i2EQQiPduoiF2SmOpV0X
	9zEXrjzMUiWMS4HEG9abCWgJofn0cVd+k0593GGpt/Dk9Bzj9KGm0vwTVqVM06mX8W0N6
X-Gm-Gg: AYBFou2+kVYVSwK4LvcbsWmRF1q2ov4bEVNBkcvd/hryCIW3wnZCLpt6/fhNuuIdj2Q
	3akLUdiMKwk4fdvOy8vjFU92C6OrILfwLLTdSpwfErmkHw1uAJnjVIO8lDFyT6C+YaDLB182w8R
	cLFbB6hAySRAOyg/LBs6G1EfKcRT0efToAbiBYsYfWVNnGfVwm+joAurNYmu4qKExfYcuHStYjo
	g2IQvpPdwfh+8IXvjCWUspgYaCMbKFKeUwlbNiIL7ljqBHYuhgfjo93mSxZocHVnsurqX/CZUrM
	vPkHIjXGyVfiGwyuLPC8HBOrX1iZQcSefBVpZ+X24wGbHPwAyAhPv8VoMjkrI6q4e93ojCFT+J9
	wYMEKnMGOfJkhpK6Rf1yfr9EipZkC/HQiZIRnLlcezOd/3Sm5VoBbJ/mBIj5xp99dtuEX/RD6Tg
	ghC7WkBzBSFLH9
X-Received: by 2002:a05:620a:1a20:b0:93b:d7a0:d9de with SMTP id af79cd13be357-93ca975f4edmr618618385a.56.1790819632013;
        Wed, 30 Sep 2026 18:53:52 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93b:d7a0:d9de with SMTP id af79cd13be357-93ca975f4edmr618616285a.56.1790819631575;
        Wed, 30 Sep 2026 18:53:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbeffbsm341983e87.68.2026.09.30.18.53.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 18:53:50 -0700 (PDT)
Date: Thu, 1 Oct 2026 04:53:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/a5xx: don't read the GPMU registers on GPUs
 without a GPMU
Message-ID: <5ibc3ap35a75ovwrhyeq2qrc55qo6zx43tsp2s5obyukzlivhw@n5tgfcsslxrv>
References: <20260920-a5xx-no-gpmu-v1-1-714200254f76@oss.qualcomm.com>
 <1eca3b55-fce3-4a39-9e0d-2c6d1fcd6a86@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1eca3b55-fce3-4a39-9e0d-2c6d1fcd6a86@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfX4+XlP8g9k5b8
 OFG0yfbxQa3y0bR3MgZef//g9n47P2mPvw41OcTsoN6hTJapa0aUcvOkhZ4g90ic8Lzh2fqattV
 rS2QmnUM14Jw1ux3VtYEZGFdwIAh3VLuXTg6AIZq5a7kcPGHfRe7vVLb1RgRTYEV9ccaRgmLxHH
 MgCclGA1+ymnzYD+cJuK0u5G8n4GdwtUTTVa+euXl0KIjgig3CiyAs+0K6Mu0knaakcbw+2Tx4q
 U3KGiuI2JkmZ+yuugrrazmGWS+FK8qimZlW96zucR1fn5msKDozgquC+xjn/joNj+3g3OyyNKRy
 e7xV0EREGdMyVDQOSS4EgjBKuDotPbM8pMxBT03wkBiDG66R3QrpZbsDu5ZZtFEgVsc/MwL2ore
 NFIPJKAWy8f9revt6z+QlN5afDJEFp5vvnDEfgQwXL+w8V6rLmZd5Csj2TztjjmuFoc7RNMGHIC
 MLBxFJv3OgKAQ98nZJQ==
X-Proofpoint-ORIG-GUID: NPvEYICb2HaXLALBkIT-e8HOJ4Ei3612
X-Authority-Analysis: v=2.4 cv=NedzRGD4 c=1 sm=1 tr=0 ts=6abdbd31 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=B_4pYxvsXjM4UyOe-28A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: NPvEYICb2HaXLALBkIT-e8HOJ4Ei3612
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwNyBTYWx0ZWRfXz3wl08Gzco1v
 P83qedcddfc1wJdP8nTsTT4pY6pdYEXW9sKhNnpSJHThd4bq5a+SUg6TFpUS0h3LM9pZIBVfaf6
 KUy1K9CD28kZ8YRfn55CZYQ6yCmL6Lk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_01,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010007

On Mon, Sep 21, 2026 at 09:40:35AM +0200, Konrad Dybcio wrote:
> On 9/20/26 1:08 PM, Dmitry Baryshkov wrote:
> > Only a530/a540 have a GPMU.  On the other a5xx parts, reading the
> > 0xa800-0xac60 GPMU aperture during a crashdump resets the board -- on
> > sda660 (a512) a GPU hang thus reboots the SoC instead of recovering.
> > 
> > Split the GPMU block into its own array and collect it only when a GPMU
> > is present.
> > 
> > Fixes: e20c9284c8f2 ("drm/msm/adreno: Add support for Adreno 510 GPU")
> > Assisted-by: LLM
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> >  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 49 ++++++++++++++++++++++++++++++++---
> >  1 file changed, 46 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > index 5d96b8f63156..3974aaf6fd33 100644
> > --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> > @@ -1337,9 +1337,14 @@ static const u32 a5xx_registers[] = {
> >  	0xE800, 0xE806, 0xE810, 0xE89A, 0xE8A0, 0xE8A4, 0xE8AA, 0xE8EB,
> >  	0xE900, 0xE905, 0xEB80, 0xEB8F, 0xEBB0, 0xEBB0, 0xEC00, 0xEC05,
> >  	0xEC08, 0xECE9, 0xECF0, 0xECF0, 0xEA80, 0xEA80, 0xEA82, 0xEAA3,
> > -	0xEAA5, 0xEAC2, 0xA800, 0xA800, 0xA820, 0xA828, 0xA840, 0xA87D,
> > -	0XA880, 0xA88D, 0xA890, 0xA8A3, 0xA8D0, 0xA8D8, 0xA8E0, 0xA8F5,
> > -	0xAC60, 0xAC60, ~0,
> > +	0xEAA5, 0xEAC2, ~0,
> > +};
> > +
> > +/* GPMU registers, only valid on parts with a GPMU (a530/a540) */
> > +static const u32 a5xx_gpmu_registers[] = {
> > +	0xA800, 0xA800, 0xA820, 0xA828, 0xA840, 0xA87D, 0xA880, 0xA88D,
> > +	0xA890, 0xA8A3, 0xA8D0, 0xA8D8, 0xA8E0, 0xA8F5, 0xAC60, 0xAC60,
> > +	~0,
> >  };
> 
> I'm not sure if there are holes in these ranges in the hw, but msm-3.18
> (8998 kernel) simply has:
> 
> 0xA800-0xA8FF
> and
> 0xAC60-0xAC60
> 
> (both ranges inclusive)

Yes. However these tables list registers to dump. We don't need all GPMU
registers (and even if we do, it should be a separate patch).

-- 
With best wishes
Dmitry
