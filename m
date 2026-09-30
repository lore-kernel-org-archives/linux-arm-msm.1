Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5023951D51C
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790784718; cv=none; b=ERc5ArFIwSZyg63KEA9GI6kKicOssMzNdO24Z1zfDoIxvg9N1T3yU6nPGorAGvx2IGOxBRr//FPX48gE6Lv/hIoo5flXchlp313mB4tVNzVVEHTFc510P9dP0YLN4EJU44ZKxzseTtxadfIKFk5ouj336es6bHprtSU54dUXDSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790784718; c=relaxed/simple;
	bh=MMzkoIa5W4W7WaLxk/iae6bHnZBmmK28HNb+6svHQBw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6MzZQL/8f1/eupb0TWaLnYXxzxYW4SNllpZ7/z16iVTMBMNvbcXzD0TiOB9ibr9G3EjHDp1ehHHnT4BXWOufUgOy7ahfZlWrHJwg4Jb7CPBb8PKeeTXPInRKD38EEXzkqbAzXE8468Hkb4uYwmkB/AOLvym7ylabUUGyzhTH90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpmokK9M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B93LJjl4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpmokK9M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B93LJjl4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UFXPlJ195126
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CE5fzGfnss3B8b8Hj0+v+nIZ
	el8CUQA7gROgRFIbLNA=; b=jpmokK9M6UYnEBW+0hyeywfzDVRkd1A9uF73yj87
	QBytSWW/5Hd3L9R8ZoNKImoC7umHy6JYiRdOk0hDfQ0+BD4KpuYQ7CH0O04yFhpS
	UqvQHnEFpqwct+GJxZy7YiEow+cOS+IMu9jzlCDUad0lCNXazMNbknFIQo0WfpuG
	8FHe0yXOpM+aDdNl2iYDIQkGU4f6HfyTPvh+AZSH/qnnLiPlFVBbl3G3XIweZB20
	eSr+7SbRWP4mFvKWWcpJjL6WauKZ6KBYNP6p6WviS59ZB1IRvdpkaWB2EriL285p
	WwQdF/bSDXBVRdn7do9O8aH8rjVNnRdlDXGQscONvIdF/A==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h155vr55m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 16:11:51 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7bca0b14d03so269671137.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 09:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790784711; x=1791389511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CE5fzGfnss3B8b8Hj0+v+nIZel8CUQA7gROgRFIbLNA=;
        b=B93LJjl4cPWZeYMBzhHhgxiKpXs7yXD0ny3YyKWphV74amsZAc0O/d17+abmSckKyi
         sfFK3i51DlZufXA2LhEKPNyYMn4OE4m6fHl0XFMXfi3AaU2NQGhQmaYJMsYshf3FkKbJ
         AqW3NrtlTRt60oXw22NlN3+ax/7tOEneTboKI1Lg+aPYpDJzsC6g0FzE9jXHVIuD85eL
         vEJusJIcDEtSEaQAXEet1Hivk2XW6SxIXDq9AVoIfQ0KKGZ/mpKUlvbT7D1+i/HadKQj
         iCCbyiIp+jV11ru/cT+g9Y4bw18y+igbi3P+Z+aa2J9E+v2aAfhGmROsCDold4Vfk2lh
         Pqjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790784711; x=1791389511;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CE5fzGfnss3B8b8Hj0+v+nIZel8CUQA7gROgRFIbLNA=;
        b=vq2ng2DYyzE2wq2zGlOIbD+Fxs1ehvSn4+/K+OOkPKPJ/6t+QJDr8SJgrCTw008qRU
         u+/0kq8ic+12erJ+TatrLDWz7ZsEKL5z/9BSk0G/pT4UbCZ4P4shMqRe+a8sbOLW0xk+
         H4aHftCHOSgD0263Xt+MlE8MD0UMS/YMRn1lVkxCC0sVIQj9Mfang9xCcnzlaD0UIIDM
         CTGHH6h/dMa5PMBG1snCdRGRVzKygHQe649FwiQOwBJoo7NfFCQkWO/jqseDTGVsHFVX
         s6S6Zp5HuiEZT7jEULc5Stf29Us/5PMgGjCuwj/oJBhGn7/KsfEPybKcjhQh3uIViGRQ
         zWoA==
