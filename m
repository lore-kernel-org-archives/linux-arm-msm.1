Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795027490;
	b=TM/026IOasS5RJk78KbIYg8n2HTS/3Wpfej8F7eUSzrW0yrocKd8WmMUM7XcP3gzAdXl
	 SlT2R3LClQYhPJzkIlaEs+mR9pYFzrNLrceafftKdiOct2YBlUyi9SQu4doXraWHgtrRc
	 QJ00tNm9zxup/xh4NPxzR6B56+AJBqHM8P4DgkFL1NBHLf1QdYlFge3sO/xhb/4oROzpU
	 vT/xKeIb8wHZBrdFoVHnAbjpG5epiF9mhs+88v+CBd4RMj2AOeC5HEAGDlbV8DPQYGRHh
	 0eoTWo4Q56Qk7Sb1kja9mbt8nSS1dw7Sgh9gk5wpffxFB1hIuPyzJ3AMFpZq+z0Zwmw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795027490;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=;
	b=lAErSLUEND3iaYreZYoyXGqEJj6WHeDbuL3rajNwXWhNWeL4ANhzJzRtgjyAWkty6bh+
	 jgv+XQI7lQp25IToDdIuUdgpWAKQUK7FgUYh47K6bbnvUrlsGtbi/9PrSARDyQUP1JFYk
	 YP7XyNObZZ6aTHTZGFb6ypkonVk7hR87AZxzCNZmVnQm5FiBC3G5193yS6P8q9Zb/MrYX
	 NsQhQIhQItBLgEqmEKFmNxC0b82IYq0SqrH0nK+B/AcbcTF02FgEaxF89siioPjZqZ1cf
	 qSqxfF7Q1xF00scKvUuBt6VB+pyz6vQV2xXSbagiMGHc3Wm76dL5EEGf0fl4/EqhsRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N10e3bat;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWH6qJWr;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA52460A260C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA52460A260C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N10e3bat;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IWH6qJWr
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIHHB534086844
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=; b=N10e3batxmo44iLK
	e0ggGLrFGUVup8oItqLUH94w7nY6RAHtXIuHt9Unc2uY6AcvHHLBiPdFxWNULtPg
	j6Sc4+X/SyXwh7OlgxOem2VHCJRbZ6VxZy7hDxiSaMRRA4SpjTfNT/yk9hCRW5/s
	1wKHdF3HQEdHFh2vixpA1/iCP7JOKCLnAuE1nrKpJ5XBbJpzdqDF4YExSah1eLwl
	ke/XIvT82L7xdeTB31pxziL+/qvoAYbvilwRs9t43KVum3xyHgI6IGJXazuY24LP
	A8vD7V0pC4GZDlTfulL91iLC38KbVNCbcLV2Odpo0M1x7s3iwO7MBDzEUdJSGfLP
	M6HrBw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dfcsck8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 18:44:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2e95f8543c9so18699035ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 10:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795027483; x=1795632283; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=;
        b=IWH6qJWrkwmHq2L2FKQ9cGiD33E5eF3VC6BRzsORepISu5GcHIykkXDwdfRA/wMWCP
         Yj2tiE16mpC4d7bH2bTWHmtafnH2ggmPXx+nxZRUSNTU42MPqs4UZVtLV3SVTHvb5RWm
         /OPS7Qf6RaW6zp5lwE14HoQ6nS7651X3BWmhqTMX8XyETYkKiRpSKYbOBt45T/9AW1O8
         SIzbK46kV9eX3KVc+UdG8MTBE5xZjpTJwNEOoEYjguJV7fxzLNRC9nooS/WrP1HAJ+2g
         9aoWoDBorenuTHe4xERZJu3yqPY428Z/1F1CDq/ZSuICGOupTVhnaTxzi78EP3XSHoTV
         DGuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795027483; x=1795632283;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a/1FJMohcTZY+9QiEVW33qHS2hIU0UKeXROf1tu+3XU=;
        b=XPCjS6KFehz0hbIHi3tSIn89lXEaT4v7p2ax1hNtZT6mD5zDVHjyBhFDLlvMgf4bK2
         CDhK97imzC+ClKdLX1x1hfKu4467wIp5rb7sqApW1jR8d29Lktd4afwjOFHMfxvfVtVt
         Gb5zFewnBnTrM5TqRlfPkS3xQpu0rDOqytFybSz4Yk88g048x8yFY/Ddzh2Cp33Jc9gJ
         68RIpn49Nj4g04XTqn8CBafYOwUm0oLgTqCYeOpjQhUf82Er2OQEirzk5FD4XbwDYlOT
         jzuf4Oj0B0o28MIHkWaDNUEHhww3vIVSIBfEpZr+FkSrSVVlVILPV0iyjw1pCZHRxhLy
         7mug==
