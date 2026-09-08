Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBE055295A
	for <linux-arm-msm@vger.kernel.org>; Tue,  8 Sep 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873009; cv=none; b=Yyj1KTOYpd0jlsyue1GkkQBHmT0kAhueYdDih1BbhERrXd27QpjghPmVt4OFtu3LgYYaVuKAqQRgsm46KZiEK/UFYNHp1kZGZIswqVwXmFzhfY+SMypnGWAl12pfdZD8pFXpzPbkGU+sny5KQoxc1lNXmYTLgaj/LwecBBajHIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873009; c=relaxed/simple;
	bh=GVMTOJA1QM9ESGzfxrNqZcK8VGuiCOHUCpp7TidGujQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBRBBGdW3PTrpaO31TdTWR8ler26ChhmayZ8Qd7vW8NYzZBnGrm4+w6bJcGkHgSvq0YJkrtEH8rBI0b0Dj1uPz1xyLo76D0nanfkBT1IoBFevZ6ZnhiCKy5EHcjegFyHYpZF008L82mE+MYQYokS4HvvQc1a0NYwXOz5EoCoaqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYEEsmu9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTeS6VVc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYEEsmu9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTeS6VVc"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Cl0WQ2932819
	for <linux-arm-msm@vger.kernel.org>; Tue, 8 Sep 2026 13:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=; b=FYEEsmu9Bp4RxlKr
	bdlkDU7MM956qVwX0TH40aknbPt8f8sGAAXZ569953xVF3qWYKwmqH3MRoKTZFai
	Np5YiUDQlpNmS04fiP2jqJAFyhgQSTYFXOcYrMvKa2NyfvdZNaV1oab0T7ZKD9fH
	J35pDir6rCVbmXaohQRWqfEfnOvXhRtK2lq+3M+9oby/aZFToyIGfH8NLjPAnSUM
	IETCZxEIXjKh3J6fy+Wq2QK/v8PySRCtHvQIN5iS8OtaytEq7tdZczXAM2ZOBHk0
	lfM+L1SG8GTvnYPZP0EBQTaOp3hL4bFE+G4Rv8iax5C42AHCs2SksxywO9+dIeaY
	0JKEig==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjf1ch202-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 13:10:05 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5c71cad4f3eso1154148e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Sep 2026 06:10:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788873005; x=1789477805; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=;
        b=LTeS6VVcdSdlzz6ojidkB7BsV4G+ZlKgLY5aQ8d1U7Ukfvtqmj6ZoqBwm6liDT48xy
         9Vu6HENUgTfiU854DhbnBf9T5gOrLEdARu4+NbRLK60Bar3HJxKQi2Nxwjam914TI2k/
         wffghJEydFuCGIlC9gG4R/a/DuUxS5jbUPIUc3au438Y1iHRVWII+VQreDjfznsHUDt/
         1mJQvWyQCGLzNPp9Aw1AE3QXevwHG6HEXrMZa1caIETPhrRxz/X+TMwIDCnybpEDzxcz
         IRSr5KSXqFnsjuVISKXILPZsZDR0j7cROJQyL7xyJmXjT9WptyIXpNF04Gc8yZumBTkl
         xweQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788873005; x=1789477805;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XtibxPQVyAZfi7GIcCdlRshMUFB6kV6tOrHbxWFRoTM=;
        b=HpFOl7OpPYbnECK+hnN0GXjQAroGsNgL3WxkpQYPZzoWJbK8LSKJJyYqdvkdqLBpBU
         ruv74faTbSy6EMJw7RxgIbqfMeGEKodtomymT+l9VP95z3uTHqwY7yzE66iBGIaB/NGZ
         UpHmHtFL/wDAYaJD++BZW2avnXs5M2ZoAKI/TBTaZ63LzjROi2LARe82iNynwrssg56N
         dEd6p5J1y3HRXAgfTf1a2Ifwq/u3Ph9h7nBGG2Whc3o45NfNvQHj3/ttzmHgDEbAiI6n
         U5bn6VAkuXegdAt8hA/iLvCea9Gf8CCwhHDpdUkf4vOZSlZS2yNM3b9n6656YCfR8ALS
         fQnQ==
