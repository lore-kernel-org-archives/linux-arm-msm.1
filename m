Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 583703CDBA4
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:55:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789030521; cv=none; b=vEIkkf5Rn0f6pLKyHFJ2nvyP6/Dv2PUqrD9DMAlJT5FRwflKN8WtbA5Xt/E0JiyqRLUvAz91K365u8uESWSEZ+AyWw5ru/9tZNqsbt4fjAc3p8ikKjmwbU+O3p1guBbLrW1x63Wt5J1v172Sm0VN4tnFHyhdNcyn9MS9IeYIGRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789030521; c=relaxed/simple;
	bh=fupNkDcSpAim3Ve9Y+p+BU7wilJC+GsUIFeGnTsVkCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T780Afo8Zig8udt+ICAczZVJmrPww9Ukkc/3hQy38pOm4ij6doI2TWIxsatUkX5uli+OQP+3S1ntf9PIIn6MPEuJBayWsfcMRKPxVfOUJiuL5eX6lTW6NRjJK7n6ygs8Ky6+X5A/60wgzJe+TJKZPyL2I3vUCrbJ9zeEwfHh9EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jFvLGYsr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KNRG9WlX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jFvLGYsr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KNRG9WlX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68A8q9EL1001496
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IV7nSQwUnsodB+hey4EDulRdFP3Ul9cQKQY1Qn878hA=; b=jFvLGYsrSjolnUJv
	8fQNhzaMgvbcFbH7iBdtFAU3qUurre2OIoAs+pGgpXbQhhDB6ujkkkoT7iAykm4F
	8S7WglF++JN7b76d+GJCFHOuwNTTZf4aCbdWGa2qtyUJS4nrI2Nm/tnvR0CT/3Fq
	8NBkva6arYwIiOQJbPRn4Z71P8ULxEFfXu99PBERYu22R0e8NobOUxSG8YoKdeoa
	5Bxq74fLamvB0ZZ4mv9Lk5oxBicZ9IatFQHHFDZzC8SaW4K8jBqyj84SdSUuqrJV
	3uEpeiri646Zyk0R1EeujDFjMZIlSZgOxxyv6goDHWpudoY2uMdNnCL2MjOgdtrF
	r8TVgQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkqsvre2x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 08:55:18 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb20f82a0eso5110844a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 01:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789030517; x=1789635317; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IV7nSQwUnsodB+hey4EDulRdFP3Ul9cQKQY1Qn878hA=;
        b=KNRG9WlXpOb7RaEJXKBdNkL3T/Hd0umCtegyJBmE17mrGXKjEnQpoLaOMP1qBEBag7
         CrRX5AdNJut/WrnLUVYl9eoscBnjFemWIHDLCvjuCBzzRFJTofuHmedDv6SLouhlgl0n
         5IJCMrWDVKVle1qSk0IFJ5HlG1t5VJOlrr4qcQDQJpAfAOsVwKp3kGiPY+0JKjbaNpqs
         qcWu/UcXfU9HNLvDpRE2Ymr7MIruwACoe0ia2PKIUKuW90EHF4qulIDqNC/oJyvsOw+I
         xjsSLHrTmZgUFdcYDp0kZTelnLwVDD7F1JNNan0OcI0G+DGam7LUFLgV04ui2E33HVaj
         YgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789030517; x=1789635317;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IV7nSQwUnsodB+hey4EDulRdFP3Ul9cQKQY1Qn878hA=;
        b=BaK7lXbptj8Miatj55MXoKDk+PUsZ68md0Ta3WRwxlCKW7h6EmQrum6eMdu4h5FWA3
         AEWzFQz1PBg8Q0V1JGDEIxvWHvzeyqDkPbVK8Alyha3+Yp8xvlUD6wWPQBn8yhWYRheg
         GYAbVcd8JJgsoclWjpdxzZqVHAWdKwl1QRqEQsbqPo9eiaECcJ5MEJx7pfMD9N+8Z7uA
         JUcnbclJJDs7Xa6mKzppB6cfE8K3FAOysloCP9ANsQ3PZdWEpEQG1BJdbeocFM3+q3y7
         AyylojYlXDszi2Ba/FQAphVUxLTghqoPWzHeQqhomaqbvi2WuJNIorIXDgzlEakVgOTG
         MpfA==
