Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C733B38B124
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787038235; cv=none; b=EhJzRsT3/VnnrD3iTNuJnZdyGVoGFzaL5WPC4LRqNpzpw+WFOjUFKt4vNhl5ftskow/OZ3Tx7aCD66c0t5DnoNp5wjyFNtyz4q9oAfDMz8/PtEfuRMn+HtNhoH96s/oQ9ZexL0IuvCbcKTNY6bP+ddlOYt/CZUq+9EddpERPiFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787038235; c=relaxed/simple;
	bh=CqYR+LdPJ7uDeC5NDydUyDftPqYWNTyqsZ769uFb3Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ff7CgofdHjm8i2DbVOzmn2JhfzqPhL4N1WCkpjGUsDdv9m0mA97IK4d5UW7nigOi1bXyWH/p9h4DVNmB5HfJc9rUrLe00+we/S8Wsdq6ZKdPnrttdtlSBi5yNm129FieivWVj8OsSXdg8XeSsgmdmeXBjPLhk8+0/JVKndZArfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bt7D/mh3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eqv3sewI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bt7D/mh3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eqv3sewI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I7E54G589750
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lvZj1WvV11EikVxvMvuBnAJt5d4ZRcWuj+qixzy+WfM=; b=Bt7D/mh3VgBgzgY1
	m9e1hYTTkC94A/KDrRm1IzL427QpZKQfqLM1EGIBg0ylTCS2bnH1BBjQjtdntbpZ
	xVICJLCJDWXwSrdvtVvjDKM/W8czxLMhh3ArngZDJUuqOAXEfBC3Utoe4j7e5wnH
	qtdD8OiMMxAMLlv8DE0hbMAcMsGXk3RyePU6Mi2femRark6ly1l1WKPnhowmNrgG
	yWsiqtCdioxOkab1qQE5zRcQke9MFwa3mWuVVVJQAuOBY8Iub+KeBDETSKZB91Cd
	DaBTeRV20B8WNiYtvKIOKdQF6qMqzfJQhNOQVm8gau/lXLs2b9txyeeuSrv7nMYZ
	YTQyOg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615k7ts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:30:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38f97b3f853so6781250a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787038232; x=1787643032; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lvZj1WvV11EikVxvMvuBnAJt5d4ZRcWuj+qixzy+WfM=;
        b=eqv3sewI4zam9xH3dCDFHKANVdCjfoTI41UquBNQclHkFKuxwwy6O8J4/zvg4qHLX4
         T1B7WKlDJcYnW6DSHy2F6Nwo/c2a7xDvmyIDmqjBMxuxAg1u/1MgkTGa+esOOLZSHDBg
         GphXjiMxseF71XhKQAil94cByhah+1kUBzG0stmkr8TQX0HnLbx9ycSVxPAtP06Qgbwh
         FoE+a9HydjpE3Udy07x+l67Vg/6DdKA+kX811yM2aU098/eqmsGoAqREAWch/AvWyFZO
         MT0eq0AsN+6GKE3jb0Qvk8NF8IDBLEycJDzNh84lQ38/lXumgX5KtrPEWw4LtZJPZcv+
         KHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787038232; x=1787643032;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lvZj1WvV11EikVxvMvuBnAJt5d4ZRcWuj+qixzy+WfM=;
        b=sN9EaWzNyjjlBMVDTpT3lUUMsujWOJLQSNPDg3JojzT1xBivFvWlz+XxbgxEsaqDks
         d2zhgEeUpWX/rq7i4SFQmY9ZLkIDkMxbWuvhlYK2MULod3X8WSHoQFs44UJc6i1z17u/
         MYrku3+CJAmpSsH/S8T5JFn5JUpIgC5pvztE+xU2/y/61UM2NpKUqAmJyjAmiBXSnxO4
         jqsG5EeXT7KsHPrUvAxtXDax9quynhnNQjQbHn3IJmC1rhNofNHqNFT9OXVwRqMr5gye
         Zy/guvlI3BwIlLMvkLWyrLLMJoXzA+lEsCHvy/1uGyGw44tOhvd+icDvXcm+poIEicnT
         IRLQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro+em3rUlvO0SmN9yZJY9WaUJCK6VDlf6jaV2cUZPcvhJTB7mWfGFi8GhGXclvg1qDaSlH6EwjYWoJJR7JR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0BxOvIZvjQab3ig4pQyn4TReYNwaiDrrY+Q8Xf/C8mz53uNZm
	Ce3tmF7pM6GQ7eEZ4M/Fx2THUNz+HMCHZDVJ8mevtTp63F4YOEPja9OSfisoZBnGVvdAPWTNGb5
	LTXxcQ86p4BKL3uiNU2po1dxiGXaK9rIAwFb3Oq1TL5QO7nm+y1fIqcgNOaJrVTzWN29UwQ4Zj4
	8WlhE=
