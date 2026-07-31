Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F45335E1A0
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785477339; cv=none; b=Kg6GuoHuPnSUH0Qq2f0z4mZkdPBAYyczC+Ml2kVCvowg958mqlm9GNfVx5cOMxfaZAMRANdUxVzI0jtoSsBIXDMCiWzjDhbr8TNn7OMf3vDh3XaLF8LVr4vFbsPR3GOPDX2zs1+6Jx0KssHv8fRuGOaG0VU7YzKtYVCg+mdH+lU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785477339; c=relaxed/simple;
	bh=vxXDRmx2AtjSWDCtlwLZzTO8raRnzIhbccq6vz2CYq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NAD7Pdjo/XhJSbvwUWNUGe0yIY6uJ7djm81aCujDgEplTVaiHkRmWewGLQXmeKfMzH9b8miDPChQq+5xZt7d4JKLdnDW/NKuP4M3s5DiaKUtC6EkPAbfnRTL/ayOK353jMLaB2WUesRy4Svq5EIoZCL+vVSiAuEG8PsQI3jaH6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VhCWAxLu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dc81PFcg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VhCWAxLu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dc81PFcg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V5FI8q028794
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:55:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nq49GAa+tctgSQt5/Jkal1w0hVx7M4aUkzCHd79j7lY=; b=VhCWAxLuke4ds96S
	VZzZs4HwIIHYIy0kQdGGJRYhg36iXhfgdqRg7oeGFLjcB6yGK+Pm0Py0JEQkOOsa
	Y8SSkZptD1RTqDWO1lE4/VAfXF5uFn1GEiLPsyFnXopW0p3a6LqR1LKbbwx7y7BK
	ESXpDU6jpZZVAL9vEl+7Oqny+mzZVunaBVqclZPQbC6sRnbNgDUCZji7AcCdi6Vx
	X9h8t9LyKbgCgsjpulxeOkQo3N1pm2Y63drtuq7VFOdZSa3zRs6+9OdneGFu+1px
	2BNQvbsT/t+eS2Q/4DYFUHVrEN8q5Gd8aAgDELiUR0+x0DY4rRpLKhK6kl45fL6/
	PZ/Kpg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frnd584cn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 31 Jul 2026 05:55:37 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2d001671a54so12547535ad.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 22:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785477337; x=1786082137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nq49GAa+tctgSQt5/Jkal1w0hVx7M4aUkzCHd79j7lY=;
        b=Dc81PFcgU+03pB8JIYsaz3ZmPAIw+MB5tLPoc7lN26NAAZ3c7ApcCbs68BR0Zil5Q0
         Vaf9BLzl/YIbo0QU1wNhUiDqeU2RUWf0eggzOPsHHV5H9e4NAZbMC9fgXVwXAT7MPEP3
         5qaf36InBN9bL/HMlKuVQKA9ZSAIAgVzsAwDmOutAN7oHUH/Ktp8es+vmMK9KjVc9xpV
         IYO+k5JpTvThWbCEMVuwxXqYYeamqzA7kgCZNJxmM9QEK97RKx2WlT2DgoJmVWDJq4pe
         8Xz6ItizyG99QD0/Whdr0jxJ8r0PeJOZhcKulDU8CTSPF4hXkgkGhRBjNqUyPCLuednu
         h0CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785477337; x=1786082137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Nq49GAa+tctgSQt5/Jkal1w0hVx7M4aUkzCHd79j7lY=;
        b=kboQAn3O0Djn66WD+vGoSHv9Xv+BS45yzEFWJ2QgAzpSe5BvFm32PLA+ikgcNsifjW
         Pjqe/OpmsjQd2iG/k68+bu7FYZ7Ki3vVbkhq2AXtlXiqtXUiUz/kx5LLDkb0tLLsQ/pB
         sYdYulj0ZH8gQNmq3iaJ/2CGD/fvGUBMu/wKPO//nXRy8kZIgSyrekQIY1jcPxyWLg1T
         WSdOw3iyD8Oo+t5NFEBOa4DCO8DwUt+A42YmlXMb6CL/6XUSVqkkn0w7FrPdojCeVnWg
         xFotbmPNTPXX8/4+m2XtdIF0N469MvloVkS+sN4Spp943604MNUqOgzBDHqL9VJz8zww
         FWvQ==
X-Gm-Message-State: AOJu0YzxfhzGDoC9cWbeRkMc3qS7gJYF8aFwfidF0+Za/nS+8CO2Dhaz
	PaYSXbBXSPGQEPfEETgr9ocIIDoho5xTHrHhQIVK0kJRNaMcr7hF6QDX4Iy1lF8LU3gHaujZbIf
	mRGwfggqN6pMTfpXCd1ApxM0awYyzeYcV525Q4HOjgG8nxV6P68VA4rmExqvrRPqm3zvY
X-Gm-Gg: AR+sD125pUH7X7ppduBZsEoYKWC4cjf2mxp0aJJxfjpjxZN8X3BHT+2sioi+aXg9fmD
	Y03rMrY1dxVcfMNrGTIK1ePKWAN7j+G59rQ1b9s5CmVVMyXooHY0jvs5ycjq2bN/FG2JCudqI2V
	3RztP3uvzuZdIb5MfhdFfjy/3KD5kf13n+nbiej4l1Mw6X7cMFyaF88MF/NmizLos4XpvqP5D7y
	31KnMFpwbJecFFK3TVezWwD5HFhBssCFXsPjrDj3fBIh9ScBpVReIA5MQ3fU6/eGhjflIVHKvsZ
	+U8gznFwZwGINGchhXi/CkF5eeVUMf4bJLp0lcG/Ytjhnq9RhJSwBaS8BXP8NCWH1gQAY3B1p+v
	jPrHv4znE8gtcm7vB1OFSx3TcxCDWKRFtF0pn3xvva5gky3DHwrUfogYk9kAgtSjCOgvCEoaoeA
	DlsGtZKsj5ThT2Ig==
