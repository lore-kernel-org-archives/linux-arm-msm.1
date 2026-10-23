Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792763907;
	b=MRZfbWq2PxEf8VvXs8cSD7EI8RbTeUSXvV1dBJO+UpsKP45p/gjF6VRevIGqa8DDNG5Y
	 Zx2LeCJEUiSNm9VAImsr6gfcEpsagmERVUWlv9oh5jLnqkI0WOyoVh89E4F5LiVtHMM9+
	 cJRytwSAQ0V5A23Cxu18OhFikWjQSk40aEEl80mLwuCoWu6NaFf748o8elMDguiZEUOVI
	 2TNkeUiG2Utw53bX+6pWnTNEMlNnFYQQf4UKMOoq+OrvdZM5fCJFAUydjojdGDmtmttmY
	 g0rDQPxf7NiG6ynxQb/+HwDHD84Zg1cxDVM6hz4KHY03akC4nDcG0E9p+9bsaWcCrIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792763907;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=;
	b=pmJKsAAkTf10/SW3bSgPUNkuo33PORK7GLfhFKKlUi+yHqBgJIxOpoYDNo6+l7L79A3U
	 fqZAUOwgb+oEXxHvi9/mwjRX+gbDOCxjLBa4bOhAhpdAkRoHa1Qn7CWCZYpyRg7UU67ZY
	 A6uCuLBQr3Gq80SLsemygc4rbzX2J9CftNrJMvzlpZB0S6haKgM2rbEuXm/2fhHZ0Lsfy
	 SbQCZsDrNv02Vt/xjVlomMHjUlPZaFUg9Y5eo6q0Vti12yFwl2hGeuMMAs0hjHWUW32up
	 mEzwHhWJpXHYwwSeZOMjIyUREs6BzoEWGV9QeTylCYseJKonpEwhfpDEprvfIvA9UIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKZn6itY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWlKYO5o;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148BA606A31D
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:58:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 148BA606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eKZn6itY;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=hWlKYO5o
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAZgJ2509078
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j7Lokafbtj5YFNefAbCjS5Pj
	lLoXzpnAAjQItwYXw84=; b=eKZn6itYuZIK1NC+9xHZfchb8KTvAyZ4XOZFYKW3
	0+eTAk+I5XmKxB2IVs6XMk3Q4p/ByPrf1ZTnpvQHFTOeI1KGya6D0PwH2ZIYkgrC
	7/7GGI4RqWTsbZhM5FFlTpPlspHcsdoo0xAMW3mvg4cF340wjMk+EcguNR7RBcnB
	Zo5LqK4fOujLdPenSVOkz7Oj7zyEgjkhOSYGBWpROdPrzaVvRMXhrDPDG6O1uF0e
	bCJhqZmO7E20D9jboC3u2wZEW8oVDDYtHRQAW0FVHWH1+eE70DXGzC1uBMkSDGj9
	vH7u0yaK7343vdgcpUEcNsip5r2jE9+ZdhE4dhen2LK7YQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsykbd1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 13:58:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f5844e383so167936585a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 06:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792763905; x=1793368705; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=;
        b=hWlKYO5oEtq7x5DkNW0yhUM3nDf+bpgmmTOYp4gjTy928N8jQ8oUFYRvWtaXV80Mjm
         4f5gfdsLsZUxByjpoDemOOyvgyhh5W4kDhxHWbORVpJkMy2fKxikplLOVeCwP4bdGU08
         Ted5JMbYATZGBeZlv1b9/fyfsh3BXd1rGKM3XrQCdVHnezYRwDNwzZONriiRqIJjujUO
         OB2jH19nKjs6NN7B2OulHD/wBf0NzU1MR9tb7K9RC5Ltzy2BHTS6r24O0Z5HTbAq/GG+
         3HlqQxg6uPhPwYy1z9PkGXrO/0iIfx4d/zqn4BDR+15mITZ6DOiCWK636JJGk4O08SM+
         vP+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792763905; x=1793368705;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j7Lokafbtj5YFNefAbCjS5PjlLoXzpnAAjQItwYXw84=;
        b=2GQjwNDYQxAZNmAfhslms/yqpJdxmQZMSiACGDYBnuZ4Hpya+Udov7SyhtMwA99hxC
         Jok7VOPLt6XkAqOdFVn8WKQluyqTi0wJLCYkQ07NzBhysk4Srd599bD8N4EXAQaG/95s
         F7IH++zPxNa4x4JZ/WTMGJn1jcYRksd2mIW8egKU3GjSru3Y4Iq6DbKbMpp2U5oSfRhw
         jHB+7ZSSAypwFKc27M9zwIf7jTPgTthzhJYiM+S6tlmaB7qkY2bl42pu9ssnGjI8FYAM
         RC4MILBI3JJW6GkzxI2b6mxm1M9npaCHddlIXUUQdHLYUYT3/gjyoFpuYG53GnXw1Z7o
         X2NA==
