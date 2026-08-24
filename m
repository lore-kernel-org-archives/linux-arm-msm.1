Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3511A6816
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 03:15:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787541357; cv=none; b=JBP5i1Tk5obPB7BZrhAr0ga45jVn8bJfMTiCVss8a9d+Zp5jx4K73cnu1mwXTW4y0M8TeOTtLGDbif3I670k6BEiyWc8XtXBk8DcfFb3/HhbXOyCopr3f2GwviJ4RKBgmjw3wMO3lS8ntFgbf5+5Vz8V2NUPLAsNuCeN0dGTLQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787541357; c=relaxed/simple;
	bh=FqjqJeHhxJ6ktuuiVX+hIMeNZ5g0zJ3mPu+ApxRcU2Y=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=TsVRgsLCpFzUJo7vZmXTocgfipzG/cbc5jPlgCtpZ59pmaLQGqHnrqE42TSMH7ofeVtRSZAkeTpQ6s2m3l5YYwMtHwq2hXGHtl7AkMjihYlRIIziJAAQnNdv/YGLZvk/oEk15MtIkH3z3ExcJdNWKxuw+Zm28tJL787sf+rr0Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KzjesmQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d1faT1vT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KzjesmQM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d1faT1vT"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67O0knlh2472190
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 03:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	THK3mU3zM4H3WOn2rcZOYc5FkaAY4hnLNpJ+5JYj0P8=; b=KzjesmQM0w9mb9Xo
	xDdnGhSl0dQLjqZsS8WJU+uIBeqbOXwW4KZ0WlCfzEcjqQ2TUdE0cQdPqE1OAzko
	Ms8f5LnYiaJOuBLEvkEUlHahLPqLvgICbL+L4rZXGzBRnMzxXd4uA7ioak4V+v51
	DeAYeVhijIksa08Cwi0EAIfSf5RgPj8v4+Eof3YE2HCj25GbVGwPTGc7JhFrLKPH
	pQsmOQwiH9nNpHOKL+rKyj/5GTGfb+Mem6GT27qF/00Bydg6gqXC02biK9oZ0O8g
	TryLV0BKgh2QMemgcqO3lnGffib3xEy7lHC6vWX06FThH9aPbIxcoaRK5ZKuHW8f
	RYmI9w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g88jpgmcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Aug 2026 03:15:54 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3954def0191so5174715a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 23 Aug 2026 20:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787541354; x=1788146154; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=THK3mU3zM4H3WOn2rcZOYc5FkaAY4hnLNpJ+5JYj0P8=;
        b=d1faT1vTmSFudmQGT8bG20r78FBXW9YdEM52xJzH16k8A6Mf58MahF+FsYYbv7mGml
         MD2LXbUSZ1EpmxZ0cq+xQuN3oczs5ZcBEEeeXKBA2GFuFvEGQSlQ8lKaD7mAD3mSqkn2
         hhodsFfsmTdZRHJCGA1ziXIaL2OsoidDd//0S0/BRdS9944ksnvPf3ejQiG2wnanDrUf
         hWcGxxbJQiqKEj1jWNEivO1wZ3hdbgChL9q90Fcayo/VQktfpSLQYzYeFcdy31Y4WMY+
         rkpZHL3OcmSrkG5KIxRdynfPniaprNu+NQjoqh3VIyFvPR/WSgzNN4reVW4s0ALcezzq
         Kz7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787541354; x=1788146154;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=THK3mU3zM4H3WOn2rcZOYc5FkaAY4hnLNpJ+5JYj0P8=;
        b=okeHNIr/TNrxI3NRYgykCiiTrZI5uA/ws1Cm+fo0panx08/5kX1O/yLrhJzRUhJIen
         +rQeyoQ13BQr+EPj+E23K3IYAftWmOlId27hdrBcFSX4M/qzqo3aFN+LvZ/fMM8TULAt
         FyhbSufJsFrglYhVA1Wz7jfmtVGPb0FIBSb6NPKeuH+y9OwM+1BDijaOEW8SDpfEcIwe
         ytl79Cpvm0eJXmz+6iia4T5mA9BbZgq3aFoYgS1OqR+IJ2/7piHY8va9N8v2FGUYwzU9
         XnHu6LlXwwG5e5UHPFda6IRXJokaBn7u+bNkQ+hKnLZ4/pCNTE6gkUz0a9Yiz+/G/QBv
         cG3A==
