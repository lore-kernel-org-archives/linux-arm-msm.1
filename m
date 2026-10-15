Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4079148C41B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792060143; cv=none; b=o4EB7LowDa05HSTClLsPlHbcLvMKiLb5mH7rvuGcN2yJZ2jJyrCVLq1U8IegmF3fH+KzZwiabkLGfNTEw6EcoLtBn8zfCO+KYFB0eJk9p64xr3z93oVOVAjq4Rg/cm+NTk9CMWuQk25hJOMfpWTzarVR7ry+aOyGCEzSMQvwnvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792060143; c=relaxed/simple;
	bh=v1MPxwn4sCW5NbEW5LL692k3dMas+O8Mf47qVF9FQvE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RFykOpC6sL7wskgvA1GLAVMmg6pOxKb3G+txRt+5Xo7Gz6P84VFo1NxKoHQ4KaCnfFcRKP/t4wHehuxPTCrD5havY+m/FUsjuXbnhEtP/z6lJiMzL9HuyJAAF4TC58T7iMU13405aiO8/j9v5pYTzbY04MpIw9RJM6WbP65wBPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S/iOEuIx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ff5ceVmn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S/iOEuIx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ff5ceVmn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jZS12966414
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZK+0FUJaqF1U29xJtyKMuQjx1J7qvdo5xAWj63A0zyY=; b=S/iOEuIx+4KUiWdA
	rGPRbJD6JVBOhU48iuOR9KlYXiZYxF07LGdb0x81+QFWyKg6gYWYfiuzwmRVJ63Q
	v8F1yBxYx+Da7WbAg37PKDOvvmNPDKxxsEBesPQbuTSjxqaF+0nuWykfh2NC5z1s
	m896EAyNwuBiRPdRuYtQqpY0ZVGGCkni+q9D+QLTGFGSFsWqpM8IbxKvdYnYXir+
	0KGIBCDteWbOk2WDU87pLOOG7oy5rIx/J/J1/L0kdPhNvnCZ7AqxbZ9/4iVL0gsS
	IiNGrlW6me0jODoG/cYdpMTsCqu2FWlxmbjZglHgV8nLC2u1hsnWPma1kbUt+Sjx
	VJ6uAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wujkr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 10:29:01 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2df8484f12cso59766165ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 03:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792060140; x=1792664940; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZK+0FUJaqF1U29xJtyKMuQjx1J7qvdo5xAWj63A0zyY=;
        b=ff5ceVmn0hqq4e/rIjZMOodayzZzKHJBeAQjNEqEu89Sphy9nyXjLnoi/ShfKZ24Qu
         O1f/ge+YeYKMvdcBBcHIV6zRhOok36nXDK4tFfDmp/spNmuG4u0gmyrE6y4Op/u2Z4Uk
         Itnu0faCBLVAFzpcnp7UOXe7++Y2pQ2ymJOypwqUrjijL5UX3C/AUX/hrfzrJ7NZ4KW/
         gmb/bxhw3QBAbO63rn0vjLn5j/LWvpBvY5EYmnFqKQX+dlC3MvzG/4ljnr4Af5ywNJZj
         vtWhSLTh6dv0XD2MN9Iu5cxAwCP9CRzji8hH9apZ8j7vD4xsE/DGVsNLrj/DdGDdHwds
         of7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792060140; x=1792664940;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZK+0FUJaqF1U29xJtyKMuQjx1J7qvdo5xAWj63A0zyY=;
        b=0iJpgzp7IqRptCftGWwITg/BaeSYfxg7+4vMNPHVdDLz8nUPSSbHopICacoez5HFxU
         Dl73apWmotfdSouYjbmEju8nwLRuVYp/6oTO1N8IMfWHjsPZcwdrff19haesSTZxz6oA
         1g2ALVwBRDL2I3C5ni+mFjp1/TcfVfrTj2D1F4hj+CaQ10BRLT8eGwJW1UsSrh5sn1QW
         WI7BKUAiwMKRjdfduDSUr5SaxDOfp4EYKqsf2YOm5Ik+hKKQSupFGlXp06JU52em91yc
         PQYakFdnhWDNuY9SYYezKHjFwHorrgQTebTqp8e0A1I7KcFk18CZ/Piuv1cglwqYNZSi
         XjiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxqPpqTkKClqMHuz5VqApw0orJDvEE95j2mBf0bP6Xlr4nmIysjiDkETSD14BGLJe2dv2EvV1G9ay+P53cv@vger.kernel.org
