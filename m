Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262AF3793DC
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Oct 2026 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791458589; cv=none; b=mfmF+ZnumP4wnCBPf3mzmftVhQ4dqXVjLRQA/h6t6uXAFkuv+30AQzRsT/IVy1Eb6Dl2sufD9VrU85phlUIuo2T38z052/vPGmz4xBJi61z5RL9O4uBnL3ZMqJJfH55M2mdNPZormrxRzHuULxcDeNLnqg5UP71fDR0QfLmsgl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791458589; c=relaxed/simple;
	bh=abiO/LiL2o7ZQnpcmnb/LlUFm3gPKmid+91QJ59tZPQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OIph4EYompbB8EyALKMRZiyuWROMXct/2evoACV+iQw9B3khD0K74fKNBrLAIRlKzNw+23cY0xLAGcjJJHNse3qhcAsZ9T+HhhhKoIfx+FusOVUPc6fw83Kszt2Ak0O38r+v2kA3/6t02MlEZ1S1FOyRyiuYwTKG/jJF2rjQOMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T1ZF0qq4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7R33rrd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T1ZF0qq4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7R33rrd"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 698BKgIA1270424
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 Oct 2026 11:23:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	agZ8NifRLOozJsK1Q2H4ch9Owtp/lTg/2FCgMokd4JY=; b=T1ZF0qq45yzmdWLu
	WoS2o77dtaeuWTvudJUWSOkiG805HRPziF8FgR+Qp8r9lK0pOvmuII6BiMT2XvvR
	b9ze5Tuk2va5MOygIOmQvuILVnKa1GHUUhCHpO3Ry75QFHyJJQoP7U784A7exRg5
	t+QySPac9iLLUFql28aFFtjjT7P694mncUaIEo0lqzqFZdVBcxYnCd4KOzO6ViO7
	4rYlW4tgpovDlWPPhpm+v9kr8ZlcqP/Bt1+L8gXryO37oFDLGf2t62ulfItyBrKj
	y9RhzCYzmmBnQX2umQehBUnJa/xS+O1jZRoPQ+WDkpst+JaRNX58JH7ne0FxvAdN
	kpBmgA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe32ka9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 11:23:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93e92aad34aso589778085a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Oct 2026 04:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791458586; x=1792063386; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=agZ8NifRLOozJsK1Q2H4ch9Owtp/lTg/2FCgMokd4JY=;
        b=c7R33rrdSteLUlxIoIFMGU6aLCV3hXQliVPKdrXRvXw2pqdbsrO/4W2sg+411QuH/1
         ee5cOj3x/sW+j0nJ2BBZnVxj5c+eaRKdVyAsf8AbXBcFiU7/i7cXn31V2YWezfrnoftX
         oJXYw463pQ5WNsdybDiM4AHj+AssWXY/Gp/UK9IQ8tR7CXDFqsFTWETtrdLEJbQFgaUW
         UtxvQsTpCBvpEniVAQxlT/1k3NMlepSu3cUnfeYAF1Bp2Rq2ZO1deRdwOS3Vn2aJaFC6
         2Ioz6TEO3IBcxcyGnf13tpwZCfF30SZvyBTrV4RAd0661SlLipww6dwcHh68wdTy3UBS
         6ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791458586; x=1792063386;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=agZ8NifRLOozJsK1Q2H4ch9Owtp/lTg/2FCgMokd4JY=;
        b=fTK8/ht/+wg+ro+Y6rfRpzbPc9AZOSxjJspClq10D25odQI7kBENu7X3L8o+qbTAZI
         IJsNNmHjkE2+SMc1oj6o1sep+GFCHSuWDGCvTcL2rNH/kHv28FkTto8aenRbgoJmzx/+
         OrETfAeM46fR4gA9yW94eZfNt/PNwEh/Xvr0AN/i1i/qmdzZmLNgqOndmiPJwKuKQBsB
         CWTkTOhP0ddiuZMtxsWDvcjf84/7btqyhDfGIUGPi4LP2e7xkWdCqBotp3NGEeP8qrjc
         g+oBg0ztXhxQQAO6guze31XxylHFfM3LoROyKz5zKhWbWnzBTFXVIGdELEzBEAuhvM/k
         Vtdg==
