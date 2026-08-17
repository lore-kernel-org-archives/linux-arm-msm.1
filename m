Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E859C3563FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953746; cv=none; b=QWhuVSpMB3YS0sBmfPl5LXxPKPmjV1xIUe97YGX26t6wgX/0uhSbnxIEIJt3+UZ0GRbrOcw9EZEsmxFF1nvYmZaxP65QqB/JXEEkGzx3v9fNiQOlJdw2dgOC0y9U3GUdym73WVMqUqpsXahnrQzxEJ9RN13XgoNH6Y172A+uShw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953746; c=relaxed/simple;
	bh=nyQzXa60BiZyUAVI7mfyPyM+OLX3IEWmOOndfGramq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HiBhDYmoI68z7K5Ym4/d9oI0OM9ByDvUXHRJ/kvmtV2vxyDycjcGvFTqb95g/M7iRl7f0+BLZevGDceQConY1ljoO3mV+O+X+i/35T0QoP8PWt8b3hTLkKiBgNzGqnnsdwbnGIbmww5YRB0tw7zEu+FY1bCB/RP3Nes/liyF3To=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZR9HJbvs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLGhpkL6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZR9HJbvs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLGhpkL6"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H5o1SK1327760
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rdLyylUE5b6H5mJfPKhLhaC/fcZHtchZG+7kuZxWmc8=; b=ZR9HJbvsksB9XvRq
	sULsFfHCIYHSf//AXumseNMzuTQqbikY5wNz6yzatHNjcUOy3BRxNau0ieE+mGJi
	lLHC9ybmLvaWQfSuou4l67Tm6vi2uOMveMp+8ri6PeSsdejVej6QmgVHYMZkdzUz
	jyQVARS6hbm3gNmba0iSUa+VRsHSzDVJppn1ebxSU/BTmAfX4+QWW6f5qXqQ21B7
	VvSofF0vBBXwSQG2GHg22qmtxVL1dhseRqTvTUrNLZrgGXuBio668Dl/1tRgVFSf
	kuiNYfBLgVfzwQq+jEgTIVYMxYbUihu57vnqpl+OQkzkFl6uHJwF2ZgAik1P6qZi
	ftb6hg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3vghrks0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:02:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51a8b0a08d2so24242361cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953743; x=1787558543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rdLyylUE5b6H5mJfPKhLhaC/fcZHtchZG+7kuZxWmc8=;
        b=MLGhpkL6DjrDPzAKhjIa9yb0GZaiIMcXvUpW+pcSYDXj/R7wUeUG2E9WbxUcdyk94j
         dxmZMGecdVttYeGjfoIf/+3Jagxz6AE7wwpCOP/Y0+8sGM6ng5Mu/Egko5Jc7Dzb1Pl/
         Tqq7IQ5TPFl+zVlZFeV8ppONW5PQE+Tpmpcutwa3JyoG82QPkctW81Q5+Isj34cjev31
         wMjrDit8cnCD7EZahDD7zOOZbptLj3f8Jy6f0ikYLZy6zIOat4BeRmXfqJ1+KibLFPwE
         r1A1l2l+lSbeFGj8JjDb3+H8ZotGP8V/FylGyQ0HTZtMPzOVo6NPDXBKQgb2GBbUZ2/S
         2gzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953743; x=1787558543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rdLyylUE5b6H5mJfPKhLhaC/fcZHtchZG+7kuZxWmc8=;
        b=BA6cgpOLZ9OaAw5Zm7tMQJoS4I+NzzXDPwIxOHvJA6d0otpHFrL8Oe8fZRodlaoKMU
         r1/vcExMjvz6+EzqLplbnBvNfPp+aef2txrHwTkrAEq7Ad93HhXx+45eVDYr+imlLowo
         v7DD3MmEtAxRgYmQnLQOyQEledVY7voOudd8gfzgNR3YOaOAwMuOyVrsG90m36PijHTC
         EC+8f/N0BEFtZDOY6wv6nsLG4KMWxwXd2PQmK7lezH3akduaHFvJrbuwRi5g3U1We/d4
         U2KjobebjEVo1GU5b7cTSS188amrn4Rzpe5yKhOEsIjPCVG80RxyZAV2q7zhoQVm8WG2
         tDpQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOb/e57KqcsRi4YDwA39TiGUp+D5NMqDoMYp5AkIIT+2J+SjlLGmiWUoumqnienJ9MZz8+8V/hHw7qLMDj@vger.kernel.org
