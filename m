Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 738291A682F
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:42:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789335756; cv=none; b=Loiz3zGOh1BuKb1iRz3gRo0yasGwEfrS1Sly46dv9JnwOh27F/yeSZXOS7G1jhmffN5iEdVebOXoRja4CVTICcBw8EHHsJfIHQXP8+5FFEQpubkE1Ao8qxGYdMblWNxibjep2Tpn3SZURbUoANtZszthQHT28u+kM6IBjDDl7HM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789335756; c=relaxed/simple;
	bh=21N43bNCbNwQdRLSoYTobyN2WN37hNF14IohhrclkRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6TDUTYss0ZwE+ODXnF2JMnZTmLcNeDrj+t4hLDTB70yUV7NqDGBpHhWlMdATZ4zTrSdBB71Rcgkzsfp9sLUSjZVdZLbphzvFq2ra2GY4D7AdZZdADmtJ9GZLvb5pOBf2fHnl66F5+5dg99RHqlt7PX1Xpukac07azY//QIYJes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HiG7s61O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=elt5BQyh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HiG7s61O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="elt5BQyh"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DK0YLI3041226
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:42:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UAdGueHE+a9zntgGiuhM1GjC
	qAqzf2hTlkwX0CikYMg=; b=HiG7s61O7LGrUojzPSNwW2HKxGtpYY3b88ujTUKb
	bCz5YQeaL1TvTwyu/bR4bkuoLNH1OXicEdKxBlRWa6xI5XwLKLWrUisB+inMjHPt
	yiaZttPMLj1pU1rDsqxtBnIitLj7TmSKsT9yTtioZjE+IOjGRxSjUBhlkF+nahOs
	1A+VL6iuLZYJt8WeheaW5DnRma/8QI6kfRauPkD8ripL0p/y8OqdSI97VH8XLAeY
	hYVMXso/MHXdeWoN9Tfd7dEjdcfUARMHkjU0TBsb1L+SLoTGoiSbntsjm7PhVxu5
	+od8D/nSWUgqo6akM6tHPP9KHqvj3U7PPd89be8d3a3D1Q==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dm832-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 21:42:34 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5c7ab4af214so758885e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Sep 2026 14:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789335753; x=1789940553; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UAdGueHE+a9zntgGiuhM1GjCqAqzf2hTlkwX0CikYMg=;
        b=elt5BQyh7nEkq37hxfBZMKpAsjPDz8DEVJPh+mFHVaIa/3rjbzTz7sxTi2t5UK284V
         XAhiMsJtaRL/nOiz1rwBDe1f3NkAagHANOnpVLSYEM9ytxuYvFtr/o97dgy9bQslAmiZ
         4d7ReFc0poQc71M3WEwbGU6CiooXIVKwz9sufe7Q+2JtCE943IbAygiIA/GFjKVaRAev
         HdELiMxrLzLdjXj3JhV1wOlfHatFY+4+LrS9jWFu5AwxM/Mm/z5t80B3hZEcO+QJ+bkc
         ftWKS3J+23nLtyk/f+LW8s08PdiNJJ7289K/55v1wegzYWrqjQ8sXzyRtP0X8SETkXrd
         AZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789335753; x=1789940553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UAdGueHE+a9zntgGiuhM1GjCqAqzf2hTlkwX0CikYMg=;
        b=UYwItJnLOM+4iNyr/yZHadWevnLay4V2TQFog8gKCWpEXOqgCzrIfoAt6Cseyqx00v
         UhNbnOsBSKc5UovdCerBd5kzYAaO3D9ci/3jv12+wYST5QgYd6h7k1mo/ixWIvzEou+u
         z9R9tpANMJ1Dtfpw2D+QPsxGi0sGxIJxOZAImGLd48ypIa9gfRiTrZ13QIF5DZaWVr3Y
         KXD9vtbswIsQwEnu62jVK0oL3uEeUI8+SoLi+pcoBVAm1oUeL03s9eaab0sIgy8kkK7y
         Zi+VG8lHTaXiBMnD26oP1DM4jCZvoUFYneeLNKap+ysecypQCDhlaukgqdmp37wvcOK9
         6dqg==