X-Gm-Message-State: AFq9FYJy7RkeC02KaX1MOUCWk9QO2MPDEofvvPtpSY+r5s4d8gbpSeG0
	PY5wjOrnNyvHXF+9upHmv8xf2fPTRhroLJWwD3h6T3FeCAqF+goxBD0YOm1mVkC38fMxgnkN08j
	BWg+f/4OD75OvapMz8PLa28MsG6TKu64ueAk3ZIyGMrdscoBC9EA98PzOGi82e2RaU0+d
X-Gm-Gg: AYBFou1+n9k0TJXh+IGM/vwLzs6QczJ4wBq5rpaH2hHDaKAJEIrfSVum2RImjfmRd5l
	TSxJ8b71Ww1OkRSq6aXyopO6uu8CPlIIV1exP2o1rLVsaTNzhI6ab1k8i2AZ9Hc+BIMHlb9PS6s
	NMPPWs0gd5zzfP3c8a/87K24jI6Oy1y2FLf4Grmb8sik/Z1Zlz2VtlD6dKyGNw1cKvCmpSeHAHX
	87tx9WbICiMBQ4IhWZ6mg3Cay8b8vTq9iDTetPRFGG6IAQfOe1NmP+1hP3HRRcuJf/f8VfpSlpZ
	lHuOvTSJJKVuPAtU+yA6lohewg4zjO8C+DjryzMeLFd2+vtKPvjNHMzE3CldyEp6dnZiIWX44pH
	hDKkce1cOsvifDT2oPCzSXKKTtIM=
X-Received: by 2002:a17:902:cec2:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2e842e02a57mr148391875ad.61.1792060139973;
        Thu, 15 Oct 2026 03:28:59 -0700 (PDT)
X-Received: by 2002:a17:902:cec2:b0:2dd:c0ff:e72b with SMTP id d9443c01a7336-2e842e02a57mr148391435ad.61.1792060139204;
        Thu, 15 Oct 2026 03:28:59 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e8422ba80asm80869785ad.63.2026.10.15.03.28.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 03:28:58 -0700 (PDT)
Message-ID: <ebf962ad-6b55-4741-bbb3-783f56c1106f@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 18:28:52 +0800
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
 <3c28f89e-8b49-4937-b4c8-66da180a5706@oss.qualcomm.com>
 <fx5njelx53gciz6rguzjybxgbyxbfqweelsuy4j3aab2n5awrf@n27xvmre7ztu>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <fx5njelx53gciz6rguzjybxgbyxbfqweelsuy4j3aab2n5awrf@n27xvmre7ztu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfX9RxoffHcD5X8
 Ah0yHWFrgHi5MacJgjWQQdCoys+hNJvHaLVQkHZilaBAhg5Y71X8nGKykd9qLgzxAbldSbVHCeF
 yZOCQi4GthfbGNtkZ0R87ve18EqQTU0=
