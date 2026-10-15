Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60A471A680B
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792070704; cv=none; b=IWIg6evodog7l1zKrc2q0Z5zuj/nRRIl3bhLQUzJLXDfPaMKWcU77TZMTHhXfIL6DGhd4pJMeoD85EPH4C2LQ3Zd7UefgNcTb2aGPmoQHN6/BzaZAv5KLGiMPF+QMjiblxyz1zNA0089W6jFujrdQmu3wZ29WtsBLrNf27cjDRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792070704; c=relaxed/simple;
	bh=QggDlgx80UU6E5gJJGiX2+tKlp8a7hqOIUXaRpgOebQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BsvA6bpJ6dfnZ/8gg1zn50DcCOzKkJTnmvXXuVkxcefTmOalewMAf16HxfwAxw1IppungAqwaw4JXdHL1ZgylwC/gtG5gIsbAFkzDJacOzlDct1prJ3I2T2WnZk4GcalFcdX4g5istLHCiJErFpn4/kE5pzAcIKuH6yQe3/4U8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V6ffvFYr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+ImfXJl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V6ffvFYr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+ImfXJl"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jYY32966392
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:25:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kXzuvyD7vEPKPmhhGzoxroGZUMQEvbNNj+wxq/Ak3M8=; b=V6ffvFYrIJOQL3pg
	a4UkYBPHULoo2vY914IfBEcZtedRpkNIZHo9Gx6V7PPtFdReNYmMz8UJvZBqkTAQ
	oaHnPXO4q6bfFlS6HhKe7f0I6u0/m+aoPvsni3FXrzFspIIQlPkWBjH3tegB+2yJ
	B6U1Ft1E3RkWDNy7JYtQ0zvh2NwtBbKysGWIdtLcV2fH3f5DnV4TbxwSsO6k7dzA
	Usm8Q46C2iM55r93NNf7b2VnKGt441w5JzijLxbon3n1LEIAuDpiF9c+PGimhITe
	3irRwyxMn/j43KlC9Y8vvlPQ3nO2fHCGaM542bDzGg08oRMSpCe2rAkQGXDrVUil
	4YpKZQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hae4wv7xw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 13:25:02 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39b77130a7fso6359173a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Oct 2026 06:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792070701; x=1792675501; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kXzuvyD7vEPKPmhhGzoxroGZUMQEvbNNj+wxq/Ak3M8=;
        b=a+ImfXJloOUcCbzRWOoAQV1HsBec27LCFg4yEj4+W3Sk0TN9i3ynzScLB6GWPpp5Ki
         c/FP3pbVW22dNyvMjDZUq9Mid+84en8MB9OV2cRiAX1kgM2N9vn5jvMwRq4EoB8suHt2
         lidGoMK/2Gk61EHWcwYQK6AHM20ESppuEOD437trLHHfl9bE2cA9A+4UAraQlr1/jVg+
         aE4mE/sJpDRvhHVAI9cB7PEDUWIp/8WZ698Sjuxywm+Dq8+eTVpJ9LP2WETPMMnyJ9Od
         QEWTKJTn/R5E4UIbgr8RyWDmhcJFOhDiSo9Yu0rHBa3XU1qXtQCwTYLxCNY4yv8xOTbb
         OT+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792070701; x=1792675501;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kXzuvyD7vEPKPmhhGzoxroGZUMQEvbNNj+wxq/Ak3M8=;
        b=Reg4/q9Vb9IubEzYRh6PNB3vqLIQxsmSqmE4yg3rngwIavn3IAP407EzktBwBaeW+Q
         CzEt/gq8qzA36zW61shvimk9hRhTvz0ndGXvMBJFJZfr2s09S4wCLDlI48trSLmRzU+k
         sH3ajPQWGSuQ/qsOaIylNqdyRwAGJwptGbaaqLDTRHe7fIRACb3rl2HM3NdjtQKyKLX4
         FydgfaM3YQboXycTQ2JycgsX3eM3KNLU7tUDFLCjuIZEBb5rvsdZ3ZQZtiRC4R31a+Ne
         Hxgx7iZf6CTQDkouvUsD2OfSv9tXSF7X0gq5DsB8YrADYy0zCf0IslLhxkvFaCriXmgS
         JAeQ==