X-Gm-Message-State: APuU4Z/f8MQ0rKebmYpq3UPdsdD9naKaM2dvaBX+wZHcEagMRJ2n4ih/
	IIRmnHyXVN9QzU5GQcRMpMmb1GZXT0lIhS+dP0aO54H0RES5pxZi47lzlqjnj5/i+3VLtsksBG2
	tbD3gX/LdtPWaj7Ir/OUelmZnKP7tMRJgRuWhszVfqRduCnvPzG1AkHBP2wROkkkbc+W7
X-Gm-Gg: AZFdTZcAc0ehE3f6Q6QdTcb0TN2FCKn1Vh97haRKI+0Ym2ILhOsViX+RYWDj+Z+c7Aj
	lRYjskQhvzzq3f6rlCtLHFdcFE2wq0gNcuOVJJqmADjFO7Hx7TOQaOpPRb5JSxxtVLCoHhR+YSy
	O4zwPqr7KgshfmcGHi1m4ARLpbLCsC4QMS+gU74CQ51Yx2+VqK3c076UFusRXaejVRhG/OWdimd
	mRK8R3OdtscDJ+WGIi9Fr2DnvkF7vDztu0kuNy1rk6cM0aogxFINxW+BNAvl4L49d1QSFOFrxBq
	R8UEJ6LHA8zbe2veUR5nDTI4qvm2pysT1vTFwjDdRL85X+iIVpsyQOhSUjWVkLO+4zu2l7hy1ee
	/5yvTrAGP2BX6ekRpIokH5ZcPro5hGPEv4Qk14FPxTxiRuS2ZWoMoLMqBoVqktyg8OuxQwZC4MA
	==
X-Received: by 2002:a17:903:32c1:b0:2ed:1b26:2bf2 with SMTP id d9443c01a7336-2eff7100c7bmr32660365ad.3.1795027483397;
        Wed, 18 Nov 2026 10:44:43 -0800 (PST)
X-Received: by 2002:a17:903:32c1:b0:2ed:1b26:2bf2 with SMTP id d9443c01a7336-2eff7100c7bmr32660205ad.3.1795027482912;
        Wed, 18 Nov 2026 10:44:42 -0800 (PST)
Received: from [10.204.104.211] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff6115f28sm18076975ad.19.2026.11.18.10.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 10:44:42 -0800 (PST)
Message-ID: <069c590a-7b30-4985-ab83-56150efc8009@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 00:14:34 +0530
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
Subject: Re: [PATCH 2/6] drm/msm/a6xx: Don't fail GMU resume if the GPU init
 regs SCM call is absent
To: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261118-adreno-scm-fallback-v1-0-e99cdbf3121d@oss.qualcomm.com>
 <20261118-adreno-scm-fallback-v1-2-e99cdbf3121d@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261118-adreno-scm-fallback-v1-2-e99cdbf3121d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Cg6GQ6ZzGJpET6W4XEkPonNtl9OVIRW9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX3oWnAgHRQuej
 89zvJbFgAW0pXwqCmWsyWspQCOmwqoTsl0IJwrI5y+Z+pGSZXie8AWIqyy3Db6DjiHf+f+oy9SP
 PfqTgjwFOLaDYzNYc0GvZiQR5Q9V+Tg=