X-Forwarded-Encrypted: i=1; AKwUvBzivfcv5ucrL3fO9SLzjonBImaMnRSOzlan003x6DfEhcPKvBi+5gH67Z8Ltqnnb+di74LxevSMkBlDzULW@vger.kernel.org
X-Gm-Message-State: AFuF++mDny8cwaxjc0xfHu1war9ahCvcAvJAM/JyNiz5kGB1ofIZxysx
	oFytzc1iEhpmXx78ezX0niXPRloOOHB6iqucf+rfAmyi5KKReR67dDRZjRqxBVDsJlnmD0FhqT1
	RUcyP18Utje5rq14z6YuoOExKrsMbGP3crjbf84hdM5x/Puw8EVwKyos4qfgCuYPx8JEu
X-Gm-Gg: AYBFou0uEnOmFSnlmvrIxg5NjMccEU8KzVMccp0MhC8SqD5OtJPBKX4Xhjf77Y6VIsX
	h2xCsEAox47WfKf03IOKsVhd67v5yuffqdUz/U+gvfqv8nqSycKBmY5XRN/U+hOvROrvC/AQ+vk
	4XBmL9JPll84fcmXbQS7oEKV0//yo6b9vx0pJ54vZs8t9OUdhGDmhT+71myohUJ53BYgnYnhgYx
	N2rRCW8ORkcbuzOUlS+rixAZVlLm+moMIOI7s0xYk+C44RVl1AFmp2T/7YD1oHOhhBDOEobHsEG
	a39cI8vQydBmJm1M20gAsDq8UCDf1D8bwc7agcg/8L6OvI8thK494CJMLo9xLweqq+K5ICUvquP
	NpLxvOq80eGFLV94sO4ZlRdP5AQLGB8sya2FTlo2zaN4fpgZSZNJmWLZxD14r0xImIFA0n4v7Qb
	319ydJPF6UG7Sv
X-Received: by 2002:a05:6122:f18:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c7ed29d58bmr14694116e0c.1.1788873004872;
        Tue, 08 Sep 2026 06:10:04 -0700 (PDT)
X-Received: by 2002:a05:6122:f18:b0:5bd:cb34:1b70 with SMTP id 71dfb90a1353d-5c7ed29d58bmr14694023e0c.1.1788873004277;
        Tue, 08 Sep 2026 06:10:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a3705f37f0sm34623661fa.41.2026.09.08.06.10.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:10:03 -0700 (PDT)
Date: Tue, 8 Sep 2026 16:10:01 +0300
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
Message-ID: <z7a7c2pe7aqpqlh7z6ep4fhctujnwaxqxukqaywjwvt3w7ahnc@j5i5f53c4fqu>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-1-646a10256233@oss.qualcomm.com>
 <cgk2httvebzm2jnjnb437mutez66tfozzdk77mjwukfzngdioh@mu46u3pwlf2u>
 <af5f2e4f-42a2-49f3-9c6c-0f910c5f9208@oss.qualcomm.com>
 <pyqpajtjcnslk6g5ysn3ce2csrb76fhd5bif4vdb6wezomlmsg@fsl55exyufx2>
 <dd375289-0174-41ad-980f-f027fad976f6@oss.qualcomm.com>
 <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcc816d3-e3d4-4dbf-8ae5-bbbac6e2189a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=VN3tWdPX c=1 sm=1 tr=0 ts=6aa0092d cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=5Eng7BWHuIvqA__06hIA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: 8jEf0VLkZgMQR0KUFa0OVAZQzNepH2K0
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX9tI6pPnwvui9
 necewAjbNMYKYCWU1uQnnKe8P6VfyPcB03paO3u3+vz3q6GNpVyS9c2WnP6tzI1EntuLEVcWI7m
 CcihPOObuVHDekbmGc/TY57xPeLKWHc=
