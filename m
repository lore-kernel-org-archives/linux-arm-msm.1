Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA95F4307B0
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:11:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431469; cv=none; b=ghnBEGt49ZCGi5MMx14LQmpF8J1MgLfOAPbf9XSPPYUmh6ChwLSo9NgE/x+EPuTuMmjcyC9UENpdEDBnWbs92po9AHeWAZt59PKVMUr8tRSnIPxYwXLMkeIPE6j1kwhp9XW10LOneS8uNH+ZNAYf09HNNR16aKxejdywwhceQq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431469; c=relaxed/simple;
	bh=kPktCVfGSgaJPZ7kLJjrZO2ZEHofop+Fsrv/RsVNmrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZtYRnLwQxMioGdHpVggE6TP4E3tdcnC+AyatQZBXO+n0dtCADNBBl5fWAPJpkD6IEHb431109UankDBC/DIB9QUahwjWrPmV/STru4bIvKgZXJdJdn9tNQSZSJJbBOaawuJ2Y9o7VEBwIEyHXvg4EB+Evfgcyd/4mMqA+7QpALU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnXIfORp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OP/5Cn+M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnXIfORp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OP/5Cn+M"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UGWdjf1524873
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:11:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3gPhQOOU18qroC0E1Q14tMzdx9r/lWFjKmTrH6UjN/Y=; b=MnXIfORpqIF5xwVt
	sBUspfTYuCpKLWMMASA8/zdHcMR+hOt6ePC2Hq//4eyVprs5jxvuozhfBewtnVpZ
	DFFingb9f2mYN5cpcyLQWG2SBUBLDqMpKWnOjcyI1tOnq1sF7fhBJ5s01A0NfzFW
	6GvmhagI8wLoNZY4G0uGJ/5SUMuCcpadnL4OdUXVCD2WFOkMC+6ODA321NPj6Ubi
	Z4kcdNB4/6CvN+AkEp8ws43CbMGzrs11mWskDv+VO3M3pMVJkuzRNQPVDyoet28W
	ol87zaHQEX8GypOsmDVUF+Ua0deaGg4R6CDgUQbq0Rh7Ah25zaZ1gPVLG8/P4/Fs
	toEKdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr6yfsbwm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 17:11:06 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c9e97b626so3951cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2026 10:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785431466; x=1786036266; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3gPhQOOU18qroC0E1Q14tMzdx9r/lWFjKmTrH6UjN/Y=;
        b=OP/5Cn+M1FD4DgnXqwqc3E9r0eaGzf3j0pWMNeBp6lNNzWuXeyzPYxM9pCzu1uXYB3
         Oz1egTOIChQNBmLY/LoNEl3+/B+bn0IKavnEOAdkHnTHhB5gXxlRfwPlFabDsiMMlqK2
         Vk+Cs8F33skBuPcJalk5f4pS4ZuA0moBWSTKnq9C7hRa0TstSRaQrI+CnhCjD/VVXAaP
         skvkg95i7qAikpiIsw63eG8+K5ZsygiA4WOaeYEqkMyKHzKb1jSqo2F7CxbaiyKJ+3ZE
         L0RusUQQ1iUgkHR++oEbGRn1oFd6k7KWi3NknyxFlxMaQIS8YyFMvOIdtjn5Q+Ptskqq
         5TQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785431466; x=1786036266;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3gPhQOOU18qroC0E1Q14tMzdx9r/lWFjKmTrH6UjN/Y=;
        b=nWj2lB0AZUJ3u9He4Vf7hQnrTx34pPVzTr2RK970U8lqAW+/NDHPhQEBRX1jcHbDDy
         xFCNsbwaSa6VEsnEt9KqelGkEsbeMF92XWVVJLOY5DkAe9uzoFiLbH+ESC+LPlv9M0XP
         EYlCDcA2quXYaxIIsL4+Ig1JR0yYOsg1SmwiU20alU6beuuCc9OM4HSFLM9ABJVbOGEh
         OaQhnde7NzPcobXv7mu3Y4bG/wQYgpg9SLQkM5jTSboOVGWM5bbyWOPl5m9dHM9/IJgD
         1+TNe2Qwhf1Vx79WHCj6liNGiYYVBh/9D4aKOADdRjRNT6IIvrj0dVx5Ou7Bqpi9E5cM
         dfiA==
X-Gm-Message-State: AOJu0Yy50vUxCoIz8CQ6a03ioZIpzRaGkFdcY0GiG7kOw6I6u+9VZtiT
	U89nUXxD55GKxkWliptsNQkiHmvBGWhC8yQw7S3qi3ER/JZoXThBSH6SXf5kBRq4Y79V4WK5Eqg
	stXwZuizIck+20H1cvU5uu78nvdzm24srnX87iIxNC9c9ny3j7XlWJTSP2QoAbQ9LjI77
