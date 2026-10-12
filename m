Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4D044CF52
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791794656; cv=none; b=pLKPtmCyaDS4mZ7fSrRX5V2+/+lwgnrP8S1R/DMoPwpQ6w654dvS/lTvi40AFuUZqjKTRL6IGqtvd77SrQDkH5Dj7ChHTw4wMuQ6G9dcWShoOb6R5j2U6tViovu5vPRogGTrNMux8X4osB9IYV9A5leYPHM2mXs4UiBChelqP5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791794656; c=relaxed/simple;
	bh=RXqvJkUmC7zN/V2K+XiNWWgBkFCnWAJVf9UZod5Dsaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UnG8I5TZdhQc38nkGaXG6NLvXJJ5bHiHSVsJB85SJppIPKU6ozK8qQ878rgFbeKw+nN7KyfDqELRkon6yK2XBKbo9REc0WBVntoKDYXP8t+jUfQh9Q/tpNtZqxdfpxT7uqCK9pvVcXasuR8yWpN7BI7MQ5xvUE+anLXg6V+IipE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TI/f+71o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EtO3UpS5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TI/f+71o";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EtO3UpS5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KaJQ2873937
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y8ppqiJky8MVWsFGfbBMBrD30oFhk9S3lgnHFDVpbFg=; b=TI/f+71ocIV7xEfr
	Pz6XvHWCbtyXpQ6j9aTj95e0Obnxj9+0i3IHjeSyQFzOhBBj4HQ5PYvQwY30Ru/L
	aB2dlzbnkzkZFMG5Gq87f/EX4eC12TbD6y2msF06FhmEB2cuC6QnLD+oVZaWxxdd
	zOuW+71vcucC0RgQMsrL2o8anEpEhE+NbincLPbf8ZZTcZySjG9J6Y663YqQEtf5
	vBogQf8albLnUCLNm0RPou5kN3zTaHRHiakJqRfn3OAelU3MKsvgwpmsQu3lAGjj
	YiT7TPQSbvHf7Z9D+bPpyIw29IRlBcICGubmon8TkUGdvIUiuPZg0voQY3IBwiLQ
	u/DTgw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7b2fe1a4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 08:44:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so2281345a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791794654; x=1792399454; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y8ppqiJky8MVWsFGfbBMBrD30oFhk9S3lgnHFDVpbFg=;
        b=EtO3UpS5UfwD98EZpmJ435zaiPOU88ZnJGbQQbJMbduukQFPym/pXomj2jA6LKqrJ7
         IyIX4JuxUp/Al+owd2KqrQce3eDghA0sWeqrLw29nxfSB4fQWJLiqlMR3aSJkIJp0snz
         ng0Cj+njNvTCtrqRZbf3aYMl6YpZSkwtZ1lJKPbd2qAeJGdwEbSsFfUa643WVvaVyhAl
         WUEWijYesXU7IbJeLVUBBxm8yw611zbCddB3MAt1dRm/HPLMDoPEJ+MYu3VwIKLZcneB
         U1Am+HaJzupekIIbo1BQuJYv1X8acpsln6WlXpr/EnE4u+eBHwY47uszzPHfZGF2Y+CM
         fKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791794654; x=1792399454;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y8ppqiJky8MVWsFGfbBMBrD30oFhk9S3lgnHFDVpbFg=;
        b=ixBzZsqcpNcWTahjults9fDc4rmwiajENnpsP/uKfW+nwARs3u+fTa/Mkoc0tmP7ew
         g34jYb3ONG5VffFxaiMLaZaecz0N1QY4MmXf46EiChXLmxG1T/C5yS9733RS1tQu9nKL
         bvNjY/FPKQtuBJlXJy8Yd7cWffxGDfJoDTR1Z99quV1pPLx6KFxRVV2oVC1q6JJhOKJS
         3kZ/F82wyB4sStAl4/6AMaO6cTpDEcg+Y2a+Oub+tOjKI+uIrZdCC9alGeKQ0/G2SyJk
         YKVNUMwk3NRL8g3IHbOl06VWdITGuokqV8vMytZtpqw5U7A0fTxKPD8JGup8EbWH4+u1
         S4Sg==
X-Forwarded-Encrypted: i=1; AKwUvBwi/IjjquzjJsog9DLsL2olAnz8ccDf5SvD15p8jQZiFXQ4NBxruMoQfpbFjSfCwxJRtnF9Ef8xxSBV2RBC@vger.kernel.org
X-Gm-Message-State: AFq9FYIz0ObYwgiBppP5ktpctcrn5smuKaKlVCfq6PBMvU4Q7mGyfLcN
	YYdrEDI9L+0pQHOhAPgp+EO05rhXgbYuotsrpQpU8+rz86l2BLwpsbcDKBdUQwIpddEV+riKC4G
	bumqXcAHgmfu3LcTg26KblXqVyNbuI5ClMU9MBHg+5ZHzjJFPQZeT6lYPleaNyooj5gYQ
