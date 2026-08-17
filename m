Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764DC3BB136
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953709; cv=none; b=YoBHGJGUbEQ18e1R0+ceuAMhwdnaOJ2Bfwa8UvQ/5hWquXgJae2usDmZ/rnlZNBbEq1sgwOLmuvIhm4OgKzYdvQjnr0LV/znvstYQogDaZQRGC00VU9WD+42ZCXxxsCIpPHUPnO/CLxMSYnFIzl6Jnh4oroktSXIeuFW/C9nH/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953709; c=relaxed/simple;
	bh=NDeXqy5xwE02ciaGXq3HS6ID9HuPwS/YseUbyTtDCFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NTDec4EesIXtvEWXKqRBf//HJrGJW+gfSKWkqrW3U8eSvxYPP6GFi67kWK4MukU91EHuDwjVLCk0uTWcFNH4vVo8Me1elRGrdLmAy8/KdZ8d6qDPr1n7n8vfzNYP8U7B+J+Ugntme7RY8q+VGCg0MipK//epgOtr6hk2wrZohgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X6WqELsg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UkurAu//; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X6WqELsg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UkurAu//"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7bgB0788737
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:01:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E8f2R7uAkkm58Igw9twxKgRRf+vTxm7dlB/hN8w5EL4=; b=X6WqELsgDmfc817u
	RWHmT88QxmrDY2V5cXRZcxKWIkOewsmsSD/kA1mC4v6EQ/0Y1A+ftbHNQRXAKTSK
	V4qUO1NkYHUVYS1Bf8eZOSgym8wfIScwiJaIebVhsuhyHsWK0CxGsdK/K3+l+g/8
	xsUAuHjHE5/SJsclPejggLavZ9d1Uy5WJs7lGb0jdw+uwVfqZbRWGx5Av6sQOmNX
	Uwubv1SnfZP2qVMlQ5l81b9rKoU/7TPDDKOn+AZunCkf6fTU81xhBy+C8ggJAglu
	qkrS8GSJIJbNDMUEM8J+NzKq11Pw2LB6PFrD3aHLASPG039fHsniRu988oXGQTWt
	wwSU4g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30g2np-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:01:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1c7f135bso53519111cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953707; x=1787558507; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E8f2R7uAkkm58Igw9twxKgRRf+vTxm7dlB/hN8w5EL4=;
        b=UkurAu//CbJbieWXVdrYpXG4aVuxGJjeueAo+8kWCgJ6sM+80rK4rtOswKCM9o4Oka
         X1zTrd6MMZ1WJj2TQH8pTibB7jjak/gAXWJjRZiern3pZgeGHdnNtEhZiWQwBY6NgVqY
         j+JK1hUMqqjG5pzqt29QBdaSxszGxyQAp+sOnGCSUWPhCG9lDgAHiNBZYAHl+z7XKsVo
         NyUOwoAWv1bBErc2ZsuuFdFnZugLSSkMlgnqbjaxiVoTRlYbereHH1i/idx+KJSIzJWV
         5+TWiTcR9WcG+hS/Zsnffirai+PKK+aS6E19ZO4T/iSzg+yryNAt7CuqM18XQ8tmNrvv
         zQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953707; x=1787558507;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E8f2R7uAkkm58Igw9twxKgRRf+vTxm7dlB/hN8w5EL4=;
        b=mw8cSSwA7M5YqbNkXhvzo7BxuaHbmse7S5ptJMUpbyjThwF+cyZDOnu9SHTlZsju3H
         CUJ7sfQjXYB130SW4ZYyMgtvRTfCAxZNFuhnkVHpV7oVfP+48BpCjw2Wr3/cxgDJlmbU
         S4biKsRMspZXxldtVUo9jG8wpyAfCQ2+2s+Fc1ddFeS5ATBTJFziiPu9ZLQJridgIJEc
         yzhb5q4q9hTuMqWnOTEWc8Q3OtWnGIIPNpEo0jR1hoBv670PgrU1FRzoiQ/stAlC9Hyw
         +eqZRS8j06mq8+rG2etOSvd0WdaHo9BtMLJcbag2IXRC8wYIOcPoE1qZMSvFxNJJqzgr
         1PaA==
X-Forwarded-Encrypted: i=1; AHgh+Rrkmc9/I6u+v4QG4PK9mlpnsqOSa8LjlAr2Xr5pKfA6RP/A3py+doeN7h1EQzntmHO1z+VhYNA0tA10gkDs@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi3PH7zZqcvEO0GwKUkZMzclv6i7fyeQZ3u8HEKwaCaKubedsU
	EogBb3e1Q/NTSWwJ9c099uyMsx5/Y3dfjcMym2iddz3GijXTEh9BayXC8fNgUlUBqkVOoo+8fLx
	ZVYQXVG0isR1nlO9S39V4wS+44Q0DuWGeD0ljfYAhPWFemuHcN7cWSaMhDaP0EqDIozOK
