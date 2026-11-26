Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795722149;
	b=FW4jON4wVsTSHjD36xWdHt6huN2OxD/BRNA/YmQ9Q15huKpdCTcFuZb5Aye6d5/yiDjD
	 Gv/H96CCECrizF/N3LrJT1DjB6LRdOvqfcHJUOmdjO1ZYSI9k1RTi4r5GhVY7evt6I+oc
	 U5KBEMfr9C3XAng/BVKrZlMKifs3Rp2VlAJA/KqKMhtDZnOLL27eU+vnVxFTkrAFxLEbz
	 62xX3L4fDIoBOqaXqbGvcCKzXj5VZxtqHmFHrakjIccXxFJCz2953EI9a5rjBunIUDScB
	 VkhnoQ9/h2Y+iZGReQ9jbstjP8PT0opvlcC2NO59sVOwBiu5HpnKfB5EJFRNQNRw7SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795722149;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fhRNdMl5UxG3D78/zB54I3eapISFAykzMxNkOQtD+wI=;
	b=mOtUw3gxZ8uJeA1unrRa7J3n0ixfibrWXGQmGu8upXsXC+igySWB+yoeDvgyG9x3AAYm
	 uOcKkQrA+RYnx2aQhO5ttWsn8Yxs94tnvpnK/Ydw8Rx9366hdzBn0oyK2MODR5gYmGUrr
	 6LtCWuuP0CjAU8Vio76GDPsetgu82UNy7u5wRMUbVejlIJThe88y1Qi9aWE4qS+txjSKT
	 WALHPNRF27XvmwKTu9RKyMmA+jFmIc9KALPni4w9UUUZ9W7VmtCkPZcndGgXgehMnH8RH
	 w/BVm6ZhqNh+gCbe8kw54nV9IPlausYfa+PQ5Hs+UaOtWPDtDLxQP9yd0pZhgWgoGkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CIcjMH7m;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ectaWyX0;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD43B606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:42:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD43B606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CIcjMH7m;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ectaWyX0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQH3E4g3470857
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fhRNdMl5UxG3D78/zB54I3eapISFAykzMxNkOQtD+wI=; b=CIcjMH7mZVk621ON
	XyRT18DTnvQMl/DV23mpSp4rW0J3q3RwCExsHi/HI8wXPP19OEYQ4ZXNl8Q75HJQ
	EHQ6fgcGYCnO3Z22DE52lm+HBIFIBH29WHALAaRRFFfmhGqpbQzYA39ZMWvUlZHr
	sZ3VXABeqGmyiENsdV4Q0ijhq9k/KWcGptVhGTRvUl9Ac98yHOQaTkyx9bFzGqo5
	hi1KfjKlqdJAnX031HKlgRd4GDHPJ/tqm75qSpD0DdNc4uwSTfcYGAdq62qp2oY2
	NQcJzZC2Q+7JF+SvqT7KCKEMkG9HbkuCKOMqJcFbicHzSIYsOWS/9rpspiDuKIHL
	8ZFHSw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6ru38c4p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:42:28 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-382af5cfc58so4008620eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795722148; x=1796326948; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fhRNdMl5UxG3D78/zB54I3eapISFAykzMxNkOQtD+wI=;
        b=ectaWyX0QedTkzmaafCmVJ3KEgGm4rQXYkFiWo95Acv6xAbxPd5MkIw28n/mqiM3Kp
         2M2QntaYwAMff4hYzjzs35lJwvBO0Jai9su8zP1RChzaCT9osk4dm/X9bJ7KKpwCjh/x
         wd1nf9FJZpfqt2a4EZ+Jhzx0BCSkf4ZRyqhNHXUsdpUJYhKVeajRszcciBagXs+JVigl
         Vz7uPtvku/7omxtL6+i6FAlE/cAzgowkrdRFUJtydAqIx+025jAnyem7uFIsBczXndwz
         tOMBA8k7wXbul1UscZ1YA0lDp/LV9+vTBMiBJwoMH6swTNtEZ0CfkmyBv7+/10Eev6OT
         kefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795722148; x=1796326948;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fhRNdMl5UxG3D78/zB54I3eapISFAykzMxNkOQtD+wI=;
        b=0eKRXDAUlJiO/nCzqewyZOUJq349y7E9kxCTdjO0gM1bJfaNFhu8bKLfnqzAdUYe2c
         O9pD7RtMPt5dAm39ImAJFxHWHv5/sf3UlqVaflK4jHfiHXZmAjL43vtLCYOWznnNo8J6
         LGEy8SB40mUBBeP4BRl7tDO5faTtUk8IwEDvemlCpCor+ibU9sAFQRQwnd2d9EVBNlDW
         N6HIJ5PqRq6WUux2170cbZengSDYAIFNwJscxSTFodNQ8Phf47QA8hV6gC4m4SmVYAvg
         OGa3TZHSSpgofU6RWRmyNUoFZsDGAGBYvEu/qZCmKlHMZle6G/0weMoTjELfTb8JtBhx
         9fJA==
X-Gm-Message-State: APuU4Z/xh5gakiHq3EcUFz0ri1yWECrB97S3Wblb/MfmuJevktcPViXt
	DhNaKRlMTzEyswFYaOZOsMz1Kjy+n0eZP9+7Su0GpfJgDRkuQBRyC8vZM4rL0Fz/DfcZRocVXor
	YuKNYRlUn7Vty6pB/CPiOB07CR49gCsP0V+fkc7ZJ/R3uELhSLj+1aFosRBpw3ZTWVISM