X-Authority-Analysis: v=2.4 cv=CdSdd7rl c=1 sm=1 tr=0 ts=6afdf21c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=xDuVsFAvjFWeh2iC3aIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Cg6GQ6ZzGJpET6W4XEkPonNtl9OVIRW9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA3NCBTYWx0ZWRfX5DuzDDmoo/8b
 aBfrovALSATm2pkKt43N+it64XhR9mot2n6JvJ95XHfybGGjHQ1jvR0wduQuhmYgs8TMKSIz8WV
 72Ix4xTNKQJ8CshGkO5gbuHnrn5y2ZkdhZc538JeC8z5Ysq4vc3HDoqbkYBINC4BP/t9vTmBfmN
 IXL1uPwKOwKqdoH3tu7k8tGazu8Guo6fo2l601UKtANyfMT0Xqya6mmqjO4+Fk67LRd4zsEZRxe
 4M34J3nk8cfWxa2MekJCziVjk6L/9A/Q55OTXu8FIZFnZwVQLMAXeekAPVDIRvg2eAn5YsCn0Af
 P5J7M0I5pQEd+VeYNi9HZBx+j2n//mENXFmNFjM862TTIgQoKOZLbGsUWGDwY0DONQweH3N0STE
 MO6y0XejKLo3H6OY3A8BhVPYqAll2H7odMt/Ev4Ele1eAJ44mtEldwIHVOFlKxpDMzoDs0Ee3Iq
 hRLoAtmihLIkxEcMNnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_05,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180074



On 11/18/2026 6:38 PM, Puranam V G Tejaswi wrote:
> On A750, A753 and A8xx, a6xx_gmu_secure_init() asks the secure world to
> program CX_MISC_SW_FUSE_VALUE through qcom_scm_gpu_init_regs(), and
> aborts the GMU resume if that call fails.
> 
> Some platforms have a secure world that does not implement this call.
> The call fails every time and the GPU never powers up. The fuse
> register is still protected from the kernel, so the driver cannot
> program it directly either.
> 
> If the secure world does not support the call, skip it, but still read
> the fuse register back. An earlier boot stage may have programmed it,
> and the features it enables, such as raytracing, are then reported
> correctly. If nothing programmed it, they stay disabled. Log once when
> the call is skipped.
> 
> Signed-off-by: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>

Maybe shorten the subject a bit. Say "Make gpu reg init SCM call optional".

Either way:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil.
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 27 ++++++++++++++++++---------
>  1 file changed, 18 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 0fa2d2091f3e..95636dabee38 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1249,22 +1249,31 @@ static int a6xx_gmu_secure_init(struct a6xx_gpu *a6xx_gpu)
>  			goto done;
>  		}
>  
> -		u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ | QCOM_SCM_GPU_TSENSE_EN_REQ;
> +		/*
> +		 * Some secure world implementations do not provide this call.
> +		 * Skip it then. An earlier boot stage may still have
> +		 * programmed the fuse register, so read it back either way.
> +		 */
> +		if (qcom_scm_gpu_init_regs_is_available()) {
> +			u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ |
> +				      QCOM_SCM_GPU_TSENSE_EN_REQ;
>  
> -		if (adreno_gpu->info->a6xx->clx_tbl)
> -			gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
> +			if (adreno_gpu->info->a6xx->clx_tbl)
> +				gpu_req |= QCOM_SCM_GPU_CLX_EN_REQ;
>  
> -		ret = qcom_scm_gpu_init_regs(gpu_req);
> -		if (ret) {
> -			dev_warn_once(gpu->dev->dev,
> -				"SCM call failed\n");
> -			return ret;
> +			ret = qcom_scm_gpu_init_regs(gpu_req);
> +			if (ret) {
> +				dev_warn_once(gpu->dev->dev, "SCM call failed\n");
> +				return ret;
> +			}
> +		} else {
> +			dev_info_once(gpu->dev->dev, "GPU init regs SCM call not available, skipping\n");
>  		}
>  
>  		/*
>  		 * On A7XX_GEN3 and newer, raytracing may be disabled by the
>  		 * firmware, find out whether that's the case. The scm call
> -		 * above sets the fuse register.
> +		 * above, or an earlier boot stage, sets the fuse register.
>  		 */
>  		fuse_val = a6xx_cx_misc_read(a6xx_gpu,
>  					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
> 