X-Gm-Message-State: AOJu0YxrQWYWNmWMmqKlFVYi//xLCHJ78m0HuUddCAEp0i3Z4UrPS6Ax
	lwDjJXTpedBgIgS91OO2X9jSQXpdpod3nut0NsqFMNTX4ZfrjHdZDFHs9nrrEYwmnF8HCTVcucQ
	7f10DMIit3Xt2cQFgGoCciCE5T+2oqjQL6YOQzDo3EdnrWkseZUU2TrDGMvnlIg8VyXBC
X-Gm-Gg: AR+sD13lC0MDxDb8DS6n84UFLhl+VYWYEzlKMQ5C0KVVYYjHepT2PdQCQoDtrqvB/SD
	TkSJlOJU6fbfKC2r4Ceui7q68lcAHFDoNclVvesyAEOpzQEbhYKJB+ghU58zR1rRc6jFM21Kggp
	JNvNRboG2teBEZx2/pDCOfPdcCLh5zqM+sUJj5CvL8IBotNDhjmQjXe9FqavnVsPJjozrW3kbjk
	sScbE/5W1yStEWowxWhqLucu6io2AKAEiiVDyYWYPvy/BvBAqDyPBNbv/3UcXwRGJI4GF+YfSYk
	H06lcH+fEi1mkd7asOVzvDFyDriJ25nyscXLFRSNC1EJ5MbjQvdT/AzvPl8/O1eXd0MrBdWI8HQ
	NBfhx2nIW9efFS9e1AG/L4Rjmp6YYspltCM4bYXDwuO2AMU4Fg2lgexwDiM4d3crk1Q==
X-Received: by 2002:a05:622a:614:b0:52d:41d0:89e0 with SMTP id d75a77b69052e-52d855839d9mr232646011cf.40.1786953743054;
        Mon, 17 Aug 2026 01:02:23 -0700 (PDT)
X-Received: by 2002:a05:622a:614:b0:52d:41d0:89e0 with SMTP id d75a77b69052e-52d855839d9mr232645661cf.40.1786953742432;
        Mon, 17 Aug 2026 01:02:22 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db610b491sm8343721cf.8.2026.08.17.01.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:02:21 -0700 (PDT)
Message-ID: <2351cc75-ccf8-4ff0-a558-c29ccd2b86b9@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:02:11 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/msm/dp: report IRQ_HPD as an IRQ-only
 notification
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
 <20260629-msm-dp-msttypec-v1-4-646a10256233@oss.qualcomm.com>
 <zmnftag6s6mxvnoqdzouhpdcbwscm6sfzrqkzgwrcptgbr53cx@jetw2gtov7qp>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <zmnftag6s6mxvnoqdzouhpdcbwscm6sfzrqkzgwrcptgbr53cx@jetw2gtov7qp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P9gKQCAu c=1 sm=1 tr=0 ts=6a82c00f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=tg9PfV-btg9rSNVD8o8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX7ErOuFpkQ5pB
 WPcdSMMHvIgpurIUqdwNXAd8qxrOnqFKEcJJ66/3U77XtizB9iPkjYpMexwpOfwuEJsHPPA12WD
 0iqRASIdahFYtjChq+5EnAZSDeZt+mo=
X-Proofpoint-ORIG-GUID: mdZEUBOF65vZSdV47n43sy1W9fZEcqpQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX5+Cx/6XsLL8w
 FnzQ0mAd2L1+4SUNa4XIOx4jPhW2c0r1GRJ8dw7GQShPEntkRHCx6Oqw+cZv64EpOs7IaxcrcZg
 rt2L/GooqgJYUXozFGhJ1D2lYhdSJL5scHyx96sd7gcq1AkcBKJdI+UXXm4CP8HdC6Xf+knSPNX
 +AYLRfi+T9rKbSZnNDLctX5UTq6ZUqzi4ky1Ab1zzIwQ0Tu+C+Z7gPMHWD/GMODpYcNrlmYjcZk
 cadwceVM9hwtsFli9RvMPwgnCeXRWgri0FWAP+gDRjeWMEpjIHQ53ZgYxgSrpjyAiYY6NuY39/R
 EcAXRHkQ/auPwfwfIoJXGcplHk0aWCA4RDW6Xb1ehUlaSHVPyadcgmWjxhjqoy4bXuTZCMoWhHu
 XiS3WGXXkZth9rnEoACmjV/SB1Hgv8KGutQ3f7HaFshv9B35gbrLmHj+543NWKkHTGPo3uGylvc
 xxfbdqEiVKzMneBACGQ==
X-Proofpoint-GUID: mdZEUBOF65vZSdV47n43sy1W9fZEcqpQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170059



