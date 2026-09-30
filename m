Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AAD3546CC
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790774310; cv=none; b=m/xcvCNJ85r88KXpFDXTTeZ0r1ax1uVtJyQBt0lt3ac1M/V7k6doLLGQdah3GcZyQKTeG2rhYnZvKhMTleJ9wTomxoI/EiFYC0wlP7Wc8cRH5wU+OZmKOv2x05++B7u2WTznTa2w8pcJqMlg9b491JF426bFkdlIge491LT/0Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790774310; c=relaxed/simple;
	bh=sne0r/MKtkzpA4Tun8W2bH7vt1HfsOeiaDBFoDhlFpE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eHfP3P56VHDIV54uZao4YEFVHdLk11LeYupENouwSKtqwOAF132r7R2PMg5IEMI7kwkGVzsRSMVMygdAImMNgiVFpixNbfXGwPOS5DI9hQf14ftWr0Ng4fBpyWzsgB/798G17yQfJSWfMJUvNrZevQifUkf44ytxEj2bdwCbFYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FJPtWyJ9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M8QbeJly; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FJPtWyJ9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M8QbeJly"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7bIl3135730
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b0XeiQBP16z/6q+80+PDDqmE4avHoAxEAHZJWQwfonY=; b=FJPtWyJ9lC84jmAy
	UdE8XPWuqaWr2Fs+U2eV8/QCyFXkZEBEVvgg0H7WKZvOLg4nYDohqPiVKw/dXDoF
	nVSN0pnff8rHlByEHm4vYplfJFXllLmBEmLzm1RcwOXfQPAIQfb3vpbLjoLJjRVM
	cFoml/4I9e9UUcBZvJgDa7FzYuKPIEJ64OTk9oK8rcxO+QdEVu4Q9qeIaXmqbGIi
	/xE2Nqd04rBEHrO9ojho/gFx4CiIxU4Vr5SMhcjdGcgOGvxe/42gGr/HFFdH2pJf
	+YzvVeHhRSVr61YrwFbO907pkSBvulS30Lro23POfcrw+paLp2rrYS//3jTEtkJH
	yKqCIg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0x27hjn1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 13:18:14 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d94a158dc8so76534095ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 06:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790774294; x=1791379094; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b0XeiQBP16z/6q+80+PDDqmE4avHoAxEAHZJWQwfonY=;
        b=M8QbeJlylprAKp1ZFO/dwJHvI9sfQTzh57uIGYFnzi1Tb8V2n8+kCXTjWP8Y05TOuu
         ZLnZnl3Dy0IpkbOawMU8qgz26WAand/eBl+e3ParC5C4Hmse2HRY/49W3J2vr28IMEFi
         66AsXPwOJqY4QFtJQWz7/EnWI6KJRg0Kc/Ce8QNy4q6vSECfOH5tSZbj19I3xO8ewwOO
         yTFAcJlIdt8G6Ts3MVy+dTqR3lpF5OSZwaLPSa5RH3pxN86s6sBFWdb2QHCGqr9Q85Q/
         8eCpsp8Tg1Np+X23i7UxfMXbKOXx5P33KWtq13y2pYoV2ekQO0AEC9iseWstufqN6bHM
         MT7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790774294; x=1791379094;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=b0XeiQBP16z/6q+80+PDDqmE4avHoAxEAHZJWQwfonY=;
        b=RoB+w48go48RMTDZVQ0K1tVRXstsIpxNtcD0qMEcfUvIL+AYFYCoadkakwVk6lWANm
         3zlkVGW+tiPZARKs6ITc8uWyy0PcgJX06kbdFmUvIru/AiMaGenHxkIQMHgFKTr7dnyG
         KGM1O9w1d5Dw2YPJPWucjzoiiaXjF8IllapTdZM1zduxC5mDM9QY0fBBX3qCFAxxmPVB
         1j+HZoNONsiEVdwoCJZFi/kUW80N9FKQ4r2azIDZ6ov6tfSfr6uUXdpbAIzMWKWC2dH1
         pmOiMsABAPnU7LHNT1KVtRNR7F/WKzS5dpCbyDNAXh7UYkAqe6ZtSkyVjH2PIfketBZ1
         pUcQ==
