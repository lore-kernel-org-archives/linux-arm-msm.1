Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 914D01B86C7
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784260013; cv=none; b=ijwNrb16oj1LYdPFpBbrelY1ThsJKX2o4vy6DEjNz1q7O7dV9Vv3eoHLfn09T9rLxF7HxUUKcvsBCuGQxxfzbwt+xyIPCHojdysrjsPIYXwXqM1lQAENxr3fCIpWNJWCO5UHxfED9SNlSuU+PR0ekJ3kbfchc8NFcAfEZepaVLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784260013; c=relaxed/simple;
	bh=xeS7TuAWqC3a2+4w8CYotSIfCCdHNfwCj0vuvc731FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mxo7YavrgLr+YCZM0DDYqePcHeO23cgkqbWnrgnsdUiXxzYf2/efTGIYvJkGYx0T+fjj0TyPv6cs0yGGq7cxTAewBLX4ex3DGk5cD2P9+nm2oFJHP5dj8FH0wYGr8TwtzjXmpQcKVRbWA1a4/xxpKvZl2pEYvvH2N8+ad+EstWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fWgCcWR7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MtleqQCW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fWgCcWR7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MtleqQCW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66H33nJx677675
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z5W+HbbHXYh5BWmthVDLvjbzDM6yxh4CTBRhyy88iEI=; b=fWgCcWR7H/tADzU7
	gv9UAGC9+6P2xGMFkXF3jEJdATfbxdt0AujnvhsWgp9hQde826cM0/hZfPITj+Ks
	Xm+T9SFqEs53sQu5awfkanIpgpK0fumcDstcY6WFx0bu6plas+H76vGi/eia3GNn
	/U2N+F61T2TQmUBIL6mi7bmfzYe/1VP5nLmP+eEJ6mxP6Uyc1bSFwPLp9i0ezR67
	ucFfljNv/6i203QkNpYytbIGpI9NvvdB3z8tZiDcZtYwcKToNYslM8B7GQYjHRv6
	cjt1eNglHLOVUFfU0vxsmoF2KgvdEc4bNxcipKEdi/F9hj1+Z+DqRvEMepEeXYnJ
	Ksy13A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetcf4j9h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jul 2026 03:46:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3811279d51aso7369323a91.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jul 2026 20:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784260010; x=1784864810; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z5W+HbbHXYh5BWmthVDLvjbzDM6yxh4CTBRhyy88iEI=;
        b=MtleqQCWU4cVKnHAGISceqS0hDuZzF6M2dEwP7RW7E1EeYTqnU7L8aKHLjaMlnAe0N
         kA6Pjp8VVfyyHS9GMFqjEPIcXn+9W2OjRC0SxTNyA/yRKH4M1ynA02YG8jzeZBeezI5Z
         kXzKl2jMrY8FzjbsI/YPgh19iA3Na7AnyimHnt1m6+fjZIFBpKn/JSHQyjfWaxPJDQm7
         qOl4rkqqB+89tq/avePEIFayLA04IHw613RIY5IcyrcdpR4gNTGZuUn4tfWA7N+y07Dy
         K9LCq1AKZ9DsmdXJun4mi3g+fEC4UUCZmEQRPi8Kqh2xvKQzzopreKNiB+2CJM8I6lqi
         umzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784260010; x=1784864810;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z5W+HbbHXYh5BWmthVDLvjbzDM6yxh4CTBRhyy88iEI=;
        b=AgUrcQ1J2so4IWSokWabQ2f23fOL4rfw94LzMZ69TRLY2PMX4rowIqmN8KhEpQGJQi
         7Q4jTgA4UhGYgcEXWfKwjBPF1uDXeLx/sVu5vBq4dJhQXiEZ0QflkNWNN/LjgYQy4jom
         T1zLh1bbP8SGwB1Eg7aISsHD6P2NiEk+dKg6eZjj10hJoKOS6o6hi+NRs5GUTFH/uQmX
         0BBq/l/6c/urif6BLoH+LFtdX4H44bLgLmk71y7Tj1vXjek83X7bfLpF5Cg2UkDM6oi2
         crBoEVsbKHrQgfFIL0ROg6H0dAki4O2OiJm/ugtxMsRmvCdj4rdDer0x8/xQZH7rUGcl
         4DKg==
