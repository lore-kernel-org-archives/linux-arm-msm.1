Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0260647DD51
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791814149; cv=none; b=lq6fzqfcwAXBaw5M4nC9y/X9ritgzuFsk+Vd5nX0anHNoda+FkCnDe5NM3KWRiKixP3jB75VS0Eefy3dJPoiwT57gcNcL0SzsN9Wg3roo0ZHkq8hiMtzAAId3DZFdoL0jXDJGyRIZeqk6myWHJuX9NDsc6oT8g7dKXgXww9GlzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791814149; c=relaxed/simple;
	bh=IGaiwFlsOFfH11rUVL+wBq+QbJN53vZ0bg/khZ+xJys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEpKWqFXvb+Vz7AI7NKAblg44g5e6Wz1Afb1r+BJztYj543/IMj3+sfBSXDDZYh8ob6i6c/lQJx8b1QpA6yh7Xz/N5MXOEKMpctvg/K/SQgPShco1vnsmLQIyIvBbTKYeWg7jEW8TOyPOG74iZoGXTD7pb16/lN4LK+ffUKQ2LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ckn2jM7E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YLv5X7r6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ckn2jM7E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YLv5X7r6"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CC0F4M1236317
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:09:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=mdrAE6CtWkM5g2ZOGMq0Ywa6
	INxDz9OrKN4VJ11fBwY=; b=Ckn2jM7Eo0qepYoAQcndFNeW2qyhGOPwe2Mt80W9
	ElX2mrrRhZErw4oASsxb1JsWQZsCTq95LZUB6q00UegX7Ant666BW9yPZzlaSw4f
	PhEhmRCzi62WwFouLsel3RuvzRIkJMB3boSSmZKUtaG/l2Ec4/KOFVVjuX4KzFiL
	eoDv26PvZMSc2N+4pgI9FO3Hxr2f/FKCN23q0JraCNZMvVYNFvWo9Z3C0RsbnPhC
	tXXYzdAiXPZKjONgWzxKUZFcwyjAt9Buz3p0JiABcZrn0eLRvm0OtSedFsP1nFFt
	uLQ4T+fWcVst5Lpu1qCDKK1jIvc5tY5ch+5PAPHjj+VygQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8j6dkbgr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 14:09:06 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a2035a4so81923466d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 07:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791814146; x=1792418946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mdrAE6CtWkM5g2ZOGMq0Ywa6INxDz9OrKN4VJ11fBwY=;
        b=YLv5X7r6LtBRNaskJyUo4+iPlbeKmEOTNtz5LhiU9GVULtAjAr8Nq3Tadng37h8fyp
         IluiuXwNhLUZExTHO3wWiGK9sJDEDNb7yGRxzbA7FMyXwKmcA2dFm+KIozyVcRMs4JPk
         6xZFMO+vvVaxgA+rFhzg8cC4seVmw59v0//C84ELngHhFh5lF6jKIcSY4QMlk4m1EZvW
         /xiQXsADFN4zQbjHbpd+x/0BXX15zmM/lC8Z0sPWQdzsquIEoMsUAkK3JFD5njKSTFl5
         1srW4H6/i9SENylwQVz72jH+XIwgMWmIE5nN6mxDFn2tIvi+sGjGizyG9IWBx0Qbm1sm
         b3xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791814146; x=1792418946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mdrAE6CtWkM5g2ZOGMq0Ywa6INxDz9OrKN4VJ11fBwY=;
        b=UMA1x15GWzh20XoWH1MRiKa/Y76VSC1gVPnkSe22myUQCPiYwKp6FJpBX+sjLEetwj
         MSkbeQLS95W7boM/Gs8ZOoLa6iVOBV+6Zlu1kqHBWvH6t6GUkmNhcFKWxZHBxgtZQjHb
         TjECDZdRyNt+9Ea/lkKclG1q4WZqCRxqxKdq1wWeFojwHzZJr5fePhNEK9SmyPuQARFO
         Fypqolob6KHNGCU1/gGpmU+XMZGVz6+n3EtWEUSw+A7fB0+5wFyB/ZWlqkYhTWubIZ7U
         ufWL95G/i1eI5y1KKPrztAK9ctsXTz4VWn45I+JulCvXukukD8SBTYRCn9JbfTNwG5BN
         OAXQ==
X-Forwarded-Encrypted: i=1; AKwUvBwuuBEid/NEimZsA/4qLUG6En+ov+hXBoCBA4Rtc0al8516htczl4Ohpz/wWLAPAHE42wXW5XOVhEslGbvJ@vger.kernel.org
X-Gm-Message-State: AFq9FYIdnnCL/+lGeejjjr7rWrDhPF3vS9bOvk3bXkkgc4OfUZNU15XR
	H62PQPvI1ooKga7DXKvWbY29r+chovLgvA+7wib5ufeIchvMG8KrgCDhAns6WFj8x0z8DosHeNa
	IETsK4sWzAu3xSeZczjXAs+mY9W9DEWJuYSRnozX/uOaaEzznjubxlSMyX1Xsncgzqbjt
X-Gm-Gg: AYBFou0Zhrq7shAUvxW9wYuiwym+Wj/br9ToixZGjOCQ4IEqUJc9X1t5qY8CxdNS+Io
	RR66m8iNpewaodjAEJ7sAv72yp3Ndd9fvecf2VprSLFrhP8Gyf9b2yGukzryvo8yrVusdaFqCSN
	ngV6AVITTokRMZ8APoTVcT0C3B6DhZW2P+heHgAKOhjA9RKfOVLVY1hucPSEDoXeypRsTV/4oDd
	y3Bg9YC3yVte63rwhBwQ+C7gIs7aXStc4Y5m5W/Ea5omfdon/DU44Hf9QOHV8fi8DVMAIBhW2MG
	yRZV3iICzIq5AqW7+y+mykh0DoXYM/d7MMDaw0vj1oF9ARaUdm96xBnO3SZnAv9IifhdLPQX48O
	JyJrw7Kc8KILGcvkwUbxiRrEJl2+MEqtbpbPYoxlPLeUy4RoUML57zJ2pSrgt3DMcmceDNFXOj3
	nkIuIUV2nfCc/Q
X-Received: by 2002:a05:620a:3182:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93eb95e34cbmr1568175885a.12.1791814145758;
        Mon, 12 Oct 2026 07:09:05 -0700 (PDT)
X-Received: by 2002:a05:620a:3182:b0:93b:cb64:25a5 with SMTP id af79cd13be357-93eb95e34cbmr1568168385a.12.1791814145243;
        Mon, 12 Oct 2026 07:09:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bcddcd3fcbsm2883054e87.0.2026.10.12.07.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:09:04 -0700 (PDT)
Date: Mon, 12 Oct 2026 17:09:02 +0300
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
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        dragon@radxa.com, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 15/20] drm/msm/dp: Flush VSC updates when leaving
 YUV420
Message-ID: <3itnyk5vvlj2piguntvera2ch5qn4mmzmqch3aevfmpdjvis44@7zujyc5sauea>
References: <20261009-msm-dp-hdr10-v2-0-1835d4966da3@radxa.com>
 <20261009-msm-dp-hdr10-v2-15-1835d4966da3@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-msm-dp-hdr10-v2-15-1835d4966da3@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfX1EfB7ujrBSl5
 qnCb3tKfOdudBNxkIa5130GpGFM6zbfhPvih13BNmteTAXBjdITbnXNzzK0n1jr1QZUbkBgGXqC
 Hwm0h6Smqu9mXkefoTju8UHSKOFfxoEEnsWGzn0uv5zIu5c6LNDI1Yvts+gjbt6qBJ6lo+wQvTJ
 iZrxainswzlyxobHCnF7IuknVphjN5krm+SS2KyHF5JzspCm7bycl/uxAtyF7OXAC11huGiYaOZ
 FUpT25PzkosH2V3vhMXwl4wY+Y2IiA2xBozRZjUFDgzzDgaEk1frSa1Jqa2Gp0VJ1pdPpzLbCHS
 SE6pBflgTUe4d3wV9Kywhk4s/zvGtmZ1HBnDhBtMgYqctQYpWljRyzMX6XlRYBKRyCFX4s4uDHH
 PHsTBExUYpePzmm+smsNFF/FbVM5SLHj1+PBRmzmLLPVrMNyIo2uuVVVBSvggoRnVILPv969LhM
 dA6quju4yH8FL2ZH9Wg==
X-Authority-Analysis: v=2.4 cv=aK5lOr9m c=1 sm=1 tr=0 ts=6accea02 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=ksxQWNrZAAAA:8
 a=Sq4eR0YASbV39jB7rD4A:9 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-GUID: v0DXJZKCL1eNlIVyZV0cvAhKidnVAsBo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA1NiBTYWx0ZWRfXygPa4x3a0dFg
 IrwgCZFN53zO1lm5L0We+rMv5VYvH15XGPuH/Lp6IWZZCdrSgOyOCOnopTMyc+QAhxyCkBNwpVc
 AHhIpWXfpc5o/c/nwWKD4+lf1XnuFE0=
X-Proofpoint-ORIG-GUID: v0DXJZKCL1eNlIVyZV0cvAhKidnVAsBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_04,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120056

On Fri, Oct 09, 2026 at 11:16:07AM +0800, Xilin Wu wrote:
> Peripheral flush is currently requested only for the new YUV420 mode.
> Returning to RGB also changes SDP state and must remove the old VSC
> packet rather than leaving its enable bits set.
> 
> Track whether either stream needs VSC and request peripheral flush for
> both enabling and removing it. Explicitly disable VSC for RGB, and write
> the packet payload before enabling transmission. Retain the existing
> hardware-specific SDP update mechanism.

Missing Fixes tag.

> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 7 ++++++-
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 6 ++++--
>  drivers/gpu/drm/msm/dp/dp_panel.h   | 1 +
>  3 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1f9595ff5fd9..486348113b8a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -691,6 +691,8 @@ static int msm_dp_display_set_mode(struct msm_dp *msm_dp_display,
>  	else
>  		bpp = state->bpp;
>  
> +	msm_dp_panel->sdp_needs_flush = msm_dp_panel->msm_dp_mode.out_fmt_is_yuv_420 ||
> +		drm_mode_is_420_only(&msm_dp_panel->connector->display_info, adjusted_mode);

Does it need locking? Can we instead store if SDP is goign to be used in
the atomic state and then pass both old and new state here, letting the
bridge to determine if the SDP status is being changed on this modeset.

>  	msm_dp_panel_init_panel_info(msm_dp_panel, adjusted_mode, bpp ? bpp : 24);
>  
>  	/* populate wide_bus_support to different layers */

-- 
With best wishes
Dmitry
