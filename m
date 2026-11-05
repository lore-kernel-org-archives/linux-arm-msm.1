Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914343;
	b=XtZcltifWawLXmmlNws4qvAHXfJORPWnIVlB46Av0lvFWLR/rUBdF3tXODAPjFyUJEB/
	 dEojL1WK+iPlHtiT9JaiiSoSHA65FC/DiK2IxXr3z8WpHvIOhiFQCejM64VsEY3ExbGY5
	 HB/O4kycn4zGrbHVHthdnCuJeqOw/S8Kp/uyD4X4+l+59M/sjhA4jcdlh4CIBxfasXlr9
	 Ccf+tN0LfWHPoK4OuTvCweL4sz2q08O9mtOk0lwhFWo5WP+9YVYrk3Sd9n8SucaWp74Ku
	 gCVyK9mv82Lt2RvwFnUwN3jN10ripcIBp8DdNYrgA9Rv/clPmIs//48QhE+XdY2cchA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914343;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mHNN4UGYk4f7WxUC5WbYI+QRTZfXHOpEwWQNcGzXGsQ=;
	b=an/zDKhuc1pr2b/G7fIkuql0kA9XVQ5i6aY9vC9K1v2saTX8ywbAYezCTpHU6l0LmIvX
	 ecLxw/fQg/WveEQDW5nSBDDHJd5vOae4L1Ngg1nefodVnfVWCG4R8pwMiBpl6Ia0EO0Fg
	 D8M8Z+53KUQUifFyPLRZyWPUgPZy5BPZ/FtNevZU9Xg6BbNDfNDqDhVOCu6SRVmr8+Dm0
	 iUjHKbhrAnPbI4Mqhk/Ph4AbSyCL+j89HHNS4eps7anCkXa2XgG4GsyjAJ3gZXlNSxWBK
	 T7fsPyl02KpnYkQangHKY0pDIUsO8qTVr+5mgYCLuw3euQcq+e9uHoBHUSfGytQPTRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vg6n9+Nb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MAhnk45b;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D79606A32C
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 21:32:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07D79606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Vg6n9+Nb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MAhnk45b
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L6t95337494
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 21:32:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mHNN4UGYk4f7WxUC5WbYI+QRTZfXHOpEwWQNcGzXGsQ=; b=Vg6n9+NbGZTtVHdj
	Fz7wYa9/FYcyzV22b/1Gg82MrUzkIbdIZmOWOiV+6e/ghF3OVDd6TM+1o3rpdmqX
	9yWlE5N8F91vnpvAozYHL4nPABbkacPq2npUzkH+Zv0a1AcLPmkHC/e2Qfz71FOS
	wCpHILOloAPNxhhbGU1ByUvH+WTMUsm6wO2Ts1qKAcof9FTEhiuh1cGDZbWYu8wa
	HaelUJcU1M70JJDABgwx0W9731gYoPin3mM5O7pWXAKMKiEVujaARKftk9Y82Ndv
	4blXjOTnEuf8gzVqzRnyigSOW+eWdQrKZ6RMUXsXDT6J85ncVEEdLCOmFyl6i8bF
	+PMHMA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdtquk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:32:22 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36d2a94abf7so644098eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:32:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793914341; x=1794519141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mHNN4UGYk4f7WxUC5WbYI+QRTZfXHOpEwWQNcGzXGsQ=;
        b=MAhnk45b+TWNQMmPp5k/WVCNhy6/bIuWrS0jKc2es+ZEXRhgFIXv3iiniEU2NNNdoz
         gCVDgrmsmd78B4AIw+PGcXwtigdRxQRFeLcOZnXudtI+2NHTW/4Zuki6Pv6V6z+wWRTd
         E6vAUsKMrljAUqaqqTG3rnPg0LY3FG8qNiNzs2LfB1TSj/6KAJG2gpwqO06v7vJv36EF
         +spVRlMh6/8AR5yopY4jDU4atj2UOUCbTeKBtTjPKqM9cdOIQ/3yWVtKMFzjV0YMA2sg
         gAsexbABVWUmzjpR7rmoXnnGtimk6wd05uO1oK/pnk7DljPFtUaF+yxRE9SIEpVGct3j
         4eWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914341; x=1794519141;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mHNN4UGYk4f7WxUC5WbYI+QRTZfXHOpEwWQNcGzXGsQ=;
        b=LaU6HE5nFZFt0Yi2UMLG8BDTWcgdGj8jFGngyTRRt/LE9oCBTvDwVuP8/+99Nj+3Vy
         HMWywaG6tkYBT+ugI4vCb/DRF8ZVQx6XfdNHDsJC3WcNqiKrayrp/9ku4fXGxDxUbawp
         xOV2HimnSee5MQWg8pxwQMqhe2TO7zWlUmNDxAFXxEo4YyODxrlaYy081n7Hczq8m/Fy
         5qx+tKujuDF8QmjwuzD/K12tlGoKvEZx+Ec79uWzGY1dUXWmhTvavRCRj7ZNpaS9pN2m
         cGowgAXZkv485oFtQnGJdTQfWgBTYjW8ds8bnnuMQKPeZksJ6bhxxDBXjSeHwWiBK/ij
         8T6Q==
X-Gm-Message-State: APuU4Z95EvudN5r+9Lt6MG+fsLGPW7IHqRkdPqqfciVzTjoJpte1Mt12
	Zi7Ue85UfPxgUu/qAXiwHdnnL3Hq5bO0gFGN7Mt0x/82+Epyiie3uxOeXbWfbK2/qSSw6XuEw0k
	mu/nuDc8vyad1I9yegK3s+W+7fckkT146uKay3Mu4gxDBpLMWFRxcWByG5uD7gv5HW37M/qAKdQ
	CP
