Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794546190;
	b=GaAZsevQnQY1nCzEPbb+PL8KEDa/NnM3X8wG/uxd+KZDwHLC2K8P3nP1pUR3pKYnXa2p
	 CXfWysYtdVZ00S+D/imn30135tpFgd+iy0q9qJ+t0HqGQn2W9iY+4lnmc4hC6uaBXA2VD
	 flwjQ6mGBRiq+du0r0cY1qTwWafhFXmGFSvazpABKYw+P39o4au7js4b7b6S8qIvuSD2M
	 Whs4lAh40hu8i3lp9sDo6qUqCnd0fpOCqWFu4tUbIxtQcBz8bVLSPJQ4vUIsd9MVoodk9
	 RgL17HYt6Ct2eiSRQV4kb8WR9FxU9Va0dPlSgMHjGUFqEtDjfTakjAyZdS741WPvnoQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794546190;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4LzS+YwqaLQraW5nig2t+3o+xSFf0cUTjyJXReh6cLY=;
	b=nt2a94BvkaWV6jIiPQS51viMNPTKaI+liYZltBhQWPaE5SbM8nNNm1YN7P/xhuPsyN0o
	 iFUKFZhhzGzHR0J2YnUKa3WPvW20G8H1nJWi9loWx1oDGT3JfJEMYJhFNQ2oAgfk4jXAj
	 TLIWFGp6pbdziDej/zZp8Y3nraP6YGH8CmVyT6R47Soxc1bBfSos9Fv8Xh6P/woAo5TC1
	 MCw1dkDS4KCFRlylsuSsodF0p93FrwkZP0TuV5/lgsXpWUX9dMaQvd4hPuah3PhJXZmZi
	 fhEniKldTVnpr93QF+685Ids7BWX2TAL1aKyZOeYBv2h1Z02NSllhRHDgCGZ0CTkkHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDTuCscC;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cpoAPJSr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CDB606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:03:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27CDB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UDTuCscC;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=cpoAPJSr
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD2KPNo1534492
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:03:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LzS+YwqaLQraW5nig2t+3o+xSFf0cUTjyJXReh6cLY=; b=UDTuCscCngJY3MLs
	CRPtcPVcxnzOlQogNMs08+nMF8l8kAieCNstwghs4wYc96xBzKYbRIXNTbu+LKw9
	zJ2IrqGXBkNxEK51C8qHgZmH9VvYgJYhv8LEC26IpY/bXilK4cw8glzimG3OxmRG
	wLslyyemyvWaRPfpYIAzCS9TM/3kS2uHdj4Uo5r3Xo58p31ZT663bt/1xaJFUKpu
	MA2MnmnS5NnSiHrgkkWxxqIuNBTWK+bxZ1dL8gs5qiVTs3Z/5A3buMaQ7iZgluI3
	tv2Du45ektPAFZ3aSjB9yCknMUf5NTgCytbSvBcLvDCdVFuXIxKR7xeF8MMBbnBi
	SndSMQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwg1bah60-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 05:03:08 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8a06da65d92so454941b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 21:03:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794546188; x=1795150988; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4LzS+YwqaLQraW5nig2t+3o+xSFf0cUTjyJXReh6cLY=;
        b=cpoAPJSrFXLW98bvfmUMCJZTwhXF5Ch7efdb2EZohozQPr0YbcHEKxNyZ/gtC7ZgxV
         aGzpUxYpjw1oK+aZAinJhZ6Ts3YRYiRmsM8TGNao1kpcFeN7RTITV5E5ty6d1zRHNOD2
         vqI/CO8DcZpGcDN56P0wGMvGW2d1pseyaX5cSZOgyKh+2+Pab0tLmGN5b1PwLng0CXtb
         Ya+oFkZz7vZHRBvbSub5bA9h2pR2NiwRiK+rPYm923+7RK9euXlwpv3AmC3poU4HE9BA
         xvp9iYwVshdhE0Bal5bv+hsW1epXMkb9IODRs2AnyUfczVV2hYdg7WkDGHEglFd7McmE
         Jtcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794546188; x=1795150988;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4LzS+YwqaLQraW5nig2t+3o+xSFf0cUTjyJXReh6cLY=;
        b=riPQ+JRKmNk3fRwwWwQIvPk22tYW7tGqH+otHu2uRsdYnI1BLe4a2Q6PTR0OwTHQPN
         65JPsCi1rTD/+sHkjn6RYi2uwEVpGBx/vqAioIiI3+1F93irtIRBzYXTklqvD+6Uq4+/
         ya40upI5SzsM0IhxAsi+BbczOguH1V133AeDwXzfAQ46We1NFQElmfcFFa9CtT3Z+Jn4
         M2kiHYsLhZ+vVye0zQIbRIzRzIrSfocILEXA/3ujRfVzMDO29/x1fsG6JrVSN7A8gYtd
         t6A0/TDd9+J3lp8/H6bhNQSXDExIF9RGVhljVhzwGcAuza15FPhmeGc0bzqV8FCPgvy7
         rMag==
