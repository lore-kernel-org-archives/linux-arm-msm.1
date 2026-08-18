Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E672FE56A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787022117; cv=none; b=gTvhwPXmIRonKPUyRUWZyGjyC0Hi0OyLzim5Id847OPkdDX/8fo8jsS3H5j+mPrNPDJtwbM7cRD28C7bnH6e6nAc4DvmcO806kvBZxJvWP3lmjLpZA/BNVojNCa+R4BdpkI15VX/GzFbcD4N3CMpPoc9ZnxSgAHCTtO7NYMuUME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787022117; c=relaxed/simple;
	bh=ABwHQyhbAxTw04UMZaEMvSt2vigp+M2icWdz2CuwgBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SimjjXYtPza+wv0yUeV21U2XXBD1kFzIJWredd5vDJP7RiXZjYeEIsJwIias8BSfsZzFWAlH2xH8wlUevxAaUENxEm+DrqL8GoCAMD1SN6n979LqsU1sjTLIaml51/P0csD6fM9G2e1qHRw/tvdRlRik/p3IV7x/WiboLfYyVwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCt8SSDx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jPuX0XdJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CCt8SSDx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jPuX0XdJ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I2YTZE3762004
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZBz2J/YR064wcCDlSxnx2LWj
	NaH5A+0wFaq4Q0GwWVY=; b=CCt8SSDxuZAlXZCuVF7FdA4BBarebF0vi6DR6AUJ
	RohD5U3q065fxZ/SPY/Rj9yA0N/spjaxzfI6evKJnGwG9NZwKtYfIZlE+CAZ+VJm
	+jDyQlAqD6yFHtqJ7Y/wBOCet2HFnWUm/P6QKmnOVY0B5rQvXm5xag7Z1AEDvHLy
	0FTqbuMBdjcecjzVJ2w4QjuEt7kFy75e57f3gZXsF5/YLP4xJ8LViC0as/IfBbAB
	EKf/ZpbDUvXuMWFlBjjtUHGs+pPDy9yb2Eh+SYO7vc0nOv8KoOtrO9XMAmdGGJdx
	srrZQGKI+SrtZoXjSwkJsdqp0jzPrqsap/sri0fjwskkAg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtr2up-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 03:01:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92ef13b61bcso587930485a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 20:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787022114; x=1787626914; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZBz2J/YR064wcCDlSxnx2LWjNaH5A+0wFaq4Q0GwWVY=;
        b=jPuX0XdJYsk57DY6ltK+RJwNfFLjFh04JFFyKd4BpA2yv5mBOKvFcG1qrQWufNJc4G
         L9F3eeeTfPIiZjbUa4ZQ8X+/9SRi4N5D7UojhFMEyGNX/s7fj1QQoBLZSETa0nCmfnKn
         3bNQJHHx8qE3lKK51LHHxmsY2vYAWMOVQyrQ7Dl/poWav1Oa0ZZK7PfnE92NPaq6r4tf
         9p86YshXq8WqJEnJ+hC0kt0rAM6JuAZzvaetOJCTedJNUAf6GPU8+iyt8d6vNeDSRCOC
         RaNavIvsCNcIk508aOQRAc4vBCCxHHik4rffzpdvxM8TrDi72rmet+09dy5oHpB4fFdi
         RecA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787022114; x=1787626914;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZBz2J/YR064wcCDlSxnx2LWjNaH5A+0wFaq4Q0GwWVY=;
        b=b8VslgWhm1WS8fMaCc/1yEAJteUAJ7ouOYJxxbbz8pwTMvDIM8Y7NMGZmHO7Sv8ZN6
         9+nJl+n4juq0LSsX64aYATJESk7aCD69MVI66ewhUGbNxXpOcPbPyWhdipKyJNQU4MN7
         m+CQ5CLF3APqQMH6izN+BN/yQZnMAF6DUK+K+3Z20m3OOCGzCh8PxMCpzFqi3KKh6Kxn
         2+w09xZysHOAMAN3bmZJSIPXHQw8rehHu9KXB2pDbyBfeqdH0BOlD6jp0uoxtKedrMU4
         +FYPPrBv07V7FkoekFycVcTBdePIRbih+DBsnTFAntc+3TkeXjt90L5qbLGFFkr8DV6n
         xleg==
