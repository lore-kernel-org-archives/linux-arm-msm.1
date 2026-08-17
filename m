Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4351D3BB136
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786953766; cv=none; b=KNKmnwxqHXP7aagKwD4tYZJ4YhvTcJU6lKpKeL3We0hUq2sR2Pim7e4Z8G4IZStomv5sInZW5IWOG0HVcYbzEfeQAJ5ZurFuSlidOqCjYrqJjf7zDqFL9hChjWn08O6yM5U1LViz315yAJcPIKKML7l1lM5+Q2dHLiFnsDYUwVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786953766; c=relaxed/simple;
	bh=V0siJ4YlSeDuwMzJPD/iW/1mEaB61O/nf8qbDmmVn2w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HT0ymKhsttQIx8+lfXjlvm3CDkjp5AclVo/a0SP6jJrRnuXv1fDVHTIXhOOAsZ74li83sx7idmqO8uQBzpVTAW/Kn6xZXi/EApIzmxQygOMDF4TQWAY0KIRMNPhUMgyZJCaYP8VOB84wrYJnnbm5aHc/qyt9vctRV8+miL1MFTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gUv509Hg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GKhGO7SX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gUv509Hg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GKhGO7SX"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7F9B21636874
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3326y2xRLc4LUOS/GitWc6Ks0gAYMdIYlQfHxMHMgg=; b=gUv509HgWGlG+Cy5
	EE3RDEv0i9vuuJLaeB8aJ0tzpS9EjAqjMv1f11Yz9lx0tSWcVl+etNQzRDOoTVdC
	6AewY63wPCRhV9z1flQunFjlcHqDFAHeSuSarwETSe1Nw1XdvdGyo0Y/hwR6rVIm
	Zsi7XHeokjsYt+9ous1BsY44KEu/t/qdbu15C9vmJIRW7E90tu8qErSaS/ECR+tB
	Vb354AaMMaKw4O1fYxf79SeRhmMLEryUwFKxsTTH+437vd0CrTUr8yvLLVJz65UL
	Ap6+6FCmn3BUwAvncNCkyadR7GT3NYJu9tkcL7n4A44z3JT+umYVz4YEohrPNDz9
	Zmw7tg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3wreg5rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 08:02:43 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-529ae8e96e8so41339661cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953763; x=1787558563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3326y2xRLc4LUOS/GitWc6Ks0gAYMdIYlQfHxMHMgg=;
        b=GKhGO7SXSQbRDD/8bvdpkWFHjO0yNWp5HKDeZD7ZQgMbQfGuZVGzVolSVv8IZ+UNB7
         AIAWqnBiHAnbjqoX+9zuylmdg/+buhMoeT+1T21ObfrJ2gtIxt8R0BcrE9naLMx/rjxz
         O4aRPaWdW65NAgbDmv/e+mlEEXLvRAp6/5kskTNWzf1jBTvt73FwfBiGCMx5Sx0DEkHl
         KD7Orou3IZonJdIWfpXdXfpnKYv//bOSUro/Dr0avrAu5inUXeB4tGLDdxClrPfwgSR6
         99HnZHr2RJWc8vir5+BVACLrWBrmpJRyx8ICVBCrSPpUlDxiCFrxYiVNVlPFyzV20Nf9
         nlWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953763; x=1787558563;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3326y2xRLc4LUOS/GitWc6Ks0gAYMdIYlQfHxMHMgg=;
        b=RubvjlefGdBjkYvXskmmrfhDRlsEisJC7Z1JJUv669V4sjUSJSTmGl3qHJFmAA2qVv
         +juooMmCDNyBTgI5OYSF2L1BgC1ZM1on43TQmrDKEyF0ioj3Angsp7IGqfARkYtGSkip
         WrXPl+MpAe+ML3YjtlN+6IsLssTe4ezkEoRYL45sMKejy7LKEf/piXncZFIMHDvZZZ23
         vfP4nyo1BkBwAQnGkxnqtlEZe3zMKj/Ej7do8OdSxBhcJhgomIotYbLT2kAx1g4p6pHR
         CCfCm4+PVWQ6lxkKai8k+HiosmGnTm8RPSxAxBeO4ysy7CTHHMrhKeLiEBKuURPGM/9I
         zO0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqqIWtGv3Es8AdNanAASdkUN3V4l0vsGhtRWpYlETQ7QSOuCGEMoA2GAK00YgzRGE12ixQ6eNqz50jxvuPx@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/IisBpr05MzpDHOTEc6UmIlOGQmNXLBvC39sL/1EWbk5DcOPZ
	FPCYZKes7itpLkqUU5EohalMXlFQI0aCmjjt8hfbvSKkKZw25833kKUknEc+u7OZNog4vBv/8kE
	ZSb1lRa8DQQo6B1MHuA8maUjlPWMmcCmQ/IolSCGx5KXY1LsvQ2+2cztNbMz5UPrgeR+p