X-Gm-Gg: AYBFou1RSMsTlbC/zmNiyjBViMxyiedvRW26LikcQ81KxUBd5Rw+QWY0Oxx+gjAjZrq
	k9b4LzwWME8STDV7a0tA13N31ba7vQtUvw7ukebBC9R1s1TV3emwJkQf/qSh3Qlu+9DOmioyf3x
	OvQOdIN41v2lF28lcWkbs/nh+k8QL6GQTtJRR5ns/0FG0W7TOI7ic3mkY1WvRHD3lBKEz/Wku1R
	TmoBdtI4GM1TQ+PCcxk2dJJ1cUwBeIiISgT5aGHSdPU6QjbV/BI0CYa/IPJ19nlkV8nY1/A6wv+
	t/xVp1nZqUxlmht5DzNyEMTvEeQbV0kjD97eXhyfPQ/w2Q04kLOdaqYDWDOBfckkXBnkizRxOye
	2I1OYB7CCNvVxaKjzUH07xsq/GhvP/cm40pd43ObArYJaIksw9TdQ1W234LLHAwxGewX5bw==
X-Received: by 2002:a17:90b:4d86:b0:3a6:d8e0:c359 with SMTP id 98e67ed59e1d1-3ab3a2fe039mr7006565a91.2.1791794653589;
        Mon, 12 Oct 2026 01:44:13 -0700 (PDT)
X-Received: by 2002:a17:90b:4d86:b0:3a6:d8e0:c359 with SMTP id 98e67ed59e1d1-3ab3a2fe039mr7006544a91.2.1791794653066;
        Mon, 12 Oct 2026 01:44:13 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3abe588fa31sm5195536a91.14.2026.10.12.01.44.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Oct 2026 01:44:12 -0700 (PDT)
Message-ID: <3c28f89e-8b49-4937-b4c8-66da180a5706@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 16:44:06 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/35] drm/msm/dp: add support to send ACT packets for
 MST
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
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-8-4b81473185e7@oss.qualcomm.com>
 <aolbmfnrk6qkfifib6bmhslaro5z2734ydfip4mnn3go4efpsy@2d4m6nnh7ogv>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <aolbmfnrk6qkfifib6bmhslaro5z2734ydfip4mnn3go4efpsy@2d4m6nnh7ogv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX2/6/zy5/yG8r
 wVbybRhK5CxXnDw5IYl2YpVP8J03vKQ9w2NRqEiSOoYJNV7FHoWuW69zK2gDSwqwRVpquGqt5ZW
 MHSs+Si23JXp5kv2RyLsccwkuW8Mvek=
X-Proofpoint-GUID: GahVETtBMumAiImorzIKAV70qlAGdUXL
X-Authority-Analysis: v=2.4 cv=NddzRGD4 c=1 sm=1 tr=0 ts=6acc9dde cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=G1Bnig19-K7uSukdqRAA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNCBTYWx0ZWRfX4H3zHZdEqlFI
 Z/DD6UZtvOCrj7DoZfoG5tKRzxMoX9RJIrwTa7ZBLtGl2t0gV1VcDQUp7gY9leU632kx4JNmDYN
 J8YG6uOSHpShyGuXwx/yQA+7baNLR6cj/eb/vlGQIcSXb4IoB/q54Dps/Vr2XfGcGLcL79O8ra+
 fsxUfKTd3b3u3s5Cb0FWk4d4qGIiqUsFv/RQb/O+Ypu3fDsimod0pMpPych9ad89fYMVZuhiHwR
 AqVkRW3NNRSy0tZG7pBD85V8Zx+JHzPENmkHOSMg8fJdvcYM4r6BIdjHRt3Ld/tc8W9hpoSQI9Y
 DI033QerHf4qE2SEuhgXuJ1aQwHTk5KFycHgFMOfcBigBgXJTj86KdDOM+LPJ5eaZsvPuAbNAbj
 uP7nSznJ2tuIrpJDbC6vK2NlO6QmrzFgsj+cRGT5MvhJtfb0H5/8Wm78oKpPJGA7TXWw7g4/wKh
 FUINc3XXFCl7V5yTDkg==
X-Proofpoint-ORIG-GUID: GahVETtBMumAiImorzIKAV70qlAGdUXL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120034



On 10/1/2026 6:32 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 29, 2026 at 12:25:32PM +0800, Yongxing Mou wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> Whenever virtual channel slot allocation changes, the DP
>> source must send the action control trigger sequence to notify
>> the sink about the same. This would be applicable during the
>> start and stop of the pixel stream. Add the infrastructure
>> to be able to send ACT packets for the DP controller when
>> operating in MST mode.
>>
>> Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>>   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>   drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
>>   5 files changed, 51 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index e1614bc49a7c..65d22505c2b6 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>>   	bool core_clks_on;
>>   	bool link_clks_on;
>>   	bool stream_clks_on[DP_STREAM_MAX];
>> +	bool mst_active;
> 
> I really don't like the idea of having this flag in two locations. Here
> and in the msm_dp_display_private. Can we have it in one place only?
> 
These two fields are intended to represent different states with 
different lifetimes.

msm_dp::mst_active tracks whether the DP connection has an active MST 
session. The controller field records whether the current 
controller/link is operating in MST mode and remains valid until the 
link is shut down.

I agree that using mst_active for both fields makes them look like 
duplicated state. I propose renaming the controller field to mst_mode 
while keeping the display-side field as mst_active.

Would you agree with this change?
>>   };
>>   
> 
> [...]
> 
>>   
>>   static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>> index 83117e7619f3..472429d09200 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>> @@ -19,6 +19,7 @@ struct msm_dp {
>>   	struct drm_bridge *bridge;
>>   	bool audio_enabled;
>>   	bool power_on;
>> +	bool mst_active;
>>   	unsigned int connector_type;
>>   	bool is_edp;
>>   
> 

