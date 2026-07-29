Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C25D486E7F
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:00:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785330017; cv=none; b=jeVVUk0pEnr0A0Okh+3WxODNSAjADvtjni+QC+vwVkRb7spnh2dDm1Fd4gz8GeLZdaXwxpqAsCHxgVnwJS9rZCToGPjE4MhjIzLsjelzuwn4Q6mam5IAPqXQG1i57wT7A4HC+K/O3YdreVeorEE8pgrn8QJoggOyaw1RHDLG4sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785330017; c=relaxed/simple;
	bh=usS5ZvvfleDq+b5anpht/xfqW4DM0ICjkN/d+9cZryU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t8/uz/Lyi6VfJzibJELR/6XEWWjzThprTxySr+n9D9h0/9JH1trgIsCdrbpX9sOO82X44so/+buuPJ0lL1ESMtQjWNzhIJ+wqtlwplgkYdQFbNquBvvVHpMtUw/KRbI/W3WUSu0jzO2kqag++h06xBqRgdEANDjgGvCngMw8mUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZFdJTcpg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MDCIw6iK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZFdJTcpg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MDCIw6iK"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TCK0l41977145
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FQuLxiXgQrlaPB545yvWNYECiZsH/JayHHgnDnwTqzo=; b=ZFdJTcpgwPRxl7yL
	GUep+UFfx4OkU4ya/iL/f5lq1nQ2+2oIlYOaxsILHmY+DWypk3UOJ9jUCQomIJ8Y
	8xlfw2rQodH9Dz7G63unP7WtdOfJ/RHEVSnixemkcc/OnsqRwyre9+h6TeB9zgm8
	ZPM+BBmFUvQoAhaeqLwzSx7ffJdP03kA9v7F764Kn4vjU0TYqHJMPKy3ihlkwIgW
	AtlA7c8eWnZAzU9+NXNCcsATvpMIwbzZcC7XtenbsYwu4tKv73nOtFcZjFztuLLx
	0MBU9HHxwnXh1Jwj4YxpZwqNbQkuR9xAnTX5lkGt+xtvlTjR1OZ/SFMUT8EJYc/D
	JL67cQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fqhe984sg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 13:00:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce8a76df2dso16085055ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2026 06:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785330015; x=1785934815; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FQuLxiXgQrlaPB545yvWNYECiZsH/JayHHgnDnwTqzo=;
        b=MDCIw6iKN2P8wU18zg/xJ47jx1ktlKc9o0e6Wr2xQuy3hHUsXd0VOGkDRNY/YUBX4J
         tSX64ssYiWI3HNfbnr54Ls7B145iigc0iCWNDlsjRO7kN15Loee6lHiVuqGzs5LI5WvJ
         koniOC4O/B2mS5GyFHdrZeHqzf9BwZegWq1lAloxr/aQ5/zBWNFsSAOkdTrzidjVhvhK
         yXldY3WjYVpbFBqCCZtfKzOVuRPHrvV/sw7Nk4PQWxRCuEPbA63mnV+vR2tiqynAD0E9
         qnsV34NEMkhM5c3DVIzflw02J/HyL1V9Lm0vvi0eOwJuyFzkmAY5SjhmX/rDq6DOCdaD
         dXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785330015; x=1785934815;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FQuLxiXgQrlaPB545yvWNYECiZsH/JayHHgnDnwTqzo=;
        b=Ij59+lT8O8wL7JkIs4XWJbSc67Z3eAsnIpqXltIznoDFKDrnMIFKLOixFu263nIuG5
         8a4Nm8Qr+PBpOY57gyVzSbN7HtZrMUgADYr0x7ZQkBE0kHFalDazYYWZzlA0PQ+Gv7Jj
         6vL2KQSBpBYrAwQfRmWv88phviUO4DLjIJTpzhpoK400bDH/1KXKe7nuz8rlxV8Kr9aa
         +ONWz0DCnMYU7mmHtP6KIu7FqTr58Hc5C2JfDU0LmQPCHoNqNAuvQNPviyH4GWSdOIo5
         qWafNCSdvRQdgnW5ugHQA4Mh7RmLap21D2+DH4Arb16jC5aSb6hSwCF4uNqC0hB+Mqis
         Q4cQ==
