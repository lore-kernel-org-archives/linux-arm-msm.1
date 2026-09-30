Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E742DEA95
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790794457; cv=none; b=gWg9ZXZGAwc8JUnPukvNbCL+8fnSTQRNxmrYx1yc8poxhutl9zf+cYWwNXsMcLnsnFDvtwxD3m1+z9/WiLb/CqZBzL4laoGv8KyL8JnUMh+PRv82owgLW1T0CN4YwguZWh76e2RpUqUeK82/QXiLXtep10c5MWy6P6Bl8HhwOz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790794457; c=relaxed/simple;
	bh=mBfR8m37lYq2vnd1auojbZ2KSl7yWaueyWc8jTpR7MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFZRZlwb9rVBYQaTb71K3HIiLuuvFGcPvGMnM2UNpxPF9+dUoSV30yn+2oJxtgxlXk8ADrQ/bksumM+SzNN7SI7ShEn+hkZv969PPtUCdXXe1JGiWtXBM3mt0lngUWhr0HXJXr7hD/Th15UuqvxYt4IuIT/Xtixv67z6gMXYUno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QJG6Rbqk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A+7NOHk0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QJG6Rbqk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+7NOHk0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHfmE3238918
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gnnRitNHQsGGZhY39Q2WfcsA
	gBctnLcpoJur/qokc8I=; b=QJG6RbqkWltaOXjdWTCf37r8Jt47ICQMxogyCmWu
	1Pz2SKFiT32S09RpePoOLYEAMOc95KUtX3ELA8b/wk2qLDBRI8DDWGMhiVlR1DOF
	WF5eCQ5NeSo7x6ekXDtMGJzF17qEfb794vdPLbQaRcCNPk1ue4YZ1ej14knc2lmE
	QtIEwfRyw6x5PW+g1k1Myf1MSzsO6DBgngl0wWWU6s5ho+Yc/LCGRnbWdQN3MpxL
	8hX4LvFyBUys7r2nrI2guUqoGtQOZEUWNG69zrYpjORWBXosS3i76JAIaK+VbvDC
	/fxvlr61OYa+vTYIpO5Ytf3yRJIvjtUHccm9fK1oafd+Gg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0w143bg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:54:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93a0312937eso758216085a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790794454; x=1791399254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gnnRitNHQsGGZhY39Q2WfcsAgBctnLcpoJur/qokc8I=;
        b=A+7NOHk0/LfOf6uDpimET6JvuFlZ5ntC1M4ubxDjwRaiDhzTf8K2Usp+zNwe3obMaJ
         2qMnHmcbGjUVA359TrsxQLllqzGxiPVZe/yPm2XQ9x+rnVjzccnkfqP9ZIIgzxlLCd1z
         4khqpNcdLDPDxCcTcTyjA5BgH6BzA9kzmndnT8404NzXAQa+If1iD0vM9FZcWe0FIp7a
         misZZlkznB4mFPnTVQ0URs0/HTFcIVcEaYWMbAspK5RpwOEo7VpyZ3iRxZIsQT+3kgjm
         2VlPmYiIyKWSPX6YTdInM0qstHFFha6ikNb2YxCkofFKyZ2NXv3gOuJtyqpph419dW0R
         raZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790794454; x=1791399254;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gnnRitNHQsGGZhY39Q2WfcsAgBctnLcpoJur/qokc8I=;
        b=gDJ5OvUNgjITmrL7crLmirgwCRRy130pLQb83x+tY/5oczu5Yh2Lj9P5BKuxeKcdVF
         rAanwJig4FH7zwwpOz8XH7/kwq07iNkRQBdiTG3JvEOVAXUmvufdNzpQ1mhXY0/z8ncI
         toDqrfq10Z/OpdloUCP2BKMMt4YM/PnnPxjwFh36WuLILhI7p3fkZ/hv0XFo5S6vtWH6
         aMKUBwN8+ky44Ycs4Ph1MPNbL+X2+Iyje8+OI2Vcl/W0NAJIX4RAnjRLqiQ1/p8notce
         VLtfLrohYUny8ckAb3TrwEj4zgPkpb2L2kuxJMptdYTYxxGdYIqhEY27ZhliZ8bcxHLD
         wpeg==
X-Forwarded-Encrypted: i=1; AKwUvBwE7mcAz3Edds9UdATVNjJwQ2mwIQ+x7vHENqWhzklc0YNCKTLYf3JJdUT7uuAXF3gmuZFcA0qhWiPKL+m6@vger.kernel.org
X-Gm-Message-State: AFuF++mfT+YpOjfSDgJHEeMQqAPM7C0Otr0n6Qa1Co9jLWls9XNMYxZ5
	wnSOQ+Bk1WClJYnI6QNuxaozbkFxBEpwyPCTtRFaS3vuCnUtL14K2tVPopeIWyAabEZaGiKA2wP
	69OfOFhpkTkYcjrtQRhF02UVQudYbc30YlbGtJoC1ZXpKchO2mhBf2artiZQ1nbA/08Uz
X-Gm-Gg: AYBFou37dXKWrFzyxjw1TxnB4AtzHmGXEucWBY7gSDYEFLNEiPt3GdTeB452iF16QoF
	9R5AR/P5UZo2JbBLfq9/2c7ZDALSWs8grCfeZn6J++Ca5Wq2x5tpNIekaSZI6wE+aLJ9Gppwcza
	jpUx24iVy7kq+Zwz4/O54D/UEI4CxK1WbYnLqP3P+wUIiU3e/9ZJRImkknVdq2JdS/yIxEQEXdP
	ovk4gKxNY8mkN3gc8huWclMKAhRAGJrJo/8mItduuAwjQmof2BBOEVEtcEK2GPE5q0lelLPSWDT
	+G09SWdWYxicYGpdyNMIsjtNH4ZizeIPI3Viq49nDn6dihkJHgRx+kG79BnhpcPktRyGngQy9jK
	rShSiEC6nLZHqHs33gv6/FGl+5Nm0JZI0PJLzVJ0HN8peMBpR9Fe5IRs6rGrAkdWRquAO+RLXay
	0DDJS+0y6uyLRk
X-Received: by 2002:a05:620a:838e:b0:93b:c581:2e16 with SMTP id af79cd13be357-93ca96f18cbmr421033585a.30.1790794454187;
        Wed, 30 Sep 2026 11:54:14 -0700 (PDT)
X-Received: by 2002:a05:620a:838e:b0:93b:c581:2e16 with SMTP id af79cd13be357-93ca96f18cbmr421029985a.30.1790794453655;
        Wed, 30 Sep 2026 11:54:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ba42fbf388sm163284e87.75.2026.09.30.11.54.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:54:12 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:54:10 +0300
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
Subject: Re: [PATCH 13/13] drm/msm/dp: Add static HDR metadata support for DP
 and eDP
Message-ID: <uaqcvnjhzcj3d6zoq2begzhu6ld4ehfmmsedoc725ubodmmuxv@mjpvzey6ysuz>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-13-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-13-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfXxOGCOHnRmzYn
 s49rgzNJiZATD5bhsM6QZAMo/ALRph+U4AMf4TYrqGSkx/I90NwRjrTX4qrsiydEVOfr0od0zz2
 7qjQ/c87JWMqcabTYTBCXJevf5SUqEA=
X-Proofpoint-GUID: XWaeOETiHfDf2hVJb6KIjKRiSLUXHNCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3NyBTYWx0ZWRfXztmAjoo3cCCw
 YAm3IImaThFn/Lgh7mQ0moR2YzvSlTqIzazaeVvsLs0UjLqY1EcIdrdkGlKW4VbuLZ6rIRjct6X
 uH/9rdFJx63BGmwx1aswW+y98/AUWPQq+IHTvzKppm7GEVaO+13Kqqg30DRlW9Xt+ZYmef1hahl
 ByU+HDbHThQEkdUzyO5Mik0g/5bwC6ZaXEAU3d8Zzft6HHGW4wK7oNyK4euax+pzh13/KsQAq8c
 iG3G5RNG3SXh4YdM3JpwIRXcLcJz2CiRUFtF+S/ef3ZcMhmdwN8sxJRBJIJaS3Gf6nEzc6kSBo1
 r9w+i1xs0FfAGT/hIzKJ1F5xikfo6bq5f+jwK37f3MpPuJhn2C/h/8HQ4UIlcVrXYRe59FRn+H3
 TVrRRz10zRs6mi8kGrKAVe8b4b730bWTO76pUNyVoFmXgzVzd7lw68fVfChOn3oUlYDQ9dgGR/l
 YCuCf9+oDYSI/MSP2Sg==
