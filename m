Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3967396B9A
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787019891; cv=none; b=FL0pdomiBK396z0ZTO4rEQ7OkC1Ne9nBZQ+ZIaiKINT004qW9b9Bd93d2Me1kIUZfIZJzGoGWmk6920ecPhjaPVjwb0fsOLc1X64ZCUbw4+lMxrKzR+WFW52ouDGriFIPKnioKfLz0YCs2pozrhHRpqYzowsnupOnWfPw1RWPF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787019891; c=relaxed/simple;
	bh=tQpC4/imr7l9L48YoMz/6lMTl9CpIBb5HzofyDTNMBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWjUGU/Wjh9t0GnmgzWyWQkyWSM+xL6F/O8e3iN+oRhcQwWnmM9+9bhzsWzapBA/zXBkStpkhghzTpTUS7p88/f3MXRg3D5UBx1brVvnLMMXitBvWwKGBWDCf3WU/MKkF0LBOWJ5WZPW9nughCiI4YGGGZSB36XGCO19BvxYOD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFR17imp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BXWU455J; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFR17imp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BXWU455J"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HLkmw42626967
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=98i4v+/vyXWcyWkknO4LIfjz
	mBEpAN6zh0hmZXHw7mA=; b=jFR17imp9arMOTkX5pj7VfXkKzsgtoVFpoHxfGXg
	6CsmJJPqOJU1SLea4VpYH5Z8GrCv3p6yzK0uxeqwPm1WYdkd/LnjRqMl/GtDc3qj
	kaxR7bWFf7zw7EtI8g6SaXII1TbteMshBb1j325Pp6Iaqdvv/PWE6CEJtgDECsD8
	ltDHhp+EQOaH6vDyPuqyNnhA74OsDAFRk0Xh9iIv+PsB1Y4KoJYHd6r8a4Wgp1Yb
	afR2l30njJpQB0SYyodAAR9Ma4QvOtgw9RJTZgRUaMCGi2lRVI3JX9gzbLG6Qa1p
	DCBKyLNFLrru06oW7uLRWR8TBtRUIS/TVD7DiH5m3cMf9w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30m2j5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 02:24:48 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52827090cc5so6954881cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Aug 2026 19:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787019888; x=1787624688; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=98i4v+/vyXWcyWkknO4LIfjzmBEpAN6zh0hmZXHw7mA=;
        b=BXWU455JWkND/oRLleEhgMW8DqzX0CzQhh4Y192kFjQN+cqzUzD2gatBFcJHqyWoZh
         4tZzD0tRS02MEAEUt9MxJYNpAZGx1QAeolhHXwQLQVTA3/o+Fmi0jyP3J6eD7Z/BAHTj
         7LTOxdZGNucS8GcIfvNB1jP5vmOm0Ib9Gzf0efmOOEgzdZGMRXEu6I7UqZyCCw5PslZI
         e/j9oyTwmsZPJA/HxnLXrPnR8PgPaRTYN2m/MxmCKgmTXy5doJYllRKeUYrUs6xCZs3/
         v60KFt31vcnbGmnbHjvpoT4S3Uht0s+ZyRD3M10RzoO8N+i9Xtsa8IiwmDdX7Jsyk+hv
         znqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787019888; x=1787624688;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=98i4v+/vyXWcyWkknO4LIfjzmBEpAN6zh0hmZXHw7mA=;
        b=aDaNR8gCIMGz8Hi8xc3HHpEtvHB0YYX5TDMOpR21N2Ybnh11c9/gYP/b+zh4El588a
         2eRJqKwVLC+Vq7NWvwwuePObVhXjMwMWcifQi00nO73MzO+IVDhyvSoV66Km7zCwImyA
         WDMo1OlfEOoETeMGuqq9N9w5B3pvV+R9O1WDmNSS0MxunSaREgauGdtQBzj55i2EvXGN
         E0UGuXv6CSai+CDfskUlU9iS05LL7iASozOv/pO/lLhegy1nholkMiE58sA3BRRPkdpf
         cDjqPTuZpdaxNrHUmNQ2s8IKHqdP6EQZ+vmpjCrih/5mAYdTXGxfmZuKD5dRrwd76b7y
         +eFA==
X-Forwarded-Encrypted: i=1; AHgh+RqD5yJmF8Rd2I2Qqyu52ARfBnGL4jvbQOq3cRow3YsLdj65sxo5ueZInWe74R72qEloZVyw4mfZ8hJcZe64@vger.kernel.org
X-Gm-Message-State: AOJu0YyPpcxgtHsr063vCiKuZnJ76Mfr3VIT0QcrAooSjcN0JS/Xmucr
	NsjuwzfEMtZRz/dxTRiKaidr3DgSS1cKg65mY1nmaLpZqcwcHZPNezb+tlWSpFcD9nnTwco7qBa
	GMSF1P97uwSABY2bm/9USRj5TpRcf879SgKqGfyS3ojahE44s4kPw+cbRwa3ulQLJL7rQ