X-Forwarded-Encrypted: i=1; AKwUvByMyMOzyIc+lf0p3WfxFy/+iiBCleTodD+Db8XYFigXaiwprC1t8G1aNkSCUN3mwgyh61gY7xdPAYcwI2aJ@vger.kernel.org
X-Gm-Message-State: AFuF++mSFJq8AEYqRyPFiREo26EJX9qbytRaNloa3rE1vr7KSZ8bxWQ6
	ra3XHf+FytMIwPfdquKgruoLDeT1/McOC+wdlyojnEE1aVOAEf7m758Qh6HoZIRaXUhVoSlgmOm
	K7UZzSVEaM2T8lk1dyLlZ84VlX2BAGnF8ULvTp/PjGEuMOWi/XLN+uj7qulmIrOSBnX+X
X-Gm-Gg: AYBFou077rjr3WewZb1rDB/1JVe87MNikfaSI7KP8kq+XTiIcceEZMjweFpTiQmz37F
	IDCH4pgMQ1nwLOiVu+Rm1QPvwhhMJrXjV9ZqvHiFhQVmZnW3bTGF6U6AhHe3MyNhTWqVBJ7bnme
	Zj2tQx0Z6lbK3C2aJjf3PWS6PAwcDGpF+a3FvObm9vk9UiMi2zrrwBmTUv9Bwen/sA895qiTrRt
	i10gON4dJxBHk+K2eStBGRShTCzw8S/LvjTKYBHm73Ii496+GDWyMNeABZEqWKOvuzqIKCYEJC7
	/9+x5Z0iTXnVfq2vgUwuCVFJ0I0GzOowQQGWVMg3SGSE4/va5UzPQFyhyRdk4TzEZtphppMNPkD
	RPXHwDLtpk3j/1FQ3BOtZ0IBN
X-Received: by 2002:a17:90a:e7c7:b0:3a2:af98:3c58 with SMTP id 98e67ed59e1d1-3a4d059c0cbmr1474822a91.0.1790774293613;
        Wed, 30 Sep 2026 06:18:13 -0700 (PDT)
X-Received: by 2002:a17:90a:e7c7:b0:3a2:af98:3c58 with SMTP id 98e67ed59e1d1-3a4d059c0cbmr1474784a91.0.1790774293087;
        Wed, 30 Sep 2026 06:18:13 -0700 (PDT)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e697008asm389132a91.3.2026.09.30.06.18.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 06:18:12 -0700 (PDT)
Message-ID: <d6cb8aa3-1360-47cf-9ec2-e2403974bbed@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 18:48:06 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH msm-next] drm/msm/a8xx: report the GMEM size of the active
 slices
To: Rahul Pon <theflyingrahul@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260930111711.1160-1-theflyingrahul@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20260930111711.1160-1-theflyingrahul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA1MiBTYWx0ZWRfXyBOXE5dytw/S
 mCmCjeq3m1CGMl4+Poer6rMXlQzldXjKFo9ilsnZxMyGkTKFd8PJO/z2xe9uqpbsvITrnA0815t
 6EeBpHnxwx6SyGlYzPzt3yt7OEuNp2E=
X-Proofpoint-GUID: 8qOpkqNAi69Ngz3XaFQ74h5CyRhETKsB
X-Authority-Analysis: v=2.4 cv=W9GtxhWk c=1 sm=1 tr=0 ts=6abd0c16 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Yh4zZjHgJ5e_gT9T_1AA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA1MiBTYWx0ZWRfXwHpf1HvwNF+e
 nZtrIr53fbA6UBzLRLbCBQTzIOJ2uqode+k7jMUMoHWQahggjkDdLyd2s1tDHygB+tGKsIT+GNz
 G1x+3sxVKSdkjKXVFS5oUOe3Va08KbRXxEuKQ7yK2Idn62sdRJrgr+TDp2rdb6OEbTay9hG9z9T
 uo0F7yENCiEC+7C0xJjPSlq05FotuuxEaxm1K5tOfX1yZ+tzDmuz1qJlfIzQ5KtXnDwzZnL5g3g
 PncBU5ki00rITeNg59oW886xfghJfjQsk2P16sT3VIJaiypLmaaeqr1BNk08CcWdJPVKt7xzeGW
 /BbQEDhE1w5UU2qH+VNoX5A4lCxmHs+ju2RPEAm+iYqBp90oeHgaCRpHgf7h94IiYg/2kAnVxTr
 ksj6JVTyOxiXRFhcTT8tzoGwwcEMktvaOrwfaM2rIlkuCfe5BQr1LTXYowSo8DV09YzGpM1xl1A
 0VaSWyvfu31em09UAgQ==