X-Gm-Gg: AYBFou2edt6wu8Jp89TtJwSxzkrKoJApg42AZ9ECb37dJDqB3cG0EW+upmq6M5JKDQ6
	twuQfRlqSNtKwP/q59oPCwoz02eNiPe+Nxf5mjOebAmCqRseMoumw2229CgyjEQVeOZah+afswL
	YwJE34YhgTK0RCEADPzwudMwPiY4alJVslDgffVPSmRJERsEk9scNdaHDlItXPlEMGNWnogrDsN
	NiVlZMGQ3mhcDQnd39qt210066xQHFJLxtFiR2JHHMwaVFk0tqkAzgsoaGeRgYBHCqz0MZnIcQK
	76fF01dNptM56jOJnOR+G4kGcxAU6Psow0LoemsVpknAI0meCEa4I5BdaTQMKZFJcO3vMuD1pnI
	7Fia3SHlbq+3WBV7W4ACy+A77ldl7p54NbkII0hZkqFcd+yiXhbpXElu/mzgBpNNgjgVWOEQ=
X-Received: by 2002:a05:701b:4552:10b0:184:ae11:51c8 with SMTP id a92af1059eb24-1b24f4e1984mr4785385c88.23.1793914341064;
        Thu, 05 Nov 2026 13:32:21 -0800 (PST)
X-Received: by 2002:a05:701b:4552:10b0:184:ae11:51c8 with SMTP id a92af1059eb24-1b24f4e1984mr4785332c88.23.1793914340117;
        Thu, 05 Nov 2026 13:32:20 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c772fdsm22496768c88.22.2026.11.05.13.32.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:32:19 -0800 (PST)
Message-ID: <28a3a810-dc7c-404e-9fb7-35bb2daeac15@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:02:13 +0530
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
Subject: Re: [PATCH v6 02/15] drm/msm/a8xx: Export aperture helpers
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-3-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-3-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aecf5e6 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=AFLW1XQu_-GHGceg2_QA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: ylliKeg6q39BOADuRsikydVSfO9Z9MyU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfXwBzAmQgXMWuu
 PzAL8+8dM8Wdi8YnTSwwBc6oMH2ekjLRBsCUl+6VKYs9pU1Zmt8qRUy9ePqOuZYfgsbNSo9RY7L
 EYTUelL0v7RnGcqccHBqPFvGEU6oGcU=
X-Proofpoint-GUID: ylliKeg6q39BOADuRsikydVSfO9Z9MyU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NSBTYWx0ZWRfX8cB75pJvxSSg
 YyvaosflyZRR92WT39XD+sY1zZ0L6RNtUnjmEmUq+KyLuc6/MJlP3Sdun5x3nMLrv1yd3wlG+Bc
 enz9DJcdIDehJGdRYPkqnLbtpIE97+/46O5NGu/JnHexCS/YaZPY+6AIqOGzYsZnbvAKIdtFSOe
 yipYLFHM+YbwNPElT1EiKolCkhgmdchtkHQBdiwIDZT6CmJpxPUChyJT4Fc4Ia5ONlscvCiDGNb
 b0bb4bZ6XQHJjxzX5AFfda9r0vl5A9A6K5RNv42GGYMtt3bVY1XbbAQ2r7nmIzU2ChtWHNf456g
 E/OH9FUjYQXl47dVllxbHcCMTQjyixv9q3dMsyb3rvyg+e04JjIo5g1ptvwaK+++Pr/IEFCP10y
 gcgFMIwlFCUsda6LU7QFwYpzVY6E+gq3eOLJpxWTkUM9SKTnfs49kmFx5q6oET/Wyiq0PSe8nWb
 7XMSipjsm7auD2T57uQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050085



On 11/6/2026 1:59 AM, Rob Clark wrote:
> We'll need these from gen8 gpu state snapshot code as well.
> 
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 3 +++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 6 +++---
>  2 files changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index ab4cb43e4a54..c58a2665e9ab 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -346,6 +346,9 @@ void a6xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  void a6xx_flush_yield(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  int a6xx_zap_shader_init(struct msm_gpu *gpu);
>  
> +void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags);
> +void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags);
> +void a8xx_aperture_clear(struct msm_gpu *gpu);
>  void a8xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
>  int a8xx_fault_handler(void *arg, unsigned long iova, int flags, void *data);
>  void a8xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index 25ee3ac16ed6..82cddaa7278f 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -32,7 +32,7 @@ static void a8xx_aperture_slice_set(struct msm_gpu *gpu, enum adreno_pipe pipe,
>  	a6xx_gpu->cached_aperture = val;
>  }
>  
> -static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
> +void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, unsigned long *flags)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -42,7 +42,7 @@ static void a8xx_aperture_acquire(struct msm_gpu *gpu, enum adreno_pipe pipe, un
>  	a8xx_aperture_slice_set(gpu, pipe, 0);
>  }
>  
> -static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
> +void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>  	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> @@ -50,7 +50,7 @@ static void a8xx_aperture_release(struct msm_gpu *gpu, unsigned long flags)
>  	spin_unlock_irqrestore(&a6xx_gpu->aperture_lock, flags);
>  }
>  
> -static void a8xx_aperture_clear(struct msm_gpu *gpu)
> +void a8xx_aperture_clear(struct msm_gpu *gpu)
>  {
>  	unsigned long flags;
>  