X-Forwarded-Encrypted: i=1; AL+hErHPPJzJH2+45DTeD+cQ6cvt/7EkDOlsXRq4jczc4EgwlfA/APS85ZXJY6IuUee6NGE/JZLX7GHDvDU/hrDH@vger.kernel.org
X-Gm-Message-State: APuU4Z8UBcDBS+/PcDCAh4/b2Gds4z4SrUj9B1ilMS6Bc+g9f0yxRTK0
	iaFdiQSO67mFOEksYvf6kLv/Z+Efw73nQLAILDps1HoKKShMphrvP0DJNGrPiKUTKMSrbq8CreO
	sHymJWQPNyHoRklzs5dSZNof5aGzQlwwQQBlae18PFH8bOw3FF9Jc8UDZSLGwkyFlqkIl
X-Gm-Gg: AYBFou3nDRDVnOmHUO1pQlf2/6bogVVEN1ojHQyGJB1b1YEc/7zGQNTdkkmVldD3N4v
	R5pB947Ae9UMxJjY1MVIp5P4TAoBhrCCKcPQX++CG8WOTo6JZEVAl9pQy67xLh0pnyuL0qaPqlB
	CqSB7sg/4Ebjv7FpggVTf8a83jdYkmMGRoGTGFWk8ymGsUEgVRVaWYJ9GkwHxRlnWh1/UZFI/J3
	u8EykcZSP/4acFs7ZqnGr00FSXpe3rg5RZBNq+rnyE591UNnlO6D2USzLNV620N3OVq5z3l9g8j
	s/97sTVb0tR7BNf9T1np2tnfyXb3BiHI8LYPkXFur2xPOenOEgYGe5mPuWzZZDaBecSedW5jUVz
	cV4c5aPjbug0DAUAF1UZynfBqhgCZtusU49Z1I77waHiK3pB5j3rP8MsFnMzR4g==
X-Received: by 2002:a05:6a21:7993:b0:3e8:b7fd:6284 with SMTP id adf61e73a8af0-3f7a7ec35a7mr1136654637.43.1794546187503;
        Thu, 12 Nov 2026 21:03:07 -0800 (PST)
X-Received: by 2002:a05:6a21:7993:b0:3e8:b7fd:6284 with SMTP id adf61e73a8af0-3f7a7ec35a7mr1136637637.43.1794546187010;
        Thu, 12 Nov 2026 21:03:07 -0800 (PST)
Received: from [10.204.79.100] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc186f472sm610637a12.6.2026.11.12.21.03.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 21:03:06 -0800 (PST)
Message-ID: <fb8b5604-b115-417f-97ba-f0848b024fa3@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:32:59 +0530
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
Subject: Re: [PATCH v2 3/3] drm/msm/dp: continue link training downgrade when
 cable is still plugged
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, mani@kernel.org,
        robin.clark@oss.qualcomm.com, lumag@kernel.org,
        abhinav.kumar@linux.dev, jesszhan0024@gmail.com, sean@poorly.run,
        marijn.suijten@somainline.org, irlied@gmail.com, simona@ffwll.ch,
        Saurabh Anand <saurabh.anand@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com, quic_vproddut@quicinc.com,
        quic_mkuntuma@quicinc.com, mahadevan.p@oss.qualcomm.com
References: <20261111104434.2222182-1-naidu.nama@oss.qualcomm.com>
 <20261111104434.2222182-4-naidu.nama@oss.qualcomm.com>
 <x74bp2hkm4r2qz7oelhwpgexd3tslsxgc67pu22kmlo5yjy33z@v5ka23e5aqqi>
