Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8866374E67
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787023344; cv=none; b=U1z8jRrtvh7Usi9SjYTTf5KbbD7A0AtRBcbfchJIyUoqNCdgYajWMLbWPfGwX2aMb2FRiVWIJGVRlUIQ6raLq7AqXto4+voDbWHlKzXVBdiVjTjkx8b3Qkp0M/ON1b5E31ocu090dLtfk8S16kk9S5OFNkOMB1/QTRjXVxNtKlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787023344; c=relaxed/simple;
	bh=CZInZNmQBpWxY81KjVqKEJ7NkObsnW/lejSEFJTAZpg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BNUuNwUwGSHKQKIDo/PJ7dPPKmdA7r4z9YmZV5MYkvowOCDVfsKoB94qYoBDB7C489q/8jk1IGkO9XhyvxBEHhdamhWfWn3ZK5cXxJ9ghQRyKvBK+mBd9TYsnJBfHxWDvYZvEFaS0VoGJ3LJkpSMhIGtFbR6svr7vwRJMq8EfHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEIfS9N+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LcMheGVo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gEIfS9N+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LcMheGVo"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkXrM3464536
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:22:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j73bG+tmYVwAb5KvFoWsfW2d
	3OEy+/PhR/daxy+LBa0=; b=gEIfS9N+MIBWmQuKtz1VxzQ2+YyWmcmHg3HmqF41
	bQj6qxawqRFoTLNd9Pd9yeyek2qdJZyW0QKTsk8CD8jS3Bi1EUqAXB5OP5yYPdyl
	OsowqZlj1kWOPVi26fWMmLqTDUUUu7FWu/ZziKXReKe1LmOlmKUMBNWGTbUwxCEl
	WDtYDlvvUlRnmLvH29k6UVnN0sdSo6p3LHQQFY3RIzjeBncjsfzbroXqP0nSQ8dg
	L7bBnA5upxEuD5z0l6zXP61s+OHc98FNNC2BM2NbRFi9aHPnC/k2hd0wdGACnpPl
	Wk+EAN/mdc5M1jsjZzgLhFMSpKafUYOaOlwUakC/8SBIWg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4611acu1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:22:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5fc4c7e9so542715185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787023333; x=1787628133; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j73bG+tmYVwAb5KvFoWsfW2d3OEy+/PhR/daxy+LBa0=;
        b=LcMheGVoVGQu1nFMZgZMOednwuXYS2iksdF7YJj1hjx1d21qULQ1D3EtjPMXqOomq3
         9m8RsokZmmJD8F/6/Jy7oZlsSBgQ8F900g2zbDLRo1XVx/E4eM9lBG/0g8MVyd2DyJ6C
         envV4VEwVZE77ZYQopPzWiKTpB8lkhWlMlddYVUpaaslR9DkiO3t+H5uh6oA/DGSQind
         4+heGKOIBP6QnR6y5eBNxilxbBcDoJO/eJB2STT8XtO4k/lYPxypf3fj8rSh3dFqdq0q
         JlI5yQzQonZK5m9evzFs1sMyi3sJJWpfuvldNkpq+trP6fzmNvmKUW95UzwKdanOD3T0
         MxuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787023333; x=1787628133;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j73bG+tmYVwAb5KvFoWsfW2d3OEy+/PhR/daxy+LBa0=;
        b=m+LOFM+JCGBpuWE+lLIXcadkbIBQbS89gEjPDCmYDzVU7+ZkHSsHB507/KxxHpxDCz
         XczmTsOHUO8u8EpvsjrbTjzOMohePVmci2HtI96ipK/3eyKsCXPVSb6Xz3rAaNiaioaL
         WIqyQVtIaJVHyt6vnAYt9RJ7NQKXZMKal/wjLupABtXpUs5CHBkLnyra7rma4L1GTjUt
         jIuKOJAWJPd3ZEaRa8jmO+RjpBNSoaLmnl4ugtktU4NCoohBHkdsSM8124xQO1ZFd0hS
         kBoK4qi8SgKH9VzGXYsi1pe6NoJydAP/742ggAua1IPbURVwPoPNMBVsxMg9dV9rbTro
         9Cfw==
