Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77D53515CB
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 00:23:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790814239; cv=none; b=MPafG3AwihdpBCXeRk1oumJ3vyccrGUQDnRSeU7OUs6olp+x6hyWlxj6O9ZnmYX/ybGJOl087fQSBBvpNP8kOsfgeYYgGq9eEs2nNYvBmU6NK4cd6I1pJvHutiqlBhNNQ0R5+sBfjfkYhyEMIcEEddBtVD2fm8th1tkufYOPwoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790814239; c=relaxed/simple;
	bh=bjKkBjr7CnIKKuRTfiwiNo+nrKoRjfSMrPMXetY44E8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0B0u/CPXzKrZOXAkqRPr1fW9qgHQ7W2Z6+qukTS7rP6G3y3+c8Zh1h23KKN5KG6aZ4/n8hUzpvPUlc04J/qRJPj02vy+lNmh/cZ7/k6SgLWUgedFmebvNfAU/Oc8bgiixHJDCOJqJ3jo1f+ojTTzoM1QfHaIYO+/TT1HB/D+aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDFNtQPj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HR5qmXNN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDFNtQPj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HR5qmXNN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UJ4Hxh002175
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 00:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dRWr4G35KeRP/qcct8QKgqT2f3p6uIgv8CYdpOrhrm8=; b=lDFNtQPjfBudE5/L
	KgLwrGdITQcqY0odUm6f5Vm6R8nS22mPoWGT/yPqIojkmXLeLX38S8jgyq3Qt2EK
	Q79L6Jomw+ueFIhgt8d3tx7f+2omTVpIx5BHmhJ72xDF5+pP6tbXyp8PqZxpxcaE
	igWo3Dko3szTHvHsPUeLP94I++4mVyf/mFTY6quLCFDNTelWWHAGFqGv0OKQugDY
	Lw6xaKdzfVuz5pSHUodP4jBSMUNSFLCifugjxksgSGWOMS137EhhotH0YXI3a0AK
	ingaca5Wbtvs2NdZDPGTprNcayDqqdM/53cF33dqxC18punAqOPerjjXWaZa5yL3
	nDn20g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h188ss1s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 00:23:56 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934956beec8so1225090385a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 17:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790814236; x=1791419036; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRWr4G35KeRP/qcct8QKgqT2f3p6uIgv8CYdpOrhrm8=;
        b=HR5qmXNN8+FgyJ4pgk9VAd4oWXx9lbzJhDNvr/49G/phxi9/ZS+Tugoql3WSnjX6Aa
         3IhGPYvSHCg465T24CWfyII9ACvqzo+DTBipwjOhEtQIIZxe/t264dOkgclIKGfCVBYD
         Xgt2lMSnuh5Vc3QSJnm9DxKQB5bMtjppiTxdTzJI11nFUA8RUK7FIHTazGZIh6fkrxB+
         pr89sn1rnlBPuZoYZGKXoM4PL5QLXC63vkFxpWZtlJLuv8ittYgtqQy8nVifR+YAG6Or
         Yxc9KtvL1M51ndtt6bI6+rf7HeQCynFNJz+ovpHyqHcGhNZ4jKHOGln8fNGTZCFTP/gv
         ukkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790814236; x=1791419036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dRWr4G35KeRP/qcct8QKgqT2f3p6uIgv8CYdpOrhrm8=;
        b=ATfOyp8hQLOby/7D8TwJb+mzmXx0M5MWrL8T1hdjNZq+rk1OHnNJbpYcYw18zkwQBt
         ix4FWLn4sO9zLgm9vyBR9RDfvlhN+2v6Mh/bB8Ciq+x7ZnjvsyMgE68DcWnpwVBEcP7p
         PHiFW4tTSnKnU8MWsB+rl7QkAFrUgtiMAGw8OPr14JnOrQSY6Y4vhiRQDPBUWLfXKxXz
         j3IOVdyX9q6NZoROe8xvYZPgcy3Y/yDpeZLbvlL/m1DyM8p/QLfr17+lH9jyRHAUXrqS
         L9K0e95W1EeW8uaPxw3+tag88aMZ4Td6VODoax4Ejmws516IqxZtjglYukVJRiRp8N1n
         Gp9Q==
X-Forwarded-Encrypted: i=1; AKwUvBzkF8lwgcw91t9UsJXM6iYV3xAaMhpI9WP4A7ld+bVhuN/m8MKyVoilZBQaYephazH4y8sRwoqFJu1RVmxs@vger.kernel.org
X-Gm-Message-State: AFuF++mSrcr51OBl6fUdUBNNrMdc5GR8bJJSLqa/3ewF+7uflgkcKjgj
	isz4gPk0Zl6zo7bElvw4Rr5E6j4yHZIy/qTbt+/H4GaIi16saVM0zgUUHGHTzkEcxSzGk45i1i9
	0x0KW/RpVLZ9xMubBebzcTQA9snMDGRI13SvpyzxTTb1o/rwdAzsg600iPHmlgtXSJb33
