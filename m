Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A6CD1624DF
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 Oct 2026 02:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791165787; cv=none; b=IBY0knRXmrihYI6LKDWgzY/PKz0LcxNBYIKFooGqt7glNikwCZJMQIr7dy3U+OLGiGJ4S2O5+jeVTWnJeJDjARmBbt4SUK4prwuewmUkRd6Obj4P9aRGLuBEIZAgBD/Gn8BEuzNWgJVWs9DYDs3+fZ8WcaXEWj0d8+1KLBOVEpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791165787; c=relaxed/simple;
	bh=D9Qf7wHcoSWAHeYCtWzkYP8+JyMuhb1U18c/RLSREWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DH+9LIC1YHdpVZDSNzfeTu2CyOjhRKc2E5rbZopgssJZkb3ebdknCEZ22KTRsT4sW+7UTaTnHek/QIhWuBk5F9qUQehpBD6EOZsrFBo5GqhEkZJ4gOjaWryhbuoNAgru8qt+19CvPEbPp5S+PCQ4q+B+Ukk3ECqB65XubL9uxYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2/Iak2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=idLuTzQC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b2/Iak2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="idLuTzQC"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69510M573838751
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 Oct 2026 02:03:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+SgEIltGQkRfnBLbDG2XrKCaH5AEd8lzeFZSn/DYU0I=; b=b2/Iak2rzA16AFBz
	USndGqFKkXIMGYosQRob8pP0CWF9a11zSNM9emK/3l/j6TJvqyJ1c3cLocMTG/g6
	j+9uthC16d5RUwxtlv10XQYwVlXYbviB6a8Wdcn9A5bAQtSrekD4yVHBHxNoE7bj
	9wDWVf2yWrFg7lHj9RChbuf+OrZpZBJB8EbA4DvRcmbVk4sbAHfezXuzXkePQkOl
	3k9zlGo11K4h4wnJKGf0rHdu9pGKJVMmWa/JcflHRXNwGGsSdYqwFT30Tq296+0o
	Z0FJ1NqWKzlBL2pYR2algI9XLxKyAQjYuhp/NzSO8yBut6LD3yKTVSm9OLH3oFlA
	DnbOzw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h2u08m28v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 Oct 2026 02:03:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9179a2035a4so42835976d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Oct 2026 19:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791165784; x=1791770584; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SgEIltGQkRfnBLbDG2XrKCaH5AEd8lzeFZSn/DYU0I=;
        b=idLuTzQCD6Pf5yY1oseiNUote8aB4YZngDQE5dIbwMgPGnrc/4a45S7VHTLWBFiOVt
         SI8bCJ/sMDbti91Wug/2EP4ESM86zT7WOoObZB8nek9HHVE2cB6rSoLMJDlMjw0vx9I+
         QUdZGprfCCp0QOv8yIdhgMu8quQXLpk2JEfALzC9Er+u54YNFTldCAiNv4NmupOg8S+o
         y1yAWLhyy4BSqVnKQkaGjnwxluCsZ781MTtTLgj/QwLssQ6b/Po6G3uFtN3085zr0VmG
         R2buUKszUN9jQKLPshUITNoHwbNtQtXduPUwKaYLP0x/cVIHJ9xfGMfX17cqPu2rQ7lL
         cgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791165784; x=1791770584;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=+SgEIltGQkRfnBLbDG2XrKCaH5AEd8lzeFZSn/DYU0I=;
        b=HB0ZpLO5g4vVuSV9CpXQQVcZEqrPb2yu0ejfqe2wsJnWfwnO35Xxr/86XQv1d2lkC1
         EQnA1LIvliNl2zx/IkJrZ+zkeBkjRzwEuAEY2LkS0TFBphMohFHp8iumORsP11KtHIO+
         +x2DF2Z6Sd961ym/60VPJch1zSHnawG4epblCPYIiG1dSwj3kQDS9CgmE0RtDvcWYPlJ
         TWjy8R4GnfwkdCtz4NjbAhJG9+dYZgpS3nwwSSiCW4eFdXZYSVjU6BJrNAYXbb+A6ZUn
         3tkZmVG43gyxjaFdJpRj4Y6r9U0cYY9WVc1QCNLKv46hQVgkktxvpY9BSqrQC5VXVkjW
         vmpA==