X-Gm-Gg: AR+sD10/rhRiYrMMF7Z1kNA8rDXntcqm9aEaE+8Q47/IUCzwnQZj7BpJu+W98DamWZI
	9kAtl4y+W2GZyuRyn72oOYHxKYI3jaDODDUmIn26PVyRekUmpg0OT1dNXvslP6eZBzJHIIibEUi
	kZCFW9YrlQ+GkQsOjxs3Qw2FGcemSAG9eB1CdFBWSIgIgzhd9ynE7WF/oiMsndKFLFcoaOWyj5e
	GKJjBPOz7Nk9ES1KtO0yR4kpXorksFtKFiwHqq64w4fWMbzLb1nl6HLol2vDEJTUvqQ5dQZZczd
	iu5IOraW9kXPOQ3M4mrmfyUoi3/iC5nV/8t+2PJCtaQ1tkJ2VRxX/uQsMLOfau6YOWkxYd0PSsG
	CWFf0zG4zydWSvD/hXQsLvo0f
X-Received: by 2002:a05:622a:4ca:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b42b78208mr16495311cf.2.1785431465870;
        Thu, 30 Jul 2026 10:11:05 -0700 (PDT)
X-Received: by 2002:a05:622a:4ca:b0:51c:2101:f0 with SMTP id d75a77b69052e-52b42b78208mr16494481cf.2.1785431465176;
        Thu, 30 Jul 2026 10:11:05 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fa8b760f5sm90599766b.32.2026.07.30.10.11.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jul 2026 10:11:04 -0700 (PDT)
Message-ID: <01a90313-8cab-4502-92ed-761834763f8b@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 19:11:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f079642f-87c5-4b85-bba7-f4d25e2be2a4@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfX4IjrwuSE5QpR
 p/FYbjeWHO+ZoIbSWMO1S/Y0b4uN9N+lyREh7z5NafLCOQNfahX7HAuR+G6SHvTfRoqLBonvX3e
 2FAUfVrt/5uvw8h4o1QdeZEf8ltuvm3nStUrzYDCeoW9m6FT1jTVkPrsP3a8MU7hMV1aWi3am7g
 MHnmkodcekIExe9liLUOTZpFDFwdvX0+KG5MWuHc/89ufz3MDwfYgn+2SoMFK9Vb1uHwDtQV7PC
 gag55CIKuBOC6Jr8qQFZEfPlr38Suq8TsoPzsViSqq3Jv6s7JzAHu5AFcrxgZRb8k7wMGhRtWui
 THezTaat/v/9VFERM/VB14xhteixMg4loQRQ28BqBnkfZvySq+9mYdEjotqwuv/16RWXOnnxsha
 6euLurOx9EVbw5zHIC7qSZVVdF9DQoVZhpl00kGU1pspkSJyEdVfQ5ANT3M/5CWfUxkz3Ky9xgK
 nBDyf7VXdczUDdmHFyA==
X-Proofpoint-GUID: bYMQ7mG-oOWsQDUSDp-bPKjOJa2oKuSg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDEyOCBTYWx0ZWRfXx3w0WZOQX4I6
 OFv616PIcHjTMe4Fq+xFls2p7NOV6Gsd02oxhi485baggOxqhNpr6rhfpT4EMxN24hyFQzb1uXt
 L7bVPT6nci9h3zcOAh9BCgEGF6fQ/FU=
X-Authority-Analysis: v=2.4 cv=Tv3WQjXh c=1 sm=1 tr=0 ts=6a6b85aa cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=5TKC7vhQAi-i42DR7gYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: bYMQ7mG-oOWsQDUSDp-bPKjOJa2oKuSg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300128

On 7/29/26 2:13 PM, Anvesh Jain P wrote:
> 
> 
> On 7/29/2026 4:43 PM, Konrad Dybcio wrote:
>> On 7/28/26 7:44 PM, Anvesh Jain P wrote:
>>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>>> providers, and how many leading sensor IDs on each, whose readings the
>>> driver averages to compute the SoC junction temperature reported to
>>> the EC for fan control.

[...]

>>> +  qcom,tsens:
>>> +    description:
>>> +      List of tsens providers and, for each, the number of leading sensor
>>> +      IDs on that provider whose readings are averaged to compute the SoC
>>> +      junction temperature reported to the EC for fan control. Only
>>> +      applicable for Hamoa based devices.
>>> +    $ref: /schemas/types.yaml#/definitions/phandle-array
>>> +    minItems: 1
>>> +    maxItems: 2
>>> +    items:
>>> +      items:
>>> +        - description: phandle to a tsens thermal-sensor provider
>>> +        - description: number of leading sensor IDs on that provider to average
>>
>> Why don't we want to look at all of the TSENS sensors?
>>
>> Konrad
> 
> Each tsens provider has more physical sensors (16) than the count used
> here. The leading N we take exactly matches the number of sensors
> already wired to board thermal-zones for other purposes (CPU clusters,
> GPU, camera, etc.) on that provider — e.g. on hamoa, tsens2 has 11 such
> zones and tsens3 has 15, matching qcom,tsens = <&tsens2 11>, <&tsens3
> 15>;. The remaining sensor IDs aren't referenced by any thermal-zone on
> this platform, so there's no per-purpose reading to include in the SoC
> Tj average.

What you said is true

It also doesn't answer the question why that isn't the case

Konrad
