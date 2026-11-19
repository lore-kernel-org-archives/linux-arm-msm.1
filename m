Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795073762;
	b=hbEzyJpSu+nGqjf9ZIw7aBuo8rNAiR/ak7z9UK0W0ZrcqevaO8k8VhrjzYTRsQ8Dk/tp
	 eoUL1H4+sEH6PN8LOKH87d5YMHPlYGuuv6MAT8/Zy9/4MLELMFmgHf3HPb2Bpveng5HFk
	 eMTdJiu/iQM+DAZ/oJcsNr6w1w1/e4DZ05bqBToUmiEuZ/zC92VC196UfJrfzyY5ixUfn
	 KhnGfPFnnkoqZ/68y1e/NlTDnIe4Nr6TlcV+8LCk+vcgGBAE78IT3Cajv2M2zVkP8+W+3
	 fc5tcAWi+RZ8xTwuvRWle3eKPDkaJAy2ORHGAZNg/kkSCUlZv8uPkSZoR8wlSmf3qhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795073762;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MrR4v6w8hM+joF8rOFBj1WZlbRGV33NqZGNbqm2Vp0A=;
	b=daTRUXUmDIpazaceF1DsX2+pWfqgA3iXiLCJw7yrXWWxrvfgFyjubrLR0AqMsuPxjIdx
	 kss96J0MjchitmnCExlimfuWLJfExtTEdExXODqpPDw85e12zUWEMG23lBRU4qjSijmGo
	 fY5dop+uKVtWmAacl7GaN1gPouutmRHpPCs1lZwvOVEm4m+DMh7O9OPrYZCuETe8mK1Ez
	 jdjQWguzq3aaE73a6kjMf6ab4+/sqyg5wrpyP8K3zZ8m140NJfibLkobaUUGxjUfNkcDg
	 RCOtPBWWDR3elj4LxL3eAD9nxqVKXxM1fKkCJiOiK3wkjg8ThVXqw+VjdL2wNiFz3GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SPdpQLIQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1CWnsrd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67F19606A324
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:36:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67F19606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SPdpQLIQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1CWnsrd
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ7ZiCP3718002
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MrR4v6w8hM+joF8rOFBj1WZlbRGV33NqZGNbqm2Vp0A=; b=SPdpQLIQ/hjGJ8Y3
	zpJQGpqvX5XR04RNeeNiStAUJZp5gij8VvMpXKIPgv7UTNov3w4lDumv+cMPxZg2
	O0WwUMGZJUQgdLzxYrrm/Yu+6ve4S1iC9QfSWIDz2ldbrPKlQcNsOyf0AtG8s8Be
	2IYjVack31KNqUp604HdbqWn2MoXXbwORfPe6+ej7wHdpL9azUIOusqHWLcrsbPb
	jEhKN0VztQgTB36OnDVqfnTEtbco9IwtV8UxkdcDshhRp5eJCW7DxzVgQGXXy0we
	svvd4P2m8Buh8UgiUeFOPgmR++Sz4R1SZcZ+IABfKpVV6607WiE3Z+DQcoV9Wwvu
	X1iVsw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1vv2r02g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Nov 2026 07:35:59 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc4ac5feaa4so1030185a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 23:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795073759; x=1795678559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MrR4v6w8hM+joF8rOFBj1WZlbRGV33NqZGNbqm2Vp0A=;
        b=B1CWnsrdbw8r7kBS6ZvpqzJPy9atzYrMRGCsNIw9axP9V0cVXtPmeb+8HWF6rDhXM/
         pt3qgOdre9vURg0WwBpoKylX2ZbLOc2mriBdwni8qfN0Utx1CTURF4Rib5jSsBb65hY+
         UCsvuBHLpPB+O9j44yELE/JIBIQKeAv7A2bHSJq6ljpDKRcmxQeG7SXk7C8rB6DblpH6
         Bpe+cAgB4TALK8c7UN9IFvPGNZxGo9r5aLZzejVZ7vBQPx5z3CqKPQvkvfUyyQ3q6qxq
         BkxucCzlG2BsFUAMDbh2AzP0x8TpAkgth3qbW/86OMVXxqVWZTYrrD6YuaVkQPxlyY1y
         90kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795073759; x=1795678559;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MrR4v6w8hM+joF8rOFBj1WZlbRGV33NqZGNbqm2Vp0A=;
        b=JlWoNLnYroOOFwhoupu2dNmwipiGbONG5PYO2ZtUOzJLUhB5zMAtj3bvazasHDK3dT
         uW8l7+vLsi7vRHmCRtXuxCzHWWGYxG/tF6ztSP4vs8oNrmdmQLzvTBox7isdTzvJwopP
         rdEz63UtCWEMpJS2w+G1RbdKo/s+NSF3+Bagg/u2OYyVICB2kQYFMliLn33q800h+PVZ
         aPS9ni2wSA/vtvWFYU9g6Jn0TXgVMAayTiE1bj1L7zcJ6wi9siX0kMBhe94GKyYb1/Wa
         12dGsiWJxjpDTBJnmd7+C+WKJv1eKAc/GHP+cBzQ7egtWqND0ik5Vcp8wMI4QipaYm9K
         g+nA==