X-Forwarded-Encrypted: i=1; AKwUvBzxLS/4ZacLiR52k+tsC6yynNyfi0Bw4ybdWQ8IOpCiCsYHWDXgPq/6RdBLr+mWG1AQUcwyIsMXsyjrr/oH@vger.kernel.org
X-Gm-Message-State: AFuF++kEPVn/NqMTt4d/OiwN0qZ34c9PKEHHR+qaJj4j4FuELU7o4ZN6
	IP7xP/TOtB4RE+Qtm+z/05hu5DTz7hDj9XVlK+0wqTbsT4zZrucE49WqDObRaqbnZnazajbNadJ
	on1bvEcLz2dQHJJWAFkHt4nfGOoCXk6VmWu7GuuAiV0PDUaWhJ79mfEqLKlqG3o9M+mCH
X-Gm-Gg: AYBFou1dttcNyj7FipSsDBZmOBemVIMQbPON3IY80UIQI9BuVc0YRqi6eZJLUCcQE0P
	S6bROTWvXA4wzuWuczkw1H+yvqsJX8F3gCRlJvu3zzt5sEajn3qDSNQb5s9F328wWO2Kpoz2Xs9
	3+NYb6TDX9BDeKcPOwHcjK8PvwzOMO1XcXvPlXh3vACnoSB5frD9pmD2KsZ8LsFhQIbaxSHhmHJ
	+kVpFtPMwUioCvr2vwEJmAxJ5jff5whfdtw66zeT3jXrg/5ad+a+QvM/QOkVyP8V5rL8aAJIWNj
	6uDkGkGe6U9Z+jjnBmwEvY3I+KbMQiIpwtyfeSRba18E7o9RykBVdXlAcThtfvlEff0NCcdp0AL
	NPM4zshAzvfULhLS/thrgCli5jtjhYAacLj/T0NwIfXFAlRMXFp516HZ17SEOcEbcCKkh4KTQTw
	iAH6xVkZBaF0G8
X-Received: by 2002:a05:620a:271c:b0:93c:3863:ff7f with SMTP id af79cd13be357-93cb54376f0mr2312052885a.0.1791165783976;
        Sun, 04 Oct 2026 19:03:03 -0700 (PDT)
X-Received: by 2002:a05:620a:271c:b0:93c:3863:ff7f with SMTP id af79cd13be357-93cb54376f0mr2312050785a.0.1791165783480;
        Sun, 04 Oct 2026 19:03:03 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bb7c7bb70fsm2877427e87.76.2026.10.04.19.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 19:03:02 -0700 (PDT)
Date: Mon, 5 Oct 2026 05:03:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v5 3/6] drm/mipi-dsi: Add flag to support dual-panel
 configurations
Message-ID: <m46353a3ikqtkv3ycevnpzg77z32jickl7hophmehlot4sjj56@bbh7kjb4td7z>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-3-c042266b9eeb@linaro.org>
 <gu22hz3dnttzyu2eewpalgzxtocmlbfvnpwore36ufmyr3xtag@r5bbhafsn562>
 <CABymUCNtcgbcRNXdMUjVdnH_ybOxjFB31gd6AW-0HCFDSn9w4g@mail.gmail.com>
 <kgnrsnko7u4g6bpxudfo6yqubhd5gcyrdyovjfkohlgo63yrwn@xbgp7jgv6ns3>
 <CABymUCMGT32A5gE+a3u7=-3scH_Nu7Amb22-FRfWiNrcEOnAgw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCMGT32A5gE+a3u7=-3scH_Nu7Amb22-FRfWiNrcEOnAgw@mail.gmail.com>
X-Proofpoint-ORIG-GUID: wS8JF18AqWGB0guQV0fbOUd-BxC2cEB6
X-Proofpoint-GUID: wS8JF18AqWGB0guQV0fbOUd-BxC2cEB6
X-Authority-Analysis: v=2.4 cv=JqlkP84C c=1 sm=1 tr=0 ts=6ac30559 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=kAmi71hXjrz3IqBiEUQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA1MDAwNyBTYWx0ZWRfX54wTP9K44Kcc
 AwpadUYC/ol0fyyOQlwjh7M96m7gjDn8tas87rDVDX8RNgihilcbFUL2oKOJgRE/0jEWemDQ+aQ
 8kuSJXhbeXAOxfDPmgHekT5J0Gwvvtw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA1MDAwNyBTYWx0ZWRfX2e6KHG+N+uOI
 pgQe5m64lbZWiRX5XTtM7JGtCVTD6dJup3spaqDM9AFu1InEBhyUS3DrD++Bgywhrw7vNTnH/VM
 tNcAeyfHf+pNoLKLOd+xob71NFyu+ZE6iY0CCEhMDQBNL1GVhGG0kfjoqpcnjx+glO+ZfMu4Hk4
 zLI4/hhT/6SM+pLD/2QUppTo+aBWa5q63zggawqDAZtLL97Qu6BSE8CPXMRw38+RQB2jWfKFiWX
 n3DCffHHb6vIjoEwT5saw0dvGSueipoXB/nHMDaHNN32SsM3uwIFgK0jvki/CKQgSE48APtfjnx
 kaEADfAdUgc3AGFEAxxM8Gd+YMV6beG0jSHllfvjOifrEXyIKSNiO/hdfrrzQIn2Bo1a7FVJLpx
 4vP36i2hkx5wFE7RyffluGlA4YQqYtBUDYxkE4BtvhfJwhiXAKj8npp48JoSaQkDtz75INARow8
 dx3PwDfFs6gtiywigdg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_01,2026-10-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610050007

