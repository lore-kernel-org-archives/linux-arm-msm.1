Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808955;
	b=MS+HUsPf4KWpbbafQtA9Cm1tzWijvkYEWIVYHXXP12Ng2FY3lye4LleDvEGfCuHh6uKl
	 PBI7FVCjRrt5Vd5tcF8D3gqHE/U2pVR+ET1Qc8wrG4nQ6g/ezJ/+6P9QYMd52YPwJ4Utj
	 acLwWe5ul7RSC/lP7QbUYowNJY2XtrFTdKjw9bTkKJ+0C94YR5Ugk+u8zIkJXBJCKXkCL
	 nTnzUjzXWe8tO//SPtcwIYsyL0Xe7WWF/WRglFvWGE0cx1EGITBo4fKTiWWQWjti7RSaC
	 8YhXCaEFHBX9f8e5szPMP/lry4VgyY5uzAKQrZ4sBE15bL92oRZDGTrMuKF34KUSUsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808955;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=g2dcKjVxVXVvc7zH7i/+/9NYX/sWj0TUS/ckSZHauwE=;
	b=3bsL7k9eZV/0ZGZEpu5ywDAMqE04jGlVNNKSrYp2xOdkbZ293VDhLrAYa6XnL2bW2aDI
	 zL7lpXV3XRk2rkU0Cx3aCRpkOo5xFv1XF3z3x+HK6xLYtHO8wi3KAwItTCFEIgpI0E2xL
	 uC25aCTKKDuq0trtBveg27f1O7TMdWtpX4qhQkW/asES67qZU58pBRsvaA65ClGX0GmzR
	 aIeSVELj+5rkVXXReaDaoY3aFzfdPNonxVeMqF5W5M+ZqFhAstCJcRXVRSPbCxnE/wl0a
	 YJw0f65mDR/gsonPtLVrbIU6wzYOmYvSWEOkspJlLbbDBhXdQhTvd0ETXo57M8pV60w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MAWyzwCU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAQgHN4J;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC39C606A31E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC39C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MAWyzwCU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BAQgHN4J
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARJRro71381861
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:49:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g2dcKjVxVXVvc7zH7i/+/9NY
	X/sWj0TUS/ckSZHauwE=; b=MAWyzwCUrewdsxoJ8TW0zpWcLY4BGYn1dTb+283W
	SqCnSGYntirSpA/70oUIrY+JM+1WM43ZNXDi1JHKL6sZ/I62nciP1RxlYBMByEIh
	KZnoo76VP85xtAINSTc+1p5uuUWgsKudn0+5yiie1TUPlFir6G8fpAI+Sd8sF6tt
	ixaEPrT6/F1/WRtppeEV5hz6b/6Zyjqg6S9+FBLzfpSxW8nSyVwbca0r+AMccp6e
	0Mgn82x9Axq3g4Rk4hVo8hVQ6n85lqOjwEfm/7Q0lJlyGYbv4Fs7XMNHlABOvEEc
	nVZU0ROYWO9yXfY9AJhGlUteuenORnPIPZhDkx6vT45AhQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7g1s81b4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 19:49:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so1796683385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 11:49:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795808952; x=1796413752; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=g2dcKjVxVXVvc7zH7i/+/9NYX/sWj0TUS/ckSZHauwE=;
        b=BAQgHN4JuDovfM23nPb1jI/XwtqPzUm9RqO6XCsGHhzqu1ZWeaPMNMI+U06qUUgzAO
         7T2fnmvqcOe1hcdoHBtVnoICjPYHi/kdNGEQ1zY8menHye4++Zmdvh+l5Im8M5n+/3YQ
         C0Dn58b0J6iOJe8nL13Nrs4zo9Uly5EqnZtIel7HYXeskKstriduA8HUwQUFLMUPAY0C
         KRWipdDzm5hj/+UFLYqe6iJJDUFPVSBBxIxJr8l/kLiOXQU4VlfHFV26sfY0/BjWcKas
         SJegrq0bvKvXFvf1IWeaTXwf59AO9cApN3JylY+BMHDXqAjbUeWJdadGioz3m6StzECQ
         qolg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808952; x=1796413752;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g2dcKjVxVXVvc7zH7i/+/9NYX/sWj0TUS/ckSZHauwE=;
        b=P/v5mqAa5xUg9DIr7qmxXddQCZ7hKTqG8zv0Ughy05MtQs+uEQr6vMj+v1ibQ1Mm3c
         MkHoHGmIGQ6bFNXuIdx92BRfBVnMX2SDGKFvl+nuGO1whI0Rec2buLbX2cnubBhMUvbt
         JfFXb8ULp2Kf5hEdUKgR2uHePpfoRu5DVzPqQAA+kTc4b60AumA2Ta/3fiFzbUrpAJf2
         PQ4xfvDhiEV0om9hbMqYut7XtqFx7KAhnaHI+BnjnRQJ3MdyzNIEc/4MFEc2Y+P+Wtkw
         v+eYZxdH5hOJzp4t6w37Xo9V1pba40K6fSDN3rApxO/EcWOyaiD8kyHi5TWK6SZ+O8Qq
         Kj1g==
