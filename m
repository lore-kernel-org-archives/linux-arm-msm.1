Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE85399892
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787038547; cv=none; b=NuM0qDv/utfvhTOHl8aNAattqmSDrs+4iymegIISkWFPQg85Rt0rm9r7+NWfacGlCB4kupjbq4GH7i4EZw2v/DegDPmDqUTzWLq/otjzRrj2SRwdImsX0ZU4jU1RXhcsZ9ZM8QFhKKZWiIJ2IsRtyxGWO6uQdZEg6cEH20/YmPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787038547; c=relaxed/simple;
	bh=xIlVaHLdF9RILHy5U21P1YD5GxYGtq4fDOhJxfXZMIE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=OBRqB6pwUB1mp0U0JDmiZmdHISBWWBIeoeIkZQPRImHJfDViX/8cCKmIMJx1r7DFkCFfinr1bFytwh8zmjc6lAmDs2pJ4jqmr5oJwDyFr4wtMhpU00IeHdooQcf28W6PBLZuxk/Lf274T7WswtH684CuxzniJGUxYma4uPeva7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WdZ9hjpX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FALdGwN0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WdZ9hjpX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FALdGwN0"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67I7E5IU589762
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BvXrpqcs5lPXIdDWiOCpyiClU4baliOXlhRFFuuFV64=; b=WdZ9hjpXR3ktUiM3
	UISeqzZQPLvXW9DsBHSpVjzcMn+cMZ8OdVVGp9MxIv6cBFZI4zlRFDGmDArFDRgO
	PiEMcyyh/Q71TbBAV8AZnidlxFBZewn4V3f639LNXzGaFDZUmCyik4IXaCEfn4Ml
	l+A+Ir6iOHRFKtBaONiyZcauXDLP7I8cTr/BGJrNAb39iZC9sX4QxpMT4bKeWEJT
	2JpyIGo2TCu18twd/8QjWXlsxC9ZVW4kEBFcMUnYhsTXWXMbGxfLt18PAQzPJ+71
	IlJLaDK/ctnNxASH4H/8t5VExT1ntoY3Sx18mqnAMUS4za+RwlPkHZJ60hZFkx2T
	+SAh0w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4615k8nd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 07:35:45 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso5709484a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 00:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787038545; x=1787643345; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BvXrpqcs5lPXIdDWiOCpyiClU4baliOXlhRFFuuFV64=;
        b=FALdGwN0ZuDHNbHoe5kFrk5KmOy2Adf/fu1L6UjWcdFYTCDUi5jEl1GM1gKQpBO2d/
         nwUjt5s8MqpK5qVhKjf8TJXE7+xkoA5XzJ5+wiXZW3lOy73fjFz0nN4Cg08fuSr88OHe
         6wu0+SZwe1nlRtt3rgb6tUo2o4b5RjRTXt6elA0i17S5b3NB77tqZ11QhZCdVUA4n9zZ
         lNisKXhFn6O0nWHyApYvGfC0q2MmC73ceW4t9B/lpYscXnUPyvMMbg1tRoRAy9YO/fhH
         U8lE89KWI3kbFAP+KZZ2cbUkckqj5Co2cTdX8+PhfRztlQmIdpplvt1MhLGf/ukjriwH
         M2Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787038545; x=1787643345;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BvXrpqcs5lPXIdDWiOCpyiClU4baliOXlhRFFuuFV64=;
        b=Im1ZO5GqTnCyoqzZ2BzAkh8fFOMQUDq1OyOcBypErGEWf5LHagMPIb04MgD7KFWAHU
         QBsX0mbOvoc8FYdMP+3W8tjMrl3XOcRF9xvMfLLnZeKHf7dpfO0Hq/Tima0kL9UjQVZO
         J6NuNYYTYFGpNsjIx3pNAP5yymFs9cuiV/WiNVGZBNhvcSp4B6+F3Ljus1whWLFO9gmm
         cMPTl3zNWcFu/C+MhFEzzNPCI8GOk8zhVu3h5m+gwqUADUSGhnpEDIhbfB3AsJFG/bKM
         uHm3Mljx9UKNlc7IIhuKCVzcbIkYKU659NFx5TU6LvzA1AdmoNGdOFUs6+7/p9G9p7HV
         FNrw==