X-Forwarded-Encrypted: i=1; AKwUvBwHeel8+HOvHGDaqBoaPbxoDXCxR57Hj1N3QzsW/l2TX62ZyS7pKR/U5oBFCOeZVUqfbvtW4ukRDU0R9MHd@vger.kernel.org
X-Gm-Message-State: AFq9FYJPbFpg7AMj4t0pcVIDeCSjaSbs3iArducGvf74CMb1ZsxNMPGm
	1N57k4EWxT20c4t5ps9/zMknQsjIJFESh5Oda5TvdpoqRwMDg6izZLxD8KTwWgMPY5Hb+XJDfmg
	vE4z6iLJZjoQ/CMgZx6+BF6zdugNP/Hn92XKoTpctU4gH7mZTRpClSy3c58uflOC+o9p5
X-Gm-Gg: AYBFou1Llof3EVX5gT/i4kfgNby7TUVoETSqqOp4huzR9nHa7GSQ2acyRtWniUKpxYV
	/cMcurqH4OnTqkwXVTNFtzGmB0kmLBU1bbZJSs2PTmV5EYClzq6SBTbEcbkP5ZYXo5xec+xi3E8
	looUpL6gLyTKImN7bnJGzrxd7NxklqocB+lb0mvRoCoZGRd7y29X9SigQn1EAcZrPSV0ZcmVDXt
	lAZC7KM+PH1+E3dAMO0lGkSuFuumBs/5INSsN45aT0w2CK2KpZg6Fayj+SgSzclpIPsPKeHT7Ek
	dlneVyZwI5o5eSD/wvAog8tvmqCKq7Z7nDDMSWrjWlk9x8Di6uwupbKYmeEFbhj51zgzhgAUPyb
	Fym1J/39Cw6k2XvU7QPfwggU5FrE=
X-Received: by 2002:a17:90b:2b48:b0:3a8:1320:38b5 with SMTP id 98e67ed59e1d1-3ab3a747d7amr15737811a91.30.1792070701267;
        Thu, 15 Oct 2026 06:25:01 -0700 (PDT)
X-Received: by 2002:a17:90b:2b48:b0:3a8:1320:38b5 with SMTP id 98e67ed59e1d1-3ab3a747d7amr15737710a91.30.1792070699787;
        Thu, 15 Oct 2026 06:24:59 -0700 (PDT)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ac9437aa5fsm4592400a91.3.2026.10.15.06.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 06:24:59 -0700 (PDT)
Message-ID: <ab5ebfa2-9687-48ba-8403-186e517126d2@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 21:24:52 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 13/35] drm/msm/dp: add support for MST channel slot
 allocation
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
 <20260929-msm-dp-mst-v7-13-4b81473185e7@oss.qualcomm.com>
 <agm7esy726no4u4cntecmllz5kxdtxaue7xcn7vdhkuh73lxau@r6mqybgiyl7f>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <agm7esy726no4u4cntecmllz5kxdtxaue7xcn7vdhkuh73lxau@r6mqybgiyl7f>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfXwT941tUXfPlO
 1OLsL2WZ28sC+T22sBusJo9jp0cZDKK9m+/ZHtKNZxvuW7eHOp03Azqr/DUONPt8s6HMo/Eoh3q
 WaP9J0A/Y12huu2tRyXWBFc7L7Dfm00=
X-Proofpoint-ORIG-GUID: uEajlhATApBe9Sx3NhR6XW-xiq-rieCA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1MyBTYWx0ZWRfX9RWg4FEjMwFK
 UdYAT2N0SKjnX7U/U8IrNqWugXHfiTunm/f/bjCv3LSF6B3VZDCHTUvtbKhKs4vOOnHq96zo1EQ
 mPUklp2jUKJb8V3XPXQaktDx2F4BXNsksZ6dwBCzsli88buOEH4zvLo/3/GLNz1szUKntgGmots
 bkhGYk64ZcyZ6gGOJ7eWLDHJ72wHOiqvHOAU5hSnd4VkEAWUrFla5OQtCTbh4If98acxAEjHtge
 bLxLWZigCqoD5GlUy+ZobAUuQUAQcuJTQ5yDA2EIskK9rNd5QhdDhAHNoTbqiLi01ae2xd99PhP
 Ol2njCtoi48liKdOjYc3QUtgmnkb+ool4QTcoycEgE29mSs6dcc8dlO/ebg1g2XCHnlOVfv4qDe
 NyIEhLDL6GqJtLZkXzGmfz38YKBPf0tbTNHwE+3Nl7W/a1Icc9jyqiljkUctnJFPo6ksQ2yP3c8
 z7sYnj+XctFEK4E5M3w==