X-Forwarded-Encrypted: i=1; AKwUvBzBYOFoUV6jlsUOubBusFUbWpCqNyf5Y1uDeSqt4TMBHJYIr5bHHOk1BQKlgs+ooORX3mqN6bagH+zTk6CB@vger.kernel.org
X-Gm-Message-State: AFq9FYLoI+IL4LV6hldsEPnXothcdctJo6wKe34LLBoeyRyUTrXEwIkQ
	v/haBFW6tb1SnY+DAV8o0+3HkWb1cTlagw5a0Ye1rjNXKf58Q12hNuZl1tptGOPmd3mt/l5Logq
	rmJfUBumz1Zu1pJnUMyAfKBhf/UWudCY3Tkkn2AJcJQX0+GdZIYP1QMU/31ZTV2oNY8OB
X-Gm-Gg: AYBFou1IvKtyoAL+40T6K33eiHYrlhrNLnAzFgTprt/ev/hb7uNSwMtinE7oyRmeCea
	RKB8ZzBsTWs8qUtE5sYz+GQhHm4noVgca+SpA6ThGDSCFDIAkJ37B6vzGoTeu91mbp6C69fZVbL
	srTO5gpshf/3plk5khYszCTCq+j/OlnCVyeMpwMI3Y8W8GBuJeDCmyPTTEhBF6Kxp1m15vB136s
	dvGVnnTV8EtXG7h1Zs7Sc7a3Q6/1VyvZIh7X8zMHaLD1AGUSbzRoRzBPgWnMlbuXdGTTKR44eKh
	QEtbyqggpkeWVWdAHeIJcRIv/o2LknxtHyZy42BKKu2ZzAmAE+vsw1k9Ek0jHfc0hFueRAh6KSt
	1WC56wT3MqW9gg8vELVRJD1+3QK9ZozmmEc1jsEyql6MIN3bq06vIhUKLSvacBvXuhAolPLLfdM
	MV+J+KNsFlbC62
X-Received: by 2002:a05:6102:50a9:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7be72ca9a6bmr436068137.7.1790784710658;
        Wed, 30 Sep 2026 09:11:50 -0700 (PDT)
X-Received: by 2002:a05:6102:50a9:b0:7a5:7282:1994 with SMTP id ada2fe7eead31-7be72ca9a6bmr436052137.7.1790784710056;
        Wed, 30 Sep 2026 09:11:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fc4e9asm84041e87.79.2026.09.30.09.11.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 09:11:48 -0700 (PDT)
Date: Wed, 30 Sep 2026 19:11:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 06/13] drm/msm/dp: Report stream enable failures through
 link status
Message-ID: <mhmfvshq3dy6pwyvtuplakqqiu3ybg44xd4aazuhex7fl7b4uk@33fky22t27r5>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-6-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-6-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX30dWO26lHrXM
 s4/+Qb0f7fC1ep04BS8mIs4hkTGAOgQxvhrlQAFnVHLfIfG5ObQoNSsxkuO7xJ2foUVIW/C80dB
 nipRPYNa3sRGwFLHkXU77YxnOYvPPZY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA2NCBTYWx0ZWRfX3s+JKdcOEl5v
 09CPPMu62O141Tz6JI8UI6bXzA09thobZeJIuFGvleg6TM/ah5zK9dx71TSGBeevytVQolQTK5X
 2k2Ix4Kc54gbAvrnR+D/YNBmltZ45vdbWXvCi6Y8II9+kLBUYrTvfLKOSBrUMoJvRzfaCUYRfRm
 XmrSqg72L7z7iPCq2WxytDB0LYsQdyaPIBGRwD+KWBj2Mi0VPM95Is1S6pmd4VVaJg4hQBqY4Ps
 c//+wdiiKuJidijuoZwhcuAb3w4t66GJHQxrJ/aq/EgchpgpF/FCgcK8RTQ9Lrh+6Bho078cRiz
 eodbspsSqgOSdggW+S4Fri9ryQnx0y+Tojl/o9NHzkqdbm6Vjcr9W5NQMMR30ReFtV8UMd+jusi
 tM8Acdkm/6TXny02R3xi0NUQjH4trsfnFtcbjWqPtiBx+QcXs43Dbmu1gSaitx00dy/QD0mQvED
 3hZXsolaE0X2vc0C55A==
