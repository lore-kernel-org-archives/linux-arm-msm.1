Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC4D306776
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 19:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785526225; cv=none; b=rQOZCLms8Vrr1p5fRQlm0YiEYtAa48it1+vtCZ1EKo/2ZAA1qEMeBfl7P7q6TmngDCE6rAJweNId364+VCz4ncw6mlL4iEpgi0VnLAGw6FcwmVcumAr0oZWsJkJCtImPnv7vtdMOAX8kpohkgLAEhW4pQVcXLcPQIAjrMEJWWcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785526225; c=relaxed/simple;
	bh=hSvvyu0gM3TmzR4JhcHeKrwwx5sqsSKJ+YsHl5FTcVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b0A7cGvyofK3eEMInXPiRCNSkXZaMD5xsK/PaBXX12USGvmg8umlynVT+5NaN/CfEcDYsrPCPdxJlv8XlKfI95kLmuJ571LlrQ0E3lP31WKgHyGecneUGwwD4ZvXyQyCfs1DYl4BI3nkeGBVzydoi26krwMaZuxMcxFML4j5FaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HfK6PKHE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AnyeCn6/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HfK6PKHE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AnyeCn6/"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VIcsZH555793
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 19:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qqnTleWc4aOs+18EOqxz46M/aGgFpQKcUHE35qkLIDU=; b=HfK6PKHEZIEU+uF0
	PaTjHqwe9JSenWEy1nGb2ynFGDPMegBM811IsHD5OT4wVPMzYisKjBD9SFDllHLK
	ggNMTVddxUvAkKGqTDobe6Lp4w+E5nLKOJVYhWt5HPAY5eKdBF1Fz75GcbaKl9RW
	uDmgZcaORQlJ8jTXUDQbdIu6bbiGPY5M9Tg0NHbAy7bZkkU8MEBL6iM7nygizgE3
	Qbm3nUE6asMyiLQFIWq6DQTAcuWFKFhh1swU2331bSJGy+f7xMYO7++E0ml9V4Bw
	zlyTaeI6wYQh151v/58KlFcINlelSzTaOrpdCMEulQwnyvgRFC5BkLBesRZADXhA
	v3AnEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru2u23y1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 19:30:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso21348211cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 12:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785526219; x=1786131019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqnTleWc4aOs+18EOqxz46M/aGgFpQKcUHE35qkLIDU=;
        b=AnyeCn6/IuzFQR5eHJlwvnIHuNhs5PWo7HuzlEp28gp1L+SDnUZs9pTK7rephCXLgd
         x7DlDCoDLy9l8EYo9vYDRx+t1aD8h+kddPwn4HBBqISVtgzGwS4IkN7vJGtVkvznsPAz
         /0nV/U9urlSCKu1gXg6oHNEKb9w0BMmZiH9IEP3vFafdn+9pCa3U27ZHxEzVHV7ju7Y7
         oR7oUUphp5Bn8K9gy6q0mRAZgPsoJYEakACHF/t0LPzoOdCL0XZjBl+6lPQCZK+eE3Er
         LvqCYHFJ5SYhc18wZ+iyTI97zLllBDqykG4/KAaHZQHByQlKb95rKsTDt8TaHflvek4m
         sx8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785526219; x=1786131019;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qqnTleWc4aOs+18EOqxz46M/aGgFpQKcUHE35qkLIDU=;
        b=PvC8uk1yapRlGfoQlByoXr6SzpW6SVtwwdxMeXEx3IHPf+OR/0r4p8yByAl5nULVH3
         OP2qnWRJyblIrHlovC4pWBKfl0+xT5Ax+/v8Tdbu4aF2xPd1Dd1WORJwB+TRGdC5cZDP
         gPP52cj6J7xmn4CktJ17SJdghc1rximbyemVEVJuZ+XwTdvQIJkkix9L5Egwz2CeVkNs
         3LuXQYHcn7vgX33AlzF8vLWacHIuYvLp7L9696LuqhpqPEJNERrAw3GqaCcauphDmQ1H
         AmU8EtgZvR1YPuFrstxGhyGnvRVra+hL3BQzQBIcr1PoeDBljFYpuDWLkCJdA3g9nBNv
         GUtg==
