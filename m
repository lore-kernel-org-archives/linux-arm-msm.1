Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909941;
	b=NeXQOFRoOLF90ZBoF04SzpWKf+LxLvGMlBG1t16oEr8+HYk2wKvzs868bHBk4tqciMNM
	 3FLAyfVxRrVwx0kRoC/I8wBW3+KWtuJtSYG8qmpLV0NTrHHzG4UuIbVb3ZehUAyjND1+s
	 2XjrT1i20CPiCM4vCHcroHjgY/m4IyQUcQgzU7XnxIL7vTgCeY6+8NbVbIZPIi0ziu+5o
	 4dUQLeSEz9nSe3QjRm0s1Jo8IqCOhsRc9MteDB+Sf8J/LCmgir0DSxkKSG7nkuvY9tg5z
	 OCkK+YQbJrIRTQscrFvHjFH52qlyeZpgBliBq8iCn/LwTLwAy6KXl2KRoI4cCpCM1bg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lxXTwSAlvx9lt6rkuQmRiJRYp7ZZFMogLLhtoRNClYA=;
	b=BX7Aoy/GGDLeTzU3l+/oVa3qbu6ZyPBfY6nqbJa/QciI7IoaKJN9huZqPCCRF6TxsZMj
	 lHcwgsIEl7Mg/qXGpl+RMUKt718PXnzWfLb5qkCScIwTTGmb/0N165nrrkYyfrzfDWMbV
	 milh0kV2BF49p5TutyrmBEriSY4G9O/sqzFRRFsVU1bJ/PlpvovYDcx31F0N0YVP3r6yf
	 OdKBVgOW2o54dsKT+3wH2enYbwLULzO4GBmQo6uT/YWzibTjVb+HaqW+fQCAvaRnyzCGa
	 kXmHsLh21pUjMQv8L2165zWAWRHDK8dkskrjhIe/ZezqB6iHAVkrXexv+vijZI232og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzL9Mq9k;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWVy7ss2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E876606A326
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 20:19:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E876606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PzL9Mq9k;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BWVy7ss2
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5HeM9t1485106
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 20:18:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lxXTwSAlvx9lt6rkuQmRiJRYp7ZZFMogLLhtoRNClYA=; b=PzL9Mq9krBZg4xSS
	eu1nGVNKLj8C5vTi9rWUqken8D1xApgsIglnoN/FAbWGJLT2d9LQw25WMaGOkDtk
	d5Xe/tXxud64iI4K44vOSS1nATdsHWnWmv4B8lWWTtxvjFma5nYUUtKXpzB3WUEr
	Gck0EaikC3YBi13ciQ5qOM5SKyim3V3hpoEe1c8ZaNia4rOLQ6S4PICQjlrTAFg1
	4hFMhdeIw860knXw9BexW1U4WrwUfgihNoj0MuuD5uy7iGxKzOrzqidCwYhb8cZC
	rEUDP6Up29wVeNEhitRhZ4fM2aDCUkjsNDN5FDl5qeyYStzChTldOLfxdrie3Wyt
	1z4pDA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrpaak4t0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 20:18:59 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3552883bd19so4215388eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 12:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793909938; x=1794514738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lxXTwSAlvx9lt6rkuQmRiJRYp7ZZFMogLLhtoRNClYA=;
        b=BWVy7ss2OVqSXFBD9OlwmnAB2hKdlnBukI9E2P+kd1htE5jNwYcQABsQO1OFTwNJJL
         cWJQaa8jL/sjpoeadR6jyX4I3Uq99tiIPsl9rotD2sXoZvEjycw2IDn+nJROPNnaK/Si
         VaImlUUEZ7XalNuDqfC2XtZATo4oJ7nGPXjXCriipj/BqtJ6LpmNroZQTMoO2eXFzac8
         hone+BSU7fN87fYGLyx68M8BafHAKjc73YABHnfoehHXReRVGIN55V9yRns0d0yujpm1
         KWFTcHqFQq0Z8HjDrfckPmPqiV2GMUdvSj96BYSbqPefg6w+amm7w0eg6YU52+zHVo5B
         IwIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909938; x=1794514738;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lxXTwSAlvx9lt6rkuQmRiJRYp7ZZFMogLLhtoRNClYA=;
        b=bm9jIwcUuoB94NC3cVuTabEZl/mYsJVhbaKRvec6HMLGr8z4Zhi92LufgishS/lNVA
         X22FDD3Dq4leuVTUFEZcwinhE5LNay1MfZUpnzur4qj4GTnWaRqiVe4ayIo1qtBmB9oz
         Vyeox9w48VA9JqqMVyiHHLr8dvH0n5bsDrsoVJ+bz90+de0EMoAUIpSJWm/KogdzJ63+
         jSSyOPT9VoFvJpR3C7qfTD56sUwLTMQa5/t2VwhRlyKTEgpNp51h8IK3AKs/9I3EF+MN
         H9PmqMz2K6VhT0Y2oeeY9A7whvRh/bCsPuxSkLgCllCFGDT8RMZ/trPrW3KJX5C5b8FS
         cNAg==
