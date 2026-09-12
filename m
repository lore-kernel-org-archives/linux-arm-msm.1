Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD14360EE9
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789226260; cv=none; b=RYgOoNuaPJb6L8GTdfvdgKAEVk/DWeBhVkkXOtDN7gjJeWejpsFs8d0V3V0nG1vwI2lAqY99k2ump1EJt/qPrfDeXF0eajMRSS28RdfQfxt2KqeEQqr+rngILmfUHO3lApi60knxbuFU7p7N403kfFkWkeHdKqoo6W12NSZwA48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789226260; c=relaxed/simple;
	bh=ZqyAgQy3kf+Kwftw4i05WlYUQ7whJq1EaoEVarCuMt8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UwpQdxyHnu3F5fyVHDtxuLOQlHIpGY/eQ/qrrzdHpZNbJCG/SuNr0Lw54AXpMyHad01B+QI94GIwWNrl9b6Dlny1G598valP/E7KMVo1p2ybKBCquFWDTWRy9e1uV/sZ8tHfoEbwKX/1fFWuJaCB/+FQohv23yG/Aa7A+bICCsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pfqv5n9H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cjb6x8cZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pfqv5n9H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cjb6x8cZ"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68CEdfC83249794
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:17:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DxV8IeqIQCW45D15BdZkPDG3iBvqGgjXMxRH57fUWiU=; b=pfqv5n9HZ3L6Uvic
	C1+bM5SMpH34M657wyw0PdhK+YeNjqHuFiyM+wU97Xf81JPnyFZ+OHT1hOYLBfyh
	y0666Me3uKm4B0ijzco2TACGTqFzXjXMYIvtj5PQm6whnLFu9Q24kuJEh6UhfGtj
	AvwZJJ6Tg/ZxRsfMtfLeiPiF6D9GG2gtlhibHi1n2kHj+cJPCIuAr0auxROy4gaB
	kY/0nU1B8VL3LRPIY1L+w4E62ET/czloZ6ONxv2LZkiw9h9XwPtND+O2PQqwlp2f
	Fwny9WNEmM56gXEpFCSyOvTAXGQ9sJbdwLBoqDy1FOPkjq8Xhpr3tbsxCnV5ueg0
	xl+LRg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c17k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 15:17:37 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-86a6f4ba619so1980863b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 12 Sep 2026 08:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789226257; x=1789831057; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DxV8IeqIQCW45D15BdZkPDG3iBvqGgjXMxRH57fUWiU=;
        b=cjb6x8cZTR65+3KJssR4mpblMPXGESspgRlixbAAHX/KXhxb5iK99unXKZGhTzK5uq
         qNPZQSY1ernzk9Tmo3T1hv56RAf7dzF6WQiWWqfLBFmyJd7V7Voy6pr8at5/xvEyxfi9
         J/an0iUNNC7ZHTAFeGKw0hchx+aeUpNebFVuPE6Aego99QhXMh8rulROZd0yQ9WVmHeF
         T8pgirTXdAwxJesZ+ZHerdxURdE3v//KmX7fi1XPYI2LtQ9u7eAFceknNtKOqCA9KtGS
         15qroXyaYzajspXy1wYzjH9ic8J528nWi561vVEmey2XpOulQY3XNPnZ9iYjIjn3CpFP
         Ztvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789226257; x=1789831057;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DxV8IeqIQCW45D15BdZkPDG3iBvqGgjXMxRH57fUWiU=;
        b=Rs1UKUvbCIgw3UDX/ivBitQFXt1O/z04OYjnlhLj0aFjULVtzpqyqVRXny3i22slc+
         VXDTLfXtBNWJ40G6tmLpOdj3708blF7EYoc6Vy8UpwcsbALIzmCwsqnf26SrHmN7jR5w
         Rb/eQZACv0X5SwWbPjDFTF5RFMD/KLl2EilY9HYKdZfmr9hi7xrduQY/ZEv805pmfMTL
         DhoPog4hXWwFZ5G8GKOBYEIa/pfTybmuO2fEftwE4YcDUpeNFavaJhFPee8e1lJYiy7N
         jndid/u7P3LLxkOOEx7oDpTAxCh4cqOKOzNSDAzZTmHONA/J1+NUa9TKpmUYzaNhYU0z
         5Cqw==
X-Forwarded-Encrypted: i=1; AKwUvBz6Z1q8YKqXYW59MQfshNWg/Fs2DuWEerI7mc7iPtKbQKhz92L9MPuPF7BjsFshvVL6XApcWtpmgba6TW9U@vger.kernel.org
X-Gm-Message-State: AFuF++kL3tNWd/uZlUSeBn8FwY6hevKwf17PnpJe0/lVPZDtWm1QIc5d
	rZaIY9Xrk70LGI8y3Sb799f9ilsWnhP/Y+5iR5J2kn19QFvfJ0aeNuw9bfpltrJUSvcn9a+dTcG
	+vZVKHWKVPY0ETTRlscAMYwzitryasMl93rWqL8gptfIHe0uRd3nRkUWjJMhK2TJwHhyP