X-Forwarded-Encrypted: i=1; AHgh+RqVoyWLtFGjEMivvxT2OkrXnY/kV3hdE7go72ZMS+GeGLu71d8RqSNpCvK+h49LL98bsrgoD3qcyz9kTeZT@vger.kernel.org
X-Gm-Message-State: AOJu0YyjK6S+Bt9XAP9h+djFXWPj/pkyAAnITmAOof5XrNiviFakIEhG
	0qoaAfygDpQ2elUANJl4VMsw36u8Zs52FUarkdBZABpZLDfAiJYB5bFyTCiwBLBGnlH2Z5ygKHg
	oYQbkVJkpEmyb27YeoBFNduYOuNPJy6XbzV1KIiRxaYARka8vEskdlMrdsUk557JQjV7T
X-Gm-Gg: AR+sD105A+jo1m2puxS1Do0b1R2ZYZ8SwikbWYap7EJz743UBmcDyzRmiPQGFri1nKj
	ez71/ryQ0woRjaVFZegNng+lrUmOa9o67+uzBozONsYN1smW+1jQPTOjNhHkFnJZSsoNWSdJ2s1
	p878hmHTl8nQhSghAKTHF95NHl28/C2RzLHwon005S+tg6UqNWBnGuHayXD1yKBqLkBlZkp2mCJ
	bwT6zxC9tB3h1DXqwJDAj7ytlQLTil5jN8yNhGmZU/oTbgl5CjJHHV6UtnZhhpKwGPFHaPrUeeV
	Jyq7uzW3JXVrCXhRlZ+oOax4DHBRpLC4ay+Zfoy6juF+QkoUr+pCsdXmAK9s5za8jTg8fHbbXBs
	7+bKy0WF1bbL3bD70Enh0qXa3U8zoJRXqF+LSQJ5fFjO0mJdayqpEW2lh8PUbRIOW4MTaLQqs
X-Received: by 2002:ac8:5955:0:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52b5666c85cmr26788771cf.7.1785526218774;
        Fri, 31 Jul 2026 12:30:18 -0700 (PDT)
X-Received: by 2002:ac8:5955:0:b0:51a:8b64:69e2 with SMTP id d75a77b69052e-52b5666c85cmr26787471cf.7.1785526218119;
        Fri, 31 Jul 2026 12:30:18 -0700 (PDT)
Received: from [192.168.1.31] ([85.196.172.179])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c5a054asm2615293a12.2.2026.07.31.12.30.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 12:30:17 -0700 (PDT)
Message-ID: <476aee61-015f-4793-9be7-a102c1c3e811@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 22:30:14 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8250: Add JPEG encoder node
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260730150524.2659577-1-atanas.filipov@oss.qualcomm.com>
 <20260730150524.2659577-4-atanas.filipov@oss.qualcomm.com>
 <ln6tr2vwv6zmoo3kcivjjf3rqjxqm2fltwcpn4kk3iphc4rzlb@qdpop32fjm5l>
 <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <ce631db2-8e8b-4b97-8164-c701a1b0dc1c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bSoud5R0iqlJsA9XcjRHXNM8dr-uHBZz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0NyBTYWx0ZWRfXxGVwOCxi71MP
 7QRxMBDyXhKFxQC9TQR3mDFAy/yQHV0vfC6OugDvP10SNAI44f+rXeBMWFf14lmYs8UMrz9Uqbz
 Hy8jDvyXhou4c0OjnoQWdOP9UiEZ/os5lu+BUNoVfieK5+n4jPLFEWVvEfv86e/059op1ER8rX/
 gMM+mbylgWcuVfqLU1p1KuyWdQJXsZJ57kzmKtNsBNfK5jUv6GOwgm9iETzMwSBDcSGvn9I2c3m
 q9Puud/yJCMcdbQhTEEi5bfRKC3MpNN1RAIXStCVXhSbKyEBaKLPifUsRse0FlGclchWe4Z9V05
 KY1ePztP463A+ueK1uSgNmHPoOYzQLhgBbqbpFstYh3FiCbINGRZVXPgM7y4vTZTlSoD+/pM326
 HtEXQJhtgxBRNi0Mhq825QyUtViGpJPOlIDbFmiOrNBsDbHcWYh5l0fsP2ITS5wHVCBzf8xP+Is
 ZO3Q/p80zt7D0X4voXA==