X-Forwarded-Encrypted: i=1; AHgh+RpFd69ZAJaoa0L9RGZQ1cYD/C1we+RMsH0BcoWLgb+BYf5khgQN5D+fXhPOXoUAzaeQH4Z2/gGVC6hIxrWN@vger.kernel.org
X-Gm-Message-State: AOJu0YwBhPyoe85ZNlXyFmTEqIzlYYHBgD8LR69xf8E5guPhiS8MciuZ
	iMrMQBd4CG2tGIUSUoFINzDxhzNIrt3XJTfSLF+8ZaNBKKQconO0nXKJawMKa/p4vTUQQGMl3Nr
	+jvIqbjE7IaPSWMqc+Ao+AC1NL2BhPSsCY2CkxlBREDueu8sXvPDXej1zoAI3hJb851HC
X-Gm-Gg: AR+sD13eB7MRfz2sza0yc63Gn2XzHiRhi9owxNubaD5f8T12APdns/tknA4bniyoI9o
	MfMMhluXEUO6o2sCQjRM3cpOSVu2sXXXuzJbzLR904j+EWSRYd62Jj8J1ePvTSe6x48X0NuSGlh
	A7aRVF4wM5cY1Tj6hjWJBnHT50iEUhxMBEdjbLO890jAbtfmSFbbLYdcdYBx25qFapB95iMpC66
	ZvWitCsIdOrx7H9AQ8v7sYggUd34Mg7Iy8q7WtRtSzG+OoT5sTYemmzhxVmhG4f3WH2a5aDmOIz
	8101LOn/7YREPYVfom68TO+kGpcZxoAwQkNdibeGV0Mm6DuH0SM35P+RtOBEGgXpnRYTwJA5pm/
	sWA6iH1VMh/RoJjW+ljxV/86hqF8tdpzl26lHQqWOoAVqoR80KnGFOo+1zAzNoHcAVl5dXJc56B
	N1DUe8tSJzcrhn
X-Received: by 2002:a05:620a:e1d:b0:936:bcf9:8539 with SMTP id af79cd13be357-936d232dab7mr1974699985a.35.1787023332733;
        Mon, 17 Aug 2026 20:22:12 -0700 (PDT)
X-Received: by 2002:a05:620a:e1d:b0:936:bcf9:8539 with SMTP id af79cd13be357-936d232dab7mr1974694985a.35.1787023332068;
        Mon, 17 Aug 2026 20:22:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cf95803sm836861e87.1.2026.08.17.20.22.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:22:10 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:22:07 +0300
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
Subject: Re: [PATCH 3/5] drm/msm/dp: suppress bridge hotplug events during
 MST operation
Message-ID: <r2xv3lsvku2wlccf44dlesqgrjqbvjrvike3jfx7casembecrd@3mw3olil5toz>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
 <fozk5fz6bgat55vmlgyvovnmfzabjprna46cmcaoh4jyrwmbtu@k2qtjgip5vg3>
 <d4e96255-814e-4fb5-8d97-50126a61c20b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d4e96255-814e-4fb5-8d97-50126a61c20b@oss.qualcomm.com>
X-Proofpoint-GUID: vK9wlaOMwwioSS3IBFCm6liCd4pWbCpK
X-Proofpoint-ORIG-GUID: vK9wlaOMwwioSS3IBFCm6liCd4pWbCpK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX3AhWYYx5q1Eh
 ZEI5n5vvseu+G0ZGC5fTIqePtuMH1rvo4GyTOcoYFaeTqIEIsyED94lvfQkr2lZpGmP506dLpxc
 DhrS7kgXXnldzcvMHX8dmy03F1cwDPo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMyBTYWx0ZWRfX0LnEU/zy2AsN
 0kzkcb08/gDoVsQaJ+rxzBV9XnC9Fz96JrO8WD1UMnxy2HhtAZNcyxtplVp+cmlAK1TV1bIWqSq
 SGEkMfJeaaJQtErDYqkSLAqIl4ivyThbGhQvOPTM/4bxTR1i9Xd2hLoVNnd8Ng/FKBRpTJmdGFE
 acOSmeSGbE5o84Tl68O4Jn3C4nEClPzdOedKlQE/seqW5s9nc44bmE3+UfrRmIVe43SP0RdiOI9
 DQS1WjvyYJ7p8nr6ko3DGFL6Y4Xiej+kIUtGwziLi+Dq6/i5xtMVrL9PSWSovewVEum4AisvwfH
 0VNYD3vbe1Py6YlKo6IMmjfSGZxAn1GQfJygx7kQtY6GKAtjjSrF2nPXMrKNOOPoFYjlCtNVSCV
 W7qoYrxACPRFovEQJ3/qiYkuRb8/sZF5uXHGWb3limta8GgqXfoDmdEDnQrizu4r/JRYlRsb/oa
 SVzPXevuhqtkmDWDoKQ==