X-Proofpoint-ORIG-GUID: 4j5M5qDbZsvTBNEIersEFcJlXFElkx2b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA0MSBTYWx0ZWRfXwUlUUdUhM6sj
 Al0yBnENeCYp5VNMVEv20bfGUvFcDA2J/wg2Eh3ZuHTd8FUdsJ/XrImWstVBI92MwhkZlR0oeCH
 ivoygZHJ4zDhVRvHFfWlhXdpWNJUVn7hAcFu145rUoS4KCemZT7pFw8RIxHIXoQZTnLiRRzWDbY
 h/IssJA+/+GJwRki6ILAAYsARoSqKtGVnjHFLRfnaKICp26mcjhQQHRKBiM003HxDR/iZuOXcIB
 w5dLC/h8oImz7j312mbTfh07xRd8dSnDEhEnRxQjG1vCVMrv+wfDPF5uwqDzyYFZBGWPvBxBBSM
 q7rm/4fbp8V9xhLQAq5Yj0mVMsYUpenbumrUjmN/TPA+YcAYkRx71e/z+RrRISm92AxXfrk/tZS
 dyKRqh08UbausU0jGGYMsFMGrz/GSjCsLbJq/z/9p23/Tt/dQwXd26yJhSPzLCSivdHuoKlbC0P
 7faMV9umyGhvGjdRBAQ==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0aaed cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=laV4OcfiDC6K5KK7Cz4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4j5M5qDbZsvTBNEIersEFcJlXFElkx2b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150041



On 10/12/2026 8:23 PM, Dmitry Baryshkov wrote:
> On Mon, Oct 12, 2026 at 04:44:06PM +0800, Yongxing Mou wrote:
>>
>>
>> On 10/1/2026 6:32 PM, Dmitry Baryshkov wrote:
>>> On Tue, Sep 29, 2026 at 12:25:32PM +0800, Yongxing Mou wrote:
>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>
>>>> Whenever virtual channel slot allocation changes, the DP
>>>> source must send the action control trigger sequence to notify
>>>> the sink about the same. This would be applicable during the
>>>> start and stop of the pixel stream. Add the infrastructure
>>>> to be able to send ACT packets for the DP controller when
>>>> operating in MST mode.
>>>>
>>>> Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
>>>>
>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>>>>    drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>>>>    drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>>>    drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>>    drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
>>>>    5 files changed, 51 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> index e1614bc49a7c..65d22505c2b6 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>>>>    	bool core_clks_on;
>>>>    	bool link_clks_on;
>>>>    	bool stream_clks_on[DP_STREAM_MAX];
>>>> +	bool mst_active;
>>>
>>> I really don't like the idea of having this flag in two locations. Here
>>> and in the msm_dp_display_private. Can we have it in one place only?
>>>
>> These two fields are intended to represent different states with different
>> lifetimes.
>>
>> msm_dp::mst_active tracks whether the DP connection has an active MST
>> session. The controller field records whether the current controller/link is
>> operating in MST mode and remains valid until the link is shut down.
>>
>> I agree that using mst_active for both fields makes them look like
>> duplicated state. I propose renaming the controller field to mst_mode while
>> keeping the display-side field as mst_active.
>>
>> Would you agree with this change?
> 
> What is the difference between these two? I.e. what os the difference
> between those two?
> 
The difference between these two states mainly shows up during unplug. 
mst_active is cleared when dp_display starts handling the unplug, while 
dp_ctrl needs to keep the MST state until all streams are disabled and 
the link is shut down.

So there is a period during teardown where these two states are 
different, which is expected.

My concern with keeping only one state is that we would need to pass the 
MST mode through multiple dp_ctrl APIs, which would make the code more 
complicated. Would it make sense to keep this state in dp_ctrl and 
rename it to mst_mode to make the distinction clearer?
>>>>    };
>>>
>>> [...]
>>>
>>>>    static void msm_dp_display_unprepare(struct msm_dp_display_private *dp)
>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.h b/drivers/gpu/drm/msm/dp/dp_display.h
>>>> index 83117e7619f3..472429d09200 100644
>>>> --- a/drivers/gpu/drm/msm/dp/dp_display.h
>>>> +++ b/drivers/gpu/drm/msm/dp/dp_display.h
>>>> @@ -19,6 +19,7 @@ struct msm_dp {
>>>>    	struct drm_bridge *bridge;
>>>>    	bool audio_enabled;
>>>>    	bool power_on;
>>>> +	bool mst_active;
>>>>    	unsigned int connector_type;
>>>>    	bool is_edp;
>>>
>>
> 

