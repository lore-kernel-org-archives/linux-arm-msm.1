Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793101126;
	b=qGFY7rUwjIjg3EECnlG5RUfHIsTRlct8qPbRmDj+p0c6XQandzbssUbYPuWS2Y8XQCQB
	 wIV36wAXVnQMGcq6r9CkdnvjbszHs1i3tRZJBYXwR7hCp4uZY9vchmuetFQWq6NuEFbfb
	 RsrRfxqoYIs5MsYMx9s7reQgLkFD2XWOyYR3AtwjLfFN35RhQVq4mnD913RVnjyBE4RvG
	 zX0JUV8yt7NiOnfE5qCnncbIJkR6VlAk5Fw9OQPoo49JO0jk2L4HPXw9UNVKxUSdfkJfb
	 eVRuxWcmoXWj7mBdf4Itpi4gS3nUlkyYupYmMS7xiGGmm8P8NFTGbFrt9MofyujJ3eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793101126;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
	b=vl1P6uEbNZ1Io3bi8VCH7HANrXUMM26/dYmP4ge4NeJX5u6oGBc4ABGDUHUl32/Hxic6
	 L7KduppWsVtpcFYZAviSoLlhsX1+x+v2cUFgii9L9tbLGrNuQ2dAiXiWEC/EOfaH9MQnz
	 mfdW0nCTZT0dxCIilJAro/TPQ1ZWbBqMUouDsU2zfW8RvI44vpPf+cLOI88aKRsOYEl1j
	 Jzy3msDM5UqZiqmPfdhYfTm7s0LOOj5OWD5IBYtUVE/ikG0QfVlcj5xgr1Jm1WO9PcTbZ
	 Wxvtbl1hKr2R1iNOKnZuUC0hu6E6Pq8+Jr3moCjltOyDSQq3PmhSm5XYnyOD3p0g9YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="d8A1SGU/";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2l3y2gl;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E6760A381D
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84E6760A381D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=d8A1SGU/;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Z2l3y2gl
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAeDYR3012202
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:38:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=t8KeJqXYQPr8zutUgjnJ6yEQ
	LnjHNNZkSiiSYzj+XfU=; b=d8A1SGU/3lNieXhNKzh78QX8sIvtyhoggCDvkjo2
	ZooNqFjFtRxIPsA+xBHGhEwUfOys1kTG07Iff1x+bBTZFVWToPjzxT9N8EnOkrNx
	IEGxQb2KI8RaKfi6IZ19cdymyNOTdoCHQeQYQLCMNTK9oZwDvYY148nlQMyElYrH
	nDvOEUPoI5cM1gKNxhj7N7mZKOPMRLIrN6j0HBwaYQi86++6BI0mVQNoQLmdXzQ9
	wKMW0uM4oJNn608zdT4wH+3YUkoQIer3xZf8YVZLZru2N3Hx6hdqAnijFoHnd9sT
	w6PcNVLoGn9P/kyfRan8jZasQplHO5ZXeiRXOVeR9WFG9Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hje3dat96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 11:38:45 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cb9d27ddcfso737283137.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 04:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793101125; x=1793705925; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
        b=Z2l3y2gl8efDAcKPmx9asGDaPwrkEVgMxaadFXzkcQ29PiAAQ33AYJIFNUpZ7pfna6
         bPA7/SmpEQ6e5JgFXQVokPSAn72P4zixpAiV7eidruSoAyE32tFIqVU+2Q/KCwz7vryt
         1KSe5VQxCrNDjMBU4GAYDIV5uq8V+0Lw6puWV9D4e7VCChWMPskJ1YrDEuS1UNt1RIf9
         aUcpb7Sin+YwYVS4+/5Y3PkL68D4oyZMtM0C+DTT2TaPQhU2dk+lyN0FrB2EzLCoaHhn
         bMAC+UCpC6E9CNRPStjZNGb2zkL/TcDwYczV0COzyn/9+/bEKQlzQCWLqYgqB0DPNUHx
         JCzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793101125; x=1793705925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t8KeJqXYQPr8zutUgjnJ6yEQLnjHNNZkSiiSYzj+XfU=;
        b=iYmBbFHSFVcRUhZOkSm0EWIJzeiv3RLbenBzj9AsXD4A+35FIiay+0wnUxSbe2h0di
         YmJ1QoqHcLVE6yPUpPv9lWz9gMSbKXL8wtnmStRhoC+bVJXz8w4K1ybAqCwJhetkYVng
         aU7+bW+XuXoT8qgGtVWyLaIGvPwb3mXD0dMBnaAA6lbzCYrraR4eLh/to/p3LME1/wPA
         KLhj8ip9xgh4mURqH/asGeZtneZDNX95wzQ0FRgejzdrbAvhM1868W8TgMC8d5EDqjfF
         XIa+kjsoRd+DP7fnG9SZy7Pb2yld/fqYqfv/e0cEpffl68+LN8Dca6fijwHCAiCX8d7y
         oxPA==