X-Gm-Message-State: APuU4Z9xfUsRGmPLrnvcSziOCQ1T9m/toVm8Vl7QVsrDfjPQCIjhAITY
	EbboiTRD4+dbAXQT/vnKV+lbpLkors1y4ufyC31vUx4/phPywllQLkyYbPvQZboi6JBJjS8YK9l
	mrbWWs210Op5SLtnzgGfCnHzImXjSGA6jiWX9Z/gqUvKZtGZQ5Dirzffk1Egq3xsik96z
X-Gm-Gg: AYBFou3amK4EhAZ1dTS+H6vkxqi2FC/bE0WNB5Va4wW+nWf9GwkzSYcet+sAgm6WxgW
	hKL4hD2gm9gKx0ES/W/g7dX/5I62kOWrw0RmIRb/0jvXa+rWQ/a5nOtrHpeOwcWojq2EAK+bHmK
	ji+7J+200JLaR7kt0LWpiiZgkmf9WBerAPclvVfYY/GOlrhH96pz2J/yiuP4ol/oXZm3xG/JJ60
	UMD3qeJoY3ISzXc9uDuzP3WBMY/zEUJk/UR+hbHkSZynUe2fanQfoCh24Eu/x3B9ariwWbZmIXq
	i4G4nUjdRM46Wjf9+kPPCnrSNEp2gLA6zd+Hzc3fcePoK9hEiHEzE7Jb4ash+jJIrQHP/cssP0O
	YdjYBdidKIhCHkq4U3w/9qP06+lk0g7Y06VCceGBKA227YoigVn2DAfZXTVPKojY73+QP1Ng=
X-Received: by 2002:a05:7300:f88f:b0:36e:8e6d:a0c0 with SMTP id 5a478bee46e88-36f76b14213mr327059eec.19.1793909937928;
        Thu, 05 Nov 2026 12:18:57 -0800 (PST)
X-Received: by 2002:a05:7300:f88f:b0:36e:8e6d:a0c0 with SMTP id 5a478bee46e88-36f76b14213mr327010eec.19.1793909937286;
        Thu, 05 Nov 2026 12:18:57 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f722eabb1sm614019eec.20.2026.11.05.12.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 12:18:56 -0800 (PST)
Message-ID: <4d591c0a-8488-4293-b2f2-fb77d87a5d5b@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 01:48:49 +0530
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
Subject: Re: [PATCH RFC] drm/msm/a6xx: Reset the GMU state when restoring from
 hibernation
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261103-b4-drm-msm-a6xx-rsc-restore-hibernation-v1-1-3250fd8eefb6@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261103-b4-drm-msm-a6xx-rsc-restore-hibernation-v1-1-3250fd8eefb6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX+Gb50m40RE3Q
 AaImkw5DjDZa99outN7eItZjdZ2xAgb8Wx/4nM7kiAP6v/fx27iLPOfhwsSbeKjFqR26GPuNYU7
 0BkfXgHNX8BMn5nlNIRqSI8TOD/vekwOKIVohIOtkSEel1RLLJq0o7K4IzPBSu6iOmyhzRwO9kd
 DxNHIt87ws/SitMMQxERFOs89oL/Gj5JdKCOagQuoYeUUdxsVXAnfVUVNP4BQ26JcP9xTebEg/X
 u5pCmvnQk4zqq13aVmMxaF4cnpbcZRGSSgaHUj25QpPcvOmxHdVUfBpoPD0VXw10Ot4dgcF9z2o
 XWR5E/xgO/vBXKQI4QRm5nk5SXwp3KFTEAK6ocpuBakej0Crz9ULx8h/rFPxgF1EIZR0njF8t9j
 KCVxFYWZPaqH/YDmX/siuoYK6wKQii62f4ghnsESJ6tnrUlvw0yvgufS7deK6JWYGSdTf0BlO97
 tlMbeoIInju2AEmLQ3Q==
