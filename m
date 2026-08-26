Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C3E3B6C0A
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787730537; cv=none; b=AkxQvDdgBaBXnu8rF7k5dTNc1wlmUkilqL42JXxCLso3dLbP9XhNWw1byc9xM6rEycj2wyJPGBRbXAA1nD9+tVbeMpfwGlh/eLZPQAdQ9BzfR0ZTxhH/v1HNKpzucob99C4d+zJJzbAaMohsQ/PDwewHCgGE3909pf4lERvlvLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787730537; c=relaxed/simple;
	bh=hck3B2y3UXl1s+y50vyu9Xg9ARl84LG3Fv8C4fhP2i8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/v3J3wZomkX2BD7pJhnjCeXMJBf39Q1N5Wt73WWOJ4nFO01o0X8ETKN3OsJi3mZN+xH1lCkBq4uu7Jf4xXuebrFBPjEd45eGqYHgWvmEE9QJtSZvb+rcuMRsL+npepoxITopLRoMS2dkr+8qNMhojKd1J1hT/xyciGbZgdrGxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HXGj+kzO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LIVs82ps; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HXGj+kzO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LIVs82ps"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67Q6S6tY4189901
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voO0QQTgVbHKHOvzivClVeHFhl/PfTaZ+unD1L+XyPs=; b=HXGj+kzOH6ACsxAa
	lHm/tqBMZ1PPht/BCiVnYgde10I9xzM1OSyaB++SRn62UwIPAwVafcaGjAPhw3cL
	xwH3zbGyAE+lDy8co1hnXUK4Sd74FIp+S1RAe+cp4Hp2ulMszP4CDqeqSgsx6kC/
	njI5D3ZwWcuYRKByiCPASGabmEZdD2W/jxPhpFlEnpORrCPh0oSz6QfFqncKOhPL
	EmD01Cx/fxoKSuX2ZbnFdI6EOy2EUxXtGcA1Fs03swrOTWCJbdOJ5a9C7v07htKP
	UKHB9VcN5HsR+9vwpTgPF9AHUM9MkVvuzqpZUoPRH9N09Nmrq1b9gxP5C4P2d45q
	+KMxVQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9cgpumt1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 07:48:54 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39512608fb1so1855793a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Aug 2026 00:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787730534; x=1788335334; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voO0QQTgVbHKHOvzivClVeHFhl/PfTaZ+unD1L+XyPs=;
        b=LIVs82ps4mOuH9TyXJkiw6dPIjGoV7PZKu1TsvBPNriZxAUIJu47+q4F6cRSvN3zAR
         5ejaO+a30bXl+8+OhoChxyM93kBrQL0+TkrilDaO5DvzHnBUbX9XvczS1+0PHlV/xEAA
         myMRj8YzqxfpETnuCWmTauuz8VS4mANGaqf9eea3U6api29CQRaGwogg7os43Iyzt3vO
         Qv3CY5asG5QX8qyzFaSgPzuV4+XX251UVj38m7NaSt5//mXI3IKfcEWvSTKepokU3XIW
         BN9NuGzqCt+gMt2f6tCdA05vmpJb7HXxvTK4+f9MM0rdfAYo18W7ugQmMnt0oj6IpbfZ
         3m5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787730534; x=1788335334;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voO0QQTgVbHKHOvzivClVeHFhl/PfTaZ+unD1L+XyPs=;
        b=iToYIYBbbqIpL0YdJjTc/ADzNQa9S6eQocLBnyYQObDacnNKhFJ28291SUpUTo0/l/
         LBdtzH2xO+1ejQ5PiVBG6aQODyrY3M5L8T95ucbpG6FlMPJvKztGS3S+fy7RrtGRJWxG
         cb68Ul3sLWf73yfnoSrpwV8ekN827F7GOwCf1jQO+PP6Y+khPzbHp4Z5X4PRHfTTSGGn
         ozItuXd3Mctn6hlN4zrkcXTVtijc7qDJW8ozC9gO5zfrdJz6/+U1PInTxCWRKmF2V031
         +OBBWWOx3DwLf6yWJwOkkGr3z4bcflu0jAQ0SBqEHxFvIsIn5NhywxRp3Ys1Bn8fOmdV
         N9BQ==
X-Forwarded-Encrypted: i=1; AHgh+RrnW6UB2Z0e9kNgZ30ZD7lkJQVpyfDU3sBTcMCavziUyDO6HFh1zsTyZFq1liJYEyrZUI0T3h0ROe6z02Ac@vger.kernel.org
X-Gm-Message-State: AFuF++lH9yBdspbNbjP0Iqj40IFbf86VqpljgGCuo3pxLG3xN/mPMboL
	n7vPomE48YW3RPaMxQFZ4Ead93TV+N6bjoFnRsZm8067Dik/dqDATzLTauEzEXPr34RZc6Y5sNj
	YcJOxb4Za8B7KiMPL61RSqb9QCqX6HPrm7ER9cIC6+096L9EUsj52rhTZYVk6pYJqwtxg