X-Gm-Message-State: AOJu0YzXDWy9/dRss5fkvrW7OIch67FDRaGxervplbiDBowKrJM1MsED
	hWy/yxF+PPkrMOt+pWIMsQTSquMfoCLPi1j0y7tRxo/23PJcvJdo09McpxSIZFreKm5hD3xEfJI
	QYXnE1dm6SDFYIMki4snnFLOEmfV8QUr7X+clZBZHlMZor7HIpIMT9vLr6aFQJG2WGcB1
X-Gm-Gg: AR+sD11KB/kMCkd2f2kixacK/FClvut+bqyBHPhSLY0fji2yEzLf4wVz6Cbe1+PszgK
	CpL2WeKuK1yVxvgv08PC10+iSK2UVXSAL9N0LyvH56aXaom38kdGwcPPjU8hZjTuWV9yX3lo118
	7ZA1RVquzDYUvOCTfm0az0qdLq/u8itg9gItpjSYHmtnqn+bqplRedewF1QQW3oNT0MkC447Tz/
	uhILXiUJyA8UMeky+Qno5xVgqmhBCQ9nrbLFptktHmq/h+/rg1GYTwTs9v/4Q/o+YHMp/WV8pTL
	tnvtX67KZxHLwdz/GnmQ/EMkJVvkFbZhoCpjrCBwd24DVfL/BxhoMveJAloMPyJsuaqPznIXlce
	zAGKYwUDfWxdBsD7y9Jhs0IYi5Mjit6/Wu/2GWBx8R3hiMbiVMLe0P8ggxXVmqexal8rPYaqG6T
	VBQdBPnGAItXqi
X-Received: by 2002:a17:902:da8c:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d015d48a03mr68747625ad.32.1785330014663;
        Wed, 29 Jul 2026 06:00:14 -0700 (PDT)
X-Received: by 2002:a17:902:da8c:b0:2cc:7e4a:bcc5 with SMTP id d9443c01a7336-2d015d48a03mr68747205ad.32.1785330014098;
        Wed, 29 Jul 2026 06:00:14 -0700 (PDT)
Received: from [10.149.71.180] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022a1586esm11028135ad.12.2026.07.29.06.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jul 2026 06:00:13 -0700 (PDT)
Message-ID: <587a9ac1-dd81-4f88-ad6a-c9cad03ac0c2@oss.qualcomm.com>
Date: Wed, 29 Jul 2026 18:30:07 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/8] dt-bindings: embedded-controller: qcom,hamoa-crd-ec:
 Add qcom,tsens
To: Krzysztof Kozlowski <krzk@kernel.org>,
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
 <b7a45a38-008f-45e1-b138-91ca34704bde@kernel.org>
 <d1af3fcb-f2cd-4e37-b1b1-d8caff984c84@oss.qualcomm.com>
 <e9dec9e9-afcc-45a1-9d52-2c4ff34958a0@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <e9dec9e9-afcc-45a1-9d52-2c4ff34958a0@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDEwNyBTYWx0ZWRfXx3KLuTSFGluG
 47lA/NtOJEnhkM+lnimHUF236T+PPHnc8nIcgwqGf/UJcyvMBj3tdc5a0vvIKS2joBH+elFsRQQ
 fvLczvUTrdEvBEJx2ysB7O8TeA8K82/9qj5kwH9nEd4qi9udXiNahWP1oQnH1FomkHhmH3k2esl
 8ivEFxBt3SfpMCTAkC1cuon+0GkAippx3lB+HEqx9K0+HbZVPqBU5O6T9Unura8FWt9zG9vqd2w
 udKvjULBp+VOP6ZFuoUkFCEIKKUsU/YQj/6SZyDMAB9WpHi+Mg8h9MimkbsC9ywaYyw02+2sAVd
 3K9pDVmtgZn4V2l3/yNJm+BnXHgReHrf8nIe3G7M0+rLoDhYuGEI/MZ7rA3bm9wn6cN705m1jX7
 Hh9xLOKuZaL82JP2xGDhDh/jraJsaAb+C2H54o+o5R7FGNBoTnJeDw9wZC1kmeWpvPOWlUb1Yao
 rpgFr7CblDPzPc0FwtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDEwNyBTYWx0ZWRfXwS1RVFUjiqyz
 frf5+PDQ/0ytPninvLd92GnB027E9jo/lTwrW6r2YZAuZeT7MWXBpVlqtgDHjsLwB8Bud/JrENE
 V7NXE43uZG6vtG++JAPlvwkwdSTFC1Y=