X-Forwarded-Encrypted: i=1; AHgh+RrrthPrbgCGOW3QB5Vyp7N0OJw2pYVW3PyXtnjcXzyT0tF7aifLoWN0v4TYlOWC9m0lum5LMOVIAvqPbMIl@vger.kernel.org
X-Gm-Message-State: AOJu0YxkkcQIeSYJv6HA1VrDgSx+3I4tI1LMbSMegkUOGK3LsLBmQcBP
	P0+pINLQf1Fy1ovMK80iYdP6kics04A0T0M5OXxDdK428+PJ1UlB4IMYs7eTLW5QCoC+WnWP123
	NkVDRAW2olBYQP4SmhZUYzRJSkdCr3EPjo6a76RU5gJ+q2spHdEXVmBI61Rj5GPBM12xx
X-Gm-Gg: AfdE7ckqswLFAxDVCLE6t8u94WCOKqQCKp4ok5Sb6uoqEr1IK5qWMneHsIBZVXTofvN
	rdqp8wb9CgfRW01QbTJG0iwuExkmdjy/bqrYratJTg6M7FiQQFhzygppecuOhR7V2NKeiWd+TZc
	lGOn5/mn2hbGazD5bDgASPEnbOMjn8FPJANjwDckfKeFtvG58F8COBVR9IkrA+v9LRUu/1c4Gc1
	L2g6xOEl8EKBFO0NDJwQR+w7+SrYnbmVYER5x2yvAYXmZsTwuxBlnapArvJHMMOYXE47LABwFZY
	VkgiJfvZvWNYLPQqbgj+e+b5HfNmUl+uXZiSL0Y2VgR7KaKfK6tr+JE7Av7xHwAAZH/5bW6GxDY
	39RuW7TC+wWAqcoDn29+vW3hFD/17A4mO
X-Received: by 2002:a17:90b:2b4c:b0:387:e0db:3fae with SMTP id 98e67ed59e1d1-38e4b5f285fmr791763a91.39.1784260010116;
        Thu, 16 Jul 2026 20:46:50 -0700 (PDT)
X-Received: by 2002:a17:90b:2b4c:b0:387:e0db:3fae with SMTP id 98e67ed59e1d1-38e4b5f285fmr791744a91.39.1784260009709;
        Thu, 16 Jul 2026 20:46:49 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm1523528eec.17.2026.07.16.20.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Jul 2026 20:46:49 -0700 (PDT)
Message-ID: <2ec138d8-242d-6d0a-0b87-cd6a65c7228c@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 09:16:42 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
References: <20260709-iris-ar50lt-v7-0-76af9dd4d1f6@oss.qualcomm.com>
 <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260709-iris-ar50lt-v7-4-76af9dd4d1f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ib5ivvi6sH_ma7NOslYx3hrpSmtplvgA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfXy1Tt2Y1nrLSN
 tbeTMN5Wk7BLiqDnY0B05+k5mMqlxDZtvsC5fJFAds5XcRwOrFwvDuszozh2pL+LwIfYwai2OfV
 psDFAmQFalYE0f9N8vh28s+NG3okISz5F+gOmLRfO/Cyk9yG0qrENlmbOtJRark55E0ZToZe/X9
 m3IVD+B+WMLFsXmuvs7/VizRRjrRxFu5Dc0y/gdRUM4E9oOKgyE7X590qXioLHrQKUL2E/J7R12
 kcYOsEmEiJ4ZYx+Etzw8SYjy9ElXdlH6ie6EAScn0Z8z6AtgcRFA6IZTytKI5xm+jVyHd/p5+ks
 xaeK4/FE4ykGH5C1D1slslvH9kAe1QjsOg5eI+PNkE/DJTseEEUOVGO2wZCKIRX2zcXcXaE7pFT
 Bmr4IlAREguf8kc9Pa+Biyiz4+T5IgnaAZ5oa0K7bxJ2BDFdBvKVIkAPjvsMLLHzLP6gQwhNOjK
 Z3qnaK+otN9BFQ/GsUw==
