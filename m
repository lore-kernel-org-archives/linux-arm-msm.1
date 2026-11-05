Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793915094;
	b=sPIDZBWJVgP/ZiJZYu0NX8/OsZuEVc21UjweQ5HMFprr7QHtQJFMdxSw0f9qpPcA+U4b
	 0ghwx28U169FC4GLdnX6uMXnIYI4nMUhhdLt+R4MwUaz4yTgdR9epOdjclwqTALUPtZZY
	 NR/lXD13/26V8GltmV6KkTPcsVKdTuJAW2QLbjbxr4r1TqW/9MYY2qW1es7a6yzkjwWg8
	 Omb+mTuswkOvDYVSGm4FrMR07Nc3C7Vrn6e44vhgvjRJYPzMIKkHgGhXh6IhvGze7Dbpu
	 /qzeEND2HINi+h0kCETGvcV64ZMnivNxB9c7NgomOz8VUVk0ImnZPTuP86nzeKvtQ8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793915094;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=06Pz+rhblk8xXsEimpEKAfKFnRQy16Fd//EzbdlZBxM=;
	b=GvfmABb+oq6wY97bXlNLUxws3aGiWjLcjjyNO637fl0BqZU5xIcj2JvkmgP0OZ5dxwSn
	 EOHvqn1m86TBNc49MnkQHRUkgyX7ZRe7M1V/1DTOYQKWGuW+P+5D6FRSdP3iXCY/wZz92
	 4r15JVuTCLFJWRur5v30gf3fhHCjye3hf/WywrfA2bVNxMCgiuknqKSF5/faA3lO577G4
	 Bo308IbCjYAUT5XPCaMOroPbLUzyFMDsZgyToqsML6k+1gVduoYEe6TpcSHD2nBwFvBRJ
	 hGzYM208+MDTiaQRZCBTK+vS4jHaHOKnBV5WIbSKF//68vAuLipdccHYJg8w2wY61FA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DG5/bwH5";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QeYqzf1c;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A102A606A31B
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 21:44:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A102A606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DG5/bwH5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=QeYqzf1c
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A5L6s8K337476
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 21:44:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	06Pz+rhblk8xXsEimpEKAfKFnRQy16Fd//EzbdlZBxM=; b=DG5/bwH5XPJqkHgX
	DiYs0CYIam5V5Z6h6SQmff+AYwRnLjBxJhsrdhf9AVLr81NJbPd4laOvYk4f3oCH
	vpeVgv+Ayv4tELOxypZJyuwUsmeIRBOkHPvSmRBkEFtaatFHae/xrl+DQrbFTgAV
	XJE4PLDnPUuXkezUIKaDanxrhSolXB2Ss/7cXZKysk/KvDDq6+tPoPFq1MY9jf4o
	i/u47CF8oZ3/CsZrHn8TADr1AvT4MZL/NoiiPlYGIO+c6bHyn1mqxjnveCyqYXos
	xckrQggFTg6bYi+VplWPnU32mHOVWV+hskacBNeLkH93PFp4YIQ0VkUi80CkxgER
	uTVMeA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrrkdts6h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 21:44:51 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36f479b9819so544561eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 13:44:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793915091; x=1794519891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=06Pz+rhblk8xXsEimpEKAfKFnRQy16Fd//EzbdlZBxM=;
        b=QeYqzf1cvDzcfOzw8rDrAbeGhCMn0gReoGALj2oM7SLC7Pknx2LbfPhC/svzE80+fy
         m1NmcQ0Xn3b4GTBw4Z7mXv5rJ0uO5Auj2PMy+nUZGd63JxMDs3sUTo09qwAPPYp9GUYY
         SH/cK3+4AFj5kqIVK9gDEBkiqVuvn8V/RElDalMVVbbhqZmEMUwf1RmeFOySKTELoeen
         P28s+1NiM95uDcWstc5k59NQc0TK9TGgd/AzcZdR1YEqierm3rRYw6JR9YNglp0/+scj
         LZrneyPq+cwrVFNZaj8f27CIqADz8du6kBYWZmt/UEuAq7GZ3FVaEImKNrmRA5NhDDoW
         D5sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793915091; x=1794519891;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=06Pz+rhblk8xXsEimpEKAfKFnRQy16Fd//EzbdlZBxM=;
        b=b15w48feCFjWVujcqdbOCoEeoLBXFY+FEf8ftPiO96LYEgM465j1M/z7Gm9kgJlmzn
         YS+MTEXzeyS0chf579mcItBomx7agmZuKurAv/66DkJBmqSVvXa5UlDbpolkGVKb+wtN
         fCOYgbf/ce6pcxq8UtysyRSqrG5g1MqZ6kn0n5d/UFaYQpS7iLK4+vy1m386RV3yFVHV
         1SMxhpo0oSWMrdqf/ESInxr05+mbON4hH13r6CHseB9YtRDrd+/QhJ0kugT/sBAk08z5
         YSaYx7uB0NZEqrYHtm0qbnaasHMyGuNEIw/mSOgnWKNK3bWNuu29LgwYQ8bqzVHPPzrM
         3AfA==