X-Forwarded-Encrypted: i=1; AL+hErEXq1Q6k6gTIYWAZvf6sdEEIigmRgIp9snEHtc/KF99nMOhMfU23KqTHM0cYAPcRPcxKxP3F+h56OcfOkhe@vger.kernel.org
X-Gm-Message-State: APuU4Z8wnUMEtCX9orRJlmHST7X5dcOZ+6RGsOKHvHmZHvK6Unt5MtGV
	xasbgPT9lEO3gQITSXBuJu43VF9fCe4cfudYZYh2XkEKcPJcGututzBsu4q0RxG3AGpKmPlEvHb
	4FIznjdQhN832o1fo2C/QRl8qu2msFQcGE+x0zAIQ7L3naKvM4OpFIFJB/ABH0+/kU7SC
X-Gm-Gg: AZFdTZcqygKC4sPynDVWJiYgewD07aVxXvwqmM4KdCXJsn08JdXtdGyuTVhixkeXopG
	KIekcJQ8bhLgTyJZKh3ch8PCCw4XC5RfpRtFU8OyRChkItZoaKjYdlA5NvVEv71zYj0fDOsmiiE
	7qm8I/8ZniRrzvEHTB1bkNLiu66iqHc5nflEGrO6QCv3P+4CshVEgKNtr/fR+ScSiq2o9aJtH8h
	zIGPTWq7KS9xqUs5pHzLG59dxtUVt21cKvVroVux+s7fCA1kz0qw8URZt0F1SHJn2XY/cW70TUE
	3FzJodk5DNlJmmSosy+D11C5ziJwRGO0O81NSlb4xKHIsJGsZS2H9HYrdOr9oafqhZsm+2Fg76t
	qfSkSG+E6coTCD1OIKPqI1fb/Xdes16s2owpistiD40W5sXRnP0uexXla3c6QOL6E6xsFEWXg7b
	FlUDbYSKacu9Um1RHJLRRE8Q6aTGA9yW3NslNie31H6QBNNehkY95xO53ls0GjFA==
X-Received: by 2002:a05:620a:6293:b0:937:6c0a:9b65 with SMTP id af79cd13be357-949ba848403mr4309581485a.7.1795808951687;
        Fri, 27 Nov 2026 11:49:11 -0800 (PST)
X-Received: by 2002:a05:620a:6293:b0:937:6c0a:9b65 with SMTP id af79cd13be357-949ba848403mr4309577185a.7.1795808951105;
        Fri, 27 Nov 2026 11:49:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c33ed140c5sm391396e87.81.2026.11.27.11.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:49:10 -0800 (PST)
Date: Fri, 27 Nov 2026 21:49:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anna Maniscalco <anna.maniscalco2000@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: Re: [PATCH v3] drm/msm: preemption aware hangcheck
Message-ID: <3f54aqzk64kpekzthwt7bkhrxyv4zczdtnbtix347bppse6got@vubfdnmms7in>
References: <20261106-preemption_aware_hangcheck-v3-1-852acf72102c@gmail.com>
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
In-Reply-To: <20261106-preemption_aware_hangcheck-v3-1-852acf72102c@gmail.com>
X-Authority-Analysis: v=2.4 cv=FYOiV5+6 c=1 sm=1 tr=0 ts=6b09deb8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=tVI0ZWmoAAAA:8
 a=e5mUnYsNAAAA:8 a=te0fHMlqqURSnBpgbLIA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=FO4_E8m0qiDe52t0p3_H:22 a=-BPWgnxRz2uhmvdm1NTO:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: cCGUU7HXSj3PVdTNacTn2jMbuB82mXv_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX/J6kVn6ctrBA
 tSwPo1ucgUWxWrHJIMQEp86jd43kBnjtUybHzgKBPFZcPs+S9S1FkWLGv31ToGY0OR34rsVeEMy
 GLmIp90Pumw0IrlArEb55Tlfjad3kf6csC0XRyoGGhk5pMBvb52yaSjKsTvKkiw4ngjQoJQ3il3
 kgpl7QOlWSSb1U6Def8ISacCAoutm/UDs1/NPQdiDmEau4pideGnJJ1zYgHHHqdVgARUEB9q9Xh
 /c4Z0hUNKSbUTqVSEMp+DiBETSB8yAFGv6usksySP0URQvHYyC2hro1+cUxn9HEh/1l3xFw/2tt
 5D0WD5ZEi6ALgrAZ2Jd7eXEbVqFl9e+f24DmtdbH9UVHGwPl+9KVJ8q68iBGo8aVVFNkBjnJtmU
 naB4EbAs2AmE+eVGQrOGvW5Wva6P6dEEtWbf+RNeZTVGuED+tZq9MDf42htVYcllAO/28abRKA/
 r5cBUdbUk40IJx1R5tA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA3OCBTYWx0ZWRfX3sV+qxbNkR0z
 XWUdoSRIHdyGyIvgQdlQvosGWlAAdNlppSqYWjPsO3o7vnnLBIRxw+nnl6CC8jJbiUckRK8mEfF
 h9BBQAksmNC11Fjd/bKAMHd/tgjPNn8=
