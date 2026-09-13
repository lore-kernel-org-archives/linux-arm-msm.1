Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A6A35A3BF
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333614; cv=none; b=nkIZ2p+Ys/QZceLQFhxyQEhXrNKr9lOOO+ZzT7A+QGNjzXieiLLy6HnygRwuO8CkdiZh/JuYiISTVLqqP90R2n3rfYVHCqNtRJ4dmW2mYC4VEC+MAsKv4acISSY9kEgLXMN1gIIvh0134hzhbjJm8bhA/SQcdrI4Zgh7svcPwX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333614; c=relaxed/simple;
	bh=Rc3rXnon0EQSw8KwGfyrwFTj1nXUy4ld2WfIZRqodMM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLaCwV7iL6SwxS2AbAVXf8ZxXBmiRE6VO+Zntt74cN535d64mpb5oZF0DckntoaW1V4HV1g9nPweqGa3b1xkF2nYAINeehRsNDEwklwkFsfpakfOLEwz8TEAySfCQ101/u2mTIczAYvk+PSLzaE7jwl+tQWfDxi0Vy7vixI8uTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IUJA4TFa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VYMYlwGl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IUJA4TFa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VYMYlwGl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DJxYiw2848775
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:06:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CuOZZ+1bOWWW+56MFTScBnnN
	4DrpUl8zDP2tJWpYYOw=; b=IUJA4TFabIVCWVLJ1k/WNtI+t+aNF4Qx/N+NuPlV
	68/LKjTRHsxloRbPMOP9GROn1MsxIvCQ1y5nvma6lCKtf7fzdgWpv1Um4mzXF6Lp
	vDgBaJX6lMidWRDmOdD6xYM6Y1KG+tVTu6Vm6+PiG4nApUNcMMpJx0Qw3+/o7vE9
	AZf9HERE6fg7jIDNVYOS1KXlGSHugVq+a5dAI5+iEOj+fMrdiIomtb2LELvBXz9B
	r7UUwg90f2kNKp3gYNVEVDoGykOu6t/W414oHG13WMIlXeu9x+aPUdulM7Dz7GCo
	K9zOfaNb6rwR9aWEwP1uPuaPwvkFjyzg2IENHs/MkcctOg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9cc4bx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:06:51 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-78830f4bebaso512780137.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 14:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789333611; x=1789938411; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CuOZZ+1bOWWW+56MFTScBnnN4DrpUl8zDP2tJWpYYOw=;
        b=VYMYlwGlODQiHcVaOkR0bgVwtdbSc/YJFi263TF6WZH9HIwm0IMQD/5wPJdzEa6FlA
         6j06ssTMOSNiWphGb9enrecP9GHW7ONK/RnSRW1F/TbNcL0uW+94m9GZm134/Pvi+DTd
         Ztszv7Lzx//GKh+mjcqbR8hON+v6s14dFdSw81heEThdnTicia94Yia2YzGkC07p73dE
         grb6lgxr4Hslrg4M6Zgfbv61KAxhr8l+p9aPh9ikMt4iOisqXaTB8Dy+qYQGhC4TNiMj
         8zCbUCu+BbrrP5mhpnqTP5oDuiLX2CExchKxxzWPYc6GKvftAh0Hw3sfQLwy1QkEFn/k
         i5Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789333611; x=1789938411;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CuOZZ+1bOWWW+56MFTScBnnN4DrpUl8zDP2tJWpYYOw=;
        b=Ul76AqXZQ4rJZy77Ajj3EyM6fAD6hPUU+Z3WB6KbxcYtbqxJVh38RSaGiee1yN0G+C
         1u+VUQ0bFHQSERYIr9VMdGhtH/Om4GFWGdPS5rDgOmkiRG4Lnl24TGwm4mSN/wpKrIBy
         bcTvAvAXTmIhBN8lN/W5YT841+TVbGjnOnYOhQCAZ+r7od9liXXRnBmv85pZW5+rkts/
         nb3wevfqiitkFMz8emmCq4n1uV7p4aRaYbQ3laoZv4RA6q2e3crDERFzQjH/G61suj0N
         nfrw9tF05W9Ga0g1X+ATd0LUBhU7POOm1rmdyiT81PELb1Bw+z5GHgjl8mLYp8M1+js/
         Ph2g==
X-Forwarded-Encrypted: i=1; AKwUvBwsGLPj5/IAmQ8WZBHzOj9FfeELCFjSwJwstxDAKdeNxZb84mlZ4va9tMWYnZDZjvJlCZ3eBLOb426RMxf9@vger.kernel.org
X-Gm-Message-State: AFuF++nsD+vfN+mjXph3QVwl2A5xlhGNxDMgbcgxXH+m6deUZVgHJUeO
	XKvTfd7/p+BtVa8H9R4i67edJiBfD9npn6iimXsBQmMF/aaBLSY3XCaVldTndl+osiLHaHS7SxZ
	/dRLHQ8BleFUlrgq4TekOgQaYofeeaXww2DnhngDAcJ7usZ4JUhc43RLa5AGqTiT6iLh4
