Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E69C3644C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790791526; cv=none; b=rHXxTYO7djx9IIr/zc8TJoeLm6zx+DKm5j8GUg5Dth6SOOVt06EiUCXnK56TbZ0hHFe3ICpwzfWouBcoq3UbP1iHQOJPGXu+AZNBREqqUXXT+aO5QhK9uy3M31gmKZcInxe9OrsR8GBEeKLTQAgWOpgUqnrZlISwLGq0f28hJ/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790791526; c=relaxed/simple;
	bh=sxH4dofpoZUjjjRkfjU4M97ZTTGbZFjgCSjjQ6AM+Lk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rUgs7Mm5whLsuZe4mlpkY0948oxfu1wP/kndYd4LpMXW/0Cs6pijyy4KRedHEcWT+AQPLzon11A5pLpfxz5IYY0np3qHTW9YgCo4cHW2gik4TfVN2BctEPzSbla2bWZ2UhbJANYHMI5N3eXQbaQUclyZR1l3JDaDURd1H7qQEys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B7bPf8VI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yie/TGEe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B7bPf8VI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yie/TGEe"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UHf5AA3566632
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:05:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H/daFQ4eGR9SxKZQYumOcM+1
	gprzJRcbFZIEUlbLCvc=; b=B7bPf8VIh6J9xRP5uLUOI75qqF2EOAv4pW9rfGx9
	8tCB1+HRZ63xQibjgL5DFNnwzQZVcS9gzIPbVKuLzU/d6WZsse2PILQnKLncI4Y8
	st8SbJBSIzUq0018f6ZaihIl5k0zH0xHdZI9Rbx4OoZh0dNo0ZKMgpab8OoQnJT/
	Abdh9MEd1gFcZL39cU+EGutWi1AYZ9qRSjD4n4Djd9j0jvZds7FzHXiud0enqfA+
	gqMnROPHsfE3HJPng7RDkMUbNMfpJ86GtlTJjprFRFoB4HoQ7x7fo6Z0H1pm6AWC
	rdfL/WEn5Sdbm3NEfOrehFAEnpeb2vfqr0ITL5J/1zfJIw==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjm228-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 18:05:24 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-988a73af58eso253772241.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790791523; x=1791396323; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=H/daFQ4eGR9SxKZQYumOcM+1gprzJRcbFZIEUlbLCvc=;
        b=Yie/TGEe23jPghY8LdzHTZgwxxqaR+BwszIY3duBVQU++rZjcUaIILqrwj2ct1qo8J
         jlIXsjkhU98i5bJ1eUziwXOHKgXN5vSMkulbEouTl9k977O4e9W6xSOkgquIL8EkVT5x
         gFupuR2QrxKb7R4P2bk1W1ePCwS8+MjIth4N8Urpj8XkgBgb+7RuP0Xxx5AEXm0KUo/s
         9C/KyYiMsm0pxZseQAM9uIq/yg+h6xe6KXq5XMS9lQRRK8hUfTGsiSbyzVYVZESHCc9+
         YGnQHS6gKnwFil3aNqf+/CKzZzvPBGZBD84h/XQF+75OvVF2g5NjlPye49NfG3DLWjz7
         eB2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790791523; x=1791396323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H/daFQ4eGR9SxKZQYumOcM+1gprzJRcbFZIEUlbLCvc=;
        b=2yhM4cU2dA9/eqfBhocTdvTXrAmG8vqAxbaRwItBDncaOQWmzOU2q78TrZ75u2rIzF
         JRntM9U3qcxk1B74+NzQkC1ftlQMDmCciGw64ilDFZSpvodUqgGVI5JULSb0j4vYPCMI
         A+02Bua8HDAupBSTihm23KVMyK2DEI5XojE8WKhRSuvkgPedTKIwpnAoyNRheOd+2st6
         sIKD0qAtJgaQ/eH5ClXOk+rIOlbWDzHtBZB25eaM0Xxuh8rTbNyUmJX//781CKazNl5N
         c6wCwDiDRpv47zBcWPtBIhmm4vpChXLlfS3JkfO6Y7YFZwijcakeiKj09xW/l47h1rKr
         0DIA==
