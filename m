Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792602144;
	b=uTKGjbSsn81aO8Syn4fNnNJBldhbu+gozwUmB7VChe4oDnikPoUQbdM+ZsIeUNDtgKfB
	 +Q0uLGiBeoT90OBtsBI4+qSgE1y79G1VNKxaaO/HI6wogVmfrH2JeELMWdO+WgU4FTZi6
	 Z4i2oI5/zNWmmt+C3hrQaJC1hN6CvQhmlITP5Zs8AHUFLmFm/HiWK7gkLcVxKDNKotHfP
	 5w3cSptVftca+Qmpjyl2q//DjqIB3k2GA0hS3NAwWXTEvWEQ6d75zixuV7xmbj+n4n3MY
	 X8x5TvOsxY/5ezWWPR8AjAC+lgu354biK/B8mweD7tKrvwlas5HgXSLXRfD4d01UjjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792602144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=JO67+OIcXeQPf/uwJoTBgKLwE1a0IHP5ujFdDtZzXDw=;
	b=M3NhRizOXcS22LBOl/FKPVKu2VF3B/OCYmygio4pV2vh0Tty9W9/pwGw7kfTpDP0Wc+V
	 bILOfj6IDeWmwUJ1Cnj4sp2VDT+bZHfkX574yEL++wwBPsS8YpVqu6aaXInGFgK63O4C8
	 k/nsabLmnhYIViWhg/ILjJ0uOj6XizXrcjoCr6g4VNgF0iIW9ymAc2ZL49z5XuFO056/p
	 QyuWLFw5j18dSRjHsW2xLDiJ+h9Eog/HqkI4YrOASph1r1HRA9nmZmdgPZArgDQJKk571
	 a5JuKqIgZdCG0JHfGj/CQ1/Ucc/fwK3i+U4E0o6nEZReKIrrTLMJ7TVUVQioByKiCkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+I843v4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WM5Qvf2P;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F026E606A31D
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:02:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F026E606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=G+I843v4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WM5Qvf2P
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LFU8Jv2102438
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=JO67+OIcXeQPf/uwJoTBgKLw
	E1a0IHP5ujFdDtZzXDw=; b=G+I843v43+HBH4lmw/pome1OWWsLsu7SuBeUV0K7
	bE49B0CfEACYI0pGiwkDiOWIWiDss/UrloBVPIF+lhBI4IRM6wQ9senMfVLkdFeY
	8l2aYNLzJy0uC4ScWL7UX5j92QbL5cMVXrsrR/xcN/akyrvP4nRbPIaYdbvODqtY
	8TQgDnMreOPJGzC2lgKh6CTwrg7ePWrFyQloBLNcPe9nKgb6kVU9VxHzMCmqCYuW
	12EjWCprv9qTU2vDwcBCKvqNjIsQytC6ExckhyxBskv3zmCKqq6OuNb0n2AdgS2V
	tibC+v5z8Ar6OCgq3vVvdJbpE9N+j9KkbT95DlnXhmacaA==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heuhuhnp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 17:02:22 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-9907de400a6so202983241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Oct 2026 10:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792602141; x=1793206941; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JO67+OIcXeQPf/uwJoTBgKLwE1a0IHP5ujFdDtZzXDw=;
        b=WM5Qvf2PyXMvuRbB+7EukTsIgTZQnTK/59zSEaJdMSw9AZdvpsNmfuZnnAnHyYxQeg
         qGLNZ1OnsVW6rdzt3CwznvpjGYBua/5+My7qpXvECqKpHR6Hkl7Bmv9khjTKT5bzgetF
         Ew6mGjcVWDK3FHgyi5CPbRFQ2Wx5zbixxyOD3qvPaKCGUDACzDf0eKuHuvOTyO/dmXDl
         Gs34p+1qzmMQq+My9h76Ni4q3XVfAqwpw9k4/D9787LOQbrFaWTjBNg/rK9jz3kAosUh
         EsMzOEsPulnDqBcW/vTocBUSQls9soNDWB+ra9jgHzITCpWlMdk8T4TSvc3/aX3bS2nc
         rpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792602141; x=1793206941;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JO67+OIcXeQPf/uwJoTBgKLwE1a0IHP5ujFdDtZzXDw=;
        b=sohkHJ/5hdYBcmI2njGPmpKKnCBljvKpFyIQOOt3X9Fvs/yxko+GJ/GVUXoNp1o3v6
         svOofzUtYbY8t4ZWnpajQdrDBe6d+bRRpf4VBAN7vpKoiHOnyN2VdhaQQmFGXZ7UwZnS
         TgUy+HWZ0POtryIbD5yScLR+KTilI/uqD3L4vSuj4hwU0g947Yb1bAyT9KctYpcnvEHh
         UlnGci2gOV9Au5XbiBYFDRkh+pI0n45QlktHK3c/ZSDkfTnxvhBbxNzb+GfGVm9PXRlT
         eSV8MQTDLX6LZDxhqVLZQAi6OZwRVzpUOTwsKrpUObXl4uH1A6ARcOmfrgfyQyG5FR+v
         4x9A==