X-Gm-Gg: AR+sD13fltQaNh22z6e6nf4LD4BlZ8v3GAGEX/w5xwcV7kLpgWtrCnoEpBznXjXplIW
	WMefq5vM8HtJuVvKG1BOaICN24EDn+nYNVIcBsdX60Nez4NN7HzEWm5LvWoBRbADkCCtTBbllkt
	TaroOFyBnvjnqRZTi/J3Ouj/zjj9dCfK0XvLbugrvc4uCLz70K5ohEaxOObGUSHbWu3YrfwloDL
	Ap0yLyXeVN1MBlfP/Mf3jZ0bMmrQTzP0vjqnUMjT9giWQNHppcSB2rHaqHv5c2PR4POELnQq2pb
	NnCSRhU+fSajPhb9uu/jPJHlUARaiIVYccqzlfDUYt1vvAhuLx/ZC3UrvovenHZEXpOAoC5PhOW
	V81APv6j1W0ctaHDQiJmjZARnjE6UOvidcwIINP40HR2CVxWZIOHPUFYhTAiDLoD4uA==
X-Received: by 2002:a05:622a:1308:b0:52d:41d0:89e8 with SMTP id d75a77b69052e-52d85519b7amr231184221cf.33.1786953763192;
        Mon, 17 Aug 2026 01:02:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1308:b0:52d:41d0:89e8 with SMTP id d75a77b69052e-52d85519b7amr231183591cf.33.1786953762519;
        Mon, 17 Aug 2026 01:02:42 -0700 (PDT)