X-Authority-Analysis: v=2.4 cv=f8R4wuyM c=1 sm=1 tr=0 ts=6a59a5aa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=8n6RmP5xwyQ-3vr3y5EA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: Ib5ivvi6sH_ma7NOslYx3hrpSmtplvgA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDAzMiBTYWx0ZWRfX/gy5MekvGYwE
 sxFC9QiZj5KLpIVZqE9WPSi9n6WSOWDj0WCkxJ+F5VGI5/mXd6rKdqVGDFQJsHcUGAqNqyFmOr/
 5T0EKHz2X62Yl9K2ZG96rLAcy/3GTfI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_01,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170032


On 7/9/2026 7:11 PM, Dmitry Baryshkov wrote:
> From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
>
> The raw formats supported by Iris were previously advertised
> unconditionally, assuming UBWC support on all platforms. However, some
> platforms do not support UBWC which results in incorrect format
> capability exposure.
>
> Use the UBWC configuration provided by the platform to dynamically
> filter raw formats at runtime. If UBWC is not supported, UBWC-based
> formats are omitted from the advertised capability list, while linear
> formats remain available.
>
> Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
>  drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
>  2 files changed, 43 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
> index 4c8bc7aac135..9fee5f28097d 100644
> --- a/drivers/media/platform/qcom/iris/iris_vdec.c
> +++ b/drivers/media/platform/qcom/iris/iris_vdec.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/soc/qcom/ubwc.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  
> @@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
>  	V4L2_PIX_FMT_QC10C,
>  };
>  
> +static const u32 iris_vdec_formats_noubwc_cap[] = {
> +	V4L2_PIX_FMT_NV12,
> +	V4L2_PIX_FMT_P010,
> +};
> +
>  static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size, i;
>  	const u32 *fmt;
>  
> @@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  		size = inst->core->iris_platform_data->inst_iris_fmts_size;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		fmt = iris_vdec_formats_cap;
> -		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		if (ubwc->ubwc_enc_version) {
> +			fmt = iris_vdec_formats_cap;
> +			size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		} else {
> +			fmt = iris_vdec_formats_noubwc_cap;
> +			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
> +		}
>  		break;
>  	default:
>  		return false;
> @@ -110,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  
>  static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size;
>  	const u32 *fmt;
>  
> @@ -119,8 +132,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  		size = inst->core->iris_platform_data->inst_iris_fmts_size;
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -		fmt = iris_vdec_formats_cap;
> -		size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		if (ubwc->ubwc_enc_version) {
> +			fmt = iris_vdec_formats_cap;
> +			size = ARRAY_SIZE(iris_vdec_formats_cap);
> +		} else {
> +			fmt = iris_vdec_formats_noubwc_cap;
> +			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
> +		}
>  		break;
>  	default:
>  		return 0;
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 16c52ad07e2c..2f2c56bf9122 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -3,6 +3,7 @@
>   * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
>   */
>  
> +#include <linux/soc/qcom/ubwc.h>
>  #include <media/v4l2-event.h>
>  #include <media/v4l2-mem2mem.h>
>  
> @@ -89,15 +90,25 @@ static const u32 iris_venc_formats_out[] = {
>  	V4L2_PIX_FMT_QC08C,
>  };
>  
> +static const u32 iris_venc_formats_noubwc_out[] = {
> +	V4L2_PIX_FMT_NV12,
> +};
> +
>  static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size, i;
>  	const u32 *fmt;
>  
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		fmt = iris_venc_formats_out;
> -		size = ARRAY_SIZE(iris_venc_formats_out);
> +		if (ubwc->ubwc_enc_version) {
> +			fmt = iris_venc_formats_out;
> +			size = ARRAY_SIZE(iris_venc_formats_out);
> +		} else {
> +			fmt = iris_venc_formats_noubwc_out;
> +			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
> +		}
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_venc_formats_cap;
> @@ -117,13 +128,19 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
>  
>  static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
>  {
> +	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
>  	unsigned int size;
>  	const u32 *fmt;
>  
>  	switch (type) {
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -		fmt = iris_venc_formats_out;
> -		size = ARRAY_SIZE(iris_venc_formats_out);
> +		if (ubwc->ubwc_enc_version) {
> +			fmt = iris_venc_formats_out;
> +			size = ARRAY_SIZE(iris_venc_formats_out);
> +		} else {
> +			fmt = iris_venc_formats_noubwc_out;
> +			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
> +		}
>  		break;
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  		fmt = iris_venc_formats_cap;

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