X-Gm-Gg: AYBFou2MGDYwZyKVfbw7LQEfbbYElvbopVwx/+tCODboWhPAQ3Aty1S4mRPBinSuoRz
	JuvPCin2y9Iyo8e663lg6nX3JpPXJt4FArvq1MBvXxStjWBCLvj8CKraAE3OvmhJjehIcw0F6kU
	B5beiECES+iuOBaADdrEpVWB/oRQShki66tXtVjy8nd7LyLTgkaYVwfShbyPXlQkhJDvYB//FwG
	Lb7WlOp76MiAFQQdX5NxqkY0i+Uv8ugHg5skaqYHE7pX6J8HRkkryzHY+e19FS4QFFtd8mnm0w0
	bBgD+BnHpMrtoaUdWKeJUngMImwA7T+8AkQ+GstEHozCIbignmL3Ph4tAJbUKB4rTqwkeKi8Krd
	RbbMu/IKGt1KDfepkvT1L7tPWK3fq7DYRHrULzZ9HM6JnwViqEMuWkQeQOQC462QrZE/1O7nsQC
	Nbybl8kynC+85C
X-Received: by 2002:a05:6102:8607:10b0:78f:5bab:4761 with SMTP id ada2fe7eead31-792a93b4e87mr2736745137.8.1789333610782;
        Sun, 13 Sep 2026 14:06:50 -0700 (PDT)
X-Received: by 2002:a05:6102:8607:10b0:78f:5bab:4761 with SMTP id ada2fe7eead31-792a93b4e87mr2736729137.8.1789333610333;
        Sun, 13 Sep 2026 14:06:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a045f6f3sm1914073e87.35.2026.09.13.14.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:06:49 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:06:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Subject: Re: [PATCH] drm/msm/adreno: fix autosuspend cleanup during teardown
Message-ID: <vwnlgp3ysnoimdxlx6gowktonakwpita2ted7tcdfd3a6vyjy2@p3slguu75r6d>
References: <20260808131624.2854412-1-lgs201920130244@gmail.com>
 <e5964398-cc23-440c-8c69-01353b5a5ecc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5964398-cc23-440c-8c69-01353b5a5ecc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=e+mT2qp/ c=1 sm=1 tr=0 ts=6aa7106b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=owhB9EOPmpqNCIfoPYQA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwMSBTYWx0ZWRfXy7m2AKtLUz+p
 6AlupG2brAOmbSZTPMCFGg7ZJvKvQo8U06q3WPPRAK/wDTV/mH1NRYi+wYdvPjdt/pSI0Y7OXfz
 kj/JI5PL+3gRXlATQ4wVCkHPs9wVodg=
X-Proofpoint-ORIG-GUID: v2omxfM3SEIjlblif1-JqO9FqwNQL_BQ
X-Proofpoint-GUID: v2omxfM3SEIjlblif1-JqO9FqwNQL_BQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwMSBTYWx0ZWRfX2an99IugZbJt
 nvH/gp+oIF38VY49CSA8iYjizTVL2cgsCm2xesOoYsccQHvMEWt3OC33G8CpVpZOcJbNQ+cygqJ
 wuittnDT3K+s4DYwTNLVMfJDN25yWOg2LoXE82BMnJ1txpJyVqK6aOZqDU06xlV7oa/9+2qHO33
 5MZhmrg84mQ+XLaN8Z5wPpQgWx66pI/T+S6gDecoInkZb83O92T9j9DPUNv/7XZcItkIzyxdShq
 uGDzb/v2mGS3ZV9zD4mXS5lRaP362ro/gLEa+bqAS3U45kDNdDHqRK03ccvdVjUshc1xXKTH2h3
 ZFp6IPkH2AmfZvEAsrtua5KXGxp9bUt9CSMw+D8JCEj7b4Ty+TFJQAFEZdNRnKPST3Nydxsg+U0
 55u9gufku2Lqht4o3wf2yPmySfZCI/DzLZFUY4fb/SV12wR4ZF/Y3R7M4QjuA8JgjohgD27UCom
 oZLHa7B9FJTw5UHjzpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 spamscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130301

On Tue, Aug 18, 2026 at 12:40:27PM +0200, Konrad Dybcio wrote:
> On 8/8/26 3:16 PM, Guangshuo Li wrote:
> > adreno_gpu_init() calls pm_runtime_use_autosuspend(), but
> > adreno_gpu_cleanup() does not call the matching
> > pm_runtime_dont_use_autosuspend() during teardown.
> > 
> > If the autosuspend delay is set to a negative value while autosuspend
> > is enabled, the runtime PM core increments usage_count to prevent
> > runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> > during teardown, this reference is not dropped and usage_count remains
> > unbalanced.
> > 
> > The documentation for pm_runtime_use_autosuspend() also notes that it
> > is important to undo it with pm_runtime_dont_use_autosuspend() at
> > driver exit time, unless runtime PM was initially enabled with
> > devm_pm_runtime_enable().
> > 
> > Add the missing pm_runtime_dont_use_autosuspend() call to
> > adreno_gpu_cleanup().
> > 
> > This issue was found by manual code inspection.
> > 
> > Fixes: eeb754746b14 ("drm/msm/gpu: use pm-runtime")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> > ---
> 
> I think we can use devm_pm_runtime_enable() instead, which will take
> care of cleaning up both the autosuspend and runpm halves

Not really, beacause the driver's group device is DPU / MDP4 / MDP5
(in case of a merged display+GPU), so the patch seems to be correct.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