X-Proofpoint-GUID: bSoud5R0iqlJsA9XcjRHXNM8dr-uHBZz
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0NyBTYWx0ZWRfX1f85Cxf4Unqd
 fSVe/uM9F5Rp6aIeVhGVlH3mNs79iYkFkcNnGD1Vkva518YicZM+1UjoWVCpRDj0P5iB9AHHMqw
 2EH4RWrNcaFeDjIdSw2aYtJnWd1HBdI=
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=6a6cf7cf cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=Q/e3f29T3Hw2hnAEzBPF7w==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=mwlGEVAn24TgBEnf5_UA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_06,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310147

Hi Atanas, Dmitry,

On 7/30/2026 9:02 PM, Atanas Filipov wrote:
> On 7/30/2026 7:01 PM, Dmitry Baryshkov wrote:
>> On Thu, Jul 30, 2026 at 06:05:24PM +0300, Atanas Filipov wrote:
>>> Add the JPEG encoder hardware node to the SM8250 device tree so the
>>> qcom-jpeg V4L2 encoder driver can bind and operate on this platform.
>>>
>>> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sm8250.dtsi | 72 ++++++++++++++++++++++++++++
>>>   1 file changed, 72 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> index f11da2ca4181..d42b29419320 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
>>> @@ -13,6 +13,7 @@
>>>   #include <dt-bindings/firmware/qcom,scm.h>
>>>   #include <dt-bindings/gpio/gpio.h>
>>>   #include <dt-bindings/interconnect/qcom,osm-l3.h>
>>> +#include <dt-bindings/interconnect/qcom,icc.h>
>>>   #include <dt-bindings/interconnect/qcom,sm8250.h>
>>>   #include <dt-bindings/mailbox/qcom-ipcc.h>
>>>   #include <dt-bindings/phy/phy-qcom-qmp.h>
>>> @@ -4486,6 +4487,77 @@ cci1_i2c1: i2c-bus@1 {
>>>   			};
>>>   		};
>>>   
>>> +		jpeg-encoder@ac53000 {
>>> +			compatible = "qcom,sm8250-jpeg-enc";
>>> +			status = "disabled";
>>> +
>>> +			reg = <0x0 0x0ac53000 0x0 0x1000>;
>>> +
>>> +			interrupts = <GIC_SPI 474 IRQ_TYPE_EDGE_RISING>;
>>> +
>>> +			power-domains = <&camcc TITAN_TOP_GDSC>,
>>> +					<&rpmhpd RPMHPD_MMCX>,
>>
>> Is TITAN_TOP a part of the MMCX or CX domain? In the former case,
>> please drop separate mmcx vote here and let it come through the
>> titan_top (it might require camcc driver and node modifications).
>>
> 
> The change was requested by Brian, most likely in connection with 
> upcoming migrations. I think he would be able to explain the exact 
> reasons. As far as the facts are concerned, this is not currently 
> necessary for the driver to be functional.

In the documentation we have this jpeg block need only TITAN_TOP_GDSC power domain.
However Bryan request to ad MMCX and MX.
As i can see same is for csiphy. Maybe is better to sync with Bryan.

Regards,
~Gjorgji