X-Gm-Gg: AZFdTZdTMJETf+mjI5k9TtE3fPKtFo4yTfYRGAGelQCaacpbjcejryTw6WmcZVaw3L7
	Nfo4w6QcQ7DP6rb5xYf4lKJnX5g+GkWDfPWcTFNs17FEQNs3YEmpVkNn9a6lEXR7u6g4K7PkNI9
	z4Jtp54KwylBKw9RuqzJGs+S3/u/L3A9Xf9r9nnJzVo12LbjbiGhCZ3G+SmRph1aevqpKJTfvmb
	RtLcgwe6B2iWAye1zFTJtIRvDtTgTNSHxA+kKJ4GYZ+1s3b+j3QZSUgaUXxTrhxEZ/b//Fgcefd
	FxxU2f9w3WuaoWpA52Epj1gtR46rgHebEPgFmgbJVaXprtMoLuucZ7LWhZ2+1QeD0jR/VT7PN8/
	c2M6gR6XdH14QhAjcol+mAZNRmqTItDP1BsALTQXuKQMdlVO1sPMAsoDHYI1hWpxmcc+BrE4bUA
	==
X-Received: by 2002:a05:7300:fe4c:b0:386:9b1e:dcd2 with SMTP id 5a478bee46e88-3869b1edd57mr19615030eec.20.1795722147454;
        Thu, 26 Nov 2026 11:42:27 -0800 (PST)
X-Received: by 2002:a05:7300:fe4c:b0:386:9b1e:dcd2 with SMTP id 5a478bee46e88-3869b1edd57mr19614999eec.20.1795722146941;
        Thu, 26 Nov 2026 11:42:26 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385d2b93dd9sm73795985eec.24.2026.11.26.11.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:42:26 -0800 (PST)
Message-ID: <86e748e7-1cde-41b9-a1d5-905e62a44d36@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 01:12:17 +0530
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
Subject: Re: [PATCH RFT 8/8] drm/msm/a6xx: Wire up IFPC on A615-family GPUs
To: Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
 <20261030-topic-a6xx_ifpc-v1-8-6992841a9a32@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-8-6992841a9a32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cOF1IVeN c=1 sm=1 tr=0 ts=6b088ba4 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=ZLclF_L0AI5UrEzEu98A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: a5fqk7I0A98OlEkHx-G1drhYRH4s306K
X-Proofpoint-ORIG-GUID: a5fqk7I0A98OlEkHx-G1drhYRH4s306K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NyBTYWx0ZWRfX+x88Ha985dGB
 st5tpFPvQo4xYAFyZwX8y7wj0JcOHdXcD0rIhLqB+IAZCmLYmfqCH3LkhW20H69fOplatJwjY4i
 df1snIsDbnKgfdRzdyFWaVrVo3iLMLFtS5D8tVfbhm65p0P6Zt+/19xcLRWaq1y5+ArARjoFua/
 eTPNpFqVtZUYnO/UZrtr1bHP3hCkC5nm/qNa5X5n9Iwvmx9wVHLNbSbT5oHPvxjQmqCzD+IUOdz
 Yiv3HoV9HtCkMx2UKIiXfDj1AuwMrgTre28LWSxaJv5Mx41Q7DpHHuE/Z/tUPE0hM4Og3zuUr0f
 ESRYN6YZMh9eryEH/cOxULcz+tk7jUTg6lTPVERxmmorIuirzSWjjbrpMUC23hkyTNQA/mKD+gd
 JbDqAkaP3hJrTE/5gxlltB0unetllumclGRWKm01dW5H2f9Y73kU59GKXQviliuEta2Goz1hRrL
 vIUQFbUUzCK13q7nZLw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NyBTYWx0ZWRfX2XNp5BzMbEUX
 Q9OczU7DnI3CuN1EV5adCJxbaown5GnQmMudiQ9PIl0vYVWvcHUVB5clMG4KU39GKcX5WJq8ZqS
 b6aGbJRQwni2mhMJkpXK4AfIzPe4lmM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 adultscore=0 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260077



On 10/30/2026 3:34 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> They reuse the existing tables, so just wire them up.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 2d59f7735c90..257771d4eb4d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -1012,7 +1012,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			[ADRENO_FW_GMU] = "a630_gmu.bin",
>  		},
>  		.gmem = SZ_512K,
> -		.quirks = ADRENO_QUIRK_4GB_VA,
> +		.quirks = ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a615_zap.mdt",
> @@ -1021,6 +1022,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x0018000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			/*
> @@ -1044,7 +1047,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a615_zap.mbn",
>  		.a6xx = &(const struct a6xx_info) {
> @@ -1052,6 +1056,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x00180000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> @@ -1071,12 +1077,15 @@ static const struct adreno_info a6xx_gpus[] = {
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.funcs = &a6xx_gpu_funcs,
>  		.a6xx = &(const struct a6xx_info) {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x00180000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> @@ -1102,6 +1111,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x00018000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> @@ -1127,6 +1138,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x00018000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> @@ -1143,7 +1156,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> -			  ADRENO_QUIRK_4GB_VA,
> +			  ADRENO_QUIRK_4GB_VA |
> +			  ADRENO_QUIRK_IFPC,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
>  		.funcs = &a6xx_gpu_funcs,
>  		.zapfw = "a615_zap.mdt",
> @@ -1152,6 +1166,8 @@ static const struct adreno_info a6xx_gpus[] = {
>  			.protect = &a630_protect,
>  			.gmu_cgc_mode = 0x00000222,
>  			.prim_fifo_threshold = 0x00018000,
> +			.ifpc_reglist = &a630_ifpc_reglist,
> +			.pwrup_reglist = &a640_pwrup_reglist,
>  		},
>  		.speedbins = ADRENO_SPEEDBINS(
>  			{ 0,   0 },
> 