X-Forwarded-Encrypted: i=1; AHgh+RrVhKhP5sCVvwdz5HZ2wWYa20QKPFVWvuBSJmSOLlpAI2yWByEYXK9mMNw1xYZrdN+vLDJEv2R8JvwqynLD@vger.kernel.org
X-Gm-Message-State: AFuF++mV/1vQU3EbdDos60It2+HEIoL68PisKkr5F1OapOFyU/ObtXqN
	hTX5HG//OM3HZA4KOBVr/XMS8vwy+UVQ9DtZt4t20UoBLiTIDaesY6TWWT4pszOxJTFo4etvT4k
	T/txtHu/mHNBv8FbEh323zHJY725LWaW5GfCXHQcnpPZVoAFQcWMcZRYK9ksYVqeb5eMa
X-Gm-Gg: AR+sD12iTkFMqA1FcCRlLLJSh3ebg7Q5ZOOKPcg6GHJdB+liyWugX/T3Uxe/KYtID7U
	phKybXny1E0klDrQIIuMKSRQ5+UEE4oq+hiC32h4tPesKvcM9KzZzraMR10Y+THwQHrsjmQPmKG
	3ujNYYngAhB3Zfcs+bjEfgnfrCGbXWKSeXorNhlJFpYzzJ4DkvXLc2ba45MjGJsIeScyNehk9SF
	G7SZA7JdqIL8vJCbHib+iwCcwEZF0B0nLjGn69Pg1uywjiQlFNueHRJw4i1J+KmgofU2XAV+Ot+
	DWmUpMumDE0Cg9k+2ByqAIZ/qwqpnB7ZYqT+FAGPzCZBJwhvW1F/KzjAidRWKzw6CvZBmC/85YR
	xa+OulOLHwr7isht+jnWg2gFMl1+UO0eC1IqnjWFg8WVdC3yhub8QP+sWbiZ30BACgAKsPJ8=
X-Received: by 2002:a17:90b:180d:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-395c3733e65mr40833582a91.12.1787541354196;
        Sun, 23 Aug 2026 20:15:54 -0700 (PDT)
X-Received: by 2002:a17:90b:180d:b0:38e:2524:724f with SMTP id 98e67ed59e1d1-395c3733e65mr40833494a91.12.1787541353641;
        Sun, 23 Aug 2026 20:15:53 -0700 (PDT)
Received: from [10.133.33.35] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-395e4b2b9c9sm8056616a91.15.2026.08.23.20.15.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 20:15:53 -0700 (PDT)
Message-ID: <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
Date: Mon, 24 Aug 2026 11:15:44 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
 <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
 <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDAyNyBTYWx0ZWRfXw5Lsp1sidTBv
 7cnPa6bK0p8mCUgPXImdN01ymfiNIbSWRjY23TDrDa2BT5GMLTde4yMNyx1/SiY7u47GJNiG4nb
 m7Hum4SMF5RR78HKdMWcTLRdEr9h7PhW4za5vv0Coh5RWUptBv41u+u2/W7zbmbWL0cVD4H0cxS
 /7YrHcfMfgGdGqCDImqhvO2IAvlPOweAXO5Wvd2OmrioFpL9SczojyfVFfiwP5jyKWBPqA7z90o
 4YcI1VfXsX0loAfNWPBkv5T4oQzr1yl7JX7bHEp/9e69ODqb2po7bPDGdQLH5vGNOQBIM3eufAL
 yTS0X+Teaep4FIc/mSi0/AUP7Gn2+8ITwu5HXkaqL+QoHTf4bTughaMXG+oghzVTo8cqNsBNoz8
 Be3Nm7cgM/xSSvpR4lTjsWH58DZ3ZWCQUgqEBb/eFz64bSSL9m06jbhXFYiN/9CKSIEPPVeNbho
 HSD1bjXWStjxIcdqlsg==
X-Proofpoint-GUID: Lw4HyXr9u6zBD9IYikVUTctnSfQaLPjN
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDAyNyBTYWx0ZWRfXxD4PMm5M9JHN
 QEa6H9YAtkr0R1o3c6bqlwfA5Je8x1I6k6jMTyoNsiPnSwIF8HeAM33o2mvd5OKLkXZXXKRzBef
 npa8e6C3Uk8aSCoi4ogciV+zxMwMMrQ=
X-Authority-Analysis: v=2.4 cv=Xey5Co55 c=1 sm=1 tr=0 ts=6a8bb76a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=qQJ8N8Yg66gReXqHpcoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: Lw4HyXr9u6zBD9IYikVUTctnSfQaLPjN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_01,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240027



