Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1A0288D0
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023110; cv=none; b=RZADclQAOB0fnCJVNhDttjfcSIj+eJ2F+YcpjMe1kSdEiJTW6tIe0vIpyh71zBl5+/SoQ1JJryF0szPZOcMQDNOBtLGQmNqgsb43xH9ogD4hk6cbDe4u6Tc36fIfA8hf5aoZ97bxmiFjWA8TleHBwEwU4HBHC1hEMl5mQAD3FGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023110; c=relaxed/simple;
	bh=Tfji4a+4dxpFqqxVmIBn9K79pA6nclL2HmucTWQNIRs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FILqlCnco8ALejm1TKs/TX3rzU1XggiynbV8knJT/Q0SSZDHtdkHamjtoi1JN8ymZxXaHpqV8tJ83c7L3N8ZGy9xAaRCClQ01+B6HGBRTx0vSqj2OFgQ0pefsH9oqLh0ToENXMAwjcfKgOL0KMpoyEXwXh35S0hqe9VCrEgdVGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WkK5frd7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LvwBjVVw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WkK5frd7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LvwBjVVw"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I28j6h2885031
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:18:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nulXSaXrAlQIr1GDe4EmANgxiU9rNDcxA688/Kv27N4=; b=WkK5frd7fdbUdVqb
	U3sPn10YKKrMrbK6n3tDunsyDRNy11RfIQla6GuHj53JCjCa2bMY6vioFOBYtinc
	gOlm971q3CgYaqI+kw6/EyXvcs+HXi+QXw8MGx1FeP9E4vjmhV1TsG1aZQTl8c5o
	+6KUQR9EexwshPmj0bycvD3sBwvUrvYnyA7J2iTvtwFaxMHZWl3I7774PZpY6B4P
	hX2gSKf69Eubsh3WllT0MP9Eedb8UiNnfDxaztxWzAzPZ8HKMvoI3uTbb68I6Z1n
	5T7M95LY1yoLM8Dj5fk4AnRykjOYcsikmFCEplvgpPX2i21+8aEwEC8iAAp52SvA
	a8QW9A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4ebpr98w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:18:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9368f2b7b2bso416055585a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023103; x=1787627903; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nulXSaXrAlQIr1GDe4EmANgxiU9rNDcxA688/Kv27N4=;
        b=LvwBjVVwSRLGFnsjq3QkjNvX5LMe2cF3E0LNGtH9t2ANEZYMEaTiDo1W8QDeTS6YNO
         y0jVhNWYc+FAaRLRAv9ZdJgiZXsPF/YwSBUJqXyudSa8f3ghV4y9UMBglFjMURMlgD+F
         f0pTgte0CJsL51JAoN8q2Mw9mTDl/0WK06fPZG+lTe6L3ZovDOPgdWtqlwyYmzflUioG
         EEt23J0xP6XvGhFrfWUgaVWKmffXbmPCEV4sA4nRstF7bCamWDu1fe2wwSWE6KQxbQ9Y
         PVsWIxeaHkhPYfb27nVV/OiiijNqmnS5h5fVFk0Q8cqSSE0ez/67Qfv/I07GFp+Xqvpn
         cLnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023103; x=1787627903;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nulXSaXrAlQIr1GDe4EmANgxiU9rNDcxA688/Kv27N4=;
        b=PbPa/Y5vabWpuimDuNCIvWXrrwWAtO6Bxl/VH4UX8SxtTo7fJ063hdHkdRKjpD8tYK
         eO94Z6OaIztlkEDBUB/VOppDRMmmpUNCK3fyKmMMGME2TFEmZWdlIvTaYd54rBwwsGF/
         FDzbrz+UFcEJlZ8XS+M4UplDt8eBZQU0AOgvtNW5kTq0QpihqyvAneTyrgYk9a+nxKLe
         9pDyME4Yd22H5HhGQ17f5le9s51rANpT36lh03qzExfXf0js8rDEKYJyRs6uo2cKzBAh
         zbXmhmXszRO0sL1Yh+Xkj7En3pePnizSJLJTsp8qxdlc+7dvuvi+/EXK5nJFCLagdb0j
         WL8g==
X-Forwarded-Encrypted: i=1; AHgh+RqM43nccpTVCseEfFfoqAPey0CAdly3azzNAqytATXFqiekFKxw1Z8xIH4DST2+4ZLjH4GKII1eyu5b/uoP@vger.kernel.org
X-Gm-Message-State: AOJu0YycL/PUQG+84Vyw3ePNC/TkaI5I2dBSoIaE3gE0tGQC7IrUflx7
	kucwP8moiO4lo0ODAbgKx1T5p1gFEufgPPpu9ikWGQ1oga7agmBYj6TES9elKdL3VsoT1szYsYY
	dV8bZjrD1yZ1ls1vqZ1Q+4Jy4mTjfphQNEwY4ecwSH+msdRHbS2zWEKeOgT6Rw2tgj2Nr