X-Forwarded-Encrypted: i=1; AHgh+Rrc3JkD6llJk5R2LIW3pSFA5+VxV8LY4h6EcdhyQxJV56qVcUJ19SxNrVeYrSfXWqEPeaI6VM5UU2gpLLE7@vger.kernel.org
X-Gm-Message-State: AOJu0YwxLlptfutdPdkfe/tlFDYCGdM6pGnriF2VIvq78UiNa1gUvZRg
	ydOkYu8ngMsNNqd9FPluU/qRuQRehr0NfAo5H9OTF3lEZQCiYYK1SsgpEDV3M33cMmL2FdgYK+O
	bYYuA2KqYbXOjb9wAvOTXdordwtjoIOrfkF1cJ9RNzcnOXGDk2xUVJD9scxcEMbr21Hqz
X-Gm-Gg: AR+sD11dNrc4/Hcy+cOy0Vo5pWjYjZNcbzdqSLb2nnrFmXMdjCHaYUfUrjPsJtP68xJ
	Ho8nmMcJXNCWYFvpe5wZTlvWsMf9jybQwBwV5ZQuau90I+sEhinkp/nkmM3XDTs7y6s6w1K5Fke
	Wsz08cJYg5ZEoMrFscegorqmwfMx6CcskwGEg/nqv5c8f2d6mA4kjifblCtufaZJbw7goYC52CG
	uKvfr4Fr1r+kGpMK3U6YqNJx2U9vcRJPXzleSFh3PqGuXTnRMrLdbpgi934UMYmbnOjEj15T8D1
	z3FfkNQ+mxfMijuKs+fQMqHMpbVByFcahsaGORpgqIeO/iTa1wQgL+7f+8cs49QiAQ/teLuQPAo
	40E2jL20Ryc5RLjMiw+2AxCC+y2L5IjvXeLRdEYAqrMji4T8K+kvL+Q==
X-Received: by 2002:a17:90b:2802:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-3955aa42a2amr7910909a91.17.1787038544678;
        Tue, 18 Aug 2026 00:35:44 -0700 (PDT)
X-Received: by 2002:a17:90b:2802:b0:38e:9e9d:9209 with SMTP id 98e67ed59e1d1-3955aa42a2amr7910821a91.17.1787038544141;
        Tue, 18 Aug 2026 00:35:44 -0700 (PDT)
Received: from [10.110.9.3] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3954de0f48esm1673404a91.0.2026.08.18.00.35.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 00:35:43 -0700 (PDT)
Message-ID: <ed4c6700-57be-4975-9ff9-bb33098766a1@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 15:35:38 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] soc: qcom: ice: Enable PM runtime for ICE driver
From: Linlin Zhang <linlin.zhang@oss.qualcomm.com>
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
 <60b775b0-5482-4b95-b37e-ba5764efc0cf@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <60b775b0-5482-4b95-b37e-ba5764efc0cf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 74ilK6iX93UdE9G7WokENgb-hJSY8ax3
X-Proofpoint-ORIG-GUID: 74ilK6iX93UdE9G7WokENgb-hJSY8ax3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA1NSBTYWx0ZWRfX3/QQ5J0UvVv4
 FtF1POv0DNpf/TYI7Vp0YdbP7bMJ42iepPX+OGJGsi+rN+DYtotAgwTiYgHPj9bPzVNmF8glDXP
 pbObI0gZ4qIBjAgM1+7+8zoRq0KM4fFFQe5aCCqKQCjZF3gSRbYfln56CsDMBj8+XdLk7JSMa1U
 QunpciiNcxC5K0sGd0OrWBLA4ZfVGYtYQt99k1nR4QodEmcUfAaxo712gjrTqziDKQcTGhOtf3m
 /BR2+c9LN5rqphzFoQgfD33kKeiEpI/qjLxw7aY/9blCc0K+CfXc+s8Iw99oYNv8IkRMbMFvBcL
 XrkSGR2SUJQzJQ8OgWxDBWkncYDNlIAQSz9smf+IPsRG8qK1kPcd2HWav9TEy/gAtzGnZOcBtxW
 7JMSbpA9oEx0DzmfLzQvLrgt9Kc/TxSzpDoTiyAY4X2SO2HcpfjuOKe8k+/u+atUvcdNc2SpZSe
 M62W/0ouxrtTUZcgMlA==
