Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9794503FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 18:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785349883; cv=none; b=CgFtlm8TZhtCOGPU41IR+4wptj86815ywPyiUuSrDqj8B4RICdZ5K5r5jy+wrgCcOilUvJbaqMzCUL6PolVSOgRYNnYeKZcAuBEgzGf9Yi/fDCkCpV6p5dS58vqIT+cK/sSmWHNVmie3Aa/zg/S9Tk4skZy8DL1IPpxvRfvvoqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785349883; c=relaxed/simple;
	bh=6Jmw8fadTclbG2T2Z68Rl3Wmmn5n2IP4R+z9w4+C6/8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Z8RSLO3LxfQvsSB7pFz+8c3FCclnsSRMEsN9QGeffwGrD+/nfE2SqIuwMT5sfXSAa4GaT+l7IiaDO9B7UWD6N5qUnkGgSXgZ2A+Ti/kkAKfNG9QdlioxEC5AXYu88Zx/NtNrBU7KIGrB7J4ZhPtcPc3bB6QLWDoTZyxk7PKqdoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OpOTluwo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAbI5V10; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OpOTluwo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAbI5V10"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TIRYRC3071627
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 18:31:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6e9PyztcWTGin2D498CISl8xSLMp4ILlbC/KGKMteYg=; b=OpOTluwofiGYgtjD
	lgoZRmTSWWinkWDadOgTD4hNi1AI3YjQb1xWwxVxzZDsEWAg4mkXHxZ9XgKN9ZLU
	gjWu7jPHsUMpj/d+r+QT04q+KCeFGQkeF15rWU8b10UwVDLJUdaLAo2+9zM3+ew3
	bqWcqK9Pe87PkosNZ6fv5mJVAgwm/VCDJA7a3XMR+ioA53Da6mDpeDdh1Jg+edZn
	EQliwjFqUaPdsSSQUxcn6g2BNE8HdCsZTmIpRW5j6hsqn8bjGyE+OPFLUe6z/aOH
	Jv92sgn9y+WvOzk9tx2Bz/I1ZzmtJ1WtBk/HRHKnn8Px10/SkE10W7O2jXpFCNwh
	oD/MnA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqprwg0xq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 18:31:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51a8b0a08d2so10725501cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 11:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785349877; x=1785954677; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6e9PyztcWTGin2D498CISl8xSLMp4ILlbC/KGKMteYg=;
        b=SAbI5V10WveV1v9cvqlR7gQUl5Q6mI1RIhmuOv8+FtHfJvV/M/9MLXTHH2hXQjVuWq
         PZiXhDL93iKAxz8bNOuyboW80GapZoxqSgWLdnB5ys6DwKoiwqUC1JNS0lekG9Ur5F+k
         VwHYpVXtmM4iliUkHygPxzjzI+39vNDcguN2/CRMwQab71uK6NsWfN4TKmijyJAAmp4D
         n1e0KEtMpLF5p44JC6lGpcia9uAAdfuc8pbCkoSS45pAA/XGg5CJ0qWHXhhRd76P3Zum
         qZayvIDOhzrdLQx9/YW4109IsEnzdgnbdNtMFJc7fkVEtF0N/7wc1eReDzC3UYGYVNe2
         EBPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785349877; x=1785954677;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6e9PyztcWTGin2D498CISl8xSLMp4ILlbC/KGKMteYg=;
        b=GGOpWiSl3iOEytIkmvHrObYzuWnyv8P6yTkr+zt7CbZuPGoHgSr+rVbzWtGJQ+/KLh
         LRphYcnovg8z890spTPDTSSlVQebMw32AYgVzvfPfUajExf1gKNwpZFJ4ADXGQPLT6oG
         MKr4LTOZd01Ppp7cfe335xbo5wjAeC6TXL8jfIPx91h0W2HClFexI+38M15x6rj3tTwe
         L+sa99nudIDMxQ611exSXGjrvivUWVEjMFrT4uuCTpq3uDgegR7WQgRuomFwZP7pQ5Bv
         tlemguuFv4/SxNbZ/GJ45CZyweXYbGWCb7CmAlUXUWVZvZhwV8kdpEqW5m0V8+kvLdU7
         o0RQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCU6f5Oa2ScAM0k8iyiV526uxLEI1csl7nj2pgVaa5SN5GjQMOXtJgYMNE0TVL7kEY7f9wE6RMJ4HQX3t6@vger.kernel.org