X-Forwarded-Encrypted: i=1; AKwUvBwY6oYNwRqiYG8wxEUaasgxeWKP3SPyPFu0V4qMr9gq3mCtpWMoerL8L1+5BsgEiuLVgex4lMRSeF/JxG2m@vger.kernel.org
X-Gm-Message-State: AFq9FYKhbCtqiTeKQ3BPUNFdbrEhJJ6cME3tHmuZki0aCm8WI8LXBQOt
	YqwN4E4MwxK8DSeoBK26p/UD0BXKTNMV/GzM9MieboxaA76O8iAFgaU62MY0IbBSNG+KO2z6Rdb
	Hk5lhXHTMWolcJ6OFgAg5RV0FzLktAkst68Un+9xBYqDAyaXSag6rFjzczzWlQ8rNcxNE
X-Gm-Gg: AYBFou0c/wMXXLDJOK7J1+Kna3QYnU8kQ1vX3rk1sKio23fsEVUD2Hi7oiozwBUp/lW
	iZm66cBlK6Y9O+n+JI53WHFgwEHNipFScKTcVdraRd4XO6g1X0HtFl7+VpAEHWy2QnOPQ1SU7+4
	1u6Ypowz+KKhxFuIWSeOps+NCz7DC6P3p39KRypsN0/4blD3yGd2ULnslR+nkAkfr7RiFOPaNJR
	xYH58NBvsYq2DKrmWOT61A0LFzlFI9uIu8ZZLk9DsAHMqN3NycOOUn522Co0DW1iL7Ti0k0BOel
	ceBvj0f0nYqyDX2nK/C0jl5qJQ/srXBHA0DlMuCjUVViFjV9ZuAF6pBkCOrl45fGWxiIVnbjjwD
	Hoa/t46RZ5eKMVe2jOzSg1Qp2DHkfx2pOj0+ox+L2iRhqxUwNy4EudRz+0zDqAXeIc616NyOrxZ
	X9oqbrtEfp7S/9
X-Received: by 2002:a05:620a:400b:b0:93f:57a3:71ab with SMTP id af79cd13be357-93f6f94e2a4mr398213085a.32.1792763905180;
        Fri, 23 Oct 2026 06:58:25 -0700 (PDT)
X-Received: by 2002:a05:620a:400b:b0:93f:57a3:71ab with SMTP id af79cd13be357-93f6f94e2a4mr398207285a.32.1792763904719;
        Fri, 23 Oct 2026 06:58:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfb02a2033sm389578e87.77.2026.10.23.06.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 06:58:23 -0700 (PDT)