X-Proofpoint-ORIG-GUID: cCGUU7HXSj3PVdTNacTn2jMbuB82mXv_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_04,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 adultscore=0 impostorscore=0
 suspectscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270078

On Fri, Nov 06, 2026 at 05:46:28PM +0100, Anna Maniscalco wrote:
> Rework hangcheck code to work well toghether with preemption.
> 
> Track the time a job has spent in a ring by storing timestamps of the
> `CP_ALWAYS_ON_CONTEXT` register at the beginning of a job and when
> switching rings as well as reading it back if the ring is currently
> active.
> 
> Signed-off-by: Anna Maniscalco <anna.maniscalco2000@gmail.com>
> ---
> Ever since we added support for preemption hangcheck has been somewhat
> broken as it is not aware of multiple rings.
> 
> In some cases it might not recognize that one ring is stuck if the gpu
> switches in and out of it.

This text should start the commit message, it's a description of the
problem. The text under three dashes will not land in the kernel and so
nobody would know why you were doing these changes.

> 
> depends on https://lore.kernel.org/linux-arm-msm/20261102190010.720443-1-robin.clark@oss.qualcomm.com
> ---
> Changes in v3:
> - Addressed sashiko's feedback
> - Rebased on reworked IFPC disable series
> - Link to v2: https://patch.msgid.link/20261029-preemption_aware_hangcheck-v2-1-be0056e1f02d@gmail.com
> 
> Changes in v2:
> - Various fixes
> - Fix interaction with IFPC by using OOB vote
> - Link to v1: https://lore.kernel.org/r/20250911-preemption_aware_hangcheck-v1-0-974819876819@gmail.com
> 
> To: Rob Clark <robin.clark@oss.qualcomm.com>
> To: Sean Paul <sean@poorly.run>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> To: Dmitry Baryshkov <lumag@kernel.org>
> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> To: Jessica Zhang <jesszhan0024@gmail.com>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  5 +--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  6 +---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 54 +++++++++++++++++++++++------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_preempt.c | 32 +++++++++++++-----
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c     | 12 ++-----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c   |  3 +-
>  drivers/gpu/drm/msm/msm_gpu.c             | 56 ++++++++++++++++++++++++-------
>  drivers/gpu/drm/msm/msm_gpu.h             | 11 ++++++
>  drivers/gpu/drm/msm/msm_ringbuffer.h      | 10 ++++++
>  10 files changed, 140 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 16c7335c4b1f..8800352455df 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1251,10 +1251,7 @@ static void a5xx_fault_detect_irq(struct msm_gpu *gpu)
>  		gpu_read64(gpu, REG_A5XX_CP_IB2_BASE),
>  		gpu_read(gpu, REG_A5XX_CP_IB2_BUFSZ));
>  
> -	/* Turn off the hangcheck timer to keep it from bothering us */
> -	timer_delete(&gpu->hangcheck_timer);
> -
> -	kthread_queue_work(gpu->worker, &gpu->recover_work);
> +	msm_trigger_recovery(gpu);
>  }
>  
>  #define RBBM_ERROR_MASK \
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index bba5468db42e..bcbe1b949217 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -28,11 +28,7 @@ static void a6xx_gmu_fault(struct a6xx_gmu *gmu)
>  	/* FIXME: add a banner here */
>  	gmu->hung = true;
>  
> -	/* Turn off the hangcheck timer while we are resetting */
> -	timer_delete(&gpu->hangcheck_timer);
> -
> -	/* Queue the GPU handler because we need to treat this as a recovery */
> -	kthread_queue_work(gpu->worker, &gpu->recover_work);
> +	msm_trigger_recovery(gpu);
>  }
>  
>  static irqreturn_t a6xx_gmu_irq(int irq, void *data)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 773c1727dd31..179e42119307 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -519,6 +519,9 @@ static void a7xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  	get_stats_counter(ring, rbbm_perfctr_cp0, rbmemptr_stats(ring, index, cpcycles_start));
>  	get_stats_counter(ring, cp_always_on_context, rbmemptr_stats(ring, index, alwayson_start));
>  
> +	get_stats_counter(ring, cp_always_on_context,
> +		rbmemptr(ring, last_job_start_ctx));
> +
>  	OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
>  	OUT_RING(ring, CP_SET_THREAD_BOTH);
>  
> @@ -1474,8 +1477,11 @@ static int hw_init(struct msm_gpu *gpu)
>  	/* Always come up on rb 0 */
>  	a6xx_gpu->cur_ring = gpu->rb[0];
>  
> -	for (i = 0; i < gpu->nr_rings; i++)
> +	for (i = 0; i < gpu->nr_rings; i++) {
>  		gpu->rb[i]->cur_ctx_seqno = 0;
> +		gpu->rb[i]->memptrs->last_job_start_ctx = 0;
> +		gpu->rb[i]->memptrs->last_active_ctxcycles = 0;
> +	}
>  
>  	/* Enable the SQE_to start the CP engine */
>  	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
> @@ -1838,13 +1844,10 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>  		gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
>  		gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE));
>  
> -	/* Turn off the hangcheck timer to keep it from bothering us */
> -	timer_delete(&gpu->hangcheck_timer);
> -
>  	/* Turn off interrupts to avoid triggering recovery again */
>  	gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, 0);
>  
> -	kthread_queue_work(gpu->worker, &gpu->recover_work);
> +	msm_trigger_recovery(gpu);
>  }
>  
>  static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> @@ -1861,11 +1864,8 @@ static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
>  	 * to legacy blending.
>  	 */
>  	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> -		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> -		timer_delete(&gpu->hangcheck_timer);
> -
> -		kthread_queue_work(gpu->worker, &gpu->recover_work);
> -	}
> +		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC))
> +		msm_trigger_recovery(gpu);
>  }
>  
>  static void a6xx_gpu_keepalive_vote(struct msm_gpu *gpu, bool on)
> @@ -2293,6 +2293,39 @@ static u64 a6xx_get_timestamp(struct msm_gpu *gpu)
>  	return gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_COUNTER);
>  }
>  
> +static int a6xx_get_ctx_timestamp(struct msm_ringbuffer *ring, uint64_t *value)
> +{
> +	struct msm_gpu *gpu = ring->gpu;
> +	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +	int ret = 0;
> +
> +	/* Inhibit IFPC while accessing registers: */
> +	guard(ifpc_disable)(gpu);
> +
> +	/*
> +	 * a6xx_gmu_set_oob cannot be called while holding a spinlock.
> +	 * Limit the scope.
> +	 */
> +	if (gpu->nr_rings == 1) {
> +		guard(spinlock_irqsave)(&a6xx_gpu->eval_lock);
> +
> +		/*
> +		 * Make sure the GMU keeps the GPU on while we read the register
> +		 *
> +		 * This should normally not be waking up the gpu since the
> +		 * hangcheck timer shouldn't fire when the gpu is idle.
> +		 */
> +		if (a6xx_in_preempt(a6xx_gpu) || ring != a6xx_gpu->cur_ring)
> +			return -EBUSY;
> +
> +		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_CONTEXT);
> +	} else
> +		*value = gpu_read64(gpu, REG_A6XX_CP_ALWAYS_ON_CONTEXT);

