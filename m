Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB96351C02
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730511; cv=none; b=rI613siFfcQuvvG1X3JppJ/BK0qkgvwvpwiI9O5nsr+mNYT4fx1qGh8urdFtNS5rcziJVWwlBKi9eNU9V5q77D+ONaIX/6hl8kTozZchKRavxfu4jkAIjLU4wyuIMnd82mM5RT4DT1CI8ZF4fg6fMZeonkKBLjdbJMGk32Cfikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730511; c=relaxed/simple;
	bh=X9SboUkjpZf/k0kAHyFMiMkq26RHvWaFQDIfNXZw2ho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pXpAiKPQKuDIZ1EFwoYMIQWC8qiv9PdMA6WmkVVjzxBRDiJBzBqIhabnivDHupwmPEgURKA0m0l3fWnCxWX/BmEknvWgM30AbPClKxA83/CUQN0KPbtnqpzTuQaKHqwPeWhioYAPPkGj6Bzse+/VL6Ft+4y3aJVg03bxP9BUyjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RivCXYf2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iZpDbFtX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RivCXYf2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iZpDbFtX"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RlU3683518
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V93Tb3TC/II41tzTbPKnZEi8d6oHgZX2OEMTVcMO7PE=; b=RivCXYf2qcaWO4BR
	3n+BTpZexef45EO2pi6Om5RPBPxHW8jUVvmKTClu0/zE77TkDt8USe1u94cSnAuY
	mY2PB/SgcYLTMadmv3PtQM8nR+F9I0ddlXmCoy8eA5E84VCFSPyZ6pdThDxXMShd
	x0XdJcCKkaaIsjDeIKPOLXfM5AHjP3jh4ehdEFX65tCW2ulqGf993txkzf9TtZrS
	xE4uue9ts/j9/INpNxMJqTVUS77LZ3I7vU8g3p9drPy1rpL/nsDiWCHNopKxvzzi
	4NRYKhW8cxKy9pngKZ2CV8IuI7fQ7bvYubbYuDq/Rudafm6dyZBviobf7gWoODzg
	Et1nwA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fgxjsg7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:28 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dde0df80bso840944a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787730508; x=1788335308; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V93Tb3TC/II41tzTbPKnZEi8d6oHgZX2OEMTVcMO7PE=;
        b=iZpDbFtXgEqYJRR26lS2copu8WohAvuS7NVgsk9TPbEVsqeAPVnakuGwzbVQ1kiLTt
         UBdsgo5kCKHinZfBKRxxj2wVWT86qhYQmCwhN12noKouaTrKwbJpoixTX4J0TojAnCCP
         c7Z9PgbEeGSwIjbXJbUnbO4P8haLyFDgugsgRePZHXOXO3YONlr3AWu0tJTwhztuabkU
         BkysVT/fgsM3zQhS5ZkxcNZdZ1Xijh+u5oVXCYOLewSfbCkrKkDMBDacZbq69yqCCsGD
         Rmy0+u1kxEmENOwzUd7TKyVpNtDrBb/sCLihUDy+sMHzVx7J58EiWwYYls/sVCcV3PDo
         MV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730508; x=1788335308;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V93Tb3TC/II41tzTbPKnZEi8d6oHgZX2OEMTVcMO7PE=;
        b=KMWL+d/qcjfM/Hntot6JF8tY4PXHc2TpI+wspB6VQEnysnp+XfEaPUseMWGcyHKtQq
         GKUIn92/HgoRxR4GMoTnXRnxDcqGomTmq6+GneTMCCU0rSdwHQ57npqlc8aH8PT+Czxa
         nsk1vuEybib/2rOf5vieEj+KWHvVWHpwiYWifquba4eqFdqR7GYoEH+7VM5x1pVUXvqF
         1Dt7xwQm/7eRKQbonO8UgltK2VG89WvVksPFB33xdufHN4ce+g8jSM+3k7I07AZ0HbHs
         hfV4PC3wlNX3Js6qfEzZX1apbDHrwkC9wd2odRE4vzXJReEbXOQaf0pMHh6HlmsaSzYR
         xEqw==
X-Forwarded-Encrypted: i=1; AHgh+Ro2z+/N80bILbbxzsjFb9aqJJRepg/4VMUHcOBPJudwgd2E7o8U75OG+2fJqlhsAA82XUqfV2zbdE/Igdqi@vger.kernel.org
X-Gm-Message-State: AFuF++kyL8m0PSqWEMQQVUJp/ZHUPCiSeUhEcfxRL4ydrZqLVCbC7ua0
	oOIkW5rEWO7rH9Zpd1n7ZBSWnscP8mczH/PxNq+puALmlLM+F5/7mP+kovhPHhZ30xMR9KxcWcJ
	ddjpa+/lmmCrUMwbfzE8OYbN4cKj1EAbUsN5GgDxn4UTvrpDs+roUvP0NKgJZD9hlbAxH
X-Gm-Gg: AR+sD119/5gsVxoavJjbhL+YrYoZOlCey+vFOgKi8eJTe3CDDGGmmXmDJkzZdPfsLQK
	TZqi4W50AqfBJePekp0GhGcuf1glebCXgL8aAXcI43hpCbBxKmQK78J5DU48o0Q9usd1Xk/GF9L
	+TJRSAB+mJy6yDm6Us1Z9lw2BcOKiXoZ8B0QmLMupPG0WYgyUq5P5PjwzucfMG3+Psbp23KNj/r
	44PaZGXUAI3IOgihRmuyeivSzHOiKi1nTcCap90DgZhX2ZPsEA8NY5ktiaiDAwFunvvpDq4p5Wo
	aOGo96ZcrxLV1ysLRigGf8PWdhFIsPkvakiVn5FkgZzrZ+LSh6/4uTL5C0s/6fO8ZnNlwEVFo3z
	svC9Bi1KTqJWfJvPynQWTRU2KyOW56Y0bkoHaO8MLRoaCdoEo5DRpa47R38GM17XXYdxfOJ6T