X-Authority-Analysis: v=2.4 cv=Ruf16imK c=1 sm=1 tr=0 ts=6a840b51 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=zdAPh6cMWLyj7RvgIaUA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA1NSBTYWx0ZWRfXyw4SCbWRh0/O
 b+s0vbD7trwkPjzx/b5N07CxLpyETmWndOu8XJaX+OcXXB21tiPx1veYEPKOowLcaLrystLjwYo
 GUwnztu6jWZ0uE98+crCUNuygIYcYt8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180055



On 8/18/2026 3:30 PM, Linlin Zhang wrote:
> 
> 
> On 5/15/2026 10:48 PM, Krzysztof Kozlowski wrote:
>> On 15/05/2026 16:22, Linlin Zhang wrote:
>>>
>>> Hi Krzysztof,
>>>
>>> Thanks for the review.
>>>
>>> For the SCMI-based platforms (e.g. sa8255p), the ICE resources such as
>>> clocks are not controlled directly by the ICE driver. Instead, they are
>>> managed by remote firmware and exposed to Linux via power domains. As a
>>> result, the ICE driver cannot use clk_prepare_enable() directly to
>>> control the hardware clock.
>>>
>>> The intention of moving the clock handling into runtime PM callbacks is
>>> to align the ICE driver with the power domain framework used on these
>>> platforms. When the ICE device is attached to a power domain, invoking
>>> pm_runtime_resume_and_get() will trigger the provider (remote firmware
>>> via SCMI) to power up the device, which in turn enables the underlying
>>> clock and other resources.
>>>
>>> This design follows the guidance where the runtime PM framework is
>>> used as the common mechanism to abstract both:
>>>   - direct clock control on non-SCMI platforms, and
>>>   - firmware-controlled resources via power domains on SCMI platforms.
>>>
>>> In both cases, the runtime PM callbacks are responsible for performing
>>> the actual resource enable/disable:
>>>   - for legacy platforms: clk_prepare_enable()/disable_unprepare()
>>>   - for SCMI platforms: power domain on/off handled by firmware
>>>
>>> So while it may look like an additional layer on legacy platforms, this
>>> approach provides a unified mechanism without requiring separate driver
>>> entry points or special handling in the upper layers (e.g. UFS driver).
>>>
>>> That said, I understand your concern that introducing runtime PM solely
>>> for clock gating can be seen as unnecessary overhead on existing
>>> platforms. I will revisit the implementation to ensure that:
>>>   - the runtime PM integration does not introduce regressions for legacy
>>>     platforms, and
>>>   - the design clearly justifies the common abstraction for both SCMI
>>>     and non-SCMI cases.
>>>
>>> In addition, I rewrite the commit message as the following to make the
>>> intention more clear.
>>>
>>>   On some platforms the ICE device is placed in a firmware-managed power
>>>   domain. In those cases the ICE core resources (including the clock) are
>>>   not directly controllable by Linux and are instead toggled by the power
>>>   domain provider (e.g. remote firmware via SCMI).
>>>
>>>   Wire the ICE device into runtime PM so that a single pm_runtime
>>>   transition is used to bring the ICE device up/down. When the device is
>>>   attached to a PM domain, pm_runtime_resume_and_get()/pm_runtime_put_sync()
>>>   will invoke the PM domain callbacks and let the provider manage the
>>>   resources. On platforms without a PM domain the runtime PM callbacks
>>>   continue to perform the existing clock enable/disable locally.
>>>
>>>   No functional change is intended for non-firmware-managed platforms; the
>>>   change provides a common control point that allows ICE to operate when
>>>   resources are owned by a PM domain provider.
>>>
>>
>>
>> Nothing here resolves the comments. Also, it's top posted. Honestly, I
>> won't be talking through you with LLM, so consider patch NAKed.
>>
>> Best regards,
>> Krzysztof
> 
> Sorry for the late due to personal matters. 
> 
> At that time, I reviewed your comments one by one and provided answers, then
> let AI polish the answer.
> 
> I'll add new replies after your comments point by point.
> 
> Thanks for the review.
> 

Alternatively, if you would prefer to review a revised patch series that
incorporates the changes we have already agreed upon for patches 0/3 and 1/3,
please let me know and I would be happy to prepare it.

Thanks