X-Gm-Gg: AYBFou1s8NzjOmKRk2gpetLo+JeRBPJO8HBgPBKUwcRoscGogpE0Yb6MT2kj50p16KP
	C3lA8SynQaOuCvmpMkFTO6nX+lKAY3mUBfFdTLPviQVOw4pGxqqCzT3LlHiIP9rbAr5QLH2HiCH
	+W9QJZyoDtPODJaNPbW+/Kuv8cR+p5jdQQSzSbf9S9f4sWTBXA0gA81JgUsCRSWk3TdgL4aYk/L
	749FhZ41lQOvP9XQzlAEToZ1lJpNQb9/fEMiVRF8TF0F0PLYxEd80wy95NN0U2YxSGFfmP2d/tp
	Qf9bXdWEjfU5Sx3j1fWrkbjJN9Jlw/ohkJ1EgmhInh1Hu8Vfb/KdUVnlLiK4h4LJ3lWqcilDKxP
	H0UTjNECWpOuUKJx6Pa2ZVk5sqsvQxBiKd7uaojCdxvOftvd8M+0vGvDdASdS9/LTBJ47ge/kX3
	Sx9Y1nlzIKyTgN
X-Received: by 2002:a05:620a:439a:b0:93c:677c:778d with SMTP id af79cd13be357-93ca9889978mr559754985a.59.1790814235687;
        Wed, 30 Sep 2026 17:23:55 -0700 (PDT)
X-Received: by 2002:a05:620a:439a:b0:93c:677c:778d with SMTP id af79cd13be357-93ca9889978mr559748785a.59.1790814234954;
        Wed, 30 Sep 2026 17:23:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbc4a5sm319563e87.63.2026.09.30.17.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 17:23:53 -0700 (PDT)
Date: Thu, 1 Oct 2026 03:23:51 +0300
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
Subject: Re: [PATCH v5 4/6] drm/msm/dsi: Support dual panel use case with
 single CRTC
Message-ID: <ojszylphvpite2r5hoihwcusm5xiun6rjgxsw5kdhvhh3yhq5x@s747ah6cxukd>
References: <20260727-sm8650-7-1-bonded-dsi-v5-0-c042266b9eeb@linaro.org>
 <20260727-sm8650-7-1-bonded-dsi-v5-4-c042266b9eeb@linaro.org>
 <jwlmzhhgpvbi47lt4biwn4razrvbf2rfi5uyyvfhjomzo7uqyh@ahf4ubqvegst>
 <CABymUCP7DMOqN9j2ZWEtDxWpZSbNWbrYzdJ57crsR03hys67mg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCP7DMOqN9j2ZWEtDxWpZSbNWbrYzdJ57crsR03hys67mg@mail.gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAwMSBTYWx0ZWRfX2OZ/E7Jenw01
 8ES4TqxQUc3W20axJuwEZ5ZErfi7Yc1YLwDQ2pV2pseHWEBycGUiXEs3BENxJJ/Asr0iW5u5IBl
 nRQK87ZefjsCqlcJfkl0F4yAt1Olyxc=
X-Authority-Analysis: v=2.4 cv=OozaWC/t c=1 sm=1 tr=0 ts=6abda81c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=ZtgA4oShcCahqduzc80A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: ZYny9eTYlLoLo_wXi5bp6pnJVVFqw2xq
X-Proofpoint-GUID: ZYny9eTYlLoLo_wXi5bp6pnJVVFqw2xq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAwMSBTYWx0ZWRfX2oJuAZjZwaPo
 3gVdNJGTgflyvbsnQreEYeyuh/jzuhXSJQ0Mka/56DAp0TzWIGd1ZYQxUpIpHmlfS21KC4zq0yA
 mhJy4ZwoB1n1mlMY7JyTtpUrxtySram6M2d0nUsY1jGPSU5wyzUpy12MOKAbjakip4xGfvYEojJ
 ycoMYNlwOdds/nI14M3ZrCZEOOm9eHV748/RGVqBEiXt5dO897Pi71fff/ny3upxyWxPVlqp+iQ
 ZaMEETR2ZA04Qe4cuO/YC924dM6LYtTjq5mlrTMkwx0+z5sX4DWOEgDtFrt2051PxprBdgrMYS3
 LJOYdSykXMDJB76iWPGd4+iHwdhia8qt0MWI4z7mcqlL7bntoye5wYnP/MNddjc1XhYIZdHCl4b
 CY+tU6IKWxhgNxyQHbPJnG0ckCwje9IH8EU0i+afk1ZpBLZO9HKlWE0OVrRE1HeTxqBlrWRMicI
 NVJbvtpKVCXqgnNkRTQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2610010001