X-Gm-Message-State: AOJu0YwBlF0DlD8NAyRn2QDZgY5+AXQU1OUWcldTnx1TdXelAj37kGdK
	ZMu4XcCoA83wqaSPeVkbD3KRMKz9UJEjNdVBwJbIb5dqsk+f3W2skKrKmGZP9H4tUctvyjFuqNj
	VCQ//wfUd6OTT9fZT46BEvmVJufoXaRi33YzfgGLVC5L3gNUOEJ+lwZ6KtxTJgP6doQAq
X-Gm-Gg: AR+sD13cjfU7THIaO63eq4BUtt1qSQ4s/Dy4qeSyR46YEGgetmDYoL8iuQO7scB0BIg
	nF0xxWeVCm0Z+waUK1t7W/1155aF5xEt17JVea2aUz/tWl5HVFspyqI/5HLaxkIxmXkvl9SkOfF
	XliDDV6aNXQ2vh0n4c+bObRmwU4/P09jlOMopPN1JnMbldn9mwVVY9v30+KyTlUAsKTrnWWbuKd
	fLlV8IAO1rSkzz0ET/DI8WfHfwPwpincN1aE+QnKs36Z6lSNWrLiR9NalXd5XtN+m3YO1lIcaeD
	240c6Zj0sW3ywCJtdtWkjvODr5XF4qDNvbbPy4CgyU3yMOAhe9eHOS/lveKgjtkZl2k0am8bfZl
	dMDCRcxxsx07VBZMTcHQg1u4dWWz0YIeiLQ/1Kz/2ggnDH4/s6sfONiI3vvIm4o6EBZesCGVD
X-Received: by 2002:ac8:7d4e:0:b0:51c:1cbd:5fdc with SMTP id d75a77b69052e-529d6faf8eemr75038121cf.10.1785349876878;
        Wed, 29 Jul 2026 11:31:16 -0700 (PDT)
X-Received: by 2002:ac8:7d4e:0:b0:51c:1cbd:5fdc with SMTP id d75a77b69052e-529d6faf8eemr75037651cf.10.1785349876366;
        Wed, 29 Jul 2026 11:31:16 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6acb6c9sm11104361f8f.13.2026.07.29.11.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 11:31:15 -0700 (PDT)
Message-ID: <50662ecf-22a6-43dc-baca-9cd58001b51e@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 21:31:13 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/5] media: uapi: Add CAMSS OPE ISP configuration
 definition
To: johannes.goede@oss.qualcomm.com,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
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
 <77f79a27-6a19-4879-b302-e7b42faaaced@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <77f79a27-6a19-4879-b302-e7b42faaaced@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 3NpnBJycUgceg4Hd7SCT_EEll3nt6pkf
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE0MiBTYWx0ZWRfX4lcJAP/qesc4
 r6do/31z4qq6oh4AloGUIDlbL36ZlWJiArHtnTL4pAHfJ6e8YcO7NWALv2F1AiUYXgsgLd+hBlt
 q7pr1NBUNvNopb+5Upt7gpBmYnc8KUI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE0MiBTYWx0ZWRfXzw0mZQzrL8ro
 8tmlJ3JTBIKGBHtvz/DowEXQ+tJ7JzzayHIjwM4au35O3D8p6fnKMYYZeZhKSmYgKvj1laEBTWM
 bvlvnieU7prvbBvWJE/nsmEi9yhK6bprU2x/Yq5auX1B9BBbq2ygqkfQ0AprV/3IWAWO689h82b
 BkYzKAp4q6u+51fXHWLMIAEjyVwax7BYg300W7EP8V9WYHahm5eewuHAkWmwZLWgcXgkWzaJlLu
 YAlMx3yofCZrj/7DjU7uDX4ravdft7F1GSfa/8hPLWtLqYZdldYhaVYJcMAI4x4maNxu3ZXlRQ/
 zfd4DscQ/tDdu2ZRFBRZD9eVrSYDR3QMQpoxQ4oGld0Aub35jKmUQhe895tomLuqCkHyM4IyAiL
 Um9R35OgnUTR6arJ6UlOCG477G7yn0aRCPkYis5TH182c8UMqMxSG1z5Ytupz4d2fwSNxHjMcyM
 fTWHyS0b9fOONdUjUdg==
