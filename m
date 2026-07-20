Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB873D6CB5
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784540944; cv=none; b=aQynd7aeKEl7Vyl04Pr4RX/k9vedBDBmZGcaqE/TzVms5GLvydNQlUB1qCaTLmAZHZ4kIyWPIcWkU0Ag3adnGg4Bt5IY1cwtClklUclaG4013Se7k64R991Y+0o5BAERAGXtfSfP1D5PEleCHJd5cJadu4wDk2sprCc8VGXHEsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784540944; c=relaxed/simple;
	bh=v/SAH+AN3dxByhF5WKSM7Zc9mNjpaydjkLZ0z+gJdgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2j9miAW3dTnzhyVupQbijuZNvPYv+M3wVA+o3tl+xmQJHnwwy7Vf202vEZJ3r6hgPsq8VQNOxMzZ9aHLmgLqzUTm9VHcyxT1DotDrEJSHMF2wOdwUFZFrWwjE2XldURqAUZaX3IPTeHI/UYVi6qz1o9yhulSRm/CUW1lDwsJZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fQ7/sXQa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BQ3pK3Gu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fQ7/sXQa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BQ3pK3Gu"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K9aUxh2232233
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:48:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nFlgqptCwNUSrSbNkvccJlfiQ3eq+SyelinnTuxDIPE=; b=fQ7/sXQaDFGBvHJH
	9NM1U+k6+Cv3M8vy0JiVM/rFbNrEKkXE322bXnQLBhyaf5JtXxkwoTqi/iKEFFXw
	LW1q9rumjNbz0ddDiY72zuoPbQoaApI067/hSgms90DU7yBCx3mIL9Bv9aX3ekil
	FRr+kXYtcObeB6ofq0u6U6WupiiZchnz9tFN6nkkxcjOL+ojBBDAwxDYoylo43T/
	Tv8Ydyg73WwGFEth/+tpIZ8JX88N16WEpo6aJfdmnmsaIYaeRZuFNj9z3wpKAda/
	xfmNIIp4bnmp+wRr6rFO6T9UTyCisJ0RwBWR4ulZrs+zF8DCC71eEoUjahXEa2yG
	GpHZrA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfvxgfsp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 09:48:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cc86a9ef97so216403515ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jul 2026 02:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784540935; x=1785145735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFlgqptCwNUSrSbNkvccJlfiQ3eq+SyelinnTuxDIPE=;
        b=BQ3pK3GuWHRdO2B1pntAT9VpASCkrdQCnJ516OU0XkE6SjAq8Luixktxa5qSTFhXdj
         UgHJ6JJ68BVY5opUhP9jIXJOfzWfuOcOpcwCYe5rB3rplD3loSI+AtaEen3PSlt4C6iE
         F6B0fvTG3gwAT98UEeg/BUkgKJOcIEnV9+hbwbFo6Vff3Y3kIHEbWl7O0yMfic95Q63n
         J837zHs12pZgbKdtqzXcjuiT3zClrMKb710Tp/xQi12pjlsvRVTeaty+5df1fVyHkCPo
         5f9ThGPJNiv4HvqVzfOccyJMk08QvUt6Hw6andD5srensk/DE5AmYQkWHCN5+TR5W0Yv
         q0oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784540935; x=1785145735;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nFlgqptCwNUSrSbNkvccJlfiQ3eq+SyelinnTuxDIPE=;
        b=tFBPAyY2zC/5a/sIhNH2dI5+TkANMyFlu0rDez+6JZZEeXyHwsjiZU1OjPdfqy8WDf
         FTxZ6kDnCxQgtQAi1Py1TTkncWCZAxr+ysjtVISaQ3piSZDX1GA89sWlIOUQa06Cvojy
         GVOR1hmFUjGZwRhf70aDkMes20AoXy7Uo7ULYC7ygjpjVYtbgY5yGHrkKbhKPNJNn+ru
         eOp5WjBCyMnsaR5Yan700EyiO1CWGz7p5cTEBjfqXuPe3d6hsjdSXjTYTK1VOLH9gw/Z
         keRAy4s0WF5H1IEmDEMw0hFoVCjI2D1PWttMDdwnf9nMy8BisaB4MQy2eC6JeO7hgxM6
         cA1g==
