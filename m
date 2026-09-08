Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F49399D0D
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 10:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788864547; cv=none; b=bIOjDEmpLuWqOO6kw1HUUwebz7kAsF6tz6lKFpfvFhRHWKt8gFhuL+4g+oMy27BR1uYnC4sliolntqhMOEHsuYaiBgorzVbzkLd7ZRJeo8KzwdhcDbmXv9OpKG7DCUPJ6Hn49WN7hzRqIEZ5Itl4bRj5i8RfVZs9ScBFF8b2sfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788864547; c=relaxed/simple;
	bh=Z8d0hM9Nf8eLn3I79oqIAhd9wGy1efLUIfHVIiHhhHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J13i2DuSPBd8AvZEv5xrF5Wl4CY6yt9z+hxeYVxlVJki7Re0dF0YFDJoIzhtuUuZy92FztvysMhGVEffpYMtSdban8SDf4uwlPMXNLt80gbP10wVj3azQ7btml2szokePBEuiq17nVhTccxPR8AqeWBAntyf3eDk2VZNwpKYZXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IwnuZ2wT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YnfR2weE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IwnuZ2wT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YnfR2weE"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688ADkwo2171217
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 10:48:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IfLDb6uk00EqgnIeYS1KoA6r18pwAISqghClmXRsM5A=; b=IwnuZ2wTBKXskuwd
	isjLX9peU+oyNys7mzijYGGZcTHJVfelcLsl1sjzcbEP9LvH3qfc/kfR9viyMPfu
	Pgpll1UJOxu/bdzl5fc6UX11+NiGF8ccF1B8ncTS4Eo4yBVCw9x6i1kK8H1EMUza
	FBT2jnPDwh0k8j5Qz5Nia1J/OkaH7D+fyAiy7ZopkrDybBiI9j9DPVj6jLNIulw+
	ARZxbwB2lQe4JdGG2ugaCtG+kBLgMV8G2q/4py3gwMINkeU5oZ0j9EeLuR97VHaK
	SF3ozt3rsmeJ3c8yIZBuJiE9mg8deE9YMoY6JBdu8lVglcLt/ZlqvHi1bWXB36t0
	xSsM1A==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjcvuh4n4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 10:48:58 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-9806756ea40so2790762241.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 03:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788864538; x=1789469338; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IfLDb6uk00EqgnIeYS1KoA6r18pwAISqghClmXRsM5A=;
        b=YnfR2weEObbtRGP9lyPJT8EAfFOWg24/ToppOsMkF4R50CfhYs4DcGZtFEs+yM3eAS
         5Nk1oug4uEfZEBHOK8r5JJfgqAwx/8ykN0kXUL/1z30MKmlQeOnDOHPm+VKt1jWv4+77
         irXMRT4ylhgGYNgSsCORM/rT6UCHzGxuF1H+vufuVDAecsF6h0WCLu6shGW40YEILv24
         RwcP5p16v4z/lY7WmaFXSiSsYh5FRZRPNc4iUimjyOpeZLbDbfjtTAN7pWTrGpoM7G05
         lIp0aqxd8zjNiB+ntw0MitzGJJknM+IqgUIceaLD8yg+Ugkcopvx6lqK8KKy/bWSESfT
         L2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788864538; x=1789469338;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=IfLDb6uk00EqgnIeYS1KoA6r18pwAISqghClmXRsM5A=;
        b=sTdE5PceyjrUdMjjw5QTZ/1j7Qu8kwwIXMC3TB9IxquP1kTyaADc0ihHGgO/CROLaD
         EjR0CjPKvw6Oi3h36PQf4HPSHJCuN6zBChOngXegDrASZUeeVfRS5FUEWzOIksig9RWt
         j21ksxienSPcBmYH26+psy+mrQxBEoaJWuJJsCh9KRjrSimnf9SUR05GjgNuJcfIAGl9
         sxlTlQcCfDNlxc4SC3GNXBc5G8ktAgBCvT2JYfEQIa2XEHtVVkOiw+NR9w08nzQxNsYK
         6PzUxyro6TSCg4LOZhE50ieWAHgl8R7LZswcvckZZUExrYqBYF5KRl6JHRt/FRe96bXu
         z8CA==