Isn't this inverted? With the single ring, there is no other ring and no
preemtpion.

> +
> +	return ret;
> +}
> +
>  static struct msm_ringbuffer *a6xx_active_ring(struct msm_gpu *gpu)
>  {
>  	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);

> @@ -43,6 +47,17 @@ static void preempt_prepare_postamble(struct a6xx_gpu *a6xx_gpu)
>  	postamble[count++] = CP_WAIT_REG_MEM_4_MASK(0x1);
>  	postamble[count++] = CP_WAIT_REG_MEM_5_DELAY_LOOP_CYCLES(0);
>  
> +	a6xx_gpu->preempt_postamble_cntreset_end = count;
> +
> +	if (last_active_ctxcycles) {
> +		postamble[count++] = PKT7(ring ? CP_REG_TO_MEM : CP_NOP, 3);

ring is always non-NULL here

> +		postamble[count++] = CP_REG_TO_MEM_0_REG(REG_A6XX_CP_ALWAYS_ON_CONTEXT) |
> +			CP_REG_TO_MEM_0_CNT(2) |
> +			CP_REG_TO_MEM_0_IS_64B;
> +		postamble[count++] = lower_32_bits(last_active_ctxcycles);
> +		postamble[count++] = upper_32_bits(last_active_ctxcycles);
> +	}
> +
>  	a6xx_gpu->preempt_postamble_len = count;
>  
>  	a6xx_gpu->postamble_enabled = true;

-- 
With best wishes
Dmitry