X-Proofpoint-GUID: 3NpnBJycUgceg4Hd7SCT_EEll3nt6pkf
X-Authority-Analysis: v=2.4 cv=Bo+tB4X5 c=1 sm=1 tr=0 ts=6a6a46f5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=YAyIRdgMAAAA:8 a=EUspDBNiAAAA:8 a=Yqt9_RdanuqypNOcg2YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=o1rO4XtwZBNj6n05oSJ_:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_07,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290142

Hi Loic, Hans,

On 7/29/2026 4:27 PM, johannes.goede@oss.qualcomm.com wrote:
> Hi Loic, et.al,
> 
> On 24-Jul-26 14:42, Loic Poulain wrote:
>> Add the uapi header camss-ope-config.h defining the ISP parameter
>> structures used by the CAMSS Offline Processing Engine (OPE) driver.
>> This includes structures for white balance, chroma enhancement and
>> color correction configuration.
>>
>> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>> ---
>>  include/uapi/linux/camss-ope-config.h | 160 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 160 insertions(+)
>>
>> diff --git a/include/uapi/linux/camss-ope-config.h b/include/uapi/linux/camss-ope-config.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..800e6ef1dba218ca33b565e1e51d6647f02f8753
>> --- /dev/null
>> +++ b/include/uapi/linux/camss-ope-config.h
>> @@ -0,0 +1,160 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
>> +/*
>> + * Qualcomm CAMSS Offline Processing Engine (OPE) ISP parameters UAPI
>> + *
>> + * Uses the generic V4L2 extensible ISP parameters buffer format defined in
>> + * <uapi/linux/media/v4l2-isp.h>.
>> + *
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _UAPI_LINUX_CAMSS_OPE_CONFIG_H
>> +#define _UAPI_LINUX_CAMSS_OPE_CONFIG_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/media/v4l2-isp.h>
>> +
>> +/**
>> + * enum camss_ope_params_block_type - CAMSS ISP parameter block identifiers
>> + *
>> + * Each value identifies one ISP processing block.  The value is placed in
>> + * the @type field of &struct v4l2_isp_params_block_header.
>> + */
>> +enum camss_ope_params_block_type {
>> +	CAMSS_OPE_PARAMS_WB_GAIN = 1,
>> +	CAMSS_OPE_PARAMS_CHROMA_ENHAN = 2,
>> +	CAMSS_OPE_PARAMS_COLOR_CORRECT = 3,
>> +};
> 
> I don't think we want this enum to be OPE specific. The whole idea behind
> the extensible ISP parameters is that there is a single set of parameter
> definitions spanning multiple ISP generations.
> 
> There is going to be a mirroring patch for libcamera defining some C++
> magic around this header:
> 
> https://patchwork.libcamera.org/patch/27430/
> 
> and this will be used in the camss libcamera IPA and we don't want to
> have one version of the libcamera wrapper per ISP "generation".
> 
> So I think this should all be moved back to a generic camss-config.h
> (or maybe camss-parameters.h ?) and then if for the planned Hamoa /
> Monoca inline ISP work of we need say a new version of CAMSS_PARAMS_WB_GAIN
> just add a CAMSS_OPE_PARAMS_WB_GAIN_V2 for that.
> 
> That is the whole idea behind the extensible params, otherwise libcamera
> will effectively need to have 1 IPA per ISP generation / type which is
> not what we want.

Can we change the name of the header to not be OPE specific. An proposal will be camss-config.h,
i believe most of the parameters will be the same for other ISP versions.

~Gjorgji