X-Forwarded-Encrypted: i=1; AKwUvBzhZG5la/Ur9QYrrERA1DsPg8sz0/MpAEdIgMk80m94vxdqLiw06kC04Xdkdrhd5YjDfaOkPbeItg87kBtJ@vger.kernel.org
X-Gm-Message-State: AFuF++lYH+vVXf/yTmjegW2JfWEsjZOjVFEMyzJLMCe16K2XvC5K/i3h
	ksNp94XSCOjheXr2Jykn3Ntsb1Ufd6SK6HS/v6SjGRAJFh/Mp75zdb6B6FUs3zs1OOfIfSina6Z
	AqxFD5yZ3S0o1smqDMosFNn2Vs9F97pnXC36ALrKZx4DSMseO1mmQ2lgMR8OMePp285Ae
X-Gm-Gg: AYBFou08MfiRUBmFB4sWT5jnWIrQ1dNibyti++BVuRuSbFaFATYZn+FnrSmgpK8mS2O
	S6KF/XBUC7qG3h8CyBeQoAJjOVM0944/ASsfLQfwO2qhxOPnimUCb4cCR3tDTMiPQMEnyqJnB71
	eM8e5HMmDv4IuJXnpVl0z6sVUV2UNvb1szwmHlcm/pHZttC1fsGfrc8ssMWDYHgzkm7PTer3zwP
	FANZtVqGmbzpwgCic2ZpiV3Zxg9KsLK1e71mN/jICACbQlI/ieeWXK80UKMc/evVjDj3yZmy59+
	Ek8s/QP+4nGS5KgmYgd+nhNUJrHgkw6Rb2qgaeZq3Ma4ZnGT6u8PCKvDDcKVHZfYcf7s90hct7c
	2wWAfSp7xgaiAHtRlOiBDHXNgHXA=
X-Received: by 2002:a05:6a21:6e8d:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3dacbf4c52bmr12163550637.27.1789030516714;
        Thu, 10 Sep 2026 01:55:16 -0700 (PDT)
X-Received: by 2002:a05:6a21:6e8d:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3dacbf4c52bmr12163470637.27.1789030516267;
        Thu, 10 Sep 2026 01:55:16 -0700 (PDT)
Received: from [10.217.217.79] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14332405e92sm47980646c88.8.2026.09.10.01.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 01:55:15 -0700 (PDT)
Message-ID: <c9342601-e4e7-4f0c-8cbd-1ba5291457a7@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 14:25:09 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dt-bindings: clock: qcom: document the Nord DPRX
 Clock Controller
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260907-nords_dprx-v1-0-d472af3f01b1@oss.qualcomm.com>
 <20260907-nords_dprx-v1-2-d472af3f01b1@oss.qualcomm.com>
 <aqEZTDMtVaGR8F6o@QCOM-aGQu4IUr3Y>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <aqEZTDMtVaGR8F6o@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=DdOCOftW c=1 sm=1 tr=0 ts=6aa27076 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=UHbYQJEj8knhjxSQlJwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDA5OSBTYWx0ZWRfXx/oGke/2O9Z2
 fjTyeBfe84R/srNWsFrwH5rG9bwHmpBN29FPnkktvYKhJFjECGZXbP5fYsWDkWGwaGwPpiO+jif
 bL35jkLa8ixSanWsgXAGnwjsN09Sx4g2kHdaHjqKXiYp97xTvuci9ryW98EbpqAYn2V1S09NfW0
 ClO3lRaDNlGpJRC8ssJBbJtnifOY38ED+QifDmWof87Cl634objw2LWOTYSb55RvUcUcVLDJGHr
 ZYN7afMBxbwmYuBCvMSHVAyIxn0Iwtang10d95p5SHhysVlL/RxrpdoZJPe9l+AuhhmByutGvSh
 S58Aed5/ORCbVc7lwpkRsVI+KITIf5mxc2RfMyzjJzknrXEk3vNY3q7T+wgrryIt6Vh9aQoygzo
 0oj21KP6uNKmAOtW8wyfPkJJXcqW4oSo1uiNDa2oRUvIEVb0bI3bf7HxK2yyVKW6+mq4u19yV7f
 +RDfBWZ3cH4pEE8NIFg==
X-Proofpoint-ORIG-GUID: cIu-tHoneqwhN5MLGaPY2zj04mWBpk81
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDA5OSBTYWx0ZWRfX/kV0JDdB9g6b
 y5v+0lsDTQk8aWLpRqVTptO7CzjKG6fLDU4zwLkqLtsQg0h6Ji1qwLkZ0AoI1OV0/H+Y+w8OCNU
 b7uzs12UCTAhjjEFQz73dO2wU2VXhXo=
