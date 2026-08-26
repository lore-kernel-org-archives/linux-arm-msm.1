Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE55F37B021
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730525; cv=none; b=hMFT5Yme/8ZbV/7XwrOV/g7NV1Y0t9YBAkfCAJG1yaWd2RwzrAEgRJCtU9vEWi2rXl6XVE609vPsEeUx1h5ZgT6T7EYkDfB/K4vf3JkQ5vr3HY1b//dGIv4drmsjWtd9rnFqCoJhuFt/1h42f244W64H5g9OFQsedIdjYyvVFpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730525; c=relaxed/simple;
	bh=5B2oKJa84TS7PHx1iQzrq1F5kGkoq0I9HXcF4UN5iEQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iwVekVQNV5BKmptX2Nn6F8dICZBUVg+iPQTGNUHAF3987w7e+u3Gwsgn4+9GmKRvxYs4UrYY6q5QDswcd81RsJQpDUNdF61PfYWQwJd2zr6mIfC7dp720I+EHgmHaWb4UTeoxjlwAb6bAiY2X6zQq8sEK1O0fGJSCqY+SttC94U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PasReVvQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y/kjV+3o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PasReVvQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y/kjV+3o"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6RjeD3689427
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rFnyVWToa71j3L2Rfc6O6BlfkM6QwRoQfVG7Ip97GTk=; b=PasReVvQ4XwcO4nS
	xPVyXbcPWVINFSvLlPYz1my92/tZuYGklO7+FmHiZTf2YxT/RfIAzVQREAC8o6eJ
	81vV4IZniDYPQF+Ybb+bpv8/vg2+W3jXKfBBZx/MI/9drYzXhieXcPaPQxeIcXvg
	RjjiNpbPT6Cv33Qd2Ps87xz6JW4nIV/9cc9+cUoBJVtRwoiDaEov3zWfTctS1qLa
	PEsoxp4jCfEw8ULUSUxPeTdSEJ9l12DfBSvkpNRv1BRO5AfhBlBUXEconzGdmAHp
	ZpzvH+IxK7Fh97llyynZ63NA8AVbn1NfcjH6SzWxfEo5Fp61pZWcwMwIv1XKdLq6
	fDZukw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9fjn2rw7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38f5ac7354dso1093623a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787730522; x=1788335322; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rFnyVWToa71j3L2Rfc6O6BlfkM6QwRoQfVG7Ip97GTk=;
        b=Y/kjV+3oGNlEm91CTtH1YIrNQbyLAvj2EQszoat34d0YjJIkYFKODSm65YjNIWfiZV
         Fxj7//38HePZiGyaYoepAjI3n5QfVwb4i29h6CNhkp6uo4iGs6UpAT66hfpEqy6ZwQ7b
         nadNw95Go61KnrOmSlIeyArQ2l2SA8beXeKrs2Piht71lu8FTEygi4h7WAs5eLs0ew84
         B5M4Iv65g//0AJhb5eS6EZ2Dxy618QrcLJ0eilR9yqSF5nH6gGBROgkCABuMZa8RIhs1
         CgWJSSzv/8C+jQUckuDcCa5/Y5Q3ANCiy1Zq1PymtzcgEflVR8a5sNk+JHSErym1u+oN
         vf+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730522; x=1788335322;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rFnyVWToa71j3L2Rfc6O6BlfkM6QwRoQfVG7Ip97GTk=;
        b=TEH7gO+DwiLEwjeySXMiT/xJG4dqOb5JC2+1suEtDJQzYEw2nsp7fMcpmzMVm5g6BW
         NIIIwx8MGu1FfcegT2nqMhFoUloDM/hT3iiJCCpqcbQ4h8d5/bdspkB7EZIa5WtKVOBD
         T4pi0lme3RTd22geK9DGCAbYXP4A2SV9g778lJBf8bEZG7gXfNhaOnRm0NoDyfnA7FC/
         NYILN+abDf6J2bHA7JdylKneNGwui2IWXMVkUTRAsRKS7ExbTXgXh4jnL4/VOd0yC4Yn
         HxNBAXYO6Y/DQimBkalGLM93L3GysReGfRdq0eJ9RFJrGAiyW/knIZxsTIJu+xq5c7iQ
         EtHg==