X-Forwarded-Encrypted: i=1; AKwUvBzoDoroFKS3kQnNCI6HpqV9FvgMDG/3TpSZP9RSmkGwbFXi1rmoAPuccDXZIZ/68eqSfwMiuPkq6ams6uT9@vger.kernel.org
X-Gm-Message-State: AFuF++nsOgN5DLcRVttWYGtQEB+60gBZWvw087QX5WJo7CgbIiD9bPZT
	WSyehYb/PqqsOoh5T/7IkENr83s4HWVsTgDVL2GjbU4XPKaTQEF7LYdiBhu+oav+pfABASkQOC3
	RfbXLcE8WqqbJfsw1PFkfJa15cFlCUvuY8rmF9CGtwycUSeFSLZH9KQAbtZpkoB7hTIba
X-Gm-Gg: AYBFou0tZZSuDuBxyio2FwStC7C1nLBgEfJU/d5qmzX4IJ9Ks2gIS6hbTaLSLEY72Y4
	1S/U0Q6f6d+nq8Td6cyW3juy3rmxZ2cCE5qk++vXztUA0qiWet0yKBQ7oW0uR3KzumczkM8BYIG
	ZHIAknpF/8k1SlZKb2pEHKTiodQzyF3nemXZVRmHzAfdFff/xPj2UNnyl4IcL55wVQWPDzOn4RB
	fM/HeTotndkw+pHtMyHDF5893ZvGHjr8Pmz3l3oCcvKLoTOwev8vLkeeRySiJrDeA81BfIpbkjr
	uiqOMjUkUWZBp9Jr78XJCRSunGZ7EER+kD0VPPBkOgzHqRhWfarCV9BrMYYaA9sX5viUH6mxzmJ
	VN5kZBCc1unRees/TbpMGHZ3QfcvjN3IK5FOtDOOSx3DTGha/QnTt5XlzKTfXD2F85R3F36Qa2k
	YiXR8vtCdb+wyt
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr12082408137.6.1788864537607;
        Tue, 08 Sep 2026 03:48:57 -0700 (PDT)
X-Received: by 2002:a05:6102:509f:b0:785:e444:15e4 with SMTP id ada2fe7eead31-78a4a87d391mr12082372137.6.1788864537092;
        Tue, 08 Sep 2026 03:48:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b6166fea24sm3121617e87.48.2026.09.08.03.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 03:48:55 -0700 (PDT)
Date: Tue, 8 Sep 2026 13:48:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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
        Dmitry Baryshkov <lumag@kernel.org>,
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
Subject: Re: [PATCH 2/5] drm/bridge_connector: preserve connector status for
 IRQ-only HPD events
Message-ID: <cwa6rmvixxmbw4ga5ujq62kzwn2rrb6ysvv5fqd3oge662ai52@dtvw4so36l2p>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
 <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
 <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
 <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
 <61c3f894-264f-4878-bfe0-4567f4317e9d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <61c3f894-264f-4878-bfe0-4567f4317e9d@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ePkjSnp1 c=1 sm=1 tr=0 ts=6a9fe81a cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=79fl_rtsZexB1o3ud2EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: 2I1rLjB1pU-dpcE0NXILdo0Txpp0r-lk