X-Proofpoint-ORIG-GUID: icYNi1UMkitMRjshpJ5RSy0_MDFjagb9
X-Proofpoint-GUID: icYNi1UMkitMRjshpJ5RSy0_MDFjagb9
X-Authority-Analysis: v=2.4 cv=EsriaycA c=1 sm=1 tr=0 ts=6a69f95f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=88PRl8AvwKtk7Un-c6EA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_04,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290107



On 7/29/2026 6:02 PM, Krzysztof Kozlowski wrote:
> On 29/07/2026 13:54, Anvesh Jain P wrote:
>>
>>
>> On 7/29/2026 4:38 PM, Krzysztof Kozlowski wrote:
>>> On 28/07/2026 19:44, Anvesh Jain P wrote:
>>>> Add the qcom,tsens property so Hamoa-based boards can list the tsens
>>>> providers, and how many leading sensor IDs on each, whose readings the
>>>> driver averages to compute the SoC junction temperature reported to
>>>> the EC for fan control.
>>>>
>>>> The generic thermal-sensors property has no standard semantic for
>>>> selecting a range of sensor IDs from a provider without enumerating
>>>> each one, so a vendor-specific phandle-array with an explicit sensor
>>>> count is used instead.
>>>>
>>>> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
>>>> ---
>>>>  .../embedded-controller/qcom,hamoa-crd-ec.yaml     | 31 ++++++++++++++++++++++
>>>>  1 file changed, 31 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>>>> index c07483aa5937..ec809fcd03ab 100644
>>>> --- a/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>>>> +++ b/Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
>>>> @@ -33,11 +33,40 @@ properties:
>>>>    interrupts:
>>>>      maxItems: 1
>>>>  
>>>> +  # A generic "thermal-sensors" phandle only identifies individual sensor
>>>> +  # IDs, and thermal zones are a Linux-side grouping of those sensors, not
>>>> +  # a devicetree concept the EC cares about. What the driver actually needs
>>>> +  # is raw readings from a contiguous range of leading sensor IDs on each
>>>> +  # tsens provider, averaged together, so qcom,tsens pairs each provider
>>>> +  # phandle with a count instead of enumerating every sensor cell.
>>>> +  qcom,tsens:
>>>
>>>
>>> What is the point of having internal review and then IGNORE that review?
>>>
>>> NAK
>>>
>>> Best regards,
>>> Krzysztof
>>
>> Krzysztof — for context: I did move to thermal-sensors after your
>> review, but Konrad separately suggested keeping just the provider
>> phandle instead of enumerating every sensor cell, since we only need a
>> leading range per provider. qcom,tsens was meant to combine both
>> suggestions, not ignore yours. Happy to instead just go with your
>> original suggestion and use plain thermal-sensors, enumerating each
>> sensor — let me know which you'd prefer.
> 
> How does <"thermal-sensors" phandle only identifies individual sensor>
> and this phandlel does not? I see absolutely no difference thus you
> duplicated the property, which I EXPLICITLY asked NOT TO during internal
> review.
>

Fair — there's no real difference in shape, qcom,tsens is still just
a phandle plus an integer cell, same as thermal-sensors. The only
thing that changed is what the integer means (a count instead of a
sensor ID), which isn't enough to justify a separate property.

I'll drop qcom,tsens and go back to thermal-sensors, enumerating
each sensor ID explicitly, as you originally suggested. Will send a v2.

> 
> 
> Best regards,
> Krzysztof

-- 
Best Regards,
Anvesh

