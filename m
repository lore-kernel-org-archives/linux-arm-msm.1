Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8243530E0B
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 11:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788867911; cv=none; b=IN9prS8oV66Jd66NWWx8BdvG8M+9gdWgnMCFL0WP5BKI/zo81vqIj2I/spx5l7YpKjcXr1rPr04bNy6xLJkpiE5xGdOYHSqsrwohFxEdHz1vFl7gYZDrY7uK6r8sLCCnhXBqf6IQDJRXGBkQc7h5Q5zzq8/aAWwwrqRKbIT3qeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788867911; c=relaxed/simple;
	bh=2lnjyG2aLgNkVEo3+hRGXnG+fNvKoY1z3nKcScXSgms=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Df0X9bTd7TnCNZkxUQKgR8MbWxxbSvMK6hSfQWmfW3bRCxiUJx+dd3SB8Slv9HuwALipcYDfXiSm4HJsb9TYG5d5y1k5Ykbi1r95r0r3PBC40nG2tpahEEkU1h/d8scO9rGMOy3+jCCDtRGEiaqq4yPOs9ixFJPLmZ6MmPxDcz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J8btow6Z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IBJlZDlB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J8btow6Z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IBJlZDlB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADEgj3506440
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 11:45:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0R6HxB4xS9P0kh2KTlln0CaPw4s9m8YTu+2xy9jIJP0=; b=J8btow6ZiPSUMTeN
	pH5cTdqQgZKjwde99Cx+EoaafbitcoLF6mH6IY0Au81AQJaHYkiBoOep8n8kJNXR
	yEnGxTlxfWs0h+PkmY8eVMrXg4f6z8Fyo2zE317iMDEey2EKq81fXMB5p4P+Ycf0
	3Z73DMWD9q3sNpcDynKiwOdfVJEBpp/j/OfL19M19bS8Y6uqNlrbrX+aiy8mP0xZ
	Arb9FgZxHm0dLrC56ArXCIhul7mXczfIIF9h25cPlbTpH/4sHMkV9Gs3Qb4R6Rua
	RzWgDvrfjkstrijxEjJP0DKuoPBeJ5rLqDRolzCm19NylJc1cL8qHir6WkRSnymh
	pbcpzw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjg8xrch8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 11:45:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-530a0a18108so117041cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 04:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788867905; x=1789472705; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0R6HxB4xS9P0kh2KTlln0CaPw4s9m8YTu+2xy9jIJP0=;
        b=IBJlZDlBUK1V5cMC1UHJv/0Vy9yICyMXUyRY1a8zzoVInjARunhTyTk4sznYQw9s/0
         UDuNu+tq2XUUdFJWAf7V88MHpQKOyclCkeDeHpfADZFVMT7KSS/px2l8ieiXJxoTfIEC
         L4wriGYiP3ZefnFV2lnG30MYDTU4+g2WXxCZPVeg4hPhLMcOt3fouDoIHWlLdW6GwZ6R
         QVN1qXyd7Oo82UY9ot5hc6+4hiAcwk5McXVAxa4xTccAOoDx7WYAAUVtge65qqfK66NE
         gxKcMpx5x1SRavS+9c6dgyQespnxrTX0Wm1LOnrDeHBDjTt9B1rVSb8G82njpWmQothx
         xYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788867905; x=1789472705;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0R6HxB4xS9P0kh2KTlln0CaPw4s9m8YTu+2xy9jIJP0=;
        b=C7Nt/Y+HAaeatOdSg412Q5pcTrG3lINsLw+j4VDTgV124qDkv8IBaOw4CO67p4mlU3
         cMr4w080ZkpdI6UN+Rw7DAXi5iwxFFIIZAQv1mt5K3X8BFhAaMbaaFdFJueJtCDKm6BY
         jQe4Q4EncVefJVqdXUdD+YnhDltaizC6sd//SSWA04kjjT+C1qwxK1Nu3XUyZgOzP+4U
         SKODm1PtEaC1JIwt/fylSnxiwPZfuhCgjZ1ofJTA5TPKgcea619S6WmhhxMrPOaztHk7
         fj8rd6CsK+dH9pfxS/8ga6Ke7pHaSURZACsggZVnwppzRpu6B6n5hbOGATAWMyuyfOWR
         i1XQ==
X-Forwarded-Encrypted: i=1; AKwUvBzddnqMdTSmeAfHI7MNixnXtDhlJujtZmpGtj4xHqamTeRKyuVJado6IBLp7I423GGeHRb2Nw7W8MeI4ERJ@vger.kernel.org
X-Gm-Message-State: AFuF++mcpsawk/xZxGdA87ejUpSewVd083fvY6uIApgd9qt+/c4FGD00
	Qp/vCCeCEq9Kdd4ONyYWF2NooyTsE5864qcEjrpQgsoOeWvA0dtuY4vVBkjLvp6y613y93XAP7J
	JoksQMAm9auHpZIXh2nTjzxRHonXwmtQEn4EQAjxYnFcviDwDAIT1/n8XlPCn6hg6bwGr