Content-Language: en-US
From: Naidu Nama <naidu.nama@oss.qualcomm.com>
In-Reply-To: <x74bp2hkm4r2qz7oelhwpgexd3tslsxgc67pu22kmlo5yjy33z@v5ka23e5aqqi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c6Q+0h9l c=1 sm=1 tr=0 ts=6af69a0c cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=WWo1CF43h56B4pvcxosA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: gwh48R_xu0xThQ25O8bQ3n_MLYPqSGzB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfX/o5EBmjYv1hg
 Ee3kb7Ikx21xlHjIN0z4CpANS1anxQLvAcvgZ6bOH6aOcAcoJ+H+TGhNHRcxm3XmnfYpidFuVq7
 5naIdLE8c2zM/+F6dDqi15D64VJF57mEIX+/9GAnktFsGUmmbvHJVPt0ZwMgjbZzKZPn2WSy3p0
 l+SAJOYan43Rx3eNEDmwAfJAFCyEsaJbrALCIHFVT8ogltqKAej3ylvlmkdo6cqGJyJqPfee2Rf
 2VeeqZLYTYNfej6skC9awqggguzsc267SqH3OPw/GBDIfDVhRlhfAJ1cKBWh2bRJpeQFLGZ6d5C
 SbDaq3HqCefyceQnGlIFCPYE2zeg4OpGYNoJGL1hrWq/I1dK0QnQYHwbxiABrBfSsEmTmlyK0sj
 I07rl1z2MGSdCGdvKOzBBodfhaICKKvTDcK60TjBGkBNhOb2VF533zdrBAfwB4mAfFc4pgUd6nJ
 a75tk3oMUVTRhbqFJmQ==
X-Proofpoint-ORIG-GUID: gwh48R_xu0xThQ25O8bQ3n_MLYPqSGzB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAxOSBTYWx0ZWRfXwpu0Ez7nolqQ
 mnkdppZW76yHpWPznlRd2TkpoCZ9GYvtwenhGPp+tyh7U2lG/Cy1dCYK+PbYBktlsiR1x+e7omB
 GvLOaeCxMFi9heXh6sdWjBd6HPB7PdU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130019


On 11-11-2026 19:38, Dmitry Baryshkov wrote:
> On Wed, Nov 11, 2026 at 04:13:55PM +0530, naidu nama wrote:
>> From: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
>>
>> During a Type-C reconnect the AUX channel may report link-disconnected
>> transiently while the physical cable is still present. The link training
>> retry loop in msm_dp_ctrl_on_link() was aborting immediately on any
>> msm_dp_aux_is_link_connected() failure, preventing the rate/lane downgrade
>> path from running.
>>
>> When the display is known to be plugged (msm_dp_ctrl->plugged), an AUX
>> link-disconnected status is likely a transient glitch rather than a true
>> unplug. Allow the downgrade loop to continue in that case by requiring both
>> conditions before breaking out of the retry loop: AUX reports disconnected
>> and the display is not plugged.
> Is there a reason to assume that DP is not plugged at this point? I
> guess not. But the other issue is: what if the DP gets unplugged in the
> middle of link training.


dp is plugged at this point, the issue we have is the 
msm_dp_aux_is_link_connected is giving the return status as 0 in 
sometimes , due to this the link training
retry loop in msm_dp_ctrl_on_link() was aborting immediately. To avoid 
this we are checking the plugged status as well.

Similar check  was made at dp_dispaly.c in function msm_dp_bridge_detect.

Here as well we are getting the ret as 0 ,as there is one more check 
plugged which is true , which is avoiding to go to if statement and 
continue further .
ret = msm_dp_aux_is_link_connected(priv->aux);
         DRM_DEBUG_DP("aux link status: %x\n", ret);
         if (!priv->plugged && !ret) {
                 DRM_DEBUG_DP("aux not connected\n");
                 priv->plugged = false;
                 goto end;
         }

if dp gets unplugged in the middle of link training,but the call started 
with plugged=true, that particular check won’t stop training 
immediately. It may continue retrying or fail later when AUX/link 
operations fail.
>
>> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> SoB


Sure, I will update in v3.
>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 15 ++++++++-------
>>   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  4 ++--
>>   drivers/gpu/drm/msm/dp/dp_display.c |  7 +++----
>>   3 files changed, 13 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> index 6b9d9a76ba05..f8a6bd7b0d10 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>> @@ -2274,7 +2274,8 @@ void msm_dp_ctrl_off_pixel_clk(struct msm_dp_ctrl *msm_dp_ctrl, enum msm_dp_stre
>>   }
>>   
>>   static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl,
>> -						struct msm_dp_panel *panel)
>> +						struct msm_dp_panel *panel,
>> +						bool plugged)
> Can it ever be false here with your patch in place?


