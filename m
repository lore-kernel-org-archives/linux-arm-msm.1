Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998D748B37A
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331677; cv=none; b=uNjwdT9HKQTQ5HajslgrCOPUaJkOpoiMPkYX6doma/GqWJ/HljCRxu4EH/+Xpju2F+i5E1E+LmuLEjXPjFliADAmvs0Btcq41fbVMi5p04611InwfqrXMORbuGtMY7yBMtCpMxt+2UssAhnJ5u9gCPrrdNHx5YVXRjNqx4/bAV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331677; c=relaxed/simple;
	bh=w3fr5/TCewupjjc/06eOJlChCypygNYvjxJt8ddjDZ4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=o/LB7RFijio+yNu+bAmlnhtjVaapHiQEZc/WHCr3KnT9p0SR/4IAHa4VOWLN991A16XLRj8n8gMgiq76Ri8xouRbig2CKlNXEtLPrtqryZanX62SmVr1mGdpl30BGJVgcVYfiKpzDFi3UDz8pz8G5ntMndt4wjoJ4YfgKB8r7mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FYB9D8Kl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DwF1wL7i; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FYB9D8Kl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DwF1wL7i"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TD8BNv2089404
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:27:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AJHjeqtzLBJ0DkrIUXw1kLHv82FgzBcaqjy5CMcQQxI=; b=FYB9D8Kll821myGp
	oCtjBA5mlKzjiHzcQ/B6n78Yp8NwsVzF+CIYghhFFk65d14nNoPOhr8WZhWBzeIO
	lLSaD83n15MRZSrWgISmNNClzT3tZYrfhLupLQaQsi4cZK179+Lpx7VPX9DF7Bik
	vT1o0pQvVFdajP2u9UMplhphA1GYv5Eg5+gp7e63v9puAfTExapkLbMfDaeaNbwr
	rj+EgZK3QuYZY4OKMpnaKcheHtJZpc3MMQLQiAEb7R7Jp1EKTryaroW23+5lHVSp
	z7MT/DGxMwaMcPAtDok/4sMxY030oToj0Q3tdO8efpgG/z5TzWFMmMY/zyZGTUaq
	cld70A==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe988ut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:27:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so10293551cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:27:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785331673; x=1785936473; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AJHjeqtzLBJ0DkrIUXw1kLHv82FgzBcaqjy5CMcQQxI=;
        b=DwF1wL7i3HWouzqXupoI/JBUnrUF5OolaWzyu0r5T7pToUzpxDTU+7ggxLA+1YtnFZ
         bFSpebWpjCdCUlC5KQZKnqZVnCTZCzE3SKyCjJfy4c2pSPSgPNMdv1nDoZKR9xVAOxFk
         QY9MvzknKuchJSMM8oULdMFxdhLyreBPZ/xFpAxilofbOvotDlqnDMZMVGPmWxnod+FI
         udQwbA/JYjQaiWY/Opa3Oac9JlooIfbKL6rH4/vBWvMkS/XBFPzRPSgY1vXP1jirlMdn
         dwR1DgW0kYxvi8+MqAXTf+DwB5TT1iRK3e9zpukr4dNVASzE+g6SsUhV4hiKaNsV1OeX
         t5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331673; x=1785936473;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AJHjeqtzLBJ0DkrIUXw1kLHv82FgzBcaqjy5CMcQQxI=;
        b=UVW+uD1035vsRQziLJvYPhWehn9MSYzVC1LtUOgOfpT75qIyS6Ko+ubSd6c9QA+Htu
         gTJW960X3Fgm1Rf6DCc0vIjy816RaPwKohKaF9z+luZnUeRfLRIZgTV3a074fa6zkiRL
         2wnVf4bj8DlA4TEvxljocIf8AAUaZ4YigHXFogPB95DNWPBeQkmhlSTG7QtQaXaMRzE2
         AaExOpAB3C38oTCmTZ/IddHFvmagwlSdmTzNby9Bg1Sd+X1oeUE+1sBV8eiVQmmKi05h
         mnPYjKmJA5HuKsxy89qkw9LePIz38m3gAq1PdXhBU3AA9kBtKsDvb0en8orMvDk9J8h/
         W1jQ==