X-Gm-Gg: AR+sD13WMNq85paMw/ik3MPoJxb4qM0Hfiw4A/MzB+7ptFxaidkD6w2fwdg+NR490vi
	ByDEC4gECjjI/jGjlkEp5CpMCppFHnmbQQ/sjEQZewjUyDEUV6xgYMfLCqNbbAJm2zDPYeLqIJl
	/4meari/WBq7ljm5E+bf/d2/wtc79cZEuoztTYtKFmdZq2ju35yF9nwxhKH9THXBlfWPRuR/6fY
	yrXJ+C4AZxINySm5vUcymhbkXCzySJqr8S2Jqq7bdoho2Y4Eo6DbbwVGwOv1YUbtM55vdg98QYq
	WL/SF4QU6Yc2zEiXlxh8IMYXsdcm3ZLHlT1OX+dX4w6vavCLv1EZkruVG0Kuazeb4uxxDHu/SN0
	aJAv0s4IsmOazZYRkuiET9o8miCS0rIAgXLdW3ikPd/d9IAz0gqaFBGrv8ROCnyFCxg==
X-Received: by 2002:a05:622a:1341:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52d8530f131mr247367811cf.7.1786953706616;
        Mon, 17 Aug 2026 01:01:46 -0700 (PDT)
X-Received: by 2002:a05:622a:1341:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52d8530f131mr247367131cf.7.1786953706112;
        Mon, 17 Aug 2026 01:01:46 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db612c2bfsm8319271cf.11.2026.08.17.01.01.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:01:45 -0700 (PDT)
Message-ID: <96344518-c0d3-4424-804a-c315eab3e39e@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:01:34 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] drm/msm/dp: mark the SST connector disconnected when
 MST is enabled
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-5-646a10256233@oss.qualcomm.com>
 <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <sijdmdhcbxyg23gh6c62hspruvbnyqbdrtv2er3bh6n6ftolsp@b6o4khv6dofc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX5XZprxdanLzC
 7ZL0EO8kLoUJ5UhXDXS8L1jzNGZIMD/01zn47M26k65Ht/cyLnD1aoO/aemH1lFQxqRB6X7EadJ
 ebLWeez0jFPp6g4QdfQ48Lf6Oe+ZqRBKgh8UlS5mDrqG+w6HDDudJ6lD4uYGe619qVZjk0GZi6/
 aBFkVG/yXXyszxQoYwHiTQ/bb2P1VPvbJUdGHwP7YrCVRs6it9IsoPbsXVBhlgKr5xW0HhuJ8QJ
 sBNF4ZEm+TmiwQ5+JAfpaE0xlj2inmbSGbH4HmgfIlMd6d/3xKqQ9MIAtgJQt20hfn/uJv4EDha
 hdc38xMqLLerUef+IXMBQMIZzQ6Inp+tWCiqBSXEJ7EDDDoMOy0jHKjRCGpMN3tCHNFOoTMmwAO
 VigW2IFwfCV4YDvefPUIhViEKMbLC1OP0LRcJZnomEjH827v+Xn2x7f3FEbxOl/grxOb2D5dPV9
 hWsMhs0VxYxtBs3wIag==
X-Proofpoint-GUID: fnTQlkfaVm_l6yU2IQbE8BFKaLE2wjFp
X-Proofpoint-ORIG-GUID: fnTQlkfaVm_l6yU2IQbE8BFKaLE2wjFp
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a82bfeb cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=bLWUdw4gizuqmWSpfScA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX8eaUxLtWLSvN
 3t/UktVDKlochPjmMDYgSbKnsZWu5XYoglLaeDRQ1AmnlnsM5/6hu+oZARMry6zSimHzsU7o2FZ
 Z7RXU4MYR9CvaIe72F/By1aA+59fWlw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170059



On 7/12/2026 6:56 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:07PM +0800, Yongxing Mou wrote:
>> When MST becomes active, the initial HPD plug notification updates the
>> SST connector state to connected.
>>
>> However, the subsequent SST connector detect path reports disconnected
>> while MST is enabled. This connected -> disconnected transition is then
>> observed by the polling logic and may result in an unnecessary hotplug
>> event.
>>
>> Set the SST connector state to disconnected immediately after MST is
>> initialized so that the detect path does not introduce a transient
>> state change.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index 4ee391cc7165..f8ca60d6d714 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -352,8 +352,10 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
>>   	if (dp->max_stream > 1 && drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd))
>>   		msm_dp_display_mst_init(dp);
>>   
>> -	if (dp->msm_dp_display.mst_active)
>> +	if (dp->msm_dp_display.mst_active) {
>> +		connector->status = connector_status_disconnected;
>>   		msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, true);
> 
> This should be a part of the MST series.
> 
Got it .
>> +	}
>>   
>>   	msm_dp_link_reset_phy_params_vx_px(dp->link);
>>   
>>
>> -- 
>> 2.43.0
>>
> 