X-Authority-Analysis: v=2.4 cv=J8Q/fwnS c=1 sm=1 tr=0 ts=6abd5ad7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=ksxQWNrZAAAA:8
 a=CHs-XZVRUtj_WxdIW8AA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: XWaeOETiHfDf2hVJb6KIjKRiSLUXHNCl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300077

On Wed, Sep 30, 2026 at 08:41:57PM +0800, Xilin Wu wrote:
> Expose HDR_OUTPUT_METADATA and validate and pack it during atomic check.
> Program Generic2 from the checked bridge state on every stream enable.
> Reuse the DRM metadata conversion and infoframe packing helpers, omit
> the HDMI checksum when constructing the DP SDP, and zero reserved bytes.
> 
> Require 10 bpc for HDR transfer functions and reject insufficient
> bandwidth after link training instead of silently reducing color depth.
> Revalidate sink HDR capabilities after powering up an eDP panel, using
> the stream enable failure path if the requested output is unsupported.
> 
> Force a modeset for metadata changes and include metadata enable and
> disable in peripheral flush requests. Keep HDR streams out of PSR and
> clear Generic2 enable state when disabling the stream. Preserve the
> software metadata across teardown so that every stream rebuild restores
> the checked packets.
> 
> Give checked HDR modesets precedence over SDR video-pattern tests. Reject
> new test requests with NAK while HDR is configured and return -EBUSY from
> the debugfs test control. Clear the test override under plugged_lock when
> applying HDR so that a request arriving after atomic check cannot replace
> the checked output depth. Keep pending test colorimetry from overriding
> HDR signalling. Atomic checks leave the running test state untouched.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/Kconfig         |  1 +
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    |  9 ++++--
>  drivers/gpu/drm/msm/dp/dp_display.c | 39 +++++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_drm.c     |  4 ++-
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  2 ++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 33 ++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_panel.h   |  3 ++
>  drivers/gpu/drm/msm/dp/dp_utils.c   | 61 ++++++++++++++++++++++++++++++++++---
>  drivers/gpu/drm/msm/dp/dp_utils.h   |  5 ++-
>  9 files changed, 145 insertions(+), 12 deletions(-)
> 
> @@ -717,17 +727,25 @@ int msm_dp_display_atomic_check(struct msm_dp *msm_dp_display,
>  
>  	guard(mutex)(&dp->plugged_lock);
>  
> +	ret = msm_dp_utils_pack_hdr_sdp(conn_state, &state->hdr_sdp);
> +	if (ret)
> +		return ret;
> +
> +	state->hdr_enabled = !!conn_state->hdr_output_metadata;

This should be done in atomic_check. Also please make sure that we don't
copy data from the state to the long-term structures. I'd rather pass
state pointer around.

>  	bpp = msm_dp_utils_select_bpp(info->bpc, conn_state->max_requested_bpc,
>  				      clock, dp->panel->link_caps_valid ?
>  				      dp->panel->link_info.rate : 0,
> -				      dp->panel->link_info.num_lanes);
> +				      dp->panel->link_info.num_lanes,
> +				      state->hdr_enabled && state->hdr_sdp.db[2] !=
> +				      HDMI_EOTF_TRADITIONAL_GAMMA_SDR);
>  	if (bpp < 0)
>  		return bpp;
>  
>  	state->bpp = bpp;
>  	state->colorspace = conn_state->colorspace;
>  	state->vsc_enabled = drm_mode_is_420_only(info, mode) ||
> -			     state->colorspace != DRM_MODE_COLORIMETRY_DEFAULT;
> +			     state->colorspace != DRM_MODE_COLORIMETRY_DEFAULT ||
> +			     state->hdr_enabled;
>  	if (!state->vsc_enabled)
>  		return 0;
>  

-- 
With best wishes
Dmitry
