Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412175;
	b=1DrYn6jhOlteAi3TNxnI+XqRyIL8fwVR9EsLFQ0fLB7k7P3YTSdtiVQPGI6AqrQ9AUOE
	 9KUNMgNV4hFR9w/nfd9wvWINPL4Zr7O5HzgyEyLxOfex3nYnWj3ORSOX/UsRglder2xq0
	 1VtARhQTJJN3V7hWeIyGSh9DVN3lG3pRx9wkcjBrw7WTLQzWa/LhxqzAgzDdMpc1/FZkL
	 EfGoamz7ysgey/2Zlw3Qsw48V8yhmu8FxRrbsGu9PsXzReCetrsYxCzuyNTEaMk3GRHeY
	 DhbayFyl8lXmhTFcS43Zby1xUjCfTC/oOIO5/7EVVqy+NWKQzJN6sO0Qb6bxL+m0/Ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412175;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=6GnlyLNGY6NT+GSUapR6x1kGipILRzIEm/U/49m1Jx8=;
	b=YUn1iMJFHV0mS9sq8HGccK/g7z4iKCptaY6EbW7M2QEsNI/H/XqAzdaMWmCwLPTJocmi
	 cvqiTP34SHtWCEb3L8j/JbJBAfGcTQXJST//vsKCQOU0ZEneBP6Z2vvjDoJFwAlANJOh7
	 XrPC6OWwYRc8wNObeynhiFXfleumJhKnGks5ve+8GepQU+BMp4O7sKM4baIgZdpIDZIe+
	 Fdc1t1XqfNEiEnrbd7hptNHXToBI+LuVal1WIt7V6VonQgwe+M1gV1+Ki6b4DaSU/XDpF
	 Pjbczt+nO56aas6YcYQKB0pag0CPkKslX7tgJQj6gvSvZsu231GgCQYSIZn+8mfyh9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L7OyFM9M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXeA89gW;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4E4F606A324
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4E4F606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=L7OyFM9M;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=NXeA89gW
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABF1Elb2116398
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:49:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6GnlyLNGY6NT+GSUapR6x1kG
	ipILRzIEm/U/49m1Jx8=; b=L7OyFM9Mc9v8R/qLVa0eB8IM8QxWLQnjY8OwAkGo
	O9WI6UGgHPN5E0wYHCI3bgxOt70kwmpuNNT+9MM8kRTM+DqPkIyUQaKv3+ibjOHp
	+xSPEagLmih/Xq1SKjNoBPlgIs7wF9x5FF+OBizABAcKLaK0D2A/sM6ofKybb6XI
	dftwV/XkDngacTPZ5TRD3cFh1+o49BGUmvfgqNs53K0VMroqbMpZcStIIi4DQIqM
	jiaPepTBxiaFZf3/t+BdZ7/YD4cKsuIjzNO2fJ6rVH619iLpYYFzEcOLcEMbsstO
	lPWqUnmQ3Jybf/B6pPKyvw3EbPpVx3malsXcVl53bv5ztw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawjv5a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 15:49:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9308eafb465so698678585a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Nov 2026 07:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794412173; x=1795016973; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6GnlyLNGY6NT+GSUapR6x1kGipILRzIEm/U/49m1Jx8=;
        b=NXeA89gWtbRl48m8u1D7SO4aEzefvESvPiBUmzaOEpzDvpGsx+2ETilPiJ0MvFiuKI
         MIp6oRXMHlH1GUyEJEK9Mt8C+ZFus5ouVN8wGME/8iXZLA4y9EjbeN6rylr++AmSRjlw
         tR4vpt9T5xanAMkmOSMtWb71vBGhMBFplb8hgWciWTqHCQ3Frffjknt3AdOVQd7dLXZw
         FRH9GkWrXI6Jhuh53DL8pmhTL2mhfngUCFnLhzzAVP6a2z3Yv1HBBpeOmM4HciPSTKjW
         dLpq+hWQeAFB8LWvZe/6ANUjzr3ze7t8YSr/SdJ53vYA7wvS4jZPHVigvlFCzfNHyTOc
         O/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794412173; x=1795016973;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GnlyLNGY6NT+GSUapR6x1kGipILRzIEm/U/49m1Jx8=;
        b=hDF6vMXd1nng5bVPdCM4wFfgHTAtFrOZuzhl/T3uP1g1tl0z0YqEaNObxgyjD0Fg8/
         mi9uBp73XFBTDSi2llrncTSU+IqSE5FAmUrwiOaH7KHY5HhpJ9N4Mdf0Z0kXwrKzyYYO
         Kkkr0MoxgheMP8jQAHQRNOKFB69mZevnjwNHAPvwS6sLe9lXB104i8UYU+RTC9ZO87v9
         epGvlbqxm7ciAfhyKKCzKnEjg4JPdQEgU4OlK3nylEl/hYyAUaoXTbneZp31z9NxRIip
         3ip+Qd/BeMjOxcD+O+FO1WIBKUI8W28KsvUY42mD1OBkKtVFEf5CtJZQ2FYe/2/1nISx
         QEqg==
X-Forwarded-Encrypted: i=1; AL+hErH0bqBh91GvF9kYMKS5nbUfmnsGaNGIBBCU2t0SyYWf1bS8u8X6DIUx9J1gcm57x5lhtpCGZU7g3v7l3g4r@vger.kernel.org
X-Gm-Message-State: APuU4Z/rgmAqC2jB7WjFNhY3nJu4uTJ663wQxGwTmRPYlAUEP2UAZnDj
	DLw+F/rkX+dOpqQJXLQtWuKHo05GVOgO2puuWx8e+R+MxmXFqMNiKbeaz7VdeLcPJMKpZCeNS4u
	N8SNQqU508ATD64QdH+v2I1xW7m4GhhpudInKOP/7Wvb4gyYswqV0A2sXe3K4ImGmmpx2