X-Authority-Analysis: v=2.4 cv=UslT8ewB c=1 sm=1 tr=0 ts=6a83cfe5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pvfFc-ymSHibiSm0GcIA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180023

On Mon, Aug 17, 2026 at 04:01:36PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:44 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:05PM +0800, Yongxing Mou wrote:
> > > The DP MST framework already generates the required hotplug events for
> > > MST topology changes.
> > > 
> > > Suppress connector hotplug event generation from the bridge connector
> > > path while MST is active, and continue propagating HPD notifications to
> > > the DP driver.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
> > >   drivers/gpu/drm/msm/dp/dp_display.c            | 9 ++++++++-
> > 
> > No, it can't go as this. The drm_bridge_connector part should have been
> > a part of the first patch.
> > 
> Got it.
> > >   2 files changed, 12 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > index 7334d6677604..82ed0dc450ab 100644
> > > --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> > > +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> > > @@ -162,6 +162,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
> > >   {
> > >   	struct drm_connector *connector = &drm_bridge_connector->base;
> > >   	struct drm_device *dev = connector->dev;
> > > +	bool send_hotplug = true;
> > >   	/*
> > >   	 * IRQ-only notification: extra_status carries the event but
> > > @@ -179,9 +180,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
> > >   	connector->status = status;
> > >   	mutex_unlock(&dev->mode_config.mutex);
> > > -	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
> > > +	drm_bridge_connector_hpd_notify(connector, status, extra_status, &send_hotplug);
> > > -	drm_kms_helper_connector_hotplug_event(connector);
> > > +	if (send_hotplug)
> > > +		drm_kms_helper_connector_hotplug_event(connector);
> > 
> > But now I can also see that the idea seems to be incorrect. You are
> > preventing the kernel from sending the events, but it doesn't really
> > matter. If connection status oscillates, then other components might
> > notice it even without the event being sent.
> > 
> Here our original intent behind suppressing the hotplug was
> that, under MST, hotplugs should be sent independently by the MST
> framework, rather than being emitted along the IRQ handling path.
> 
> Following the extra_status approach you introduced, would it make sense
> to let the bridge_connector layer distinguish between long pulses (HPD)
> and short pulses (IRQ_HPD) -- a short pulse would not update
> connector->status and would not emit a hotplug, only forwarding the
> event to the bridge driver. Does this direction sound reasonable to
> you?

IRQ_HPD is not limited to the MST usecase.

> > 
> > >   }
> > >   static void drm_bridge_connector_hpd_cb(void *cb_data,
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index 6835c68fe510..bc93b566fbca 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -1790,10 +1790,17 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
> > >   			msm_dp_hpd_plug_handle(dp);
> > >   		} else {
> > >   			msm_dp_hpd_plug_handle(dp);
> > > +			/* mst_active is set in plug_handle; suppress SST hotplug */
> > > +			if (send_hotplug && msm_dp_display->mst_active)
> > > +				*send_hotplug = false;
> > >   		}
> > >   	} else {
> > > -		if (hpd_link_status == ISR_DISCONNECTED)
> > > +		if (!msm_dp_display->mst_active) {
> > >   			msm_dp_hpd_unplug_handle(dp);
> > > +		} else if (send_hotplug) {
> > > +			msm_dp_hpd_unplug_handle(dp);
> > > +			*send_hotplug = false;
> > 
> > Why? Disconnected events definitely should be reported further.
> > 
> In MST case, MST DRM framework will send the discconnected hotplug by
> msm_dp_mst_display_set_mgr_state(&dp->msm_dp_display, false);.

msm_dp_mst_display_set_mgr_state() is not a part of MST DRM framework.
But, while we are at it. The MST framwork needs to be updated to send
connector-specific HPD events.

> > > +		}
> > >   	}
> > >   	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
> > > 
> > > -- 
> > > 2.43.0
> > > 
> > 
> 

-- 
With best wishes
Dmitry