X-Proofpoint-ORIG-GUID: 2I1rLjB1pU-dpcE0NXILdo0Txpp0r-lk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDExNSBTYWx0ZWRfXyG7/pnD8ebfu
 1Iu/EC5jQGRLLCf5ITGI9RQcibn28acHn83h3AanfLU419ID9sa0njtgqrsPdQsXPaGcu+v68Mb
 okARxJ5GLsnuuws3nnrfq5ZHkNMzT7hsRJIwOL8/2iya0K1APVxjzbLlasgNW3REerK0TQ/DIs7
 wMQsIkpZ7scaTlLJbUKLSLHmPHIKODY5ls8EmFHh69wO9NRPmutDJofh7eGCHsPRrPSR+E0IAdR
 UY0DeKBbT1w0KNp3ddkUfT8RCgdRf2fvdnDzgmDz4VqTBpDjIqlaYHfF4J97UdTmO9ZBoUXgiAs
 saLQhhC+5i9hLw9I5SYikxhDU9i0Vsw6bmJxlhd68lFbk4EoQvMpLpTt+0chRVRzpG7UfFzhiAT
 Ox8LMP+Lzs8WcnOBVZRQduRAvPD9WbD5DuBFMVVSrhDNsvr5Uc44QaV9q0WFQgHXNXR2yLy2dHr
 571zU50vI8yo4qUwoyQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDExNSBTYWx0ZWRfX4r0hTXfjgTmF
 WamzYqJwin6m6axFvAIRKO0O54ekHA1vQB8MRPwCUazNc+ltrQnPJR1v1uw66lL5qRwjvGkJJFc
 5UI1DUV4bUUlompEkKGy4DKXOo3BIJw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080115

On Fri, Aug 21, 2026 at 03:19:41PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/18/2026 11:18 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 17, 2026 at 04:02:31PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 7/12/2026 6:33 PM, Dmitry Baryshkov wrote:
> > > > On Mon, Jun 29, 2026 at 10:48:04PM +0800, Yongxing Mou wrote:
> > > > > The bridge connector HPD handling path currently updates
> > > > > connector->status for every hpd_notify() invocation.
> > > > > 
> > > > > This does not work well for IRQ-only notifications where the event being
> > > > > reported is carried by extra_status and no connector status transition is
> > > > > associated with it.
> > > > > 
> > > > > One example is DP MST. HPD IRQs are propagated through
> > > > > drm_bridge_hpd_notify_*() so that bridge drivers can process the
> > > > > notification. During MST operation, however, the SST connector attached
> > > > > to the bridge connector is intentionally kept disconnected while the MST
> > > > > topology manager handles all connector creation, removal and hotplug
> > > > > processing.
> > > > > 
> > > > > Updating connector->status for an IRQ-only MST notification may cause
> > > > > the SST connector state to oscillate between connected and disconnected
> > > > > depending on the notification path. These artificial state transitions
> > > > > can later be detected by the polling logic and result in unnecessary
> > > > > hotplug events being generated. Userspace then re-probes connector
> > > > > status, potentially triggering the same sequence again.
> > > > 
> > > > Then the API might need to be adjusted.
> > > > 
> > > > Remember, we have two usecases, which we must be able to interpret
> > > > correctly:
> > > > - The driver gets separate HPD and IRQ_HPD events.
> > > > - The driver gets HPD and IRQ_HPD at the same time.
> > > > 
> > > Ohh yes, here need to rework.
> > > > > 
> > > > > Treat notifications with status == connector_status_unknown and a valid
> > > > > extra_status as IRQ-only events. Forward the notification to bridge
> > > > > drivers without modifying connector->status.
> > > > > 
> > > > > This keeps IRQ delivery working while leaving connector state management
> > > > > to the component that actually owns it, such as the DP MST topology
> > > > > framework.
> > > > 
> > > > How is it handled by other drivers (i915, amd, nouveau)?
> > > > 
> > > i915, amdgpu, and nouveau don't go through the drm_bridge_hpd_notify()
> > > bridge chain -- their DP controllers are integrated into the SoC, and
> > > HPD interrupts are handled directly in their own encoder code.
> > > 
> > > MSM DP is different in that HPD comes from Type-C / pmic_glink altmode
> > > via aux-hpd-bridge, so it has to go through the bridge chain, which
> > > means this semantic needs to be extended to the bridge API.
> > 
> > Still, when do those drivers send the HPD event in case of IRQ_HPD? Or
> > is it that in their case IRQ_HPD just triggers inner logic to reread the
> > status registers and then the driver sends the HPD if there is any
> > actual change?
> > 
> So my understanding is that,IRQ_HPD is primarily used to trigger internal
> status revalidation. A hotplug event is only generated if that processing
> concludes that there has been an actual connector or topology state change.

Ok.

> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
> > > > >    1 file changed, 12 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > > index 5edca47a025f..7334d6677604 100644
> > > > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > > > @@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
> > > > >    	struct drm_connector *connector = &drm_bridge_connector->base;
> > > > >    	struct drm_device *dev = connector->dev;
> > > > > +	/*
> > > > > +	 * IRQ-only notification: extra_status carries the event but
> > > > > +	 * status is unknown — do not overwrite connector->status.
> > > > 
> > > > But it's not unknown at this point. The connector status is reported
> > > > following the HPD status.
> > > > 
> > > You are right, in the SST case the bridge_connector status does follow
> > > HPD / link status -- because the bridge_connector itself represents
> > > that SST connector, so its status naturally is the link status.
> > > 
> > > The MST case has a key difference though: the SST connector must be
> > > explicitly marked disconnected (to prevent the DRM framework from
> > > enabling it), consistent with what i915, amdgpu and nouveau do. In
> > > other words, once MST is enabled, the SST connector that the
> > > bridge_connector represents no longer equates to the link status --
> > > the real link is managed by the MST topology, and the SST connector
> > > is just a placeholder at that point.
> > 
> > This is fine.
> > 
> > > 
> > > The issue is that IRQ_HPD still travels through the bridge_connector
> > > chain and takes the old "update the SST connector's status -> emit
> > > hotplug" path. Under MST that runs into two constraints -- and this
> > > is exactly what this series is trying to address:
> > > 
> > > 1. The SST connector represented by bridge_connector no longer stands
> > >     for the link, so its status must not be overwritten by IRQ_HPD
> > >     events.
> > > 2. IRQ_HPD needs a clean path that does not trigger a hotplug on the
> > >     bridge_connector -- the MST framework already manages hotplugs
> > >     independently.
> > > 
> > > Using connector_status_unknown as a sentinel here does feel a bit odd;
> > > let me think about whether there is a cleaner approach.
> > 
> > The status here must represent the status reported by the corresponding
> > layer: be it DP ALtMode, the dp-connector driver handling the HPD GPIO
> > or the DP driver itself handling the HPD pin via the state machine.
> > 
> Got it.
> > Is it still an issue if the bridge's hpd_notify() callback determines
> > that we should not be reporting the event and drops connector->status to
> > 'disconnected' again? Why is it an issue? Should we instead filter the
> yes, it still an issue if each irq . The SST connector  should not be
> reported as connected, even momentarily. When the connector status is
> changed from connected back to disconnected, this state transition is
> treated as a hotplug event and trigger hotplug, introducing unnecessary
> userspace polling and re-probing.

Please correct me if I'm wrong, if the AltMode sees the HPD=on, reports
that to the rest of the DRM subsystem via the hpd_notify or oob notify,
then the DP driver identifies that the DP Sink is not connected (or that
it's an MST device with attached branch devices, etc.) then there will
be no status=connected HPD event. The userspace might still get the
status=disconnected HPD event, but that shouldn't matter that much.

> > HPD events in the drm_sysfs_connector_hotplug_event(), making sure that
> > we don't send duplicate disconnected events?
> > 
> I think driver should confirm it really send a hotplug when we call
> drm_sysfs_connector_hotplug_event()
> > What is the expected behaviour of drm_client's?
> > 
> - Genuine connect/disconnect: the client is woken up, re-probes and follows
> the new state.
> - IRQ_HPD with no actual change: the client must not be woken up at all,
> otherwise every short pulse triggers a full re-probe of all connectors.

A HPD event on one connector should not trigger a full reprobe of all
connectors. It can be an error on the kernel side, if the kernel reports
a device-wide HPD instead of sending a connector-specific one or it can
be an error on the compositor side, if it doesn't handle
connector-related HPD events in an effective way.

Anyway, I really don't think that the kernel reporting a "disconnected"
HPD event on the connector which was already marked as "disconnected"
should be a causing a lot of troubles.

> - IRQ_HPD where the driver does conclude that something changed: the driver
> escalates it explicitly into a real status notification.

Agree here.

> - The SST connector while MST is active: permanently 'disconnected', and the
> client must never select it. The real outputs are the MST port connectors
> created by the topology manager, which get their own hotplug events from it.

What is the "client" here? DRM client? Compositor?

-- 
With best wishes
Dmitry