X-Gm-Gg: AR+sD12lpxLRzeYBAWUko4AWUEJknnJDmCY0s3txOj5m56X4hfUOfywO8UmUYVQik6W
	o3WZ2+RrrWtTaIEkiWvh42JbbeNUCkAgRDdByvoOvpQ+wk89mgkNs2ueYCw8ook+CvMBgcOPnO/
	eAzIWLieGFhXvhD4DxOyUMOhBxh15ZrEZXw34jSXReLDb9F6rUho0o5LRO8LHoSFqbMWySKo/aT
	TfOabjjrBGa7Qyce9H8Qi1S8XPfyBTOl3U/glpYiWkFrTwuSuOUsBxTzsxKbTP7e8UJipgjI4BL
	7Otb1uiZ0oieFG4acEyDtc7g9i9SKpn+eacvhgR3TsnPnLwJN/TYGWDX8PzBZZVsQgWOq3755/q
	b0tG/B767NtC3b82NxmaGVev7MeuHvu1Lkqf+8GSUGkkLFC0WwaNrgfM22i/AFCUikdRq1vDblK
	ui/Sw3tcWMdB8z
X-Received: by 2002:a05:620a:261c:b0:936:dbf1:f4bd with SMTP id af79cd13be357-93704beb3c5mr569254685a.47.1787023100489;
        Mon, 17 Aug 2026 20:18:20 -0700 (PDT)
X-Received: by 2002:a05:620a:261c:b0:936:dbf1:f4bd with SMTP id af79cd13be357-93704beb3c5mr569251885a.47.1787023100020;
        Mon, 17 Aug 2026 20:18:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cffeacfsm830534e87.54.2026.08.17.20.18.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:18:18 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:18:16 +0300
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
Message-ID: <vr7pqox5gusdyqd5jvmiu3gy7bbjm4znr3pcsivbe2loa46mff@t7atknofandt>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-2-646a10256233@oss.qualcomm.com>
 <famoeog5snpvj24b6izwox2gy74ywnwmybflfv2tvr4hjuix5q@cbtce5s7k7sv>
 <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c36875c1-2d22-4c16-ac2f-4f4a947ed69c@oss.qualcomm.com>
X-Proofpoint-GUID: mgM0O2kIbVn_gxf9VO3oTyK_kz8JEybL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX8iwcQi77BpzR
 A1tB+/6qa6T/aXkIpaoxQgf9j4UxAqYR+qJfXltCCJdri3N/02mKT5toYia29bZ00JJYE6OzrB3
 We5XU39++DVQZ5/37RcBieyAxib2o7sG4NXW8/5521SOzX75HcccRMR7w2uR0HMjj1o9mcaCUg+
 5sv3+nAs9BSCeTJyX0sQ4NnaGg4E36SouuONzsTTDZ72A+fY3yrMoe7wuCyuG3rQT2HqnDBd0nW
 i438bfDAFMFScpLRjj0j4INeMGEMo8YP+V9zjur0l8YZyWtPpikjhV1tyBJSmJaUQkworbqhKrN
 6BsAiZUAKeqt7hG+1hTH4DVQZH03fw0/H6m5shTK+MxEA1Nyu1lLtwt/XjtjV5mra74fTodtCZt
 uEiLw2QSfJMbkOTjG/UN8GRqi81Mn0TWDdco99Oq0JPNmtGB7pnYM+bxklvCXhj6VrpWRe+cw3E
 clq/SlIKL8OEAGJlptw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX8vTy5uhF/hIf
 3wkS9ayT56QIRWwsmk4sSjy1Y/2n3JhvW6yM2iTBARrnnDHqGX5bLP9KMTuIazPyuZR+rDRIWsK
 WrUzQSHdriaLKbeznGlkf9a1cBe9lGo=
X-Authority-Analysis: v=2.4 cv=FsU1OWrq c=1 sm=1 tr=0 ts=6a83ceff cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=JfrnYn6hAAAA:8
 a=EUspDBNiAAAA:8 a=TwwRWlU4pX-Acn9O6hYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: mgM0O2kIbVn_gxf9VO3oTyK_kz8JEybL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180023