X-Gm-Gg: AR+sD12beyvIYeU8emzwL7tfpFzmfvTTNHwtdHjmShgbJMuV6Ubott9HBG/i/YHFDVn
	yLlc5Yehm6LFjKO1b0/GY/k8aCKXEiMM2FzkOe1AG4Sy7aE5fVX8iVNZlGsHdXoZL5p69yOA3m1
	0bGTDXJ2Low5e/merVaAwJe2ss2jXyIegcmJNzYUea1UH9YtiNAhvuC5Jnzl2itu0objfqHN1I3
	OH+58SSsLWApIR+oJsMEuLcCetIrGb1x+eXZl2f7Ml/4pZOlFn6yqmUS/3iPP7R7lIlDhEayzY9
	/VaSBADE+AdR+5KRtVN9L9CQY9pTLmyNJscccJuYDv1ljDsXhUTkLrvntNR6ApgknoJ7hKOiCgF
	SdaA9pQKvq2E/xjGQBAtxihITp6/Mp4rQwfkcc1XwoHd9Um+P4kQ0mw==
X-Received: by 2002:a17:90a:6c96:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-3954de49a7bmr7377650a91.15.1787038232223;
        Tue, 18 Aug 2026 00:30:32 -0700 (PDT)
X-Received: by 2002:a17:90a:6c96:b0:395:4de4:92c8 with SMTP id 98e67ed59e1d1-3954de49a7bmr7377570a91.15.1787038231695;
        Tue, 18 Aug 2026 00:30:31 -0700 (PDT)
Received: from [10.110.9.3] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954d3d2adcsm5010349a91.17.2026.08.18.00.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 00:30:31 -0700 (PDT)
Message-ID: <60b775b0-5482-4b95-b37e-ba5764efc0cf@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:30:26 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>, devicetree@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        bjorn.andersson@oss.qualcomm.com
References: <20260512033750.3393050-1-linlin.zhang@oss.qualcomm.com>
 <20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com>
 <b07a3634-a7a6-4f28-994b-fc900be26879@kernel.org>
 <01578e6a-d10a-46df-bb32-fd45ecb365d7@oss.qualcomm.com>
 <f0b90edc-6584-4b30-a2d1-e72139983fdb@kernel.org>
Content-Language: en-US
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
In-Reply-To: <f0b90edc-6584-4b30-a2d1-e72139983fdb@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: WFpDR16mtDw8K2-thK3BstyXmsCaLjVr
X-Proofpoint-ORIG-GUID: WFpDR16mtDw8K2-thK3BstyXmsCaLjVr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA1NCBTYWx0ZWRfX9s3GX2Av2dBe
 WwNKyXMrJQz3b9nPfFYynzKbRbMjlSqTAz3rC6gExmZVtUgYKuLu4h5uNFPn7pkDgcne7V2PrRG
 CChMJkYSlYNHKuoHmDwnkN0dDXW8ZhE99JDYvxfrk9rgVHF9x8Ih7vqoD+gbD5XOZcbJWq/gob7
 LNjUY4Qgjzl6wGbOftzjWxOp8t8NA87PE7In2ISM8L+x/SnSeNazd7qIg73IvOw79r/fDTT+Eb5
 tRFXRXvKsvYjYvCcVTn2Usej54MmeNBnpF0VEwHUBiIlwGcPb58VqUjBxFkR7XAM5VAeGoQBNOk
 ia4vCqs4LHPuMzaeBe5AF3MHeqTGHPDfptZGG8oDZ0fyuSqEoVxmr3tGs0SIsuU34X5qvC3Pc9t
 EMwfweUXZVAljmZ+wbLJllLqUWAcWAg7dnuKCOCGd7+lGyz5VV5cHuXlP0+ateS8xG2xT+d9osQ
 FJzB9Lt32t7/UAKgTEQ==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a840a19 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=95qGNFLDXz8gbe9eW3MA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA1NCBTYWx0ZWRfX2RIKi4WqxJCU
 Ig+F9neoYSc66LYRG8w7aMjOx64eNU9ENRFs0dpiN6CJ2VFy/Ep1ndVAmlIHDLMayfz4Ay/iMeM
 wWcfV5kJCNse769rUeqtoGa7PSlW6Js=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180054



