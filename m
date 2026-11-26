Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795720872;
	b=BFE8HJLaqoDXyTj1CWZBovyGqVItHLoZPTpQNaHq00pK1uPwUaFP/89AmQyRk57F5ikk
	 EhIIJL/JuJx+aZEgrINzJnhk7ZBcMWTidhNsfwKM1XTdYSca6C6wN9CR513QMzSY/A3UU
	 I0ScaqGkTPSjzECa6lvnL7lQ/zxVGmV6JelWF+ZJuMry0fAMK2e727MY6CAlzqW5Jz+Nf
	 ChEBLvBp7nWQebkmS7oczXxDUpWCnjRkO2gCAd/BA4gweGatr02b+QhoXG1VH4rW0PkSJ
	 rW276f1M4mSbWnNKnktxV7L85tLsE4d0ENP1UtJkVKK5n5xhyE3bRs839DEm/JEx06A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795720872;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=BEYrSHutPCTonI7grc6k1qXPE39WetpayNeIDmHgucs=;
	b=D3l0SAlLSG9zM8UCf6OqyBlfqGO0qBocP22mnlpN64PAfxhMR/mvSGkI1cQdRWlvaapc
	 IweYm1O6FEXulHvKr1P7tTQzFGPpBOZ6tNTTuG4wJsz6cuD3rHKZu/UHh47i+OG0/LGnE
	 gpawzdl+R3g+jvMb8/MFrRIBnZq+wa2BtI42n8hvc/X6lovQ8x8uW1VFQYCj4tt3iA2jt
	 gwkk4Q+k2h0xrZtY2R16nVq9cvGCdTw9I2qPEhXvMvBnHqc88TTr1mwHEIdTiNuKFAPfi
	 tWq+os5g7jI3+Fi2kINqiiX2LbpU9JESnlsYjA3geDXjaFHQ8xZkOmUe5CqBDBFelGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="izSt/woV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c6GT170m;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E961E606A31C
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:21:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E961E606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=izSt/woV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=c6GT170m
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFtwEr4048178
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BEYrSHutPCTonI7grc6k1qXPE39WetpayNeIDmHgucs=; b=izSt/woVtyx03VN6
	cf9FAKqOrIoQ4i7oZbG29AQ5SeameVCrJUnhXCgpny4aVn0BKrU0rni/ROLG7uOQ
	KecWLhVzofWW+XBGfKTvwozljgp7o1YxQPcDqaUZZued7kExw7QfFpu0osuTm7me
	I9KvFNfNcIT1OB7r5Uvwy5HkxB0WZ2uh+AS2ZUGrAQ4NBUYjlewaBdNmbHrbOwYK
	v5PdmWn3QC/1fnHB78NQ7DB6ZqXEuCyG30HgtcOPqM4ULFYCl/wCGuIQz1Dp5BOL
	bdFA7U32MNih7yNUCNiVBTCTWLx6ExlvzsRjs4ftPtnGmLi8RNi0wnLziI060XM+
	5jklHg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6f8rjnqg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 19:21:11 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3869865a304so2553684eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 11:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795720870; x=1796325670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEYrSHutPCTonI7grc6k1qXPE39WetpayNeIDmHgucs=;
        b=c6GT170mCGvtx8foTNByqUNQYxWGFvixQ6Y75k3d440+UJNLsC3LHnaaGhmoOwRXuW
         cNMT4pp2cJbXUU0H8OXaRIgsRkMLSwF/RiOJJSOJpgFt76cI/9hADnR7Ss043uUk0LJs
         8UyygCZYMCng9KKDKMMn1HnsoqnREFdjDgpAIpZNFb/jo+R7G62Bc5K0U7JElhzZ8UgQ
         p9yGee7XehRzfMw/40W1zh9j4C45zlKr+x6LxwrOFdo7P6iP1bTaf4k6l1ftbUKgTFPP
         okodgqIxLCNND5O4HDZcDQlNXa5DphEY4dQgul/w5EdYm03Ad05AsaaZGnB5Zu9npItU
         MCwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795720870; x=1796325670;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEYrSHutPCTonI7grc6k1qXPE39WetpayNeIDmHgucs=;
        b=sVlee0+YASFDhQXSi+AqGAgi1mtDXfe6S26bjRxr58LOmLWJiGORnIecRWYPs/Zx1T
         FruYU5GpxZfGEGes3NWrzocGRTzHWEPx3eXq3DrYT10KWd289CNl5Y6621au9jFyA4FD
         4ZQJVMg/Pjq6HZ34kCs1VaI5sN2ueTANFMI2sAkHR75uuAivzoeZYe7Eq/LHjMlKAyZB
         qgdokN/0WfqRtx+/fOsneby95Urq/+6twgjtVWRwfWq5vRPBqkd4e14zlENoLKYXZTDf
         20UclRp82U7IAC9YFOHl444qOVCCZyGI/x4I6dcMmlevy/YUaddIlneII9L2228WGkau
         Ylfg==
