Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB26038B125
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 22:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789339692; cv=none; b=XhLjPvrku7t5ejWdy0zy+emuZz+/2DYhFU2RsWNr7gmtowarXIJZdCyoXrFuHWDQS6ESCI4bWKdgP8QnNXrbBX0bmr5QnHkEaRo/fwBRkQ5hylinL7S/xHJQ0Zfffb1fbTM/V9UYHQZuAITYYWHlDeSwpBq2bNMTNpJdMK+5fUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789339692; c=relaxed/simple;
	bh=58OgDlTMM2M00oxH9nm1BTrz7jrOAurzgvEz8WXteGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tdDgMKb1HHq1p0CMTXOCQf8rK23On4cDCPyapVV2XzbZLWKP8GVZzAxK3e3yG04k4iNq85/C0der/WtIw61seraU4KVJy9B9O5F+2FadyeslB+uBYU9l9TYbMcNHh5fQGOQNYNPXudsy8O2sbXGsTgIPVdilmvlzcG6IqfyNK2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lz5rRZ5D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzYtkcAU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lz5rRZ5D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzYtkcAU"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK04Wp1986787
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 22:48:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UClHT6BNKVMxCVVP0I8xuLd0
	OwsPHW+1D4sWw1kmvxQ=; b=Lz5rRZ5Dd5AzE7gS0Jn9i3iiurCBGSRCfwyVxN/g
	CxZYWhCMqwH3WEWRWsr/9uW+6pJ9MwFZb3iRAQSKiIuNnIE2VAjRUWM8Q0M3vv0J
	UgBygzx9XcUaRiUNUBjGhevVG1QjUP+0p4TC63tUSLCDFELTIKRf7KBiSHqA6Y/e
	YTrL2kETJ49NWMqTzuj8+wU066KHimFTtfGPlxt9pSj3RezT+r7IsawXHoXr79H1
	LRcSmuTCSqQIAuB7ZRdLuov64jdsrXKEZpiU0dly+V87iBqXPFztBBgi+zOkQIur
	CD80ex1IaAos6ScioZ40A4Aqwi9A6gTUs2V7XXEzx50GUg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cc8db-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 22:48:09 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-97e98448895so360715241.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 15:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789339689; x=1789944489; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UClHT6BNKVMxCVVP0I8xuLd0OwsPHW+1D4sWw1kmvxQ=;
        b=MzYtkcAUDHxaj1finVz9ID7OJMqNTpnstWER0Sc2l8hNkjQoRPliMCAHssoTZf62En
         1cjglcgw9/9x7KA69Nzbv4PZ7sU5YoOgLMu40Lb2ri6jjLkFpKNnIjLv7D2HKi6oeQGI
         v+VtSGIxV8WkxBZB5j5ahXa8LCn2SilccywlBSQMc6YtR8EAKJzp/pmeEYjG4HWHzxfP
         jRZfr0MJBFhILto2JZfS+jxmnYF5uPhIFL3Ag8wT1I1Kfyx5nsI5M7+yixeKPTwDk/fq
         i7Y+ufGU1NFLNZj3HJINqOdb/glTTGlfUZU/wHncqwzXo9nfE+unCv9sE/y7YZmosgE8
         GwSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789339689; x=1789944489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UClHT6BNKVMxCVVP0I8xuLd0OwsPHW+1D4sWw1kmvxQ=;
        b=LqzON488EQUjNTOLoYZKR4Jco5DZszN52YA9oAwZSyiKr+1W3N/kbxR6YbFbKSKbbS
         pB9KA/Hp2YmywvNKDGMMfN3kuz8Oya1cblP6+Eq8ROlv1yM4hqOrTOE9MXWvAZTzZjNL
         0Aj7Yl/y/wcYHzcnLMsA/TmpTnwxptv2mPnGC3MGi4ALl49aSgE5Urqk5jOQ8Keu6iyc
         iK7CbP7GfFyEfr0qQZBKLl9hnsR8Px3oMDh/s3kL9xQsp1NF4Fg6B5dKJO2LwV6jdStU
         DE9gL9UyvxX2PatWeKl9HKDfpCd1qFl0rO16du5ixz4vwV5sXKO0NkDh3MiPvUEIaiWX
         oHoA==
X-Forwarded-Encrypted: i=1; AKwUvBzvz/FAVrZofL6ALno0sKw3m992sSMw40IH/GwUhV0Vmfxgu+98EAIwaw+zh4Tu7MBJSlYN6am2gqMbkcL5@vger.kernel.org
X-Gm-Message-State: AFuF++k/j6pD5+nqDMTRMFiLJP7NXSQRlaXbbHxhjt0WExb+CTW1XtXw
	YFEj2kyZ6ZqIXbtbIywtreoIMWbI+JacInYhM1VRPD/2pM5rOI7hK8s9HtuJiUj6+FyGnNL6XYg
	5wA5nHgQJg97AAiSTukZRFXUqZRaKc4g0C37S/YXL0/NpBQxrDtxfDFraV6eWEVOjbX3+wHtW4X
	bg