On Mon, Aug 17, 2026 at 04:02:31PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:33 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:04PM +0800, Yongxing Mou wrote:
> > > The bridge connector HPD handling path currently updates
> > > connector->status for every hpd_notify() invocation.
> > > 
> > > This does not work well for IRQ-only notifications where the event being
> > > reported is carried by extra_status and no connector status transition is
> > > associated with it.
> > > 
> > > One example is DP MST. HPD IRQs are propagated through
> > > drm_bridge_hpd_notify_*() so that bridge drivers can process the
> > > notification. During MST operation, however, the SST connector attached
> > > to the bridge connector is intentionally kept disconnected while the MST
> > > topology manager handles all connector creation, removal and hotplug
> > > processing.
> > > 
> > > Updating connector->status for an IRQ-only MST notification may cause
> > > the SST connector state to oscillate between connected and disconnected
> > > depending on the notification path. These artificial state transitions
> > > can later be detected by the polling logic and result in unnecessary
> > > hotplug events being generated. Userspace then re-probes connector
> > > status, potentially triggering the same sequence again.
> > 
> > Then the API might need to be adjusted.
> > 
> > Remember, we have two usecases, which we must be able to interpret
> > correctly:
> > - The driver gets separate HPD and IRQ_HPD events.
> > - The driver gets HPD and IRQ_HPD at the same time.
> > 
> Ohh yes, here need to rework.
> > > 
> > > Treat notifications with status == connector_status_unknown and a valid
> > > extra_status as IRQ-only events. Forward the notification to bridge
> > > drivers without modifying connector->status.
> > > 
> > > This keeps IRQ delivery working while leaving connector state management
> > > to the component that actually owns it, such as the DP MST topology
> > > framework.
> > 
> > How is it handled by other drivers (i915, amd, nouveau)?
> > 
> i915, amdgpu, and nouveau don't go through the drm_bridge_hpd_notify()
> bridge chain -- their DP controllers are integrated into the SoC, and
> HPD interrupts are handled directly in their own encoder code.
> 
> MSM DP is different in that HPD comes from Type-C / pmic_glink altmode
> via aux-hpd-bridge, so it has to go through the bridge chain, which
> means this semantic needs to be extended to the bridge API.

Still, when do those drivers send the HPD event in case of IRQ_HPD? Or
is it that in their case IRQ_HPD just triggers inner logic to reread the
status registers and then the driver sends the HPD if there is any
actual change?

> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/display/drm_bridge_connector.c | 12 ++++++++++++
> > >   1 file changed, 12 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > index 5edca47a025f..7334d6677604 100644
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -163,6 +163,18 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
> > >   	struct drm_connector *connector = &drm_bridge_connector->base;
> > >   	struct drm_device *dev = connector->dev;
> > > +	/*
> > > +	 * IRQ-only notification: extra_status carries the event but
> > > +	 * status is unknown — do not overwrite connector->status.
> > 
> > But it's not unknown at this point. The connector status is reported
> > following the HPD status.
> > 
> You are right, in the SST case the bridge_connector status does follow
> HPD / link status -- because the bridge_connector itself represents
> that SST connector, so its status naturally is the link status.
> 
> The MST case has a key difference though: the SST connector must be
> explicitly marked disconnected (to prevent the DRM framework from
> enabling it), consistent with what i915, amdgpu and nouveau do. In
> other words, once MST is enabled, the SST connector that the
> bridge_connector represents no longer equates to the link status --
> the real link is managed by the MST topology, and the SST connector
> is just a placeholder at that point.

This is fine.

> 
> The issue is that IRQ_HPD still travels through the bridge_connector
> chain and takes the old "update the SST connector's status -> emit
> hotplug" path. Under MST that runs into two constraints -- and this
> is exactly what this series is trying to address:
> 
> 1. The SST connector represented by bridge_connector no longer stands
>    for the link, so its status must not be overwritten by IRQ_HPD
>    events.
> 2. IRQ_HPD needs a clean path that does not trigger a hotplug on the
>    bridge_connector -- the MST framework already manages hotplugs
>    independently.
> 
> Using connector_status_unknown as a sentinel here does feel a bit odd;
> let me think about whether there is a cleaner approach.

The status here must represent the status reported by the corresponding
layer: be it DP ALtMode, the dp-connector driver handling the HPD GPIO
or the DP driver itself handling the HPD pin via the state machine.

Is it still an issue if the bridge's hpd_notify() callback determines
that we should not be reporting the event and drops connector->status to
'disconnected' again? Why is it an issue? Should we instead filter the
HPD events in the drm_sysfs_connector_hotplug_event(), making sure that
we don't send duplicate disconnected events?

What is the expected behaviour of drm_client's?

> > > +	 */
> > > +	if (status == connector_status_unknown &&
> > > +	    extra_status != DRM_CONNECTOR_NO_EXTRA_STATUS) {
> > > +		drm_bridge_connector_hpd_notify(connector,
> > > +						connector->status,
> > > +						extra_status, NULL);
> > > +		return;
> > > +	}
> > > +
> > >   	mutex_lock(&dev->mode_config.mutex);
> > >   	connector->status = status;
> > >   	mutex_unlock(&dev->mode_config.mutex);
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
With best wishes
Dmitry