Date: Fri, 23 Oct 2026 16:58:21 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
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
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: Re: [PATCH v7 4/9] drm/bridge: pass extra events to the HPD callback
Message-ID: <g5jbcwga22grufhguvkmq7scyd7ur6kxqeii24bedzli7nihfi@4hg5tcvlftnv>
References: <20261023-hpd-irq-events-v7-0-57a3aea3f09e@oss.qualcomm.com>
 <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261023-hpd-irq-events-v7-4-57a3aea3f09e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX8H9PxRf8i+fD
 nWpP/agOIGO3yjirpRUA/681aYxmDDriFOxtWfJOWv5Oz2+P3A3WEBMA/yQ2hBBt03UNsKK3naK
 aVzkS4YS6E/em9KEVkzJ9Kc+9FnbGdM61D1AetVz5xst5H5lASXKvj2kiB4vbUoGX055d7bf20c
 sJEALoDwXJMI8W1xi3pRuODXUHaoi85NXk+7khmbRwNtsnrjOaOB9mbMq/oyMKOeolSm+DSAv2z
 5po9gDrC4kliUIMCKRFvxanzcKHiPqeAgBKeURUUi58sQEctKiSP6Ah8iKbfSPX4+mMdKBdV6KV
 UATtudSSTMoveUER5BpyllDWnfXdSL90eMjOKr7chAmJ8Dv9GNr7b60FR/ezJmljzEZEexaQ2b0
 zimhkX27Vz7IXObT8TbtItW3rY5NKQcIFkRaNZLIDGLuG2IfS8SfJvOtgAjJaT/t06IVSOf+wPL
 XTDqjyiV/KoFgwB+3+g==
X-Proofpoint-ORIG-GUID: EQjszEHSuTYT0W2xVBHQNEqZoHyOyzvQ
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1NCBTYWx0ZWRfX3swIUo2DxYhf
 XUzS+a+WXvB3Tpck0sKC3GjOX9TEwlzmv9Z54wXoHe5CLG4v4hzHjW6ynyRjMdgioge7WNBMEL4
 gnEEQFGfJk4NDzU0S3d0w3OmoGlosN0=
X-Proofpoint-GUID: EQjszEHSuTYT0W2xVBHQNEqZoHyOyzvQ
X-Authority-Analysis: v=2.4 cv=GLKdgeNK c=1 sm=1 tr=0 ts=6adb6802 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=m8ToADvmAAAA:8
 a=pGLkceISAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=FczUWju-UfBOor4io5QA:9
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=kCrBFHLFDAq2jDEeoMj9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230054

On Fri, Oct 23, 2026 at 04:39:44PM +0300, Dmitry Baryshkov wrote:
> The DisplayPort standard defines a special kind of HPD events called
> IRQ_HPD. These events are used to notify DP Source about the events on
> the Sink side.
> 
> Bridge drivers report these events through the
> drm_bridge_hpd_notify_extra(). Pass down the extra status to the HPD
> callback, specified during the drm_bridge_hpd_enable(), letting
> underlying drivers (e.g. drm_bridge_connector) to receive these events.
> 
> Acked-by: Francesco Dolcini <francesco.dolcini@toradex.com> # lt8912b
> Reviewed-by: Pengyu Luo <mitltlatltl@gmail.com>
> Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/bridge/chrontel-ch7033.c       |  3 ++-
>  drivers/gpu/drm/bridge/lontium-lt8912b.c       |  3 ++-
>  drivers/gpu/drm/bridge/ti-tfp410.c             |  3 ++-
>  drivers/gpu/drm/display/drm_bridge_connector.c |  5 +++--
>  drivers/gpu/drm/drm_bridge.c                   | 20 ++++++++++--------
>  drivers/gpu/drm/omapdrm/dss/hdmi5.c            |  3 ++-
>  include/drm/drm_bridge.h                       | 28 ++++++++++++++++++++++----
>  7 files changed, 47 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> index c542ba6ce7d3..a21f9355594c 100644
> --- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> +++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
> @@ -427,7 +427,8 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
>  
>  static void hdmi5_bridge_hpd_notify(struct drm_bridge *bridge,
>  				    struct drm_connector *connector,
> -				    enum drm_connector_status status)
> +				    enum drm_connector_status status,
> +				    enum drm_connector_dp_event event)
>  {
>  	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
>  

This chunk needs to go into the previous patch. I will update it
tomorrow.

-- 
With best wishes
Dmitry