X-Forwarded-Encrypted: i=1; AHgh+Ro81B5S8SrM7i4/qWu/fGu9+V39K+W9W/V4HUovqSNV+zqngU1b9+poFo/bs6L2kOwznFwMIXyLL+QUlRl1@vger.kernel.org
X-Gm-Message-State: AOJu0YwgEdk8H1cjpzadbo7rerbJ5S8dkrkOfB9xF0IYWZSf1JyF9xBH
	fMVxJE9zZQyAWsZQGzFo6SAiylYCIVSJp9O3IoMUYvhv/y5RpXdXPd8RPyfk2dIo9eoPVCT3p51
	48DN83c8P15Q+Jhtqf7jgYffuJcVTYOLw5JmZ2r8FRs+wMUEzngK2iBjBOuPKQ4aH9l9r
X-Gm-Gg: AR+sD126e9wPYD8RvH1TL8WZPiUppbRFi+xCo492qiE+DNAQVf4EzSzxeABp4elMSlz
	NG7MpMltPQLb10O6HhWDhInLIQUFZtwkiV3oERhRBje2OJHrbeANOGFp4UfYTJvxyFBZ/58n6hr
	qzj4825fcM6chN1xQ1Qm5HNppiU0L1PDbbc0HHX6hxyrrd3zizZCXLF6uKBg7s7z4J2e2VfG86t
	eap40Sa1KrSu1QjCTuywxhmsKGCRK7Zr5XWmZlwhS/MJwptcfBMEYnKqShMBBaAMgXjdit94R0g
	48+gimJpCOUGKBTb1mTZI0HiKZsxgFDVgSgc3NtBMf9GCmSrcPUMtInFVsDg2zrb75Y0ntn9Vdy
	mI7z0USPyS3wgt+mX+4hWjW3/6H5w5ptrOcsyvflSLNhrVH4SC9HHIC5oe/tTqFeEBQeO8yX6by
	m58gVdHP6hKA8z
X-Received: by 2002:a05:620a:28d1:b0:932:df7e:b31d with SMTP id af79cd13be357-936d227ee03mr2727446385a.12.1787022113859;
        Mon, 17 Aug 2026 20:01:53 -0700 (PDT)
X-Received: by 2002:a05:620a:28d1:b0:932:df7e:b31d with SMTP id af79cd13be357-936d227ee03mr2727440185a.12.1787022113404;
        Mon, 17 Aug 2026 20:01:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a16b1bcc39sm8342611fa.29.2026.08.17.20.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 20:01:51 -0700 (PDT)
Date: Tue, 18 Aug 2026 06:01:47 +0300
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
Subject: Re: [PATCH 1/5] drm/bridge: allow hpd_notify() to suppress connector
 hotplug events
Message-ID: <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAyMSBTYWx0ZWRfX1BRWOOrVEyVR
 1ypdmNltd1IfAPBl6yXiLJJusLQvtFz64K0f0+KPWkSZvaICEiRchZAcTCYdVE5TVGgz9+lf9BV
 HDTy/ZFNh/5IjItYDczVqXGS/73EGLM=