X-Forwarded-Encrypted: i=1; AKwUvByaeEw0viwlkOj8F11Paz+3U5RedIfiJf5zkxexvlOg4vUST+HZg1BkloUcE/U9LrhtuRyyhD+3uoUvwvcE@vger.kernel.org
X-Gm-Message-State: AFq9FYIKd6ecvqsD3qaV7SJhtiYIUYtlCOfKTRexJIFc+r+8XcDS7Y6R
	TlvmydppoBqLXEvi7FHptNEGnYVoQfGl9IioZZAZjaSaDDnSGCRbyczP9b+K+nzcXPItwZUqw6Q
	tmvOykImrcpyECMoqHMWopd2lvhz3UlZC/hZvEksrm1WZi9NWgEICeqG/TaY00VocPyGi
X-Gm-Gg: AYBFou0PtzF7hXqY8Ab93Kd1s99PLfQM8wqfcGqyr9s239sWowX3RQld08FzGvIzLHo
	iS3oyApMrNw1vRPdF/DltYYrN3MsZhYC9hZot5BHekB43tb6Uz3DJa0gOBuTAOM1ndPFC8ZVENr
	kfccBKmYWmKyHm3D/oOhL3Sgc9tR2tR+HUNFovTRjXxNvSynpjjNNj3PGf5kLaNw42lidzxsw95
	DK6muzhN5pHI5BacFNPPw1x/tXfaFo0PhVmBjBntuCePjfRymLEqvUkXlj4Ouv21KZy2z44o1fz
	jVisHJ4zCS9PFccqAQkFtNF1narzdepHcAnWjn3VwpkdIM71Zuj/kmwafYhrAkQfngzkwPRyYNg
	FzOuI63uN+7Q5R8V8WZBtqpRm1jjnfAcfvlEYEckwVldaudJrp3pUKsjYkFCRQ13HKUffcmue6X
	jol3y05uVzX7KN
X-Received: by 2002:a05:6102:3fa2:b0:7cc:56a:58e0 with SMTP id ada2fe7eead31-7cc926b3be7mr876284137.21.1792602141404;
        Wed, 21 Oct 2026 10:02:21 -0700 (PDT)
X-Received: by 2002:a05:6102:3fa2:b0:7cc:56a:58e0 with SMTP id ada2fe7eead31-7cc926b3be7mr876172137.21.1792602140671;
        Wed, 21 Oct 2026 10:02:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfa28347b8sm471519e87.9.2026.10.21.10.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 10:02:17 -0700 (PDT)