On Thu, Oct 01, 2026 at 12:10:13AM +0800, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年9月30日周三 00:20写道：
> >
> > On Mon, Jul 27, 2026 at 04:08:43PM +0800, Jun Nie wrote:
> > > Support a hardware configuration where two independent DSI panels are
> > > driven by a single, synchronous CRTC. This configuration uses a bonded
> > > DSI link to provide a unified vblank for both displays.
> > >
> > > This allows application software to treat the two displays as a single,
> > > wide framebuffer with a synchronized refresh cycle, simplifying rendering
> > > logic for side-by-side panel arrangements.
> > >
> > > At the DSI host level, the frame width for each link must be that of an
> > > individual panel. The driver therefore halves the CRTC's horizontal
> > > resolution before configuring the DSI host and any DSC encoders, ensuring
> > > each panel receives the correct half of the framebuffer.
> >
> > I guess, the flag from the previous patch should be coming from the DT
> > node of the DSI host. The DSI should then get the mode from a single
> > panel and then set the adjusted_mode for the CRTC (note sure how this
> > will work for the compositors though).
> 
> The original information comes from the panel. Panel driver exposes
> the flag to dsi host. Because the panel driver hides all dual physical
> panels stuff and exposes a single panel to DRM framework, so it exposes
> the doubled mode to DRM framework level too. This simplifies the
> handling of 2 physical panels in DRM level and compositors level.

It simplifies the compositor, but it complicates the kernel code.
Handling this exctra flag becomes non-obvious, sorry. Also, how does all
of this map to any other vendor? Or to the case of non-DCS controlled
DSI output?

> >
> >
> > Also please note that the are other possible configurations. For
> > example, for some time I've had a setup using two Raspberry panels
> > attached to two DSI hosts for exactly the same purpose (please check, I
> > think Neil might still have it, or maybe somebody else from the team).
> > Each channel is an I2C-controlled DSI-to-DPI bridge + a DPI panel. I
> > understand that it's not your target, but it's something to keep in
> > mind. I'd say, the bare minimum would be to resolve a second bridge (be
> > it a full bridge or a panel bridge), possibly create a second bridge
> > chain (remember, bridges don't support branching, so you are a bit on
> > your own here) and at least manually call the callbacks. This would
> > ensure that the second panel (or a second bridge) is properly controlled
> > (and thus would get rid of the second reset GPIO from your patches).
> 
> I asked Neil but he has no idea on this. Per your description, you have 2
> DRM connectors/bridges for 2 physical panels. I guess you have topology:
> 1 CRTC + 2*(encoder / connector / bridge). The handling of 2 physical
> panels falls into DRM level, not inside panel driver as this patch set.
> This 2 methodology does not conflict in theory. Do you see and conflict in
> implementation?

Frankly, I don't think that the fake-double-panel sould land. The device
has two actual panels, tiled into L+R. So, exporting that information
would sounds like a better choice (I might be wrong here, though).
It feels like your patchset is trying to cover a single usecase, which
is understandable, but it's not a typical way we work (or accept
patches).

I *think* that the fact that having two panels should be visible.

BUT, there is a more important part. From the userspace point of view,
you have a stereo monitor, supporting the 3D SBS full mode (and
hopefully a single non-3D mode).

The compositors need to set DRM_CLIENT_CAP_STEREO_3D, then it will see
the 3D mode, etc. All other compositors will see a non-3D mode,
outputting the same image to both eyes.

> >
> > > The pic_width is used to calculated DSC parameter for DPU DSC controller
> > >  together with panel's parameter. While panel driver that support dual
> > > panel shall provide slice_width parameter of single panel. This patch
> > > only impact DSC configuration, so crtc is not aware of it and not impacted
> > > by it.
> > >
> > > While the DSI panel driver should manage two panels togehter.
> > > 1. During probe, the driver finds the sibling dsi host via device tree
> > > phandle and register the 2nd panel to get another mipi_dsi_device.
> > > 2. Set dual_panel flag on both mipi_dsi_device.
> > > 3. Prepare DSC data per requirement from single panel.
> > > 4. All DSI commands should be send on every DSI link.
> >
> > broadcasting of DSI commands is controlled by the DT flag.
> 
> Do you mean the property, qcom,sync-dual-dsi? It is QCOM specific
> feature to send DSI commands twice in host driver. It can be done
> in panel side as well. The bonus to do in panel side is that the
> panel driver is more generic and can work with other SoC in theory.
> And the DSI commands can be handled together with regulators
> etc for 2 physical panels in a centric way. The panel driver is
> more self-contained, minimizing dependency on the dsi host.

And then the panel driver becomes specific to the L+R configuration.

> 
> >
> > > 5. Handle power supply for 2 panels in one shot, the same is true to
> > >    brightness.
> > > 6. From the CRTC's perspective, the two panels appear as one wide display.
> > >    The driver exposes a DRM mode where the horizontal timings (hdisplay,
> > >    hsync_start, etc.) are doubled, while the vertical timings remain those
> > >    of a single panel. Because 2 panels are expected to be mounted in
> > >    left/right position.
> > >

-- 
With best wishes
Dmitry