X-Forwarded-Encrypted: i=1; AL+hErGtlbDi4PDb4GtnCV7fOwQVH+TRGEDc8DpMGQhYHXuqfkSVWfCge4ikhbqKeifFvbeSpwllTe0sKJ+vo3dz@vger.kernel.org
X-Gm-Message-State: APuU4Z9eHWi4AO/PQJg+2vz2hz4+Z7mXFdIIl8P4r8J/0ipTwTY5D91H
	C1cYkABPpPXSdc4Ik5vu+E0crEDd3BT4AOfHjgeE+rHzHsbrfDrph5uiffOnYys3Ig6OceCg8Tj
	yHuGd8j2pyfk+1vXFTP2vw18+cK7yIDnXIu/zK6bo2D6ZOQ6po1tp6hX3i6JZL7U6dF1V
X-Gm-Gg: AYBFou0puKvODRDsRW//GeH61AK0LAvbh9z7n8/kKpXKoTurNu0B5OZkI94LFOqCIk3
	BoVDYX73ZxnV9UZ/F3NKU5+wIlJ0k64etwJ4w80W751h8I7wGz+WYjfzZxpsNpvgcJQjnHf0Vp2
	IcygVue0266v50Nabc+ca6aaTRevUNnuO9RHaby0TR3XLpW6V1G3Ppy/zBl+uZY6aPq0NXTbdvO
	oNite28NxOIYjfXfGWtXqZqwjjIhTlCgSPRcB3PwIIWzyaTvlHVC4hvqsBgvUV3jd5bqHEfryYD
	3dbrAVBDN6GA12sQpeGSOfcuG1zzGUIh/YwywfrrPkKYAT0KNI2M2VVmg80DjUCgG+4pNeWnbAj
	vGKM8TyCovhepDrXlztgDvVvsNpXtukUefJH5mnBgw3hyW1fFhf6V2VAn9q/dbsMhxvCZTInYvb
	nx
X-Received: by 2002:a05:6a20:a10c:b0:3fa:7d82:5e96 with SMTP id adf61e73a8af0-3fe985f42bamr6096170637.73.1795073758875;
        Wed, 18 Nov 2026 23:35:58 -0800 (PST)
X-Received: by 2002:a05:6a20:a10c:b0:3fa:7d82:5e96 with SMTP id adf61e73a8af0-3fe985f42bamr6096147637.73.1795073758410;
        Wed, 18 Nov 2026 23:35:58 -0800 (PST)
Received: from [10.64.69.173] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c5cb54e413sm2433584b3a.43.2026.11.18.23.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 23:35:57 -0800 (PST)
Message-ID: <a63614cd-93e4-4c5e-8d76-78a6b77a96f3@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 15:35:51 +0800
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
 <ebf962ad-6b55-4741-bbb3-783f56c1106f@oss.qualcomm.com>
 <y446bfbdgsqqwuu3masamj33cvcksp2xdeltvaeojpolgga3fg@awtfd4bgpy7h>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <y446bfbdgsqqwuu3masamj33cvcksp2xdeltvaeojpolgga3fg@awtfd4bgpy7h>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: SwBTHT0eoclDtJ-cpBftpeLqp53y0vln