X-Gm-Gg: AYBFou23rEhIKbUARGIGaIAOn8Bprt0tyRT/Cwt8iq3yFdGIbjNaUjhaR9qS7tRo/+R
	8m1JZ0kSV7P/7IdhCBaqzsOzYlO9U1I52uMKRs/p13vfNbCXP3uYjDF9jsjX+2CXrhGiUOSBj3N
	SM5yK4wED/tY8rrdrv+5eKIVCmsaxVi4LtLU0wrDkYEEFCG6udLtg/9cR4hoJmo026CjHLayu7C
	LNDRxZd+iw5AUOKav5aoyDDlpzf/Mhuc1xP/yO2gzy72iw9qv8ioNkIbEXlZ2EAznd8XTnZ8tZy
	LLw69f4b94pyPJmfMzrB2MGzzNtr4ly0nMVxNkb6kx+J92YNIVNK+UnRVOdditxpuHWeiAFCrus
	3edFmIiMknnUN5fe42wXQzw==
X-Received: by 2002:a05:622a:609:b0:517:6162:daf5 with SMTP id d75a77b69052e-5306468ebaemr205196281cf.3.1788867905034;
        Tue, 08 Sep 2026 04:45:05 -0700 (PDT)
X-Received: by 2002:a05:622a:609:b0:517:6162:daf5 with SMTP id d75a77b69052e-5306468ebaemr205195761cf.3.1788867904645;
        Tue, 08 Sep 2026 04:45:04 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a7e68c3b2esm5717235a12.11.2026.09.08.04.45.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Sep 2026 04:45:03 -0700 (PDT)
Message-ID: <1f881a4e-3536-482c-8fa3-4e141f633a8c@oss.qualcomm.com>
Date: Tue, 8 Sep 2026 13:45:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: keep the GPU timestamp monotonic across
 power collapse
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260828-b4-adreno-timestamp-v1-1-273525da144c@oss.qualcomm.com>
 <80eb9f51-9cff-4c07-822a-759360617cbf@oss.qualcomm.com>
 <le7zslxe27qauz7duczbxl4rrd3kbekg5cwxzg5tmsy77r2t2z@7gdoif3yfkgg>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <le7zslxe27qauz7duczbxl4rrd3kbekg5cwxzg5tmsy77r2t2z@7gdoif3yfkgg>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=J7GaKgnS c=1 sm=1 tr=0 ts=6a9ff542 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=yFWfLQOVxOdxj_LqjH4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 1UgOcJd4xfY0vnl4V2HNqIAJgPQPWCQb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfXzyYJhN+eV8vR
 Uu8xh5I01IScTpaE04Nsx16cgegZbz2ZngxoiHVbTVcOQ3uJqe01soxPfN+pB+hpF2ezkDM8XTa
 MJPM3xdTTifbBa7ifWCU/xh5VnX+uxI7OphtScIpXpMXEEtKuR6fyb8b/aTPj0OUzsObX1s6SJQ
 BisN6MpoI/liYHVyE0uHyO4RFv/Zdx0u4AX6t0+Enw9cSkr2kkbTy3J5n/qEDLz9K5qT/pAs9fv
 cYiaKiwbKRTbxBvZMHS9TSR4QyCHr8ZUkQrq0C5Fb6bZubTFFvkgQwFDXy/SuB21wuY5V5W8fZi
 bfIVcLWMw0anK+LkoDvd6LJEVYnEqdeQP8KEsxWMiehXCZVIHJ4D33fUNAnf3ePBPfdIYJsGnmU
 H89NGLAvkVRWlcPjKbHhV/aK3WaMSzIlVdSlaRqoTIToZ51D6Ua3Mvb0Aa1eKVQcETsdxl5ezLF
 BY3VVvn38gRZq2x8jCw==
X-Proofpoint-GUID: 1UgOcJd4xfY0vnl4V2HNqIAJgPQPWCQb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDEyNSBTYWx0ZWRfX5ndog5+R8YEl
 REO0/Eha4G+Te9K7agen/eIUon0F/jvq8L6HAcaeAZGfnfPrRSCzuJoZQrafkuH/wz+bCjlkoks
 MZwAsngH5WWt74jnflnxOntGYONg8Mc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609080125

On 9/8/26 1:43 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 08, 2026 at 09:03:55AM +0200, Konrad Dybcio wrote:
>> On 8/28/26 1:13 AM, Dmitry Baryshkov wrote:
>>> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
>>> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from
>>> zero whenever the GPU is powered up again and the timestamp reported to
>>> userspace jumps backwards. On an a702 six reads three seconds apart all
>>> land in the 500..1200 tick range, stepping backwards twice, and on an
>>> a530 the OpenCL device timer conformance test fails because
>>> clGetDeviceAndHostTimer() returns an end time below the start time.
>>>
>>> Save the counter in the suspend path of the affected generations, while
>>> the GPU is still powered, and add the accumulated ticks to the value
>>> reported to userspace.
>>>
>>> Assisted-by: LLM
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> The always-on counter behind MSM_PARAM_TIMESTAMP sits in the GPU power
>>> domain on a4xx, a5xx and the GMU-less a6xx parts, so it restarts from zero
>>> whenever the GPU is powered up again and the timestamp userspace reads
>>> jumps backwards.  Accumulate what the counter reached before each suspend
>>> and add it to what is reported afterwards.
>>
>> Could (some) a5xx parts use A5XX_GPMU_ALWAYS_ON_COUNTER/0xa879?
>> msm-3.x defines it as KGSL_PERFCOUNTER_NOT_USED fwiw..
> 
> It seems it also restarts on power collapse (so always on is not
> actually always). Also if it worked, it would have helped only a530 and
> a540 (MSM8996 and MSM8998), leaving SDM630/660 and all MSM8956/76/53/37
> without the fix.

Yeah, that's why I said "some". Is there a chance that's because we
mistreat the cx/gx split on a5xx?

Konrad