X-Gm-Gg: AR+sD11b+HRawM/uwF0KG66Tx/78yG6l84LgswV0MDYWpWN7drzfn1nSlxae1WBl/Xc
	s1vvFWsB8OYIpHmePTBA4qBaRNBxm9s8tFb4rOuGWHEk7vxQuoEvdqGgrRkv1dZgvrOt84p5QKo
	yHMBESgL7kiuiLEPZcAwlsr7WtFlg4ZLmUpy/q2BBSnelYAlfvF2jjMQQSiaQXhyeHFJzXJCBcZ
	yFgkmn5rl4h0Wa8z3c8UqugUwVQ5xw3WHy0Mk+eGRn1cPjHl5z3VSguNn470veRvsQi4jO3dSm0
	ns7/hl+E/BhnJMLNYS9JUeOlinXmgkAIWpkne4A9MVea5Wq+7EbG1qIb9QmckOAxKdjormCTsYQ
	8qfygLgOlZKt0qk7TlRqwwmKW7QMtVZmdubfZoRAhHjPuBdeD2NwiuHXD3qECrSSB1qYziyzb
X-Received: by 2002:a17:90b:1fd0:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-3966d3ed042mr11270569a91.6.1787730533922;
        Wed, 26 Aug 2026 00:48:53 -0700 (PDT)
X-Received: by 2002:a17:90b:1fd0:b0:38e:70d5:b12d with SMTP id 98e67ed59e1d1-3966d3ed042mr11270482a91.6.1787730533411;
        Wed, 26 Aug 2026 00:48:53 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39668a5832bsm3060969a91.15.2026.08.26.00.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 00:48:53 -0700 (PDT)
Message-ID: <d8a7407a-9c8b-4435-8d99-a46588d52e9a@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 15:48:46 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 21/25] drm/msm/dpu: use msm_dp_get_mst_intf_id()
 to get the intf id
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
 <20260629-msm-dp-mst-v5-21-2ed6aee1867a@oss.qualcomm.com>
 <pnhfi37ijlxuboqritlsg2o6wew44pe7niyhyvxc3dbrdvgazc@dfpldilmrp7r>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <pnhfi37ijlxuboqritlsg2o6wew44pe7niyhyvxc3dbrdvgazc@dfpldilmrp7r>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: OG6xYlFiPKPq0J4l5SKwcpGVzAq41h1m
X-Proofpoint-ORIG-GUID: OG6xYlFiPKPq0J4l5SKwcpGVzAq41h1m
X-Authority-Analysis: v=2.4 cv=I+NVgtgg c=1 sm=1 tr=0 ts=6a8e9a67 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=_xYO84BrWpCsddiSF-IA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX2B5u31F5yP7d
 p9hrlwg1nYfbwgydeVUsN+A/xuZl5NBd0jfm87JFhxkwcn/N+PjeFz6JDx/0SjxhOYp12AbUCVA
 oqBguvQQ4AfgHJDWcH3higVR05hC3ROvzQsBgcv6Redkar/mCjlwzHTxLFULK5xF3lBeTt6XbhZ
 AviaNkcLZhsm9A16rNUgMfBv3m4k82+7xxI7okEobk8Gnt3djUrXOkb4vsZHq8dOpiuScZ0QWTF
 jFiulaganiByzvXlzAoOTrqb9Uw1/tmbK+9bOTzBrAlqQMKK1j5kMKEurifJ9YBlTx4DnmkVUbr
 LVDhPZlQhH9NqN6KHFzdZzkqvJpmaDviova8CbyCS57CDb5qC0b2Kuv3lBWb4IkaBQiUF95Celw
 BTldX1KKiCIvJPk2kUfu08vXClzZaP+LN4ZtIfSSzG3gm5uesNFyTxvoe2ZBmooEsTwaO9JvL0p
 YYSaJuu8+6Zw+QLVrXg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDA2MyBTYWx0ZWRfX7fZuE0RhPERl
 5ZfGkYc7XC1y+FjvyFJRlGaGJijU8ApGb/JsQl5dquNE1DTdLYguCPBwY0Pbf4upqSz0dRmqmx+
 9bdnpMAmey6+ka/aKyh+yJRMohQssFg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260063