X-Received: by 2002:a17:902:f552:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2d046dae6f7mr8191005ad.15.1785477336945;
        Thu, 30 Jul 2026 22:55:36 -0700 (PDT)
X-Received: by 2002:a17:902:f552:b0:2c9:feea:4e4c with SMTP id d9443c01a7336-2d046dae6f7mr8190825ad.15.1785477336536;
        Thu, 30 Jul 2026 22:55:36 -0700 (PDT)
Received: from [10.190.200.192] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d04ae9874fsm624985ad.32.2026.07.30.22.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 22:55:35 -0700 (PDT)
Message-ID: <282e3d1a-17d3-4fe6-8435-ac6241f69eb8@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 11:25:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20260728-ec_add_more_commands-v1-0-771abd65ee1a@oss.qualcomm.com>
 <20260728-ec_add_more_commands-v1-1-771abd65ee1a@oss.qualcomm.com>
 <a46f1394-f006-4a13-b251-e5e2a0494b89@oss.qualcomm.com>
 <f079642f-87c5-4b85-bba7-f4d25e2be2a4@oss.qualcomm.com>
 <01a90313-8cab-4502-92ed-761834763f8b@oss.qualcomm.com>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <01a90313-8cab-4502-92ed-761834763f8b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: I-ylnmDPQAM_0YEVp3hfoYLgSyFg-4rc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX5iOELI7taWet
 AJ8ZT7EcFTBOaHL3YuqENFro/ipnYJUiIy2J+o6MQE26dU6w0Jceilic1DqsbUGMdTCJy2xEJwB
 w5HNicW2GQw8yTwCbuT8d/vL5Zy9vUtNhwkEME1ssoulO6AVS8NY+KI70hbnySc3pOQDW1coTsu
 /EFLEsLRh/ee2lpO7WMvS4TVeGt0zVt9WcmGCaRFcZV5OENZXVbUOyP8OBok4FVoma1VP3gza++
 YFQ8HWyQWL31GZNQhR42rXJ3dKBVElMZV9sd57sRjQgTBVivRL632DA/W3fvmYUPJYiJJEvjI67
 XNwxHm6w/2sYrIiugg/27E2HSBDUPCndATnSeU2Rx/I98idByea3c71DKoMXD5QLOtohHQAJ/O9
 XmqY292Xw6u1j6IWoA+2oDErwW2S8ru0sZxLvce2qqZfAGJ0M8af3FtrRKurCuISLVPV5rI38ZT
 0sTabRKovI+zzIRQEFg==
X-Proofpoint-GUID: I-ylnmDPQAM_0YEVp3hfoYLgSyFg-4rc
X-Authority-Analysis: v=2.4 cv=MLBQXsZl c=1 sm=1 tr=0 ts=6a6c38d9 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KABvarx3PlEzr7JmBnoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDAzOCBTYWx0ZWRfX4kj7u42SaZ96
 dWZ2iSbVVtCvS4NC2cLkF4SBO9Ypsol6OGNPjRFi4ak1BNe4/Bqzs+LWOnGHHyi2tCCZqUq7yeE
 Z0Nvd1XGMXXLv73hkpRljEObjKHrFT0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_02,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310038



On 7/30/2026 10:41 PM, Konrad Dybcio wrote:
> On 7/29/26 2:13 PM, Anvesh Jain P wrote:
>>
>>
>> On 7/29/2026 4:43 PM, Konrad Dybcio wrote:
>>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>>>> providers, and how many leading sensor IDs on each, whose readings the
>>>> driver averages to compute the SoC junction temperature reported to
>>>> the EC for fan control.
> 
> [...]
> 
>>>> +  qcom,tsens:
>>>> +    description:
>>>> +      List of tsens providers and, for each, the number of leading sensor
>>>> +      IDs on that provider whose readings are averaged to compute the SoC
>>>> +      junction temperature reported to the EC for fan control. Only
>>>> +      applicable for Hamoa based devices.
>>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>>> +    minItems: 1
>>>> +    maxItems: 2
>>>> +    items:
>>>> +      items:
>>>> +        - description: phandle to a tsens thermal-sensor provider
>>>> +        - description: number of leading sensor IDs on that provider to average
>>>
>>> Why don't we want to look at all of the TSENS sensors?
>>>
>>> Konrad
>>
>> Each tsens provider has more physical sensors (16) than the count used
>> here. The leading N we take exactly matches the number of sensors
>> already wired to board thermal-zones for other purposes (CPU clusters,
>> GPU, camera, etc.) on that provider — e.g. on hamoa, tsens2 has 11 such
>> zones and tsens3 has 15, matching qcom,tsens = <&tsens2 11>, <&tsens3
>> 15>;. The remaining sensor IDs aren't referenced by any thermal-zone on
>> this platform, so there's no per-purpose reading to include in the SoC
>> Tj average.
> 
> What you said is true
> 
> It also doesn't answer the question why that isn't the case
> 
> Konrad

What I meant is, the driver looks up a thermal zone for each sensor id,
and skips the ones that don't have a zone in DT. Sensor ids past 11/15
on this board don't have a zone assigned, so there's nothing to read there.

-- 
Best Regards,
Anvesh

