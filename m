Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792706360;
	b=SOsSOwsrQ4pCQps9lsHf2toS+TGxKtDcbebIpi/l7zfoj4WphtyrKMbtVPshdPcQCu8+
	 H3+54yxfM8i20FFqPiN4EI6uhwtkI/E1t/icoAs3U8ZmGXV0Z3pqB730UKzVHRx28vdWc
	 ENDghVsFl+toR/Wu1x4/9I/6jccABpUqDaK1KYcbRNGpffcxo/5797BKy4ZiyErEftbTr
	 klOW46+6tz/C7TYIZEq78uxz66pYV77Cc0dvAnDjI6ejHkZbvjCh8XDl6/xV/lB4HGQ7/
	 muLYoGd6/whM+1yzHpswJdRjgdGtA8S87380KAladX01LcndE7L8cmKFfvG//ORRk7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792706360;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bCeckdKdRs/lhQimfyBgMy/Z9gSui80Hd8DZQ3MEnzI=;
	b=HQICuDUzQROgMsYuLtWWH4LHnK/zfAAp86Dq+vrCMJT8ZgQv7kdUe4FP8QX4nb5eDJNC
	 cV/yZDVGUvnJJFfq2Knbp5xDgiq/MP9QmWHm4A7ftTzysoiCPzkhWVXwMe1hcO0VWlF37
	 7yZLA9TpqErv4KWy3iqm9qVpTu/V3/C2R7/v+THdA2mHvBaDrcchq/sRwcTlQNdGNJHxp
	 9qT1nuOhGQZxDG71j/FbFP7up1sl5wb7iHBUfn4fkxtBoGEjxln3zxK2tLCmZwsPg7P+3
	 ZsVo0NmmTWO/iJXyLp4xjqN1xOm/pFzAZCvwP6ReyV3pL+koCD5OkA3fCdXYXG7ii6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UZmV8jud;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXeWbeU0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A09A0606A31E
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 21:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A09A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UZmV8jud;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LXeWbeU0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MKJ8jv1243690
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 21:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bCeckdKdRs/lhQimfyBgMy/Z9gSui80Hd8DZQ3MEnzI=; b=UZmV8jud7YWRPOtv
	hNcNO7klJAE7b/jwqCkSRr8PFzhUmm8gkePeokyGv/GLZsRDSfORZ0waMqEZuMeX
	VjkucJjAC5z5u58WdcMn+XvSGc5ElbA6ana78qAD2gWaN72RibitousIkPlmAagp
	q4CmD2NCD1ArZn7KM/0lAF9zkLrSYtXVVsi9LOSeNA4cs3+ZpqSn2f0bNCEmZp5a
	91ZYoGarLvTQp3iazLZeogr5p5eTggLQwcsQ1mnGxyu1jjzYDDlJLQ7SO4um2Jqj
	0bnVhsnkKyq+J9G+nxVHV1ATF9S7eafebnuOC3WhvvORFu+yoKSizeBO1eknRZNq
	pQbprA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmj8rfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 21:59:18 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so593369eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 14:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792706357; x=1793311157; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bCeckdKdRs/lhQimfyBgMy/Z9gSui80Hd8DZQ3MEnzI=;
        b=LXeWbeU0ZPNsCoF7ZabV5rZM7tGUr4/50lW31YiRYZcePlLiOlUX6HjaOnBy9K1IBX
         QDOfbrL7aRnaPuriAThyH4xsARwaKRdWyhuChmNVBRvK6AMhU/Mlpw3nv9BXT+rVzIYP
         nFilWHtJuS3WOiXiVkqgNcDbUUJQE0TH5oTuIfqsMDF0ye/1YZJh69aqJMiStRi3iMij
         Aj3hFnAa3rC7ENEIkVaueXzSCKCf7Wm8RKyEz37p6+mUKnnAm6d41UgEhaJOp63hFvLP
         oWwVDqwi/9ry2jZUqkB+a511XFYBms6YUa0e1Rm8TYusOeusLVLR0GTPEhrUgMVlQZ4I
         uUDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792706357; x=1793311157;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bCeckdKdRs/lhQimfyBgMy/Z9gSui80Hd8DZQ3MEnzI=;
        b=H/OcnM2sLexIPAoo0bJ5NWJZmbhur7I23mdnd9lUprYq9QCaWpAVoy3qmR7lfS2kKN
         NYEmSyQiEUH75V/ZDK8TT/g36ZuAz4qlcxRIPfoJ7Kt1Rt32OFPTvyArt9Xj9Xv6/K2M
         /nuOey0SJPMHmunakebSE486qLIUbVxXNcUW4WgBqdSsQrv7ilJfzdRSpazt5je3dZFy
         hYEqqa7D3lT+vJVahuhSQj0a5tLdOAm3MDXMruwvLKnUBvLSE45X0AnRbmhG1OTuuo+z
         nC4VI2/MrSbEp9TqjQdNjABcjeW7LwhX2fULHwaDU2hOm4hhE9ZDvYNj+HBsubgj4MF/
         TZNw==