X-Gm-Gg: AYBFou21jWWHSE5l2e390aGMPKx0KH6gqCRSfEJ7j1WwwJFDZCa9luq892pTtunTqZW
	RqLst2uVdBkKv3O0zhI2UAbKpm+IQzM0NzYrzHve7A06TR03rG5jwUE72wCM2j99uMUbmJehp1e
	gRUBx5LCpZo3IZwCB/8/Q9Gu3Ycq+3TE5qZnSxcNSbqmYLYnPr8a2ZjtRZ+iP6KtN9nxwdUDaKj
	2YmoLk8w4smYaf84l7lwNR7YBkmKkIMa+MbpfCd1iALo6o+enaJfgAF2biP0/0hGB6GIVZJLF7e
	/rwEs6x0n4iLLnfgPlWawVPoi0UoIlLNhdvTKH24mr1ERj0z0CDFev2wbrZmx/oKerjYsatTXNF
	Q0iocICVGmWYqGgXujCjtekENpg==
X-Received: by 2002:a05:6a20:1441:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3daed5d254cmr18886659637.16.1789226256752;
        Sat, 12 Sep 2026 08:17:36 -0700 (PDT)
X-Received: by 2002:a05:6a20:1441:b0:3cc:eea9:f757 with SMTP id adf61e73a8af0-3daed5d254cmr18886587637.16.1789226256341;
        Sat, 12 Sep 2026 08:17:36 -0700 (PDT)
Received: from [192.168.1.12] ([106.222.234.218])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4e51449sm12386938eec.5.2026.09.12.08.17.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2026 08:17:35 -0700 (PDT)
Message-ID: <8c23a2a5-cfa0-46f3-b8c8-61487093d3e4@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 20:47:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx+: Increase GMU FW init timeout
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Greg Ociepka <greg@ferrisoft.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20260912150915.28700-1-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260912150915.28700-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: HfmkwEaZ2GsXVTLWxysacD9VuXYL5kZ-
X-Proofpoint-GUID: HfmkwEaZ2GsXVTLWxysacD9VuXYL5kZ-
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa56d11 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=O4klB1SvihdYS1QJdo4Llw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=flHQxk_lLiAmmIxDZ5oA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEyMDIyMSBTYWx0ZWRfX23p++vROJigJ
 VRC8YRh8EN0Jv53lNvlOlRfMfZpiHnFciRyj5xTBnb/kXpyYPVc1Vc3zmX4lEYn4MDpFs23hT5a
 vMU3yQ4BvD8PAwRFEmR4EmfzSgWZUXmoTv/cbTb1/hxOz8I/xlsYuE9q3yYBCpUminwvPe7wBmi
 mjahP4JbWPEJ3NIBdX05ny3PQeGLVCO4NNAepxqC94yys1ilPfnAbNFCWHCPCkhAneCNOgZFYUa
 T3f027SHimUOwXOO/GdjDd2jWjGmZdtZeAQVxY1T2GEfvkHvPWgFfGNq8+9U8IgOqFxHtnt6+57
 I7w1LcLdKqQTBjPeqggHB072W8eTfmH7mHRC7SpI6wh8oy390JVWYyU868WGa7t3zYu3qifqC4V
 cfOmfEL1sawOF+D4JsFJ5om/31Su6u+C37QCG1KzpayFqPBWi0YEmD2Cg6fTXtWq86mu+Ndkocd
 XLg8WitJPs/Px/8WTJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEyMDIyMSBTYWx0ZWRfX1y6NUi+vuEJg
 gGhCoOXZmXqgHyZfPCrQJJ63JkmZN8r2fXoXy16dZZylxGtoDHne+rmE4HwvkVS5wxgJrLtd8KP
 ble9eXv7nl1CA7aQ38EZWBIvVWCcsKE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-12_05,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609120221



On 9/12/2026 8:39 PM, Rob Clark wrote:
> We were using 10ms, kgsl uses 100ms.  In practice it is usually takes
> less than 10ms, but very occasionally goes a bit above 10ms, leading to
> a "GMU firmware inialization timed out", from which point things go
> south.
> 
> There are probably some things that could be done to speed up init, like
> increasing GMU freq.  But to be safe, increase the timeout to match
> kgsl.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 2170bf7bb045..9290010c8cdd 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -320,7 +320,7 @@ static int a6xx_gmu_start(struct a6xx_gmu *gmu)
>  	gmu_write(gmu, REG_A6XX_GMU_CM3_SYSRESET, 0);
>  
>  	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_CM3_FW_INIT_RESULT, val,
> -		(val & mask) == reset_val, 100, 10000);
> +		(val & mask) == reset_val, 100, 100000);
>  
>  	if (ret)
>  		DRM_DEV_ERROR(gmu->dev, "GMU firmware initialization timed out\n");