X-Gm-Gg: AR+sD12q04mBGTKj+cIfzrP93GRZUoT7w9IniEO7PxEmebfhj/6Bt9HyqprlV5rrhSW
	uTnEeA8r3oe6rAfpBZEZg5az94g8+w3tTQ72eScjs3HZs7c2lMRk+oiyF55m7lK6+UieHC2loOH
	GaJkv9KEifXo7NVnY1c2iPI5hlNKc47xf6ZoGEZu4dwldvHCVbb+IOeb4I+aYButak/6cC3c0IE
	SwlLLG0MVVxW0E3jtlOV8DxTycwmPGF7zb3XaFxunE8CIouDGPf7sqH9K3I/MTVTrpVx5C+kAqn
	dE5VUxt3+CSZieZGHZGW6n0kKrs7YBDVlKHaJ/7bmmu55UVDSOSgRcxTjmhWJed0z07uSdyp0y3
	UnGGu3a4RbBq4VvPoMRV44sJ92Q1pgOAzT3UiFHDtgSULi8frc8KRHaClONHROTu47CgQ6AYzdU
	2cNecP62TPqYJb
X-Received: by 2002:ac8:7e8d:0:b0:52d:9cfa:663c with SMTP id d75a77b69052e-52dbeb697afmr39243141cf.0.1787019887854;
        Mon, 17 Aug 2026 19:24:47 -0700 (PDT)
X-Received: by 2002:ac8:7e8d:0:b0:52d:9cfa:663c with SMTP id d75a77b69052e-52dbeb697afmr39242611cf.0.1787019887314;
        Mon, 17 Aug 2026 19:24:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b46cfa0e5esm821205e87.25.2026.08.17.19.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 19:24:46 -0700 (PDT)
Date: Tue, 18 Aug 2026 05:24:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
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
Message-ID: <4qc3n3mwsonpzfxi3z2supslvlyat32xgsn7bnrstudtpitwri@enwxj4pkjexa>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <364f223e-15c6-44c4-a909-134754cfd0e1@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <364f223e-15c6-44c4-a909-134754cfd0e1@rock-chips.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDAxNSBTYWx0ZWRfXykb6ZsVuxBNH
 ErjmnJoW8c9MfMn7qTaZyCoKf85cIVpy1va1pEDv2UEKiQr3lcXvUCp2l0qxMGhCdFo/CNT1jiJ
 2dWI9TvxqWxSKrZkg/ZJgZNqw2ouhKBCTkLzG//iXDZDf73U1NHwn66BvymV9OQhM6AlcITeDqq
 IuuaHUOHpjd2/5Habx1y+KSY/9iWpKbI6BtbWLI1g4pK4pSqdEcBqLheCVcS1I0UgDWQuNJmKjg
 VGVkp8zqLWkHg6B0ZHF/mPILZaKZZh7nrWBCQAIDOu4jHfFFhNV7NV7oDUGPLMdweATFmdP4vuG
 aBZl1FUFXEi6eRMFeEZ07XWIiCdDQ4HcoVfXRtLuTHqiTAKSkIyTREZuLhghvrUfw9uiW7XAkPP
 5/7pRaCz8yghjK65nEsfJeSoSaqMszrz7ucuEVLyoVbuzjH7MMlaYjHMhQPmpPW8XkyK1jRj2Tn
 mrgByQh6NOr/WT2oJXQ==
X-Proofpoint-GUID: FFHOJkzWmD6xIOqj5H4pxael9UE8DElI
X-Proofpoint-ORIG-GUID: FFHOJkzWmD6xIOqj5H4pxael9UE8DElI
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a83c270 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=QX4gbG5DAAAA:8 a=busZWuwHVHLsb9-ZDGQA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDAxNSBTYWx0ZWRfX1oMkt02u17XL
 T2gGj76Iao7ZGaTg5hOn4np/AmCOWtCwQxc0AGWMM5rjMDkb6prH1ZP7Dv0ZQWWY0Yno4tzVg9o
 K8/oj39gNXC7GedKk5KFB5PPW4Oe4mQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180015

On Tue, Aug 18, 2026 at 10:05:30AM +0800, Chaoyi Chen wrote:
> Hello Yongxing,
> 
> On 6/29/2026 10:48 PM, Yongxing Mou wrote:
> > The bridge connector framework currently invokes all bridge
> > hpd_notify() callbacks and unconditionally emits a connector hotplug
> > event afterwards.
> > 
> > However, not every HPD notification requires a userspace hotplug event.
> > 
> > In particular, DP MST bridges may use hpd_notify() to propagate HPD and
> > IRQ notifications through the bridge chain while the actual hotplug
> > handling is performed by the DRM DP MST core. Connector creation,
> > removal and userspace hotplug events are already managed by the MST
> > topology framework.
> > 
> > Allow hpd_notify() implementations to suppress the bridge connector
> > hotplug event by introducing a bool *send_hotplug parameter. Drivers
> > can clear this flag when HPD processing should not result in a
> > connector hotplug notification.
> > 
> > A NULL pointer indicates that hotplug suppression is not supported by
> > the caller, such as the connector detect polling path.
> >
> 
> Should we add an API to distinguish between regular HPD events and
> the IRQ-only notifications you mentioned?

It well might be so, rendering the first series listed as a dependency
as invalid (then it's good that we didn't land it up to now). I have
been torn between adding a new API and extending the HPD events. I
ended up choosing the latter one, but I might be wrong :-)

My idea was that both USB-C AltModes and native DP deliver both
mechanisms in the same way. If we add a separate API, we have to take
care of possible interactions between those two (i.e. how should we
react to IRQ_HPD, if we already have a HPD event being processed in
flight)?

> 
> I've recently seen similar approaches. For example, this patch[0] adds
> handling for internal events, which I think is somewhat similar to the
> IRQ-only notification here.
> 
> [0]: https://lore.kernel.org/all/20260806-synopsys-dw-dp-improvements-v11-11-0d508505f383@collabora.com/

Thanks for the reminder about this series. I need to review it.


-- 
With best wishes
Dmitry