X-Forwarded-Encrypted: i=1; AKwUvBwDD8ITxcpVS+ugYkPFDKjbd04VeXuz6HKMqEWuTnX3bJT9BfIqvp+31GbivSM4DklDpXw2R3OQX4oGe3n/@vger.kernel.org
X-Gm-Message-State: AFuF++mMouiv/26GicwVmmhJQuoKLApLfl/t5OrIDq8ZV0n8jd2CtG6e
	D2qlZyDS7xpHlVbtewunFXKv0M+c7jaVTgPeFsJ3rzY9tzEfO/MUQKKcOKwEMS9VvqrZdZca7z0
	c0uLjJkydQ62Hft6tX+xqQZolXGTJSDYv7EeNSxgvl7YSSkVXK/z7/axEDC5PEjoUsSQc
X-Gm-Gg: AYBFou0RnWLr8tIyedieapR1vYWWGirZh6WUDWyaJoOlpmxVQelyL846RsF3uMvtzlf
	9Lsqjlx5UZMMe4cpSfUo9cBQUKkEL0KOMHYqx9QU4oVk2Eh3Zw/q0eb3loQzbba9O+1sdNdlFMj
	dBm9g0xqCqkazngMvcKYDTyO48kGFht8bFcCBaLwScklqI0d90z2d4eSEf1XJzVS8UQujZcol5u
	eZS4ZBAOWDQdznFKDrKFW9J3VWsmvT5JVV2Z0wcNe5uk6CQ9pUWaE09u8xnfYPtR2tCkzXbKq2T
	RiX5K+klyTUDsDVMsFikhNVd71tqGpgBmrkZzCibAaQFDy7awr6F61TJMq9HiFq2LzvttcFnhHa
	sIRnIqQuleLRdlOUOOn7zHBDfUhmTOuoxhnXEjvsn
X-Received: by 2002:a05:620a:1792:b0:93e:9809:3365 with SMTP id af79cd13be357-93e9b82b487mr1008021985a.70.1791458586220;
        Thu, 08 Oct 2026 04:23:06 -0700 (PDT)
X-Received: by 2002:a05:620a:1792:b0:93e:9809:3365 with SMTP id af79cd13be357-93e9b82b487mr1008014885a.70.1791458585538;
        Thu, 08 Oct 2026 04:23:05 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71b786d8sm10831159f8f.0.2026.10.08.04.23.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Oct 2026 04:23:03 -0700 (PDT)
Message-ID: <7cec7156-e85b-42e0-857a-e590b9e252b2@oss.qualcomm.com>
Date: Thu, 8 Oct 2026 14:23:01 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 58/74] media: uapi: Add CAMSS ISP statistics definition
To: bod@kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Keke Li <keke.li@amlogic.com>,
        Richard Acayan <mailingradian@gmail.com>,
        Hans Verkuil
 <hverkuil@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Radoslav Tsvetkov <quic_rtsvetko@quicinc.com>,
        Robert Foss
 <rfoss@kernel.org>,
        Milen Mitkov <quic_mmitkov@quicinc.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-0-ed985aefd611@kernel.org>
 <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-58-ed985aefd611@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <20261005-linux-mainline-7-2-sm8650-hdk-rfc-0-v1-58-ed985aefd611@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfXxg63qFg+Yfqb
 eEiUiEuf+XnGEgACbRdf/l81auz7Si5ojK+opJ327LIrUiyfPLIcb186aG0U72tPRtRgnqIfFbO
 3fCsMu+oJec3KmrYDhXkipfEeNU4NHw2PoqR2R4xPqpQeE1yUzB30CD855ZsZDlj5dpqlTckF0u
 IXuOJ5HBK5gi6toSK25StOdzbl5I30ytNi7JgKCnesp5NxFkTQEma+7nuEXmn/UvQHRKPLKOAKP
 Lmo/6iqwG/n+yxjP8CxiA7ewZ2190zGETZdmX9RYQbUDjwmtQCKtzt77HRX8lBl3Bknq5cme0uF
 ZC/ekjfzK3f88TAOseyWNB+kzPy75F9jl6HMvw9A+s5mLjy5miMFpP0Zf3AvlyeHsCBuQ0lMyB5
 xLXMjeTbScTiH9XRW+KHnKdg+ysj02/OY/P5K9vbgHDE3g38K2bYKsXnSQHjF12jpgydjhsTwKY
 YG/sS8GGKFGaFW+CmoQ==