On 7/13/2026 8:09 AM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:14:42PM +0800, Yongxing Mou wrote:
>> Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
>> controller as the intf_id is unique for each MST stream of each DP
>> controller.
>>
>> For DSI/eDP/DP SST, the stream_id is always 0, so existing behavior
>> remains unchanged.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 20 +++++++++++---------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  2 ++
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     |  4 ++++
>>   3 files changed, 17 insertions(+), 9 deletions(-)
> 
> This really should have been a part (or done before) the patch adding
> DPMST encoders.
> 
Will splite this patch.
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> index 1c74ff6f0dbd..3adfaeaab71d 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
>> @@ -1438,18 +1438,21 @@ void dpu_encoder_phys_disable(struct drm_encoder *drm_enc,
>>   
>>   static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
>>   		struct dpu_rm *dpu_rm,
>> -		enum dpu_intf_type type, u32 controller_id)
>> +		struct msm_display_info *disp_info, u32 controller_id)
> 
> As you are now passing whole msm_display_info, controller_id is
> available as disp_info->h_tile_instance[i]. Pass index to this function
> instead of passing controller_id.
> 
> Ideally, split this patch into two: one changing the function to get
> disp_info, another one adding stream_id to the struct.
> 
>>   {
>> -	int i = 0;
>> +	int i = 0, cnt = 0;
>> +	int stream_id = disp_info->stream_id;
>>   
>> -	if (type == INTF_WB)
>> +	if (disp_info->intf_type == INTF_WB)
>>   		return NULL;
>>   
>> +	DPU_DEBUG("intf_type 0x%x controller_id %d stream_id %d\n",
>> +		  disp_info->intf_type, controller_id, stream_id);
>>   	for (i = 0; i < catalog->intf_count; i++) {
>> -		if (catalog->intf[i].type == type
>> -		    && catalog->intf[i].controller_id == controller_id) {
>> -			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
>> -		}
>> +		if (catalog->intf[i].type == disp_info->intf_type &&
>> +		    controller_id == catalog->intf[i].controller_id)
> 
> Why did you change the order of the args?
> 
Hmm I'll restore the original argument order in the next revision.
>> +			if (cnt++ == stream_id)
> 
> Squash into the condition.
> 
Got it.
>> +				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
>>   	}
>>   
>>   	return NULL;
>> @@ -2675,8 +2678,7 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
>>   				i, controller_id, phys_params.split_role);
>>   
>>   		phys_params.hw_intf = dpu_encoder_get_intf(dpu_kms->catalog, &dpu_kms->rm,
>> -							   disp_info->intf_type,
>> -							   controller_id);
>> +							   disp_info, controller_id);
>>   
>>   		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
>>   			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> index 25ade3dbbeda..861d69afbd76 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h
>> @@ -28,6 +28,7 @@
>>    * @h_tile_instance:    Controller instance used per tile. Number of elements is
>>    *                      based on num_of_h_tiles
>>    * @is_cmd_mode		Boolean to indicate if the CMD mode is requested
>> + * @stream_id		stream id for which the interface needs to be acquired
>>    * @vsync_source:	Source of the TE signal for DSI CMD devices
>>    */
>>   struct msm_display_info {
>> @@ -35,6 +36,7 @@ struct msm_display_info {
>>   	uint32_t num_of_h_tiles;
>>   	uint32_t h_tile_instance[MAX_H_TILES_PER_DISPLAY];
>>   	bool is_cmd_mode;
>> +	int stream_id;
>>   	enum dpu_vsync_source vsync_source;
>>   };
>>   
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> index 91d33b432427..b32ecd5b0777 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>> @@ -614,6 +614,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>>   			info.h_tile_instance[info.num_of_h_tiles++] = other;
>>   
>>   		info.is_cmd_mode = msm_dsi_is_cmd_mode(priv->kms->dsi[i]);
>> +		info.stream_id = 0;
> 
> It is memset to 0. Drop this (here and below).
> 
Got it.
>>   
>>   		rc = dpu_kms_dsi_set_te_source(&info, priv->kms->dsi[i]);
>>   		if (rc) {
>> @@ -689,6 +690,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>>   			}
>>   
>>   			for (stream_id = 0; stream_id < stream_cnt; stream_id++) {
>> +				info.stream_id = stream_id;
>>   				encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_DPMST, &info);
>>   				if (IS_ERR(encoder)) {
>>   					DPU_ERROR("encoder init failed for dp mst display\n");
>> @@ -716,6 +718,7 @@ static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
>>   	info.num_of_h_tiles = 1;
>>   	info.h_tile_instance[0] = 0;
>>   	info.intf_type = INTF_HDMI;
>> +	info.stream_id = 0;
>>   
>>   	encoder = dpu_encoder_init(dev, DRM_MODE_ENCODER_TMDS, &info);
>>   	if (IS_ERR(encoder)) {
>> @@ -748,6 +751,7 @@ static int _dpu_kms_initialize_writeback(struct drm_device *dev,
>>   	/* use only WB idx 2 instance for DPU */
>>   	info.h_tile_instance[0] = wb_idx;
>>   	info.intf_type = INTF_WB;
>> +	info.stream_id = 0;
>>   
>>   	maxlinewidth = dpu_rm_get_wb(&dpu_kms->rm, info.h_tile_instance[0])->caps->maxlinewidth;
>>   
>>
>> -- 
>> 2.43.0
>>
> 