Date: Wed, 21 Oct 2026 20:02:15 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fabricio Akio <fabricioakio@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>
Subject: Re: [PATCH v2 1/3] drm/msm/a5xx: Reset the GPU when resuming it
Message-ID: <qasf66vyv2t56x3o7bipzdvgrlglartfxqxm5ezstnwmlczfur@yi7cdxxqvwut>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
X-Authority-Analysis: v=2.4 cv=d4JgWhjE c=1 sm=1 tr=0 ts=6ad8f01e cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=Gbw9aFdXAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0XkAg80coZZ_RUxBgWAA:9
 a=CjuIK1q_8ugA:10 a=o1xkdb1NAhiiM49bd1HK:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfX5R5nhRZhVLTB
 5RH98fFChKz3RDHRneG1cALLgSNwUoOl8l0MrjFIAd8z7GdivWVnqQmjxIAITpk8BMs+Sm2e1n0
 a6h3/8iAAACtU+dr1Y08RCXwYSKQOSM=
X-Proofpoint-GUID: O5kkfAeLPN7-_Q9c_Iqf7FUVgWiiTJVc
X-Proofpoint-ORIG-GUID: O5kkfAeLPN7-_Q9c_Iqf7FUVgWiiTJVc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA2NyBTYWx0ZWRfXzCsE8dqGJAKK
 eVNQU1DJQMV4dpYFqx2CHlku7k/K9JCVydVc/FIkXwWrLRyTo/s+uuF39fv3aeTvN5R9V5U+C6h
 5K31MOIoecJKvi4pox9PHX/4d7eUhyNsaG1SyuyLmltMz+mOnXcdVKMisVbGoVIi36rAHNRwwLM
 oKEZnJUrCckmxYiz81wZ/wqbEpVC/hibSCy/YeF3B9M7RKyOXpwq9VRjvTFx7CbQx/oBqr6Gyb2
 sQ3D/F9wIWcnawfN9ATJkZlqHb75QUs7jKxavj4X31Ati1mc4ilNWll+GGWmQVv01qrMuJpxRXs
 3KFFFjIFToNRFGYxTZwsIpejcKqWKH+N5BOgCl3rQIOCaRgpNcfSuFsCa4/N2Zq9jpZN2mHW8h7
 d/ZQNUfzayAWAwxpqs6c+Z/Cg0mfGr9W+bpNEV996JmW5nMmelYGnrbheMSl1qyPVlTpRkpT5nz
 xUT7A+sQ1n0+O4prlqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210067

On Mon, Oct 19, 2026 at 11:05:08PM -0300, Fabricio Akio wrote:
> On SDM630, SDM660 and MSM8998 the GPU's GX power domain belongs to its
> SMMU, not to the GPU, so GX switches off only once the SMMU suspends as
> well. A GPU resumed with GX still on keeps its state, and the CP keeps
> its ringbuffer read pointer. a5xx_hw_init() then rewinds the ringbuffer
> and writes CP_ME_INIT at its start, while the CP goes on from its old
> position, executes stale ringbuffer contents and hangs:
> 
>   timeout waiting to drain ringbuffer 0 rptr/wptr = 23/C
> 
> Soft reset the GPU in a5xx_pm_resume() once it is powered, so that
> every resume starts from the reset state. The downstream driver resets
> only when it finds the GPU's power left on; resetting a GPU that was
> powered off changes nothing, and on A508 the reset takes about 2 us of
> a resume of about 1.5 ms, so do it every time.
> 
> The reset also clears the busy counter, which msm_gpu_pm_resume() has
> just sampled as devfreq's baseline. Take the baseline again after the
> reset, or the next devfreq poll subtracts the old count from the new
> one, wraps, and sets the GPU to its top frequency.
> 
> Signed-off-by: Fabricio Akio <fabricioakio@gmail.com>
> ---
> Changes in v2:
> - Take devfreq's busy-cycle baseline again after the reset, which
>   clears the busy counter (Sashiko)
> 
> Tested on A508 only; the reset runs on every A5xx.
> 
> A stall with the same signature, the CP's read pointer past the write
> pointer just after CP_ME_INIT, was reported on an A509:
> https://lore.kernel.org/linux-arm-msm/20260308-adreno-ringbuffer-drain-timeout-recovery-v1-1-985a33faf108@postmarketos.org/
> This may be the root cause of the A509 stall Paul Sajna reported there.
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/msm_gpu.h         |  1 +
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 17 +++++++++++++++++
>  3 files changed, 33 insertions(+)
> 

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
