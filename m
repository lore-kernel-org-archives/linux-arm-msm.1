Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132A414DCA
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Oct 2026 10:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790851953; cv=none; b=II7jobfBOfvNJ/XMNbdlcVTryZcmsgxpQHfT/+AqPU5lK44LrZE9VbriPGmcLsTprg632BpHYNXDsCy6eSIlS9fd6uAThwufJCRXAsU41MIm/NUCuy00QAf0rOdk+3KDz/r2hPlI1WJvQhCzU2RVECi5e4DNxvz1BMcPSbD2DRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790851953; c=relaxed/simple;
	bh=/FKUHm1Q7AGJpg4CoKepSeiJp6/Qt/IH9mVd+KlQUZw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7LBW7zG1kImKkm/avyLwE0NKTDlqMFI25VjTZbjS1sgY7Iq/Y6+4+jnISwaU9kCvM9/FTsTjzpT2zqKzk/iOKm8K7siCUcgAQYkUorFftmzEUihmuYJbUipJTnloL6RMGupK3w1cW3G0diqkyAbn4ejkoeNw2JQmlGIZQmQLTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FafYS09y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hFC7PWgB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FafYS09y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hFC7PWgB"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xXf22176881
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Oct 2026 10:52:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=seNlxQsU0wllHJnL2cV3aBSv
	wJpkeEtX02XCtF/70CY=; b=FafYS09yqsvT65Yhy3dpAw0dLe2AMzE50o4dWqC0
	bKlv01b6jJ5EUHqvdap6B/wT7rCxVcn9qcevFkPyQfJkzsq8LDHO3ZNv8nHlHQ47
	kD1/EGik/UOcKqKpR4RVaAnGQCXyKv4GbxOfI7dN4x4hqkROIcEIbSI3wruTTeQg
	HBOJ/xDJJVwWT3OGjnVPh+I2+sR12pSurH3PRxVy8Ogfs4QWTJIc/YsK9ZP+ybPe
	cdy2kwZQklyZKfajKHFjJaBsj+vRYA8InJrpd7/rk93pWWbPLHBCl8UAGoYaNDuX
	okGh74rAmv3rBBu6rFc218GDYvmLs6NFH7+rgATcFKSkfg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1h7nsepj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 10:52:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c444b438aso1370916485a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Oct 2026 03:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790851949; x=1791456749; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=seNlxQsU0wllHJnL2cV3aBSvwJpkeEtX02XCtF/70CY=;
        b=hFC7PWgBrcszsyi2pBs5xCzvJs6Kuml0+eY6hN4eOM1e11d/5sg1ToIZFNTcRTdXkk
         /0EOnv5zF6RFclgTEQsh2MNOZ9/N6elf6AgmCr+qQ4XLgKEMKPItOMNhXKPqEJ56hqsM
         GcHC9h1C2o9cQ/fXpxkjZbf9rr51h1Q4MD2tROeNxwbJvgzsm0eyBX2FmKIcvGkQKrUz
         3T1zqHp/vonlaJKx9+glz4N6uS6uDcs4cDMvr8aaHtx/SGnaZyj2IFI2Ds2IyvuFbVn8
         O0FQludQ9H+TMUzCpVBYbMufDeQg1RNxupvetAfCAqx+bUE1D8rXVZUuxk5YpcPT7Nv6
         u/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790851949; x=1791456749;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=seNlxQsU0wllHJnL2cV3aBSvwJpkeEtX02XCtF/70CY=;
        b=OuFraL5ZWCg4GBES4xahzmgFSJX/n1rCxGL3/nwSo3G41mmv3p49ZN+hKIb3CSzYiM
         HLj/gS68h/nwXwuy2syZNQ0wt+xxBt4uyhcw/eaZESWR91wwWwMd/EIM++AYqf61dCkN
         iBYx1DHMYz+Q0zjTyXqgcHuHI5SVtK/WwRu6/1YAEMy6QnSGMrgXDhrnooggt8GX4gLt
         rFPlBXHnMDuQ6v1ZUpuqsMv6yxEz8uuPDBKp7YwYYGlI1LExm0agUlUfK8VXeeT7boIe
         UfL0CeA93Y1kWuN3TC6TTEveKsl/i7E04KZ5Uixl7wXZrjPgoLjgSqZZFDCekJbixQiK
         p3Vw==