X-Forwarded-Encrypted: i=1; AHgh+RoFrmms6P55AHV0emYvpWNxpOJKhHxCiIrXewWV/zgv3HYn0EtsRlSr8iTc6Zp7EFSZm3+wISiYqnPUq66W@vger.kernel.org
X-Gm-Message-State: AOJu0YyF0tM0Sj7XopN43z6nyMARSi7hwqwVswmzESUFNxt/Y39jY8+G
	btH6gBxkQTByLCcpK+f3e/+ZZtsBQ42nNuUotr3dTXHDD8yMcgSx/SZAVwH9qDigwWl6JYUc3a1
	NYZ6XMPuOjcVadeW7nLnbm2J/+t2E0ShkXlHSrF/PsOwQpyVmftkhaC3VGZji3EBH8xcyk71wyV
	Mb
X-Gm-Gg: AR+sD105O64Af1Cv4HJUi3v/5HLNetTTJ83Aul5qgTH4KOXuh3J+jjA5z8P2sA5+mtl
	GrZ3IXRh/wd3UZJukDJjXrhOXFkXwbHJelEaEOOl1/yfiosx6IO/ERJ0t+c3sRccU/h9tjLSmc6
	gBrczaWCb2rbhv5Vbz8xoOmB3kIpoQIwOhOfT7i5Ft3Uo5Xpg+fC9N+fOMe62oI86bHSe0GYzOo
	YWlNVxImWHc63KhbTC/qd2CAjsjdKEhqr1QSnsvd4O8yck9na1zRG7Bp/TGDivnyXxoB01umb00
	dGMAVHgmMDrsRGWDByGeXKv8iJ8B8MkRMjQfijhj9Xysf+OS//WfcQGP0RQMAnurv9vPbhsH4dp
	W8Gz+klDQ0Iof+Mz1LaXAMoQc/ardYuY5vrC8/7WXG8qjJIcBfUdPQJW+ZXPOHlPT41mPPNgDhi
	GIEhXEtozBm/1hanZiW6cz0W3TylPS97WrmlL9f+0yf8x3KLsyLAVrTbwbZkVo4mXbxXs=
X-Received: by 2002:a05:622a:1a99:b0:51c:1529:2c0 with SMTP id d75a77b69052e-529d71d71c5mr59746591cf.43.1785331672928;
        Wed, 29 Jul 2026 06:27:52 -0700 (PDT)
X-Received: by 2002:a05:622a:1a99:b0:51c:1529:2c0 with SMTP id d75a77b69052e-529d71d71c5mr59745981cf.43.1785331672302;
        Wed, 29 Jul 2026 06:27:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050be9a91sm897907a12.13.2026.07.29.06.27.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:27:51 -0700 (PDT)
Message-ID: <77f79a27-6a19-4879-b302-e7b42faaaced@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 15:27:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: johannes.goede@oss.qualcomm.com
Subject: Re: [PATCH v5 3/5] media: uapi: Add CAMSS OPE ISP configuration
 definition
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260724-camss-isp-ope-v5-0-e70ad4fa39ce@oss.qualcomm.com>
 <20260724-camss-isp-ope-v5-3-e70ad4fa39ce@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20260724-camss-isp-ope-v5-3-e70ad4fa39ce@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDExMSBTYWx0ZWRfX3aYELw1yaTrY
 nzHFV9r+pWqYpTwvqOL/ElRLIiFY8SEGAL2w0mBhIJd/T4PnBZxm6NivlyVapXB8JX+H37CkHg7
 BXhL5ZtjFEC09jmUD7ko4FETpDHAFAMgm7jNdONv8OjxmS+FSj9HG0bKcDe0jGVl0kSKFEzfY0g
 6/Pm7GmgGdJOtPYiwkH4YzV++4cuGpjBMjoSxERvN626OdX98amUCeeSwNWnGtWzUp0Ud8gJLXl
 TLl4fjEEOep9qGB3WX5D1v4AXzqbWm4pIu2FNw9XIJt5+HUBJ/a49/NSzqEC8opItqUbTe9RNCh
 YneAVjsn8wyYGe0MR1HKBUYll+g648hXzYx9mAtagmmW6IxZgbrxAWv7iek+u8dCEXa415Irsgv
 rfyPJdPzEmikdPJtrJfiffXXutaDaweJRMui2NpDAqy9yIDypHJpVnBaBcH8wrfepj8R+NkvXKH
 nXSbiq9ujBlX3COKYjw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDExMSBTYWx0ZWRfX40XMvr4uo7Ta
 9XfP0D/pcJNL/5E1afevNvJGO70Za3UQlh5wcMhRoSMrZ8beYpYyrEz3HR5YXxNlBcDibUs4N9F
 SJiVoIv0dlrl3dOAM1ylYjWnpm6zDhs=