X-Authority-Analysis: v=2.4 cv=E8BYNqdl c=1 sm=1 tr=0 ts=6ad0d42e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pWGhcB3pyskuJKc3Q2AA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: uEajlhATApBe9Sx3NhR6XW-xiq-rieCA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150053



On 10/1/2026 6:52 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 29, 2026 at 12:25:37PM +0800, Yongxing Mou wrote:
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
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 187 ++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +
>>   drivers/gpu/drm/msm/dp/dp_display.c |  13 +++
>>   drivers/gpu/drm/msm/dp/dp_display.h |   2 +
>>   4 files changed, 206 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 929e0f94f8dd..02732bd4efa1 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -83,6 +83,7 @@
>>   #define MR_LINK_PRBS7 0x100
>>   #define MR_LINK_CUSTOM80 0x200
>>   #define MR_LINK_TRAINING4  0x40
>> +#define DP_MAX_TIME_SLOTS 64
>>   
>>   enum {
>>   	DP_TRAINING_NONE,
>> @@ -119,6 +120,12 @@ struct msm_dp_vc_tu_mapping_table {
>>   	u8 tu_size_minus1;
>>   };
>>   
>> +struct msm_dp_mst_ch_slot_info {
>> +	u32 start_slot;
>> +	u32 tot_slots;
>> +	u32 pbn;
>> +};
> 
> How other drivers handle slot programming? Is it something to be shared
> between the drivers? If so, maybe it would be better to update MST
> helpers. Or, asking differently, why do we store it this way? I don't
start_slot, tot_slots, and pbn come from the MST atomic state. The MSM 
DP hardware uses start_slot and tot_slots to program the per-stream 
timeslot registers, while pbn is used to calculate the rate governor. 
Therefore, mst_ch_info[] is a cached copy added to make these values 
easily accessible to dp_ctrl.c.

Source hardware programming differs across vendors. Intel does not 
explicitly program per-stream absolute start-slot or slot-mask registers 
like QCOM does. Nouveau submits each head's allocation through its 
NVIF/VCPI interface, while AMD converts the complete allocation table 
into SAT entries and programs them into the source hardware. Therefore, 
DRM MST helpers can handle the common payload allocation and 
slot-shifting logic, but source hardware programming remains 
driver-specific.

Without mst_ch_info[], we would need to construct a temporary complete 
allocation table from the MST atomic state during stream enable/disable 
and pass it through dp_display.c to dp_ctrl.c. Specifically, this would 
require extending msm_dp_display_enable_helper(), 
msm_dp_display_disable_helper(), and msm_dp_ctrl_on_stream(). 
msm_dp_ctrl_mst_timeslot_setup() would then use this table to program 
the timeslot registers for all streams, while the current stream's pbn 
would be passed to the rate governor calculation.

> see where msm_dp_display_set_stream_info() will be called from, but
Sorry,  you are right. The call sites are introduced in a later patch. I 
will move this helper to the patch where it is first used.> isn't it a 
part of the calculated state? if so, all the slot allocation
> should be stored in the state structures rather than storing them
> directly in the private structure.
> 
>> +
>>   struct msm_dp_ctrl_private {
>>   	struct msm_dp_ctrl msm_dp_ctrl;
>>   	struct drm_device *drm_dev;
>> @@ -153,6 +160,8 @@ struct msm_dp_ctrl_private {
>>   	bool link_clks_on;
>>   	bool stream_clks_on[DP_STREAM_MAX];
>>   	bool mst_active;
>> +
>> +	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
>>   };
>>   
>>   static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
> 