X-Proofpoint-ORIG-GUID: gP5x_OzgQ9h-gDr_IIcHCoCeYcdwP6hP
X-Proofpoint-GUID: gP5x_OzgQ9h-gDr_IIcHCoCeYcdwP6hP
X-Authority-Analysis: v=2.4 cv=ZYOIpcVA c=1 sm=1 tr=0 ts=6abd34c7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=ksxQWNrZAAAA:8
 a=7z2oCe98pf8tU8XqQ0sA:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300064

On Wed, Sep 30, 2026 at 08:41:50PM +0800, Xilin Wu wrote:
> Atomic bridge enable callbacks cannot return an error to userspace.
> After a failed enable, leaving link-status unchanged gives userspace
> no indication that it needs to retry the configuration.
> 
> Mark the connector link status bad from a work item after unwinding
> the failed enable. Send one connector hotplug notification per failure
> episode: fbdev can synchronously retry the modeset from the
> notification, so notifying on every failure would create an unbounded
> retry loop. Subsequent failures still restore BAD after a retry has
> set the property to GOOD.
> 
> Allow notifications again after a successful enable or an external
> sink connection change. Do not reset the notification latch during
> eDP's internal plug and unplug handling, which runs on every retry.
> Ignore queued work superseded by recovery or an external unplug.
> Serialize the failure state with plugged_lock and update link-status
> under the connection mutex before notifying clients with both locks
> released.
> 
> Initialize the work at probe and cancel it before unbinding the
> display.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 63 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 61 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index ae967ca652c9..1bfa6696d904 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -12,9 +12,12 @@
>  #include <linux/phy/phy.h>
>  #include <linux/delay.h>
>  #include <linux/string_choices.h>
> +#include <linux/workqueue.h>
>  #include <drm/display/drm_dp_aux_bus.h>
>  #include <drm/display/drm_hdmi_audio_helper.h>
>  #include <drm/drm_edid.h>
> +#include <drm/drm_modeset_lock.h>
> +#include <drm/drm_probe_helper.h>
>  
>  #include "msm_drv.h"
>  #include "msm_kms.h"
> @@ -54,9 +57,13 @@ struct msm_dp_display_private {
>  	bool audio_supported;
>  	bool stream_pm_active;
>  	bool stream_link_attempted;
> +	struct work_struct link_status_work;
>  
>  	struct mutex plugged_lock;
>  	bool plugged;
> +	/* Protected by plugged_lock, including accesses from link_status_work. */
> +	bool link_failed;
> +	bool link_status_notified;

Do we need it? I think, it's easier to send several notifications.

>  
>  	struct drm_device *drm_dev;
>  
> @@ -204,6 +211,39 @@ void msm_dp_display_signal_audio_complete(struct msm_dp *msm_dp_display)
>  	complete_all(&dp->audio_comp);
>  }
>  
> +static void msm_dp_display_reset_link_status(struct msm_dp_display_private *dp)
> +{
> +	lockdep_assert_held(&dp->plugged_lock);
> +
> +	dp->link_failed = false;
> +	dp->link_status_notified = false;
> +}
> +
> +static void msm_dp_display_link_status_work(struct work_struct *work)
> +{
> +	struct msm_dp_display_private *dp = container_of(work,
> +			struct msm_dp_display_private, link_status_work);
> +	struct drm_connector *connector = dp->msm_dp_display.connector;
> +	struct drm_device *dev = connector->dev;
> +	bool notify = false;
> +
> +	/* Match atomic check's connection_mutex -> plugged_lock ordering. */
> +	drm_modeset_lock(&dev->mode_config.connection_mutex, NULL);
> +	scoped_guard(mutex, &dp->plugged_lock) {

Please use drm_connector_set_link_status_property() here. See
intel_connector_modeset_retry_work_fn(). I think, there is a TODO in the
driver code, you can drop it too with this patch.

> +		/* A successful enable or unplug may have superseded this work. */
> +		if (dp->link_failed) {
> +			connector->state->link_status = DRM_MODE_LINK_STATUS_BAD;
> +			notify = !dp->link_status_notified;
> +			dp->link_status_notified = true;
> +		}
> +	}
> +	drm_modeset_unlock(&dev->mode_config.connection_mutex);
> +
> +	/* fbdev can retry the modeset synchronously from this notification. */
> +	if (notify)
> +		drm_kms_helper_connector_hotplug_event(connector);
> +}
> +
>  static int msm_dp_display_bind(struct device *dev, struct device *master,
>  			   void *data)
>  {

-- 
With best wishes
Dmitry