X-Forwarded-Encrypted: i=1; AKwUvBzt36J7Z1EkFm5BqPkiJMFhfZuPA4J1+QoBVQupIqgLxpzyzSrANoeMdfhhSz4kVFFSSkgEp1o343vWKmpm@vger.kernel.org
X-Gm-Message-State: AFq9FYLPsCN11Zt41KOK6zdXm2YiYX1Y27jYVtINzrHuzDed1zarU1xQ
	bvwqzKo9wY7J1pRLElY7C1fTIWuBROjhossANeusnI/N6qbGfHUhOedsdtv4p1e0hcncl1iVzgV
	9lXDVl8+gFobFyblS72XSfcODMtcsF01366k5RQh5vSToggF0wrY32S3Ibmc+WGYBqAG2
X-Gm-Gg: AYBFou2p2A7PJYFzYZN7OA6NUHD/no7olyceVW0MZ4yFE141TPmqaAbi9kqqJcEaFOt
	cJkpXcjYtqaDqU+twApJ1o6oW0twJ3n6bfyDebspaRt2h5BAwSriPaPv/lAD2SoFkFvnt4lSViX
	BhenBtP/ah1mvikv0cxcMkAQjBEyV+O1glv08l+jt//sJfA56HSbrGaRYJm8WFnPTFlsevTpnVN
	fyzora4h9ZLZZKqHpoq0i4zE6urSGqSE58+wtD0Nug/ZdsFcFuULOPciGjgPZVq+zKHvG/xDJs9
	4H2RVp6+Dne+ENL5ukFl8XYTf83xnxguVSaxdA4SvQVje8Wi9zNtDXUpZpidUAJig1VDwtXOAz8
	C/7c0yT1ug3VUql3enc/iJRuh2JSHwIXddWpizpT7KwK6XKu4f+ZGzX5u3I934NOoiJiNNTrufN
	S/IExEiyA1YMNB
X-Received: by 2002:a05:6102:ca:b0:7ce:6474:7216 with SMTP id ada2fe7eead31-7ce647480demr2158215137.36.1793101124455;
        Tue, 27 Oct 2026 04:38:44 -0700 (PDT)
X-Received: by 2002:a05:6102:ca:b0:7ce:6474:7216 with SMTP id ada2fe7eead31-7ce647480demr2158168137.36.1793101123899;
        Tue, 27 Oct 2026 04:38:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac70a27a03sm24389741fa.29.2026.10.27.04.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 04:38:41 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:38:40 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowangio@gmail.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
        Philipp Stanner <phasta@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Flemin Jose <flemin.jose@oss.qualcomm.com>,
        Mahadevan P <mahap@oss.qualcomm.com>, virtualization@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, iommu@lists.linux.dev
Subject: Re: [PATCH v2 22/23] drm/msm: Register the DCP backend
Message-ID: <m7zuu3txmzw4xemqrdtemccmvc4g6l3fsqk6xyxz5zzdbltptd@oqubuxwbukeg>
References: <20261026-jshekhar-dcp-hlos-v2-0-7cf014efdee1@oss.qualcomm.com>
 <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
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
In-Reply-To: <20261026-jshekhar-dcp-hlos-v2-22-7cf014efdee1@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfXzOt0x2djWncK
 UCWjYZNsBph2LfOq2AcuEi7yp7jn8KwSEaQUGrR/S8IcXUr+k7a+v0ohJE7Yx1vGuvOks+NoMmk
 GZzo7q8s+0lxHW1zaIMfe5VT/fuO6UY=