X-Forwarded-Encrypted: i=1; AHgh+RogGy72g9BHtCTKiD/ami7R+9BiNjO4Kx1FjsrMMwQ1gckb+yXoIREAOGCsCOtAcdSLtyQQ0LgcmoCsjK4m@vger.kernel.org
X-Gm-Message-State: AFuF++k0PFlZ2wLg1fjrcZAnayCU66mwOPtN90dMGKzzhTzoPlQYK43w
	hcr1XaROU0LGaEcQqB6AMILI+XdDnJjw9z7R8lk9dUbd4wQsVu3WxnU3Em4IdH4pNccQkJ3o+Ln
	hTpCLjFH3MVTpodkc9Y+jxVFdxqYQ5vQ6SScnyKDQjpzw7aThbqKvmQdXprg3CddBuWXy
X-Gm-Gg: AR+sD137G9C6ON+R7+5+AJkZhKz98LEsuDo2NCLYi1sF3qrdAyFQMlFx6Pnl02SKqad
	1yz+ft5a9mvy1sCEDLoO35eIOGPzOvQjQ+JOEBfUwjP0deHHvnuBG+jVSWWIk7u38eZhDfnOSPj
	A4D4+1HayE2xC8c827Gy5J/pjuHt0ooGJnXO5YoteZucBaux/q0yOZB9sSr3IgoJyOFXhjuogvG
	qgTE3SRgY0BbdMWLu+Pt6yiJcGiPP/MJzQX3+A9ld7ueUtbMo08LqRE3/aHr5CaDCt2V9lp/KsF
	A69l+BOOcfqJfHc/mqfLqDChknl7zuIPEZVzoHwRo8FpwyGPG2ZyWJTbhJ7K/XmhOPpJRomDN2v
	NG5qtN1QEVAX/Gwqcoo7Q/F1etH5d7cIKdj2ZDncFS61dmdX6EFR1Vnbr393V441IO3l3LhzG
X-Received: by 2002:a17:90b:3cc3:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-3966d85de70mr10747148a91.10.1787730521469;
        Wed, 26 Aug 2026 00:48:41 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc3:b0:393:194d:5366 with SMTP id 98e67ed59e1d1-3966d85de70mr10747029a91.10.1787730520917;
        Wed, 26 Aug 2026 00:48:40 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a5832bsm3060969a91.15.2026.08.26.00.48.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 00:48:40 -0700 (PDT)
Message-ID: <3edc542f-3991-48cf-89cf-01c7fdecfaee@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:48:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 08/25] drm/msm/dp: Add support for MST channel
 slot allocation
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
 <20260629-msm-dp-mst-v5-8-2ed6aee1867a@oss.qualcomm.com>
 <3mj5fuv5gdoxjqquyllzk2tzbvyblh77yj2dttki3t64krljfm@cwpua5mtfz2o>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <3mj5fuv5gdoxjqquyllzk2tzbvyblh77yj2dttki3t64krljfm@cwpua5mtfz2o>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2NTbhnhHQTWazt8BDFaMXuV9KwBvs0HE
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfXx+R6y7c1cK0s
 8KsYVtQUcSke5I9m12lSkYktOFNEv//S3pfzIsfjtG7ryomRQb9dpzjUfpwtMHxzI7cyR79z3PS
 HZpshL1z4zjSySpkv6GVFZeXxfBof+c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX+0mNEiUlNW8Z
 Kch5E6/7kep8u0AZiczFKbohYUncENvzZHBEYu/vd7PNK15q80HwlYjzAhJAYF0O5bxh0dpGi7a
 t3KHbLkMsuOAl1WiyiGuVXIJIguw6jqvX6HCwFJbfZ6fvy208zBCUyvsmAo2Qvfq+BvikFYPiuK
 yh/Zzxdz5ENKQIWPXNCg8uKEm4qFXVrd81RrmbSqqM6/QICRUfAcM2Dg6ERHUGUupNKUO+UZdN6
 Nz0SSkhHxwsBvTSj30lWUbHaSi/IvHZd4G9hXVCY1G15LtqJICVoopoqVdmtojjnUi5suloW8qi
 REPA/Pu/Xoy35Iog2m8TYr6zlIZ3X/MBfEyHZi88ndkr3SSV6DZ/ZPUezDgQBl6IPUN+7wLIEXD
 z7c/0x3caBwMoO41ckFiLlHQemdMA2MINO/SUgH4qKSyoDTpTAPSO88yjbU5v5V3/yWpXt6pDhY
 9+rlI1RTBriZl7oftow==