X-Forwarded-Encrypted: i=1; AKwUvByws2LdRNolQ9USNHOuFSYRsz/B4nvdlh2tVo0oh7gnYfyo4mXg5JQ+EXg+UKwLrN4M5HJX6nbdC8JO97Zr@vger.kernel.org
X-Gm-Message-State: AFuF++lnD6Wjw10hLTYGFbwtir+tADYa0SbiCUSH1y5pemlKkI16bPaZ
	3p79SHO6MToh+22SVhM6RHL7pom6wfMsCZ4uS65be586fu4vErkJIctrVH6CyGHXmdFn5i+Eam3
	nFp4TllJ859/Roa3ihEAW4YA6MELFaSG4MWlD1JbnI6FPHaUIo6KA7pbrzwnm23cyw9CE
X-Gm-Gg: AYBFou1rvierCzREoWRCVF27NVOP8CGCiZH1vI0MVUxjdyVfvIEgq0Wb/FTlFy677a/
	yWQrcaDmcUOt2uR96rkUFwrN8+e8NUaDwK8mywhuOZ6lCtRG41+IaNrtXRXG8yvXOHhRi7r2YlF
	Y2XW3NDvWNjCUow9K9HIxN3wqpAunlc1e3xLWaBSHC4wMjxwWS5Mhce9Es4cx+fAdynT2hkvX8u
	Nn4OQ/w4kLH2ug69LmNgRX6hNHLfHjtXtt7oecPeOO5EtNaI8KKl+7W0S9mHm1fqS6+7hLeI/0e
	DItPkivPefAWA+nrs8UMG7fciUG00FnyH/Q0VD/McxTgAVRkenFbeKYeNAv0i8x9XD5M1yRPq73
	bIUNm2ovGFmiG4V13VElmPNMaRdTl6ln1qGAH+IxzY/XmpN1syMtvs6VoHzeh7XVwiKSrpbuJOg
	RDbh1/6Qo5A9Jm
X-Received: by 2002:a05:6102:a144:b0:796:7d9:a60 with SMTP id ada2fe7eead31-79607d9203fmr2599823137.3.1789335753499;
        Sun, 13 Sep 2026 14:42:33 -0700 (PDT)
X-Received: by 2002:a05:6102:a144:b0:796:7d9:a60 with SMTP id ada2fe7eead31-79607d9203fmr2599819137.3.1789335753065;
        Sun, 13 Sep 2026 14:42:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8a047854fsm1938531e87.67.2026.09.13.14.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 14:42:30 -0700 (PDT)
Date: Mon, 14 Sep 2026 00:42:27 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org,
        Ritesh Kumar <quic_riteshk@quicinc.com>,
        Vishnuvardhan Prodduturi <quic_vproddut@quicinc.com>,
        Mani Chandana Kuntumalla <quic_mkuntuma@quicinc.com>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] drm/msm/dp: continue link training downgrade when
 cable is still plugged
Message-ID: <q45k66o2geby5lewynwx3okmmmun7ippmlzsyx6jegabptmrd2@cwk4f2hu7vwk>
References: <20260824-qcom-dp-typec-reconnect-fixes-v1-0-2825e5bf8a96@oss.qualcomm.com>
 <20260824-qcom-dp-typec-reconnect-fixes-v1-4-2825e5bf8a96@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260824-qcom-dp-typec-reconnect-fixes-v1-4-2825e5bf8a96@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDMwOSBTYWx0ZWRfX4vE0u2RijjlB
 VLqs7whOgMIrN04gEjK68xl4LN8p7IBbejaJujIsoEaZXgJBxL0UPIBaYi0m4JCjLJqwEaNq8CH
 trC+//8VXyZJNp7T8JvN5VQMhYGtr4c/bUzafzN2L5933Xx+/zp5Yh9iuklPz5yuld2no+pmM6z
 iQcpftA0lBiyPnEIZIp5mZtcPoKU70wVlZwRgTIgM3uTSuWSHINP7N0MzH9PZeZFxmvqcZ1rCKv
 DYn9AEyR42cRy+6jsX74iqY+UXA1DIBiQdzf2hfAe9XlxwpPXr3eNpyXO0G/bDQnAZXDmUOrN3A
 lHOcSeGVZruFiRkc5fndDhSlBVNd1qxtg3NY7ChCLn3wjsoObQVARoNZ7+I89nIo88OD7avE1Ml
 PtQpaMub7Jb2BYlQCN9927p8B6/FcOdlXZmhQxuJyqy1WgsD3s763R4ylUSYuguHDt55RkMYZWa
 mOf1R5p8yMbHFPz8DSw==