X-Gm-Message-State: APuU4Z8OPlGLy9mieAajK2s5xpPR2//qJP+5hIwOP8gFVyqAZfCtB8k6
	vELnAYRsmd4/lfgsxzBKMt7DSRqjjENiYZ4a05akoBMEAJUbP43tHNuBhaOQFQsSEzKJpHHFx+1
	aK3ZEco/8c5TCno9lwY+O+beonjSK3hcqsnmAOamXnBk/JWxqFW8i3to8aQEi65pIG3cp
X-Gm-Gg: AYBFou0EVO+gtNMX6in3scEZNJTD8gNt6J13CwB0GjOQpRyU7UNXhlJ5C70VrqnJDlj
	LMXWpBS0WHMIRaa7lfpTNAlTQzyvG/jhE+HN355c4sJA/LrtF6CS/h5XDBf01BfYolZfdf4lILh
	YT3llsZ+1A3mxxpXReJ+UaufIMIiz27r6lpE2LbnlC7LR+67nW/CN8a8IXUYsrBJI72X47pO20H
	dSjXANJSu0N9oM257GCGBI7IEW3WphLYRbw7yZ3mqBHOF0hUFZNnRv6uPf6CSOqhQNHpUwIJeZA
	gahmtngNkLWmgvZHwnLFYEMJ25rkqrpTDXkPU1j1MhTb+G5OeLz43JyBsn7mH4ftCAjR4EhI5nr
	lcp/EQ+qURofQUYYWwAZd/MkkefU16IkIciipNXrNEWxopw+Av/dlhKV88ivVPfbya86fqRA=
X-Received: by 2002:a05:7022:1007:b0:1b1:251f:d732 with SMTP id a92af1059eb24-1b25d31dcfbmr434111c88.31.1793915091134;
        Thu, 05 Nov 2026 13:44:51 -0800 (PST)
X-Received: by 2002:a05:7022:1007:b0:1b1:251f:d732 with SMTP id a92af1059eb24-1b25d31dcfbmr434065c88.31.1793915090303;
        Thu, 05 Nov 2026 13:44:50 -0800 (PST)