X-Forwarded-Encrypted: i=1; AKwUvBx9m0CRm9FgqzwuG2kRkNOWW1OlvkIal9XEm+hh4HOm2gkwH86Mv5HzkScTtH2jjFw2l1Gsbte7EytgD9ya@vger.kernel.org
X-Gm-Message-State: AFuF++klaKa3vZef8Uxm+IXG5flFdNB+eNCPdAR7wb5mZodQTIeyj19P
	LKrY9DSEJdD2gOlYTJVPeHI/k+jO7hBWkjAcEXhPO/WSWYQrckxihi9o3/aYNW6JLE5HOrGPUrL
	cjGYui7yiXL4MmsnnfXL0EtiIab/SWxJXqLYRPxgYqz++TyzcxldYUDTbGjoxY4kwwUzi
X-Gm-Gg: AYBFou3JH5BqChaXRG0v+eKxdkXIv22/ng8SR/32ekHvmoYa72ZmtpmizVEkJETTE0M
	BqFrMs+bAxsEWPnquTaaWL+tNBj2MPw/bf9SP4P472VhkdQdk9/nUtc8onvyaj7IQTqCIX0iQ8X
	j6O3NuXl7UwupA0C7wEq+yhq0IiL2nMlHxASe3L6r6A84n6aDxq+ehwkoGYoD6rGceLzLGphnqe
	4UuuUodDf3nFqvCH2wqL33chsydq0jH0IdH4OAxzZ/ioCH7kwXCDH9TewBDiYdF+1+akZ7QgamK
	VhVkZcMgk8fyyW1DOceKqtd4pYF2rDCiM+iQ+NvzQp+0EtjzkFzE8tzGNjgvMGql4W/qHIgRz+d
	jRzzROTMThxwCFd6jMX6s136buTYn4a2GXgoo2wwPqZXrf8CX+tQiTU3fgmVrqrncSr7hcxw8Y+
	ZMrk8DVfV2OHXB
X-Received: by 2002:a05:620a:1d05:b0:93a:3d67:391f with SMTP id af79cd13be357-93ca95da7demr801488885a.7.1790851949367;
        Thu, 01 Oct 2026 03:52:29 -0700 (PDT)
X-Received: by 2002:a05:620a:1d05:b0:93a:3d67:391f with SMTP id af79cd13be357-93ca95da7demr801485185a.7.1790851948771;
        Thu, 01 Oct 2026 03:52:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a7be8b7333sm4165741fa.23.2026.10.01.03.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 03:52:27 -0700 (PDT)
Date: Thu, 1 Oct 2026 13:52:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v7 13/35] drm/msm/dp: add support for MST channel slot
 allocation
Message-ID: <agm7esy726no4u4cntecmllz5kxdtxaue7xcn7vdhkuh73lxau@r6mqybgiyl7f>
References: <20260929-msm-dp-mst-v7-0-4b81473185e7@oss.qualcomm.com>
 <20260929-msm-dp-mst-v7-13-4b81473185e7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260929-msm-dp-mst-v7-13-4b81473185e7@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=OI6yTiaB c=1 sm=1 tr=0 ts=6abe3b6e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=B9W9OPTfjs53PBBgks0A:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfX0F9BAXfWgnQM
 oy0V03F3CoBBFuEi83hA8qfyDBglviW8vngdhNwufXxa9GkIE30g6QT7gVs72WzDHXOevwU9MFQ
 ssuF3WE5kl79W5YH/5KyK4mPREx0PwY=
X-Proofpoint-ORIG-GUID: ziT9BmSXmJH9JCwMAQItRHaDpx8VP3Wn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA0MyBTYWx0ZWRfXzK2Tz/injjz4
 sVTW8Zn2r1mMt5Rq57nnH3IAuYgUybGgNYmteo1fy3J+naS4rk/9Wcn/5HerRLiFpjjrBEREznW
 wurb/hIDBfZa+XYbxs0giwSeWYAYrD9VBZyyMjaEIx6P5Wuzsng1onbVnJIzGd6tPR4zmTqocx4
 ZrorqiGz3w5nqo+9Ys7R8dCeEiehRP7yf6pNiSJ28Rzp1NoiHzKQp3GafFhA1lhNKoYADPMGEtR
 eD/E+OucGWQGdu8uaggc7STnLwJuuCBSkMrt5dTMcSN9ATX/asSK8nP11Wu24lV8hoCP4ZNXjwb
 l7dKcwHT/YCF+3i8VCp69rd2dD65uZUKpPhq9ZyIvBGJiSa0IJ/dnY8ubaLucMOwTXB0qNUIEXt
 3bxpA0r06cScpvd73J6NC4FlHP4yGdogl4TKYhxUWH0TubljUf3WUlWF0/cw5XkJJM4Qf88sWiH
 bU/d+1RvpRoNwR5p0ow==
X-Proofpoint-GUID: ziT9BmSXmJH9JCwMAQItRHaDpx8VP3Wn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010043

On Tue, Sep 29, 2026 at 12:25:37PM +0800, Yongxing Mou wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> DP MST streams share 64 MTP slots in a time-multiplexed manner. Add
> support for calculating the rate governor, slot allocation, and slot
> reservation in the DP controller.
> 
> Each MST stream can reserve its slots by calling
> msm_dp_display_set_stream_info() from its bridge callbacks.
> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 187 ++++++++++++++++++++++++++++++++++++
>  drivers/gpu/drm/msm/dp/dp_ctrl.h    |   4 +
>  drivers/gpu/drm/msm/dp/dp_display.c |  13 +++
>  drivers/gpu/drm/msm/dp/dp_display.h |   2 +
>  4 files changed, 206 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 929e0f94f8dd..02732bd4efa1 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -83,6 +83,7 @@
>  #define MR_LINK_PRBS7 0x100
>  #define MR_LINK_CUSTOM80 0x200
>  #define MR_LINK_TRAINING4  0x40
> +#define DP_MAX_TIME_SLOTS 64
>  
>  enum {
>  	DP_TRAINING_NONE,
> @@ -119,6 +120,12 @@ struct msm_dp_vc_tu_mapping_table {
>  	u8 tu_size_minus1;
>  };
>  
> +struct msm_dp_mst_ch_slot_info {
> +	u32 start_slot;
> +	u32 tot_slots;
> +	u32 pbn;
> +};

How other drivers handle slot programming? Is it something to be shared
between the drivers? If so, maybe it would be better to update MST
helpers. Or, asking differently, why do we store it this way? I don't
see where msm_dp_display_set_stream_info() will be called from, but
isn't it a part of the calculated state? if so, all the slot allocation
should be stored in the state structures rather than storing them
directly in the private structure.

> +
>  struct msm_dp_ctrl_private {
>  	struct msm_dp_ctrl msm_dp_ctrl;
>  	struct drm_device *drm_dev;
> @@ -153,6 +160,8 @@ struct msm_dp_ctrl_private {
>  	bool link_clks_on;
>  	bool stream_clks_on[DP_STREAM_MAX];
>  	bool mst_active;
> +
> +	struct msm_dp_mst_ch_slot_info mst_ch_info[DP_STREAM_MAX];
>  };
>  
>  static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)

-- 
With best wishes
Dmitry