X-Proofpoint-GUID: 5N4AKVPeDMZyxPYVAMqFh3i-uxMaK65b
X-Proofpoint-ORIG-GUID: 5N4AKVPeDMZyxPYVAMqFh3i-uxMaK65b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA0NiBTYWx0ZWRfXz1ejNz9+vuzx
 fSg6npafqRquBxyJyCYIAKYv6lNnaA+ZvyZ5Ce+ZeB5wkh5piZSMAfmjDksZnjEc5YaxJwJZ+JX
 5avl/0CAe6vhkkSt0oBOPisc6ojsAHx4TG81xRDmxLMsDgxvIrP5JlN3rquLsMXm2DKkeoRStI0
 KCkWP1At63+NOiYsJ4oPFaiu90UMurOZp5OTfEKqLAj//lZK8jNb7Ot9njtrH1NL5hrMEap0UAH
 BiIrwM7sY5YkBISc/g3RdU8l9shZQg0IPsP3DJfSj4p/SV2Lnz2vk8iBEIEccxE5n9Riw4ZT8uG
 cUptwzgPLlX4JJ89eXQauYR/i8JsCziRAeJ4+Tp8jYbOdcA8wm8+VfWRfnswpEbOo7wTcLu0MVQ
 qm0OpmFIPIUwt4w8OmpBPX/NPbLDfK5DJgiIZevJ/dH/0MeLTZZDZYlV4Dz9fN+eLVC95AjAv47
 HtSvg+6IYXlu5YMFGaA==
X-Authority-Analysis: v=2.4 cv=SN/Xx+vH c=1 sm=1 tr=0 ts=6ae08d45 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=5ffiRAJw0Nfj9fulafYA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270046

On Mon, Oct 26, 2026 at 11:51:32AM +0530, Jayant Shekhar wrote:
> The DCP platform driver provides an MSM KMS backend. Register it from the
> MSM DRM driver init and exit paths so the VirtIO driver can use the backend
> when the DCP function is discovered.
> 
> Add DCP registration hooks with no-op stubs when CONFIG_DRM_MSM_DCP is
> disabled. This keeps backend registration consistent with the other MSM
> display backends while allowing DCP support to remain optional.

There is no need to describe patch contents. Please update the prompts
you pass to your AI.

> 
> Assisted-by: LLM
> Signed-off-by: Jayant Shekhar <jayant.shekhar@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_drv.c | 2 ++
>  drivers/gpu/drm/msm/msm_drv.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 5816c64d7ce7..d413c361c442 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -1208,6 +1208,7 @@ static int __init msm_drm_register(void)
>  	DBG("init");
>  	msm_mdp_register();
>  	msm_dpu_register();
> +	msm_dcp_register();
>  	msm_dsi_register();
>  	msm_hdmi_register();
>  	msm_dp_register();
> @@ -1229,6 +1230,7 @@ static void __exit msm_drm_unregister(void)
>  	msm_dsi_unregister();
>  	msm_mdp_unregister();
>  	msm_dpu_unregister();
> +	msm_dcp_unregister();
>  }
>  
>  module_init(msm_drm_register);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index aa5dfd82ac6f..befaa9f2cb5c 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -417,6 +417,14 @@ static inline void msm_dpu_register(void) {}
>  static inline void msm_dpu_unregister(void) {}
>  #endif
>  
> +#ifdef CONFIG_DRM_MSM_DCP
> +void msm_dcp_register(void);
> +void msm_dcp_unregister(void);

This means that the earlier patches generate "function without
prototype" warnings. Please fix that. The prototypes must come together
with the function definition.

> +#else
> +static inline void msm_dcp_register(void) {}
> +static inline void msm_dcp_unregister(void) {}
> +#endif
> +
>  #ifdef CONFIG_DRM_MSM_MDSS
>  void msm_mdss_register(void);
>  void msm_mdss_unregister(void);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry
