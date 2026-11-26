Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720427;
	b=14zgTCNmGZ/8YCWlbXbU0zB6fM4O79vdYiuLaWabLvPVTOlTv0IRkZmDZqhyOOlcTFIm
	 vmv7CD6BTvn/tG6DatSFC1KqwnWdQsScjVNHy/Fn+NowgXuwZb45B0WIGHTu6Ohkf92xX
	 zeyrBKMgy2/J+R9VwsLg+0IL/Om3ldQNkoK6wLLax4fLHRmXH5PIi/CRWux345mamoT67
	 v1hDWqQP02ZPPFMswmL5o08lNDxYoqiFp8r1SA4KFpbHt6lSzu2t4C6B/AAKkIMdEmeSG
	 B3mRxsCPSaD9C7YPzFsv8hXuBLj7lgce2Cwyo4uaWeopzfG/BCi4Zq5BorXMbw9Ng2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720427;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=h1UFGITbc31w1LxPCll7J1WmlLDmP1MiT08SYmYOrz0=;
	b=x2t/ySGOvcUbvxCkg7ZLj56MMZ4Bp/DaxbpJ21J63jkbJzFDOw2fgbFNj20vA4v/f6ya
	 QfOUxYzkbODG5unwSQRSpQ4yKm5+XujlH8JyjYoBSHsw1kX+gw7vuIQjwId7eyRgWMI4D
	 AE+B8Zv5MCy6BdjwCJAfYYkHsUSAGYpSYbd8dWM20nKhWykeITwA4na5sWrREH9NAGoQ/
	 5phPUwTBXUG3FR0IK3k/FJVHKmQn1PeHC0xyMzPt75UQrjBBdbS+18xEWRSSpMoDkTm9+
	 U0Cq3H7vGF7OdlFGu4pjTvG7SOJyHhBdoB6024+O9/BOIoBLX/1AOGwNY2BXFTWIQHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RwDKNoTD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZ62Xn1e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED52606A329
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:13:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7ED52606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RwDKNoTD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AZ62Xn1e
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu1ZK1847729
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:13:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h1UFGITbc31w1LxPCll7J1WmlLDmP1MiT08SYmYOrz0=; b=RwDKNoTDrd8OqzT1
	TgtOqdEwMzzyJD5/4rINp1dTkHD4ONkTvv7u2treSFn/SjouCOeegRJpyf/B5RmT
	U5Ld2Ap+Z3i0rOMxhBOUgIh3lb64kn00wvt5/w2pTnk90bCFCqlpTSNGox66vk5m
	+Jms5ZjChrPmZgrK9s0H9bxrtjIKXY7o/hbgBHBjg1kHxyWij2jM10CHSUzzY/Bs
	WXw/wtkOkNFg5nkFnYikRMcvMtnGi9U3niHDJ8/yHUjxXrJ5iSkx21bzJEV+LbG6
	zX1kchnlYWDDMJ0VUvnPzg6mFeIUQ4Naku4LHaERM4WS9TD6Ww4Muuy2Ovn0hG1F
	M+GwzQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6fw7thp7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:13:45 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-386a0f79047so7833642eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:13:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795720424; x=1796325224; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h1UFGITbc31w1LxPCll7J1WmlLDmP1MiT08SYmYOrz0=;
        b=AZ62Xn1edyH0ABycYMJenYZ6tGUbdF9xYfmHjRO2qjD3/IsaJuD3iJpRWxM8O+EKgX
         ZaXTytmS33Er7u0jl3QmK/lFxXOnbwcgISVGe/fRxKd45CEgScdhO5/cGKDw5WlSL1rC
         P6i9uJAdP7JXMawZo1j6xiCPwH3q3s889QCNG+X9IC3drG5lefJJ1XeA/m/z0iM1K1MT
         66aBWB/FCLnx0X8o5uixqjMJVzsjc4/YwiPzU8ov9NG/gI4xziSc0q97h7Eg6Zs9ULAW
         gvU9qERaSkyfIUiVn5iA9h9e8OtLBZGD4qsgjHgMi0hPoDmNAbOpDm5suj6185Uu0FK8
         irXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720424; x=1796325224;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h1UFGITbc31w1LxPCll7J1WmlLDmP1MiT08SYmYOrz0=;
        b=PftCJWBo4VS6nsPmFxyl4ZmZzzSN4ZseAPqJowbdLlhUHcceizsRG4lC6auHNWJ+51
         6G6NVwr6mKFSOzC7zsGxccqFLMrPKxXjr6oi056xXc1G4OURmTTRyR3lPhInCDgqSXyq
         O6WYiMCJNBky8htW/KtKdHxvwwdcUGXO+9GFWceAwvXhLC+Zgv4bTkc2BNnUiC8lza9f
         1CpW9wq3eGVSxASCOfIBAnr+pzs/XZd6zG18PR6EtxDOFU8XRwb1c5JmdijiQxQUe0O3
         54GD5MbeV4K6E71wNHKF5HgAG92m/WoE8bd3QzPGBqBrWu352olaO0IHR+UV/ZbM1bOk
         GOUg==
