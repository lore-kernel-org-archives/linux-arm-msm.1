Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D02D97BA
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 07:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787296794; cv=none; b=V23y+2BTMsfmGlOnfoX7oaY/dgyOZlP+bHj1ois2GF/xgdS7gmH1eGpLOK0pa4ykLjnyoD0vWSja486CxyIiVbn6tlXBwJ2gCxY/n/P9E+GQPLm8z4MkB7G10Cprhk030tZElBePQ+kN8z6TKqJigL2RgSaYJOc2EahYxWiUKbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787296794; c=relaxed/simple;
	bh=oh9PsGiLu55L5USTkEXyWc9xUvsvy0LtP1Q6XcWA27I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Km6IAPD9H3CcpySWnMnqmq84z+f7H1ZSCPj/6GZpYt5dR76cQfOx4dpPKdYW35c1qlE4KtD81mrM+Z0ILLZq/VkcvN7C66SeH7MDPI6RlJWbn1sizCcUZc5xIvkfH/UdPkdbhadwc4YGGPDY7Xcbiy4cg8W2naudb32F3u00I1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCHstRNA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WT4gsQmc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCHstRNA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WT4gsQmc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67L5TeLj2505915
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 07:19:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pNoWI5R/R7vxKJ6w5LwG7k5e6nNTdMlgILfeCz0SAcU=; b=hCHstRNA18/xpbzW
	rH0Hyh5P+2cxZa0fKW3XqAeDoHr+qFAqfnecDBL8CI0ZZaxN4AmZbWFMzUV+sudJ
	m73mV+viSvAgN5Fj3KeE70JSFCKIMK/p9+JYsTGXrzcb52JTGN9qxiEvrisCEHqE
	ZxQ62/+C+OrVlvdYi8qx1T+Mt1fZ79l3Xd5VJhy+KO0x8lKZv4e1vKBpbnwnU835
	gI1D841Va1jsl43Hv26e+epQkA6ovbg3otXjKKJ5bnZIRey9L8Cbc34OmnDa2kig
	Y7V9abvfpGKBUNulmd9evGmTfsxCj8aTWgY40S3p8ldH7OOKfH/9DwQBIhGiEF9+
	f4rxpQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6fg9rhfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 07:19:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c85798977dcso1216066a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Aug 2026 00:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787296791; x=1787901591; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pNoWI5R/R7vxKJ6w5LwG7k5e6nNTdMlgILfeCz0SAcU=;
        b=WT4gsQmcrQbBz7gIvPP6cglK/4gybikw6WItVjBOvK1uO1OijpZLMtqVF5WHLEoBdW
         3RFeFt8CsQMFhwVDM1wQu4JxGOxsvfCDxvzMpRhdeSsR4t1VW4ZNit0Bw/2+49pS0LNt
         tJTuc3kaR0Jx4NPnrtVOjZGYYgskXUX9qAma3zDIgxXFcFdFDix6q+ggGiF2psfR8s/m
         QYnuNVlSu3QcPOHgyQyiUeYeRtDThkyNbkCr2S09DU4JOIEUME7qRW2fo2vX4D7h+464
         +6LOe3omQhY0cWlhZpf7++FDCDsvMJx8gI13yIxaXBNHb+Qso18tT8H++cNEo8dPMa5A
         jh0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787296791; x=1787901591;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pNoWI5R/R7vxKJ6w5LwG7k5e6nNTdMlgILfeCz0SAcU=;
        b=rcmr7O8uD70M/BQXPrtacMbqOY6A3jdHOxsqR3Edu8yziz/8CZvYd093rBBJiSVw6B
         yj7L0DlIda71B06tBC9QUQItx0p9IZfE+UCfe+Xve3+H0GEH71n65bR8W6/8GXRavfn9
         lL2Y7z1m/EMVLUe6xzq4jjoFzL39X3GmBQ/I3qo8sX4AHKlDFfbBet3rzru3hPD7mhzG
         6sMETJdimRK/o94ruXm+4Mb5+eMoZ4aJ60GjDXx7CGM55It/ZxOiFJHW9H3m5fiNCOvP
         fsL7TQKQ571OsufcusZbTIgwGeEM/3UB4kQ6QLGjlBOFD8fB5+i7VSVATJosiPS+zzjg
         aLuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrwMYynxp1z8ay5nz4ZMuOiOX6byzbV8ZCVViNsO9Qh41yvTkia6wTPB5AmWclQHVEm95bOnp8nEPFDZty@vger.kernel.org