X-Forwarded-Encrypted: i=1; AKwUvBxhRkScdqLrhKUymmusx/ANbmjeSHHHG7kZUBf8iBBmDkwdvzHnkzu+WlCMxtFuY+8c769H7v0bYrcL3vaC@vger.kernel.org
X-Gm-Message-State: AFq9FYJuEuuDuVYEtEI43I4oooOfBkimPGxyobV435Ze6khmWNhl8nJ3
	qAyRNuGVMsAdg50DmFCFM0Cx8oHkZaLwnnPe5Cxl7+hTgZYu6HIbiuMAHFr67LFUg9OJXrOYrf1
	xy4XOzCFVePL9MHd2ChL5+FrlcZHycIn5WjEBe0Pvz7+lE2fLwE3iGJegmeDSeJwpj94z
X-Gm-Gg: AYBFou38Z4XazBMH+EPgORQDtnzYDg36J1HngJfxEwEgoi/OivTCqYbD3AFB0OUrFHu
	hD2XB+K+TGSx/bxOziboWKnLmysZf7ZPE24EQRhZuW1WRrDV4B20hHeDOMPXCBsSwB9YRyKnSd/
	9wMq7AyDkMLbKH89lLLbUvpj5tatqXRCS95VtxQtniJmjMUW8RPHW7ydlRlklDERuNAbwsbUzjM
	dTJ3EFZt/aZ+NMMvA+NY8Zlwvd3zmhOyFA29voaOuJjjeLMDoXv4lRLbhTs+QSTziaQ2PkRJSBH
	oi78B5PwrLIM0bZbMy98b2b4X6TerO+AifwlsL0f/D0TtTJcLDggiSA/W2q0XrRCSPP+h2dMpDx
	N387ExMkrbFvIUHAgPg2lNS8zBZwGObyElAShpGJgubh1kZGaHTFD+sJ8kVUJ9jJcnfQ2uB3LSp
	K4EJf4MvzqebGj
X-Received: by 2002:a05:6102:2ad0:b0:7b4:eb1d:d1e9 with SMTP id ada2fe7eead31-7be61e96e98mr567982137.5.1790791523033;
        Wed, 30 Sep 2026 11:05:23 -0700 (PDT)
X-Received: by 2002:a05:6102:2ad0:b0:7b4:eb1d:d1e9 with SMTP id ada2fe7eead31-7be61e96e98mr567973137.5.1790791522440;
        Wed, 30 Sep 2026 11:05:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7839d26b0sm426811fa.5.2026.09.30.11.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 11:05:21 -0700 (PDT)
Date: Wed, 30 Sep 2026 21:05:19 +0300
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
Subject: Re: [PATCH 09/13] drm/msm/dp: Track output bit depth in bridge
 atomic state
Message-ID: <bwnubezloh6442xm3t6soho4npktvgd52g6bpzcqygghx5gu5b@whfcbf664ps7>
References: <20260930-msm-dp-hdr10-v1-0-dbbf8b2b42bc@radxa.com>
 <20260930-msm-dp-hdr10-v1-9-dbbf8b2b42bc@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260930-msm-dp-hdr10-v1-9-dbbf8b2b42bc@radxa.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3MyBTYWx0ZWRfX9Frwt5cdA0m2
 BMtug+V+X0Dnrw6shvPX/4/AaU/4YYwizc78ZOaxtqE8Zwx+6fvKREkZPsyMJc856YW5IrahUB0
 YlVb1URba6qm6Zw1mIgfHofhFeS/LYI=