X-Proofpoint-GUID: RO1GU4E-xvzeIGfnr4LGJpWanmgCu8sV
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4MCBTYWx0ZWRfX0UJ30raklW+z
 tYLyrPg1vupFZs/5pxVStptBvrr1eyzlzZVPeZfWVwfNa56MdsjY9lPXAZEiOC8xD/qIOPpOmX7
 kkKkSLmNe/Pk8JfZP1d9M5SxzUPvlow=
X-Proofpoint-ORIG-GUID: RO1GU4E-xvzeIGfnr4LGJpWanmgCu8sV
X-Authority-Analysis: v=2.4 cv=WOXqzXsR c=1 sm=1 tr=0 ts=6aece4b3 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=VSE_0_8NIXlJEWB0Zz0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050080



On 11/3/2026 4:15 PM, Abel Vesa wrote:
> The GMU puts the RSC to sleep when the GPU is suspended, and remembers
> that it has to request the RSC to wake up again on the next resume. A
> hibernation image is restored after a power cycle though, and the RSC
> then starts from scratch, in a state where it does not answer that
> request:
> 
>   adreno_gmu 3d6c000.gmu: [drm:a6xx_gmu_resume [msm]] *ERROR* Unable to power on the GPU RSC
>   adreno_gmu 3d6c000.gmu: [drm:a6xx_gmu_set_oob [msm]] *ERROR* Timeout waiting for GMU OOB set GPU_SET: 0x0
>   msm_dpu ae01000.display-controller: [drm:hangcheck_handler [msm]] *ERROR* 44070041: hangcheck detected gpu lockup rb 0!
> 
> The first job submitted after the resume hangs, and the compositor is
> left with nothing to show.
> 
> The GMU secure init has the same problem: it is done once, but the
> registers it has the secure world program are reset by the power cycle
> as well, so the restored kernel only gets them set up if the kernel
> that loaded the image happened to initialize the GPU.
> 
> Forget about both when restoring, so that the resume starts the GMU
> like after probe.
> 
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Sent as an RFC, as this only resets the GMU state the driver keeps
> track of. That is enough on the Glymur CRD (A8xx), where the AOP
> configures the RSC and PDC. On A6xx and A7xx, a6xx_gmu_rpmh_init()
> programs the RSCC sequence, and on older parts the PDC, only at probe,
> so after a restore they are only set up if the kernel that loaded the
> image probed the GPU.
> 
> The zap shader has a similar problem: it is loaded once per boot (the
> static "loaded" in a6xx_zap_shader_init()), while the secure world and
> the zap memory region start out empty after the power cycle.
> 
> Would a full GMU re-initialization on restore be preferred over
> resetting the status bits?
> 
> Tested on the Glymur CRD over 9 hibernation and restore cycles, with
> msm in the initramfs of the kernel that loads the image. The GPU renders
> after each restore, with no RSC, OOB or hangcheck errors.
> 
> Prepared with help from an LLM-based assistant.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 10 ++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  8 ++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  1 +
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 22 +++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  2 ++
>  5 files changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 662f09bec9d5..1e6e47b635f0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1319,6 +1319,16 @@ static int a6xx_gmu_gxpd_put(struct a6xx_gmu *gmu)
>  	return 0;
>  }
>  
> +/*
> + * After a power cycle the RSC does not expect a wakeup request and the GMU
> + * secure init is gone, so start the GMU like after probe.
> + */
> +void a6xx_gmu_power_cycled(struct a6xx_gpu *a6xx_gpu)
> +{

Need a check to skip this on gmu_wrapper.
> +	clear_bit(GMU_STATUS_PDC_SLEEP, &a6xx_gpu->gmu.status);
> +	clear_bit(GMU_STATUS_SECURE_INIT, &a6xx_gpu->gmu.status);
> +}
> +
>  int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 92e8c8abb86d..962b497868da 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2796,6 +2796,11 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	return gpu;
>  }
>  
> +static void a6xx_gpu_power_cycled(struct adreno_gpu *adreno_gpu)
> +{

This wrapper is unnecessary.

> +	a6xx_gmu_power_cycled(to_a6xx_gpu(adreno_gpu));
> +}
> +
>  const struct adreno_gpu_funcs a6xx_gpu_funcs = {
>  	.base = {
>  		.get_param = adreno_get_param,
> @@ -2831,6 +2836,7 @@ const struct adreno_gpu_funcs a6xx_gpu_funcs = {
>  	.bus_halt = a6xx_bus_clear_pending_transactions,
>  	.mmu_fault_handler = a6xx_fault_handler,
>  	.gx_is_on = a6xx_gmu_gx_is_on,
> +	.power_cycled = a6xx_gpu_power_cycled,
>  };
>  
>  const struct adreno_gpu_funcs a6xx_gmuwrapper_funcs = {
> @@ -2903,6 +2909,7 @@ const struct adreno_gpu_funcs a7xx_gpu_funcs = {
>  	.mmu_fault_handler = a6xx_fault_handler,
>  	.gx_is_on = a7xx_gmu_gx_is_on,
>  	.aqe_is_enabled = a6xx_aqe_is_enabled,
> +	.power_cycled = a6xx_gpu_power_cycled,
>  };
>  
>  const struct adreno_gpu_funcs a8xx_gpu_funcs = {
> @@ -2935,4 +2942,5 @@ const struct adreno_gpu_funcs a8xx_gpu_funcs = {
>  	.mmu_fault_handler = a8xx_fault_handler,
>  	.gx_is_on = a8xx_gmu_gx_is_on,
>  	.aqe_is_enabled = a6xx_aqe_is_enabled,
> +	.power_cycled = a6xx_gpu_power_cycled,
>  };
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 79912a33e17c..37266d64427c 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -286,6 +286,7 @@ static inline void a6xx_cx_misc_write(struct a6xx_gpu *a6xx_gpu, u32 reg, u32 va
>  		((_ring)->id * sizeof(uint32_t)))
>  
>  int a6xx_gmu_resume(struct a6xx_gpu *gpu);
> +void a6xx_gmu_power_cycled(struct a6xx_gpu *gpu);
>  int a6xx_gmu_stop(struct a6xx_gpu *gpu);
>  
>  int a6xx_gmu_wait_for_idle(struct a6xx_gmu *gmu);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 7108d4aa59b5..b91b32e61fab 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -402,8 +402,28 @@ static int adreno_system_resume(struct device *dev)
>  	return pm_runtime_force_resume(dev);
>  }
>  
> +static int adreno_system_restore(struct device *dev)
> +{
> +	struct msm_gpu *gpu = dev_to_gpu(dev);
> +	struct adreno_gpu *adreno_gpu;
> +
> +	if (!gpu)
> +		return 0;
> +
> +	adreno_gpu = to_adreno_gpu(gpu);
> +	if (adreno_gpu->funcs->power_cycled)
> +		adreno_gpu->funcs->power_cycled(adreno_gpu);
> +

Can we please reset the zap loaded state here even though Glymur doesn't
require it at the moment?

Also, please ensure all registers are reloaded on the smmu driver side.
for eg: PRR configuration.

-Akhil.

> +	return adreno_system_resume(dev);
> +}
> +
>  static const struct dev_pm_ops adreno_pm_ops = {
> -	SYSTEM_SLEEP_PM_OPS(adreno_system_suspend, adreno_system_resume)
> +	.suspend = pm_sleep_ptr(adreno_system_suspend),
> +	.resume = pm_sleep_ptr(adreno_system_resume),
> +	.freeze = pm_sleep_ptr(adreno_system_suspend),
> +	.thaw = pm_sleep_ptr(adreno_system_resume),
> +	.poweroff = pm_sleep_ptr(adreno_system_suspend),
> +	.restore = pm_sleep_ptr(adreno_system_restore),
>  	RUNTIME_PM_OPS(adreno_runtime_suspend, adreno_runtime_resume, NULL)
>  };
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 4b2156825bdf..7ad8cbcfede4 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -81,6 +81,8 @@ struct adreno_gpu_funcs {
>  	int (*mmu_fault_handler)(void *arg, unsigned long iova, int flags, void *data);
>  	bool (*gx_is_on)(struct adreno_gpu *adreno_gpu);
>  	bool (*aqe_is_enabled)(struct adreno_gpu *adreno_gpu);
> +	/* Called on restore from hibernation, after the hardware lost its state */
> +	void (*power_cycled)(struct adreno_gpu *adreno_gpu);
>  };
>  
>  struct adreno_reglist {
> 
> ---
> base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
> change-id: 20261023-b4-drm-msm-a6xx-rsc-restore-hibernation-912730e2de2d
> 
> Best regards,
> --  
> 
> Abel