X-Proofpoint-ORIG-GUID: CvX69Crb3WM0MOgeuJ9R2MuZ9rOf3e5r
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a83cb22 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=WMPlNdQLU-vNwlj8jccA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: CvX69Crb3WM0MOgeuJ9R2MuZ9rOf3e5r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAyMSBTYWx0ZWRfX1jSSuQtuUQvK
 ePvunjYpTxKmPEm/dFMU0Lm73BQhNQmW0egtD9Ye3x0VzLc00WPoa91xdzWsqM65KLNyGZvp8YL
 MFlEsM6InIMx0jiIVm/06NTIgwm/yAcGjkL1MLPC1Go1lo8kUb4DwTAqHi1i5AijAHmWsAm/8We
 0usGb5Gnx/BXLIf8hQJ57CgIyVjWGWgu/T1sGWHX4kHOgYiUYDeUXtERUjGe/3i7Z0OBm8w5msi
 hTr8vnrdTWGVptErNx1u3f65O27BVI3r/sjd6B+LdtpBK1bafvzz+JleAHEAV7oNK1UnzfrswVu
 giOEWqwcLnPz+uCNW9BNzBksZNMEoHK0SP/JGBfLkyAOrFhH0nrtuJ0wl9uvlztQ4Y/xhapc5NY
 j1KEotirUvv1MmApTsXSGU5zXRRJoNrHND8FTk6YKegGHemAG8QJ+XX1MyrJus5l8b26ImChuZ0
 fut6I5NP/R/TZ/9xn4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180021

On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
> 
> 
> On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
> > On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
> > > The bridge connector framework currently invokes all bridge
> > > hpd_notify() callbacks and unconditionally emits a connector hotplug
> > > event afterwards.
> > > 
> > > However, not every HPD notification requires a userspace hotplug event.
> > > 
> > > In particular, DP MST bridges may use hpd_notify() to propagate HPD and
> > > IRQ notifications through the bridge chain while the actual hotplug
> > > handling is performed by the DRM DP MST core. Connector creation,
> > > removal and userspace hotplug events are already managed by the MST
> > > topology framework.
> > > 
> > > Allow hpd_notify() implementations to suppress the bridge connector
> > > hotplug event by introducing a bool *send_hotplug parameter. Drivers
> > > can clear this flag when HPD processing should not result in a
> > > connector hotplug notification.
> > 
> > Why? Worst case the kernel receives another hotplug notification which
> > gets ignored by the driver.
> > 
> Hi, thanks for reviwing those patches.
> Let me try to explain the motivation.
> 
> Semantically, IRQ_HPD is just an IRQ notification, not a connection state
> transition, and shouldn't be turned into a userspace hotplug in the first
> place. However, drm_bridge_connector_handle_hpd() currently calls
> drm_kms_helper_connector_hotplug_event() unconditionally after processing
> the event, so every IRQ_HPD ends up reported as a hotplug.

What if the IRQ_HPD is delivered together with the first HPD event (for
example because of the TCPM processing those events)? See the mechanism
in the displayport.c AltMode driver.

> Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
> cleared, the IRQ keeps firing repeatedly, and MST bring-up (link training
> / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
> not about "one extra hotplug", but about a burst of them within a short
> window.

Ok, if it is level-sticky, it should be handled as such.

> 
> Every one of those hotplugs is delivered to userspace via udev and
> prompts the compositor to re-probe the connector. In the window before
> mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
> and performs aux/DPCD accesses, racing with the MST enable flow.

If there is a race, the path needs to have a lock, preventing concurrent
access. Otherwise, you are just shortening the window instead of solving
the problem.

> 
> The amplification also isn't limited to a single connector: on Hamoa
> there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
> any one connector causes the compositor to re-query all 4. So this burst

Please fix the compositor, it should not need to query all 4 connectors
if the HPD event came from the single one.

> of spurious IRQ_HPDs during MST enable ends up amplified across the
> whole card.

How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
the HPD event to the userspace?

> > > A NULL pointer indicates that hotplug suppression is not supported by
> > > the caller, such as the connector detect polling path.
> > 
> > And nothing in this patch makes any use of it. I'd say, it's
> > questionable addition. Let me check other patches...
> > 
> You are right, I will reorganize the patches in next patchset.
> > > 
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
> > >   drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
> > >   drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
> > >   drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
> > >   drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
> > >   drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
> > >   include/drm/drm_bridge.h                       |  3 ++-
> > >   7 files changed, 21 insertions(+), 12 deletions(-)
> > 
> 

-- 
With best wishes
Dmitry