X-Proofpoint-ORIG-GUID: AaAuKe6nWHl_v3q8Mg5tBLMLX8hiH7FP
X-Proofpoint-GUID: AaAuKe6nWHl_v3q8Mg5tBLMLX8hiH7FP
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDA0NSBTYWx0ZWRfX92ZpI5sKmoVK
 jPCs6CV5PTbo+2Drusie/F43rbPx1TJwadvUaeqIY4vkC8720LtOZ8rDcbbr4pNozkobkOJU+d4
 AeYfJQI1Dm+8BcmfXqHM1WqB6wyiy/8=
X-Authority-Analysis: v=2.4 cv=KcdHIgYD c=1 sm=1 tr=0 ts=6ac77d1b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=1YEbtdj09zidbz6vPioA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_04,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080045

Hi Bryan,

On 10/5/2026 8:14 PM, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> 
> Add V4L2_META_FMT_QCOM_ISP_STATS, the statistics counterpart of the CAMSS
> ISP parameters. Statistics use the v4l2-isp extensible format: the driver
> serialises one block per statistics engine into a struct v4l2_isp_buffer,
> each block embedding a struct v4l2_isp_block_header with a type from
> enum camss_stats_block_type.
> 
> The first block is the AEC Bayer histogram, CAMSS_STATS_AEC_BHIST:
> 1024 bins counting the luma of each 2x2 Bayer quad in the histogram's
> region.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  drivers/media/v4l2-core/v4l2-ioctl.c   |  1 +
>  include/uapi/linux/qcom-camss-config.h | 33 +++++++++++++++++++++++++++++++++
>  include/uapi/linux/videodev2.h         |  3 +++
>  3 files changed, 37 insertions(+)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index a2b650f4ec3c3..e5eccb62e76b2 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -1471,6 +1471,7 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
>  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
>  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
>  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> +	case V4L2_META_FMT_QCOM_ISP_STATS:	descr = "Qualcomm CAMSS ISP Statistics"; break;
>  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
>  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
> index aa3d97cfcc78e..23c12b8955ef6 100644
> --- a/include/uapi/linux/qcom-camss-config.h
> +++ b/include/uapi/linux/qcom-camss-config.h
> @@ -209,4 +209,37 @@ struct camss_params_gamma {
>  	 sizeof(struct camss_params_color_correct)	+\
>  	 sizeof(struct camss_params_gamma))
>  
> +/**
> + * enum camss_stats_block_type - CAMSS ISP statistics block identifiers
> + *
> + * Each value identifies one statistics block in a
> + * V4L2_META_FMT_QCOM_ISP_STATS buffer. The value is placed in the @type field
> + * of &struct v4l2_isp_block_header.
> + *
> + * @CAMSS_STATS_AEC_BHIST: AEC Bayer histogram, &struct camss_stats_bhist
> + */
> +enum camss_stats_block_type {
> +	CAMSS_STATS_AEC_BHIST = 1,
> +};
> +
> +/* Number of bins in a Bayer histogram. */
> +#define CAMSS_STATS_BHIST_BINS	1024
> +
> +/**
> + * struct camss_stats_bhist - Bayer histogram
> + *
> + * Histogram of the luma of each 2x2 Bayer quad inside the histogram's region,
> + * over CAMSS_STATS_BHIST_BINS equal bins spanning its input range. Quads
> + * whose luma falls outside the input range are not counted.
> + *
> + * @header: block header; @header.type = CAMSS_STATS_AEC_BHIST
> + * @bins:   number of quads per bin
> + */
> +struct camss_stats_bhist {
> +	struct v4l2_isp_block_header header;

I think that the whole format is not correct, having header is preventing address alignment 
of the buffer for the stats, as i have mentioned in the next patch copying the statistics
on each frame is not correct, just to have generic statistics format in userspace.

~Gjorgji