On 7/12/2026 6:55 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:06PM +0800, Yongxing Mou wrote:
>> MST reuses the SST connector bridge to propagate HPD IRQ events through
>> the bridge chain.
>>
>> For IRQ_HPD notifications there is no connector state transition to
>> report. Use connector_status_unknown together with
>> DRM_CONNECTOR_DP_IRQ_HPD so that the bridge connector framework treats
>> them as IRQ-only notifications and forwards them without modifying
>> connector state.
>>
>> The DP driver handles IRQ_HPD events based on
>> DRM_CONNECTOR_DP_IRQ_HPD rather than connector status transitions.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c   | 22 +++++++++-------------
>>   drivers/soc/qcom/pmic_glink_altmode.c | 14 +++++++++-----
> 
> And which tree (and why) would be able to merge this patch?
> 
Emm , I will split the patch and reorganize it.
>>   2 files changed, 18 insertions(+), 18 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index bc93b566fbca..4ee391cc7165 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -1119,14 +1119,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
>>   		drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>>   				      connector_status_connected);
>>   
>> -	/* Send HPD as connected and distinguish it in the notifier */
>> -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
>> -		if (dp->msm_dp_display.mst_active)
>> -			msm_dp_irq_hpd_handle(dp);
>> -		else
>> -			drm_bridge_hpd_notify(dp->msm_dp_display.bridge,
>> -					      connector_status_connected);
>> -	}
>> +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
>> +		drm_bridge_hpd_notify_extra(dp->msm_dp_display.bridge,
>> +					    connector_status_unknown,
> 
> It's _not_ unknown.
> 
Same as my reply to 2/5 -- the status is indeed not unknown here, and
using connector_status_unknown as a sentinel in v1 is not appropriate.
I will fix this in v2 along the direction discussed on 2/5.
>> +					    DRM_CONNECTOR_DP_IRQ_HPD);
> 
> This should be fixed in the MST patchset. You should not be doing any
> actual handling in the ISR routing.
> 
>>   
>>   	ret = IRQ_HANDLED;
>>   
>> @@ -1781,11 +1777,11 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>>   	drm_dbg_dp(dp->drm_dev, "type=%d link hpd_link_status=0x%x, status=%d\n",
>>   		   msm_dp_display->connector_type, hpd_link_status, status);
>>   
>> -	if (status == connector_status_connected) {
>> -		if (hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT ||
>> -		    extra_status == DRM_CONNECTOR_DP_IRQ_HPD) {
>> -			msm_dp_irq_hpd_handle(dp);
>> -		} else if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
>> +	if (extra_status == DRM_CONNECTOR_DP_IRQ_HPD ||
>> +	    hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT) {
>> +		msm_dp_irq_hpd_handle(dp);
> 
> ANd here you missed the case when IRQ_HPD is being reported together
> with the first HPD event.
> 
Yes, will fix it next patchset.
>> +	} else if (status == connector_status_connected) {
>> +		if (hpd_link_status == ISR_HPD_REPLUG_COUNT) {
>>   			msm_dp_hpd_unplug_handle(dp);
>>   			msm_dp_hpd_plug_handle(dp);
>>   		} else {
>> diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
>> index 946eb20b8f83..28ab8cbb5ef9 100644
>> --- a/drivers/soc/qcom/pmic_glink_altmode.c
>> +++ b/drivers/soc/qcom/pmic_glink_altmode.c
>> @@ -373,11 +373,15 @@ static void pmic_glink_altmode_worker(struct work_struct *work)
>>   		else
>>   			conn_status = connector_status_disconnected;
>>   
>> -		drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
>> -						conn_status,
>> -						alt_port->hpd_irq ?
>> -						DRM_CONNECTOR_DP_IRQ_HPD :
>> -						DRM_CONNECTOR_NO_EXTRA_STATUS);
>> +		if (alt_port->hpd_irq) {
>> +			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
>> +							connector_status_unknown,
> 
> And this is completely wrong. The AltMode driver (btw, you also missed
> the normal altmode driver for DP) doesn't know if it should handle the
> events in some way. It should report the HPD and IRQ_HPD as is.
> 
Will fix it next patchset .
>> +							DRM_CONNECTOR_DP_IRQ_HPD);
>> +		} else {
>> +			drm_aux_hpd_bridge_notify_extra(&alt_port->bridge->dev,
>> +							conn_status,
>> +							DRM_CONNECTOR_NO_EXTRA_STATUS);
>> +		}
>>   	} else if (alt_port->mux_ctrl == MUX_CTRL_STATE_TUNNELING) {
>>   		if (alt_port->svid == USB_TYPEC_TBT_SID)
>>   			pmic_glink_altmode_enable_tbt(altmode, alt_port);
>>
>> -- 
>> 2.43.0
>>
> 