X-Authority-Analysis: v=2.4 cv=ccziaHDM c=1 sm=1 tr=0 ts=6a8e9a5a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=5sAxot2X7EVnXVH0528A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 2NTbhnhHQTWazt8BDFaMXuV9KwBvs0HE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260063



On 7/13/2026 2:57 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:29PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
>> support for calculating the rate governor, slot allocation, and slot
>> reservation in the DP controller.
>>
>> Each MST stream can reserve its slots by calling
>> msm_dp_display_set_stream_info() from its bridge callbacks.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 192 ++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +
>>   drivers/gpu/drm/msm/dp/dp_display.c |  17 ++++
>>   drivers/gpu/drm/msm/dp/dp_display.h |   2 +
>>   drivers/gpu/drm/msm/dp/dp_panel.c   |   6 ++
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |   1 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  10 ++
>>   7 files changed, 232 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 5b5149b160df..15df82a0caca 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -73,6 +73,7 @@
>>   #define MR_LINK_PRBS7 0x100
>>   #define MR_LINK_CUSTOM80 0x200
>>   #define MR_LINK_TRAINING4  0x40
>> +#define DP_MAX_TIME_SLOTS 64
>>   
>>   enum {
>>   	DP_TRAINING_NONE,
>> @@ -109,6 +110,11 @@ struct msm_dp_vc_tu_mapping_table {
>>   	u8 tu_size_minus1;
>>   };
>>   
>> +struct msm_dp_mst_ch_slot_info {
>> +	u32 start_slot;
>> +	u32 tot_slots;
>> +};
>> +
>>   struct msm_dp_ctrl_private {
>>   	struct msm_dp_ctrl msm_dp_ctrl;
>>   	struct drm_device *drm_dev;
>> @@ -143,6 +149,8 @@ struct msm_dp_ctrl_private {
>>   	bool link_clks_on;
>>   	bool stream_clks_on[DP_STREAM_MAX];
>>   	bool mst_active;
>> +
>> +	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
>>   };
>>   
>>   static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
>> @@ -289,6 +297,44 @@ static void msm_dp_ctrl_mst_config(struct msm_dp_ctrl_private *ctrl, bool enable
>>   	msm_dp_write_link(ctrl, REG_DP_MAINLINK_CTRL, mainlink_ctrl);
>>   }
>>   
>> +static void msm_dp_ctrl_mst_channel_alloc(struct msm_dp_ctrl_private *ctrl,
>> +					  enum msm_dp_stream_id stream_id, u32 ch_start_slot,
>> +					  u32 tot_slot_cnt)
>> +{
>> +	u32 slot_reg_1 = 0, slot_reg_2 = 0;
>> +
>> +	if (ch_start_slot > DP_MAX_TIME_SLOTS ||
>> +	    (ch_start_slot + tot_slot_cnt > DP_MAX_TIME_SLOTS)) {
>> +		DRM_ERROR("invalid slots start %d, tot %d\n",
>> +			  ch_start_slot, tot_slot_cnt);
> 
> Is this an actually possible error or is it defensive coding?
> 
This looks more like defensive coding. I'll remove it.The DRM framework 
will take care of this.
>> +		return;
>> +	}
>> +
>> +	drm_dbg_dp(ctrl->drm_dev, "stream_id %d, start_slot %d, tot_slot %d\n",
>> +		   stream_id, ch_start_slot, tot_slot_cnt);
>> +
>> +	if (ch_start_slot && tot_slot_cnt) {
>> +		u64 mask = GENMASK_ULL(ch_start_slot + tot_slot_cnt - 2, ch_start_slot - 1);
>> +
>> +		slot_reg_1 = mask & 0xFFFFFFFF;
>> +		slot_reg_2 = (mask >> 32) & 0xFFFFFFFF;
>> +	}
>> +
>> +	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_TIMESLOT_1_32, slot_reg_1);
>> +	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_TIMESLOT_33_63, slot_reg_2);
>> +}
>> +
>> +static void msm_dp_ctrl_update_rg(struct msm_dp_ctrl_private *ctrl,
>> +				  enum msm_dp_stream_id stream_id, u32 x_int, u32 y_frac_enum)
>> +{
>> +	u32 rg = y_frac_enum | (x_int << 16);
>> +
>> +	drm_dbg_dp(ctrl->drm_dev, "stream_id: %d x_int:%d y_frac_enum:%d rg:%d\n",
>> +		   stream_id, x_int, y_frac_enum, rg);
>> +
>> +	msm_dp_write_stream_link(ctrl, stream_id, REG_DP_DP0_RG, rg);
>> +}
>> +
>>   /*
>>    * NOTE: resetting DP controller will also clear any pending HPD related interrupts
>>    */
>> @@ -2619,6 +2665,117 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>   	msm_dp_write_stream_link(ctrl, panel->stream_id, REG_DP_SOFTWARE_NVID, nvid);
>>   }
>>   
>> +/*
>> + * Calculate MST Rate Governor parameters x_int and y_frac_enum (HPG 3.8.1.2).
> 
> HPG links are pretty useless.
> 
Got it.
>> + *
>> + * The RG paces symbol delivery per MTP via: M = x_int + y_frac_enum/256
>> + * where M is the target symbol count per MTP across all lanes.
>> + *
>> + * min_slot_cnt = (pclk * bpp/8) / (lclk * lanes) * 64   -- slots at 1.0x BW
>> + * max_slot_cnt = pbn * 54 / (lclk * lanes)               -- slots at PBN limit
>> + * raw_target_sc = (min + max) / 2                        -- midpoint (~1.003x)
>> + *
>> + * Quantize raw_target_sc to 1/(256*lanes) steps, then:
>> + *   M           = Chosen_TARGET_Slot_Count * lanes
>> + *   x_int       = INT(M)
>> + *   y_frac_enum = CEIL(256 * MOD(M, 1))
>> + */
>> +static void msm_dp_ctrl_mst_calculate_rg(struct msm_dp_ctrl_private *ctrl,
>> +					 struct msm_dp_panel *panel,
>> +					 u32 *p_x_int, u32 *p_y_frac_enum)
>> +{
>> +	u64 min_slot_cnt, max_slot_cnt;
>> +	u64 raw_target_sc, target_sc_fixp;
>> +	u64 ts_denom, ts_enum, ts_int;
>> +	u64 pclk = panel->msm_dp_mode.drm_mode.clock;
>> +	u64 lclk = 0;
>> +	u64 lanes = ctrl->link->link_params.num_lanes;
>> +	u64 bpp = panel->msm_dp_mode.bpp;
>> +	u64 pbn = panel->pbn;
>> +	u64 numerator, denominator, temp, temp1, temp2;
>> +	u32 x_int = 0, y_frac_enum = 0;
>> +	u64 target_strm_sym, ts_int_fixp, ts_frac_fixp, y_frac_enum_fixp;
>> +
>> +	lclk = ctrl->link->link_params.rate;
>> +
>> +	/* min_slot_cnt */
>> +	numerator = pclk * bpp * 64 * 1000;
>> +	denominator = lclk * lanes * 8 * 1000;
>> +	min_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
>> +
>> +	/* max_slot_cnt */
>> +	numerator = pbn * 54 * 1000;
>> +	denominator = lclk * lanes;
>> +	max_slot_cnt = drm_fixp_from_fraction(numerator, denominator);
>> +
>> +	/* raw_target_sc */
>> +	numerator = max_slot_cnt + min_slot_cnt;
>> +	denominator = drm_fixp_from_fraction(2, 1);
>> +	raw_target_sc = drm_fixp_div(numerator, denominator);
>> +
>> +	/* target_sc */
>> +	temp = drm_fixp_from_fraction(256 * lanes, 1);
>> +	numerator = drm_fixp_mul(raw_target_sc, temp);
>> +	denominator = drm_fixp_from_fraction(256 * lanes, 1);
>> +	target_sc_fixp = drm_fixp_div(numerator, denominator);
>> +
>> +	ts_enum = 256 * lanes;
>> +	ts_denom = drm_fixp_from_fraction(256 * lanes, 1);
>> +	ts_int = drm_fixp2int(target_sc_fixp);
>> +
>> +	temp = drm_fixp2int_ceil(raw_target_sc);
>> +	if (temp != ts_int) {
>> +		temp = drm_fixp_from_fraction(ts_int, 1);
>> +		temp1 = raw_target_sc - temp;
>> +		temp2 = drm_fixp_mul(temp1, ts_denom);
>> +		ts_enum = drm_fixp2int(temp2);
>> +	}
>> +
>> +	/* target_strm_sym */
>> +	ts_int_fixp = drm_fixp_from_fraction(ts_int, 1);
>> +	ts_frac_fixp = drm_fixp_from_fraction(ts_enum, drm_fixp2int(ts_denom));
>> +	temp = ts_int_fixp + ts_frac_fixp;
>> +	temp1 = drm_fixp_from_fraction(lanes, 1);
>> +	target_strm_sym = drm_fixp_mul(temp, temp1);
>> +
>> +	/* x_int */
>> +	x_int = drm_fixp2int(target_strm_sym);
>> +
>> +	/* y_enum_frac */
>> +	temp = drm_fixp_from_fraction(x_int, 1);
>> +	temp1 = target_strm_sym - temp;
>> +	temp2 = drm_fixp_from_fraction(256, 1);
>> +	y_frac_enum_fixp = drm_fixp_mul(temp1, temp2);
>> +
>> +	temp1 = drm_fixp2int(y_frac_enum_fixp);
>> +	temp2 = drm_fixp2int_ceil(y_frac_enum_fixp);
>> +
>> +	y_frac_enum = (u32)((temp1 == temp2) ? temp1 : temp1 + 1);
>> +
>> +	*p_x_int = x_int;
>> +	*p_y_frac_enum = y_frac_enum;
>> +
>> +	drm_dbg_dp(ctrl->drm_dev, "MST lane_cnt:%llu, rate:%llu x_int:%d, y_frac:%d\n",
>> +		   lanes, lclk, x_int, y_frac_enum);
>> +}
>> +
>> +static void msm_dp_ctrl_mst_stream_setup(struct msm_dp_ctrl_private *ctrl,
>> +					 struct msm_dp_panel *panel)
>> +{
>> +	u32 x_int, y_frac_enum;
>> +
>> +	if (!ctrl->mst_active)
>> +		return;
>> +
>> +	drm_dbg_dp(ctrl->drm_dev, "MST stream channel allocation\n");
>> +
>> +	msm_dp_ctrl_mst_stream_channel_slot_setup(&ctrl->msm_dp_ctrl);
>> +
>> +	msm_dp_ctrl_mst_calculate_rg(ctrl, panel, &x_int, &y_frac_enum);
>> +
>> +	msm_dp_ctrl_update_rg(ctrl, panel->stream_id, x_int, y_frac_enum);
>> +}
>> +
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
>>   				  struct msm_dp_panel *panel,
>>   				  bool force_link_train)
>> @@ -2708,6 +2865,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>>   	if (!ctrl->mst_active)
>>   		msm_dp_ctrl_setup_tr_unit(ctrl, panel);
>>   
>> +	msm_dp_ctrl_mst_stream_setup(ctrl, panel);
>> +
>>   	msm_dp_write_link(ctrl, REG_DP_STATE_CTRL, DP_STATE_CTRL_SEND_VIDEO);
>>   
>>   	ret = msm_dp_ctrl_mst_send_act(msm_dp_ctrl, panel);
>> @@ -2760,6 +2919,39 @@ void msm_dp_ctrl_off_link(struct msm_dp_ctrl *msm_dp_ctrl,
>>   	phy_power_off(phy);
>>   }
>>   
>> +void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
>> +				      enum msm_dp_stream_id stream_id,
>> +				      u32 start_slot, u32 tot_slots)
>> +{
>> +	struct msm_dp_ctrl_private *ctrl;
>> +
>> +	if (!msm_dp_ctrl || stream_id >= DP_STREAM_MAX) {
>> +		DRM_ERROR("invalid input\n");
>> +		return;
>> +	}
>> +
>> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> +
>> +	ctrl->mst_ch_info[stream_id].start_slot = start_slot;
>> +	ctrl->mst_ch_info[stream_id].tot_slots = tot_slots;
>> +}
>> +
>> +void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl)
>> +{
>> +	struct msm_dp_ctrl_private *ctrl;
>> +	int i;
>> +
>> +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>> +
>> +	if (!ctrl->mst_active)
>> +		return;
>> +
>> +	for (i = DP_STREAM_0; i < ctrl->num_pixel_clks; i++) {
>> +		msm_dp_ctrl_mst_channel_alloc(ctrl, i, ctrl->mst_ch_info[i].start_slot,
>> +					      ctrl->mst_ch_info[i].tot_slots);
>> +	}
>> +}
>> +
>>   irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
>>   			    struct msm_dp_panel *panel)
>>   {
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index 6de028da85fb..e1d10ae20f70 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -61,4 +61,8 @@ void msm_dp_ctrl_reinit_phy(struct msm_dp_ctrl *msm_dp_ctrl);
>>   int msm_dp_ctrl_get_stream_cnt(struct msm_dp_ctrl *dp_ctrl);
>>   int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl,
>>   			     struct msm_dp_panel *panel);
>> +void msm_dp_ctrl_mst_stream_channel_slot_setup(struct msm_dp_ctrl *msm_dp_ctrl);
>> +void msm_dp_ctrl_set_mst_channel_info(struct msm_dp_ctrl *msm_dp_ctrl,
>> +				      enum msm_dp_stream_id stream_id,
>> +				      u32 start_slot, u32 tot_slots);
>>   #endif /* _DP_CTRL_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index acb581a8a541..36857d6ed313 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -749,6 +749,20 @@ static int msm_dp_display_disable(struct msm_dp_display_private *dp,
>>   	return 0;
>>   }
>>   
>> +int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
>> +				   u32 start_slot, u32 num_slots, u32 pbn)
> 
> Why is it a display function rather than a panel or a control one?
> 
>> +{
>> +	struct msm_dp_display_private *dp;
>> +
>> +	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>> +
>> +	msm_dp_ctrl_set_mst_channel_info(dp->ctrl, panel->stream_id, start_slot, num_slots);
>> +
>> +	panel->pbn = pbn;
>> +
>> +	return 0;
>> +}
>> +
>>   /**
>>    * msm_dp_bridge_mode_valid - callback to determine if specified mode is valid
>>    * @dp: Pointer to dp display structure
>> @@ -1489,6 +1503,8 @@ void msm_dp_display_atomic_enable(struct msm_dp *msm_dp_display)
>>   
>>   	dp = container_of(msm_dp_display, struct msm_dp_display_private, msm_dp_display);
>>   
>> +	msm_dp_display_set_stream_info(msm_dp_display, dp->panel, 0, 0, 0);
> 
> Why is it being called in the SST case?
> 
Will move this.  In SST case, we don't need to set stream info.
>> +
>>   	rc = msm_dp_display_enable(dp, dp->panel);
>>   	if (rc)
>>   		DRM_ERROR("DP display enable failed, rc=%d\n", rc);
>> @@ -1509,6 +1525,7 @@ void msm_dp_display_atomic_disable(struct msm_dp *dp)
>>   	msm_dp_display = container_of(dp, struct msm_dp_display_private, msm_dp_display);
>>   
>>   	msm_dp_ctrl_push_idle(msm_dp_display->ctrl);
>> +	msm_dp_ctrl_mst_stream_channel_slot_setup(msm_dp_display->ctrl);
>>   	msm_dp_ctrl_mst_send_act(msm_dp_display->ctrl, msm_dp_display->panel);
>>   }
>>   
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index e987de80522c..45e2cc2d6add 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -43,5 +43,7 @@ void msm_dp_display_atomic_enable(struct msm_dp *dp_display);
>>   enum drm_mode_status msm_dp_display_mode_valid(struct msm_dp *dp,
>>   					       const struct drm_display_info *info,
>>   					       const struct drm_display_mode *mode);
>> +int msm_dp_display_set_stream_info(struct msm_dp *msm_dp_display, struct msm_dp_panel *panel,
>> +				   u32 start_slot, u32 num_slots, u32 pbn);
>>   
>>   #endif /* _DP_DISPLAY_H_ */
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
>> index e0c0e8c9178c..ef2ded8ec4ea 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
>> @@ -57,6 +57,12 @@ u32 msm_dp_stream_reg(enum msm_dp_stream_id id, u32 reg)
>>   		return is_s1 ? REG_DP1_ACTIVE_HOR_VER : REG_DP_MSTLINK_ACTIVE_HOR_VER;
>>   	case REG_DP_MISC1_MISC0:
>>   		return is_s1 ? REG_DP1_MISC1_MISC0 : REG_DP_MSTLINK_MISC1_MISC0;
>> +	case REG_DP_DP0_TIMESLOT_1_32:
>> +		return is_s1 ? REG_DP_DP1_TIMESLOT_1_32 : REG_DP_MSTLINK_TIMESLOT_1_32;
>> +	case REG_DP_DP0_TIMESLOT_33_63:
>> +		return is_s1 ? REG_DP_DP1_TIMESLOT_33_63 : REG_DP_MSTLINK_TIMESLOT_33_63;
>> +	case REG_DP_DP0_RG:
>> +		return is_s1 ? REG_DP_DP1_RG : REG_DP_MSTLINK_DP_RG;
> 
> Get all registers handled by these functions at once. There is no need
> to keep it being patched over and over again.
> 
Got it. I'll split the register definitions and this function into a 
separate patch in the next revision, and place it before the patch that 
introduces multi-link support.
>>   	case MMSS_DP_SDP_CFG:
>>   		return is_s1 ? MMSS_DP1_SDP_CFG : MMSS_DP_MSTLINK_SDP_CFG;
>>   	case MMSS_DP_SDP_CFG2:
>> diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
>> index dc046fec24fc..3e78af9e430d 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_panel.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_panel.h
>> @@ -50,6 +50,7 @@ struct msm_dp_panel {
>>   	u32 hw_revision;
>>   
>>   	enum msm_dp_stream_id stream_id;
>> +	u32 pbn;
>>   
>>   	u32 max_bw_code;
>>   };
>> diff --git a/drivers/gpu/drm/msm/dp/dp_reg.h b/drivers/gpu/drm/msm/dp/dp_reg.h
>> index deb40ed24654..f2bd96f3bbd0 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_reg.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_reg.h
>> @@ -338,7 +338,13 @@
>>   #define DP_TPG_VIDEO_CONFIG_BPP_8BIT		(0x00000001)
>>   #define DP_TPG_VIDEO_CONFIG_RGB			(0x00000004)
>>   
>> +
>> +#define REG_DP_MSTLINK_DP_RG			(0X0000011C)
>>   #define REG_DP1_CONFIGURATION_CTRL		(0x00000400)
>> +#define REG_DP_DP0_TIMESLOT_1_32		(0x00000404)
>> +#define REG_DP_DP0_TIMESLOT_33_63		(0x00000408)
>> +#define REG_DP_DP1_TIMESLOT_1_32		(0x0000040C)
>> +#define REG_DP_DP1_TIMESLOT_33_63		(0x00000410)
>>   #define REG_DP1_SOFTWARE_MVID			(0x00000414)
>>   #define REG_DP1_SOFTWARE_NVID			(0x00000418)
>>   #define REG_DP1_TOTAL_HOR_VER			(0x0000041C)
>> @@ -359,8 +365,12 @@
>>   #define MMSS_DP1_SDP_CFG			(0x000004E0)
>>   #define MMSS_DP1_SDP_CFG2			(0x000004E4)
>>   #define MMSS_DP1_SDP_CFG3			(0x000004E8)
>> +#define REG_DP_DP0_RG				(0x000004F8)
>> +#define REG_DP_DP1_RG				(0x000004FC)
>>   
>>   #define REG_DP_MSTLINK_CONFIGURATION_CTRL	(0x00000034)
>> +#define REG_DP_MSTLINK_TIMESLOT_1_32		(0x00000038)
>> +#define REG_DP_MSTLINK_TIMESLOT_33_63		(0x0000003C)
>>   #define REG_MSTLINK_SOFTWARE_MVID		(0x00000040)
>>   #define REG_MSTLINK_SOFTWARE_NVID		(0x00000044)
>>   #define REG_DP_MSTLINK_TOTAL_HOR_VER		(0x00000048)
>>
>> -- 
>> 2.43.0
>>
> 

