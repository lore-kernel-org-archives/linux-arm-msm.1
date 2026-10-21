Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792572177;
	b=2D2nXXJq7wa5JdhyiB1u0fylQQwR3Mo8OPIdOpBvSm95d3rzY21pbOBthQglLzHPyehb
	 6ykwlUq7kluhjUor3n1Ov8EQqoIM4Ed15oInI+TIMr78USY1S+r9EKbYQviKAOpqFsUY1
	 VTZ14yyucQp+8IP84o6eE0byHivb2ZZzkjIKdr5lCjDaorZdLEARJrtz2f4TedC9VVexg
	 ybj+ndfJ5y8E7KeLry86Svxl30bbWdFdvd6RJ57omLlXrKrSdkHDEoYvYKrw1mWZqnkU/
	 3Z1Sq73NLJJaV8Xr3OWmrS2B7SGLr23av5PDlgIrfMJW/kWD9RFWXpDAhgylQ+uGpJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792572177;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=egoCefaEWBE1zHp2Q49ZFDFGmYZgTt9yQigi8gi4k1k=;
	b=bZZqE+OTwC4nx8AlT3NTtDrrf+cO3kw2eJ3rb31+6hjYg0OUSXlOzoQ+HmjxpZRWoVJ9
	 4871YjwV61Jdu6OPzmQ6SvC/TXA0RjGwMeIQF5/q2ro+0OoOOMVI29rtwBZcJTJNeqCea
	 uPkUWlpihWUtqJOdYqZSu9Jai+bPeufTWE0pbplrKG1tTzuC0ccwPDrbjbPBtwIqFNHoz
	 rCX7xbIkBzG5zKi71eUidafZgaZkmXe0tKhoVkIlRQo9UNJ+m13pukaWv2CYVPkOSHHU0
	 1VZs8R/HBiF5J1SR2GXpGl6CvD4BCPVMu3fBWtmcX2sY1NViXAE1aggoVJ3OJeCQ+fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mfbOFkqE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUcJ3xtc;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6143A606A319
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:42:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6143A606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mfbOFkqE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IUcJ3xtc
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jJof2848239
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egoCefaEWBE1zHp2Q49ZFDFGmYZgTt9yQigi8gi4k1k=; b=mfbOFkqEFPZKslLb
	0cI/K72Sm0bZ5x0mXtPHd1EPwDqDrUHWxRlnp3DGmrpFaI6NCTVJNxQd2RclIx2e
	fYkwvZLeykvYsqEaiE9mJpwJmKafBSLNm+Tt5F+zf+VrbfZUGSKAjlUMQBqcwd9B
	JO5nly5fFAm/VOmj82J74rI1eh8ZLuFX9zaeO9B3Fn13p//YBY0SGqlvveQlB015
	yG2hkPgBUqbMcxokXZcdEgiGYwsEITvddfMY7MqTXuKckoQlYg6FIVWxDkjfNpBS
	TJp+677JlM3a5qRKPdL/pJxEg6gFzlnKhxUWowKm9ysximAVj7uXoucjvtCme6b7
	TLL6vQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9as0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 08:42:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cac495d99so9310085a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 01:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792572175; x=1793176975; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=egoCefaEWBE1zHp2Q49ZFDFGmYZgTt9yQigi8gi4k1k=;
        b=IUcJ3xtc2PyEQYMwRbQ8IEqd5E/xJMsl9+Vafof/dG46DozyCTTubyBAUHysIxrCoj
         k64jQIqtuzmlzeDWklhFg3/Kako6bN36Y6tPx9RTA8nKOxM+gLcJSzv8ynahm1yw0Ak1
         bk51mcoSzifFV3tikCDZAFlH0B8fGGeZ4WE1AwRQ9hErFE6rPeHppGbBhtNYMptKfdAA
         pQIYTYZjjwR71+A48VuIMnIQwE1Dl2TMUKYMre9oCCQYUz9wv43XPO9OpbuPQPOtDdEQ
         ngvk+ojRfx5Y+Z2ic9sA0kuZ34dBw4HMD9SIZ9NY6tvmhcuv6Zj/5R/i4lAe4zzuVQRX
         cPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792572175; x=1793176975;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=egoCefaEWBE1zHp2Q49ZFDFGmYZgTt9yQigi8gi4k1k=;
        b=RTXo3MEVw0pKaCUOP3gUS1HqhQDMoFW58hMOhjX7ZCoZcvG+modhqnXcTG+7wp5l99
         OVAMbnLwJEJ//ht9McrW3/0xXfPh9I2eveH3rWaOIYkW/50/iawDCEp4OfQzzqFXHgdE
         nJQFXIcT3Nc0YlYfPH2K9jBu/x9UmxCPSUa65XJhf7v8dxzAu+SzaYafruEtY/A2u0p8
         kMdCTQGeeIeBp72I4PKeevM04TY+8o5p+BchoDte+CpDaNn6UPHAMk2HgS5hQfeiNRfn
         VLC8rDxFvM1rWHVVIoaDDYbI5M//mFn1/m4tsgRbF7HBBXZ/VrocsgqmKP4sTjHiMbw0
         xpIA==