X-Received: by 2002:a17:90b:51d2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3966d21833dmr10633742a91.6.1787730508276;
        Wed, 26 Aug 2026 00:48:28 -0700 (PDT)
X-Received: by 2002:a17:90b:51d2:b0:381:6c5:3f63 with SMTP id 98e67ed59e1d1-3966d21833dmr10633651a91.6.1787730507803;
        Wed, 26 Aug 2026 00:48:27 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a5832bsm3060969a91.15.2026.08.26.00.48.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 00:48:27 -0700 (PDT)
Message-ID: <1b671346-cfa3-4cd7-ba05-56fceb021d3e@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:48:22 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 05/25] drm/msm/dp: add support to send ACT
 packets for MST
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20260629-msm-dp-mst-v5-0-2ed6aee1867a@oss.qualcomm.com>
 <20260629-msm-dp-mst-v5-5-2ed6aee1867a@oss.qualcomm.com>
 <is5m5apuf3mujjm7y2edxbjjygc4w4wpp4i33vj2cyh4lzte73@heinwvrqnaur>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <is5m5apuf3mujjm7y2edxbjjygc4w4wpp4i33vj2cyh4lzte73@heinwvrqnaur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=MqZiLWae c=1 sm=1 tr=0 ts=6a8e9a4c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=2-Wp6Lh4Fygn7rjj7MsA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: uDJdGlUAryyjXKcvX7cRmf7uu4R64tZv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX3UpeDUH2Fwbi
 mz114b09Lt4YK6zCzpDtv4reZ/rxmxA+9m/p5y7YmBKd9HmgtaQS90WRU26xI3PzjscHUlylsKX
 TbRSXRiUmdgpEHFhEtj63te9ylqqO3IyzjehcD2nUCwCbbImLfyaoB9T2Dy1wh/bdPUmQrSQ4AJ
 ziIjTocX290tmEZJ0AAYE5HlHKOix6rzthPAbnDyvyvlcENZGqpZY4Xn4cEZXkQemVNZwNQ2Plb
 dTFHxRsX8r5He4qcyk+QFMvbmuBjAVZALahJm+zKcFTlX4aCmWrCEwSP66Ky1zmlIIMSM7BO4Ag
 NRcT+KTeR6v67ktUcu/rQ9f9FQY+F7X+XhHQAl+di82bNH7eVIikHXZUj7bl8PltkNlDS0G8EkA
 L7yrU9kFMMTqYC8C6NlqPSDKOKJlAAXt2RwJbzsHYHx50U58gEjYre4lcC4JWpCdMJEOOr4Xctz
 dxgdt7YUu4O7JHK1K6A==
X-Proofpoint-GUID: uDJdGlUAryyjXKcvX7cRmf7uu4R64tZv
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfXyam0My7r3E/u
 7tWwGwdC9efLhibEK9hTOKDS+4eP58bqsCHFtTETlT0l4IHarJ8FM8RK9mYZXU3S2WMtwv4pzT/
 I4alIZyX/lTsoU6odv24qYZwOD10gcI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260063



On 7/12/2026 9:56 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:26PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Whenever virtual channel slot allocation changes, the DP
>> source must send the action control trigger sequence to notify
>> the sink about the same. This would be applicable during the
>> start and stop of the pixel stream. Add the infrastructure
>> to be able to send ACT packets for the DP controller when
>> operating in MST mode.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
>>   5 files changed, 52 insertions(+), 3 deletions(-)
>>
>> @@ -2623,6 +2656,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   
>>   	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>>   
>> +	ctrl->mst_active = mst_active;
>> +
>>   	pixel_rate_orig = panel->msm_dp_mode.drm_mode.clock;
>>   	pixel_rate = pixel_rate_orig;
>>   
>> @@ -2658,6 +2693,10 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   
>>   	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>>   
>> +	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
>> +	if (ret)
>> +		return ret;
> 
> Should not we mark mst_active only here?
> 
I'd prefer not to change it here. The flag is needed later in the flow, 
and I'd rather avoid passing it through multiple layers of function 
arguments.. If MST initialization actually fails, I think it's cleaner 
to handle the cleanup through the error path based on the return value.
>> +
>>   	ret = msm_dp_ctrl_wait4video_ready(ctrl);
>>   	if (ret)
>>   		return ret;
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index 310e5a1cc934..6808965878d4 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -156,6 +156,8 @@
>>   #define DP_CONFIGURATION_CTRL_BPC_SHIFT		(0x08)
>>   #define DP_CONFIGURATION_CTRL_LSCLK_DIV_SHIFT	(0x0D)
>>   
>> +#define REG_DP_MST_ACT				(0x00000500)
> 
> It's not that it is a register in its own register space.
> 
Got it. will move this.
>> +
>>   #define REG_DP_SOFTWARE_MVID			(0x00000010)
>>   #define REG_DP_SOFTWARE_NVID			(0x00000018)
>>   #define REG_DP_TOTAL_HOR_VER			(0x0000001C)
>>
>> -- 
>> 2.43.0
>>
> 