X-Gm-Message-State: APuU4Z9bPYJ85V3KLuMsWy2JHmL4/HygaL3+IP42jLriYfiMXMYwstEJ
	CAEOw7CaWJ2x3aV+8MFDWbsU+E3a3rItcYew1RGmux0C5eHn8jwXx0mfijSqB54r5EGSm5MaqWH
	YROKEzGS4HDZJzZn6GnqN0QguEHo0AC6UumsMiGqlOc6C56OB8vmVJAhxhp+7ST3MLXt5
X-Gm-Gg: AZFdTZe/jMJ/beseWcecmX4pDn+ZhsAgr7hacTT5Aafkfm9C5zqyRHe0idtS/taPJwl
	SGzvWCD09pRVVDsNVL5grg6Xx6lJ5BhXCsEhh3n+WP2TQ+HfaPzEqtuUiGV0PrGzESX58nzsMBF
	272bxSyHz3oAhrl9X3cAIdFCC/EYk1QzcU2GIIHFNMo9GeyNhwXrua7jdU7quD5Yc1WPEXay2fN
	xXVvGpq2CGnICYAT75YL91id08S+GwwXS2qzUb9krMsgWQVchHBsgwKGDpMBHhQDGcY5GKeALl2
	TqbUyvTNGRsIyRHCOC5Q6Z26ujPmxsJAbO7BfTf6N64FI/LIcVqZ6NMmxY8Kb9i9b5in15GhwZn
	8o/Ksc/i4xYDpgoyABIq5IpMPJ6pXTXN+QjDHH7nko0ISi9U/qCkUuuo/XZ6KAEC+1pb5p1Cevg
	==
X-Received: by 2002:a05:7301:160e:b0:384:c1bd:aa5d with SMTP id 5a478bee46e88-386a87f00a6mr15636504eec.30.1795720870246;
        Thu, 26 Nov 2026 11:21:10 -0800 (PST)
X-Received: by 2002:a05:7301:160e:b0:384:c1bd:aa5d with SMTP id 5a478bee46e88-386a87f00a6mr15636485eec.30.1795720869672;
        Thu, 26 Nov 2026 11:21:09 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567ea2cc5sm60340488eec.29.2026.11.26.11.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 11:21:09 -0800 (PST)
Message-ID: <89be889f-f2a4-466b-93b7-a80774446a25@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 00:51:03 +0530
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
Subject: Re: [PATCH 4/8] drm/msm/a6xx: Add A6xx IFPC support
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
 <20261030-topic-a6xx_ifpc-v1-4-6992841a9a32@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261030-topic-a6xx_ifpc-v1-4-6992841a9a32@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA3NiBTYWx0ZWRfXzN6qO/4iZqAN
 0FNCKRNhVdD/Y7K/ktU5Y/f0MqSSKX9e0IKyEl7iglcctoUaMugio+YasTjnGrgqQWnm+nJWICg
 JqvrHGwM+k9Gafo6Jclo72+iN09VVBvMHTQbFxD4VfjEKtCWuL3xJvdjiNBsxsbueVhvUi6IsDj
 +pLHPMd9kcW6YbWjfy1wHui8cmiaiA8H7Mr7Z21h3hm2SH85IZfpLldZJ7K+ym83ZKtFbSYhjU2
 Zkda2UcZOXIF/4T5t9+wTJvTZ4sqgeG+s+19lSexQQXNpMtXJvJXB9joqqpXZdonWAxa1yBLLqS
 XGJSGLxI3jEiodxu8NR6ibBiBDTpa/DeESBv1+RxSp71piHRN0vHtrYhUHXovS6knuS9pfhgpBT
 vatdAle2kSL2fu4Yx9lOip6RpyE3ELQM5pXHMzBn//KMo8qQhrjzLWt2O3Rp5lYSQxkaZWaFGsW
 Y8wTgAe1A6eaBHpN5Vw==
X-Proofpoint-GUID: 5OJ1xdPCi8-tp_Kl7LhixWvMEzFFAVL5
X-Proofpoint-ORIG-GUID: 5OJ1xdPCi8-tp_Kl7LhixWvMEzFFAVL5
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA3NiBTYWx0ZWRfX309lKJgJ02rG
 LV0DDvClFsuaVS+YL13yU01ycUJJ/KD1/YQt5spholfGk04Ic2qgwFFnXXMLwfu7L9goNT3fs2D
 47aXzmCNxej5o2NtiKPFEHRJdvlgoxQ=