X-Proofpoint-ORIG-GUID: 60S-J0hU8Ptmbxk15F2uudQpH95S3bjm
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDMwOSBTYWx0ZWRfX1IZYz/0AFQSN
 F/i1cCTtz6WOHCg1d8NQFbqLBkGl9/J7Jbc2upwG3aItyHdxqWiOQNa5hCd+1CR8VjDLa6E56k4
 ZBTW2Ph1ouLqiBmIYtJAkxlaMXAbh5s=
X-Authority-Analysis: v=2.4 cv=Y6htIReN c=1 sm=1 tr=0 ts=6aa718ca cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=282R5v4PAPrGKAVVY-QA:9 a=CjuIK1q_8ugA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-GUID: 60S-J0hU8Ptmbxk15F2uudQpH95S3bjm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_07,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 impostorscore=0
 bulkscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130309

On Mon, Aug 24, 2026 at 04:58:07PM +0530, Saurabh Anand wrote:
> During a Type-C reconnect the AUX channel may report link-disconnected
> transiently while the physical cable is still present. The link training
> retry loop in msm_dp_ctrl_on_link() was aborting immediately on any
> msm_dp_aux_is_link_connected() failure, preventing the rate/lane downgrade
> path from running.
> 
> When the display is known to be plugged (msm_dp_ctrl->plugged), an AUX
> link-disconnected status is likely a transient glitch rather than a true
> unplug. Allow the downgrade loop to continue in that case by requiring both
> conditions before breaking out of the retry loop: AUX reports disconnected
> and the display is not plugged.

A cable reconnect should follow the full procedure. DPRX may use long
HPD pulses to signal that DPTX should reconfigure the link according to
the changed status registers.

> 
> The plugged state is snapshotted from dp_display into msm_dp_ctrl just
> before msm_dp_ctrl_on_link() is called, so the retry loop has an accurate
> view of cable presence at the time link training started.
> 
> Signed-off-by: Saurabh Anand <saurabh.anand@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 4 ++--
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    | 1 +
>  drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 59070f399e2d..e8fd8f4c75fe 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2379,7 +2379,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
>  			break;
>  		} else if (training_step == DP_TRAINING_1) {
>  			/* link train_1 failed */
> -			if (!msm_dp_aux_is_link_connected(ctrl->aux))
> +			if (!msm_dp_aux_is_link_connected(ctrl->aux) && !msm_dp_ctrl->plugged)

Locking?

>  				break;
>  
>  			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
> @@ -2404,7 +2404,7 @@ int msm_dp_ctrl_on_link(struct msm_dp_ctrl *msm_dp_ctrl,
>  			}
>  		} else if (training_step == DP_TRAINING_2) {
>  			/* link train_2 failed */
> -			if (!msm_dp_aux_is_link_connected(ctrl->aux))
> +			if (!msm_dp_aux_is_link_connected(ctrl->aux) && !msm_dp_ctrl->plugged)
>  				break;
>  
>  			drm_dp_dpcd_read_link_status(ctrl->aux, link_status);
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.h b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> index 5902cf7e746a..95533b0b6297 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.h
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.h
> @@ -12,6 +12,7 @@
>  
>  struct msm_dp_ctrl {
>  	bool wide_bus_en;
> +	bool plugged;
>  };
>  
>  struct phy;
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 1f60c78a463d..93a37a44273f 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -644,6 +644,7 @@ static int msm_dp_display_prepare_link(struct msm_dp_display_private *dp)
>  	if (!msm_dp_display->power_on) {
>  		msm_dp_display_host_phy_init(dp);
>  		force_link_train = true;
> +		dp->ctrl->plugged = dp->plugged;

No, don't create copies of the fiels. They easily get out of sync.

>  	}
>  
>  	rc = msm_dp_ctrl_on_link(dp->ctrl, dp->panel);
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