X-Gm-Message-State: AFq9FYJA9xKpPnNPxj1BSztyzfIuwi0FXnswafAGf1AJurZp+cQ0R4eb
	FrIPXMOgt8fJY0VVw81tUijJ/+sa6XR5xJjVON/1jvR4chm7xZ7AtPjzHOmXfsSk2vw5APovBVv
	n+htS1kkXe8KwA11RNICQ+lw9P5QIL7ro3y0y4QRaZXmfS9z6hXU9dDZOqZ6u4usPNsM8
X-Gm-Gg: AYBFou2h9XrUU8QnPeCSn2Dpn+5wQdM6EXRXBgeKPSzbQSNxxul1BxvRKAziioDhj5a
	d2ML1J6rkBuol1fw+mYPl68f0gZWt4zhKB3ri8pepdpQvCBg/78DPOU/dDUjnn0GILOC/fCVDxZ
	GNxXLM6ALNg2jhRdONiV/9U1KxlcT8SZfLYljZFMPPQHaYfUP4+cLUXJoQwPlHnle5ZVMuBuFqJ
	K/7nY3HWPfqEG3TK9M9ypsqdbqUzN8NBNwQZISmF2SI+jl8EVNW5LwvaosGJJVL77H49L+2/pGN
	tgyQXE040M5LZcZ53ZnNaOZ+TdLRwwnvctENRgR7Xx4UTH4e3DCAAFClIj1pXVK3ILXDgySvk5P
	3IWpS6/txziLvMkaDYKjMPqwX
X-Received: by 2002:a05:693c:20cf:20b0:369:1401:c5c2 with SMTP id 5a478bee46e88-369d9866e98mr470792eec.26.1792706357177;
        Thu, 22 Oct 2026 14:59:17 -0700 (PDT)
X-Received: by 2002:a05:693c:20cf:20b0:369:1401:c5c2 with SMTP id 5a478bee46e88-369d9866e98mr470754eec.26.1792706356491;
        Thu, 22 Oct 2026 14:59:16 -0700 (PDT)
Received: from [192.168.1.13] ([106.222.228.226])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369d9d89b14sm685365eec.14.2026.10.22.14.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Oct 2026 14:59:15 -0700 (PDT)
Message-ID: <bd3b073b-cae5-4ea8-8ed4-063db0aa5e64@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 03:29:08 +0530
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
Subject: Re: [PATCH v2 1/3] drm/msm/a5xx: Reset the GPU when resuming it
To: fabricioakio@gmail.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Paul Sajna <sajattack@postmarketos.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20261019-a5xx-gpu-pm-v2-0-457aafbb28da@gmail.com>
 <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20261019-a5xx-gpu-pm-v2-1-457aafbb28da@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: NgBZm0z2oTDe6J0MdADT-VXNhDXwGrVB
X-Authority-Analysis: v=2.4 cv=cPR1IVeN c=1 sm=1 tr=0 ts=6ada8736 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ipsIN8yD8anPosRfiFfp5w==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=Gbw9aFdXAAAA:8 a=pGLkceISAAAA:8 a=aq2bxKA37D_GVACvEnsA:9
 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX49Fa6MUwVNcS
 S+CnK7MDBCKsgUFBGDxzvUTHsI1zaLukW1oiumZ65DfMTa0XztC7aV96B/ft7/z41ViaHFaXUc4
 IE20e/fPhsz5L2kiwwyPU6yEQYChPQM=
X-Proofpoint-ORIG-GUID: NgBZm0z2oTDe6J0MdADT-VXNhDXwGrVB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA4NyBTYWx0ZWRfX0qY4q9dcm0h0
 gYcXAX8GPs4rGwjS0CQWKxJ3Xo1IykbmGm8xVhk9ypopOonSWTdTHzTpB+E3+W1P5qCVDERjLAC
 RmTUMI5nclIhSjRhSAIlXPE9RT+QnAyA3/84Jm38eexec1n/9dEuawebS6nvTI/BB+Nigh9JoC7
 bUY66DOKFskCgQeBQiI5Mhm/S/FRc5XMmt/O7BtHNThcJrNR0AKC2E2kYQk85kBPzclqiOucowZ
 WCwRtkezuo7+lTJoynzxqPU9y1L4AZqzMVwjX8rUiy90o7zM2PwRDj0ihEL2i2/ztD2yDEhiNPB
 pfq+NHlwC+e9ai6B59Uw+LBg9k886D4N9A/BMDtifMMdMT0Y6UtM811yRlMgm+2rSXHoupufXut
 fVmZTKH6bXfV+NezxFnuwKb5Zd1HeRnNYJ722C1uWklL/YBMtCNlkVW3t8YXI/u+kOlw7CvYlHi
 uMayBtFyfYZejs01ldg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220087