X-Authority-Analysis: v=2.4 cv=FuOQbGrq c=1 sm=1 tr=0 ts=6b0886a7 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=V320dKRU2Z3Xuck2lYsA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260076



On 10/30/2026 3:34 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> IFPC is largely supported by the current upstream driver, add the
> missing plumbing that's specific to A6xx, based on kgsl.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c             | 97 +++++++++++++++++++++--
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c             | 11 ++-
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml |  1 +
>  3 files changed, 98 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index e7c3da5d3ac6..8ea9ab5b9886 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -647,6 +647,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  	unsigned int i;
>  	u32 cgc_delay, cgc_hyst;
>  	u32 val, clock_cntl_on;
> +	u32 gmu_wfi_config;
>  
>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>  		return;
> @@ -674,12 +675,20 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  	else
>  		cgc_hyst = 0x5555;
>  
> +	/* TODO: Also A620 */
> +	if (adreno_is_a640(adreno_gpu) || adreno_is_a650(adreno_gpu))
> +		gmu_wfi_config = 0x2;
> +	else
> +		gmu_wfi_config = 0;
> +
>  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
>  			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
>  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
>  			state ? cgc_delay : 0);
>  	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
>  			state ? cgc_hyst : 0);
> +	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_CX_GMU_WFI_CONFIG,
> +			state ? gmu_wfi_config : 0);

Should be a separate patch.

>  
>  	if (!adreno_gpu->info->a6xx->hwcg) {
>  		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
> @@ -878,6 +887,43 @@ static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)
>  	a6xx_gpu->dynamic_sel_reglist_offset = dyn_pwrup_reglist_count;
>  }
>  
> +static void a6xx_patch_pwrup_reglist(struct msm_gpu *gpu)
> +{
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	const struct adreno_reglist_list *reglist;
> +	void *ptr = a6xx_gpu->pwrup_reglist_ptr;
> +	struct cpu_gpu_lock *lock = ptr;
> +	u32 *dest = (u32 *)&lock->regs[0];
> +	int i;
> +
> +	lock->gpu_req = lock->cpu_req = lock->turn = 0;
> +	lock->list_length = 0;
> +
> +	/* Static IFPC-only registers */
> +	reglist = adreno_gpu->info->a6xx->ifpc_reglist;
> +	if (reglist) {
> +		for (i = 0; i < reglist->count; i++) {
> +			*dest++ = reglist->regs[i];
> +			*dest++ = gpu_read(gpu, reglist->regs[i]);
> +		}
> +		lock->list_length += reglist->count * 2;
> +	}
> +
> +	/* The CP sees IFPC-only and IFPC + preemption as one list from list_offset */
> +	lock->list_offset = lock->list_length;
> +
> +	/* Static IFPC + preemption registers */
> +	reglist = adreno_gpu->info->a6xx->pwrup_reglist;
> +	if (reglist) {
> +		for (i = 0; i < reglist->count; i++) {
> +			*dest++ = reglist->regs[i];
> +			*dest++ = gpu_read(gpu, reglist->regs[i]);
> +		}
> +		lock->list_length += reglist->count * 2;
> +	}
> +}
> +

Reuse a7xx_patch_pwrup_reglist(). dyn_pwrup_reglist will be NULL in a6xx catalog.

>  static int a7xx_preempt_start(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -898,13 +944,43 @@ static int a7xx_preempt_start(struct msm_gpu *gpu)
>  	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
>  }
>  
> +/* Select whether multiple hardware contexts can run at once or are serialized */
> +#define CP_INIT_MAX_CONTEXT BIT(0)
> +/* Enable register protection mode */
> +#define CP_INIT_ERROR_DETECTION_CONTROL BIT(1)
> +/* Header dump information, reserved */
> +#define CP_INIT_HEADER_DUMP BIT(2)
> +/* Default Reset states enabled for PFP and ME */
> +#define CP_INIT_DEFAULT_RESET_STATE BIT(3)
> +/* Drawcall filter range */
> +#define CP_INIT_DRAWCALL_FILTER_RANGE BIT(4)
> +/* Ucode workaround masks */
> +#define CP_INIT_UCODE_WORKAROUND_MASK BIT(5)
> +/* Disable the save/restore of performance counters across preemption. */
> +#define CP_INIT_OPERATION_MODE_MASK BIT(6)
> +/* Register initialization list */
> +#define CP_INIT_REGISTER_INIT_LIST BIT(7)
> +/* Register initialization list with spinlock */
> +#define CP_INIT_REGISTER_INIT_LIST_WITH_SPINLOCK BIT(8)
> +
> +#define CP_INIT_MASK (CP_INIT_MAX_CONTEXT | \
> +		CP_INIT_ERROR_DETECTION_CONTROL | \
> +		CP_INIT_HEADER_DUMP | \
> +		CP_INIT_DEFAULT_RESET_STATE | \
> +		CP_INIT_UCODE_WORKAROUND_MASK | \
> +		CP_INIT_OPERATION_MODE_MASK | \
> +		CP_INIT_REGISTER_INIT_LIST_WITH_SPINLOCK)
> +