X-Proofpoint-GUID: 8jEf0VLkZgMQR0KUFa0OVAZQzNepH2K0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE0MCBTYWx0ZWRfX1/7CSMUGZ1Cg
 0uEQEppZXSxya+v+1qgOblw2dWo86KKKXKpAi2QRxffuMhzLzIqG6hOun3BLEsyaOv3MN4LkoBC
 FzbArMM0ZUkLe+EXHv40n7GXdz8pxeD+eGTCxliNEBoXHCnYtgKG7LShIUz58HXpLQPyLh2+dqN
 QHZYsVlOJqPrgs+QdIJJeXOGRveTvhUineIEGMliI6y5cOxyQUBqmJ75lI28uNJJ9+aSD2Vi3pj
 bpCw4lsx68js6/7QiEA64B7OWcu6w2vkTuqjhbzq0w2dHBBkd58b6vvk/rr4kl6hHnwYWG4h33C
 mEe/paQZO6FYvfB5L2qGYo8HDr7CPtibQFeIVcImUFdJFDhpiSq716D2+wlh7LcBkbgecyOSKRZ
 FWBpyMOHSKDJQu9U1sSLK+XMWDJcTr2p251EUxt9+zf+JuI6OoxzsgrByDp9WMzkx/fu9KiO4xf
 /5VSu52xo7yduF1Lp8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_02,2026-09-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080140

On Mon, Aug 24, 2026 at 11:15:44AM +0800, Yongxing Mou wrote:
> 
> 
> On 8/21/2026 3:20 PM, Yongxing Mou wrote:
> > 
> > 
> > On 8/18/2026 11:01 AM, Dmitry Baryshkov wrote:
> > > On Mon, Aug 17, 2026 at 04:01:41PM +0800, Yongxing Mou wrote:
> > > > 
> > > > 
> > > > On 7/12/2026 6:21 PM, Dmitry Baryshkov wrote:
> > > > > On Mon, Jun 29, 2026 at 10:48:03PM +0800, Yongxing Mou wrote:
> > > > > > The bridge connector framework currently invokes all bridge
> > > > > > hpd_notify() callbacks and unconditionally emits a connector hotplug
> > > > > > event afterwards.
> > > > > > 
> > > > > > However, not every HPD notification requires a userspace
> > > > > > hotplug event.
> > > > > > 
> > > > > > In particular, DP MST bridges may use hpd_notify() to
> > > > > > propagate HPD and
> > > > > > IRQ notifications through the bridge chain while the actual hotplug
> > > > > > handling is performed by the DRM DP MST core. Connector creation,
> > > > > > removal and userspace hotplug events are already managed by the MST
> > > > > > topology framework.
> > > > > > 
> > > > > > Allow hpd_notify() implementations to suppress the bridge connector
> > > > > > hotplug event by introducing a bool *send_hotplug parameter. Drivers
> > > > > > can clear this flag when HPD processing should not result in a
> > > > > > connector hotplug notification.
> > > > > 
> > > > > Why? Worst case the kernel receives another hotplug notification which
> > > > > gets ignored by the driver.
> > > > > 
> > > > Hi, thanks for reviwing those patches.
> > > > Let me try to explain the motivation.
> > > > 
> > > > Semantically, IRQ_HPD is just an IRQ notification, not a
> > > > connection state
> > > > transition, and shouldn't be turned into a userspace hotplug in
> > > > the first
> > > > place. However, drm_bridge_connector_handle_hpd() currently calls
> > > > drm_kms_helper_connector_hotplug_event() unconditionally after
> > > > processing
> > > > the event, so every IRQ_HPD ends up reported as a hotplug.
> > > 
> > > What if the IRQ_HPD is delivered together with the first HPD event (for
> > > example because of the TCPM processing those events)? See the mechanism
> > > in the displayport.c AltMode driver.
> > > 
> > The DRM API should simply pass both long HPD IRQs and short HPD IRQs to
> > the driver as they are, and let the driver decide how to handle them.
> > Based on my review of the implementations from all three vendors, when
> > long and short HPD IRQs occur simultaneously, the long HPD IRQ is always
> > handled first, followed by the short HPD IRQ.
> > 
> > I have another thought regarding the current DRM API. Could we have the
> > DRM layer pass only the HPD event information (long IRQ and/or short
> > IRQ) instead of connector status, and leave all handling decisions to
> > the driver? The DRM core would simply report LONG_HPD | SHORT_HPD, and
> > each driver could decide how to process the event. This seems like a
> > pattern that could be shared across different drivers.
> > 
> > This is just my current understanding. Please let me know if I've missed
> > anything or got something wrong. Thanks.
> Sorry, after thinking about it again, this idea is not fundamentally
> different from your current approach. In the end, we still need to handle
> HPD state transitions in the driver. It seems my previous suggestion does
> not really simplify the problem, so I apologize if it has caused any
> confusion or misled the discussion.

No worries.

