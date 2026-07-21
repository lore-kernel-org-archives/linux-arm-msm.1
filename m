Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C2763403E4
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 11:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784631963; cv=none; b=gbl3cxYjhWizdIDUbfoW13upcBiqO1VF0/RGVZILkMZNzxEOrro/KXOB6sHd9Q7WyVIGbK6DGp2zTEe8l20gVmZ1QpRFdRwOMKWsEvnxkqFolUoFXgiMSw8d7C9vB+ahG++izEkxX172U05OmW1W2qcGhONgkW6xnEyIcH1+ltE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784631963; c=relaxed/simple;
	bh=xjYkyUsu349AxyVLrKdfzTXC3nR9Rea/HEVXbtA+EWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u6yKXlVv/w8HK4bNXI5jz3gCWa7tQCgRxs7qXeRcVuN8c6nxrB1hdTk9jTfZQ44Jo/GvyMqYECW+Y5ID+OAYlKr+L4HuRdgYgSYPMH5f2JE1Z4Ug4R4/R3J9HyFlflJf0Zj5AKBLYfdApfVpcmDHfvtf+jVBiEHS/2z/VPf3p3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=N5KL0Fl2; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="N5KL0Fl2"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb72b0af1so1265075e87.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Jul 2026 04:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1784631959; x=1785236759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=daaEWwYjuzuJkBkBAdQ53LZVOTQeD5CURewSiZvT43s=;
        b=N5KL0Fl2MPKVA4eKXryoSByvxyTumAiv2cJzIFNDTUhOONXm7WPxzq43iNq1D3oroR
         tHPxDHo+BPgYPG//wY0nqVH6fMV5YC1Vv7NWnZIwjcPnp8OD7QcosvqST6qDxUmeUDgk
         jJAD3DFmnXaVPb7WAl6P4Yd4VXV7sd3C3v+2HjEcBS7fsox7Mp1dkME0fN0zGlu2xKWy
         CC/JSIbBW6Q5oC1pmtJsVpsSdbDkPOuBrTlqj/RrnF2Ror+oe3j3iQ1tJdcdqERpukUk
         k9jcahBzgJd2iylikmcs/3rQwUmAsS2JXNh550k+olrqdJpOiORVs+GDk+nz8vlESqzt
         P4Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784631959; x=1785236759;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=daaEWwYjuzuJkBkBAdQ53LZVOTQeD5CURewSiZvT43s=;
        b=TD/8z9d9r9ZWsrvIDiH2J2SW2WTB1WxDnKk3LEs8zJt7h5rDMJZHj2KlFO5rajLAIx
         U5KQcvbJkOuxjbyLcrwxFYFCIl/Ax/QCo+jlej436tKWIQ+vWCa84NzjJmgNnY87inMh
         BOeLNGckhZj7TPhypHoDssvsG0j2JSxydvZ1iaGGBV061dNEQIKYAQsHyl9k3LxruX/r
         osqcQvFcR/Rn5DxbfdpdJdeSF4dsmabTM03jh3cv98MEIEovqEPFAkvunjDSfh2DXwm1
         PyRN8/UlEs0IQiBfihPXfVDKcjCICw2jvc636kViqrigLD0Q3ytP5sMpQlAKo5r97k/C
         oojQ==
X-Gm-Message-State: AOJu0Ywc05hGUTIttb2k+qwmZ0PTL5gFiKncHlo8x36a9cznBLUnJ+C1
	GFSoXIOTjb3ruCmAvTYfRVFYvtrVwTDv3O5ezeL8cTpBj+iR+cA5YqKSm8HrJuB5XwM=
X-Gm-Gg: AR+sD11VEK7slDxO4khA0BpPThZEHPypCy5a+unyslbrpXaZYk5HworSpMPRtZczB6J
	TaF3Y3vpl5JidKoDxRImZIu8Ma67r3YKabiAY8GlbTn3XYNOJSBWuS2rWALaQ7aFNtM1pJ2rMeR
	Y8VPmICSn/KvV8J9AjeBP+frFKDiJ38SCggkTM5nui4dVHFQ6tHcbaYtnuFGXolYO+liFaRWFYw
	h/LBD26eYhpqMuC58yBZXq2+ujbInfZZYJFy3Cvheoo0pj5DKkx9uS2t+eoGlrZcYTAu93VLnaf
	aB3T4pA054t3E4mcoF6sjozqXgVOHZm454CfDNRBytlPkq4GC7haVcKyNi7zENSm0pd+SV8H4O4
	zonASJMlPyBIB1ddFsUb8Xbt0CYPBzeeDSSbDbj/9k3UKPq3Kx4OVi65HRsmd2lm+T3ShdN7rOo
	VC8CljJXE4mMB5gFClfARp3xClCPweVzYEFv/tj6PHwurHtKftdnqLe28W