X-Proofpoint-ORIG-GUID: 8qOpkqNAi69Ngz3XaFQ74h5CyRhETKsB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609300052



On 9/30/2026 4:47 PM, Rahul Pon wrote:
> A8xx GPUs split GMEM evenly between their slices, and parts can have
> slices fused off: a8xx_gpu_get_slice_info() reads the active slice mask
> and folds the slice count into the chip ID. The GMEM size reported to
> userspace (MSM_PARAM_GMEM_SIZE) is still the catalog value for all
> slices.
> 
> On an HP OmniBook 5 (Snapdragon X2 Elite, Mahua), the Adreno X2-85 runs
> 3 of 4 slices (chip ID 0x44070031) and the kernel reports 21 MB of GMEM.

This commit text is incorrect, but the fix is valid. Please use this series
for Mahua GPU support:

https://lore.kernel.org/lkml/20260925-mahua-gpu-v1-0-0fa0bfd8d315@oss.qualcomm.com/

> Mesa sizes its tiles and places its CCU caches at the top of that range,
> past the end of the GMEM that exists, and GPU-rendered output is visibly
> corrupted: noise bands and block garbage, across the whole desktop with
> GNOME Shell. Rendering without GMEM (FD_MESA_DEBUG=sysmem) is clean;
> disabling UBWC, LRZ or compressed scanout is not.
> 
> Qualcomm's downstream driver reports GMEM for the active slices on this
> GPU: gen8_get_gmem_size() in KGSL returns
> gmem_size / GEN8_1_0_NUM_PHYSICAL_SLICES * active slices, 15.75 MB here.
> Do the same when reading the slice mask. The GMEM protection and UCHE
> setup still cover the full range, as in KGSL.
> 
> Fixes: 288a93200892 ("drm/msm/adreno: Introduce A8x GPU Support")
> Assisted-by: LLM
> Signed-off-by: Rahul Pon <theflyingrahul@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c   | 4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 3 ++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h | 2 ++
>  3 files changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index add93c1fa039..9b95d9b3826a 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -112,6 +112,10 @@ void a8xx_gpu_get_slice_info(struct msm_gpu *gpu)
>  	/* Chip ID depends on the number of slices available. So update it */
>  	adreno_gpu->chip_id |= FIELD_PREP(GENMASK(7, 4), hweight32(slice_mask));
>  
> +	/* GMEM is split evenly between slices: report the active share */
> +	adreno_gpu->gmem = adreno_gpu->info->gmem / info->max_slices *
> +			   hweight32(slice_mask);

Please add '()' to improve readability. And it would be easier on eyes, if you
don't break the line.

Also, reword the commit text to exclude mentioning Mahua. We don't a partial slice SKU
commercialized yet.

With above updates:
Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

Thanks,
-Akhil.

> +
>  	/* Update the gpu-name to reflect the slice config: */
>  	const char *name = devm_kasprintf(dev, GFP_KERNEL,
>  			"%"ADRENO_CHIPID_FMT,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 5832dc25d6bf..dadfe4c69438 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -379,7 +379,7 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_context *ctx,
>  		*value = adreno_gpu->info->revn;
>  		return 0;
>  	case MSM_PARAM_GMEM_SIZE:
> -		*value = adreno_gpu->info->gmem;
> +		*value = adreno_gpu->gmem;
>  		return 0;
>  	case MSM_PARAM_GMEM_BASE:
>  		if (adreno_gpu->info->family >= ADRENO_6XX_GEN3)
> @@ -1205,6 +1205,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>  	adreno_gpu->funcs = funcs;
>  	adreno_gpu->info = config->info;
>  	adreno_gpu->chip_id = config->chip_id;
> +	adreno_gpu->gmem = config->info->gmem;
>  
>  	gpu->allow_relocs = config->info->family < ADRENO_6XX_GEN1;
>  	gpu->pdev = pdev;
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 114a40f79ef3..8e6a88103610 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -204,6 +204,8 @@ struct adreno_gpu {
>  	struct msm_gpu base;
>  	const struct adreno_info *info;
>  	uint32_t chip_id;
> +	/* GMEM size available to userspace, see a8xx_gpu_get_slice_info(): */
> +	uint32_t gmem;
>  	uint16_t speedbin;
>  	const struct adreno_gpu_funcs *funcs;
>  
> 
> base-commit: d33622598496c8994c35ba0a8a913de064dfc1a4