On 5/15/2026 10:48 PM, Krzysztof Kozlowski wrote:
> On 15/05/2026 16:22, Linlin Zhang wrote:
>>
>> Hi Krzysztof,
>>
>> Thanks for the review.
>>
>> For the SCMI-based platforms (e.g. sa8255p), the ICE resources such as
>> clocks are not controlled directly by the ICE driver. Instead, they are
>> managed by remote firmware and exposed to Linux via power domains. As a
>> result, the ICE driver cannot use clk_prepare_enable() directly to
>> control the hardware clock.
>>
>> The intention of moving the clock handling into runtime PM callbacks is
>> to align the ICE driver with the power domain framework used on these
>> platforms. When the ICE device is attached to a power domain, invoking
>> pm_runtime_resume_and_get() will trigger the provider (remote firmware
>> via SCMI) to power up the device, which in turn enables the underlying
>> clock and other resources.
>>
>> This design follows the guidance where the runtime PM framework is
>> used as the common mechanism to abstract both:
>>   - direct clock control on non-SCMI platforms, and
>>   - firmware-controlled resources via power domains on SCMI platforms.
>>
>> In both cases, the runtime PM callbacks are responsible for performing
>> the actual resource enable/disable:
>>   - for legacy platforms: clk_prepare_enable()/disable_unprepare()
>>   - for SCMI platforms: power domain on/off handled by firmware
>>
>> So while it may look like an additional layer on legacy platforms, this
>> approach provides a unified mechanism without requiring separate driver
>> entry points or special handling in the upper layers (e.g. UFS driver).
>>
>> That said, I understand your concern that introducing runtime PM solely
>> for clock gating can be seen as unnecessary overhead on existing
>> platforms. I will revisit the implementation to ensure that:
>>   - the runtime PM integration does not introduce regressions for legacy
>>     platforms, and
>>   - the design clearly justifies the common abstraction for both SCMI
>>     and non-SCMI cases.
>>
>> In addition, I rewrite the commit message as the following to make the
>> intention more clear.
>>
>>   On some platforms the ICE device is placed in a firmware-managed power
>>   domain. In those cases the ICE core resources (including the clock) are
>>   not directly controllable by Linux and are instead toggled by the power
>>   domain provider (e.g. remote firmware via SCMI).
>>
>>   Wire the ICE device into runtime PM so that a single pm_runtime
>>   transition is used to bring the ICE device up/down. When the device is
>>   attached to a PM domain, pm_runtime_resume_and_get()/pm_runtime_put_sync()
>>   will invoke the PM domain callbacks and let the provider manage the
>>   resources. On platforms without a PM domain the runtime PM callbacks
>>   continue to perform the existing clock enable/disable locally.
>>
>>   No functional change is intended for non-firmware-managed platforms; the
>>   change provides a common control point that allows ICE to operate when
>>   resources are owned by a PM domain provider.
>>
> 
> 
> Nothing here resolves the comments. Also, it's top posted. Honestly, I
> won't be talking through you with LLM, so consider patch NAKed.
> 
> Best regards,
> Krzysztof

Sorry for the late due to personal matters. 

At that time, I reviewed your comments one by one and provided answers, then
let AI polish the answer.

I'll add new replies after your comments point by point.

Thanks for the review.