Received: from [10.111.162.109] (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db623aed9sm8394031cf.23.2026.08.17.01.02.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 01:02:42 -0700 (PDT)
Message-ID: <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 16:02:31 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
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
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
 <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=FqI1OWrq c=1 sm=1 tr=0 ts=6a82c023 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=3XZL1g37JtqLMPLRk5sA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: RMGWd9zHC93Y-uNsiJ--w-2Lnn11SY4f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX5v6UfKroY89b
 SRWrr+Lo9M/fZiUj8tr1djPZQreKuHOZFWO+UdZVGLRFQYM6kZ5rW1gi6nohEuaXcMXNlyKbgUp
 +axXmbEbwaXohixZe2ntvZg+CVnlIrCaghhJGehABTzuWCXptp0/50+PvvPiM+NRx80IcyM2sUy
 OEQziVdGX+XIZ2ty17sNXeJtmbCVf+HpQIvk5rMMhEmcIZYhmiItoRthDagYAAytJFPcyGgCTbZ
 yyrNnHCOWXXrdxHpYiJSlI3us1xh19jHDO5FqWRwSPXsQvw4Cqv1ys+HMO+9u/RGxvDLmJYNYQx
 NTZHEA8pBZB070MTkHRFy6wlOzRKYchX6CzbgasttAP7mg9+KeSareTtkqgrpmQKDXmre6OyEde
 5T98k4i+mSaQ/J4+fCzUfFndUQOcxkJCgkO8MdLFMtNywy8UG0RQtNScibNDBO1OcnZGhMKud2q
 O9iQlFaq0slaY50di7w==
X-Proofpoint-GUID: RMGWd9zHC93Y-uNsiJ--w-2Lnn11SY4f
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1OSBTYWx0ZWRfX8oi3XQT69+I+
 Sb1U+f6h3WKPQbCtcqttlx73SmjSLC2Z/2O7nEo8+Lt0Ye7jpnvAig6Rngit3bZ9jJB12hxUq2g
 mqu7AOsesu5h43w7+czBQxT0AOlbjrI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170059



On 7/12/2026 6:33 PM, Dmitry Baryshkov wrote:
> On Mon, Jun 29, 2026 at 10:48:04PM +0800, Yongxing Mou wrote:
>> The bridge connector HPD handling path currently updates
>> connector->status for every hpd_notify() invocation.
>>
>> This does not work well for IRQ-only notifications where the event being
>> reported is carried by extra_status and no connector status transition is
>> associated with it.
>>
>> One example is DP MST. HPD IRQs are propagated through
>> drm_bridge_hpd_notify_*() so that bridge drivers can process the
>> notification. During MST operation, however, the SST connector attached
>> to the bridge connector is intentionally kept disconnected while the MST
>> topology manager handles all connector creation, removal and hotplug
>> processing.
>>
>> Updating connector->status for an IRQ-only MST notification may cause
>> the SST connector state to oscillate between connected and disconnected
>> depending on the notification path. These artificial state transitions
>> can later be detected by the polling logic and result in unnecessary
>> hotplug events being generated. Userspace then re-probes connector
>> status, potentially triggering the same sequence again.
> 
> Then the API might need to be adjusted.
> 
> Remember, we have two usecases, which we must be able to interpret
> correctly:
> - The driver gets separate HPD and IRQ_HPD events.
> - The driver gets HPD and IRQ_HPD at the same time.
> 
Ohh yes, here need to rework.
>>
>> Treat notifications with status == connector_status_unknown and a valid
>> extra_status as IRQ-only events. Forward the notification to bridge
>> drivers without modifying connector->status.
>>
>> This keeps IRQ delivery working while leaving connector state management
>> to the component that actually owns it, such as the DP MST topology
>> framework.
> 
> How is it handled by other drivers (i915, amd, nouveau)?
> 
i915, amdgpu, and nouveau don't go through the drm_bridge_hpd_notify()
bridge chain -- their DP controllers are integrated into the SoC, and
HPD interrupts are handled directly in their own encoder code.

MSM DP is different in that HPD comes from Type-C / pmic_glink altmode
via aux-hpd-bridge, so it has to go through the bridge chain, which
means this semantic needs to be extended to the bridge API.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>> index 5edca47a025f..7334d6677604 100644
>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>> @@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>>   	struct drm_connector *connector = &drm_bridge_connector->base;
>>   	struct drm_device *dev = connector->dev;
>>   
>> +	/*
>> +	 * IRQ-only notification: extra_status carries the event but
>> +	 * status is unknown — do not overwrite connector->status.
> 
> But it's not unknown at this point. The connector status is reported
> following the HPD status.
> 
You are right, in the SST case the bridge_connector status does follow
HPD / link status -- because the bridge_connector itself represents
that SST connector, so its status naturally is the link status.

The MST case has a key difference though: the SST connector must be
explicitly marked disconnected (to prevent the DRM framework from
enabling it), consistent with what i915, amdgpu and nouveau do. In
other words, once MST is enabled, the SST connector that the
bridge_connector represents no longer equates to the link status --
the real link is managed by the MST topology, and the SST connector
is just a placeholder at that point.

The issue is that IRQ_HPD still travels through the bridge_connector
chain and takes the old "update the SST connector's status -> emit
hotplug" path. Under MST that runs into two constraints -- and this
is exactly what this series is trying to address:

1. The SST connector represented by bridge_connector no longer stands
    for the link, so its status must not be overwritten by IRQ_HPD
    events.
2. IRQ_HPD needs a clean path that does not trigger a hotplug on the
    bridge_connector -- the MST framework already manages hotplugs
    independently.

Using connector_status_unknown as a sentinel here does feel a bit odd;
let me think about whether there is a cleaner approach.
>> +	 */
>> +	if (status == connector_status_unknown &&
>> +	    extra_status != DRM_CONNECTOR_NO_EXTRA_STATUS) {
>> +		drm_bridge_connector_hpd_notify(connector,
>> +						connector->status,
>> +						extra_status, NULL);
>> +		return;
>> +	}
>> +
>>   	mutex_lock(&dev->mode_config.mutex);
>>   	connector->status = status;
>>   	mutex_unlock(&dev->mode_config.mutex);
>>
>> -- 
>> 2.43.0
>>
> 

