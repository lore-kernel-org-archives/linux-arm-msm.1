Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795704475;
	b=aohrEtz0b4EHOjkm8QV16SfZMS3ITG4WrlwGVN6cJaMbfI2AD5zQ7e2uE/8Ax+I/bey5
	 ctkiDIkMzB9QndHzow+tTTwB+BD6ISUr9FjCqSNiub2m9grbWE0AEHJH38plopmnPsvqa
	 wdRNgyaUTnScPRRzyuTkRh9HekkpbG+3u6sw2dzSxbR3jOG3cwMUKdBcMvBLtO8HVMVmn
	 rSNBvROF7zFvqDdn3aTH/iDHDCCAfpLsfLiRw6tzoa2edNPpWGec6jmY7BwvWdURtoejS
	 yJJAQ0UiAKy0DAl6vpgchhun1sZmuTcmOMQYVwlr6NtEGkKYUCy3MRuYGLUlPM+eNww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795704475;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=;
	b=MN32pguKRK9QrsDkcsP8wV6r/e9cnlmaphuCD2ugLlumVZYnF/PWNfJ5X+TabufqGGkU
	 FNjWcenVk9uRg/z04SjGCKjwr128fVP1FHBU+w61OeazZH1hL82XWEFq9iT68DmstDK+v
	 JQtWk5jwvPsSny5h0v47W6JNx1Ge5+rhDGxGT+Ye4jl4yWDoOkmVgW8/Tv5RIUHQkSyXZ
	 OzWq1lGm8dvh9B/x6XigQJcWBilyxmB51tnuhLNmnMYqLOEO25fzddv91E6Fvc7isMcFr
	 L/KdR9S5mHpMpvDw0zVgDCYlmKH3Lol5JhawLONK0F62kJg3Pyup2qIteUE2kt7guUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fel4mEEB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+tGsvsU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950F6606A32A
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:47:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 950F6606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fel4mEEB;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f+tGsvsU
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQEVG2p320406
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:47:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=; b=fel4mEEBzuPxWI/Q
	FGaSuwN1amKxr7mb6Uqomci/2589jz2JZTO9djkwS0SgTG0ZifkeXngRrAEPBRP5
	g7V1MDzMFfBsa9rNfDx/RS+VEZoTNhEpO16hkCqRcFVLXQ7m7Jy3YwT9HPRqWjZu
	7rNrKoGnG62YilLD5dsv04FxAUlDjlgbBQvGhJbTx8ReqIxHqf18GLTkCv2wuk52
	TEkrwaOAMEnwBv39Jn759OLHCpqTmDeaN+gIRYxcZXucprGeiQE4sEPleTFJzkx3
	MVn3DsuZfD+A+90gmjYtNf+oaHrXON6vrcr6Wy8SjuifYsDbBRtH5FqcFTmegNhT
	tUTQOA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j62vavc36-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 14:47:53 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5edfa7703ffso320436e0c.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Nov 2026 06:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795704472; x=1796309272; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=;
        b=f+tGsvsUrrrqGMJf6NdrLJjK6GvQNnh2hUoi/AIzlpk1JkMJvOYPvRaq5wCcjQp5nq
         eq5JEhzrb/OHqzHcBHuOZn3QHWdmS/4+P3YSltL9AxiuTMMvVAse5avVLkWcRwpo8FcL
         ikr2CeKmsqJdxlHTyr9thpHCPrUimxSFCOmHkdxvNGD4acfaqrdrEZKEQlEr3U2kaNjt
         BJm0fPXHR4UYi0OiRDcNmAl1OPxHNP+llnka8IiFd1ieCsSTKAtzYc2SDMlVT99lE/XI
         AWv/+/pn0rFWhP3UaXTqYcrscXjxcwfR4wSX5JlOjs1nZ6e/qP+e8+O/WBeA5yY7EaH6
         rNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795704472; x=1796309272;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8+yhG4UOZ9G9+Wb+KCpqRp/WNdBbXiIFvkS5c66yNN4=;
        b=AVYwbf/nvi01moRwbgFAS/8lNbOp3yJe1J/gry0YMUmmmMTK/y6NaWRsO8IOO4Z+Rz
         8uKB/w66M02VRgwpbdXSKseeP1DSWnRxkBwSH1CcxTvB2Zva/s/xu8f+WBP49fKLUCWd
         jnwvBnvLPezbvAL7MhI+XBxYpcpNiN0TxzY7y8MIlSZjZcaLWtCT4wzzU+7gFyI1ugMq
         vvvHFH5/D1bPP+zbU0WS1KbFwPFtQlqIWSWEMvixE1tib2N4p3t2d6vJphrl72QoZGha
         CWfsYgpapVs9U1fwYfzjdk2EpX9jSuL5Wd8v5BSWg8chVIIWSv3sPqna4gPLxrkOM3hf
         TGMQ==
X-Gm-Message-State: APuU4Z8iINdosHGNyqy1IkcWTfDx/3bvEDxse6m4HML9s0yeZ3uycru1
	b6O96yzjzK0y8p/F+vgKqcRYvD05Sy0fQmJpjPJRy9bME8lq6ATQbn4LJ8c5KrYq43EIHl13VkW
	2nx0ZNcmLBRDTtop4htiqEYD4Sm6ISM6TLqGoZ1SSkQCw+C27sjusdRTQJlZUhq/JgzBV