X-Gm-Message-State: AOJu0YxeqM5meyf5e3OOYsjVrqMZ7ytjFkTK9jMgXmBMrBG7rKhIJjIn
	gMchIs84UGHHct/0pd2rAmtfr4k080CSI8tM9YvVmpfhwTzEBRCms/ZqqIm4VHJKeoNkOKuRa7t
	bVKZnP2+FOVbMpzne8Ueq8KCwxIVMXCc19CetMR+nBxtWqgnAJTrdeTJ5xSiZyw6GRrL0
X-Gm-Gg: AR+sD130rOxD7zMT7fFWSundt6G5Yb5A5CXux8FzQuC1qQ9KHe6D8Td3VqLlLrO1bIQ
	F5QdUEiUhbmZFZT74vD92UY7JD2Wl7vVDLFI5z9MgsboDc96s2krmcBHKX0WCgT6uXLGjBm1/EQ
	1Ek19ir36EeY6/uSgYK4+N7Ky+V0i+zlOzLa2Bmikvy/BoW9GJBKeuOJETq0Z91elafbSMHakv+
	2Gx9Uz3W8fnRfoR0uYseujYPSBSRYTJwJtViiSNof0pTtZjStZRI52jS+118Fxjz2qnIkcJqlR1
	1/quRYeB+mYJLpWAaZ7fpAsDTSRK0RMjiypk6hO/BzRgcVPlkQC5Pt7bdnCvGbl/Tcasg6BjzHv
	DoPDBlkDtsgHtXwYyr4wMSnw8BCcLZfFsfmKbLna5i9Crm/KGVz6OX2sfMYH/fX9BQ2rEZqc=
X-Received: by 2002:a05:6300:4044:b0:3c3:8255:8c4a with SMTP id adf61e73a8af0-3cd308a76c8mr8601550637.17.1787296791433;
        Fri, 21 Aug 2026 00:19:51 -0700 (PDT)
X-Received: by 2002:a05:6300:4044:b0:3c3:8255:8c4a with SMTP id adf61e73a8af0-3cd308a76c8mr8601457637.17.1787296790940;
        Fri, 21 Aug 2026 00:19:50 -0700 (PDT)
Received: from [10.133.33.40] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc155464a0asm2507523a12.14.2026.08.21.00.19.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 00:19:50 -0700 (PDT)
Message-ID: <61c3f894-264f-4878-bfe0-4567f4317e9d@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 15:19:41 +0800
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
 <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
 <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDA1MSBTYWx0ZWRfX22Mur/UQz2se
 3sbGNjkIRol/P4q93Hdj1cVelaJ9rOikqPN6gJeNIVsTH/wFVf/NYfv/LyuSWR4e9iNaG42daVB
 fR45bxgQiIdNSe7xtIIEbdbsvXb4l7s5YsvKUErbd7BLWx/2QJGXwgwhw+hR7tDX8KcMGcIVYa0
 X1dPTcRaGknI7+horCuzcEmkhkWUH06dpRH6qP19zwUIM/FUc65xUOikEabqXR7jAxmztCDXPTq
 xeCFCtMlMTgbmGfry33LS8EdO/ZxOHKYjUYnfgViMoa7Trc0NmXF8hG5WwM2bj3B6zxGUZFi6gL
 9asFE/oc+QjFmIUnBanvHpJqK35pPK8lWBE3PGusR/G1q37pQhT7N3vr9X++8X9LSPzeXhZVg02
 Bzf7EFBp26TCJGMQPV2h4VX37vkOA4VI4PnEp3qUHeZJzu0EJlNIDV8IhvWE4kxKB8B7gY1yOAe
 lHJ561G4JYLWdQhHJ7g==