X-Gm-Message-State: AFq9FYLsRSkxFN97BHtftCPa1CvtUCOkpGL6hOhqzNLkErKL2Sk7MRaU
	wlGrHWtLhQsm6GPUXCsCL3odLkFvq8+WTDQ1YisFYTE52MXY1qrCDFKWrUbqLsEMe0mAiyPvbtg
	SXoGQ1OLeEinOdW9HVfJCiDhGUdRwOUt0jP4ahRpBTwvhPmZb9OVf5zCJdkHhcZrskUhA
X-Gm-Gg: AYBFou1S91nMchyyQuDwkPm4S1IFrhB2JzLociXrkYmteGbsVosSBbdFRp5XCtWpq4D
	uQIB1ZrAuNX1jBKb5eP2pfG6J2zWqQq24bihDu05KZHLpXCRSCa2neRZ/yaKCyJp8PhgSDLvu0a
	1YRo20yD8GOlLyg6pjcAVm2trKSPcClaAUEgtdrVOjkyHVIiu5ueq4GAKFcjHSlqPCOLEYKyWxI
	eq6tZyYgcJXenZSIXbg2QTVWBaNVfM77CRxNEjX5z5yck4Yzb97PRWAjJwEwIvdQRVRhv8sC7n5
	RXxuXMlEhVy3Sq12Li9Z9h7qzKXmxT0Lv3dz6rppaPspG9N2dRbTIXXa6B/5ksWy0jrgq67XU6p
	1EpGLBZjJy1iLPHihxtRokg==
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr388313385a.6.1792572175481;
        Wed, 21 Oct 2026 01:42:55 -0700 (PDT)
X-Received: by 2002:a05:620a:4687:b0:93f:1a1a:2974 with SMTP id af79cd13be357-93f580066d8mr388310785a.6.1792572175099;
        Wed, 21 Oct 2026 01:42:55 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b402f2c2dfsm608020a12.1.2026.10.21.01.42.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 01:42:54 -0700 (PDT)
Message-ID: <7f3a33a2-8194-4d6a-8459-73371bbf1b16@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 10:42:51 +0200
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
Subject: Re: [PATCH 09/12] drm/msm/a8xx: devcoredump state capture support
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20261020204728.28844-1-robin.clark@oss.qualcomm.com>
 <20261020204728.28844-10-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261020204728.28844-10-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfXyyMHr2hd+o75
 n2vmZjvCMpiSBZa21E/IDtnMam/JFfqzqfnMAJxO28BXK1wpXCAEMW4Ste5a//9JTjaDlBPIhYI
 pLlLJpKK0xI2VX3/YqfbN7AkllRgvuU=
X-Proofpoint-GUID: CnfV4bOcnu5sdE-tzVKfjc_MAYApU_Xk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNCBTYWx0ZWRfX/N80ObV4w1Rz
 rXX/snCxbXCqW6WyfB8jUGAunubol4CLp3BwI7seNpI2JZLYdPBxKItfreta1JjTuUBhjGcOuFK
 641PAoniTRVz9StuA8yPN1dfb0do1VAbyoEOeMvzd4QvRTmgGOtB0Jip9fpKd/8lZx20eoHtC8w
 Z87hX0PLYv1Q/iSa1Cb+te9QYn8/7XPoeMh6JVtT+0FkI68Qksn/gtCeeSpEzgtcMXQfhropjAn
 WX4RiFqct49ctUl7GlZz+f/4VlRDtxtbCGdlhoQ9CocFsJeM7etLzPnw0uG/NgFUen4KJkApCk+
 pW34+qt/ORtcmHH3cK5CoX16pcI3EK6U1PGsx/sObz/JiceMCa5seSqXo95gWZvrtgVh8MLy7rI
 XDs29721/+yc9s9M/BOzztQikbdaYh3If9qAICiTAEA4QEzf+vkdOXcBD6bPmOrMfiK0O0V9h+5
 UF2eVJO2b6dZNtZZvHg==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad87b10 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=2HxrRyV7D69wryGh4VUA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: CnfV4bOcnu5sdE-tzVKfjc_MAYApU_Xk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210034

On 10/20/26 10:46 PM, Rob Clark wrote:
> This attempts to make it easier to compare to kgsl, the downstream
> driver, to make it easier to spot bugs or missing things.  Such as
> re-using function names, etc.
> 
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> Co-developed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---

[...]

> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +		.show = a8xx_show,
> +#endif
>  		.gpu_busy = a8xx_gpu_busy,
>  		.gpu_get_freq = a6xx_gmu_get_freq,
>  		.gpu_set_freq = a6xx_gpu_set_freq,
> +#if defined(CONFIG_DRM_MSM_GPU_STATE)
> +		.gpu_state_get = a8xx_gpu_state_get,
> +		.gpu_state_put = a8xx_gpu_state_put,
> +#endif

It's odd to have 2 identical compile bounds side by side,
I'd just group them

[...]


> +static void gen8_cx_dbgc_debugbus_select(struct msm_gpu *gpu, u32 block_id, u32 index)
> +{
> +	u32 reg;
> +
> +	reg = A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(index) |
> +		A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block_id);
> +
> +	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
> +	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
> +	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_C, reg);
> +	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_D, reg);
> +
> +	/* Wait 1 us to make sure the data is flowing */
> +	udelay(1);

Should that be a readback instead?

Konrad