On 10/20/2026 7:35 AM, Fabricio Akio via B4 Relay wrote:
> From: Fabricio Akio <fabricioakio@gmail.com>
> 
> On SDM630, SDM660 and MSM8998 the GPU's GX power domain belongs to its
> SMMU, not to the GPU, so GX switches off only once the SMMU suspends as

This is incorrect. There is no Adreno GPU where SMMU is powered by GX. I looked
at the DT of SDM630 and I don't understand it. Seems like a creative workaround
to vote different power domains.

Please reword GX -> CX here. Adreno SMMU is powered by CX GDSC in every chipset.
In some chipsets, the core GPU blocks are also powered via CX GDSC. So it
makes sense to do a SW RESET in case CX didn't collapse due to a vote from the
SMMU driver or something.

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
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 16c7335c4b1f..0aff8252a00f 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -1367,6 +1367,21 @@ static int a5xx_pm_resume(struct msm_gpu *gpu)
>  	if (ret)
>  		return ret;
>  
> +	/*
> +	 * The GX power domain is not necessarily switched off while we are
> +	 * suspended: on SDM630, SDM660 and MSM8998 it follows the GPU's SMMU
> +	 * rather than the GPU. If it stayed on, the CP still holds its old
> +	 * ringbuffer read pointer and would execute stale ringbuffer contents
> +	 * once hw_init restarts it. Soft reset the GPU so that it always
> +	 * resumes from its reset state.
> +	 */
> +	gpu_write(gpu, REG_A5XX_RBBM_SW_RESET_CMD, 1);
> +	gpu_read(gpu, REG_A5XX_RBBM_SW_RESET_CMD);
> +	gpu_write(gpu, REG_A5XX_RBBM_SW_RESET_CMD, 0);
> +
> +	/* The reset cleared the busy counter devfreq has just sampled */
> +	msm_devfreq_resample_busy(gpu);

Instead of a new API, we can just move msm_devfreq_resume() here. That will align
with the A6xx sequence.

-Akhil.

> +
>  	/* Adreno 505, 506, 508, 509, 510, 512 needs manual RBBM sus/res control */
>  	if (!(adreno_is_a530(adreno_gpu) || adreno_is_a540(adreno_gpu))) {
>  		/* Halt the sp_input_clk at HM level */
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index d27d54bdb7a7..0e0768c15bcc 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -735,6 +735,7 @@ static inline struct msm_context *msm_context_get(
>  void msm_devfreq_init(struct msm_gpu *gpu);
>  void msm_devfreq_cleanup(struct msm_gpu *gpu);
>  void msm_devfreq_resume(struct msm_gpu *gpu);
> +void msm_devfreq_resample_busy(struct msm_gpu *gpu);
>  void msm_devfreq_suspend(struct msm_gpu *gpu);
>  void msm_devfreq_boost(struct msm_gpu *gpu, unsigned factor);
>  void msm_devfreq_active(struct msm_gpu *gpu);
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index 2e1d5c343272..2e963bff3f61 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -242,6 +242,23 @@ void msm_devfreq_resume(struct msm_gpu *gpu)
>  	devfreq_resume_device(df->devfreq);
>  }
>  
> +/*
> + * Take a new busy cycles baseline, for a GPU that resets its busy counter
> + * after msm_devfreq_resume() has sampled it.
> + */
> +void msm_devfreq_resample_busy(struct msm_gpu *gpu)
> +{
> +	struct msm_gpu_devfreq *df = &gpu->devfreq;
> +	unsigned long sample_rate;
> +
> +	if (!has_devfreq(gpu))
> +		return;
> +
> +	mutex_lock(&df->lock);
> +	df->busy_cycles = gpu->funcs->gpu_busy(gpu, &sample_rate);
> +	mutex_unlock(&df->lock);
> +}
> +
>  void msm_devfreq_suspend(struct msm_gpu *gpu)
>  {
>  	struct msm_gpu_devfreq *df = &gpu->devfreq;
> 