split out a separate patch?

>  static int a6xx_cp_init(struct msm_gpu *gpu)
>  {
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
>  	struct msm_ringbuffer *ring = gpu->rb[0];
>  
> -	OUT_PKT7(ring, CP_ME_INIT, 8);
> +	OUT_PKT7(ring, CP_ME_INIT, 10);
>  
> -	OUT_RING(ring, 0x0000002f);
> +	/* Enabled ordinal mask */
> +	OUT_RING(ring, CP_INIT_MASK);
>  
>  	/* Enable multiple hardware contexts */
>  	OUT_RING(ring, 0x00000003);
> @@ -919,9 +995,12 @@ static int a6xx_cp_init(struct msm_gpu *gpu)
>  	/* No workarounds enabled */
>  	OUT_RING(ring, 0x00000000);
>  
> -	/* Pad rest of the cmds with 0's */
> -	OUT_RING(ring, 0x00000000);
> -	OUT_RING(ring, 0x00000000);
> +	/* Operation mode mask */
> +	OUT_RING(ring, 0x00000002);
> +
> +	OUT_RING(ring, lower_32_bits(a6xx_gpu->pwrup_reglist_iova));
> +	OUT_RING(ring, upper_32_bits(a6xx_gpu->pwrup_reglist_iova));
> +	OUT_RING(ring, 0);
>  
>  	a6xx_flush(gpu, ring);
>  	return a6xx_idle(gpu, ring) ? 0 : -EINVAL;
> @@ -1485,8 +1564,12 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* Enable the SQE_to start the CP engine */
>  	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
>  
> -	if (adreno_is_a7xx(adreno_gpu) && !a6xx_gpu->pwrup_reglist_emitted) {
> -		a7xx_patch_pwrup_reglist(gpu);
> +	if (!a6xx_gpu->pwrup_reglist_emitted) {
> +		if (adreno_is_a7xx(adreno_gpu))
> +			a7xx_patch_pwrup_reglist(gpu);
> +		else
> +			a6xx_patch_pwrup_reglist(gpu);
> +
>  		a6xx_gpu->pwrup_reglist_emitted = true;
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> index 6b34e704a70d..b07ba7233c2e 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
> @@ -855,7 +855,7 @@ static int a6xx_hfi_feature_ctrl_msg(struct a6xx_gmu *gmu, u32 feature, u32 enab
>  
>  #define IFPC_LONG_HYST 0x1680
>  
> -static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
> +static int a7xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
>  {
>  	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
>  		return 0;
> @@ -1059,6 +1059,7 @@ static int a6xx_hfi_start_v1(struct a6xx_gmu *gmu, int boot_state)
>  
>  int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>  {
> +	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
>  	int ret;
>  
>  	if (gmu->legacy)
> @@ -1081,9 +1082,11 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
>  	if (ret)
>  		return ret;
>  
> -	ret = a6xx_hfi_enable_ifpc(gmu);
> -	if (ret)
> -		return ret;
> +	if (!adreno_is_a6xx(&a6xx_gpu->base)) {
> +		ret = a7xx_hfi_enable_ifpc(gmu);
> +		if (ret)
> +			return ret;
> +	}
>  
>  	ret = a6xx_hfi_send_thinmem_config(gmu);
>  	if (ret)
> diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> index 4f934c194f73..e5fe940d6cbf 100644
> --- a/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> +++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml
> @@ -68,6 +68,7 @@ xsi:schemaLocation="https://gitlab.freedesktop.org/freedreno/ rules-fd.xsd">
>  	<reg32 offset="0x1f82d" name="GMU_CM3_CFG"/>
>  	<reg32 offset="0x1f840" name="GMU_CX_GMU_POWER_COUNTER_ENABLE"/>
>  	<reg32 offset="0x1fc10" name="GMU_CX_GMU_POWER_COUNTER_ENABLE" variants="A8XX"/>
> +	<reg32 offset="0x1f802" name="GMU_CX_GMU_WFI_CONFIG"/>
>  	<reg32 offset="0x1f841" name="GMU_CX_GMU_POWER_COUNTER_SELECT_0"/>
>  	<reg32 offset="0x1f842" name="GMU_CX_GMU_POWER_COUNTER_SELECT_1"/>
>  	<reg32 offset="0x1fc40" name="GMU_CX_GMU_POWER_COUNTER_SELECT_XOCLK_0" variants="A8XX-"/>
> 