X-Proofpoint-GUID: cIu-tHoneqwhN5MLGaPY2zj04mWBpk81
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_03,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100099



On 9/9/2026 2:01 PM, Shawn Guo wrote:
> On Mon, Sep 07, 2026 at 01:56:14PM +0530, Taniya Das wrote:
>> Add bindings documentation for the Nord DisplayPort Receiver (DPRX) Clock Controller.
>>
>> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
>> ---
>>  .../bindings/clock/qcom,nord-dprxcc.yaml           | 68 ++++++++++++++++++++++
>>  include/dt-bindings/clock/qcom,nord-dprxcc.h       | 27 +++++++++
>>  2 files changed, 95 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..fbaaad1f3db3ff67589d6201ed0e25710c044614
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,nord-dprxcc.yaml
>> @@ -0,0 +1,68 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,nord-dprxcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm DPRX Clock & Reset Controller on Nord
>> +
>> +maintainers:
>> +  - Taniya Das <taniya.das@oss.qualcomm.com>
>> +
>> +description: |
> 
> " |" can be dropped?

Sure.

> 
>> +  Qualcomm dprx clock control module provides the clocks, resets and power
>> +  domains on Nord.
> 
> I'm not sure it provides power domains, as the driver registers no GDSCs
> and the binding has no #power-domain-cells.
> 
> Shawn

Okay, will drop this as well.

> 
>> +
>> +  See also:
>> +    include/dt-bindings/clock/qcom,nord-dprxcc.h
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,nord-dprxcc0
>> +      - qcom,nord-dprxcc1
>> +
>> +  clocks:
>> +    items:
>> +      - description: XO clock source
>> +      - description: DPRX CFG AHB clock from NWGCC
>> +      - description: Sleep clock source
>> +
>> +  power-domains:
>> +    description:
>> +      MMCX power domain.
>> +    maxItems: 1
>> +
>> +  required-opps:
>> +    description:
>> +      MMCX performance point.
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - clocks
>> +  - power-domains
>> +  - required-opps
>> +
>> +allOf:
>> +  - $ref: qcom,gcc.yaml#
>> +
>> +unevaluatedProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/clock/qcom,nord-nwgcc.h>
>> +    #include <dt-bindings/clock/qcom,rpmh.h>
>> +    #include <dt-bindings/power/qcom,rpmhpd.h>
>> +    clock-controller@a940000 {
>> +      compatible = "qcom,nord-dprxcc0";
>> +      reg = <0x0a940000 0xc000>;
>> +      clocks = <&rpmhcc RPMH_CXO_CLK>,
>> +               <&nwgcc NW_GCC_DPRX0_CFG_AHB_CLK>,
>> +               <&sleep_clk>;
>> +      power-domains = <&rpmhpd RPMHPD_MMCX>;
>> +      required-opps = <&rpmhpd_opp_low_svs>;
>> +      #clock-cells = <1>;
>> +      #reset-cells = <1>;
>> +    };
>> +...
>> diff --git a/include/dt-bindings/clock/qcom,nord-dprxcc.h b/include/dt-bindings/clock/qcom,nord-dprxcc.h
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..62c26b58ebef04f05ea1dc77664c03aaad65baa4
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,nord-dprxcc.h
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
>> +/*
>> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
>> +#define _DT_BINDINGS_CLK_QCOM_DPRX_CC_NORD_H
>> +
>> +/* DPRX_CC clocks */
>> +#define DPRX_CC_AHB_CLK					0
>> +#define DPRX_CC_AUD_CLK					1
>> +#define DPRX_CC_AUDIO_CLK_SRC				2
>> +#define DPRX_CC_CORE_AHB_DIV_CLK_SRC			3
>> +#define DPRX_CC_CORE_AUD_DIV_CLK_SRC			4
>> +#define DPRX_CC_CORE_RCG0_CLK_SRC			5
>> +#define DPRX_CC_CORE_RCG2_CLK_SRC			6
>> +#define DPRX_CC_CORE_RCG3_CLK_SRC			7
>> +#define DPRX_CC_MDP_MEM_CLK				8
>> +#define DPRX_CC_MMCX_XO_CLK				9
>> +#define DPRX_CC_PLL0					10
>> +#define DPRX_CC_PLL1					11
>> +#define DPRX_CC_VID_MEM_CLK				12
>> +
>> +/* DPRX_CC resets */
>> +#define DPRX_CC_DPRX_BLK_BCR				0
>> +
>> +#endif
>>
>> -- 
>> 2.34.1
>>
>>

-- 
Thanks,
Taniya Das