X-Gm-Gg: AZFdTZfVm9a39LGz5mer6roBRMJVZDsQu69imqsXmu1gOPsmkNr1ai3FQABFsIaGjFt
	ScPR87IxrO4hJ8PgW0G/13Z06oij9O5AbBx/bdm4eS5Cm3ymXRqpJj5tg6ndFhupUtyyHmxvKXv
	7zkNg3sKJ/qTxEx9MQqgvZKm4Zo+PP2DZioSFLraYpEDBVu+n+vo9iWR6V0kHnouT5WWiboqz8I
	MxL7fKTL6kbX61By4wk3eni3MZGts0cF7G7D/O2E5rr1nqhhz/RbL5V0FW+T3SzLjEjurnMefyk
	yOoEyOAN1b7OKfT8zsWiYvPwFFmIw4Vg3peK4vhMnnLNU/uQbbL7k8e2opGo+QdbgsJdJJ6e72V
	HN05cs5ZdejdWKCUAuR1s5IWxNytDywCZvMJHphGoaJBCqMbfDqA+pcAMYMjXpjSBWGJPbBo=
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13495184e0c.0.1795704471728;
        Thu, 26 Nov 2026 06:47:51 -0800 (PST)
X-Received: by 2002:a05:6122:2b1:b0:5d2:d60c:6c48 with SMTP id 71dfb90a1353d-5ee8ad0ec78mr13495130e0c.0.1795704471268;
        Thu, 26 Nov 2026 06:47:51 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba6f8fa5b9sm8301224a12.37.2026.11.26.06.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 06:47:50 -0800 (PST)
Message-ID: <a005f8a1-76a2-46ce-b328-2063bc307758@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 15:47:47 +0100
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
Subject: Re: [PATCH v2 1/5] drm/msm/a6xx: Add Adreno 753 support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Shivam Rawat <shivrawa@qti.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
References: <20261118-nord-gpu1-v2-0-8d6d9908b7c5@oss.qualcomm.com>
 <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261118-nord-gpu1-v2-1-8d6d9908b7c5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX2+ju+TExGAO7
 Duq2SfU2w+FdAJq2DUriWVg6Si5R88ScKAVulec6Q3c93bxG2qNkV5FiCrSnMuGQztTCu8Z4O0l
 oZoB1XDyO/bNT9urIyWZCrh+Gti4mLI=
X-Proofpoint-ORIG-GUID: BK-msYIxs6HilnNI5C8HfD-g8TYlOLC4
X-Proofpoint-GUID: BK-msYIxs6HilnNI5C8HfD-g8TYlOLC4
X-Authority-Analysis: v=2.4 cv=QZPzLcbv c=1 sm=1 tr=0 ts=6b084699 cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GS9hGxBgXBVpQNT4ZgUA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA1NyBTYWx0ZWRfX+AcgDxJZ8HVR
 xN1lF9ArNd6nCFR9fS4fEI9PoBUYparFVSU9McXmcY3op3fbWB3IvofY6/ADwXVyMUMmtfosEnG
 5Z3UrOkxAKqbc9n8qW4/OF6NqxpNeqscVBu6dgvL2tkUmQ/HioRBP/hwfxpeTdiR+Q0nSXhkgzu
 xmDjCCwlo5/DlnM2cX4yYboCEar/MI1v27Y/DQAFHgLGC0N8jq0KwZhtArtyWaJpwonMynWqefT
 tKZ3afEwet6M2XpkW923xU7tWMGNW9RZeZmPFB65tm0FNhaAWPQ5aB/LR33PJfeAJQQ4NxGnfWc
 QHCf4rKdcmLIMbk21RgdY2I8mDz6yBRw3HPnFDT6mNd1HaCKZbBR/IH9ZA8vSo8yezokv1a5VvZ
 bqEdSZjhAQif5+JH/y/EiT/8gLWHKdieShyGMemf4vYmLdiNQB1GRXnEr3eE8wOJQpZ4okbgYK3
 KtNkIo6dZRNfded5A6Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_03,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 malwarescore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260057

On 11/18/26 12:00 AM, Akhil P Oommen wrote:
> From: Shivam Rawat <shivrawa@qti.qualcomm.com>
> 
> Adreno 753 is the primary GPU in the Qualcomm Nord SoC and belongs to
> the A7xx Gen3 family. It is derived from A750 and shares the same
> IP-level configuration: protected registers, pwrup/IFPC register lists,
> GBIF CX registers, gmu_cgc_mode, 3MB GMEM, bus BCMs and preemption
> record size. The differences visible to the KMD are the chip id
> (0x43051701), the GMU chip id (0x70d0000) and the gen71300 SQE and GMU
> firmware.

[...]

> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -651,6 +651,9 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
>  	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
>  		return;
>  
> +	if (adreno_is_a753(adreno_gpu))
> +		state = false;

Is that intended?

Konrad