X-Gm-Message-State: APuU4Z+EF4XKWljj+ClncyVhBl9tqfMPs/koa6b52QCN3ZBKq/RSxmcV
	6ThSmt4uxZTeJJkBiVYkoucBuTAkkrILdiDy1YBnirf7dMWUwui0Fi/Y/PxOm6mwQnsWmsNJ9yN
	tHSbHcWkFwjEejxtk/mJ82qV9Alee4dznhFdglfklK9nqRvxpf20gPPHOUFEkLnItXcbQ
X-Gm-Gg: AZFdTZdqG0xRaP7OUU8L+RjyrlEByriShNH/SC18vMAiQjmZs33FM+EIrNiYO8APuOs
	XxUk89KRJzxup1FQgJGwvWkXyI0htzqmCvIHjL+xQT+ib4GAEIYQsknASA+QjDfXUVCoSIw8KRS
	v5YjjuIOoIyQux1sIZdooJwc8IxB8Tk1+QzS9z3uaG8i1yLXi5JG1l7bZIAmhy4rlSwGUDUdblD
	AdJ1szjnytM3lZnySwxAO5XFlcpbkLwzAJ4HIUQPGjCbcfNFHUWDR41XJAFprsPrW/rHAdgxi+z
	QMesC7sqzJHImELfmJZ3SXAOqUCS8+lMVdk/kxBZ93myjGqopzVobXVoZy+MjHp6n7jC2VMDEFu
	bdPc3bdPruendn4XgmULykDjSIH8fi7QcxrhInUger1N1r6rv+MFhyri/soK3uOPo6z2v0+mj8A
	==
X-Received: by 2002:a05:693c:8803:20b0:386:9b9c:ef1b with SMTP id 5a478bee46e88-3869b9cf99amr16692848eec.3.1795720424112;
        Thu, 26 Nov 2026 11:13:44 -0800 (PST)
X-Received: by 2002:a05:693c:8803:20b0:386:9b9c:ef1b with SMTP id 5a478bee46e88-3869b9cf99amr16692820eec.3.1795720423545;
        Thu, 26 Nov 2026 11:13:43 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm32792874eec.9.2026.11.26.11.13.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:13:43 -0800 (PST)
Message-ID: <ea19dcb2-9d9e-4d6c-86f5-72a677fca5b8@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:43:37 +0530
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
Subject: Re: [PATCH 3/8] drm/msm/a6xx: Expose GMU IFPC entry count in debugfs
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261030-topic-a6xx_ifpc-v1-0-6992841a9a32@oss.qualcomm.com>
 <20261030-topic-a6xx_ifpc-v1-3-6992841a9a32@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-3-6992841a9a32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NSBTYWx0ZWRfX5DTxAln4TJ1b
 w52sTt1g2LgUQnU3XkeoYRw0MNA57GqUSlBoCg7xYBkPugKMyH9hR2APh+AkgM392tKBt4ardcf
 puZStuhGExiBdivUtT+H3bfwZZUJ5w8=