X-Proofpoint-ORIG-GUID: SwBTHT0eoclDtJ-cpBftpeLqp53y0vln
X-Authority-Analysis: v=2.4 cv=ZZWIpcVA c=1 sm=1 tr=0 ts=6afea6df cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=Ip3K_fYRsbvWuOMUuCoA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyOSBTYWx0ZWRfX8iAMCfnYqrmS
 0dS1+WXjTrZ//3xej0FCJ9UfSvcae5BVKx+3/Qs801gYuek3JU1OHd5DrcqD9VQ/kSDdMGXsUxj
 zMaHnFUyKS0RaR+wWweNs5YzSrRSuVU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyOSBTYWx0ZWRfXwD5ioNDFpECc
 62+WaD5F9/U/HBUQvFF9Twbygq351skzRdSRiugbKayAZpQHdAW7xdreiEVlxj3VlZnen7P5mHo
 QcbrMqYRJoqXnOh6rp5oAIfiqqUYpJVkB+o666/rMUvnpOcIuMDP+ofyPAQUu43WXaKiyfpomoN
 0pKEmK0YdgoSa9WVNg8iEmOoy9U3Amv2hwye7o7XF7Kf13UI8bt0hKGMmgICdUEHUotGEVBC3eb
 eC0xqPraXRvne+dLiQUHh7nZTPhSROAfwY7fKDadLpuGRiMxwDKR1mdiJEaz3bCZtWjRmyNygQX
 vV3nfskRnacPxtMlSrn6tm+yfcynhq5kyYrBfSSx63SY2cX+FIxV3iAa37mGwwVQK0IPn3RhcsY
 1Z/SbjBN/qmL9JI2Z/vj+jsOKY44VNcEieDQREkxe2gOacIJN0byPJE+ng9Lj47bOKNyjncAhQx
 aUIa7eUAq0Fy7FX26JQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190029



On 11/11/2026 10:22 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 15, 2026 at 06:28:52PM +0800, Yongxing Mou wrote:
>>
>>
>> On 10/12/2026 8:23 PM, Dmitry Baryshkov wrote:
>>> On Mon, Oct 12, 2026 at 04:44:06PM +0800, Yongxing Mou wrote:
>>>>
>>>>
>>>> On 10/1/2026 6:32 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, Sep 29, 2026 at 12:25:32PM +0800, Yongxing Mou wrote:
>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>
>>>>>> Whenever virtual channel slot allocation changes, the DP
>>>>>> source must send the action control trigger sequence to notify
>>>>>> the sink about the same. This would be applicable during the
>>>>>> start and stop of the pixel stream. Add the infrastructure
>>>>>> to be able to send ACT packets for the DP controller when
>>>>>> operating in MST mode.
>>>>>>
>>>>>> Add REG_DP_MST_ACT, the ACT trigger register used by this sequence.
>>>>>>
>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/dp/dp_ctrl.c    | 44 ++++++++++++++++++++++++++++++++++++-
>>>>>>     drivers/gpu/drm/msm/dp/dp_ctrl.h    |  5 ++++-
>>>>>>     drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
>>>>>>     drivers/gpu/drm/msm/dp/dp_display.h |  1 +
>>>>>>     drivers/gpu/drm/msm/dp/dp_reg.h     |  1 +
>>>>>>     5 files changed, 51 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>> index e1614bc49a7c..65d22505c2b6 100644
>>>>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>>>>> @@ -142,6 +142,7 @@ struct msm_dp_ctrl_private {
>>>>>>     	bool core_clks_on;
>>>>>>     	bool link_clks_on;
>>>>>>     	bool stream_clks_on[DP_STREAM_MAX];
>>>>>> +	bool mst_active;
>>>>>
>>>>> I really don't like the idea of having this flag in two locations. Here
>>>>> and in the msm_dp_display_private. Can we have it in one place only?
>>>>>
>>>> These two fields are intended to represent different states with different
>>>> lifetimes.
>>>>
>>>> msm_dp::mst_active tracks whether the DP connection has an active MST
>>>> session. The controller field records whether the current controller/link is
>>>> operating in MST mode and remains valid until the link is shut down.
>>>>
>>>> I agree that using mst_active for both fields makes them look like
>>>> duplicated state. I propose renaming the controller field to mst_mode while
>>>> keeping the display-side field as mst_active.
>>>>
>>>> Would you agree with this change?
>>>
>>> What is the difference between these two? I.e. what os the difference
>>> between those two?
>>>
>> The difference between these two states mainly shows up during unplug.
>> mst_active is cleared when dp_display starts handling the unplug, while
>> dp_ctrl needs to keep the MST state until all streams are disabled and the
>> link is shut down.
>>
>> So there is a period during teardown where these two states are different,
>> which is expected.
>>
>> My concern with keeping only one state is that we would need to pass the MST
>> mode through multiple dp_ctrl APIs, which would make the code more
>> complicated. Would it make sense to keep this state in dp_ctrl and rename it
>> to mst_mode to make the distinction clearer?
> 
> Sorry for the delayed response. How would the driver behave while those
> two disagree? What happens if the user unplugs the MST sink and then,
> without stopping the display, plugs in the SST sink?
> 
The window does exist, but it's extremely(130~200ms in my monaco device) 
short and hard for a user to actually hit. It only exists when the 
disable commit is asynchronous.

  We can consider introducing drm_dp_mst_root_conn_atomic_check(). It's 
specifically designed to serialize the MST disable commit against the 
SST enable commit.

> 