I'm currently stuck between two ideas: continue pursuing the current
"single API for both events" or implement new "two API for two events".
I think that the second might sound more plausible, but in the end it
would complicate drivers much more, because now they'd need to handle
synchronisation issues on their own.

If we start from the DP AltMode, we have a single state word which
specifies exactly, 'HPD pin status' and 'was the IRQ_HPD captured'. Our
DP controller also has about the same status word: the connected status
and the IRQ_HPD pulse. Which (for me) points out that the single API is
a correct way to handle the HPD/IRQ_HPD.

Now, coming to the drivers/userspace side. Let's leave the MST story
aside for a moment. For the DP branch devices connected to the USB-C the
AltMode will always report 'connected', but the DP's detect callback
would rightfully report 'disconnected' if there is no actual monitor.
The kernel should do it's best in this case and report that the
connector is disconnected without any interim states. I think we do it
already. The compositor should do it's job and skip full scene
evaluation of the disconnected connector gets disconnected again.

Event filtering. Historically, drm_bridge_connector was trying to filter
HPD event. We had to remove it because for the DP prefiltering doesn't
work. This might have left the gap, which now needs to be filled. The
bridge_connector uses drm_kms_helper_connector_hotplug_event() which
just reports the even to the userspace. Consider reworking
drm_bridge_connector_handle_hpd() to behave more like
drm_connector_helper_hpd_irq_event(). Execute hpd_notify under the same
mutex lock, capture if the status has actually changed afterwards and
report it to userspace only if there was a change.

> > > > Second, MST IRQ_HPD is level-sticky -- as long as the ACK has not been
> > > > cleared, the IRQ keeps firing repeatedly, and MST bring-up (link
> > > > training
> > > > / MST enable handshake) itself generates a burst of IRQ_HPDs. So this is
> > > > not about "one extra hotplug", but about a burst of them within a short
> > > > window.
> > > 
> > > Ok, if it is level-sticky, it should be handled as such.
> > > 
> > > > 
> > > > Every one of those hotplugs is delivered to userspace via udev and
> > > > prompts the compositor to re-probe the connector. In the window before
> > > > mst_active is set, that re-probe walks back into msm_dp_bridge_detect()
> > > > and performs aux/DPCD accesses, racing with the MST enable flow.
> > > 
> > > If there is a race, the path needs to have a lock, preventing concurrent
> > > access. Otherwise, you are just shortening the window instead of solving
> > > the problem.
> > > 
> > > > 
> > > > The amplification also isn't limited to a single connector: on Hamoa
> > > > there are 4 connectors (3x DP + eDP), and we observe that a hotplug on
> > > > any one connector causes the compositor to re-query all 4. So this burst
> > > 
> > > Please fix the compositor, it should not need to query all 4 connectors
> > > if the HPD event came from the single one.
> > > 
> > > > of spurious IRQ_HPDs during MST enable ends up amplified across the
> > > > whole card.
> > > 
> > > How do i915, amdgpu and nouveau respond to IRQ_HPD? When do they send
> > > the HPD event to the userspace?
> > > 
> > The driver revalidates the actual connector state, and a hotplug event
> > is triggered only when an actual connector state change or a link status
> > change is detected.
> > > > > > A NULL pointer indicates that hotplug suppression is not supported by
> > > > > > the caller, such as the connector detect polling path.
> > > > > 
> > > > > And nothing in this patch makes any use of it. I'd say, it's
> > > > > questionable addition. Let me check other patches...
> > > > > 
> > > > You are right, I will reorganize the patches in next patchset.
> > > > > > 
> > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/bridge/lontium-lt9611uxc.c     |  3 ++-
> > > > > >    drivers/gpu/drm/display/drm_bridge_connector.c | 15 +++++++++------
> > > > > >    drivers/gpu/drm/meson/meson_encoder_hdmi.c     |  3 ++-
> > > > > >    drivers/gpu/drm/msm/dp/dp_display.c            |  3 ++-
> > > > > >    drivers/gpu/drm/msm/dp/dp_drm.h                |  3 ++-
> > > > > >    drivers/gpu/drm/omapdrm/dss/hdmi4.c            |  3 ++-
> > > > > >    include/drm/drm_bridge.h                       |  3 ++-
> > > > > >    7 files changed, 21 insertions(+), 12 deletions(-)
> > > > > 
> > > > 
> > > 
> > 
> 

-- 
With best wishes
Dmitry