X-Forwarded-Encrypted: i=1; AHgh+RpvVc+34H4JiwmV2dzEqsbfT1UjudkeIk97HIJtDXnP0dWN1Li2bRI/oKnKQsYpmJvhnndvlG5VV/mYC8nf@vger.kernel.org
X-Gm-Message-State: AOJu0YxX094BWiijVjGPYD+e+WzYy/YJGi95TMk2ov/DdoUNlA/RwKqS
	BR6G9zyfKJD6S19EUnMQe4YsPwUZi6HgvYuoy3K5pkLg2IYzn4oYpkahgOfAPAMq64j4lV7dAAN
	L+8rbV+ySHKQgz+1n/qpZSenk29IMNSg3x86IClU3jJLVppbG7kvhgU8FTCwM3WAZWk33
X-Gm-Gg: AfdE7cnr4RHZn9LSBHbsFJavp0hV6PICeJZHYqIQV2sgIqufiQHGEsxIzZ8i9t5iiNV
	PWUBCPOw9z77Sn/O904AXZYQTJLHEeu9hjop8BYUxYNqSSCB+XGKpnUxPyBoaYvv2TdFIZ9ggK2
	sixpRQqrPhRXAFs5LywA9mdn77YX7gdbkgGDP0YyOs5icaDwHgE0DemWmrrlDXQ+0tgavpOkFg6
	Mqpk9RphgHtfyiBsDHVHTyx/LJaXJ+cLskjJPXIF3jfd3/eHWRGGvcJLkVSaTclb4fPC+yB6pHo
	0yeted70vUi/t6OeCDXdVN6Y8qy5NkVWx2H3vaEUxCbU1L+M3PfOiS3GSChv9xk48l5FLzkt/dm
	PoE0CLsJ4NA/25JCQxr01f/V1RX1LCR3TkORYITc=
X-Received: by 2002:a17:903:3c4e:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2cf3489a83cmr142978905ad.20.1784540935090;
        Mon, 20 Jul 2026 02:48:55 -0700 (PDT)
X-Received: by 2002:a17:903:3c4e:b0:2ca:ecfa:1308 with SMTP id d9443c01a7336-2cf3489a83cmr142978595ad.20.1784540934620;
        Mon, 20 Jul 2026 02:48:54 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf345110besm54179945ad.36.2026.07.20.02.48.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 02:48:54 -0700 (PDT)
Message-ID: <f33bbf53-c47d-409c-9fbd-e9dc1729eb99@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 15:18:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: dt-bindings: qcom,q6apm-lpass-dais: Document
 DAI subnode
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20260714145250.2473461-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260714145250.2473461-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260715-crafty-cheerful-goat-baba95@quoll>
 <5612a63b-4052-41af-8676-9d92811dee9d@oss.qualcomm.com>
 <e1c57781-846a-4d5a-95e1-90038f88afef@kernel.org>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <e1c57781-846a-4d5a-95e1-90038f88afef@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=HKLz0Itv c=1 sm=1 tr=0 ts=6a5def07 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=OGkrOE9Y-7fm8TEiaLcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwOSBTYWx0ZWRfX4Voboc/pqHMY
 HPoP6p0WJ9Dig6ZH36MtueQPWDwvI/7ly3ydyHj/DJ+3A95NbBSUKzxZWPMiXT15gBsH4sbRCH4
 gf/2x5xnWGGW5G9/IRg3aU1ukb8SE1E=
X-Proofpoint-GUID: h9cU0GA-S0s2DVzVMEJdzqKA4fZ4NT6n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwOSBTYWx0ZWRfX9n2qxGWPe5t9
 jgWESG8fer9LyvyL+vawTs6mXz1TiAOvyBJQULjX5J3TAe58Eqv5SC+blNXQ4CXaoUudr/iKNgt
 GxRqjpm8vEdAp8pSwqVa4qQYL1LhWm+vae4JP+zpIMu87u4cKiaaajMM8zPjFDz+t3cMCo9LJ3v
 fNrR0F54lY8FtSUZWA6Emwq7wOV/QIDbbd68SXZ8rQ//WQPNb/NKfzA3H6FAePOIAua+HJUB/o4
 vYOA3J2eF7lKIEG9VLB6mATpG5WjkyiYxkckUl6AnurDaQHPVVG9xRauUD6stS5gQAqspeHeN6d
 AWIzjAoA0ZFlEc4JRMX0Ep5ZBeGsX3YUCYIKzs8YeeqYHR/oc715LV2Wah9T8BTFzS3SlTQoHAE
 w9LJnxKwN9iKyCXtVEIiJAdpXnkr08kHxEb1DQ0sML1TiuLhcNMxtSE0xCRD2NglMI8FciFAho9
 I97+WqaSmjyzJBAGPbg==