X-Proofpoint-ORIG-GUID: 7RGS3OgO65KXzcd8lG0jE8JZ9zhlpmp9
X-Proofpoint-GUID: 7RGS3OgO65KXzcd8lG0jE8JZ9zhlpmp9
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a69ffda cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=YAyIRdgMAAAA:8
 a=EUspDBNiAAAA:8 a=Fwsc5vey43vomTLazAYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=o1rO4XtwZBNj6n05oSJ_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_05,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290111

Hi Loic, et.al,

On 24-Jul-26 14:42, Loic Poulain wrote:
> Add the uapi header camss-ope-config.h defining the ISP parameter
> structures used by the CAMSS Offline Processing Engine (OPE) driver.
> This includes structures for white balance, chroma enhancement and
> color correction configuration.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  include/uapi/linux/camss-ope-config.h | 160 ++++++++++++++++++++++++++++++++++
>  1 file changed, 160 insertions(+)
> 
> diff --git a/include/uapi/linux/camss-ope-config.h b/include/uapi/linux/camss-ope-config.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..800e6ef1dba218ca33b565e1e51d6647f02f8753
> --- /dev/null
> +++ b/include/uapi/linux/camss-ope-config.h
> @@ -0,0 +1,160 @@
> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> +/*
> + * Qualcomm CAMSS Offline Processing Engine (OPE) ISP parameters UAPI
> + *
> + * Uses the generic V4L2 extensible ISP parameters buffer format defined in
> + * <uapi/linux/media/v4l2-isp.h>.
> + *
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +#ifndef _UAPI_LINUX_CAMSS_OPE_CONFIG_H
> +#define _UAPI_LINUX_CAMSS_OPE_CONFIG_H
> +
> +#include <linux/types.h>
> +#include <linux/media/v4l2-isp.h>
> +
> +/**
> + * enum camss_ope_params_block_type - CAMSS ISP parameter block identifiers
> + *
> + * Each value identifies one ISP processing block.  The value is placed in
> + * the @type field of &struct v4l2_isp_params_block_header.
> + */
> +enum camss_ope_params_block_type {
> +	CAMSS_OPE_PARAMS_WB_GAIN = 1,
> +	CAMSS_OPE_PARAMS_CHROMA_ENHAN = 2,
> +	CAMSS_OPE_PARAMS_COLOR_CORRECT = 3,
> +};

I don't think we want this enum to be OPE specific. The whole idea behind
the extensible ISP parameters is that there is a single set of parameter
definitions spanning multiple ISP generations.

There is going to be a mirroring patch for libcamera defining some C++
magic around this header:

https://patchwork.libcamera.org/patch/27430/

and this will be used in the camss libcamera IPA and we don't want to
have one version of the libcamera wrapper per ISP "generation".

So I think this should all be moved back to a generic camss-config.h
(or maybe camss-parameters.h ?) and then if for the planned Hamoa /
Monoca inline ISP work of we need say a new version of CAMSS_PARAMS_WB_GAIN
just add a CAMSS_OPE_PARAMS_WB_GAIN_V2 for that.

That is the whole idea behind the extensible params, otherwise libcamera
will effectively need to have 1 IPA per ISP generation / type which is
not what we want.

Regards,

Hans





> +
> +/**
> + * struct camss_ope_params_wb_gain - White Balance gains
> + *
> + * Implements the CLC_WB pipeline module.  The pipeline applies three
> + * sequential operations per channel:
> + *   1. Subtract sub-offset (black-level subtraction)
> + *   2. Multiply by gain    (colour balance)
> + *   3. Add add-offset      (output pedestal)
> + *
> + * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
> + * are 16-bit unsigned, normalised to full input scale (65535 = 1.0)
> + *
> + * @header:   block header; @header.type = CAMSS_OPE_PARAMS_WB_GAIN
> + * @g_gain:   green channel gain (15uQ10, 1024 = 1.0)
> + * @b_gain:   blue  channel gain (15uQ10, 1024 = 1.0)
> + * @r_gain:   red   channel gain (15uQ10, 1024 = 1.0)
> + * @g_sub:    green sub-offset, subtracted before gain (16u)
> + * @b_sub:    blue  sub-offset, subtracted before gain (16u)
> + * @r_sub:    red   sub-offset, subtracted before gain (16u)
> + * @g_add:    green add-offset, added after gain (16u)
> + * @b_add:    blue  add-offset, added after gain (16u)
> + * @r_add:    red   add-offset, added after gain (16u)
> + */
> +struct camss_ope_params_wb_gain {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 g_gain;
> +	__u16 b_gain;
> +	__u16 r_gain;
> +	__u16 g_sub;
> +	__u16 b_sub;
> +	__u16 r_sub;
> +	__u16 g_add;
> +	__u16 b_add;
> +	__u16 r_add;
> +	__u16 _pad[3];
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct camss_ope_params_chroma_enhan - RGB to YUV colour transfer matrix
> + *
> + * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
> + * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
> + *
> + * RGB2Y - Luma (Y) coefficients
> + * Y = v0 * R + v1 * G + v2 * B
> + *
> + * @luma_v0:  R-to-Y coefficient (12sQ8)
> + * @luma_v1:  G-to-Y coefficient (12sQ8)
> + * @luma_v2:  B-to-Y coefficient (12sQ8)
> + * @luma_k:   Y output offset    (9s,  0 = no offset)
> + *
> + * RGB2Cb - Chroma (Cb) coefficients
> + * Cb = a x ((B - G) + b(R - G)) + KCb
> + * with:
> + *   a = ap, when (B-G) + b(R-G) > 0; a = am, when (B-G) + b(R-G) ≤ 0;
> + *   b = bp when (R-G) > 0; b = bm when (R-G) ≤ 0
> + *
> + * @coeff_ap: Cb positive coefficient (12sQ8)
> + * @coeff_am: Cb negative coefficient (12sQ8)
> + * @coeff_bp: Cb positive coefficient (12sQ8)
> + * @coeff_bm: Cb negative coefficient (12sQ8)
> + * @kcb:      Cb output offset        (11s)
> + *
> + * RGB2Cr - Chroma (Cr) coefficients:
> + * Cr = c x ((R - G) + d(B - G)) + KCr
> + * with:
> + *   c = cp, when (R-G) + d(B-G) > 0; c = cm, when (R-G) + d(B-G) ≤ 0
> + *   d = dp when (B-G) > 0; d = dm when (B-G) ≤ 0
> + *
> + * @coeff_cp: Cr positive coefficient (12sQ8)
> + * @coeff_cm: Cr negative coefficient (12sQ8)
> + * @coeff_dp: Cr positive coefficient (12sQ8)
> + * @coeff_dm: Cr negative coefficient (12sQ8)
> + * @kcr:      Cr output offset        (11s)
> + *
> + * @header: generic block header; @header.type = CAMSS_OPE_PARAMS_CHROMA_ENHAN
> + */
> +struct camss_ope_params_chroma_enhan {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 luma_v0;
> +	__u16 luma_v1;
> +	__u16 luma_v2;
> +	__u16 luma_k;
> +	__u16 coeff_ap;
> +	__u16 coeff_am;
> +	__u16 coeff_bp;
> +	__u16 coeff_bm;
> +	__u16 coeff_cp;
> +	__u16 coeff_cm;
> +	__u16 coeff_dp;
> +	__u16 coeff_dm;
> +	__u16 kcb;
> +	__u16 kcr;
> +	__u16 _pad[2];
> +} __attribute__((aligned(8)));
> +
> +/**
> + * struct camss_ope_params_color_correct - colour correction matrix
> + *
> + * Implements the CLC_CC pipeline module.  The matrix computes:
> + *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
> + *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
> + *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
> + *
> + * @header:  block header; @header.type = CAMSS_OPE_PARAMS_COLOR_CORRECT
> + * @a:       G-input coefficients per output channel (12s;
> + *           a[0]=Out_G, a[1]=Out_B, a[2]=Out_R)
> + * @b:       B-input coefficients (12s)
> + * @c:       R-input coefficients (12s)
> + * @k:       per-output-channel offsets (typically 9s effective)
> + * @qfactor: Q-format selector (2u):
> + *           0 = 12sQ7  (range ~-16.0 .. +15.992)
> + *           1 = 12sQ8  (range  ~-8.0 ..  +7.996)
> + *           2 = 12sQ9  (range  ~-4.0 ..  +3.998)
> + *           3 = 12sQ10 (range  ~-2.0 ..  +1.999)
> + */
> +struct camss_ope_params_color_correct {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 a[3];
> +	__u16 b[3];
> +	__u16 c[3];
> +	__u16 k[3];
> +	__u16 qfactor;
> +	__u16 _pad[3];
> +} __attribute__((aligned(8)));
> +
> +#define CAMSS_OPE_PARAMS_MAX_PAYLOAD		\
> +	(sizeof(struct camss_ope_params_wb_gain)	+\
> +	 sizeof(struct camss_ope_params_chroma_enhan)	+\
> +	 sizeof(struct camss_ope_params_color_correct))
> +
> +#endif /* _UAPI_LINUX_CAMSS_OPE_CONFIG_H */
> 