X-Received: by 2002:a05:6512:a81:b0:5b0:ceb3:1179 with SMTP id 2adb3069b0e04-5b2a4a98fb7mr360657e87.8.1784631959199;
        Tue, 21 Jul 2026 04:05:59 -0700 (PDT)
Received: from [192.168.1.100] (91-159-24-186.elisa-laajakaista.fi. [91.159.24.186])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b291d981c4sm2879201e87.20.2026.07.21.04.05.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Jul 2026 04:05:58 -0700 (PDT)
Message-ID: <e8bc8ade-d699-497e-8c4a-fbdc03fcc549@linaro.org>
Date: Tue, 21 Jul 2026 14:05:58 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 1/2] dt-bindings: phy: qcom: Add CSI2 C-PHY/DPHY
 schema
To: Bryan O'Donoghue <bod@kernel.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
References: <20260720-x1e-csi2-phy-v13-0-160c31958863@linaro.org>
 <20260720-x1e-csi2-phy-v13-1-160c31958863@linaro.org>
 <LyWJAb2qKsAFTMHNJUce9VqoqbkFKUQanb6z8ziA63RYZ1P9jj1XpA83uGPvz9m4QnWvEjJFK8dGD_8EtioHVQ==@protonmail.internalid>
 <0da6d314-bfa9-493a-bcc6-8c3b75751d0c@linaro.org>
 <88ae6662-cb85-4e3a-bbb5-1b536348df34@kernel.org>
 <_t1jiMTX3iIXhUkTDz0Cbh_uZhdUK_Y8vlIwxt1VNRbuKuRnpVCWabal-b4AuFrVaKrDnQSFOWtDn6-VCbS3DA==@protonmail.internalid>
 <345ca98e-09f6-4965-87bb-e64dac096498@linaro.org>
 <c236cf94-a775-4158-88db-9a337c7fa862@kernel.org>
From: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
In-Reply-To: <c236cf94-a775-4158-88db-9a337c7fa862@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/21/26 13:47, Bryan O'Donoghue wrote:
> On 21/07/2026 10:56, Vladimir Zapolskiy wrote:
>> On 7/21/26 12:39, Bryan O'Donoghue wrote:
>>> On 21/07/2026 09:17, Vladimir Zapolskiy wrote:
>>>>> +  "#phy-cells":
>>>>> +    const: 1
>>>>> +    description:
>>>>> +      The single cell specifies the PHY operating mode.
>>>> This has been reported before, #phy-cells shall be 0, the operation
>>>> mode is selected by bus-type of endpoints as it is described in
>>>> video-interfaces.yaml
>>>>
>>>> Two competing values are redundant and it opens a door to a wrong
>>>> hardware description, the technical discussion has not been started yet.
>>> So as I said before, I'm following Rob Herring's input on this and
>>> Krzysztof has given RB for this binding. At this stage, I don't see
>>> scope to change it.
>>>
>>> Adding endpoints was already a compromise to address your feedback,
>>> which I hoped would bring you on board with the design.
>> That's my comment dated March 27, 2026, and it says moving phy type
>> from phy cell to the endpoint property excludes the need to set any
>> phy cells:
>>
>> https://lore.kernel.org/linux-arm-msm/e37ce438-12c7-462d-
>> b2bc-1351be62b806@linaro.org/
>>
>> The technical comment is left unresponded so far since then.
>>
>> Since there is no expected phy cells to get on consumer's side, and
>> since there is another link between CSIPHY and CSID described in
>> video-interfaces.yaml, any kind of dependency of this IP on phy can
>> be just removed, which serves the purpose of hardware description
>> simplification.
> 
> Rob's v1 feedback was consumer-decides-mode via the cell; Krzysztof has
> R-b'd the binding with cells=1.

Unfortunately this is not a technical discussion to move forward
a better hardware description.

> I'm happy to lock down this binding as-is on that basis.
> 
> Are you arguing about phy-cells or are you actually arguing the entire
> instantiation of Qualcomm MIPI CSI2 as a standalone generic driver in
> drivers/phy ? Its not the same debate at all.

So far I don't review the driver, only CSIPHY IP hardware description.

In the current version of the hardware description one may find that
the exploited 'video-intefaces' interface completely covers the 'phys'
interface between CSIPHY and CSID, quite probably both are not needed
at the same time, and the simpler 'phys' can be removed without any
losses. But if it is kept, then its cell value is anyway redundant.

> As the CAMSS maintainer, I'm fully against adding more inline monolithic
> CSIPHY init sequences. That could be represented as a separate
> linux-media driver but, then that implies that _all_ upstream CSIPHY
> drivers in drivers/phy are wrong, and I just don't accept that.

Other two drivers are different and should be excluded as good
references, both of them links exactly one sensor to exactly one
CSI-2 decoder, it's not the case here. Also one of these two drivers
has no upstream users.

> The bindings have DT maintainer RB, and the driver has Qcom engineer
> tested-by, review-by.
> 
> Vinod, Kishon - Again, I'd request this merges as-is.
> 

-- 
Best wishes,
Vladimir