X-Proofpoint-ORIG-GUID: h9cU0GA-S0s2DVzVMEJdzqKA4fZ4NT6n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200109



On 7/16/2026 11:49 AM, Krzysztof Kozlowski wrote:
> On 15/07/2026 08:58, Mohammad Rafi Shaik wrote:
>>
>>
>> On 7/15/2026 11:35 AM, Krzysztof Kozlowski wrote:
>>> On Tue, Jul 14, 2026 at 08:22:48PM +0530, Mohammad Rafi Shaik wrote:
>>>> Extend the qcom,q6apm-lpass-dais device tree binding to explicitly
>>>> describe Digital Audio Interface (DAI) child nodes.
>>>>
>>>> Add #address-cells and #size-cells to allow representation of multiple
>>>> DAI instances as child nodes, and define a dai@<id> pattern to document
>>>> per-DAI properties such as the interface ID and associated clocks.
>>>>
>>>> On platforms such as Monaco and Lemans, third-party codecs are hardware
>>>> wired to the SoC and do not always have an in-tree codec driver to manage
>>>> their clocks. For these designs, clock line enablement must be driven
>>>> from the platform side, and this series provides the necessary support
>>>> for that.
>>>>
>>>> On QAIF-based platforms such as Shikra and Hawi, responsibility for voting
>>>> I2S MCLK and BCLK has moved from the DSP to the kernel. This series
>>>> introduces the required device tree binding support to represent and
>>>> vote for these clocks from the kernel.
>>>>
>>>> Co-developed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>>> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/sound/qcom,q6apm-lpass-dais.yaml | 89 +++++++++++++++++++
>>>>    1 file changed, 89 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> index 2fb95544d..b37c62ccd 100644
>>>> --- a/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> +++ b/Documentation/devicetree/bindings/sound/qcom,q6apm-lpass-dais.yaml
>>>> @@ -21,6 +21,82 @@ properties:
>>>>      '#sound-dai-cells':
>>>>        const: 1
>>>>    
>>>> +  '#address-cells':
>>>> +    const: 1
>>>> +
>>>> +  '#size-cells':
>>>> +    const: 0
>>>> +
>>>> +# Digital Audio Interfaces
>>>> +patternProperties:
>>>> +  '^dai@[0-9a-f]+$':
>>>> +    type: object
>>>> +    description:
>>>> +      Q6DSP Digital Audio Interfaces.
>>>> +
>>>> +    properties:
>>>> +      reg:
>>>> +        maxItems: 1
>>>> +        description:
>>>> +          Digital Audio Interface ID
>>>> +
>>>> +      clocks:
>>>> +        minItems: 1
>>>> +        maxItems: 2
>>>> +        description: MI2S clocks (mclk, bclk and/or eclk).
>>>> +
>>>> +      clock-names:
>>>> +        minItems: 1
>>>> +        maxItems: 2
>>>> +
>>>> +    allOf:
>>>> +      - oneOf:
>>>> +          - properties:
>>>
>>> Please don't do such stuff. Did you find it somewhere? If yes, then
>>> where - so we can remove it?
>>>
>>
>> It was not copied from another binding.
>>
>> It was my attempt to model the valid clock combinations.
>>
>>> I gave you the close-to-exact syntax I expect. It was nothing like this.
>>
>> clocks:
>>     minItems: 1
>>     maxItems: 3
>>
>>
>> clock-names:
>>     minItems: 1
>>     maxItems: 3
>>     items:
>>       enum:
>>         - mclk
>>         - bclk
>>         - eclk
> 
> But I did not wrote anything like that.
> 
>>
>> The enum version does not enforce the positional relationship between
>> clocks and clock-names,
> 
> So you do not use my code, but something completely different and does
> not work, therefore you come up with another approach.
> 
> I don't know what to advise, but repeating myself seems pointless.
> 
> Previous review stays valid.
> 

Sorry about this patch.

I attempted to address the AI and Sashiko review comments.

will fall back to the suggested approach from the previous version.

Thanks & regards,
Rafi.

> 
> 
>>
>> which is why I tried the oneOf approach.
>>
>> My concern with the suggested syntax is that mclk is not mandatory for
>> all platforms.
>>
>> For example, HAWI only requires bclk and does not use mclk, so requiring
>> mclk as the first clock-name would reject valid DTs.
> 
> Luckily I did not require mclk as first, so I do not understand why you
> refer to something like that.
> 
> 
> Best regards,
> Krzysztof