X-Gm-Gg: AYBFou3Bo+/WqoVjStfta74mflf5iSWiVHsuvh7Yz8HQi0N91qp0mITNVLgG9veNT1C
	7pfgBrXZUh5Kyf6vfiUkrSJvxrHpE5Bxm7wWVFQZ3bThaRAb0q/U1Foduifha7/dHlWQzZVNIKG
	yVqeIA91Yl6nD5p6jjZr8xTS+n/ebrJjqoSQQNuV///7S45//dtGJbZnDHoJY1gfwxvb5hgoSHn
	blC+gGv+eVj/+tbuJSLFSLFdZDaaSUjaFcRTy7mWzW4bmYEuVzEO/fEmlkTZN7QRcl+6t3WD+ZR
	MfBlQ7A273tfs0urDYLCIpizuAdt+tfxdlvPWsxp6HUrODXLdup87N73es/omdNjN2D0Q/1lXVI
	aCFMkAbcdLVmINPt1Ez4ENEqE2nxX+GYzL6wYM6x6PpMiqLl247BwtBRj65U64sB4K/tTHlKZZF
	bw4o2QBcFdadfcOuJT+75tDMZsEdkZM+wooRhNkggPGiGaHyX764QA+8yN4aiWhw==
X-Received: by 2002:a05:620a:4449:b0:93c:a468:2db1 with SMTP id af79cd13be357-947b001c81dmr448467485a.58.1794412172764;
        Wed, 11 Nov 2026 07:49:32 -0800 (PST)
X-Received: by 2002:a05:620a:4449:b0:93c:a468:2db1 with SMTP id af79cd13be357-947b001c81dmr448428585a.58.1794412167449;
        Wed, 11 Nov 2026 07:49:27 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157bab78bsm1006942e87.38.2026.11.11.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:49:26 -0800 (PST)
Date: Wed, 11 Nov 2026 17:49:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
Subject: Re: [PATCH v3 1/4] drm/msm: Resume devfreq from each GPU's resume
 callback
Message-ID: <wivdiwqd366ucltiodaldicdc3liy5smlidwl6ysma5kmkyee3@adxian5nmcch>
References: <20261107-a5xx-gpu-pm-v3-0-e2480408abea@gmail.com>
 <20261107-a5xx-gpu-pm-v3-1-e2480408abea@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261107-a5xx-gpu-pm-v3-1-e2480408abea@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXz/guNcU0BOfS
 EbaPsT5RVpDBNm1S/QvnPxvMpKO9+BCW1wJiU5TZ1BmFVmb2G0v7OF42k5Vo4NQ39kYAtfpsvPY
 +MDTIowl2d3OCNfpEs3nj6MCJ33OT6s=
X-Proofpoint-ORIG-GUID: jI_gKGppJkbPFvWAVbuofl6EOY4vukRG
X-Proofpoint-GUID: jI_gKGppJkbPFvWAVbuofl6EOY4vukRG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX0oMhwJEXY265
 9i+HATZTJJFMKtkrNCotDlAC7vNPZAS6l0jW25xqLhDPlyjYBHNcwECYKbjiTxjt7AfVH9WrGBs
 C1TL/1FeH5sOHFT2gPUv0niTwJAcMwmMvw7UR7CVu9MxVybfgwUDFfHo11YPOpRqJrk8KEhz0sm
 isFD6sO85kfeIJLtxnXQc8qkFfGiNtwbW0FeDfYdSgCCqqqR5SQ6ma9bgaXGHZXr6jru04d2P25
 jcnpVUTM5BaHzEh+LrP6N+lOdD58CTzRJRdCcUyWYTVDpkCK7unX8qWPJZksN40B04sqohghn6Q
 2L0yhGWSYgHHNMBDDPSZO71n4A+beZhpDeAkjwQD5NIP34Js9wbcfvD4VeDjfLdRmpQF7CjEnKw
 9e+BURnpATAMhuJfQ7Ayk/SPcD1QczOTvyRRiCt2EPX7/DXpV+/+wxvuC2qffMwNoX2/b/trfvj
 hSe67ZUYkgRjG+65Cjw==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af48e8e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=gKfNi3ubWl9wpb68aOsA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110062

On Sat, Nov 07, 2026 at 05:26:07PM -0300, Fabricio Akio wrote:
> msm_gpu_pm_resume() resumes devfreq, which samples the GPU's busy
> counter as the baseline of its next poll. A resume callback that resets
> the GPU after msm_gpu_pm_resume() clears that counter, and the next
> poll then subtracts the old count from the new one and wraps.
> 
> Move the call out of msm_gpu_pm_resume() into the resume callbacks that
> use it, as A6xx already does, so that each GPU can resume devfreq once
> its hardware is ready. The A3xx, A4xx and A5xx callbacks call it right
> after msm_gpu_pm_resume(), where it ran before, so nothing changes yet.
> A2xx has no gpu_busy callback, so it has no devfreq.
> 
> Suggested-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> New in v3.
> 
> Tested on A508 only; the A3xx and A4xx callbacks call it where
> msm_gpu_pm_resume() did.
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 15 ++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c |  2 ++
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c |  2 ++
>  drivers/gpu/drm/msm/msm_gpu.c         |  2 --
>  4 files changed, 18 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