On Sun, Oct 04, 2026 at 09:58:04PM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年10月1日周四 03:43写道：
> >
> > On Wed, Sep 30, 2026 at 09:52:48PM +0800, Jun Nie wrote:
> > > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年9月30日周三 00:05写道：
> > > >
> > > > On Mon, Jul 27, 2026 at 04:08:42PM +0800, Jun Nie wrote:
> > > > > Some devices treat two independent physical DSI panels as a single
> > > > > logical panel from the CRTC's perspective. However, two separate DSI
> > > > > hosts are still required to drive the panels individually.
> > > > >
> > > > > Introduce a `dual_panel` flag to the `mipi_dsi_device` struct. This
> > > > > allows a panel driver to inform the DSI host that it is part of a
> > > > > dual-panel setup, enabling the host to coordinate both physical
> > > > > displays as one.
> > > > >
> > > > > This change does not force individual panel driver to manage
> > > > > system-level display topology if the driver does not intended to
> > > > > support dual panel topology. Only the driver that set the flag to
> > > > > true need to take care of panel topology.
> > > > >
> > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > ---
> > > > >  include/drm/drm_mipi_dsi.h | 2 ++
> > > > >  1 file changed, 2 insertions(+)
> > > >
> > > > Do you have a single MIPI DSI device, or are there two independent MIPI
> > > > DSI devices? In the latter case, the flag is wrongly placed.
> > >
> > > Yes, there are 2 mipi devices, and 2 mipi hosts. This flag is used for
> > > mipi device
> > > to notify host they are one of dual panels, so that horizontal
> > > configuration(width)
> > > in mipi host can be handled correctly. Where do you suggest to put this flag?
> > > Thanks!
> >
> > Into the msm DSI structures. We already have several Qualcomm-specific
> > flags. I'm thinking from the 'generic device' point of view. The
> > 'dual_panel' doesn't mean anything if the device has more than two DSI
> > hosts. You need to specify which hosts are mapped to L or R channels, etc.
> 
> How about to add below 3 members regarding multiple physical panels in
> single logic panel. We have h*v panels in a panel wall. The index start from
> 0 when we iterate panel from left to right of the top array of panel wall. In
> XR case, we have num_panel_h = 2;  num_panel_v = 1; and
> panel_index = 0 for left channel, panel_index = 1 for right channel. The
> original framebuffer is divided into width/num_panel_h and
> height/num_panel_v for each panel's DSI link.
> 
> u32 num_panel_h;
> u32 num_panel_v;
> u32 panel_index;

You have seen drm_connector's tile-related fields used by
drm_connector_set_tile_property(), haven't you? If we are to use num_h
and num_v, I'd also use h_loc an v_loc instead of a single panel_index.

The driver needs to distinguish (for the DSC params) if it's a single
panel spanning two DSI links or if there are several DSI panels, bundled
together, so you also have to add h_size / v_size style of params.

But then the real question becomes, do we really need this complexity?
Will there be any use for it other than representing the XR vs non-XR
cases? This all doesn't concern userspace or uAPI, so, if anybody needs
actual DSI panel walls (maybe also using DSI subchannels to driver more
than two pannels), we can extend the solution on the kernel side.

If we take the dual-LVDS panels in mind, I can propose the following
API:

struct drm_panel {
	/**
	  * @dual_channel: set for the DSI or LVDS panels which use two
	  * host interfaces to be driven
	  */
	bool dual_channel;
};

struct drm_bridge {
	/**
	  * @dual_channel: set for the bridges which use two host
	  * interfaces to be driven, e.g. dual LVDS panel or bonded DSI
	  * bridge.
	  */
	bool dual_channel;
};

Devices like LT9611/LT9611UXC or panels like hx8279 will set that flag.
The DSI host driver can use it to determine whether to use width or
2*width in the DSI calculation.

At the same time, in your case, you won't set this flag. The DSI host
driver, fidning bonded DSI link and non-dual-channel bridge will
determine that it's a panel bifurcation case and handle it
appropriately.

What do you think?

-- 
With best wishes
Dmitry