it will be always true, this is set to true before the link training.
>
>>   {
>>   	int ret;
>>   	unsigned long pixel_rate;
>> @@ -2293,7 +2294,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>>   	msm_dp_ctrl_off_pixel_clk(&ctrl->msm_dp_ctrl, panel->stream_id);
>>   	msm_dp_ctrl_off_link(&ctrl->msm_dp_ctrl, panel);
>>   
>> -	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel);
>> +	ret = msm_dp_ctrl_on_link(&ctrl->msm_dp_ctrl, panel, plugged);
>>   	if (ret) {
>>   		DRM_ERROR("failed to enable DP link controller\n");
>>   		return ret;
>> @@ -2310,7 +2311,7 @@ static int msm_dp_ctrl_process_phy_test_request(struct msm_dp_ctrl_private *ctrl
>>   }
>>   
>>   void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
>> -				     struct msm_dp_panel *panel)
>> +				     struct msm_dp_panel *panel, bool plugged)
>>   {
>>   	struct msm_dp_ctrl_private *ctrl;
>>   	u32 sink_request = 0x0;
>> @@ -2325,7 +2326,7 @@ void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
>>   
>>   	if (sink_request & DP_TEST_LINK_PHY_TEST_PATTERN) {
>>   		drm_dbg_dp(ctrl->drm_dev, "PHY_TEST_PATTERN request\n");
>> -		if (msm_dp_ctrl_process_phy_test_request(ctrl, panel)) {
>> +		if (msm_dp_ctrl_process_phy_test_request(ctrl, panel, plugged)) {
>>   			DRM_ERROR("process phy_test_req failed\n");
>>   			return;
>>   		}
>> @@ -2377,7 +2378,7 @@ static bool msm_dp_ctrl_channel_eq_ok(struct msm_dp_ctrl_private *ctrl)
>>   }
>>   
>>   int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
>> -			struct msm_dp_panel *panel)
>> +			struct msm_dp_panel *panel, bool plugged)
>>   {
>>   	int rc = 0;
>>   	struct msm_dp_ctrl_private *ctrl;
>> @@ -2427,7 +2428,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
>>   			break;
>>   		} else if (training_step == DP_TRAINING_1) {
>>   			/* link train_1 failed */
>> -			if (!msm_dp_aux_is_link_connected(ctrl->aux))
>> +			if (!msm_dp_aux_is_link_connected(ctrl->aux) && !plugged)
>>   				break;
>>   
>>   			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
>> @@ -2452,7 +2453,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
>>   			}
>>   		} else if (training_step == DP_TRAINING_2) {
>>   			/* link train_2 failed */
>> -			if (!msm_dp_aux_is_link_connected(ctrl->aux))
>> +			if (!msm_dp_aux_is_link_connected(ctrl->aux) && !plugged)
>>   				break;
>>   
>>   			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> index fc884038182f..3edf954cc805 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
>> @@ -17,7 +17,7 @@ struct msm_dp_ctrl {
>>   struct phy;
>>   
>>   int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
>> -			struct msm_dp_panel *panel);
>> +			struct msm_dp_panel *panel, bool plugged);
>>   int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *panel);
>>   int msm_dp_ctrl_prepare_stream_on(struct msm_dp_ctrl *msm_dp_ctrl,
>>   				  struct msm_dp_panel *panel);
>> @@ -28,7 +28,7 @@ void msm_dp_ctrl_push_idle(struct msm_dp_ctrl *msm_dp_ctrl);
>>   irqreturn_t msm_dp_ctrl_isr(struct msm_dp_ctrl *msm_dp_ctrl,
>>   			    struct msm_dp_panel *panel);
>>   void msm_dp_ctrl_handle_sink_request(struct msm_dp_ctrl *msm_dp_ctrl,
>> -				     struct msm_dp_panel *panel);
>> +				     struct msm_dp_panel *panel, bool plugged);
>>   struct msm_dp_ctrl *msm_dp_ctrl_get(struct device *dev,
>>   				    struct msm_dp_link *link,
>>   				    struct drm_dp_aux *aux,
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 169938ba515e..551d2c63ef8e 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -399,7 +399,7 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
>>   
>>   	drm_dbg_dp(dp->drm_dev, "%d\n", sink_request);
>>   
>> -	msm_dp_ctrl_handle_sink_request(dp->ctrl, dp->panel);
>> +	msm_dp_ctrl_handle_sink_request(dp->ctrl, dp->panel, dp->plugged);
>>   
>>   	if (sink_request & DP_TEST_LINK_VIDEO_PATTERN)
>>   		msm_dp_display_handle_video_request(dp);
>> @@ -648,11 +648,10 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
>>   	if (dp->link->sink_count == 0)
>>   		return -ENOTCONN;
>>   
>> -	if (!msm_dp_display->power_on) {
>> +	if (!msm_dp_display->power_on)
>>   		msm_dp_display_host_phy_init(dp);
>> -	}
>>   
>> -	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
>> +	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel, dp->plugged);
>>   	if (rc) {
>>   		DRM_ERROR("Failed link training (rc=%d)\n", rc);
>>   		// TODO: schedule drm_connector_set_link_status_property()
>> -- 
>> 2.43.0
>>