X-Gm-Gg: AYBFou1wTKUraYhE1zTqYRGOe+T9fuGfi5r9hktlEG3GOAH6cWP2NAZt79wSiBIrnKu
	9TaQMduBzEgTUpaxl/LMIQmNFxp0ApJ4VF4r6U85UmrhWMmLLUGSqY2Gd7ngNXDgTpF2BXDxOL4
	YEvUdtU51EglY4lObAO4bn1keE0ql6YhAZx1LW40E/wiwcxav5Yx18e1nIVPSMwPZhPrGxQYizk
	PpR1sEUyDC8c6Tlr4G93l8UzJgEbw5OAuTnTT0OvuqbvopKDQdqglCYZuuS/CtFhcH4RiBdYm51
	W82NIPimw7/2GM9F/p01ISkxtVt1oyk5i8tIjvoWZXe007VWr0MsLNte6mX1Gxneso0oRqmFRTs
	DblM1PEcB/nCY5nJLrcRyApW9+Uo3Bq7qLhPb+BHv11yt7WXNuTXWA4sO9e18OKqiVv869fxsjG
	dRjQ/a9PPQGDTf
X-Received: by 2002:a05:6102:554a:b0:784:d83f:2a59 with SMTP id ada2fe7eead31-795aad394c0mr5074044137.9.1789339688784;
        Sun, 13 Sep 2026 15:48:08 -0700 (PDT)
X-Received: by 2002:a05:6102:554a:b0:784:d83f:2a59 with SMTP id ada2fe7eead31-795aad394c0mr5074036137.9.1789339688314;
        Sun, 13 Sep 2026 15:48:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a5a3144a4esm22118731fa.0.2026.09.13.15.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 15:48:07 -0700 (PDT)
Date: Mon, 14 Sep 2026 01:48:05 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Archit Taneja <architt@codeaurora.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/hdmi_phy: fix runtime PM cleanup on probe failure
Message-ID: <rwzplkleui7i334kfsaort2iqgqwvg6pesk7xm3v272zupgmae@7whuqr2rk7if>
References: <20260913085814.1509352-1-lgs201920130244@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260913085814.1509352-1-lgs201920130244@gmail.com>
X-Proofpoint-GUID: yCjrVaFpPdjfvp5Fc5Zr0aSDG_u5fDMK
X-Authority-Analysis: v=2.4 cv=Pv4G/AM3 c=1 sm=1 tr=0 ts=6aa72829 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=eqkjudQgZ73XcBGNVqcA:9 a=CjuIK1q_8ugA:10
 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMyNiBTYWx0ZWRfX0w8GpM1kaZc1
 hpERIdSwOBMbvgw09HrheSwQSwmR1PZYqEL+U2geiIzmWs3et+5bl8B8mjFK79DvhnTvSJYCr6P
 moEbGyJIP/dYeawx4zTcq/EHtWGG8oY=
X-Proofpoint-ORIG-GUID: yCjrVaFpPdjfvp5Fc5Zr0aSDG_u5fDMK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMyNiBTYWx0ZWRfX5/jR6iI28APF
 cXP3RzNFKApQp74JnMDf/rhT6KfJ/vUUdl8r1uEhfNaS3f9usPswjKRtZifYPFg5nbs8crSpXUo
 luNowWsJT/oHR9FLiSrVGlimmeQYMwObdKYIe+dJGwdsYm9tjIvYG8b3+YRA3tPVqN0qhtvRJPd
 VO2pKbMDvviZ4VWsLZjVYyhaYakG9DH2e9msbhY+Fki7IN9+uLw77twsHiLF1Z4ghyktUGS3Fwu
 y26AVJEafTQI+N3fZORqzbWTEDiqGGd4yzne3Osk05f8THRPvrUNBLxHZLplShvPyixuFYgrT1U
 LLnpq5s7YqeByGNzGSXBV+jSv/WKmJex5GZnf10mXPfyZE3BbctYfVb6cDhyUXyguh20jJ1KJm+
 uAzJ5i7P6Vo133WORJGr0Lb7T9jijjxnmK10TiR2u5nkmn4OGQnHdb7mpBm4P34FL3PNKsfe5L2
 7rhnyS57ta743XOuRGw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130326

On Sun, Sep 13, 2026 at 04:58:14PM +0800, Guangshuo Li wrote:
> msm_hdmi_phy_probe() enables runtime PM before enabling the PHY
> resources and initializing the PLL, but failures from either operation
> return without calling the matching pm_runtime_disable().
> 
> The remove path disables runtime PM, but it is not called when probe
> fails. As a result, runtime PM remains enabled after an unsuccessful
> probe.
> 
> Route failures after pm_runtime_enable() through a common error path
> and disable runtime PM before returning.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