X-Proofpoint-GUID: XgB0D84s9fhEaK3COzzZcerZ62BWyASS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NSBTYWx0ZWRfX4qDg8JAhGwmn
 GtxXe8LVyNcMsLJGk3xZmQCGusIA1H5Wsb2d5YK3o9wZAPlhIJUQhShyjHLDCu9tWbutpLxxCHj
 d+vQoJcqtWAbZCgpVHqocqTG0dMBXCdFatJF+hUtrZ7JM7HMn2kyR2PYclkJ7uftJpbnCDIJKiT
 7Jou5jL/gtUQHPhs1c9MkYqkLtAa8l2mDrghO31+p9tnL922YeNfgNj9pzep9vV4A0oZTxg0yk3
 yglHRghxjHPKDP+EGBssFKdDS+Htwufot9MLSTjpGvHYOJszU8RvFdqgmyKY3Xk33vso3M2WwPp
 2p406YLrf+pSb2AM88wnq4dB5k00Wds27Ei6YRfbqVdDhlSmB4he+xAqrMvDH11ojHl45lkt/aS
 /ASIMpYMfb06c6X3lZCsojTbITjDi3/rUYeWQ8SitUEFJW/nYh60Zh3eVngq7BnIm+RuZDN2sVh
 nbNhIT29ht23ngfd5/Q==
X-Proofpoint-ORIG-GUID: XgB0D84s9fhEaK3COzzZcerZ62BWyASS
X-Authority-Analysis: v=2.4 cv=ePeGH3p1 c=1 sm=1 tr=0 ts=6b0884e9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=4juFOUNQJm3OhpHwc1AA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611260075



On 10/30/2026 3:33 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Add a read-only debugfs file, ifpc_count, that reports how many times
> the GMU has entered IFPC.
> 
> The count is accumulated from the GMU XOCLK_4 power counter. The
> counter is selected in hw_init, and the delta is folded into the total
> from the busy callback, so the value advances whenever devfreq samples
> the GPU.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/Makefile              |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_debugfs.c | 23 +++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 30 ++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     | 10 ++++++++++
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     |  9 +++++++++
>  5 files changed, 73 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 1e246616f83f..afd42e5bda00 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -30,6 +30,7 @@ adreno-y := \
>  	adreno/a8xx_preempt.o \
>  
>  adreno-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
> +	adreno/a6xx_debugfs.o \
>  
>  adreno-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_debugfs.c b/drivers/gpu/drm/msm/adreno/a6xx_debugfs.c
> new file mode 100644
> index 000000000000..a3f622cb189f
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_debugfs.c
> @@ -0,0 +1,23 @@
> +// SPDX-License-Identifier: GPL-2.0-only

Qualcomm Copyright?

> +
> +#include <linux/types.h>
> +#include <linux/debugfs.h>
> +
> +#include <drm/drm_file.h>
> +
> +#include "a6xx_gpu.h"
> +
> +void a6xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +
> +	if (!minor)
> +		return;
> +
> +	if (!(adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC))
> +		return;
> +
> +	debugfs_create_u32("ifpc_count", 0444, minor->debugfs_root,
> +			   &a6xx_gpu->ifpc_count);
> +}

Can we keep this in a6xx_gpu.c untill there are more a6xx debugfs nodes?

> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 48d3ee4d55d9..e7c3da5d3ac6 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -1338,6 +1338,11 @@ static int hw_init(struct msm_gpu *gpu)
>  			GENMASK(7, 0), 0x4);
>  	}
>  
> +	if (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) {
> +		a6xx_gpu->ifpc_counter_last =
> +			gmu_read(&a6xx_gpu->gmu, REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L);
> +	}
> +
>  	/* Select CP0 to always count cycles */
>  	gpu_write(gpu, REG_A6XX_CP_PERFCTR_CP_SEL(0), PERF_CP_ALWAYS_COUNT);
>  
> @@ -2334,6 +2339,17 @@ static void a6xx_destroy(struct msm_gpu *gpu)
>  	kfree(a6xx_gpu);
>  }
>  
> +void a6xx_ifpc_count_update(struct a6xx_gpu *a6xx_gpu, u32 cur)
> +{
> +	/* A counter below the last sample means the GMU restarted it */
> +	if (cur >= a6xx_gpu->ifpc_counter_last)
> +		a6xx_gpu->ifpc_count += cur - a6xx_gpu->ifpc_counter_last;
> +	else
> +		a6xx_gpu->ifpc_count += cur;
> +
> +	a6xx_gpu->ifpc_counter_last = cur;
> +}
> +
>  static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -2347,6 +2363,11 @@ static u64 a6xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>  			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
>  			REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
>  
> +	if (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC)
> +		a6xx_ifpc_count_update(a6xx_gpu,
> +			gmu_read(&a6xx_gpu->gmu,
> +				 REG_A6XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L));
> +
>  	return busy_cycles;
>  }
>  
> @@ -2818,6 +2839,9 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
>  #if defined(CONFIG_DRM_MSM_GPU_STATE)
>  		.gpu_state_get = a6xx_gpu_state_get,
>  		.gpu_state_put = a6xx_gpu_state_put,
> +#endif
> +#if defined(CONFIG_DEBUG_FS)
> +		.debugfs_init = a6xx_debugfs_init,
>  #endif
>  		.create_vm = a6xx_create_vm,
>  		.create_private_vm = a6xx_create_private_vm,
> @@ -2889,6 +2913,9 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
>  #if defined(CONFIG_DRM_MSM_GPU_STATE)
>  		.gpu_state_get = a6xx_gpu_state_get,
>  		.gpu_state_put = a6xx_gpu_state_put,
> +#endif
> +#if defined(CONFIG_DEBUG_FS)
> +		.debugfs_init = a6xx_debugfs_init,
>  #endif
>  		.create_vm = a6xx_create_vm,
>  		.create_private_vm = a6xx_create_private_vm,
> @@ -2921,6 +2948,9 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
>  		.gpu_busy = a8xx_gpu_busy,
>  		.gpu_get_freq = a6xx_gmu_get_freq,
>  		.gpu_set_freq = a6xx_gpu_set_freq,
> +#if defined(CONFIG_DEBUG_FS)
> +		.debugfs_init = a6xx_debugfs_init,
> +#endif
>  		.create_vm = a6xx_create_vm,
>  		.create_private_vm = a6xx_create_private_vm,
>  		.get_rptr = a6xx_get_rptr,
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 79912a33e17c..8f0cb168a535 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -139,6 +139,10 @@ struct a6xx_gpu {
>  	spinlock_t aperture_lock;
>  
>  	u32 slice_mask;
> +
> +	/* Total GMU IFPC entries, accumulated from the XOCLK_4 counter */
> +	u32 ifpc_count;
> +	u32 ifpc_counter_last;
>  };
>  
>  #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
> @@ -254,6 +258,12 @@ struct a7xx_cp_smmu_info {
>  #define A6XX_PROTECT_RDONLY(_reg, _len) \
>  	((((_len) & 0x3FFF) << 18) | ((_reg) & 0x3FFFF))
>  
> +#ifdef CONFIG_DEBUG_FS
> +void a6xx_debugfs_init(struct msm_gpu *gpu, struct drm_minor *minor);
> +#endif
> +
> +void a6xx_ifpc_count_update(struct a6xx_gpu *a6xx_gpu, u32 cur);
> +
>  extern const struct adreno_gpu_funcs a6xx_gpu_funcs;
>  extern const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs;
>  extern const struct adreno_gpu_funcs a7xx_gpu_funcs;
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index f892731cd3d3..ba81a1c9c551 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -680,6 +680,10 @@ static int hw_init(struct msm_gpu *gpu)
>  	gmu_write(&a6xx_gpu->gmu, REG_A8XX_GMU_CX_GMU_POWER_COUNTER_SELECT_XOCLK_1,
>  		  FIELD_PREP(GENMASK(7, 0), 0x4));
>  
> +	if (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC)
> +		a6xx_gpu->ifpc_counter_last =
> +			gmu_read(gmu, REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L);
> +
>  	/* Select CP0 to always count cycles */
>  	gpu_write(gpu, REG_A8XX_CP_PERFCTR_CP_SEL(0), 1);
>  
> @@ -1354,6 +1358,11 @@ u64 a8xx_gpu_busy(struct msm_gpu *gpu, unsigned long *out_sample_rate)
>  			REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_L,
>  			REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_0_H);
>  
> +	if (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC)
> +		a6xx_ifpc_count_update(a6xx_gpu,
> +			gmu_read(&a6xx_gpu->gmu,
> +				 REG_A8XX_GMU_CX_GMU_POWER_COUNTER_XOCLK_4_L));
> +

This is all unnecessary plumbing. This counter is not useful outside of a litmus test to see
if IFPC works. Also, this won't work if devfreq is disabled for some reason
or with performance/powersave governors.

We can just read the register from the debugfs callback instead.

-Akhil

>  	return busy_cycles;
>  }
>  
> 