On 8/21/2026 3:20 PM, Yongxing Mou wrote:
> 
> 
> On 8/18/2026 11:01 AM, Dmitry Baryshkov wrote:
>> On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
>>>
>>>
>>> On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
>>>> On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
>>>>> The bridge connector framework currently invokes all bridge
>>>>> hpd_notify() callbacks and unconditionally emits a connector hotplug
>>>>> event afterwards.
>>>>>
>>>>> However, not every HPD notification requires a userspace hotplug 
>>>>> event.
>>>>>
>>>>> In particular, DP MST bridges may use hpd_notify() to propagate HPD 
>>>>> and
>>>>> IRQ notifications through the bridge chain while the actual hotplug
>>>>> handling is performed by the DRM DP MST core. Connector creation,
>>>>> removal and userspace hotplug events are already managed by the MST
>>>>> topology framework.
>>>>>
>>>>> Allow hpd_notify() implementations to suppress the bridge connector
>>>>> hotplug event by introducing a bool *send_hotplug parameter. Drivers
>>>>> can clear this flag when HPD processing should not result in a
>>>>> connector hotplug notification.
>>>>
>>>> Why? Worst case the kernel receives another hotplug notification which
>>>> gets ignored by the driver.
>>>>
>>> Hi, thanks for reviwing those patches.
>>> Let me try to explain the motivation.
>>>
>>> Semantically, IRQ_HPD is just an IRQ notification, not a connection 
>>> state
>>> transition, and shouldn't be turned into a userspace hotplug in the 
>>> first
>>> place. However, drm_bridge_connector_handle_hpd() currently calls
>>> drm_kms_helper_connector_hotplug_event() unconditionally after 
>>> processing
>>> the event, so every IRQ_HPD ends up reported as a hotplug.
>>
>> What if the IRQ_HPD is delivered together with the first HPD event (for
>> example because of the TCPM processing those events)? See the mechanism
>> in the displayport.c AltMode driver.
>>
> The DRM API should simply pass both long HPD IRQs and short HPD IRQs to 
> the driver as they are, and let the driver decide how to handle them. 
> Based on my review of the implementations from all three vendors, when 
> long and short HPD IRQs occur simultaneously, the long HPD IRQ is always 
> handled first, followed by the short HPD IRQ.
> 
> I have another thought regarding the current DRM API. Could we have the 
> DRM layer pass only the HPD event information (long IRQ and/or short 
> IRQ) instead of connector status, and leave all handling decisions to 
> the driver? The DRM core would simply report LONG_HPD | SHORT_HPD, and 
> each driver could decide how to process the event. This seems like a 
> pattern that could be shared across different drivers.
> 
> This is just my current understanding. Please let me know if I've missed 
> anything or got something wrong. Thanks.
Sorry, after thinking about it again, this idea is not fundamentally 
different from your current approach. In the end, we still need to 
handle HPD state transitions in the driver. It seems my previous 
suggestion does not really simplify the problem, so I apologize if it 
has caused any confusion or misled the discussion.
>>> Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
>>> cleared, the IRQ keeps firing repeatedly, and MST bring-up (link 
>>> training
>>> / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
>>> not about "one extra hotplug", but about a burst of them within a short
>>> window.
>>
>> Ok, if it is level-sticky, it should be handled as such.
>>
>>>
>>> Every one of those hotplugs is delivered to userspace via udev and
>>> prompts the compositor to re-probe the connector. In the window before
>>> mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
>>> and performs aux/DPCD accesses, racing with the MST enable flow.
>>
>> If there is a race, the path needs to have a lock, preventing concurrent
>> access. Otherwise, you are just shortening the window instead of solving
>> the problem.
>>
>>>
>>> The amplification also isn't limited to a single connector: on Hamoa
>>> there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
>>> any one connector causes the compositor to re-query all 4. So this burst
>>
>> Please fix the compositor, it should not need to query all 4 connectors
>> if the HPD event came from the single one.
>>
>>> of spurious IRQ_HPDs during MST enable ends up amplified across the
>>> whole card.
>>
>> How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
>> the HPD event to the userspace?
>>
> The driver revalidates the actual connector state, and a hotplug event 
> is triggered only when an actual connector state change or a link status 
> change is detected.
>>>>> A NULL pointer indicates that hotplug suppression is not supported by
>>>>> the caller, such as the connector detect polling path.
>>>>
>>>> And nothing in this patch makes any use of it. I'd say, it's
>>>> questionable addition. Let me check other patches...
>>>>
>>> You are right, I will reorganize the patches in next patchset.
>>>>>
>>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>>> ---
>>>>>    drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
>>>>>    drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
>>>>>    drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
>>>>>    drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
>>>>>    drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
>>>>>    drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
>>>>>    include/drm/drm_bridge.h                       |  3 ++-
>>>>>    7 files changed, 21 insertions(+), 12 deletions(-)
>>>>
>>>
>>
> 

