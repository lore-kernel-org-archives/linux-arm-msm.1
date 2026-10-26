Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793043677;
	b=EH4zbQ6o6HRUcynItuLn32rZy6n/M8pgtQngZYD9qJX1MLuTsf/U0WOAcikVybd8LL7n
	 1ElWqKEHpVfq0gzZ73i5ctXxbS+h4eRNsD0bO2k9w+0cuggfCzvxdIwsYflt70s8UxXO2
	 CiWzhy5TRtbLJb/4PRaPwspkKVMdohDgTJ+YvXLugPl3BnKeySIpo5eJH3SXjz1rE7rUF
	 XAUOSrft5ftdglEAn6WuCyx1Mw4JuYJm8V1TBJVPuTE7FsVb779lqIHhTLL7SaGhlqX7Y
	 l1j6f/jBTpLzEpvJfiCE0DC7jGJrBCKdkRFvvq9ITfKcq+IVf+2SKOF2ZT2cSQiTUig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793043677;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=O1jHvVDknA/tLu8/L5dDx1mH+Ao/ACcwB5MVHq3OiQA=;
	b=C46aISY7zUXFOjGzyyuENC5f+5mvnCPoC/8dHwviC/CjdzAN9eHmaAGYksWOORkE6Z5K
	 E79HIA+bzH4HI0bhdcShr32AjOUAE0Ru3GrMOne6RjRFCM5/LsOgIxz5RPZVEPClOAhpH
	 OqPI9jX8Yzb95bykMU2/xXwC01Gbf2VjOpsJdcKkHvzY5FLMDWQ6v2kO0yQHMBBhY4FLM
	 h34TUyAPyIfLxAJuhHY/1X62YcwRMnW4DGGLWOr4+6CN87CQmx5WxHtBVAAVq8dO1FXqA
	 xWWwTcryedboARgeUlye/jKw986SKGds7Tgorj1LM2StB26pIyu2lqKs4jS6G/gX3QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=bLnUytpN;
	arc=none smtp.remote-ip=91.218.175.101
Received: from mta0.migadu.com (out-101.mta0.migadu.com [91.218.175.101])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D667606A31A
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2026 19:41:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D667606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=bLnUytpN
X-Envelope-To: linux-arm-msm@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=rCKcQvSjfqvqlSYee/K00QDuSFn4KmH4U1/bkKGe2jc=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793043674; v=1; x=1793648474;
 b=bLnUytpNCxpa/8qVBbDCOS1U+zK7koPJVz/vXsrPny66PG40vcDU+qb+ZtZEhrmdcNAEtV9G
 ul459QvM9KPzqoQecaVUUR2ej5i06nDc1S7svftmeuUaHtICVG1jHmzEAnouOrIqeQymzMspSmM
 US0yNC/q85el9NVHuzoSAD3s0QFnn7/rEbBUqqUKgADko1jo+x7AKBb15MU5VFphiW/wZ7hQMnR
 OHdV46eQ+azQlX5ECSOkzlrT/cfoogHTbD/GtqOwLzGrjQ0tsmCENtCJh0H/5wJWTAhwBhz+RFb
 DqwLlAAcS5tbFCrzknYgEYbwzFd4vf9wK7jG/rgFDmpfg==
X-Envelope-To: linux-arm-msm@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id fb68a8c92d4f5fc8;
	Mon, 26 Oct 2026 19:41:14 +0000
X-Mizu-Trace-ID: fb68a8c92d4f5fc8
X-Migadu-Flow: FLOW_OUT
Message-ID: <1ea484c0-e451-4753-af1a-ad931f41be58@packett.cool>
Date: Mon, 26 Oct 2026 16:41:07 -0300
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
Subject: Re: [PATCH 1/8] drm/msm/dpu: reset unassigned resource slots to NULL
 on topology update
To: Xi Zhang <xz.ca.cn@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Xilin Wu <sophon@radxa.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20261026-msm-dpu-res-clean-v1-0-f46130a8a717@gmail.com>
 <20261026-msm-dpu-res-clean-v1-1-f46130a8a717@gmail.com>
Content-Language: en-US
From: Val Packett <val@packett.cool>
In-Reply-To: <20261026-msm-dpu-res-clean-v1-1-f46130a8a717@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 10/26/26 4:16 PM, Xi Zhang wrote:
> While this is not currently the case, it may be possible that topology
> for cwb and dsc resource requirements change between mode set in the
> future.
>
> e.g. when dsc support is added to DisplayPort, dsc may be optionally
> enabled and disabled between different modes due to
> bandwidth requirements.
>
> Set unassigned resource slots to NULL on topology update to avoid
> issues in the future. It's good practice to do so anyway.
>
> Signed-off-by: Xi Zhang <xz.ca.cn@gmail.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 22 +++++++++++++++-------
>   1 file changed, 15 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 0a6be69a3e83..8d2b4d2726f2 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -1205,9 +1205,13 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   						       ARRAY_SIZE(hw_pp));
>   	}
>   
> -	for (i = 0; i < num_cwb; i++) {
> -		dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> -		cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
> +	for (i = 0; i < ARRAY_SIZE(dpu_enc->hw_cwb); i++) {
> +		if (i < num_cwb) {
> +			dpu_enc->hw_cwb[i] = to_dpu_hw_cwb(hw_cwb[i]);
> +			cwb_mask |= BIT(dpu_enc->hw_cwb[i]->idx - CWB_0);
> +		} else {
> +			dpu_enc->hw_cwb[i] = NULL;
> +		}
>   	}
>   
>   	dpu_enc->cwb_mask = cwb_mask;
> @@ -1215,16 +1219,20 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
>   	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>   		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
>   
> -	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
> +	for (i = 0; i < ARRAY_SIZE(dpu_enc->hw_pp); i++)
>   		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
>   						: NULL;
>   
>   	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
>   						drm_enc->crtc, DPU_HW_BLK_DSC,
>   						hw_dsc, ARRAY_SIZE(hw_dsc));
> -	for (i = 0; i < num_dsc; i++) {
> -		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
> -		dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
> +	for (i = 0; i < ARRAY_SIZE(dpu_enc->hw_dsc); i++) {
> +		if (i < num_dsc) {
> +			dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
> +			dsc_mask |= BIT(dpu_enc->hw_dsc[i]->idx - DSC_0);
> +		} else {
> +			dpu_enc->hw_dsc[i] = NULL;
> +		}
>   	}
>   
>   	dpu_enc->dsc_mask = dsc_mask;

The radxa 7.0.11 tree which has some DP DSC patches indeed touches this 
code with "drm/msm/dpu: Clear stale DSC resources during modesets":

https://github.com/radxa/kernel/commit/d0a8968dca16965395f4089a28d48ab6acde565e

(but it only clears hw_dsc, but in the hw_pp loop, for the assigned 
resources..)

[+cc sophon]

~val