X-Proofpoint-ORIG-GUID: 8OlsC7Z3si331J9jsBWOhsVB2lsb-HXR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDA1MSBTYWx0ZWRfXzaMffV+IkX6z
 YlhHIKDetBMOtFGo4BHvEhIqxd+lVPPwuhgkohHDMc7jI/2FTw7ewREvwPwbTiGal7+hINZ6A1+
 8jAvilvbwABT78250kRYHncG5V+wC6k=
X-Authority-Analysis: v=2.4 cv=Av/eGu9P c=1 sm=1 tr=0 ts=6a87fc18 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=JfrnYn6hAAAA:8 a=EUspDBNiAAAA:8 a=OBMPMDKBgAqnNWYQCGYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: 8OlsC7Z3si331J9jsBWOhsVB2lsb-HXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_02,2026-08-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210051



On 8/18/2026 11:18 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 17, 2026 at 04:02:31PM +0800, Yongxing Mou wrote:
>>
>>
>> On 7/12/2026 6:33 PM, Dmitry Baryshkov wrote:
>>> On Mon, Jun 29, 2026 at 10:48:04PM +0800, Yongxing Mou wrote:
>>>> The bridge connector HPD handling path currently updates
>>>> connector->status for every hpd_notify() invocation.
>>>>
>>>> This does not work well for IRQ-only notifications where the event being
>>>> reported is carried by extra_status and no connector status transition is
>>>> associated with it.
>>>>
>>>> One example is DP MST. HPD IRQs are propagated through
>>>> drm_bridge_hpd_notify_*() so that bridge drivers can process the
>>>> notification. During MST operation, however, the SST connector attached
>>>> to the bridge connector is intentionally kept disconnected while the MST
>>>> topology manager handles all connector creation, removal and hotplug
>>>> processing.
>>>>
>>>> Updating connector->status for an IRQ-only MST notification may cause
>>>> the SST connector state to oscillate between connected and disconnected
>>>> depending on the notification path. These artificial state transitions
>>>> can later be detected by the polling logic and result in unnecessary
>>>> hotplug events being generated. Userspace then re-probes connector
>>>> status, potentially triggering the same sequence again.
>>>
>>> Then the API might need to be adjusted.
>>>
>>> Remember, we have two usecases, which we must be able to interpret
>>> correctly:
>>> - The driver gets separate HPD and IRQ_HPD events.
>>> - The driver gets HPD and IRQ_HPD at the same time.
>>>
>> Ohh yes, here need to rework.
>>>>
>>>> Treat notifications with status == connector_status_unknown and a valid
>>>> extra_status as IRQ-only events. Forward the notification to bridge
>>>> drivers without modifying connector->status.
>>>>
>>>> This keeps IRQ delivery working while leaving connector state management
>>>> to the component that actually owns it, such as the DP MST topology
>>>> framework.
>>>
>>> How is it handled by other drivers (i915, amd, nouveau)?
>>>
>> i915, amdgpu, and nouveau don't go through the drm_bridge_hpd_notify()
>> bridge chain -- their DP controllers are integrated into the SoC, and
>> HPD interrupts are handled directly in their own encoder code.
>>
>> MSM DP is different in that HPD comes from Type-C / pmic_glink altmode
>> via aux-hpd-bridge, so it has to go through the bridge chain, which
>> means this semantic needs to be extended to the bridge API.
> 
> Still, when do those drivers send the HPD event in case of IRQ_HPD? Or
> is it that in their case IRQ_HPD just triggers inner logic to reread the
> status registers and then the driver sends the HPD if there is any
> actual change?
> 
So my understanding is that,IRQ_HPD is primarily used to trigger 
internal status revalidation. A hotplug event is only generated if that 
processing concludes that there has been an actual connector or topology 
state change.
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
>>>>    1 file changed, 12 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
>>>> index 5edca47a025f..7334d6677604 100644
>>>> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
>>>> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
>>>> @@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>>>>    	struct drm_connector *connector = &drm_bridge_connector->base;
>>>>    	struct drm_device *dev = connector->dev;
>>>> +	/*
>>>> +	 * IRQ-only notification: extra_status carries the event but
>>>> +	 * status is unknown — do not overwrite connector->status.
>>>
>>> But it's not unknown at this point. The connector status is reported
>>> following the HPD status.
>>>
>> You are right, in the SST case the bridge_connector status does follow
>> HPD / link status -- because the bridge_connector itself represents
>> that SST connector, so its status naturally is the link status.
>>
>> The MST case has a key difference though: the SST connector must be
>> explicitly marked disconnected (to prevent the DRM framework from
>> enabling it), consistent with what i915, amdgpu and nouveau do. In
>> other words, once MST is enabled, the SST connector that the
>> bridge_connector represents no longer equates to the link status --
>> the real link is managed by the MST topology, and the SST connector
>> is just a placeholder at that point.
> 
> This is fine.
> 
>>
>> The issue is that IRQ_HPD still travels through the bridge_connector
>> chain and takes the old "update the SST connector's status -> emit
>> hotplug" path. Under MST that runs into two constraints -- and this
>> is exactly what this series is trying to address:
>>
>> 1. The SST connector represented by bridge_connector no longer stands
>>     for the link, so its status must not be overwritten by IRQ_HPD
>>     events.
>> 2. IRQ_HPD needs a clean path that does not trigger a hotplug on the
>>     bridge_connector -- the MST framework already manages hotplugs
>>     independently.
>>
>> Using connector_status_unknown as a sentinel here does feel a bit odd;
>> let me think about whether there is a cleaner approach.
> 
> The status here must represent the status reported by the corresponding
> layer: be it DP ALtMode, the dp-connector driver handling the HPD GPIO
> or the DP driver itself handling the HPD pin via the state machine.
> 
Got it.
> Is it still an issue if the bridge's hpd_notify() callback determines
> that we should not be reporting the event and drops connector->status to
> 'disconnected' again? Why is it an issue? Should we instead filter the
yes, it still an issue if each irq . The SST connector  should not be 
reported as connected, even momentarily. When the connector status is 
changed from connected back to disconnected, this state transition is 
treated as a hotplug event and trigger hotplug, introducing unnecessary 
userspace polling and re-probing.
> HPD events in the drm_sysfs_connector_hotplug_event(), making sure that
> we don't send duplicate disconnected events?
> 
I think driver should confirm it really send a hotplug when we call 
drm_sysfs_connector_hotplug_event()
> What is the expected behaviour of drm_client's?
> 
- Genuine connect/disconnect: the client is woken up, re-probes and 
follows the new state.
- IRQ_HPD with no actual change: the client must not be woken up at all, 
otherwise every short pulse triggers a full re-probe of all connectors.
- IRQ_HPD where the driver does conclude that something changed: the 
driver escalates it explicitly into a real status notification.
- The SST connector while MST is active: permanently 'disconnected', and 
the client must never select it. The real outputs are the MST port 
connectors created by the topology manager, which get their own hotplug 
events from it.
>>>> +	 */
>>>> +	if (status == connector_status_unknown &&
>>>> +	    extra_status != DRM_CONNECTOR_NO_EXTRA_STATUS) {
>>>> +		drm_bridge_connector_hpd_notify(connector,
>>>> +						connector->status,
>>>> +						extra_status, NULL);
>>>> +		return;
>>>> +	}
>>>> +
>>>>    	mutex_lock(&dev->mode_config.mutex);
>>>>    	connector->status = status;
>>>>    	mutex_unlock(&dev->mode_config.mutex);
>>>>
>>>> -- 
>>>> 2.43.0
>>>>
>>>
>>
>>
>> _______________________________________________
>> linux-amlogic mailing list
>> linux-amlogic@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
> 