X-Proofpoint-GUID: gohQbQO75YaVRc46qgbwHsTLiQa0665g
X-Proofpoint-ORIG-GUID: gohQbQO75YaVRc46qgbwHsTLiQa0665g
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abd4f64 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=ksxQWNrZAAAA:8
 a=M2bzw9_zRUdtQjVNecQA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3MyBTYWx0ZWRfX6/JBfPLA1IJr
 RWpn+CIhYUhh9CoBs7NNv7e63cFnmo3vDiOX2qyM6niqRTq2HYHcwvyHCo4+igcti1fbxSlmQk+
 Q6+sKwIlonDjPbDYIYBDE/SGiv7jdWQbKQtUkQzvqSJskxxJqFvGclhgI+hZ44E0ObouSAX2rFU
 TtG/5j2PtWJ1Yop3MwV+nidLjJ6h6g01jJL/CvP40k0IESccsI0DPlXDTGSvFcqrU+kHmyPg3cZ
 ZrSYaM4fccF/qzWTQxpmrQ2+L2EQ/1+8eex/H442Pn+ZKVY+FXfCo7a+umPP82ux5NU4XS6zKge
 jI/s45bX1XScjtycygpYO84C08+FY8tg7CIbvR+dMELsB7Umq5ZEonrJxmb5IZVZI1TwsZs2Ani
 VlCOHC6Frk09eP4yN9zZXuMPW9T7eXMAi+x+3KE9o+oKs0k7PnVGH3GbJd6APKHEmWEL5iMMLX3
 ekDwOIHl+1X3PjELrRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300073

On Wed, Sep 30, 2026 at 08:41:53PM +0800, Xilin Wu wrote:
> Expose max bpc on DP and eDP and select a supported component depth from
> the new connector state. Keep the result in a private bridge state so
> TEST_ONLY atomic commits do not modify the running stream. Force a modeset
> when max bpc changes to apply the new depth to the stream.
> 
> Read cached capabilities under the plugged lock and defer the bandwidth
> check if they are not yet valid. Recheck the selected depth against the
> trained link before enabling video, including the reduced pixel rate of
> YUV420. Retain support for 6 bpc SDR panels.
> 
> Retain the generic bridge helper's missing-state guard in the custom
> duplicate callback. Initial state allocation can fail at bridge attach;
> return NULL in that case so atomic state acquisition reports -ENOMEM
> instead of copying from a NULL pointer.
> 
> Assisted-by: LLM
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 15 +++++++
>  drivers/gpu/drm/msm/dp/dp_display.c | 39 ++++++++++++++++--
>  drivers/gpu/drm/msm/dp/dp_display.h |  6 +++
>  drivers/gpu/drm/msm/dp/dp_drm.c     | 81 +++++++++++++++++++++++++++++++++----
>  drivers/gpu/drm/msm/dp/dp_drm.h     |  7 ++++
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  5 ---
>  drivers/gpu/drm/msm/dp/dp_utils.c   | 20 +++++++++
>  drivers/gpu/drm/msm/dp/dp_utils.h   |  4 ++
>  8 files changed, 162 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 16c9165b5f31..f41924e75854 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -23,6 +23,7 @@
>  
>  #include "dp_reg.h"
>  #include "dp_ctrl.h"
> +#include "dp_utils.h"
>  #include "dp_link.h"
>  
>  #define POLLING_SLEEP_US			1000
> @@ -2620,6 +2621,20 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, struct msm_dp_panel *
>  
>  	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
>  
> +	/* Link training may have reduced the available bandwidth. */
> +	if (!panel->video_test) {
> +		u32 clock = panel->msm_dp_mode.drm_mode.clock;
> +
> +		if (panel->msm_dp_mode.out_fmt_is_yuv_420)
> +			clock /= 2;
> +		ret = msm_dp_utils_select_bpp(panel->msm_dp_mode.bpp / 3, 10,
> +					      clock, ctrl->link->link_params.rate,
> +					      ctrl->link->link_params.num_lanes);

This doesn't feel correct. Yes, we can lower num_lanes (or rate), but
then it would mean that the caps that we checked in atomic_check() might
no longer match the actual hardware. How do other DP drivers handle the
case? We have a "golden standard" of i915, amdgpu and nouveau, which we
probably should refer to and follow.

> +		if (ret < 0)
> +			return ret;
> +		panel->msm_dp_mode.bpp = ret;
> +	}
> +
>  	pixel_rate_orig = panel->msm_dp_mode.drm_mode.clock;
>  	pixel_rate = pixel_rate_orig;
>  

-- 
With best wishes
Dmitry