Received: from [192.168.1.9] ([106.222.231.155])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2de58sm17925920c88.12.2026.11.05.13.44.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:44:49 -0800 (PST)
Message-ID: <f7757478-1d34-4fc8-8798-6b5863b4351f@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 03:14:42 +0530
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
Subject: Re: [PATCH v6 06/15] drm/msm/a8xx: Allow nonctx reglist to include
 GMU regs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Alexander Koskovich <akoskovich@pm.me>,
        Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Bhaskar Reddy Valluru <bvalluru@qti.qualcomm.com>,
        Nico Angelo Dela Cruz <nicoangelodelacruz@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20261105203057.66520-1-robin.clark@oss.qualcomm.com>
 <20261105203057.66520-7-robin.clark@oss.qualcomm.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261105203057.66520-7-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Xd4cX455 c=1 sm=1 tr=0 ts=6aecf8d3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Hj0ah+TxS5FywmoD0uLh0Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=2Kw845l3AHk4TKGYuZwA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: CTXV8tgwXGRKPZ3FxtfYHj-JnDIGrRkX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX62/wqe/WTuph
 cGwHBiCk0ZobiFgT10b1T0p8S46UIkZHuWlwJoHfXxdzVk0v6DyCJ2ZF9nSkZP1fqOJu42oUjkp
 384R0Olf0BeeKvR3YRaTPh9Uyi9CVxw=
X-Proofpoint-GUID: CTXV8tgwXGRKPZ3FxtfYHj-JnDIGrRkX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA4NiBTYWx0ZWRfX/B+6I3xJpqxQ
 IQmhdKQ3uQJnlCruG3Q1mwfATHABzizJT8+8igHeUE9fJcrkebDL9wfXrHhSekvmBKWPKebvfPA
 3TvJ6t7hLTAM1ygNN3eYcmJlY5z4TeDFQmxMSFGwyZXzGO3boHGpCOvPfhA8svf2TVQEhfxPy2P
 jRrZGBFxwZ29DTIOTTvaIzul53yjTXiVJDJ3yi5OGrMJE4Eu82agb7lNKkt726bs6Qy2N/PNgMZ
 Se8E4b5RYMXFHEwxPQKuDQpXzI1bcL3WXmu8jjSjoujCsGCMH+3Tm1NozR0AoUUTROC+KHHsO3k
 AOh3ohnmbHrfT3Yxt03fLOaJc2PYlmBPWHRikrKch/2YR6reVM0EwPLGxtgXguY68J2vw5X0neE
 r0o+LGiEYlupqfIAjlUK3PfUBeguy+xAp1c4lklOctXnrbqNtk6LuwYIdcaSZ7hYEZo9GFDOgBS
 +4W+SY92HMqHBrWAhdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_06,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 phishscore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611050086



On 11/6/2026 1:59 AM, Rob Clark wrote:
> From hw PoV, it's all part of the GPU.  But from dt perspective it is
> it's own device with a separate io space.  So we need to detect this and
> direct writes to the correct place.
> 
> Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Alexander Koskovich <akoskovich@pm.me> # Milos (Nothing Phone 3a)
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> index a29f8149493c..59898b49a201 100644
> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
> @@ -373,6 +373,7 @@ static void a8xx_set_ubwc_config(struct msm_gpu *gpu)
>  static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gmu *gmu = &to_a6xx_gpu(adreno_gpu)->gmu;
>  	const struct a6xx_info *info = adreno_gpu->info->a6xx;
>  	const struct adreno_reglist_pipe *regs = info->nonctxt_reglist;
>  	unsigned int pipe_id, i;
> @@ -392,7 +393,11 @@ static void a8xx_nonctxt_config(struct msm_gpu *gpu, u32 *gmem_protect)
>  			if (regs[i].offset == REG_A8XX_RB_GC_GMEM_PROTECT)
>  				*gmem_protect = regs[i].value;
>  
> -			gpu_write(gpu, regs[i].offset, regs[i].value);
> +			if ((regs[i].offset << 2) >= gmu->mmio_offset) {
> +				gmu_write(gmu, regs[i].offset, regs[i].value);
> +			} else {
> +				gpu_write(gpu, regs[i].offset, regs[i].value);
> +			}

Any thoughts on a common IO accessor that can handle both gpu and gmu registers?

We had issues in the past where GMU offset was used with gpu_write(). We can avoid
those confusions with a unified routine for both GPU and GMU registers.

Anyway, for this patch:

Reviewed-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>

-Akhil

>  		}
>  
>  		a8xx_aperture_release(gpu, flags);

